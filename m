Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45FC5C54F3B
	for <webhook@archiver.kernel.org>; Tue,  5 Apr 2022 17:24:49 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web11.2654.1649137340917418866
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Apr 2022 22:42:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=PPENg/mV;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1649137339; i=@fujitsu.com;
	bh=aahRx6Dutbr0y9WrOl4vvrdwIvHy/yGaskbEDS65fIw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=PPENg/mVcshE3aQBg9M458GFPhBAPEwGaAZCeGZ5+NyVtvX8oC1WnST+2UhDjSGa/
	 fvKwHsbztwbez2cMprPsNUDEAvtoxDA0nUZ1hWz9L3CMUoaq0z+SSEKpyhhGZrm9of
	 fkS6tf4kJyyb+6JFdKqsTvdUjcowDNR1d3eU1WDZ6f4LQ/0zZOtdMiAZbPNhcl7tGr
	 NNd58j+pOJssdbgUQ2CJf5Xe47kEpSpccnXFrnp+b3jfQopy+DMNLC4QfUHJQoAUzM
	 Zmx03JR7/A2+IzWoJMosuY+7cWUnIYI+2OOKlayec4aF5UirrHGxZOSS69TizCrGkC
	 supHxEz3j6Opg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrKIsWRWlGSWpSXmKPExsViZ8ORqLvrmne
  SwYJ2TYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePky7lMBUc4K5raF7A3MD7l6GLk5BASeMIo
  cX6pTxcjF5B9gUli98Id7BCJ3YwSE/fagthsAmoS02/dYAWxRQT0JZbO3sMMYjMLqEi8+N0DV
  i8s4CFx68xJMJsFKP5hQisjiM0r4CTx6sNUsLiEgILElIfvwXo5BZwlXh98xgqxy0ni8Y8ONo
  h6QYmTM5+wQMyXkDj44gUzRK+ixOzLzSwQdoXErFltTBC2msTVc5uYJzAKzkLSPgtJ+wJGplW
  MVklFmekZJbmJmTm6hgYGuoaGprrGlroWRnqJVbqJeqmluuWpxSW6QG55sV5qcbFecWVuck6K
  Xl5qySZGYAinFKsH7WD8tuKn3iFGSQ4mJVHeM67eSUJ8SfkplRmJxRnxRaU5qcWHGGU4OJQke
  E+eBcoJFqWmp1akZeYA4wkmLcHBoyTCe+QiUJq3uCAxtzgzHSJ1ilGXY23Dgb3MQix5+XmpUu
  K8N68AFQmAFGWU5sGNgMX2JUZZKWFeRgYGBiGegtSi3MwSVPlXjOIcjErCvFZXgabwZOaVwG1
  6BXQEE9AR7854ghxRkoiQkmpgOtbI/WH1XC3raPbTHNpMuxNupM5bKzdf6PU2vRrtaNtFy5N5
  H2WczA1doDPvc4/8Wb6G7UoXe6Z+nb1760lvS807R45OW+7CtHdByHWdul2mkveMrWTsTFLlJ
  /1Q8+do3yhk/SHDTO7DPe7yfqENCw//+myRvSwi78CVSjeTmtye+XYZNTVbfwsUln9I2qDmtG
  32mR0n9gg9d+S6b814s9Oj8fq6vxdObvt44KCiRTZHtWBJUFHwDSFnLWn3jTGJFrfv5/WufPl
  TgpHLqfjPcr/j3PaFYbfDIy7Vmye7KhRMOu354O7HQ1dCWLrVOq4FJK8+5cBducT04W5vac/3
  H73PqkmLp8jP2lR4PG+hEktxRqKhFnNRcSIA29HEhWgDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-8.tower-548.messagelabs.com!1649137338!247126!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 19128 invoked from network); 5 Apr 2022 05:42:18 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-8.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 5 Apr 2022 05:42:18 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 362F010019E
	for <openembedded-devel@lists.openembedded.org>;
 Tue,  5 Apr 2022 06:42:18 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id E42771001B0
	for <openembedded-devel@lists.openembedded.org>;
 Tue,  5 Apr 2022 06:42:17 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 5 Apr 2022 06:42:16 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] xorg-sgml-doctools: upgrade 1.11 -> 1.12
Date: Sat, 2 Apr 2022 20:38:35 +0800
Message-ID: <1648903115-19946-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1648903115-19946-1-git-send-email-wangmy@fujitsu.com>
References: <1648903115-19946-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Apr 2022 17:24:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96414

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{xorg-sgml-doctools_1.11.bb => xorg-sgml-doctools_1.12.bb} | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)
 rename meta-oe/recipes-graphics/xorg-doc/{xorg-sgml-doctools_1.11.bb => xorg-sgml-doctools_1.12.bb} (52%)

diff --git a/meta-oe/recipes-graphics/xorg-doc/xorg-sgml-doctools_1.11.bb b/meta-oe/recipes-graphics/xorg-doc/xorg-sgml-doctools_1.12.bb
similarity index 52%
rename from meta-oe/recipes-graphics/xorg-doc/xorg-sgml-doctools_1.11.bb
rename to meta-oe/recipes-graphics/xorg-doc/xorg-sgml-doctools_1.12.bb
index c9da9f5a1e..050cb29824 100644
--- a/meta-oe/recipes-graphics/xorg-doc/xorg-sgml-doctools_1.11.bb
+++ b/meta-oe/recipes-graphics/xorg-doc/xorg-sgml-doctools_1.12.bb
@@ -1,12 +1,10 @@
 require xorg-doc-common.inc
 PE = "1"
-PR = "${INC_PR}.0"
 
 DEPENDS += "util-macros"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=c8c6c808cd3c797a07b24e443af1c449"
 
-SRC_URI[md5sum] = "ee6dc0a8a693a908857af328b2462661"
-SRC_URI[sha256sum] = "e71ce1df82dcc51eb14be6f42171dcc6bdd11ef46c0c605d6da8af12bd73b74c"
+SRC_URI[sha256sum] = "65a9fdddedc17bd5e9c0b00d904960f03f047c3a62de5458989d493c29fec806"
 
 FILES:${PN} += " /usr/share/sgml/X11"
-- 
2.25.1


