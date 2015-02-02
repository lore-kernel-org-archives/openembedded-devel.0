Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-we0-f182.google.com (mail-we0-f182.google.com
	[74.125.82.182])
	by mail.openembedded.org (Postfix) with ESMTP id 06C296018F
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Feb 2015 15:28:21 +0000 (UTC)
Received: by mail-we0-f182.google.com with SMTP id l61so39648935wev.13
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 02 Feb 2015 07:28:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=GERPTuYbvRevYhY5kLMN5DZ0vAXu/NSzltZzD1yPFCE=;
	b=MUt3dNhqxDFTvIKaaHo8+l6/X2rWI88P38xDPMO+/U2wezzx0hxMFz+722U5Cf0Naa
	CjtSJ+02eVc7lbx+QFFM1sKP10BqsL/6qxPGUkS0ZMjM6pV2H0rHIP9dAlwFC4Xrd1Jv
	4YhXVTRv2E96dfMMM7O7wERucAQj947iCttrRwd4jG2T1xo72JTaDU3k5c9XMawcztCW
	fvJ8UEildvOivOvkQhs6UzZalV6orhKKn+XwWlQazlV4JdMGcLv4R25ngb7REC4qhB3R
	pAkAi3qwl/1cmTegzQoEHHucV4CbGOqSyO8B9RZkMH5xYQIwyD7KF7AWOzF0sU0EGY+/
	17xw==
X-Gm-Message-State: ALoCoQlngbQ3mGw9yRvhzw2krdIbGY9/R9OP/dILvjtt+sqTq9KdE3Ee0bCpcllQqgsAJfsVB3cK
X-Received: by 10.194.81.161 with SMTP id b1mr45545912wjy.2.1422890902810;
	Mon, 02 Feb 2015 07:28:22 -0800 (PST)
Received: from hackbox.linaro.org ([81.128.185.36])
	by mx.google.com with ESMTPSA id
	x10sm20336299wif.15.2015.02.02.07.28.21
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 02 Feb 2015 07:28:22 -0800 (PST)
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
To: openembedded-devel@lists.openembedded.org,
	cazfi74@gmail.com
Date: Mon,  2 Feb 2015 15:27:44 +0000
Message-Id: <1422890864-24641-1-git-send-email-nicolas.dechesne@linaro.org>
X-Mailer: git-send-email 1.9.1
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: [meta-games][PATCH] supertuxkart: initial recipe for v0.8.1
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
X-List-Received-Date: Mon, 02 Feb 2015 15:28:35 -0000

* the 2 patches are needed to build against mesa 10, they are backported from
  upstream, since there is no new release as of yet.
* tested on Snapdragon (ARMv7 + adreno GPU), running freedreno Mesa Gallium
  driver
* Build tested for qemux86

Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
---
On some distro like Debian/Ubuntu the package is split in supertuxkart and
supertuxkart-data to separate the rather large (~300MB) platform
independent media files. I haven't done it here, but that could be
done if needed..


 ...01-Use-system-s-glext.h-glxext.h-on-linux.patch | 28 ++++++++++++++++++
 ...ch-from-jpirie-for-fixing-mesa-10-compila.patch | 33 ++++++++++++++++++++++
 recipes-games/supertuxkart/supertuxkart_0.8.1.bb   | 19 +++++++++++++
 3 files changed, 80 insertions(+)
 create mode 100644 recipes-games/supertuxkart/files/0001-Use-system-s-glext.h-glxext.h-on-linux.patch
 create mode 100644 recipes-games/supertuxkart/files/0002-Applied-patch-from-jpirie-for-fixing-mesa-10-compila.patch
 create mode 100644 recipes-games/supertuxkart/supertuxkart_0.8.1.bb

diff --git a/recipes-games/supertuxkart/files/0001-Use-system-s-glext.h-glxext.h-on-linux.patch b/recipes-games/supertuxkart/files/0001-Use-system-s-glext.h-glxext.h-on-linux.patch
new file mode 100644
index 0000000..cf61c44
--- /dev/null
+++ b/recipes-games/supertuxkart/files/0001-Use-system-s-glext.h-glxext.h-on-linux.patch
@@ -0,0 +1,28 @@
+From 8771edf61fcf3ced4afb9e9bc08897f575d86834 Mon Sep 17 00:00:00 2001
+From: Deve <deveee@gmail.com>
+Date: Sat, 17 May 2014 09:18:25 +0200
+Subject: [PATCH 1/2] Use system's glext.h/glxext.h on linux.
+
+---
+ lib/irrlicht/source/Irrlicht/COpenGLExtensionHandler.h | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/lib/irrlicht/source/Irrlicht/COpenGLExtensionHandler.h b/lib/irrlicht/source/Irrlicht/COpenGLExtensionHandler.h
+index 7f9e0df..586d0c4 100644
+--- a/lib/irrlicht/source/Irrlicht/COpenGLExtensionHandler.h
++++ b/lib/irrlicht/source/Irrlicht/COpenGLExtensionHandler.h
+@@ -61,9 +61,9 @@
+ 	#include <GL/gl.h>
+ 	#include <GL/glx.h>
+ 	#if defined(_IRR_OPENGL_USE_EXTPOINTER_)
+-	#include "glext.h"
++	#include <GL/glext.h>
+ 	#undef GLX_ARB_get_proc_address // avoid problems with local glxext.h
+-	#include "glxext.h"
++	#include <GL/glxext.h>
+ 	#endif
+ #endif
+ 
+-- 
+2.1.4
+
diff --git a/recipes-games/supertuxkart/files/0002-Applied-patch-from-jpirie-for-fixing-mesa-10-compila.patch b/recipes-games/supertuxkart/files/0002-Applied-patch-from-jpirie-for-fixing-mesa-10-compila.patch
new file mode 100644
index 0000000..3162ba6
--- /dev/null
+++ b/recipes-games/supertuxkart/files/0002-Applied-patch-from-jpirie-for-fixing-mesa-10-compila.patch
@@ -0,0 +1,33 @@
+From 1a922afa0b03b9cc35e9fb4945deb3f73a5d39b4 Mon Sep 17 00:00:00 2001
+From: Deve <deveee@gmail.com>
+Date: Sat, 17 May 2014 09:21:07 +0200
+Subject: [PATCH 2/2] Applied patch from jpirie for fixing mesa 10 compilation
+ problems.
+
+---
+ lib/irrlicht/source/Irrlicht/COpenGLExtensionHandler.h | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/lib/irrlicht/source/Irrlicht/COpenGLExtensionHandler.h b/lib/irrlicht/source/Irrlicht/COpenGLExtensionHandler.h
+index 586d0c4..b39f8b5 100644
+--- a/lib/irrlicht/source/Irrlicht/COpenGLExtensionHandler.h
++++ b/lib/irrlicht/source/Irrlicht/COpenGLExtensionHandler.h
+@@ -49,6 +49,7 @@
+ 	#define NO_SDL_GLEXT
+ 	#include <SDL/SDL_video.h>
+ 	#include <SDL/SDL_opengl.h>
++	typedef void (APIENTRYP PFNGLBLENDEQUATIONPROC) (GLenum mode);
+ 	#include "glext.h"
+ #else
+ 	#if defined(_IRR_OPENGL_USE_EXTPOINTER_)
+@@ -61,6 +62,7 @@
+ 	#include <GL/gl.h>
+ 	#include <GL/glx.h>
+ 	#if defined(_IRR_OPENGL_USE_EXTPOINTER_)
++	typedef void (APIENTRYP PFNGLBLENDEQUATIONPROC) (GLenum mode);
+ 	#include <GL/glext.h>
+ 	#undef GLX_ARB_get_proc_address // avoid problems with local glxext.h
+ 	#include <GL/glxext.h>
+-- 
+2.1.4
+
diff --git a/recipes-games/supertuxkart/supertuxkart_0.8.1.bb b/recipes-games/supertuxkart/supertuxkart_0.8.1.bb
new file mode 100644
index 0000000..126bbd2
--- /dev/null
+++ b/recipes-games/supertuxkart/supertuxkart_0.8.1.bb
@@ -0,0 +1,19 @@
+DESCRIPTION = "SuperTuxKart is a kart racing game featuring Tux and his friends"
+HOMEAPAGE = "http://supertuxkart.sourceforge.net"
+SECTION = "x11/application"
+LICENSE = "GPLv2 & GPLv3+ "
+LIC_FILES_CHKSUM = "file://COPYING;md5=a71cb78659d60f2ced58a594cb65bfba"
+
+DEPENDS = "libogg libvorbis libxrandr virtual/libgl openal-soft fribidi curl"
+
+inherit cmake
+
+S = "${WORKDIR}/SuperTuxKart-${PV}"
+
+SRC_URI = "http://sourceforge.net/projects/supertuxkart/files/SuperTuxKart/${PV}/supertuxkart-${PV}-src.tar.bz2;protocol=https \
+           file://0001-Use-system-s-glext.h-glxext.h-on-linux.patch  \
+           file://0002-Applied-patch-from-jpirie-for-fixing-mesa-10-compila.patch"
+
+SRC_URI[md5sum] = "aa31ecf883dc35859eec76c667f1a6d6"
+SRC_URI[sha256sum] = "335301ae61b0c177be68d5593c65e5b197dc807421f08a8a35740a254cacf8d6"
+
-- 
1.9.1


