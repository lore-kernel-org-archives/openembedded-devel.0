Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wg0-f41.google.com (mail-wg0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id F00B560034
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Mar 2015 23:34:23 +0000 (UTC)
Received: by wgdm6 with SMTP id m6so27059246wgd.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Mar 2015 16:34:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=QWo02e4p4flfgQjcuUNR2SaJi8Gqsto/Dhy3JHnpBiY=;
	b=xeUwDBXS7CYEX/hD8MVTy4TSIwCtmIebjY0lVgoMKFW2twpBcvfTlVgjLsuf7KsgZi
	3YbW5pioehHzqbkuoDHPu4mv6MdtrHGO4nFM5jWxjASQ072i0UcazrdJm8g+5ZaMk2Mq
	+K2kdcGacCLkOkH19vJuRAh++blnOCDPJz6GkgX05eZtjlGaoQ0oNxS5XjLg87t9fcbc
	y1TNsDNkBDXx2KyE18OVjq/2niQkCt/Fm3nGYXCwoyPDBjDmyAlo+j0tj0iOR7s/K04K
	thvzfVB3zJb2Niy3d1Zs3YyNutrUiN2nsDC4FbPAsp/WJ7mJohoZUJ7XYNULBpb4v6zm
	8hcA==
X-Received: by 10.194.85.233 with SMTP id k9mr51299806wjz.31.1426462464486;
	Sun, 15 Mar 2015 16:34:24 -0700 (PDT)
Received: from localhost.localdomain (p54AA52CC.dip0.t-ipconnect.de.
	[84.170.82.204]) by mx.google.com with ESMTPSA id
	r14sm12804945wiv.13.2015.03.15.16.34.23
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 15 Mar 2015 16:34:23 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 16 Mar 2015 00:33:31 +0100
Message-Id: <1426462419-10173-23-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1426462419-10173-1-git-send-email-schnitzeltony@googlemail.com>
References: <1426462419-10173-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH][meta-xfce 22/30] xfce4-taskmanager: update to 1.1.0
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
X-List-Received-Date: Sun, 15 Mar 2015 23:34:24 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

remove unused patch

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...d-documantation-Makefile-has-no-install-t.patch | 29 ----------------------
 ...manager_1.0.1.bb => xfce4-taskmanager_1.1.0.bb} |  4 +--
 2 files changed, 2 insertions(+), 31 deletions(-)
 delete mode 100644 meta-xfce/recipes-apps/xfce4-taskmanager/files/0001-do-not-build-documantation-Makefile-has-no-install-t.patch
 rename meta-xfce/recipes-apps/xfce4-taskmanager/{xfce4-taskmanager_1.0.1.bb => xfce4-taskmanager_1.1.0.bb} (60%)

diff --git a/meta-xfce/recipes-apps/xfce4-taskmanager/files/0001-do-not-build-documantation-Makefile-has-no-install-t.patch b/meta-xfce/recipes-apps/xfce4-taskmanager/files/0001-do-not-build-documantation-Makefile-has-no-install-t.patch
deleted file mode 100644
index eeee8f7..0000000
--- a/meta-xfce/recipes-apps/xfce4-taskmanager/files/0001-do-not-build-documantation-Makefile-has-no-install-t.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 9902fb9d4fce474426c35b73617149014799a0c8 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
-Date: Thu, 19 Sep 2013 16:43:59 +0200
-Subject: [PATCH] do not build documantation - Makefile has no install target
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Upstream-Status: Inappropriate [config]
-
-Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
----
- Makefile.am | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index 6ffa8d9..6aef17a 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -1,6 +1,5 @@
- SUBDIRS =								\
- 	po								\
--	doc								\
- 	src
- 
- desktopdir = $(datadir)/applications
--- 
-1.8.3.1
-
diff --git a/meta-xfce/recipes-apps/xfce4-taskmanager/xfce4-taskmanager_1.0.1.bb b/meta-xfce/recipes-apps/xfce4-taskmanager/xfce4-taskmanager_1.1.0.bb
similarity index 60%
rename from meta-xfce/recipes-apps/xfce4-taskmanager/xfce4-taskmanager_1.0.1.bb
rename to meta-xfce/recipes-apps/xfce4-taskmanager/xfce4-taskmanager_1.1.0.bb
index e597108..e24606c 100644
--- a/meta-xfce/recipes-apps/xfce4-taskmanager/xfce4-taskmanager_1.0.1.bb
+++ b/meta-xfce/recipes-apps/xfce4-taskmanager/xfce4-taskmanager_1.1.0.bb
@@ -6,5 +6,5 @@ inherit xfce-app
 
 DEPENDS = "gtk+ cairo libwnck xfce4-dev-tools-native exo-native"
 
-SRC_URI[md5sum] = "b8a707b25e32c1a296eb50d609aa49b8"
-SRC_URI[sha256sum] = "f5aa2796dd9971f8ae400238bfcdd9fa1322dba1466d1e6fd5bf8ee7e88bee86"
+SRC_URI[md5sum] = "7da465a4798629ebd8650fef62770ab7"
+SRC_URI[sha256sum] = "2e1eb161f966cbfbd68bd029fb59115bc5ab0c0704cb500d20e7d73967e59ecb"
-- 
1.9.3


