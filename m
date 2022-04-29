Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0909C433FE
	for <webhook@archiver.kernel.org>; Mon,  9 May 2022 08:26:22 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web11.29497.1652084771762956112
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 May 2022 01:26:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=hF7ZwE12;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1652084770; i=@fujitsu.com;
	bh=/pgE1Ji/pmI+JZfrDpTOSQXEytdk6889V7/Vz05XCXo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=hF7ZwE12fcQdOBzo+PdXwFCrWblMq9r3y4l1TZQVHPOWkYfzOlwjSoyvAWC4i7RzD
	 2OXx6uUGDQkLHxWvlQhQeAfJQTWdsLCXOd4glaDIBn/I8BuSH2QgxWIJwJU5NAmRdS
	 ht0263TEyDoHN276R2OG7U6p+AAPMKtNRV9S8FqjB6C/j66XtLLF8/mVhx/Xe8IuzI
	 nd94l6x9+VlUvdShplfHfHu2a74iWcH76Kb+ehKPP2rAg4lRi9GSBlZhASDyAQRXKL
	 N2ELjENhe8GL0mYb63HaxCCMTVf2EmDB7z5Bikd8pVw0jV+oaBzRSzMECHdU4SuQvO
	 HvJEs9NbN+pUA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrJIsWRWlGSWpSXmKPExsViZ8ORqKt4oSL
  J4OcOLYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPhxU/MBT/YK7Z11DYwLmPvYuTiEBJ4wijx
  8s90VgjnApPEjInvmSCc3YwSN5c8BnI4OdgE1CSm37rBCmKLCOhLLJ29hxnEZhZQkXjxu4cdx
  BYWsJDob54IZrMIqEqsWruODcTmFXCS6Hk6iwXElhBQkJjy8D1QLwcHp4CzxI7DlSBhIaCSs6
  cfsECUC0qcnPmEBWK8hMTBFy+YIVoVJWZfboYaUyExa1YbE4StJnH13CbmCYyCs5C0z0LSvoC
  RaRWjXVJRZnpGSW5iZo6uoYGBrqGhqa6Zia6RialeYpVuol5qqW5yal5JUSJQWi+xvFgvtbhY
  r7gyNzknRS8vtWQTIzCUU4odvu5gPN73U+8QoyQHk5Iob2VTRZIQX1J+SmVGYnFGfFFpTmrxI
  UYZDg4lCd6Qc0A5waLU9NSKtMwcYFzBpCU4eJREeO+eAErzFhck5hZnpkOkTjHqctxduHcvsx
  BLXn5eqpQ4bzHIDAGQoozSPLgRsBi/xCgrJczLyMDAIMRTkFqUm1mCKv+KUZyDUUmYV+k80BS
  ezLwSuE2vgI5gAjriY0ApyBEliQgpqQams/sLX/0573m2encrt/c796ueX/+vzHg9y+bktkQ9
  t1Vb7M5N+iabotI0WyPOQoa5xzTc77pOsYfT+gvVHinn9mrmn901XyqZn5MnQtf1Z83R/crMM
  V/CZh/pYFv+mnnhVEH/sjubD/7+ket6sFsu8MHurbnCRecmzrXlTN1fb3Pp+rfly4S/KG/+OS
  vvVkuTZT3/oy8vpVIEdxkLOruqhrXo5gtN83RmPuX1WO7FTY993aJBZ6JO5QglNDtvce0qn7p
  lPm/sHEf/qRLiW/8ZT6psePll265DSWa7q81UP0dOT5CXOLfokBDLj+fOu1b93Fw4/U+AkMFa
  5njX1xfmXeb+VfmuzM/wuPzu5fIFSizFGYmGWsxFxYkAZ+uKjmwDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-13.tower-532.messagelabs.com!1652084769!354317!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 7813 invoked from network); 9 May 2022 08:26:09 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-13.tower-532.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 9 May 2022 08:26:09 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 071B9100198
	for <openembedded-devel@lists.openembedded.org>;
 Mon,  9 May 2022 09:26:09 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id B4392100191
	for <openembedded-devel@lists.openembedded.org>;
 Mon,  9 May 2022 09:26:08 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 9 May 2022 09:25:54 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] nano: upgrade 6.2 -> 6.3
Date: Fri, 29 Apr 2022 16:08:08 +0800
Message-ID: <1651219689-27457-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1651219689-27457-1-git-send-email-wangmy@fujitsu.com>
References: <1651219689-27457-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 09 May 2022 08:26:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97001

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-support/nano/{nano_6.2.bb => nano_6.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/nano/{nano_6.2.bb => nano_6.3.bb} (88%)

diff --git a/meta-oe/recipes-support/nano/nano_6.2.bb b/meta-oe/recipes-support/nano/nano_6.3.bb
similarity index 88%
rename from meta-oe/recipes-support/nano/nano_6.2.bb
rename to meta-oe/recipes-support/nano/nano_6.3.bb
index 0be022467..6d22bfc08 100644
--- a/meta-oe/recipes-support/nano/nano_6.2.bb
+++ b/meta-oe/recipes-support/nano/nano_6.3.bb
@@ -13,7 +13,7 @@ RDEPENDS:${PN} = "ncurses-terminfo-base"
 PV_MAJOR = "${@d.getVar('PV').split('.')[0]}"
 
 SRC_URI = "https://nano-editor.org/dist/v${PV_MAJOR}/nano-${PV}.tar.xz"
-SRC_URI[sha256sum] = "2bca1804bead6aaf4ad791f756e4749bb55ed860eec105a97fba864bc6a77cb3"
+SRC_URI[sha256sum] = "eb532da4985672730b500f685dbaab885a466d08fbbf7415832b95805e6f8687"
 
 UPSTREAM_CHECK_URI = "https://ftp.gnu.org/gnu/nano"
 
-- 
2.25.1


