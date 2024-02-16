Return-Path: <fathi.boudra@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8EC4C48BC4
	for <webhook@archiver.kernel.org>; Fri, 16 Feb 2024 13:38:00 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web11.18945.1708090670963238969
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 16 Feb 2024 05:37:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=p379RarA;
 spf=pass (domain: linaro.org, ip: 209.85.128.45, mailfrom: fathi.boudra@linaro.org)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-41244cc3d67so4541875e9.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 16 Feb 2024 05:37:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708090669; x=1708695469; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nG5v187LSKIfZ2wwQAMXhUE033JHvmSPktuh0s7SUl0=;
        b=p379RarAu+WXecTJMM7T8T+HLg1eDnx90hHaWzlSxCNUZUak1LtTTLy10OzR9HlPxX
         OlB7RGul5JTnuSJgD2/zClz5Q7fh5RDChbm/TfW4YayKa0yp4YTOBN/Czrrr0krbJs0r
         7FY4Cl6TQaj6IrBXjSWJF65kfFGwPSElcvRnjqvcTfo2f9bPlfbBjnF2cgLeoVYM2Q1l
         Foil/x3TDhEEcnarGmdD/Ftgp7wyi281KH9lKtIMgxz0wMIc4f9xc5IbVfEG7It2j9ZK
         15UY7b85Y9T3FOVMJS/aCtdnKWQiDvKoTD+/LWPJsLniVU7AHu+Z8jCkZikwgsVxXJf8
         zBCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708090669; x=1708695469;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nG5v187LSKIfZ2wwQAMXhUE033JHvmSPktuh0s7SUl0=;
        b=cakDotLOdmWFV8VMZJDv4qiWDMDKDYeGBwcFEuhBp5OMt9oTjnSXobQ8i6uiavtpUf
         GEU5avgqwIcSRDtJbrPJo09JoJQ3f4fAbYLx0LdJmUp2BlK7dcXCpmTUSiRvM4/KgRIe
         1aMyTzcFFfJ2zKXghJnjKCrDD8U7rx01D2q4m5fAVpX0PdwxGLxgeLNbY/w5A7IkeByl
         pxNVJzbYExHY4jLDDaWE6MiSJ0qRcowBNgt8SlkB6aKRsIQiqQyizbVncRFczKEIQ2b6
         SUoGvNvmQD0slY/gLJti4siHD5tGsp1MBVKZFrHrDBgt5n7g0ahB+tpoRzQVmFvV2QEz
         VrJA==
X-Gm-Message-State: AOJu0YzEm0S/R2DblS+LaBSiahwyDm4oT7Z91dnjsNLhbDgMkt5SswwS
	k2gWtZV8DDiKj44aN5GWFpm2EvGdYVl3zvv2BcyFswOrbpU49hXMzZS3eA37cUJh4RQZF5vGKKz
	4S/k=
X-Google-Smtp-Source: AGHT+IGbm43Xus6K1RXe23CqLgRK/RRrS9ogRFafoJzhYBHlN4DIpHI8YSvHdM2HWVeTQKCDboI3Pw==
X-Received: by 2002:a05:600c:1da6:b0:412:943:9da9 with SMTP id p38-20020a05600c1da600b0041209439da9mr3389455wms.1.1708090669153;
        Fri, 16 Feb 2024 05:37:49 -0800 (PST)
Received: from corsair.. (88-169-167-85.subs.proxad.net. [88.169.167.85])
        by smtp.gmail.com with ESMTPSA id dw5-20020a0560000dc500b0033b278cf5fesm2212986wrb.102.2024.02.16.05.37.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 05:37:48 -0800 (PST)
From: Fathi Boudra <fathi.boudra@linaro.org>
To: openembedded-devel@lists.openembedded.org
Cc: Fathi Boudra <fathi.boudra@linaro.org>
Subject: [meta-python][langdale][PATCH] python3-django: upgrade from 4.1.6 to 4.2.10
Date: Fri, 16 Feb 2024 14:37:47 +0100
Message-ID: <20240216133747.2755857-1-fathi.boudra@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 16 Feb 2024 13:38:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108765

Django 4.1.x is no longer supported since December 2023.
Upgrade to the latest 4.x LTS release.

Fixes CVEs:
CVE-2024-24680: Potential denial-of-service in intcomma template filter
CVE-2023-43665: Denial-of-service possibility in django.utils.text.Truncator
CVE-2023-41164: Potential denial of service vulnerability in django.utils.encoding.uri_to_iri()
CVE-2023-36053: Potential regular expression denial of service vulnerability in EmailValidator/URLValidator
CVE-2023-31047: Potential bypass of validation when uploading multiple files using one form field

Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
---
 .../{python3-django_4.1.6.bb => python3-django_4.2.10.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-django_4.1.6.bb => python3-django_4.2.10.bb} (58%)

diff --git a/meta-python/recipes-devtools/python/python3-django_4.1.6.bb b/meta-python/recipes-devtools/python/python3-django_4.2.10.bb
similarity index 58%
rename from meta-python/recipes-devtools/python/python3-django_4.1.6.bb
rename to meta-python/recipes-devtools/python/python3-django_4.2.10.bb
index e54398c456..a25ebc4b11 100644
--- a/meta-python/recipes-devtools/python/python3-django_4.1.6.bb
+++ b/meta-python/recipes-devtools/python/python3-django_4.2.10.bb
@@ -1,7 +1,7 @@
 require python-django.inc
 inherit setuptools3
 
-SRC_URI[sha256sum] = "bceb0fe1a386781af0788cae4108622756cd05e7775448deec04a71ddf87685d"
+SRC_URI[sha256sum] = "b1260ed381b10a11753c73444408e19869f3241fc45c985cd55a30177c789d13"
 
 RDEPENDS:${PN} += "\
     ${PYTHON_PN}-sqlparse \
-- 
2.43.0


