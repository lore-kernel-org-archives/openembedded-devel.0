Received: from mail-ea0-f170.google.com ([209.85.215.170])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UR0oB-0007Z8-Vm
	for openembedded-devel@lists.openembedded.org;
	Sat, 13 Apr 2013 15:48:52 +0200
Received: by mail-ea0-f170.google.com with SMTP id a15so1559367eae.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 13 Apr 2013 06:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=0rjiNMYY5Aw0BrTRU56sKqPdcR41Q/bnfkIkBhd0o6o=;
	b=D/kH8FjzMxscyb8Aga3xIqhCuJxJX+qOHVsh7uK/7SQxQZzh33W/kdHzAwpyKljSBj
	kie2APT2He7auLV3wgTj/FiMZOhh+wZxCxYGOjFHdg08uruJLA8DyFjLXwyKrmScMdFF
	0iD1F72tV4DVymepmNC7zwdS4Yq/JZE310yLYEWcKHCESYnTswmD2zWVIAG473XyGORn
	Nix3++vkVJ+QaTJv6FbYtf6MvVP8wnQ4itfPLSyW4BOrbz91PuNVcWdegmLhAFQGZCfM
	uTI9ewGNRPOEaTDzCy46gT8fioQioZy0v9ARgE+TNHH/jDWPCl0w+hi9DczQb+TVfmvV
	erLA==
X-Received: by 10.15.32.67 with SMTP id z43mr39516533eeu.24.1365859834152;
	Sat, 13 Apr 2013 06:30:34 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id bk42sm16496884eeb.3.2013.04.13.06.30.33
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 13 Apr 2013 06:30:33 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 13 Apr 2013 15:29:50 +0200
Message-Id: <1365859790-20947-33-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.1.5
In-Reply-To: <1365859790-20947-1-git-send-email-Martin.Jansa@gmail.com>
References: <1365859790-20947-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-systemd][PATCH 33/33] layer.conf: remove detection of other layers, now there are only oe-core bbappends
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
X-List-Received-Date: Sat, 13 Apr 2013 13:49:16 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-systemd/conf/layer.conf | 11 -----------
 meta-systemd/invalid.bb      |  2 --
 2 files changed, 13 deletions(-)
 delete mode 100644 meta-systemd/invalid.bb

diff --git a/meta-systemd/conf/layer.conf b/meta-systemd/conf/layer.conf
index c064333..f3fc45d 100644
--- a/meta-systemd/conf/layer.conf
+++ b/meta-systemd/conf/layer.conf
@@ -15,17 +15,6 @@ BBPATH .= ":${LAYERDIR}"
 BBFILES += "\
   ${LAYERDIR}/recipes-*/*/*.bb \
   ${LAYERDIR}/oe-core/recipes-*/*/*.bbappend \
-  ${LAYERDIR}/meta-oe/recipes-*/*/*.bbappend \
-  ${@base_contains('BBFILE_COLLECTIONS', 'systemd-layer',\
-                   '', '${LAYERDIR}/invalid.bb', d)} \
-  ${@base_contains('BBFILE_COLLECTIONS', 'gnome-layer',\
-                   '${LAYERDIR}/meta-gnome/recipes-*/*/*.bbappend', '', d)} \
-  ${@base_contains('BBFILE_COLLECTIONS', 'multimedia-layer',\
-                   '${LAYERDIR}/meta-multimedia/recipes-*/*/*.bbappend', '', d)} \
-  ${@base_contains('BBFILE_COLLECTIONS', 'networking',\
-                   '${LAYERDIR}/meta-networking/recipes-*/*/*.bbappend', '', d)} \
-  ${@base_contains('BBFILE_COLLECTIONS', 'xfce-layer',\
-                   '${LAYERDIR}/meta-xfce/recipes-*/*/*.bbappend', '', d)} \
 "
 
 BBFILE_COLLECTIONS += "systemd-layer"
diff --git a/meta-systemd/invalid.bb b/meta-systemd/invalid.bb
deleted file mode 100644
index b16787b..0000000
--- a/meta-systemd/invalid.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-Content of this file is invalid and is used by conf/layer.conf to
-ensure that BBFILES is expanded after BBFILE_COLLECTIONS.
-- 
1.8.1.5



