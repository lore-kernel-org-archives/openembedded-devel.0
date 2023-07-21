Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EC25EB64DD
	for <webhook@archiver.kernel.org>; Fri, 21 Jul 2023 20:38:32 +0000 (UTC)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
 by mx.groups.io with SMTP id smtpd.web11.17072.1689971908835916264
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 21 Jul 2023 13:38:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=FD9w006E;
 spf=pass (domain: baylibre.com, ip: 209.85.217.41, mailfrom: tgamblin@baylibre.com)
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-440ad576d87so1025195137.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 21 Jul 2023 13:38:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1689971907; x=1690576707;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=PkCOj6L8MgcOQQBy8nnQ68uLALfQgytcZPTkTNXs6jA=;
        b=FD9w006EzZ+Wb6fBtGqbLw6PH6HKM9+x0q7NrETiuwtFLaqJNjs8FcEV3f5TpyvHy5
         FPoq0p+4B9qI56e7KXfNX5ilrmkJD2tv2y4+cAz8SBQFqKFGYRAS0jqL1MlO5qSQglte
         d/aFytVhck7A26VOaicnnGwkknFmR3NxTTWOwRyMpr32f1Ad5l4E8jnxvgI+7DITiDGj
         AbQO5pJBl7lsYh9qF+w8YtBcsx5+xgUylIM1H/Z+Jn6WFOVceH0//bP3x8mWhSMMYB2G
         KKjMu90ShkPj7bKpb6i5o/ntfuXD5I0yRYZoNoHA2nWHGK4HYiArvxbea7GCkqKxdyMk
         r1lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689971907; x=1690576707;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PkCOj6L8MgcOQQBy8nnQ68uLALfQgytcZPTkTNXs6jA=;
        b=jV6sUgtAa4w1TxTsLyNETW1VFZVDgpCEOhsblPzyTgd78iWiuW8lOch1+TeegjeClq
         qi/UYbomw6v1xeBP8W8xmQwOngZ4L81OudI1FhAaiXcvOhcCCS+Q9+DMVkmGMG6wQuHi
         GeNht9QUFuoviTfmTm91+xC4dcKsOc6KXfvC+sXhc15WD52zVNKkTJai+TlYgqnnkssq
         9OP0DFsCCmaMoTaSqEAiE/lvJvRuTIBigsA7cJ5xZmF7x2mpcTFKzYJ3cHIZzRuo/DQU
         fh3JmJis3r2ntHxhfrogmhqnVSC/2A1NmXQJsKKH7gGpvlVGN1CA6BOQBPI07Warnsv7
         HHfg==
X-Gm-Message-State: ABy/qLap1LoCCR3yFJ+m/SWzaXvWWwXDveZMhAIGBVOnV0zhigsGNOhj
	j4sh2qi3GFh3cMtN7xV+FZ3aBu+N69/0flJzB7s=
X-Google-Smtp-Source: APBJJlExL3Tf9+f9ttElr8VRcah3I3mxvqV5sPQF7YBK2zlPXPi5wv9FfgZrjerqBQW0y/tpKgPBYA==
X-Received: by 2002:a05:6102:250:b0:444:c02c:f709 with SMTP id a16-20020a056102025000b00444c02cf709mr934108vsq.31.1689971907508;
        Fri, 21 Jul 2023 13:38:27 -0700 (PDT)
Received: from megalith.cgocable.net ([2001:1970:5b1f:ab00:fc4e:ec42:7e5d:48dd])
        by smtp.gmail.com with ESMTPSA id a30-20020a0ca99e000000b006238f82cde4sm1535647qvb.108.2023.07.21.13.38.26
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jul 2023 13:38:26 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH] python3-greenstalk: upgrade 2.0.0 -> 2.0.2
Date: Fri, 21 Jul 2023 16:38:25 -0400
Message-ID: <20230721203825.2557064-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 21 Jul 2023 20:38:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103984

Switch to python_setuptools_build_meta.

No changelog provided Commit history:

a4643c4 (HEAD -> main, tag: v2.0.2, origin/main, origin/HEAD) Release 2.0.2
87269f0 Remove redundant wheel dep from pyproject.toml
e30d3c4 (tag: v2.0.1) Release 2.0.1
36b348a Require a current version of Python
e189f4b Revert breaking API changes
868e9d0 Format with Black
5f4f424 Strip quotes from string stats
a31ad74 Add __repr__ to Job and Client
ebbb0f2 Improve names of private parsing functions
3ff9ef1 Use phony targets in Makefile
4feaf07 Format with Black
2c9165f Add test for drain mode
5068dc2 Enable strict mode in mypy
383176c Add type hints to integration test decorator
6fb0a48 Polish documentation
e8c5f20 Fix reportUnknownVariableType Pylance warnings
e7ac1da Polish API reference
9a384a8 Remove __slots__ from Job
45c53b4 Polish error handling
4f79e7c Document and type hint Job attributes
0f576a0 Remove sphinx-autodoc-typehints dev dependency
29a5499 Always use bytes for job bodies
3dc6430 Make it clear the requirements are for development
db496d5 Add command for building HTML docs
da73ed0 Fix Sphinx import path
c93efc0 Update link after changing default branch to main
7fc7eef Add PEP 561 py.typed marker file
5174142 Switch to package directory structure
40a9149 Add python_requires
18196e2 Add project_urls
59e3f99 Avoid installing unnecessary dependencies on CI
764f5bf Stop checking code coverage by default
45de080 Remove Codecov integration
1f0baf6 Specify license with license_files
74cad3b Switch to declarative package configuration
9e6aebb Remove unused Flake8 ignore
48cecff Use variable annotation syntax
56387c8 Drop support for Python 3.5
62e4bbf Update CI to only send one coverage report
d168cff Move CI to GitHub Actions
6281716 Add 3.9 to list of supported Python versions

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 ...thon3-greenstalk_2.0.0.bb => python3-greenstalk_2.0.2.bb} | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-greenstalk_2.0.0.bb => python3-greenstalk_2.0.2.bb} (65%)

diff --git a/meta-python/recipes-devtools/python/python3-greenstalk_2.0.0.bb b/meta-python/recipes-devtools/python/python3-greenstalk_2.0.2.bb
similarity index 65%
rename from meta-python/recipes-devtools/python/python3-greenstalk_2.0.0.bb
rename to meta-python/recipes-devtools/python/python3-greenstalk_2.0.2.bb
index 841b84ddf6..33eb62d5d9 100644
--- a/meta-python/recipes-devtools/python/python3-greenstalk_2.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-greenstalk_2.0.2.bb
@@ -3,9 +3,8 @@ HOMEPAGE = "https://github.com/mayhewj/greenstalk"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=8f98432ba1fce3933c556430fd47298f"
 
-SRC_URI[sha256sum] = "0020970abdb6f400586938573cbbec80410e83805d61e46cf76ea3ed71129257"
+SRC_URI[sha256sum] = "3ebde5fc9ecf986f96f6779fd6d15a53f33d432c52a2e28012e100a99ee154a4"
 
 RDEPENDS:${PN} += "python3-io python3-core"
 
-inherit pypi
-inherit setuptools3
+inherit pypi python_setuptools_build_meta
-- 
2.41.0


