Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RVfTM-0008LO-Ua
	for openembedded-devel@lists.openembedded.org;
	Wed, 30 Nov 2011 09:24:56 +0100
Received: by mail-ey0-f175.google.com with SMTP id d13so325412eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Nov 2011 00:18:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=zb/4coGrSpNcoaTC1GYgSW3o4gpSx2VQkUr9yv0V82o=;
	b=BYd2kufo44VRpO0x+gIoPVt6jCc0QJx7H0MRlUTeQBMwXWhDE+k4g5KnaixMXyozI9
	UcRcAIPl6xkOvfXVg2iKBNOc8LPPIQ3/05En8Z8udnEw14nTkiBwES7ZbAvGjlB499ma
	Oq/hFne6FsYb+gPfa+pno+lSuezGnOOYAoxjc=
Received: by 10.213.27.74 with SMTP id h10mr190652ebc.72.1322641099085;
	Wed, 30 Nov 2011 00:18:19 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id 49sm3712957eec.1.2011.11.30.00.18.17
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 30 Nov 2011 00:18:17 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 30 Nov 2011 09:16:55 +0100
Message-Id: <7c1a8723e991d635c448e59ff9430601b8889556.1322640506.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.rc4
In-Reply-To: <55137a5d61c11567ab74d1c1382e04da35cecd5f.1322640506.git.Martin.Jansa@gmail.com>
References: <a>
	<55137a5d61c11567ab74d1c1382e04da35cecd5f.1322640506.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1322640506.git.Martin.Jansa@gmail.com>
References: <cover.1322640506.git.Martin.Jansa@gmail.com>
Subject: [meta-efl 08/11] edje: fix license metadata
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
X-List-Received-Date: Wed, 30 Nov 2011 08:24:57 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/efl/edje.inc |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-efl/recipes-efl/efl/edje.inc b/meta-efl/recipes-efl/efl/edje.inc
index b922f90..7c415d2 100644
--- a/meta-efl/recipes-efl/efl/edje.inc
+++ b/meta-efl/recipes-efl/efl/edje.inc
@@ -2,8 +2,9 @@ DESCRIPTION = "Edje is the Enlightenment graphical design & layout library"
 DEPENDS = "lua5.1 eet evas ecore embryo edje-native"
 DEPENDS_virtclass-native = "lua5.1-native evas-native ecore-native eet-native embryo-native"
 DEPENDS_virtclass-nativesdk = "evas-native ecore-native eet-native embryo-native"
-LICENSE = "MIT BSD"
-LIC_FILES_CHKSUM = "file://COPYING;md5=1f2d83425ec8dfae5cd77f8ce52e872c"
+# GPLv2 because of epp in PN-utils
+LICENSE = "MIT BSD GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=c18cc221a14a84b033db27794dc36df8"
 
 inherit efl
 
-- 
1.7.8.rc4



