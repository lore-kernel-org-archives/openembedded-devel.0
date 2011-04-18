Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QBloE-0007Fg-EX
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 Apr 2011 12:35:58 +0200
Received: by mail-fx0-f47.google.com with SMTP id 19so3317704fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Apr 2011 03:33:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=J8rX808T4H4hDUAaWceyUWqJuiDAzWE2f2B6b2ugVIs=;
	b=Jwt/0NyzGXZ3ubKkfbqenAGJMP2HeuZAjSuBHbnaahOLOSXGNcMSpKagAJJSed+oXz
	REEbZ4fFzngzO3HVGYg4+suHlrLu1g9c42YcpTYlfx4PaWj4DCR9ug6ee75yLWYXPZPH
	tAHTReA8Z5eDx9Nbmz53NWC4ZXNrDRltQIaok=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=HHnDap4fsyDYr9UjpsLjUy5QxwpAC5uNTvOHUSdy1GvJFsTIPO2bcJwv1KRZtlDEXy
	FukL35IzEnnMYKHJPhBB2rgbFhJygwiTWE3yLoclxnEMZH5h99Bkj6pYbceMcJF5eSZD
	ZthQS/434WpI2EjiF7vpAMvCBmWSpk0y1bZrM=
Received: by 10.223.14.137 with SMTP id g9mr4789944faa.1.1303122820544;
	Mon, 18 Apr 2011 03:33:40 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id j12sm1624286fax.9.2011.04.18.03.33.39
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 18 Apr 2011 03:33:39 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 18 Apr 2011 12:33:34 +0200
Message-Id: <d3d30a1362a77cf1c19aa5c479327632b5261d94.1303122650.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.5.rc1
In-Reply-To: <cover.1303122650.git.Martin.Jansa@gmail.com>
References: <cover.1303122650.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 07/13] xorg-xserver-common.inc: add virtual/xserver-xf86 to PROVIDES, to be able to blacklist xserver-xf86-lite from oe-core
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 18 Apr 2011 10:35:58 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../xorg-xserver/xorg-xserver-common.inc           |    7 ++++++-
 1 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/meta-oe/recipes-graphics/xorg-xserver/xorg-xserver-common.inc b/meta-oe/recipes-graphics/xorg-xserver/xorg-xserver-common.inc
index 79f13fc..fdce06c 100644
--- a/meta-oe/recipes-graphics/xorg-xserver/xorg-xserver-common.inc
+++ b/meta-oe/recipes-graphics/xorg-xserver/xorg-xserver-common.inc
@@ -5,7 +5,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=3dd2bbe3563837f80ed8926b06c1c353"
 
 INC_PR = "r18"
 
-PROVIDES = "virtual/xserver"
+# xf86-*-* packages depend on an X server built with the xfree86 DDX
+# so we have a virtual to represent that:
+PROVIDES = "virtual/xserver-xf86"
+
+# Other packages tend to just care that there is *an* X server:
+PROVIDES += "virtual/xserver"
 
 # Config manager for xserver, options are: hal, udev, empty (for configuration in xorg.conf)
 DISTRO_XORG_CONFIG_MANAGER ?= "hal"
-- 
1.7.5.rc1



