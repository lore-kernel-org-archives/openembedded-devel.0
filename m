Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91696C64ED3
	for <webhook@archiver.kernel.org>; Mon, 18 Apr 2022 14:26:02 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com
 [195.245.230.81])
 by mx.groups.io with SMTP id smtpd.web12.2555.1649986691695026983
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Apr 2022 18:38:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=G/g2EKgB;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.81,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1649986689; i=@fujitsu.com;
	bh=ATpGfa1LatcnYwRJtnUhECOgUcuUAa88FZ8Us3PUfMI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=G/g2EKgB3tPvhPZ++CQlaB+7rmYa1qblRJwkBeqsTps9MqCDR73YNH6AGc3q8v+65
	 7tk5AdKq9gM6qJjgyOhyqvAa2B6Hik/UKEPToCvwxWxhPp2dJj40SZ5S/T93dSZry9
	 SVtJehApqWEQC1Jw+AI4MAxxHwbB9cEQZAS70flip9WwlNuQxpNKvfN+MprIvn29Ns
	 OQ+N7CVYZ88OwjlthJUP9+wgZHdaMF/kc0zkAGLnR4MHQkMNWlqCa4FtllTKsdlGKn
	 MlBYTt+WDnMqiFxnDk8dZ/Y+qKJZigfohBaeKHCUyiWWVGiPVE7A4+9PHps/ngpQEq
	 wqCNyV0GLB5NA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrPIsWRWlGSWpSXmKPExsViZ8ORqNtwJiL
  J4O5CFYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNeNo02X2gku8FZMe/WZqYJzK08XIxSEk8IRR
  4lTfKhYI5wKTRMOLG1DOHkaJLed3s3YxcnKwCahJTL91A8wWEdCXWDp7DzOIzSygIvHidw87i
  C0sYCnxrf8DWJxFQFXi0K3ZjCA2r4CTxOw/C8B6JQQUJKY8fM8MEReUODnzCQvEHAmJgy9eME
  PUKErMvtzMAmFXSMya1cYEYatJXD23iXkCI/8sJO2zkLQvYGRaxWiVVJSZnlGSm5iZo2toYKB
  raGiqa6JrZGypl1ilm6iXWqpbnlpcomuol1herJdaXKxXXJmbnJOil5dasokRGJYpxSzvdzA2
  9f3UO8QoycGkJMo7NT4iSYgvKT+lMiOxOCO+qDQntfgQowwHh5IEb8AJoJxgUWp6akVaZg4wR
  mDSEhw8SiK8AjuB0rzFBYm5xZnpEKlTjLocaxsO7GUWYsnLz0uVEufdcQqoSACkKKM0D24ELF
  4vMcpKCfMyMjAwCPEUpBblZpagyr9iFOdgVBLmNQW5hCczrwRu0yugI5iAjvi2KhTkiJJEhJR
  UA5OZ2f8pZwNilrytM3o0fffpz5PmahezuX+LWTHjpPjdclUP6ZpzPYdd3QN3WBwJKrtbcj3p
  6J5ce47OyMmb5xQ9b+3Z/ySMqyujN9UvtthGvvpm56rcI9eeCz+ZF7BlufW8Yw9EkvSqVaNjl
  7/lqSr3kKwzSNQ9beV6f9GVUA/lCuNbdrEHl0/17d573GQrn9qJ5qXq02aoCNQ6epod1nOsS+
  laZ7hg8/0zJ9Lnfl1qE/mp++H5Y7xcUTfPsdf++M7TblnxJmPjOU3RKJ/fLB19Te0f1Nadm7Z
  utjfrR8cPSqmne5WX5rH7X/nj+o7/x06rpBgv63n2UopGm37PPjJLRTFvwa07r9TmLepnnaXE
  UpyRaKjFXFScCAD4wJl+UgMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-7.tower-585.messagelabs.com!1649986688!35379!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 31798 invoked from network); 15 Apr 2022 01:38:08 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-7.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 15 Apr 2022 01:38:08 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 2283F1001AA
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Apr 2022 02:38:08 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 0A40A100195
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Apr 2022 02:38:08 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Fri, 15 Apr 2022 02:37:58 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] xterm: upgrade 368 -> 372
Date: Fri, 15 Apr 2022 09:37:50 +0800
Message-ID: <1649986673-24913-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 18 Apr 2022 14:26:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96659

License-Update: Copyright year updated to 2022

Changelog:
==========
     * amend   allocation/freeing  of  scrollback  lines,  eliminating  an
       adjustment  for status-line added in patch #371

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-graphics/xorg-app/{xterm_368.bb => xterm_372.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-graphics/xorg-app/{xterm_368.bb => xterm_372.bb} (89%)

diff --git a/meta-oe/recipes-graphics/xorg-app/xterm_368.bb b/meta-oe/recipes-graphics/xorg-app/xterm_372.bb
similarity index 89%
rename from meta-oe/recipes-graphics/xorg-app/xterm_368.bb
rename to meta-oe/recipes-graphics/xorg-app/xterm_372.bb
index 8f6a7ef766..3e1e9d7042 100644
--- a/meta-oe/recipes-graphics/xorg-app/xterm_368.bb
+++ b/meta-oe/recipes-graphics/xorg-app/xterm_372.bb
@@ -2,13 +2,13 @@ require recipes-graphics/xorg-app/xorg-app-common.inc
 SUMMARY = "xterm is the standard terminal emulator for the X Window System"
 DEPENDS = "libxaw xorgproto libxext libxau libxinerama libxpm ncurses desktop-file-utils-native"
 
-LIC_FILES_CHKSUM = "file://xterm.h;beginline=3;endline=31;md5=987de9787175385203a1ea2482246a17"
+LIC_FILES_CHKSUM = "file://xterm.h;beginline=3;endline=31;md5=5ec6748ed90e588caa9318b780a0d498"
 
 SRC_URI = "http://invisible-mirror.net/archives/${BPN}/${BP}.tgz \
            file://0001-Add-configure-time-check-for-setsid.patch \
           "
 
-SRC_URI[sha256sum] = "2ff5169930b6b49ef0bafb5e1331c94f1a98c310442bba7798add821c76ae712"
+SRC_URI[sha256sum] = "c6d08127cb2409c3a04bcae559b7025196ed770bb7bf26630abcb45d95f60ab1"
 
 PACKAGECONFIG ?= ""
 PACKAGECONFIG[xft] = "--enable-freetype,--disable-freetype,libxft fontconfig freetype-native"
-- 
2.25.1


