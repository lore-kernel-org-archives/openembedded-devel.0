Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52F5BC9832A
	for <webhook@archiver.kernel.org>; Tue, 29 Sep 2026 07:08:04 +0000 (UTC)
Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2365.1790665679862805822
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 29 Sep 2026 00:08:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=FIHg8JMd;
 spf=pass (domain: gmail.com, ip: 74.125.225.140, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ffb83bf7aso22728225e9.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 29 Sep 2026 00:07:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790665678; x=1791270478; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KOuSckK61ukQyR44p2EilK105ECSZEv8EBPyUNi8bjc=;
        b=FIHg8JMdMdeVEDajOtWFvjRGt1OiAmiZkQfaMUiIoJUowNop5KJGM5WdXdFaAZH8ZQ
         rEUEeomou4kh89at7O7yqAvkM0zlujdWPlek//zkWFT3NxgY61PX8CtciEMf5kRo6aWB
         Yy9CaEwJuMmYC4mV0r3vOksEQuGvoiOSRBWpNgcbLPXH+Bj4RHACJH+sdR8itzYpgS0z
         oPlX/SB1v/oRA/sR3spri8NNWHbhKS2OdVVsiSEYRaFfh1I5qUQ9IrDCxONgi494KHwN
         tuy1fYKvZLAXb3eu3PJPg/rbMgHXBtkHtr/wzxpFNSNgCEpgf1BiklCWVVLpomiG42I7
         4jpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790665678; x=1791270478;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KOuSckK61ukQyR44p2EilK105ECSZEv8EBPyUNi8bjc=;
        b=JgyzeYj/qbq6TK693iolpsQPKkP8hbZQjoHbQmCmRh8IsApInQNjF5EmFz53Lw32r3
         pcSrF9YmgP4ko1Dp2tqlR7rJ2DfALCFk0qVIaYqVQxF6TUziM4VT57JA4T+D5lUbgKVh
         53U0pCoqCFw5lBzAPl8DKeYfl+gXE8SMvXH1djiOJHMK9kxB4o7okf2O3YBCtZBCSd3u
         d/DiYo7TRNYblpzNn7UBSSpiFZvVTpLj7vZPf+++gIqh1aOe/wdlKJOdIePtZMTOLoL0
         31Gtsx9AAi18T3EA7AeQH5awtKdrLte1aUj6WbpTRvTGoIIn3oJjErwcv+KmWiq54ZXj
         xZlA==
X-Gm-Message-State: AFuF++nXmdRbxwHwUd5sf4W4pipb6zrC/eT55dU/9nmJkfr6GGHY3ISf
	qgYqwxuVXdBv0Y02PI3FWACRgKg5+05QsvqLExar2eNDypiFPZm/9JZC+VKyHw==
X-Gm-Gg: AYBFou2cfgcHe6Im5fUd9ImBHXF+IekC6Ipvw5i0AnPtjiBgOois8HicUENX2gjvsRU
	T1LWbu5dsmlP6B5+YqHyyxKAcPT9pFiqi02A8PgLC4nqBmsg0Fu27UEzAn8vYxHJQ47AON7A127
	TWEYi13DNdT5dQ92ww2qxv5xktnnLYAiynKJCy6EsS675pZZMD+24upi+Fw0Hjfg2GyizPopr+Z
	8mXdwjYEUbdDRNNnBlUZXnvmGedm4rA72xQ3RcvCPh27nDs78SS819pZAsg+gb+hqv/eYqzJ4bv
	szCDtHAt/xHTIFcaNzaJEHI4qrQl66Df9zfkgq0LsNdRY5pfRGRWv6y1/WVOZZIJ5UaCfwa1xcL
	CVOGYIsHxlEm4PlKzlGmCLE8EvBGhQOmO6PjVsQIXhHpE8crDrdZtZVqD9gTR/yZWlTzTGoqB4D
	InqgxFFYZ9N/KSkn/nWGTZYqzBVnstSkrpvSuhCt1xGXqH+bD/iAWumyv30GyZX3qWYCIpnX+7M
	sAMz8D2HojHrbkZvQnY0ZbDNv/1ucBFkV3AQqg7nxNB/zGMBoM/NBTjaw==
X-Received: by 2002:a05:600c:8b8b:b0:49c:f512:2361 with SMTP id 5b1f17b1804b1-49fe66d470emr257474745e9.14.1790665677960;
        Tue, 29 Sep 2026 00:07:57 -0700 (PDT)
Received: from localhost.localdomain (cust18-dsl93-89-130.idnet.net. [93.89.130.18])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00cfe13a1sm53918115e9.5.2026.09.29.00.07.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 00:07:55 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [meta-python][PATCH 3/3] python3-ping3: add recipe
Date: Tue, 29 Sep 2026 08:07:16 +0100
Message-ID: <20260929070713.2220524-6-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260929070713.2220524-2-alex.kiernan@gmail.com>
References: <20260929070713.2220524-2-alex.kiernan@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 29 Sep 2026 07:08:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130474

Pure Python ICMP ping.

AI-Generated: Claude Opus 5 (Claude Code)
Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---
 .../packagegroups/packagegroup-meta-python.bb     |  1 +
 .../python/python3-ping3_5.1.5.bb                 | 15 +++++++++++++++
 2 files changed, 16 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-ping3_5.1.5.bb

diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
index f84941daf08b..a59249d6054e 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -279,6 +279,7 @@ RDEPENDS:packagegroup-meta-python3 = "\
     python3-pid \
     python3-pika \
     python3-pillow \
+    python3-ping3 \
     python3-pint \
     python3-pkcs11 \
     python3-pkgconfig \
diff --git a/meta-python/recipes-devtools/python/python3-ping3_5.1.5.bb b/meta-python/recipes-devtools/python/python3-ping3_5.1.5.bb
new file mode 100644
index 000000000000..84ac72c27c1e
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-ping3_5.1.5.bb
@@ -0,0 +1,15 @@
+SUMMARY = "ICMP ping in pure Python"
+HOMEPAGE = "https://github.com/kyan001/ping3"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=3ae28ad230db5766d33276b580887102"
+
+DEPENDS += "python3-wheel-native"
+
+SRC_URI[sha256sum] = "6c99bc844e0b7dbc5c9765e8b530140daf1ccd2112c99db01ab79831bd8081cd"
+
+inherit pypi python_setuptools_build_meta
+
+RDEPENDS:${PN} += "\
+    python3-io \
+    python3-logging \
+"

