Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40BACC54E49
	for <webhook@archiver.kernel.org>; Sun,  3 Mar 2024 19:27:34 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
 by mx.groups.io with SMTP id smtpd.web11.80354.1709494048082697361
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 03 Mar 2024 11:27:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WTQ4fssb;
 spf=pass (domain: gmail.com, ip: 209.85.208.174, mailfrom: alperyasinak1@gmail.com)
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2d275e63590so52388411fa.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 03 Mar 2024 11:27:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709494045; x=1710098845; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FkIbaTyVSgSD08xs8YJQNnMfYltVsB0ag/WVyOYXr8Y=;
        b=WTQ4fssbEwvUJD3C0Q+hZQ4erf/z8LNK3qWN8pkRr7pOlNzHOGxdSo7uKaLFsP8KuE
         PRFxIXgKBrwyjEDgPs50RnqeK7XXSuOnbMuOdgCYfSunWpXZC4gA2bJAXEiBJo8UhU9R
         YI8OMoZPYhNJYynDSnnIo6N19Hs7AsbnP0trSIsbGABjTkkPR5JUXCxF65LVvxAZDdAf
         buxNP4T+BrRzFVq+NYB4pp3/cwVSjaD2nB8rbTAigprHp3cx9Qt7EH7w2/noxJr+JiLq
         zxHPJWBVGgbg1Q2bTIljhjDsfganDcxrYuxb0qGJuZoiFX3uruY8nqzAg7CR9oRW2Mis
         jKbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709494045; x=1710098845;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FkIbaTyVSgSD08xs8YJQNnMfYltVsB0ag/WVyOYXr8Y=;
        b=HEr/O2gm3dRAaXTByqnZdws29k/oNpudm9XUzvf9o8Z4W079aaYuNffFME/qI71J+0
         MA0JTOBxzOFQ7Mg5QChFmw8xx9JIRdxgm6HYl9hu4NfS1U5zvsle7r/aH1tZVFSXQVIZ
         d4sXlv/xJJgRaO6sXPHAGr0t3X0k84RlCkPA9hCuMDf8XXkRecgatpXK3eyt1AcMrUPi
         X8iqVKq2nPEO4D5RNIGFsQx1vQ+Bj4xmHq9GOVE8cD2auNNwowsf21fDpcOD6Ak+eiw8
         6cfXXubar1F0XPyAdFxXt6lEeuf7HJnOL81B2cno6d5kYo9UHrpnuVwr+iVUdHPG2NDF
         U7dg==
X-Gm-Message-State: AOJu0Yykf7qJedbgxSn97kfRIHF93RSVSOIYFQ+l3DkxjvqFiTm5DLHL
	5AYJiO4zw0ir5RX01CD76tgzT9ITMlqV22a8d2AkXZtxvO8UBe/8Gj8N2UoU12E=
X-Google-Smtp-Source: AGHT+IGH3vvoGIFWtDhBV9WTM9uF565udhCvGxvmqE6RcbdAdykt09U+LB9MYPsebHOvgTKebyK9GA==
X-Received: by 2002:a2e:9c89:0:b0:2d2:dd4b:4beb with SMTP id x9-20020a2e9c89000000b002d2dd4b4bebmr4942435lji.1.1709494045338;
        Sun, 03 Mar 2024 11:27:25 -0800 (PST)
Received: from localhost.localdomain ([176.33.65.159])
        by smtp.gmail.com with ESMTPSA id bg14-20020a05600c3c8e00b004122b7a680dsm12596991wmb.21.2024.03.03.11.27.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Mar 2024 11:27:24 -0800 (PST)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-python][PATCH] python3-google-auth: upgrade 2.28.0 -> 2.28.1
Date: Sun,  3 Mar 2024 22:27:15 +0300
Message-Id: <20240303192715.844977-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 03 Mar 2024 19:27:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109091

Changelog:
==========
Bug Fixes:
	Typo when setting the state for the pickle deserializer

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 ...hon3-google-auth_2.28.0.bb => python3-google-auth_2.28.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-google-auth_2.28.0.bb => python3-google-auth_2.28.1.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-google-auth_2.28.0.bb b/meta-python/recipes-devtools/python/python3-google-auth_2.28.1.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-google-auth_2.28.0.bb
rename to meta-python/recipes-devtools/python/python3-google-auth_2.28.1.bb
index 5799db43b..4524cca48 100644
--- a/meta-python/recipes-devtools/python/python3-google-auth_2.28.0.bb
+++ b/meta-python/recipes-devtools/python/python3-google-auth_2.28.1.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "3cfc1b6e4e64797584fb53fc9bd0b7afa9b7c0dba2004fa7dcc9349e58cc3195"
+SRC_URI[sha256sum] = "34fc3046c257cedcf1622fc4b31fc2be7923d9b4d44973d481125ecc50d83885"
 
 RDEPENDS:${PN} += "\
     python3-asyncio \
-- 
2.25.1


