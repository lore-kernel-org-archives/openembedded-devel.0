Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OJujM-00030d-0U
	for openembedded-devel@lists.openembedded.org;
	Wed, 02 Jun 2010 22:40:06 +0200
Received: by mail-pw0-f47.google.com with SMTP id 5so2476217pwi.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 02 Jun 2010 13:35:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=bY2bVjdaIJnB2/rqPgIgmltO6MfVNBpr8OZejQbvcxw=;
	b=Euqkvl/WR5jslH2S1t8VNISpQpt2qe1FXle5DtdHCmNlPZMKxTz15gaUAgV9GW5/5G
	QRz6H5VqUL1xbBeuPnc1UpXWolFIbsEKKiQ13iDiml7VI8Xkj48n91iwjO+tOHSC1ws8
	WGLRqdw6RvC+YKdMZmHF5F+FfXchuwixa8Xcw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=qe1RqBoafpygN3fi7fGoZgFZCi5jqM6JCZM1KeUplFrov+BfPlo8ATFSmAwzsTxn6c
	bxXQip/m20Oh5uEU0GZzr1jRX/7KWyXFwy7wOjh9NlN67TStzhF9ni2471WdZJsRtBxS
	GxjrpvNGvKYwIPBX1BL/RgMPpK7DuJktbNUyo=
Received: by 10.141.188.5 with SMTP id q5mr7111516rvp.82.1275510950818;
	Wed, 02 Jun 2010 13:35:50 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id 20sm5942447pzk.7.2010.06.02.13.35.49
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 02 Jun 2010 13:35:49 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  2 Jun 2010 13:34:55 -0700
Message-Id: <1275510896-30845-16-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1275510896-30845-1-git-send-email-raj.khem@gmail.com>
References: <1275510896-30845-1-git-send-email-raj.khem@gmail.com>
X-SA-Exim-Connect-IP: 209.85.160.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 15/16] libx11_1.3.2.bb: Add -fforward-propagate on arm.
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
X-List-Received-Date: Wed, 02 Jun 2010 20:40:07 -0000

* Needed on -O1 compile. Generally we use -Os where
  this option is already enabled. But we enable is anyway
  so it gets picked at -O1 too which we use with DEBUG builds.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes/xorg-lib/libx11_1.3.2.bb |    8 +++++++-
 1 files changed, 7 insertions(+), 1 deletions(-)

diff --git a/recipes/xorg-lib/libx11_1.3.2.bb b/recipes/xorg-lib/libx11_1.3.2.bb
index 855dfa2..291486b 100644
--- a/recipes/xorg-lib/libx11_1.3.2.bb
+++ b/recipes/xorg-lib/libx11_1.3.2.bb
@@ -5,7 +5,7 @@ DEPENDS += "bigreqsproto xproto xextproto xtrans libxau xcmiscproto \
             libxdmcp xf86bigfontproto kbproto inputproto xproto-native"
 PROVIDES = "virtual/libx11"
 PE = "1"
-PR = "r3"
+PR = "r4"
 
 XORG_PN = "libX11"
 
@@ -15,6 +15,12 @@ SRC_URI += "file://x11_disable_makekeys.1.6.3.patch \
 
 EXTRA_OECONF += "--without-xcb --with-keysymdef=${STAGING_INCDIR}/X11/keysymdef.h"
 
+# Below option is added to overcome the GCC bug on ARM 
+# see http://gcc.gnu.org/PR42981 for further details.
+# We could potentially take it off when its fixed in gcc 4.5
+
+CFLAGS_append_arm = " -fforward-propagate "
+
 do_compile() {
 	(
 		unset CC LD CXX CCLD CFLAGS CPPFLAGS LDFLAGS CXXFLAGS
-- 
1.7.0.4



