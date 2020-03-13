Return-Path: <wangmy@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id D998D60B98
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Mar 2020 05:21:40 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.70,547,1574092800"; d="scan'208";a="86257218"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 13 Mar 2020 13:21:40 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id D61C150A9984
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Mar 2020 13:11:35 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
	G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Fri, 13 Mar 2020 13:21:36 +0800
Received: from localhost.localdomain.localdomain (10.167.225.33) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Fri, 13 Mar 2020 13:21:39 +0800
From: Wang Mingyu <wangmy@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 13 Mar 2020 04:10:23 -0700
Message-ID: <1584097824-54462-2-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1584097824-54462-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1584097824-54462-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: D61C150A9984.A3539
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe][zeus][PATCH] opensc: CVE-2019-19479 CVE-2019-19480
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
X-List-Received-Date: Fri, 13 Mar 2020 05:21:41 -0000
Content-Type: text/plain

Security Advisory

References
https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-19479
https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-19480

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../opensc/opensc/CVE-2019-19479.patch        | 30 ++++++++++++++++
 .../opensc/opensc/CVE-2019-19480.patch        | 34 +++++++++++++++++++
 .../recipes-support/opensc/opensc_0.19.0.bb   |  2 ++
 3 files changed, 66 insertions(+)
 create mode 100644 meta-oe/recipes-support/opensc/opensc/CVE-2019-19479.patch
 create mode 100644 meta-oe/recipes-support/opensc/opensc/CVE-2019-19480.patch

diff --git a/meta-oe/recipes-support/opensc/opensc/CVE-2019-19479.patch b/meta-oe/recipes-support/opensc/opensc/CVE-2019-19479.patch
new file mode 100644
index 000000000..73222ee1a
--- /dev/null
+++ b/meta-oe/recipes-support/opensc/opensc/CVE-2019-19479.patch
@@ -0,0 +1,30 @@
+From c3f23b836e5a1766c36617fe1da30d22f7b63de2 Mon Sep 17 00:00:00 2001
+From: Frank Morgner <frankmorgner@gmail.com>
+Date: Sun, 3 Nov 2019 04:45:28 +0100
+Subject: [PATCH] fixed  UNKNOWN READ
+
+Upstream-Status: Accepted <or Backport>
+CVE: CVE-2019-19479 
+   
+Reported by OSS-Fuzz
+https://oss-fuzz.com/testcase-detail/5681169970757632
+
+Reference to upstream patch:
+https://github.com/OpenSC/OpenSC/commit/c3f23b836e5a1766c36617fe1da30d22f7b63de2
+---
+ src/libopensc/card-setcos.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/libopensc/card-setcos.c b/src/libopensc/card-setcos.c
+index 4cf328ad6a..1b4e8f3e23 100644
+--- a/src/libopensc/card-setcos.c
++++ b/src/libopensc/card-setcos.c
+@@ -868,7 +868,7 @@ static void parse_sec_attr_44(sc_file_t *file, const u8 *buf, size_t len)
+ 			}
+ 
+ 			/* Encryption key present ? */
+-			iPinCount = iACLen - 1;		
++			iPinCount = iACLen > 0 ? iACLen - 1 : 0;
+ 
+ 			if (buf[iOffset] & 0x20) {
+ 				int iSC;
diff --git a/meta-oe/recipes-support/opensc/opensc/CVE-2019-19480.patch b/meta-oe/recipes-support/opensc/opensc/CVE-2019-19480.patch
new file mode 100644
index 000000000..12c1f0b4a
--- /dev/null
+++ b/meta-oe/recipes-support/opensc/opensc/CVE-2019-19480.patch
@@ -0,0 +1,34 @@
+From 6ce6152284c47ba9b1d4fe8ff9d2e6a3f5ee02c7 Mon Sep 17 00:00:00 2001
+From: Jakub Jelen <jjelen@redhat.com>
+Date: Wed, 23 Oct 2019 09:22:44 +0200
+Subject: [PATCH] pkcs15-prkey: Simplify cleaning memory after failure
+
+https://bugs.chromium.org/p/oss-fuzz/issues/detail?id=18478
+
+Upstream-Status: Accepted
+CVE: CVE-2019-19480
+
+Reference to upstream patch:
+https://github.com/OpenSC/OpenSC/commit/6ce6152284c47ba9b1d4fe8ff9d2e6a3f5ee02c7
+---
+ src/libopensc/pkcs15-prkey.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/src/libopensc/pkcs15-prkey.c b/src/libopensc/pkcs15-prkey.c
+index d3eee983..4b249582 100644
+--- a/src/libopensc/pkcs15-prkey.c
++++ b/src/libopensc/pkcs15-prkey.c
+@@ -258,6 +258,10 @@ int sc_pkcs15_decode_prkdf_entry(struct sc_pkcs15_card *p15card,
+ 	memset(gostr3410_params, 0, sizeof(gostr3410_params));
+ 
+ 	r = sc_asn1_decode_choice(ctx, asn1_prkey, *buf, *buflen, buf, buflen);
++	if (r < 0) {
++	        /* This might have allocated something. If so, clear it now */
++	        free(info.subject.value);
++        }
+ 	if (r == SC_ERROR_ASN1_END_OF_CONTENTS)
+ 		return r;
+ 	LOG_TEST_RET(ctx, r, "PrKey DF ASN.1 decoding failed");
+-- 
+2.17.1
+
diff --git a/meta-oe/recipes-support/opensc/opensc_0.19.0.bb b/meta-oe/recipes-support/opensc/opensc_0.19.0.bb
index bc1722e39..d26825a06 100644
--- a/meta-oe/recipes-support/opensc/opensc_0.19.0.bb
+++ b/meta-oe/recipes-support/opensc/opensc_0.19.0.bb
@@ -15,6 +15,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
 SRCREV = "f1691fc91fc113191c3a8aaf5facd6983334ec47"
 SRC_URI = "git://github.com/OpenSC/OpenSC \
            file://0001-Remove-redundant-logging.patch \
+           file://CVE-2019-19479.patch \
+           file://CVE-2019-19480.patch \
           "
 DEPENDS = "openct pcsc-lite virtual/libiconv openssl"
 
-- 
2.17.1




