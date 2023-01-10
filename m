Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41E39C46467
	for <webhook@archiver.kernel.org>; Tue, 10 Jan 2023 05:39:53 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web10.96876.1673329186321475171
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Jan 2023 21:39:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=HF7cA6r5;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1673329186; i=@fujitsu.com;
	bh=W53xddHbjlrAjbatnOunR6V0+bhoPGDfWK5C9jwFev4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=HF7cA6r5/4XITqgzpTcePb5D2qMZQLUF0Lyt/7bcqVKQnedghapT6doUWc44bIqYW
	 rhQo1zzdAL8xkTscpEur8rDrc9y9sHVxOV8tVJSFjjQnXUIUDlqzIPIgqN/hQ+1Vy5
	 pxO/W36EVLf81hceGuxUoroSKwKwaCoRLXcpUDUzXXvkDRC8oCBrhQIxbLBSH84rDv
	 wjo1tStlOSPrw08AletjLObygdO97NOZtEvVMSHtKIcZNPzsrGkFWbeEgrFS6tCzcX
	 BvacpTOj+UeK2sj5Qz0sC//xPtpKoMmn032alCQ9s6Jp6Xp1kZV2vLhsQf83PMnWtc
	 vla6fxNEhIDOg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrGIsWRWlGSWpSXmKPExsViZ8ORpKv4a0+
  yQfMCPYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNaP7zwqmgqUcFRu332JpYDzF3sXIxSEk8JBR
  4tebdkYI5wqTxP9PR5ggnL2MEvOu3GftYuTkYBOQkrhx/z8biC0ioC+xdPYeZhCbWUBF4sXvH
  nYQW1jATmLChkagGg4OFgFVietf6kHCvAKOEn09y8BaJQQUJKY8fA/WyingJLFkcy9YqxBQzZ
  vda9gh6gUlTs58wgIxXkLi4IsXzBC9ihKzLzezQNiVEq0ffkHZahJXz21insAoOAtJ+ywk7Qs
  YmVYxmhWnFpWlFukamuglFWWmZ5TkJmbm6CVW6SbqpZbqlqcWl+ga6SWWF+ulFhfrFVfmJuek
  6OWllmxiBAZvSrFK+w7GT8v+6B1ilORgUhLlLfq0J1mILyk/pTIjsTgjvqg0J7X4EKMMB4eSB
  K/OD6CcYFFqempFWmYOMJJg0hIcPEoivPOuA6V5iwsSc4sz0yFSpxgVpcR5l4L0CYAkMkrz4N
  pg0XuJUVZKmJeRgYFBiKcgtSg3swRV/hWjOAejkjCv9VegKTyZeSVw018BLWYCWvxj6k6QxSW
  JCCmpBqYuq99J4U+i1KXTzqfwdN+f171syyz72w9upCovPFEozbR0ncLemVWBVyRKOV2SNwW9
  V/c43Nn27hznLKMbTSGBRuGTbLR7767cw9O2sPL1zZSlD3SSS7rtzu9z6zs0d1HAsp+yHb3+t
  zgbFQI5gpdp1htPDDGb9T0t3sbNWmerhluW34UCz7nLTq4xmr/Z44H/ko6bOwpX39hQG3ptWS
  bHMRdvB4mjNbJ7DgUu6875vSfMdO+jo8tnndQMNXEzbXWS8PmmnbRRWul/jYrrFS7L22UHr7S
  Kbtkz74qaePZSwTcy2wM2xBZsXOamuP72DKnPRrmqKy+XvZL+2HKoY+fx7lUf5no6vL8u7tfd
  OluJpTgj0VCLuag4EQArPm2mWQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-9.tower-565.messagelabs.com!1673329185!340889!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 10205 invoked from network); 10 Jan 2023 05:39:45 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-9.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 10 Jan 2023 05:39:45 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 77C0E1AF
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Jan 2023 05:39:45 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 6C3E97B
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Jan 2023 05:39:45 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Tue, 10 Jan 2023 05:39:43 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] hwdata: upgrade 0.365 -> 0.366
Date: Tue, 10 Jan 2023 13:39:17 +0800
Message-ID: <1673329158-5189-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1673329158-5189-1-git-send-email-wangmy@fujitsu.com>
References: <1673329158-5189-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Jan 2023 05:39:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100502

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-support/hwdata/{hwdata_0.365.bb => hwdata_0.366.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/hwdata/{hwdata_0.365.bb => hwdata_0.366.bb} (91%)

diff --git a/meta-oe/recipes-support/hwdata/hwdata_0.365.bb b/meta-oe/recipes-support/hwdata/hwdata_0.366.bb
similarity index 91%
rename from meta-oe/recipes-support/hwdata/hwdata_0.365.bb
rename to meta-oe/recipes-support/hwdata/hwdata_0.366.bb
index d37b73af2..4cab9b0fb 100644
--- a/meta-oe/recipes-support/hwdata/hwdata_0.365.bb
+++ b/meta-oe/recipes-support/hwdata/hwdata_0.366.bb
@@ -5,7 +5,7 @@ SECTION = "System/Base"
 LICENSE = "GPL-2.0-or-later | XFree86-1.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1556547711e8246992b999edd9445a57"
 
-SRCREV = "803068db92b8bb249014f1c947b91b452f539f5f"
+SRCREV = "2fa514ff86da425726dea8629bcf4ceac9d8e7ff"
 SRC_URI = "git://github.com/vcrhonek/${BPN}.git;branch=master;protocol=https"
 
 S = "${WORKDIR}/git"
-- 
2.25.1


