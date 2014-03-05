Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f43.google.com (mail-ee0-f43.google.com [74.125.83.43])
	by mail.openembedded.org (Postfix) with ESMTP id EB0116DDD1
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Mar 2014 17:16:45 +0000 (UTC)
Received: by mail-ee0-f43.google.com with SMTP id e53so607453eek.30
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 Mar 2014 09:16:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=wqUHMXcg9M2dApmiltzaGcKLgB/2rJppTIO4HUO1mB0=;
	b=zZQcAU6YJkDqAuN6x08F83tZa/Gza30jiNzbOVqoAvBDjRFM32myxC0EzfQI7YG+fx
	bslZf2e+nDB0TRiaFJH45YtPH2ZZBGj4FndsqRGhNtVGEowdT7HbgwXmEmvkeMVS4I1n
	Sokm/zicgLgNwOBKhB4vgHtGINS1OmwC4XgITt/OurxV6xa7/X/1g0LjnwByQY01p7IS
	7p9p8DoVHLfQaNg3LtYMGdhVPq0yn+9KAaCu63ST8QuAxQxK2YzZb0YupT7QAQihjmIA
	BI/qdEcfs7Zkz4+CxAaWL7HLceaoUT+3VCLy9BoMg9rAlDBGfUwGp1AfVRdoTsO0sn4Z
	kApA==
X-Received: by 10.14.176.195 with SMTP id b43mr3887360eem.99.1394039805233;
	Wed, 05 Mar 2014 09:16:45 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	m1sm11329869een.7.2014.03.05.09.16.42 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 05 Mar 2014 09:16:43 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  5 Mar 2014 18:16:47 +0100
Message-Id: <1394039807-8852-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.9.0
Subject: [meta-handheld][PATCH] recipes: remove PRINCs
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
X-List-Received-Date: Wed, 05 Mar 2014 17:16:46 -0000

* patch with corresponding PR bumps was sent to oe-core

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-bsp/formfactor/formfactor_0.0.bbappend | 2 --
 recipes-bsp/keymaps/keymaps_1.0.bbappend       | 2 --
 2 files changed, 4 deletions(-)

diff --git a/recipes-bsp/formfactor/formfactor_0.0.bbappend b/recipes-bsp/formfactor/formfactor_0.0.bbappend
index b509028..5c85433 100644
--- a/recipes-bsp/formfactor/formfactor_0.0.bbappend
+++ b/recipes-bsp/formfactor/formfactor_0.0.bbappend
@@ -1,5 +1,3 @@
-PRINC := "${@int(PRINC) + 3}"
-
 FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
 
 do_install_prepend () {
diff --git a/recipes-bsp/keymaps/keymaps_1.0.bbappend b/recipes-bsp/keymaps/keymaps_1.0.bbappend
index ca8e236..b3bb193 100644
--- a/recipes-bsp/keymaps/keymaps_1.0.bbappend
+++ b/recipes-bsp/keymaps/keymaps_1.0.bbappend
@@ -1,5 +1,3 @@
-PRINC := "${@int(PRINC) + 2}"
-
 FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
 
 SRC_URI_append_c7x0         = " file://keymap-2.6.map"
-- 
1.9.0


