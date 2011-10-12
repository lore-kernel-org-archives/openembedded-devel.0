Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RDoAE-0001EG-HQ
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 Oct 2011 04:03:22 +0200
Received: by iafi7 with SMTP id i7so7342iaf.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Oct 2011 18:57:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=1Y4U5W1gMSnnYUnYDBAWoMMe/F/DIddIi6GETtXAMTc=;
	b=M6Inyco4vyFjJvecPJUnN/tQYV6RB991QwG7ZC28xWeoS/S+wVigenU/2jz/lY9SpO
	c0/4YlR3uxOb7966OWfQefgtfz87iiSjaztdqOiEne61L4hN+qAmFmQU2FPmpb96Nd25
	RGw1UphV3LuugYOYTfvZHi2PriJCH/iF0jxu4=
Received: by 10.231.41.4 with SMTP id m4mr11326482ibe.44.1318384659988;
	Tue, 11 Oct 2011 18:57:39 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net. [99.57.141.118])
	by mx.google.com with ESMTPS id l28sm1449545ibc.3.2011.10.11.18.57.38
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 11 Oct 2011 18:57:39 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 11 Oct 2011 18:57:27 -0700
Message-Id: <1318384647-17338-2-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <1318384647-17338-1-git-send-email-raj.khem@gmail.com>
References: <1318384647-17338-1-git-send-email-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/2] mesa, xorg-xserver: include glx-use-tls.inc instead of inheriting glx-use-tls class
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
X-List-Received-Date: Wed, 12 Oct 2011 02:03:22 -0000

To match oe-core

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-graphics/mesa/mesa-common.inc      |    3 +--
 .../xorg-xserver/xorg-xserver-common.inc           |    4 ++--
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-graphics/mesa/mesa-common.inc b/meta-oe/recipes-graphics/mesa/mesa-common.inc
index 2e6b599..9b80ecd 100644
--- a/meta-oe/recipes-graphics/mesa/mesa-common.inc
+++ b/meta-oe/recipes-graphics/mesa/mesa-common.inc
@@ -25,8 +25,7 @@ EXTRA_OECONF = "--enable-glu \
                 --disable-glw \
                 --disable-glut \
 	       "
-
-inherit glx-use-tls
+include recipes-graphics/mesa/glx-use-tls.inc
 
 PACKAGES =+ "libegl libegl-dev libegl-dbg libglu libglu-dev libosmesa libosmesa-dev libgl libgl-dev"
 FILES_libegl = "${libdir}/libEGL.so.* ${libdir}/egl/*.so"
diff --git a/meta-oe/recipes-graphics/xorg-xserver/xorg-xserver-common.inc b/meta-oe/recipes-graphics/xorg-xserver/xorg-xserver-common.inc
index 0b4a854..13bfac7 100644
--- a/meta-oe/recipes-graphics/xorg-xserver/xorg-xserver-common.inc
+++ b/meta-oe/recipes-graphics/xorg-xserver/xorg-xserver-common.inc
@@ -36,8 +36,8 @@ SRC_URI = "${XORG_MIRROR}/individual/xserver/${XORG_PN}-${PV}.tar.bz2"
 
 S = "${WORKDIR}/${XORG_PN}-${PV}"
 
-inherit autotools pkgconfig glx-use-tls
-
+inherit autotools pkgconfig
+include recipes-graphics/mesa/glx-use-tls.inc
 EXTRA_OECONF += " --enable-xcalibrate \
                   --enable-kdrive \
                   --enable-xephyr \
-- 
1.7.5.4



