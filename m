Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CBD9C4332F
	for <webhook@archiver.kernel.org>; Tue, 11 Jan 2022 15:28:40 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web12.8806.1641914918373609973
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Jan 2022 07:28:39 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@denx.de
 header.s=phobos-20191101 header.b=bzv7+7SK;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 8A4B682A71;
	Tue, 11 Jan 2022 16:28:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1641914915;
	bh=mSFDWybyHC5VG7H9JjgRrY3JXJJ13wHC55x4OW+c9Uo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bzv7+7SKHOzFbpH1TpoZJ/61T8j6S1e3k0609YI6v6tAfTH+i9t9FJSoJ58yiBSu2
	 56CBMiqV+ktjBrNj1DOTa+xy4cygqMdhxmcKbR2TKc3RtUGO1/EUmHjvnwdqlYOlD4
	 gtOb746DCgCZ5JHclwzPGriJ3qJfjjDuxvkrePoICp76nOWMXUdIYlPKVVStq1FbX9
	 Cj3JbrAGCq7alIFnX9ybLMymL80jZ8DvXpC8rSFyufCnTGPvqkx97stMuPqLgodYQU
	 I1JjFSViXH9GN4RXg2ZE8HyEhqu0HvvWaqnR52NHyS3dE1fN4IXHFdP5MDSlzzlaAN
	 f04R9E7P15Ypg==
From: Marek Vasut <marex@denx.de>
To: openembedded-devel@lists.openembedded.org
Cc: raj.khem@gmail.com,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	Marek Vasut <marex@denx.de>
Subject: [meta-oe][dunfell][PATCH 4/4] sdbus-c++-libsystemd: Fix build with
 kernel 5.15+
Date: Tue, 11 Jan 2022 16:28:14 +0100
Message-Id: <20220111152814.1270957-4-marex@denx.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220111152814.1270957-1-marex@denx.de>
References: <20220111152814.1270957-1-marex@denx.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 11 Jan 2022 15:28:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94747

From: Khem Raj <raj.khem@gmail.com>

Backport a patch from upstream systemd

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
(cherry picked from commit fc9a72ed804253a39d2a4fcef62202abcbb23567)
Signed-off-by: Marek Vasut <marex@denx.de>
---
 ...-linux-Sync-if_arp.h-with-Linux-5.14.patch | 29 +++++++++++++++++++
 .../sdbus-c++/sdbus-c++-libsystemd_243.bb     |  1 +
 2 files changed, 30 insertions(+)
 create mode 100644 meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd-2=
43/0001-basic-linux-Sync-if_arp.h-with-Linux-5.14.patch

diff --git a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd-243/0001=
-basic-linux-Sync-if_arp.h-with-Linux-5.14.patch b/meta-oe/recipes-core/s=
dbus-c++/sdbus-c++-libsystemd-243/0001-basic-linux-Sync-if_arp.h-with-Lin=
ux-5.14.patch
new file mode 100644
index 000000000..a251e3e6c
--- /dev/null
+++ b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd-243/0001-basic-=
linux-Sync-if_arp.h-with-Linux-5.14.patch
@@ -0,0 +1,29 @@
+From 4411a9a3ebff98b6fcf5967c75faa458d219df96 Mon Sep 17 00:00:00 2001
+From: Chris Packham <chris.packham@alliedtelesis.co.nz>
+Date: Fri, 10 Sep 2021 09:51:36 +1200
+Subject: [PATCH] basic/linux: Sync if_arp.h with Linux 5.14
+
+ARPHRD_MCTP was added in 5.14. Sync if_arp.h to pick up the definition
+
+Fixes #20694
+Upstream-Status: Backport [https://github.com/cpackham-atlnz/systemd/com=
mit/67cd626399b0d02882ee00716c8bd31ba764c862]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/basic/linux/if_arp.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/basic/linux/if_arp.h b/src/basic/linux/if_arp.h
+index c3cc5a9e5e..4783af9fe5 100644
+--- a/src/basic/linux/if_arp.h
++++ b/src/basic/linux/if_arp.h
+@@ -54,6 +54,7 @@
+ #define ARPHRD_X25	271		/* CCITT X.25			*/
+ #define ARPHRD_HWX25	272		/* Boards with X.25 in firmware	*/
+ #define ARPHRD_CAN	280		/* Controller Area Network      */
++#define ARPHRD_MCTP	290
+ #define ARPHRD_PPP	512
+ #define ARPHRD_CISCO	513		/* Cisco HDLC	 		*/
+ #define ARPHRD_HDLC	ARPHRD_CISCO
+--=20
+2.33.1
+
diff --git a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd_243.bb b=
/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd_243.bb
index 59d6f352c..ef3afcfb5 100644
--- a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd_243.bb
+++ b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd_243.bb
@@ -15,6 +15,7 @@ SRCBRANCH =3D "v243-stable"
 SRC_URI =3D "git://github.com/systemd/systemd-stable.git;protocol=3Dhttp=
s;branch=3D${SRCBRANCH} \
            file://static-libsystemd-pkgconfig.patch \
            file://7c5fd25119a495009ea62f79e5daec34cc464628.patch \
+           file://0001-basic-linux-Sync-if_arp.h-with-Linux-5.14.patch \
            "
=20
 # patches needed by musl
--=20
2.34.1


