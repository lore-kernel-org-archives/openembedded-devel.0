Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1D2FC0218A
	for <webhook@archiver.kernel.org>; Tue, 28 Jan 2025 12:54:27 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web11.16562.1738068865994590205
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Jan 2025 04:54:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=BDpp5uWy;
 spf=pass (domain: mvista.com, ip: 209.85.216.50, mailfrom: vanusuri@mvista.com)
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2f43d17b0e3so9766458a91.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 28 Jan 2025 04:54:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1738068865; x=1738673665; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=npnjn1NNg2yoFaJH75kqEFAKTT8XmOFdLUVH2oYc434=;
        b=BDpp5uWyB6RGsJAgWGGS/amPFitbifC6HlepyTWWQ0IeZCVFBOoNhUtaUk+ctu8XmR
         WTkCaUPSzRQk74PuM6LKeH9H3b6jb6a0aHmWU5H3YikiOoFS9oif7qD1COKYJ0wD5nI+
         jqRzIGBgISBzBZGcFAIJEoctCmObXeMxVbpdQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738068865; x=1738673665;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=npnjn1NNg2yoFaJH75kqEFAKTT8XmOFdLUVH2oYc434=;
        b=BEB2h2T7fwutEL8rCHSSmYK4c8o21YyCd5sUzBmTQbDq6ubS3J1t0bwkUsbdv2WO7h
         BC39jQEuzeeyvwQ65vpSpcrGdJbL3Pba4MeAl7B7STEHYK7akmmSvH+dcE6T52tximvu
         lJURj3JfQJprpVytIM2B4P9l2bNeHzeXFGQ+CdOb2NAOyP8mPKddeb2QwzblcKMKIXWo
         N2lZsFQ5uyWpOUCOk/uyqzvtzpCDqIuweGQsczthjHVGvdYTe9TWyVr62oyfRWZKkIYi
         Qi3GdoyxupOzfS6DgVZzPv9PPJYo7euMeo9OQO4Xidg17W5lnEviucupvyxm1gm7UDKe
         08fQ==
X-Gm-Message-State: AOJu0YxQE9uVe4uZNFg6jSj7dmj1fRED47/xtku05isZLxk7yztUyWMu
	p9IM1vmtuSpZSnSorGK2XgdqmsQthBy1uhoEqwGg5PwdSCrFtf7xJMVxqqdwIQ5lN04sTnPfS62
	Y
X-Gm-Gg: ASbGncuWRqd0XwoR2irPfkshMUi38YMvowwJn7cA7IgM4TvDfg16l/A6XeJQDD+/fcm
	9+GkIOGAz2M+WPZMmAAPko4jCtnFkfEeJG9VIMM6r6YNvdX85CQwOKfbfe1xC/ItwxFXHJKGZAA
	yVqejMjpj6x/YDSMmqs/inTOj280DtYmXatkqWf/upQyVRky1WhrhJPIaLzU9Txp5l6i64dj4fj
	uJxTYS+sWbENnav2pkVJP6zCudZVEy17e/w8VWU+DDV23BaYeRZ2a5GoEP7LJqSPm7BCuZ0UGAK
	qr+8cCZnS93cEnul9sEGCK2sNwxuviY++LTpZMCR
X-Google-Smtp-Source: AGHT+IH0alhonJ473nLZXoliqTAQ5NY4wJSPZuOVJYp2yH8fNMCe/ywcKLBNXJfVcCXj+6R6x6R/FA==
X-Received: by 2002:a05:6a20:4d95:b0:1e1:bf32:7d3a with SMTP id adf61e73a8af0-1eb215ec4c4mr50145803637.26.1738068864885;
        Tue, 28 Jan 2025 04:54:24 -0800 (PST)
Received: from MVIN00020.mvista.com ([2401:4900:882d:66eb:b0a6:9042:2182:e2f9])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ac968413350sm4659687a12.72.2025.01.28.04.54.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jan 2025 04:54:24 -0800 (PST)
From: vanusuri@mvista.com
To: openembedded-devel@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [oe][meta-oe][kirkstone][PATCH] openjpeg: Backport fix CVE-2023-39327
Date: Tue, 28 Jan 2025 18:24:12 +0530
Message-Id: <20250128125412.101087-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Jan 2025 12:54:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115118

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream commit:
https://github.com/uclouvain/openjpeg/commit/c58bc128b4f770e7c89bc8ba3d0273b9a3904aad

Reference:
https://github.com/uclouvain/openjpeg/pull/1547

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../openjpeg/openjpeg/CVE-2023-39327.patch    | 82 +++++++++++++++++++
 .../openjpeg/openjpeg_2.4.0.bb                |  1 +
 2 files changed, 83 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2023-39327.patch

diff --git a/meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2023-39327.patch b/meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2023-39327.patch
new file mode 100644
index 0000000000..2d485c050d
--- /dev/null
+++ b/meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2023-39327.patch
@@ -0,0 +1,82 @@
+From c58bc128b4f770e7c89bc8ba3d0273b9a3904aad Mon Sep 17 00:00:00 2001
+From: mayeut <mayeut@users.noreply.github.com>
+Date: Sat, 17 Aug 2024 15:59:56 +0200
+Subject: [PATCH] fix: when EPH markers are specified, they are required.
+
+reference from Rec. ITU-T T.800 (06/2019):
+- Table A.13 – Coding style parameter values for the Scod parameter
+- Section A.8.1 Start of packet (SOP)
+- Section A.8.2 End of packet header (EPH)
+
+Upstream-Status: Backport [https://github.com/uclouvain/openjpeg/commit/c58bc128b4f770e7c89bc8ba3d0273b9a3904aad]
+CVE: CVE-2023-39327
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ src/lib/openjp2/t2.c                    | 19 +++++++++++++------
+ tests/nonregression/test_suite.ctest.in |  3 +++
+ 2 files changed, 16 insertions(+), 6 deletions(-)
+
+diff --git a/src/lib/openjp2/t2.c b/src/lib/openjp2/t2.c
+index 1481e16f..b7ffd5fb 100644
+--- a/src/lib/openjp2/t2.c
++++ b/src/lib/openjp2/t2.c
+@@ -1110,6 +1110,7 @@ static OPJ_BOOL opj_t2_read_packet_header(opj_t2_t* p_t2,
+     /* SOP markers */
+ 
+     if (p_tcp->csty & J2K_CP_CSTY_SOP) {
++        /* SOP markers are allowed (i.e. optional), just warn */
+         if (p_max_length < 6) {
+             opj_event_msg(p_manager, EVT_WARNING,
+                           "Not enough space for expected SOP marker\n");
+@@ -1162,12 +1163,15 @@ static OPJ_BOOL opj_t2_read_packet_header(opj_t2_t* p_t2,
+ 
+         /* EPH markers */
+         if (p_tcp->csty & J2K_CP_CSTY_EPH) {
++            /* EPH markers are required */
+             if ((*l_modified_length_ptr - (OPJ_UINT32)(l_header_data -
+                     *l_header_data_start)) < 2U) {
+-                opj_event_msg(p_manager, EVT_WARNING,
+-                              "Not enough space for expected EPH marker\n");
++                opj_event_msg(p_manager, EVT_ERROR,
++                              "Not enough space for required EPH marker\n");
++                return OPJ_FALSE;
+             } else if ((*l_header_data) != 0xff || (*(l_header_data + 1) != 0x92)) {
+-                opj_event_msg(p_manager, EVT_WARNING, "Expected EPH marker\n");
++                opj_event_msg(p_manager, EVT_ERROR, "Expected EPH marker\n");
++                return OPJ_FALSE;
+             } else {
+                 l_header_data += 2;
+             }
+@@ -1301,12 +1305,15 @@ static OPJ_BOOL opj_t2_read_packet_header(opj_t2_t* p_t2,
+ 
+     /* EPH markers */
+     if (p_tcp->csty & J2K_CP_CSTY_EPH) {
++        /* EPH markers are required */
+         if ((*l_modified_length_ptr - (OPJ_UINT32)(l_header_data -
+                 *l_header_data_start)) < 2U) {
+-            opj_event_msg(p_manager, EVT_WARNING,
+-                          "Not enough space for expected EPH marker\n");
++            opj_event_msg(p_manager, EVT_ERROR,
++                          "Not enough space for required EPH marker\n");
++            return OPJ_FALSE;
+         } else if ((*l_header_data) != 0xff || (*(l_header_data + 1) != 0x92)) {
+-            opj_event_msg(p_manager, EVT_WARNING, "Expected EPH marker\n");
++            opj_event_msg(p_manager, EVT_ERROR, "Expected EPH marker\n");
++            return OPJ_FALSE;
+         } else {
+             l_header_data += 2;
+         }
+diff --git a/tests/nonregression/test_suite.ctest.in b/tests/nonregression/test_suite.ctest.in
+index 72155329..78a7a783 100644
+--- a/tests/nonregression/test_suite.ctest.in
++++ b/tests/nonregression/test_suite.ctest.in
+@@ -647,3 +647,6 @@ opj_decompress -i @INPUT_NR_PATH@/tnsot_zero.jp2 -o @TEMP_PATH@/tnsot_zero.png
+ !opj_decompress -i @INPUT_NR_PATH@/oss-fuzz2785.jp2 -o @TEMP_PATH@/oss-fuzz2785.png
+ 
+ opj_decompress -i @INPUT_NR_PATH@/tnsot_zero_missing_eoc.jp2 -o @TEMP_PATH@/tnsot_zero_missing_eoc.png
++
++# missing EPH Marker
++!opj_decompress -i @INPUT_NR_PATH@/issue1472-bigloop.j2k -o @TEMP_PATH@/issue1472-bigloop.raw
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-graphics/openjpeg/openjpeg_2.4.0.bb b/meta-oe/recipes-graphics/openjpeg/openjpeg_2.4.0.bb
index 871b324dff..feecb957ba 100644
--- a/meta-oe/recipes-graphics/openjpeg/openjpeg_2.4.0.bb
+++ b/meta-oe/recipes-graphics/openjpeg/openjpeg_2.4.0.bb
@@ -14,6 +14,7 @@ SRC_URI = " \
     file://CVE-2021-3575.patch \
     file://0001-sycc422_to_rgb-fix-out-of-bounds-read-accesses-when-.patch \
     file://0001-opj_j2k_add_tlmarker-validate-that-current-tile-part.patch \
+    file://CVE-2023-39327.patch \
 "
 SRCREV = "37ac30ceff6640bbab502388c5e0fa0bff23f505"
 S = "${WORKDIR}/git"
-- 
2.25.1


