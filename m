Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B9BDE7AD52
	for <webhook@archiver.kernel.org>; Thu, 25 Dec 2025 12:51:50 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.138122.1766667105647651410
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Dec 2025 04:51:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XmbbsgYA;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-42fbad1fa90so5753965f8f.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 25 Dec 2025 04:51:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766667104; x=1767271904; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wi4eDlQ2kZ1ACt53S8JvKfYBEY0Rw7CI8KefhKsa/hQ=;
        b=XmbbsgYA8fkLUH9y86JrZYdDlqEnINvrMteiaQj6BBHgT96aZjM5seQdYHWOmp6Qd6
         4Cw2Z7WgZ4IIpr4RmpD+xxQhEnMIHqaEopNWUQuptQAZbrrKWpW/Uv1ytBhq3MrTd6WR
         +L4CgFtYbqxeZBGlVw0Eko72hKRKrVJXwocUO+c5knT7E4CyG8EwKzzA5KXqf1eLcqsN
         RHPAzHLwH0R0gN4JQjxp6ImpFC5U8pWNe8HiW4Y/cYhnM06NVvuCgoORXP2pv+RBzYwZ
         MBq1KYUkUyWDxzfh/u6l28uXwzTOfAHfcx3AU4b0ComPFr0cI5JAI09GAmUIBCDA/fel
         YjEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766667104; x=1767271904;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wi4eDlQ2kZ1ACt53S8JvKfYBEY0Rw7CI8KefhKsa/hQ=;
        b=CwFRN/0fha0wb21L2drZ8UB1fKarb+K3M+bos/ph2NZE5wCGoZiFqQsu3qCMe9igpX
         BixequSidbXiKTdRovdn9PVWa2fNkSocOtF32nqbEcJ/Q90oJ6mHlaOKCZLeiAoiiFAm
         NXk6ZE1m69w/imTRYdY/u0pj95q0gOppnJTEy75AANImA9GQZvoU0yg8ZAmbhCJd09sz
         BNkC7VkS9KLesf/KnliyNvKHkb7Lb5Dd/HY0pjeW3umMAtZnQWi5XHUlh+R4N3bMATs9
         dysbE7vgBYdPWM7/PShL0Y5m3Tpyrq54zZIKxex18/PtN4ShHof4I/DRCsxzfqkyefje
         ixVQ==
X-Gm-Message-State: AOJu0Yz1cA75dbRASEV6dl80uQrCUQPbvpydUleYG72nNhudXLQXVE4P
	xqP/N/lo1cKdr4f/X+KqUV1IGlnECY3tGFlpkQ2szGyVaiirbTL5p2tOuVRYTQ==
X-Gm-Gg: AY/fxX5zKiteUcwUYFqKCM+Icb/CcT+t01CoIMT6cZi0+482KUFgI4oNXZHCoTSrJue
	wct/gB4Ay8pAJrhOJpD28m6TjfIDZaDgli8qBEEm5a54EFTxoMrBbo1aVnGQe2EerYcEf4Fj8BV
	8swifrPF9g79v0mXZFY4vrPVRonmXQU+h6jczs4CjXl9IoVz94bgHBb3RNBvOFr4XC8ciQdyYLp
	9gs7KoGwYsl1pTtJEFfkJmC3TTAgIHNLoTVBTyXzcmbHi/Ao/n9YM+5rZXRJwwQq8plrop0suyv
	eA5LaiuxyNZFYNgynyYqUFLYb5llNpbO7VMmevzSO2nz/yVCvLHmYbYHLcIChvdYu5p95XXPhf1
	eOE3KiUxZpTzHvdH67WeAB4nvLTZJqeR/hdimo2giQIB+g9egvhPpQtL2P923Z1xMrZs1+JTGP+
	YzgVGR/0nFo98ZF6Yeip4=
X-Google-Smtp-Source: AGHT+IFy8o5c6aeCBWgMh2wSOTlUnNDRvMuwMjte2yvnEwsnYrVdJ3CeBB59NSFDkLgIDqmBrJfRTw==
X-Received: by 2002:a05:6000:2204:b0:431:66a:cbc3 with SMTP id ffacd0b85a97d-4324e4c127amr19837550f8f.6.1766667103789;
        Thu, 25 Dec 2025 04:51:43 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea830fesm40219073f8f.20.2025.12.25.04.51.43
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Dec 2025 04:51:43 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 6/8] cups-filters: patch CVE-2025-64524
Date: Thu, 25 Dec 2025 13:51:37 +0100
Message-ID: <20251225125139.2436941-6-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251225125139.2436941-1-skandigraun@gmail.com>
References: <20251225125139.2436941-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 Dec 2025 12:51:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122918

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-64524

Pick the patch referenced by the nvd report.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../recipes-printing/cups/cups-filters.inc    |  1 +
 .../cups/cups-filters/CVE-2025-64524.patch    | 81 +++++++++++++++++++
 2 files changed, 82 insertions(+)
 create mode 100644 meta-oe/recipes-printing/cups/cups-filters/CVE-2025-64524.patch

diff --git a/meta-oe/recipes-printing/cups/cups-filters.inc b/meta-oe/recipes-printing/cups/cups-filters.inc
index 26a7c5037a..fe87ac98ae 100644
--- a/meta-oe/recipes-printing/cups/cups-filters.inc
+++ b/meta-oe/recipes-printing/cups/cups-filters.inc
@@ -11,6 +11,7 @@ DEPENDS:class-native = "poppler-native glib-2.0-native dbus-native pkgconfig-nat
 
 SRC_URI = "http://openprinting.org/download/cups-filters/cups-filters-${PV}.tar.gz \
            file://CVE-2025-57812.patch \
+           file://CVE-2025-64524.patch \
            "
 
 inherit autotools-brokensep gettext pkgconfig
diff --git a/meta-oe/recipes-printing/cups/cups-filters/CVE-2025-64524.patch b/meta-oe/recipes-printing/cups/cups-filters/CVE-2025-64524.patch
new file mode 100644
index 0000000000..f3481ddaa5
--- /dev/null
+++ b/meta-oe/recipes-printing/cups/cups-filters/CVE-2025-64524.patch
@@ -0,0 +1,81 @@
+From 3f24ec5518f3f7f9a7020cd88bb9bbf4e81475fe Mon Sep 17 00:00:00 2001
+From: Zdenek Dohnal <zdohnal@redhat.com>
+Date: Wed, 12 Nov 2025 15:47:24 +0100
+Subject: [PATCH] rastertopclx.c: Fix infinite loop caused by crafted file
+
+Infinite loop happened because of crafted input raster file, which led
+into heap buffer overflow of `CompressBuf` array.
+
+Based on comments there should be always some `count` when compressing
+the data, and processing of crafted file ended with offset and count
+being 0.
+
+Fixes CVE-2025-64524
+
+CVE: CVE-2025-64524
+Upstream-Status: Backport [https://github.com/OpenPrinting/cups-filters/commit/956283c74a34ae924266a2a63f8e5f529a1abd06]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ filter/rastertopclx.c | 26 ++++++++++++++++++++++++--
+ 1 file changed, 24 insertions(+), 2 deletions(-)
+
+diff --git a/filter/rastertopclx.c b/filter/rastertopclx.c
+index 3e7c129..b20d195 100644
+--- a/filter/rastertopclx.c
++++ b/filter/rastertopclx.c
+@@ -818,10 +818,10 @@ StartPage(ppd_file_t         *ppd,	/* I - PPD file */
+   }
+ 
+   if (header->cupsCompression)
+-    CompBuffer = malloc(DotBufferSize * 4);
++    CompBuffer = calloc(DotBufferSize * 4, sizeof(unsigned char));
+ 
+   if (header->cupsCompression >= 3)
+-    SeedBuffer = malloc(DotBufferSize);
++    SeedBuffer = calloc(DotBufferSize, sizeof(unsigned char));
+ 
+   SeedInvalid = 1;
+ 
+@@ -1152,6 +1152,14 @@ CompressData(unsigned char *line,	/* I - Data to compress */
+               seed ++;
+               count ++;
+             }
++
++           //
++           // Bail out if we don't have count to compress
++           //
++
++           if (count == 0)
++             break;
++
+ 	  }
+ 
+          /*
+@@ -1245,6 +1253,13 @@ CompressData(unsigned char *line,	/* I - Data to compress */
+ 
+             count = line_ptr - start;
+ 
++           //
++           // Bail out if we don't have count to compress
++           //
++
++           if (count == 0)
++             break;
++
+ #if 0
+             fprintf(stderr, "DEBUG: offset=%d, count=%d, comp_ptr=%p(%d of %d)...\n",
+ 	            offset, count, comp_ptr, comp_ptr - CompBuffer,
+@@ -1416,6 +1431,13 @@ CompressData(unsigned char *line,	/* I - Data to compress */
+ 
+             count = (line_ptr - start) / 3;
+ 
++           //
++           // Bail out if we don't have count to compress
++           //
++
++           if (count == 0)
++             break;
++
+            /*
+             * Place mode 10 compression data in the buffer; each sequence
+ 	    * starts with a command byte that looks like:

