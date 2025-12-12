Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2BF5D49216
	for <webhook@archiver.kernel.org>; Fri, 12 Dec 2025 11:58:24 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11141.1765540696894364527
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Dec 2025 03:58:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jFme5aWs;
 spf=pass (domain: gmail.com, ip: 209.85.210.177, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-7aad4823079so1085864b3a.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 12 Dec 2025 03:58:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765540696; x=1766145496; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FdkVRY+M4dcHS3I+P81EXMHKtfy3QyiaTR4EHqdj5ds=;
        b=jFme5aWsgYAYq+D+MoekX0ihQY6kji1661Bzui07tixrjl1bzEEDLr/b9jb43Ip52l
         Y7lMqJA3Gjh+POTbm8mhbNAp1f5r/clu2GWl7PjLmESb+eHlzSjQRb8RPZEiAbtfccq8
         cwGlxmEsc4lxWO4A/7SjdFtd37x1/rwnnXNIyj9YQnDb4V3OJY83oMwkeReae1rMPV3z
         ApAp08cNlXn9vua5U6uw/0zAdStT3CVIX4GpC5xpv05W9X0e3uezd2+rqLqYN2M0um2R
         084WhPzwaNNFWfx5zu3Zg3xbqyXVJzBQAgWYJYMGKvSr2iKCuQ7ayTGF9RC0/8m0d7AE
         cbDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765540696; x=1766145496;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FdkVRY+M4dcHS3I+P81EXMHKtfy3QyiaTR4EHqdj5ds=;
        b=Ug+SL0hC6W4DwIUQJmOZC90FgdeWDFEorGQ60sOWNeO9np/fEqPUDrd3tpm+ezBswW
         XLuS4hcB3e11f5k18e9aFdF6XYSTidlZ8Wse+WYzTzQh6Qs16+7dRpKrl0tn63DpStGz
         jWlgbvrNshDxvf+zGFDjONPZZknbfIFK6WFa16jlI1QuqU+sB0OJM05zkmNoDOnH51qF
         TRlVbImALWSzrQZU4c0KKVg8mOpw009ziI9Ymb4uC2i48PTMmQnf3mg6+pZNnXVhspcL
         hhEzM1IK36QV/z7r5gKdILj0GEChOMTT9HxNwMUkM0aDBqR2zzXh2Y6135B2I5yjhfEQ
         M05g==
X-Gm-Message-State: AOJu0YyAp2gZQsewV7duM5O+crf0ONRbJGfZ6wO+lcnr7kkRg/QUrZps
	luYhgvWaXcqmWdcw3gW0LowoyyidsGtlXTWyjzV6RKu187MaHc0UEJhz/UamXg==
X-Gm-Gg: AY/fxX6Ng2vW1QAdu77ytQeVN+xzfEUXMduH32+icb7gWIMdTWBIVdNJrGiIkIvE1tO
	9yG9hsFBntvuN0iY+suwKgmOrAMfrJ7AgA/HhCHp/7hyG7gyBV5/Itf7eTmvfLBc5M26/wm6nwm
	y+8dXLEjnfcU1iMppXdtDGUAdeS3P4giNnDeWqK1GCfNzba3ZoTqPHzTAKnJ5hWJd6IKzxDEMMz
	YxwjF3YDs/3BWico0vJsQJLJS9X76d7KecgHwNiZBsDvQVYVHRBLPxsiFbWTiySKI4x+JDgq1Lk
	ugn8vV7/Eqbo9kv1wQ3icAoaLHEMys/PpLsgXV58lDY9gJrokpm+VqE0lvYX+Zp0J1WxJzZUmeI
	QNXTT5cAhSkFPF314dZ+mqPTnaxvrQuUA8TiPbhJb16ZOOC6X1ObN940iPtOzsebWLLyzRDCINg
	TjYuZS4jbbWmjE5T+LHbwjrVU=
X-Google-Smtp-Source: AGHT+IFwP0G04jRP8EJMijHcGV76oCpUb/aNwoL6nTfPaJr9N3RQtvNB1aLV97egflfjtQcFCfkxPQ==
X-Received: by 2002:a05:6a00:4c85:b0:7e8:4471:8e0 with SMTP id d2e1a72fcca58-7f66a46ae16mr1516825b3a.65.1765540696009;
        Fri, 12 Dec 2025 03:58:16 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([122.161.48.114])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7f4c27771b3sm5163198b3a.27.2025.12.12.03.58.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Dec 2025 03:58:15 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][whinlatter][PATCH 12/15] python3-polyline: Upgrade 2.0.3 -> 2.0.4
Date: Fri, 12 Dec 2025 17:27:41 +0530
Message-ID: <20251212115744.569676-12-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251212115744.569676-1-ankur.tyagi85@gmail.com>
References: <20251212115744.569676-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 12 Dec 2025 11:58:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122612

From: Leon Anavi <leon.anavi@konsulko.com>

Upgrade to release 2.0.4:

- Add py.typed marker

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 71055538b53c2fd60ea9c3a84a6d01fab5fa58ae)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../{python3-polyline_2.0.3.bb => python3-polyline_2.0.4.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-polyline_2.0.3.bb => python3-polyline_2.0.4.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-polyline_2.0.3.bb b/meta-python/recipes-devtools/python/python3-polyline_2.0.4.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-polyline_2.0.3.bb
rename to meta-python/recipes-devtools/python/python3-polyline_2.0.4.bb
index 371bcf0163..ecfd9034ac 100644
--- a/meta-python/recipes-devtools/python/python3-polyline_2.0.3.bb
+++ b/meta-python/recipes-devtools/python/python3-polyline_2.0.4.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/frederickjansen/polyline"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1fb8d1dc685695195bb3c1e48adfef48"
 
-SRC_URI[sha256sum] = "abc786b9332e84f27e6e59fd4fcbcb0c4b9af6a7f7b4175e2eb6c2786278deae"
+SRC_URI[sha256sum] = "f05ade694522bf1720febebe1672f820f43a13c6a1664751e7769d47e8ca9b1b"
 
 inherit pypi python_setuptools_build_meta ptest-python-pytest
 

