Return-Path: <net147@gmail.com>
Received: from mail-pd0-f171.google.com (mail-pd0-f171.google.com
	[209.85.192.171])
	by mail.openembedded.org (Postfix) with ESMTP id 7C6E873967
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Mar 2015 01:01:46 +0000 (UTC)
Received: by pdno5 with SMTP id o5so24761666pdn.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Mar 2015 18:01:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=SmHul4ik313RJKhnqqb6n0uyiGcXcX891TxUCvoRkz4=;
	b=o6FxDI+qTCFVSoqT5DuhBppxKPS9aWzhUcI74q7ivYuCpN76QSwAhNzaM4hi9VcoxF
	DUaL0CAlqjQOYzDk4P+c6wkkiniReL5s2PtnXrohNfZwtcqK2O3cGF3lrJtFYFaYpGX5
	/XpfEY6ZejQwGrwWVZvY1G07HcEGbv9X7zbPLwxdFyjX3YtIqjqx/PPrvtuGDjrWe1wX
	pw67rydT4TQDrPoldOm7djbUrKmHmC1JQStQQY4H5Q4hxBWbIGg9sObWkVXEZnTbCxLD
	sUdQLoXWxrUq2qjTLZOFQbDCodNpfpBEsdKOGhKHmpL3OHwtMPVGTZgF5y/hMUXJ389E
	n7KQ==
X-Received: by 10.70.42.45 with SMTP id k13mr10920154pdl.43.1425949307971;
	Mon, 09 Mar 2015 18:01:47 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id
	ff10sm21263753pad.1.2015.03.09.18.01.46
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 09 Mar 2015 18:01:47 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 10 Mar 2015 12:01:28 +1100
Message-Id: <1425949288-28288-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 2.3.1
Subject: [meta-qt5][PATCH] qt5-base: fix file ownership of fonts
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
X-List-Received-Date: Tue, 10 Mar 2015 01:01:48 -0000

The file ownership needs to be explicitly set otherwise it inherits
the user and group id of the build user.

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 recipes-qt/qt5/qtbase.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-qt/qt5/qtbase.inc b/recipes-qt/qt5/qtbase.inc
index d7c027f..93edb53 100644
--- a/recipes-qt/qt5/qtbase.inc
+++ b/recipes-qt/qt5/qtbase.inc
@@ -215,6 +215,7 @@ do_install_append() {
     # install fonts manually if they are missing
     if [ ! -d ${D}/${OE_QMAKE_PATH_LIBS}/fonts ]; then
         cp -a ${S}/lib/fonts ${D}/${OE_QMAKE_PATH_LIBS}
+        chown -R root:root ${D}/${OE_QMAKE_PATH_LIBS}/fonts
     fi
 
     # Remove example.pro file as it is useless
-- 
2.3.1


