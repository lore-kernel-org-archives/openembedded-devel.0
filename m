Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53461C3DA4A
	for <webhook@archiver.kernel.org>; Mon, 12 Aug 2024 03:28:51 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web11.38431.1723433325222235409
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 11 Aug 2024 20:28:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=j4wpWIIr;
 spf=pass (domain: konsulko.com, ip: 209.85.214.174, mailfrom: tim.orling@konsulko.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1fd65aaac27so32585205ad.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 11 Aug 2024 20:28:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1723433324; x=1724038124; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cvNmUrqEAbtQIRBz/nw6dSiZTk7JUuAAXtJHPvyJKdk=;
        b=j4wpWIIryBXHLJItk92UgMQMAx7aW4L3fnHoj6QIDmQFEiqi8GFKiObCou8GrGHFog
         qfoCDFR1FFxQbL/91OK0GP5k91McjqTqjoSFgsr6sshOTEBk+4vyzAXzbbrMpCaqWOhu
         HhiU7PW1lCuEqS6UWPbG1KSO7SWlIE37eoTcw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723433324; x=1724038124;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cvNmUrqEAbtQIRBz/nw6dSiZTk7JUuAAXtJHPvyJKdk=;
        b=ep208shNJvPQhmRd7D48KF+ylWq8Gnice0cV8geZ0vgmVUMpwtM6AHkN8mX0FR0Wy4
         Tdcs4hEMpPfjYMqJUCMHWEBQgFV22xSs67OGdzwPKXSEUxw5h8JovOeAo4Hi4WKoc06A
         48qFWXvwUpYwWv81cf1yF4UA9vkRGJYZISWW1K5KXWLByMzQnAzj5Z0Tm/7oUN+T2MCu
         Mq3+uia9FQwhrYlevu+oUYTGARDxsnHahr5sxb5Hm79XGP0i3MVwgV5YzoAo/4T+34B1
         HB0h64N/F7qA0zY06HVS7be/G3LzJidepWSHbCXMMPZGT9Cle5XTxjZaPHbzKn7WX8Jz
         ZEJg==
X-Gm-Message-State: AOJu0YwZgfQgh9rW3McOOTs5pcAN6uorlVnCUS2TLPTjXHkGVSLJdk19
	0ILELr220Y2xmqm1gi2uPsNzFsBrXzm9gCnszcyw4wT1ERD60Xr0dIkGDS7GZwa/OltwCKOzand
	ttbk=
X-Google-Smtp-Source: AGHT+IEG3Jo1jDDoKfFvtFAaQa0F41bDewbteoLGIQ4DNqIIr3WKDqPe/S8kVphDP10nv5wy/svztA==
X-Received: by 2002:a17:902:da85:b0:1fc:5b81:729f with SMTP id d9443c01a7336-20096ba9cbamr157979445ad.32.1723433324163;
        Sun, 11 Aug 2024 20:28:44 -0700 (PDT)
Received: from localhost (c-98-232-159-17.hsd1.or.comcast.net. [98.232.159.17])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-200bb9fe964sm28379655ad.185.2024.08.11.20.28.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Aug 2024 20:28:43 -0700 (PDT)
From: tim.orling@konsulko.com
To: openembedded-devel@lists.openembedded.org,
	akuster808@gmail.com
Subject: [scarthgap][meta-python][PATCH 4/6] python3-pydantic: upgrade 2.7.3 -> 2.7.4
Date: Sun, 11 Aug 2024 20:28:12 -0700
Message-ID: <9684ffde9c0a61f11e9ee4ac69f1114112577880.1723432397.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <cover.1723432397.git.tim.orling@konsulko.com>
References: <cover.1723432397.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Aug 2024 03:28:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111762

From: Tim Orling <tim.orling@konsulko.com>

https://docs.pydantic.dev/latest/changelog/#v274-2024-06-12

What's Changed
  * Packaging
    - Bump pydantic.v1 to v1.10.16 reference by @sydney-runkle in
	  #9639
  * Fixes
    - Specify recursive_guard as kwarg in FutureRef._evaluate by
	  @vfazio in #9612

Full commit log:
https://github.com/pydantic/pydantic/compare/v2.7.3...v2.7.4

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../{python3-pydantic_2.7.3.bb => python3-pydantic_2.7.4.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pydantic_2.7.3.bb => python3-pydantic_2.7.4.bb} (95%)

diff --git a/meta-python/recipes-devtools/python/python3-pydantic_2.7.3.bb b/meta-python/recipes-devtools/python/python3-pydantic_2.7.4.bb
similarity index 95%
rename from meta-python/recipes-devtools/python/python3-pydantic_2.7.3.bb
rename to meta-python/recipes-devtools/python/python3-pydantic_2.7.4.bb
index 423fe76733..04c9c91c0e 100644
--- a/meta-python/recipes-devtools/python/python3-pydantic_2.7.3.bb
+++ b/meta-python/recipes-devtools/python/python3-pydantic_2.7.4.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=09280955509d1c4ca14bae02f21d49a6"
 
 inherit pypi python_hatchling
 
-SRC_URI[sha256sum] = "c46c76a40bb1296728d7a8b99aa73dd70a48c3510111ff290034f860c99c419e"
+SRC_URI[sha256sum] = "0c84efd9548d545f63ac0060c1e4d39bb9b14db8b3c0652338aecc07b5adec52"
 
 DEPENDS += "python3-hatch-fancy-pypi-readme-native"
 
-- 
2.46.0


