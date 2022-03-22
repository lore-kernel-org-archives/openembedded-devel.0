Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D624C433F5
	for <webhook@archiver.kernel.org>; Tue, 22 Mar 2022 11:57:13 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.3])
 by mx.groups.io with SMTP id smtpd.web12.8813.1647950232808757394
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Mar 2022 04:57:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=QKuDSq/3;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.3,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1647950231; i=@fujitsu.com;
	bh=RyxTeo9EWDscKNERG3FuawcqYxtfL3IFum0K38k+Bqs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=QKuDSq/3aLoTA/gFKZk73hJeqoY4ZX7Oo9bxQDBdQord5VjS8RPDN9oU4L316gagy
	 BqObJnad4EQPBk8YIUU4JknC+K9g4e8E32vo/iPli5Lh+dRvl6R64hoi83KF4SZyKD
	 u/gp/yfgychX9AMFe1Ji7WE2jB5TuA/dCCuF0h6i6XlCL+eigVfBx0zaIEqLj4wzth
	 4hvjgLppuZN6zQbymi17C0C0erkK8+6Sf7hBOXcGC4u0x9yKfsPEQ0iCZdu659GewB
	 hebUZAdlClnMmTXXUDmQsfq1PKmFM6r4DX97NHYxjqB3uzK9wnhW/azpvOw1H326nL
	 WIKwoQQmkGQ/g==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrJIsWRWlGSWpSXmKPExsViZ8ORqDttp2W
  SwaTlhhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8b3vW+ZCtawVyxvPsLawHierYuRk0NI4Amj
  RMOrRAj7ApPEyd9iXYxcQPYeRokP37vYQRJsAmoS02/dYAWxRQT0JZbO3sMMYjMLqEi8+N0DV
  MPBISxgJ/GvlwckzCKgKvHwyhZGEJtXwFHi2apmFhBbQkBBYsrD92CtnAJOEn3PL0Hd4CjxYd
  l9Zoh6QYmTM5+wQIyXkDj44gUzRK+ixOzLMHMqJGbNamOCsNUkrp7bxDyBUXAWkvZZSNoXMDK
  tYrROKspMzyjJTczM0TU0MNA1NDTVNbbQNTQy10us0k3USy3VLU8tLtE10kssL9ZLLS7WK67M
  Tc5J0ctLLdnECAzhlGK1+h2ML1b+1DvEKMnBpCTKK77cMkmILyk/pTIjsTgjvqg0J7X4EKMMB
  4eSBO/67UA5waLU9NSKtMwcYDzBpCU4eJREeP9uAErzFhck5hZnpkOkTjEqSonzRu0ASgiAJD
  JK8+DaYDF8iVFWSpiXkYGBQYinILUoN7MEVf4VozgHo5Iwbx7IFJ7MvBK46a+AFjMBLdZnNQN
  ZXJKIkJJqYOJlS7l1zDNMQ//WpELVfw/29nyYnN79o7ZZVvi1S/2/6Xdj7AuPzC5XV45bG2Lk
  r6P7rDXu3Mf4SZ3TS18psRvIRx1Z/MDy8Mz5+84XfCl6Uq2gfFDqt9TsdWXNFYc1Zv/+7HQsn
  U3HJ3PxqbZPAlx/TmU3OWzcqCtc+XVFjcVXUU5XNb34hXt3p7Rv7Zevy+i5EtMtKua14orh5z
  emO6+IOQeJ+LS+3KjTsSK/5dCviqRXFWG+fxdfqJc5d7XNMiF04luHI6ypIqe4d384nivisnW
  fYQ2/WPqy1/+MAuTOns/Y8mL1g1lzjmikbDnyRT3999JbKYKSMy6mts1ctlEm0X+q1462hI3F
  m6IO1iixFGckGmoxFxUnAgBzHqHEXAMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-13.tower-571.messagelabs.com!1647950230!87361!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.10; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 18574 invoked from network); 22 Mar 2022 11:57:10 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-13.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 22 Mar 2022 11:57:10 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 68F0C10018E
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Mar 2022 11:57:10 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 5C70910004E
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Mar 2022 11:57:10 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 22 Mar 2022 11:56:49 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH v2] php: upgrade 8.1.3 -> 8.1.4
Date: Tue, 22 Mar 2022 19:56:28 +0800
Message-ID: <1647950188-5858-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1647950188-5858-1-git-send-email-wangmy@fujitsu.com>
References: <1647950188-5858-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Mar 2022 11:57:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96139

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-devtools/php/{php_8.1.3.bb => php_8.1.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/php/{php_8.1.3.bb => php_8.1.4.bb} (99%)

diff --git a/meta-oe/recipes-devtools/php/php_8.1.3.bb b/meta-oe/recipes-devtools/php/php_8.1.4.bb
similarity index 99%
rename from meta-oe/recipes-devtools/php/php_8.1.3.bb
rename to meta-oe/recipes-devtools/php/php_8.1.4.bb
index 8086bac550..bf6c543097 100644
--- a/meta-oe/recipes-devtools/php/php_8.1.3.bb
+++ b/meta-oe/recipes-devtools/php/php_8.1.4.bb
@@ -33,7 +33,7 @@ SRC_URI:append:class-target = " \
           "
 
 S = "${WORKDIR}/php-${PV}"
-SRC_URI[sha256sum] = "354c4e2c506046eca812d1fc2526884a2f54b5e3d20ef0ede919a69eb232d0be"
+SRC_URI[sha256sum] = "b3f688cb69758523838b8e7f509aaef0152133d9b84a84a0b7cf68eeafc1df76"
 
 inherit autotools pkgconfig python3native gettext
 
-- 
2.25.1


