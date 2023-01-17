Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D91AAC6379F
	for <webhook@archiver.kernel.org>; Tue, 17 Jan 2023 07:18:42 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.1])
 by mx.groups.io with SMTP id smtpd.web11.191278.1673939918252921312
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Jan 2023 23:18:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=SGP/FNFe;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1673939916; i=@fujitsu.com;
	bh=ito8w4Wns53HGCQ0OZ6EqppZRICpnmogk/q5B9DADbs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=SGP/FNFemnBPqd3uqTswJnY6mds+DjYddGziuFvG2iUA9cT88wkE7cYhvLHESuit7
	 ifJ+JP8gVvrI0JCdjiwYsigC71NPxmlk8wrI/fkozDKDBkZAn7GFjefG9buwDQw7c0
	 4wxquPRN/iSLJahMgNL+xHj+lEV2o/eduAUkpNbwDChgwamS9znlDUUzRcG7pQHzvh
	 Bv343vsSdxZSw1T7wsIBdiD1ikNJTU1Z6lYQvdsMLhqhFLttCIaEU0aqVMfjK7RQRD
	 KqT0Op+4vIJZzub8UqGbCkHVmWauNOAhx5CVMW4qOIPU+LWdjTm4M3rW8WBC679SAC
	 zJySDVOUh1mxw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrIIsWRWlGSWpSXmKPExsViZ8ORqHvG+1i
  ywasIi4uHlzI7MHqc27iCMYAxijUzLym/IoE1Y2rXIuaCBzwVVyauYG1gPMLdxcjFISTwhFFi
  47sZjBDODSaJlpMdrBDOXkaJjy9WATmcHGwCUhI37v9nA7FFBPQlls7ewwxiMwuoSLz43cMOY
  gsLWErcmbIcaBIHB4uAqsT8M8UgYV4BJ4lDZ86BlUgIKEhMefgerJVTwFlizsulYHEhoJofF1
  ayQtQLSpyc+YQFYryExMEXL5ghehUlZl9uZoGwKyVaP/yCstUkrp7bxDyBUXAWkvZZSNoXMDK
  tYjQrTi0qSy3SNTTVSyrKTM8oyU3MzNFLrNJN1Est1S1PLS7RNdRLLC/WSy0u1iuuzE3OSdHL
  Sy3ZxAgM3ZRi9uIdjA+W/dE7xCjJwaQkynvS9FiyEF9SfkplRmJxRnxRaU5q8SFGGQ4OJQneU
  15AOcGi1PTUirTMHGAcwaQlOHiURHjDLYHSvMUFibnFmekQqVOMuhxrGw7sZRZiycvPS5US57
  0GMkMApCijNA9uBCymLzHKSgnzMjIwMAjxFKQW5WaWoMq/YhTnYFQS5n3iATSFJzOvBG7TK6A
  jmICO8Cg5CnJESSJCSqqBqWtdQ6NHicn71Jw8TSfN0xc5LitW2j3XC9kd8EFqzXK7vj18fycd
  /x8l/bokTXLKhOedkivMONZMvVR+73DXVWuZXFamm9pKOkq2pTKngxuTfsdufuK875Wg2P2Xh
  o0PBPX+lRqzyXDN1NboO1YbV5DV15/7bdXHG0fij9Z6PA1avHW/5TpppjVW1zanHdub6r3pVu
  rDOCH135sUylbNL+ZkdEqYsahST44lecWqLSePqNgmORnVHzTn0Q5IN/rRZj3/6QZno9dBF6T
  MN/X/jTrh9uf8S+mf3KlHXmZPfX5J8lbs9+7XgR/7i+dqvp/vamW54sTpioq4+alGyuY79A8e
  n2qdtUs9Yo+I0JIoJZbijERDLeai4kQA+RQGG2QDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-16.tower-591.messagelabs.com!1673939915!383282!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.102.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 7473 invoked from network); 17 Jan 2023 07:18:35 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-16.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 17 Jan 2023 07:18:35 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 98C9A100194
	for <openembedded-devel@lists.openembedded.org>; Tue, 17 Jan 2023 07:18:35 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 8C1E8100182
	for <openembedded-devel@lists.openembedded.org>; Tue, 17 Jan 2023 07:18:35 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Tue, 17 Jan 2023 07:18:33 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] xterm: upgrade 377 -> 378
Date: Tue, 17 Jan 2023 15:18:16 +0800
Message-ID: <1673939896-20171-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1673939896-20171-1-git-send-email-wangmy@fujitsu.com>
References: <1673939896-20171-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Jan 2023 07:18:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100608

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Copyright year updated to 378

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-graphics/xorg-app/{xterm_377.bb => xterm_378.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-graphics/xorg-app/{xterm_377.bb => xterm_378.bb} (89%)

diff --git a/meta-oe/recipes-graphics/xorg-app/xterm_377.bb b/meta-oe/recipes-graphics/xorg-app/xterm_378.bb
similarity index 89%
rename from meta-oe/recipes-graphics/xorg-app/xterm_377.bb
rename to meta-oe/recipes-graphics/xorg-app/xterm_378.bb
index e96c014ab2..c82042b215 100644
--- a/meta-oe/recipes-graphics/xorg-app/xterm_377.bb
+++ b/meta-oe/recipes-graphics/xorg-app/xterm_378.bb
@@ -2,13 +2,13 @@ require recipes-graphics/xorg-app/xorg-app-common.inc
 SUMMARY = "xterm is the standard terminal emulator for the X Window System"
 DEPENDS = "libxaw xorgproto libxext libxau libxinerama libxpm ncurses desktop-file-utils-native"
 
-LIC_FILES_CHKSUM = "file://xterm.h;beginline=3;endline=31;md5=5ec6748ed90e588caa9318b780a0d498"
+LIC_FILES_CHKSUM = "file://xterm.h;beginline=3;endline=31;md5=9c96124b492c0c02356850c243aaeca2"
 
 SRC_URI = "http://invisible-mirror.net/archives/${BPN}/${BP}.tgz \
            file://0001-Add-configure-time-check-for-setsid.patch \
           "
 
-SRC_URI[sha256sum] = "db108fe7a45d8ed97e604721b58443b473649e61e263631bf8759f8618a990b2"
+SRC_URI[sha256sum] = "649dfbfd5edd0ed9e47cf8e4d953b4b0d3c30bc280166dfc4ffd14973fec3e92"
 
 PACKAGECONFIG ?= ""
 PACKAGECONFIG[xft] = "--enable-freetype,--disable-freetype,libxft fontconfig freetype-native"
-- 
2.25.1


