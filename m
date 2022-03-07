Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D983C43217
	for <webhook@archiver.kernel.org>; Mon,  7 Mar 2022 11:49:27 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web09.25479.1646653764538662584
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Mar 2022 03:49:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=EjvARHvx;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1646653763; i=@fujitsu.com;
	bh=DRMgL4bAGCDSsIu92If0NMp0gHcMCfF6fWZJTAHLQe0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=EjvARHvxJj1/D8jTxoOgXkCSAXbiU9Oq4jISZBJ8eFWHl3+uyW0Z5Ile9FuUKcye1
	 1MrWDcNuMUtOEgqESxBfK3UrvO5XI3qwqs1lMqIHuAGbJGBFLYPP2xFGhDlayC7beF
	 WyEQJE+CIpx5G7GgTYFWamSPVNRcY2yTFBHqMJjez3IYbvqW0DF51tcMYQU1sF8oyt
	 8eFt3zJOKzEKBjPVodqPmMTLx3eaEzvltGEbmW+Ctq92bIHSprbEFETHoV0z0cLWNM
	 fDamGQC2qn5jBetRoImzjtDeFqBKTnnDrh/78hDZFiNOgP4NcewtAH1BJ9MkoTA8Ii
	 kZuzX6h8Fhamg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrDIsWRWlGSWpSXmKPExsViZ8MRouv0UTX
  J4O1JDYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePc70nMBa08FWfan7M0ML7n6mLk4hASmMEk
  cfjDM6YuRk4g5zijxOq34iA2m4CaxPRbN1hBbBEBfYmls/cwg9jMAioSL373sIPYwgJeEr3Lv
  wD1cnCwAMVvLTYFCfMKOEnMvNUEVi4hoCAx5eF7MJtTwFli6qVuFohVThK9B5tYIeoFJU7OfM
  ICMV5C4uCLF1C9ihKzLzezQNgVErNmtTFNYOSfhaRlFpKWBYxMqxitkooy0zNKchMzc3QNDQx
  0DQ1NdY2Ndc1N9BKrdBP1Ukt1y1OLS3SN9BLLi/VSi4v1iitzk3NS9PJSSzYxAgMypVjRawfj
  qxU/9Q4xSnIwKYnypixQTRLiS8pPqcxILM6ILyrNSS0+xCjDwaEkwfvpDVBOsCg1PbUiLTMHG
  B0waQkOHiUR3uOXgNK8xQWJucWZ6RCpU4y6HJcOXdnLLMSSl5+XKiXOy/kBqEgApCijNA9uBC
  xSLzHKSgnzMjIwMAjxFKQW5WaWoMq/YhTnYFQS5pUGmcKTmVcCt+kV0BFMQEdU2SqBHFGSiJC
  SamCKSbX9cvfG15tZ2z9n+H5al25WY/+h7dEJoQLf+4mH/z3kq3OoWlO2yyhJTEXGqk+h/Hm9
  d+Xu5Rpuc50+3t9Z6LnScM7qtOorszY97un+YbVp+fQNZxs+T9literG1U8Bq4wunJH2tV51O
  //YX4fLrR9uRubtOqLdVyP5a+vGUrctr1zenE0MePNYQX2f9cnkZd/6t8osutbi/IdDIOPG/A
  Olmva84ocnMUkcn5a8msPl4MdwS82d9T2KF+5xT/a5ffrkJ8u5LU5S2fMN27qFbf7svxHqrpb
  3b8kLud1rL4gcfuPiejjjiMtR28kNHzOYlFfPELpiNXeb7duZt5R+nzrqvPDA1x0V8pYLxW3e
  2SixFGckGmoxFxUnAgD3S8TiTwMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-11.tower-548.messagelabs.com!1646653762!125457!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 6571 invoked from network); 7 Mar 2022 11:49:22 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-11.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 7 Mar 2022 11:49:22 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 227BnF5g004738
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Mon, 7 Mar 2022 11:49:22 GMT
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Mon, 7 Mar 2022 11:49:19 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-tqdm: upgrade 4.62.3 -> 4.63.0
Date: Mon, 7 Mar 2022 19:49:02 +0800
Message-ID: <1646653744-55920-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1646653744-55920-1-git-send-email-wangmy@fujitsu.com>
References: <1646653744-55920-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Mar 2022 11:49:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95843

Changelog:
==========
-add __reversed__()
-add efficient __contains__()
-improve CLI startup time (replace pkg_resources => importlib)
-tqdm.autonotebook warning & std fallback on missing ipywidgets (#1218 <- #1082, #1217)
-warn on positional CLI arguments
-misc build/test framework updates
 enable py3.10 tests
 add conda dependencies
 update pre-commit hooks
 fix pytest config (nbval, asyncio)
 fix dependencies & tests
 fix site deployment

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-tqdm_4.62.3.bb => python3-tqdm_4.63.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-tqdm_4.62.3.bb => python3-tqdm_4.63.0.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-tqdm_4.62.3.bb b/meta-python/recipes-devtools/python/python3-tqdm_4.63.0.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-tqdm_4.62.3.bb
rename to meta-python/recipes-devtools/python/python3-tqdm_4.63.0.bb
index 148431d0a..cd5f1aab5 100644
--- a/meta-python/recipes-devtools/python/python3-tqdm_4.62.3.bb
+++ b/meta-python/recipes-devtools/python/python3-tqdm_4.63.0.bb
@@ -5,7 +5,7 @@ SECTION = "devel/python"
 LICENSE = "MIT & MPL-2.0"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=1672e2674934fd93a31c09cf17f34100"
 
-SRC_URI[sha256sum] = "d359de7217506c9851b7869f3708d8ee53ed70a1b8edbba4dbcb47442592920d"
+SRC_URI[sha256sum] = "1d9835ede8e394bb8c9dcbffbca02d717217113adc679236873eeaac5bc0b3cd"
 
 inherit pypi setuptools3
 
-- 
2.25.1


