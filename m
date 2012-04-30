Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SOkIM-0003WQ-Gz
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 Apr 2012 08:41:14 +0200
Received: by mail-we0-f175.google.com with SMTP id a1so1805040wer.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Apr 2012 23:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=uV1ElhpeSdEH8VRFuX34yniOastJstTx7j9nvzWbyUk=;
	b=qlhdDyxRW+Ir+IVkosPtbh1Z6xjBOvrV6uJftg32uKiY/ntpGBTKAUCQ0IVdF1iw96
	Sz+yqdjwu5+bDF7cWDrSI+5NwZNDtwnAJ6I/a/3GGBFumUrkARqlWzUbHXvObf+aaulV
	GuYmtyR/fRfdHZv7X+rN3/SkUqproZvRH9nBZodsK6nBb8lLgeMbHRigqbIzqECQVspt
	PGdXGqORJMzTq49QPkSbwgNExf8FUPBBJ+KXFOcVteKGuFmttyTTBHXC024pXkRv4v9Z
	asYcwyyb/IPlGrSpgI7SHsewj9K61Xy/7BuLySPhrQi09L34PO8ypyA+jSy6ZJ0b22Y9
	8/tQ==
Received: by 10.216.132.140 with SMTP id o12mr11835269wei.67.1335767495273;
	Sun, 29 Apr 2012 23:31:35 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id w10sm41892146wiy.3.2012.04.29.23.31.34
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 29 Apr 2012 23:31:34 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 30 Apr 2012 08:31:09 +0200
Message-Id: <09dd720f3e9084f05371be893333da8798cec6ee.1335766581.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <cover.1335766581.git.Martin.Jansa@gmail.com>
References: <cover.1335766581.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1335766581.git.Martin.Jansa@gmail.com>
References: <cover.1335766581.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-efl][PATCH 2/6] midori: upgrade to 0.4.5
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
X-List-Received-Date: Mon, 30 Apr 2012 06:41:14 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../midori/{midori_0.4.4.bb => midori_0.4.5.bb}    |    6 ++----
 1 files changed, 2 insertions(+), 4 deletions(-)
 rename meta-oe/recipes-connectivity/midori/{midori_0.4.4.bb => midori_0.4.5.bb} (89%)

diff --git a/meta-oe/recipes-connectivity/midori/midori_0.4.4.bb b/meta-oe/recipes-connectivity/midori/midori_0.4.5.bb
similarity index 89%
rename from meta-oe/recipes-connectivity/midori/midori_0.4.4.bb
rename to meta-oe/recipes-connectivity/midori/midori_0.4.5.bb
index a408d73..4cdd82d 100644
--- a/meta-oe/recipes-connectivity/midori/midori_0.4.4.bb
+++ b/meta-oe/recipes-connectivity/midori/midori_0.4.5.bb
@@ -4,12 +4,10 @@ LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
 DEPENDS = "webkit-gtk libsoup-2.4 libsexy openssl vala-native python-native python-docutils-native librsvg-native"
 
-PR = "r1"
-
 SRC_URI = "http://archive.xfce.org/src/apps/midori/0.4/midori-${PV}.tar.bz2;name=midori \
           "
-SRC_URI[midori.md5sum] = "a6578ebfd237c0f22cce49113b95f70c"
-SRC_URI[midori.sha256sum] = "fadd43f76c1c9f6a16483e60a804e58fb6817c6a595b1acdd59bcbdd7b35bca2"
+SRC_URI[midori.md5sum] = "14288197a1e2251b7c0803e1448daa0e"
+SRC_URI[midori.sha256sum] = "7b57cf3ebb56eef586351f2ae9f71ec9683aedff0b79a071b70b811d9876ff84"
 
 inherit gtk-icon-cache pkgconfig
 
-- 
1.7.8.6



