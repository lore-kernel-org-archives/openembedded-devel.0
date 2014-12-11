Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f43.google.com (mail-wg0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 2A60470A8B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Dec 2014 17:12:03 +0000 (UTC)
Received: by mail-wg0-f43.google.com with SMTP id l18so7065461wgh.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Dec 2014 09:12:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=MSvECX+LmeQW4H9uEgT2hxIQoS/NZ2MP+N8SY1GnS8k=;
	b=ZZk2+HF3J2JvKZAOly0dvxMlWWnBRn6IGR7+wkW5R7DGhf6BhaFTYl29EMS9JAMG82
	E89n/aLXvkmCgpPxPpIB1g/A/hL2qTMbk1MRs/KFZikBpTZ7lRw0Y5ClFSO/Xt1QUYnI
	a7PhzPyeh2kptoe0KuFlrZpSZGUThMPN60JHCc2dwxDj/Uj3a30apYWCF6+j+lX4DsSP
	PZlRQ+vRd3cFHUJfGTZo19yc3OgjruUT/xBFL0mrfcYdO8CpxUwy7p6virCMl6mibU6v
	/104XKQBYMmPnXtwCfiEPVZwVOWCuvFf0S6vB+MT4xAr0/Ih8zijaqvALAmuuTcT+NMg
	w6Tg==
X-Received: by 10.194.172.72 with SMTP id ba8mr19103859wjc.13.1418317924287;
	Thu, 11 Dec 2014 09:12:04 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	qg11sm3677816wic.17.2014.12.11.09.12.03 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 11 Dec 2014 09:12:03 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 11 Dec 2014 18:12:04 +0100
Message-Id: <1418317924-22256-3-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.1.3
In-Reply-To: <1418317924-22256-1-git-send-email-Martin.Jansa@gmail.com>
References: <1418317924-22256-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 3/3] gnome-bluetooth: blacklist, because dbus-binding-tool call is failing
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 11 Dec 2014 17:12:07 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_2.32.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_2.32.0.bb b/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_2.32.0.bb
index 4fd38a0..b9b7355 100644
--- a/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_2.32.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_2.32.0.bb
@@ -6,6 +6,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a \
 
 PR = "r1"
 
+PNBLACKLIST[gnome-bluetooth] ?= "dbus-binding-tool fails with: Unable to load gnome-bluetooth-2.32.0/lib/bluetooth-client.xml": "manager" is not a valid D-Bus interface name"
+
 SECTION = "x11/gnome"
 DEPENDS = "obexd gnome-doc-utils-native gnome-doc-utils gconf gtk+ dbus-glib libunique libnotify bluez4 gnome-keyring virtual/libx11 libxi intltool-native"
 
-- 
2.1.3


