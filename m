Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 908CFC3DA4A
	for <webhook@archiver.kernel.org>; Fri,  2 Aug 2024 15:30:54 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web11.95404.1722612644616205974
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 02 Aug 2024 08:30:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=DNeorZD4;
 spf=pass (domain: konsulko.com, ip: 209.85.208.49, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5a1c496335aso6502101a12.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 02 Aug 2024 08:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1722612643; x=1723217443; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aHA7w3OSMPwSoMYzejsp9yTYzIoSgn6Y/H8BnEEktwM=;
        b=DNeorZD47Mo16kdgTabxXsipu8aeUP+yPmiVq5WaKdwcZk/mZ989Eh8+OObjvgs/11
         hTWNxchVzVqLYiqhBNTh0oxMTElzW8h1mGLXazlfKM8xxSoRTStcpm0kChyWGCqZPVkt
         CowlPSTfqrSElm/M4ohyVoGMq4H+OBm7O1d1Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722612643; x=1723217443;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aHA7w3OSMPwSoMYzejsp9yTYzIoSgn6Y/H8BnEEktwM=;
        b=SW57EaO0l9y2bh2rccyIvef47U+yy900EFZwvF/1xx0m/tB2M6fTb89UKgtVYInqCf
         vqbDMUlcChnK2JCluvGWPQqniVkgqEZWsmliRA3j2QvPTTF99oK8iMNjYgo3CKQqS1Rk
         ejBVifyVVD78b4yQpF5ihq8qf2zDxMR5PqMLqxbLrKyI5xuy1cjCO15v42idPbuv1jOG
         aMM2L9hm27V0CQoDBPl+sikap8v40Fx5BbJqhdES+mwH/OYhLZN0WlookhXS2YlZyiiE
         Fprt5WDjWNdZbQYtchRWwmYQciG+zzI2X1DaGEYKZ/Fdj1sODBRFlNqHotxQuswy/TnE
         HYig==
X-Gm-Message-State: AOJu0YyyqqECPKy6rdF1d0WcLROKMO7wtsZVYF77GqXv3xbcbaN9+EI6
	OQZJOcBkDvEy1jmevdHj39wJish4EPimJ8aEHHccnloKAFkAIP0LLXKMWfksSWYg/06ls+wo1uK
	3
X-Google-Smtp-Source: AGHT+IGkG5PN6YAxtLevrTR6HarhmYzgwSCvUhC23I4o7EGoZYPGyzHkatxUlKZ/cTHf1LPjMGF93g==
X-Received: by 2002:aa7:d552:0:b0:58e:2f7c:a9c with SMTP id 4fb4d7f45d1cf-5b7f5129844mr3691574a12.26.1722612642793;
        Fri, 02 Aug 2024 08:30:42 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5b839719fdesm1246863a12.8.2024.08.02.08.30.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Aug 2024 08:30:42 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 5/5] python3-cachetools: Upgrade 5.3.3 -> 5.4.0
Date: Fri,  2 Aug 2024 18:30:36 +0300
Message-Id: <20240802153036.2649396-5-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240802153036.2649396-1-leon.anavi@konsulko.com>
References: <20240802153036.2649396-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 02 Aug 2024 15:30:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111501

Upgrade to version 5.4.0:

- Add the keys.typedmethodkey decorator.
- Deprecate MRUCache class.
- Deprecate @func.mru_cache decorator.
- Update CI environment.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...{python3-cachetools_5.3.3.bb => python3-cachetools_5.4.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cachetools_5.3.3.bb => python3-cachetools_5.4.0.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-cachetools_5.3.3.bb b/meta-python/recipes-devtools/python/python3-cachetools_5.4.0.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-cachetools_5.3.3.bb
rename to meta-python/recipes-devtools/python/python3-cachetools_5.4.0.bb
index 3ef75d470..94d899db1 100644
--- a/meta-python/recipes-devtools/python/python3-cachetools_5.3.3.bb
+++ b/meta-python/recipes-devtools/python/python3-cachetools_5.4.0.bb
@@ -28,6 +28,6 @@ do_install_ptest() {
 	cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
 }
 
-SRC_URI[sha256sum] = "ba29e2dfa0b8b556606f097407ed1aa62080ee108ab0dc5ec9d6a723a007d105"
+SRC_URI[sha256sum] = "b8adc2e7c07f105ced7bc56dbb6dfbe7c4a00acce20e2227b3f355be89bc6827"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.39.2


