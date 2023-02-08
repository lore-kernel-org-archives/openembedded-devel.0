Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D0D5C05027
	for <webhook@archiver.kernel.org>; Wed,  8 Feb 2023 08:11:35 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com [195.245.230.81])
 by mx.groups.io with SMTP id smtpd.web10.3793.1675843889718752025
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Feb 2023 00:11:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=PEMpPR2d;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.81, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1675843887; i=@fujitsu.com;
	bh=0pALtW+jP5buLiMuzhcY8Rzwzj5Rtf5o+VuZRYPbL8M=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=PEMpPR2dCg4ZGyBh0ESAjoGGRkgniB2I9KfQhgCpYuPkeqJDh/y6rd+oe6ANpxQ3H
	 cMtEIJ4dRlzx6EtTSY7Njztl7n+LmG3foBezckQ+wP704ChdVpwyK7qYEOoWdzcelY
	 GfSy0LvzYZTryHraQ83QXM+95CpV8lMfvQyxW3A1RxOuX+jHHuV5LgPfFWQiHyFGUR
	 1tX2E+L5bOqHdvBsnHcTtOY8pFaGIh4YuauJxZ7ixUYr+2Z2S2VpkkTMsj/eBIXyv5
	 dnz6GHjpN8pIRM9Jm1g9R8VahVZzlFt7ALG1e0A4QOT+SfTyOSK8IDY9RBw4ay5gVZ
	 fGXGCHUJuG1yQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrHIsWRWlGSWpSXmKPExsViZ8ORqKsf+Tj
  ZoKVH1uLi4aXMDowe5zauYAxgjGLNzEvKr0hgzXhw4yhzwQzuigtnHrI0MC7i6mLk4hASeMIo
  8fbgHWYI5waTxMyju4AcTiBnD6PE6oUqIDabgJTEjfv/2UBsEQF9iaWz94DVMAuoSLz43cMOY
  gsL+Es03/0MFmcBip95tpQFxOYVcJI4fWYvK4gtIaAgMeXhe2aIuKDEyZlPWCDmSEgcfPGCGa
  JGUWL25WYWCLtSovXDLyhbTeLquU3MExj5ZyFpn4WkfQEj0ypGs+LUorLUIl1DM72kosz0jJL
  cxMwcvcQq3US91FLd8tTiEl1DvcTyYr3U4mK94src5JwUvbzUkk2MwGBMKWZ+uYPxRN9fvUOM
  khxMSqK8nmKPk4X4kvJTKjMSizPii0pzUosPMcpwcChJ8EaEA+UEi1LTUyvSMnOAkQGTluDgU
  RLhjQwFSvMWFyTmFmemQ6ROMSpKifNeBekTAElklObBtcGi8RKjrJQwLyMDA4MQT0FqUW5mCa
  r8K0ZxDkYlYd6AMKApPJl5JXDTXwEtZgJaHKL6EGRxSSJCSqqBKVXDRGav4if746VrnHuKU3Z
  +W13GtE2ipGdq0CyBnDpJpplP9gjK8zRv3nvBqm1OzdU9kb2lf7s4FWcbhMyfbrUgtqZF3zr2
  W7VvZ8q+s0d388zalVZ8uUL/xaH6p25583lW2LdV+dh5n23VXPRGcfcb3pK082a2HjXh9ue+x
  x9963tN2ve/0J5Nfcvn+MWGSL664mC2bmJ7ZN0DzlvFCsGaNfnXtGecF16zJVM7cIaJ6ZxNcZ
  e3nxLvjfosHVq2VchmfoDH73WvbjO49LJ7ih5ZuMv4/QaR71YnFR4nLjXUNnf83bdLctaZ1cr
  mui9Cmsv17+5pfXfo5TX5+Tc9H93/xvIul5s1b9qxM/f5lFiKMxINtZiLihMBA9l1KEEDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-3.tower-585.messagelabs.com!1675843887!176331!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.102.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 20927 invoked from network); 8 Feb 2023 08:11:27 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-3.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 8 Feb 2023 08:11:27 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 18CC5100191
	for <openembedded-devel@lists.openembedded.org>; Wed,  8 Feb 2023 08:11:27 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 0905F10018D
	for <openembedded-devel@lists.openembedded.org>; Wed,  8 Feb 2023 08:11:27 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Wed, 8 Feb 2023 08:11:25 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-elementpath: upgrade 3.0.2 -> 4.0.1
Date: Wed, 8 Feb 2023 16:11:13 +0800
Message-ID: <1675843877-11285-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Feb 2023 08:11:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100978

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
* Fix packaging: include py.typed in package data
* Revert to comparison between xs:QName instances and strings
* First XPath 3.1 implementation (without UCA collation support)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-elementpath_3.0.2.bb => python3-elementpath_4.0.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-elementpath_3.0.2.bb => python3-elementpath_4.0.1.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-elementpath_3.0.2.bb b/meta-python/recipes-devtools/python/python3-elementpath_4.0.1.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-elementpath_3.0.2.bb
rename to meta-python/recipes-devtools/python/python3-elementpath_4.0.1.bb
index 661259f46..22de9d434 100644
--- a/meta-python/recipes-devtools/python/python3-elementpath_3.0.2.bb
+++ b/meta-python/recipes-devtools/python/python3-elementpath_4.0.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/sissaschool/elementpath"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5dbb7fb7d72da3921202dd7b995d3ecf"
 
-SRC_URI[sha256sum] = "cca18742dc0f354f79874c41a906e6ce4cc15230b7858d22a861e1ec5946940f"
+SRC_URI[sha256sum] = "1162e4c8e5501bd36291b668f4449b8125fea5ef64a26da8d71da31126725aa5"
 
 PYPI_PACKAGE = "elementpath"
 inherit pypi setuptools3
-- 
2.34.1


