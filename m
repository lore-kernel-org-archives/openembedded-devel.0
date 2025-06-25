Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70237C7115C
	for <webhook@archiver.kernel.org>; Wed, 25 Jun 2025 14:12:50 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web11.16393.1750860762989735900
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Jun 2025 07:12:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=mC8OMfiH;
 spf=pass (domain: konsulko.com, ip: 209.85.218.54, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ad89c32a7b5so298733466b.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Jun 2025 07:12:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1750860761; x=1751465561; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VZHKFbTMq6JoGlBqVsr5LBWK0xKLEIFZ8mdUNFSi6bI=;
        b=mC8OMfiHftifi3YjiiUF7/LosOhpUl7L2RUIMEoy+rOoNHeyE8eV1TG4ZrRr46LzG4
         Ou2h4vgnQaKh/bXZagqzTqfp4zFjwKdMlyp3wHOHSjFTk7uRHD/1Assg3xwTVjMQS5gW
         qwaeXkeIRzeXU+r4Pv5gEG3ceunW43NxiXTaU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750860761; x=1751465561;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VZHKFbTMq6JoGlBqVsr5LBWK0xKLEIFZ8mdUNFSi6bI=;
        b=V8i/kySgzHDCKKCW1Da3HrfSAYO98pa2FBNhXBJcU0zQOmgel+DW6Yc5cRpH1kNpBM
         GE3CuUZTdMP5SL1JN92QrmC+NDERZG1sU5lBBNQ0HYR76/gP8a+9oj7J9jCXcDDbLo8s
         G3p2dWq/ye5DXG7BMrg/KQHVl0J5iw1LhmDUQZIyaJwkkjiMMY6Cqu70In7ueMtQDiH0
         Bwt7XWVfG+OtzZafuHZIw3uyQrlRuGb4XvWzE6gnLaSG6GW9yyZROjZpfv6FxdRB5sBu
         JJbRnBFJJC+p39fwPMOzZiya20RIxP+y5cam4vopYy9LUA5S5i06mJM4NxWRsrTPrHxI
         ArmQ==
X-Gm-Message-State: AOJu0Yzbd1t5iZ9sNRq6AvYzmy3VygnEKkCVFa/PlK5Yoxduaj+NHNZu
	Nc5ZumO47MTDdpKD6NXUkpNOQ9tV/V0GI18xryL6xjHevoStr3O6lQN8/q4CV4vRYDA6kGs11Oz
	D+stm
X-Gm-Gg: ASbGncuVruwJJSTemOxvMC9u7UQgORB5H2YqY3JfVUYgGHt97ka14L+0ggrH9BNzleo
	6BvdAPt5d/8hD0/GAayM1r5pUt9rHkgxmWYfDadj652ybOQVFWsDujg+xjmw4LxOz3veAWtn0F9
	rwpuZgIG6OANWfhwieGqR87uuJjUzrZxCJAf4Z4uDvMjB3G+3mqPR3a8whAgE71BVIqZ5kIa0gm
	CBvmzyRTJAou8iJrkGcYpwkz3FkaiqUB5sSUqXPvCKYe2G+tDX9xqf/3GLDf9H7wdZwbdKXuA1l
	RH3GyJBXgFq1U0f/l2Ds8d8ALPQ2DIblvS0ztH1bTpgilzj6FCgvgVOYOXHRPHiRWO6NIYtVUjd
	L3WWTi+D7t/8=
X-Google-Smtp-Source: AGHT+IFoiHV0NA8VeFHZ/+nZ3wD+LztKJfDqlAF70mphETZKHyQha2qgWnhTG3gjwwr0jh1NcQSXWw==
X-Received: by 2002:a17:907:c24c:b0:ad2:1cd6:aacf with SMTP id a640c23a62f3a-ae0beed95bamr321081066b.47.1750860760949;
        Wed, 25 Jun 2025 07:12:40 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0541b6e41sm1046181166b.121.2025.06.25.07.12.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 07:12:40 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/2] python3-nocaselist: Upgrade 2.0.3 -> 2.1.0
Date: Wed, 25 Jun 2025 17:12:36 +0300
Message-Id: <20250625141236.3027897-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250625141236.3027897-1-leon.anavi@konsulko.com>
References: <20250625141236.3027897-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 25 Jun 2025 14:12:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118109

- Dropped support for Python 3.6 and 3.7 because they are out of
  service and to simplify development dependencies.
- Dev: Changed 'make install' to no longer perform an editable
  install, but a standalone install, since pip will remove support
  for editable installs.
- Dev: Removed support for the env.var TEST_INSTALLED that used the
  installed package for testing, for simplicity. Now, the local
  package in the repository main directory is always used for
  testing.
- Addressed safety issues up to 2025-04-27.
- Dev: Added missing dependencies for development.
- Test: Fixed the issue that coveralls was not found in the test
  workflow on MacOS with Python 3.9-3.11, by running it without
  login shell. Added Python 3.11 on MacOS to the normal tests.
- Fixed new issues of Pylint 3.3.
- Added support for Python 3.13. This required increasing the
  minimum version of several packages needed for development.
- Added '__version_tuple__' with the integer versions.
- Dev: Changed from setup.py to using pyproject.toml.

Fixes:

WARNING: python3-nocaselist-2.1.0-r0 do_check_backend: QA Issue:
inherits setuptools3 but has pyproject.toml with
setuptools.build_meta, use the correct class [pep517-backend]

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...3-nocaselist_2.0.3.bb => python3-nocaselist_2.1.0.bb} | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-nocaselist_2.0.3.bb => python3-nocaselist_2.1.0.bb} (54%)

diff --git a/meta-python/recipes-devtools/python/python3-nocaselist_2.0.3.bb b/meta-python/recipes-devtools/python/python3-nocaselist_2.1.0.bb
similarity index 54%
rename from meta-python/recipes-devtools/python/python3-nocaselist_2.0.3.bb
rename to meta-python/recipes-devtools/python/python3-nocaselist_2.1.0.bb
index a869453875..ba148cbfa8 100644
--- a/meta-python/recipes-devtools/python/python3-nocaselist_2.0.3.bb
+++ b/meta-python/recipes-devtools/python/python3-nocaselist_2.1.0.bb
@@ -3,9 +3,14 @@ HOMEPAGE = "https://nocaselist.readthedocs.io/en/latest/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "55714da8433fb4843ce797404977e4385d5e3df9e4aa00f7dde983fd87410fef"
+SRC_URI[sha256sum] = "fb7306f5a3e045534e737ab7ecbeee039ba5e9bafbc5b5f231f616d7e9211b65"
 
-inherit pypi setuptools3
+inherit pypi python_setuptools_build_meta
+
+DEPENDS += " \
+	python3-setuptools-scm-native \
+	python3-toml-native \
+"
 
 RDEPENDS:${PN} += " \
 	python3-six \
-- 
2.39.5


