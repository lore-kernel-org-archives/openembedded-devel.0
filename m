Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f179.google.com (mail-ea0-f179.google.com
	[209.85.215.179])
	by mail.openembedded.org (Postfix) with ESMTP id 2F4996B478
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  9 Aug 2013 08:53:48 +0000 (UTC)
Received: by mail-ea0-f179.google.com with SMTP id b10so1942013eae.10
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 09 Aug 2013 01:53:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=RRdS4nMM5CHOROt+/ZJ4sSeOxJZtZ6aYPrjUfrlnJfw=;
	b=bX77ifmeogByZR5TS+nWPZzHb82XQV/T4az1umGPJajMi+/X1/5fKEeH90hG9uhhdk
	SvHaZOiPU8x5zwCzh5vHD/LPOKI1J0g73/qhvYOOT+b0/C6pwbParjpwJQVL+6KvsYbP
	N04EJVNomCdSN75YPO17F/mo1YMKDRgKHMwM5FTJo67cd5o2o6loPgTDVfDXhQYpjsK9
	I4GbqGmWEHmM4ZkBAlUtmFTtncl64Njno5aBIGFc8wiMXjRvBfVzast7/YWXfeQK9b5M
	JCNRdqgaHndW/sbIVRHL0dr9GIyEpMcZoU9/9r+GANu8XsGnzMFeGC1kqOcY3bvbrgss
	YtUQ==
X-Received: by 10.14.115.133 with SMTP id e5mr12315667eeh.27.1376038428535;
	Fri, 09 Aug 2013 01:53:48 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	d8sm13596263eeh.8.2013.08.09.01.53.47 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 09 Aug 2013 01:53:48 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  9 Aug 2013 10:54:21 +0200
Message-Id: <1376038471-32202-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1376038471-32202-1-git-send-email-Martin.Jansa@gmail.com>
References: <1376038471-32202-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 02/12] goffice: add librsvg dependency
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
X-List-Received-Date: Fri, 09 Aug 2013 08:53:48 -0000

* No package 'librsvg-2.0' found

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-gnome/recipes-support/goffice/goffice_0.10.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-support/goffice/goffice_0.10.1.bb b/meta-gnome/recipes-support/goffice/goffice_0.10.1.bb
index 5b46d99..098e275 100644
--- a/meta-gnome/recipes-support/goffice/goffice_0.10.1.bb
+++ b/meta-gnome/recipes-support/goffice/goffice_0.10.1.bb
@@ -3,7 +3,7 @@ DESCRIPTION="Gnome Office Library"
 LICENSE="GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6dc33ff21e1ba1ac1a2a1069d361e29e"
 
-DEPENDS = "libxml-parser-perl-native glib-2.0 gtk+3 pango cairo libgsf libpcre libxml2 libart-lgpl"
+DEPENDS = "libxml-parser-perl-native glib-2.0 gtk+3 pango cairo libgsf libpcre libxml2 libart-lgpl librsvg"
 
 inherit gnome pkgconfig perlnative
 
-- 
1.8.3.2


