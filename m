Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0902FC531DD
	for <webhook@archiver.kernel.org>; Fri,  9 Aug 2024 16:32:27 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
 by mx.groups.io with SMTP id smtpd.web11.88292.1723221144776019616
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 09 Aug 2024 09:32:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Xoc1HwUL;
 spf=pass (domain: gmail.com, ip: 209.85.208.180, mailfrom: alperyasinak1@gmail.com)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2ef23d04541so24172091fa.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 09 Aug 2024 09:32:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723221142; x=1723825942; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cuMhcX0bFWEcasWPWrlgGI7i4NTDxSTUYxcfT6O9rok=;
        b=Xoc1HwULEGAeQq0SpA0AqDiAoS+ndBC5XFfzyDjtk4NgPVSOK0jXlooj4d9bIAOrDb
         hdSdWqyZrPjx5OIR7rekLch9JCCy95scKD0mGlRvb1kOX5KSuF4VYzuAOc4GQtqzpN/D
         X+x7qYIJ2qjnqDf30wedMFLMZGbVgz722H4CLccghaTLiIIN2jIezo1mlxJACyM1kWDR
         YS/QjZ8n8ruWy/e091DZYWM5oDzEFlk5/ZhQRmOPfhhFtYdDbQMN/bB9H/DDYoKpAHRb
         BefpPqvtFqlD0hT+cMXXo8omQiXGsKAqUwLCyKekbKH0DF26s36yjjx6F5cLcC6aRL2T
         YGIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723221142; x=1723825942;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cuMhcX0bFWEcasWPWrlgGI7i4NTDxSTUYxcfT6O9rok=;
        b=TfSZGI5B6NwpMXM9psaIu7ZtiYahghK/RKFaQhykOX+oQej4pDxDPAsZ4p77g0ZCqh
         YD+kd+r4r3dAYkrRSTJ2yA2H4dQPaL13oCEZhDt7/o35OXefdG6v9I8sVMomioQ5VTD5
         n82sWhH0kglVRfYOd+T06Qfm9EXAEF4x/JqQXKyQCJHDCjr261861Ijc20ehzq6VlGKC
         O+Tx1ga3vTetQh9DExJ0QHHF7EVqFvjMwIut0zeMtkoStvWw6zzOc+nllgj/HU2UpxTm
         HB9uOpAG+JYg6kSyxsEkWWT4yKDKzJbPoNl4RPUsRj7GKuJiJPZN7sxf1ZUkCL+HniKv
         IHuw==
X-Gm-Message-State: AOJu0YzDexlfXEp5n9t4KsekL6eUAC6B3fKNM1+KC+YiMyorOr3uEYJ0
	RuR8aLfrRvBZQAR391cSfWUovamJiUndkc0zoqvQiPBo9pHFwAvz/3YlBbWs
X-Google-Smtp-Source: AGHT+IHcA1XyvzJOPPiTKDCtEjxWqa1VcntFEZVk13rJTpYyel9Gcsn6CXzGUTU1wj1yESPiw4Wo0Q==
X-Received: by 2002:a05:651c:2113:b0:2ef:20ae:d116 with SMTP id 38308e7fff4ca-2f1a6907914mr20801061fa.0.1723221142024;
        Fri, 09 Aug 2024 09:32:22 -0700 (PDT)
Received: from localhost.localdomain ([176.33.65.192])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36d2716bf49sm5789123f8f.25.2024.08.09.09.32.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Aug 2024 09:32:21 -0700 (PDT)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-python][PATCH 09/12] python3-py-cpuinfo: switch to PEP-517 build backend
Date: Fri,  9 Aug 2024 19:30:58 +0300
Message-Id: <20240809163101.8416-9-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240809163101.8416-1-alperyasinak1@gmail.com>
References: <20240809163101.8416-1-alperyasinak1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 09 Aug 2024 16:32:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111720

The project has a proper pyproject.toml which declares the setuptools.build.meta PEP-517 backend.

Fix:

WARNING: python3-py-cpuinfo-9.0.0-r0 do_check_backend: QA Issue: inherits setuptools3 but has pyproject.toml with setuptools.build_meta, use the correct class [pep517-backend]

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 meta-python/recipes-devtools/python/python3-py-cpuinfo_9.0.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-py-cpuinfo_9.0.0.bb b/meta-python/recipes-devtools/python/python3-py-cpuinfo_9.0.0.bb
index 857afd1db..20a401131 100644
--- a/meta-python/recipes-devtools/python/python3-py-cpuinfo_9.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-py-cpuinfo_9.0.0.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=d2379ecb0d7a8299101b1e4c160cd1f7"
 
 SRC_URI[sha256sum] = "3cdbbf3fac90dc6f118bfd64384f309edeadd902d7c8fb17f02ffa1fc3f49690"
 
-inherit ptest pypi setuptools3
+inherit ptest pypi python_setuptools_build_meta
 
 SRC_URI += "file://run-ptest \
             file://0001-test_cli.py-disable.patch \
-- 
2.25.1


