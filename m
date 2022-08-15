Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0C45C3F6B0
	for <webhook@archiver.kernel.org>; Mon, 15 Aug 2022 06:49:39 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.1])
 by mx.groups.io with SMTP id smtpd.web11.13702.1660546172265938767
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 14 Aug 2022 23:49:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=oY3xI4TN;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1660546170; i=@fujitsu.com;
	bh=b/vU/h2Gb7i4XFyeT/3AOMtcU29xNwrJAl7MpezZfu8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=oY3xI4TNZ+grOo55UeYva0m1S9xX7RlabCbm9pPU6/BoAB8HbSehLRtmCBDXSxPqe
	 pLpEKcDTxz8iGEQWruxQpG0Rah749Go3z9bgLFaYwSpNxODzsmQgYp4WM7CxrRhG45
	 xfFmBskjrxIhr/s6rYOz5Q8dlHLg/lB6in1l60oK4UyyUVCt7uK8FWqH8K4JRwrud5
	 FkRbVWcG03sSfrewZ2eMx/37vIEEAvuzNshWlgJioKftD3DZlrbNaEariLZPDlCc75
	 z2C/GsomsFvs6Q4xArGA4/c98yWyshJQ65Ub8u0Ws+KZ88GzsYzriSxVW9Qrvundcl
	 vPwqh8tua1VNw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrMIsWRWlGSWpSXmKPExsViZ8MxSbfyzc8
  kgxnHTC0uHl7K7MDocW7jCsYAxijWzLyk/IoE1owpD1+xFKzmq9i3cy57A+MDni5GLg4hgSeM
  Eo3PfjJCONeZJF58WMYE4exhlDh3vYO1i5GTg01ATWL6rRtgtoiAvsTS2XuYQWxmARWJF7972
  EFsYQEnic8bvrCB2CwCqhJPb58Ei/MKOEpMufCABcSWEFCQmPLwPVgvJ1B91+17YLYQUM2Gxt
  2MEPWCEidnPmGBmC8hcfDFC2aIXkWJ2ZeboeZUSMyYsY0NwlaTuHpuE/MERsFZSNpnIWlfwMi
  0itEqqSgzPaMkNzEzR9fQwEDX0NBU11TXyMhUL7FKN1EvtVS3PLW4RNdQL7G8WC+1uFivuDI3
  OSdFLy+1ZBMjMIxTilkf7mBc3PdT7xCjJAeTkijvtYs/k4T4kvJTKjMSizPii0pzUosPMcpwc
  ChJ8Jq+AsoJFqWmp1akZeYAYwomLcHBoyTC2/cCKM1bXJCYW5yZDpE6xWjJMXX2v/3MHMvB5M
  yvbQeYhVjy8vNSpcR5TV8DNQiANGSU5sGNg8X9JUZZKWFeRgYGBiGegtSi3MwSVPlXjOIcjEr
  CvOUgU3gy80rgtr4COogJ6CC9u99BDipJREhJNTDZTvgsduTXiZUs87UW7nh7YqGdtYvE3Kqc
  T1584gn77k06JJj4PchF6l/9PdsVchPjJHX7k7N27njY+3/t4a6S014TzvLejXikcdsjUdpCi
  n2jjtjUF6bq889FcecxqUtaScsK1yuGbQlYOnftP6cZf8+GXl2W8eGf0ZpvT2RFpdm8Re9uM9
  96oH9Sj3d0KkfsT0VZFbFZ9zgFg57v51sXM1t56yQp25zVBw441C4ull2ndrH0nExP5309iQJ
  vw6MmDGeOsbw8fpzVvmmqX9k9ninH87aUvzOzl9wVeSww0Dr3l6uOyOOAt9fZ93ouenpk8VvZ
  LZ5BacaiCzZNuvF5q7o1+wn9e3aPJ/yu3ROjxFKckWioxVxUnAgApbswX3YDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-6.tower-587.messagelabs.com!1660546169!826713!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 7469 invoked from network); 15 Aug 2022 06:49:29 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-6.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 15 Aug 2022 06:49:29 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 802FF1000CE
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Aug 2022 07:49:29 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 7393F100077
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Aug 2022 07:49:29 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 15 Aug 2022 07:49:27 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] uftp: upgrade 5.0 -> 5.0.1
Date: Mon, 15 Aug 2022 14:49:07 +0800
Message-ID: <1660546148-1668-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1660546148-1668-1-git-send-email-wangmy@fujitsu.com>
References: <1660546148-1668-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 15 Aug 2022 06:49:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98257

Changelog:
==========
-On very low speed transfers (<10Kbps) sessions would time out due to a very
  large interpacket transmission interval.  Fixed by putting a lower limit
  on the advertised GRTT of of the interpacket transmission interval.
-Sending of ABORT messages on early shutdown would sometimes fail due to
  OpenSSL cleanup functions running before application cleanup.  Changed the
  ordering of atexit() handlers to ensure OpenSSL cleanup happens last.
-Fixed missing timestamp update when clients read CONG_CTRL messages
-Fix to GRTT handling on server to ensure it doesn't fall below minumim.
-Fixed bypassed checking of existing files on client for backup
-Various logging fixes

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-support/uftp/{uftp_5.0.bb => uftp_5.0.1.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/uftp/{uftp_5.0.bb => uftp_5.0.1.bb} (84%)

diff --git a/meta-networking/recipes-support/uftp/uftp_5.0.bb b/meta-networking/recipes-support/uftp/uftp_5.0.1.bb
similarity index 84%
rename from meta-networking/recipes-support/uftp/uftp_5.0.bb
rename to meta-networking/recipes-support/uftp/uftp_5.0.1.bb
index 301e0fa607..6d5cf4b628 100644
--- a/meta-networking/recipes-support/uftp/uftp_5.0.bb
+++ b/meta-networking/recipes-support/uftp/uftp_5.0.1.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=d32239bcb673463ab874e80d47fae504"
 UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/uftp-multicast/files/source-tar/"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/uftp-multicast/source-tar/uftp-${PV}.tar.gz"
-SRC_URI[sha256sum] = "562f71ea5a24b615eb491f5744bad01e9c2e58244c1d6252d5ae98d320d308e0"
+SRC_URI[sha256sum] = "f0435fbc8e9ffa125e05600cb6c7fc933d7d587f5bae41b257267be4f2ce0e61"
 
 DEPENDS = "openssl"
 
-- 
2.25.1


