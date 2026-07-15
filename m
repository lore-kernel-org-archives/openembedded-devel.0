Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09FD9C44501
	for <webhook@archiver.kernel.org>; Wed, 15 Jul 2026 14:15:16 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6854.1784124914773187619
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Jul 2026 07:15:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=BFXF9/Rx;
 spf=pass (domain: konsulko.com, ip: 209.85.221.41, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-4759b4f0897so1274500f8f.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 15 Jul 2026 07:15:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1784124913; x=1784729713; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1j+OnAQXdWK48N7MMJeGQUmj8DFayWqTRIPQzgZJF14=;
        b=BFXF9/Rx+7iWwOCVin2niJCFS1pFoz290pyx9DOjdf2ogCr02R1vuCNtoWSxyrvxTP
         TI19k2XWHtjdw8y0kIphbPihsm6E3AMPm6kGwivJrHmJ70/uEUH6NrlP9t0XiItVbsal
         OZV3x8YgPdMSB0gB8w0cVNbRTVvy9/TjUQrag=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784124913; x=1784729713;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1j+OnAQXdWK48N7MMJeGQUmj8DFayWqTRIPQzgZJF14=;
        b=koKOdUAP8LzaVsOytLv8U1pUklpfGJO+fYVXA8SbTwcmizpih1isVEPdjeozqeSC2P
         hwXBY/bILtOs2//WGCHQFDywGGz2OH665HrTBk/rzGyorEsQkG1Aa5II1DayJSZCBqv4
         YZpuVxh3sv0Y+VQzRSEvyKBr9HuPQcl5P2sibaB682XCSIaP1S8Ve99aESQumnoGFZN8
         kP1u51/d1Wb9U4wzgWpEatmV/0OrlirMBzFNMfm25lQ5FsWFlOD0ny59EWULZKzTK69h
         2iF/gxWoS0LUY1/2RQCWIYTmjxGMAve/oeiDa9k5FxWFPjNerdsKz/96Wei7gTxhFVJc
         w8hg==
X-Gm-Message-State: AOJu0Yx/vHgnWiNHbq3vk0X3UUSZJrXoUJeffFc6Dii0DVmDNOwdpUMT
	f6QlORYM1nIweGrdMNZhguP49d6ba7Ol23L8mcfiYoQsb9oRdLkDWeE+0Vpq+IiI8HzxygCD8cb
	3tZXE
X-Gm-Gg: AfdE7clnV8LyxKLt/eeoH30Y8bi6EMHoXsrctnMELhBcAhYat1ISlZs6yKaT3hy/WlK
	vKP3aItKRcEll55KhytwitvjrNaL768v9+2TE80pZdcSv/BGXEjs5QC2rfv5k4C4ttEuqPYVVIi
	hMmt5S9BW4ioW8OjtWt5r55hsibIqyRJC4oCi4lL5YSSczIZjcj8DzHg5DGWAWzmuG9BcFHg8qC
	f2Wm4EzWTYLZ/eHMl3ppmcbElsEz2Vdg25ioAtdD33xZxRkSPjj4HObJmQhEMMw8pFEO3QWnx5z
	8jCCDSlc+wUjnIC+9hHXUq9ucIsNUc+0u/DtavIbg5srrKFTOkYZXj/epzpm9ZGGMPcrKClRzD+
	Ara4dLKi7M2ErrieHme947ueI23LXi1jgWExjNWZTHfUEi6utXkp2lW8WqwyM9rsxKzuUeprpSB
	spfW947qudpyiXh4vWy9dqsBcsOq8kdd1WNNqJY8qj7ladeOjsZmiG4mwHMU/OegOm9NuVg7of3
	NmpTaikt7B03Nju2XAFvuFIeiMSANDDWWv8RQ1MHQ==
X-Received: by 2002:a05:600c:6387:b0:492:7142:f46e with SMTP id 5b1f17b1804b1-493f87d8583mr202667325e9.2.1784124912371;
        Wed, 15 Jul 2026 07:15:12 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4950872424asm156777845e9.1.2026.07.15.07.15.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 07:15:11 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/3] python3-pydantic: Upgrade 2.12.5 -> 2.13.4
Date: Wed, 15 Jul 2026 17:15:07 +0300
Message-ID: <20260715141507.3352685-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260715141507.3352685-1-leon.anavi@konsulko.com>
References: <20260715141507.3352685-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Jul 2026 14:15:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128221

Upgrade to release 2.13.4:

- Bump libc from 0.2.155 to 0.2.185
- Adapt pydantic-core linker flags on macOS

This work was sponsored by GOVCERT.LU.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...{python3-pydantic_2.12.5.bb => python3-pydantic_2.13.4.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pydantic_2.12.5.bb => python3-pydantic_2.13.4.bb} (97%)

diff --git a/meta-python/recipes-devtools/python/python3-pydantic_2.12.5.bb b/meta-python/recipes-devtools/python/python3-pydantic_2.13.4.bb
similarity index 97%
rename from meta-python/recipes-devtools/python/python3-pydantic_2.12.5.bb
rename to meta-python/recipes-devtools/python/python3-pydantic_2.13.4.bb
index e354e4b93d..fb80c066f9 100644
--- a/meta-python/recipes-devtools/python/python3-pydantic_2.12.5.bb
+++ b/meta-python/recipes-devtools/python/python3-pydantic_2.13.4.bb
@@ -11,9 +11,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=09280955509d1c4ca14bae02f21d49a6"
 
 inherit python_hatchling ptest-python-pytest
 
-SRCREV = "bd2d0dd0137dfa1a8fdff2529b9dfb1547980150"
+SRCREV = "cf67d4b3193c3fe43ede18612ed62785eee11382"
 PV .= "+git"
-SRC_URI = "git://github.com/pydantic/pydantic;protocol=https;branch=v2.12-fixes"
+SRC_URI = "git://github.com/pydantic/pydantic;protocol=https;branch=v2.13-fixes"
 DEPENDS += "python3-hatch-fancy-pypi-readme-native"
 
 CVE_PRODUCT = "pydantic:pydantic"
-- 
2.47.3


