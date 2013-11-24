Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f170.google.com (mail-ea0-f170.google.com
	[209.85.215.170])
	by mail.openembedded.org (Postfix) with ESMTP id 580596D977
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Nov 2013 14:49:10 +0000 (UTC)
Received: by mail-ea0-f170.google.com with SMTP id k10so1853540eaj.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Nov 2013 06:49:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=0s6+OJvtqeZTkCWJbmG3cD3ikNF6OpFRccC+/j9X2Z0=;
	b=X1UPmUnozjB9DQuascbLVSyDppAc0ftZqYQiriOGlQPNM1aN70yEvpyUEAhDG+k5E7
	k1C/9V+H7fUI+PqjtfhsAeVoCx5mfy43fZJSMTt4RUI0D5JucS/d0cnJw4ndEpLlh3eM
	wTgWebYVkXqiGA63H1/Jd86AmRlUIXsCLGlOnBUN0C8FOeYeed0HlInXMw9FwxczgRUY
	kjSwoyBAbyz9BtLPpni5r9Zgfxr7pZzGJVP4XMqvNKFCspvpiwzBmUEfJYOCDTQnvTGe
	lUc5k3shcW/1V+sJw50okID1F8QJA3cwB08N+HwheCmt1mOWBoezG8PuoNE1cMuF4yLL
	yBgQ==
X-Received: by 10.14.105.200 with SMTP id k48mr29808675eeg.1.1385304549612;
	Sun, 24 Nov 2013 06:49:09 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id e43sm13820188eep.7.2013.11.24.06.49.08
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 24 Nov 2013 06:49:09 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 24 Nov 2013 15:49:08 +0100
Message-Id: <1385304548-11573-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.4.3
Subject: [meta-systemd][PATCH] lighttpd: Rename .bbappend to match new version from oe-core
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
X-List-Received-Date: Sun, 24 Nov 2013 14:49:10 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../lighttpd/{lighttpd_1.4.32.bbappend => lighttpd_1.4.33.bbappend}     | 2 --
 1 file changed, 2 deletions(-)
 rename meta-systemd/oe-core/recipes-extended/lighttpd/{lighttpd_1.4.32.bbappend => lighttpd_1.4.33.bbappend} (77%)

diff --git a/meta-systemd/oe-core/recipes-extended/lighttpd/lighttpd_1.4.32.bbappend b/meta-systemd/oe-core/recipes-extended/lighttpd/lighttpd_1.4.33.bbappend
similarity index 77%
rename from meta-systemd/oe-core/recipes-extended/lighttpd/lighttpd_1.4.32.bbappend
rename to meta-systemd/oe-core/recipes-extended/lighttpd/lighttpd_1.4.33.bbappend
index 5cb6bf4..f006b3f 100644
--- a/meta-systemd/oe-core/recipes-extended/lighttpd/lighttpd_1.4.32.bbappend
+++ b/meta-systemd/oe-core/recipes-extended/lighttpd/lighttpd_1.4.33.bbappend
@@ -1,5 +1,3 @@
-PRINC := "${@int(PRINC) + 2}"
-
 RPROVIDES_${PN} += "${PN}-systemd"
 RREPLACES_${PN} += "${PN}-systemd"
 RCONFLICTS_${PN} += "${PN}-systemd"
-- 
1.8.4.3


