Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 83482795FA
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Sep 2018 15:58:00 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w8HFvQ65006616
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 17 Sep 2018 08:57:36 -0700
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Mon, 17 Sep 2018 08:57:15 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <raj.khem@gmail.com>
Date: Tue, 18 Sep 2018 00:05:19 +0800
Message-ID: <22b65bdad6ad9f2684a97768654abe6233dc0f85.1537199591.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1537199591.git.hongxu.jia@windriver.com>
References: <cover.1537199591.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH 10/19] wvstreams: split one dpg package
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 17 Sep 2018 15:58:00 -0000
Content-Type: text/plain

Multiple -dbg packages per recipe is not encouraged, and only one is
recommended and the code only works properly in some cases for one.

Add RPROVIDES_${PN}-dbg to be compatiable with previous dbg packages
requiring.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb b/meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb
index 293949d..b9f62da 100644
--- a/meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb
+++ b/meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb
@@ -36,23 +36,21 @@ LDFLAGS_append = " -Wl,-rpath-link,${CROSS_DIR}/${TARGET_SYS}/lib"
 
 EXTRA_OECONF = " --without-tcl --without-qt --without-pam --without-valgrind"
 
-PACKAGES_prepend = "libuniconf libuniconf-dbg "
-PACKAGES_prepend = "uniconfd uniconfd-dbg "
-PACKAGES_prepend = "libwvstreams-base libwvstreams-base-dbg "
-PACKAGES_prepend = "libwvstreams-extras libwvstreams-extras-dbg "
+PACKAGES_prepend = "libuniconf "
+PACKAGES_prepend = "uniconfd "
+PACKAGES_prepend = "libwvstreams-base "
+PACKAGES_prepend = "libwvstreams-extras "
 PACKAGES_prepend = "${PN}-valgrind "
 
+RPROVIDES_${PN}-dbg += "libuniconf-dbg uniconfd-dbg libwvstreams-base-dbg libwvstreams-extras-dbg"
+
 FILES_libuniconf     = "${libdir}/libuniconf.so.*"
-FILES_libuniconf-dbg = "${libdir}/.debug/libuniconf.so.*"
 
 FILES_uniconfd     = "${sbindir}/uniconfd ${sysconfdir}/uniconf.conf ${localstatedir}/uniconf"
-FILES_uniconfd-dbg = "${sbindir}/.debug/uniconfd"
 
 FILES_libwvstreams-base     = "${libdir}/libwvutils.so.*"
-FILES_libwvstreams-base-dbg = "${libdir}/.debug/libwvutils.so.*"
 
 FILES_libwvstreams-extras     = "${libdir}/libwvbase.so.* ${libdir}/libwvstreams.so.*"
-FILES_libwvstreams-extras-dbg = "${libdir}/.debug/libwvbase.so.* ${libdir}/.debug/libwvstreams.so.*"
 
 FILES_${PN}-valgrind = "${libdir}/valgrind/wvstreams.supp"
 RDEPENDS_${PN} += "perl"
-- 
2.7.4


