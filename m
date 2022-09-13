Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4A45C6FA82
	for <webhook@archiver.kernel.org>; Tue, 13 Sep 2022 10:19:48 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.1])
 by mx.groups.io with SMTP id smtpd.web10.3070.1663064379985405900
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Sep 2022 03:19:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=qDVvV+g5;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.1,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1663064378; i=@fujitsu.com;
	bh=CI35VSO+HsEBb5xtP4F3VN09PIZfxDbULhD7knpuW+4=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=qDVvV+g5oydqE2Ro5ll44uA29dXLLXzcHzphisUhb2VDI8KcLAe5wJifQBlVbOnVd
	 WPRH/tL7bmAgAzZu9wXHW+KHH8uGUQ/CZIk26EM4Yq4+X7sCfrn2ZJMevM2Ya6RNfn
	 cxecm3NHHAt9uHA1XxBL7Iq1AcQp1s3WrNTVe/36A74aiU3zEd2YVV0W4x7hTu/+wn
	 VvIt6miawiPigUEivcQFfIEgwE5RLRyFlHBXj9yFqFDSovHXm9KK7ST+/uhg6a9dxB
	 BXAoh2mnODH6k5hiQv6yeZ+IVkkitEGwh5a456cPhPfxpWjR7Mfv5Lmh250+ZNcen8
	 TOfdrjPW/i7mg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrMIsWRWlGSWpSXmKPExsViZ8ORqGsZqZB
  sMP2qnsXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmvF97jv2gnmcFWfXPmBqYNzG0cXIxSEk8IRR
  4tGxJhYI5zqTxI1jU1ghnAOMEte+fgVyODnYBHQlXvxYzAJiiwjoSyydvYcZxBYWcJLYd2AdW
  JxFQFWiZcclxi5GDg5eAXeJ77vdQMISAgoSUx6+ByvnFRCUODnzCVg5s4CExMEXL5hByiUEFC
  VmT5eHKK+QaJx+iAnCVpO4em4T8wRGvllIumch6V7AyLSK0SqpKDM9oyQ3MTNH19DAQNfQ0FT
  XQNfI0FQvsUo3US+1VLc8tbhE11AvsbxYL7W4WK+4Mjc5J0UvL7VkEyMw9FKKGa7vYJzY91Pv
  EKMkB5OSKG+kl0KyEF9SfkplRmJxRnxRaU5q8SFGGQ4OJQne+BCgnGBRanpqRVpmDjAOYNISH
  DxKIrw8wUBp3uKCxNzizHSI1ClGe461DQf2MnNMnf1vPzPHcjA582vbAWYhlrz8vFQpcd6Z3k
  BtAiBtGaV5cENhcXuJUVZKmJeRgYFBiKcgtSg3swRV/hWjOAejkjCvRBjQFJ7MvBK43a+AzmI
  COsvIWh7krJJEhJRUA1PuRM41jVLTFqqsW3pTNaCzVC/WOPbJ6p26G1M7lkwNi3n0NvHTQeFW
  rqXWIj7ajxiVPyydcC3ips7VDrPNoR+ar6asirv3LP5vy1k9BWOB3GjhAxneK54w118VVWw6d
  uPii/P8xSdy1Pm0P01POfln/ZteZZXMgyrv2de7HNhhY5RlJN+nYbnwGJ+pn5jxJ8mwNdemn5
  l+cF8+898ZUXk/FTLnuMbWhDl2Fi88+WmppsG89fVnvjrMU/Vf9GTb1daeJCWN/a9lK2Oynxx
  kmXfx3z7nHvFvM2WO75zxZp/Cvr6f3/9c2Br6cNPUYFm2g6/j58jd23Lhb/nZqSay3K9PT7Y8
  fuOAkf+FpDCnY9VmSizFGYmGWsxFxYkAvMP+hlYDAAA=
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-6.tower-591.messagelabs.com!1663064377!15667!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 17916 invoked from network); 13 Sep 2022 10:19:37 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-6.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 13 Sep 2022 10:19:37 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 6083F10018D
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Sep 2022 11:19:37 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121
 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 54A12100043
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Sep 2022 11:19:37 +0100 (BST)
Received: from CentOS7.g08.fujitsu.local (10.167.225.35) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 13 Sep 2022 11:19:35 +0100
From: zhengrq.fnst <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] xorgxrdp: upgrade 0.2.18 -> 0.9.19
Date: Tue, 13 Sep 2022 18:19:29 +0800
Message-ID: <1663064369-5394-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 Sep 2022 10:19:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98778

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../xorg-xrdp/{xorgxrdp_0.2.18.bb => xorgxrdp_0.9.19.bb}    | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-support/xorg-xrdp/{xorgxrdp_0.2.18.bb => xorgxrdp_0.9.19.bb} (71%)

diff --git a/meta-oe/recipes-support/xorg-xrdp/xorgxrdp_0.2.18.bb b/meta-oe/recipes-support/xorg-xrdp/xorgxrdp_0.9.19.bb
similarity index 71%
rename from meta-oe/recipes-support/xorg-xrdp/xorgxrdp_0.2.18.bb
rename to meta-oe/recipes-support/xorg-xrdp/xorgxrdp_0.9.19.bb
index eadf8c1b0b..9650d43695 100644
--- a/meta-oe/recipes-support/xorg-xrdp/xorgxrdp_0.2.18.bb
+++ b/meta-oe/recipes-support/xorg-xrdp/xorgxrdp_0.9.19.bb
@@ -10,11 +10,11 @@ DEPENDS = "virtual/libx11 xserver-xorg xrdp nasm-native"
 inherit features_check
 REQUIRED_DISTRO_FEATURES = "x11 pam"
 
-SRC_URI = "git://github.com/neutrinolabs/xorgxrdp.git;branch=devel;protocol=https"
+SRC_URI = "git://github.com/neutrinolabs/xorgxrdp.git;branch=v0.9;protocol=https"
 
-SRCREV = "752b7659773a11ca6d4600645547c06fdb8a23d9"
+SRCREV = "d463bad9639c910fadc2f30dac473c7688b11cfc"
 
-PV = "0.2.18"
+PV = "0.9.19"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


