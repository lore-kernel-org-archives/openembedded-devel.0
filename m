Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3570CCE7A86
	for <webhook@archiver.kernel.org>; Fri, 22 Sep 2023 22:13:58 +0000 (UTC)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.web10.9966.1695420830571878901
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Sep 2023 15:13:50 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.219.52, mailfrom: straka.derek@gmail.com)
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-656351b6d74so14350246d6.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 22 Sep 2023 15:13:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695420829; x=1696025629;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CtMZiRbEHWhOjYVEmEQyU0o2fdEIlE/bXibGbrU1rOY=;
        b=C9BEMnu0x2E1iY05haco/4wkIGZamAsNrVxHpSeipcxhWsfbiRjBSkkqpv10FFjDLz
         A1cKFQKGGU/59aR+0XqQfKE9hKIQ9c39EW8m/pnBiyuDphGLDU+t8x3G1/Uttabhohjb
         G4hnLPu4RAqsjZLloBJxZVMk7ccFQKzEAefdVWReaUtmQxpoGIgdigRB0HZPiCT/zLXH
         yJ425GNdeH8YqoayrUOyZg3cfOe/YySQbt82VHQauxzF5TqsBw7n+7c5uKwQZXq23/h8
         3KLl92jLVsBSvkqPbXT37tQMBNokDrHAt2Bncct31vs+zyPX+KK2p2ME4dk5prT7K1tI
         zYig==
X-Gm-Message-State: AOJu0Yzrc5ZDSP8wJKt3teG4sGgs2hwWRogABatkkoOeqmld944Dw+PM
	TfBQJdlP12AjqqF9jhY/POdHKuFuC8kzAg==
X-Google-Smtp-Source: AGHT+IFFConfYgW7VT5VP6po1UACo3/LgqS3dESC4JJycQe7ft+cOv+CwamGrXRka3eomEvLEk57IQ==
X-Received: by 2002:a0c:a998:0:b0:641:8df1:79e3 with SMTP id a24-20020a0ca998000000b006418df179e3mr590810qvb.29.1695420829122;
        Fri, 22 Sep 2023 15:13:49 -0700 (PDT)
Received: from sparta.internal.asterius.io (c-73-228-213-122.hsd1.mn.comcast.net. [73.228.213.122])
        by smtp.gmail.com with ESMTPSA id qj19-20020a056214321300b0063d038df3f3sm249821qvb.52.2023.09.22.15.13.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Sep 2023 15:13:48 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH] python3-protobuf: Update version 4.24.2 -> 4.24.3
Date: Fri, 22 Sep 2023 22:13:38 +0000
Message-Id: <20230922221338.3142824-1-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 22 Sep 2023 22:13:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105076

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../{python3-protobuf_4.24.2.bb => python3-protobuf_4.24.3.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-protobuf_4.24.2.bb => python3-protobuf_4.24.3.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-protobuf_4.24.2.bb b/meta-python/recipes-devtools/python/python3-protobuf_4.24.3.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-protobuf_4.24.2.bb
rename to meta-python/recipes-devtools/python/python3-protobuf_4.24.3.bb
index 3014884a3..b78ae6a1b 100644
--- a/meta-python/recipes-devtools/python/python3-protobuf_4.24.2.bb
+++ b/meta-python/recipes-devtools/python/python3-protobuf_4.24.3.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=53dbfa56f61b90215a
 
 inherit pypi setuptools3
 SRC_URI += "file://0001-message.c-Cast-uintptr_t-types-to-upb_MessageDef.patch"
-SRC_URI[sha256sum] = "7fda70797ddec31ddfa3576cbdcc3ddbb6b3078b737a1a87ab9136af0570cd6e"
+SRC_URI[sha256sum] = "12e9ad2ec079b833176d2921be2cb24281fa591f0b119b208b788adc48c2561d"
 
 # http://errors.yoctoproject.org/Errors/Details/184715/
 # Can't find required file: ../src/google/protobuf/descriptor.proto
-- 
2.34.1


