Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40A1CC64ED6
	for <webhook@archiver.kernel.org>; Mon, 27 Feb 2023 08:10:11 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web11.85513.1677485407688888247
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Feb 2023 00:10:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=R7f5CxD4;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1677485406; i=@fujitsu.com;
	bh=NHHvlxRi8VE6EZ7MK/p6BHiV6Gx87b4ZGAMNlF2pj7M=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=R7f5CxD4fY0cj8+ijOIvZV8StUgvoPJD2uTHl6f+10F+yCIHO3jU0mImCHQot2LZs
	 UYXSB/SRbrFopplYXDgQHVPBt/u8CjXmF2em2EXpq+EfGitZfE7jDQ380Jtegu0bmE
	 mXz/a7aSZ8D0iCeuttiwegFu6FTqP9AcylGUTBvJ0q8hzJgh7ZXe+pFFbeFTfzMdo1
	 tuyMUOBUgEi1AV28yGp6/+8tE0sOI+m0upd9PrKp9cj54Cc230JzGereCHWzPfjydV
	 +pr3X9Wt4M/+FVZ/Q1mXfvJg/uKOgcg4ujc2woKlZIISNhKVGqM1+vn799XnRoMK8t
	 zMMbyOm7C4nZQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrMIsWRWlGSWpSXmKPExsViZ8MxSTc69U+
  ywe3VhhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8acw5sYC/p5K27PmsHSwHiXu4uRi0NI4Amj
  xJrnRxghnBtMErt2zGeGcPYySvy/fRgow8nBJiAlceP+fzYQW0RAX2Lp7D3MIDazgIrEi9897
  CC2sICvxJ077UwgNouAqsTt+RNYQGxeASeJ24tfg9VICChITHn4HqyXU8BZ4s3iaawgthBQTc
  v9ZnaIekGJkzOfsEDMl5A4+OIFM0SvosTsy80sEHalROuHX1C2msTVc5uYJzAKzkLSPgtJ+wJ
  GplWMZsWpRWWpRbqGhnpJRZnpGSW5iZk5eolVuol6qaW65anFJbpGeonlxXqpxcV6xZW5yTkp
  enmpJZsYgeGbUqzssYPxad9fvUOMkhxMSqK8i5z+JAvxJeWnVGYkFmfEF5XmpBYfYpTh4FCS4
  D2YBJQTLEpNT61Iy8wBxhJMWoKDR0mEl9kIKM1bXJCYW5yZDpE6xajL8eHQlb3MQix5+XmpUu
  K8fIlARQIgRRmleXAjYHF9iVFWSpiXkYGBQYinILUoN7MEVf4VozgHo5Iwb1QC0BSezLwSuE2
  vgI5gAjpi+8MfIEeUJCKkpBqYlj5kue2m+jbJ600W66KO9qKTQpWZuSEXXC8bLM65Fxu6i72O
  b71/y9ZWF44Hv/zlr3Eaf4m0atsnVL84hcV9dUl+3fwD8nl31hj3PQ9LKF4q/3IF+7TKjHM7u
  ybG3EjOcA94WaKiYuNuaL5BdWGD2QrfDNvalSFbpglUPVl8sU+HvfmsiFtloLaUxDo5021qyi
  ffFLbpqqh8VzZr/XXifnu93Grm9ss2TsJXj6hOXRv3KvKnnlnVimOxSkZqslOdRMNs78etEc8
  JNfgUtosrfcJp96v9FpsvHjx12rvsUdr3g1+O3OIuiz304cOp30rT5dKCfCQcOfvmTq9f1rem
  1y9izi6f3Umbkw9cWa7EUpyRaKjFXFScCAALRRk0ZgMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-10.tower-571.messagelabs.com!1677485403!302433!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.103.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 13692 invoked from network); 27 Feb 2023 08:10:03 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-10.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 27 Feb 2023 08:10:03 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 7DC741000D7
	for <openembedded-devel@lists.openembedded.org>; Mon, 27 Feb 2023 08:10:03 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 71AAE1000D5
	for <openembedded-devel@lists.openembedded.org>; Mon, 27 Feb 2023 08:10:03 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 27 Feb 2023 08:10:01 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-pykickstart: upgrade 3.43 -> 3.44
Date: Mon, 27 Feb 2023 16:09:41 +0800
Message-ID: <1677485381-11595-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1677485381-11595-1-git-send-email-wangmy@fujitsu.com>
References: <1677485381-11595-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Feb 2023 08:10:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101282

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
 Remove the auth and authconfig commands
 The parse method is expected to return a value
 tests: unittest isn't used in handle_unicode anymore
 Add RHEL 9 handler
 Resolves: rhbz#1966730
 Add RHEL 9 version for commands that had a RHEL version in the past
 Add RHEL 9 version for BTRFS related commands

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-pykickstart_3.43.bb => python3-pykickstart_3.44.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-extended/python-pykickstart/{python3-pykickstart_3.43.bb => python3-pykickstart_3.44.bb} (94%)

diff --git a/meta-python/recipes-extended/python-pykickstart/python3-pykickstart_3.43.bb b/meta-python/recipes-extended/python-pykickstart/python3-pykickstart_3.44.bb
similarity index 94%
rename from meta-python/recipes-extended/python-pykickstart/python3-pykickstart_3.43.bb
rename to meta-python/recipes-extended/python-pykickstart/python3-pykickstart_3.44.bb
index 6f2edf224..632662c28 100644
--- a/meta-python/recipes-extended/python-pykickstart/python3-pykickstart_3.43.bb
+++ b/meta-python/recipes-extended/python-pykickstart/python3-pykickstart_3.44.bb
@@ -18,7 +18,7 @@ SRC_URI = "git://github.com/rhinstaller/pykickstart.git;protocol=https;branch=ma
            file://0003-comment-out-sections-shutdown-and-environment-in-gen.patch \
            file://0004-load.py-retry-to-invoke-request-with-timeout.patch \
            "
-SRCREV = "6d488a0120f4da40aa0b04e29f37d7bb3297247f"
+SRCREV = "6f29ffdb6ed8330ddd21c026576d9fb23dd31c0f"
 
 UPSTREAM_CHECK_GITTAGREGEX = "r(?P<pver>\d+(\.\d+)+(-\d+)*)"
 
-- 
2.34.1


