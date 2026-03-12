Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BD8E106ACE3
	for <webhook@archiver.kernel.org>; Thu, 12 Mar 2026 19:37:01 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1301.1773344215859653557
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Mar 2026 12:36:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gnpQuIIg;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4852f8ac7e9so15873795e9.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 12:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773344214; x=1773949014; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=n24SJJ4w2iCkrgguFOwaVVYukOdbdK+oJBXR3p8/8fw=;
        b=gnpQuIIgZ5nrs05ufdnqri2yWoFCgQpssLlAh97tMNFi9WVS1SCwhb/umep4NFYOeA
         xQtX0vdhPhNhBnPhQ9IjD2RSkJ71V5uWjPbJGLoCRKZ/E6LT8/KB29Hf/g856Ry83Jw3
         pjbqoMZ7s03LsibjpHo35xZrLOiEHgqqQxm6EnEB9Ex4vLoy8X9mtdOQuC8FqqjUoBrv
         r4SvSoMClfgi00RPNbGekJ8e8cdsJcZoqQC7WSfKxZko41wseE85AhRDbTToqvXuFFGU
         zTTTmTt+8sjRAXQ1F3hycUM8BIyBmXjfKS0IPTpEFJHFVYAIsMshS7JTHQzSsrFO/q5O
         dfKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773344214; x=1773949014;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n24SJJ4w2iCkrgguFOwaVVYukOdbdK+oJBXR3p8/8fw=;
        b=dwCV11DQh2ZsFR3+CIBSGIJUiJfKCQwVwWt/OeaacZo+xijvjA8aorTKXQ5ZxsyWYs
         wtSX9rJ4N2vYYQi+d3EYmG6ySucL5kIwxUnvf/ekCpCZX503lv6TPlz3haB5+Ra6l+zU
         dqy0r3ywkWFSkMaU+ATV6c441OOoZByabNuSswDJmFT5Wh6LCfKnIdHMZ2eA/wEvelu3
         idmZFt6V4AXXjbsHXuQYaslqabf4pJNSIoe2BmoyvaoygqJ6HzdACuFeSfH37kJFhLGJ
         lvG8EqTvChgBqdADL6rDN54Z7ofI6g3G56tBcCcZalGECNh52pll9lGPgfwxVTU7zLMD
         Jtfw==
X-Gm-Message-State: AOJu0Yw2pFQa9z/Hh11AOx2R2/PiNT+NsZ6isvKwmKxW6XJZdVbRbL6v
	2qO3XIaxbQj7Cq2avzdwnEPbygwZzTbElThlpBrhnr05Lp/UxUEpNGQ296+J4A==
X-Gm-Gg: ATEYQzwLl3DbGZ4QhdV2oG/q7EVKwHbgEiBWo7Ix4CBeGC0seRxGnbKl7mNvUxvOIR8
	oPVzf8wx7Rs7VnVKxJii9YWN8sqM2UxaiGe/A0/ICG2GnuRdGkNgPFQkB8C2fzkYh5YJZqcsNg8
	z8IiivmIt/ZVfzBmg9kg4tz0ZCbK9+uS7473+ZMgWyqdYyA643V07YaIZYO6SyMoDSoFEsZ8Id0
	KZGh6YnMnAZbXrOkInQhp+Q+ChM4ul2TiqJ1PEWvCjdwm6Cz8UVFx81EEOMcpqbwDiJ2nCmE+YB
	YZtRd/Uf5MUT8Y0weljDuVgNn99E3oB48K4izRNVeRsXQFx8ivZlwvAhxfn/uOhGLNOKX2+pUXD
	Q6vb1+hqjelZ7zN+s/XYHLJnFLAZPYEGQsnMKnoFf9+N+BOz9jRCCtaTZMHIY+YaWPiRLaYiSGV
	IAyabvmFyMzQi8vrZcwnR4
X-Received: by 2002:a05:600c:8b45:b0:485:35ba:1d81 with SMTP id 5b1f17b1804b1-48556703194mr7573155e9.21.1773344213995;
        Thu, 12 Mar 2026 12:36:53 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48557a73a75sm1111315e9.15.2026.03.12.12.36.53
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 12:36:53 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-webserver][kirkstone][PATCH] hiawatha: fix SRC_URI
Date: Thu, 12 Mar 2026 20:36:52 +0100
Message-ID: <20260312193652.2758711-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 19:37:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125176

The tarball was moved to a new folder on the source server.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-webserver/recipes-httpd/hiawatha/hiawatha_10.12.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-webserver/recipes-httpd/hiawatha/hiawatha_10.12.bb b/meta-webserver/recipes-httpd/hiawatha/hiawatha_10.12.bb
index 497babb89e..9b5a152df7 100644
--- a/meta-webserver/recipes-httpd/hiawatha/hiawatha_10.12.bb
+++ b/meta-webserver/recipes-httpd/hiawatha/hiawatha_10.12.bb
@@ -6,7 +6,7 @@ DEPENDS = "libxml2 libxslt virtual/crypt"
 
 SECTION = "net"
 
-SRC_URI = "https://hiawatha.leisink.net/files/hiawatha-10/hiawatha-${PV}.tar.gz \
+SRC_URI = "https://hiawatha.leisink.net/files/download/hiawatha-10/hiawatha-${PV}.tar.gz \
            file://hiawatha-init \
            file://hiawatha.service "
 

