Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93016CE9D7A
	for <webhook@archiver.kernel.org>; Wed,  7 Jan 2026 09:53:03 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2623.1767779576939810350
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Jan 2026 01:52:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=H1+dkFoK;
 spf=pass (domain: konsulko.com, ip: 209.85.218.52, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b832c65124cso301663466b.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 07 Jan 2026 01:52:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1767779575; x=1768384375; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lt3U+ADIt/8GFfmB1OsNyFfA+EbD8tY60spl62p4n/k=;
        b=H1+dkFoKURJzBnz0J1MVJkXt3YwO2rjH4++LKxxTUx3Q7l0DD24IxQxlYAWwCGtQ2S
         lZQgjKck3wFzoSq3ExTmgvci4kYxEP84mISiBWghkdDZwE9DkNVJ/6nThoNSx+UswunX
         oviilP76/uqi+fQeHVzkkOtJK2529nLKJbsn0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767779575; x=1768384375;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lt3U+ADIt/8GFfmB1OsNyFfA+EbD8tY60spl62p4n/k=;
        b=mJJWgi3aYUF1I7cGNO1esLGOMjTAE4A5ALvHN/NqyD24Mp1XZ1CYVvJfKcvgUzfDe9
         qidTsISw7T6qzSLAZLO9DJHgRTo4bA+qRtj0/rnh7hp+m8EMnXfh5vTADdn67H5FTT9z
         FsWdhljgx/1KpUIxNIFgPp37mHdx9eTfvn9IYI/MfERTfPlM3CZtg6OyjKL3NhL2mIXk
         BBIyDo2D20e0j5EHBNRWcNxG2SmtP+i7wFki6hvlJVlIhMoZp171N3o5JnKK7zE4xg/j
         SC2n6WvhSuQ8kQ7kATSLBAXtJEDdeVUkscMOCGjImGcnBweAYl3owZQAIWlZM6NddoED
         t+gw==
X-Gm-Message-State: AOJu0YzTRzGEjwep4QYktP2VeanUBAE2YXPxYLU8AItX+fRFYIEgF3Ja
	VsrNvOkVBIx176rKszBGpRp90meTH/IielpMe3skwVGT2DdQwHSFI2tIv24gVpicKjRra01c2sP
	0Udo9
X-Gm-Gg: AY/fxX7HV0UeISnJYzh5t0OvDKU1PnfuqrTLPSnUongVmhIwpWrpz0bmI3Wm1A+KO3L
	NX9c1uNrmA4b6AzugjQxoGDe0+95x4mw4Cnfk5DTTMD+9Njp/RyYPyG8VZRi+wkb3inUc+O5TJE
	M5lL/AsgW/HRmz7SqEJ6T2z4jNby988In5NiwrLg+cmgqjgRncb5dml2OD/NWcWrE8Ixok88sgN
	0QeCVaH4XSml20bjpsB6oFxvyYSkBBUIMA9IyYyE4vMd8klSEOP8qTAr3OOGI7pGK0noerHnM4a
	w2NoOaoPU/W1kId8Gd6+AhWVdbi1gPR5fSPw0Y+X78BfSFZY+J/N2waIAL9Jd6zluSm/fPv44t9
	WctN9cO8Th5AVKU/90w/+Qow+iTbbjMNiV2sa65htuDtgEdReJqBp0G60twHKL9v/tdCLrpUZA2
	43KoIfSh/bhp+TIQAo8hsHWSls
X-Google-Smtp-Source: AGHT+IFu8m0wmGw/pAtFE+7h6vmTnXaSNqttHvnXVrSZSq62UYeuGaPImpiMcWvFaUkeu3STzvKJ+A==
X-Received: by 2002:a17:907:3da6:b0:b7d:11ae:4006 with SMTP id a640c23a62f3a-b8444fd6743mr203128266b.52.1767779575128;
        Wed, 07 Jan 2026 01:52:55 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b844e46ee63sm72327666b.15.2026.01.07.01.52.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 01:52:54 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/6] python3-anyio: Upgrade 4.12.0 -> 4.12.1
Date: Wed,  7 Jan 2026 11:52:47 +0200
Message-ID: <20260107095252.1351613-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260107095252.1351613-1-leon.anavi@konsulko.com>
References: <20260107095252.1351613-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 Jan 2026 09:53:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123189

Upgrade to release 4.12.1:

- Changed all functions currently raising the private
  NoCurrentAsyncBackend exception (since v4.12.0) to instead raise
  the public NoEventLoopError exception
- Fixed anyio.functools.lru_cache not working with instance methods

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-anyio_4.12.0.bb => python3-anyio_4.12.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-anyio_4.12.0.bb => python3-anyio_4.12.1.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-anyio_4.12.0.bb b/meta-python/recipes-devtools/python/python3-anyio_4.12.1.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-anyio_4.12.0.bb
rename to meta-python/recipes-devtools/python/python3-anyio_4.12.1.bb
index 500c1bd3dc..40312c761a 100644
--- a/meta-python/recipes-devtools/python/python3-anyio_4.12.0.bb
+++ b/meta-python/recipes-devtools/python/python3-anyio_4.12.1.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=c0a769411d2af7894099e8ff75058c9f"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "73c693b567b0c55130c104d0b43a9baf3aa6a31fc6110116509f27bf75e21ec0"
+SRC_URI[sha256sum] = "41cfcc3a4c85d3f05c932da7c26d0201ac36f72abd4435ba90d0464a3ffed703"
 
 DEPENDS += " \
 	python3-setuptools-scm-native \
-- 
2.47.3


