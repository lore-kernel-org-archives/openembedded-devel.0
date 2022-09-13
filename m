Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2CDAC6FA89
	for <webhook@archiver.kernel.org>; Tue, 13 Sep 2022 10:19:28 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.3])
 by mx.groups.io with SMTP id smtpd.web09.3134.1663064367618595679
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Sep 2022 03:19:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=i6stSQN5;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.3,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1663064366; i=@fujitsu.com;
	bh=T1IrHhVMdSwym/bC3XVYPOOW7TnkspiJzMaekXy0eY8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=i6stSQN5eIoVMC2fcmdAbrbIzkJdoNTR07Ygjeq7rFEH65XpXFVUDg8+fCTNMHiBA
	 Dn/XGPzrM2jVnTugBqbtJ8NePYfp0u/0BuzR0Yuoe8UWl017qDKj9Itf9MsqdBE2Tb
	 YdM0qf4RVYD1o9iOteh7fAJc2L82YkXvlGzdBLaqzSU8bnVBEnyXMN3E3NIHJTm4XG
	 ufopcBJJ4MpKIxliDkgZNPuOvN0Q64fqokLPnrOvg7zwwvgGpMYnxgg8+A5MMwMDlr
	 wm9wpLMQqc5GgqivSJdnoHwygt0DVWZhEkkh2O3Z7rMTOreaZWLQXD5pB6LBuz8YCE
	 CRr6jMwQ0vRiA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrCIsWRWlGSWpSXmKPExsViZ8OxWVc3UiH
  ZoH+OpsXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmvH39SrmgrW8FW3L2pkaGP9wdzFycQgJPGCU
  OP3rDCOEc5lJYvX2lewQzh5GiTezbzF3MXJysAmoSUy/dYMVxBYR0JdYOnsPWJxZQEXixe8ed
  hBbWMBfYuOz9WwgNouAqsSu6/1MIDavgKPEtDl/wGwJAQWJKQ/fM0PEBSVOznzCAjFHQuLgix
  fMEDWKErMvN7NA2BUSjdMPQfWqSVw9t4l5AiP/LCTts5C0L2BkWsVonVSUmZ5RkpuYmaNraGC
  ga2hoqmtsqmtoYqmXWKWbqJdaqlueWlyia6SXWF6sl1pcrFdcmZuck6KXl1qyiREYmCnFylN3
  MJ5e9VPvEKMkB5OSKG+kl0KyEF9SfkplRmJxRnxRaU5q8SFGGQ4OJQne+BCgnGBRanpqRVpmD
  jBKYNISHDxKIrw8wUBp3uKCxNzizHSI1ClGRSlx3pneQAkBkERGaR5cGywyLzHKSgnzMjIwMA
  jxFKQW5WaWoMq/YhTnYFQS5pUIA5rCk5lXAjf9FdBiJqDFRtbyIItLEhFSUg1MSydJJ5sfSxV
  zf59se/Ldlwh19na5HZbFZxe8tl56UfPL6c8xC9+Ezrv1+p/dwUWpzpLFLzL+P/kYabznK6dL
  EY9G8oM2USEubfZpCnNSzT0rcsKfPrjHmM38X+aBpvfEz6IOOY4S6YJx1z4rBE9Kefhm8Wev8
  ohjxTHy7i/eaP/WCH13xVVKrswkbt/kpFoDzk8P/vvvLNSTO3rr1rt/k/3+mhtXquwIDW76Lr
  VN4Mpikecd4g96z9dOeXzw5qOda6+//TZrY6b8r60K9voRIjZurYrJksK7rqa7BLVeD0rsMY6
  vEbmr9qV1fpKg17L12z44yRzdqHizvEaIu2DxEtbzorf3FxvJf+zXP7pQiaU4I9FQi7moOBEA
  7ETGv0cDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-2.tower-548.messagelabs.com!1663064365!11367!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 8582 invoked from network); 13 Sep 2022 10:19:25 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-2.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 13 Sep 2022 10:19:25 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 5E40D7B
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Sep 2022 11:19:25 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121
 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 51A9F73
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Sep 2022 11:19:25 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 13 Sep 2022 11:19:23 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-flatbuffers: upgrade 2.0.7 ->
 2.0.8
Date: Tue, 13 Sep 2022 18:19:00 +0800
Message-ID: <1663064344-3276-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Tue, 13 Sep 2022 10:19:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98776

Changelog:
==========
- Fix for --keep-prefix the was generating the wrong include statements for C++
  The bug was introduced in 2.0.7.
- Added the Verifier::Options option struct to allow specifying runtime
  configuration settings for the verifier (#7489). This allows to skip verifying
  nested flatbuffers, a on-by-default change that was introduced in 2.0.7.
  This deprecates the existing Verifier constructor, which may be removed in a
  future version.
- Refactor of tests/test.cpp that lead to ~10% speedup in compilation of the
  entire project (#7487).

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-flatbuffers_2.0.7.bb => python3-flatbuffers_2.0.8.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/flatbuffers/{python3-flatbuffers_2.0.7.bb => python3-flatbuffers_2.0.8.bb} (89%)

diff --git a/meta-oe/recipes-devtools/flatbuffers/python3-flatbuffers_2.0.7.bb b/meta-oe/recipes-devtools/flatbuffers/python3-flatbuffers_2.0.8.bb
similarity index 89%
rename from meta-oe/recipes-devtools/flatbuffers/python3-flatbuffers_2.0.7.bb
rename to meta-oe/recipes-devtools/flatbuffers/python3-flatbuffers_2.0.8.bb
index 84c80444b7..5c9c6df3ba 100644
--- a/meta-oe/recipes-devtools/flatbuffers/python3-flatbuffers_2.0.7.bb
+++ b/meta-oe/recipes-devtools/flatbuffers/python3-flatbuffers_2.0.8.bb
@@ -5,7 +5,7 @@ LICENSE = "Apache-2.0"
 
 LIC_FILES_CHKSUM = "file://../LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRCREV = "8367664f15c3ea2ee58c67dacf9d630b49466de5"
+SRCREV = "06c5c7ed0bd987a918cf88caafb094f22cdd1721"
 SRC_URI = "git://github.com/google/flatbuffers.git;branch=master;protocol=https"
 S = "${WORKDIR}/git/python"
 
-- 
2.25.1


