Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1753.1792434859538335067
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Oct 2026 11:34:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=rSuaovLI;
 spf=pass (domain: gmail.com, ip: 209.85.215.177, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cc1cf287ef8so1559646a12.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Oct 2026 11:34:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792434859; x=1793039659; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y0cFee/AI14iKymMxLjwCxfLDMlMG3ggGwxgJKduWEI=;
        b=rSuaovLIrt0ok+e6XG/zbYiLXwXQ/M2zcDyBSQCWBCCmy1/IFfvpkIAdxMVbS3V4mM
         TqfvLw3Q8SSIQB0AmOcXQrLA8v1YLkUv++keZCByF9v6yDCwQE6pb3nX25nFM+VIAyDD
         9lAqrslrVWhWFKutIv3RKI63s6QBFLRwucduJiiMICxVB7p6HZq+3a8LZwon8QlV6nJh
         nDK5aaTWY7JaXHtkmvQpNISVhvb6zOAnvjvPKMdF+1nj2Le/Lug5PHAUQaXE+AXs8GDr
         gSspEd+b7yAeATtfrusyhC0qMZGyQF5BWU5dFWkB4b0XEtR33z0mSriy3s8UfIt6dlWI
         hElw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792434859; x=1793039659;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=y0cFee/AI14iKymMxLjwCxfLDMlMG3ggGwxgJKduWEI=;
        b=Ug+jBtAUDPmwTy1BQPhE9nDR6CzH7+MfL9tTQQUEbxcXYhyQpAMIIBwqh+yCReAGxj
         i//WmqTUxmlEW3aUAET3hpe/oig/yWrLcmQxcd9Lfo7HA5ae/gicZ/zydXbyjd1BoSCw
         HiWyPFful9KauvGj5yYFEM/gj9t19gzrhUzVeU2bINs/ZY6hY73Y5dpht6bMDLKbPlbD
         9vNdY4cL78m1oWyANaVq7zJF+Wv8K4V80YUEO079ueG2JWTlUdQeM3SpKd/kLImyo1Mi
         jxh7cI5MszHHO7Yb6wKTOo3SXi/VYX+v39HsmhfmisvCyadtAJEoiCmm7PYxeB4gI0L+
         cggw==
X-Gm-Message-State: AFq9FYITulEcxjhAdsRYma11nX5l0oCV++ekWYemqRUv/MVQgQiIs7fT
	P9lWieU3on47Pp5TkoBXKBOc5nduwLd9Vrzfct4/7kD9YvCBSsXHX6Q2hb9D/g==
X-Gm-Gg: AYBFou2E1YiD5Bkd3/eY8W7pEsx/FIrXlkZLWUJl3XazBocL9Cb5dj6SuBgRoBbZYn0
	ygh3l+srIDujsPyAO3ljGcfFdSfXw8cU37rurnYvZOwB0XetjSucy5Ax4fqmnJqh+wigOBEXwYf
	P3SfuErQmhYp2CtVzglW9Ij3fzMt+jJOl1BsiK1g1SQgG7CiONzr7p6AuREbnRDtf4ImlUxuZPO
	X+puW2xSK/6vMdL5xBtwz7u0ue3w2j8kod8Mfsrl6EQdE4VHkbbumG78zr1jZte+LF/dlFLzbTq
	czmHtqoNHdLrvQRIRml+ph1M2B1KG285+tqhGdCsIMnzet1vmyFSj9kVC8hnxeKZQPB43Kae3nm
	B4u66PEHnnSuznF+LaGs+/1riMyMFV83hqqs+3LN9i7WXCyFbaSZ4Z1iJ7UGVBYVwOcATM6+W9J
	5k2JA6KTZsuy+Mb/YoR6rtGVBlNAHa7okWA+Q86/s26WMhpUynxsvSX833kIbD7B3RibbFIX/yC
	+XZa5cslr/CyYHBZ7wE5he3UIH/owwNGgpzjsbXaDja6J3M6Q==
X-Received: by 2002:a05:6a20:6a1d:b0:3e0:de4c:71e6 with SMTP id adf61e73a8af0-3e2260d1a4cmr7646531637.54.1792434858874;
        Mon, 19 Oct 2026 11:34:18 -0700 (PDT)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd6549fb556sm4632865a12.22.2026.10.19.11.34.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 11:34:18 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-multimedia][PATCH 3/20] pjproject: patch CVE-2026-57160
Date: Tue, 20 Oct 2026 07:33:49 +1300
Message-ID: <20261019183407.1037972-3-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261019183407.1037972-1-ankur.tyagi85@gmail.com>
References: <20261019183407.1037972-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 19 Oct 2026 18:34:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131129
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-57160

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
(cherry picked from commit 78f0ee20ccfb85b9cc8477e19bb143110d975962)
---
 .../pjproject/pjproject/CVE-2026-57160.patch  | 42 +++++++++++++++++++
 .../pjproject/pjproject_2.17.bb               |  1 +
 2 files changed, 43 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/pjproject/pjproject/CVE-2026-57160.patch

diff --git a/meta-multimedia/recipes-multimedia/pjproject/pjproject/CVE-2026-57160.patch b/meta-multimedia/recipes-multimedia/pjproject/pjproject/CVE-2026-57160.patch
new file mode 100644
index 0000000000..a25ed5a28e
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/pjproject/pjproject/CVE-2026-57160.patch
@@ -0,0 +1,42 @@
+From b14ebbccf5c228ca298ad11ecae2cedde792edae Mon Sep 17 00:00:00 2001
+From: Nanang Izzuddin <nanang@teluu.com>
+Date: Wed, 17 Jun 2026 15:43:46 +0700
+Subject: [PATCH] Merge commit from fork
+
+When printing a generic array header (e.g. Allow, Require, Supported,
+Unsupported), the ": " delimiter following the header name was written
+with two unchecked stores. copy_advance() only guarantees that the
+header name itself fits, leaving as little as one byte before the end
+of the buffer. The colon then consumed the last byte and the trailing
+space was written one byte past the buffer end.
+
+Use copy_advance_char_check() for both delimiter bytes, matching the
+boundary-checked pattern already used by every other header printer in
+this file.
+
+Co-Authored-By Claude Code
+
+(cherry picked from commit d6a0e7f76611c3a6f530ee051e3e7a622bb1748c)
+
+CVE: CVE-2026-57160
+Upstream-Status: Backport [https://github.com/pjsip/pjproject/commit/d6a0e7f76611c3a6f530ee051e3e7a622bb1748c]
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ pjsip/src/pjsip/sip_msg.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/pjsip/src/pjsip/sip_msg.c b/pjsip/src/pjsip/sip_msg.c
+index 06c8cce86..cdc99ff9e 100644
+--- a/pjsip/src/pjsip/sip_msg.c
++++ b/pjsip/src/pjsip/sip_msg.c
+@@ -964,8 +964,8 @@ static int pjsip_generic_array_hdr_print( pjsip_generic_array_hdr *hdr,
+                             &hdr->sname : &hdr->name;
+ 
+     copy_advance(p, (*hname));
+-    *p++ = ':';
+-    *p++ = ' ';
++    copy_advance_char_check(p, ':');
++    copy_advance_char_check(p, ' ');
+ 
+     if (hdr->count > 0) {
+         unsigned i;
diff --git a/meta-multimedia/recipes-multimedia/pjproject/pjproject_2.17.bb b/meta-multimedia/recipes-multimedia/pjproject/pjproject_2.17.bb
index 59684ac7c7..254a2952a2 100644
--- a/meta-multimedia/recipes-multimedia/pjproject/pjproject_2.17.bb
+++ b/meta-multimedia/recipes-multimedia/pjproject/pjproject_2.17.bb
@@ -14,6 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "git://github.com/pjsip/pjproject.git;protocol=https;branch=master;tag=${PV} \
            file://0001-ssl_sock_ossl-fix-OpenSSL-4.0-compatibility.patch \
+           file://CVE-2026-57160.patch \
            "
 SRCREV = "5a457451fa2712ba18e12b01738e8ff3af2b26fd"
 
