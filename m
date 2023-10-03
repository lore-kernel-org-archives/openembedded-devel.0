Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 296AAE7545D
	for <webhook@archiver.kernel.org>; Tue,  3 Oct 2023 18:31:05 +0000 (UTC)
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
 by mx.groups.io with SMTP id smtpd.web10.116329.1696357863673307009
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Oct 2023 11:31:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=la70ZLoS;
 spf=pass (domain: gmail.com, ip: 209.85.210.42, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-6c615df24c0so808356a34.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 03 Oct 2023 11:31:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696357863; x=1696962663; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XKajAgLYvpm9u/xAUTvLX2gGNwt8QS1sJ6jX0LDDgYs=;
        b=la70ZLoSq0s4jEoW876Y/uzki1AKjKx592WId4aPjbMEef6DL10gJWQyEFGcins7I7
         cSp+oPvWuaes/sDqlCOVkPreGMN8R3KDYJSurHbYsygrgQpZu03UpsLnkYe+amqn1981
         Jpm9hTXb+JwMdK4JKYl6fOdAA8K5R1rjGMYdlUm/AcvaCKJhBhKVCeJWbYh0lXBYcucS
         WymoI5n8xTjNz4gZUEvRtOMuaGKtDYxhNAFBdLhtsh3kUdACxxFsjLPRdzWDxaULaDPc
         VhKk8GuUqikJgWfq1Sv3hHmX4zRreVXaJm4i1w69tHO+Ypg8br4lDEcSjxqQbrK036fa
         bc1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696357863; x=1696962663;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XKajAgLYvpm9u/xAUTvLX2gGNwt8QS1sJ6jX0LDDgYs=;
        b=NW4XT2BE+Xk6TP/161MmaSEY5+jz8ZJwpcXRhfpu94augFIekZ0lJJmK4ZMBZwxO60
         ADCMQ72z8I+H4cRZ+Y1AHWRATgz3eYOK4wDL2BQ8BLnpTprFanQeAya4faFFWW3F8d64
         Z7/tVZEstTNjb3oAdeUewz8T0WBs9VCDEbUXjxiIU4DmKIVttnSGX997uZztb/PxQiei
         D8MFNxyUfingfZU7qks2zJp3j82hIjqCqKnOtbPtiPtS8+eARfi63WtTOYK1UVgBTH+i
         Z3TTHFeiUioxRxL7vRKKcw6dhbBL9Bkv+21jhbsBNuxMtEvR6ogBpbdIF9oKwgChCAM2
         jgBw==
X-Gm-Message-State: AOJu0YynF2FwA3s/GV03EjnF+hNyQXNYnwo4/yTUpaOoK2KxGJmcvmTI
	z9z1cLmxanG4IHgMc71e2rIvNyH6NrKQHg==
X-Google-Smtp-Source: AGHT+IEIHzfAfzfvuffkt6ymGoHyhdDxfrY+KqXsLzWI7pAMB7bsjRmUBH8U8fWiKxVr4pDBurCnDQ==
X-Received: by 2002:a05:6808:210b:b0:3a7:2456:6af6 with SMTP id r11-20020a056808210b00b003a724566af6mr459092oiw.31.1696357862637;
        Tue, 03 Oct 2023 11:31:02 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::7f07])
        by smtp.gmail.com with ESMTPSA id o3-20020a17090ac08300b002777b8fc74bsm1704307pjs.21.2023.10.03.11.31.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Oct 2023 11:31:01 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH v2] python3-lz4: use python3-unittest-automake-output
Date: Tue,  3 Oct 2023 11:30:59 -0700
Message-ID: <20231003183059.3338567-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 03 Oct 2023 18:31:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105326

This is to support ptest format
https://wiki.yoctoproject.org/wiki/Ptest

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Use python3-unittest-automake-output

 meta-python/recipes-devtools/python/python3-lz4/run-ptest | 2 +-
 meta-python/recipes-devtools/python/python3-lz4_4.3.2.bb  | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-lz4/run-ptest b/meta-python/recipes-devtools/python/python3-lz4/run-ptest
index 1b245bcd8f..8d2017d39c 100644
--- a/meta-python/recipes-devtools/python/python3-lz4/run-ptest
+++ b/meta-python/recipes-devtools/python/python3-lz4/run-ptest
@@ -1,3 +1,3 @@
 #!/bin/sh
 
-pytest -v
+pytest --automake
diff --git a/meta-python/recipes-devtools/python/python3-lz4_4.3.2.bb b/meta-python/recipes-devtools/python/python3-lz4_4.3.2.bb
index 9d31ab68c2..f0c8684b0d 100644
--- a/meta-python/recipes-devtools/python/python3-lz4_4.3.2.bb
+++ b/meta-python/recipes-devtools/python/python3-lz4_4.3.2.bb
@@ -22,6 +22,7 @@ RDEPENDS:${PN}-ptest += "\
     python3-pytest-runner \
     python3-multiprocessing \
     python3-psutil \
+    python3-unittest-automake-output \
 "
 
 do_install_ptest() {
-- 
2.42.0


