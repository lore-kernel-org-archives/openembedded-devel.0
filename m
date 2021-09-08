Received: from mail3.bemta25.messagelabs.com (mail3.bemta25.messagelabs.com [195.245.230.85])
 by mx.groups.io with SMTP id smtpd.web10.5349.1631181418774932935
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Sep 2021 02:56:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=CkZobKwr;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.85, mailfrom: zhengrq.fnst@fujitsu.com)
Return-Path: <zhengrq.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1631181417; i=@fujitsu.com;
	bh=fS0UGQywjb+DF4ECMYyM5bvq3/j53dFsmO/E713ACWs=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=CkZobKwr8TghwqVSZUh6vWyJe2vXa3lIgjbpIxUQlEK2lQyy0l298Za05WsuiKGXR
	 qZEFiD0l6k+GCvro4ucd/I0QmpnnzrelXeOy41c/jlT7P1BJqv6pUU/Cz2pQgxsM+V
	 4n48LLBBzxZND8F6clpNXtK/0G//iUqsbUpCwB2MLkDJVZh3laJrnUNqJh+d972ZUE
	 KtZn4r/OEVlJhxiHVJsB4xJzGwA2aeG280N99QVc3RHceZx5pj4/xa+7Rsoy/cfOZH
	 RBJH2+7ffB0/t5zKEa/C6jDLJgdK+chc7dbpHCnrbQXPYD9HMQNPSlAwWnfjxbxt1j
	 ASxLkMyRtoeEg==
Received: from [100.112.197.4] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-5.bemta.az-b.eu-west-1.aws.symcld.net id 97/54-19003-86AD9316; Thu, 09 Sep 2021 09:56:56 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrIIsWRWlGSWpSXmKPExsViZ8MRqptxyzL
  RYG+3tsXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmnFsUhdrwRLBiuUL1jA1MM7k72Lk4hASmMUk
  8X3FCUYIZzejxOXnq5m7GDk52AR0Jc49XssOYosI6Essnb0HLC4sYC9xpb2JFcRmEVCR6N8wh
  QnE5hXwlJjx6jJYjYSAgsSUh++ZIeKCEidnPmEBsZkFJCQOvngBFOcAqlGUmD1dHqK8QuL14U
  vMExh5ZiHpmIWkYwEj0ypGi6SizPSMktzEzBxdQwMDXUNDI11DS0tdIyNzvcQq3SS91FLd8tT
  iEl1DvcTyYr3iytzknBS9vNSSTYzAMEopOP54B+OKNx/0DjFKcjApifKa3bRMFOJLyk+pzEgs
  zogvKs1JLT7EKMPBoSTBm3AdKCdYlJqeWpGWmQMMaZi0BAePkgivGkiat7ggMbc4Mx0idYoxn
  OPN2iWLmDnegsm2e3eBZDuYnLng4Gpmjllg8n77ISD5AEQKseTl56VKifNaglwiADIuozQPbh
  ksZi8xykoJ8zIyMDAI8RSkFuVmlqDKv2IU52BUEuY9DDKFJzOvBO6mV0DnMgGd63vNAuTckkS
  ElFQDk/DSt3O091/lWmX4+dG7yZPq3x96wFSZpZ/V/Prq49e714s+OuLpW+USYPnyf1opo0Vs
  U9QuZ+1jhW5mCtE+PVtDztSve9y7qIfJMdF3ohiDd+bLj7FiS7LmnnL/br9r98dD292fq7n+M
  1ZqOBOS90TSlUHU2Ea/J1M++vs7do2Hf13Yku8uX7Lpw7eq7CdJv85vyihRuJT87dzabx7reW
  /cbKkwWbv6ocAxiTO+d3b9rAlkbTQ4ys38+MV7jazVvOFmU/3kdvuGuAqaX4jsu2r1KC499cv
  v9ZVR0iLz29czxS16fEntRNPtNxslN1Q/0v16XHkLn1pCldzJ+5fMUq0Os7YGpkrI3o2ZUdEz
  R4mlOCPRUIu5qDgRALkujw5UAwAA
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-7.tower-285.messagelabs.com!1631181416!76856!1
X-Originating-IP: [62.60.8.85]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 19093 invoked from network); 9 Sep 2021 09:56:56 -0000
Received: from unknown (HELO mailhost4.uk.fujitsu.com) (62.60.8.85)
  by server-7.tower-285.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 9 Sep 2021 09:56:56 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost4.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1899uuiu020603
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 9 Sep 2021 10:56:56 +0100
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.23; Thu, 9 Sep 2021 10:56:55 +0100
From: "zhengruoqin" <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] libbytesize: upgrade 2.4 -> 2.6
Date: Wed, 8 Sep 2021 15:07:26 +0800
Message-ID: <1631084846-101126-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Libbytesize 2.6
---------------
Hela Basa (1):
- Added translation using Weblate (Sinhala)
Ricky Tigg (1):
- Translated using Weblate (Finnish)
Vojtech Trefny (3):
- Sync spec with downstream
- Squashed 'translation-canary/' changes from fccbb1b..4d4e65b
- Make sure Size can be interpreted as integer in Python 3.10
Weblate (1):
- Update translation files
simmon (2):
- Added translation using Weblate (Korean)
- Translated using Weblate (Korean)

Libbytesize 2.5
---------------
Adolfo Jayme Barrientos (2):
- Translated using Weblate (Spanish)
- Translated using Weblate (Asturian)
Ricky Tigg (1):
- Translated using Weblate (Finnish)
Vojtech Trefny (6):
- Sync spec with downstream
- travis: Add --nogpgcheck when using dnf on Fedora
- bscalc: Add option to print only single "human readable" result
- tests: Run pylint and pycodestyle on bscalc
- travis: Print logs after failed tests
- tools: Read input from stdin when not running in a tty
Weblate (1):
- Update translation files
Yaron Shahrabani (2):
- Added translation using Weblate (Hebrew)
- Translated using Weblate (Hebrew)
gururajrkatti (1):
- Add support to ppc64le for debian build

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../libbytesize/{libbytesize_2.4.bb => libbytesize_2.6.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/libbytesize/{libbytesize_2.4.bb => libbytesize_2.6.bb} (93%)

diff --git a/meta-oe/recipes-support/libbytesize/libbytesize_2.4.bb b/meta-oe/recipes-support/libbytesize/libbytesize_2.6.bb
similarity index 93%
rename from meta-oe/recipes-support/libbytesize/libbytesize_2.4.bb
rename to meta-oe/recipes-support/libbytesize/libbytesize_2.6.bb
index ba21ffaf02..118259e4fd 100644
--- a/meta-oe/recipes-support/libbytesize/libbytesize_2.4.bb
+++ b/meta-oe/recipes-support/libbytesize/libbytesize_2.6.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=c07cb499d259452f324bb90c3067d85c"
 S = "${WORKDIR}/git"
 B = "${S}"
 
-SRCREV = "732ee8d28492e4bc9b52c29bcb81a5c19388d002"
+SRCREV = "c9864f4dd03736839f40d225da494cb1eb64e654"
 SRC_URI = "git://github.com/rhinstaller/libbytesize;branch=master"
 
 inherit gettext autotools python3native
-- 
2.25.1

