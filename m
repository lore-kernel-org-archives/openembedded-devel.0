Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f44.google.com (mail-wg0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id 7811B705C1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Jul 2014 17:00:15 +0000 (UTC)
Received: by mail-wg0-f44.google.com with SMTP id m15so5405613wgh.27
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Jul 2014 10:00:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=jrNVk9860iI1bgGNGzuERxubQ41CG3I0HF5/GcU1s8c=;
	b=KvaYyPLYm5vnj/+Qy1hgiHcoKKSKgYyGXpdKan1QWvsamUyRAWdK4b0fC8/qI1xF3m
	poSvSv3s4BNdXhBtbaCuYRm63xeLn3c5hgtvRodW4412KKRWqj2iBvCO/DXemzMkQZo/
	DJfU2KF62yzhVQu55PWoONIu4muy+w1LpROomCDSLAsCX9wdK08pWr1dRwvMkEyBIi3/
	eotbZzZzlPN0FRkLrKzv71IL7hWsx6wUUx8pxWxnpCm0k1MUuh7oSMI6aRM1PPoKwYtW
	BYC0Owjf21DKlwteZMgc829Rgmz/qU9eOhK+SrRUuGId46cM5HorUgDwZ2LRkgMuSTTU
	J38A==
X-Received: by 10.180.12.33 with SMTP id v1mr51098071wib.0.1405875616243;
	Sun, 20 Jul 2014 10:00:16 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	lh15sm1405279wic.8.2014.07.20.10.00.15 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 20 Jul 2014 10:00:15 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 20 Jul 2014 19:00:25 +0200
Message-Id: <1405875626-8011-3-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.0
In-Reply-To: <1405875626-8011-1-git-send-email-Martin.Jansa@gmail.com>
References: <1405875626-8011-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][WIP][PATCH 3/4] mkvtoolnix: inherit autotools-brokensep
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
X-List-Received-Date: Sun, 20 Jul 2014 17:00:17 -0000

* even with fixed path to m4/ebml.m4 and fixed path to drake in ${S} it still
  fails with:
  | DEBUG: Executing shell function do_compile
  | rake aborted!
  | No Rakefile found (looking for: rakefile, Rakefile, rakefile.rb, Rakefile.rb)

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-multimedia/recipes-mkv/mkvtoolnix/mkvtoolnix_5.9.0.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-multimedia/recipes-mkv/mkvtoolnix/mkvtoolnix_5.9.0.bb b/meta-multimedia/recipes-mkv/mkvtoolnix/mkvtoolnix_5.9.0.bb
index abb0e95..6c5be3a 100644
--- a/meta-multimedia/recipes-mkv/mkvtoolnix/mkvtoolnix_5.9.0.bb
+++ b/meta-multimedia/recipes-mkv/mkvtoolnix/mkvtoolnix_5.9.0.bb
@@ -10,7 +10,7 @@ SRC_URI = "http://www.bunkus.org/videotools/mkvtoolnix/sources/mkvtoolnix-${PV}.
 SRC_URI[md5sum] = "033621461ef8eb922fc1366e0a9a6f16"
 SRC_URI[sha256sum] = "d913f531331c3332d2fb334c872ea19bfea7293dfedc4bf33ae7162e4efcbde1"
 
-inherit autotools gettext
+inherit autotools-brokensep gettext
 
 # make sure rb files are used from sysroot, not from host
 # ruby-1.9.3-always-use-i386.patch is doing target_cpu=`echo $target_cpu | sed s/i.86/i386/`
@@ -31,9 +31,9 @@ do_configure_prepend() {
 
 # Yeah, no makefile
 do_compile() {
-    ./drake
+    ${S}/drake
 }
 
 do_install() {
-    ./drake install DESTDIR=${D}
+    ${S}/drake install DESTDIR=${D}
 }
-- 
2.0.0


