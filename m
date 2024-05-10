Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1BF6C10F1A
	for <webhook@archiver.kernel.org>; Fri, 10 May 2024 00:57:39 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web11.2225.1715302657040739767
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 May 2024 17:57:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HC3Mnnzb;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1ee7963db64so11543145ad.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 09 May 2024 17:57:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715302656; x=1715907456; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9l7mq0xerlSb/8/VtywMZhrIDj5hZmDv0yEi6LKfvik=;
        b=HC3MnnzbN9+XXJniEo9uC9Bu0sgS2gmB4k252evLo+nlnWJVMVrqIYoXbJIo+xDYmk
         fEfMGlQgXy3ZfyS6gVfJsFd5rqEacouWqZ5urd8legnsC9nRs7OJJlHfxPcZa207hsoC
         eOFy4C0PH1lnDgCmGAyaPVFoi3rJTFwS7ryIujtkn5wFnwhqvjDHsLn9fC2eNIIu/mCE
         CZhTRA1s6W535r6xPdO9qocBlVReO2tt4m9rG/OHdhGRha2JL72GEqpp5XeHVAzTS+av
         7nOkQhXz9QilYJfxADH7lTi72CSK2NoLU2720oQYSEaQuWQqsEqYWsjZT71RJjG8nwD2
         Y5rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715302656; x=1715907456;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9l7mq0xerlSb/8/VtywMZhrIDj5hZmDv0yEi6LKfvik=;
        b=iJPO/7xY6OJRgQ4SU7m8JjN7memde8EyQ/HijFSpoPcfLxo5hzrNP0QNQA0CLG9kx+
         o8+I5DcO3LwHqjLq6euHzAeCb55FsKJ4h7fKAjELUndpLo/Th2A3AS7QUnGZJfNIfYFn
         OaptHT6jGd2geOqjMlTeoS4Ik6xM7hTEBUqXqRkdsFYcAdk13+ZCX534D+07foLkOAlC
         Mq9lj3IpPFF3cg9WTG+bOOK2Yaie6TgpG8W2L7n4rMIcKyjm5ISLOWPyCHivqmwyd0qt
         T84TzQx2dVhtlXoM194y9Qsu1/kX69/S9I5sf2zjWlUamGsIAve7cLl+gk+U59zJ6m+v
         FEBQ==
X-Gm-Message-State: AOJu0YwJ6YChbsPAdZd/VMcLmLpq+9/ZqxJ50XMmtADdetSPnwKqMT4p
	0Gx6Q0d5UrAWoQ02yxQekMtAxdRQO0QSkGPVpXWewx+5sK4DxdZ1xcwcSQvTuAQ=
X-Google-Smtp-Source: AGHT+IE0WpWjslawZ43FBXkzM8io/b7BrPZJ3Yrf9gTICotozMNqXrTPSEY+Lx0t2gD8bU6NZFHXyA==
X-Received: by 2002:a17:903:41cb:b0:1eb:5222:f13e with SMTP id d9443c01a7336-1ef43d16e53mr14968265ad.8.1715302656158;
        Thu, 09 May 2024 17:57:36 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::f4db])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0c13823asm20508605ad.263.2024.05.09.17.57.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 May 2024 17:57:35 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 3/4] gtk+: Disable incompatible-pointer-types warning as error
Date: Thu,  9 May 2024 17:57:30 -0700
Message-ID: <20240510005731.2074507-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240510005731.2074507-1-raj.khem@gmail.com>
References: <20240510005731.2074507-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 10 May 2024 00:57:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110302

Fixes build with GCC-14 which treats this warning as error by
default

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-gnome/gtk+/gtk+_2.24.33.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-gnome/gtk+/gtk+_2.24.33.bb b/meta-oe/recipes-gnome/gtk+/gtk+_2.24.33.bb
index 5eac641cf3..74b0531414 100644
--- a/meta-oe/recipes-gnome/gtk+/gtk+_2.24.33.bb
+++ b/meta-oe/recipes-gnome/gtk+/gtk+_2.24.33.bb
@@ -32,3 +32,5 @@ python populate_packages:prepend () {
     if (d.getVar('DEBIAN_NAMES')):
         d.setVar(d.expand('PKG:${PN}'), '${MLPREFIX}libgtk-2.0')
 }
+
+CFLAGS += "-Wno-error=incompatible-pointer-types"
-- 
2.45.0


