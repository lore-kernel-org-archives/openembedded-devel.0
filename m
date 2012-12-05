Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TgIbt-00038B-PT
	for openembedded-devel@lists.openembedded.org;
	Wed, 05 Dec 2012 18:18:14 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 05 Dec 2012 09:03:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,223,1355126400"; d="scan'208";a="227010581"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.253])
	by azsmga001.ch.intel.com with ESMTP; 05 Dec 2012 09:03:46 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  5 Dec 2012 17:03:44 +0000
Message-Id: <1354727024-12231-1-git-send-email-paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [meta-networking][PATCH v2] proftpd: fix do_install failure after libexecdir change
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
X-List-Received-Date: Wed, 05 Dec 2012 17:18:14 -0000

As of OE-Core commit id 406bd38b4232f9f399ef5ffe0b4fac72ed605a23
libexecdir has been changed to ${libdir}/${BPN}. As we are already
deleting ${libdir}/proftpd which is the same as ${libdir}/${BPN} in this
case, introduce a check to see if ${libexecdir} still exists before
attempting to remove it possibly a second time. This will handle if
libexecdir is set to its original value or a custom value in the distro
config.

Based on a patch by Kevin Strasser <kevin.strasser@linux.intel.com>

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta-networking/recipes-daemons/proftpd/proftpd_1.3.4b.bb |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.4b.bb b/meta-networking/recipes-daemons/proftpd/proftpd_1.3.4b.bb
index 8624c16..7279cfb 100644
--- a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.4b.bb
+++ b/meta-networking/recipes-daemons/proftpd/proftpd_1.3.4b.bb
@@ -34,7 +34,8 @@ FTPGROUP = "ftp"
 
 do_install () {
 	oe_runmake DESTDIR=${D} install
-	rmdir ${D}${libexecdir} ${D}${libdir}/proftpd ${D}${datadir}/locale
+	rmdir ${D}${libdir}/proftpd ${D}${datadir}/locale
+	[ -d ${D}${libexecdir} ] && rmdir ${D}${libexecdir}
 	sed -i '/ *User[ \t]*/s/ftp/${FTPUSER}/' ${D}${sysconfdir}/proftpd.conf
 	sed -i '/ *Group[ \t]*/s/ftp/${FTPGROUP}/' ${D}${sysconfdir}/proftpd.conf
 	install -d ${D}${sysconfdir}/init.d
-- 
1.7.10.4



