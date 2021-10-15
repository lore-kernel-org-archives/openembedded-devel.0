Return-Path: <zangrc.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86593C433EF
	for <webhook@archiver.kernel.org>; Fri, 15 Oct 2021 05:09:09 +0000 (UTC)
Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com
 [195.245.230.2])
 by mx.groups.io with SMTP id smtpd.web11.5450.1634274548446838494
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Oct 2021 22:09:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=MnyHfqHM;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.2,
 mailfrom: zangrc.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1634274540; i=@fujitsu.com;
	bh=NE9NH1eq9DNjXQ6flyqnawwcImF4QHwA+t9TqlXvJyI=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=MnyHfqHM2MuuVWXaTMm85089Cg6tlsTT2NRjCe+ulyi4iJFVk/G8HL8LqUdPs0lx7
	 s+ZpzvZaSLdjnsOsW+A2AO4wfkPkZeqtaSfnRHCn8T+Ye+lU9BIdKnUR6OjkEQNLF/
	 ut4rXL/JT1lDZXrlXsRyOhbtQ7kZZ3wsAKYZRW4U02VD97UfvUiz9BEq3xIHdc2Y6F
	 CT6HmS/vboaof4XjBAapJSkRIS0qmSipz79UQ9d/sfHey+iQ/yS3aPZhLnvAfTf1py
	 /n9cevL6jecA/cG9lemcFaePR61qpliQeR3Urwb/K6O6LIEExqRF3jM7E+EP6vVvQH
	 S71o0+dU2PpmQ==
Received: from [100.112.194.154] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-a.eu-west-1.aws.symcld.net id 05/81-16630-CEC09616;
 Fri, 15 Oct 2021 05:09:00 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrMIsWRWlGSWpSXmKPExsViZ8MxSfc1T2a
  iwZS9xhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bkYyeZC3ZwVVxedYu5gfEYZxcjF4eQwBNG
  iaWNn9i6GDmBnAtMEvsm+0PYJxglWid4gNhsAjoSHS+6WUBsEQF9iaWz9zCD2MICfhLPTs8Ai
  7MIqEq8evCfFcTmFXCTmH/nO1hcQkBBYsrD98wQcUGJkzOfgMWZBSQkDr54wQxRoyixfecZqP
  oKideHL0HF1SSuntvEPIGRbxaS9llI2hcwMq1itEgqykzPKMlNzMzRNTQw0DU0NNI1tARiExO
  9xCrdRL3UUt3y1OISXUO9xPJiveLK3OScFL281JJNjMCwSyk4MGEH4/7XH/QOMUpyMCmJ8jIw
  ZyYK8SXlp1RmJBZnxBeV5qQWH2KU4eBQkuDt/JORKCRYlJqeWpGWmQOMAZi0BAePkghvEhdQK
  29xQWJucWY6ROoUo6KUOG8EN1BCACSRUZoH1waLu0uMslLCvIwMDAxCPAWpRbmZJajyrxjFOR
  iVhHkTQabwZOaVwE1/BbSYCWjxb78MkMUliQgpqQYmpvgi/S+rbu/bJ3qAr3iF3qro/8VJPRM
  ebrt8ct2s0P8zC4vC5s0/ti7vzv4PWVm7yxozZN4KbtW/UbT44Rvz/BSV0nk/zigv+9pqdiBC
  /rhpV8n09++0dFxaL1eHfLOrsbx85vr0G4mnVLLNzx/lFWNk7eds4qsPry0UcLrFeCC2WDN8z
  hKv+zcPvytszfk6TcKG/4zjnWNzMvpn9Kmu/6qw8vmV89d/vL9h6rT9cRWb1dqrAmwqyz8y96
  6pObNi7haNHznyQTYahhNru8P+qWjvsFaL8TjaabiSN8/F9Kpc5ELDkjnxZZPW+KxNkyqcPXv
  NjgffAh8W31vWfS0+/nSy1oOESp7XpWyv1/ueUmIpzkg01GIuKk4EAO8/mLE2AwAA
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-8.tower-265.messagelabs.com!1634274539!416571!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 9014 invoked from network); 15 Oct 2021 05:08:59 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-8.tower-265.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 15 Oct 2021 05:08:59 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 55AAF100470
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Oct 2021 06:08:59 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 4453A10045E
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Oct 2021 06:08:59 +0100 (BST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.23; Fri, 15 Oct 2021 06:08:46 +0100
From: Zang Ruochen <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-humanize: upgrade 3.11.0 -> 3.12.0
Date: Sat, 16 Oct 2021 01:08:38 +0800
Message-ID: <1634317718-4426-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Oct 2021 05:09:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93321

Added
Add support for Python 3.10
Changed
Use importlib.metadata to get package version instead of pkg_resources.get_distribution to decrease memory consumption 
Fixed
Fix incorrect type in comment for 'when' 

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 .../{python3-humanize_3.11.0.bb => python3-humanize_3.12.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-humanize_3.11.0.bb => python3-humanize_3.12.0.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-humanize_3.11.0.bb b/meta-python/recipes-devtools/python/python3-humanize_3.12.0.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-humanize_3.11.0.bb
rename to meta-python/recipes-devtools/python/python3-humanize_3.12.0.bb
index aacda65ca5..1aecc5a967 100644
--- a/meta-python/recipes-devtools/python/python3-humanize_3.11.0.bb
+++ b/meta-python/recipes-devtools/python/python3-humanize_3.12.0.bb
@@ -5,7 +5,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=4ecc42519e84f6f3e23529464df7bd1d"
 
-SRC_URI[sha256sum] = "4160cdc63fcd0daac27d2e1e218a31bb396fc3fe5712d153675d89432a03778f"
+SRC_URI[sha256sum] = "5ec1a66e230a3e31fb3f184aab9436ea13d4e37c168e0ffc345ae5bb57e58be6"
 
 inherit pypi setuptools3
 
-- 
2.25.1


