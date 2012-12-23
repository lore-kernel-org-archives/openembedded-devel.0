Received: from mail-ea0-f180.google.com ([209.85.215.180])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TmkrO-0001xX-VW
	for openembedded-devel@lists.openembedded.org;
	Sun, 23 Dec 2012 13:40:55 +0100
Received: by mail-ea0-f180.google.com with SMTP id f13so2517864eai.39
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Dec 2012 04:26:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=LNiJTvUrThstEtMwBfWQIiZiRbojwaGohRu4eShqAXI=;
	b=hQtqKAN4lTuCS2nA83jmgiG3MuPLz52l/k2v7BAKO/f0PeEfNsuRlYepPvb0HcC+l/
	OYnzTB7XHAJMtZ83E6Qm7Nk8ZQevYdH73J+I/xgzoBMNptil/qjlDSqiokxLMMKRTIIL
	L/kyRL6vjaep2F8B8z5E0BTSPwCq+eSRik7pFvPRX4D+J3RvaP2XjJKAet034oncF0fE
	CeiOTl62+2qfY1PdgMYbxTBT4G06qwP90BxDLuOAP1uDxITJ85ud0DwW+nlauZ0vZ+MF
	Bc6XXmPSRuGVD6gnm/HDXfH5q31YIAjg3aIg4C/wg53stDvmmNKpgP0CPWhy51vhhp1S
	YPOg==
X-Received: by 10.14.225.4 with SMTP id y4mr47463174eep.6.1356265566679;
	Sun, 23 Dec 2012 04:26:06 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id 46sm34566124eeg.4.2012.12.23.04.26.05
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 23 Dec 2012 04:26:06 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 23 Dec 2012 13:21:53 +0100
Message-Id: <d9f8d7f53723f4629946c063d2d8a6491e22515e.1356264861.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0.2
In-Reply-To: <cover.1356264861.git.Martin.Jansa@gmail.com>
References: <cover.1356264861.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1356264861.git.Martin.Jansa@gmail.com>
References: <cover.1356264861.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 28/30] nautilus3: upgrade to 3.2.1
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
X-List-Received-Date: Sun, 23 Dec 2012 12:41:28 -0000

* old version fails to build:
| In file included from eel-editable-label.c:30:0:
| eel-editable-label.h:112:1: error: unknown type name 'G_CONST_RETURN'
| eel-editable-label.h:112:21: error: expected '=', ',', ';', 'asm' or
'__attribute__' before '*' token
| eel-editable-label.c:684:1: error: unknown type name 'G_CONST_RETURN'
| eel-editable-label.c:684:22: error: expected '=', ',', ';', 'asm' or
'__attribute__' before '*' token
| eel-editable-label.c: In function
'eel_editable_label_accessible_get_character_count':

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-gnome/nautilus/{nautilus3_3.0.2.bb => nautilus3_3.2.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-gnome/recipes-gnome/nautilus/{nautilus3_3.0.2.bb => nautilus3_3.2.1.bb} (89%)

diff --git a/meta-gnome/recipes-gnome/nautilus/nautilus3_3.0.2.bb b/meta-gnome/recipes-gnome/nautilus/nautilus3_3.2.1.bb
similarity index 89%
rename from meta-gnome/recipes-gnome/nautilus/nautilus3_3.0.2.bb
rename to meta-gnome/recipes-gnome/nautilus/nautilus3_3.2.1.bb
index 19de470..728e718 100644
--- a/meta-gnome/recipes-gnome/nautilus/nautilus3_3.0.2.bb
+++ b/meta-gnome/recipes-gnome/nautilus/nautilus3_3.2.1.bb
@@ -17,8 +17,8 @@ BPN = "nautilus"
 inherit gnome
 
 SRC_URI += "file://no-try-run-strftime.diff"
-SRC_URI[archive.md5sum] = "949187b1f241137ad3a5e6bdca3dfb0b"
-SRC_URI[archive.sha256sum] = "6a4c6b75593f0e815763d0040878cd908da72318f18b05f33d24040e0d602b22"
+SRC_URI[archive.md5sum] = "ecd100ed94431363fa68b217351649c0"
+SRC_URI[archive.sha256sum] = "584e97d3eb093ee16a779809b679150a636bcd4a3767fb604993013b523d2df1"
 
 EXTRA_OECONF = " --disable-gtk-doc  --disable-update-mimedb --enable-nst-extension"
 export SYSROOT = "${STAGING_DIR_HOST}"
-- 
1.8.0.2



