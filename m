Return-Path: <Dmitry_Eremin@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 7C70D65C98
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 Apr 2015 20:03:32 +0000 (UTC)
Received: from nat-ies.mentorg.com ([192.94.31.2]
	helo=SVR-IES-FEM-03.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1YgIfl-0001HR-T8 from Dmitry_Eremin@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Thu, 09 Apr 2015 13:03:34 -0700
Received: from fangorn.rup.mentorg.com (137.202.0.76) by
	SVR-IES-FEM-03.mgc.mentorg.com (137.202.0.108) with Microsoft SMTP
	Server (TLS) id 14.3.224.2; Thu, 9 Apr 2015 21:03:32 +0100
From: Dmitry Eremin-Solenikov <dmitry_eremin@mentor.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 9 Apr 2015 23:03:30 +0300
Message-ID: <1428609810-15698-3-git-send-email-dmitry_eremin@mentor.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1428609810-15698-1-git-send-email-dmitry_eremin@mentor.com>
References: <1428609810-15698-1-git-send-email-dmitry_eremin@mentor.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 3/3] lprng: new recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 09 Apr 2015 20:03:32 -0000
Content-Type: text/plain

Add a recipe for lprng - rather small, but powerfull implementation of
LPR print spooler functionality.

Signed-off-by: Dmitry Eremin-Solenikov <dmitry_eremin@mentor.com>
---
 meta-oe/recipes-extended/lprng/lprng_3.8.C.bb | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 meta-oe/recipes-extended/lprng/lprng_3.8.C.bb

diff --git a/meta-oe/recipes-extended/lprng/lprng_3.8.C.bb b/meta-oe/recipes-extended/lprng/lprng_3.8.C.bb
new file mode 100644
index 0000000..3357828
--- /dev/null
+++ b/meta-oe/recipes-extended/lprng/lprng_3.8.C.bb
@@ -0,0 +1,19 @@
+SUMMARY = "An Enhanced Printer Spooler"
+SECTION = "console/utils"
+LICENSE = "GPLv2 | Artistic-1.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=c6570d8d699af1883db9d0e733ac9bfb"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz"
+SRC_URI[md5sum] = "5901bed95e61d2bea3ba3056056af432"
+SRC_URI[sha256sum] = "694a1747a96385b89e93f43343bf35cee5c8c73353a83814106911c99f09de10"
+
+inherit autotools gettext
+
+EXTRA_OECONF = "--disable-ssl --disable-kerberos --enable-force_localhost"
+FILES_${PN}-dbg += "/usr/lib/lprng/filters/.debug"
+
+do_install_append() {
+    mv ${D}/etc/printcap.sample ${D}/etc/printcap
+    mv ${D}/etc/lpd/lpd.conf.sample ${D}/etc/lpd/lpd.conf
+    mv ${D}/etc/lpd/lpd.perms.sample ${D}/etc/lpd/lpd.perms
+}
-- 
2.1.4


