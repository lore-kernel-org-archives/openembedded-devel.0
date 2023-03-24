Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40611C74A5B
	for <webhook@archiver.kernel.org>; Fri, 24 Mar 2023 00:32:13 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.3])
 by mx.groups.io with SMTP id smtpd.web11.89974.1679617925914806549
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Mar 2023 17:32:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=lJ4o4x8v;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.3, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1679617924; i=@fujitsu.com;
	bh=AYu5YEuCNhtcL1Mu5y8dlZGPPbWBti5cPLHGMyNomlU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=lJ4o4x8vaFIWzrCnqpjLAFwg+eGTM1Ta3IVJnmfkIwNPXIzr41CEV5E/25sSfKeJF
	 fkjTq9DrIxi4sXwNVOxR6qhpXTOKZu8i/l0Pdvnn25gJ6ef30lccOzk7uTdLb68okr
	 n3qkyEGwkTFyga1R/g4VfBTA9ghzede8FxmCh7tIeanVMqx0oH6tcVKNoXMltq4DsT
	 sDA3HWZBe1NhVHocyFLzWn6mshBWXXUrGkx7przvoGAv7h4Kky/Vm+4JdEmDBFQtzS
	 uwgNk+BG7ITv5A6gaaTZUxZ3Ut9SnN55+bCbFTPDXbqmP2t0bmC4zzv+aHsgPmzsh+
	 fXFuYMYEFXSsw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrIIsWRWlGSWpSXmKPExsViZ8OxWbf5vUy
  KwY/PChYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8az65+ZCg5zVvw7fY69gXEbRxcjF4eQwENG
  iSk3ZzFBOJeZJFaefcEK4exhlPj0eCdbFyMnB5uAlMSN+//BbBEBfYmls/cwg9jMAioSL373s
  IPYwgLOEu+3bAGrYRFQlfh/vQPM5hVwkujp2gtWLyGgIDHl4XswmxOofu4jkBoOoGVOEkvOsU
  CUC0qcnPmEBWK8hMTBFy+gWhUlZl9uZoGwKyQapx9igrDVJK6e28Q8gVFwFpL2WUjaFzAyrWI
  0LU4tKkst0jXTSyrKTM8oyU3MzNFLrNJN1Est1S1PLS7RNdJLLC/WSy0u1iuuzE3OSdHLSy3Z
  xAgM3ZRi9V87GGf2/dU7xCjJwaQkyisRKp0ixJeUn1KZkVicEV9UmpNafIhRhoNDSYL38xuZF
  CHBotT01Iq0zBxgHMGkJTh4lER4D50FSvMWFyTmFmemQ6ROMepyXL1yZS+zEEtefl6qlDhv4l
  ugIgGQoozSPLgRsJi+xCgrJczLyMDAIMRTkFqUm1mCKv+KUZyDUUmYV/gd0BSezLwSuE2vgI5
  gAjrCuQbsiJJEhJRUA1OnyKYlTErtgtqPGaomL3566bjcbl69dfwHZdLVuGYomzY9Orzv3tsT
  Tge1Y6vrOJ+VWSqGXb0Zeq14ycRUz/5lx2U50zde73hzTSVZgfnGqabP+5+cfNzsYNUg+yBmo
  /6u0Oz+vidR361XceRsmW0udFn7dU12cKKynaZizhuTcLXw1+n7Luy4zRMRND/vm3TWDO+Ujj
  eJEo97POb94n3iffHfOsMEjqhTi2zff7YLXfpfecnLn0xbdGI9VCdvud9/bdLavMPLF27x/Z+
  jvvNjVk/0znc3mkt6qjQK1qjUBkZPf++md3J5fG6Z3f3Vx7KuBeZ1Vi2e1c6XZ/GL4UW40Ec7
  saKl232ut2VJeiqxFGckGmoxFxUnAgC5OLfcZAMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-12.tower-571.messagelabs.com!1679617923!849258!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 28300 invoked from network); 24 Mar 2023 00:32:03 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-12.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 24 Mar 2023 00:32:03 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 386EC150
	for <openembedded-devel@lists.openembedded.org>; Fri, 24 Mar 2023 00:32:03 +0000 (GMT)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 2188273
	for <openembedded-devel@lists.openembedded.org>; Fri, 24 Mar 2023 00:32:03 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Fri, 24 Mar 2023 00:32:01 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH] libwacom: upgrade 2.5.0 -> 2.6.0
Date: Fri, 24 Mar 2023 08:31:25 +0800
Message-ID: <1679617885-27327-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1679617885-27327-1-git-send-email-wangmy@fujitsu.com>
References: <1679617885-27327-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 24 Mar 2023 00:32:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101692

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- New Devices
  - ASUS ROG Flow X16
  - XP-Pen Deco01 v2
  - Huion Kamvas 13
  - Wacom HID 52FA Pen
  - Ugee M708 v1

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libwacom/{libwacom_2.5.0.bb => libwacom_2.6.0.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-support/libwacom/{libwacom_2.5.0.bb => libwacom_2.6.0.bb} (93%)

diff --git a/meta-gnome/recipes-support/libwacom/libwacom_2.5.0.bb b/meta-gnome/recipes-support/libwacom/libwacom_2.6.0.bb
similarity index 93%
rename from meta-gnome/recipes-support/libwacom/libwacom_2.5.0.bb
rename to meta-gnome/recipes-support/libwacom/libwacom_2.6.0.bb
index a290d95b7..d96026241 100644
--- a/meta-gnome/recipes-support/libwacom/libwacom_2.5.0.bb
+++ b/meta-gnome/recipes-support/libwacom/libwacom_2.6.0.bb
@@ -8,7 +8,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=40a21fffb367c82f39fd91a3b137c36e"
 
 SRC_URI = "git://github.com/linuxwacom/libwacom.git;branch=master;protocol=https"
-SRCREV = "c6c1b26ad149a88b22ff790dae377fcc935b7e08"
+SRCREV = "cb36c462763a321454d5c08fe974a3d7dec4ed1a"
 
 DEPENDS = " \
     libxml2-native \
-- 
2.34.1


