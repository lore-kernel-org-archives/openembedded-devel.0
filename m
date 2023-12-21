Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 204B5C46CCD
	for <webhook@archiver.kernel.org>; Thu, 21 Dec 2023 17:48:40 +0000 (UTC)
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com [209.85.166.42])
 by mx.groups.io with SMTP id smtpd.web11.460.1703180911813936928
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Dec 2023 09:48:31 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.166.42, mailfrom: straka.derek@gmail.com)
Received: by mail-io1-f42.google.com with SMTP id ca18e2360f4ac-7b7f2c72846so41675639f.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 21 Dec 2023 09:48:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703180910; x=1703785710;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VCoWIQKdCjah2tLhn4ZzjGundRVftwO50vkjkjaMtQU=;
        b=E7myfssaNUuUTXbhnYLIMjI3bRE5KtPRuLdXRREzZusIqlIMgcxgEp5gnjJUlIKg5k
         NIFbuZ8t3YYGJtmTplne5HgrdvfbXbOSNyry1Fe2k7WE6TmawnPhptg2UQM5L3fO4kst
         YThiTDYhg+OTvmCrCI2z8/dtn8FHDdOwUIMvOokP5oEeOAzuTRWid4u6iGH+YClJBs0R
         pxQGy7+fR4sKU4NdmkxGy3mqhBG8AB0ysmReUF9Mp8kfJbzW9xxxBStdtk5uvkok5yHu
         WHYTz9MaJycNyLK3flFAIZa6Q0qbq5eoFV6Xhb3i1/1YppmIksVuySLNvyofRqzFpZ4t
         mtjQ==
X-Gm-Message-State: AOJu0YxMTHsJSX1dM3K9vk1Vy2v96pAsysDHbcxeHn0JmTKeNUM20+w+
	2XD/lBbfolVDg931kuREGo5MHqH3DC32ng==
X-Google-Smtp-Source: AGHT+IH4YVWL/hklbc85782gY6eVmEyAYDUMY8B8j1KPPIFyc+uZRousa7nOAlDpTFxDlV/1NPk2TA==
X-Received: by 2002:a6b:7105:0:b0:7ba:84b0:6d62 with SMTP id q5-20020a6b7105000000b007ba84b06d62mr135756iog.4.1703180910046;
        Thu, 21 Dec 2023 09:48:30 -0800 (PST)
Received: from sparta.internal.asterius.io (c-73-228-213-122.hsd1.mn.comcast.net. [73.228.213.122])
        by smtp.gmail.com with ESMTPSA id fm20-20020a0566382b1400b0046b6f405aafsm585059jab.31.2023.12.21.09.48.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Dec 2023 09:48:29 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH] python3-wtforms: fix upstream uri and version check
Date: Thu, 21 Dec 2023 17:48:22 +0000
Message-Id: <20231221174822.3900911-1-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 21 Dec 2023 17:48:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107725

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python3-wtforms_3.1.1.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-wtforms_3.1.1.bb b/meta-python/recipes-devtools/python/python3-wtforms_3.1.1.bb
index c9ad1be48..b57c31100 100644
--- a/meta-python/recipes-devtools/python/python3-wtforms_3.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-wtforms_3.1.1.bb
@@ -7,6 +7,9 @@ LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=17ed54aa95f4a6cd0d7a4747d14b64d0"
 
 SRC_URI[sha256sum] = "5e51df8af9a60f6beead75efa10975e97768825a82146a65c7cbf5b915990620"
 
+UPSTREAM_CHECK_URI = "https://pypi.python.org/pypi/WTForms"
+UPSTREAM_CHECK_REGEX = "/WTForms/(?P<pver>(\d+[\.\-_]*)+)"
+
 inherit pypi python_hatchling
 
 DEPENDS += "\
-- 
2.34.1


