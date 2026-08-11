Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C65FAC5AC67
	for <webhook@archiver.kernel.org>; Tue, 11 Aug 2026 06:37:09 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.48553.1786430223508656277
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Aug 2026 23:37:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Qgn5IjLn;
 spf=pass (domain: gmail.com, ip: 209.85.215.173, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-ca97d139d5fso2317371a12.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 10 Aug 2026 23:37:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786430223; x=1787035023; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gLRu/2sIo9/O23L7Lys+/8/sacp1TpftFxp75+sWeyI=;
        b=Qgn5IjLnJeX/zRBl8E5rDUPwlDO41rzrN2bYXU8AeAZ6nPlcjvwqbMh7Xji8chaE85
         9jq03Lz5rPyvPp1DC9gMVMKlE85dQDqtNWdvh2+42MlbVbokAO303ZC7AHE0yTl0dAfj
         zFUJr0Hq58AOUz3p2/nTiBkp2pm/+Y/K9Kl7uEv5xHzBuoVs1yjC7cd/rbag8pWdl9GJ
         Z36JGS5wsw/DxIsOpITiN4E5LD7LmI1hwtB7BWiSnpXjpSFvHa2/yIGilDVYaay7/29b
         e0TkJMlskNqGTmuWJrNHhiUgyHWiXkuvERl0ch9SuIttlJCf7bT4+5Cm9Mry1PEB6UbT
         0lQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786430223; x=1787035023;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gLRu/2sIo9/O23L7Lys+/8/sacp1TpftFxp75+sWeyI=;
        b=NTit7xJzQArZGqoJ0r3ikogeIy/kNRrw+reEyJ6cGo1W6hysAar3CVzmq/Wm1lcjm1
         8zMzH9LTIDefqyjU+3iC+2i13ZZB3lUiDsRLfv9o6062R6sQQAXPwx0bz6b52V9xQSEs
         tO64UlBWKiJbFD/wFiTC8uhxISlvbtbqQD/H4BMYPgoI4ba/FC5WIsRTP3x/7hj4I9nb
         C78ZetK3u0Yr6aROyXHm3/3Pea3aSsvqEZnZAWwNRmKH/5lR5dxGw4rKbBefZ+I4bo/a
         L9KHIcDjZJ8b5HTo5FlQ3Dab50xanAqFRT9CXOhIniVWbjRAXvL8bXxL6ndBYEfbDvkX
         NnEw==
X-Gm-Message-State: AOJu0YzGqAQ4LeBZVAfGC/Fi4M2GjOSLLpKPXFOZKFgZdhwfcDMlpbJJ
	OY+xdYd6QPGvIdfW4vCoGBVljKvLUpsrzZ1YHYpFpCgXgCq1tBQtWbBFT1TEJnhh
X-Gm-Gg: AR+sD108lDw0r+w6s9SZV/mPmb5JCp98SiVzDY+H0M1ob4ezbLFuqt2FLeM01jo10Ih
	M04kT+P30WGmIA0fTt4fFr8eLU23Hc0v+rqx/Admks5O1aqB2KEKtyvlOEXwAhegE8rs+s2r53q
	Z+3aTpl7BcBZqZfedafEmEikJ/K7Hi9XGHBgCEQvZRzAKK+4m3U6PY1m/hH8sG4L+5egsnrqAu2
	jSG3h9x9yNMwlIHGol1HUgmRKCukUh79LuHTT+JeYKAJoVvBQcbyBSOfEb6xDen6PGeK3zIPa32
	/j9gXBNyaBsB7KSvSAm0No5ePu+/AhYlRUyV2gaXA1hCFCPn2kXln85Bi7bARJQiasoBPIvDhwP
	6zV+Hx4SzEqKkR/9jsPD/MdaQU3oUzYUytfm7u9fqPGbyd7OvKAxN2gV0t62M0oiCfVhvqZ2GX/
	TE1CAnDILj1combzm6Q36GduCN3ZLERUDFEHlSAAM372cOV5LvkoylThVSlFTxi6oYkdoi0OYtt
	g==
X-Received: by 2002:a05:6a00:4188:b0:837:e9cc:d474 with SMTP id d2e1a72fcca58-84fa867df7cmr1222009b3a.2.1786430222774;
        Mon, 10 Aug 2026 23:37:02 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84fa952841dsm154852b3a.30.2026.08.10.23.37.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 23:37:02 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][PATCH 5/6] python3-nltk: upgrade 3.10.1 -> 3.10.2
Date: Tue, 11 Aug 2026 18:36:42 +1200
Message-ID: <20260811063643.152169-5-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260811063643.152169-1-ankur.tyagi85@gmail.com>
References: <20260811063643.152169-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 11 Aug 2026 06:37:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128920

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/nltk/nltk/releases/tag/v3.10.2

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../{python3-nltk_3.10.1.bb => python3-nltk_3.10.2.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python3-nltk/{python3-nltk_3.10.1.bb => python3-nltk_3.10.2.bb} (89%)

diff --git a/meta-python/recipes-devtools/python3-nltk/python3-nltk_3.10.1.bb b/meta-python/recipes-devtools/python3-nltk/python3-nltk_3.10.2.bb
similarity index 89%
rename from meta-python/recipes-devtools/python3-nltk/python3-nltk_3.10.1.bb
rename to meta-python/recipes-devtools/python3-nltk/python3-nltk_3.10.2.bb
index c66cfece43..3e209a8d73 100644
--- a/meta-python/recipes-devtools/python3-nltk/python3-nltk_3.10.1.bb
+++ b/meta-python/recipes-devtools/python3-nltk/python3-nltk_3.10.2.bb
@@ -24,4 +24,4 @@ RRECOMMENDS:${PN} = "\
 
 inherit setuptools3 pypi
 
-SRC_URI[sha256sum] = "86a1b41d9ca0d35a2cb72fa60af4c9aaba9fe405b717161fd94cecd69f467007"
+SRC_URI[sha256sum] = "fcfd80fb77931868cea8357573c79838b8abc609942ef9914d1c9f6070d4645c"

