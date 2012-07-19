Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SrrXf-0006l2-Fg
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Jul 2012 16:17:23 +0200
Received: by mail-wi0-f171.google.com with SMTP id hq4so5288172wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jul 2012 07:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=rOobmzFx83pwZ9YznBkDuIRpSgOdYn0rvJWAZIpNKpg=;
	b=lsZuAoqn4Rz/sdh+IPAPVWPC9BUfBw1JAfCc4ndYV3R5NXzG2ZZ42JlOuQQw9bcuDd
	bCbxYzJNnVtXzchm84BQdFHHxaswgbKQux1+tLYPAr3VUzUEbXghwf6K9t+cQABrvB1w
	KCYXlTqBomNSndbJzg7srFeHKIebjSWxYWSePsfPEkllbpPpymyNI/VExI4Bp0thDe4b
	9+o2nRL3NoVP1jhPhRftSgWOpIvTsIArYLXEdnEGLaSks/UZ73DmQqWM+92mWZrBcepT
	bbnb6v2MNCE//ia/kRiM+JsQY7+Xws6hrPj71VylFpg7VQ64JXNGRLmSU7/vnavuQism
	Z4WA==
Received: by 10.180.93.68 with SMTP id cs4mr16634887wib.14.1342706763735;
	Thu, 19 Jul 2012 07:06:03 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id b7sm6339603wiz.9.2012.07.19.07.06.02
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 19 Jul 2012 07:06:02 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 19 Jul 2012 16:05:38 +0200
Message-Id: <f84b0335cf4586262c78fcea70573ad11829af0d.1342706683.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <cover.1342706683.git.Martin.Jansa@gmail.com>
References: <cover.1342706683.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1342706683.git.Martin.Jansa@gmail.com>
References: <cover.1342706683.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 5/5] navit: use 4 spaces instead of tabs in get_navit_fpu_setting
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
X-List-Received-Date: Thu, 19 Jul 2012 14:17:23 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-navigation/navit/navit-fpu.inc |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-navigation/navit/navit-fpu.inc b/meta-oe/recipes-navigation/navit/navit-fpu.inc
index d333b92..08044ad 100644
--- a/meta-oe/recipes-navigation/navit/navit-fpu.inc
+++ b/meta-oe/recipes-navigation/navit/navit-fpu.inc
@@ -1,6 +1,6 @@
 
 def get_navit_fpu_setting(bb, d):
-	if bb.data.getVar('TARGET_FPU', d, 1) in [ 'soft' ]:
-		return "--enable-avoid-float"
-	return ""
+    if bb.data.getVar('TARGET_FPU', d, 1) in [ 'soft' ]:
+        return "--enable-avoid-float"
+    return ""
 
-- 
1.7.8.6



