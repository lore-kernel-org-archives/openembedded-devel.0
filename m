Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.69])
 by mx.groups.io with SMTP id smtpd.web11.2177.1617244061101021029
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 Mar 2021 19:27:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=DARrr+/l;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.69, mailfrom: zangrc.fnst@fujitsu.com)
Return-Path: <zangrc.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1617244059; i=@fujitsu.com;
	bh=2KWAbXJzY9StReYUIjhcxdFfsXB/4ojfqPKO25ocNDs=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=DARrr+/l0t68ncdn6bJsEU9O1M/SQ9bInXShciW+vnZkTJCprs5CBaaUVe+tjtWz1
	 FkCkdEazNUWNtBEZ7uM2aZhTaQ4yvCsBrLohVKwOkfWSfCLbu0noZR0UkQ740H18X7
	 bWZeJekni6io3Wsg/o7NlDYWEpFc5DOLHxy5Shh6lSzmnuXEFAWCuyB0BObrhkO+Sm
	 vhYrs1HYc4r2udHf/9EU3GGcRP+RxM0vTNoVjmSViSNc9U2oVmbdqxpBUgz54rrC2e
	 LPi1bv3OJq1tOK+DowLLA/EtuTQ4LrLN6Tp2aWjF458MzjREX+ETWFqEwqjnU8VHzM
	 PrgxkTuBB6wOw==
Received: from [100.112.198.228] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-5.bemta.az-b.eu-west-1.aws.symcld.net id 20/24-53303-A9F25606; Thu, 01 Apr 2021 02:27:38 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrPIsWRWlGSWpSXmKPExsViZ8MRojtLPzX
  BoOO4psXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmvGgwbvgPmdFx+EVLA2MPzm6GLk4hAS2Mkm8
  nbmLCcI5zihx7kMfSxcjJwebgI5Ex4tuMFtEQF9i6ew9zCC2sIC7xKVzf1lBbBYBFYlZ746Dx
  XmB4ttXXQWzJQQUJKY8fA8VF5Q4OfMJ2BxmAQmJgy9eQNUoSmzfeYYFwq6SODv7C9MERp5ZSF
  pmIWlZwMi0itEiqSgzPaMkNzEzR9fQwEDX0NBI19DSXNfQ2FwvsUo3SS+1VLc8tbhE11Avsbx
  Yr7gyNzknRS8vtWQTIzCMUgqOdu5g/PXqg94hRkkOJiVR3inTUhKE+JLyUyozEosz4otKc1KL
  DzHKcHAoSfA+1ktNEBIsSk1PrUjLzAGGNExagoNHSYTXRgMozVtckJhbnJkOkTrF6MrxbO2SR
  cwcG+YtBZL/794Fkv0LDq5m5rjZfmg1sxBLXn5eqpQ4LxfIbAGQ5ozSPLjRsHi8xCgrJczLyM
  DAIMRTkFqUm1mCKv+KUZyDUUmYVwZkCk9mXgncBa+AjmMCOu7Ko0SQ40oSEVJSDUxmQeGflF1
  P85rN5zp8/LbBs075WX8lr5p0Lo0VnMt47V/YHL4UnqfhVzompB61mXhYOVh5DselH/c/O972
  nfyDl3PmBa31JlXczhnfKq9XLvZ2yuD4oaeTo53+uqZ/6/3ulpO3xJVm73y/Pyec6U/Bmv+XZ
  /EVmVjP5SqWOhy9dKq+kuksz+532p/+XXilvHtC0C5Ji2i2ja3tCn5yEwO/J+rsYprOobTDsd
  Z90X8N3+zt8seFZp/fdyh1T9O+OhuTTEXpbboCHt+fd3xbXiDWGKuYFs71ZmuKUeYVpcMC4V8
  VZ9450MPX6CK3qN1+qdM87i/FZ5/ZtlekbVxgMmVq2sMnU44JNd48/8tIyUqJpTgj0VCLuag4
  EQBp9HUsQgMAAA==
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-14.tower-291.messagelabs.com!1617244058!93964!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 17192 invoked from network); 1 Apr 2021 02:27:38 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-14.tower-291.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 1 Apr 2021 02:27:38 -0000
Received: from R01UKEXCASM223.r01.fujitsu.local (ex2k13_223.fs.fujitsu.com [10.182.185.121])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1312RcZk016424
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 1 Apr 2021 03:27:38 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 1 Apr 2021 03:27:36 +0100
From: "zangrc" <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-gnome] [PATCH] gnome-autoar: upgrade 0.2.4 -> 0.3.1
Date: Thu, 1 Apr 2021 10:27:29 +0800
Message-ID: <1617244049-91752-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 .../{gnome-autoar_0.2.4.bb => gnome-autoar_0.3.1.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-gnome/recipes-gnome/gnome-autoar/{gnome-autoar_0.2.4.bb => gnome-autoar_0.3.1.bb} (66%)

diff --git a/meta-gnome/recipes-gnome/gnome-autoar/gnome-autoar_0.2.4.bb b/meta-gnome/recipes-gnome/gnome-autoar/gnome-autoar_0.3.1.bb
similarity index 66%
rename from meta-gnome/recipes-gnome/gnome-autoar/gnome-autoar_0.2.4.bb
rename to meta-gnome/recipes-gnome/gnome-autoar/gnome-autoar_0.3.1.bb
index afeda3e93..5e833a91a 100644
--- a/meta-gnome/recipes-gnome/gnome-autoar/gnome-autoar_0.2.4.bb
+++ b/meta-gnome/recipes-gnome/gnome-autoar/gnome-autoar_0.3.1.bb
@@ -9,8 +9,8 @@ DEPENDS = " \
 
 inherit gnomebase gobject-introspection gtk-doc vala
 
-SRC_URI[archive.md5sum] = "36ab263f477eeee3c95c9381766eb3c2"
-SRC_URI[archive.sha256sum] = "0a34c377f8841abbf4c29bc848b301fbd8e4e20c03d7318c777c58432033657a"
+SRC_URI[archive.md5sum] = "3149496d0189623a8e1289bbab4d8385"
+SRC_URI[archive.sha256sum] = "0e78713e6f0de339fdee16bab82753ae290fe80fa7b4ba6e3db8c1465b81d0f8"
 
 do_compile_prepend() {
     export GIR_EXTRA_LIBS_PATH="${B}/gnome-autoar/.libs"
-- 
2.25.1

