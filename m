Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <hrw@juszkiewicz.com.pl>) id 1LetTj-0005OS-7E
	for openembedded-devel@openembedded.org; Wed, 04 Mar 2009 16:57:54 +0100
Received: (qmail 26417 invoked by uid 813007); 4 Mar 2009 15:53:38 -0000
X-clamdmail: clamdmail 0.18a
Received: from 89.78.173.235 (HELO localhost)
	(smtp?user@juszkiewicz.com.pl@89.78.173.235)
	by 195.149.226.213 with ESMTPA; 4 Mar 2009 15:53:38 -0000
Received: from hrw by localhost with local (Exim 4.69)
	(envelope-from <hrw@hrw.one.pl>)
	id 1LetPX-0001Cw-98; Wed, 04 Mar 2009 16:53:31 +0100
From: Marcin Juszkiewicz <openembedded@haerwu.biz>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  4 Mar 2009 16:52:23 +0100
Message-Id: <1236182004-4523-9-git-send-email-openembedded@haerwu.biz>
X-Mailer: git-send-email 1.6.1.3
In-Reply-To: <1236182004-4523-1-git-send-email-openembedded@haerwu.biz>
References: <1236182004-4523-1-git-send-email-openembedded@haerwu.biz>
Cc: Richard Purdie <richard@openedhand.com>
Subject: [PATCH 08/70] rpm: Handle PYTHONVER differently in EXTRA_OECONF to stop gettext/uclibc failures during parsing (from Poky)
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
X-List-Received-Date: Wed, 04 Mar 2009 15:59:35 -0000
X-List-Received-Date: Wed, 04 Mar 2009 15:59:35 -0000
X-List-Received-Date: Wed, 04 Mar 2009 15:59:35 -0000

From: Richard Purdie <richard@openedhand.com>

git-svn-id: https://svn.o-hand.com/repos/poky@5152 311d38ba-8fff-0310-9ca6-ca027cbcb966
---
 packages/rpm/rpm_4.4.2.3.bb |   16 ++++++++++------
 1 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/packages/rpm/rpm_4.4.2.3.bb b/packages/rpm/rpm_4.4.2.3.bb
index 6718042..ef60878 100644
--- a/packages/rpm/rpm_4.4.2.3.bb
+++ b/packages/rpm/rpm_4.4.2.3.bb
@@ -2,13 +2,15 @@ DESCRIPTION = "The RPM Package Manager."
 HOMEPAGE = "http://rpm.org/"
 LICENSE = "LGPL GPL"
 DEPENDS = "zlib beecrypt file popt python"
-PR = "r7"
+PR = "r9"
 
 SRC_URI = "http://www.rpm.org/releases/rpm-4.4.x/rpm-4.4.2.3.tar.gz \
            file://external-tools.patch;patch=1 \
 	   file://cross_libpaths.patch;patch=1 \
 	   file://weakdeps.patch;patch=1;pnum=0 \
-	   file://tagsbackport.patch;patch=1;pnum=0"
+	   file://tagsbackport.patch;patch=1;pnum=0 \
+	   file://missingok.patch;patch=1;pnum=0 \
+	   file://extcond.patch;patch=1;pnum=0"
 
 inherit autotools gettext
 
@@ -16,9 +18,9 @@ S = "${WORKDIR}/rpm-${PV}"
 
 acpaths = "-I ${S}/db/dist/aclocal -I ${S}/db/dist/aclocal_java"
 
-EXTRA_OECONF = "--with-python=${PYTHONVER} \
-		--with-python-incdir=${STAGING_INCDIR}/python${PYTHONVER} \
-		--with-python-libdir=${STAGING_LIBDIR}/python${PYTHONVER} \
+EXTRA_OECONF = "--with-python=$PYTHONVER \
+		--with-python-incdir=${STAGING_INCDIR}/python$PYTHONVER \
+		--with-python-libdir=${STAGING_LIBDIR}/python$PYTHONVER \
 		--without-apidocs \
 		--without-selinux \
 		--without-lua \
@@ -97,4 +99,6 @@ def rpm_python_version(d):
 	if os.path.exists( "%s/python2.3" % staging_incdir ): return "2.3"
 	raise "No Python in STAGING_INCDIR. Forgot to build python/python-native?"
 
-PYTHONVER = "${@rpm_python_version(d)}"
+# Use a shell variable here since otherwise gettext trys to expand this at 
+# parse time when it manipulates EXTRA_OECONF which fails
+export PYTHONVER = "${@rpm_python_version(d)}"
-- 
1.6.1.3





