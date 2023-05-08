Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FA28C7EE26
	for <webhook@archiver.kernel.org>; Mon,  8 May 2023 10:24:48 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web10.103893.1683541485541274965
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 May 2023 03:24:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=QTa8sfl1;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1683541484; i=@fujitsu.com;
	bh=9E4/IGkB6jknlhqQdBD/pxN82E0CihuwqgdmnPUVv8k=;
	h=From:To:Cc:Subject:Date:Message-Id;
	b=QTa8sfl1vOOsrLtenqc3OFTEgVT4LCGrJL3mO4+/Nz/4/ebJBGSUzkELpFq2d1rxq
	 sX4u/I6gVHACMLw0Xdmyg83z7UrFlRCNj7aLXB+zNMvb59a6Reve9xee3+NX4c7wsc
	 wK9Pl5mle5+qODGg69cP112RFPL09+1IeH/mDS4ih6pD660hVJ5OT0H7tPYxzmo2LR
	 xLKcMPoxUFxHZbC2kITdBUMy/00FkeLkFimoM+m8Ni1fEkLq0P+7PgA7YnGoARrC/k
	 csHYrWzyB6q1D+WusKui6hvjwNbgk+PNZdqOKpoZZlb/U3UbAj1hM+bnYFOWb+3YQP
	 cta0bacwwGTbw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrJLMWRWlGSWpSXmKPExsViZ8ORpPv6bES
  KwaG5OhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8aGl9eZCo7zV/TsvsDWwPiEt4uRi0NIYCOj
  xKJP+9khnGlMEpP+nGbrYuTkYBOQkJi+9yQ7iC0ioCvx8cNcRhCbWUBFYsbkI0wgtrBAgMTsh
  +vAalgEVCXu7rnNCmLzCjhJ/HrwGaxGQkBBYsrD98wQtprE1XObmCcwci1gZFjFaFqcWlSWWq
  RropdUlJmeUZKbmJmjl1ilm6iXWqpbnlpcomukl1herJdaXKxXXJmbnJOil5dasokR6OOUYqW
  OHYzXd/7VO8QoycGkJMprejAsRYgvKT+lMiOxOCO+qDQntfgQowwHh5IEr8vpiBQhwaLU9NSK
  tMwcYLjBpCU4eJREeGWPAKV5iwsSc4sz0yFSpxgVpcR5t54BSgiAJDJK8+DaYCF+iVFWSpiXk
  YGBQYinILUoN7MEVf4VozgHo5IwbxowYoR4MvNK4Ka/AlrMBLTY/3I4yOKSRISUVANT5KVNFy
  6Krpu/NjshTuHk3Kj9uofnn54Wfi2HRzjgWelMrr6A55En7xb1uNytc0y+tCE7o/Q++y3XUOu
  3ExlsbBdmJGyb7ionKB614ppcw8ypoj/M3lrxMWSLME6Nt9iS/eD4qZCTHmJMLTah3Ob3vD6p
  zQxV/GUet/2yDst5TiE5LYbKtXYzPlaG3r/Dk1f/VYNdtPfRiY1pWfyl67xmv89lSA07tshQu
  uYEX3hu3+dv81QuGh77/oZhqYGsRWH0oyR+p/kNduKntV+b+dVuvLVgh0er2RTHthYexcktff
  pPT6y/kbVcVf1v/MIGGdHiU3cmbXspry+5YPb/mwE8wgpRcxmnLff6pp568I0SS3FGoqEWc1F
  xIgBYAHD27AIAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-5.tower-548.messagelabs.com!1683541483!226657!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.105.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 9520 invoked from network); 8 May 2023 10:24:43 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-5.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 8 May 2023 10:24:43 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 729701D2;
	Mon,  8 May 2023 11:24:43 +0100 (BST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 9A24E1C2;
	Mon,  8 May 2023 11:24:42 +0100 (BST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-sentry-sdk: upgrade 1.20.0 -> 1.22.1
Date: Mon,  8 May 2023 18:24:31 +0800
Message-Id: <1683541475-25799-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 May 2023 10:24:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102427

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
 Fix: Handle a list of keys (not just a single key) in Django cache spans (#2082)
 Add cache.hit and cache.item_size to Django (#2057)
 Use http.method instead of method (#2054)
 Handle non-int exc.status_code in Starlette (#2075)
 Handle SQLAlchemy engine.name being bytes (#2074)
 Fix KeyError in capture_checkin if SDK is not initialized (#2073)
 Use functools.wrap for ThreadingIntegration patches to fix attributes (#2080)
 Pin urllib3 to <2.0.0 for now (#2069)
 Do not send monitor_config when unset (#2058)
 Add db.system span data (#2040, #2042)
 Fix memory leak in profiling (#2049)
 Fix crash loop when returning none in before_send (#2045)
 Better handling of redis span/breadcrumb data (#2033)
 Add db.system to redis and SQLAlchemy db spans (#2037, #2038, #2039) (#2037)
 Upgraded linting tooling (#2026)
 Made code more resilient. (#2031)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-sentry-sdk_1.20.0.bb => python3-sentry-sdk_1.22.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-sentry-sdk_1.20.0.bb => python3-sentry-sdk_1.22.1.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-sentry-sdk_1.20.0.bb b/meta-python/recipes-devtools/python/python3-sentry-sdk_1.22.1.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-sentry-sdk_1.20.0.bb
rename to meta-python/recipes-devtools/python/python3-sentry-sdk_1.22.1.bb
index 174545dd2e..ef4d629a87 100644
--- a/meta-python/recipes-devtools/python/python3-sentry-sdk_1.20.0.bb
+++ b/meta-python/recipes-devtools/python/python3-sentry-sdk_1.22.1.bb
@@ -15,7 +15,7 @@ RDEPENDS:${PN} += "\
 	${PYTHON_PN}-datetime \
 "
 
-SRC_URI[sha256sum] = "a3410381ae769a436c0852cce140a5e5e49f566a07fb7c2ab445af1302f6ad89"
+SRC_URI[sha256sum] = "052dff5069c6f0d836ee014323576824a9b40836fc003fb12489a1f19c60a3c9"
 
 PYPI_PACKAGE = "sentry-sdk"
 
-- 
2.34.1


