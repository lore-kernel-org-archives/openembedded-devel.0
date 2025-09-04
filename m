Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9415ACA1014
	for <webhook@archiver.kernel.org>; Thu,  4 Sep 2025 04:40:37 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web10.32061.1756960834346720736
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Sep 2025 21:40:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=ctuXaoiQ;
 spf=pass (domain: mvista.com, ip: 209.85.216.49, mailfrom: hprajapati@mvista.com)
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-32b8919e7c7so678106a91.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 03 Sep 2025 21:40:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1756960833; x=1757565633; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fFkROUcLFgg7MZ8u1H2Gkcb/8mHEjg2XfsXotQlHreI=;
        b=ctuXaoiQIvrZyeTwykBPgZ63DY2XXFTi78ZajKFJ8CaShrcpEUPoD8kQhCs6cLEK+3
         iLcmmI4VFVtC3QPrejXPzylzwB+ZOERJhFXAmOPUyxP0TPAc6WC0b6M+Wyqh3KOhrjeH
         k5jO6H+LxAWMM1779+oPja/n2oQFTonohYRRA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756960833; x=1757565633;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fFkROUcLFgg7MZ8u1H2Gkcb/8mHEjg2XfsXotQlHreI=;
        b=fSQRnHOT5HHwhhjN2Cc6g/sJkMiU7fp9STxdgHgNodxiFkgeZ3xn08/CTLCefzT+xz
         EJFCsMVvppTz7cvknlZKEQv1bNjHNeH8Og+6i+rOq3Hmzigzg82COJLuAHA8MAVcrhlN
         C8h0A03huRM7l4Y2pBYY9dJGLK56mrqaXnVx8MaGtyTie0J2tfP5soUIibINL9dHMK63
         pcULmt1LmITccyQfQcbNgqxQV9rml3/AX+5BsTCqEnTfEYAumgmByVFZRt9MiTbYZCe3
         Jr4M/i7vMVJNxpuHLUfI26+ziCr5HAR3TOQOhTG0HOhfv49aJDhbn4X+4Za+RP6APjtX
         ucqA==
X-Gm-Message-State: AOJu0YwlcrOuFWPb1OmIk6I4g6n1QE/XH+BZyyG88odS91hTK5deYE0+
	mXpo0CqN/hKSzAo2LJoQvY10GKSwfmCS5x8HcBtLVZTjKJ9Pw7B9J4kn3EjB5Btl94ac20kTPpJ
	MTWcX
X-Gm-Gg: ASbGncuD+J7hDSkfx5Bg0hAsRgdzr4qcRzQSUi+P96OOVI9JgHoMylb54gCMctGFTLt
	iu6X5U2eAtQIj4Z/2PJ9u/J9EEjk5xcJ8dtleSb9mnj1xV14XEjhkX1Vt/6eWbbaxS3gwScNREG
	dHPCXKsQ1tQYlTWN96kz8HT+s2WwQKi9vCWioJ+w2cy/bnRpg6HNd0SxDRyBXza7YV64V+56bq4
	M48zVgZeRcLfviYQHeYqvZwyEN2kQt3/etbw+8A0c5X78QCo8r4tMRNUxjP7kikrx5aCkaMWK2W
	vyaeT87WLAlD1eaSFYcURlHlLs0YmxgD1a4ASdzV05zEYMeNL6P97baXpmZtnSs80Eb9Emjn2NU
	iRQZrqfEEtVkj4NWN1z/tG9CIVNsb33iq/yc=
X-Google-Smtp-Source: AGHT+IH1dFcRM4GWPR45QHclNONXRY/qEmyJKxkWlnPSAj1/ox8gVhHL+U+b75JCqRnotmOFWmztmw==
X-Received: by 2002:a17:90b:1d8a:b0:327:4d35:fd71 with SMTP id 98e67ed59e1d1-32815452bb7mr19997385a91.13.1756960833285;
        Wed, 03 Sep 2025 21:40:33 -0700 (PDT)
Received: from MVIN00016.mvista.com ([27.121.101.116])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-329f633749bsm5767097a91.27.2025.09.03.21.40.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 21:40:32 -0700 (PDT)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [meta-oe][walnascar][PATCH] openjpeg: fix for CVE-2025-54874
Date: Thu,  4 Sep 2025 10:10:26 +0530
Message-ID: <20250904044026.9075-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 04 Sep 2025 04:40:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119268

Upstream-Status: Backport https://github.com/uclouvain/openjpeg/commit/f809b80c67717c152a5ad30bf06774f00da4fd2d

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../openjpeg/openjpeg/CVE-2025-54874.patch    | 44 +++++++++++++++++++
 .../openjpeg/openjpeg_2.5.3.bb                |  1 +
 2 files changed, 45 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2025-54874.patch

diff --git a/meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2025-54874.patch b/meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2025-54874.patch
new file mode 100644
index 0000000000..187557a35c
--- /dev/null
+++ b/meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2025-54874.patch
@@ -0,0 +1,44 @@
+From f809b80c67717c152a5ad30bf06774f00da4fd2d Mon Sep 17 00:00:00 2001
+From: Sebastian Rasmussen <sebras@gmail.com>
+Date: Thu, 16 Jan 2025 02:13:43 +0100
+Subject: [PATCH] opj_jp2_read_header: Check for error after parsing header.
+
+Consider the case where the caller has not set the p_image
+pointer to NULL before calling opj_read_header().
+
+If opj_j2k_read_header_procedure() fails while obtaining the rest
+of the marker segment when calling opj_stream_read_data() because
+the data stream is too short, then opj_j2k_read_header() will
+never have the chance to initialize p_image, leaving it
+uninitialized.
+
+opj_jp2_read_header() will check the p_image value whether
+opj_j2k_read_header() suceeded or failed. This may be detected as
+an error in valgrind or ASAN.
+
+The fix is to check whether opj_j2k_read_header() suceeded before
+using the output argument p_image.
+
+CVE: CVE-2025-54874
+Upstream-Status: Backport [https://github.com/uclouvain/openjpeg/commit/f809b80c67717c152a5ad30bf06774f00da4fd2d]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ src/lib/openjp2/jp2.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/lib/openjp2/jp2.c b/src/lib/openjp2/jp2.c
+index 4df055a5..da506318 100644
+--- a/src/lib/openjp2/jp2.c
++++ b/src/lib/openjp2/jp2.c
+@@ -2873,7 +2873,7 @@ OPJ_BOOL opj_jp2_read_header(opj_stream_private_t *p_stream,
+                               p_image,
+                               p_manager);
+ 
+-    if (p_image && *p_image) {
++    if (ret && p_image && *p_image) {
+         /* Set Image Color Space */
+         if (jp2->enumcs == 16) {
+             (*p_image)->color_space = OPJ_CLRSPC_SRGB;
+-- 
+2.50.1
+
diff --git a/meta-oe/recipes-graphics/openjpeg/openjpeg_2.5.3.bb b/meta-oe/recipes-graphics/openjpeg/openjpeg_2.5.3.bb
index 231bf84573..586bfeaf1f 100644
--- a/meta-oe/recipes-graphics/openjpeg/openjpeg_2.5.3.bb
+++ b/meta-oe/recipes-graphics/openjpeg/openjpeg_2.5.3.bb
@@ -7,6 +7,7 @@ DEPENDS = "libpng tiff lcms zlib"
 
 SRC_URI = "git://github.com/uclouvain/openjpeg.git;branch=master;protocol=https \
            file://0001-Do-not-ask-cmake-to-export-binaries-they-don-t-make-.patch \
+           file://CVE-2025-54874.patch \
            "
 SRCREV = "210a8a5690d0da66f02d49420d7176a21ef409dc"
 S = "${WORKDIR}/git"
-- 
2.50.1


