Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by mail.openembedded.org (Postfix) with ESMTP id 3719A73D48
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 May 2015 16:11:27 +0000 (UTC)
Received: by widdi4 with SMTP id di4so208446500wid.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 May 2015 09:11:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=O4MZrvM7J75khDuViwxUtWB3XhoitWLFRl2KkN4nWoM=;
	b=fgHhJWc2SgeTVXBrD4Vm043fj9ueOwThp6mZmfb9EZb9yjAsiUA3AVWtNVIY2NUG0x
	rZpapKFkQtZnxIJcldhTQHHaJXuPefyn+QV7y8Hr0a+A6Ad+4+eJfs7fYhtXyuyBnshn
	QknYvxpV11VI3fq2eqmyLXfGw3893LURxYyYDmXBumAFNzuRDibKXBEZ5tJ//coaeAQ0
	22Lz1Z1o4xLh1mMeB6PNWwbDi0wZQg1eR/31WSQg3TAGLPLLDp6ljO9NTBngtCnvtZF3
	+aLRkOLB/1qtBQ7BrdElgaP8YLmdHKqqIm1/AnVHUpiIMIz1cPmXAc5qwFBGAm7wqTiK
	vHOQ==
X-Received: by 10.181.13.144 with SMTP id ey16mr15392863wid.38.1430928688922; 
	Wed, 06 May 2015 09:11:28 -0700 (PDT)
Received: from localhost.localdomain
	(ip-95-222-156-55.hsi15.unitymediagroup.de. [95.222.156.55])
	by mx.google.com with ESMTPSA id k9sm2846567wia.6.2015.05.06.09.11.27
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 06 May 2015 09:11:27 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  6 May 2015 18:10:45 +0200
Message-Id: <1430928646-2007-8-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1430928646-2007-1-git-send-email-schnitzeltony@googlemail.com>
References: <1430928646-2007-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 7/8] thunar: update to 1.6.8
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
X-List-Received-Date: Wed, 06 May 2015 16:11:28 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-xfce/recipes-xfce/thunar/{thunar_1.6.6.bb => thunar_1.6.8.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-xfce/thunar/{thunar_1.6.6.bb => thunar_1.6.8.bb} (87%)

diff --git a/meta-xfce/recipes-xfce/thunar/thunar_1.6.6.bb b/meta-xfce/recipes-xfce/thunar/thunar_1.6.8.bb
similarity index 87%
rename from meta-xfce/recipes-xfce/thunar/thunar_1.6.6.bb
rename to meta-xfce/recipes-xfce/thunar/thunar_1.6.8.bb
index ca48767..ed51cdb 100644
--- a/meta-xfce/recipes-xfce/thunar/thunar_1.6.6.bb
+++ b/meta-xfce/recipes-xfce/thunar/thunar_1.6.8.bb
@@ -7,8 +7,8 @@ DEPENDS = "exo glib-2.0 gtk+ gdk-pixbuf libxfce4util libxfce4ui xfconf libsm dbu
 inherit xfce gtk-doc
 
 SRC_URI = "http://archive.xfce.org/src/xfce/${BPN}/${@'${PV}'[0:3]}/Thunar-${PV}.tar.bz2"
-SRC_URI[md5sum] = "27a5343174593dd0067906c922e6af96"
-SRC_URI[sha256sum] = "b9a55104b18ae01c5190d7ea02cbd7ba56d7affed9df416bf7fec6dff2d889b2"
+SRC_URI[md5sum] = "d7c6ae92f180c1d8d5b4c3f368142252"
+SRC_URI[sha256sum] = "4079ccffe990cdccee48a0ae200d8a5bc9335c34721d7923b375795940cf79bb"
 
 S = "${WORKDIR}/Thunar-${PV}/"
 
-- 
1.9.3


