Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Uas2t-0006K0-QK
	for openembedded-devel@lists.openembedded.org;
	Fri, 10 May 2013 20:27:59 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 10 May 2013 11:09:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,650,1363158000"; d="scan'208";a="332101397"
Received: from unknown (HELO helios.amr.corp.intel.com) ([10.255.12.234])
	by fmsmga001.fm.intel.com with ESMTP; 10 May 2013 11:09:43 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 10 May 2013 19:09:28 +0100
Message-Id: <3804f2c37d91fe6e8923bdd4dc9c2305987f6ca5.1368209301.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1368209301.git.paul.eggleton@linux.intel.com>
References: <cover.1368209301.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1368209301.git.paul.eggleton@linux.intel.com>
References: <cover.1368209301.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/7] apache2: drop unneeded workaround for apr/apr-util config script issue
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 10 May 2013 18:28:00 -0000

The fix for the apr-1-config/apu-1-config path issue has been in OE-Core
for some time now (OE-Core commit
ab56f1063a666df5faddd97f44758c8ae378e51c) so we no longer need these
workarounds.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta-webserver/recipes-httpd/apache2/apache2_2.4.4.bb | 13 ++-----------
 1 file changed, 2 insertions(+), 11 deletions(-)

diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.4.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.4.bb
index 42a7b16..cf1e469 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.4.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.4.bb
@@ -31,8 +31,8 @@ CFLAGS_prepend = "-I${STAGING_INCDIR}/openssl "
 EXTRA_OECONF = "--enable-ssl \
     --with-ssl=${STAGING_LIBDIR}/.. \
     --with-expat=${STAGING_LIBDIR}/.. \
-    --with-apr=${WORKDIR}/apr-1-config \
-    --with-apr-util=${WORKDIR}/apu-1-config \
+    --with-apr=${STAGING_BINDIR_CROSS}/apr-1-config \
+    --with-apr-util=${STAGING_BINDIR_CROSS}/apu-1-config \
     --enable-info \
     --enable-rewrite \
     --with-dbm=sdbm \
@@ -48,15 +48,6 @@ EXTRA_OECONF = "--enable-ssl \
     --enable-mpms-shared \
     ac_cv_have_threadsafe_pollset=no"
 
-do_configure_prepend() {
-    # FIXME: this hack is required to work around an issue with apr/apr-util
-    # Can be removed when fixed in OE-Core (also revert --with-* options above)
-    # see http://bugzilla.yoctoproject.org/show_bug.cgi?id=3267
-    cp ${STAGING_BINDIR_CROSS}/apr-1-config ${STAGING_BINDIR_CROSS}/apu-1-config ${WORKDIR}
-    sed -i -e 's:location=source:location=installed:' ${WORKDIR}/apr-1-config
-    sed -i -e 's:location=source:location=installed:' ${WORKDIR}/apu-1-config
-}
-
 do_install_append() {
     install -d ${D}/${sysconfdir}/init.d
     cat ${WORKDIR}/init | \
-- 
1.8.1.2



