Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3D84C05027
	for <webhook@archiver.kernel.org>; Wed,  8 Feb 2023 08:10:15 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com [195.245.230.82])
 by mx.groups.io with SMTP id smtpd.web11.3754.1675843809590868557
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Feb 2023 00:10:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=E5PnJB52;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.82, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1675843808; i=@fujitsu.com;
	bh=VT1rPSbMJOgaqGx8DwpMhxYy2Ge6JVFqcoV/IahnItg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=E5PnJB52KPFIJZ0GAfi6Vq+jyiR/rOPjC0lJgUfiIU/83u5omkQ2ZWPloYz4gOUbV
	 iJa0ZIF9tzPt4TCnet1GWJRrsInyeOJQ6FdhAsvAmfBqRyZ83ekL8zzXd7iFLsm2F9
	 cCXMntpqI+EvZleWoyhFRhFvKW2ND9gmpdZ43yV1xMDSpkSe7C62fczcN0pz+ZAH2E
	 TfMLJflMZhRFKBE1+uQQHYGmsBxcHxdS98InGMkmzWPjxUBB69uo2L944DNeueO3jW
	 jJYVjPHRmD6PJUBK8fMq44KmBrT6lOYZ9V7FoSgynHWC8T9JjtiPRyBJYAO2zfBK47
	 iDtwQoaWmEleg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrGIsWRWlGSWpSXmKPExsViZ8MxSfd+xON
  kg+bFChYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8a2FeuZC+bzVtyYfoy1gfEvdxcjF4eQwBNG
  iTfbJjB3MXICOTeYJOb1SUEk9jBKPPw0ix0kwSYgJXHj/n82EFtEQF9i6ew9YA3MAioSL373g
  NUIC3hKvNr4BqyGBSi+4+x3RhCbV8BJYsXDHrC4hICCxJSH78F6OQWcJV69mcIGsdhJovXzKW
  aIekGJkzOfsEDMl5A4+OIFM0SvosTsy80sEHalROuHX1C2msTVc5uYJzAKzkLSPgtJ+wJGplW
  MZsWpRWWpRbqGpnpJRZnpGSW5iZk5eolVuol6qaW65anFJbqGeonlxXqpxcV6xZW5yTkpenmp
  JZsYgcGbUswSv4PxWt9fvUOMkhxMSqK8nmKPk4X4kvJTKjMSizPii0pzUosPMcpwcChJ8EaEA
  +UEi1LTUyvSMnOAkQSTluDgURLhjQwFSvMWFyTmFmemQ6ROMSpKifNeBekTAElklObBtcGi9x
  KjrJQwLyMDA4MQT0FqUW5mCar8K0ZxDkYlYd6AMKApPJl5JXDTXwEtZgJaHKL6EGRxSSJCSqq
  BaaJU947d68zdYxyP+Cz8MMGqJU7r16+IzlmTeX4uWbbw9QyjWeYlD79wfLydfG7irYB1l+Tr
  /sUs271MicvZlP/Xk6ydnn4H+33Zzk6++C+85+kENZ9/qw4vFawoMXCs7Jl9W3bd48kSn7tdq
  9k++HJE7D7+JVVPNqZ0q97nWSqnb85o0lZYZG03q5lzYU3uBBWdICu1txr7528JXlvw+n/kHq
  +aE4t90nIe6Cq3bBELuSm96Psy9dmOH7eXXu8sYfV9vi+DX8dCv2T7/U3TFpn//F/vPudF1yc
  T+ae3I34sFqi4cFQnhHd/8ImZu3/PzeNfUnnozAKT7M8f5950t+bKd5/uvLuiw/7CPqufS2cr
  sRRnJBpqMRcVJwIAUzLx1VkDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-24.tower-585.messagelabs.com!1675843807!489665!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.102.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 15785 invoked from network); 8 Feb 2023 08:10:07 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-24.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 8 Feb 2023 08:10:07 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 1D1861000D2
	for <openembedded-devel@lists.openembedded.org>; Wed,  8 Feb 2023 08:10:07 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 1130A1000C1
	for <openembedded-devel@lists.openembedded.org>; Wed,  8 Feb 2023 08:10:07 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Wed, 8 Feb 2023 08:10:05 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-cmd2: upgrade 2.4.2 ->  2.4.3
Date: Wed, 8 Feb 2023 16:09:51 +0800
Message-ID: <1675843794-11226-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1675843794-11226-1-git-send-email-wangmy@fujitsu.com>
References: <1675843794-11226-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Feb 2023 08:10:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100974

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Copyright year updated to 2023.

Changelog:
==========
* Bug Fixes
  * Fixed ValueError caused when passing 'Cmd.columnize()' strings wider than 'display_width'.
* Enhancements
  * Renamed 'utils.str_to_bool()' -> 'utils.to_bool()'.
  * Enhanced 'utils.to_bool()' so that it accepts and converts 'bool', 'int', and 'float' in addition to 'str'.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-cmd2_2.4.2.bb => python3-cmd2_2.4.3.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-cmd2_2.4.2.bb => python3-cmd2_2.4.3.bb} (74%)

diff --git a/meta-python/recipes-devtools/python/python3-cmd2_2.4.2.bb b/meta-python/recipes-devtools/python/python3-cmd2_2.4.3.bb
similarity index 74%
rename from meta-python/recipes-devtools/python/python3-cmd2_2.4.2.bb
rename to meta-python/recipes-devtools/python/python3-cmd2_2.4.3.bb
index d2434b626..29d790b94 100644
--- a/meta-python/recipes-devtools/python/python3-cmd2_2.4.2.bb
+++ b/meta-python/recipes-devtools/python/python3-cmd2_2.4.3.bb
@@ -1,11 +1,11 @@
 SUMMARY = "Extra features for standard library's cmd module"
 HOMEPAGE = "https://github.com/python-cmd2/cmd2"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=209e288518b0668115f58c3929af9ff1"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=fad7740aa21780c8b9a214f5b320b4ad"
 
 DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
 
-SRC_URI[sha256sum] = "073e555c05853b0f6965f3d03329babdf9e38a5f2cea028e61a64cd7eeb74ad5"
+SRC_URI[sha256sum] = "71873c11f72bd19e2b1db578214716f0d4f7c8fa250093c601265a9a717dee52"
 
 inherit pypi setuptools3
 
-- 
2.34.1


