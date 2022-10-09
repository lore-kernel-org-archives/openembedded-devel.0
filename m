Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1781AC4332F
	for <webhook@archiver.kernel.org>; Sun,  9 Oct 2022 00:37:36 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.65])
 by mx.groups.io with SMTP id smtpd.web10.9502.1665275846549887182
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 08 Oct 2022 17:37:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=FJvN+MPz;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.65,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1665275844; i=@fujitsu.com;
	bh=J7lOzJ65fXPmQcRmG3XFwombQYHvOVY4738Aq+oww2c=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=FJvN+MPzjRgKcp06FYGXIoDt4zzYXnZa4lHjM+T6W2YfHbaAVi/CrXsD7wXQVX0P9
	 ZEz5N4c5umO7M6VBrebcvcmJfK9AkQchpsEHcEOPzIGgQaaUieWVmhxQyN4JeDMuAH
	 yNOGnIiQinl+oQnMwqcerQaKM8zpVlJVlbe/0VIeDEOmkclk/mT1xphKzttuS2pe0n
	 ObXibOqviQiKpBlDSI6kWk1DMhi8HbK6RKc9Fy0+Au9Xa6lQACTtlDSWx7Z5VEpRkN
	 rR3D/qCI9B2v0vHCgwyOSO9kDLt2yW0KADZQd3Uq4s4iWSwxfUjSzCGOB/N7QU7L/o
	 kje4RSxM8a1tA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrFIsWRWlGSWpSXmKPExsViZ8ORpHtE3Cn
  ZYPF1VouLh5cyOzB6nNu4gjGAMYo1My8pvyKBNeP8ww2sBevYK94d/M3cwHiOrYuRi0NI4CGj
  xNN/lxghnCtMEpOfXWGFcHYzSjx4tgWojJODTUBNYvqtG6wgtoiAvsTS2XuYQWxmARWJF7972
  LsYOTiEBWwlVq+yAAmzAIWv7uxhArF5BZwkpt3bC2ZLCChITHn4HqyVU8BZ4uGa/WAjhYBq2n
  c9ZYeoF5Q4OfMJC8R4CYmDL14wQ/QqSsy+3MwCYVdIzJrVBjVTTeLquU3MExgFZyFpn4WkfQE
  j0ypGq6SizPSMktzEzBxdQwMDXUNDU10TIMtQL7FKN1EvtVS3PLW4RBfILS/WSy0u1iuuzE3O
  SdHLSy3ZxAgM4pRiltQdjH19P/UOMUpyMCmJ8j7d6pAsxJeUn1KZkVicEV9UmpNafIhRhoNDS
  YLXid0pWUiwKDU9tSItMwcYUTBpCQ4eJRHesH+OyUK8xQWJucWZ6RCpU4yKUuK8scJAfQIgiY
  zSPLg2WBRfYpSVEuZlZGBgEOIpSC3KzSxBlX/FKM7BqCTM+0EAaApPZl4J3PRXQIuZgBZbPbQ
  DWVySiJCSamDinHDFeWas6Ee7volnnZ/M555XtetrqPCnCya3V++0XPJ2+uxH3evv/yyfeSzt
  SUrbrSlHdV1T9wRNuxyXEbbkI9O+M49EUk+G8O6a9i/g3c3tq25a6XzvXbwkq+X3Vb6Fq69zX
  5u3wSTG/+eHmcJx4e3uh1IknQPqFvor737DMWnVqvtfWbg2tac/+nYx9V7ylciPDC3XN05VWC
  FuvO9B4YPOzo4pp4r/PV6gx/wwZqbK7e3vUmXv/FzLxlXsHfcqNsz1+eaLUvpz2N8Lm9nl6/9
  WCtGzvt8sevhy4Fa92R4v8iVPxnBdm6ljH68gsuLF4QtOPwQy1698/bYsc2teWuP8u06Fbms6
  k3P/sV8636LEUpyRaKjFXFScCAB4K/ICXQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-13.tower-591.messagelabs.com!1665275843!227604!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 19259 invoked from network); 9 Oct 2022 00:37:24 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-13.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 9 Oct 2022 00:37:24 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 23A3C1AC
	for <openembedded-devel@lists.openembedded.org>;
 Sun,  9 Oct 2022 01:37:23 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 18B9E1AB
	for <openembedded-devel@lists.openembedded.org>;
 Sun,  9 Oct 2022 01:37:23 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Sun, 9 Oct 2022 01:37:21 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] php: upgrade 8.1.10 -> 8.1.11
Date: Sun, 9 Oct 2022 08:36:57 +0800
Message-ID: <1665275818-29173-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1665275818-29173-1-git-send-email-wangmy@fujitsu.com>
References: <1665275818-29173-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 09 Oct 2022 00:37:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/99107

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-devtools/php/{php_8.1.10.bb => php_8.1.11.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/php/{php_8.1.10.bb => php_8.1.11.bb} (99%)

diff --git a/meta-oe/recipes-devtools/php/php_8.1.10.bb b/meta-oe/recipes-devtools/php/php_8.1.11.bb
similarity index 99%
rename from meta-oe/recipes-devtools/php/php_8.1.10.bb
rename to meta-oe/recipes-devtools/php/php_8.1.11.bb
index 9fc39e8686..fefabf72d8 100644
--- a/meta-oe/recipes-devtools/php/php_8.1.10.bb
+++ b/meta-oe/recipes-devtools/php/php_8.1.11.bb
@@ -33,7 +33,7 @@ SRC_URI:append:class-target = " \
           "
 
 S = "${WORKDIR}/php-${PV}"
-SRC_URI[sha256sum] = "2de8e0402285f7c56887defe651922308aded58ba60befcf3b77720209e31f10"
+SRC_URI[sha256sum] = "af6250b18b4403b6eeff9b4a02786ac86a12a208141f6f65478f79256f47f246"
 
 CVE_CHECK_IGNORE += "\
     CVE-2007-2728 \
-- 
2.25.1


