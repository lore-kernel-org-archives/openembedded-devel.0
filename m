Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79B69D3E78E
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 22:57:59 +0000 (UTC)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
 by mx.groups.io with SMTP id smtpd.web11.29855.1730837377026717332
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 12:09:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KgIDWUgu;
 spf=pass (domain: gmail.com, ip: 209.85.128.179, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-6ea0b25695dso49489497b3.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 12:09:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730837376; x=1731442176; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JHDjx7Mg332LzFbD4XlDw1kWRgULRPAHyFDFfP9bqHo=;
        b=KgIDWUgugcz1kOqDD9r6CGPW6Aou5TS7TaNa2/eSqsYae1+DvOHPv8QFvcgoy4sq16
         NUgllEFKD+GzAyIPxfJmbLFgCw9RJ4YOQCJnJwZz1lXWE1N/YF6oU3UhNDR1vueQAxVn
         Tgp7dYSa6gdaxargHkLWfP6dXNBE122WLVem//CSezlU6j0a/zYpmphjG+jDG6+Zwx6m
         WrFw/2K2OcLoPbsPPSxcGZilhCHxHrLkd/o+OJa2xE/KGY2CR76ZZvz1WpmZ++PnNOEP
         HKRDdJtab9qxk7+iD7Y0jc2fwXEURVdhN58MTNoB80KiCtseVSL5ukr1B8KXA9cs+YZw
         ldrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730837376; x=1731442176;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JHDjx7Mg332LzFbD4XlDw1kWRgULRPAHyFDFfP9bqHo=;
        b=oV05HjY6pmkQkey1TH0Iz3ZVEdtCULqlM6HKMDtUcQ0nYuJK4B5mgh5B8PZkmjGe3d
         9AwgomC9WoISJSmVjv5k/F8JReLno8UEhI8XO1p7VUy6rNG0otUkhY09njfyxm+/bMRG
         /iaAc732Mke0dTJBvNAsYnz6oekC4fojnu/Sjpqs4pg1NcySbVk9xo+QwxHkoWve8cBc
         sS+X6YmxVW7645ll0jVsOZ9cVCZINuw0TGoDCEfDptuwzp9LuM3MC+4O7sRFQvjBxW0X
         rB5mfF0881Fs7t+EuTmYi8WI5TnWdn5WuUJ3JWBn3DHjJROVmFGXMhQlol0OSPgGfahe
         0uqg==
X-Gm-Message-State: AOJu0Yyf+GcTFmijOW7wXZkH9ErQhGZPuixcZUp4CS/AlGbuEUGLiGLZ
	Q2OM5iaB+ZwHYpHb2Ee1punfQwdxoM0crYS5Aq7r+u4ZgcKGrow7mlR3hxl2
X-Google-Smtp-Source: AGHT+IENeBrrgWPbt6iGd7dWY+8WIp/kBaa927rXzGM3BbYSHQvRn5Z14dFdA6JXylwmKeYhmvlfSg==
X-Received: by 2002:a05:690c:fc7:b0:6ea:95f5:25fb with SMTP id 00721157ae682-6ea95f52fc9mr85221957b3.3.1730837375656;
        Tue, 05 Nov 2024 12:09:35 -0800 (PST)
Received: from localhost.localdomain ([71.215.7.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55ac9788sm24384527b3.9.2024.11.05.12.09.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 12:09:35 -0800 (PST)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-oe][PATCH 102/161] audiofile: Drop unnecessary SRC_URI md5sum
Date: Tue,  5 Nov 2024 15:05:52 -0500
Message-ID: <20241105200651.39395-102-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105200651.39395-100-schonm@gmail.com>
References: <20241105200651.39395-100-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 22:57:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113620

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-oe/recipes-multimedia/audiofile/audiofile_0.3.6.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-multimedia/audiofile/audiofile_0.3.6.bb b/meta-oe/recipes-multimedia/audiofile/audiofile_0.3.6.bb
index a09f84381..d7181e7b5 100644
--- a/meta-oe/recipes-multimedia/audiofile/audiofile_0.3.6.bb
+++ b/meta-oe/recipes-multimedia/audiofile/audiofile_0.3.6.bb
@@ -14,7 +14,6 @@ SRC_URI = " \
     file://0002-fix-build-on-gcc6.patch \
     file://0003-fix-CVE-2015-7747.patch \
 "
-SRC_URI[md5sum] = "235dde14742317328f0109e9866a8008"
 SRC_URI[sha256sum] = "ea2449ad3f201ec590d811db9da6d02ffc5e87a677d06b92ab15363d8cb59782"
 
 inherit autotools lib_package pkgconfig
-- 
2.43.0


