Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TOwO8-0004ts-IL
	for openembedded-devel@lists.openembedded.org;
	Thu, 18 Oct 2012 22:08:16 +0200
Received: by mail-we0-f175.google.com with SMTP id t44so5309353wey.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Oct 2012 12:54:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=tZut/sGRtIieK2twCFfnf2RxANKxXUNMRlc2gSZKCZI=;
	b=TFDVk+UmQPrR/KxTIO3ycntoykVOYlFk7a+swSlWP25LvIuqwHpbaUhT1/IsD8Es4U
	ov2sgJ4Elc+bS+joiASO+2O8Ctu3110r26O2Rr/QEtzh9G5SnWUFwttcMx9BPTBcUdwT
	bqUiih3O1Jlxt72xuwGpc7k3vEWlfGV6U3irs3Kfeq+67amiB0uh71RAJSLIdsi1ttGK
	k4xIT9G2FnU/AWnctTTTRbHNfjj2ogBrkDMXLLOEiYFVjXr9HI1yrPlQhvHV1Y4o9KY8
	18DXLB9dZtnnpL+u3m8syTIG5sNDh20KSltS4+2GDvW6PJx1f2YsiGxNHNrGH2nsLPyc
	Ocdg==
Received: by 10.180.77.38 with SMTP id p6mr13603673wiw.1.1350590097024;
	Thu, 18 Oct 2012 12:54:57 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id k20sm31190776wiv.11.2012.10.18.12.54.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 18 Oct 2012 12:54:56 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 18 Oct 2012 21:54:32 +0200
Message-Id: <eaefc0a114db90ebb3ab11d5dad5cad6d2c68b21.1350589969.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.12.4
In-Reply-To: <cover.1350589969.git.Martin.Jansa@gmail.com>
References: <cover.1350589969.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1350589969.git.Martin.Jansa@gmail.com>
References: <cover.1350589969.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 4/5] libxaw: drop libxp and printproto from DEPENDS
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
X-List-Received-Date: Thu, 18 Oct 2012 20:08:16 -0000

* it was removed from oe-core
  http://git.openembedded.org/openembedded-core/commit/?id=5b3748d463a6666c0d8e2624092619da8d8e6328
* there should be --disable-xprint/--without-xprint too, but it looks
  like all support for xprint was removed from libxaw already

  commit 012e73faab8dc8617c6da4679715dae14f6cddd4
  Author: Daniel Stone <daniel@fooishbar.org>
  Date:   Fri Aug 15 18:25:53 2008 +0300

    Remove last remaining vestiges of Xprint support

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-graphics/xorg-lib/libxaw_1.0.10.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-graphics/xorg-lib/libxaw_1.0.10.bb b/meta-oe/recipes-graphics/xorg-lib/libxaw_1.0.10.bb
index 88863a7..f5a4a6f 100644
--- a/meta-oe/recipes-graphics/xorg-lib/libxaw_1.0.10.bb
+++ b/meta-oe/recipes-graphics/xorg-lib/libxaw_1.0.10.bb
@@ -1,11 +1,11 @@
 require recipes-graphics/xorg-lib/xorg-lib-common.inc
 DESCRIPTION = "X Athena Widget Set"
-DEPENDS += "xproto virtual/libx11 libxext xextproto libxt libxmu libxpm libxp printproto libxau xmlto-native"
+DEPENDS += "xproto virtual/libx11 libxext xextproto libxt libxmu libxpm libxau xmlto-native"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=1c65719d42900bb81b83e8293c20a364"
 
 PE = "1"
-PR = "r1"
+PR = "r2"
 
 SRC_URI[md5sum] = "f1ea52debce7a18cc26b21647a00ad8b"
 SRC_URI[sha256sum] = "2d96bcf92638b8ec5c91d379f5ec2e7b15133adeb2ba22066d48bf3239ee1bdd"
-- 
1.7.12.4



