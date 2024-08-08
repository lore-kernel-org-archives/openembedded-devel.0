Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45712C3DA4A
	for <webhook@archiver.kernel.org>; Thu,  8 Aug 2024 11:21:07 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web10.57601.1723116058302448315
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Aug 2024 04:20:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TGHRSgc5;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: alperyasinak1@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-42816ca797fso6000315e9.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Aug 2024 04:20:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723116056; x=1723720856; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Z4/3VTlBIptBlcYv6ZxcLQvWDPOkFJCkoQyaJRZRMCQ=;
        b=TGHRSgc58EcXli4EqLD1X4i2bBEOQEugmqAerkq5u6eu3OsYxMn7aYUMFagN17VxvO
         KT2ThF3La3H7/Qw1kTXZl2C8eEz01puYA69KvBqukY2l9+ufs2mX12rnvQwsoVWxyz+X
         wB2rg3xB7L9+NjNYeqbijVxiOI5A88lPSGhETOtrFQn03AaqRG8rBw36VNW6B3he5w0r
         1j8psfUke6FbximsaGNWcYey5M/6gXVFhpdk0B29TxDF0Ysc7ImVp85FfXWtBouWUfL7
         jKWKP7uT+xoW1R3GV9d3gZgcwu1czvb3kwk+BWXPUd8IUmp4p1P3yUTlRNCkZMlIinGs
         bx4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723116056; x=1723720856;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z4/3VTlBIptBlcYv6ZxcLQvWDPOkFJCkoQyaJRZRMCQ=;
        b=IydfYLWe0bYmVC0nDl4WFvbZ8b8GlqdY/a3eBFEMbb4ZkUFXMRXPOBnNYb55kjAOyJ
         +fBZ+7FebZ7Iz9NiL02D1NAKQaQgJIwIXbEcxcN0iUOBsUBWrttUPPubxBfXgHTF47nu
         yIrrPFrbZdPAbMp06iLvItTK7KB63EahbE2/2XxvblVLx7GMBb+ltuCTwsokuNRp3eU0
         3NCm82j+B/TZ/BEBxRx+XkWpvhHszls2rZB9l0MfGsRtpH/P2BnUw4iful886Z8hfkj7
         fZ1uP4BFERr2kvSRNQ0WBZWLftF0BHvhrOtNcwILF+eeuTd10hEEuOBrPITut/V2of+j
         vhxg==
X-Gm-Message-State: AOJu0YxHYOhu33iGhMcScfQDymNqL5aA8SX4F/ZdNV5Cpi/DFDXC7OPd
	Eqi9qOoElWiQ7uf/4Hdl+clweEtqkUvtdWhnrj1nzfI2FUoK18HqPPkBMijG
X-Google-Smtp-Source: AGHT+IG4D5QllkXvxWPdiVKZSf4S8Eh68fb+STZyNPI3gHEaFUGOt06c76kg6gV8E/cQ0Z4onQ5fnQ==
X-Received: by 2002:a05:600c:4e8b:b0:425:7c95:75d0 with SMTP id 5b1f17b1804b1-4290aeda0damr14863715e9.18.1723116055963;
        Thu, 08 Aug 2024 04:20:55 -0700 (PDT)
Received: from localhost.localdomain ([176.33.65.192])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4290c738e0csm18823225e9.16.2024.08.08.04.20.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 04:20:55 -0700 (PDT)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-oe][PATCH] perfetto: Fix contains reference to TMPDIR [buildpaths] warning
Date: Thu,  8 Aug 2024 14:20:45 +0300
Message-Id: <20240808112045.84285-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 08 Aug 2024 11:21:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111652

WARNING:perfetto-31.0-r0 do_package_qa: QA Issue: File /usr/bin/.debug/tracebox in package perfetto-dbg contains reference to TMPDIR [buildpaths]

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 meta-oe/recipes-devtools/perfetto/perfetto.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-devtools/perfetto/perfetto.bb b/meta-oe/recipes-devtools/perfetto/perfetto.bb
index 7e9408b0b..884e0a024 100644
--- a/meta-oe/recipes-devtools/perfetto/perfetto.bb
+++ b/meta-oe/recipes-devtools/perfetto/perfetto.bb
@@ -96,8 +96,8 @@ do_configure () {
 
     ARGS=$ARGS" target_os=\"linux\""
     ARGS=$ARGS" target_cpu=\"$arch\""
-    ARGS=$ARGS" target_cc=\"$CC_BIN ${TUNE_CCARGS}\""
-    ARGS=$ARGS" target_cxx=\"$CXX_BIN -std=c++11 ${TUNE_CCARGS}\""
+    ARGS=$ARGS" target_cc=\"$CC_BIN ${TUNE_CCARGS} ${DEBUG_PREFIX_MAP}\""
+    ARGS=$ARGS" target_cxx=\"$CXX_BIN -std=c++11 ${TUNE_CCARGS} ${DEBUG_PREFIX_MAP}\""
     ARGS=$ARGS" target_strip=\"$STRIP_BIN\"" #
     ARGS=$ARGS" target_sysroot=\"${RECIPE_SYSROOT}\""
     ARGS=$ARGS" target_linker=\"$CC_BIN ${TUNE_CCARGS} ${LDFLAGS}\""
-- 
2.25.1


