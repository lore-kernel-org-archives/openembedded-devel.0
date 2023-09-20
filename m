Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60166C04FD1
	for <webhook@archiver.kernel.org>; Wed, 20 Sep 2023 18:18:49 +0000 (UTC)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
 by mx.groups.io with SMTP id smtpd.web11.2811.1695233924093359134
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Sep 2023 11:18:44 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.128.179, mailfrom: straka.derek@gmail.com)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-59be8a2099bso1869537b3.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 20 Sep 2023 11:18:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695233923; x=1695838723;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UgcnsnWntmT9USlsTbjJoCCf5inwOPFDdZllekGCFIg=;
        b=WH4/Y9f+XHS0XgPWs5FS7Sr3anI6MwHDtFhUCgDTIzTFwu3mirf4/upykwp8XhorWB
         zL28I4IjqjqUCKQst6p75QfyGiuhx9JVAT5IaxIKfjlIrZAFwVLU5ADSrQDQINaCOfsC
         Fs6HWhd+m7FJoFDS7BlW3cYXKzHRlLEQPDlhTxo7WQ23RmhFv7nDlUiPoDvOzH1rKQVU
         Yr8lKzUJNwpZIdne4sVlTUeQ9Q2fDYnM0FJp3d2usMmjAUsRndWZHfllv6Adn/hZWjUW
         J0LteKfYl0ulqee8BH0AAypB6U3Vn1ROZaY0I9Giywisj/bXgEAk4Gpz8bOwt+tmy/Dw
         oXHw==
X-Gm-Message-State: AOJu0YxtF5NtWqdXU07WQuvWFDo+3hnj1Z9Z6ceCEnyps1Gk9bwmx9/j
	YgcltaVqpIzcSfR+fcsyv2wisWvaduGsIw==
X-Google-Smtp-Source: AGHT+IEjTrVSLEYTddLt6LwkqBJ1g+neqJQuQcA55b4AqOSduq/z2SC0G1MksOBR9iVRudVYeiCb8g==
X-Received: by 2002:a0d:dec3:0:b0:59b:52bd:4d2a with SMTP id h186-20020a0ddec3000000b0059b52bd4d2amr2965394ywe.23.1695233922596;
        Wed, 20 Sep 2023 11:18:42 -0700 (PDT)
Received: from sparta.internal.asterius.io (c-73-228-213-122.hsd1.mn.comcast.net. [73.228.213.122])
        by smtp.gmail.com with ESMTPSA id j124-20020a0dc782000000b0059af121d0b8sm3934750ywd.52.2023.09.20.11.18.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Sep 2023 11:18:42 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH] python3-cachecontrol: Update version 0.13.0 -> 0.13.1
Date: Wed, 20 Sep 2023 18:18:25 +0000
Message-Id: <20230920181825.1312497-1-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 20 Sep 2023 18:18:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105019

Remove the package override that is no longer needed
Update the inherits to use poetry

Changelog
=========
What's Changed
serialize: remove v1 and v2 formats by @woodruffw in #310
refactor: move the serialization implementation to method by @frostming in #313
feat: drop support of Python older than 3.7 by @frostming in #312
fix(typing): fix wrong types by @frostming in #314
workflows: add a release workflow by @woodruffw in #308
cachecontrol: 0.13.1 by @woodruffw in #315

Signed-off-by: Derek Straka <derek@asterius.io>
---
 ...hecontrol_0.13.0.bb => python3-cachecontrol_0.13.1.bb} | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-cachecontrol_0.13.0.bb => python3-cachecontrol_0.13.1.bb} (66%)

diff --git a/meta-python/recipes-devtools/python/python3-cachecontrol_0.13.0.bb b/meta-python/recipes-devtools/python/python3-cachecontrol_0.13.1.bb
similarity index 66%
rename from meta-python/recipes-devtools/python/python3-cachecontrol_0.13.0.bb
rename to meta-python/recipes-devtools/python/python3-cachecontrol_0.13.1.bb
index e4e3c4998..535bac0e3 100644
--- a/meta-python/recipes-devtools/python/python3-cachecontrol_0.13.0.bb
+++ b/meta-python/recipes-devtools/python/python3-cachecontrol_0.13.1.bb
@@ -3,13 +3,9 @@ HOMEPAGE = "https://pypi.org/project/CacheControl/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=12;endline=12;md5=e2fd6ddcf506e08972d5ba4b93c0022e"
 
-# On PyPi, this is "CacheControl", rather than "cachecontrol", so we need to
-# override PYPI_PACKAGE so fetch succeeds.
-PYPI_PACKAGE = "CacheControl"
+SRC_URI[sha256sum] = "f012366b79d2243a6118309ce73151bf52a38d4a5dac8ea57f09bd29087e506b"
 
-SRC_URI[sha256sum] = "fd3fd2cb0ca66b9a6c1d56cc9709e7e49c63dbd19b1b1bcbd8d3f94cedfe8ce5"
-
-inherit pypi setuptools3
+inherit pypi python_poetry_core
 
 RDEPENDS:${PN} += "\
     python3-crypt \
-- 
2.34.1


