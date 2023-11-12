Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 431E1C4332F
	for <webhook@archiver.kernel.org>; Sun, 12 Nov 2023 10:29:21 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web10.12829.1699784956746313495
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 Nov 2023 02:29:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=U2UWYD7p;
 spf=pass (domain: gmail.com, ip: 209.85.218.50, mailfrom: alperyasinak1@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-9e2838bcb5eso525520766b.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 12 Nov 2023 02:29:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699784954; x=1700389754; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DQfiwawX/9YuTutY5VZW18SiByIYM8L8yY/t6NUT2eo=;
        b=U2UWYD7p3ZLG1/5ULNGmWfvL4ajAJBcuejv/2cpcM+6JELDmVdm3N6n9RAxDSwymJa
         ySIK/AovyfdxhUF5V4J2I2JsIhGT94ZZW94Rxh67mhm6M6fUgJcIuBR1ybUg+2dWmKWW
         /JdQhR9Sl9JgKTI2GYSFcbcgB7hcFgijz/t05g/kKUJDHsufrkV0zMmiul3WexMbUXM5
         eqyPmmUvSxxGdKoop/wKrXTZHPZ9Y9JC6xaX5nqQJkqDqTdmIWjjfZQKlUwqAW6rOc6Q
         Yn5HiO2+46004aN7YcQK/CjwPZtbo6DpuIdDR8lwjhFYD/tM+9zRNLveQ8kzS6sR+AgZ
         4bfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699784954; x=1700389754;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DQfiwawX/9YuTutY5VZW18SiByIYM8L8yY/t6NUT2eo=;
        b=K94is2cWY5WOWBHaq976W0KHRrOq/S/7kdWbsNdNyQh0TxclMFLAXMxqvXxZoXgl61
         Nqq6GzSDd1RsWxZ2oxDzKUemyRIIye6ZntOLfp0etg6ThXjX/3jpUDwfWykwvFz8A8gQ
         M2j4exSvzOB109kU8R2Qrbf0TUc4RrZiH6YOGfo63zcU0Q/q6NlWDM3ajWS9zSWvgU20
         meHxKh2CwPIOhQTzSizyL+/kdAaK7XKDbkPqodm+NZZlBU/BzvYBImG/9tIM1D59Tulz
         EJNyPuoKH6zifUPgGvT4VyubyX5OpJ4I9pcaBsBuqg6bB4LGYDq1Vb20ufZttweYCJ6i
         8sKQ==
X-Gm-Message-State: AOJu0YyciPP3bgEtbuEDbbF7DZT6OgPWSx69I1ifhxkZsi6oym0K7CHY
	ujA67aycneYI22DfDoDtUc8Q1tQ7h+Q3lQ==
X-Google-Smtp-Source: AGHT+IF7l0v4K+tT3xzQiStUNudfMcVtQrmBsVioX3vCXbKhjJIpRoYbU8tVuXj9x36IZ1nQLS615A==
X-Received: by 2002:a17:906:d297:b0:9e6:b18c:15dd with SMTP id ay23-20020a170906d29700b009e6b18c15ddmr2744294ejb.13.1699784954388;
        Sun, 12 Nov 2023 02:29:14 -0800 (PST)
Received: from localhost.localdomain ([176.33.65.238])
        by smtp.gmail.com with ESMTPSA id t2-20020a17090616c200b009ddaf5ebb6fsm2370673ejd.177.2023.11.12.02.29.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Nov 2023 02:29:13 -0800 (PST)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-filesystems][PATCH] fuse3: upgrade 3.15.1 -> 3.16.2
Date: Sun, 12 Nov 2023 13:28:57 +0300
Message-Id: <20231112102857.135199-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 12 Nov 2023 10:29:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106583

Changelog:

- Various minor bugfixes and improvements.
- Readdir kernel cache can be enabled from high-level API.

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 .../recipes-support/fuse/{fuse3_3.15.1.bb => fuse3_3.16.2.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-filesystems/recipes-support/fuse/{fuse3_3.15.1.bb => fuse3_3.16.2.bb} (96%)

diff --git a/meta-filesystems/recipes-support/fuse/fuse3_3.15.1.bb b/meta-filesystems/recipes-support/fuse/fuse3_3.16.2.bb
similarity index 96%
rename from meta-filesystems/recipes-support/fuse/fuse3_3.15.1.bb
rename to meta-filesystems/recipes-support/fuse/fuse3_3.16.2.bb
index de2996db1..66c35010b 100644
--- a/meta-filesystems/recipes-support/fuse/fuse3_3.15.1.bb
+++ b/meta-filesystems/recipes-support/fuse/fuse3_3.16.2.bb
@@ -13,7 +13,7 @@ LIC_FILES_CHKSUM = "file://GPL2.txt;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 
 SRC_URI = "https://github.com/libfuse/libfuse/releases/download/fuse-${PV}/fuse-${PV}.tar.gz \
 "
-SRC_URI[sha256sum] = "13ef77cda531a21c2131f9576042970e98035c0a5f019abf661506efd2d38a4e"
+SRC_URI[sha256sum] = "f797055d9296b275e981f5f62d4e32e089614fc253d1ef2985851025b8a0ce87"
 
 S = "${WORKDIR}/fuse-${PV}"
 
-- 
2.25.1


