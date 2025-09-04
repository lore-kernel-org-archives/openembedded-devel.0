Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A79ECCA1016
	for <webhook@archiver.kernel.org>; Thu,  4 Sep 2025 22:13:11 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.web11.7431.1757023989448177510
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Sep 2025 15:13:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=O3j1u18H;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-256628-202509042213072f242e1c9a000207ef-r_tuem@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 202509042213072f242e1c9a000207ef
        for <openembedded-devel@lists.openembedded.org>;
        Fri, 05 Sep 2025 00:13:07 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=3gsi8Q9lfDY8Knnl5vuiQp4974u/GhhWCu2gX+NfK7c=;
 b=O3j1u18HtkggZutodCfHgEpUCtt3H7y617xY00brk+HV8LHNlTgRSmHYwuw4xKDI3fjYHB
 +zWWYnUxq+dchxZX93MqZSNW81QLwH2SxRPSIkN0h1Bp9BseRvv9QPXR9CFcN1g9edTQz3Ez
 +VV1P2CYMgHIygZDYHmEC3ZpwnMiXHDQgcvpl4E1Q5/W3GVO1UqzJAXMWbTXo44LpdRCY3dm
 9Q+KZc4LIrMgQW/i1k0YHPXwSnhvj2OZ7QRL9sLZA89PUmTAWc+tsNnXz9WeCeEpAnsWf+sZ
 ClGhs10R41OQh64CULIrkLKeo9STvwmLza3blmb8GDyM6J52/RzF4Uew==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][PATCH 06/10] poco: disable redis config by default
Date: Fri,  5 Sep 2025 00:11:35 +0200
Message-Id: <20250904221139.3131569-6-peter.marko@siemens.com>
In-Reply-To: <20250904221139.3131569-1-peter.marko@siemens.com>
References: <20250904221139.3131569-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 04 Sep 2025 22:13:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119303

From: Peter Marko <peter.marko@siemens.com>

Tests for Redis are completely failing.
Should be fixed by someone interested in this feature.

Each test gives:
Couldn't connect to [localhost:6379].
test<TEST>: Not connected, test skipped.

And summary shows:
!!!FAILURES!!!
Runs: 54   Failures: 0   Errors: 1

There was 1 error:
 1: CppUnit::TestCaller<RedisTest>.testPool
    "Poco::AssertionViolationException:
Assertion violation: _output in file "../sources/poco-1.13.3/Redis/src/Client.cpp", line 178"
    in "<unknown>", line -1

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta-oe/recipes-support/poco/poco_1.13.3.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/poco/poco_1.13.3.bb b/meta-oe/recipes-support/poco/poco_1.13.3.bb
index 3a15b74537..97e4d9f963 100644
--- a/meta-oe/recipes-support/poco/poco_1.13.3.bb
+++ b/meta-oe/recipes-support/poco/poco_1.13.3.bb
@@ -24,7 +24,7 @@ inherit cmake ptest
 # By default the most commonly used poco components are built
 # Foundation is built anyway and doesn't need to be listed explicitly
 # these don't have dependencies outside oe-core
-PACKAGECONFIG ??= "XML JSON PDF Util Net NetSSL Crypto JWT Data DataSQLite Zip Encodings Redis Prometheus"
+PACKAGECONFIG ??= "XML JSON PDF Util Net NetSSL Crypto JWT Data DataSQLite Zip Encodings Prometheus"
 # MongoDB does not build for all architectures yet keep in sync with COMPATIBLE_HOST list in mongodb recipe
 # and mongodb needs meta-python enabled as well
 PACKAGECONFIG:remove:riscv32 = "MongoDB"
@@ -47,7 +47,6 @@ PACKAGECONFIG[Data] = "-DENABLE_DATA=ON,-DENABLE_DATA=OFF"
 PACKAGECONFIG[DataSQLite] = "-DENABLE_DATA_SQLITE=ON,-DENABLE_DATA_SQLITE=OFF,sqlite3"
 PACKAGECONFIG[Zip] = "-DENABLE_ZIP=ON,-DENABLE_ZIP=OFF"
 PACKAGECONFIG[Encodings] = "-DENABLE_ENCODINGS=ON,-DENABLE_ENCODINGS=OFF"
-PACKAGECONFIG[Redis] = "-DENABLE_REDIS=ON,-DENABLE_REDIS=OFF"
 PACKAGECONFIG[Prometheus] = "-DENABLE_PROMETHEUS=ON,-DENABLE_PROMETHEUS=OFF"
 
 # Additional components not build by default,
@@ -61,6 +60,7 @@ PACKAGECONFIG[ActiveRecord] = "-DENABLE_ACTIVERECORD=ON,-DENABLE_ACTIVERECORD=OF
 PACKAGECONFIG[ActiveRecordCompiler] = "-DENABLE_ACTIVERECORD_COMPILER=ON,-DENABLE_ACTIVERECORD_COMPILER=OFF"
 PACKAGECONFIG[PageCompiler] = "-DENABLE_PAGECOMPILER=ON,-DENABLE_PAGECOMPILER=OFF"
 PACKAGECONFIG[PageCompilerFile2Page] = "-DENABLE_PAGECOMPILER_FILE2PAGE=ON,-DENABLE_PAGECOMPILER_FILE2PAGE=OFF"
+PACKAGECONFIG[Redis] = "-DENABLE_REDIS=ON,-DENABLE_REDIS=OFF"
 PACKAGECONFIG[SevenZip] = "-DENABLE_SEVENZIP=ON,-DENABLE_SEVENZIP=OFF"
 
 EXTRA_OECMAKE = "-DCMAKE_BUILD_TYPE=RelWithDebInfo -DPOCO_UNBUNDLED=ON \

