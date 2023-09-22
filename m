Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59313CE7A81
	for <webhook@archiver.kernel.org>; Fri, 22 Sep 2023 21:26:47 +0000 (UTC)
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com [209.85.166.54])
 by mx.groups.io with SMTP id smtpd.web10.9063.1695417997468742683
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Sep 2023 14:26:37 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.166.54, mailfrom: straka.derek@gmail.com)
Received: by mail-io1-f54.google.com with SMTP id ca18e2360f4ac-79fa425855cso38270739f.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 22 Sep 2023 14:26:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695417996; x=1696022796;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S9d9olQszqfzapGjcqPdF1AWVE8PA2CKidARqAm4TgY=;
        b=GR2mTkiD7Ki0qrPzAI2EbXz1qy+PaWo4NoO19l+txelk+x6thC7ZMETTbtmP9822DA
         r02qvxj8oE6eIv/d+dbP1hRcLgueuCR3psA60KG2jqdnjCH3mKTJGZWpXFehcNFhjquf
         TvP1UewsEHOUL9V75/ltiwRJ9FfQ8OFwHVDz5x1+RAnBpZBS8N0R+Di/wUDbeRDWzLOe
         8U5dqt4NBw2LAjlOPvOEgayyaWT/IlSroh/9jDPQUqFDfrZJHXJnP7IwMSVM/xbqvfR4
         g/uy6DWZJvuH3kVvG3FLshNygKb1TTLnzoJZ3K1pT8Ikg0r/qCuqiQAfd8wprhT/lYL2
         OHfw==
X-Gm-Message-State: AOJu0Yx9y9LmwrXssf9wjpSreqzh4lEqty+7jtkh7TYYjtYL0YsKzilT
	6UkClnMshwaPsUdD7VyocaXZbmQeTpNbUw==
X-Google-Smtp-Source: AGHT+IE7/GfZdZxAIvc1Uq6okr6z+qmyI5JTpgnYvVmLjszXQ0Vuvyg2G023D3h+SKzWHSsnfzf7mA==
X-Received: by 2002:a5d:9510:0:b0:79f:a3ac:71dc with SMTP id d16-20020a5d9510000000b0079fa3ac71dcmr676505iom.8.1695417996077;
        Fri, 22 Sep 2023 14:26:36 -0700 (PDT)
Received: from sparta.internal.asterius.io (c-73-228-213-122.hsd1.mn.comcast.net. [73.228.213.122])
        by smtp.gmail.com with ESMTPSA id c3-20020a5ea903000000b00783b0780bd8sm1137018iod.4.2023.09.22.14.26.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Sep 2023 14:26:35 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH] python3-msgpack: Update version 1.0.5 -> 1.0.6
Date: Fri, 22 Sep 2023 21:26:26 +0000
Message-Id: <20230922212626.3128147-1-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 22 Sep 2023 21:26:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105075

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../{python3-msgpack_1.0.5.bb => python3-msgpack_1.0.6.bb}     | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-msgpack_1.0.5.bb => python3-msgpack_1.0.6.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-msgpack_1.0.5.bb b/meta-python/recipes-devtools/python/python3-msgpack_1.0.6.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-msgpack_1.0.5.bb
rename to meta-python/recipes-devtools/python/python3-msgpack_1.0.6.bb
index 3965dad8e..3cddcb9ae 100644
--- a/meta-python/recipes-devtools/python/python3-msgpack_1.0.5.bb
+++ b/meta-python/recipes-devtools/python/python3-msgpack_1.0.6.bb
@@ -2,10 +2,9 @@ SUMMARY = "MessagePack (de)serializer"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=cd9523181d9d4fbf7ffca52eaa2a5751"
 
-PYPI_PACKAGE = "msgpack"
 inherit pypi setuptools3 ptest
 
-SRC_URI[sha256sum] = "c075544284eadc5cddc70f4757331d99dcbc16b2bbd4849d15f8aae4cf36d31c"
+SRC_URI[sha256sum] = "25d3746da40f3c8c59c3b1d001e49fd2aa17904438f980d9a391370366df001e"
 
 RDEPENDS:${PN}:class-target += "\
     ${PYTHON_PN}-io \
-- 
2.34.1


