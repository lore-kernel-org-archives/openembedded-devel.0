Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5094.1793909176563863839
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Nov 2026 12:06:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=DOx9g4Jp;
 spf=pass (domain: gmail.com, ip: 74.125.82.52, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-15ea896ddc8so3844520c88.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 05 Nov 2026 12:06:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793909176; x=1794513976; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EXDnuMmr3y9gcVgM0wnWPHDyc1JKSKw03AUnG1TJRpw=;
        b=DOx9g4JpMyGYN+e8LTD4VhoM5NcZyzBJiH6MB4t0+CgQUnSnxHB7Kw8BjySrFDYZVz
         7GzS89FS68q3x2DbDqEeoO1eTMZx/0QXzh1v3Wv5f1vpmbL4caMLDbz1XNGhb/AuTHXp
         nWJqdrO9TR8mY/x4GR86vM9Yi59eO5peae2sM4CmOlCNJ2bapSjIC8r0neQDJdyFz5hL
         Cg7ej+jPUxGt4/3IeKfHlCzuNjMR8ETO0lYypk7ZOTRP6hlzaQMptV90JxV4a4H9K+B/
         uHlz7jJgViUc99QGBJtFCFr8g5gjfxVpd7wGQHy8xiLOp7O2Q0/YhGcWvfZ9+6QcNRWI
         kZAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793909176; x=1794513976;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EXDnuMmr3y9gcVgM0wnWPHDyc1JKSKw03AUnG1TJRpw=;
        b=ZMgmgT+Rv0882iwVz57UVy7Zd8olLFptXBSFcCklxw/DSteVzvAmtEBmn5D6B1IFyK
         C7zPfu06ZqlnWKQHs62bBdwhYYUfZz3GX1hxbG/oFFvsJuhdyOOgPTZPLGOY+uQfTO20
         9s7+LhcIN1oenVvOMFrETVUp3C7LTdhf7xsG0nVmuYjhIrA9LVI5roVleIVRfpXinvQI
         kwi4S2fApMFlzrsDAXOhpqaN1CjxTIBF2qhXh3iaxYTusl0aceg/QyY9vCEnyVUyX8Wk
         aBohwwZVTSevY7Ua1+vvPoKN2rMUxLhQTf1+F2tBJjifcj21QqADEbById/jbIQyOoYO
         TVaw==
X-Gm-Message-State: APuU4Z89pJb7j7n/j+kdhw1vmyCDxJUWHJJ1zw5WDRyxBBh3vebS+iml
	XhK4LG0yVNcPA4Nff8wBY6w73bdoE/GK9yw6OdGLbg1GJo5M3d9SNcxg3D/Hvg==
X-Gm-Gg: AYBFou2vZUmLAaGiWNfphwoqUisFTfeGc1epFDquQqn5bHIe66BczdvFLibx0JIiYQX
	Czt8Ii506ntnPn+ZIxwXtaNsvHkfnwI6o7QbOnZKf0TK19QKy34rWSW15dqYMChl1yRsQ7R3evf
	bT2ORwXxiANbiaogiRZsX1DFGnQD2K5MN63h6jcjxK8J9ziBSPwY7idIQ9f4dNXlstZo8KPT7yS
	+WyvSzSgqRlRZDZAH0KKDpdufsynTfRlR3qNul/PTQKltLW+NZBRbRoFfKyWdcIMHU1Y5P6H5nj
	x/9ACToMHEg8PgPXZKn6WCGuU+hB36Y9gRIkgg9TI1iGCQF8QsIb3GwVjCHO1o51DJgLnJc+sE/
	hQZUsoEvwDyhIh13fdg4zwWA54/SjaHryUOsRfZVW6hTfuKlkCj7rtKwdJ7iVTGkJJrhepS1srI
	fF8WHPbiF6FDt8Tl4vdzQTHVNqJzYH9rPJ+L33lIRUdwjsgpjqi5Q/U0UXCb3WBk/sr7/yWQ1Gq
	WsqZaDDvL2Q7rEW++wCXxwwETXOtowsCil2mtkvYqdypuBn+/leJnR0c4byfCg0uGRamVRqIQU9
	G3y6OmkBfe/HbriFisKfkErS7J9PBJl8noxV16IQaMRhNPL80OqgjAPIVQ7+gg==
X-Received: by 2002:a05:7022:f508:b0:143:54c6:6a5 with SMTP id a92af1059eb24-1b25d3303c7mr55771c88.37.1793909175492;
        Thu, 05 Nov 2026 12:06:15 -0800 (PST)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c772fdsm21837691c88.22.2026.11.05.12.06.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 12:06:14 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 9/9] libgphoto2: patch CVE-2026-120452
Date: Fri,  6 Nov 2026 09:05:52 +1300
Message-ID: <20261105200552.81303-9-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261105200552.81303-1-ankur.tyagi85@gmail.com>
References: <20261105200552.81303-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 05 Nov 2026 20:06:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131937
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-120452

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../gphoto2/libgphoto2/CVE-2026-120452.patch  | 40 +++++++++++++++++++
 .../gphoto2/libgphoto2_2.5.34.bb              |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/gphoto2/libgphoto2/CVE-2026-120452.patch

diff --git a/meta-oe/recipes-graphics/gphoto2/libgphoto2/CVE-2026-120452.patch b/meta-oe/recipes-graphics/gphoto2/libgphoto2/CVE-2026-120452.patch
new file mode 100644
index 0000000000..97e2318cbd
--- /dev/null
+++ b/meta-oe/recipes-graphics/gphoto2/libgphoto2/CVE-2026-120452.patch
@@ -0,0 +1,40 @@
+From 9fe9a565d4755d99255e34384bbb19f2a439b242 Mon Sep 17 00:00:00 2001
+From: TheProtagonist07 <63047129+TheProtagonist07@users.noreply.github.com>
+Date: Wed, 28 Oct 2026 19:19:32 +0530
+Subject: [PATCH] jl2005c: bound thumbnail conversion by the real input length
+
+jl2005bcd_decompress() picks thumbnail_width/height from a device header
+byte and then byte-swaps that many RGB565 samples starting at input+16.
+When the device claims a 128x120 thumbnail but the input buffer is smaller,
+the loop reads and writes about 30 KB past the heap buffer.
+
+Reject the conversion with GP_ERROR_CORRUPTED_DATA when the input is too
+small. Addresses finding 3 of #1326.
+
+(cherry picked from commit 30bf7ace6d47cfe1232ea73bde2aceb95aba4bfb)
+
+CVE: CVE-2026-120452
+Upstream-Status: Backport [https://github.com/gphoto/libgphoto2/commit/30bf7ace6d47cfe1232ea73bde2aceb95aba4bfb]
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ camlibs/jl2005c/jl2005bcd_decompress.c | 7 +++++++
+ 1 file changed, 7 insertions(+)
+
+diff --git a/camlibs/jl2005c/jl2005bcd_decompress.c b/camlibs/jl2005c/jl2005bcd_decompress.c
+index 8c3307fd6..1c8a73c5b 100644
+--- a/camlibs/jl2005c/jl2005bcd_decompress.c
++++ b/camlibs/jl2005c/jl2005bcd_decompress.c
+@@ -123,6 +123,13 @@ jl2005bcd_decompress (unsigned char *output, unsigned char *input,
+ 			GP_DEBUG("No thumbnail is present!\n");
+ 			return GP_ERROR_NOT_SUPPORTED;
+ 		} else {
++			/* thumbnail_width/height come from a device header byte; the
++			 * RGB565 payload that follows the 16-byte header must actually
++			 * be large enough for that many samples. */
++			if (inputsize < 16 + 2 * thumbnail_width * thumbnail_height) {
++				GP_DEBUG("thumbnail larger than input\n");
++				return GP_ERROR_CORRUPTED_DATA;
++			}
+ 			out = malloc(thumbnail_width * thumbnail_height * 3);
+ 			thumb = (uint16_t *)(input + 16);
+ 			for (i = 0; i < thumbnail_width * thumbnail_height;
diff --git a/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.34.bb b/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.34.bb
index 488364b542..d8cf86ade2 100644
--- a/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.34.bb
+++ b/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.34.bb
@@ -13,6 +13,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/gphoto/${BP}.tar.xz;name=libgphoto2 \
            file://40-libgphoto2.rules \
            file://0001-configure-Filter-out-buildpaths-from-CC.patch \
            file://CVE-2026-120451.patch \
+           file://CVE-2026-120452.patch \
            "
 SRC_URI[libgphoto2.sha256sum] = "51993f5d9bfb6b4e5925cbbe5883085791bff6f81bcacb8ffe1b783ce76d586a"
 
