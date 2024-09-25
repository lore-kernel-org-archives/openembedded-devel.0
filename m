Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90DB1CF9C79
	for <webhook@archiver.kernel.org>; Wed, 25 Sep 2024 06:24:33 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web11.8978.1727245471270811740
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Sep 2024 23:24:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=emguHyji;
 spf=pass (domain: gmail.com, ip: 209.85.215.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-7ae3d7222d4so5332275a12.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 24 Sep 2024 23:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727245470; x=1727850270; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cqnT82s8lFye7jxFG0BbwMTDqWVzb7uvWKCU5eZGOzM=;
        b=emguHyjiBssFQtPy6N2pe7JtQRu7d/DqddFoLA220DdCijX6xqSSAjelh8wsEU0xq/
         XagmRQS4dWBqzE1UUNImf9rtI3UDyWEsqSAJeIsYh68qB6Toqe7Pgjy3cHWzLA+19vx+
         X4uNE78QakG0ZLj194s5k+qH/cje+xNtuOevZPaB94+/ioY2fvLFyNFmM+TT6L/lu/5t
         9yCTHY3koceKu54hvzxXQw7rnbaUktvT6zcYcUEs4nPONczEU5eo6HiFqIoesEmv2W9G
         ndIiFJ1Pk5cIygPW8vtZf0UizWGKVGPnjJLyHEMgfLEW5ALzh4jjnYB9+ahPNKuYa9kH
         7CvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727245470; x=1727850270;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cqnT82s8lFye7jxFG0BbwMTDqWVzb7uvWKCU5eZGOzM=;
        b=XMTtbTEwVTT4uZVDCmdI7PMI9deIiKOi1uP+saCHwyZNymvI2Ot3vXP20iRU+iSeoA
         pAYYYYD8Z6qYW9JABkYEBw3Wf0NtehACCelJoQZYZSAumwEDDoBzwy+9NzAkI/ndq4Cw
         3om5alXtHC0gyCyVz1sm9i2VkbLaAt9SrRoDK1FXuD9ppB1FSduK+q5miXUknjkQK76X
         qc3qXRUPBY44xwzZq6qj/dskK5WNh06YVPSoCdTfl88u42IzAUsG2Cw2vNLfHEpkwNht
         Cyk7WFK1gwjZaQZlRWdXVWUm3xmLKtEZ8w2Xv8xaWM2iPlKQlk7Ep+MFMjcp7tpuWTTJ
         bovg==
X-Gm-Message-State: AOJu0YzaTARfKM8+biZmaqe7B0EP6ZIWXq4+9p2SSSuJzalGfr+UaMFI
	N7DK/BUuD8MYkWsL44CqDp9QKNzJQ5LdCipUI5Qxk2HqYIOQ9PcCl0VPvwkv
X-Google-Smtp-Source: AGHT+IGHZZ564l/iEkCL9QmX52cWbx6SfmgpFGUjy+KmV+BIU8mmhVuq++CZGvjdV6auYWkcxEZvIA==
X-Received: by 2002:a05:6a21:9201:b0:1cc:e43e:3a01 with SMTP id adf61e73a8af0-1d4d4b8601cmr2932931637.33.1727245470240;
        Tue, 24 Sep 2024 23:24:30 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::f72b])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7e6b7c46f04sm2106309a12.38.2024.09.24.23.24.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Sep 2024 23:24:29 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 5/9] python3-pdm-build-locked: Add recipe
Date: Tue, 24 Sep 2024 23:24:18 -0700
Message-ID: <20240925062422.3146738-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20240925062422.3146738-1-raj.khem@gmail.com>
References: <20240925062422.3146738-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 25 Sep 2024 06:24:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112488

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../python/python3-pdm-build-locked_0.3.3.bb        | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pdm-build-locked_0.3.3.bb

diff --git a/meta-python/recipes-devtools/python/python3-pdm-build-locked_0.3.3.bb b/meta-python/recipes-devtools/python/python3-pdm-build-locked_0.3.3.bb
new file mode 100644
index 0000000000..f20f11ff44
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pdm-build-locked_0.3.3.bb
@@ -0,0 +1,13 @@
+SUMMARY = "pdm plugin to publish locked dependencies as optional-dependencies"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=19382cdf9c143df4f00b9caa0b60c75a"
+
+SRC_URI[sha256sum] = "b784135abf62b93ce0a11332ee24723a2699b7f266fddb7950a5b70c93df6214"
+
+inherit pypi python_setuptools_build_meta
+
+DEPENDS += " python3-pdm-backend-native"
+
+PYPI_PACKAGE = "pdm_build_locked"
+
+BBCLASSEXTEND += "native nativesdk"

