Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8369BC38142
	for <webhook@archiver.kernel.org>; Tue, 24 Jan 2023 16:01:40 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web10.18830.1674576092033703936
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Jan 2023 08:01:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=RXXKACUl;
 spf=pass (domain: konsulko.com, ip: 209.85.208.54, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ed1-f54.google.com with SMTP id w14so18787597edi.5
        for <openembedded-devel@lists.openembedded.org>; Tue, 24 Jan 2023 08:01:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wQ0AqdpmhVUS8eojwA659DCf1EkJS2wtHO//wuZ0IGo=;
        b=RXXKACUlQh7ItR/aIwm4N6VOb42eeEHFahc7zMTLHOMSSvm1bfMxp/PUWSEeNuk03I
         hyWGForHIkfQUxRxdlMAQbaVWvjUSPZ0O6hPyHYb7uTG8ZonHLGF79zbdVNL+za+91iK
         vRjv1EltVmF0FD2oGJ5f1cC6ki7N6I6OBaXOQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wQ0AqdpmhVUS8eojwA659DCf1EkJS2wtHO//wuZ0IGo=;
        b=J5agQTLUE6XNbAyUIqUMdFBQm9odEn/tl3sFqSKd+W1NdKmdY3akELGMjCJinI6GKb
         iWggCpfiU1M9jRVBsry9Ov57AVc3uno3Dlc7KciX07mLsYVGfGmTCJBtxUT1OAlvQD5t
         Op+oEeFOv5igbg4Shb07pTsM3v5tfBF3+5LZbwWTNFQJQ16ZdA3cggw5O7E4Y5IikGfe
         ufG6DMQnx5mxEDGJ8KD1i9PGjGhXF4/RB2gmUf6LsDX+zRZLAzAkqOew1JYrA88cxupG
         3A65MPayULN2YGOzGZi6R+XQGyM841sOYYqs9Ri620QcQActJgDg8TEiKCEaBiaYC0jp
         crGQ==
X-Gm-Message-State: AFqh2krC/swiK6JpuVkfKMMfTv4+GW110mmzrHPGlw9MOHNbbTf7vRH3
	5ppB/pWalVir6di38S7m1kftXQTEp3cbitRGyDk=
X-Google-Smtp-Source: AMrXdXtzyMfUqeX8OjZdkHFa++7HfnogjHYzf7qeuSRplWhC4nsO9QiVp05wwfdfPvZ3wdKYjvOGJA==
X-Received: by 2002:a05:6402:1946:b0:48b:c8de:9d20 with SMTP id f6-20020a056402194600b0048bc8de9d20mr32520951edz.32.1674576090242;
        Tue, 24 Jan 2023 08:01:30 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id c3-20020a056402120300b0048ec121a52fsm1194750edw.46.2023.01.24.08.01.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jan 2023 08:01:29 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/2] python3-nocasedict: Upgrade 1.0.4 -> 1.1.0
Date: Tue, 24 Jan 2023 18:01:19 +0200
Message-Id: <20230124160119.377481-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230124160119.377481-1-leon.anavi@konsulko.com>
References: <20230124160119.377481-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Jan 2023 16:01:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100726

Upgrade to release 1.1.0:

- The default casefolding method on Python 3 was changed from
  str.lower() to str.casefold(). This changes the matching of the
  case-insensitive keys. This shold normally be an improvement,
  but in case you find that you are negatively affected by this
  change, you can go back to the str.lower() method by overriding
  the NocaseDict.__casefold__() method with a method that calls
  str.lower().
- Added support for Python 3.11.
- Changed the default casefolding method on Python 3 to be
  str.casefold() in order to improve Unicode support. On Python 2,
  it remains str.lower(). Added support for user-defined
  casefolding.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...{python3-nocasedict_1.0.4.bb => python3-nocasedict_1.1.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-nocasedict_1.0.4.bb => python3-nocasedict_1.1.0.bb} (76%)

diff --git a/meta-python/recipes-devtools/python/python3-nocasedict_1.0.4.bb b/meta-python/recipes-devtools/python/python3-nocasedict_1.1.0.bb
similarity index 76%
rename from meta-python/recipes-devtools/python/python3-nocasedict_1.0.4.bb
rename to meta-python/recipes-devtools/python/python3-nocasedict_1.1.0.bb
index 006799c8b..319598e3b 100644
--- a/meta-python/recipes-devtools/python/python3-nocasedict_1.0.4.bb
+++ b/meta-python/recipes-devtools/python/python3-nocasedict_1.1.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/pywbem/nocasedict"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1803fa9c2c3ce8cb06b4861d75310742"
 
-SRC_URI[sha256sum] = "7c111da4cefd244433cb63377aff081a40f84bddae9e6f376c67f086c0f806da"
+SRC_URI[sha256sum] = "ac551de692be6aea5b43ac3f2c33780df940013ac6dd0718fb552c8b560ba661"
 
 inherit pypi setuptools3
 
-- 
2.30.2


