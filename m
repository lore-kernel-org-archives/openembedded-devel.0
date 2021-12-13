Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7F80C433FE
	for <webhook@archiver.kernel.org>; Mon, 13 Dec 2021 14:46:10 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web12.12057.1639406769220092263
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Dec 2021 06:46:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=fquf6thW;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1639406767; i=@fujitsu.com;
	bh=R9DhqMjkAVB0jEvjkPyeK6eeMHSCDRSkcx3YCv0Ebb4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=fquf6thWwZhmo+MD1XaEh17nNsJ2WL8AwxcIPpxH2wndLfPdDRH/tU2Fn9wcr0kgO
	 CATasJKLqQWLHy/q7RAIVW4FKn/7ST5Y7J5k9lzguRFs8vyvq64whnmCr4NRJuXquI
	 u1n1elK4VSJhutr3jdPnJBsXIP2IN6LMpcEKith/UWY6gQZjxJuFXMVuADsChcGst0
	 oBxxyXS97qINfH/oLcVif/zA+a3LOdXWd22OV+bGlZTPMIyG73XuhxUHHxyMOdqq3C
	 R9Ti8vZ1edzIJRF5gsgtugzXT+iV1sJw8e7p8zgLnLKLvKSzkSf2SD95eMbdUobYs7
	 D+tbwUTyX63Zw==
Received: from [100.115.71.165] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-a.eu-central-1.aws.ess.symcld.net id
 DD/0B-24146-FAC57B16; Mon, 13 Dec 2021 14:46:07 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrMIsWRWlGSWpSXmKPExsViZ8MRorsuZnu
  iwf3LmhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8ad+QdZCyZyV3Ss2s/ewDiTq4uRk0NIYCaT
  xNuHAl2MXED2CUaJ74s+MoIk2ATUJKbfusEKYosI6Essnb2HGcRmFlCRePG7hx3EFhawknh35
  gdQPQcHi4CqxM9HCiBhXgEniSm/P4CVSwgoSEx5+B7M5hRwlvi2poMZYq+TxNxrUxkh6gUlTs
  58wgIxXkLi4IsXUL2KErMvN7NA2BUSs2a1MU1g5J+FpGUWkpYFjEyrGG2TijLTM0pyEzNzdA0
  NDHQNDU11zcx0Lc30Eqt0E/VSS3WTU/NKihKBsnqJ5cV6qcXFesWVuck5KXp5qSWbGIFhmVLs
  lLCD8VHfT71DjJIcTEqivMGs2xOF+JLyUyozEosz4otKc1KLDzHKcHAoSfCeCQfKCRalpqdWp
  GXmAGMEJi3BwaMkwvshEijNW1yQmFucmQ6ROsWoKCXO6x0NlBAASWSU5sG1weLyEqOslDAvIw
  MDgxBPQWpRbmYJqvwrRnEORiVh3v9RQFN4MvNK4Ka/AlrMBLSYsXIzyOKSRISUVAOTx+VZ+hf
  rsxJO3NO43Hz5m36jI/f5zW/fCYSUXZ6nzidq/+PF3aXxSzZzsHDdlpQ62Vj04HbjyubQ5DkZ
  Cj1Fl49sPPb0xxEBR8vN70IvcpTOVeg/ON3973WpyGvnXnb4LrguZjXV7Fksyy+RmfVfdkbGT
  chk2M3utIgr5cpanYQX3p4qzCsWqayavrpQJSSrVLL++C65p37eC7WWrfxb3XiVb+uXiQyVli
  z/JUS14tZabZz3zfv1xSMxnauU5Dxd+mPb2t6VW11Y/+Hu65IN/Hmb878uN7O98tv1svS7lWe
  Wqggmdh/WM1+ykuW29K66aQkv9NdJXD96/Hfe46/PtLd67GKb+v3DmrltbZk51UosxRmJhlrM
  RcWJAFOKo41GAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-24.tower-528.messagelabs.com!1639406766!3693!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 2845 invoked from network); 13 Dec 2021 14:46:06 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-24.tower-528.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 13 Dec 2021 14:46:06 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1BDEk0ok030423
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Dec 2021 14:46:06 GMT
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Mon, 13 Dec 2021 14:45:59 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] cloc: upgrade 1.90 -> 1.92
Date: Mon, 13 Dec 2021 22:45:32 +0800
Message-ID: <1639406733-28016-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1639406733-28016-1-git-send-email-wangmy@fujitsu.com>
References: <1639406733-28016-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Dec 2021 14:46:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94332

Changelog:
===========
New languages GraphQL, Metal Shading Language, PlantUML, Properties, Umka.
Better consistency with upper- and lowercase file names on Windows.
Bug fixes for --force-lang-def, --csv-delimiter, --vcs=git with --max-file-size,
--unicode, --ignored (directory names no longer appear).

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-devtools/cloc/{cloc_1.90.bb => cloc_1.92.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/cloc/{cloc_1.90.bb => cloc_1.92.bb} (79%)

diff --git a/meta-oe/recipes-devtools/cloc/cloc_1.90.bb b/meta-oe/recipes-devtools/cloc/cloc_1.92.bb
similarity index 79%
rename from meta-oe/recipes-devtools/cloc/cloc_1.90.bb
rename to meta-oe/recipes-devtools/cloc/cloc_1.92.bb
index fa69aa1420..2b9f29969b 100644
--- a/meta-oe/recipes-devtools/cloc/cloc_1.90.bb
+++ b/meta-oe/recipes-devtools/cloc/cloc_1.92.bb
@@ -6,8 +6,7 @@ LICENSE="GPL-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2c1c00f9d3ed9e24fa69b932b7e7aff2"
 
 SRC_URI = "https://github.com/AlDanial/cloc/releases/download/v${PV}/${BP}.tar.gz"
-SRC_URI[md5sum] = "e2364c2c9c9eda1d20890c19911c51fb"
-SRC_URI[sha256sum] = "152502a61d4bae4a406a05a01bf52489b310ec03dbd8c645d0bb051fa4717ddb"
+SRC_URI[sha256sum] = "73570f9da159fab13846038de7c3d8772554117c04117281dcbe6e5c7b988264"
 
 UPSTREAM_CHECK_URI = "https://github.com/AlDanial/${BPN}/releases"
 
-- 
2.25.1


