Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D83CCCCA470
	for <webhook@archiver.kernel.org>; Tue,  7 Oct 2025 15:16:14 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web10.21440.1759850171744069542
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Oct 2025 08:16:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SMifI8RA;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b4f323cf89bso241273366b.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 07 Oct 2025 08:16:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759850170; x=1760454970; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=8CAlJ50upmQPfnnjNcJ2pk3TxIPtMhZ6E7ERYt9XbUY=;
        b=SMifI8RA+gk5RP/jhaO/cEMOgOgvr3fcFYiBsDvz8ylcKCXrHokf7oKF+u741kJCmr
         uP54E7LDZ2mr037wHANhwQYLp2W36gy5OzptruG8mpiVy30TMbEHimzzk1nW3o6+Dxdb
         HEJMp5Gi2TBbEJYVrGMtr/UasOVCIWKRuNONzWZc/Fjh3zoIwotDaIRE/LpWY4exC76M
         j1eA3rOeW2yK2JTZVVn6wNgcvPLCllZ+Oo4iXqQ90OmVXQf2WzFkwjthc1sOlABVs3qL
         rrKxjx2dojfKmZ9vsAlvvto65ifkAIuM+p0Sc1pNYgTywvKto8I9hNlyKCVyGvvllnvb
         EwZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759850170; x=1760454970;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8CAlJ50upmQPfnnjNcJ2pk3TxIPtMhZ6E7ERYt9XbUY=;
        b=DHWrOQTfEwN4aXV/vtNUUJOMANSB7t7F0iyHE/P97FF1X0AM+iqUpgTls9w9eXo0TP
         TmWGK8y/fd8rqSp8EIBmP2xiHbJ2tlRi2ZgmlfmqUFEvBeAgSoD1vUJdAaAPU0p9sG1A
         wnbj7RZN68KlzFnEH/vQSi80wxZ6jarhhDwlFC8DScRpadR40EJk9hF3N/xnEONR6RVB
         xcEClJHtNcJN7EPHn5ubMqyBvCnIafeOX+a6sB30yPMLgM9Y4vYOjVXUk0DzxUEXrZLE
         lcTEHsJsvBmeEKUJhKwlmXG/ztmMNZCUeaA/CLiNsmAt6Zdb/V232Zmj37gpL5SfKtsi
         kTMA==
X-Gm-Message-State: AOJu0Yzj31heT5XAW7uTucBum6yaBgs8heSR7D6MFtcrmyxHLeFBBWwn
	THLpfADu9vjbWEnMefpFDHwhirBIa/ysLsoXuYdgPNpm46bfEX1mjPTtUa82xw==
X-Gm-Gg: ASbGncvOvgLrDYy4IeBLOQ1figZpAGC7Z1UYXWr3QcWVJr8McFTqRTqodojpC9HYzG9
	rdK5kVHwDy7gdp4ZvuzYEempJBHYHAn4NdvG9Cz1m/jpSwDS9hPhPcq8qlZ4hWcKev4jXsJ8OB2
	Rl5h53uzmuQ/WgEdItlEnz/kxFGUIrN2hgfcvtcVK8nRYxrPUMQHIJSyXe6TL8a9WSraSjdHGoV
	bx3XdlZwccNVdUmjoFzm9kAF5yGOUOxFXQkHxvihgxv++iGC7J9JkF1S0X32g+cLtcooI3ey4UP
	ILH07H0nCloCuOgXiLahabK0osvAC8655NQvTTq9zCXwsNj750PYD/Aj/aO+S3T/R02KZYi7AVX
	m+ctW4aChYnaSyGgHMvK1wJ7N9V0Q+BQoFAx6anvS1wBu
X-Google-Smtp-Source: AGHT+IHXqBTOJAp4NRI4QThfzVD2uWnVOFHV08h68Oaa31pSSMbYYp6c51JPsH4o2wscx5sRCYZzzw==
X-Received: by 2002:a17:907:3daa:b0:b40:5dac:ed3f with SMTP id a640c23a62f3a-b50a9d59a8cmr966b.7.1759850169604;
        Tue, 07 Oct 2025 08:16:09 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b48652aa035sm1379392666b.15.2025.10.07.08.16.08
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 08:16:09 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] libppd: upgrade 2.0.0 -> 2.1.1
Date: Tue,  7 Oct 2025 17:16:08 +0200
Message-ID: <20251007151608.57170-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Oct 2025 15:16:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120340

This upgrade contains a fix for CVE-2024-47175.

Changelog:

2.1.1:
-pdftops: Use Poppler for a few old Epson laser printers This
 works around documents being printed off-centre, shifted towards
 the top right. Affected are printers using epsoneplijs:
 EPL-5700L, EPL-5800L, EPL-5900L, EPL-6100L, EPL-6200L.
-Fixed bugs discovered by static analyzer OpenScanHub Possible
 buffer overflows, uninitialized memory, format string issues
 and resource leaks, ...
-Fix crash bugs in ppdLoadAttributes() When parsing the
 "*cupsFilter(2): ..." lines in the PPD file use memmove() instead
 of strcpy() as the latter does not support handling overlapping
 memory portions and do not move running pointer beyond the end
 of the input string.

2.1.0:
-Prevent PPD generation based on invalid IPP response Overtaken
 from CUPS 2.x: Validate IPP attributes in PPD generator, refactor
 make-and-model code, PPDize preset and template names, quote PPD
 localized strings. Fixes CVE-2024-47175.

2.1b:
-Added support for libcups3 (libcups of CUPS 3.x) With these changes
 libcupsfilters can be built either with libcups2 (libcups of CUPS 2.x)
 or libcups3 (libcups of CUPS 3.x).
-Prefer PDF again in PPDs for driverless printers PDF works better with
 finishing, especially combinations of multiple copies, collation, and
 stapling/binding.
-Use 0.5mm as tolerance when comparing page sizes For the PWG two page
 sizes are considered the same when the dimensions differ no more than
 0.5 mm, libppd used too tight tolerances.
-PPD generator: Check for required attributes when choosing input format
 Check for PCLm and PWG the minimum of attributes which we require
 during PPD generation.
-ppdLoadAttributes(): Improve check whether parameters are integer
-ppdLoadAttributes(): Fix crash when page size could not get determined
-Fix crash if there is no page size for "Custom"
-Fix crash when incoming *ptr is NULL
-libcups2 compatibility: Use proper CUPS array callback function types
 Fixed CUPS array function call in libcups2 compatibility layer
-Build system: Fix failure to correctly link to zlib Look up zlib
 properly with pkg-config

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../recipes-printing/cups/{libppd_2.0.0.bb => libppd_2.1.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-printing/cups/{libppd_2.0.0.bb => libppd_2.1.1.bb} (82%)

diff --git a/meta-oe/recipes-printing/cups/libppd_2.0.0.bb b/meta-oe/recipes-printing/cups/libppd_2.1.1.bb
similarity index 82%
rename from meta-oe/recipes-printing/cups/libppd_2.0.0.bb
rename to meta-oe/recipes-printing/cups/libppd_2.1.1.bb
index 99b1f6e730..1b7d2be844 100644
--- a/meta-oe/recipes-printing/cups/libppd_2.0.0.bb
+++ b/meta-oe/recipes-printing/cups/libppd_2.1.1.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c1fca671047153ce6825c4ab06f2ab49"
 DEPENDS = "libcupsfilters"
 
 SRC_URI = "https://github.com/OpenPrinting/${BPN}/releases/download/${PV}/${BP}.tar.xz"
-SRC_URI[sha256sum] = "882d3c659a336e91559de8f3c76fc26197fe6e5539d9b484a596e29a5a4e0bc8"
+SRC_URI[sha256sum] = "3fa341cc03964046d2bf6b161d80c1b4b2e20609f38d860bcaa11cb70c1285e4"
 
 inherit autotools gettext pkgconfig github-releases
 

