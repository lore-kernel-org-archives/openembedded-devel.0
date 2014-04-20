Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f43.google.com (mail-ee0-f43.google.com [74.125.83.43])
	by mail.openembedded.org (Postfix) with ESMTP id 9F7DA60438
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Apr 2014 14:04:06 +0000 (UTC)
Received: by mail-ee0-f43.google.com with SMTP id e53so3008820eek.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Apr 2014 07:04:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=K4FYNn42u17bmPc2dMBeakwM7YbM2Gu4gjY9nk+zDio=;
	b=XsGfhyMHakiQhFFR+VXTyUBrm8GC5iF4b7eeZg3ZEJdVWpBRggw6Y1ANZHxPVbiNV/
	INzZ5X5/kTGTxGz1AnCZWMwq4wVX+XnC4XVZLNGkUSwpjt5RdwZsA0aYlhhUCRpMPfdE
	AZ78mR/HNpqJ+xwd8aW8HJGsxKIEYoDlPolwKsFqzS1oRIr8MYZR/lyKGLVlO4tgueta
	PJwF/VwY0NbSLqY+IJ8/xLsjNagq22gQqzuBuIclWtEwoxyUJonz4PdXMwxba4nN7Ava
	oqYLZp8L+VVh0HQcqMPEa9K++3evbp0Tvg2R0qNAjcL+wK6EW8FbKIjPA4B48JpVFxdL
	WzvA==
X-Received: by 10.14.215.9 with SMTP id d9mr3692348eep.64.1398002647003;
	Sun, 20 Apr 2014 07:04:07 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	y7sm94872770eev.5.2014.04.20.07.04.05 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 20 Apr 2014 07:04:06 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 20 Apr 2014 16:04:09 +0200
Message-Id: <1398002649-16844-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <20140420082402.GK2486@jama>
References: <20140420082402.GK2486@jama>
Subject: [meta-oe][PATCH] gd: fix --with-freetype option
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
X-List-Received-Date: Sun, 20 Apr 2014 14:04:15 -0000

* 'yes' value means using pkg-config to find freetype, other values are using
  FREETYPE_CONFIG=/bin/freetype-config and freetype-config isn't
  in STAGING_LIBDIR but in STAGING_BINDIR/crossscripts/freetype-config

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/gd/gd_2.1.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/gd/gd_2.1.0.bb b/meta-oe/recipes-support/gd/gd_2.1.0.bb
index 24f6f34..0f14130 100644
--- a/meta-oe/recipes-support/gd/gd_2.1.0.bb
+++ b/meta-oe/recipes-support/gd/gd_2.1.0.bb
@@ -25,7 +25,7 @@ inherit autotools binconfig gettext
 
 EXTRA_OECONF += " --disable-rpath \
                   --with-jpeg=${STAGING_LIBDIR}/.. \
-                  --with-freetype=${STAGING_LIBDIR}/.. \
+                  --with-freetype=yes \
                   --without-fontconfig \
                   --without-xpm \
                   --without-x"
-- 
1.9.1


