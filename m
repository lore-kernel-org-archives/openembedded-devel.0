Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.69])
 by mx.groups.io with SMTP id smtpd.web12.6298.1628152526527454719
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Aug 2021 01:35:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=yURnGEf7;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.69, mailfrom: zhengrq.fnst@fujitsu.com)
Return-Path: <zhengrq.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1628152524; i=@fujitsu.com;
	bh=E+Ef059brqEPKyfzEILtMFTXwflKSCt1Fc7/NilSBHI=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=yURnGEf7Sl/9MqGDTG+oEGFQ3YrXxOrFcXgA/Ac2WGVjciDAVZsWzEEflB6ueVsR6
	 bvctO0gf9eJNz9cp1KJRIeoBU2UivSHZ9AzOAOV8ttDBL8Djm9G40NJd0jdYFu4Wy0
	 LDI7Sq4XowmTqjgwKB/i0O7910EyRzP89MEuzBz197EmztIT3ruVv5nR/+rMSo7h1o
	 dqrSCEoIZkd2fLXf+x1mYVcLnJlMgfjZbnpES+sMCG83010efk8VbpQqD8Hp/IFCrx
	 cu8XdR2bxIfoQtREGnPTeIuxl5PuydGbi4WyND2FXt4CYPluMUF2CHMcINZrfVx3yj
	 wwymoukfI2LPA==
Received: from [100.112.198.129] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-5.bemta.az-b.eu-west-1.aws.symcld.net id 06/A9-07336-CC2AB016; Thu, 05 Aug 2021 08:35:24 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrKIsWRWlGSWpSXmKPExsViZ8MxRffUIu5
  EgznH5SwuHl7K7MDocW7jCsYAxijWzLyk/IoE1oyPmw+zFLRwVFy6eJ+1gXELexcjF4eQwCwm
  iYZfm9ggnN2MEqee/2HsYuTkYBPQlTj3eC07iC0ioC+xdPYeZhBbWMBa4sPFDhYQm0VAReL22
  9NgNq+Ah8SrCeeZQGwJAQWJKQ/fM0PEBSVOznwCVsMsICFx8MULoDgHUI2ixOzp8hDlFRKvD1
  9insDIMwtJxywkHQsYmVYxWiQVZaZnlOQmZuboGhoY6BoaGukaWprpGhka6yVW6SbppZbqlqc
  Wl+ga6iWWF+sVV+Ym56To5aWWbGIEhlFKwZGrOxi733zQO8QoycGkJMqr38udKMSXlJ9SmZFY
  nBFfVJqTWnyIUYaDQ0mCt2IBUE6wKDU9tSItMwcY0jBpCQ4eJRFeZpA0b3FBYm5xZjpE6hSjN
  8fl6/MWMXM8W7sESG6YtxRI/r97F0j2Lzi4mpnjZvuh1cxCLHn5ealS4ryqC4FGCICMyCjNg1
  sAi81LjLJSwryMDAwMQjwFqUW5mSWo8q8YxTkYlYR51UGm8GTmlcDd8QroRCagEy/EcoKcWJK
  IkJJqYDowadIP3f42mYOb9bbHM0eeUZkazTS1ymO7peDqPcsdf8Xx6OtZXeZ79XO59NTJWztF
  Pt66wBzavDt6c/TeSboxIduPf7hfwB24SS9xRdOem3qf79dn3jHp3Pak8cOO+w6pW30bm+UnX
  Pjy5ofjZ+4jUn/e5a/9o/B5s9mNLD0//luJ2TuXSQUsPFG1rKU85RJ3yQ7+SVeEXqTOmrT4YA
  xLWOJvX/OJkc8yebbKn+e31r6UtyHlmTBj7OtzU1kklk9SqBHPviF8U/fCS43CJ6cDd3zgdm+
  5xFTne+cba+e0otUPHkUcCZijx/El7rH8Lo6Jq3Q0bNq/Tpw6t5bHpteE5W/Y6ogYl1bezPvn
  Of8rsRRnJBpqMRcVJwIAIsO9X0gDAAA=
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-7.tower-291.messagelabs.com!1628152522!194!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 18516 invoked from network); 5 Aug 2021 08:35:22 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-7.tower-291.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 5 Aug 2021 08:35:22 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1758ZMHX020409
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 5 Aug 2021 09:35:22 +0100
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Thu, 5 Aug 2021 09:35:19 +0100
From: "zhengruoqin" <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] xwd: upgrade 1.0.7 -> 1.0.8
Date: Thu, 5 Aug 2021 16:35:14 +0800
Message-ID: <1628152514-23176-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../recipes-graphics/xorg-app/{xwd_1.0.7.bb => xwd_1.0.8.bb}   | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-oe/recipes-graphics/xorg-app/{xwd_1.0.7.bb => xwd_1.0.8.bb} (69%)

diff --git a/meta-oe/recipes-graphics/xorg-app/xwd_1.0.7.bb b/meta-oe/recipes-graphics/xorg-app/xwd_1.0.8.bb
similarity index 69%
rename from meta-oe/recipes-graphics/xorg-app/xwd_1.0.7.bb
rename to meta-oe/recipes-graphics/xorg-app/xwd_1.0.8.bb
index 1ad48b071..44b9c80d7 100644
--- a/meta-oe/recipes-graphics/xorg-app/xwd_1.0.7.bb
+++ b/meta-oe/recipes-graphics/xorg-app/xwd_1.0.8.bb
@@ -7,5 +7,4 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c0cdb783e9a0198237371fdaa26a18bf"
 DEPENDS = "libxmu libxkbfile"
 
-SRC_URI[md5sum] = "11794a8eba6d295a192a8975287fd947"
-SRC_URI[sha256sum] = "cd6815b8b9e0b98e284d3d732fb12162159cb9dcee4f45a7d4c0bd8b308a6794"
+SRC_URI[sha256sum] = "fbaa2b34163714fe7be22b60920ea4683f63b355babb1781aec2e452a033031b"
-- 
2.25.1

