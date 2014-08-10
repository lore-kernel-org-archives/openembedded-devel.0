Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by mail.openembedded.org (Postfix) with ESMTP id C60E960144
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Aug 2014 08:58:32 +0000 (UTC)
Received: by mail-wi0-f178.google.com with SMTP id hi2so2840898wib.11
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Aug 2014 01:58:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=aZYZa31zvtfx2OJsow83nZx2D5KOeccBdaPffsKCaQY=;
	b=teKcRkIg/uvrHyQvgZ5+kUDJ1aZlhiJL697cUQHgo+KE3tTlBV8zKpovaYIUzeOZbL
	o/iR4adGToa7BsWASgFQeEraJvNSvjmT1lql/atAALKGLzAs0WbajYSpKoHww7yNzBoQ
	ChfiNZzBMkRU/haiHEI71mQELHh5ANIS4pAxhfML5Fc/VKZQJV00wSZE//aKMNiR3TRG
	Gnbg/Cw85wONTuRG16zA+peOZpgOxUS1RHR54wLd3Y2laJ0bCuxxOrHR3cY/pJ2cALuP
	JoYLHgYugP2kCU4yD1yXt7X28rsOyAW+fT/+ATWoRtitF87dMdjdf6BbHb2q0vQqYa7A
	FM6Q==
X-Received: by 10.180.94.34 with SMTP id cz2mr15854989wib.74.1407661113127;
	Sun, 10 Aug 2014 01:58:33 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	w1sm28761978wiz.14.2014.08.10.01.58.32 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 10 Aug 2014 01:58:32 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 10 Aug 2014 10:59:02 +0200
Message-Id: <1407661142-12785-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.4
Subject: [meta-oe][daisy][PATCHv] ltrace: add PV and PACKAGECONFIG for libunwind
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
X-List-Received-Date: Sun, 10 Aug 2014 08:58:37 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../ltrace/{ltrace-git => ltrace}/ltrace-0.7.2-unused-typedef.patch   | 0
 meta-oe/recipes-devtools/ltrace/ltrace_git.bb                         | 4 ++++
 2 files changed, 4 insertions(+)
 rename meta-oe/recipes-devtools/ltrace/{ltrace-git => ltrace}/ltrace-0.7.2-unused-typedef.patch (100%)

diff --git a/meta-oe/recipes-devtools/ltrace/ltrace-git/ltrace-0.7.2-unused-typedef.patch b/meta-oe/recipes-devtools/ltrace/ltrace/ltrace-0.7.2-unused-typedef.patch
similarity index 100%
rename from meta-oe/recipes-devtools/ltrace/ltrace-git/ltrace-0.7.2-unused-typedef.patch
rename to meta-oe/recipes-devtools/ltrace/ltrace/ltrace-0.7.2-unused-typedef.patch
diff --git a/meta-oe/recipes-devtools/ltrace/ltrace_git.bb b/meta-oe/recipes-devtools/ltrace/ltrace_git.bb
index 149af52..6476f97 100644
--- a/meta-oe/recipes-devtools/ltrace/ltrace_git.bb
+++ b/meta-oe/recipes-devtools/ltrace/ltrace_git.bb
@@ -9,6 +9,8 @@ HOMEPAGE = "http://ltrace.org/"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a"
 
+PE = "1"
+PV = "7.2+git${SRCPV}"
 SRCREV = "f44b28421979cec88d6d6a778fc27a8cd514f508"
 
 DEPENDS = "elfutils"
@@ -20,6 +22,8 @@ S = "${WORKDIR}/git"
 
 inherit autotools
 
+PACKAGECONFIG[unwind] = "--with-libunwind,--without-libunwind,libunwind"
+
 do_configure_prepend () {
 	./autogen.sh
 }
-- 
2.0.4


