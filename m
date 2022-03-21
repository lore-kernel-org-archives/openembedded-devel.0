Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE23BC433F5
	for <webhook@archiver.kernel.org>; Mon, 21 Mar 2022 19:39:43 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg
 [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web12.253.1647891581660159998
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Mar 2022 12:39:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=NWwx6KHY;
 spf=permerror,
 err=parse error for token &{10 18 spf.securedserverspace.com}: parse error
 for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded
 (domain: konsulko.com, ip: 79.124.30.14, mailfrom: leon.anavi@konsulko.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=anavi.org;
	s=default; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=0BEf4CPaQ0WIy/OLHkKXHmPWTKYweLKw7u/LD9taoGU=; b=NWwx6KHYGVgSrAZOQJQaYtDoRR
	2SWJzhDwBNwpVpgGJCh5ZjKCQn5D+EhJFnKFdWNUPt8BUzDNI1ar8l0A0T2QDssOLOVhFiM0Xfxdb
	+IOsJpOX93E6nR9oy/fbFWR3uqki8srmoBkW2irrKmqcNEplfHHga+UV2EWfeYsNMdSV4gII+4kjL
	XAubfEoOV9ZpgPTOq1cPPSllxUft9bSx7WgE8odHQ3A18/KdtJWwsXlWPbFHZb9TZDymSWB83dyXV
	9Ren611O+axtKLf/ogbL5OhJxvPIgskzXM9Lx6OqQmx8IOFMgq/Qb+Pdrsbx/Js1QtBNHsBmJRSeb
	+xcUf2Tg==;
Received: from lan.nucleusys.com ([92.247.61.126]:38484 helo=tone.k.g)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.94.2)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1nWNt5-0009eP-MY; Mon, 21 Mar 2022 21:39:41 +0200
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-oe][PATCH] xbindkeys: Add recipe
Date: Mon, 21 Mar 2022 21:39:29 +0200
Message-Id: <20220321193929.1529905-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OutGoing-Spam-Status: No, score=-1.0
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - voyager.superhosting.bg
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - konsulko.com
X-Get-Message-Sender-Via: voyager.superhosting.bg: authenticated_id:
 leon@anavi.org
X-Authenticated-Sender: voyager.superhosting.bg: leon@anavi.org
X-Source: 
X-Source-Args: 
X-Source-Dir: 
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 21 Mar 2022 19:39:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96114

xbindkeys is an application that allows you to launch shell
commands with your keyboard or your mouse under X Window. It links
commands to keys or mouse buttons, using a configuration file. It
is independant of the window manager and can capture all keyboard
keys.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../xbindkeys/xbindkeys_1.8.7.bb               | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/xbindkeys/xbindkeys_1.8.7.bb

diff --git a/meta-oe/recipes-graphics/xbindkeys/xbindkeys_1.8.7.bb b/meta-oe/recipes-graphics/xbindkeys/xbindkeys_1.8.7.bb
new file mode 100644
index 000000000..0c316edf9
--- /dev/null
+++ b/meta-oe/recipes-graphics/xbindkeys/xbindkeys_1.8.7.bb
@@ -0,0 +1,18 @@
+SUMMARY = "xbindkeys - Tool for launching commands on keystrokes"
+HOMEPAGE = "http://www.nongnu.org/xbindkeys/xbindkeys.html"
+LICENSE = "GPL-2.0-only"
+LIC_FILES_CHKSUM = "file://COPYING;md5=7d715d0b23c4bd9265b7435f546e9fe8"
+SECTION = "x11"
+
+DEPENDS = "virtual/libx11"
+
+inherit features_check autotools
+
+# depends on virtual/libx11
+REQUIRED_DISTRO_FEATURES = "x11"
+
+SRC_URI = "http://www.nongnu.org/xbindkeys/xbindkeys-${PV}.tar.gz"
+SRC_URI[md5sum] = "b5e1a9668ba13ff8673836d1d965d951"
+SRC_URI[sha256sum] = "a29b86a8ec91d4abc83b420e547da27470847d0efe808aa6e75147aa0adb82f2"
+
+EXTRA_OECONF = "--disable-guile"
-- 
2.30.2


