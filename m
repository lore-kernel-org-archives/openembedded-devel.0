Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id BC71177293
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Feb 2016 14:11:37 +0000 (UTC)
Received: by mail-wm0-f46.google.com with SMTP id b205so36116556wmb.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Feb 2016 06:11:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=oXo/xnBgLwCzqW78fyugEteichJnYpDaYPXPcMlawfM=;
	b=eBJ1GOD71sMHxgAhF0Yt0Tl24yTdGdcCI1GCs9WbbTEMJnYJrbT2DFcgIaW8QAPOHn
	+gt9vfKO+7OB+qt8MH4XRoPMtEOrBBF5XOJDaZSlDtI6bngw/i1rmHxWevKUmKFbn1GV
	ZdPdh3t3/zxQmWtMO4ptJfETSmb34ssLvSLWXM9JKr3qDAY59GtsRVP79E1Fr1gDcLcs
	e6EiNV7veFwfS6oWA4IP+2QK659Z6ir6LipXEVxtFAmGBJWXyONnyY755u/FmXTo5n02
	RdDJDYRAIzZVM0r8eo7nLnnJHM/ZLwU8Eu2vF4LgihSdG9FJqtWy12SSyS78hqAar/iF
	B2oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=oXo/xnBgLwCzqW78fyugEteichJnYpDaYPXPcMlawfM=;
	b=m4jW/p2XSo/3DlM0PXkzNXBGVQEnUkko6ID6hs/O5Nt/wQR8YwYaaQPrh6QusoJdvc
	dt+YmC5P8yYpe+/mBDsxsv1Z+n6LYm0MKrqflQlWakfqdOmHa/fBkHBioc6p8paiDUO5
	VCG3sSXVX3JXV7ZSY4Hc5RgMow1dDkDdA7ZrGlgQZA0Bc/cZ8SH/U1f1rAltCC+ezbbc
	OIf0+6ny0YN2EdPbvgDwWVzFHUSx3uVELN7BiD0buiEbBYBCcPKbJXBcvBo/f3L5X/Dw
	RWAf1qhL3zYgBwDndomhzJfbiBsiMEwi+bUc/ODXbpjK46gDws7PjCT+Nsmg6Sch6IPe
	+2vQ==
X-Gm-Message-State: AG10YOSHxg98lVCgTCmK2H/aRuH9zRChycMtpQWMBDc+qX8HtZaUAg7R0uu9hhqCNPPBwA==
X-Received: by 10.28.174.8 with SMTP id x8mr25008511wme.49.1456323097571;
	Wed, 24 Feb 2016 06:11:37 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id d9sm3194555wjf.43.2016.02.24.06.11.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 24 Feb 2016 06:11:36 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 24 Feb 2016 15:12:40 +0100
Message-Id: <1456323160-30689-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.7.1
Subject: [PATCH][meta-oe] uim: fix packaging issues
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
X-List-Received-Date: Wed, 24 Feb 2016 14:11:38 -0000

* I'm not sure if these belong to uim-xim or rather uim-gtk2.0/uim-gtk3
  but original author obviously doesn't care so I'll follow the
  uim-candwin-gtk example and put them all in uim-xim
* fixes:
  uim-1.8.6: uim: Files/directories were installed but not shipped in any package:
  /usr/libexec/uim-candwin-horizontal-gtk
  /usr/libexec/uim-candwin-gtk3
  /usr/libexec/uim-candwin-tbl-gtk3
  /usr/libexec/uim-candwin-tbl-gtk
  /usr/libexec/uim-candwin-horizontal-gtk3
  Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
  uim: 5 installed and not shipped files. [installed-vs-shipped]

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/uim/uim_1.8.6.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/uim/uim_1.8.6.bb b/meta-oe/recipes-support/uim/uim_1.8.6.bb
index 5c502cf..42788e4 100644
--- a/meta-oe/recipes-support/uim/uim_1.8.6.bb
+++ b/meta-oe/recipes-support/uim/uim_1.8.6.bb
@@ -74,7 +74,8 @@ FILES_uim-utils = "${bindir}/uim-sh \
 		   ${libexecdir}/uim-helper-server"
 
 FILES_uim-xim = "${bindir}/uim-xim \
-                 ${libexecdir}/uim-candwin-gtk \
+                 ${libexecdir}/uim-candwin-*gtk \
+                 ${libexecdir}/uim-candwin-*gtk3 \
                  ${datadir}/man/man1/uim-xim.1 \
                  ${sysconfdir}/X11/xinit/xinput.d/uim*"
 
-- 
2.7.1


