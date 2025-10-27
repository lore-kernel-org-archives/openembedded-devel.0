Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96A5FCCF9EF
	for <webhook@archiver.kernel.org>; Mon, 27 Oct 2025 14:16:05 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web10.34152.1761574561647183897
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Oct 2025 07:16:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MeEl8DW0;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-475dd559a83so12007685e9.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 27 Oct 2025 07:16:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761574560; x=1762179360; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ooKWbr1bBOyzguAg3nkEL7DZ1JHZwsam63gFb9NLvcQ=;
        b=MeEl8DW0L1k8MnLyObvKnxQRFjQ+jmzu5QzlNLAefoQJOFkN9k2A7Jr5jcwGwpNnhG
         PmSfYKNXGkh9MdymMb3IsQsFEzuH0hMXa0qNwLf6m5XW7ojpJbfBZf5nqmzK1OZW5Cjx
         91VdEo5HBJKkDrt3mdtlkb06MbinlieN3ym6DPmHmkUlcL+Y1Ok3S/0zr0lPgPA6Inbk
         9kncNFB00kX7/1dO0V9o5aByCrKS49Vdhu5T6UM3NHAlA0b5VleQyk4eOVQml1y/StSQ
         Un0KoQi2bsgLNb2AVbl59eOH1ichmDVAB30JvwGKrUKOgV1z1/uKDq3fy7E/qgBdxe7q
         vqcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761574560; x=1762179360;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ooKWbr1bBOyzguAg3nkEL7DZ1JHZwsam63gFb9NLvcQ=;
        b=ImtFvUde/Xk+0N0EinMoZlJnCnYcde1VkmPlADwkwJrBY+zP/V18WDlSDb+JdT0OZf
         PhYF5vsjL+7PQmlgOZRsqEm1tE7fE1BykRicZ8RypCqwCYb+TXFHa0ko4a2pdVqUmjUO
         4Gk5JRbX+vOl7gAcDqCnTbVLm12nn3ujnTlHhWXJp+6hyOOocW1pTmUUETDqslDnpJrP
         XTODAHu8M7Q4Wxq9uLFwf/kyEgwOdAplJCSRMlMFLCZVDEH08QFWMA8Qhfw6GHFY5xFM
         TPQTMAiaZJsOpctw7J57Cd4kbm1VR8KUwVV540OxsqTkwkBGH9qgc5b/WKkQ/BLuWzB1
         oXlQ==
X-Gm-Message-State: AOJu0Yx1IK8ZGnouMgUE+cb7SrM7QJLCGLOxI9T0tz0K3lF0xwfV2eq6
	NH+vMBKfvahgYrjGJqBo6oVQbbMCxUIjoP7sNmRsqTQjmVhionWj5FU7N4mszQ==
X-Gm-Gg: ASbGncvS2AM6Q+FiVFLViR1mrzNnEVwMK4KHaf1+N1pT1uPtG7/uQmZ2ABYJCrbkiKy
	olLODt7pnp5XG+abESyuXYxMWKD5EuOZy3vIZzvVzYDYa96HBH/E13rMhJ52y89IKnsrS3k2tjo
	bPFvF1whaUrvzIJIzPtBlVKLMwAmr5chicdaWzjbc6JhYmy7HahDX2g2Qxj+V+3JpQ3CSFD6/yv
	/4RkM3EpM7Obi7iUInOtDETBy7f+H5Ih/izLD/Hjo7LA4k7VB7Nri3PcyCR4tDZ9lXEb96A6WbO
	u77LYaLo3lyPju7MGWYOvqx/Z7jjsJPnRcLarBkYRu/zOofulBI3xCHYZGr/cN5npNnlfC1twOV
	LTLyNF87MYh1peLd4nik7riB/fCtcYUqcUN9GKr98qJm8d/GYXBXR05N6Fq21IMIWNT+qtEur3g
	==
X-Google-Smtp-Source: AGHT+IHDkuuwuuzomBCT6oWH0C4cyI35YU1bNNsUil3pjJiI5LLgsmj3DDJhYK9pjFpFo7jjGiO2kQ==
X-Received: by 2002:a05:600c:c492:b0:46d:9d28:fb5e with SMTP id 5b1f17b1804b1-475d2e72db1mr90796425e9.5.1761574559947;
        Mon, 27 Oct 2025 07:15:59 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952db80fsm14164067f8f.31.2025.10.27.07.15.58
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 07:15:59 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-initramfs][kirkstone][PATCH 02/10] klibc: patch CVE-2021-31871
Date: Mon, 27 Oct 2025 15:15:49 +0100
Message-ID: <20251027141557.1893563-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251027141557.1893563-1-skandigraun@gmail.com>
References: <20251027141557.1893563-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Oct 2025 14:16:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121042

Details: https://nvd.nist.gov/vuln/detail/CVE-2021-31871

Pick the patch mentioned in the nvd report.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../klibc/files/CVE-2021-31871.patch          | 34 +++++++++++++++++++
 .../recipes-devtools/klibc/klibc.inc          |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta-initramfs/recipes-devtools/klibc/files/CVE-2021-31871.patch

diff --git a/meta-initramfs/recipes-devtools/klibc/files/CVE-2021-31871.patch b/meta-initramfs/recipes-devtools/klibc/files/CVE-2021-31871.patch
new file mode 100644
index 0000000000..c8c40ec931
--- /dev/null
+++ b/meta-initramfs/recipes-devtools/klibc/files/CVE-2021-31871.patch
@@ -0,0 +1,34 @@
+From db29a01c413fcaaa1095284dfe31582e97d35679 Mon Sep 17 00:00:00 2001
+From: Ben Hutchings <ben@decadent.org.uk>
+Date: Wed, 28 Apr 2021 19:46:47 +0200
+Subject: [PATCH] cpio: Fix possible crash on 64-bit systems
+
+copyin_link() tries to allocate (unsigned int)c_filesize + 1 bytes.
+If c_filesize == UINT_MAX, this works out as 0 bytes, resulting in a
+null pointer and a subsequent SIGSEGV.
+
+The previous commit made this impossible on 32-bit systems.
+
+CVE-2021-31871
+
+CVE: CVE-2021-31871
+Upstream-Status: Backport [https://git.kernel.org/pub/scm/libs/klibc/klibc.git/commit/?id=2e48a12ab1e30d43498c2d53e878a11a1b5102d5]
+
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ usr/utils/cpio.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/usr/utils/cpio.c b/usr/utils/cpio.c
+index cb61679..a13c876 100644
+--- a/usr/utils/cpio.c
++++ b/usr/utils/cpio.c
+@@ -831,7 +831,7 @@ static void copyin_link(struct new_cpio_header *file_hdr, int in_file_des)
+ 	char *link_name = NULL;	/* Name of hard and symbolic links.  */
+ 	int res;		/* Result of various function calls.  */
+ 
+-	link_name = (char *)xmalloc((unsigned int)file_hdr->c_filesize + 1);
++	link_name = (char *)xmalloc(file_hdr->c_filesize + 1);
+ 	link_name[file_hdr->c_filesize] = '\0';
+ 	tape_buffered_read(link_name, in_file_des, file_hdr->c_filesize);
+ 	tape_skip_padding(in_file_des, file_hdr->c_filesize);
diff --git a/meta-initramfs/recipes-devtools/klibc/klibc.inc b/meta-initramfs/recipes-devtools/klibc/klibc.inc
index dd22282b40..ccf4a56953 100644
--- a/meta-initramfs/recipes-devtools/klibc/klibc.inc
+++ b/meta-initramfs/recipes-devtools/klibc/klibc.inc
@@ -22,6 +22,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/libs/klibc/2.0/klibc-${PV}.tar.xz \
            file://cross-clang.patch \
            file://0001-workaround-for-overlapping-sections-in-binary.patch \
            file://CVE-2021-31870.patch \
+           file://CVE-2021-31871.patch \
            "
 
 ARMPATCHES ?= ""

