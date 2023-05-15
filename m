Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1541C77B7D
	for <webhook@archiver.kernel.org>; Mon, 15 May 2023 14:06:32 +0000 (UTC)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
 by mx.groups.io with SMTP id smtpd.web10.89560.1684159590078009024
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 May 2023 07:06:30 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=DpaCOVLL;
 spf=pass (domain: baylibre.com, ip: 209.85.219.182, mailfrom: tgamblin@baylibre.com)
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-ba67d34350aso8203600276.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 15 May 2023 07:06:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1684159589; x=1686751589;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=10q/o3NOgfV48qf9TV4fAlQTYfgbaWEMNIVtfG2ilwo=;
        b=DpaCOVLL7WtH7W4T4Ikz8gccduYHJ8Aqx1Jv0/DG4iHHbYIkl0XCOE0rQmxBNl/FY2
         resMzveu9oaYSUHBff6kZN1u68ag1//NFIByYFP2ZVJEzzz6UYARH6+JLdpC9wvgL1fr
         0vc3kqDsx9oKSyvlwgM9JeZGWweG2fsRN94na7CJ4eXbxkjyaTuXnBiCDuz5aiTqIn92
         PUHrzHZa2mvmVOAUURqO8GplcO1zL4wuZWQ3D6w9oqEPxz4lAZ+VaDkqQKo7XM3x26H+
         8LOZQciH5rr51u3yWwJOToSu//+SLBnWb3WqeXs9dZQhnD/V+iZTVp1PqnX6WSYstH6G
         Z4YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684159589; x=1686751589;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=10q/o3NOgfV48qf9TV4fAlQTYfgbaWEMNIVtfG2ilwo=;
        b=kPO/DBwtaIQnKwQlo5mwCQu6h4XOWfQQh598L2tz7fiCSVjz9ddbXwnN4l0OGmmH7A
         6E55LfqwPk3xaaj2zzIGuoIkMMTImqYZ+66fvp6uhceSSNOMzdy3jUfBIHUc2eUJ64UH
         nThT6oH6kbq70MQZuDhhdzUq8yJRI5r9izP6+SaijVRvjDSliOEhndc8GPn0GQ8CvIRa
         eGvLResGwgLoHMMXIbnR5j8JRmLgZk1gHGQ20L9od0EF3cQBLLyakHozLNL3JxV3bIMe
         6CNJbSVAgyKDAaKxSpCptCrFFTj81Q4wrTV+TU8VxBNul4iTQwqiAug5/eSNaeegYyDx
         Ub4w==
X-Gm-Message-State: AC+VfDxtKlNzHpz050oiGti6dsPvY/s5bP7peENDpXxKhmYtkUKKV2cL
	dftsxPNQqNIPlVoVe2TCp/nlVIQp7aEgu+MnOxlJqA==
X-Google-Smtp-Source: ACHHUZ760WiAw71j7w78C3DCe1yGTBRrhdGTcRUYt7+oFJleZciJSTniMwqRMKClminFJ6B9exuP4g==
X-Received: by 2002:a25:fc0a:0:b0:b9e:8f7b:5c36 with SMTP id v10-20020a25fc0a000000b00b9e8f7b5c36mr28674744ybd.17.1684159588783;
        Mon, 15 May 2023 07:06:28 -0700 (PDT)
Received: from megalith.ht.home (cpe64777de11593-cm64777de11590.cpe.net.cable.rogers.com. [174.115.224.47])
        by smtp.gmail.com with ESMTPSA id w7-20020ae9e507000000b0074df5d787f2sm2403397qkf.89.2023.05.15.07.06.28
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 May 2023 07:06:28 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 1/2] python3-pylint: upgrade 2.17.3 -> 2.17.4
Date: Mon, 15 May 2023 10:06:26 -0400
Message-Id: <20230515140627.2103801-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 15 May 2023 14:06:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102604

This upgrade fixes most of the ptest errors that have been seen with
pylint, which were caused by a tomlkit issue. Changelog (see also
https://github.com/pylint-dev/pylint/releases/tag/v2.17.4):

False Positives Fixed

- Fix a false positive for bad-dunder-name when there is a
user-defined __index__ method. Closes #8613

Other Bug Fixes

- pyreverse: added escaping of vertical bar character in annotation
labels produced by DOT printer to ensure it is not treated as field
separator of record-based nodes. Closes #8603

- Fixed a crash when generating a configuration file:
tomlkit.exceptions.TOMLKitError: Can't add a table to a dotted key
caused by tomlkit v0.11.8. Closes #8632

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 .../{python3-pylint_2.17.3.bb => python3-pylint_2.17.4.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pylint_2.17.3.bb => python3-pylint_2.17.4.bb} (96%)

diff --git a/meta-python/recipes-devtools/python/python3-pylint_2.17.3.bb b/meta-python/recipes-devtools/python/python3-pylint_2.17.4.bb
similarity index 96%
rename from meta-python/recipes-devtools/python/python3-pylint_2.17.3.bb
rename to meta-python/recipes-devtools/python/python3-pylint_2.17.4.bb
index 4a082066b..c20d91259 100644
--- a/meta-python/recipes-devtools/python/python3-pylint_2.17.3.bb
+++ b/meta-python/recipes-devtools/python/python3-pylint_2.17.4.bb
@@ -8,7 +8,7 @@ SRC_URI += " \
         file://run-ptest \
         file://0001-pyproject.toml-Remove-hard-coded-dependencies.patch \
         "
-SRCREV ?= "389e14c36819cb87190fd412d3f366a3283f0078"
+SRCREV ?= "fc34a4b6abe56f3ac07ca15d846b1c1955545f85"
 
 inherit python_setuptools_build_meta ptest
 
-- 
2.40.1


