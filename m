Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2444CCD187
	for <webhook@archiver.kernel.org>; Thu,  9 Oct 2025 08:14:05 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web11.6823.1759997644324185546
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Oct 2025 01:14:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=nHPFUSrp;
 spf=pass (domain: konsulko.com, ip: 209.85.218.45, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b463f986f80so143636266b.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 09 Oct 2025 01:14:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1759997642; x=1760602442; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5o5Uy6KQ8uAjF/LlpQJ5iYXKVFe7P6+TNJAeQAW54UM=;
        b=nHPFUSrpx5u422qqV6eEjZT56agwoou+31nixGSNRLfUOpoZ3S8FQbv6gdLWirG+ku
         CPqt3vVltVGVZ3QraLyK0StgA24ZPeicvRjbKgQoFdBT7APBJkd67JA0HLn1TiZZT+OK
         Ma0a/Tw3BYopmghRqq84RsMknPds2xAftMidk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759997642; x=1760602442;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5o5Uy6KQ8uAjF/LlpQJ5iYXKVFe7P6+TNJAeQAW54UM=;
        b=l8NgUtbGhJ8X1bbinBovjrcCJM/V7pYeQZAyP45zMyF4W5zPOnOfvG1h58llNld7Jp
         atF7HYBTtA6fu05vuzroAoFugXRkrdkdeYQ5p9MK0WQgs5W4IIOgknJq5jg9eH+I944z
         pDjUdLPIMpQPp2T6GvKbEvTYlVeOBLS8hf3GqVyDmCM4nQIOasRwDiw9BWLLV6qXbr1d
         f457UqdwVoC/nYuqjaT3kzSfImDK2BdMQaFN7EHYrdgeb1gMA+azLqL6yl2/g0bfgGWX
         e3mgdcN5YbUO9gIBAK1voR3OWFQ6rmHjYhBoNO89QMlV37btyVQ/M6rCIQ1c1EE/FF/e
         0EWQ==
X-Gm-Message-State: AOJu0Yw+sycHN7OSk0xd+nZ95rhRrIKvBVgqD3HXOo+l4MiN6vq1AhCa
	wD5JIKN2jnGWaxb5gOJ40pIM7cZItyNEY/pjVXvCrmjNw/oA+TQdKF6ZA5HL0ky3/lupHSwftlM
	HnUNx
X-Gm-Gg: ASbGncv5Caed6TG9m6b6o7V0KPu0pcRpsf3sfpaDAM75yzd1csyQYCAZamWpTVXxBcP
	R47oYRBuO9XjpDG+J1Nk/IahWDjRjhGH85HQT5fyoGhumXhPphf+8Aj/GOPmJl2AAqP693VS+dp
	/mpnT76aUfEKgH3WW+4RN/FleFQ9oeKmKCWAIz+TN9XweApfTuT5c6KVlGdN5MsfXUJjeyP3n87
	N2V4gdNPpvkB4cXEatwv6gpB0TH7SaRKKw8eV3LGdyU9UfGizzTvTmKS6nP7oEBjVqifQvLl1Fc
	q8aekavjRLKFa41+hyD4CHUY5MZeFX4H6FN+PI0J2c+1a2eW0nF8bidkQud6sIOyuNBzoeg92C5
	GyVIPxeMYgql8NWsziWW1SxmLEibdX5yVlKgD46oGOQlKlxHRDue+0Z2lG0RCudVbROBg38A=
X-Google-Smtp-Source: AGHT+IG37T8DeYu1NV/P6zz72pCG2G0Nun9xqtHHxbtAt+TwPbONi6JBi2BqqvkvqVsxxISVqjbTaw==
X-Received: by 2002:a17:906:794f:b0:b3a:a16e:3db8 with SMTP id a640c23a62f3a-b50aa38733cmr670966766b.20.1759997642115;
        Thu, 09 Oct 2025 01:14:02 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b48652ad839sm1844874266b.1.2025.10.09.01.14.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 01:14:01 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/5] python3-whitenoise: Upgrade 6.9.0 -> 6.11.0
Date: Thu,  9 Oct 2025 11:13:53 +0300
Message-ID: <20251009081357.3446410-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Oct 2025 08:14:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120422

Upgrade to release 6.11.0:

- Support Django 6.0.
- Support Python 3.14.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...python3-whitenoise_6.9.0.bb => python3-whitenoise_6.11.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-whitenoise_6.9.0.bb => python3-whitenoise_6.11.0.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-whitenoise_6.9.0.bb b/meta-python/recipes-devtools/python/python3-whitenoise_6.11.0.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-whitenoise_6.9.0.bb
rename to meta-python/recipes-devtools/python/python3-whitenoise_6.11.0.bb
index 5a6b495040..142c10aa83 100644
--- a/meta-python/recipes-devtools/python/python3-whitenoise_6.9.0.bb
+++ b/meta-python/recipes-devtools/python/python3-whitenoise_6.11.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=aba4901cc64e401cea5a267eac2a2e1e"
 
 PYPI_PACKAGE = "whitenoise"
 
-SRC_URI[sha256sum] = "8c4a7c9d384694990c26f3047e118c691557481d624f069b7f7752a2f735d609"
+SRC_URI[sha256sum] = "0f5bfce6061ae6611cd9396a8231e088722e4fc67bc13a111be74c738d99375f"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.47.3


