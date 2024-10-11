Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FABDCFD2F3
	for <webhook@archiver.kernel.org>; Fri, 11 Oct 2024 08:55:29 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web10.7082.1728636919996429839
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 11 Oct 2024 01:55:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=VpaTPR7m;
 spf=pass (domain: konsulko.com, ip: 209.85.208.52, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5c721803a89so2410745a12.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 11 Oct 2024 01:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1728636918; x=1729241718; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/VFQNaNC9XiTsLJTB3lRTp29Yk2sceyEYx8/RiN532k=;
        b=VpaTPR7mr179DeN8/Xk6dqafwQVdE+2KA8Z865U2RUonQkxbiu4GJm6qXXaQeN5Uvo
         HhHf0d52arxJXrmgUu19gxCKG6pxH2RmfSAzTKy96HFfQTlJACOd2rZD6u6gfmwpF6xT
         UdvRr7MBri1dYZ6CQJw2E4lqgKtCXu5QZTAAU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728636918; x=1729241718;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/VFQNaNC9XiTsLJTB3lRTp29Yk2sceyEYx8/RiN532k=;
        b=U+wN13ix2d90YnBrOnX/e0lt21whCQUiyF9tv/2qsi7MCI4O3LtCLF7BJRyVHEn5iT
         tL7Kn5JXbrvZewBvaWZsw2V83ujeCrDR+8XnJCbwM1Eu/QFga8/bffHawCdANsvkkPEa
         kEjNHx56g2em+0vcKEc0gnnRdg46Y4WshgsNzm/lh02SAhcl4DbQk4a+0xuHbYuqLHb0
         Vn5q6JPeCPIMxBynnoO1e4+4e39Tu11TALjiJWQzXtvYREnkudQDP7RVXo034Y1jf2Jk
         RSen+0BIxHfjwLUaeZT4jDXGnpvXIkcmvHFbC57WZ2jwjlsWXSpTlMJ6Z5pJjYrQNwU6
         DnGg==
X-Gm-Message-State: AOJu0Ywe/k5R1Y0v/l3B1tZPFEYMqk2FPhM5aej+eHoSoq/hetXgRuG8
	jy9SgSNyu9kIawpjSG4f8Fzn/w7xpFf9JFj9GK3VqBvwls4QcX8yjCKbtc1NUo5+BOgS7i4eQre
	2
X-Google-Smtp-Source: AGHT+IG6vHSl296Cp9PQB/2XbMTpPh2pRCpWG7kM/Ki9++sDjPHkVvov+byifJlfFJVGFpzu0x6Uxw==
X-Received: by 2002:a05:6402:51d3:b0:5c9:37b1:2360 with SMTP id 4fb4d7f45d1cf-5c948d79b23mr1070657a12.33.1728636918149;
        Fri, 11 Oct 2024 01:55:18 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c937153939sm1713866a12.47.2024.10.11.01.55.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 01:55:17 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 4/4] python3-webargs: Upgrade 8.4.0 -> 8.6.0
Date: Fri, 11 Oct 2024 11:55:07 +0300
Message-Id: <20241011085507.3722721-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241011085507.3722721-1-leon.anavi@konsulko.com>
References: <20241011085507.3722721-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 11 Oct 2024 08:55:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112794

Upgrade to release 8.6.0:

- Fix the handling of invalid JSON bodies in the bottle parser to
  support bottle versions >=0.13
- MultiDictProxy now inherits from MutableMapping rather than
  Mapping

Switch inherit from setuptools3 to python_flit_core.

License-Update: Update years

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-webargs_8.4.0.bb => python3-webargs_8.6.0.bb}  | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-webargs_8.4.0.bb => python3-webargs_8.6.0.bb} (64%)

diff --git a/meta-python/recipes-devtools/python/python3-webargs_8.4.0.bb b/meta-python/recipes-devtools/python/python3-webargs_8.6.0.bb
similarity index 64%
rename from meta-python/recipes-devtools/python/python3-webargs_8.4.0.bb
rename to meta-python/recipes-devtools/python/python3-webargs_8.6.0.bb
index 78af01332..d898539ab 100644
--- a/meta-python/recipes-devtools/python/python3-webargs_8.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-webargs_8.6.0.bb
@@ -1,11 +1,11 @@
 SUMMARY = "Declarative parsing and validation of HTTP request objects, with built-in support for popular web frameworks."
 HOMEPAGE = "https://github.com/marshmallow-code/webargs"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=dfbd4ae0074716275fc229c775723e8f"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=27586b20700d7544c06933afe56f7df4"
 
-inherit pypi setuptools3
+inherit pypi python_flit_core
 
-SRC_URI[sha256sum] = "ea99368214a4ce613924be99d71db58c269631e95eff4fa09b7354e52dc006a5"
+SRC_URI[sha256sum] = "b8d098ab92bd74c659eca705afa31d681475f218cb15c1e57271fa2103c0547a"
 
 RDEPENDS:${PN} += "\
     python3-marshmallow \
-- 
2.39.5


