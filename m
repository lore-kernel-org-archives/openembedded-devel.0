Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32769.1793879745042799663
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Nov 2026 03:55:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=EfDNPFHF;
 spf=pass (domain: konsulko.com, ip: 209.85.128.43, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a3517554f7so14719695e9.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 05 Nov 2026 03:55:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1793879743; x=1794484543; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qEqTESoSo35FKKAPUr0NCocZbdLguLDEbQE4OhXba9E=;
        b=EfDNPFHFPRMcMOnUSVNUDjcbCmFHvwBIQ12IRx1clwDcETX6+lLclidbbMh0GuvH4X
         ZbvqUsdh9qdZ0WrR7Uw2/19GRBqCDZHNS49U/xOMNHoP7JMUDg3L+59VCdCG2XZPL5jU
         9AJ4oIDCxvfc2/BKIi+zFNJqQTKk/doKhGRHY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793879743; x=1794484543;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qEqTESoSo35FKKAPUr0NCocZbdLguLDEbQE4OhXba9E=;
        b=MLhR+ogJ9tqEXHPepe0SRusd+KVTjg2Wi24OSLaK83TzJFJ1V4jrNkGaPAHJlY1n5t
         agSBDBYOA+wnj/VaVsEMl059VvhcnkFiA2FPI+LC1yRu7u0gzuYFMZit8LC/D5y/vgqo
         v8qVxGvxnZq9YC/MsrmO4d10i3dsJ8DdfO3ycBY3rY+hrNd5Nuw/+fRdABP/uGrTB5Gc
         vH6mZFJ70bL9aO8VSav0gV+dEFOS2I1JYZ1UAg9mCZKNcabNeD/WpwN/89bXVpYYjBWf
         JbFFFrRh7mRiiW4qcJf2jg6mP1D34LwLuRFeyiVFDLrmKaETbdPSCcmKrc0lB5g1y2dE
         FM5g==
X-Gm-Message-State: APuU4Z8nB0p7JcT7EpzP1PBN/HKdKDyJnVCVWuG0fsFnUotPLq7diVu0
	UpPLbdi8UTxFC7jA4qi4VXpYN+guCWngrJoXD4fyfuP7D8+BePxSQzDw5++7XZGRE5OHN+YYrzm
	OEfoP
X-Gm-Gg: AYBFou2qMnpgOcGB2qr9DvxJC404uOksAaoCS8Vz1wYCJ+NM7/9ggu+24oDvwHjZ969
	g5FU2D/UqsgB8Td8ysczKEkzyrDN32TGyJl4oDrNFrKBpmV1G1xpkJ9uLi04UV5SyVl7UV2IXGy
	/AEL+ySzrMxg7iu3CEdO2PZPgtapR6XXZAZvn7eRAmtPWHM6l79mjMSr8zYI2ATkg+BgNN6KtuX
	ozsMwX+TGfGpIpx81DNHQIqEbCRTCgnHCqkKepr4lui1ciNAZpfDDJvQhRU0Ptz8lIBLLSNruFg
	JKkViW3cCE0EEaX5dtnENFbqR2boPvlNZhq8IRgC1bmAlV6N8p04UqpA5m2awZ88CEu5mFUgPlB
	zj9kNomzkjvWm2kMwpPo/CHVD2DugYjswGWSoWCS90ewyKP7MEFI1jNJcwmwyT9ROsoevkzaDl7
	+DDRX61RDILapil8AcRjJn4YSHPLVBEO6SN0HCC4PY9IinuJdj3sncviokpAj8E0w8qahPx247M
	QyboAg6v4es+ToyHpeT3I8Y2plhDlzHdCMUsBxFGidXjgtIdqWHRn9KUAfVCdROrmdfhBMBs2M+
	cXNDQNddNacCgjWLEKU8lcKsLBTjSfhi1euwUBzu5S7fcZdque4DwRPoJs7JXlsZXiqAz6MIVue
	+sDDPvGb6c3/XXQRvnyg6UPZpVTHfJxUJC/+EMLdHM11LzqOQcZ1C+4K2uq9iRLmbQZ5GrF0r0T
	I=
X-Received: by 2002:a05:600c:354a:b0:4a3:5aee:2c25 with SMTP id 5b1f17b1804b1-4ac181e759dmr439567595e9.31.1793879743377;
        Thu, 05 Nov 2026 03:55:43 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b4527fed5bsm173720995e9.3.2026.11.05.03.55.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 03:55:43 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 16/19] python3-svglib: Upgrade 2.3.2 -> 2.3.3
Date: Thu,  5 Nov 2026 13:55:23 +0200
Message-ID: <20261105115526.634289-16-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261105115526.634289-1-leon.anavi@konsulko.com>
References: <20261105115526.634289-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 05 Nov 2026 11:55:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131916
Content-Type: text/plain; charset="utf-8"

Upgrade to release 2.3.3:

Security:

- The limit on <use> expansions added in 2.3.1 counted expansions,
  not their size. Each expansion copies and renders the whole
  element it refers to, so a few kilobytes of nested <use> groups
  with a large group at the bottom could still take minutes and
  gigabytes to render (CWE-400, GHSA-xpfm-fw4h-qxwv, an incomplete
  fix of GHSA-555j-qj3j-c8jv). The elements copied by all
  expansions of a document, external SVGs included, are now limited
  too (MAX_USE_CLONED_ELEMENTS, 20,000); once it is spent the
  remaining <use> elements are skipped and an error is logged.
  Thanks to Adrian Korwel for the report.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-svglib_2.3.2.bb => python3-svglib_2.3.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-svglib_2.3.2.bb => python3-svglib_2.3.3.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-svglib_2.3.2.bb b/meta-python/recipes-devtools/python/python3-svglib_2.3.3.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-svglib_2.3.2.bb
rename to meta-python/recipes-devtools/python/python3-svglib_2.3.3.bb
index 9403e7d49e..9f47ffe581 100644
--- a/meta-python/recipes-devtools/python/python3-svglib_2.3.2.bb
+++ b/meta-python/recipes-devtools/python/python3-svglib_2.3.3.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=b52f2d57d10c4f7ee67a7eb9615d5d24"
 
 CVE_PRODUCT = "svglib"
 
-SRC_URI[sha256sum] = "625b62cf440ab57f5def42d5be47a0d6b73c02711ef86ab1545650a98ac1ad5f"
+SRC_URI[sha256sum] = "1aef52f3dc651416119b55716e673995d2c9f90c86a07df0b2bcf6de26c7e0ff"
 
 inherit pypi python_hatchling
 
-- 
2.47.3

