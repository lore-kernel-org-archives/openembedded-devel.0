Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAD0CC0218C
	for <webhook@archiver.kernel.org>; Wed, 22 Jan 2025 15:45:51 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web11.46586.1737560744401697917
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Jan 2025 07:45:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=Pxc2GDe2;
 spf=pass (domain: konsulko.com, ip: 209.85.218.45, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-aa68b513abcso1306459566b.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 22 Jan 2025 07:45:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1737560742; x=1738165542; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=48csdEc57n+Y11xr0T3zfvGhrV9K82aaTZUI0iGPGr4=;
        b=Pxc2GDe2k90GtjHKbCkVo+D0dsqaSD/kuP7pW8v1aDOXXFrAQKm6AzYc1De7uEQoFb
         ayzymaTuQzFXiSuabsKYUQB+QL7Ofgb70ChprzEut9+3oo1nrsYPxGvEw6RW3Fz5+T8q
         UNHgJR/c3GrjDw1ghv8Tw/GXKMhsbzCG7aObw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737560742; x=1738165542;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=48csdEc57n+Y11xr0T3zfvGhrV9K82aaTZUI0iGPGr4=;
        b=WyZsWdMrrnw7FPmO3RkgYCHj5GxAyQVuRjf0atYFWib5NeJP2bi3ex/ibOpaf+dEbk
         h7e/WG3e5EzlUaVkAywJP1Obbs1arMVa2WMiLMNH7Dr45pleJrYGtjzUTE9rWf63pAzk
         GrLANlPyaoMHjyCJypQCzsbCgQy8TYknSuh2mFUqjT8fg34y5WvT00NTF4RQ+sgIbgat
         Qiib6BWOgpKEeUoxhqyIlDHiSJCY+7040e6mqz7vuQulxTTgVdEbzrkyGSYdh6+iLkNr
         O2gmH41W0o0H6OzGtyd2Yhi3r4rbM7TH2NuUBfjaj18Akcps5/1P0o+Uj/UpIbgEtnT/
         +x1g==
X-Gm-Message-State: AOJu0YxP+DO4SeuE/v7Y3nx25eh/dUcWJdFkfVIGSFXanTvA0dN9DYUN
	XYCP7ih0xOS04Rw6cFbusO3HvvS7XKoxdO2RxxxNE6872QyuoTlAERzPnefaSgRX7ECFaqeBz/T
	n
X-Gm-Gg: ASbGncuR/tNvqyFnRrjncbYFjLfySVcMiLUL/c4PGARLQK7q3jUhZ9XoGWiWEdnljBG
	sjqmLgfbACk5VfGdLIpj2oNWOCqTE7VzN2DFVJTT0oQbzVwWuTS/7bwKKZITc3Hn3NLZsh8ssKW
	tVNT5iMiyEBWWj5xZDvz0zsiRO8zFo1Rod4NNgXMMiycciooJ3AMjrTxFUCtj45kzYsFd23U7RL
	qH7n1Zu/cFJE4qGpGCKCP/BQFNan5ZAJ46qt15Xl2zZuvn770R7RQErzRldz5dXYXR93P7JRng9
	fF3eJwli
X-Google-Smtp-Source: AGHT+IGLAhRORuaE4r+60T5jeBfvti76/7GN45ehQ/k23jHTx0QNJIMaIJrstPVjBCrCBxpS01yoEg==
X-Received: by 2002:a17:907:7b8b:b0:aa6:995d:9ef1 with SMTP id a640c23a62f3a-ab38b0b9960mr1944894866b.12.1737560742471;
        Wed, 22 Jan 2025 07:45:42 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab384fcb262sm913470966b.169.2025.01.22.07.45.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2025 07:45:42 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/3] python3-filelock: Upgrade 3.16.1 -> 3.17.0
Date: Wed, 22 Jan 2025 17:45:38 +0200
Message-Id: <20250122154540.82436-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Jan 2025 15:45:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115016

Upgrade to release 3.17.0:

- Fix failures and drop support for Python 3.8

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-filelock_3.16.1.bb => python3-filelock_3.17.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-filelock_3.16.1.bb => python3-filelock_3.17.0.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-filelock_3.16.1.bb b/meta-python/recipes-devtools/python/python3-filelock_3.17.0.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-filelock_3.16.1.bb
rename to meta-python/recipes-devtools/python/python3-filelock_3.17.0.bb
index abafa1245b..995a55c811 100644
--- a/meta-python/recipes-devtools/python/python3-filelock_3.16.1.bb
+++ b/meta-python/recipes-devtools/python/python3-filelock_3.17.0.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://py-filelock.readthedocs.io/"
 LICENSE = "Unlicense"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=911690f51af322440237a253d695d19f"
 
-SRC_URI[sha256sum] = "c249fbfcd5db47e5e2d6d62198e565475ee65e4831e2561c8e313fa7eb961435"
+SRC_URI[sha256sum] = "ee4e77401ef576ebb38cd7f13b9b28893194acc20a8e68e18730ba9c0e54660e"
 
 BBCLASSEXTEND = "native nativesdk"
 inherit pypi python_hatchling
-- 
2.39.5


