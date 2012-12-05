Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TgID4-0000jk-W2
	for openembedded-devel@lists.openembedded.org;
	Wed, 05 Dec 2012 17:52:37 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 05 Dec 2012 08:38:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,223,1355126400"; d="scan'208";a="176534555"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.253])
	by AZSMGA002.ch.intel.com with ESMTP; 05 Dec 2012 08:38:08 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  5 Dec 2012 16:37:30 +0000
Message-Id: <1354725450-11856-1-git-send-email-paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [meta-networking][PATCH] proftpd: conditionally remove /usr/libexec
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
X-List-Received-Date: Wed, 05 Dec 2012 16:52:37 -0000

From: Kevin Strasser <kevin.strasser@linux.intel.com>

As of poky commit id 1d18224b24a515a07170ce36dbd725cb203d3300
libexecdir has been changed to ${libdir}/${BPN} which is typically
/usr/lib. This change introduces a check to see if /usr/libexec is
being used before attempting to remove it.

Fixes [YOCTO #3504]

Signed-off-by: Kevin Strasser <kevin.strasser@linux.intel.com>
---
 meta-networking/recipes-daemons/proftpd/proftpd_1.3.4b.bb |    5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.4b.bb b/meta-networking/recipes-daemons/proftpd/proftpd_1.3.4b.bb
index 8624c16..ec943b7 100644
--- a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.4b.bb
+++ b/meta-networking/recipes-daemons/proftpd/proftpd_1.3.4b.bb
@@ -34,7 +34,10 @@ FTPGROUP = "ftp"
 
 do_install () {
 	oe_runmake DESTDIR=${D} install
-	rmdir ${D}${libexecdir} ${D}${libdir}/proftpd ${D}${datadir}/locale
+	rmdir ${D}${libdir}/proftpd ${D}${datadir}/locale
+	if [ -d ${D}/usr/libexec ] ; then
+		rmdir ${D}/usr/libexec
+	fi
 	sed -i '/ *User[ \t]*/s/ftp/${FTPUSER}/' ${D}${sysconfdir}/proftpd.conf
 	sed -i '/ *Group[ \t]*/s/ftp/${FTPGROUP}/' ${D}${sysconfdir}/proftpd.conf
 	install -d ${D}${sysconfdir}/init.d
-- 
1.7.10.4



