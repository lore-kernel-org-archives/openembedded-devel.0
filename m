Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C381C433F5
	for <webhook@archiver.kernel.org>; Tue,  8 Feb 2022 00:25:53 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.66])
 by mx.groups.io with SMTP id smtpd.web12.4739.1644279951724290803
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Feb 2022 16:25:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Cw5DGCqE;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.66,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1644279949; i=@fujitsu.com;
	bh=7SXCi9w0Jn1B8Mx0MUdsU74OrlLXsRMwRAZ5YoDynyE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=Cw5DGCqExKpsTj3UUrYk5pg8fRDW66S2FwF1BxAkBHhWuVWyFYJneHFiKGZphuSHZ
	 G4QWYzFA7I54BoXpN/KWbMgl3JTWj0uDng/rUMEhqv1sx9LyU97EEhWB2xl5qdcuHT
	 D9+KCx7InelA0me4K2yOpoSXyMryjJZd5FWfgnouAA1/mZI3oAhOBYTAbkga3P9YLa
	 6J+nG/38bSUKBPBuxJcL7dEp1PbDb3Ose0f7qrwDjLHHCvM9d5KbcplXWmHysH+C8X
	 SKTRW0ynZyipCQ2PnLMpqpsEbZptfUcrktMPfxv8yc/RUhumwc88mAqsRqdblz8ctz
	 mpOjtjONBopww==
Received: from [100.115.2.253] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-a.eu-west-1.aws.ess.symcld.net id F4/D9-12986-C88B1026;
 Tue, 08 Feb 2022 00:25:48 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrLIsWRWlGSWpSXmKPExsViZ8MxSbdnB2O
  SwYqlPBYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8a85oNsBYeFK74/W8zSwPhDoIuRi0NI4Amj
  xOtdO1ghnAtMEpcaOqCc44wSz3+3MXYxcnKwCahJTL91gxXEFhHQl1g6ew8ziM0soCLx4ncPO
  4gtLOAtMWlvHxuIzQIU/3XhHQuIzSvgKLFqwTqwXgkBBYkpD9+D9XIKOEks/noELC4EVLO39S
  AzRL2gxMmZT1gg5ktIHHzxghmiV1Fi9uVmFgi7QmLWrDYmCFtN4uq5TcwTGAVnIWmfhaR9ASP
  TKkarpKLM9IyS3MTMHF1DAwNdQ0NTXUNdI0NzvcQq3US91FLd8tTiEl1DvcTyYr3U4mK94src
  5JwUvbzUkk2MwDBOKWa8uYOxte+n3iFGSQ4mJVHezHTGJCG+pPyUyozE4oz4otKc1OJDjDIcH
  EoSvGe3A+UEi1LTUyvSMnOAMQWTluDgURLh1QZJ8xYXJOYWZ6ZDpE4xGnOsOjB9FTNH86Tl25
  mFWPLy81KlxHlNQUoFQEozSvPgBsFi/RKjrJQwLyMDA4MQT0FqUW5mCar8K0ZxDkYlYd4GkCk
  8mXklcPteAZ3CBHTK10X/EoFOKUlESEk1MM33nTtl47N+TiWV1DVTF/JonEmf9nfFDqWSg7pn
  Nnz4GtSn5Xhin1uWo+bhPVX1T3dan3fJf/DlT+O1C+sMfeMu12/7e8CU//n/etNJuo+s9jFd5
  Ju+ca50bPiGxYe+/7l/3K9EncX5tLi2nP9ShTTmCcr3uE7Yd5p8sZrwn4lj4dQrLXzrKvYuba
  0wVmq7erDqf8xSb3P2xsdVAYu/dq67u3xShiPP2W/y28V8DgV+cVBLmCTx6cebSYcu77Y7wLn
  zftSKb3JLbhg+8St5tGizVdv8kCP7C7c/2KTc9lfrhvIl1897HNafk50SrKr770EaJ1O1y6z1
  VUW9Yl9Tw7/ET9Jn7L62UW2hWW/5s8lLlFiKMxINtZiLihMBc0V7hXADAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-4.tower-587.messagelabs.com!1644279947!45134!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 15552 invoked from network); 8 Feb 2022 00:25:48 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-4.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 8 Feb 2022 00:25:48 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id BF483100446
	for <openembedded-devel@lists.openembedded.org>;
 Tue,  8 Feb 2022 00:25:47 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id B1B471000FF
	for <openembedded-devel@lists.openembedded.org>;
 Tue,  8 Feb 2022 00:25:47 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Tue, 8 Feb 2022 00:25:26 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] opensaf: upgrade 5.21.09 -> 5.22.01
Date: Tue, 8 Feb 2022 08:25:07 +0800
Message-ID: <1644279908-4266-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1644279908-4266-1-git-send-email-wangmy@fujitsu.com>
References: <1644279908-4266-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 08 Feb 2022 00:25:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95254

Changelog:
=========
* log: removal of letter 'C'/'R' from msgId in RFC5424 format [#3303]
* log: Stop all threads while releasing the log agent object [#3302]
* amf: Correct HC period to make it effect immediately[#3298]
* log: Correct condition to shutdown the log agent [#3301]
* log: Increase timeout in logtest [#3291]
* log: Shutdown log agent when not in use [#3291]
* log: Introduce the initial clm node status [#3291]
* amf: Correct the version of csi attribute message [#3296]
* ntf: correct the behavior of periodic check log pending [#3297]
* mds: Resolve active MxN VDEST conflict in split brain [#3281]
* smf: correct merge bundle rolling to single step [#3290]
* ntf: get attribute value from local when value not existed [#3289]
* immd: fix cannot find candidate for new immnd coordinator [#3284]
* smf: make more robustness in BISU upgrade [#3286]
* amfd: Tightens sync window condition to proceed headless restoration [#3271]
* osaf: fixed redefinition of typedef 'SaConstStringT' [#3287]
* amf: update runtime attributes of node to IMM in sync [#3285]
* amfd: Correct checking CSICOMP while deleting CSI [#3282]
* base: using mutex for test case sysf_ipc_test instead of atomic [#3283]
* build: adaptive python version for rpm build [#3270]

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../opensaf/{opensaf_5.21.09.bb => opensaf_5.22.01.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-daemons/opensaf/{opensaf_5.21.09.bb => opensaf_5.22.01.bb} (98%)

diff --git a/meta-networking/recipes-daemons/opensaf/opensaf_5.21.09.bb b/meta-networking/recipes-daemons/opensaf/opensaf_5.22.01.bb
similarity index 98%
rename from meta-networking/recipes-daemons/opensaf/opensaf_5.21.09.bb
rename to meta-networking/recipes-daemons/opensaf/opensaf_5.22.01.bb
index c24fccf04b..b4ee3ed4bd 100644
--- a/meta-networking/recipes-daemons/opensaf/opensaf_5.21.09.bb
+++ b/meta-networking/recipes-daemons/opensaf/opensaf_5.22.01.bb
@@ -29,7 +29,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/releases/${BPN}-${PV}.tar.gz \
            file://0001-Fix-build-with-fno-common.patch \
            file://0001-Use-correct-printf-format-for-__fsblkcnt_t.patch \
            "
-SRC_URI[sha256sum] = "227ae1dafb6d51ce6561c9fcaec60087a0183839a8a4da11517e09f2a662b53d"
+SRC_URI[sha256sum] = "f008d53c83087ce2014c6089bc4ef08e14c1b4091298b943f4ceade1aa6bf61e"
 
 UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/opensaf/files/releases"
 
-- 
2.25.1


