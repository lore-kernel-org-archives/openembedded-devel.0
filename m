Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f173.google.com (mail-ea0-f173.google.com
	[209.85.215.173])
	by mail.openembedded.org (Postfix) with ESMTP id 55B116B5E6
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  9 Aug 2013 08:53:56 +0000 (UTC)
Received: by mail-ea0-f173.google.com with SMTP id g10so1922221eak.4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 09 Aug 2013 01:53:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ydScW+DTxv9wSVhilkfkiwMqtED3QMmFHRXv1z63wkU=;
	b=0EX43sMKE3JYfBN2aipAZVCYdR4svxiFU17nDW4beogrXgHHad+es/MmKq4z/Ygqib
	f7mLL4e16EG7+OKizM4ym6zwUqev4dTzbpGqgL8JLTFj6SojCNq3ka/2cUBZMzkZpYwc
	2yR7/ce0+qBTNEG/QoM7L0dJPVapN6rC+e7nmguotjJthANqHh9yPMkgsqHGxsyLHy5p
	vAS8+rRsG1EjuRC6q5oNrnf6bNqwtXGEA0zVYWwaAzFnHMonH+A9oQ0qcrtWTg2dTNIL
	Ob8lY03ApjYpbFj6MQ8NWVUPb+Re7Ck9YyEnNZyf0Ef5dCxLgKIN7wa4B+T6UA4a1RGS
	nx1A==
X-Received: by 10.15.24.5 with SMTP id i5mr12345773eeu.74.1376038436708;
	Fri, 09 Aug 2013 01:53:56 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	a6sm14829651eei.10.2013.08.09.01.53.56 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 09 Aug 2013 01:53:56 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  9 Aug 2013 10:54:27 +0200
Message-Id: <1376038471-32202-8-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1376038471-32202-1-git-send-email-Martin.Jansa@gmail.com>
References: <1376038471-32202-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 08/12] subsurface: add dependency on gconf
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
X-List-Received-Date: Fri, 09 Aug 2013 08:53:56 -0000

* fails without
  | Package gconf-2.0 was not found in the pkg-config search path.
  | Perhaps you should add the directory containing `gconf-2.0.pc'
  | to the PKG_CONFIG_PATH environment variable
  | No package 'gconf-2.0' found
  | main.c:7:32: fatal error: gconf/gconf-client.h: No such file or directory
  |  #include <gconf/gconf-client.h>

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-extended/subsurface/subsurface_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/subsurface/subsurface_git.bb b/meta-oe/recipes-extended/subsurface/subsurface_git.bb
index 8cdbf00..20cc5ac 100644
--- a/meta-oe/recipes-extended/subsurface/subsurface_git.bb
+++ b/meta-oe/recipes-extended/subsurface/subsurface_git.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Subsurface is an open source dive log program."
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://gpl-2.0.txt;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-DEPENDS = "libdivecomputer gtk+ libxml2 glib-2.0"
+DEPENDS = "libdivecomputer gtk+ libxml2 glib-2.0 gconf"
 
 inherit gtk-icon-cache
 
-- 
1.8.3.2


