Return-Path: <net147@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id DFFD665D00
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  6 Aug 2017 07:15:58 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id l64so5796805pge.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 06 Aug 2017 00:16:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=xBnugcqey96YEX+WV+dqGohYBGPjCUuD56/nLQa0jGE=;
	b=gE14fS/F/AS0bh38RkrW3PIGzYmX/KSq1rTEFZLy0fss8NzAmow4J8z28Y6/O8fHRZ
	9+9GKghrtbGf2aqSYCfL7t9kZ0W0fyBQ/3MLYvLsbUJhzdn4kQ8V2fNKTl0xArEi/QVi
	tbAE0q0vRw9QQhlEIgyLgLZp4JJoeivCvdI29FcQcyGpHMF3/PkxZGUD/U2lo197Vzuf
	5vzWHlwrRdO2Pb6BMgiIBg+CcaGOxU4bjQJ25re41eqY4uWkAM/Zw70NsiyOKbq6fAne
	lqDprEK0w1N/VN1iyiAu4zsD7m6Y6S2ttxngYXWOGjGoDwG+DxYhjGsinNYoEzMB7L39
	BvPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=xBnugcqey96YEX+WV+dqGohYBGPjCUuD56/nLQa0jGE=;
	b=U7Rfb/2P3GaDtRo6XJ/a+z6IJyoNNS8bTGtXuzMfv6GDIx+tX7EEUnjrmU1vlltWqI
	c1hnHt+pAnh7d2kW7BdUVZWCMIgnDlHYlI9l0MP+WzshQyrtzT0oYu5bG6r6WVfEU/Wd
	fNHaX3J3mMs5LVidct+1dyhfRDgQoJ0Le8zzcY17hEFi0pJw2kREbM3gWzEjEhkw+JYh
	/bgZfXiMDW0L48icsoJPq6wx3ABuWzCnvKWhm4yuNY089jwuMTCDHWHx4iWE5/h+R8zJ
	1KIwE5h2BI82uI7IqUUvs0V5SvE8+SLtQxgjeQwseaDEYHWU2dRJ/6kUUm8rKWfiYRxN
	uisA==
X-Gm-Message-State: AHYfb5hl9Cn0dsN6viQCDQhttiLG9jJAmOBtrN8agrO1uAxKzqf5Wnto
	XxAT1lSh1+I8bA==
X-Received: by 10.98.67.208 with SMTP id l77mr8002604pfi.333.1502003760076;
	Sun, 06 Aug 2017 00:16:00 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by smtp.gmail.com with ESMTPSA id
	b84sm9001225pfj.128.2017.08.06.00.15.59
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 06 Aug 2017 00:15:59 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  6 Aug 2017 17:17:04 +1000
Message-Id: <20170806071704.17635-1-net147@gmail.com>
X-Mailer: git-send-email 2.13.2
Subject: [meta-qt5][PATCH] quazip: update to 0.7.3 and add missing metadata
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 06 Aug 2017 07:15:59 -0000

The license checksum has changed as a static linking exception has been
added on top of the LGPL 2.1 license.

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 recipes-qt/quazip/{quazip_0.7.2.bb => quazip_0.7.3.bb} | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)
 rename recipes-qt/quazip/{quazip_0.7.2.bb => quazip_0.7.3.bb} (43%)

diff --git a/recipes-qt/quazip/quazip_0.7.2.bb b/recipes-qt/quazip/quazip_0.7.3.bb
similarity index 43%
rename from recipes-qt/quazip/quazip_0.7.2.bb
rename to recipes-qt/quazip/quazip_0.7.3.bb
index 6b09cf9..970204e 100644
--- a/recipes-qt/quazip/quazip_0.7.2.bb
+++ b/recipes-qt/quazip/quazip_0.7.3.bb
@@ -1,11 +1,13 @@
 SUMMARY = "Qt/C++ wrapper for ZIP/UNZIP package"
+HOMEPAGE = "http://quazip.sourceforge.net/"
+BUGTRACKER = "https://sourceforge.net/p/quazip/bugs/"
 LICENSE = "LGPLv2.1"
-LIC_FILES_CHKSUM = "file://COPYING;md5=27818cd7fd83877a8e3ef82b82798ef4"
+LIC_FILES_CHKSUM = "file://COPYING;md5=910d778aab53617cbaf13c4e1810e289"
 DEPENDS = "qtbase"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.tar.gz"
-SRC_URI[md5sum] = "84163487a4c3470781c93e5f56c4ca43"
-SRC_URI[sha256sum] = "91d827fbcafd099ae814cc18a8dd3bb709da6b8a27c918ee1c6c03b3f29440f4"
+SRC_URI[md5sum] = "2ba7dd8b1d6dd588374c9fab5c46e76e"
+SRC_URI[sha256sum] = "2ad4f354746e8260d46036cde1496c223ec79765041ea28eb920ced015e269b5"
 
 inherit qmake5
 
-- 
2.13.2


