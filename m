Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f49.google.com (mail-ee0-f49.google.com [74.125.83.49])
	by mail.openembedded.org (Postfix) with ESMTP id 2EBFE6B322
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Jul 2013 12:40:55 +0000 (UTC)
Received: by mail-ee0-f49.google.com with SMTP id b57so209498eek.36
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Jul 2013 05:40:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=lH53MhGK+15Vddh78ZhJFiiCbMuPB0jboYDtoCX5zj4=;
	b=HUwKO/AeHi6rv8XtEQsom3+WJBujlRMg5EE7xnyLKsPOho9A/e9zy8/Z03wetNfjWu
	sf/zsT7R8xpxFU6H8skAwvqW9U4ibgjAUuBquSk/P3u7rPgxf1FBXYl+z3aN5k8+g/QJ
	Kiwy1Yiu7b9wk1v09ZVklCx2mtcrNyUO8F2Mde28dgtD9yt0FGZQ7KHT19ArwFCEmUOU
	ISZNy6ZpwNa2a8nu77UHxGdGE4Om/Hmb+nK5AC09jKfWzXQEZMlKTSzMDLsr8Yu031YY
	iGCnxXMMxKtPpark5cJ+kTfX6+iELghcQXV0dJRBqD6Guwl3RZ7AXuh0ZT/W6S+j97Yx
	rGpg==
X-Received: by 10.15.34.129 with SMTP id e1mr37758655eev.80.1374669655603;
	Wed, 24 Jul 2013 05:40:55 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	o5sm65890488eef.5.2013.07.24.05.40.54 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 24 Jul 2013 05:40:55 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 24 Jul 2013 14:40:46 +0200
Message-Id: <db7eed4a70e3ca4d63a3ba9918106f3c47c5c045.1374669516.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <bddf85b42118361920fbde7c54baffd0e085d5a7.1374669516.git.Martin.Jansa@gmail.com>
References: <bddf85b42118361920fbde7c54baffd0e085d5a7.1374669516.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1374669516.git.Martin.Jansa@gmail.com>
References: <cover.1374669516.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 02/29] loudmouth: add dependency on libidn
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
X-List-Received-Date: Wed, 24 Jul 2013 12:40:55 -0000

* it's autodetected from sysroot and configure doesn't allow
  to disable it explicitly
* feel free to add configure option and PACKAGECONFIG if this
  extra dependency bothers you

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-connectivity/loudmouth/loudmouth_1.4.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/loudmouth/loudmouth_1.4.3.bb b/meta-oe/recipes-connectivity/loudmouth/loudmouth_1.4.3.bb
index 8375386..c864276 100644
--- a/meta-oe/recipes-connectivity/loudmouth/loudmouth_1.4.3.bb
+++ b/meta-oe/recipes-connectivity/loudmouth/loudmouth_1.4.3.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://www.loudmouth-project.org/"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c4f38aef94828f6b280e00d1173be689"
 
-DEPENDS = "glib-2.0 libcheck openssl"
+DEPENDS = "glib-2.0 libcheck openssl libidn"
 
 inherit gnomebase
 
-- 
1.8.3.2


