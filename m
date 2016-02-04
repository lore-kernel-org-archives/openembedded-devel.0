Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f181.google.com (mail-qk0-f181.google.com
	[209.85.220.181])
	by mail.openembedded.org (Postfix) with ESMTP id 0ABB67721A
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 Feb 2016 11:17:10 +0000 (UTC)
Received: by mail-qk0-f181.google.com with SMTP id s5so19411472qkd.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Feb 2016 03:17:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=bcwTqYGISjvKQqbjIeq2JxLlkwRV53ZX2zo4Xw44FgY=;
	b=Fmw4azqtJHDfvo/uoAiRyXSNZlMlB5RTMbjJzqIdJS5zsnBG7+HiN5yv8uBrDF3DDP
	fN5PWoiLHhtHHMqeHD2vbOq/TPDhhmVvPsOVA3uuPVyM6tc66NufRDHBQtG/6oWzdfpw
	mSqgYoNj1+NX/p5PlkHNMgUle/0AlJptM3LKJTezbcV+axcar4fi7tQqO6MZTD8y+ekq
	yKX25JI6dFbicw2RtWvuMSjUOid2n2+TqS/qViNzXnttTBW4OAvybulr44+WvPyoHn2B
	dScP5O+9ObeSvYcxhl6v1UsmSLxP6XlvfGQn+rmWKbQRqkoljJ2YyHzEwEygtCB59Wub
	LjfQ==
X-Gm-Message-State: AG10YOT48DTBpHZlBtN5KY6iODyqIEh/A2hlXSJyJ9rmIysJVjJJOz59MHk61IZMLx2uMw==
X-Received: by 10.55.77.206 with SMTP id a197mr7993853qkb.43.1454584631189;
	Thu, 04 Feb 2016 03:17:11 -0800 (PST)
Received: from localhost ([177.127.6.77]) by smtp.gmail.com with ESMTPSA id
	107sm4755920qge.16.2016.02.04.03.17.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 04 Feb 2016 03:17:09 -0800 (PST)
Received: by localhost (sSMTP sendmail emulation);
	Thu, 04 Feb 2016 09:17:05 -0200
From: Otavio Salvador <otavio@ossystems.com.br>
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
Date: Thu,  4 Feb 2016 09:17:04 -0200
Message-Id: <1454584624-18202-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.7.0
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-qt5 PATCH] qt5-git.inc: Ensure we export the SRCREV as the module name
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
X-List-Received-Date: Thu, 04 Feb 2016 11:17:11 -0000

For components which use multiple Git repositories (e.g QtWebEngine)
it is important to have the module name exported so it can be referred
in SRCREV_FORMAT.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 recipes-qt/qt5/qt5-git.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-qt/qt5/qt5-git.inc b/recipes-qt/qt5/qt5-git.inc
index f8fb38b..bf0be7e 100644
--- a/recipes-qt/qt5/qt5-git.inc
+++ b/recipes-qt/qt5/qt5-git.inc
@@ -1,4 +1,4 @@
-# Copyright (C) 2012 O.S. Systems Software LTDA.
+# Copyright (C) 2012-2016 O.S. Systems Software LTDA.
 # Copyright (C) 2013-2014 Martin Jansa <martin.jansa@gmail.com>
 
 QT_MODULE ?= "${BPN}"
@@ -6,7 +6,7 @@ QT_MODULE_BRANCH ?= "5.6"
 
 # each module needs to define valid SRCREV
 SRC_URI = " \
-    ${QT_GIT}/${QT_MODULE}.git;branch=${QT_MODULE_BRANCH};protocol=${QT_GIT_PROTOCOL} \
+    ${QT_GIT}/${QT_MODULE}.git;name=${QT_MODULE};branch=${QT_MODULE_BRANCH};protocol=${QT_GIT_PROTOCOL} \
 "
 
 S = "${WORKDIR}/git"
-- 
2.7.0


