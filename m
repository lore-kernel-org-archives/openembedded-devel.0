Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BAD1E7718B
	for <webhook@archiver.kernel.org>; Mon, 23 Dec 2024 18:20:16 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web10.18852.1734978010015015302
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Dec 2024 10:20:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=b2mbVOPL;
 spf=pass (domain: konsulko.com, ip: 209.85.221.49, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-385de9f789cso3408474f8f.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 23 Dec 2024 10:20:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1734978008; x=1735582808; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9Y3jWISEJf0FcBqVElG7QN+2e1MT3hghA6sZPyOZfC4=;
        b=b2mbVOPLHJfzJX+krepR5fzLij+hms3I9kBSzIB2CJO23N4HS6y9pqmLe4E21ltnto
         VHRsDnrA+e/+6h7PDBr/ouXKz2espakGDqQpd+LdrnmMQGSfG5EV6NE4c4yWNreNThMS
         +bSfmru+ywepidBxqMcFidc7dkMjEZDkAmN+I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734978008; x=1735582808;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9Y3jWISEJf0FcBqVElG7QN+2e1MT3hghA6sZPyOZfC4=;
        b=cYIpU0FCqXDUE807aOSfkrdeLvml0STjly5eyRASxqGVs8fI9aLtHAIVYftUEAynWH
         yRu/vtuTQjXHPT6gQ4cTrbMvpF0WjkKQgSRUUjz5zbnnSKuhuKpAeXPVWYcz6kvU5fAZ
         sTIDcueCI7STN5LSx+utYJl77SOKtQe60jQ0jHXqhXQEGBvv1YlAdBb6BRc0upxzel1S
         4s0gPOePkaES/PbbsIwNvQZIxU+KOML7P5p19LtXfalbFGbsiBkP/vk7ONqu/9+z9hlq
         jUxuw0CyoCJEjmORVQNR3VH059v+whbqX18rzKOa5ZuhlaG7qUwDrZK48phYSpAwegBA
         Pz/Q==
X-Gm-Message-State: AOJu0YzNJqG4Ymg3Wy3q3Adoyp5B2/VghyKzzWYGfCxfIMtLjVBrg45K
	vJMpCBaGHGWQ9XFdwRU1tMi7gJdXgqMv8GS+ZgBOVqwigcDVyn1nHcGFu5gdVVZRHcD7eju21cD
	N
X-Gm-Gg: ASbGncsF7mQCxMIxGIzBTgbZToHGxyeE9b9lB/w1oSl7RbPnzxJk/Zj3c46TBlnOYIc
	2JNFP2ROxfq1NU5I+errHJbw5omUXIsF2+wvtg9CjchMyosLVsoEJwicL2BhEIhXG+hNjyeHSY9
	jts62FsrOFmqbEMSvDttLKfkMYTXcl0RohFQR7ZRW29SkP2QSCAqL68jcw7y3okf6E3SQmGMBqJ
	b929OGYirZfKSm2hBFVGo44hvHVnKWQNXtrv+plSBuOxLaVfYIvvjFa/40+KHs3iKoKmhA=
X-Google-Smtp-Source: AGHT+IF/CdlX/eVtyxBVE37fF5QCOWgoAl7+uYaNTHDrk1O+46xz+XjIfj37O7jLsgN6CzHm0yi3kQ==
X-Received: by 2002:a05:6000:144b:b0:385:efc7:932d with SMTP id ffacd0b85a97d-38a223ffb44mr12573115f8f.46.1734978007957;
        Mon, 23 Dec 2024 10:20:07 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4366127c493sm141874355e9.28.2024.12.23.10.20.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Dec 2024 10:20:07 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][scarthgap][PATCH] sip: Upgrade 6.8.3 -> 6.8.6
Date: Mon, 23 Dec 2024 20:20:04 +0200
Message-Id: <20241223182004.2815269-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Dec 2024 18:20:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114473

Upgrade to version 6.8.6:

- Handle single number macOS deployment targets
- Support for architectures where `char` is unsigned
- Support for building from git archives
- Run the tests using the current Python version

The project has a proper pyproject.toml which declares the
setuptools.build.meta PEP-517 backend.

Fixes:
WARNING: sip-6.8.6-r0 do_check_backend: QA Issue: inherits
setuptools3 but has pyproject.toml with setuptools.build_meta,
use the correct class [pep517-backend]

The work was sponsored by GOVCERT.LU.

License-Update: Update years

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-devtools/sip/{sip_6.8.3.bb => sip_6.8.6.bb}   | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-devtools/sip/{sip_6.8.3.bb => sip_6.8.6.bb} (64%)

diff --git a/meta-oe/recipes-devtools/sip/sip_6.8.3.bb b/meta-oe/recipes-devtools/sip/sip_6.8.6.bb
similarity index 64%
rename from meta-oe/recipes-devtools/sip/sip_6.8.3.bb
rename to meta-oe/recipes-devtools/sip/sip_6.8.6.bb
index d12130af43..157e404515 100644
--- a/meta-oe/recipes-devtools/sip/sip_6.8.3.bb
+++ b/meta-oe/recipes-devtools/sip/sip_6.8.6.bb
@@ -6,12 +6,14 @@ SUMMARY = "A Python bindings generator for C/C++ libraries"
 HOMEPAGE = "https://www.riverbankcomputing.com/software/sip/"
 LICENSE = "GPL-2.0-or-later"
 SECTION = "devel"
-LIC_FILES_CHKSUM = "file://LICENSE-GPL2;md5=e91355d8a6f8bd8f7c699d62863c7303"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=ed1d69a33480ebf4ff8a7a760826d84e"
 
-inherit pypi setuptools3 python3native
+inherit pypi python_setuptools_build_meta python3native
 
 PYPI_PACKAGE = "sip"
-SRC_URI[sha256sum] = "888547b018bb24c36aded519e93d3e513d4c6aa0ba55b7cc1affbd45cf10762c"
+SRC_URI[sha256sum] = "7fc959e48e6ec5d5af8bd026f69f5e24d08b3cb8abb342176f5ab8030cc07d7a"
+
+DEPENDS += "python3-setuptools-scm-native"
 
 RDEPENDS:${PN} = " \
     python3-core \
-- 
2.39.5


