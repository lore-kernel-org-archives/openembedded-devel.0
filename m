Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BD47FCA16E
	for <webhook@archiver.kernel.org>; Mon,  9 Mar 2026 18:21:09 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21688.1773080466608178962
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Mar 2026 11:21:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=U2hBhW8R;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4852f73d0a3so18989985e9.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 09 Mar 2026 11:21:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773080465; x=1773685265; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZdBJrx9AP5UQtORn20dxTi5Mb2FPpGJ2FkscpxJhRMg=;
        b=U2hBhW8RpWUWaeP1YAR050MeUSOOuDrMflsF6kjgID1771H483j9pifuG5wZ5ar1hm
         7SukpNyNwP00QXA+uyjMO4a1i/q0pPhwnvEJw/bRIAcoETniOXl25oQDXGi4VxgkGdBx
         3I8E/Rs32Jh381c5l69Bx8aCRT43PGzd/7nteSxUomAPUaRmm0jDOocd9lJaCxU3OJBv
         x1EHrepPMnL27FnlcSGerJ+9BXmlVKEYYFRZIaXIboOXkp5S8MPsBXNM99eyKp9gvbiF
         u1TPpoDdNbHqpg7S+YqYZ4v5WsyvYSxaozbRHVD/yqdTPPdeUHxF3lqw0Sl8s1Z8Ww5q
         K0lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773080465; x=1773685265;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZdBJrx9AP5UQtORn20dxTi5Mb2FPpGJ2FkscpxJhRMg=;
        b=SVZUT8is/gHb62IroWzlS5tT69wJ5tTx7m2+P00iM3kwAUq4Z29gqkFZpWWbMjHtFd
         RaviBqGN4E2b59SNVmBYBJTp5rnzIue/Uoxku7vEKWMBptml0ACCLrxEw3+skQKbIFK5
         ZvHhk34HyXBPFzbwnCvLSjrqutLMvCrCd89ljS33tHgphamuUnuxN0EKsfljuO4pq2o8
         cKXEXk5VYEy37YuD54ygRmBiEZMlpPqCgh9A9NIFrQDjv5+9SV16XOFfg/7QM0MLtkfl
         U9rhh2Mj7UuqehMBHjyl7s9XWGUmnSFPuDICVfJCSf9e7CD4rv6YJHa9yR+txMr7Nce+
         3NDg==
X-Gm-Message-State: AOJu0YyL6Fs29Ix8+6F7Q2C3NWqwZlIsQDAq+RBgarAP3mgoV/FNYv50
	DLH92AosImdiqNLvXtbLQO21gKuTrx7I6XD+aReA3jt1dvXRMfqOA/L1UycXFg==
X-Gm-Gg: ATEYQzwzpmHzNXaySu5+MTfmwK/TlZh+O2TsARx8WFukTrmXvwb/0gTV+JshC/T27NE
	UjNh9xpoWynLNX8Ckcx2C7JgLp0ndF4PuYfqu0T1gv4bs+ARDrXTxjAgThJwxPdT7r2qG7OpupB
	iiHlnai9Kq8OHXNmDJmKLauwNHt5WGv5G38fBY546WWZT0xe/JKHev0j4CYGUWnOBYm1iN/lycg
	++CvtPheOv9xdP6kaldip8pzRCWXw0fy1wjJ6Gsl45r//KU75lDuky7lo55yGhqZ9uV6e0MPTG1
	SJLt0KE+kvwFaHHD0yPrDMiPHppTS24WdnBJoMWKiImNjOZJCte2PLmJd2sK+TBtUXuZe7sn3QU
	z/VN0WOyE+YNKFAr56DFQyfo64OYg7DFT0R5UFqK5BE6N3dwiZCHhwkiGh1Y3wm2a2zXYYeh6vw
	dCN4M9cpNTn+14Qczdotny6/WAMDEcwi8=
X-Received: by 2002:a05:600c:1f0f:b0:483:703e:4ad5 with SMTP id 5b1f17b1804b1-48526967cd9mr198728375e9.22.1773080464837;
        Mon, 09 Mar 2026 11:21:04 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541aba60esm9379875e9.5.2026.03.09.11.21.02
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 11:21:02 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][kirkstone][PATCH 3/3] gimp: patch CVE-2023-44443 and CVE-2023-44444
Date: Mon,  9 Mar 2026 19:21:00 +0100
Message-ID: <20260309182100.717697-3-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260309182100.717697-1-skandigraun@gmail.com>
References: <20260309182100.717697-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 09 Mar 2026 18:21:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125004

Details: https://nvd.nist.gov/vuln/detail/CVE-2023-44443
https://nvd.nist.gov/vuln/detail/CVE-2023-44444

The relevant upstream issues:
https://gitlab.gnome.org/GNOME/gimp/-/issues/10072
https://gitlab.gnome.org/GNOME/gimp/-/issues/10071

For the backport, upstream has merged the two patches
into one, solving both CVEs. That patch is in this change.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../gimp/CVE-2023-44443_CVE-2023-44444.patch  | 47 +++++++++++++++++++
 meta-gnome/recipes-gimp/gimp/gimp_2.10.30.bb  |  1 +
 2 files changed, 48 insertions(+)
 create mode 100644 meta-gnome/recipes-gimp/gimp/gimp/CVE-2023-44443_CVE-2023-44444.patch

diff --git a/meta-gnome/recipes-gimp/gimp/gimp/CVE-2023-44443_CVE-2023-44444.patch b/meta-gnome/recipes-gimp/gimp/gimp/CVE-2023-44443_CVE-2023-44444.patch
new file mode 100644
index 0000000000..c92aaa24a9
--- /dev/null
+++ b/meta-gnome/recipes-gimp/gimp/gimp/CVE-2023-44443_CVE-2023-44444.patch
@@ -0,0 +1,47 @@
+From 8a8c3fe7cdb498d05d8e61e6b0f36d9a314caa62 Mon Sep 17 00:00:00 2001
+From: Alx Sa <cmyk.student@gmail.com>
+Date: Sat, 23 Sep 2023 20:40:18 +0000
+Subject: [PATCH] plug-ins: Fix vulnerabilities in file-psp
+
+Backports commits e1bfd871 and 96f536a3
+from master
+
+CVE: CVE-2023-44443 CVE-2023-44444
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/gimp/-/commit/ef12c0a90752a06d4c465a768d052b07f5e8a8a0]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ plug-ins/common/file-psp.c | 13 +++++++++++--
+ 1 file changed, 11 insertions(+), 2 deletions(-)
+
+diff --git a/plug-ins/common/file-psp.c b/plug-ins/common/file-psp.c
+index c0f3480..6a6b93d 100644
+--- a/plug-ins/common/file-psp.c
++++ b/plug-ins/common/file-psp.c
+@@ -1128,8 +1128,17 @@ read_color_block (FILE      *f,
+     }
+ 
+   color_palette_entries = GUINT32_FROM_LE (entry_count);
++  /* TODO: GIMP currently only supports a maximum of 256 colors
++   * in an indexed image. If this changes, we can change this check */
++  if (color_palette_entries > 256)
++    {
++      g_set_error (error, G_FILE_ERROR, G_FILE_ERROR_FAILED,
++                   _("Error: Unsupported palette size"));
++      return -1;
++    }
++
+   /* psp color palette entries are stored as RGBA so 4 bytes per entry
+-     where the fourth bytes is always zero */
++   * where the fourth bytes is always zero */
+   pal_size = color_palette_entries * 4;
+   color_palette = g_malloc (pal_size);
+   if (fread (color_palette, pal_size, 1, f) < 1)
+@@ -1498,7 +1507,7 @@ read_channel_data (FILE        *f,
+         else
+           endq = q + line_width * height;
+ 
+-        buf = g_malloc (127);
++        buf = g_malloc (128);
+         while (q < endq)
+           {
+             fread (&runcount, 1, 1, f);
diff --git a/meta-gnome/recipes-gimp/gimp/gimp_2.10.30.bb b/meta-gnome/recipes-gimp/gimp/gimp_2.10.30.bb
index ff34bfa6fd..07c9fcf666 100644
--- a/meta-gnome/recipes-gimp/gimp/gimp_2.10.30.bb
+++ b/meta-gnome/recipes-gimp/gimp/gimp_2.10.30.bb
@@ -50,6 +50,7 @@ SRC_URI = "https://download.gimp.org/pub/${BPN}/v${SHPV}/${BP}.tar.bz2 \
            file://CVE-2022-32990-3.patch \
            file://CVE-2023-44441.patch \
            file://CVE-2023-44442.patch \
+           file://CVE-2023-44443_CVE-2023-44444.patch \
            "
 SRC_URI[sha256sum] = "88815daa76ed7d4277eeb353358bafa116cd2fcd2c861d95b95135c1d52b67dc"
 

