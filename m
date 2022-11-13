Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E91CC43217
	for <webhook@archiver.kernel.org>; Sun, 13 Nov 2022 03:18:06 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.1])
 by mx.groups.io with SMTP id smtpd.web08.322.1668309478542024803
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 12 Nov 2022 19:17:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=kVlIZfov;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1668309476; i=@fujitsu.com;
	bh=syQN6HHaSlNqobX2vFFLfX4mF7a9Xn4Pjj2ipbEJEFw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=kVlIZfov4m0qU3tAa/hmfk5yfu5bWWRruFkMb11jbJtDZb4TO7FreFjn3lfVL88uR
	 +GHz2K32HsqRfQZujYgKlL3kH4D1uX8Kr3yoI358CQ/vCv3BC+Bho1VVd/bgfvSxOg
	 /DTNg78lS4u1aF3AMM1sIDLItqUQLUS9ED2Rxt/y/lkKTZSB+NkY9d7wKPEZ1Q/ycl
	 kXA2dSNBooZakceWdHyoa6wGQYSCkNAFEFG2sX++PrtxrlqcoPj9qzQQQ1qyigsnbb
	 n0cxpLaSn0mtZZUb1jn1WxkcySJRK/bJV7t10BgL2UV4Y5pht37wg0rSSiWyMLhJZX
	 lYaQN/L9WrQpQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrPIsWRWlGSWpSXmKPExsViZ8MxSfdxYkG
  ywc/PnBYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8aTazkF57gq5m09wNLA+ICzi5GTQ0jgCaPE
  r1MWXYxcQPZ1JomGLb+ZIBJ7GCVufjcFsdkEpCRu3P/PBmKLCOhLLJ29hxnEZhZQkXjxu4cdx
  BYW8JPY8X0nSxcjBweLgKrE5FZHkDCvgJPExkd3wEZKCChITHn4HqyVU8BZ4s2RKawQq5wk+l
  /8Y4aoF5Q4OfMJC8R4CYmDL14wQ/QqSsy+3MwCYVdIzJrVBjVTTeLquU3MExgFZyFpn4WkfQE
  j0ypGs+LUorLUIl1DC72kosz0jJLcxMwcvcQq3US91FLd8tTiEl1DvcTyYr3U4mK94src5JwU
  vbzUkk2MwLBNKWZ5sINxx7I/eocYJTmYlER5067nJwvxJeWnVGYkFmfEF5XmpBYfYpTh4FCS4
  P0dWZAsJFiUmp5akZaZA4whmLQEB4+SCG+FHVCat7ggMbc4Mx0idYpRl2Pm17YDzEIsefl5qV
  LivLMTgIoEQIoySvPgRsDi+RKjrJQwLyMDA4MQT0FqUW5mCar8K0ZxDkYlYd610UBTeDLzSuA
  2vQI6ggnoiO+ReSBHlCQipKQamAq3KreGXt54O8aeIXN6/3KBpTdzIs6dSle7cEfZuZF/yZ/M
  c3Nu6DQtixBPe/Er79nK2r2yaReiu74zZs0pM2u8x7DVwuX660NfGld/UmANeuA+PW5DJosjl
  /bczS0r1/+08zzTWVS+60H2EePMhTpp8y78rYm8bpqt5Z7I5GD69diayX+Ozbq6LGm97TWLj3
  63lIySAt7Jh8gccTJxOZ3Aq1exLCi4+ai8wvfZC/Yt5BR927eF57vkUZn/eh0aUyY/n/Tx5eN
  T92sTmGK86jcyhByaNzUrsYr/5YRou739Or9LIxxcjqwQXCp2Lz5H/MHOyh+3Gb9LsZl5L2M0
  Kn91VSL7W6LVhh+/Nx5lLVZiKc5INNRiLipOBACtOU1jYgMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-3.tower-587.messagelabs.com!1668309474!151921!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.100.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 7702 invoked from network); 13 Nov 2022 03:17:55 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-3.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 13 Nov 2022 03:17:55 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id C3BC81000EE
	for <openembedded-devel@lists.openembedded.org>; Sun, 13 Nov 2022 03:17:54 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id B76391000E9
	for <openembedded-devel@lists.openembedded.org>; Sun, 13 Nov 2022 03:17:54 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Sun, 13 Nov 2022 03:17:53 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-frozenlist: upgrade 1.3.1 -> 1.3.3
Date: Sun, 13 Nov 2022 11:17:26 +0800
Message-ID: <1668309448-15438-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1668309448-15438-1-git-send-email-wangmy@fujitsu.com>
References: <1668309448-15438-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 13 Nov 2022 03:18:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99574

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
Fixed CI runs when creating a new release, where new towncrier versions
fail when the current version section is already present.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-frozenlist_1.3.1.bb => python3-frozenlist_1.3.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-frozenlist_1.3.1.bb => python3-frozenlist_1.3.3.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-frozenlist_1.3.1.bb b/meta-python/recipes-devtools/python/python3-frozenlist_1.3.3.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-frozenlist_1.3.1.bb
rename to meta-python/recipes-devtools/python/python3-frozenlist_1.3.3.bb
index b95a014f5..0cd23ab7a 100644
--- a/meta-python/recipes-devtools/python/python3-frozenlist_1.3.1.bb
+++ b/meta-python/recipes-devtools/python/python3-frozenlist_1.3.3.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/aio-libs/frozenlist"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=cf056e8e7a0a5477451af18b7b5aa98c"
 
-SRC_URI[sha256sum] = "3a735e4211a04ccfa3f4833547acdf5d2f863bfeb01cfd3edaffbc251f15cec8"
+SRC_URI[sha256sum] = "58bcc55721e8a90b88332d6cd441261ebb22342e238296bb330968952fbb3a6a"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.25.1


