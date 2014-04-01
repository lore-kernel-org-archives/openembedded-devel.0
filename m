Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f171.google.com (mail-wi0-f171.google.com
	[209.85.212.171])
	by mail.openembedded.org (Postfix) with ESMTP id 199D06FA56
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Apr 2014 17:14:57 +0000 (UTC)
Received: by mail-wi0-f171.google.com with SMTP id q5so5609068wiv.16
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Apr 2014 10:14:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=KfXHHEEHj4YK1ofXvD/rCfDWokAEeFlsc58BKooOhxA=;
	b=SjxPq8hOVBKGfi1uzVdd9eQWZzGfih/89++uWbpcLefvqm6ggNIz3DlQM+cOP/+E20
	wleKF6cgXwO1609oZCRSggjjJUCn6FUS/p76jJmZUjs6XkHiH9p9auVzqwQ3VYc7HnHk
	OeX0CXzA9w0XVEEJvPdMH2su59dKS+WCIQ75alWVl9WBH2mQnxzKGv+YWwtm0F5e2vc5
	EHppEndPie4dDyUhTcuhgZknrSz8EASZzTusfvuOeY35VNBZI03puCmFaobMrhdkNDpg
	5kgNLXcWMqXHUXG7bYlCa3ET2NvaMSVLnpVsmd6xd5e4R9ML6Z/2v59PhzeGFCPDDGSz
	IRMA==
X-Received: by 10.180.9.42 with SMTP id w10mr21572418wia.20.1396372498368;
	Tue, 01 Apr 2014 10:14:58 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	m44sm41866953eep.14.2014.04.01.10.14.57 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 01 Apr 2014 10:14:57 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  1 Apr 2014 19:13:37 +0200
Message-Id: <1396372434-10710-29-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1396372434-10710-1-git-send-email-Martin.Jansa@gmail.com>
References: <1396372434-10710-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 29/46] gnome-backgrounds: inherit only gnomebase
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
X-List-Received-Date: Tue, 01 Apr 2014 17:14:58 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-gnome/recipes-gnome/gnome-backgrounds/gnome-backgrounds_2.32.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/gnome-backgrounds/gnome-backgrounds_2.32.0.bb b/meta-gnome/recipes-gnome/gnome-backgrounds/gnome-backgrounds_2.32.0.bb
index 498c73c..cf09eea 100644
--- a/meta-gnome/recipes-gnome/gnome-backgrounds/gnome-backgrounds_2.32.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-backgrounds/gnome-backgrounds_2.32.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 SECTION = "x11/gnome"
 
-inherit gnome
+inherit gnomebase
 
 SRC_URI[archive.md5sum] = "3df26626483b02e51adefc6ab5945a8d"
 SRC_URI[archive.sha256sum] = "4d7b60b5ba768bf8834b5fa3a3471cd9a9e14b5884bc210dc2d3cdbf1faddcef"
-- 
1.9.1


