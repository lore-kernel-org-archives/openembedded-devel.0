Return-Path: <xuhuan.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C7C2C433EF
	for <webhook@archiver.kernel.org>; Thu, 12 May 2022 09:20:32 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web10.2111.1652347225509585235
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 May 2022 02:20:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=jmqIt0Q4;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113,
 mailfrom: xuhuan.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1652347223; i=@fujitsu.com;
	bh=qSfz6Yp3ZmsekB4WGJAb7uDxvwoqrOdjZQ0xTRBVPXs=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=jmqIt0Q48Y9gImztdMtIsk31URkxY4WYHmn1Tojh9zLeI/AHfADXCCSxvL5eQTz3V
	 sSOsRFmkb2P4lz3Ct8BZxYwMzznG/anWIWzs2I0Y/wRBeSH4+FhTIZVAp7YiDnTly6
	 cV4F5WDliyOZvtaPRA72z5lTSvEHl1lRlt851WCQXvsOWxMuaCHDHLqua7uvfsizpG
	 DItsRGYe7BarTXQUmWDrEpNxBgmaMyvESSoTztvu2Ul24rKWwkH+OQNE90jZC7EuBC
	 QzaQ+kRsdyv0UbVfySntp1WZuTWr+BF9dtN7MxDmxAGqSjaEn7wuuvm0niSP+e/52o
	 wK9OXFuUOne5w==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrKIsWRWlGSWpSXmKPExsViZ8MxSTf8Yk2
  Swe0PwhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bcr1fYCrZwVlyaMJ+tgfE2RxcjJ4eQwBNG
  iY/XFboYuYDsC0wSc9v2skI4Jxkl1m78xAhSxSagLvH45mswW0RAX2Lp7D3MIDazgKpE98U17
  CC2sICnxONvq1lAbBag+I3Zr1hBbF4BN4lj+/6C9UoIKEhMefieGSIuKHFy5hMWiDkSEgdfvG
  CGqFGSOLHiIxOEXSHx+vAlqLiaxNVzm5gnMPLPQtI+C0n7AkamVYy2SUWZ6RkluYmZObqGBga
  6hoamumYWukYmeolVuol6qaW6yal5JUWJQFm9xPJivdTiYr3iytzknBS9vNSSTYzA0EwpdpHY
  wXiz76feIUZJDiYlUd5z52uShPiS8lMqMxKLM+KLSnNSiw8xynBwKEnw7jwHlBMsSk1PrUjLz
  AHGCUxagoNHSYS3GCTNW1yQmFucmQ6ROsWoKCXO+2EfUEIAJJFRmgfXBovNS4yyUsK8jAwMDE
  I8BalFuZklqPKvGMU5GJWEeU+DXMaTmVcCN/0V0GImoMX7XStBFpckIqSkGphq51XteGO9K+T
  L6uAPPUl+vXtfRoXdemi//fQl/dVTTwbcnzR1gunKOVNamZ7JxDD9v6FbG7OEq+Ptvtj+3TvF
  W1Ib/l79J6mXVh+SFx96La6dc/8RVb4LrX+Xr9rqrlng0PHbW2Xyee9LBzQOnd/37cVFm5sMx
  3u5ChgNPz/xeMHZt/0yz/dy/neLH1y6ZHXQuEA0R9C7U61U4aH/iQ3L0syq7y3Vi3kc8auRa5
  /Vp86g+Y4Gh7OyX97szDD4m3+vUyjm4pwrwkb2t+fObdmx09f0D1vqbq+U2ilsAguq7R23iZ3
  YZC7O+0/IyE5Y9voLxryf15ex9D59djreskST12LzzTl151Y/lzMMKL2kxFKckWioxVxUnAgA
  FKmhLUgDAAA=
X-Env-Sender: xuhuan.fnst@fujitsu.com
X-Msg-Ref: server-6.tower-528.messagelabs.com!1652347223!63511!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 13894 invoked from network); 12 May 2022 09:20:23 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-6.tower-528.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 12 May 2022 09:20:23 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id D59A0100453
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 May 2022 10:20:22 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id C7E4D1000FF
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 May 2022 10:20:22 +0100 (BST)
Received: from localhost.localdomain.localdomain (10.167.225.131) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 12 May 2022 10:20:17 +0100
From: XU Huan <xuhuan.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Xu Huan <xuhuan.fnst@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-cbor2: upgrade 5.4.2 -> 5.4.3
Date: Thu, 12 May 2022 17:20:07 +0800
Message-ID: <1652347207-2483-1-git-send-email-xuhuan.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.131]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 12 May 2022 09:20:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97071

From: Xu Huan <xuhuan.fnst@fujitsu.com>

Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
---
 .../python/{python3-cbor2_5.4.2.bb => python3-cbor2_5.4.3.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cbor2_5.4.2.bb => python3-cbor2_5.4.3.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-cbor2_5.4.2.bb b/meta-python/recipes-devtools/python/python3-cbor2_5.4.3.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-cbor2_5.4.2.bb
rename to meta-python/recipes-devtools/python/python3-cbor2_5.4.3.bb
index cafc32ad1..0890b99c0 100644
--- a/meta-python/recipes-devtools/python/python3-cbor2_5.4.2.bb
+++ b/meta-python/recipes-devtools/python/python3-cbor2_5.4.3.bb
@@ -4,7 +4,7 @@ DEPENDS +="${PYTHON_PN}-setuptools-scm-native"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/Apache-2.0;md5=89aea4e17d99a7cacdbeed46a0096b10"
 
-SRC_URI[sha256sum] = "e283e70b55a049ff364cc5e648fde587e4d9b0e87e4b2664c69e639135e6b3b8"
+SRC_URI[sha256sum] = "62b863c5ee6ced4032afe948f3c1484f375550995d3b8498145237fe28e546c2"
 
 inherit pypi python_setuptools_build_meta ptest
 
-- 
2.25.1


