Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by mail.openembedded.org (Postfix) with ESMTP id 1A6ED6AC77
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Jul 2014 09:59:13 +0000 (UTC)
Received: by mail-wi0-f181.google.com with SMTP id bs8so680869wib.14
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Jul 2014 02:59:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=Y358c//uNLtLGLoBgTaGgcdfB3kvKYCWOdpIqGtSrPg=;
	b=GKwTQZkMqJ9DGspgdN7ruTvZfS3xvfVA6wGuHhGi8iNGZVuXPfPvZDJ2oXgWIFc6eM
	iXhRQXsmJq/Ico2fqTKxt3hxlllTtU+wjXbwKMe2ikgmL90ernvD+BXEMTbkcSmWB2hQ
	+CmFSdBVHjo6aPI5MPwNBtXgfnk8t4zQ62HONVzPNwGgYTehj1kDh54nsUE8UaHymcqt
	U55HLHZjzVLBbux+EliSTdxrxu847BabCeuQ2NKd+L4ACQFgwDovRyq3BUZO+ToXHIqT
	ZQhhAZ7LuWSebPjeRuP85KEM2cug8dijegglmf6NlKqerVa0RoMVr95JFz7jb9zKDduF
	VT/w==
X-Received: by 10.180.75.49 with SMTP id z17mr3580703wiv.80.1406282354802;
	Fri, 25 Jul 2014 02:59:14 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	go4sm23866929wjc.39.2014.07.25.02.59.13 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 25 Jul 2014 02:59:14 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 25 Jul 2014 11:59:28 +0200
Message-Id: <1406282368-13223-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.2
Subject: [meta-oe][PATCH] modemmanager: add dbus-glib dependency
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
X-List-Received-Date: Fri, 25 Jul 2014 09:59:20 -0000

* otherwise fails with:
  | checking for MM... no
  | configure: error: Package requirements (dbus-glib-1 >= 0.86 glib-2.0
    >= 2.18 gmodule-2.0 gobject-2.0) were not met:
  |
  | No package 'dbus-glib-1' found

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-connectivity/networkmanager/modemmanager_0.6.0.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/networkmanager/modemmanager_0.6.0.0.bb b/meta-oe/recipes-connectivity/networkmanager/modemmanager_0.6.0.0.bb
index 759c86e..5ff18da 100644
--- a/meta-oe/recipes-connectivity/networkmanager/modemmanager_0.6.0.0.bb
+++ b/meta-oe/recipes-connectivity/networkmanager/modemmanager_0.6.0.0.bb
@@ -1,4 +1,4 @@
-DEPENDS = "ppp udev glib-2.0"
+DEPENDS = "ppp udev glib-2.0 dbus-glib"
 
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
-- 
2.0.2


