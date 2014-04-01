Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f51.google.com (mail-wg0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id EE07F6FA65
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Apr 2014 17:15:01 +0000 (UTC)
Received: by mail-wg0-f51.google.com with SMTP id k14so7632042wgh.34
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Apr 2014 10:15:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=KW4JtW5md3Bc5REtDYY1zFYwa5zH/l/JMCmycgOonkM=;
	b=aAtB5ehZLqL3oYiNRf7mtIuVPln069+y5S5k3Y+L9BM4yDDY8fIbMQgZrWnnERNyrC
	d9bHn2/xwA21MPRVQhjznOOEIS6GaDeZhE26KT8E34cxnLyD1MjN8RG6w015kGGNk4TH
	ApUsyNjYq4FpRAT0OWTXII1x+PkmI0UOHYLgeiSGvcju6lkxgbkjtKLSMIFPy9a/gQ3v
	MUfRcegrgFZb6N4PbBbA0nS1BoJZpgA+MTKrogPVk4OpwiXLXuizeadly9Z570fDufv9
	hEm11tCJfpjUJm744YCN1fK77rJdxIXLFCr3pwbsQhNoMhIqMmiggSm79CXFkY2Oi5gG
	AB6w==
X-Received: by 10.194.157.41 with SMTP id wj9mr24553696wjb.34.1396372502113;
	Tue, 01 Apr 2014 10:15:02 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	a4sm41869332eep.12.2014.04.01.10.15.01 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 01 Apr 2014 10:15:01 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  1 Apr 2014 19:13:39 +0200
Message-Id: <1396372434-10710-31-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1396372434-10710-1-git-send-email-Martin.Jansa@gmail.com>
References: <1396372434-10710-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 31/46] zenity: inherit only gnomebase
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
X-List-Received-Date: Tue, 01 Apr 2014 17:15:02 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-gnome/recipes-gnome/zenity/zenity_2.32.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/zenity/zenity_2.32.1.bb b/meta-gnome/recipes-gnome/zenity/zenity_2.32.1.bb
index 8a8409d..fb15900 100644
--- a/meta-gnome/recipes-gnome/zenity/zenity_2.32.1.bb
+++ b/meta-gnome/recipes-gnome/zenity/zenity_2.32.1.bb
@@ -6,7 +6,7 @@ PR = "r2"
 
 DEPENDS = "gtk+ glib-2.0 libnotify gnome-doc-utils"
 
-inherit gnome
+inherit gnomebase
 SRC_URI += "file://0001-Makefile.am-don-t-build-help.patch"
 SRC_URI[archive.md5sum] = "aa66ec35451b16e424519b4973082170"
 SRC_URI[archive.sha256sum] = "8838be041a07364b62a4281c971392e4a09bb01bb3237a836ec0457ec0ea18ac"
-- 
1.9.1


