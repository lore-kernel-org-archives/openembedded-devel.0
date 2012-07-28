Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Sv6OP-0002QG-Ux
	for openembedded-devel@lists.openembedded.org;
	Sat, 28 Jul 2012 14:45:14 +0200
Received: by mail-wi0-f171.google.com with SMTP id hq4so388879wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 Jul 2012 05:33:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=nj6c9th0HTYGBUTxRj+H7tlUe8Zz5aynomCv+KN5Eyc=;
	b=m504H47gvcu87lV3XKYmftjjCGexAW9EUIlpUI6XVZ48laQhms165Y56XyLCQMKX3S
	yRv/yxBLVI7sldn1+XUHJs4ARwxVX98rdIPcxEkbY9RKQRwcM3mVfI9vnmq6qZ5lLU5R
	ozwyoeTwyNBH2bPOiYT3SxOXakzM/Y87mbSdedrqKS2ykC3G8VIZjiT/e64UannwCWWo
	ZYux3hZ7x/9sVGlnRe0nMJnP8uSRnaIKaKJ85gjk5Cs8BCC00DV+jsQq1dXwml/K4CwK
	6o0NxK3/HupL8wC4k30iOcLkvG4NDYEwTnl8LMybRGUJrSDtTU7T91gcQ+MBgTlLJ1rt
	qlLA==
Received: by 10.216.85.149 with SMTP id u21mr2686543wee.147.1343478822974;
	Sat, 28 Jul 2012 05:33:42 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id l5sm6058945wix.5.2012.07.28.05.33.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 28 Jul 2012 05:33:42 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 28 Jul 2012 14:33:14 +0200
Message-Id: <0b7f5913410c32268e0dbb388abd15cbd87497eb.1343478744.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <cover.1343478744.git.Martin.Jansa@gmail.com>
References: <cover.1343478744.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1343478744.git.Martin.Jansa@gmail.com>
References: <cover.1343478744.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 4/5] libgee: use gobject-introspection-stub instead of -native which was removed in oe-core
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
X-List-Received-Date: Sat, 28 Jul 2012 12:45:14 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-devtools/libgee/libgee_0.6.4.bb |    7 +++----
 1 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-devtools/libgee/libgee_0.6.4.bb b/meta-oe/recipes-devtools/libgee/libgee_0.6.4.bb
index 4e2c643..228f96c 100644
--- a/meta-oe/recipes-devtools/libgee/libgee_0.6.4.bb
+++ b/meta-oe/recipes-devtools/libgee/libgee_0.6.4.bb
@@ -1,9 +1,8 @@
 require libgee.inc
 PE = "1"
-PR = "${INC_PR}.0"
-#autoreconf needs introspection.m4 (staged by gobject-introspection-native) after http://git.gnome.org/browse/libgee/commit/?id=d026a29b38ca1a3388981c6e75a92602212373d8
-DEPENDS += "gobject-introspection-native"
-DEPENDS_virtclass-native += "gobject-introspection-native"
+PR = "${INC_PR}.1"
+DEPENDS += "gobject-introspection-stub"
+DEPENDS_virtclass-native += "gobject-introspection-stub-native"
 
 SHRT_VER = "${@bb.data.getVar('PV',d,1).split('.')[0]}.${@bb.data.getVar('PV',d,1).split('.')[1]}"
 SRC_URI = "http://ftp.gnome.org/pub/GNOME/sources/libgee/${SHRT_VER}/${BP}.tar.xz"
-- 
1.7.8.6



