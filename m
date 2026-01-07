Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94256CEFCE3
	for <webhook@archiver.kernel.org>; Wed,  7 Jan 2026 09:53:03 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2665.1767779580890131748
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Jan 2026 01:53:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=ubxOowTE;
 spf=pass (domain: konsulko.com, ip: 209.85.218.42, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b728a43e410so319015066b.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 07 Jan 2026 01:53:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1767779579; x=1768384379; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IpYhvHfgCVZBv4/e+6ARPsqfRs7H7gOwJ0CFhWyH2nY=;
        b=ubxOowTEysDCZDLOYh/wGttBfs3ePS0aaNSogVAibxOu8ukYm0WLFw98RKhQL+wpCm
         IMo/HJB4V9h9D8pIl7J0QtbO5oQp+8ighys2QXnFihR/fXfE6L3pipD/ha7M+CWhitTS
         1UxDjEnhZbsaUCnrRhR4c3hu/b55aq/09rDzc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767779579; x=1768384379;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IpYhvHfgCVZBv4/e+6ARPsqfRs7H7gOwJ0CFhWyH2nY=;
        b=lHI3rbMF9Wfr7jwVCMlcrucrIJBqV15Ge5XImGImmMZYMrflLv6pJ1GT50AzDtXtPZ
         naIKJGNzus1H0zhpqbb3xsi08N6Jk7+45GaIo0xPdQHpEMTGcxBWHrOm5QF/A3Y7SnhK
         oiynNbOSTQ+xx7tuNNQGNlxjcSAyoIgnMFXSrfefl8D9FdkVcipRO6kwDEajR/nEuT4d
         qVWdBfvgkSEQpAWECAewMYV+/sCtN62gPFJUpcZ++8/D+5imbqZIsgda2u9Zzzue2R4u
         MnkyZZt19a5Z//qeOV3TwLwHVfLeEB7NIDKOV2dqKvgDu91v4KKZKboi7T+aBZeqbLq/
         vtyQ==
X-Gm-Message-State: AOJu0YwJrqmNMNbDCKVjIqKiUwwoFF2T83LUdpy4ri/MYD/7pKACA5Fp
	C3onuxXxbWGieF6TRZr39zBa/WpiuM0mKiOg72X5on91+ENGc0PYh2e0Hq5eWvzH76eZH+0zXE0
	D7qnK
X-Gm-Gg: AY/fxX4izbvFRY8cAyt7KwOUgZ6MOmFm55uKVdSVxUcXICuckJBbUaebt3xqA7B3eem
	+AQRmQAWT5Dn0DtypIDwkKgRIKAJbWTQ0n97i8I5SJTQ3GykDTbSaRLwkbMTE4WOIgbi6Ly5zUP
	ALJV/IMiQm94zCcVOfx5F8y8PEkDUoxbFYsP6aPaI1FIEUxP80Y9v7kFbVo6EfMGoIojOnTETvY
	K5ac34vdWhIG8jnXU23ul+RJ6fL2GWDaZc9iubCr5j6pRBX6WqkJ0M1vqiEd9Q8+0d9+ohxul+8
	+Xr6Vszk/Y4KXeFR+Gq53fbHwVlmy+sgRsbSHfGVEppFOAykeC7vVTN+k0FketUWptbtqHZ7P09
	Zhi1ZG1f2XYcxpNi5jdhSz+Q/5xBzRxEp2Ehup0+LyQUBSIapuNt1JipAH1Jc8v7thHvdHF6mII
	db2U1cgLCLIb/DD+7g4FhQDLQu
X-Google-Smtp-Source: AGHT+IE7K8JVbkOZAVuhmaSYj1Qtqw/GaDqElXRIgL11AWFSy2Ho3dfUJsC3UqV+8Y6RP5/dDzrhmg==
X-Received: by 2002:a17:906:478d:b0:b76:74b6:da75 with SMTP id a640c23a62f3a-b84453383a1mr186368566b.38.1767779578531;
        Wed, 07 Jan 2026 01:52:58 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b844e46ee63sm72327666b.15.2026.01.07.01.52.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 01:52:58 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 6/6] python3-termcolor: Upgrade 3.2.0 -> 3.3.0
Date: Wed,  7 Jan 2026 11:52:51 +0200
Message-ID: <20260107095252.1351613-6-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260107095252.1351613-1-leon.anavi@konsulko.com>
References: <20260107095252.1351613-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 Jan 2026 09:53:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123194

Upgrade to release 3.3.0:

- Add support for italic
- can_colorize: Expect fileno() to raise OSError, as documented

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-termcolor_3.2.0.bb => python3-termcolor_3.3.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-termcolor_3.2.0.bb => python3-termcolor_3.3.0.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-termcolor_3.2.0.bb b/meta-python/recipes-devtools/python/python3-termcolor_3.3.0.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-termcolor_3.2.0.bb
rename to meta-python/recipes-devtools/python/python3-termcolor_3.3.0.bb
index 100292858f..2d0f4bf630 100644
--- a/meta-python/recipes-devtools/python/python3-termcolor_3.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-termcolor_3.3.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING.txt;md5=e5f5f7c9b280511f124dba5dda3d180e"
 
 inherit pypi python_hatchling
 
-SRC_URI[sha256sum] = "610e6456feec42c4bcd28934a8c87a06c3fa28b01561d46aa09a9881b8622c58"
+SRC_URI[sha256sum] = "348871ca648ec6a9a983a13ab626c0acce02f515b9e1983332b17af7979521c5"
 
 DEPENDS += " \
 	python3-toml-native \
-- 
2.47.3


