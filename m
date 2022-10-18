Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4A1AC4332F
	for <webhook@archiver.kernel.org>; Tue, 18 Oct 2022 01:08:36 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.2])
 by mx.groups.io with SMTP id smtpd.web12.1840.1666055307757755185
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Oct 2022 18:08:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=YNGuEFt/;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1666055305; i=@fujitsu.com;
	bh=XSerR2jy2hWv83q03By7oBWu2mYUMBgV7GsP4JRUahg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=YNGuEFt/MTb8nAdLPmNy7xJNb8V01d8vc6xplD5CzBque4zJc3jjIXrIL9Yie1gph
	 EGaLuQGAYsaCSCmlM2rx+TPxr9udpQ1UKtbGJ84r+gy1q8qVDBhKQoNR7bqozoRhO4
	 vNwUvxnAo0E2bX33xXEwrmaMwcqtaMS5HgiMSi3MuHm3bDYSKRgy65GZNHCe7tHxf5
	 DfZj1jIxEPhSZVtB8/Y2vTjt1RnJVVN0gQS+BJ/erhaUbV8VXO7gEh72KdEzyGhFo5
	 tGfX9o6Q4P/IrqlvZt0SnsCDmrj8/K51rZXRMfGByo/nSF8QmEb7J2SRpzbV2s3vrh
	 xupJKMyMh8gjg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrGIsWRWlGSWpSXmKPExsViZ8MxSbfzj2+
  ywYTjTBYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bp2/dYCxZyVlx82MTcwLiLo4uRk0NI4Amj
  RO9nqy5GLiD7OpPElhObmCGcPYwSOxvWsIBUsQmoSUy/dYMVxBYR0JdYOnsPM4jNLKAi8eJ3D
  zuILSwQLNG2cjlQPTsHi4CqxJwckCivgKPE/Z3fwTolBBQkpjx8D9bJKeAk8XTnAlaIGxwlTs
  8/ww5RLyhxcuYTFojpEhIHX7xghuhVlJh9uZkFwq6QmDWrjQnCVpO4em4T8wRGwVlI2mchaV/
  AyLSK0aw4tagstUjX0FwvqSgzPaMkNzEzRy+xSjdRL7VUtzy1uETXUC+xvFgvtbhYr7gyNzkn
  RS8vtWQTIzBwU4rZBXYwHln2R+8QoyQHk5Iob8cM32QhvqT8lMqMxOKM+KLSnNTiQ4wyHBxKE
  rwdP4BygkWp6akVaZk5wCiCSUtw8CiJ8EadAUrzFhck5hZnpkOkTjEac6xtOLCXmWPm17YDzE
  Isefl5qVLivKd/A5UKgJRmlObBDYJF9yVGWSlhXkYGBgYhnoLUotzMElT5V4ziHIxKwrypv4C
  m8GTmlcDtewV0ChPQKRn7vUBOKUlESEk1MC2+FRVRkf6k747OBZHDYkfn5XzqZNm0cJblXJFC
  7vOORxf25gdGHv67XKXKctJSnwneFa8dnh9r/cJ8fCl3zqwP4mVHTFhK/+l0S/88UGKUtOpmh
  pciP/fjd9lRfQ8PaX+K317mMjU5Z1f1kfcLC9z2JrK+CNpw5fHvybGWk+Nv8pv+PbT/153Cy/
  azdr5TX3By/r0Xmzh5z9RxLI1zzLcWufrE99VnPZMNpv6fV/G47wp17WNWOLou7MPJ5K9us04
  8ZjVnLF+Q5PJ/ZvadqSWqe/+V1D444SbCGntzS214k+G5u/JTX4To3WawO7Ln34K2CL2G5rPc
  cf+Tu86z1c5ovr1b6s7Hz+zMpYtk2ncqsRRnJBpqMRcVJwIAsJ5HDWkDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-11.tower-591.messagelabs.com!1666055304!279482!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 30549 invoked from network); 18 Oct 2022 01:08:25 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-11.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 18 Oct 2022 01:08:25 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id A9E981000CD
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Oct 2022 02:08:24 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 9D679100078
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Oct 2022 02:08:24 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 18 Oct 2022 02:08:23 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-filesystems] [PATCH] xfstests: upgrade 2022.09.25 -> 2022.10.09
Date: Tue, 18 Oct 2022 09:07:55 +0800
Message-ID: <1666055276-8042-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1666055276-8042-1-git-send-email-wangmy@fujitsu.com>
References: <1666055276-8042-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Oct 2022 01:08:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99215

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../xfstests/{xfstests_2022.09.25.bb => xfstests_2022.10.09.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-filesystems/recipes-utils/xfstests/{xfstests_2022.09.25.bb => xfstests_2022.10.09.bb} (97%)

diff --git a/meta-filesystems/recipes-utils/xfstests/xfstests_2022.09.25.bb b/meta-filesystems/recipes-utils/xfstests/xfstests_2022.10.09.bb
similarity index 97%
rename from meta-filesystems/recipes-utils/xfstests/xfstests_2022.09.25.bb
rename to meta-filesystems/recipes-utils/xfstests/xfstests_2022.10.09.bb
index 45a1578be7..4965d0586b 100644
--- a/meta-filesystems/recipes-utils/xfstests/xfstests_2022.09.25.bb
+++ b/meta-filesystems/recipes-utils/xfstests/xfstests_2022.10.09.bb
@@ -10,7 +10,7 @@ SRC_URI = "git://git.kernel.org/pub/scm/fs/xfs/xfstests-dev.git;branch=master;na
            file://0002-Drop-detached_mounts_propagation-and-remove-sys-moun.patch \
            "
 
-SRCREV_xfstests = "e5555e75ba199d153f4dfb81496a891263ec9bdd"
+SRCREV_xfstests = "3b5cb74c03312b5ac3349a0759c8d32bb9d0dada"
 SRCREV_unionmount = "e3825b16b46f4c4574a1a69909944c059835f914"
 
 S = "${WORKDIR}/git"
-- 
2.25.1


