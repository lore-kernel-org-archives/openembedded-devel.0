Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DD18C433EF
	for <webhook@archiver.kernel.org>; Mon, 29 Nov 2021 15:05:06 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.66])
 by mx.groups.io with SMTP id smtpd.web10.62133.1638198305059484331
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Nov 2021 07:05:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=yz4sFo9C;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.66,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1638198303; i=@fujitsu.com;
	bh=Uyc0a2H8vxp3uEricrCH3h0A60ufJpPP7CbEuczDxn0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=yz4sFo9CFoQdP5HbpaMHObPR3WDNYBjShidjTBOx3KwwSgJYWRwDpUOLv2FUbfo1b
	 W0fAhbiIIoT3ieSVB3+KQhO1PmMT2nXlLjeTVOVfQm7YYfxe4OjryVrlf+qtYDbs/N
	 HjVtFnyz8/TkepxmNxz3V4P9yy6eTv5DNGrqMloewIz7iQtUU5csFnaYjlPHch0GMR
	 m6RMcdxwrTHh1ovgjnXxJjGOwBQIgl969Iw+2Vdt0L64xkLjcPcvh2NvVj4K8dSRT8
	 WSMuGBeOw4EDGe8umomqa8YMQ66yun/cYRmiUXa7C8NBCnTQ23qeKijXRA5ZLv2Xhu
	 jSbf9hkPIq1MQ==
Received: from [100.115.3.142] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-a.eu-west-1.aws.ess.symcld.net id B2/07-06911-F1CE4A16;
 Mon, 29 Nov 2021 15:05:03 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrHIsWRWlGSWpSXmKPExsViZ8MxRVfuzZJ
  EgxM7LCwuHl7K7MDocW7jCsYAxijWzLyk/IoE1ozGfafZCq5xV7RNWMfUwDiXq4uRi0NIYCaT
  RMPVbnYI5wSjxIsN51m6GDk52ATUJKbfusEKYosI6Essnb2HGcRmFlCRePG7hx3EFhZwkNi4v
  48RxGYRUJU40n0BzOYVcJaYcHY9E4gtIaAgMeXhe7BeTgEXic97j4HNFAKq+Xx9IStEvaDEyZ
  lPWCDmS0gcfPGCGaJXUWL25WYWCLtCYtasNqYJjPyzkLTMQtKygJFpFaNVUlFmekZJbmJmjq6
  hgYGuoaGprpmukaGBXmKVbqJeaqlueWpxia6hXmJ5sV5qcbFecWVuck6KXl5qySZGYFCmFLNd
  2sE4t++n3iFGSQ4mJVHerCVLEoX4kvJTKjMSizPii0pzUosPMcpwcChJ8Pa/AsoJFqWmp1akZ
  eYAIwQmLcHBoyTCW/wCKM1bXJCYW5yZDpE6xajLcWXVkkXMQix5+XmpUuK8J0FmCIAUZZTmwY
  2AReslRlkpYV5GBgYGIZ6C1KLczBJU+VeM4hyMSsK8t0Gm8GTmlcBtegV0BBPQEW+XLgY5oiQ
  RISXVwCT9yiw03X0Zx2PjuUdrTnn6pZ5k2+lQfPDFphbnwjs3jog/s+X9ltR9ys3Xf8PfE6Ue
  mxm2HPxVF6ViKXdf9l96xdQruryKCdxdHKJr20PbFda8T4sJdWR6yHnkkIDdIaZ0K5so69Xrs
  su2PNq7iXf/hdI3yuvOv+IMcA+xYqm0Uer5NyUofeY9ERVX4xOWX3dzehRPvXv+kvT10HvnJI
  9Zqcf5OwWo/YwQ8xK8knv1yZuiac4RJfG5S/3uTqnYME1oTeAN36mxBjHLmg0Yebn478VfFY1
  g2H6D+YVY1bS5a2eUtAhMm/rs/Pxpyj9Pxdty/9IodD1dUle6eJdsC9cnuU3LQw7H26vOMT9d
  rsRSnJFoqMVcVJwIACJ0xHhRAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-2.tower-591.messagelabs.com!1638198302!21368!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 22745 invoked from network); 29 Nov 2021 15:05:02 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-2.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 29 Nov 2021 15:05:02 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1ATF4v3H030174
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Nov 2021 15:05:02 GMT
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Mon, 29 Nov 2021 15:05:00 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] ostree: upgrade 2021.5 -> 2021.6
Date: Mon, 29 Nov 2021 23:04:46 +0800
Message-ID: <1638198287-119133-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1638198287-119133-1-git-send-email-wangmy@fujitsu.com>
References: <1638198287-119133-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 29 Nov 2021 15:05:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94136

Changelog:
This is a bugfix release.
Most of the fixes are related to warnings highlighted by gcc -fanalyzer static
source analysis.
Performance of pruning logic has been improved, avoiding unnecessary trips
through redundant serialization (#2484).
A regression has been fixed so that ostree is properly behaving again when
used from the initramfs, at a point where /sysroot may not be mounted yet (#2486).
A race condition related to sysroot.readonly has been addressed by directly
setting up sysroot readonly in initramfs (#2187).

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../ostree/{ostree_2021.5.bb => ostree_2021.6.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/ostree/{ostree_2021.5.bb => ostree_2021.6.bb} (99%)

diff --git a/meta-oe/recipes-extended/ostree/ostree_2021.5.bb b/meta-oe/recipes-extended/ostree/ostree_2021.6.bb
similarity index 99%
rename from meta-oe/recipes-extended/ostree/ostree_2021.5.bb
rename to meta-oe/recipes-extended/ostree/ostree_2021.6.bb
index 7e21a0ce90..8f37a7f86f 100644
--- a/meta-oe/recipes-extended/ostree/ostree_2021.5.bb
+++ b/meta-oe/recipes-extended/ostree/ostree_2021.6.bb
@@ -25,7 +25,7 @@ SRC_URI = " \
     gitsm://github.com/ostreedev/ostree;branch=main;protocol=https \
     file://run-ptest \
 "
-SRCREV = "63bf5e606b24c7343bfe622bf6af2110ee6beabc"
+SRCREV = "f1155c8d283c3c85d74d5e1050b0dcf8198f750a"
 
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+\.\d+)"
 
-- 
2.25.1


