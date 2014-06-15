Return-Path: <cazfi74@gmail.com>
Received: from mail-lb0-f177.google.com (mail-lb0-f177.google.com
	[209.85.217.177])
	by mail.openembedded.org (Postfix) with ESMTP id 45D286FCB4
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Jun 2014 01:25:53 +0000 (UTC)
Received: by mail-lb0-f177.google.com with SMTP id u10so2282921lbd.22
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 14 Jun 2014 18:25:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=ua9h621UFGZrlk1v9plO5/xXQL8a9DxKfYMCWkKyep4=;
	b=pcRNC5PwEe59qlbh7i8aNJ5jYYgY81yDpoj0kFb5Afso3WSZvuMklTcFgaenzGfNps
	P0/AY0lC1tUAB0YEhJswpIyNu9MQsiV9/myxFOadK9jbKANJQuLUEzhugfDtjYk9F7X9
	sHW9hCeupgLPk+3XhU/hNr+MN3MvBQ5ga0YhT3tYAjOhkD2vCrrWplVnu/WCQsFbt3Wi
	D5zsm7cd+aibvdvW4j2ShqeYNX+9gBpLMISuBxebq39tE6Rql0HPfnbkwugWoby40sT1
	fHXJm8WMtwfxBfUFb9JU7OewtexYDC+EtfpuOXWudoy5SdV92L5Tmxfqw4KGXzMwxclZ
	dL2A==
X-Received: by 10.112.72.3 with SMTP id z3mr7221250lbu.30.1402795553280;
	Sat, 14 Jun 2014 18:25:53 -0700 (PDT)
Received: from prime (a91-153-14-158.elisa-laajakaista.fi. [91.153.14.158])
	by mx.google.com with ESMTPSA id bg4sm5093667lbb.6.2014.06.14.18.25.52
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 14 Jun 2014 18:25:52 -0700 (PDT)
Received: from cazfi by prime with local (Exim 4.82_1-5b7a7c0-XX)
	(envelope-from <cazfi74@gmail.com>)
	id 1WvzCg-0007tY-NT; Sun, 15 Jun 2014 04:25:50 +0300
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 15 Jun 2014 04:25:19 +0300
Message-Id: <1402795520-30201-1-git-send-email-cazfi74@gmail.com>
X-Mailer: git-send-email 2.0.0
Subject: [meta-oe][PATCH 1/2] libsdl-image: Fix build with separate builddir
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
X-List-Received-Date: Sun, 15 Jun 2014 01:26:02 -0000

Do not assume that sources are in the current directory in
do_configure_prepend() but refer to them with path to source directory.

Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
---
 .../libsdl-image/libsdl-image_1.2.12.bb                  | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/meta-oe/recipes-multimedia/libsdl-image/libsdl-image_1.2.12.bb b/meta-oe/recipes-multimedia/libsdl-image/libsdl-image_1.2.12.bb
index ef78927..d8c56fb 100644
--- a/meta-oe/recipes-multimedia/libsdl-image/libsdl-image_1.2.12.bb
+++ b/meta-oe/recipes-multimedia/libsdl-image/libsdl-image_1.2.12.bb
@@ -20,12 +20,12 @@ export SDL_CONFIG = "${STAGING_BINDIR_CROSS}/sdl-config"
 EXTRA_OECONF += "--disable-jpg-shared --disable-png-shared -disable-tif-shared"
 
 do_configure_prepend() {
-    # Removing this file fixes a libtool version mismatch.
-    rm -f acinclude/libtool.m4
-    rm -f acinclude/sdl.m4
-    rm -f acinclude/pkg.m4
-    rm -f acinclude/lt~obsolete.m4
-    rm -f acinclude/ltoptions.m4
-    rm -f acinclude/ltsugar.m4
-    rm -f acinclude/ltversion.m4
+    # Removing these files fixes a libtool version mismatch.
+    rm -f ${S}/acinclude/libtool.m4
+    rm -f ${S}/acinclude/sdl.m4
+    rm -f ${S}/acinclude/pkg.m4
+    rm -f ${S}/acinclude/lt~obsolete.m4
+    rm -f ${S}/acinclude/ltoptions.m4
+    rm -f ${S}/acinclude/ltsugar.m4
+    rm -f ${S}/acinclude/ltversion.m4
 }
-- 
2.0.0


