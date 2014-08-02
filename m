Return-Path: <koen@dominion.thruhere.net>
Received: from mail-we0-f170.google.com (mail-we0-f170.google.com
	[74.125.82.170])
	by mail.openembedded.org (Postfix) with ESMTP id B0E276AC93
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  2 Aug 2014 08:08:27 +0000 (UTC)
Received: by mail-we0-f170.google.com with SMTP id w62so5359368wes.29
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 02 Aug 2014 01:08:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Pxr79u3i73jcDBayNz7RuqljBjQoTvmv69BGdNCsvOQ=;
	b=Me7fZxkksdrkzpfKB7Ki7yvn/f1820wY3BB7pGD/qnuKDmgMAsIoEcjxH7VyDllPU/
	xRHytPFlyOMdiuq5QxL5GWVen2vFl2sKvJ4PYzXKq7llN3BNHVYawU16PjJ3AwyZhuhH
	1zUUp4c1VR7qWM5t27NjsVVrC4dp0oKajH9B/ua6hZUYIHUa7MUyVfoHPHngPsTZZH2f
	5a81s3hx1FPYNL1PQs4bpAZHkV4pZbtZNaR3yVq2pz5PB9XrcnjpWqYM+70KpXUAAE6b
	PNMsSUKcpssH7TO42zgTwtrLFlY0Fm/7/MvxzmZ6fDsKqp/o+ONUxEbMg0X2ZH1aVgt9
	SE5A==
X-Gm-Message-State: ALoCoQnD3M7K19MwPnWRfPbAwYop0EB4RSMqWN0DarxrBfPLGAobkc4kMy2/DjbaGS/1cStmBzpw
X-Received: by 10.194.103.38 with SMTP id ft6mr15149330wjb.18.1406966908296;
	Sat, 02 Aug 2014 01:08:28 -0700 (PDT)
Received: from localhost ([2001:610:612:0:beee:7bff:fe9e:ae56])
	by mx.google.com with ESMTPSA id h13sm26621747wjs.2.2014.08.02.01.08.26
	for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Sat, 02 Aug 2014 01:08:27 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  2 Aug 2014 10:08:23 +0200
Message-Id: <1406966904-25964-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.9.0
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-gnome][PATCH 1/2] gimp 2.8.10: add bzip dependency
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
X-List-Received-Date: Sat, 02 Aug 2014 08:08:30 -0000

WARNING: QA Issue: gimp rdepends on libbz2 but its not a build
dependency? [build-deps]

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta-oe/recipes-graphics/gimp/gimp_2.8.10.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/gimp/gimp_2.8.10.bb b/meta-oe/recipes-graphics/gimp/gimp_2.8.10.bb
index 77bc6bd..a893dc2 100644
--- a/meta-oe/recipes-graphics/gimp/gimp_2.8.10.bb
+++ b/meta-oe/recipes-graphics/gimp/gimp_2.8.10.bb
@@ -4,7 +4,7 @@ SECTION = "x11/graphics"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-DEPENDS = "babl gdk-pixbuf-native libart-lgpl gtk+ jpeg libpng libexif tiff lcms gegl poppler jasper"
+DEPENDS = "babl gdk-pixbuf-native libart-lgpl gtk+ jpeg libpng libexif tiff lcms gegl poppler jasper bzip2"
 DEPENDS += "${@base_contains('DISTRO_FEATURES', 'x11', 'libxmu libxpm', '', d)}"
 
 inherit gnome
-- 
1.9.0


