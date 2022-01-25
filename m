Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AC87C433EF
	for <webhook@archiver.kernel.org>; Tue, 25 Jan 2022 13:13:08 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web08.6769.1643116387031595309
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Jan 2022 05:13:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=SFVyI2Do;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1643116385; i=@fujitsu.com;
	bh=cdi3vaZDJdUxa4ll4t9+ixjKq4fc6rbqv8UhLuX6rgk=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=SFVyI2DoBG0Ec2GbgNpdJM230AW0GqrJUtsNpNqxWZY3Ii9jKrexzPZLa6F9E2MCg
	 riucj+Se3T2w97lAw7eCJjedRUVs1o7Rzy2NI0F6eGIohGSU8ChdHjsU8WLaP+JzMA
	 fP/Xf6yBR1zWrc7RFXI1ldypcEwbDF8ZJ7+dwvxz8i/RbMoh7HabnUe8vD13MSIGsy
	 tVJe575ZOUt5gWeDsaKELdMfa3C1NawmQp/6BEEqa1ZoRr5+Tmx83XpQ64nc4afnLi
	 SOImEVVJ9z1uDL3cgMvHsqPI3/xkdJ9M7wsKNGnP/nQopxxb1Tw0kKNr3KUK0mYltu
	 4yyTFjeHLbP2A==
Received: from [100.115.38.159] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-a.eu-west-2.aws.ess.symcld.net id 01/5F-12680-067FFE16;
 Tue, 25 Jan 2022 13:13:04 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrOIsWRWlGSWpSXmKPExsViZ8MRopvw/X2
  iwbO7KhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8aeyb/YC/6zV+xc8YS9gXE6excjF4eQwEwm
  iWfnmlggnBOMEqfvdTF2MXJysAmoSUy/dYMVxBYR0JdYOnsPM4jNLKAi8eJ3D1A3B4ewgLvE9
  gPpIGEWAVWJl1PnMYKEeQUcJV7d4QYJSwgoSEx5+B6sk1dAUOLkzCcsEFMkJA6+eMEMUaMoMf
  tyMwuEXSExa1Yb0wRG3llIWmYhaVnAyLSK0TqpKDM9oyQ3MTNH19DAQNfQ0FTX2ELXyNBIL7F
  KN1EvtVS3PLW4RBfILS/WSy0u1iuuzE3OSdHLSy3ZxAgMsZRitSs7GPes+ql3iFGSg0lJlDdx
  3ftEIb6k/JTKjMTijPii0pzU4kOMMhwcShK8rz4B5QSLUtNTK9Iyc4DhDpOW4OBREuFV/gaU5
  i0uSMwtzkyHSJ1itOd4s3bJImaOtnt3geTMBQdXM3Pcbz+0mlmIJS8/L1VKnFcYpE0ApC2jNA
  9uKCw+LzHKSgnzMjIwMAjxFKQW5WaWoMq/YhTnYFQS5v3+FWgKT2ZeCdzuV0BnMQGd9fv8O5C
  zShIRUlINTElWp+s6vAotDj2aVhMt4697cJqiSEjn7c9NSSqzfvtMjVJoXfQy98SeDxlrar5Z
  itkUpG1ePafiie9Hmy1OZ22/ObCHtPosF9jOKfpC7+3S8nrTaDn/qNbypDqelcprKgXu/RGsn
  8Ia5NhWqvbL12ly65lk2YfWNrcOvdp2SaS6zoT9sqPVafPWk2dDktqeFa+aN+clQ0+i2LZfK4
  6K11Y/7vi+m7uh71a/dNGxrTNcFhR8tWBTNdwbXsXj8qbGcNkNvmc7Tx96JLZc5kRU0aHbvzI
  2vrv2xdKI/4+GW7E858btjI3i4l+yr59pONl5+vUx/ZbnujnFurMy1Szrwooc7JzOp3+xEN+3
  PVFFiaU4I9FQi7moOBEA1twVgEoDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-3.tower-548.messagelabs.com!1643116384!19866!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 25113 invoked from network); 25 Jan 2022 13:13:04 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-3.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 25 Jan 2022 13:13:04 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 20PDCwhN016909
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Jan 2022 13:13:04 GMT
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Tue, 25 Jan 2022 13:12:56 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-filesystems] [PATCH] fatcat: upgrade 1.1.0 -> 1.1.1
Date: Tue, 25 Jan 2022 21:12:44 +0800
Message-ID: <1643116367-7352-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Jan 2022 13:13:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95057

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-utils/fatcat/{fatcat_1.1.0.bb => fatcat_1.1.1.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-filesystems/recipes-utils/fatcat/{fatcat_1.1.0.bb => fatcat_1.1.1.bb} (92%)

diff --git a/meta-filesystems/recipes-utils/fatcat/fatcat_1.1.0.bb b/meta-filesystems/recipes-utils/fatcat/fatcat_1.1.1.bb
similarity index 92%
rename from meta-filesystems/recipes-utils/fatcat/fatcat_1.1.0.bb
rename to meta-filesystems/recipes-utils/fatcat/fatcat_1.1.1.bb
index c90a7ecc2..e344eda15 100644
--- a/meta-filesystems/recipes-utils/fatcat/fatcat_1.1.0.bb
+++ b/meta-filesystems/recipes-utils/fatcat/fatcat_1.1.1.bb
@@ -11,7 +11,7 @@ SRC_URI = "git://github.com/Gregwar/fatcat.git;branch=master;protocol=https \
            file://0001-Use-unistd.h-not-argp.h-for-all-POSIX-systems.patch \
            "
 
-SRCREV = "b923172d97c578297964c062e3a92799e2a9eca4"
+SRCREV = "99cb99fc86eb1601ac7ae27f5bba23add04d2543"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


