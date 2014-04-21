Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f51.google.com (mail-ee0-f51.google.com [74.125.83.51])
	by mail.openembedded.org (Postfix) with ESMTP id E19DE61116
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Apr 2014 11:53:36 +0000 (UTC)
Received: by mail-ee0-f51.google.com with SMTP id c13so3623224eek.10
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Apr 2014 04:53:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=o22fgPqA8EK+hN/coRXruk5DT/yaC072ZdoTx8AlbGI=;
	b=Oyc6AQ3ndNXkahpLf4+Qp+3vnygR4CCMb/39rLSH6b4UpkAevav5DtvGVmIj1ajkIE
	6cieMOKvHBwDGEDthvbwlo8PrzEO2eWwi4WsDhv3g8UHHseXuvOZYWtFq0Bq4Abi+UX5
	oRzsV+bjYEeUPHONNLIfLG6+fG+G+c5KrEj4Qgwko6v1g34xliCuj7/BVJ81D7ZVb0RO
	0inWu0ApoGgQnK2dlGT/8sQ0sQct0vFM4nIFOUEhSy279eGHvOOi4y/ANzR7Mvvl4MX8
	E/m91H1HVEREU2qm1B41XfmmEkA88ouHKsYXBwBkdWQW7ZrULAs4vhEN9+ufEfwK0212
	yLuA==
X-Received: by 10.14.214.198 with SMTP id c46mr47432780eep.29.1398081217504;
	Mon, 21 Apr 2014 04:53:37 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	n41sm102967240eeg.4.2014.04.21.04.53.35 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 21 Apr 2014 04:53:36 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 21 Apr 2014 13:53:41 +0200
Message-Id: <1398081221-29823-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-gnome][PATCH] gnome-backgrounds: add intltool-native dependency
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
X-List-Received-Date: Mon, 21 Apr 2014 11:53:40 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-gnome/recipes-gnome/gnome-backgrounds/gnome-backgrounds_2.32.0.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/gnome-backgrounds/gnome-backgrounds_2.32.0.bb b/meta-gnome/recipes-gnome/gnome-backgrounds/gnome-backgrounds_2.32.0.bb
index 5049cce..ca18341 100644
--- a/meta-gnome/recipes-gnome/gnome-backgrounds/gnome-backgrounds_2.32.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-backgrounds/gnome-backgrounds_2.32.0.bb
@@ -6,7 +6,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 SECTION = "x11/gnome"
 
 # glib-2.0 for glib-gettext.m4 which provides AM_GLIB_GNU_GETTEXT
-DEPENDS = "glib-2.0"
+# intltool-native for IT_PROG_INTLTOOL(0.35.0)
+DEPENDS = "glib-2.0 intltool-native"
 
 inherit gnomebase
 
-- 
1.9.1


