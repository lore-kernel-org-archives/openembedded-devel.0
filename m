Received: from mail1.wrs.com (mail1.wrs.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web08.3706.1628567944945563872
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Aug 2021 20:59:05 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: changqing.li@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 17A3wrhK013368
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Mon, 9 Aug 2021 20:58:54 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 17A3wrD9016636
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Mon, 9 Aug 2021 20:58:53 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Mon, 9 Aug 2021 20:58:38 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Mon, 9 Aug 2021 20:58:24 -0700
From: "Changqing Li" <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [hardknott][meta-networking][PATCH] ndpi: fix CVE-2021-36082
Date: Tue, 10 Aug 2021 11:55:40 +0800
Message-ID: <20210810035540.43120-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../ntopng/files/CVE-2021-36082.patch         | 116 ++++++++++++++++++
 .../recipes-support/ntopng/ndpi_3.4.bb        |   1 +
 2 files changed, 117 insertions(+)
 create mode 100644 meta-networking/recipes-support/ntopng/files/CVE-2021-36082.patch

diff --git a/meta-networking/recipes-support/ntopng/files/CVE-2021-36082.patch b/meta-networking/recipes-support/ntopng/files/CVE-2021-36082.patch
new file mode 100644
index 000000000..8fdd62d18
--- /dev/null
+++ b/meta-networking/recipes-support/ntopng/files/CVE-2021-36082.patch
@@ -0,0 +1,116 @@
+From 1ec621c85b9411cc611652fd57a892cfef478af3 Mon Sep 17 00:00:00 2001
+From: Luca Deri <deri@ntop.org>
+Date: Sat, 15 May 2021 19:53:46 +0200
+Subject: [PATCH] Added further checks
+
+Upstream-Status: Backport [https://github.com/ntop/nDPI/commit/1ec621c85b9411cc611652fd57a892cfef478af3]
+CVE: CVE-2021-36082
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+
+---
+ src/lib/protocols/netbios.c |  2 +-
+ src/lib/protocols/tls.c     | 32 +++++++++++++++++---------------
+ 2 files changed, 18 insertions(+), 16 deletions(-)
+
+diff --git a/src/lib/protocols/netbios.c b/src/lib/protocols/netbios.c
+index 1f3850cb..0d3b705f 100644
+--- a/src/lib/protocols/netbios.c
++++ b/src/lib/protocols/netbios.c
+@@ -42,7 +42,7 @@ int ndpi_netbios_name_interpret(char *in, size_t inlen, char *out, u_int out_len
+   int ret = 0, len, idx = inlen;
+   char *b;
+ 
+-  len = (*in++)/2;
++  len = (*in++)/2, inlen--;
+   b  = out;
+   *out = 0;
+ 
+diff --git a/src/lib/protocols/tls.c b/src/lib/protocols/tls.c
+index 5b572cae..c115ac08 100644
+--- a/src/lib/protocols/tls.c
++++ b/src/lib/protocols/tls.c
+@@ -994,21 +994,23 @@ int processClientServerHello(struct ndpi_detection_module_struct *ndpi_struct,
+ 	i += 4 + extension_len, offset += 4 + extension_len;
+       }
+ 
+-      ja3_str_len = snprintf(ja3_str, sizeof(ja3_str), "%u,", ja3.tls_handshake_version);
++      ja3_str_len = snprintf(ja3_str, JA3_STR_LEN, "%u,", ja3.tls_handshake_version);
+ 
+-      for(i=0; i<ja3.num_cipher; i++) {
+-	rc = snprintf(&ja3_str[ja3_str_len], sizeof(ja3_str)-ja3_str_len, "%s%u", (i > 0) ? "-" : "", ja3.cipher[i]);
++      for(i=0; (i<ja3.num_cipher) && (JA3_STR_LEN > ja3_str_len); i++) {
++	rc = snprintf(&ja3_str[ja3_str_len], JA3_STR_LEN-ja3_str_len, "%s%u", (i > 0) ? "-" : "", ja3.cipher[i]);
+ 
+ 	if(rc <= 0) break; else ja3_str_len += rc;
+       }
+ 
+-      rc = snprintf(&ja3_str[ja3_str_len], sizeof(ja3_str)-ja3_str_len, ",");
+-      if(rc > 0 && ja3_str_len + rc < JA3_STR_LEN) ja3_str_len += rc;
++      if(JA3_STR_LEN > ja3_str_len) {
++          rc = snprintf(&ja3_str[ja3_str_len], JA3_STR_LEN-ja3_str_len, ",");
++          if(rc > 0 && ja3_str_len + rc < JA3_STR_LEN) ja3_str_len += rc;
++      }
+ 
+       /* ********** */
+ 
+-      for(i=0; i<ja3.num_tls_extension; i++) {
+-	int rc = snprintf(&ja3_str[ja3_str_len], sizeof(ja3_str)-ja3_str_len, "%s%u", (i > 0) ? "-" : "", ja3.tls_extension[i]);
++      for(i=0; (i<ja3.num_tls_extension) && (JA3_STR_LEN-ja3_str_len); i++) {
++	int rc = snprintf(&ja3_str[ja3_str_len], JA3_STR_LEN-ja3_str_len, "%s%u", (i > 0) ? "-" : "", ja3.tls_extension[i]);
+ 
+ 	if(rc <= 0) break; else ja3_str_len += rc;
+       }
+@@ -1443,41 +1445,41 @@ int processClientServerHello(struct ndpi_detection_module_struct *ndpi_struct,
+ 	      int rc;
+ 
+ 	    compute_ja3c:
+-	      ja3_str_len = snprintf(ja3_str, sizeof(ja3_str), "%u,", ja3.tls_handshake_version);
++	      ja3_str_len = snprintf(ja3_str, JA3_STR_LEN, "%u,", ja3.tls_handshake_version);
+ 
+ 	      for(i=0; i<ja3.num_cipher; i++) {
+-		rc = snprintf(&ja3_str[ja3_str_len], sizeof(ja3_str)-ja3_str_len, "%s%u",
++		rc = snprintf(&ja3_str[ja3_str_len], JA3_STR_LEN-ja3_str_len, "%s%u",
+ 			      (i > 0) ? "-" : "", ja3.cipher[i]);
+ 		if(rc > 0 && ja3_str_len + rc < JA3_STR_LEN) ja3_str_len += rc; else break;
+ 	      }
+ 
+-	      rc = snprintf(&ja3_str[ja3_str_len], sizeof(ja3_str)-ja3_str_len, ",");
++	      rc = snprintf(&ja3_str[ja3_str_len], JA3_STR_LEN-ja3_str_len, ",");
+ 	      if(rc > 0 && ja3_str_len + rc < JA3_STR_LEN) ja3_str_len += rc;
+ 
+ 	      /* ********** */
+ 
+ 	      for(i=0; i<ja3.num_tls_extension; i++) {
+-		rc = snprintf(&ja3_str[ja3_str_len], sizeof(ja3_str)-ja3_str_len, "%s%u",
++		rc = snprintf(&ja3_str[ja3_str_len], JA3_STR_LEN-ja3_str_len, "%s%u",
+ 			      (i > 0) ? "-" : "", ja3.tls_extension[i]);
+ 		if(rc > 0 && ja3_str_len + rc < JA3_STR_LEN) ja3_str_len += rc; else break;
+ 	      }
+ 
+-	      rc = snprintf(&ja3_str[ja3_str_len], sizeof(ja3_str)-ja3_str_len, ",");
++	      rc = snprintf(&ja3_str[ja3_str_len], JA3_STR_LEN-ja3_str_len, ",");
+ 	      if(rc > 0 && ja3_str_len + rc < JA3_STR_LEN) ja3_str_len += rc;
+ 
+ 	      /* ********** */
+ 
+ 	      for(i=0; i<ja3.num_elliptic_curve; i++) {
+-		rc = snprintf(&ja3_str[ja3_str_len], sizeof(ja3_str)-ja3_str_len, "%s%u",
++		rc = snprintf(&ja3_str[ja3_str_len], JA3_STR_LEN-ja3_str_len, "%s%u",
+ 			      (i > 0) ? "-" : "", ja3.elliptic_curve[i]);
+ 		if(rc > 0 && ja3_str_len + rc < JA3_STR_LEN) ja3_str_len += rc; else break;
+ 	      }
+ 
+-	      rc = snprintf(&ja3_str[ja3_str_len], sizeof(ja3_str)-ja3_str_len, ",");
++	      rc = snprintf(&ja3_str[ja3_str_len], JA3_STR_LEN-ja3_str_len, ",");
+ 	      if(rc > 0 && ja3_str_len + rc < JA3_STR_LEN) ja3_str_len += rc;
+ 
+ 	      for(i=0; i<ja3.num_elliptic_curve_point_format; i++) {
+-		rc = snprintf(&ja3_str[ja3_str_len], sizeof(ja3_str)-ja3_str_len, "%s%u",
++		rc = snprintf(&ja3_str[ja3_str_len], JA3_STR_LEN-ja3_str_len, "%s%u",
+ 			      (i > 0) ? "-" : "", ja3.elliptic_curve_point_format[i]);
+ 		if(rc > 0 && ja3_str_len + rc < JA3_STR_LEN) ja3_str_len += rc; else break;
+ 	      }
+-- 
+2.17.1
+
diff --git a/meta-networking/recipes-support/ntopng/ndpi_3.4.bb b/meta-networking/recipes-support/ntopng/ndpi_3.4.bb
index 22e4d8e9a..b90f575b9 100644
--- a/meta-networking/recipes-support/ntopng/ndpi_3.4.bb
+++ b/meta-networking/recipes-support/ntopng/ndpi_3.4.bb
@@ -11,6 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b52f2d57d10c4f7ee67a7eb9615d5d24"
 SRCREV = "64929a75e0a7a60d864bd25a9fd97fdf9ac892a2"
 SRC_URI = "git://github.com/ntop/nDPI.git;branch=3.4-stable \
            file://0001-autogen.sh-not-generate-configure.patch \
+           file://CVE-2021-36082.patch \
 "
 
 S = "${WORKDIR}/git"
-- 
2.17.1

