Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f169.google.com (mail-we0-f169.google.com
	[74.125.82.169])
	by mail.openembedded.org (Postfix) with ESMTP id DB6FE6FAB8
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Apr 2014 17:15:17 +0000 (UTC)
Received: by mail-we0-f169.google.com with SMTP id w62so6688615wes.14
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Apr 2014 10:15:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=rhcFiNxfl3aI0SL+eNt9X0Dm7ghgjUMUVFJK4wtmYJQ=;
	b=x8jWLZfmJBvrkn3aQNm17k/eXb14Ew6FrYtCKDs9oZkZNYxtpOsvx0oA0iPz0+mwGt
	n6rFnFlLfG2jFq68vk5zcOkbg39kDIc+JPAB5zZFdjRtgND7QfkeaxevaEwMyz/n3EvN
	l+EwCgSxe9r0gF8lvcF1k0hbPBQTwsXiPaCNPlJg8oa7KDi+Jb6zT68ni+QtyReyEJfn
	lPTEgAyY9cd1FIP/aOsDwX++lT4XCkHxmPq4QWt7bFfHd/L9jOdG3PgraUsCKBiR4PLg
	zMthaljJwfE+NTSRvdbBp5MHWMLZuysb+tT3kCSVcUHSPNFE4ncKqvrjd+Pv62FiCjPB
	wPpg==
X-Received: by 10.180.12.14 with SMTP id u14mr21701769wib.0.1396372518304;
	Tue, 01 Apr 2014 10:15:18 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	u46sm41882631eel.1.2014.04.01.10.15.16 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 01 Apr 2014 10:15:16 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  1 Apr 2014 19:13:42 +0200
Message-Id: <1396372434-10710-34-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1396372434-10710-1-git-send-email-Martin.Jansa@gmail.com>
References: <1396372434-10710-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 34/46] metacity: inherit only gnomebase
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 01 Apr 2014 17:15:20 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-gnome/recipes-gnome/metacity/metacity_2.34.13.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/metacity/metacity_2.34.13.bb b/meta-gnome/recipes-gnome/metacity/metacity_2.34.13.bb
index 5f44e69..e0b8b93 100644
--- a/meta-gnome/recipes-gnome/metacity/metacity_2.34.13.bb
+++ b/meta-gnome/recipes-gnome/metacity/metacity_2.34.13.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
 DEPENDS = "gsettings-desktop-schemas startup-notification gtk+ gconf gdk-pixbuf-native libcanberra gnome-doc-utils libgtop"
 PR = "r1"
 
-inherit gnome update-alternatives
+inherit gnomebase update-alternatives
 
 GNOME_COMPRESS_TYPE = "xz"
 
-- 
1.9.1


