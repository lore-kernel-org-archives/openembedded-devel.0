Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94396C433F5
	for <webhook@archiver.kernel.org>; Tue, 15 Mar 2022 15:56:29 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
 [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web10.12906.1647359774159769940
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Mar 2022 08:56:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Ufy6DRJx;
 spf=pass (domain: gmail.com, ip: 209.85.210.173,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id z16so20408200pfh.3
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Mar 2022 08:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=oPuDH7DJYsxt8ifEPtiTKk+a3ZJ7xVqyc54FFdaJtaI=;
        b=Ufy6DRJxbd6YJtD+sion7bPY83tN1CvOLuXzmFzb+Jz2EATx8jUnMW9raYIwN+bhKR
         HmplgEIc79DCUL1PBZFUz+cn/POsgORPlqzqMvpb7yjjIrsV2KZo1HWKa36bTCBoWp4+
         tjTfruTFtmyCNyJyfpB1zTeeKkXV3HDIrAgvro/eYAZJeavFdwg/dZVV2Nvg9X9/+q7V
         /RtjbRGCpKiwHl7YYp9WuGzjy0SjnAq0RWadi7auE3MpJvfDT+2YMaCKKv111M9FRCM8
         +s1SLfpo3PELHIQ2HlByc64gPJywY7ZUom7pITPxDB0rZDmQ9ihVuA4RoKNZaAR1Otgh
         6Y7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oPuDH7DJYsxt8ifEPtiTKk+a3ZJ7xVqyc54FFdaJtaI=;
        b=cxh6MuLyTpsuAKnBDYbN9/NSiQODkKLcFeZ2clFbD+e6CfDevfzyBuEUpbGlNtgJXR
         wxH4zuI5EW6gNRzkwHKRJZHlU4gw1KHnUApr92ok9Nb8Kr9Ldhav4Hnyox+bQw9bApsC
         BRmGplo+5Ferd/ES1M3ZD/FRXGi4W4rsVVq2SBCiHkbZZ33lOy44YtXuN701kp9t7eHL
         lKZ2gy2Z8w7OlE9bXWoFzUL6sLeoWbk0F+/hhi2WwThIhdmqaK1J8PkfW0WjYVTnfsO/
         XWgI3prR5Sw9XLqF0dA/z8WPp2cdMGKbVSBwfgnCfsviChU56Bd29uqW1cfmUDF3tIhv
         5UUg==
X-Gm-Message-State: AOAM533BKthdxnIyHZYrRpN3bOe5Hufvy9XFsO9VQtjeJSaujFdWdO7S
	ziLj/a8UGJFCDvFfbL4xT6TDqodmaes=
X-Google-Smtp-Source: 
 ABdhPJzQp3engvtN5HrjaSsWE/h55/2ac9PLdDAdRUMQXV2v4g2tKp6nHFsllXPN0MnqbwyhM6vO+g==
X-Received: by 2002:aa7:8ec2:0:b0:4f7:4a9:7fcd with SMTP id
 b2-20020aa78ec2000000b004f704a97fcdmr29234669pfr.26.1647359773123;
        Tue, 15 Mar 2022 08:56:13 -0700 (PDT)
Received: from nereus.local ([2601:1c0:6000:1b20:4e7c:5db8:f14f:580b])
        by smtp.gmail.com with ESMTPSA id
 rj14-20020a17090b3e8e00b001bf50a8b468sm3912101pjb.51.2022.03.15.08.56.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Mar 2022 08:56:12 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [meta-python][PATCH 5/6] python3-pytest-subtests: move to oe-core
Date: Tue, 15 Mar 2022 08:55:57 -0700
Message-Id: <20220315155558.969249-5-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220315155558.969249-1-tim.orling@konsulko.com>
References: <20220315155558.969249-1-tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 15 Mar 2022 15:56:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95998

This recipe has been moved to oe-core in support of
python3-cryptography.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../python/python3-pytest-subtests_0.6.0.bb   | 20 -------------------
 1 file changed, 20 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-pytest-subtests_0.6.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-pytest-subtests_0.6.0.bb b/meta-python/recipes-devtools/python/python3-pytest-subtests_0.6.0.bb
deleted file mode 100644
index 5e4847b8d9..0000000000
--- a/meta-python/recipes-devtools/python/python3-pytest-subtests_0.6.0.bb
+++ /dev/null
@@ -1,20 +0,0 @@
-SUMMARY = "unittest subTest() support and subtests fixture."
-DESCRIPTION = "Adds support for TestCase.subTest.\
-New subtests fixture, providing similar functionality for pure pytest tests."
-HOMEPAGE = "https://github.com/pytest-dev/pytest-subtests"
-BUGTRACKER = "https://github.com/pytest-dev/pytest-subtests/issues"
-
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=242b4e17fa287dcf7aef372f6bc3dcb1"
-
-SRC_URI[sha256sum] = "3ebd306a8dcf75133f1742f288c82f36426ebcf8a132d4ee89782d20e84fc13a"
-
-inherit pypi setuptools3
-
-DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
-
-RDEPENDS:${PN} += " \
-    ${PYTHON_PN}-pytest \
-"
-
-BBCLASSEXTEND = "native nativesdk"
-- 
2.30.2


