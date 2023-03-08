Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28A0DC64EC4
	for <webhook@archiver.kernel.org>; Wed,  8 Mar 2023 13:24:01 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web10.6679.1678281833568081285
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Mar 2023 05:23:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=S5SkWrc9;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1678281831; i=@fujitsu.com;
	bh=HjJSx0toPbrH5EDzv4g3nZsruThk6wj05R7Nu+JQW0Y=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=S5SkWrc9ZLygd884PxYPWDtYk7Ux4MqZpGo28mqdSHzWqOG1R5KXnt+hAq0YQb9e4
	 jIga4BvYoBivZMCQOTDTs/aM1LHbU2miE6ZAZyr+E95dXSMVdvpR/aeSf1WZbG6UKf
	 1NdhQX7lCdet/hq94gSpTmS+MCNmYNqQWzqZRpYjfTl3Rhx46C6O6muPQDJy+zBepx
	 i+/0RmQ4FJP4cQzjFx251SSjvEoMYn6qlEE+T6k6gFWeGZXZY+a9XswWuB7gJ/obE1
	 DLeGLwoRLzkmzk1CA/gOvagwusEbgX9Ec/SFtmrqmsZtvNsFwjhT5FELgCQyHlVgs0
	 bDBBHGeDEVlew==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrAIsWRWlGSWpSXmKPExsViZ8MxSTe9hyP
  F4NJFIYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePn1IXsBfc5KybM+8vawHiMo4uRi0NI4Amj
  xOxFD1ghnBtMEve/9zNBOHsYJf48u8XWxcjJwSYgJXHj/n8wW0RAX2Lp7D3MIDazgIrEi9897
  CC2sICjxIctJ5hAbBag+OSFaxhBbF4BJ4kPa++wgNgSAgoSUx6+Z4aIC0qcnPmEBWKOhMTBFy
  +YIWoUJWZfboaqr5Ro/fALylaTuHpuE/MERv5ZSNpnIWlfwMi0itG8OLWoLLVI19BIL6koMz2
  jJDcxM0cvsUo3US+1VDcvv6gkQ9dQL7G8WC+1uFivuDI3OSdFLy+1ZBMjMCBTitPcdjD+7vur
  d4hRkoNJSZSXNYYjRYgvKT+lMiOxOCO+qDQntfgQowwHh5IE76cuoJxgUWp6akVaZg4wOmDSE
  hw8SiK8d+uB0rzFBYm5xZnpEKlTjIpS4rwbQPoEQBIZpXlwbbCIvMQoKyXMy8jAwCDEU5BalJ
  tZgir/ilGcg1FJmHc7yBSezLwSuOmvgBYzAS2+sJ8FZHFJIkJKqoHpdvHP9LKK///ni8x/opt
  y9uPVbee8kiK4igSOGO1Y5BcT65iTMXfKHb2VkrvntJx4/tH84+HfSpNOrSiUO3BbfEOpabRv
  6Ey2nJ0v307dd/rtFNu5j5lKlDjFms/P5WcWqCnoFGd1/L6Z9/lOu7AZqu7PmIoW+7tyndj94
  IKhRf2aN3wLxSK/zr/1Nae8rrKCydIo9dK5YMF7HzftNvXYuPTnzsZt6fxBaldqn+0R4fvqu1
  Di0v+Q7xvMc4X5cqtuWayr6BdmWJFy+28lg4DNolAZybwP9zsk/GvW5Kou+aFkvNiYxXyF2G+
  5G/MWtE8xk7jnpX4qM8in/9yyo+vvndhgtiG29GXP1dJtr/++VWIpzkg01GIuKk4EALMMsCxD
  AwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-17.tower-732.messagelabs.com!1678281830!977330!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.103.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 31928 invoked from network); 8 Mar 2023 13:23:51 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-17.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 8 Mar 2023 13:23:51 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id ADE031000D5
	for <openembedded-devel@lists.openembedded.org>; Wed,  8 Mar 2023 13:23:50 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id A1C9E1000D2
	for <openembedded-devel@lists.openembedded.org>; Wed,  8 Mar 2023 13:23:50 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Wed, 8 Mar 2023 13:23:49 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] libjcat: upgrade 0.1.12 -> 0.1.13
Date: Wed, 8 Mar 2023 21:23:36 +0800
Message-ID: <1678281820-25489-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Mar 2023 13:24:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101416

From: Wang Mingyu <wangmy@fujitsu.com>

New Features:
 - Add support for SHA512 checksums
 - Add the ability to add and remove support for blob types (#72)

Bugfixes:
 - Fix header includes for clang-tidy
 - Show the expected SHA checksum in the error

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libjcat/{libjcat_0.1.12.bb => libjcat_0.1.13.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-gnome/libjcat/{libjcat_0.1.12.bb => libjcat_0.1.13.bb} (94%)

diff --git a/meta-oe/recipes-gnome/libjcat/libjcat_0.1.12.bb b/meta-oe/recipes-gnome/libjcat/libjcat_0.1.13.bb
similarity index 94%
rename from meta-oe/recipes-gnome/libjcat/libjcat_0.1.12.bb
rename to meta-oe/recipes-gnome/libjcat/libjcat_0.1.13.bb
index ff573ff7d..2f8cf1b22 100644
--- a/meta-oe/recipes-gnome/libjcat/libjcat_0.1.12.bb
+++ b/meta-oe/recipes-gnome/libjcat/libjcat_0.1.13.bb
@@ -11,7 +11,7 @@ SRC_URI = "\
     git://github.com/hughsie/libjcat.git;branch=main;protocol=https \
     file://run-ptest \
 "
-SRCREV = "898b80468288bc6278b73210783ba1f7c0219c71"
+SRCREV = "f089d7ff9081bb6f211cdd712cddd159f8f63199"
 S = "${WORKDIR}/git"
 
 inherit gobject-introspection gtk-doc meson ptest-gnome vala lib_package
-- 
2.34.1


