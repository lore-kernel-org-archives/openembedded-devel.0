Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE017C27C4F
	for <webhook@archiver.kernel.org>; Fri, 21 Jun 2024 11:35:09 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web11.70781.1718969704371294531
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 21 Jun 2024 04:35:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=qIRHRTqi;
 spf=pass (domain: konsulko.com, ip: 209.85.221.54, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-366dcd21604so84136f8f.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 21 Jun 2024 04:35:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1718969702; x=1719574502; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EzCAGGR0W5hsimtdzZwUCIHqtRjkngusuJFqxyCWQ9k=;
        b=qIRHRTqiN9XMEHulMmM+G9Ibcu7tYxW+mG65yJDwgKQu/0NXQ2fCoeaJ4bVDsQEhlY
         NkXUNIADhI3uVXALlVyEkkoTQCFV72AH4qdeJcp+7HhFXUtruhftNzcOT5+p39V7UhM1
         cUAtZgfH3Mh+Ca9YE/n4nO3Y64XbyP5j716aA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718969702; x=1719574502;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EzCAGGR0W5hsimtdzZwUCIHqtRjkngusuJFqxyCWQ9k=;
        b=MpoGJNiVo715P7vHhfXljzH+sKCUyCgdtNxYIx0B7bmkaama0AnJFL7QtPPhbNu9kY
         7uzBiUH1yuKecqjtb1ORgjq9lW04hhhS9E7fIJeaMtbQvrEuqbpu7vtaQshrrD5/X+wc
         6SytKqdmk9dx+0kkP48tWQ/xZfQ5m4FIOxPhcKj3xPsIq6imz33Fq9cHfilCxwQIv86Z
         gxuAbb4EHXhdJybiVoxQevasRpcDqcnNYXnGvAxuDimpqD/MBYwkB+AwqTLNX3OlZGNK
         GudRKlYevUbPzZiwkwfwiqIaE0nTHuMuoGICPhng/j9EKOPOznlPSdRPUq1NrUDZWYO9
         2zvQ==
X-Gm-Message-State: AOJu0Yy0wua5nT7a5dDtKLXzlqhjZ0ADHWCjtlYyUllu6LJdy8H2ldcD
	PNEjjQc6mXaV4nDehoTVGDINYopRvdFUviAeMllRKMV+gcjUfNRFVwBS2/yv+WsIbC/mlK+hF60
	G
X-Google-Smtp-Source: AGHT+IHCT7fk3Dt4UHWIuvoZXB49srWVzmrsrb5zkFGFNOhElsoPtjZODkX38OTcvzxBJF4JxIA/kA==
X-Received: by 2002:a05:6000:4028:b0:366:ab84:9c5b with SMTP id ffacd0b85a97d-366ab849d17mr1016049f8f.64.1718969702344;
        Fri, 21 Jun 2024 04:35:02 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3663a2f6d02sm1470662f8f.85.2024.06.21.04.35.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jun 2024 04:35:01 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/5] python3-pyperclip: Upgrade 1.8.2 -> 1.9.0
Date: Fri, 21 Jun 2024 14:34:55 +0300
Message-Id: <20240621113459.2188274-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 21 Jun 2024 11:35:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110988

Upgrade to release 1.9.0:

- Automatically cast the copy() argument to a string for all data
  types.
- Fix _py3_executable_exists and _py2_executable_exists that had
  swapped names.
- Pyperclip now "stringifies" all data types by passing it to str()
  (or globals()['__builtins__'].unicode on Python 2), so passing
  [1, 2, 3] would put '[1, 2, 3]' on the clipboard.
- shutil.which() replaces the custom code (except in 2.7 and below
  which doesn't have shutil.which()).
- Remove waitForPaste() and waitForNewPaste() functions, these
  aren't something the core library should have.
- Reordered so that xclip is chosen before xsel since xclip is more
  popular.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-pyperclip_1.8.2.bb => python3-pyperclip_1.9.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pyperclip_1.8.2.bb => python3-pyperclip_1.9.0.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-pyperclip_1.8.2.bb b/meta-python/recipes-devtools/python/python3-pyperclip_1.9.0.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-pyperclip_1.8.2.bb
rename to meta-python/recipes-devtools/python/python3-pyperclip_1.9.0.bb
index dcf0015c5..80af514fa 100644
--- a/meta-python/recipes-devtools/python/python3-pyperclip_1.8.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pyperclip_1.9.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/asweigart/pyperclip"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=d7dd4b0d1f7153322a546e89b5a0a632"
 
-SRC_URI[sha256sum] = "105254a8b04934f0bc84e9c24eb360a591aaf6535c9def5f29d92af107a9bf57"
+SRC_URI[sha256sum] = "b7de0142ddc81bfc5c7507eea19da920b92252b548b96186caf94a5e2527d310"
 
 inherit pypi setuptools3
 
-- 
2.39.2


