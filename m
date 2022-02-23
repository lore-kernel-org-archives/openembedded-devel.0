Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FDABC433EF
	for <webhook@archiver.kernel.org>; Wed, 23 Feb 2022 07:51:34 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web12.4830.1645602692848408678
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Feb 2022 23:51:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=FhfbfDax;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1645602690; i=@fujitsu.com;
	bh=2QUE2YSjekwhSO/RzWTb5RHxhx35MNzz9zt+BBxjPl4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=FhfbfDaxHno5Pu7bcOGP6bzsp9/xrvh+MnzBO8Cb/aTAq4eAfErnp5FzT33rb85Sz
	 L9atVSnx9PbGGYYv5ykZb5LUSXg3hIWlOgLEbZX1D3sxJ27vy56ns2GSoUG3cjCtba
	 TrHcpUBer8PUgTu+WjR6WHrHmVNqKO709OYRmu3vLm2yi+5l7SS1B9LOuzK1Gu2XOQ
	 96JNL47UHYaN6URvjEH00UDJGHzZOA8y5YNP53++vEzTvpwIulOz54MT8c/MsoYPKO
	 DT2KCi7hmTXe0mWBi23amnoJY95M+UJ00aptTeQsUAefcK9KWv3NDfKn+olkowxRjF
	 3tdEql9wwe3SA==
Received: from [100.115.71.247] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-a.eu-central-1.aws.ess.symcld.net id
 F6/FB-30582-287E5126; Wed, 23 Feb 2022 07:51:30 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrDIsWRWlGSWpSXmKPExsViZ8ORqNv0XDT
  JYP1HGYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWNR+3umgmXcFUsfb2dqYFzO1cXIxSEk8IRR
  YsfvuWwQzgUmiaf3m1m7GDmBnBOMEhsOloPYbAJqEtNv3QCLiwjoSyydvYcZxGYWUJF48buHH
  cQWFvCUmLr9DBuIzSKgKrFz5XNGEJtXwEni5JpWsHoJAQWJKQ/fg9mcAs4Sd1d8BKrnANrlJP
  HjcCBEuaDEyZlPWCDGS0gcfPECqlVRYvblZhYIu0Ji1qw2JghbTeLquU3MExgFZyFpn4WkfQE
  j0ypG26SizPSMktzEzBxdQwMDXUNDU10zS11zE73EKt1EvdRS3eTUvJKiRKCsXmJ5sV5qcbFe
  cWVuck6KXl5qySZGYCCnFLt67WA80vdT7xCjJAeTkihv4RHRJCG+pPyUyozE4oz4otKc1OJDj
  DIcHEoSvH1PgHKCRanpqRVpmTnAqIJJS3DwKInwioCkeYsLEnOLM9MhUqcYFaXEeb/fA0oIgC
  QySvPg2mCRfIlRVkqYl5GBgUGIpyC1KDezBFX+FaM4B6OSMK/IM6ApPJl5JXDTXwEtZgJaPCV
  LCGRxSSJCSqqByeS0ZeqnA0L27zQYDgqEsq1aGxWgGxD5IvO6j7TpumzrC6ztzcWrJZbyBd5g
  ELp+8rTW3KmHRVSX8s1hyra/M2uO/OW+M4cnnlJ0qN2v72LCX67O/dgg68333WZm94MvdE1/1
  ip14OvVs38u2H76w+catXrxHNZawcvvIl5U8+91/d4961PM4QM6UV1G2n8mCgetnnzwa4VB1u
  N9J6au1gmoLMkVaCh6pP11t3ye8rrG80sOer0+rOUnnN1xsUf18Mu9Jy+XFD08JK8lE+ssGO5
  4/gfPCePgawu8kzw2X5kjYFSxq2RDvfTmG0Zyrw5evq3x9W9rPANPUDCH/JxLASWBsYIGZ79M
  6/C5ydW9T4mlOCPRUIu5qDgRAO8i5fBfAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-7.tower-528.messagelabs.com!1645602690!3862!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 19679 invoked from network); 23 Feb 2022 07:51:30 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-7.tower-528.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 23 Feb 2022 07:51:30 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id E812D10004D
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Feb 2022 07:51:29 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id CF2C3100193
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Feb 2022 07:51:29 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Wed, 23 Feb 2022 07:51:23 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] tcpreplay: upgrade 4.4.0 -> 4.4.1
Date: Wed, 23 Feb 2022 15:51:09 +0800
Message-ID: <1645602670-28373-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1645602670-28373-1-git-send-email-wangmy@fujitsu.com>
References: <1645602670-28373-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 23 Feb 2022 07:51:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95469

Changelog:
=========
Bug #708 fix support for feeding PCAP files from STDIN
Bug #705 fix Debian/kfreebsd build
Bug #704 fix typos
Bug #703 safeguard against corrupt packet lengths in checksum functions
Bug #702 fix double free in Juniper DLT

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../tcpreplay/{tcpreplay_4.4.0.bb => tcpreplay_4.4.1.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/tcpreplay/{tcpreplay_4.4.0.bb => tcpreplay_4.4.1.bb} (85%)

diff --git a/meta-networking/recipes-support/tcpreplay/tcpreplay_4.4.0.bb b/meta-networking/recipes-support/tcpreplay/tcpreplay_4.4.1.bb
similarity index 85%
rename from meta-networking/recipes-support/tcpreplay/tcpreplay_4.4.0.bb
rename to meta-networking/recipes-support/tcpreplay/tcpreplay_4.4.1.bb
index b349156554..f65956b630 100644
--- a/meta-networking/recipes-support/tcpreplay/tcpreplay_4.4.0.bb
+++ b/meta-networking/recipes-support/tcpreplay/tcpreplay_4.4.1.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://docs/LICENSE;md5=10f0474a2f0e5dccfca20f69d6598ad8"
 
 SRC_URI = "https://github.com/appneta/tcpreplay/releases/download/v${PV}/tcpreplay-${PV}.tar.gz"
 
-SRC_URI[sha256sum] = "a3b125c0319bd096d68f821c4a08051b2d3d9278bac6fe18cfe3c9201703a567"
+SRC_URI[sha256sum] = "cb67b6491a618867fc4f9848f586019f1bb2ebd149f393afac5544ee55e4544f"
 
 UPSTREAM_CHECK_URI = "https://github.com/appneta/tcpreplay/releases"
 
-- 
2.25.1


