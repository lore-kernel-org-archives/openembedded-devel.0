Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07AE0C433EF
	for <webhook@archiver.kernel.org>; Thu,  7 Jul 2022 07:03:53 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.3])
 by mx.groups.io with SMTP id smtpd.web09.2761.1657177425359263350
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 Jul 2022 00:03:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=jhkttt4Y;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.3,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1657177423; i=@fujitsu.com;
	bh=fHA+BbvPDlhvz9OKz0Xim0jWS3+EV5COztrBmmEg1wY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=jhkttt4Y5z2Q1JxzFCUfeqP4pkwKFCpmHgYAEcA5UK7fNhaYC6leCHrEsIz+wagPy
	 Z63+0g+RosJoCMJQjZVc00NzvwKybigxMiPn0sJBtgVyzrv0SlBVOLIe7XbRYNQ7KN
	 TK2E+Qg/cxtbIzHM/lZb1UiaKvsOd/Hq6ABnwvDi9hq5Gl6zuXaMOniGOv6GzUArXv
	 AIjMylqYpC1ncZd6K8IXljN4CCS2kUfNQgjqTa17fJ8dpOgYy22q/8JOCTqe4Jej4W
	 nBp/dbSWmzg3vwlekQgk2nHH9mhMvvLSeMyWAOjAdeXFXAFqlZv7SZPl7fe/iKU5qn
	 hxhPDKDaLIcFg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrEIsWRWlGSWpSXmKPExsViZ8MxSde/9Vi
  SwcQrfBYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bv9xoF6zkrTnX9ZmxgPM/RxcjFISTwhFFi
  64w5bBDOdSaJb30bWCGc3YwSO46+Y+5i5ORgE1CTmH7rBiuILSKgL7F09h6wOLOAisSL3z3sI
  LawgKdEx1uQGg4OFqB40ycxkDCvgJPEjw+LWEBsCQEFiSkP3zNDxAUlTs58wgIxRkLi4IsXzB
  A1ihKzLzdD1VdIzJixjQ3CVpO4em4T8wRG/llI2mchaV/AyLSK0TqpKDM9oyQ3MTNH19DAQNf
  Q0FTX2ELX0MhcL7FKN1EvtVS3PLW4RNdIL7G8WC+1uFivuDI3OSdFLy+1ZBMjMChTitXqdzC+
  WPlT7xCjJAeTkiivV/2xJCG+pPyUyozE4oz4otKc1OJDjDIcHEoSvItbgHKCRanpqRVpmTnAC
  IFJS3DwKInwMjYDpXmLCxJzizPTIVKnGBWlxHnvgSQEQBIZpXlwbbCovMQoKyXMy8jAwCDEU5
  BalJtZgir/ilGcg1FJmHcjyHaezLwSuOmvgBYzAS1eln8EZHFJIkJKqoEp/sY61YKPf2xS3l/
  5G/HV/qA9B6uBmvxnFt5Xn5kz8i56LWHRjc+Ntl3/6Ujvp8xM18pzr8MEM+9M1G5nSk96V3n3
  ttqUY0m2p1fMfKGzVmOrJdfX0LOTmy4ZdIWdlJQ4VsD9Lvup5JU6D07uBwlFS/ZvmJVUsClq5
  rWDlnK7JLkV/IOnhmk7Mc3/Fjcn3X22/5mZ4vO3zGew8tjmmVWZ8aVDq7ild/+2xO07nxepqz
  Vf2dT33JqzU1DvYnPvkSS1o+bLXI+JTPuxTvt2w/Xytb3JWcm3mOK0+sK35M8x/h/5aUqS296
  lv3zmrjN0mN3yd8Pn9ryjh5p4S7U6+NZx8DCpZXkEnmSWnNewrlqJpTgj0VCLuag4EQBaHK46
  RQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-4.tower-571.messagelabs.com!1657177423!24358!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 17027 invoked from network); 7 Jul 2022 07:03:43 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-4.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 7 Jul 2022 07:03:43 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id D3A0E1000CE
	for <openembedded-devel@lists.openembedded.org>;
 Thu,  7 Jul 2022 08:03:42 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id C5355100077
	for <openembedded-devel@lists.openembedded.org>;
 Thu,  7 Jul 2022 08:03:42 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 7 Jul 2022 08:03:41 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] openconnect: upgrade 8.20 -> 9.01
Date: Thu, 7 Jul 2022 15:03:21 +0800
Message-ID: <1657177403-28456-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 07 Jul 2022 07:03:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97747

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../openconnect/{openconnect_8.20.bb => openconnect_9.01.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-connectivity/openconnect/{openconnect_8.20.bb => openconnect_9.01.bb} (94%)

diff --git a/meta-networking/recipes-connectivity/openconnect/openconnect_8.20.bb b/meta-networking/recipes-connectivity/openconnect/openconnect_9.01.bb
similarity index 94%
rename from meta-networking/recipes-connectivity/openconnect/openconnect_8.20.bb
rename to meta-networking/recipes-connectivity/openconnect/openconnect_9.01.bb
index 022ba85a2..afdbdca4e 100644
--- a/meta-networking/recipes-connectivity/openconnect/openconnect_8.20.bb
+++ b/meta-networking/recipes-connectivity/openconnect/openconnect_9.01.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING.LGPL;md5=8c2e1ec1540fb3e0beb68361344cba7e"
 SRC_URI = " \
     git://git.infradead.org/users/dwmw2/openconnect.git;branch=master \
 "
-SRCREV = "03a3b9c76a9b6d0a65073b6bebbc1192e3445507"
+SRCREV = "5695cd6b0c7d42ca293ce0f00abcbe3d1ec4e609"
 
 DEPENDS = "vpnc libxml2 krb5 gettext-native"
 RDEPENDS:${PN} = "bash python3-core vpnc-script"
-- 
2.25.1


