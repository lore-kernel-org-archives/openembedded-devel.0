Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1429.1793731041935192996
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Nov 2026 10:37:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=pVch3ekO;
 spf=pass (domain: gmail.com, ip: 74.125.82.170, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-3514b90bb89so9305859eec.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 03 Nov 2026 10:37:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793731041; x=1794335841; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IJE9+Tm2KQ3aXQWBYP6o9BO+bZM4qzqKnZR5fljxIuU=;
        b=pVch3ekOVqLVsy6vMn2SkHmGlwrMe0CMnv8J44XHPs56gZZ41X8NU789hT5XFv0ZnD
         6An+l4g29sBzJNKj49mr1SlSUYCuoCIPcfnyj26S8+MmRyWQHC5Ok9+xwFMOg4wJrnzV
         DgB+2Gyy6EtXLRNYVq0vyg9n6HjP3thefEfaw/L6YqiM143fVmJHoSzY5qhOqD+ZZFWr
         +4/7mu2LH2fPrYfv0L1L8Hork/BuINcE7aQgAqDDc8mdOGH51pLICBCOG8zMfNeFiz7M
         txbsgCDhdQgh5wzZUn1iI0UiW5C6Qm7xHVJymTmGiVcTR330zGPWrByDxuF9ZLSUN6l9
         5QWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793731041; x=1794335841;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IJE9+Tm2KQ3aXQWBYP6o9BO+bZM4qzqKnZR5fljxIuU=;
        b=RIaZXTnT9D+IkUCn7i6Sl0Gxj3a3VLBnpxVx1tzcIBUjP5bFzJaoZJYPqYyzwBZVmD
         y+78QKO7bbSE8tqUlMwNZFYWX8lJCYNkd1OOhe+A+dQfYlE3xo1T7QP+rtVv/0r9EVbk
         ssJbk6b2aM44s6yeuaJaNue1hWBOLD0KUR2BGzyLHQPWsB2lmc5LYTA9FEv8rjDWs7nE
         7gVd3p1/U8C2f5C9aghK3k8m5+LB2eUl8wK74IkRhj78AVLnJgSPYT4dn5Xk5o3IoaV9
         v6EKU4W/GtmKZNPSkkKe59x7BdB4Xhzm4uVT/8AYyBZoJzt3B5kJFa3QmLv7FL6VNsbV
         PXEQ==
X-Gm-Message-State: APuU4Z9dfYvGP31xSBuIN0dPpVAAKQmI8MnRhrcWH3lozTwBRxCq52ei
	7AJpUvlEPDg1bP62h6G2tBc7CnOY0RJJPggzpgzd4QQNUAwM7w6g106ueOlXsA==
X-Gm-Gg: AYBFou3aCg+XkCPr8elWTe1OGIpy9XqMzunogumWxMee1kUPEPBTQO2+QELJNvgWGTt
	CkiaKAzfrVe+SIy+i4Qek6jZvlXRWCrAszXHn0nchCNZc/SjALRLa63jRRczvAOv7rM5Y/vgOuF
	866CnC82GfT6RksaNOCOnTskKfsAcfC6wGZFqwTMPfUZnnnoYw6t3DBmAPZdFZR1upD5kiTOPOj
	INadko4fpR5pa9Si7/vZTH/ZeOHskOpe4YmIu25qgV2JygycVl4FUmEpHk9TEqXR1AZ1yaKCY5S
	DTGC+naEDijdcxhLLiMXMUH1n2PXfUZuXMeyKJ76BvggeY46jKvisBeYJ8W37pWgV6mx3rmezbn
	30UqaNwX1wsMkFebrRcvPpZmLU8TduF1MpmsP2tsyNeU4wox7WHLX2iMrzEJtbLs4li2kUymXmY
	a4By+qQREObF7x33sZ8O9iXTui4giayZ7tFP4Ai2IsDKFEeS6/aT0HlM47HC4DARRPnCHjvwUW0
	WVbCco8fq6iAKQZbp3Sd9eftGS46Ni4nCNV7ImFLEHyrQLeIgCcGm0r9t6f7nF8WRWUANSWx0WL
	Ej4yCiQxi6wc3d3ZaNjeSr8TkI3I0mDn3+6V40IiqSGx3gogGkeZ4q8tPVKETQ==
X-Received: by 2002:a05:7022:1706:b0:1ac:7044:2bad with SMTP id a92af1059eb24-1ac70442d69mr17619891c88.36.1793731041150;
        Tue, 03 Nov 2026 10:37:21 -0800 (PST)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c4f83fsm1192887c88.17.2026.11.03.10.37.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 10:37:20 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 18/20] flatcc: patch CVE-2026-116733
Date: Wed,  4 Nov 2026 07:36:38 +1300
Message-ID: <20261103183640.919438-18-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261103183640.919438-1-ankur.tyagi85@gmail.com>
References: <20261103183640.919438-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 03 Nov 2026 18:37:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131816
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-116733

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../flatcc/flatcc/CVE-2026-116733.patch       | 30 +++++++++++++++++++
 .../recipes-devtools/flatcc/flatcc_0.6.4.bb   |  4 ++-
 2 files changed, 33 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-devtools/flatcc/flatcc/CVE-2026-116733.patch

diff --git a/meta-oe/recipes-devtools/flatcc/flatcc/CVE-2026-116733.patch b/meta-oe/recipes-devtools/flatcc/flatcc/CVE-2026-116733.patch
new file mode 100644
index 0000000000..86272984f7
--- /dev/null
+++ b/meta-oe/recipes-devtools/flatcc/flatcc/CVE-2026-116733.patch
@@ -0,0 +1,30 @@
+From 8fcc19366aa081068d2c845084a3ffd907c88129 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Mikkel=20Fahn=C3=B8e=20J=C3=B8rgensen?= <mikkel@dvide.com>
+Date: Thu, 22 Oct 2026 18:59:04 +0200
+Subject: [PATCH] Guard against adversarial buffer overrun in JSON parser
+
+(cherry picked from commit 356792dc155a9e685acdfe0ec1e209bdadcb4ab9)
+
+CVE: CVE-2026-116733
+Upstream-Status: Backport [https://github.com/dvidelabs/flatcc/commit/356792dc155a9e685acdfe0ec1e209bdadcb4ab9]
+
+Dropped changes to the CHANGELOG file.
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ src/runtime/json_parser.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/runtime/json_parser.c b/src/runtime/json_parser.c
+index 4472af2..f9bc9fa 100644
+--- a/src/runtime/json_parser.c
++++ b/src/runtime/json_parser.c
+@@ -538,7 +538,7 @@ static const char *__flatcc_json_parser_number(flatcc_json_parser_t *ctx, const
+     if (buf != end) {
+         if (*buf == '.') {
+             ++buf;
+-            if (*buf < '0' || *buf > '9') {
++            if (buf == end || *buf < '0' || *buf > '9') {
+                 return flatcc_json_parser_set_error(ctx, buf, end, flatcc_json_parser_error_invalid_numeric);
+             }
+             ++buf;
diff --git a/meta-oe/recipes-devtools/flatcc/flatcc_0.6.4.bb b/meta-oe/recipes-devtools/flatcc/flatcc_0.6.4.bb
index 059f888eed..9defbfac04 100644
--- a/meta-oe/recipes-devtools/flatcc/flatcc_0.6.4.bb
+++ b/meta-oe/recipes-devtools/flatcc/flatcc_0.6.4.bb
@@ -6,7 +6,9 @@ SECTION = "devel/lib"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b3d8fb7158bf7e2600ba3191428dc4ef"
 
-SRC_URI = "git://github.com/dvidelabs/flatcc.git;protocol=https;branch=master;tag=v${PV}"
+SRC_URI = "git://github.com/dvidelabs/flatcc.git;protocol=https;branch=master;tag=v${PV} \
+           file://CVE-2026-116733.patch \
+"
 SRCREV = "fec0275c0d0c5b6f495ab48d51fcde521d72b5fc"
 
 inherit cmake
