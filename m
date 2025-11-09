Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB32CCD13D2
	for <webhook@archiver.kernel.org>; Sun,  9 Nov 2025 16:00:36 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.27292.1762704032211031854
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 09 Nov 2025 08:00:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GSP57Pec;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-42b31507ed8so788409f8f.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 09 Nov 2025 08:00:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762704031; x=1763308831; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sDYXQrwNotbAkoT/6/4+gnYfK+urM7F1k0g9xUcQwYs=;
        b=GSP57Pect93cQl5tf7PzHWZsiiUrU4+1itWoUnB0KqQc0Y4PzJthqelQihIc8+OtfY
         RrWxXg4Vn0PCN2fp0QV9cT2nqgOgnMwGi9azW8xCi3MdNMVDL4L9anHFq7dmCIbNNG0k
         iRi/HNsNvcLvww2uevujaAFFeZFsj9+spGqoJ8SQWVaH3xPPmQRupGegQyqaup5WYP+S
         2VrSDVGaJpFb2ZYu+0PqoQ9eki27WYwO/CD8DX9WInZQWdFGi8CuTgn6F38zhBmraQeD
         tYVBbFsj2S+Gu5Sy1IA5w2IF4oR+5tzs0nhj96f8a4A6JRsWJgdWXUAjyJvIpcs5HM2H
         Gn0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762704031; x=1763308831;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sDYXQrwNotbAkoT/6/4+gnYfK+urM7F1k0g9xUcQwYs=;
        b=p4NcB9ialIN2p5dRj/evf068n+GINdI2W8nkiJMqctKoSFQhcYb0CEEf3qi738pOtH
         ItzW/BQE8NWoco3CiX8h970U4VZp+oNUSMvNRHRj7DAlYsufKrJG+yHI50yhSPj9Fn47
         I0dTrJL6WXTI+vrdDvxTkqmDsZZmbaiA7kgvBYUz0vBgkWQ5l6Wzk7NFbFekr8zzt6jq
         FSJqtWFg+YUVIjjpMYQilUU31V7UvGkzlG0Zsj8LJtg21RgZYXfgX5lutNywBgexYY+0
         aD3msRq8xKcR1r07J1cLrhyeqOxfdiEILmCR7NJ5OAhTEdY0NkUtpRZ6V2bT5mHXrXGv
         or5A==
X-Gm-Message-State: AOJu0YyQ3GjEzT4BAd8gglNoU3F6R4x6pmm0FCMf+UcKIIli6LEv5Nfi
	IQYzsv+6Yetwu6VOvvZ84NI0CjqauyhOJL87oI4sVq9xyU6dy08oh163v6F87YJb
X-Gm-Gg: ASbGncvnE3xY/+LTDZzm7EkY4hIu1ZAHuAIJxKd5PUFqxtRNbiqUSbtEo1hf559TH+M
	/NVlo9s3q15rGMJu9c4NDWOCi8Qah00nhkl58Fov7ccTpmHGttsK8uUucQpuUD5UtO6HwXb+nl8
	Xmn+tbcALrLXx/rLV1YXcjBZdjt27zOWeVunYiYCFDsB0SVHbrHcIXy4vqBgKsjlRyPWKItZ7mu
	ce1Euf6UpSBbUIR6r1DPUuzmnwSo4EaHaBOqAS0B0pj0XYDOjTfUwt3QH08KjvbOjQCZI7P1N4q
	v/n/11s60FX0UoHcfy+HFS2iUkuBUIYxN2tuhCEPPLsrDYJH5F7JYIGZnfDFeraUjCqAZwEeJza
	oYm8w5am0dbi9Aee5FX1RkskpuXW/XTwo3Xno6CCdIdI9MbQORVQmhxGe1vmfDgpwTGwFKKCICQ
	==
X-Google-Smtp-Source: AGHT+IG7aPKVC7GyDOvMYAx/5lxvlLV9CfR4veOn4ajRcf9W+AFczWTISTIXmFvZD/8Cmk7tMFL3vw==
X-Received: by 2002:a05:6000:2d12:b0:42b:2c61:86f1 with SMTP id ffacd0b85a97d-42b2dc7f5c0mr3085881f8f.35.1762704030531;
        Sun, 09 Nov 2025 08:00:30 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42abe63e131sm17406445f8f.20.2025.11.09.08.00.28
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Nov 2025 08:00:28 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH 09/27] spriv-shader-generator: fix SRC_URI branch
Date: Sun,  9 Nov 2025 17:00:01 +0100
Message-ID: <20251109160020.2522353-9-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251109160020.2522353-1-skandigraun@gmail.com>
References: <20251109160020.2522353-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 09 Nov 2025 16:00:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121425

Master ranch was renamed to main.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-graphics/spir/spirv-shader-generator_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/spir/spirv-shader-generator_git.bb b/meta-oe/recipes-graphics/spir/spirv-shader-generator_git.bb
index bf3070701f..57201b79b0 100644
--- a/meta-oe/recipes-graphics/spir/spirv-shader-generator_git.bb
+++ b/meta-oe/recipes-graphics/spir/spirv-shader-generator_git.bb
@@ -6,7 +6,7 @@ SECTION = "graphics"
 
 S = "${WORKDIR}/git"
 SRCREV = "f09ba2777714871bddb70d049878af34b94fa54d"
-SRC_URI = "git://github.com/KhronosGroup/SPIRV-Cross.git;branch=master;protocol=https"
+SRC_URI = "git://github.com/KhronosGroup/SPIRV-Cross.git;branch=main;protocol=https"
 inherit cmake pkgconfig
 
 EXTRA_OECMAKE = "-DSPIRV_CROSS_SHARED=ON"

