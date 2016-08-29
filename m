Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 11013601D3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Aug 2016 20:52:53 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id i138so351484wmf.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Aug 2016 13:52:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=2aJxYqcB7rZUcO+/Zx6wHbZ9nQndO6otjXGq5x6MqiA=;
	b=iqQZrAkbyJWvDpyGGcWu24VoYJNnDAOdvVXIk/EJizca4kcpBQZC1MtWP+2g/7J7dd
	jzH3itpG5dyEI7/+NQrk9oGRijbcYOWNf/Hjb7C2dGl/wRF9RchR9vofhkHB8Wq4shdE
	sGkpXEbzR9K3LKRSAE8bDxVQV5nzEZt5cTggg4OkjPi05czO/3wKhPk66NQ/QPc9ShwT
	NxbRz7nNtfMyg9PmydN4qEPNdfufzHPKZrRmgYjwMrcYH2ntsat6HPHiAuKrsSp5dYir
	yQO4yp0WxR7J2zDw6ENXMZ2/Ebg7/+BrAEOuwivgfbjNOxlyeqVwGsRsnmm+lx4nWNRp
	0Ikg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=2aJxYqcB7rZUcO+/Zx6wHbZ9nQndO6otjXGq5x6MqiA=;
	b=bP3V6CQ6MUWyq2mrAsJHr2TCDd09dystl3CSI/H72vXXlvk7U0ZjQC9auXK7tMeiUC
	pd7QZPgBsnlLwASwD13IaOtqZYBnIlXOHonXC2AQpiiwetAJTNsV4X1JVLPSs3A1NL7w
	+lZnK1PQdl4ypeZ08lhTVV44/6RqXh0Voa+IZ8z+spwQRI9uAUN3fJCwv2hhHSvfJ7hT
	HO1EPiZWUbM7090MlxYNCuH4SQ2y0KZ2GZ94wUQnCAfGJIELwrgV+EEFcYK4VX94Jl5Z
	A5cdclhbTUyVIi9zqejODq0wVoLhIC+9NagvI2LDcG7OOp91JCbLmqfca8IIS0w32K4W
	1XaA==
X-Gm-Message-State: AE9vXwP9/Arl6e6fQ6TdsPc9+qiyN3K71BxYskP51Ur8Lwt7I9Y4N/oOhzKxcyCYgRPtug==
X-Received: by 10.194.123.35 with SMTP id lx3mr18790792wjb.126.1472503974080; 
	Mon, 29 Aug 2016 13:52:54 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169]) by smtp.gmail.com with ESMTPSA id
	a2sm36069307wjg.46.2016.08.29.13.52.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 29 Aug 2016 13:52:52 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 29 Aug 2016 22:52:53 +0200
Message-Id: <20160829205253.17988-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.9.2
Subject: [meta-oe][PATCH] geany-plugins: include GPLv3 in the main LICENSE
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 29 Aug 2016 20:52:54 -0000

* since last changes in oe-core LICENSE variable needs to list all licenses used
  by individual packages otherwise bitbake warning like this is shown:
  WARNING: meta-openembedded/meta-oe/recipes-devtools/geany/geany-plugins_1.27.bb: LICENSE_geany-plugins-commander includes licenses (GPLv3) that are not listed in LICENSE
  as possible improvement you can set LICENSE to GPLv2 to all plugins
  which are GPLv2-only, because now they will "inherit" both GPLv2 &
  GPLv3 which sucks as described here:
  https://www.mail-archive.com/openembedded-core@lists.openembedded.org/msg81645.html

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-devtools/geany/geany-plugins_1.27.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/geany/geany-plugins_1.27.bb b/meta-oe/recipes-devtools/geany/geany-plugins_1.27.bb
index 9a39150..5e1e721 100644
--- a/meta-oe/recipes-devtools/geany/geany-plugins_1.27.bb
+++ b/meta-oe/recipes-devtools/geany/geany-plugins_1.27.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "A fast and lightweight IDE"
 HOMEPAGE = "http://plugins.geany.org/"
 # majority's default
-LICENSE = "GPLv2"
+LICENSE = "GPLv2 & GPLv3"
 
 DEPENDS = "geany lua libxml2 libsoup-2.4 vte enchant intltool-native libassuan gpgme"
 
-- 
2.9.2


