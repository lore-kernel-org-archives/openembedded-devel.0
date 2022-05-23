Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FFDAC433FE
	for <webhook@archiver.kernel.org>; Mon, 23 May 2022 08:10:03 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.2])
 by mx.groups.io with SMTP id smtpd.web08.25094.1653293398148687466
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 May 2022 01:09:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=rq8xJdD/;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1653293396; i=@fujitsu.com;
	bh=7lkVnPPCIvTOzEn8Nm/BUIFanhTaT9ZgKJXsAOPpLeE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=rq8xJdD/6/e6z5w+NTB+cEmNnQb1P25i0S+s0Fd5LUwotPb1Zmo9jcJJJhqc7+HBs
	 twd8vlir8Hnhb+EUXxAbsgbRAKlO/lPcFnFFZ2sUsWzSv0o34HPCya2yj+10gXD4nT
	 AV3kGHu9gltCB+mGDHJ+ITRAI/gFHvYpS5Ql9KJIL2BQ5s89pEDLqzp5sRAVgq2DR0
	 1m9/1dHAOPacsRAFbiSb0cGyT1h1yEp6w3Hvh6rN9jIXG5tkPwXLAQJtWSmM5yyreo
	 O8l29ZBGemmFP0SQXGatfli1vsVmCNR5+4zZWnRRG9Q3W8LVdQptWJ9NdfjvNXhcm0
	 qP2+3O6plkHrw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrBIsWRWlGSWpSXmKPExsViZ8ORpOvn2J1
  ksK2N1+Li4aXMDowe5zauYAxgjGLNzEvKr0hgzVizeR9bwUfuik9TfzI3MM7m7mLk4hASeMgo
  cfteJyuEc5ZJ4t6ML8wQzh5GiedN29i7GDk52ATUJKbfusEKYosI6Essnb2HGcRmFlCRePG7B
  6iGg0NYwF2i5WUxiMkioCqxqF8UpIJXwEmifdo3FhBbQkBBYsrD92CdnALOEj93TQObLgRUs6
  v9GCtEvaDEyZlPWCCmS0gcfPGCGaJXUWL25WaoORUSM2ZsY4Ow1SSuntvEPIFRcBaS9llI2hc
  wMq1itEwqykzPKMlNzMzRNTQw0DU0NNU11jW00Eus0k3USy3VLU8tLtE11EssL9ZLLS7WK67M
  Tc5J0ctLLdnECAzglGJmoR2M6/t+6h1ilORgUhLlPWrXnSTEl5SfUpmRWJwRX1Sak1p8iFGGg
  0NJgpfPHignWJSanlqRlpkDjCaYtAQHj5IIL6MDUJq3uCAxtzgzHSJ1ilFRSpzXESQhAJLIKM
  2Da4NF8CVGWSlhXkYGBgYhnoLUotzMElT5V4ziHIxKwrz1IFN4MvNK4Ka/AlrMBLS4V6ITZHF
  JIkJKqoGphM345aX505QeivOo88VP/fTm79s5T15sPbk27rTvunv59oHtk6YLVe5cvH/TsUAe
  FeEz1y7Lfr4ZktUrYbWpc/9Jf3b/viXVJqd3rjPb9fqFu+EV54TFevFB196FGJTeiTIovBYif
  Smfv/dgpMXlVS6bt9+VPxwiMHHBJx31OQLb909pyhd/1GhT9WS7usuyNd2no7J+zjESeBm46M
  rLGJG3q7WSvh3XLepxPPA/ImqFROuW8MBt21mebt65ds+Rdad3FsU+XV/9Ki4tT7XsdNy+xcx
  OF54cWb3Q5f/aprXXkhrlz797uy32nN88O576+cz7TjuIFrxSuMjH5zDD+FCh+La83ZP0Vwk5
  Wxw5Ia/EUpyRaKjFXFScCAClkquXWwMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-22.tower-591.messagelabs.com!1653293389!138440!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 3866 invoked from network); 23 May 2022 08:09:50 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-22.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 23 May 2022 08:09:50 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 389B2D75
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 May 2022 09:09:49 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 281CBB56
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 May 2022 09:09:49 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 23 May 2022 09:09:45 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] thingsboard-gateway: upgrade 2.9 -> 3.1
Date: Mon, 23 May 2022 16:09:26 +0800
Message-ID: <1653293366-31516-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1653293366-31516-1-git-send-email-wangmy@fujitsu.com>
References: <1653293366-31516-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 May 2022 08:10:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97228

Changelog:
https://github.com/thingsboard/thingsboard-gateway/releases/tag/3.1

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{thingsboard-gateway_2.9.bb => thingsboard-gateway_3.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/{thingsboard-gateway_2.9.bb => thingsboard-gateway_3.1.bb} (95%)

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway_2.9.bb b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway_3.1.bb
similarity index 95%
rename from meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway_2.9.bb
rename to meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway_3.1.bb
index 82d515dfe..ec2830d37 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway_2.9.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway_3.1.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "https://thingsboard.io/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/Apache-2.0;md5=89aea4e17d99a7cacdbeed46a0096b10"
 
-SRC_URI[sha256sum] = "3341188a386726a5feb87e5fa04edb999de69e38ee8b4ea5b7d59165729ba0be"
+SRC_URI[sha256sum] = "1a563e062ba734d1cc6e6cbaf8016af5cfb8c2921cb06e1e7af98153af1d121c"
 
 inherit pypi setuptools3
 
-- 
2.25.1


