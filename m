Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1R9cjh-0007eY-R7
	for openembedded-devel@lists.openembedded.org;
	Fri, 30 Sep 2011 15:02:41 +0200
Received: by mail-bw0-f47.google.com with SMTP id 11so1747506bke.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Sep 2011 05:57:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=kzdmsmjbJzLbIa45XZQuk3CD1enrN5TfgU9kOeFagAw=;
	b=nutRlitOv2CJ9cSrGljeHzEvlEoXmtyCVS/M8pPwr5niU4VPkXhj8irJs/SGaRSull
	0L0IMKkMGQjDM/fELkBSL4/viT3OcKcyW4KudRIX30JUlSufOa9e7RG2tNJF5IAFiUUO
	McvaKi7h86eglSmua/6//565Gzchst84qBY9I=
Received: by 10.204.132.87 with SMTP id a23mr2935842bkt.285.1317387435069;
	Fri, 30 Sep 2011 05:57:15 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id b17sm4882750bkd.8.2011.09.30.05.57.13
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 30 Sep 2011 05:57:14 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 30 Sep 2011 14:56:39 +0200
Message-Id: <d7c874d141803c9479886b03f9c15cd8b1236afd.1317387144.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.6.1
In-Reply-To: <7a73a24c82f9d721c3342a14097cb105ba82a3ca.1317387144.git.Martin.Jansa@gmail.com>
References: <7a73a24c82f9d721c3342a14097cb105ba82a3ca.1317387144.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1317387144.git.Martin.Jansa@gmail.com>
References: <cover.1317387144.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-efl][PATCH 03/15] libxft, libxrender, renderproto: move native BBCLASSEXTENDs to oe-core
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
X-List-Received-Date: Fri, 30 Sep 2011 13:02:41 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../xorg-lib/libxft_2.2.0.bbappend                 |    1 -
 .../xorg-lib/libxrender_0.9.6.bbappend             |    1 -
 .../xorg-proto/renderproto_0.11.1.bbappend         |    1 -
 3 files changed, 0 insertions(+), 3 deletions(-)
 delete mode 100644 meta-oe/recipes-graphics/xorg-lib/libxft_2.2.0.bbappend
 delete mode 100644 meta-oe/recipes-graphics/xorg-lib/libxrender_0.9.6.bbappend
 delete mode 100644 meta-oe/recipes-graphics/xorg-proto/renderproto_0.11.1.bbappend

diff --git a/meta-oe/recipes-graphics/xorg-lib/libxft_2.2.0.bbappend b/meta-oe/recipes-graphics/xorg-lib/libxft_2.2.0.bbappend
deleted file mode 100644
index 608377e..0000000
--- a/meta-oe/recipes-graphics/xorg-lib/libxft_2.2.0.bbappend
+++ /dev/null
@@ -1 +0,0 @@
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-oe/recipes-graphics/xorg-lib/libxrender_0.9.6.bbappend b/meta-oe/recipes-graphics/xorg-lib/libxrender_0.9.6.bbappend
deleted file mode 100644
index 608377e..0000000
--- a/meta-oe/recipes-graphics/xorg-lib/libxrender_0.9.6.bbappend
+++ /dev/null
@@ -1 +0,0 @@
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-oe/recipes-graphics/xorg-proto/renderproto_0.11.1.bbappend b/meta-oe/recipes-graphics/xorg-proto/renderproto_0.11.1.bbappend
deleted file mode 100644
index 608377e..0000000
--- a/meta-oe/recipes-graphics/xorg-proto/renderproto_0.11.1.bbappend
+++ /dev/null
@@ -1 +0,0 @@
-BBCLASSEXTEND = "native nativesdk"
-- 
1.7.6.1



