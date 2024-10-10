Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2019DCF07C6
	for <webhook@archiver.kernel.org>; Thu, 10 Oct 2024 08:48:38 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web11.38929.1728550115408471211
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Oct 2024 01:48:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AEAj3UP+;
 spf=pass (domain: gmail.com, ip: 209.85.218.53, mailfrom: alperyasinak1@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a9943897c07so94863466b.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 10 Oct 2024 01:48:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728550113; x=1729154913; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8hcqNrdQ1pfXzjwmNIov/6ygrL8AZfPcKxkdCZWGyWM=;
        b=AEAj3UP+0krs4ZVPPJbhoHD17+j+AcDWiZgnZIfT53LFqDbB0TQbYszlTbjp6xnOtc
         YUAU26iXfZ4wYSZeqtOFwgxS3UupCNBHEEkmtDEL3txjdJNrbTBLmFUzDdMkcR4N45Pp
         BIkBcIcHmQSFASSrhDYoQyxXCF4rs0QCXRhpiN6mokSC/Of+ckciMAM9Dxofiw6tgGVi
         7VIxtmV0yP1kfZ7n9leFHp9ftQBQ6m5ucuj9qyBytvo5FSM2Uzt0Z+HWF7Rtlbsr4ZNt
         sHQ7b1u7XHcVCuh1XlvWPyt1fe+7ZAowINHaCa91B2ocVbBvLyuP5HEH71kIF0N4Cgiy
         XzNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728550113; x=1729154913;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8hcqNrdQ1pfXzjwmNIov/6ygrL8AZfPcKxkdCZWGyWM=;
        b=USk5MdyWmdka1qo1nVnlFAXUoRCVIr4AmkAxfljlCGIduuJn/0jsGKY6sfZJBo14gm
         pd581q1ywAVym9x0L7Gdq+RN3FJ/yOi/7Bbuh1jc0x8VhXLebD0nfHIKyAe4cKK53idN
         MLO0reuOTbKNHL3MgZCg09ZtMbjC8kXxWeZ4oaVCMOtbf/TKGJqtHESbhJOWJCJpnHCC
         6IV2tPCMFPvr4aFZLJTzc+XleZxAUDPYSv7Y6nvps58TiHq3Hkxchhj73VYEABMf846x
         vYvGFoRORZMN3+P+gzvh08e7U9pEf7k1VjThHnwGocY8xGAHT7dIcf6ybfose4U2aMLH
         Ekjw==
X-Gm-Message-State: AOJu0YwzL0d/51gJJWT3nTy7NZQIvt0mbPSFEpBew+2XtXspdiJJu5yU
	AQJFur57yFjfo8/77L2qtLtLNyfDKPBQw7lFgaNXnGP4TLFb/9IZl0+wLh+/
X-Google-Smtp-Source: AGHT+IFPeCnFi8lVjPonksssOmpCK5sk01GgP5Jf0XjNXN/kOsiu6ftpz+wHUSsSzxnC/LUGnOHmoQ==
X-Received: by 2002:a17:907:e65c:b0:a99:5773:3612 with SMTP id a640c23a62f3a-a998d202140mr484403666b.36.1728550113047;
        Thu, 10 Oct 2024 01:48:33 -0700 (PDT)
Received: from localhost.localdomain ([176.33.66.209])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a99a80c0238sm56844466b.115.2024.10.10.01.48.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 01:48:32 -0700 (PDT)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-python][PATCHv2 4/6] python3-spidev: switch to PEP-517 build backend
Date: Thu, 10 Oct 2024 11:48:14 +0300
Message-Id: <20241010084816.40869-4-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241010084816.40869-1-alperyasinak1@gmail.com>
References: <20241010084816.40869-1-alperyasinak1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Oct 2024 08:48:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112770

Fix:

WARNING: python3-spidev-3.6-r0 do_check_backend: QA Issue: inherits setuptools3 but has pyproject.toml with setuptools.build_meta, use the correct class [pep517-backend]

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 meta-python/recipes-devtools/python/python3-spidev_3.6.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-spidev_3.6.bb b/meta-python/recipes-devtools/python/python3-spidev_3.6.bb
index e3fdc435a..807ee5b78 100644
--- a/meta-python/recipes-devtools/python/python3-spidev_3.6.bb
+++ b/meta-python/recipes-devtools/python/python3-spidev_3.6.bb
@@ -12,4 +12,4 @@ SRCNAME = "spidev"
 
 SRC_URI[sha256sum] = "14dbc37594a4aaef85403ab617985d3c3ef464d62bc9b769ef552db53701115b"
 
-inherit pypi setuptools3
+inherit pypi python_setuptools_build_meta
-- 
2.25.1


