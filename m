Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6750.1793913793967425188
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Nov 2026 13:23:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=jqxb/T+X;
 spf=pass (domain: gmail.com, ip: 74.125.82.171, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-36f6295304dso296058eec.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 05 Nov 2026 13:23:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793913793; x=1794518593; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nKjBxF+AK35h11noZJavVc3x40JkfNJeUKJFg/LWTkI=;
        b=jqxb/T+XzvbvnT04LoR3AV2U/HOQai/ZljcaC+Fpxjllx916JTCmLkK/ahALrx17NO
         ahWvjUE1027Te5cw5v9n3P8yNHpcE6nlnReAsBkh4AlAbkvaz3Qs6X8Yu8I0kB2pwWIY
         tZoY2Meh68QWFIc4Mt5aEl3mcXdwDyC3s8vzaS+EABuzeDmMeejS26p8Ayjpqy/IP9Z/
         +CQDBJMNqEMEynbYfBXase8yAsO08iIWSF21eljsh9U5IOokX4fifOWFbbGZV5zI6Q65
         VNGccG5CWDY2BvZBJwnbxGMsYrvPz0L86Iz7v/k/3193ed0ATMCECr47e1TJ+FS0ClLH
         1U/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793913793; x=1794518593;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nKjBxF+AK35h11noZJavVc3x40JkfNJeUKJFg/LWTkI=;
        b=p4MSu9sUD8PSbFmepSrU6nRLX0zV1Lo+es0ji/sTchHH4Ju32J5fIVUma1hVht1Zxj
         enJArSWIEQGP48yyPpvOAkdIutdhe5P1VzjIgeeoDBPyq9g8A68EQXNavCFXJpxoMRC2
         JnYm7qQjO4uRGWADwQ+lx8u+N4Qk08QAgr1elen9Gqg4V/u+UE/6YlQRkuK/1TmM7a0f
         VgkwO74GqFHcCtfTSZmflYloYkIzJMdz0Ixiepg61aVoaapaBHCIXoWqr6FlTobSuWgQ
         kSb95QBLSS3UGE/jQEtHb4qEwi+nRjGPBGbeOlyERXhmGdeYMk4fdgP89Wzy4ntuyLDN
         iH/g==
X-Gm-Message-State: APuU4Z/SuQAaKV6zYKpF/4pSyy/zC7hZ9h/k+XJWzK6H8A5rMxFw+q/q
	Uhu1ysly2maCXqisPTdqu645ZmEGqhMjbX76X0TK2QfZ+iSfuWrkx48yfFHoSQ==
X-Gm-Gg: AYBFou0F7oDkeYBvXE5RzgQ0CGnJZaFvUkd+0RaZTwPAvE2iO1hS3gst8oc4UvyXKqW
	16uMe04+Kao3gg0DYuNNbQVa+F/YeVWMpyCutnsf8OyhDCTaWUNvR4TwT5OqAgm7rwaQwXMmwRN
	zhTspr4pYVkNAzH6UguBY1+LPR9KaGttkYXkPEBLwiHOclc2qVyPgPpaXz/zn7XdvPor7ipPZXr
	/kmIqwIAXQ+q8DryBYT5sZdT+C02xPm9OLm+DpmXieuDblrLQC0g+RhjgNviTVNaGSsE66rU8oW
	fesl9Gdtw8yjzhFoOqmjY4j/riWcbPVoQNfdasq6n18wZ6Zb7dy8cnUCBa3KKyY/0crEeKV545D
	c3Swz7rIKb3Mjln8+rNLVMsiP1Q2y6PeuKyp2RhJWeJIo4/ZBvhIYYbpsqL3SWFSBq6b+CVapRb
	2CnawxuF68sBBitZL14ey/MUOcb+GR0771iKXozfASBi23WhKhWiSDy2t0VMDfInY9C4wwck6vg
	F8iOZnhann4c2RmxTQpBSyAjwIXuARTuLaf9B9CjAFYq5e+zQ3tC48W0CSK19MaCNAN+nhexaJY
	S/xRamgwzDMnbbbUswwYjHfD2lToIz6USE5deDLoHksA6qW8VJNxVuCtfEuirQ==
X-Received: by 2002:a05:7301:da07:b0:36e:c85c:3bbc with SMTP id 5a478bee46e88-36f75254869mr504787eec.12.1793913792882;
        Thu, 05 Nov 2026 13:23:12 -0800 (PST)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36f71a25da0sm1034059eec.24.2026.11.05.13.23.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 13:23:12 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][wrynose][PATCH 9/14] libgphoto2: patch CVE-2026-120452
Date: Fri,  6 Nov 2026 10:22:45 +1300
Message-ID: <20261105212250.490188-9-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261105212250.490188-1-ankur.tyagi85@gmail.com>
References: <20261105212250.490188-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 05 Nov 2026 21:23:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131946
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-120452

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../gphoto2/libgphoto2/CVE-2026-120452.patch  | 40 +++++++++++++++++++
 .../gphoto2/libgphoto2_2.5.33.bb              |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/gphoto2/libgphoto2/CVE-2026-120452.patch

diff --git a/meta-oe/recipes-graphics/gphoto2/libgphoto2/CVE-2026-120452.patch b/meta-oe/recipes-graphics/gphoto2/libgphoto2/CVE-2026-120452.patch
new file mode 100644
index 0000000000..40db2a45bc
--- /dev/null
+++ b/meta-oe/recipes-graphics/gphoto2/libgphoto2/CVE-2026-120452.patch
@@ -0,0 +1,40 @@
+From 7a074672b3729925ee757eaafab6a30f0f4866e9 Mon Sep 17 00:00:00 2001
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
+index dff2d62..7f06a5a 100644
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
diff --git a/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.33.bb b/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.33.bb
index 5f1aba6e9c..2b633ec46c 100644
--- a/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.33.bb
+++ b/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.33.bb
@@ -22,6 +22,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/gphoto/${BP}.tar.xz;name=libgphoto2 \
            file://CVE-2026-40340.patch \
            file://CVE-2026-40341.patch \
            file://CVE-2026-120451.patch \
+           file://CVE-2026-120452.patch \
            "
 SRC_URI[libgphoto2.sha256sum] = "28825f767a85544cb58f6e15028f8e53a5bb37a62148b3f1708b524781c3bef2"
 
