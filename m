Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B195ACCA47F
	for <webhook@archiver.kernel.org>; Mon,  6 Jun 2022 12:23:24 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web12.31189.1654518196131836242
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Jun 2022 05:23:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=UE+ZkAcI;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1654518194; i=@fujitsu.com;
	bh=OyijSBcwIbijnmRNKm6OYYEA9koLuUBkVmiCBMujvLU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=UE+ZkAcI2dWyGWHck+RtQ6buaOqjVhdK9ecxJsJ6YHSv1e3rhMLuHabV+NS1K29Qo
	 K7HWG4b/wjVt5qSbwzMZixJYfmsEL+IBHpA/IW2SKpDVYodIcfLCJ+Bpm0mjRGjKQZ
	 GdICTUWQTFMHByKFkP5PfM9z/K3hqCPfiFjtuZALkXqrAXbx8mtOUSOrld8TUakQjs
	 ongc7nfmV3TeK2Wl5VeJsSf9ldyFIFbUKLShj9pdKF1j+Nm4CdmE2SRGmUzp3ybJSi
	 Hcsx2VBL8hIhkNIh1B+bmXSrqwcKqdzaZyLA6za7FJokj3S1JfNNEPK3curg0Edhnr
	 W6EojTcMvUvSg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrNIsWRWlGSWpSXmKPExsViZ8MxSXfTx7l
  JBu2LZCwuHl7K7MDocW7jCsYAxijWzLyk/IoE1ox9v+cxF/xhq5g+J6uBcSNbFyMXh5DAE0aJ
  DdevQDkXmCSOzzzMDuHsZpS4e+89cxcjJwebgJrE9Fs3WEFsEQF9iaWz94DFmQVUJF787mEHs
  YUFXCVOdh4Ci7MAxRdumMgGYvMKOEq0nf/DCGJLCChITHkIMZNTwEli3/qPTCC2EFDNqQnLGS
  HqBSVOznzCAjFfQuLgixfMEL2KErMvN7NA2BUSM2ZsY4Ow1SSuntvEPIFRcBaS9llI2hcwMq1
  itE4qykzPKMlNzMzRNTQw0DU0NNU1tgBShnqJVbqJeqmluuWpxSW6RnqJ5cV6qcXFesWVuck5
  KXp5qSWbGIFhnFKslr+D8e/Kn3qHGCU5mJREee2vzU0S4kvKT6nMSCzOiC8qzUktPsQow8GhJ
  MFb9wEoJ1iUmp5akZaZA4wpmLQEB4+SCK/1O6A0b3FBYm5xZjpE6hSjopQ47633QAkBkERGaR
  5cGyyOLzHKSgnzMjIwMAjxFKQW5WaWoMq/YhTnYFQS5l0Msp0nM68EbvoroMVMQIt9HswBWVy
  SiJCSamCqDc3Yzj134+S9f2VLP1zfEu+7bkI24wwlRvb/apERtl/ZW+ZWeO36WNHk9P9clOLj
  5hqnKTdOTb26kmPrBb5Kr62Ry0VYExZeZr90yPyp2kaeT42XHuSoStpxLLLyeLY0zy7HRHZbT
  aLbxcR1gbJnWKr4Vd7P2dY418O9zvvC6eLZMmfWqT6JOfHk7bK9BwR3T7+QdmLGXcaehluR9+
  +d2Vu0/Sj3pGd3/4uxS/y7W3Ts1/SDluzZkzd8Zf54OOygjdwf22Bt56PyB8xOXdtX8XQPQ2l
  C6J22ZK/wF/eqX26Z8uKMowZD5r4QlcDrrOLfAltr27LufQw/0n/3h9Wl5Y7PHH1CpGOEzJjr
  T6UdVWIpzkg01GIuKk4EAIuLvCJeAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-11.tower-548.messagelabs.com!1654518194!22032!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 14237 invoked from network); 6 Jun 2022 12:23:14 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-11.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 6 Jun 2022 12:23:14 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id D3B641009B2
	for <openembedded-devel@lists.openembedded.org>;
 Mon,  6 Jun 2022 13:23:13 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id A02231009C6
	for <openembedded-devel@lists.openembedded.org>;
 Mon,  6 Jun 2022 13:23:13 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 6 Jun 2022 13:23:06 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] tgt: upgrade 1.0.82 -> 1.0.83
Date: Mon, 6 Jun 2022 20:22:43 +0800
Message-ID: <1654518164-9091-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1654518164-9091-1-git-send-email-wangmy@fujitsu.com>
References: <1654518164-9091-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Jun 2022 12:23:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97426

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-networking/recipes-extended/tgt/tgt_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-networking/recipes-extended/tgt/tgt_git.bb b/meta-networking/recipes-extended/tgt/tgt_git.bb
index ada0fd174..c74ebb2a6 100644
--- a/meta-networking/recipes-extended/tgt/tgt_git.bb
+++ b/meta-networking/recipes-extended/tgt/tgt_git.bb
@@ -4,8 +4,8 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://scripts/tgtd.spec;beginline=7;endline=7;md5=21c19ea7dad04648b9c2f791b6e29b4c"
 DEPENDS = "sg3-utils libaio"
 
-SRCREV = "fd4ca0546aa20fa9627c41ca2028db26e11f8d56"
-PV = "1.0.82"
+SRCREV = "a6bd1f0578bf85788a1563cbfb42a75e500d5318"
+PV = "1.0.83"
 
 SRC_URI = "git://github.com/fujita/tgt.git;branch=master;protocol=https \
 	file://0001-Correct-the-path-of-header-files-check-in-Yocto-buil.patch \
-- 
2.25.1


