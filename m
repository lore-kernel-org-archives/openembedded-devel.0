Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RAids-0003wN-30
	for openembedded-devel@lists.openembedded.org;
	Mon, 03 Oct 2011 15:33:12 +0200
Received: by gyg8 with SMTP id 8so3333738gyg.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Oct 2011 06:27:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=1y1umY1iBksz0YJqVOK30VN028e2ZvX4oJCHchp61XI=;
	b=PPA8r3IUJzODdNI/DhCboQ9kcSYZisxW1YfXImcdGiBNLfg3ZcpTfsAEcJ6vrmkVOb
	qveTsBYN/XndZN/dK0ZAoD2a27osjABjXNsBxs/68si/F9THHsIUcZlMoEL9blwfEo0E
	X507xRvihBmJS4lKKA6BLppeOcR1OSF1t/7JI=
Received: by 10.223.25.208 with SMTP id a16mr225146fac.19.1317648458524;
	Mon, 03 Oct 2011 06:27:38 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id f25sm21285623faf.7.2011.10.03.06.27.36
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 03 Oct 2011 06:27:37 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  3 Oct 2011 15:27:00 +0200
Message-Id: <65085e4216abcae0908909cd8e33072a86907c7b.1317648011.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <ebe115dd156cf69f5e7fb7076816c5faa3748ce6.1317648011.git.Martin.Jansa@gmail.com>
References: <ebe115dd156cf69f5e7fb7076816c5faa3748ce6.1317648011.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1317648011.git.Martin.Jansa@gmail.com>
References: <cover.1317648011.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-efl][PATCHv2 02/25] libxft, libxrender, renderproto: move native BBCLASSEXTENDs to oe-core
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
X-List-Received-Date: Mon, 03 Oct 2011 13:33:12 -0000

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
1.7.7



