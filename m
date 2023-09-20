Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 180C4C04AA7
	for <webhook@archiver.kernel.org>; Wed, 20 Sep 2023 16:13:44 +0000 (UTC)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
 by mx.groups.io with SMTP id smtpd.web10.44331.1695226417721779488
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Sep 2023 09:13:37 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.128.180, mailfrom: straka.derek@gmail.com)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-59e77e4f707so44166907b3.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 20 Sep 2023 09:13:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695226416; x=1695831216;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xARlKqAaDny7qLgVixpVenmopuT9tPsSHk6Ih1d45pQ=;
        b=ZjjD2DJx4mbmtjVlmCvdsZhF5y/UKju3Cxk/rBJABGNIwpTmhMPYfG9ZHc0UFt4U4M
         vAzDoD+40x9LagHNGvkOIqfKOkmfSs2ZEA3GcuHcf4tJYYboB73jnj23yIXf4YJgze4U
         /YTT6RWatQI95hj5FfgJRxR1ZhKlN69Sj+zHolA7szb4VFsSAloYEA8iEnv29jRsd1c1
         sunZQ1IudFQoFt/yZT1fBbMYCllmJhwFBiXJOYLrhHejhNZicPoBM6nqiWHnUMkv/RDR
         6M3pFT9vlaiWElTQI+PQrinqKGgLKMG59jJ8tHnI7Ql5XrVKs9H1YdX8Og0BqOaFRpGX
         0cng==
X-Gm-Message-State: AOJu0Yz71gtOdo9+bePnrJ8kpB3JFPtnBROpvhbsnBmQpqmrOIWtnN2v
	O0Y1OBJMg5yaOC+18ZFR6oGqg1wJfs2a3g==
X-Google-Smtp-Source: AGHT+IGNn14+8ha7yKt/d5O5U5v4lq3NKLnQ3cPoVOQphWL1Oy7gAg4s2vwjpRbXdyPg2sAeVOachA==
X-Received: by 2002:a81:bb4a:0:b0:59e:9a44:9db9 with SMTP id a10-20020a81bb4a000000b0059e9a449db9mr2934136ywl.26.1695226416397;
        Wed, 20 Sep 2023 09:13:36 -0700 (PDT)
Received: from sparta.internal.asterius.io (c-73-228-213-122.hsd1.mn.comcast.net. [73.228.213.122])
        by smtp.gmail.com with ESMTPSA id b1-20020a0dc001000000b0058e37788bf7sm3867432ywd.72.2023.09.20.09.13.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Sep 2023 09:13:35 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH] python3-absl: Update version 1.4.0 -> 2.0.0
Date: Wed, 20 Sep 2023 16:13:13 +0000
Message-Id: <20230920161313.1230258-1-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 20 Sep 2023 16:13:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105015

Changelog
==================
New
Support Python 3.12.

Changed
absl-py no longer supports Python 3.6. It has reached end-of-life for more
than a year now.
(logging) logging.exception can now take exc_info as argument, with
default value True. Prior to this change setting exc_info would raise
KeyError, this change fixes this behaviour.
(testing) For Python 3.11+, the calls to absltest.TestCase.enter_context
are forwarded to unittest.TestCase.enterContext (when called via instance)
or unittest.TestCase.enterClassContext (when called via class) now. As a
result, on Python 3.11+, the private _cls_exit_stack attribute is not
defined on absltest.TestCase and _exit_stack attribute is not defined on
its instances.
(testing) absltest.TestCase.assertSameStructure() now uses the test case's
equality functions (registered with TestCase.addTypeEqualityFunc()) for
comparing leaves of the structure.
(testing) abslTest.TestCase.fail() now names its arguments
(self, msg=None, user_msg=None), and not (self, msg=None, prefix=None),
better reflecting the behavior and usage of the two message arguments.
DEFINE_enum, DEFINE_multi_enum, and EnumParser now raise errors when
enum_values is provided as a single string value. Additionally,
EnumParser.enum_values is now stored as a list copy of the provided
enum_values parameter.
(testing) Updated paramaterized.CoopTestCase() to use Python 3 metaclass
idioms. Most uses of this function continued working during the Python 3
migration still worked because a Python 2 compatibility __metaclass__
variables also existed. Now pure Python 3 base classes without backwards
compatibility will work as intended.
(testing) absltest.TestCase.assertSequenceStartsWith now explicitly fail
when passed a Mapping or Set object as the whole argument.

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/{python3-absl_1.4.0.bb => python3-absl_2.0.0.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-absl_1.4.0.bb => python3-absl_2.0.0.bb} (76%)

diff --git a/meta-python/recipes-devtools/python/python3-absl_1.4.0.bb b/meta-python/recipes-devtools/python/python3-absl_2.0.0.bb
similarity index 76%
rename from meta-python/recipes-devtools/python/python3-absl_1.4.0.bb
rename to meta-python/recipes-devtools/python/python3-absl_2.0.0.bb
index bbea9cacb..42c7f3f84 100644
--- a/meta-python/recipes-devtools/python/python3-absl_1.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-absl_2.0.0.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI[sha256sum] = "d2c244d01048ba476e7c080bd2c6df5e141d211de80223460d5b3b8a2a58433d"
+SRC_URI[sha256sum] = "d9690211c5fcfefcdd1a45470ac2b5c5acd45241c3af71eed96bc5441746c0d5"
 
 PYPI_PACKAGE = "absl-py"
 
-- 
2.34.1


