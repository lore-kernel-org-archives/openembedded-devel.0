Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F086FCDB47E
	for <webhook@archiver.kernel.org>; Wed, 18 Oct 2023 10:28:35 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web10.278571.1697624908998366076
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Oct 2023 03:28:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RTUjmhZR;
 spf=pass (domain: gmail.com, ip: 209.85.208.49, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-53e07db272cso10410157a12.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 18 Oct 2023 03:28:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697624907; x=1698229707; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8KxGfCRvdNoyoHUc5ovvcpw0wVMXOLyTUrx7PC9vPn0=;
        b=RTUjmhZREgQOhvFWztae0357qtpVmqLN1WZNiDacg3J4CyDj+6RUExiD3AVDK0h/8h
         fqbLZgbLWDy5NdQ8eZJM/wUdi58Yeh02su4k++X3Mrz9W9Y/jFxvqhKhou+//NGYXyM/
         sD8SDLDNGQf+Pbbmiwh+iU7idkkOqP/gM+KCq90ZWQqwvSNp6PBwJSPNxZ+cuDP/Ckvf
         mgq6+IPpXi11clAtwXoOcqi9k9G2KJRewlDADMa0B7ZT5ExzFexUtJtmYYICh5R+y5GD
         aw5aV36RspWR7U0aDeXVQVctkq6X+p6Cv1EAQknKWJEWH7WB6rhVr6j4oNpeqcvd3xzo
         1qOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697624907; x=1698229707;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8KxGfCRvdNoyoHUc5ovvcpw0wVMXOLyTUrx7PC9vPn0=;
        b=q4K7zNVyyG4k7E4KeBOwCosZ3YIvaSrrSuxKaIakaQ9gqCH9ijXzs81VK/iQed0rYB
         hDR4PLdrzJX6NvbB0jn+bLAV1IvCEnafWgzlaqazRrmzTJwTrQP4w62blJBH+0wguoMA
         NAv7XxX9YdW3oI5Gh3H7y+pB+FrFye7OTgeNolbLHY/mxMo4CYwSLot1n+yXjOAAjpQD
         B5AGGnNs/WYHLcj1oLQySdLWaCIsZe3Iu8Fe5c8gC79nJAncwmc5O8QRLQxn9WPsNocg
         yrcwSr25o4arENpSHKVqt18K9mTMzQtZhT0Mtn30VDG/GI6fXD18RXM2kzM5md83hQug
         h0nA==
X-Gm-Message-State: AOJu0YzQFHs9YKBejAl+LVPjeyD1qcoIe1RsUoMhRlK+CZXdfxBdFcBJ
	UhHAHcuCX4NyYjKV+aYYaP24N0hRYDE=
X-Google-Smtp-Source: AGHT+IEf97QqNsXshp79UieKgUdFL14TZofO+v9YjKKO9o+lCN9uSO7Odbf8qBxOSYmOdJjSi0Pwog==
X-Received: by 2002:a50:a41d:0:b0:53e:332e:3e03 with SMTP id u29-20020a50a41d000000b0053e332e3e03mr3583097edb.4.1697624907115;
        Wed, 18 Oct 2023 03:28:27 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id a10-20020a50858a000000b005346925a474sm2547313edh.43.2023.10.18.03.28.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Oct 2023 03:28:26 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][PATCH] nodejs: update to latest v20 version 20.8.1
Date: Wed, 18 Oct 2023 12:28:21 +0200
Message-ID: <20231018102821.595049-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 18 Oct 2023 10:28:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105567

* updates to latest v20 version

* LIC_FILES_CHKSUM changed due to small Copyright update from:
  https://github.com/nodejs/node/commit/660da785e687ab0517397616a9e55b5782582ff5

* this still doesn't resolve the issue with pseudo reported in:
  https://lists.openembedded.org/g/openembedded-devel/message/105308
  and further debugged in:
  https://github.com/shr-project/com.webos.app.minimal/tree/recipes
  which shows that it's easily reproducible with plain webpack "Hello world".

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 .../nodejs/{nodejs_20.5.1.bb => nodejs_20.8.1.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/nodejs/{nodejs_20.5.1.bb => nodejs_20.8.1.bb} (97%)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_20.5.1.bb b/meta-oe/recipes-devtools/nodejs/nodejs_20.8.1.bb
similarity index 97%
rename from meta-oe/recipes-devtools/nodejs/nodejs_20.5.1.bb
rename to meta-oe/recipes-devtools/nodejs/nodejs_20.8.1.bb
index 6bb0f7fabd..d02e733ba6 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_20.5.1.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_20.8.1.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "nodeJS Evented I/O for V8 JavaScript"
 HOMEPAGE = "http://nodejs.org"
 LICENSE = "MIT & ISC & BSD-2-Clause & BSD-3-Clause & Artistic-2.0 & Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=059ecf3a6f87111685e51b611b9563e5"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=162595a4a2f3453a0534e60b0afe4e7b"
 
 CVE_PRODUCT = "nodejs node.js"
 
@@ -36,7 +36,7 @@ SRC_URI:append:toolchain-clang:x86 = " \
 SRC_URI:append:toolchain-clang:powerpc64le = " \
            file://0001-ppc64-Do-not-use-mminimal-toc-with-clang.patch \
            "
-SRC_URI[sha256sum] = "439c71aa2f38c2861657bfa538e99191a571258066cbfd4548586049c8134190"
+SRC_URI[sha256sum] = "f799c66f6a6386bb8ac2c75a378f740c455e97f1fe964393dd39c9f9f6efbc70"
 
 S = "${WORKDIR}/node-v${PV}"
 
-- 
2.42.0


