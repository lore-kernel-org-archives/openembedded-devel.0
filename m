Received: from mail-ea0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TdS5U-0005dI-M5
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Nov 2012 21:49:01 +0100
Received: by mail-ea0-f175.google.com with SMTP id h11so4908028eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Nov 2012 12:34:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=pnQyuc3Z7qiUTBfM82ul5kuWYupdwvrf97AB3sFClJ0=;
	b=KkUdfE7Dl9s5wbhq1UIaex+XI9Ryu3olSR5fG1hbhvjDmI+Nldyof3mTZgsbwlSAZe
	wpvyGov57SnHvAgRIS8kAGh0cNdiRLkVqEufMpiWRWTK0yPpSqHTsYKaVh/IFhn1h2Q0
	HlWcBSDzbOK+t8c/9JsdCdT5Dq/O+eMsCopTULjl5cI2DuS3KSI/cJ4OBuYmOYY1/wfd
	/Pc5DMtj9xQpSbSogcQdFh7vXZf6EynrhprfrE4mVxcA+tCzU7zTrIOr3cDGT0E0B7hs
	043cGdHmhLfoolKvL+dxblIMroF/T27ybuEhGemC/W1tCO9vB/KzI7vcJZnsDLsvY+SQ
	pNSg==
Received: by 10.14.221.9 with SMTP id q9mr62458839eep.3.1354048489559;
	Tue, 27 Nov 2012 12:34:49 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id y44sm42847248eel.14.2012.11.27.12.34.48
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 27 Nov 2012 12:34:49 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 27 Nov 2012 21:33:43 +0100
Message-Id: <a9672ac22a4b04944edee09b81d90147bb2ecf37.1354034591.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <cover.1354034591.git.Martin.Jansa@gmail.com>
References: <cover.1354034591.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1354034591.git.Martin.Jansa@gmail.com>
References: <cover.1354034591.git.Martin.Jansa@gmail.com>
Subject: [PATCH 06/21] evas: add tiff to DEPENDS
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
X-List-Received-Date: Tue, 27 Nov 2012 20:49:01 -0000

* it's explicitly enabled in OECONF
  and fails without
  | evas_image_load_tiff.c:8:20: fatal error:  tiffio.h: No such file or directory

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/efl/evas.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-efl/recipes-efl/efl/evas.inc b/meta-efl/recipes-efl/efl/evas.inc
index 4f48f5d..04cf835 100644
--- a/meta-efl/recipes-efl/efl/evas.inc
+++ b/meta-efl/recipes-efl/efl/evas.inc
@@ -2,8 +2,8 @@ DESCRIPTION = "Evas is the Enlightenment canvas API"
 LICENSE = "MIT BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b9b25b03d63aa496552658c7e78b11a1"
 # can also depend on valgrind, libsdl-x11, directfb
-DEPENDS = "librsvg eina eet freetype jpeg libpng virtual/libx11 libxext libxrender fontconfig libfribidi giflib"
-DEPENDS_virtclass-native = "freetype-native libxext-native libpng-native jpeg-native eet-native eina-native libfribidi-native"
+DEPENDS = "librsvg eina eet freetype jpeg libpng tiff virtual/libx11 libxext libxrender fontconfig libfribidi giflib"
+DEPENDS_virtclass-native = "freetype-native libxext-native libpng-native jpeg-native tiff-native eet-native eina-native libfribidi-native"
 
 inherit efl
 
-- 
1.8.0



