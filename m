Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 458D7E7FDE9
	for <webhook@archiver.kernel.org>; Mon,  2 Feb 2026 21:14:20 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1616.1770066850869837289
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Feb 2026 13:14:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Hnp1VkEQ;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-42fbc305882so3053720f8f.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 02 Feb 2026 13:14:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770066849; x=1770671649; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hsZJdUI+jsoAGjUKXrSfqDtBesmONSa2h0/JcJZ6uQM=;
        b=Hnp1VkEQd3cKsbCQbnCwv6TKUhc9D/Hx7BLlf3rwHEnC5HXib2YQ8ysRZTKdBhVlP/
         UfHHXNG62/YmU8AgQ7QktQxi9v29hBg4Rz9nUwbPJsgkUnZmTuVpcoDR6rSriZN2Alq9
         SPqNpUFCIpurY5Ha2gp1YeWADgRT4alwC5CgLUud+dVwYPDAWV1vKseqTYEmiiyoDvJu
         LNubwbnq8GrCvK2bzmyyI18j+gcl19BhbQT9SEvvlWH/UXTUbe66YymO1aRp8WGAFyar
         dG5Ul8fE+XmMORSH+dH4K03jjlVEaYoL/qAu+AukXkrubooyqE1WY/EivPSj3NtFiIjp
         dM7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770066849; x=1770671649;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hsZJdUI+jsoAGjUKXrSfqDtBesmONSa2h0/JcJZ6uQM=;
        b=pdMacwt+VVCrOPle9Ad5uN7tM97KmqWzFcTT2XsPsQgnjoKx4LPSsbsnBGSsgkivzq
         1N8ZHXeh+7L6u3DY/gvx3Q+mBZcNnzaXDjEdWgsinNNJGrANLuS/27a8TrnbqDx259cf
         KWJ0YHe6MdgClzikKjAoQw59iZEkA6NUlz1XNSFcjQqm3wjXjWOemzVihbkYCUvvDTG9
         mz/5VytOTjO5EqeTSTeHqBVlOXRR1iStOaf0mY8p1xMUGdv5t+71ErcWgHpx1FSC2E90
         8dXu456+JFkwhs+iBsFKsXcQc4XFH1JTIEREgSDy5RqOkHB3c2VLFn/EngJmlIjPiG29
         mZoA==
X-Gm-Message-State: AOJu0Yy/OmzpdIcNVucSzLSORFSuJxqPIo6skVoEao6zanAncjTN1D5u
	tL8v7sQ2sWY9EyxIcQCowwCOiCqexzg3VfCrccBdYGGIi2kpmhpIamP7v/wYjA==
X-Gm-Gg: AZuq6aLELWjXspKZsLbyAqfHUWvbRHzahwmI4txENmbleDU0xL+aaMmj/J/vua0zdyP
	xA2YvWkQR87oi5BBdFXSniIp/pvum/FIwlZ6cQPSLpRoPcAOLynvD7peAM4X1cpZKr1I6sobsvr
	tYkP51yTaEbsRWHVPBuHSATOvXt63YkOpK62pkMHZw7PtZ76FxncTXi3qQgsiQViuIwNoj17lYB
	FFGjCntjBD2s1oyLfqBozts0itLM5myXG/Z+EN/l9Az5rDe5Bmg9Gu6LAkaP77wMMgGJDWOK+dw
	ZGg3DVBnv1/jQxVkbAJPiVHzyBJ2nbdOLYAcso6TQPPCpakXK8MRhksCmKfkwC3pv5F9N2BMz0A
	waJPWOVfojzvXtW3S1Z4rt+tw+p/IFgDs7CjZ8LCUKq3yGnEwIxmfGTP/G78nxcGzJh+e3+35Pz
	EmiEKRX8M1Wo9B2HLCkm8=
X-Received: by 2002:a05:6000:184f:b0:435:9d70:f299 with SMTP id ffacd0b85a97d-435f3a7e644mr19473124f8f.22.1770066849055;
        Mon, 02 Feb 2026 13:14:09 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e131ce64sm48756747f8f.26.2026.02.02.13.14.08
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 13:14:08 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][whinlatter][PATCH 10/15] libcdio: patch CVE-2024-36600
Date: Mon,  2 Feb 2026 22:13:56 +0100
Message-ID: <20260202211401.1287664-10-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260202211401.1287664-1-skandigraun@gmail.com>
References: <20260202211401.1287664-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 02 Feb 2026 21:14:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124083

Details: https://nvd.nist.gov/vuln/detail/CVE-2024-36600

Backport the patch from the PR that is referenced in the NVD advisory.

Note that there are two PRs mentioned: one is the fix, and the other
is just readme update with the CVE ID. The latter wasn't backported.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../libcdio/libcdio/CVE-2024-36600.patch      | 32 +++++++++++++++++++
 .../libcdio/libcdio_2.2.0.bb                  |  4 ++-
 2 files changed, 35 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-multimedia/libcdio/libcdio/CVE-2024-36600.patch

diff --git a/meta-oe/recipes-multimedia/libcdio/libcdio/CVE-2024-36600.patch b/meta-oe/recipes-multimedia/libcdio/libcdio/CVE-2024-36600.patch
new file mode 100644
index 0000000000..adf58fcdc4
--- /dev/null
+++ b/meta-oe/recipes-multimedia/libcdio/libcdio/CVE-2024-36600.patch
@@ -0,0 +1,32 @@
+From b620a2d3d37d8068bc69941155ba85e6c740d470 Mon Sep 17 00:00:00 2001
+From: Yuxin Wang <yuxinwang9999@gmail.com>
+Date: Sun, 13 Jul 2025 13:53:17 +0800
+Subject: [PATCH] Fix buffer overrun for Joliet filenames
+
+Joliet uses UCS-2 (2 bytes per character), and converting to UTF-8
+may require up to 3 bytes per character. This patch increases the
+buffer size by i_fname/2 to prevent buffer overrun.
+
+CVE: CVE-2024-36600
+Upstream-Status: Backport [https://github.com/libcdio/libcdio/commit/417478a7474af41c27ab3f876f31783fa06a5dbc]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ lib/iso9660/iso9660_fs.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/lib/iso9660/iso9660_fs.c b/lib/iso9660/iso9660_fs.c
+index 3b2f07c..9df1b94 100644
+--- a/lib/iso9660/iso9660_fs.c
++++ b/lib/iso9660/iso9660_fs.c
+@@ -859,6 +859,11 @@ _iso9660_dir_to_statbuf (iso9660_dir_t *p_iso9660_dir,
+ 
+   /* .. string in statbuf is one longer than in p_iso9660_dir's listing '\1' */
+   stat_len = sizeof(iso9660_stat_t) + i_fname + 2;
++#ifdef HAVE_JOLIET
++  if (u_joliet_level) {
++    stat_len += i_fname / 2;
++  }
++#endif
+ 
+   /* Reuse multiextent p_stat if not NULL */
+   if (!p_stat) {
diff --git a/meta-oe/recipes-multimedia/libcdio/libcdio_2.2.0.bb b/meta-oe/recipes-multimedia/libcdio/libcdio_2.2.0.bb
index c443d9b891..ca524f7e9a 100644
--- a/meta-oe/recipes-multimedia/libcdio/libcdio_2.2.0.bb
+++ b/meta-oe/recipes-multimedia/libcdio/libcdio_2.2.0.bb
@@ -4,7 +4,9 @@ SECTION = "libs"
 LICENSE = "GPL-3.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BP}.tar.bz2"
+SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BP}.tar.bz2 \
+           file://CVE-2024-36600.patch \
+           "
 
 SRC_URI[sha256sum] = "6f8fbdf4d189cf63f2a7a1549c516cd720c7b222c7aaadbc924a26e745a48539"
 

