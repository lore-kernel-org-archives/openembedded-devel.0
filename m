Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78C93FCA173
	for <webhook@archiver.kernel.org>; Mon,  9 Mar 2026 18:21:09 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21685.1773080463432954052
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Mar 2026 11:21:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iXod7zGl;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-485345e1013so13106655e9.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 09 Mar 2026 11:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773080462; x=1773685262; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=pStnIqaMXjYrGMC5RVdFltljQKdTRk6yEKArZJzSbNo=;
        b=iXod7zGlvQzCIXFiGaVZ0Uk3l/DqKkuWez+DM/x0x6zZ6qxaOClEb2h5WPq/pD6yiB
         /wjf3nqfc4PyER3UhhzTmpMkGtKTJFP0mZaYQrUGBcvcaEkm3e2fRddQOq7JMUwoI93T
         OOkUsxPorTY+SbFBelWVSw1l6kSgjwzXZu4z4bVeQkS3IW8fi76Qg8W3adL+3BHNKZ51
         AxFDDtvYFzE6YnCSjZ6RZmC+jjDZZdYLOLZFwAu/v7i0XMJl6rnmsS9miZinpNYe2sO7
         I6WV14/1sKATpxNo4QJ2WGnuEqRlgWs5gpfEM26Drwgr6AUhbyZWfh1H1UkDx14jY80L
         7FXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773080462; x=1773685262;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pStnIqaMXjYrGMC5RVdFltljQKdTRk6yEKArZJzSbNo=;
        b=cJpxSor6w3LoGIVsvN3RT0rsKSQfEn0frZTAPfXEoYlUCxeB3mFt+4aj2dvA1W/MJz
         pXKh4xJc54U9h0Q3I0ippz6FPZShNjzwinL+rqfamCUjWjZgupEP9ax/5gPzcGo685nS
         c1EdaLdMWehblXkAQQ0dj+nPq4koXtw1SuXgYY6LUULYZHtXHF6lSbjWtMWOp17EUzAd
         S9FQ/ttIIUFH0iWYJQ6Ju2L+wXAQxNCurvAhSRJs5x+4AukULxA4ABV73/z7uUcFLJ18
         uptAlyEEHRf6W/txT7tEkf4BLNNsUk+jtTYTyPFW+1XMyi+qv9EBim0vLfCfxZHv5wR4
         tObg==
X-Gm-Message-State: AOJu0YxY5Q4wFH37V/2FuSxvfANeWxudz23c1EICpWNppVzlKzAPUJx9
	3xJYy/L8SWakw+SU9RSgWPiJU12eGZP1zfmezSNyGqLk+4Ggi7x5VNLTBebkXQ==
X-Gm-Gg: ATEYQzxFEzWgnodtzHsN0kHABac2k46F0g6OJdkRdpc1AHvjJptJ49vg2+hdRQyS4fd
	ETBysJ8vrMTOhkSjY2ZmbVaLrfARzIi1JOYCXtpvgC4WdesNre0pVoRxkcacfQ+AUvK+S0ifzbf
	ROyLX8HbKSfQhuD93vDhZerFofUDQei9YCjD9ZtqdvtrE5tQBoHR2GG3yDdBy2lxWG14x2pPJFH
	/boFNK3TNL97EvIINNjqT2LBzdN4D/Jh63DR3kUCrXOt67Uzp1vDCrVvE4r/PVPpBRt7KHFIUe1
	T1Q0VNR18fbut2tYk0xyK+dRLzf9B2qws6iazY6wb2Byv000zwC9eK/25dXUlN/TUtCVU+NUPVv
	oQJHFp4n34I7XvnvG49WZgWMId8ZE5Mn4NLcIq0PyHvpCnajhVFIo4UeK8j7yR5vm0LSrU47rZE
	tbuGyWNcthrrJzOhUVM15F
X-Received: by 2002:a05:600c:468b:b0:47e:e981:78b4 with SMTP id 5b1f17b1804b1-48541a00b6fmr9867425e9.12.1773080461560;
        Mon, 09 Mar 2026 11:21:01 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541aba60esm9379875e9.5.2026.03.09.11.21.00
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 11:21:01 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][kirkstone][PATCH 1/3] gimp: patch CVE-2023-44441
Date: Mon,  9 Mar 2026 19:20:58 +0100
Message-ID: <20260309182100.717697-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 09 Mar 2026 18:21:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125002

Details: https://nvd.nist.gov/vuln/detail/CVE-2023-44441

Backport the commit that resolved the related upstream issue[1].

[1]: https://gitlab.gnome.org/GNOME/gimp/-/issues/10069

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../gimp/gimp/CVE-2023-44441.patch            | 61 +++++++++++++++++++
 meta-gnome/recipes-gimp/gimp/gimp_2.10.30.bb  |  1 +
 2 files changed, 62 insertions(+)
 create mode 100644 meta-gnome/recipes-gimp/gimp/gimp/CVE-2023-44441.patch

diff --git a/meta-gnome/recipes-gimp/gimp/gimp/CVE-2023-44441.patch b/meta-gnome/recipes-gimp/gimp/gimp/CVE-2023-44441.patch
new file mode 100644
index 0000000000..d28cb1e848
--- /dev/null
+++ b/meta-gnome/recipes-gimp/gimp/gimp/CVE-2023-44441.patch
@@ -0,0 +1,61 @@
+From babb323270a37091604bec44ee3597150cac8227 Mon Sep 17 00:00:00 2001
+From: Alx Sa <cmyk.student@gmail.com>
+Date: Sun, 1 Oct 2023 17:54:08 +0000
+Subject: [PATCH] plug-ins: Fix DDS vulnerability (ZDI-CAN-22093)
+
+Resolves #10069
+
+Currently, the DDS header information for the width, height, and bytes per scan line
+are read in and assumed to be correct. As these values are used for memory allocation
+and reading, it would be good to verify they do not exceed the file size.
+
+This patch adds a condition after the header is read in to verify those values. If they exceed
+the file size (mins an offset), the file is not read in and an error message is shown.
+
+CVE: CVE-2023-44441
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/gimp/-/commit/7db71cd0b6e36c454aa0d2d3efeec7e636db4dbc]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ plug-ins/file-dds/ddsread.c | 15 +++++++++++++++
+ 1 file changed, 15 insertions(+)
+
+diff --git a/plug-ins/file-dds/ddsread.c b/plug-ins/file-dds/ddsread.c
+index a8eb8b8..98e122d 100644
+--- a/plug-ins/file-dds/ddsread.c
++++ b/plug-ins/file-dds/ddsread.c
+@@ -109,6 +109,7 @@ read_dds (gchar    *filename,
+   guchar *pixels;
+   gchar *tmp;
+   FILE *fp;
++  gsize file_size;
+   dds_header_t hdr;
+   dds_header_dx10_t dx10hdr;
+   dds_load_info_t d;
+@@ -130,6 +131,10 @@ read_dds (gchar    *filename,
+       return GIMP_PDB_EXECUTION_ERROR;
+     }
+ 
++  fseek (fp, 0L, SEEK_END);
++  file_size = ftell (fp);
++  fseek (fp, 0, SEEK_SET);
++
+   if (strrchr (filename, '/'))
+     tmp = g_strdup_printf ("Loading %s:", strrchr (filename, '/') + 1);
+   else
+@@ -186,6 +191,16 @@ read_dds (gchar    *filename,
+         }
+     }
+ 
++  /* verify header information is accurate */
++  if (hdr.depth < 1                                       ||
++      (hdr.pitch_or_linsize > (file_size - sizeof (hdr))) ||
++      (((guint64) hdr.height * hdr.width * hdr.depth) > (file_size - sizeof (hdr))))
++    {
++      fclose (fp);
++      g_message ("Invalid or corrupted DDS header\n");
++      return GIMP_PDB_EXECUTION_ERROR;
++    }
++
+   if (hdr.pixelfmt.flags & DDPF_FOURCC)
+     {
+       /* fourcc is dXt* or rXgb */
diff --git a/meta-gnome/recipes-gimp/gimp/gimp_2.10.30.bb b/meta-gnome/recipes-gimp/gimp/gimp_2.10.30.bb
index 4d2771e551..124760651d 100644
--- a/meta-gnome/recipes-gimp/gimp/gimp_2.10.30.bb
+++ b/meta-gnome/recipes-gimp/gimp/gimp_2.10.30.bb
@@ -48,6 +48,7 @@ SRC_URI = "https://download.gimp.org/pub/${BPN}/v${SHPV}/${BP}.tar.bz2 \
            file://CVE-2022-32990-1.patch \
            file://CVE-2022-32990-2.patch \
            file://CVE-2022-32990-3.patch \
+           file://CVE-2023-44441.patch \
            "
 SRC_URI[sha256sum] = "88815daa76ed7d4277eeb353358bafa116cd2fcd2c861d95b95135c1d52b67dc"
 

