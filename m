Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33DCDC27C55
	for <webhook@archiver.kernel.org>; Thu,  6 Jun 2024 09:07:00 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web11.9824.1717664814572761252
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 06 Jun 2024 02:06:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=LNRlpbYO;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1717664819; x=1749200819;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=7hz7bnZh4YzPb02qj0ELtVZaKBED2ACge3Hagh69NNM=;
  b=LNRlpbYO+GLiYqSTvtpyRTz4uaYPw+gLt0ZMV+SoZZGkhAdGAjNruaqv
   mzYL/5NdbRXF74XJHfFuS3qfl8fD7vjWL2KhYw2s/XXckb0SCNaovB2V0
   on0bvm92I19odNFrnS1bt26Y7a1Y9Lm1YDJUSODDdml/5/iEVa+PJYQWK
   4aYiUabXD9supaLqcVNdvNL7Hs63ySGE8yio8RuW9jyI0vu3BG6eONqRP
   2AVEiAKYtXL7qqP+seOccQOIM4MgoWJFwM20HXZ0bFcp8AC+IGmeydIC+
   /jYpSeMjmrFP4SAgZmn4v+zuWRLRi6oTBzwFepNPvzUJjShGmPS6nYHEw
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11094"; a="141612178"
X-IronPort-AV: E=Sophos;i="6.08,218,1712588400"; 
   d="scan'208";a="141612178"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2024 18:06:58 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 816EB370F6
	for <openembedded-devel@lists.openembedded.org>; Thu,  6 Jun 2024 18:06:55 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id C220AD3F18
	for <openembedded-devel@lists.openembedded.org>; Thu,  6 Jun 2024 18:06:54 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 4AB52401D8
	for <openembedded-devel@lists.openembedded.org>; Thu,  6 Jun 2024 18:06:54 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id ED3461A000A;
	Thu,  6 Jun 2024 17:06:53 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-perl] [PATCH 15/36] libcgi-perl: upgrade 4.60 -> 4.64
Date: Thu,  6 Jun 2024 17:06:14 +0800
Message-Id: <1717664795-13902-15-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1717664795-13902-1-git-send-email-wangmy@fujitsu.com>
References: <1717664795-13902-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28434.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28434.006
X-TMASE-Result: 10-1.806100-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/ySrLqyE6Ur/jSExHL6o3BeBQ0v5ooEIBcb6p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74AQhNjZQYyI3HZonBD1OvOD7Fo
	gUQ0vV9iw3kcq3o2mNIAy6p60ZV62yA7duzCw6dIBpRCTkRk5SfoLR4+zsDTtiN2nYwbbDKy3E9
	wfEvgeCIj3DLAKS+De1rbaXoQRh50Ly3uXv4dtfU/7dG86MLsLMo1hoPfQYUz7MzOFxzPWNZhg9
	PwaTlt4/9QEHPIJUQfyDBYNCJzj6s+YAJ5mo7zlOKgonZY9TFMtLgAQ4uO3AA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 06 Jun 2024 09:07:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110721

From: Wang Mingyu <wangmy@fujitsu.com>

Chaneglog:
===========
- pass --no-xattrs to tar in Makefile to fix tar backwards compat
- ->url returns a string in all cases
- ->url now returns the correct thing for ipv6 brackets
- Support Paritioned cookies in CGI::Cookie

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libcgi/{libcgi-perl_4.60.bb => libcgi-perl_4.64.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-perl/recipes-perl/libcgi/{libcgi-perl_4.60.bb => libcgi-perl_4.64.bb} (93%)

diff --git a/meta-perl/recipes-perl/libcgi/libcgi-perl_4.60.bb b/meta-perl/recipes-perl/libcgi/libcgi-perl_4.64.bb
similarity index 93%
rename from meta-perl/recipes-perl/libcgi/libcgi-perl_4.60.bb
rename to meta-perl/recipes-perl/libcgi/libcgi-perl_4.64.bb
index 7e330c370..7b67cd862 100644
--- a/meta-perl/recipes-perl/libcgi/libcgi-perl_4.60.bb
+++ b/meta-perl/recipes-perl/libcgi/libcgi-perl_4.64.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=415fc49abed2728f9480cd32c8d67beb"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/L/LE/LEEJO/CGI-${PV}.tar.gz"
 
-SRC_URI[sha256sum] = "c2f6330bcc7cacda0c905f57ca0d31da1b19a2e4e5babede648c49b13803ee11"
+SRC_URI[sha256sum] = "39bd8e40ce00cdab39e0a2bc71abd2bbe451d1d97bc7e54e41a2e199eb6226e7"
 
 S = "${WORKDIR}/CGI-${PV}"
 
-- 
2.34.1


