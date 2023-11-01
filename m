Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51FAAC0018A
	for <webhook@archiver.kernel.org>; Wed,  1 Nov 2023 14:32:57 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web11.8741.1698849171564330234
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Nov 2023 07:32:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=Xl79VWsm;
 spf=pass (domain: konsulko.com, ip: 209.85.208.53, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-53de8fc1ad8so11351774a12.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 01 Nov 2023 07:32:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1698849170; x=1699453970; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jmo5SS6QjUQwN4dGi7rPeK73lqxC6DPE6Z9FmjwZfU8=;
        b=Xl79VWsm7P/28Xj36UB/zOG5lAGB8w4dQCar9t/ogWP+Z3aTnR881mr3J9JNH/rh1q
         1x3iozH857UJm/+wXXBbaT0XfY42ArX43MG+TbPCUYQ1BcYC+6Jq/kOD3AHXLNLiO3A5
         fCcZoCw28+I4ArIB8RxhH57mE/sBpyMJ5GYHs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698849170; x=1699453970;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jmo5SS6QjUQwN4dGi7rPeK73lqxC6DPE6Z9FmjwZfU8=;
        b=k5/GvvvK/bVtg0+POmTN4tBXQXM2yWgxIcdBPZr63cUEv80pneet0poUjf3ptL6jxX
         M95IuGupVS0HN2eIdLjDWLjL9tsPsm99BJbLuLzon5y2hWPdP9099M+ZJBjeGUjvfCVb
         DuSa2LcRZBe/XhFyhwE4XjrAqmrSiOgUO7VCH+6woJhcIl0a5YTXrdwoXfrg9QeTecwz
         rNfBqIsm2NTFUMlf6wwTksxbcLqMJ7p6Xru+chfla1gXwVRc19vveXogQ4Axoix788g7
         IEA6SN1kmaHdWLiPgxPH0OA4vBHOBn8bE0FiI/it6lOpanj/DFvp7XYpc4ot+7WC+Ei7
         zZeg==
X-Gm-Message-State: AOJu0YyBg+FmqQMzcHGrJWZooX+qsIflFCm5dh6RpT2SxUdqY+P74Q8l
	Y14rh8k+KzHRZ1XNWkkox4WtbjFUvwmjC2r6W04=
X-Google-Smtp-Source: AGHT+IEvn9UrLoX3Vw5pSUx7sQ5Ot0FCm8xp3XuFNMPu9UM+dhqM8Zjlc4klRMcr7mt9ZxrPcy23yA==
X-Received: by 2002:a17:907:da1:b0:9d7:139:ca02 with SMTP id go33-20020a1709070da100b009d70139ca02mr1755805ejc.18.1698849169847;
        Wed, 01 Nov 2023 07:32:49 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id lx27-20020a170906af1b00b009ad7fc17b2asm2449392ejb.224.2023.11.01.07.32.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Nov 2023 07:32:49 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 4/4] python3-pymemcache: add recipe
Date: Wed,  1 Nov 2023 16:32:40 +0200
Message-Id: <20231101143240.3171827-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231101143240.3171827-1-leon.anavi@konsulko.com>
References: <20231101143240.3171827-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 01 Nov 2023 14:32:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105822

Add pymemcache, a comprehensive, fast, pure Python memcached
client. Version 4.0.0 brings:

- Drop python support for 2.7, 3.4 and 3.5
- Use default for get ignore_exc
- Return default from hash client
- Return default from hash client when using positional argument
- Support noreply for hash flush_all
- Drop support for Python 3.6
- Add official support for Python 3.10
- Handle a blank stat value
- Small buffer pass optimization
- Expand Client with a method for sending arbitrary commands
- Add pluggable compression serde
- Start to add type hints
- Add py.typed file
- Fix key_prefix issue with stats and cache_memlimit

This work was sponsored by GOVCERT.LU.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/python3-pymemcache_4.0.0.bb        | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pymemcache_4.0.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-pymemcache_4.0.0.bb b/meta-python/recipes-devtools/python/python3-pymemcache_4.0.0.bb
new file mode 100644
index 000000000..2a09e9694
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pymemcache_4.0.0.bb
@@ -0,0 +1,22 @@
+DESCRIPTION = "A comprehensive, fast, pure Python memcached client"
+HOMEPAGE = "https://github.com/pinterest/pymemcache"
+SECTION = "devel/python"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
+
+PYPI_PACKAGE = "pymemcache"
+
+SRC_URI[sha256sum] = "27bf9bd1bbc1e20f83633208620d56de50f14185055e49504f4f5e94e94aff94"
+
+inherit pypi setuptools3
+
+DEPENDS += " \
+    ${PYTHON_PN}-setuptools-scm-native \
+    ${PYTHON_PN}-six-native \
+"
+
+RDEPENDS:${PN} += "\
+    ${PYTHON_PN}-io \
+    ${PYTHON_PN}-core \
+    ${PYTHON_PN}-logging \
+"
-- 
2.39.2


