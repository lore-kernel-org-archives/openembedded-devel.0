Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38CA9C433F5
	for <webhook@archiver.kernel.org>; Fri,  7 Jan 2022 14:28:14 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.2])
 by mx.groups.io with SMTP id smtpd.web09.7216.1641565692548504853
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 07 Jan 2022 06:28:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=iBHmSQgo;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1641565690; i=@fujitsu.com;
	bh=W9gB1rSMhQ1g97XsT/TvQyuXXh7cAbOfJ1j+NrBvN2c=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=iBHmSQgo4rLSaKmV9KO6GaFM4jRaUZr/bBEoi1Ehpn2JdwTn6uBIzUthcXsMVWLmw
	 nWm/EuSbU27G9PoSGDLDEDF1UGy4CwbGyy0V6REhXtWeQIylem+nrGxQgnEfkRmjMh
	 gdqHHQjTaoMFDGSO+WFpiBI4+Dsr2fkwXhVoeH9tEQihxuOkJwPjYpLswGraj0RPZo
	 Y4lqVVtoH2pX1eHiXiNtZ6Umo8oyza3831km4uC1Gmb4gPtDuc42HLYWBrKCPv9S+6
	 QthUIbkTXTAa0S+q9qtHwr436SXQm2J6uBS3lxZUefUBY5NH8CsEF8BSY8X3KAKoVP
	 YCFqFJNqePvJA==
Received: from [100.115.6.48] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-a.eu-west-1.aws.ess.symcld.net id 66/26-10124-AFD48D16;
 Fri, 07 Jan 2022 14:28:10 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrNIsWRWlGSWpSXmKPExsViZ8ORqPvL90a
  iwbVZ4hYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bbxXuYC9o4KiZ9ecDewLiJvYuRi0NI4Amj
  xKT+U2wQzgUmic6vn1ggnOOMEo/6lgI5nBxsAmoS02/dYAWxRQT0JZbO3sMMYjMLqEi8+N3DD
  mILCzhJTH/cBmazAMVb5uxjA7F5geInrlxlBLElBBQkpjx8D9bLKeAs8fDILiYQWwiopunZc0
  aIekGJkzOfsEDMl5A4+OIFM0SvosTsy80sEHaFxKxZbUwQtprE1XObmCcwCs5C0j4LSfsCRqZ
  VjFZJRZnpGSW5iZk5uoYGBrqGhqa6prpGxsZ6iVW6iXqppbrlqcUluoZ6ieXFeqnFxXrFlbnJ
  OSl6eaklmxiBYZxSzPpyB+P0vp96hxglOZiURHl1nW8kCvEl5adUZiQWZ8QXleakFh9ilOHgU
  JLgrfABygkWpaanVqRl5gBjCiYtwcGjJMJ7FSTNW1yQmFucmQ6ROsWoKCXOe9gbKCEAksgozY
  Nrg8XxJUZZKWFeRgYGBiGegtSi3MwSVPlXjOIcjErCvJtAxvNk5pXATX8FtJgJaPEK4esgi0s
  SEVJSDUxG67cy77V8E8J07ffflY5nf35KklloIDjH3Tak+Ec1v0RunURNsM3F2FXzvrxjD9mr
  d/b/q/4g8Sm371u/Lzt1WZ+J8fORL+VLipPirQxv8Z64fcAlNTJ/x4067ywdq64VIrcitkx7e
  Wn72ae3K+z3N90+zhU/WSX35fPoycrtr5pcF51TP2MdMMH5R6jnHAebvCW6J+t/17aVnzKYP3
  0z356K1DOOomI7hKXdFrmdUOZL+hl9XZLxZ4zM7JOvGmdUHDjxuLGVT2YyT9yMLx1bep0mMO5
  VSQnlmMa34HVFjfkNxdm9CR1GTMw2fpMOs88QZ8m5JPl6vVv4hrDkW72X25O0Wz4wG5RofQ/4
  3KHEUpyRaKjFXFScCADk8766XgMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-20.tower-587.messagelabs.com!1641565690!7576!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 22369 invoked from network); 7 Jan 2022 14:28:10 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-20.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 7 Jan 2022 14:28:10 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id C49101001AA
	for <openembedded-devel@lists.openembedded.org>;
 Fri,  7 Jan 2022 14:28:09 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id B48511001A3
	for <openembedded-devel@lists.openembedded.org>;
 Fri,  7 Jan 2022 14:28:09 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Fri, 7 Jan 2022 14:27:56 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] pcsc-tools: upgrade 1.5.7 -> 1.5.8
Date: Fri, 7 Jan 2022 22:27:35 +0800
Message-ID: <1641565655-53792-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1641565655-53792-1-git-send-email-wangmy@fujitsu.com>
References: <1641565655-53792-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 07 Jan 2022 14:28:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94687

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../pcsc-tools/{pcsc-tools_1.5.7.bb => pcsc-tools_1.5.8.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/pcsc-tools/{pcsc-tools_1.5.7.bb => pcsc-tools_1.5.8.bb} (89%)

diff --git a/meta-oe/recipes-support/pcsc-tools/pcsc-tools_1.5.7.bb b/meta-oe/recipes-support/pcsc-tools/pcsc-tools_1.5.8.bb
similarity index 89%
rename from meta-oe/recipes-support/pcsc-tools/pcsc-tools_1.5.7.bb
rename to meta-oe/recipes-support/pcsc-tools/pcsc-tools_1.5.8.bb
index 4f788f454..19654f15b 100644
--- a/meta-oe/recipes-support/pcsc-tools/pcsc-tools_1.5.7.bb
+++ b/meta-oe/recipes-support/pcsc-tools/pcsc-tools_1.5.8.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENCE;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 SRC_URI = "git://github.com/LudovicRousseau/pcsc-tools;protocol=https;branch=master"
 
-SRCREV = "34ac207adbba0d1a951b314c1676610a1d0bba01"
+SRCREV = "53923ef8e98062c478f99e3bfcc8eb4654996c27"
 
 inherit autotools pkgconfig
 
-- 
2.25.1


