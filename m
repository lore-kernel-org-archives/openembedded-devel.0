Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.115])
 by mx.groups.io with SMTP id smtpd.web08.3878.1625188790233028762
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 01 Jul 2021 18:19:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=fmzF4HVl;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.115, mailfrom: zangrc.fnst@fujitsu.com)
Return-Path: <zangrc.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1625188787; i=@fujitsu.com;
	bh=l/HyH0MBQ064iVQONtWKBOiCpDmNtnF8kghE6vWbfSM=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=fmzF4HVlU2gP1CZaZcF1GVbhV4Jz2Kq8JjfVZ8EoEdjkmJ/6lQT9AMt9HXWuUTguU
	 9RaNhDkqQQzR7QJCQU7pvwOJ1KRAxs20ZcFD3TtF7zA57YFq/I1DTja+at/OdMrUaw
	 aIC+YVsr2bh5DnvtXvahPXDYzda1+fcCuMe1neFFp/S9OV+NUp3RxiW4poGy33i3Ku
	 tycujpbnzSN1mK7k8VR00ImFCBs6TmhUTjT9T9SOwj0PIseEMxWUq0c0CFFOKvyDoc
	 8pneHa8nbETVaGC720QNQMggnPzln+AqBmqdT5vI4bvvpbaurDpSBVDEAzm/yq+xkw
	 XB2+/aoLBt9Og==
Received: from [100.113.4.179] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-b.eu-central-1.aws.symcld.net id 3C/2D-07224-3B96ED06; Fri, 02 Jul 2021 01:19:47 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuphkeJIrShJLcpLzFFi42Kxs+EI1d2ceS/
  B4MJeJouLh5cyOzB6nNu4gjGAMYo1My8pvyKBNaP3rGPBHdaKS9svMDcwTmXtYuTiEBKYxSSx
  aekjFgjnOKPEnV8v2boYOTnYBHQkOl50s4DYIgL6Ektn72EGsYUFPCXuzX/BCGKzCKhIzDjcw
  g5i8wq4S3y/cZ0VxJYQUJCY8vA9M0RcUOLkzCdgc5gFJCQOvnjBDFGjKLF95xkWCLtCYsaMbW
  wTGHlmIWmZhaRlASPTKkbLpKLM9IyS3MTMHF1DAwNdQ0NjXVNdQ1NjvcQq3SS91FLd5NS8kqJ
  EoKxeYnmxXnFlbnJOil5easkmRmAgpRSyztzB+On1B71DjJIcTEqivAfO3U0Q4kvKT6nMSCzO
  iC8qzUktPsQow8GhJME7IeNegpBgUWp6akVaZg4wqGHSEhw8SiK88SBp3uKCxNzizHSI1ClGR
  Slx3hvpQAkBkERGaR5cGyySLjHKSgnzMjIwMAjxFKQW5WaWoMq/YhTnYFQS5o0FmcKTmVcCN/
  0V0GImoMWnb94FWVySiJCSamBaWrxk0/RjqZmfeYNOCVVNOKNgt+ql9xnbVdND+03srpRsm6f
  4XHMD92vm7J1hM+ZOE12gVtSV5CdnKz6D+dO7xOuT73ef0kv8urS480iAxqHV9a+2LxecW3D/
  Gqv48aMixcEHlKRUZ1m5Xttt/GmBhPxR1b+iYVuUDP9tvytxh8loxo/EV2dPzJrr+rbmfJeV2
  9oZqyLnKn6bNoN1yyyVj5eZuC26OtfKKF5a1qut1btVrnPB4TkNhc6z1DTyfgiksTPOqpv+68
  HRAPYF+mfF9geu5fDliPx7sGi1+Sfj03uYRcz/W5TmLLsZtMEoe26h96Q9U4qm6vqf59YL+ZC
  37VyWbJfDH23HaWUqxgqzlFiKMxINtZiLihMB5oowbR8DAAA=
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-12.tower-248.messagelabs.com!1625188786!31070!1
X-Originating-IP: [62.60.8.85]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 16464 invoked from network); 2 Jul 2021 01:19:46 -0000
Received: from unknown (HELO mailhost4.uk.fujitsu.com) (62.60.8.85)
  by server-12.tower-248.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 2 Jul 2021 01:19:46 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost4.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1621Jds9023186
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Fri, 2 Jul 2021 02:19:46 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Fri, 2 Jul 2021 02:19:37 +0100
From: "zangrc" <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] can-utils: upgrade 2020.12.0 -> 2021.06.0
Date: Fri, 2 Jul 2021 09:19:29 +0800
Message-ID: <1625188769-50922-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 meta-oe/recipes-extended/socketcan/can-utils_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-extended/socketcan/can-utils_git.bb b/meta-oe/recipes-extended/socketcan/can-utils_git.bb
index 3b2b6a9da1..36e7d1ef57 100644
--- a/meta-oe/recipes-extended/socketcan/can-utils_git.bb
+++ b/meta-oe/recipes-extended/socketcan/can-utils_git.bb
@@ -6,9 +6,9 @@ DEPENDS = "libsocketcan"
 
 SRC_URI = "git://github.com/linux-can/${BPN}.git;protocol=git"
 
-SRCREV = "eb66451df280f95a9a12e78b151b8d867e1b78ed"
+SRCREV = "e9dd86fa5c4e6ecdfc34e487634a32f19e5c4d63"
 
-PV = "2020.12.0"
+PV = "2021.06.0"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1

