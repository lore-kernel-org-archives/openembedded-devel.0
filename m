Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE2ABC369C9
	for <webhook@archiver.kernel.org>; Thu, 17 Apr 2025 12:32:47 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web10.7641.1744893159095015006
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 17 Apr 2025 05:32:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=V1/3K52T;
 spf=pass (domain: konsulko.com, ip: 209.85.128.41, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43cef035a3bso4609145e9.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 17 Apr 2025 05:32:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1744893157; x=1745497957; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J35xX+SSXhJjd/x0bOg67ffWpqqOHGqgOyENsU0a9g4=;
        b=V1/3K52TO7QG1Vq8mSMqSI9UxVIFREmn6+Z74cI40zdxiH9sQWW5aLgJQYhDM/7t+P
         27hrS50cJU0mFRiSH5XHCbz+KZEs6lHNjVtmnA/L8N74wBxMkjp46Aid9iHx8AGCPxs1
         fxCutKQceTjId15BdI0dDy1PzJ8AmyozGhkRQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744893157; x=1745497957;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J35xX+SSXhJjd/x0bOg67ffWpqqOHGqgOyENsU0a9g4=;
        b=ugtDuE8odsiVrF9F6tCMe/P8QNxO6GFaY/DysGNRC18d9b8p63VpFnlvxNln4Vv6+d
         gLa6z9a8CrRzGoBcNojsZJmkQd+5F74rtHnCaUDMJ61Q7dn3Rl8bilDADIP/E0zvOmDX
         WuXkgCJed+mKSv3HuM2KVY85okrRkoC6kWfSOnLEY0NJPbrxBo60dsrZawGXVuoUTmQs
         3TO5BWQKzMYnUpKIjTfOe2oeTNzSbOl/nYNIdVXmbu1iToLl/AuJLQNcGk6IjSXzSxb/
         UwsuVuQMQW+gYost45HS7W/3sjBb2IsnVJCKHkjEC+7lvJzerDrIYVSzoZsIX4EP9Zqe
         IA2Q==
X-Gm-Message-State: AOJu0Yw/U5LX6nYRUNdQsHDuSikD163SRHmkWFc3cX0kFHxQ1cTN8PmF
	ST5T1EzdnOFfcvse3CyI1eGUKppz4ddO8DRguwAFDkdjpqjyREln70TBGYa0CMhMEnUeNa+3tED
	f
X-Gm-Gg: ASbGncvrvGM08tGQgq0jV21wHH1RWazrGdWQoh+PrjqXVbWp+3Sx9o2mdsk51uE8A2T
	y28WSnjdYyrcjUza1GhdURw14ahvEetlKYhhvavt8sOvuSaw7a5D4YIuTWTrlQNc+fUPcCD5Ba9
	wh1Vs/oof1Em3vNeZBsHRDjsaVXGsgTk0SdnXhgLAZVTuejI/xQU6Zchy9RfBEIhMeP+7tk7Tmh
	dsM56veIsnkcLown0V62CeBdwfeXRLBw823gJiIQ9JiA/wymarn85JCVyLU1GzKSs7cEfeI89EP
	XNtGtkKCnZ5aB9IQJ2z88DAwCXMnDk6YfC+I5EJd/DVp6MkC/sxeHvumgJAaAddunA==
X-Google-Smtp-Source: AGHT+IEbq6MsT42N9osVOS2GLpvoINmWiawS3NN4LpTCYQXg1IU2ewHEF9sBFRSCAPhVNOqHnpEFQw==
X-Received: by 2002:a05:600c:218b:b0:43d:7588:6699 with SMTP id 5b1f17b1804b1-4405d5fd620mr42169065e9.7.1744893157274;
        Thu, 17 Apr 2025 05:32:37 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae96407esm20208804f8f.17.2025.04.17.05.32.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 05:32:36 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 4/6] python3-eth-hash: Upgrade 0.7.0 -> 0.7.1
Date: Thu, 17 Apr 2025 15:32:29 +0300
Message-Id: <20250417123231.3063208-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250417123231.3063208-1-leon.anavi@konsulko.com>
References: <20250417123231.3063208-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 17 Apr 2025 12:32:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116934

Upgrade to release 0.7.1:

- Merge template, updating CI runs and what is included in package
  files
- Run mypy linting locally via a pre-commit hook
- Merge template updates, notably adding support for py313 and
  moving docs from the README to ReadTheDocs

License-Update: Updated copyright years

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...{python3-eth-hash_0.7.0.bb => python3-eth-hash_0.7.1.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-eth-hash_0.7.0.bb => python3-eth-hash_0.7.1.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-eth-hash_0.7.0.bb b/meta-python/recipes-devtools/python/python3-eth-hash_0.7.1.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-eth-hash_0.7.0.bb
rename to meta-python/recipes-devtools/python/python3-eth-hash_0.7.1.bb
index 1137e744cf..ce67505659 100644
--- a/meta-python/recipes-devtools/python/python3-eth-hash_0.7.0.bb
+++ b/meta-python/recipes-devtools/python/python3-eth-hash_0.7.1.bb
@@ -1,9 +1,9 @@
 SUMMARY = "eth-hash: The Ethereum hashing function, keccak256, sometimes (erroneously) called sha3"
 HOMEPAGE = "https://github.com/ethereum/eth-hash"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=3d7bdfe69b1ffbde073ca6e96f5c53f7"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=3ef06eb4d4373222e59a338e2eb9a795"
 
-SRC_URI[sha256sum] = "bacdc705bfd85dadd055ecd35fd1b4f846b671add101427e089a4ca2e8db310a"
+SRC_URI[sha256sum] = "d2411a403a0b0a62e8247b4117932d900ffb4c8c64b15f92620547ca5ce46be5"
 
 inherit pypi python_setuptools_build_meta
 
@@ -17,4 +17,4 @@ PACKAGECONFIG[test] = ",,,python3-pytest python3-pytest-xdist"
 
 RDEPENDS:${PN} += "python3-core python3-logging python3-pycryptodome"
 
-PYPI_PACKAGE = "eth-hash"
+PYPI_PACKAGE = "eth_hash"
-- 
2.39.5


