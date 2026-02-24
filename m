Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A955FF4BB7D
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 19:05:05 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28134.1771959895345826985
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Feb 2026 11:04:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YcI8hdUl;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-43770c94dfaso5763438f8f.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 24 Feb 2026 11:04:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771959894; x=1772564694; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7MbJLB61wvgORgx1WPAMij7z5TOyyRs6D91L9ql4jQI=;
        b=YcI8hdUlZwaSOqBL2lDWEpTqsg6gDgXu32QosMQz3o9z4Z93wfb9s5cy/h3DMBnLq1
         Bu+7a2rK2LCU600110UuVFVO9Vecvrbt6PBcT0/XxNsNvbEmlkHwy5tqne4By/b/UXeO
         AX94NhDdY7kGEhx98CyHIhT1gZ5jcnwP4fayMv25i5a9PV052OIIowDnAOUm90PV7OSH
         VzGqtw/POjSEoB00P+y5fw9Kr0HFbrJnjIOii613IaDe/jHyy2wwMAdTCNOd1IClDcxO
         0DMm1iU4FLlhqslumkSfYf6UJv1XVfNBnbp339s7nqcKrsakdZXGg0b4frCg++F90/9R
         k+dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771959894; x=1772564694;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7MbJLB61wvgORgx1WPAMij7z5TOyyRs6D91L9ql4jQI=;
        b=NvSJfCu0BrQ3vXryj0RqEQ9vT6rPHC7k+dT1iYIyE77+/9cZ4gHNpstIOoB8id3CTh
         M71rPmNdBqKZXeruW9I0jgNZ9/VTrHPvF6KtiC/leJew6aM/b3bjbJcsHXSKQp6x1hpY
         qZ7CshiUGmOztJhIDkI/eoXAjykpTawIiTCqmOjRd1T9G/Rr1taqLS+muMNMe57YYA3K
         e5VLmiUeAHtj6gow+yf1FaF93M/+v0y42jyATZNeoRcq9I8D/+ljSd9wImDFXlEepxBg
         Dyxy7ohNWanqovpVdrngY//swnd3pYFjWbDExtGgvVx1nzV430x0Xa48Gu3eeErprq3Z
         eRWQ==
X-Gm-Message-State: AOJu0YzwYxQ4Or8bSxiHlCBm3kGIjEOYgtUvD/h3cMR4DJR4ufPILPJz
	96Rc1MIIjNp5p3ic2ZWO/oSURcryW2cPR5CoKVWTApoRhMewFRldYlRn4LfnNw==
X-Gm-Gg: ATEYQzwMuVKraquYrwIig9lNIBxSX0u25F0Phz18sI+0iQP7z3Up+znE/nNsMl4cHFP
	sAPw6/OKIsijbpdwLF9dniInuTd+BoUOxaJ8uPasw/iUlNi1hpL2MiM+0xhpRboOYm7R5hXXUqI
	IM1T6rgNiHGYOK6zEvWE8yQIV/Ga0Gp1HJZ/S+3TRhpRluiT/rlgXXH/+rDXr10TIj1KBJac3uv
	E6OZEFpIcyFFRVDYOApYIB8YDyhcQd8o8SbAHb+VgWX435RC37PBJSPIxFDZtrSoYdeUVhZ/zV+
	+G80EvQu3iOCnQjy/vKscBzrH/KRVVvzYCE2LYItoDIoEU4ylfl4wnH8KPGK8zoPf8qw50+xE2P
	+2o92dbzoAy37KhbPz867qljMyyf6RfQ62WOJpdRYCxCffwTNnVGU3TMbxX4Q7Fuku4cvh2IUUV
	AWqsC/WMoEyP0ydlrXsMC1zzN2zC/hjCc=
X-Received: by 2002:a05:6000:2285:b0:437:71b2:6f34 with SMTP id ffacd0b85a97d-4396f154b8emr23979947f8f.1.1771959893577;
        Tue, 24 Feb 2026 11:04:53 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970c09897sm29394920f8f.17.2026.02.24.11.04.53
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 11:04:53 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][whinlatter][PATCH 2/8] openjpeg: patch CVE-2023-39327
Date: Tue, 24 Feb 2026 20:04:45 +0100
Message-ID: <20260224190451.1596179-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260224190451.1596179-1-skandigraun@gmail.com>
References: <20260224190451.1596179-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Feb 2026 19:05:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124590

Details: https://nvd.nist.gov/vuln/detail/CVE-2023-39327

Take the patch that is used by OpenSUSE to mitigate this vulnerability.
Upstream seems to be unresponsive to this issue.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../openjpeg/openjpeg/CVE-2023-39327.patch    | 50 +++++++++++++++++++
 .../openjpeg/openjpeg_2.5.4.bb                |  1 +
 2 files changed, 51 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2023-39327.patch

diff --git a/meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2023-39327.patch b/meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2023-39327.patch
new file mode 100644
index 0000000000..05e504a18e
--- /dev/null
+++ b/meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2023-39327.patch
@@ -0,0 +1,50 @@
+From a3504b2484cf7443c547037511c40f59aff8ae5a Mon Sep 17 00:00:00 2001
+From: Gyorgy Sarvari <skandigraun@gmail.com>
+Date: Mon, 23 Feb 2026 17:22:18 +0100
+Subject: [PATCH] CVE-2023-39327
+
+This patch fixes CVE-2023-39327.
+
+This patch comes from OpenSuse:
+https://build.opensuse.org/projects/openSUSE:Factory/packages/openjpeg2/files/openjpeg2-cve-2023-39327-limit-iterations.patch
+
+Upstream seems to unresponsive to this vulnerability.
+
+Upstream-Status: Inactive-Upstream [inactive, when it comes to CVEs]
+
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ src/lib/openjp2/t2.c | 13 +++++++++++++
+ 1 file changed, 13 insertions(+)
+
+diff --git a/src/lib/openjp2/t2.c b/src/lib/openjp2/t2.c
+index 4e8cf601..ad39cd74 100644
+--- a/src/lib/openjp2/t2.c
++++ b/src/lib/openjp2/t2.c
+@@ -441,6 +441,8 @@ OPJ_BOOL opj_t2_decode_packets(opj_tcd_t* tcd,
+          * and no l_img_comp->resno_decoded are computed
+          */
+         OPJ_BOOL* first_pass_failed = NULL;
++        OPJ_UINT32 l_packet_count = 0;
++        OPJ_UINT32 l_max_packets = 100000;
+ 
+         if (l_current_pi->poc.prg == OPJ_PROG_UNKNOWN) {
+             /* TODO ADE : add an error */
+@@ -457,6 +459,17 @@ OPJ_BOOL opj_t2_decode_packets(opj_tcd_t* tcd,
+ 
+         while (opj_pi_next(l_current_pi)) {
+             OPJ_BOOL skip_packet = OPJ_FALSE;
++            
++            /* CVE-2023-39327: Check for excessive packet iterations */
++            if (++l_packet_count > l_max_packets) {
++                opj_event_msg(p_manager, EVT_ERROR,
++                              "Excessive packet iterations detected (>%u). Possible malformed stream.\n",
++                              l_max_packets);
++                opj_pi_destroy(l_pi, l_nb_pocs);
++                opj_free(first_pass_failed);
++                return OPJ_FALSE;
++            }
++            
+             JAS_FPRINTF(stderr,
+                         "packet offset=00000166 prg=%d cmptno=%02d rlvlno=%02d prcno=%03d lyrno=%02d\n\n",
+                         l_current_pi->poc.prg1, l_current_pi->compno, l_current_pi->resno,
diff --git a/meta-oe/recipes-graphics/openjpeg/openjpeg_2.5.4.bb b/meta-oe/recipes-graphics/openjpeg/openjpeg_2.5.4.bb
index 23f46c45cd..971cdb2ff9 100644
--- a/meta-oe/recipes-graphics/openjpeg/openjpeg_2.5.4.bb
+++ b/meta-oe/recipes-graphics/openjpeg/openjpeg_2.5.4.bb
@@ -7,6 +7,7 @@ DEPENDS = "libpng tiff lcms zlib"
 
 SRC_URI = "git://github.com/uclouvain/openjpeg.git;branch=master;protocol=https \
            file://0001-Do-not-ask-cmake-to-export-binaries-they-don-t-make-.patch \
+           file://CVE-2023-39327.patch \
            "
 SRCREV = "6c4a29b00211eb0430fa0e5e890f1ce5c80f409f"
 

