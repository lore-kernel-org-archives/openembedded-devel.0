Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21483C021A0
	for <webhook@archiver.kernel.org>; Thu, 13 Feb 2025 09:04:50 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web11.6964.1739437483208542661
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Feb 2025 01:04:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=R3CnXsEx;
 spf=pass (domain: konsulko.com, ip: 209.85.128.41, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4361e89b6daso3898785e9.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Feb 2025 01:04:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1739437481; x=1740042281; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WAyRO38SPPiqFx589VHW8UNeDT6lPOfjLeEcubIPxjg=;
        b=R3CnXsExy1/Bio2UJLxBDyx/ilZrU1J8cmkBal5w5xmtCchtDpfeb+JFk/+OSOK5hA
         7LgypkxszuQKuixhmXtZVOSNijph5PB8lhhFN6w2dcTvXFt2sOyIKS7SQSf5i7tgnIS6
         FrCdgfKwmb7IGA5XKOF7y4Q184k4DZ2mHnKZ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739437481; x=1740042281;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WAyRO38SPPiqFx589VHW8UNeDT6lPOfjLeEcubIPxjg=;
        b=Sktt11nqSQL/JbvKrcCSJTbkJ5kzlqeW9FdAfOEptV76Aafnk03S1205uQFvXcbKyq
         sVYnVlzyUctuMQq25jK/THeYKU7Jyx3/0uBNEAdTA1wum1PoGW0b/YM/S4ubEMzCb4m8
         W9f3I6nkKL0d1+j8WAc/V6odM6i1mmAd/wcaVj0M81k43VQDImfqIOUYIPIccyPM6LaF
         zlnlBZil3uIAz+IkXfW7k5CfESv1vMLf9VJlPgtn4Ok/WrjD6fYOEcwdSni9pLybC+KX
         Mmly00lmvHQqdXEaZrf+mfA9rSoCSQoQ41Qxe66kXbq1cATDtAM8yjwdOAtcqaSJ2cyc
         0FOg==
X-Gm-Message-State: AOJu0Yw68Y+lkqCxlpsaJZrmkMnoLDLCoDpkpi0E4gmH6nhLus7IHjGb
	ccIpIqdR7Pd5HJVAyJ46ZU4QG3pM0YXpYZTJ8qWCOI1kDI+bwDZzG8Z8EN3EkA9tlT+3Gz25W0P
	W
X-Gm-Gg: ASbGncvlIIV2vuPuBf6s5CVfJt0/HGI2siMUX/oI5MyRFp035L1vOekJjUCbQNGfi49
	VHfr2ONfEcXp4hcHlzxjgwXrtV+0CV3hGN52To+IazDxUk7P5vjMG4aDe5zZfRcu4jBcNih2Aqv
	26uYq2SJjV4XWXaIEKoHilfWVkowEnyIyLr1Wjk9lQDejaksAHlNyVVO8V356tdtvOe6/TEtD6a
	9uJiNeC9HlqLtAYj0hrmwfX6nigQbfIbFOAqaqY0puqZxlbGB2U17+EFihyQnjJvrqCBoI+u6Ge
	lSJyJ3nJHkudOfOFQSGrdtERkhOHNg==
X-Google-Smtp-Source: AGHT+IF10Z33BqtjR3yL9t72ggODSTi/Y+rTc1UMLpnQggR3W2yKK5TK3j5hOAzYgEnVzoRMvoXS6g==
X-Received: by 2002:a5d:5f51:0:b0:385:f47b:1501 with SMTP id ffacd0b85a97d-38dea28d4d3mr5287576f8f.32.1739437481091;
        Thu, 13 Feb 2025 01:04:41 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4395a06e309sm42507005e9.24.2025.02.13.01.04.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 01:04:39 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 5/5] python3-coverage: Upgrade 7.6.10 -> 7.6.12
Date: Thu, 13 Feb 2025 11:04:30 +0200
Message-Id: <20250213090430.3750793-5-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250213090430.3750793-1-leon.anavi@konsulko.com>
References: <20250213090430.3750793-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Feb 2025 09:04:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115459

Upgrade to release 7.6.12:

- Fix: some aarch64 distributions were missing

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-coverage_7.6.10.bb => python3-coverage_7.6.12.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-coverage_7.6.10.bb => python3-coverage_7.6.12.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-coverage_7.6.10.bb b/meta-python/recipes-devtools/python/python3-coverage_7.6.12.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-coverage_7.6.10.bb
rename to meta-python/recipes-devtools/python/python3-coverage_7.6.12.bb
index b5af7f3efa..5577832e50 100644
--- a/meta-python/recipes-devtools/python/python3-coverage_7.6.10.bb
+++ b/meta-python/recipes-devtools/python/python3-coverage_7.6.12.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://coverage.readthedocs.io"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2ee41112a44fe7014dce33e26468ba93"
 
-SRC_URI[sha256sum] = "7fb105327c8f8f0682e29843e2ff96af9dcbe5bab8eeb4b398c6a33a16d80a23"
+SRC_URI[sha256sum] = "48cfc4641d95d34766ad41d9573cc0f22a48aa88d22657a1fe01dca0dbae4de2"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.39.5


