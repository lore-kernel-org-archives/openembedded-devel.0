Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF0A5C6FA82
	for <webhook@archiver.kernel.org>; Tue, 20 Sep 2022 02:20:34 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.3])
 by mx.groups.io with SMTP id smtpd.web10.7316.1663640424537295692
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Sep 2022 19:20:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=CjXsAX2s;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.3,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1663640423; i=@fujitsu.com;
	bh=027+I8M51o/BqiKyotMzgmOqwXGidNzxxtUl8fS51ys=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=CjXsAX2sYgIEeS3Ges9YkeQiiJP+iddmktS2vduSG3YQMb8PPF59XR9Pavns68t70
	 Z3GmxIjoxUZLBOYgGsPxouPR1+nWXNLW0xcqp9Bwcb5ZV3zbwc3HMkffZ7MVtHDm1z
	 ntZsDJBUMvv3I6WIwkvzVTGXYdHAZGRqiprG+Q/mjkqDTZXzyZgjGVatzH1pXkurPB
	 In3v7gNtxg6mKLH1ZYixmPtkPZ6nV5bW1pFEAY1MIDq2BAlVrYM/SVM3caZAq/49Qc
	 CP78tMWX2rmqm8YBiUkJ1FBdalxlS+vo7eG5ADOzyp5l1+mdu4c5dQJs5+wumhZR9v
	 T7VOW2oZJw7Ug==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrKIsWRWlGSWpSXmKPExsViZ8MxSTdNWTP
  Z4NkzLouLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPZwWWsBZs4Kl63fmRpYLzF3sXIxSEk8IRR
  Yv/xOWwQznUmiUlv7kNl9jBKTLgwCSjDycEmoCYx/dYNVhBbREBfYunsPcwgNrOAisSL3z3sI
  LawgIPE5nmHWUBsFgFViYnrfoLFeQWcJD5MvAsWlxBQkJjy8D0zRFxQ4uTMJywQcyQkDr54wQ
  xRoygx+3IzVH2FROP0Q0wQtprE1XObmCcw8s9C0j4LSfsCRqZVjFZJRZnpGSW5iZk5uoYGBrq
  Ghqa6xsa65iZ6iVW6iXqppbrlqcUlukZ6ieXFeqnFxXrFlbnJOSl6eaklmxiBYZlSrOi1g/HV
  ip96hxglOZiURHm56jSShfiS8lMqMxKLM+KLSnNSiw8xynBwKEnw2gtqJgsJFqWmp1akZeYAY
  wQmLcHBoyTCyyYFlOYtLkjMLc5Mh0idYjTmWNtwYC8zx8yvbQeYhVjy8vNSpcR5UxSASgVASj
  NK8+AGwWL3EqOslDAvIwMDgxBPQWpRbmYJqvwrRnEORiVh3nA5oCk8mXklcPteAZ3CBHTKDRV
  1kFNKEhFSUg1MHBf353Zc6/eeaM2RFOMomFUcEPCwZeutMzV/VhYXMQt4VsxhbHFgTZlv8m1O
  neHr1Te/tzbahZsYsPNeOrbF6NDUp+dbPzb8D0/K2ydz3OD+o0nXPSdYnT4Vvognac3k7RdWX
  DUKf2Ac7CV5KPuGoNR0X6/iF3bfJq6I9Xofnqy+Wis8aYqHyuLkZ2J7pizwFVP2tmK761jzjY
  9p+l+ObJYnCyM/sizz3cUga5kdcZXHP3mytd8WnQmJVrp+t3+HuNq4f1/98yjj5uL79Y+V2Y4
  c9p7y+sRCveVVMk+ZNydnmG3tCjtwdPYLm4ony/UrlzM/0JXXPf9OIvv3p6zYzpn/ngvIn925
  Z6rjG4l5SizFGYmGWsxFxYkASz2XTVgDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-7.tower-565.messagelabs.com!1663640422!770553!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 17943 invoked from network); 20 Sep 2022 02:20:22 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-7.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 20 Sep 2022 02:20:22 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id DE3A11000CC
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Sep 2022 03:20:21 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121
 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id D1660100078
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Sep 2022 03:20:21 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 20 Sep 2022 03:20:20 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] xlsfonts: upgrade 1.0.6 -> 1.0.7
Date: Tue, 20 Sep 2022 10:20:08 +0800
Message-ID: <1663640408-27358-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Sep 2022 02:20:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98880

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../xorg-app/{xlsfonts_1.0.6.bb => xlsfonts_1.0.7.bb}         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-graphics/xorg-app/{xlsfonts_1.0.6.bb => xlsfonts_1.0.7.bb} (65%)

diff --git a/meta-oe/recipes-graphics/xorg-app/xlsfonts_1.0.6.bb b/meta-oe/recipes-graphics/xorg-app/xlsfonts_1.0.7.bb
similarity index 65%
rename from meta-oe/recipes-graphics/xorg-app/xlsfonts_1.0.6.bb
rename to meta-oe/recipes-graphics/xorg-app/xlsfonts_1.0.7.bb
index 76b76e4b37..e5cd0ce6fb 100644
--- a/meta-oe/recipes-graphics/xorg-app/xlsfonts_1.0.6.bb
+++ b/meta-oe/recipes-graphics/xorg-app/xlsfonts_1.0.7.bb
@@ -6,5 +6,5 @@ SECTION = "x11/app"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=5ec74dd7ea4d10c4715a7c44f159a40b"
 
-SRC_URI[md5sum] = "5774fd4f518b3f338f2b28f270e04bfc"
-SRC_URI[sha256sum] = "89b80b3a030006ab6cef717be286c12f2477894b227158b1e6133274f6ebd368"
+SRC_URI_EXT = "xz"
+SRC_URI[sha256sum] = "7b726945a967b44c35cddee5edd74802907a239ce2e2e515730b8a32c8e50465"
-- 
2.25.1


