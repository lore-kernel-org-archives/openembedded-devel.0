Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A32EC433FE
	for <webhook@archiver.kernel.org>; Mon, 21 Feb 2022 13:24:31 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.65])
 by mx.groups.io with SMTP id smtpd.web09.10473.1645449870026174018
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Feb 2022 05:24:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=V07PkarH;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.65,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1645449868; i=@fujitsu.com;
	bh=cmXhuq/mXObElIWte4Q7Cazg0mBOtKm0XCv0wTcNJDE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=V07PkarHXytTKNsi/Sg41pevDzhgnqNV8ELji+/1pJxqll7tu03OIUJdsvIDLKVi/
	 LeBHMHdRxMi6ICQPGPn+KLnT7ajVQ1cN48tCEvL/gJ2rrJNBu5MIg+1Ur0XMGjlnqo
	 MDlrP78I422c/dmQleCsl9KZm8pVR4cLitkc9psSBdE107ohErjMRwfPvJEX1TGtpH
	 Ti4+TgzZUYJbJ/k66cp618Rjk0vfOYWuK+ogNf8cdMSHoOkhosODlILuTx5NVYlM9i
	 yBy4TGcjPRtLW6iAnXBcf0pm2bcbbCqJ//iNPReSTpFFnPs4UwQgdwqfxz1fYpy/Qf
	 K/3lOKTHsM71Q==
Received: from [100.115.7.114] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-a.eu-west-1.aws.ess.symcld.net id 74/74-00700-C8293126;
 Mon, 21 Feb 2022 13:24:28 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrFIsWRWlGSWpSXmKPExsViZ8MxSbdrknC
  SwY+90hYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa0bTxZesBTu5KnruGTcwTuPsYuTiEBJ4wiix
  b80WZgjnApPE1GlfWCCcE4wSbTc2MHUxcnKwCahJTL91gxXEFhHQl1g6ew8ziM0soCLx4ncPO
  4gtLOAgMfnaa7AaFgFViQuPd4HFeQWcJP7sWAcWlxBQkJjy8D1YL6eAs8Sl/g4wWwio5tKGvV
  D1ghInZz5hgZgvIXHwxQtmiF5FidmXm1kg7AqJWbPamCBsNYmr5zYxT2AUnIWkfRaS9gWMTKs
  YrZKKMtMzSnITM3N0DQ0MdA0NTXUNdI0MTfUSq3QT9VJLdctTi0t0DfUSy4v1UouL9Yorc5Nz
  UvTyUks2MQKDOKWY4foOxol9P/UOMUpyMCmJ8ta2CycJ8SXlp1RmJBZnxBeV5qQWH2KU4eBQk
  uAV7gfKCRalpqdWpGXmACMKJi3BwaMkwlveDJTmLS5IzC3OTIdInWJUlBLnFZwIlBAASWSU5s
  G1waL4EqOslDAvIwMDgxBPQWpRbmYJqvwrRnEORiVh3mCQKTyZeSVw018BLWYCWjwlSwhkcUk
  iQkqqgSl614t7r1YeTDrFa3xiapdo1DSOL4zdt77Xly2edlnp0wxHvalP9how7Nm7wTwmu9b/
  UNTTZW6MAhNn/jKu3dMaZTGdmevh6hNN8/7If2Kud9nBxOh/05hBx9Pk26o3Edf+1n5cv2BHa
  EWNwISr2vYG+h09H15s3XVnJsNqpm/Nyf2GczIuzeHNfPribeoKX/OncjvYm98rHvb7Heup/p
  +Lj+vOo237uN//yjgbN+n3n13i0hPmpdhtmf1Ab9UTmxbNSUp7nzNGrui76f38S78PE1urKJv
  jYu5qe7Y7waZTI5NiXWbN+3+279HsM9sTr7HHB1R5qrdq/5E58z9qc0nOkgNZJ9QO8lzcli09
  Z2mrEktxRqKhFnNRcSIADfdNSV0DAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-8.tower-587.messagelabs.com!1645449866!8574!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 5565 invoked from network); 21 Feb 2022 13:24:26 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-8.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 21 Feb 2022 13:24:26 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 00F0B10044A
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Feb 2022 13:24:26 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id E8798100353
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Feb 2022 13:24:25 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Mon, 21 Feb 2022 13:24:07 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] libjcat: upgrade 0.1.9 -> 0.1.10
Date: Mon, 21 Feb 2022 21:23:54 +0800
Message-ID: <1645449836-23309-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1645449836-23309-1-git-send-email-wangmy@fujitsu.com>
References: <1645449836-23309-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 21 Feb 2022 13:24:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95418

Changelog:
=========
New Features:
- Add ED25519 support
- Define three more types used for the firmware transparency log

Bugfixes:
- Include the pkgconfig variables in the subproject dependency
- Drop the use of setuptools in the test script for regenerating ld version file
- Use the correct lookup method for the python3 script interpreter

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libjcat/{libjcat_0.1.9.bb => libjcat_0.1.10.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-gnome/libjcat/{libjcat_0.1.9.bb => libjcat_0.1.10.bb} (94%)

diff --git a/meta-oe/recipes-gnome/libjcat/libjcat_0.1.9.bb b/meta-oe/recipes-gnome/libjcat/libjcat_0.1.10.bb
similarity index 94%
rename from meta-oe/recipes-gnome/libjcat/libjcat_0.1.9.bb
rename to meta-oe/recipes-gnome/libjcat/libjcat_0.1.10.bb
index b0871c6a48..bbbc728d33 100644
--- a/meta-oe/recipes-gnome/libjcat/libjcat_0.1.9.bb
+++ b/meta-oe/recipes-gnome/libjcat/libjcat_0.1.10.bb
@@ -11,7 +11,7 @@ SRC_URI = "\
     git://github.com/hughsie/libjcat.git;branch=main;protocol=https \
     file://run-ptest \
 "
-SRCREV = "d4833949f8f1997b83f35a03127b9e12c104a7c8"
+SRCREV = "edaf36b285497364bef8bf916ffe5b962d01c4b8"
 S = "${WORKDIR}/git"
 
 inherit gobject-introspection gtk-doc meson ptest-gnome vala lib_package
-- 
2.25.1


