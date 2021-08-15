Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web10.11336.1629036412076821608
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Aug 2021 07:06:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=eeJtb9xr;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id c17so12559735plz.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 15 Aug 2021 07:06:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=a0BPJsS2/diwyJPSqW7WdN3v0PUDh2tLcn1cgnNKhnw=;
        b=eeJtb9xro6wDpalhVpbUk8hES1A/5DsUYCnsY7BVxXy5rL2pF5Yp9FQGWxD4mb0PB4
         o87HPuZ9mCLq82/So1QfsapJ1Ugz8WaRriLz0PorDUOteEesov9FBpTSDZcQ7/AcJprO
         wwW06ZRVXYQU44E5wTbmscknYQ4wN2z4PTqN6hvRnxsUqA80XfMF0lrZvURyq8+NtOyT
         zGNMDMMpvkf0ga1TBndg0cf44pG4DidjTU/8aNMEth+2HeD2ZcP7p5O/YrIynEJHro5l
         urMeSQg3bOAx728MRxgRVgboCd/SX0bRPAKUHw9Tsh7REXne4OFaB5WJyhK3PXkjtpWR
         J88g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=a0BPJsS2/diwyJPSqW7WdN3v0PUDh2tLcn1cgnNKhnw=;
        b=K1w/NmWwzuVg1XY0uo/KEyYMNRq+UnLGPupW7l6QgA8kWsBlIxqSJCW/0+KylhB8wq
         S1aiMR3+XcFc4x+Eqb2b2C7kp+RLqyFb+9G3a+zT7IiBIk+MSyDS+jgDEQPKccDKZ7rJ
         FBBAiSNde9JEZXNQGgtemkZQt1zKD4mhqPfr05ukL5vwEkf2qCsSKMr8JC7heW+pGZ1M
         d3rzk7+YO3Pq84SbGmKdHPQVIZ231Yq2tr0Z24kpjmsbzVCsHnfZGTEhloaWv8DOG7zC
         U0eGKMzIMRKY8WWjAhuB2DpfEBkj1iSKytHiFIG3x67PZHtDP6E6i7dHLQdDHWhRYcbF
         tr3w==
X-Gm-Message-State: AOAM5326uFM0WnR4p9bkVzFyw1h0En6t1d/lqcQv1jtHzyWYF3mCkjnH
	jZmMhksVGMnM8Lbqjz0TfvV+8uVXJWpJpg==
X-Google-Smtp-Source: ABdhPJwASnbLA67pM1W0M/SGczhlBLSDjOqcC9eyXllnDsmbDXesegdAo8oU9uCgepF/PcJKR98fGQ==
X-Received: by 2002:a05:6a00:1904:b029:3b9:e4ea:1f22 with SMTP id y4-20020a056a001904b02903b9e4ea1f22mr11855193pfi.79.1629036411457;
        Sun, 15 Aug 2021 07:06:51 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from keaua.hsd1.ca.comcast.net ([2601:202:4180:a5c0:162c:344d:280d:4a4c])
        by smtp.gmail.com with ESMTPSA id y67sm8332901pfg.218.2021.08.15.07.06.50
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Aug 2021 07:06:51 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 13/18] ndpi: fix CVE-2021-36082
Date: Sun, 15 Aug 2021 07:06:25 -0700
Message-Id: <64a6b6f8decdd5d229bc01f1c40ab5ac453e134d.1629036279.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1629036279.git.akuster808@gmail.com>
References: <cover.1629036279.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Changqing Li <changqing.li@windriver.com>

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../ntopng/files/CVE-2021-36082.patch         | 116 ++++++++++++++++++
 .../recipes-support/ntopng/ndpi_3.4.bb        |   1 +
 2 files changed, 117 insertions(+)
 create mode 100644 meta-networking/recipes-support/ntopng/files/CVE-2021-36082.patch

diff --git a/meta-networking/recipes-support/ntopng/files/CVE-2021-36082.patch b/meta-networking/recipes-support/ntopng/files/CVE-2021-36082.patch
new file mode 100644
index 0000000000..8fdd62d186
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
index 22e4d8e9ae..b90f575b93 100644
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
2.25.1

