Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03F56C6FD18
	for <webhook@archiver.kernel.org>; Mon, 24 Apr 2023 03:19:49 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web10.43074.1682306388246116098
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 23 Apr 2023 20:19:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=MywRlK6o;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1682306386; i=@fujitsu.com;
	bh=N+vBdAAh5mePZ05NmKmbwF32I6RnG/ghiZmpb86m02U=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=MywRlK6oPrbhZY8Z+4+B1XL+6FeTAV7luZjX/GogI7K9bHYhxf5jg4vYs7DRDCcfz
	 ymebGR+dJ2JcNohojflY2964M4mI2BkPYWfX4i4Y+o7rfCsyxhH4ROyYSV64dsnRgG
	 jLQ8pAFTuorjGAuL+w6QghGgTS6cLNfIBhecukWLUxFSdfdDU1pMAi3pIS/W2AfQlK
	 uO58cwufUENYZ9j1Rso7DI3N9fYS7rbH3sR8YKF9+W6fYPplOY+S6doaKq2KhhJ+oe
	 42yEC6mregthLW1D0z+RjUhEe7feR/umO7fvSaMqRiTXGmzqxzax/ulBy0YawGcp00
	 8PE3soXmrlSsA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrAIsWRWlGSWpSXmKPExsViZ8ORpBvw1TX
  F4EWDrsXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmvHp0ya2gmmcFZsmRzcwruPoYuTiEBJ4yCjR
  /GMlUxcjJ5BzlUli50phiMReRolVpxaygyTYBKQkbtz/zwZiiwjoSyydvYcZxGYWUJF48bsHr
  EZYwFaieeonsDiLgKrEyasrwWxeASeJN78Ps4DYEgIKElMevgeKc3BwCjhLvO3PgNjrJHFl2S
  uockGJkzOfsECMl5A4+OIFM0SrosTsy81QYyolWj/8grLVJK6e28Q8gVFwFpL2WUjaFzAyrWI
  0K04tKkst0jXXSyrKTM8oyU3MzNFLrNJN1Est1c3LLyrJ0DXUSywv1kstLtYrrsxNzknRy0st
  2cQIDNyU4lTPHYxtu/7qHWKU5GBSEuVdssElRYgvKT+lMiOxOCO+qDQntfgQowwHh5IEb9En1
  xQhwaLU9NSKtMwcYBTBpCU4eJREeHNPAqV5iwsSc4sz0yFSpxh1OdY2HNjLLMSSl5+XKiXO2w
  YyQwCkKKM0D24ELKIvMcpKCfMyMjAwCPEUpBblZpagyr9iFOdgVBLmlfwANIUnM68EbtMroCO
  YgI7Yxe0CckRJIkJKqoFJ5Nn+adxFUodzLda71RioPlXRNbgRofPqSVFi+5/9y7oCrmv5XK8X
  LDm+OvGytZTW8X4O9dn3/NlcnY7WHo/98jLd40+FsPXHfPkDDszt2m0/FRL3vvLvXn/8S71fk
  ZPvj3dZS7REQ3kqDm6Rumn8V4LDpmxra3Zomv8FOYWs02cnL7hS+tF1YWq1oZyI52yR1Pddmo
  utxRvUin02Xz3LHNQd/N9MPccyuYX53fyvPV3xJ8/OsLDbNjf0o+6agmOcT2J3z5840/h2dvX
  tvedF9omnBaRsbHN82bP4VOqqNC8vjlQVl96gafc+9/OuTfRoFPgSmmx2QD9sn7C8RGTqOblt
  D0Jq5SSuhTNEKrEUZyQaajEXFScCAMnHZotjAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-3.tower-728.messagelabs.com!1682306384!286862!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 31491 invoked from network); 24 Apr 2023 03:19:44 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-3.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 24 Apr 2023 03:19:44 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 308C91B5
	for <openembedded-devel@lists.openembedded.org>; Mon, 24 Apr 2023 04:19:44 +0100 (BST)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 24A4A1AC
	for <openembedded-devel@lists.openembedded.org>; Mon, 24 Apr 2023 04:19:44 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 24 Apr 2023 04:19:42 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] libopus: upgrade 1.3.1 -> 1.4
Date: Mon, 24 Apr 2023 11:19:10 +0800
Message-ID: <1682306351-11741-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1682306351-11741-1-git-send-email-wangmy@fujitsu.com>
References: <1682306351-11741-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 24 Apr 2023 03:19:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102152

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libopus/{libopus_1.3.1.bb => libopus_1.4.bb}               | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-oe/recipes-multimedia/libopus/{libopus_1.3.1.bb => libopus_1.4.bb} (94%)

diff --git a/meta-oe/recipes-multimedia/libopus/libopus_1.3.1.bb b/meta-oe/recipes-multimedia/libopus/libopus_1.4.bb
similarity index 94%
rename from meta-oe/recipes-multimedia/libopus/libopus_1.3.1.bb
rename to meta-oe/recipes-multimedia/libopus/libopus_1.4.bb
index 830bc0473..200211774 100644
--- a/meta-oe/recipes-multimedia/libopus/libopus_1.3.1.bb
+++ b/meta-oe/recipes-multimedia/libopus/libopus_1.4.bb
@@ -9,8 +9,7 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=e304cdf74c2a1b0a33a5084c128a23a3"
 
 SRC_URI = "http://downloads.xiph.org/releases/opus/opus-${PV}.tar.gz"
-SRC_URI[md5sum] = "d7c07db796d21c9cf1861e0c2b0c0617"
-SRC_URI[sha256sum] = "65b58e1e25b2a114157014736a3d9dfeaad8d41be1c8179866f144a2fb44ff9d"
+SRC_URI[sha256sum] = "c9b32b4253be5ae63d1ff16eea06b94b5f0f2951b7a02aceef58e3a3ce49c51f"
 
 S = "${WORKDIR}/opus-${PV}"
 
-- 
2.34.1


