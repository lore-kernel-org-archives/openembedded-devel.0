Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1ECFECF07CB
	for <webhook@archiver.kernel.org>; Thu, 10 Oct 2024 08:48:38 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web10.38823.1728550110336845979
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Oct 2024 01:48:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PzqiiqKC;
 spf=pass (domain: gmail.com, ip: 209.85.167.50, mailfrom: alperyasinak1@gmail.com)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5398e53ca28so658539e87.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 10 Oct 2024 01:48:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728550108; x=1729154908; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=M4H2MFZDbDo7lcQxtwb3bfYGIKH0njw+6qrJ6BKbClE=;
        b=PzqiiqKCLX4e6QvbXSR7r58i+zbK9dM7Nwsl0YS5ixRrFpbEAF7mMd0c7TrnUgPgsQ
         Z9wBKBTzMKk6R/lKN7QZKxVfjCEm5jNCpR+3+vD05V9Jm815OV1ODKyLZNlFAZY7hFze
         HZ6kJcfuiTZvF9PLS+Pw6zQr7abrzh8LwhNTOHnICRAdMuJ6jlXbH9CYwYA8wWAhkaU4
         kvmQ2XIN1/VN4Kyh5j9nOANGOQK5DVBxZipsOAzREpUD8bhVg74BRuKvFbcK9Ip0JVNh
         XJZUZWHBKe6wgXCKiseLE9/7O80j56Ckfzu41ExwGHdm3/3+KmvAALZsvTYifXcb54WQ
         IqhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728550108; x=1729154908;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M4H2MFZDbDo7lcQxtwb3bfYGIKH0njw+6qrJ6BKbClE=;
        b=HxOgRxF5tKlS+40kP9Hf7iUUaPAq+8bmw82AtJadTELl5ZT0mmdtZdLxqjASB38LmI
         2JvX72YIq+ijt2K/Uc/+fHo5tY/pdmEd8wtvs5XE/qxyze61du0m1zyGRczXkgH0SMV8
         ccz1NZ61MsGtlYtykUGwYVBltaSDCc0X8+v5VY4izzxKXmKhuUfOp19mbcF1V6vkLZMo
         Db6q/0pIsla92nGQkCI8pcHyAD6szXH4RePa4aQXX84PAhUT+Iq+y6EF9q0HTdjsjBQP
         59YgXQukWTNgkyfyjkaG3q56TxaKvtEuDZiVBMnIp+MtDAsfTJQv3Y0DAiJ6RMu2E8Zq
         ehSg==
X-Gm-Message-State: AOJu0YzkYK2u0hoZOjMl8W3Az9Fd1jOstp6QORhlGi954cTasyomDnm5
	r62TbHIY5q6MKZJAf+GSYM0JU0KhLIi0rooPqiSpKutiTihCdCEkDxqACoYN
X-Google-Smtp-Source: AGHT+IFncZZkyKwOMqLbyZZRv2P2I/J1i6xjEww+rymPtzw2zaLywQl2JYeydOuZQ44dYvoJ4nu0sA==
X-Received: by 2002:a05:6512:12d3:b0:539:8876:5555 with SMTP id 2adb3069b0e04-539c48e33e8mr3913153e87.29.1728550107806;
        Thu, 10 Oct 2024 01:48:27 -0700 (PDT)
Received: from localhost.localdomain ([176.33.66.209])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a99a80c0238sm56844466b.115.2024.10.10.01.48.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 01:48:27 -0700 (PDT)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-python][PATCHv2 1/6] python3-sqlalchemy: Upgrade 2.0.32 -> 2.0.35 and switch to PEP-517 build backend
Date: Thu, 10 Oct 2024 11:48:11 +0300
Message-Id: <20241010084816.40869-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Oct 2024 08:48:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112767

- The project has a proper pyproject.toml which declares the setuptools.build.meta PEP-517 backend.

- PYPI_PACKAGE name changed SQLAlchemy to sqlalchemy.

- Added missing Cython dependency.

Fix:

WARNING: python3-sqlalchemy-2.0.32-r0 do_check_backend: QA Issue: inherits setuptools3 but has pyproject.toml with setuptools.build_meta, use the correct class [pep517-backend]

Changelog:

https://docs.sqlalchemy.org/en/20/changelog/changelog_20.html#change-2.0.33
https://docs.sqlalchemy.org/en/20/changelog/changelog_20.html#change-2.0.34
https://docs.sqlalchemy.org/en/20/changelog/changelog_20.html#change-2.0.35

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 ...3-sqlalchemy_2.0.32.bb => python3-sqlalchemy_2.0.35.bb} | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-sqlalchemy_2.0.32.bb => python3-sqlalchemy_2.0.35.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.32.bb b/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.35.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.32.bb
rename to meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.35.bb
index bb319d566..202350dcd 100644
--- a/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.32.bb
+++ b/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.35.bb
@@ -4,10 +4,11 @@ HOMEPAGE = "http://www.sqlalchemy.org/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c78b979ae6c20775a28a287d32092cbb"
 
-SRC_URI[sha256sum] = "c1b88cc8b02b6a5f0efb0345a03672d4c897dc7d92585176f88c67346f565ea8"
+SRC_URI[sha256sum] = "e11d7ea4d24f0a262bccf9a7cd6284c976c5369dac21db237cff59586045ab9f"
 
-PYPI_PACKAGE = "SQLAlchemy"
-inherit pypi setuptools3
+inherit pypi python_setuptools_build_meta
+
+DEPENDS += "python3-cython-native"
 
 RDEPENDS:${PN} += " \
     python3-asyncio \
-- 
2.25.1


