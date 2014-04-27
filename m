Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f50.google.com (mail-pa0-f50.google.com
	[209.85.220.50])
	by mail.openembedded.org (Postfix) with ESMTP id 3ADC365D05
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 27 Apr 2014 05:01:57 +0000 (UTC)
Received: by mail-pa0-f50.google.com with SMTP id rd3so4593532pab.37
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Apr 2014 22:01:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=7QeAjFYcNbb9FTYKzHzuj6RRva8ab0hIAZ8/0g5fV+Y=;
	b=wnnoi7dOnXAAYRZvO6irrqi92fkuRiXt7Sy6kxLgbXmj83pspfwDIx6HGdOxTl8R/W
	TFV7OkVzpzDOK/USeB5HxJ++HpUdbqV6R+o3Ni5NCcotL5Ecepe3DwU2dlCoIBo3LITn
	oSSeLwDIAx3/hovar2xza6FbyJCyCI94k3rK1ABMT1t1UiFpol3LHlSuYtXcFZEjH3+N
	7H86Af//AgmEAPjLEgeoKFvrA6BEtP9I9h88OHnpksVKBffByUqTOdx7T4oO+ShgEvPD
	b0BNeisiS56EIJUY/n3wuwAwjYBNBCiZ8yKmM6SZfVUuUdeo/3Fr+hp64Q4uLwsnxOUh
	OxJA==
X-Received: by 10.68.240.68 with SMTP id vy4mr1424664pbc.127.1398574918834;
	Sat, 26 Apr 2014 22:01:58 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-140-30.lightspeed.sntcca.sbcglobal.net. [99.57.140.30])
	by mx.google.com with ESMTPSA id
	id10sm26117504pbc.35.2014.04.26.22.01.57 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 26 Apr 2014 22:01:58 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 26 Apr 2014 22:03:35 -0700
Message-Id: <1398575015-5506-3-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1398575015-5506-1-git-send-email-raj.khem@gmail.com>
References: <1398575015-5506-1-git-send-email-raj.khem@gmail.com>
Subject: [meta-gnome][PATCH V2 12/21] gnome-power-manager: Fix build when S != B
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
X-List-Received-Date: Sun, 27 Apr 2014 05:02:00 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../gnome-power-manager/gnome-power-manager_2.32.0.bb              |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-gnome/recipes-gnome/gnome-power-manager/gnome-power-manager_2.32.0.bb b/meta-gnome/recipes-gnome/gnome-power-manager/gnome-power-manager_2.32.0.bb
index ddc436e..8ddfd68 100644
--- a/meta-gnome/recipes-gnome/gnome-power-manager/gnome-power-manager_2.32.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-power-manager/gnome-power-manager_2.32.0.bb
@@ -29,10 +29,10 @@ EXTRA_OECONF = " --disable-scrollkeeper \
 do_configure_append() {
     rm config.log
     # Sigh... --enable-compile-warnings=no doesn't actually turn off -Werror
-    for i in $(find ${S} -name "Makefile") ; do
+    for i in $(find ${B} -name "Makefile") ; do
         sed -i -e s:-Werror::g $i
     done
-    sed -e "s/libtool --/${TARGET_SYS}-libtool --/" -i ${S}/src/Makefile
+    sed -e "s/libtool --/${TARGET_SYS}-libtool --/" -i ${B}/src/Makefile
 }
 
 PACKAGES =+ "${PN}-applets"
-- 
1.7.10.4


