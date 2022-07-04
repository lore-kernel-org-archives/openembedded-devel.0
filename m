Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC1CFCCA479
	for <webhook@archiver.kernel.org>; Mon,  4 Jul 2022 09:08:09 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web08.70060.1656925683347627124
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Jul 2022 02:08:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=pKF4x6GQ;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1656925681; i=@fujitsu.com;
	bh=9cYj/2MPHlczSkxSdi9tCM2aBnpiXLLGsXHHveNmy8w=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=pKF4x6GQN32u5I2YocMIWiDYGwrpFuhC40+3myEqjUjSIzGOkkEQzP7sWSqozozP0
	 /n1vR/exQO0rJDwEdodoAYZ90GdkXYAVth1WfUWc+nqa6yCqSMSTjCS3DWaXFHIi0L
	 Z84FdDUc0INHmw77iuEHmKKE2ozk9vpRr0lMWtKP5+SCzPYwPO9d2Uqcyic8QcgOvT
	 MgEw0PVgbRnqxSMczveUB5YLW/0g8PtMdwz/6sTewDCEi/tJ0+/ZF0h22TlpMcWgkp
	 no+31MMdnfa2HJNPBXz0ZSq+9sB7CKvzNGgRPeUOizdwWHA+Ro0zHMafzbqAHP8qip
	 Y5qS76Gk6ib3g==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrBIsWRWlGSWpSXmKPExsViZ8MxSffj2kN
  JBn8WClhcPLyU2YHR49zGFYwBjFGsmXlJ+RUJrBnn5ocUHOSo2LC7jbmB8SV7FyMXh5DAE0aJ
  P5d6oZzrTBKvtxxng3B2M0pMbP3P2MXIycEmoCYx/dYNVhBbREBfYunsPcwgNrOAisSL3z3sI
  LawgL1E1//nYDYLUHz9zrVgNbwCjhLdM16AxSUEFCSmPHwPFucUcJJ42jCVqYuRA2iZo8T0uY
  oQ5YISJ2c+YYEYLyFx8MULZohWRYnZl5tZIOwKiRkztrFB2GoSV89tYp7AKDgLSfssJO0LGJl
  WMVonFWWmZ5TkJmbm6BoaGOgaGprqGlvqGhka6yVW6SbqpZbqlqcWl+ga6SWWF+ulFhfrFVfm
  Juek6OWllmxiBAZxSrH61R2Mm1f91DvEKMnBpCTKO7X2UJIQX1J+SmVGYnFGfFFpTmrxIUYZD
  g4lCV6n1UA5waLU9NSKtMwcYETBpCU4eJREeL8uAkrzFhck5hZnpkOkTjHac1y9cmUvM8fU2f
  /2M3MsB5Mzv7YdYBZiycvPS5US5127BqhNAKQtozQPbigsAVxilJUS5mVkYGAQ4ilILcrNLEG
  Vf8UozsGoJMybAjKFJzOvBG73K6CzmIDOulF1AOSskkSElFQDk8v2O19TSywcd+7WXVjyzmRn
  OtOLn1e3+Lc8X82z7QJv6wSflo4761eyF+xzMnGN32irMe982sryBdVfNfc+3XWOv+FPhPHW+
  VuTsnfwcjZNUUtg5nHhljkkffTQ4QKNhOoTryZMfLGP+ZHpi9TqKdsX/1xt1ncg/p1+8cTdCm
  XFT0QPctXVZDxiN8w38fFTrd7Iu7Gr3PGUPd/elznsLZmz7kxlfn321++r1Wc+hjZYilgyP3T
  ff4Hxusu0Ne0yLDsa7EsfKs3/xRt/8vq5B+WWMa32W9823y6J2+I5w29XxV7FE51HTwYdbVfv
  qN77cnr1n4Pxq6OTgrSbVyz8niV86785y6PtnmeqOHhmJymxFGckGmoxFxUnAgBDakzMewMAA
  A==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-6.tower-565.messagelabs.com!1656925681!174017!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 16525 invoked from network); 4 Jul 2022 09:08:01 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-6.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 4 Jul 2022 09:08:01 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id EDB0B1000C0
	for <openembedded-devel@lists.openembedded.org>;
 Mon,  4 Jul 2022 10:08:00 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id DF688100077
	for <openembedded-devel@lists.openembedded.org>;
 Mon,  4 Jul 2022 10:08:00 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 4 Jul 2022 10:07:59 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] catch2: upgrade 2.13.7 -> 3.0.1
Date: Mon, 4 Jul 2022 17:07:23 +0800
Message-ID: <1656925643-8143-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1656925643-8143-1-git-send-email-wangmy@fujitsu.com>
References: <1656925643-8143-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 04 Jul 2022 09:08:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97685

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-test/catch2/{catch2_2.13.7.bb => catch2_3.0.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-test/catch2/{catch2_2.13.7.bb => catch2_3.0.1.bb} (82%)

diff --git a/meta-oe/recipes-test/catch2/catch2_2.13.7.bb b/meta-oe/recipes-test/catch2/catch2_3.0.1.bb
similarity index 82%
rename from meta-oe/recipes-test/catch2/catch2_2.13.7.bb
rename to meta-oe/recipes-test/catch2/catch2_3.0.1.bb
index ed50f659d..c6fd36806 100644
--- a/meta-oe/recipes-test/catch2/catch2_2.13.7.bb
+++ b/meta-oe/recipes-test/catch2/catch2_3.0.1.bb
@@ -5,8 +5,8 @@ HOMEPAGE = "https://github.com/catchorg/Catch2"
 LICENSE = "BSL-1.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e4224ccaecb14d942c71d31bef20d78c"
 
-SRC_URI = "git://github.com/catchorg/Catch2.git;branch=v2.x;protocol=https"
-SRCREV = "c4e3767e265808590986d5db6ca1b5532a7f3d13"
+SRC_URI = "git://github.com/catchorg/Catch2.git;branch=devel;protocol=https"
+SRCREV = "605a34765aa5d5ecbf476b4598a862ada971b0cc"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


