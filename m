Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DD53C48BF8
	for <webhook@archiver.kernel.org>; Mon, 19 Feb 2024 21:37:57 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web11.868.1708378677089549956
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Feb 2024 13:37:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jXJgUJZi;
 spf=pass (domain: gmail.com, ip: 209.85.215.180, mailfrom: ticotimo@gmail.com)
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-53fbf2c42bfso3160884a12.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Feb 2024 13:37:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708378676; x=1708983476; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7rfBkLrR7mI92lYZldAMNwFzrxZnGC9Et6OS4D6mNxI=;
        b=jXJgUJZia+1yJ0murkNPjVcyMmLJaeumc5NdYK1VeQLB6XHmdsiGDn3PAAGJEPMcPx
         EzOFaWDHBWEivylsHWP4PHH7lAoPYZzfFW+zDy/OoSWr4FHYXEQKqSFsjfNlCIA78IhE
         IFcYUc+BZ+NQ0Jl2UwsgmPjUwq9VqBXKScR1g4NoibP96ohbCxKAy9xgMKPuwXzgKW/a
         yDf6Ph9o+XaG2ReAZzdmvg0jDYsVxKAGxPhpSTJeKFDkJ9BkUKT3WuHkZZA84p9c7IIS
         PHY73YC9UtOZzjcC9kVfmiA/U4z/79hFb1b6u07FQ3ii9kMskeMqxLzbe9UVKFJjDwGB
         Q6KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708378676; x=1708983476;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7rfBkLrR7mI92lYZldAMNwFzrxZnGC9Et6OS4D6mNxI=;
        b=BBgPf5MgiS9EEK+WuKdKL60hw/Kmw64sNQh/jtt+12RNxrKJnX+cMfEZXYzj869Zvy
         Q+8SVdpkB2hTwNvNooUi5mX38J3jGHYCs7qXfRrhxovSbjKG+ogK3WT1TNUPlSpr5fwZ
         Vi1AYscf8GsfzyhuTTgSEMG9Ro8JQoMuU1aLIO9RSZwcz6SvhgAk9Mye5Y+xsmBwrADL
         fRP3abnvlXEDDqL+JaFJWI44uglweLcOT/l8wO9BRiugT61kZKQfv8NmbT23VuhnKyxc
         wT2WO5mtmzeFHXxPIO+/fr9SbxUTi8e0/hxVm8f4CoeYyclsy+djglqw2TWcb1HvOBxg
         nBcQ==
X-Gm-Message-State: AOJu0YxmnobUTcDsQ+oJxwcujMZaxgi+j6u3WicxL570YRkFux/to5Pl
	5fB68zL+Giv/MGlJrzSz86YtF2SwHDgSl4TKUg2N+PiJXONCq4qwxyWZKprg
X-Google-Smtp-Source: AGHT+IHUmILWYUhHayYKmrMc6YFVhvW/EGjMjYM5sP3Xri8M9w6eH5um3SU5f1L0z0hVelJYgdMEIg==
X-Received: by 2002:a05:6a20:c90c:b0:1a0:5f8b:2cad with SMTP id gx12-20020a056a20c90c00b001a05f8b2cadmr16504378pzb.13.1708378676135;
        Mon, 19 Feb 2024 13:37:56 -0800 (PST)
Received: from chiron.hsd1.or.comcast.net ([2601:1c0:ca01:19f0:7caf:da97:8daf:f655])
        by smtp.gmail.com with ESMTPSA id m68-20020a632647000000b005cfbdf71baasm5135679pgm.47.2024.02.19.13.37.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Feb 2024 13:37:55 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [meta-python][PATCH] python3-pyproject-metadata: move to oe-core
Date: Mon, 19 Feb 2024 13:37:25 -0800
Message-Id: <20240219213724.2056915-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Feb 2024 21:37:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108885

This is a dependency for python3-meson-python.

This was missed in the earlier round of moving to oe-core.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../python/python3-pyproject-metadata_0.7.1.bb   | 16 ----------------
 1 file changed, 16 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-pyproject-metadata_0.7.1.bb

diff --git a/meta-python/recipes-devtools/python/python3-pyproject-metadata_0.7.1.bb b/meta-python/recipes-devtools/python/python3-pyproject-metadata_0.7.1.bb
deleted file mode 100644
index 9887af78d0..0000000000
--- a/meta-python/recipes-devtools/python/python3-pyproject-metadata_0.7.1.bb
+++ /dev/null
@@ -1,16 +0,0 @@
-SUMMARY = "PEP 621 metadata parsing"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=310439af287b0fb4780b2ad6907c256c"
-
-PYPI_PACKAGE = "pyproject-metadata"
-
-inherit pypi python_setuptools_build_meta
-SRC_URI[sha256sum] = "0a94f18b108b9b21f3a26a3d541f056c34edcb17dc872a144a15618fed7aef67"
-
-BBCLASSEXTEND = "native nativesdk"
-
-RDEPENDS:${PN} += " \
-    python3-logging \
-    python3-packaging \
-    python3-profile \
-"
-- 
2.34.1


