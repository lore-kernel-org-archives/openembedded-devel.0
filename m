Received: from mail3.bemta25.messagelabs.com (mail3.bemta25.messagelabs.com [195.245.230.85])
 by mx.groups.io with SMTP id smtpd.web08.5265.1631181445390558845
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Sep 2021 02:57:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=b62p3AWa;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.85, mailfrom: zangrc.fnst@fujitsu.com)
Return-Path: <zangrc.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1631181443; i=@fujitsu.com;
	bh=4oDkPAMFw0JGR84tx6UiHf4LClfR3DVNh9jNr/EHgVM=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=b62p3AWaSBBcZrvJrXtg1iF1ifkkbpDEOsECdcBc2iRpI/uMzUbSMv7BXDfp1oNal
	 CEamXnfvrjUltpBm84ehisBVKXWDefvX5IJ9LHr2y+E8xWelQwgNIKdcu24DVNEiVv
	 HLsUcXQReucVE4iPZ6ipwMvHI3JtLXdakdgNYPA/N71fIkKryBFlaCxMIHN+Yaaz9i
	 5ay1sf4WC8QMVxL7UmIPAmzz6I70pehyeUOA/cv6tLuwmB1FkgzhqC4i6z1qdYoBA7
	 ZH8l+pGRk0rasUOGCufX9Bszs09jseoh7uRYsAdBXbluAcfimPWBBeQrg9hmytAgGM
	 Mn5MBmm3GRhYg==
Received: from [100.112.196.248] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-5.bemta.az-b.eu-west-1.aws.symcld.net id 64/D5-19003-38AD9316; Thu, 09 Sep 2021 09:57:23 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupgkeJIrShJLcpLzFFi42Kxs+EI0W26ZZl
  o0PNF0eLi4aXMDowe5zauYAxgjGLNzEvKr0hgzTj5exJ7wWu+isu9Mg2M23m7GLk4hARmMUlM
  +HORrYuRA8g5zihxO6SLkZODTUBHouNFNwuILSKgL7F09h5mEFtYwF/i09k+RhCbRUBVomnNe
  rAaXgE3iVkHv7GB2BICChJTHr5nhogLSpyc+QSshllAQuLgixfMEDWKEtt3nmGBsCskXh++xD
  yBkWcWkpZZSFoWMDKtYjRPKspMzyjJTczM0TU0MNA1NDTSNbS01DW00Eus0k3SSy3VLU8tLtE
  11EssL9YrrsxNzknRy0st2cQIDKCUguNCOxjfvP6gd4hRkoNJSZTX7KZlohBfUn5KZUZicUZ8
  UWlOavEhRhkODiUJ3oTrQDnBotT01Iq0zBxgMMOkJTh4lER41UDSvMUFibnFmekQqVOMilLiv
  JYgMwVAEhmleXBtsAi6xCgrJczLyMDAIMRTkFqUm1mCKv+KUZyDUUmY9zDIFJ7MvBK46a+AFj
  MBLfa9ZgGyuCQRISXVwMR0fwn7g4Az8/jF7uysE9CeKcN2YfO50DDbbeePG074Z3JB/07tcb/
  oL49uHuz4EbLl7L/PT9t+BcgzqeafZ8oqS5rs/W+pTGiUVP4y5RtTdvhOtu+sa33Kru/z8mRO
  Md+5nheL9f7Eh7w5oHZhV9Zshoqv9m9+CQtuuLdqyZtM8btyto+X/jqu/0va6Oesiae5q3i3b
  uI6lOZh4XT0hufdt6kRexz/CtkeveOy4TRf/ht9eS49pl8X63PeXzatup+vZhS89denxG15BR
  FGN/j6ogS3XZ6uqCb54FmFGmNIVcKaRWFPjrbdubTQTmUCp8rSea08rMX5nKb31uxc25c776n
  P9PyLa4M3KLhE3uZSYinOSDTUYi4qTgQA1xgIpBsDAAA=
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-7.tower-285.messagelabs.com!1631181442!76904!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 21507 invoked from network); 9 Sep 2021 09:57:22 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-7.tower-285.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 9 Sep 2021 09:57:22 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1899vMZV002816
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 9 Sep 2021 10:57:22 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.23; Thu, 9 Sep 2021 10:57:20 +0100
From: "zangrc" <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-transitions: upgrade 0.8.8 -> 0.8.9
Date: Fri, 10 Sep 2021 05:57:14 +0800
Message-ID: <1631224634-4685-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Release 0.8.8 is a minor release and contains a bugfix for HSM, a feature for `GraphSupport` and changes internal cache handling:

- Bugfix #544: `NestedEvent` now wraps the machine's scope into partials passed to `HierarchicalMachine._process`. This prevents queued transitions from losing their scope.
- Feature #533: `(A)Graph.draw` function (object returned by `GraphMachine.get_graph()`) can be passed a file/stream object as first parameter or `None`. The later will result in `draw` returning a binary string. (thanks @Blindfreddy).
- Feature #532: Use id(model) instead of model for machine-bound caches in `LockedMachine`, `AsyncMachine` and `GraphMachine`. This might influence pickling (thanks @thedrow).

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 ...hon3-transitions_0.8.8.bb => python3-transitions_0.8.9.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-transitions_0.8.8.bb => python3-transitions_0.8.9.bb} (61%)

diff --git a/meta-python/recipes-devtools/python/python3-transitions_0.8.8.bb b/meta-python/recipes-devtools/python/python3-transitions_0.8.9.bb
similarity index 61%
rename from meta-python/recipes-devtools/python/python3-transitions_0.8.8.bb
rename to meta-python/recipes-devtools/python/python3-transitions_0.8.9.bb
index ddb66ff7f6..178dfad3f3 100644
--- a/meta-python/recipes-devtools/python/python3-transitions_0.8.8.bb
+++ b/meta-python/recipes-devtools/python/python3-transitions_0.8.9.bb
@@ -4,6 +4,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=baac7be1f4c17620df74188e23da6d47"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "e7a86b31a161a76133f189b3ae9dad2755a80ea4c1e0eee1805648d021fb677d"
+SRC_URI[sha256sum] = "fc2ec6d6b6f986cd7e28e119eeb9ba1c9cc51ab4fbbdb7f2dedad01983fd2de0"
 
-RDEPENDS:${PN} += "python3-six"
+RDEPENDS:${PN} += "python3-six python3-logging"
-- 
2.25.1

