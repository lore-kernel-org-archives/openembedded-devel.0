Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF511C54EE9
	for <webhook@archiver.kernel.org>; Tue, 27 Sep 2022 08:22:12 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web10.8553.1664266919935520317
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Sep 2022 01:22:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=qRgE+/ns;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1664266918; i=@fujitsu.com;
	bh=YZEGoLbIjA/SNjK10ccmB/XssNT6tnz0GHKcKDi0/bw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=qRgE+/ns6JpMzYfx/UXu20eHo5JziGtcwyEn6mpk6uaYMxzm10Y8UB5KBnOhqlche
	 eaRV0FRpWj9vl4nI9lJ1mT15KjXUoW9CqDtdwrQh30KhX6p+0OoaPLo8+7mlVCnIop
	 +OM5aO3gXmWS8q0IPDM6jl4uCyBletPG6vXYkRs4zqYL2hUlkiTcIIFi3mJFhyltqk
	 F2OCZk3Q2vDbkMkpHk4S3so8SvXHbs6Xt6IOm06x9jIir91A5AOTafB8VgaacDgQNU
	 8ihA1xvG1z2EG+ZTS2bTah8yRFH7eygGtFAqNTHtJhFaXPRllmJA0l9pOwrcYXrZWB
	 4CQGNJ8icHo7Q==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrEIsWRWlGSWpSXmKPExsViZ8OxWXfJJqN
  kg6aZbBYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8aGOY/YC3ZwVGx/vZmtgfEhexcjF4eQwENG
  ie/TdzJCOJeZJC4c+8XUxcgJ5OxhlHhyOAnEZhNQk5h+6wYriC0ioC+xdPYeZhCbWUBF4sXvH
  qBJHBzCAm4Sl594g5gsAqoSbSt1QSp4BRwldk49ww5iSwgoSEx5+B6sk1PASWLS7VvsEJscJf
  aumsYMUS8ocXLmExaI6RISB1+8YIboVZSYfbmZBcKukGicfogJwlaTuHpuE/MERsFZSNpnIWl
  fwMi0itEmqSgzPaMkNzEzR9fQwEDX0NAUSBvrWpjoJVbpJuqllurm5ReVZOga6iWWF+ulFhfr
  FVfmJuek6OWllmxiBAZxSnF6yA7GM/t+6R1ilORgUhLltV9klCzEl5SfUpmRWJwRX1Sak1p8i
  FGGg0NJgpdpPVBOsCg1PbUiLTMHGFEwaQkOHiUR3nVLgNK8xQWJucWZ6RCpU4yWHFNn/9vPzL
  EcTM782naAWYglLz8vVUqcd+ZGoAYBkIaM0jy4cbCov8QoKyXMy8jAwCDEU5BalJtZgir/ilG
  cg1FJmHfpWqApPJl5JXBbXwEdxAR0kB2fPshBJYkIKakGJvn0gutP78/eb98vY3DELHii2vZO
  x6f/5Oadsm7h+v6GTeJuW0W6V5Hd64PxOQ/YujpOn7/rvEaa/V3KbabkLZHaegLrGR5HV558W
  SIt8fJM9jH+Zq4IltR7LzecF5SPmbOsev3EY+FPlMzzWQQT1x1cl1Ao4msS/ML2uZ2phHd9SI
  N5zQnd3VNvCsqqly3o8z+2ZPLCr0cfpWz08rujpOo4l3f5isUmjmsXRTEtsVun8kLurURD/wx
  nO41nM/ZoPPorsOzIWkUT7pny88RVOydwFKQxnatxufs7Yp5PbUxsWfUZ5traeVEqmTMe67zT
  vv9wA4eDyPW+LCYdmdr3z0WuW6cIKl2SECqYBqRZijMSDbWYi4oTASlt20F1AwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-9.tower-728.messagelabs.com!1664266915!246303!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 10346 invoked from network); 27 Sep 2022 08:21:56 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-9.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 27 Sep 2022 08:21:56 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 852A5142
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Sep 2022 09:21:55 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121
 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 7848873
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Sep 2022 09:21:55 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 27 Sep 2022 09:21:54 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] pangomm-2.48: upgrade 2.50.0 -> 2.50.1
Date: Tue, 27 Sep 2022 16:21:22 +0800
Message-ID: <1664266883-2234-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1664266883-2234-1-git-send-email-wangmy@fujitsu.com>
References: <1664266883-2234-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 27 Sep 2022 08:22:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98967

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../pango/{pangomm-2.48_2.50.0.bb => pangomm-2.48_2.50.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/pango/{pangomm-2.48_2.50.0.bb => pangomm-2.48_2.50.1.bb} (85%)

diff --git a/meta-oe/recipes-graphics/pango/pangomm-2.48_2.50.0.bb b/meta-oe/recipes-graphics/pango/pangomm-2.48_2.50.1.bb
similarity index 85%
rename from meta-oe/recipes-graphics/pango/pangomm-2.48_2.50.0.bb
rename to meta-oe/recipes-graphics/pango/pangomm-2.48_2.50.1.bb
index 84aedba21b..b4079f7839 100644
--- a/meta-oe/recipes-graphics/pango/pangomm-2.48_2.50.0.bb
+++ b/meta-oe/recipes-graphics/pango/pangomm-2.48_2.50.1.bb
@@ -10,7 +10,7 @@ GNOMEBASEBUILDCLASS = "meson"
 GNOMEBN = "pangomm"
 inherit gnomebase features_check
 
-SRC_URI[archive.sha256sum] = "a27aa77e017b9afce9e751d85bd1cf890abbb3a58bf59d0fac917eef82db3b5b"
+SRC_URI[archive.sha256sum] = "ccc9923413e408c2bff637df663248327d72822f11e394b423e1c5652b7d9214"
 REQUIRED_DISTRO_FEATURES = "x11"
 
 S = "${WORKDIR}/${GNOMEBN}-${PV}"
-- 
2.25.1


