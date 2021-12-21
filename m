Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79104C433FE
	for <webhook@archiver.kernel.org>; Mon, 20 Dec 2021 15:07:02 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com
 [195.245.230.82])
 by mx.groups.io with SMTP id smtpd.web12.6302.1640012821624517641
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Dec 2021 07:07:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=edoeI/Dw;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.82,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1640012819; i=@fujitsu.com;
	bh=pJDcjBaWNKOH3Dgjh2xBSrpGk06P3idyGCHR83VmTsk=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=edoeI/DwousphU/ePMnOY2jMRgeu/qfmRwqG8riBgArilVjcjs6EH64xxtrHiaxtp
	 4Ovlx8tBm6eO7bkw5ZLcDNPyzMwpUghshTbcMA7a+YRAR/k9vMl4z9Dm13euHjaDb8
	 VZoNzhJ/TwhmvlsmMGa4RZRdMaf2ad57/MmPKWinTf75pBPoU7tB5ZNq3m2gnsSWF9
	 PPBpsiGYjJger/Z1ysZVtdGZdcXadhOLRoHJn4Hsplh/YBiUuPuQHdxvPoimLjgYNk
	 jIdmwIeRFMWzJw6L90TJXokrsPGr4ITH//g31MEFg8wcYprY599zRgepVN/+tdgnd4
	 fLHgP4uwfuFaA==
Received: from [100.115.7.142] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-a.eu-west-1.aws.ess.symcld.net id 99/68-30341-31C90C16;
 Mon, 20 Dec 2021 15:06:59 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrKIsWRWlGSWpSXmKPExsViZ8MxSVd4zoF
  Eg9brQhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8a6Nz9ZCibzVLzcv4SpgbGbu4uRi0NI4Amj
  xMETE1kgnAtMErNefoFy9jBKbJm2j7WLkZODTUBX4tzjtewgtoiAvsTS2XuYuxg5OIQF3CW+N
  aWBhFkEVCXmvWtkBrF5BTwkLp64A1YuIaAgMeXhe6i4oMTJmU9YQGxmAQmJgy9egI2REFCUmD
  1dHqK8QuL14UvMELaaxNVzm5gnMPLNQtI9C0n3AkamVYxWSUWZ6RkluYmZObqGBga6hoamuia
  6RsaWeolVuol6qaW65anFJbqGeonlxXqpxcV6xZW5yTkpenmpJZsYgaGXUszyfgdjU99PvUOM
  khxMSqK8/L4HEoX4kvJTKjMSizPii0pzUosPMcpwcChJ8P6cAZQTLEpNT61Iy8wBxgFMWoKDR
  0mEtwkkzVtckJhbnJkOkTrFqCglzus9GyghAJLIKM2Da4PF3iVGWSlhXkYGBgYhnoLUotzMEl
  T5V4ziHIxKwrzps4Cm8GTmlcBNfwW0mAlosVL4fpDFJYkIKakGpnKZ1OOPr2w9/bkuUEbQw9x
  hwz5JfQur63dZL8jVz1cSnS7Mp/H4UO7S4+vmL5J8lizvED/p8/WdVz/5RphlxfwPq+PIn3kv
  959v95QDbhNCV5ccjtfqlpy09EOGzaSEPe4HL9yO3cVx2Do2uHX3nG/3nP2OZcXJdro5qNef8
  C9+FMm82O4pj410u4gD08dFQuGucb+z84MenNi0xf7YafXVe+tmaZert/+Mq3C+pH5pLcP3di
  Efr7tvVsnbn02axrf4llCwRECH0+ugy0ZRVSKRHke7N9cKbm7JECmUD/wR5dPxqDlCR/x5yr2
  nZ+cfsLWNF9whtapsvwkLu+O5Kfv/KPPOu9n8eAJ34tVDSizFGYmGWsxFxYkAAEjaFjgDAAA=
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-21.tower-585.messagelabs.com!1640012819!6246!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 23848 invoked from network); 20 Dec 2021 15:06:59 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-21.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 20 Dec 2021 15:06:59 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id D19C310045A
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Dec 2021 15:06:58 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id C0640100331
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Dec 2021 15:06:58 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Mon, 20 Dec 2021 15:06:37 +0000
From: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-perl] [PATCH] libnet-dns-perl: upgrade 1.32 -> 1.33
Date: Tue, 21 Dec 2021 08:06:31 +0800
Message-ID: <1640045191-88132-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Dec 2021 15:07:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94451

License-Update:
  change "the above copyright" to "the original copyright"

Changelog:
=========
Fix rt.cpan.org #137768

	Test t/05-SVCB.t on Perl 5.18.0 fails with deep recursion.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../{libnet-dns-perl_1.32.bb => libnet-dns-perl_1.33.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-perl/recipes-perl/libnet/{libnet-dns-perl_1.32.bb => libnet-dns-perl_1.33.bb} (93%)

diff --git a/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.32.bb b/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.33.bb
similarity index 93%
rename from meta-perl/recipes-perl/libnet/libnet-dns-perl_1.32.bb
rename to meta-perl/recipes-perl/libnet/libnet-dns-perl_1.33.bb
index 7e485bece..2c7d793a7 100644
--- a/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.32.bb
+++ b/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.33.bb
@@ -3,13 +3,13 @@ HOMEPAGE = "http://www.net-dns.org/"
 SECTION = "libs"
 LICENSE = "MIT"
 
-LIC_FILES_CHKSUM = "file://README;beginline=252;endline=269;md5=27db37b42cd1a5173a53922d67072bcb"
+LIC_FILES_CHKSUM = "file://README;beginline=252;endline=269;md5=de95b6a896d5f861d724ea854d316a0b"
 
 DEPENDS += "perl"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/N/NL/NLNETLABS/Net-DNS-${PV}.tar.gz"
 
-SRC_URI[sha256sum] = "b890a7b44d573f27cc713caadf1e12eaaa4478a6504d1157194df614316b5b50"
+SRC_URI[sha256sum] = "5a40e7cf524e4bd2c33cf03b82b47d5308b712083aa5ee180b0b5af54c71fbd2"
 
 UPSTREAM_CHECK_REGEX = "Net\-DNS\-(?P<pver>(\d+\.\d+))(?!_\d+).tar"
 
-- 
2.25.1


