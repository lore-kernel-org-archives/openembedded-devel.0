Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21622C433F5
	for <webhook@archiver.kernel.org>; Tue, 12 Oct 2021 23:50:33 +0000 (UTC)
Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com
 [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web12.1113.1634082631790017450
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Oct 2021 16:50:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=j1gDUmJX;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1634082629; i=@fujitsu.com;
	bh=0TvlWTZAk6kRc09aiMoRULzyhZsCh1YA0vIR31SXfLo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=j1gDUmJXcMx9dOlDfFY8wCenkq6PXUlF3m723QOGR7TvdNuNu7G6qfym+rSkVBX33
	 bnnxJt1UkjsH4Y7dhm+TOLwco071+CfujGRIxZY2Z1K0E7sHlA7SoY6bruDm0s4p3T
	 Tjyj4aU81BwL+zbDbrQNdJbC/GpzhlcIHT3uIk5Vt3rMZPdnlSRy0JDzwoCrt6zMz3
	 rKHr5ZWu39x6eL3zd0T7//k1D/dyIQ8LGYCEJeWkZGvuYxACsp2D0NfMwSYfZP6/47
	 0QDAluL1HS0GPtRDmWZRFt8ppcHgo+D6vVTNEUVwBTRLTRGtHZqwu975U7NWBycn2W
	 Wj2nds/gfCyhw==
Received: from [100.113.2.26] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-a.eu-central-1.aws.symcld.net id 28/53-29929-54F16616;
 Tue, 12 Oct 2021 23:50:29 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrDIsWRWlGSWpSXmKPExsViZ8MxRddFPi3
  RoG+zgcXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmtFzdBdzwQ7OiqdzDrE1MF7m6GLk4hASmM0k
  MWHpeyYI5wSjxMon9xm7GDk52ATUJKbfusEKYosI6Essnb2HGcRmFlCRePG7hx3EFhZwltj+d
  yuYzSKgKvHx8y8gm4ODFyi+8UkCSFhCQEFiysP3YK2cAi4S3x5OYQOxhYBKjl86xAJi8woISp
  yc+YQFYryExMEXL5ghehUlZl9uZoGwKyRmzWpjmsDIPwtJyywkLQsYmVYxWiYVZaZnlOQmZub
  oGhoY6BoaGusCSWMDvcQq3US91FLd5NS8kqJEoKxeYnmxXnFlbnJOil5easkmRmBAphQyNO1g
  fPfqg94hRkkOJiVRXruFqYlCfEn5KZUZicUZ8UWlOanFhxhlODiUJHivSKclCgkWpaanVqRl5
  gCjAyYtwcGjJMJ7Uw4ozVtckJhbnJkOkTrFGMvx7ufiRcwcb9YuAZJvwWTbvbtAsh1MzlxwcD
  Uzxywweb/9EJB8ACKFWPLy81KlxHlvyAINFQAZmlGaB7cSlgguMcpKCfMyMjAwCPEUpBblZpa
  gyr9iFOdgVBLmdRIAmsKTmVcCd9kroKOZgI4OjEoBObokESEl1cB0+cX3e3pcEu0bheTW+f+Q
  aQp048osS32wZW9Ln/6NlzNMTC/nvXvxz1bMM95gh57D77C1uw2s2M6s+CTx/ppvh7h9U0Lu6
  Ww+iePW7VpK1ycfN3k54WDGNvcLO7MfHjO/VHY218Ntxl9Xdb9H3C3FnwIO3p5gMttrQu6xFV
  +EL3GurL11vE9X6cIn97L7efaHVvg+1n2W0rpR/prLhsK1J3WnRIlc7LGti87aJdQ4VerCpN8
  sbUU8QjPyytaFXDz7rEB1h0n099BLViGp8qtrv85aGvwq9tecbsfMkIBH/5btdLywq0Rkyb8F
  sUmmf33vJ2atWzbHJej4P+25vh9KQ1aGslXc/NMvse3o3u3WSizFGYmGWsxFxYkAeMiW2X8DA
  AA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-20.tower-232.messagelabs.com!1634082628!2231910!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 10420 invoked from network); 12 Oct 2021 23:50:28 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-20.tower-232.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 12 Oct 2021 23:50:28 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 19CNoKQv023072
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 Oct 2021 00:50:28 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.23; Wed, 13 Oct 2021 00:50:18 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] span-lite: upgrade 0.10.1 -> 0.10.3
Date: Wed, 13 Oct 2021 07:49:35 +0800
Message-ID: <1634082575-112891-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1634082575-112891-1-git-send-email-wangmy@fujitsu.com>
References: <1634082575-112891-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 12 Oct 2021 23:50:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93262

Fixes:

Properly constrain constructor from iterators
(https://github.com/martinmoene/span-lite/issues/69)
Add [noreturn] to throw_out_of_range()
(https://github.com/martinmoene/span-lite/issues/73)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../span-lite/{span-lite_0.10.1.bb => span-lite_0.10.3.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/span-lite/{span-lite_0.10.1.bb => span-lite_0.10.3.bb} (86%)

diff --git a/meta-oe/recipes-support/span-lite/span-lite_0.10.1.bb b/meta-oe/recipes-support/span-lite/span-lite_0.10.3.bb
similarity index 86%
rename from meta-oe/recipes-support/span-lite/span-lite_0.10.1.bb
rename to meta-oe/recipes-support/span-lite/span-lite_0.10.3.bb
index 15ba099826..0079cf7298 100644
--- a/meta-oe/recipes-support/span-lite/span-lite_0.10.1.bb
+++ b/meta-oe/recipes-support/span-lite/span-lite_0.10.3.bb
@@ -4,7 +4,7 @@ LICENSE = "BSL-1.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e4224ccaecb14d942c71d31bef20d78c"
 
 SRC_URI += "git://github.com/martinmoene/span-lite"
-SRCREV = "da49b231a25600b4431e00b564a6a20be95c1108"
+SRCREV = "cbb9c3c5162a0d7018c7b3e053153a04d4fbbbb9"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


