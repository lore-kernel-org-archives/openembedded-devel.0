Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B8E0C6FA89
	for <webhook@archiver.kernel.org>; Mon,  5 Sep 2022 09:02:42 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.3])
 by mx.groups.io with SMTP id smtpd.web08.22551.1662368552445548420
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 Sep 2022 02:02:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=pNspkFdM;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.3,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1662368550; i=@fujitsu.com;
	bh=IJ4rVM4oRNVp9d+Fs6Q2W2BCv+pENCnK0FZ0QEO3HeI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=pNspkFdM0XceU9/UihbHNjJElbuPy5AfpKfPycQ83n6IHPqvkJCSwuD+ArRoAabt3
	 DdJ9T/yvqj28JDELOGWkZvLlXENyK6zUktWpcCxKdeWgn5uWKRRBktcNxMyDnam/qx
	 Uqb1QenLhJcQUA8aaOusGdYQhdKbkjr7qsglyCdZPWHfe7qVH6KPx2xP+/NfgklhPQ
	 ptULKWY/P+x2xqfjkOQm3qixh2GyrOnLQ4eUOhJLu1YYn0dwLtORJVPk9MiHiUcQVG
	 xIXKgweGk77W7HWRwuI32gdydFv+olpRH5MEMcPWUXnsFUylBJMPEbpw/crB1gp5Z5
	 bSjc/VJmees5g==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrNIsWRWlGSWpSXmKPExsViZ8MxSVdlt2i
  ywb0uS4uLh5cyOzB6nNu4gjGAMYo1My8pvyKBNeP8tIusBVPYKzbO7GRuYNzE1sXIySEk8IRR
  4vsqvy5GLiD7OpPEjaPPmSCc3YwS305dYQGpYhNQk5h+6wYriC0ioC+xdPYeZhCbWUBF4sXvH
  nYQW1jAR2LW7FNMIDYLUHzGxblgcV4BJ4lNR94wgtgSAgoSUx6+Z4aIC0qcnPmEBWKOhMTBFy
  +YIWoUJWZfbmaBsCskGqcfYoKw1SSuntvEPIGRfxaS9llI2hcwMq1itE4qykzPKMlNzMzRNTQ
  w0DU0NNU1NgIyTfQSq3QT9VJLdctTi0t0jfQSy4v1UouL9Yorc5NzUvTyUks2MQLDMqVYIWMH
  4/eVP/UOMUpyMCmJ8r6fI5osxJeUn1KZkVicEV9UmpNafIhRhoNDSYJ35Q6gnGBRanpqRVpmD
  jBGYNISHDxKIrz+64DSvMUFibnFmekQqVOMlhxTZ//bz8yxHEzO/Np2gFmIJS8/L1VKnHcTyD
  wBkIaM0jy4cbA4vsQoKyXMy8jAwCDEU5BalJtZgir/ilGcg1FJmJcLZApPZl4J3NZXQAcxAR1
  k1ycMclBJIkJKqoFp/YPW0DuPCt4m9FzvDTly5N67lBIBtT1vZ8RdvzST6+F8z+ZP1U+3bf0y
  c3Fcxv7c2bXf+PmKT22Qttw7yahe10F18Qona/3a9BlnszYmVc3tcZRMiLqf2sJ5uNY912r5g
  cpN/V/vGrr+8/dnaZVziZtcvNWwZLE3Q/PSwq43VfmPGfYt+XJHonON6rM+wyuL6xdr6zRZbG
  gR77mu/9L80TbZntfie6dK6yu7itWdut0wadHji/svWnpH1r5ZdmzryozLJX8vfdr4RbBeI9b
  H/VWpc62OiqCO9RarSvnWKtV+sdBdySsen2GdeGqx8Esl/xzG0owdGyXkDuavFKvpuv181sXE
  Yu37M1bv2NSjxFKckWioxVxUnAgAtjeNvV4DAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-16.tower-565.messagelabs.com!1662368548!361756!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 19366 invoked from network); 5 Sep 2022 09:02:28 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-16.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 5 Sep 2022 09:02:28 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 8BD821000CC
	for <openembedded-devel@lists.openembedded.org>;
 Mon,  5 Sep 2022 10:02:28 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121
 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 890E61000C1
	for <openembedded-devel@lists.openembedded.org>;
 Mon,  5 Sep 2022 10:02:28 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 5 Sep 2022 10:02:26 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] abseil-cpp: upgrade 20220623.0 -> 20220623.1
Date: Mon, 5 Sep 2022 17:02:05 +0800
Message-ID: <1662368529-32226-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 05 Sep 2022 09:02:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98659

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb
index b3dc06ca14..af28da5935 100644
--- a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb
+++ b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb
@@ -7,8 +7,8 @@ SECTION = "libs"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=df52c6edb7adc22e533b2bacc3bd3915"
 
-PV = "20220623.0"
-SRCREV = "273292d1cfc0a94a65082ee350509af1d113344d"
+PV = "20220623.1"
+SRCREV = "8c0b94e793a66495e0b1f34a5eb26bd7dc672db0"
 BRANCH = "lts_2022_06_23"
 SRC_URI = "git://github.com/abseil/abseil-cpp;branch=${BRANCH};protocol=https \
            file://0001-absl-always-use-asm-sgidefs.h.patch             \
-- 
2.25.1


