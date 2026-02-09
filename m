Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 791C4EE6B6F
	for <webhook@archiver.kernel.org>; Mon,  9 Feb 2026 11:39:18 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.45583.1770637150061192646
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Feb 2026 03:39:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=m241x9Cm;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-47ee76e8656so66653865e9.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 09 Feb 2026 03:39:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770637148; x=1771241948; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RsiM/TiJmp6a5AO/U2I7vFO/mCa1r9PmnNrKPHKEaJw=;
        b=m241x9Cmxe/5y/mBDRZICVk5ChiPLr+rIXR7wUKX9dEBtdHpLSNc7OQvhIJ5kUdcgI
         pB0vxgIeo+k8k1PkR7qsV15NM+3nCY7QC+g/KSOc51zc8ot2sgfGZtnzJfbnRlZkaYZu
         UaFO3MSeo8bkQLyuZZDVaNe0FcwhiEgp1S1VaEp3JIYsR6SB85TlWudmwHTppb/3I5YR
         mDHQ4Rjwab0v+XhE69JJDxcTzF7EqouhIm1kmHiA75iYC/tld7hPTwvFhiiuMrWZ79mf
         iNkqKQePRJc1z2xiVf0XbxQ4k2g7PccT31cp1lsMqddgShGueTG9VhDO50HYC71gBN0K
         ePYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770637148; x=1771241948;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RsiM/TiJmp6a5AO/U2I7vFO/mCa1r9PmnNrKPHKEaJw=;
        b=TXaX11CvhJ0bfxZk0J4NTd8oBKly/uzPsQSNEBJEmQxmCRhqxHltTQCmVfgCgPuATZ
         lJaljilDI1M/1RDtbZu3jF45noFT0k5IHucH+YJ/3ipSI/bkGAyPjTpaU6B5Fe8CbXf+
         UEiabGUWi+bFKTr6OxwvS4vqSj6UG2KKvWBDNuNptVnm7T16ygT2kmYdz5FMFb/9X2xF
         J1TeOeihNzOQGETdbKMNCLPROG3NtyWIvriHAfkgZEII+dFXVlxzTiCtzOuwjXV5OMnG
         Sgir/xD1sBueKe4Dp6ENic/ssig6bmWENEBjZb28rtx9Rw/YaULV7iEylZ2i2w3VCLsA
         GbKA==
X-Gm-Message-State: AOJu0Yxn06qjSb8U8/du9EMzC/F8yf933FcWuADgY6rHoC9yaLQ7aohG
	i2BWs3+iPsTxxOeMmBuBTjxO0Szy0P1AyfkDXImMP4m03VF1ty5DxDusLJjXKw==
X-Gm-Gg: AZuq6aJLHTdU3bNxfTagLNtRcuGNsX9K2UxdBeYOdygqafoDawI5Hd7M9Nt0aua0IRv
	WgTqb2fPI3Q8Cbo7iQY7LS7tdXaK3OHOrYqlK3HHSV/i+7Y6eo9cAp2R2TmFTMgezzCGxK5NW/M
	PcemLNE1aN+oqWu99x3PpF2qdAClvZ3tXDh4y5L8tAY1ZlOVHZkA+fBnJ0A39301zkiuUH8OMdQ
	/wu3fR9BpMPjYTd6Od/q48jvr2gyAzLYc6rQd8jW+dNUXnp4/4ty3czYKYGtX2rGEorYuSU2BCw
	QRMpnKjaANMfKJ6d+efl6WdALCzqdtvX/ZD1tYW4YwlaJ3ueIEUt3Rdw+hi5m5XXEKJT1vG6k/0
	V2xj8+m3QNUJ6loPiyZMDmjyX3wsmktIc8BEoAuKS+ugz6ta/1VjcDb4fZ4iyi+/ZXMlHZ4hSxx
	5XfGSOqpSl
X-Received: by 2002:a05:600c:5290:b0:477:6d96:b3e5 with SMTP id 5b1f17b1804b1-4832020023cmr157313495e9.7.1770637148265;
        Mon, 09 Feb 2026 03:39:08 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4834304232bsm56030375e9.2.2026.02.09.03.39.07
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 03:39:07 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][kirkstone][PATCH 05/16] sox: patch CVE-2017-15371
Date: Mon,  9 Feb 2026 12:38:52 +0100
Message-ID: <20260209113904.3442496-5-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260209113904.3442496-1-skandigraun@gmail.com>
References: <20260209113904.3442496-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 09 Feb 2026 11:39:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124300

Details: https://nvd.nist.gov/vuln/detail/CVE-2017-15371

Pick the patch that was identified by Debian[1] to fix the solution.

[1]: https://security-tracker.debian.org/tracker/CVE-2017-15371

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../sox/sox/CVE-2017-15371.patch              | 40 +++++++++++++++++++
 .../recipes-multimedia/sox/sox_14.4.2.bb      |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/sox/sox/CVE-2017-15371.patch

diff --git a/meta-multimedia/recipes-multimedia/sox/sox/CVE-2017-15371.patch b/meta-multimedia/recipes-multimedia/sox/sox/CVE-2017-15371.patch
new file mode 100644
index 0000000000..f0aa8d39e7
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/sox/sox/CVE-2017-15371.patch
@@ -0,0 +1,40 @@
+From 83bf78913ee813c2c767854eb16acd9e6fb779cb Mon Sep 17 00:00:00 2001
+From: Mans Rullgard <mans@mansr.com>
+Date: Sun, 5 Nov 2017 15:57:48 +0000
+Subject: [PATCH] flac: fix crash on corrupt metadata (CVE-2017-15371)
+
+CVE: CVE-2017-15371
+Upstream-Status: Backport [https://github.com/mansr/sox/commit/818bdd0ccc1e5b6cae742c740c17fd414935cf39]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ src/flac.c | 8 +++++---
+ 1 file changed, 5 insertions(+), 3 deletions(-)
+
+diff --git a/src/flac.c b/src/flac.c
+index 0d7829e..07f45c1 100644
+--- a/src/flac.c
++++ b/src/flac.c
+@@ -119,9 +119,10 @@ static void decoder_metadata_callback(FLAC__StreamDecoder const * const flac, FL
+     p->total_samples = metadata->data.stream_info.total_samples;
+   }
+   else if (metadata->type == FLAC__METADATA_TYPE_VORBIS_COMMENT) {
++    const FLAC__StreamMetadata_VorbisComment *vc = &metadata->data.vorbis_comment;
+     size_t i;
+ 
+-    if (metadata->data.vorbis_comment.num_comments == 0)
++    if (vc->num_comments == 0)
+       return;
+ 
+     if (ft->oob.comments != NULL) {
+@@ -129,8 +130,9 @@ static void decoder_metadata_callback(FLAC__StreamDecoder const * const flac, FL
+       return;
+     }
+ 
+-    for (i = 0; i < metadata->data.vorbis_comment.num_comments; ++i)
+-      sox_append_comment(&ft->oob.comments, (char const *) metadata->data.vorbis_comment.comments[i].entry);
++    for (i = 0; i < vc->num_comments; ++i)
++      if (vc->comments[i].entry)
++        sox_append_comment(&ft->oob.comments, (char const *) vc->comments[i].entry);
+   }
+ }
+ 
diff --git a/meta-multimedia/recipes-multimedia/sox/sox_14.4.2.bb b/meta-multimedia/recipes-multimedia/sox/sox_14.4.2.bb
index 43b09a8ff0..a03b346211 100644
--- a/meta-multimedia/recipes-multimedia/sox/sox_14.4.2.bb
+++ b/meta-multimedia/recipes-multimedia/sox/sox_14.4.2.bb
@@ -34,6 +34,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/sox/sox-${PV}.tar.gz \
            file://CVE-2017-11358.patch \
            file://CVE-2017-11359.patch \
            file://CVE-2017-15370.patch \
+           file://CVE-2017-15371.patch \
            "
 SRC_URI[md5sum] = "d04fba2d9245e661f245de0577f48a33"
 SRC_URI[sha256sum] = "b45f598643ffbd8e363ff24d61166ccec4836fea6d3888881b8df53e3bb55f6c"

