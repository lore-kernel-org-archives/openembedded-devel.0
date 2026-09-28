Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3454ACA5FA5
	for <webhook@archiver.kernel.org>; Mon, 28 Sep 2026 00:03:26 +0000 (UTC)
Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.46613.1790553797942872919
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Sep 2026 17:03:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=PH5koz69;
 spf=pass (domain: gmail.com, ip: 74.125.227.141, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d747ee1f38so10206575ad.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 27 Sep 2026 17:03:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790553797; x=1791158597; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dVEkpJvJ4DpqVBOyxnIeCpBBoqnFztCKN9as/8XTuEM=;
        b=PH5koz69FYE2MEPT+kLTZr4PWpdLXHUU/GVzWUCVUIIqpr/pjSrZMLkzUmuc7aqhfF
         D2e5ilW00HK8RyrM8BJwBq1W1NmfnzEpv++E4q8STwfKNcXuYIBh0OVX+ihyHCe90X3r
         ih9ZLEXvmTbxyl9+4hArggeINAE8efK9JNyq30R5NJ9Yb8UrdWhhfHNLtxuP0m4pjkOe
         wxORbawM4ppnWB9SCYU/je++AZDcwR3/GijfRH93+/HQBuW1IH9tG8fIVRDD6XscO5YK
         0wBDQwAs5lhGHy7BaPYVrgzQZwM9intrAT42y1oAKlb6BhrMP4QF2NETTosuCX1gA/t3
         DjPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790553797; x=1791158597;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dVEkpJvJ4DpqVBOyxnIeCpBBoqnFztCKN9as/8XTuEM=;
        b=YFuUnTB6RbLaD4chqLphw/TpT5wvlsSItGT/VLTXl8KFuGKpIYf65wbKp/f+u/BwN2
         q4mcOwDNpzpe84VpYz6ftWddg11BQ+XUmV0UTtCM2MKlYVYsRL223E/D0za0mcajDk4u
         YwmCe33AzyY8aCsH0Pa677aIlUHwgOXo3o4WZfXvcxNG/nlIfRHpEy7Cp0kGJQ2qloz9
         M7Z9wHVICCQC6MfHTw7xcFyabpUysAm2d26lDYNefZ7d6Tli7N4HrTOkzp9jyIUCEfQr
         /1hF5BTzBsRePmj3F/Gv1sgPQSGPxQsKdxZhTc9iNHLEXgpPP8KxMRUpMwtgZX/PHynb
         UbhQ==
X-Gm-Message-State: AFq9FYLlfzvhmqZibLAwPd8nXA00qagxDnhKbU3gUpSVGo9ND2Aao47/
	DqPQlIM0uPMSwvfcXMxau2vkycbxqOpeNcXgD2ZUdYy9uX9dl9nmUEFE4tqKaw==
X-Gm-Gg: AYBFou2r9HLzgYBAKzNuk7nK2/KcgRtGWFqyrRjlGDdpxP59BcfZResjsE1R0ekdIt4
	oZU6K688d96CXArwCSDn68sTcQltu1Ki2AIm2fKue8NOapGCuSzMhu5tGgTwJSZUQk+zUILxJc9
	yFioasb8dWVy7M9fYSf2IgTkjVsBuod3H7BzNW/1h1j65Q7X1Sw3AV+gUZRAOy8iajiydilCLwq
	VPmjnWRl21atUAhJqxu69pGfYItglw3T0+BUtptTuFh4w2elIYPIWJywQtz2ZE+MO2BTV+Ghn6T
	E+G6SNMusmlXmLEpqsHzODPJY1/ZA+du+uIyeDogniqnnoV3d0HsWeWBL8iQBa8uap806fYrsVT
	zkUU5iauJdQx41FvWYe+jvlrTBNcRpo6q+D8OqiXUszWsJDoiWy6gTuEQNMRrtCe12ylnNVPFqM
	mQDjKnwznbDLlBVr7zO3yNWmZi+fg74+hAJb6zr1IHuUMEyza6PLfUxyNdblvSdR4Z7kG091fHG
	ksPh/EGUJpQ6b8+GGysjslqQ/wu7sLFQg==
X-Received: by 2002:a17:903:1b0d:b0:2dd:c053:e667 with SMTP id d9443c01a7336-2df7dc37073mr94905225ad.45.1790553797130;
        Sun, 27 Sep 2026 17:03:17 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df913fcbbfsm32347775ad.30.2026.09.27.17.03.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 17:03:16 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][PATCH 5/30] python3-pywbem: upgrade 1.9.0-> 1.9.1
Date: Mon, 28 Sep 2026 13:02:37 +1300
Message-ID: <20260928000302.2528437-5-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260928000302.2528437-1-ankur.tyagi85@gmail.com>
References: <20260928000302.2528437-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Sep 2026 00:03:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130392

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://pywbem.readthedocs.io/en/1.9.1/changes.html

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../pywbem/{python3-pywbem_1.9.0.bb => python3-pywbem_1.9.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-extended/pywbem/{python3-pywbem_1.9.0.bb => python3-pywbem_1.9.1.bb} (94%)

diff --git a/meta-python/recipes-extended/pywbem/python3-pywbem_1.9.0.bb b/meta-python/recipes-extended/pywbem/python3-pywbem_1.9.1.bb
similarity index 94%
rename from meta-python/recipes-extended/pywbem/python3-pywbem_1.9.0.bb
rename to meta-python/recipes-extended/pywbem/python3-pywbem_1.9.1.bb
index 58c4ebbbc4..a3d76e4f65 100644
--- a/meta-python/recipes-extended/pywbem/python3-pywbem_1.9.0.bb
+++ b/meta-python/recipes-extended/pywbem/python3-pywbem_1.9.1.bb
@@ -16,7 +16,7 @@ HOMEPAGE = "https://pywbem.github.io"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=fbc093901857fcd118f065f900982c24"
 
-SRC_URI[sha256sum] = "65c1ff972cea2f017b06795f47c0ad7442f8434ff643a544050c10726704f6ab"
+SRC_URI[sha256sum] = "b537ebe837c4fd6f227c75dd196175e105b95fae9adcf19f790457ba35753343"
 
 inherit pypi python_setuptools_build_meta update-alternatives
 

