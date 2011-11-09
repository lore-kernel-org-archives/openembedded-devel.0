Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1ROCMI-0008HM-75
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 Nov 2011 18:54:46 +0100
Received: by mail-fx0-f47.google.com with SMTP id t2so2009238faa.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 Nov 2011 09:48:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=HYN8t80g2WNcLmKodzwgu6gC6VHesddna6zxdUflTXI=;
	b=RTVFKLhsdAyq+JU9+eaWG6+m6jRDe6s62MkQlx/slufwnT4pw6ZzoX6Z1XiDwVSUHq
	S2fjFzYjgfzmG+PPk1vv3jxypQ07gaL0Y2icMlI0lzQBvkLRiSs0DoHKwQDVPya7OZdi
	GPzfinK6uCBFHBog7ws39coghEQ25hKHQYZEg=
Received: by 10.223.64.70 with SMTP id d6mr6254960fai.16.1320860912884;
	Wed, 09 Nov 2011 09:48:32 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id d22sm7430178fad.19.2011.11.09.09.48.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 09 Nov 2011 09:48:31 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  9 Nov 2011 18:47:56 +0100
Message-Id: <dba6cc5acf8984714e0dbf725b4b8601827f4671.1320860740.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.rc1
In-Reply-To: <31a2761c1b9ca9e31445017b8180474813aecef4.1320860740.git.Martin.Jansa@gmail.com>
References: <31a2761c1b9ca9e31445017b8180474813aecef4.1320860740.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1320860740.git.Martin.Jansa@gmail.com>
References: <cover.1320860740.git.Martin.Jansa@gmail.com>
Subject: [meta-oe 4/4] kbd: move to oe-core
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
X-List-Received-Date: Wed, 09 Nov 2011 17:54:46 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-core/kbd/kbd_1.15.2.bb |   19 -------------------
 1 files changed, 0 insertions(+), 19 deletions(-)
 delete mode 100644 meta-oe/recipes-core/kbd/kbd_1.15.2.bb

diff --git a/meta-oe/recipes-core/kbd/kbd_1.15.2.bb b/meta-oe/recipes-core/kbd/kbd_1.15.2.bb
deleted file mode 100644
index 36e68a0..0000000
--- a/meta-oe/recipes-core/kbd/kbd_1.15.2.bb
+++ /dev/null
@@ -1,19 +0,0 @@
-DESCRIPTION = "This package contains keytable files and keyboard utilities"
-# everything minus console-fonts is GPLv2+
-LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=587ce626d15bd61699a64a6b8a5afefb"
-
-inherit autotools gettext
-
-BBCLASSEXTEND = "native"
-
-SRC_URI="${KERNELORG_MIRROR}/linux/utils/kbd/kbd-1.15.2.tar.bz2"
-SRC_URI[md5sum] = "e850eb91e4d3b94b194efe8e953204c5"
-SRC_URI[sha256sum] = "b3602d191eef7a6a8317fc3cd231efa40a89ac235dce57a77cac825a2a21eba6"
-
-PACKAGES += "${PN}-consolefonts ${PN}-keymaps ${PN}-unimaps ${PN}-consoletrans"
-
-FILES_${PN}-consolefonts = "${datadir}/consolefonts"
-FILES_${PN}-consoletrans = "${datadir}/consoletrans"
-FILES_${PN}-keymaps = "${datadir}/keymaps"
-FILES_${PN}-unimaps = "${datadir}/unimaps"
-- 
1.7.8.rc1



