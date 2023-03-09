Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C20F9C6FD1C
	for <webhook@archiver.kernel.org>; Thu,  9 Mar 2023 09:09:19 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com [195.245.230.82])
 by mx.groups.io with SMTP id smtpd.web11.9024.1678352958140856663
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Mar 2023 01:09:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=eiJnE8iK;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.82, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1678352956; i=@fujitsu.com;
	bh=wVKWEC/gM2HVvR1SneIm7BbyuWOvOMjprwHXenZofTM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=eiJnE8iK9AZdgRKPUBxa1n5+n11W1ITDF7mWpx9XN4Bs/YrIos8Gq7owUlMsE/f3M
	 PPVhapy3exiJpPbTSO6Ag3m8xKcslFEr974AdsOQrovp3pG8nA2ZqSUcwHJhyNyi+W
	 dfaJ4HagDrgREWBoILmZBonK3VnVAQURCc5DevOLhUCSuipiYqtzJIpZfAAk5KNwaL
	 a+4aoSZU8PRgjjG3pbm55yk7ETenlRbmE4QXoAvuiLe9HI4AlfrSnkB3YSNvLVPa1d
	 duNcPrfux4/Myb+oxcmUEl+2HluRzJZZm710bitZkLS22f3u6tVbUX0sUEGaGYvE8B
	 mh2DTkAjoC7jg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrKIsWRWlGSWpSXmKPExsViZ8OxWddmEWe
  KwfENrBYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa0brJKeCu9wV3/tPMDcw3ufqYuTiEBJ4yChx
  acs8RgjnKpPE2mNnmLsYOYGcPYwS7yYLgdhsAlISN+7/ZwOxRQT0JZbO3gNWwyygIvHidw87i
  C0sECNxZPoeVhCbBSg++1YLWD2vgJNE07ouRhBbQkBBYsrD92C9nALOEve3t7FC7HKSOHDvAy
  tEvaDEyZlPWCDmS0gcfPGCGaJXUWL25WYWCLtSovXDLyhbTeLquU3MExgFZyFpn4WkfQEj0yp
  Gs+LUorLUIl1DY72kosz0jJLcxMwcvcQq3US91FLd8tTiEl1DvcTyYr3U4mK94src5JwUvbzU
  kk2MwNBNKWaN28H4ve+v3iFGSQ4mJVHebjbOFCG+pPyUyozE4oz4otKc1OJDjDIcHEoSvEvnA
  +UEi1LTUyvSMnOAcQSTluDgURLh7Z8NlOYtLkjMLc5Mh0idYlSUEuctBekTAElklObBtcFi9x
  KjrJQwLyMDA4MQT0FqUW5mCar8K0ZxDkYlYV7nOUBTeDLzSuCmvwJazAS0eNcWDpDFJYkIKak
  GpkSbqxLO6qo3yyOT72d9Ns3nvBBa71E2+X+FxvaPe1KmMxfaf9VrfC+27tc/loNG7D/cjLwm
  KRrWuM5f9yDgo3u01xMxs6ciMuuvR8VduvvpxMrXb/QfFcoWSN7cw6Cbs6vhWbWV5Naz3/I1T
  i6YMm25nm/QkqeL1e5e6tIX/7nk3wnnOcsZwivmOgdMzRUS+lUTk1jQeS/17jcWVQkz5zzTDr
  MW1Vj2iwYM+tsj183fzCz16abQDg5W/s/nObW2XFiTsPX/wYQKue21L6Mu1KVLvnASWX60rru
  Ph/v8DTsmwXZ2ZZeSuoPxss+3rvrxu+D7g2fBIneC5qY1fNF+wPv0Xt+60giHVnuNyj+PlFiK
  MxINtZiLihMBD5bMwlgDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-17.tower-585.messagelabs.com!1678352955!529384!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.103.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 31936 invoked from network); 9 Mar 2023 09:09:16 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-17.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 9 Mar 2023 09:09:16 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id AF1E5155
	for <openembedded-devel@lists.openembedded.org>; Thu,  9 Mar 2023 09:09:15 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id A34CA152
	for <openembedded-devel@lists.openembedded.org>; Thu,  9 Mar 2023 09:09:15 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Thu, 9 Mar 2023 09:09:14 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 04/11] python3-charset-normalizer: upgrade 3.0.1 -> 3.1.0
Date: Thu, 9 Mar 2023 17:08:36 +0800
Message-ID: <1678352916-32505-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1678352916-32505-1-git-send-email-wangmy@fujitsu.com>
References: <1678352916-32505-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Mar 2023 09:09:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101450

From: Wang Mingyu <wangmy@fujitsu.com>

Added
-----
 Argument should_rename_legacy for legacy function detect and disregard any new arguments without errors (PR #262)

Removed
-------
 Support for Python 3.6 (PR #260)

Changed
-------
 Optional speedup provided by mypy/c 1.0.1

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...-normalizer_3.0.1.bb => python3-charset-normalizer_3.1.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-charset-normalizer_3.0.1.bb => python3-charset-normalizer_3.1.0.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-charset-normalizer_3.0.1.bb b/meta-python/recipes-devtools/python/python3-charset-normalizer_3.1.0.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-charset-normalizer_3.0.1.bb
rename to meta-python/recipes-devtools/python/python3-charset-normalizer_3.1.0.bb
index 0a48ae97d..27bd625b4 100644
--- a/meta-python/recipes-devtools/python/python3-charset-normalizer_3.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-charset-normalizer_3.1.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/ousret/charset_normalizer"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0974a390827087287db39928f7c524b5"
 
-SRC_URI[sha256sum] = "ebea339af930f8ca5d7a699b921106c6e29c617fe9606fa7baa043c1cdae326f"
+SRC_URI[sha256sum] = "34e0a2f9c370eb95597aae63bf85eb5e96826d81e3dcf88b8886012906f509b5"
 
 inherit pypi setuptools3
 
-- 
2.34.1


