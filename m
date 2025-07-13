Return-Path: <t.f.g.geelen@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05881C83F20
	for <webhook@archiver.kernel.org>; Sun, 13 Jul 2025 15:10:54 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web11.58252.1752419445818164182
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 13 Jul 2025 08:10:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=C9wmyofX;
 spf=pass (domain: gmail.com, ip: 209.85.208.46, mailfrom: t.f.g.geelen@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-60780d74c85so5036164a12.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 13 Jul 2025 08:10:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752419444; x=1753024244; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wVfn/zYu98WqMcUQI8OHyB2iUjPymZXf6Uq9jwZ62K4=;
        b=C9wmyofXfCEuJqOXZ11Hwkf7YsQZCg2ktx5YUQfqUDKRl+McTDgPR1AeNWdSIduvHJ
         obtggKW5dRS3vNgKNp+yDlninWF/gu7rWj+LpWVp0im0JYs01xceDn7pDsaH1evY+mad
         NY41gspZCLUW4w8ekE5sJ2Sn0upm6ME3dOmc4xU6xvco6qv4tUuKAJrPPTFQyLLSbc/H
         9kZaO0wiu8v29TSDEQkqxwtvaOj7eO1Hk/U+e5wXCloZaAHv5v9t6NQjvYTTfbaINXYP
         8JfKN13SOaP2gk9TFwOg02UkoXKxIBLOQH/R4cXZOJHFjuywuYIRKadQEg8eVq+0exdU
         bSPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752419444; x=1753024244;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wVfn/zYu98WqMcUQI8OHyB2iUjPymZXf6Uq9jwZ62K4=;
        b=iYVbYKnlHGEkjjUQYuqdkd+lJ1K4miJftz6Gl9Dffzvgj95txRq7dj66pX8TGTvOjJ
         BPFH5lrWItNNYm73PpnDPjgJC/PnGyN1943G/9YEyVhz4ReMaqjQjz4sAkGn1LTJzD8P
         7EKuxPjFlacQc6YdHhIC6zqPG2/dHMXiQ1wrTG0nU7ZkaCXHDPuuf5Uz6YGWzIYWoBaJ
         TXPnbn19YY6Hj61ok0ij5JadQ9eaMfqdM2w8tjy7C5n6f20OsphlXSILoQWPhOOuN3ob
         bgTBBN6IULR2iDpYoipZ/EFQyNY9n82OEI1U6VQhSuFHTb4JbkmOcBSC8opL9Yjc0zrw
         3ThA==
X-Gm-Message-State: AOJu0YwSbGWz2RrrjqvJScwX7kci0lxzX4532/vsfjtLQzFIkJxZL19O
	UX96PR9Hs+nqlLceRORB4mdBp2WrJM5a9vuKgBHnILSeV+/kqTknGeynkXVEHRYE
X-Gm-Gg: ASbGncs+PFvdnxAXYm6EfWvTVx1sfl9Nk1Gm6iy6uoMLzziAY7ggd55/sAG6vlStwKd
	AJgwBWqu/U1A1HG1dlUNubgFncNfNV5qIKuDu8GY8wXYWMUpYClnjbUVN0rYykk3hChmHf2IW/y
	6XBUM/JURFJyLooG4XuyiO9DcE0czmIqutrek4iEb9T2VkCusv9aMStYF6siaVqveU3W4RoTouK
	J8Mi8h8CxwZ7GeGdA4McIq+erGWIdpkJG3VAeYddlOnQyrgB5Py3plfMQ3aBFypFvPTcfUZ6tU4
	/KoItuix8WbstbD7/Z90SyWS2Vn9cHgZgPJDBF71wOjmwVA5FSev7/A0I6VuD66TEosRuZkDBiL
	ZdKYoz19QD3neicZTIxVA5SxpRiDY2Vlt2ttvKF6w+N38MZQcTNzCWrJqiQnzIGRVCBBRFPWjWB
	u5
X-Google-Smtp-Source: AGHT+IF5eigTRm2WyfzUQOqqW/eHumbK0y/9L6MbtFx7+qfhA6ixw/Txlt6brFSKmKHrWd7AT2dPqw==
X-Received: by 2002:a17:907:1b1b:b0:ad8:9c97:c2e5 with SMTP id a640c23a62f3a-ae6fb7def4emr996078266b.0.1752419443507;
        Sun, 13 Jul 2025 08:10:43 -0700 (PDT)
Received: from control-center.fritz.box (150-12-20-31.ftth.glasoperator.nl. [31.20.12.150])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e8294c0asm650493066b.127.2025.07.13.08.10.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Jul 2025 08:10:43 -0700 (PDT)
From: Tom Geelen <t.f.g.geelen@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tom Geelen <t.f.g.geelen@gmail.com>
Subject: [meta-python][PATCH 5/6] python3-pytest-unordered: 0.6.0 -> 0.7.0
Date: Sun, 13 Jul 2025 17:09:42 +0200
Message-ID: <20250713150938.2992477-10-t.f.g.geelen@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250713150938.2992477-2-t.f.g.geelen@gmail.com>
References: <20250713150938.2992477-2-t.f.g.geelen@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 13 Jul 2025 15:10:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118512

Update PYPI_PACKAGE as the package naming has changed
---
 ...t-unordered_0.6.0.bb => python3-pytest-unordered_0.7.0.bb} | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pytest-unordered_0.6.0.bb => python3-pytest-unordered_0.7.0.bb} (71%)

diff --git a/meta-python/recipes-devtools/python/python3-pytest-unordered_0.6.0.bb b/meta-python/recipes-devtools/python/python3-pytest-unordered_0.7.0.bb
similarity index 71%
rename from meta-python/recipes-devtools/python/python3-pytest-unordered_0.6.0.bb
rename to meta-python/recipes-devtools/python/python3-pytest-unordered_0.7.0.bb
index bf1420cf93..36b8a5dcd0 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-unordered_0.6.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-unordered_0.7.0.bb
@@ -3,10 +3,12 @@ HOMEPAGE = "https://github.com/utapyngo/pytest-unordered"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=fcd3af2d38a4d4dfd5138c6f163dbe2e"
 
-SRC_URI[sha256sum] = "f61b4f6e06a60a92db50968954efac93e2f584290a49f53ad135e3f32f57e02a"
+SRC_URI[sha256sum] = "0f953a438db00a9f6f99a0f4727f2d75e72dd93319b3d548a97ec9db4903a44f"
 
 inherit pypi setuptools3
 
 RDEPENDS:${PN} += "python3-pytest"
 
 BBCLASSEXTEND = "native nativesdk"
+
+PYPI_PACKAGE = "pytest_unordered"
-- 
2.43.0


