Return-Path: <leimaohui@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08D83C433F5
	for <webhook@archiver.kernel.org>; Fri,  7 Jan 2022 08:25:24 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com
 [195.245.230.18])
 by mx.groups.io with SMTP id smtpd.web08.4068.1641543923167133752
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 07 Jan 2022 00:25:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=pp6Hi95Y;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.18,
 mailfrom: leimaohui@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1641543916; i=@fujitsu.com;
	bh=uBT66UHOQfGwGNYqCf0iRI8OJ6RcYexxUvA+pz4rkdI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=pp6Hi95YEc6AqVQbKHBwUIpgZYEDRyoN+tmbfqmc9Yq4hhbB9PvBlfLaZ3ieAPEZF
	 hjPXyyFbtJcqf0u4O8uLDryAj0nhTd6VrtsfsCgfmeBO+pxUY+t5POUIw5bs7dVgwa
	 OcbNllw9s86G78Iqr54iwfZ4xR+EEkvOIcx89779HdDDgewASJHKF4WEjIZAyQ8KAf
	 sFlohRaRaS6w43JJsyUnov8k4GqoP9AAYhFf2bUPj2bccVYXA6HoWo4n0cMn/bFGwC
	 xdSaXWe6YGzg9es7Ii2sJaJ48VJ/g21exy+lo7bbedzatYuCKlpZ8lA/IidKhliLZD
	 IjuUGFD172e2A==
Received: from [100.115.3.123] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-a.eu-west-1.aws.ess.symcld.net id 1C/A3-10124-CE8F7D16;
 Fri, 07 Jan 2022 08:25:16 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrKIsWRWlGSWpSXmKPExsViZ8MRovv6x/V
  Eg5UnzSwuHl7K7MDocW7jCsYAxijWzLyk/IoE1owzM+YxFTzirbiw4S17A+Mb7i5GLg4hgRlM
  Evsu3WGGcPYwSpyb28XaxcjJwSagIbF76mVmEFtEQF9i6ew9YDazgJrE0Zc/wWxhoPifvolsI
  DaLgIrEpgOHwHp5BVwkfuyawgJiSwgoSEx5+J4ZIi4ocXLmExaIORISB1+8YIaoUZJ4e2kPI4
  RdITFrVhvTBEbeWUhaZiFpWcDItIrRMqkoMz2jJDcxM0fX0MBA19DQVNdY18JML7FKN1EvtVS
  3PLW4RNdQL7G8WC+1uFivuDI3OSdFLy+1ZBMjMMRSipnDdjD+6f2pd4hRkoNJSZRX/N31RCG+
  pPyUyozE4oz4otKc1OJDjDIcHEoSvEtuAeUEi1LTUyvSMnOA4Q6TluDgURLhFQCGvBBvcUFib
  nFmOkTqFKMux+uWnzuYhVjy8vNSpcR5/38HKhIAKcoozYMbAYu9S4yyUsK8jAwMDEI8BalFuZ
  klqPKvGMU5GJWEeZeBTOHJzCuB2/QK6AgmoCNWCIMdUZKIkJJqYJoWXf+vXuLc3hU3X3ZdWuC
  28cnKXVXX45/6fZt3nHf9y3cqn/cfSLyl8lL6ecZtt/lCvakzciqsXY4wVk7ecmPF8dDoWzIG
  bYozt51w26et+Tb74EODyrLrf3t89k6quinZ7//+ofjE1grGWXonzCqc3G59933MXni9WLaE6
  /Tt9ydS7x+6d0JLlfH2zX8KOmpHNPYn2l0+cf/45Y4HISeanz1bdmCxmtsMBbMzhT/7IxllW+
  /P6Fy5LPC0+3+VTcm/DA8ZLb/4vZNFxMFz3b51Dt+V4s7quO4zCZG+xDX/r+/79elGPRGF0rO
  YFz9f1KdTmHH78daQ6Qxrrj2ROVf7wMTE4a/MbHNLkzc7Sk+eU2Ipzkg01GIuKk4EAP2dh1c4
  AwAA
X-Env-Sender: leimaohui@fujitsu.com
X-Msg-Ref: server-2.tower-585.messagelabs.com!1641543915!71915!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 12207 invoked from network); 7 Jan 2022 08:25:15 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-2.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 7 Jan 2022 08:25:15 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 2078P7vj004314
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Fri, 7 Jan 2022 08:25:15 GMT
Received: from localhost.localdomain (10.167.225.227) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Fri, 7 Jan 2022 08:25:06 +0000
From: Lei Maohui <leimaohui@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Lei Maohui <leimaohui@fujitsu.com>
Subject: [oe] [PATCH 0/3] Updated dstat command
Date: Sat, 8 Jan 2022 01:24:54 +0800
Message-ID: <1641576297-3341-1-git-send-email-leimaohui@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.227]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 07 Jan 2022 08:25:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94682

The old dstat project has been terminated(https://github.com/dstat-real/dstat).
The following projects can provide dstat function:
  - dool (A small project, forked from old dstat project)
  - pcp (A powful system performance analysis toolkit.
         Reference to Ubuntu and Fedora, dstat command is 
         provided by this project)

This patch series deledted the terminated project dstat and added two
projects dool and pcp.

Lei Maohui (3):
  dstat: Deleted terminated project.
  dool: Added a new OSS that forked from dstat project.
  pcp: Added a new recipe which provides dstat command.

 .../0001-Fix-build-error-as-following.patch   |  39 ++++
 .../dstat_0.7.4.bb => dool/dool_1.0.0.bb}     |   6 +-
 .../dstat/0001-change-dstat-to-python3.patch  |  89 -------
 .../recipes-support/pcp/pcp-native_5.3.5.bb   |  49 ++++
 meta-oe/recipes-support/pcp/pcp.inc           |  32 +++
 ...ove-unsuitble-part-for-cross-compile.patch |  45 ++++
 meta-oe/recipes-support/pcp/pcp/config.linux  |  13 ++
 meta-oe/recipes-support/pcp/pcp_5.3.5.bb      | 217 ++++++++++++++++++
 8 files changed, 398 insertions(+), 92 deletions(-)
 create mode 100644 meta-oe/recipes-support/dool/dool/0001-Fix-build-error-as-following.patch
 rename meta-oe/recipes-support/{dstat/dstat_0.7.4.bb => dool/dool_1.0.0.bb} (79%)
 delete mode 100644 meta-oe/recipes-support/dstat/dstat/0001-change-dstat-to-python3.patch
 create mode 100644 meta-oe/recipes-support/pcp/pcp-native_5.3.5.bb
 create mode 100644 meta-oe/recipes-support/pcp/pcp.inc
 create mode 100644 meta-oe/recipes-support/pcp/pcp/0001-Remove-unsuitble-part-for-cross-compile.patch
 create mode 100644 meta-oe/recipes-support/pcp/pcp/config.linux
 create mode 100644 meta-oe/recipes-support/pcp/pcp_5.3.5.bb

-- 
2.25.1


