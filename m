Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Tfi6K-00040y-L0
	for openembedded-devel@lists.openembedded.org;
	Tue, 04 Dec 2012 03:19:12 +0100
Received: by mail-ee0-f47.google.com with SMTP id e51so1926936eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Dec 2012 18:04:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=ABVFnHij3czdUYXyMUaI/2EYH5IAQ+gEBQtRU4TLanw=;
	b=KMdP40U/lDwuTT2G4SmsMrM709KVNruW7Wj5+S3SMjp5yJ+sfBW5xJGkY12pwu9jhZ
	EVxbKLb+Qu7IzgF+I2TOpEiFC6XB9CUurYSiLKHV84jFrRYgJs4dC/BB1cl3i8dEMW+c
	znICArXpvq/VOKFMz39DDOT49AvciW9Bgpcz5KZAoXLYuUnLM5VAzrDYQ/hl9ntHjhOz
	hiEF+cmTi7biQEPYdUFwoCgnG73iwabFXxtdxTHQdsaw+/a42wmZ8wvbk8aQAFNGx9Wz
	sgoVbP3LX53oFlRRpVWozAIUQZLV0h21p1yegkxtLBjbKp4KxitQBwRRryBwDDpI4c4c
	QXLA==
Received: by 10.14.175.198 with SMTP id z46mr42734793eel.26.1354586693057;
	Mon, 03 Dec 2012 18:04:53 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id 46sm34816390eeg.4.2012.12.03.18.04.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 03 Dec 2012 18:04:52 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  4 Dec 2012 02:59:11 +0100
Message-Id: <b8dadf89dd3e6c90a9dffd9c44682f2f7ec67a04.1354586187.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <cover.1354586187.git.Martin.Jansa@gmail.com>
References: <cover.1354586187.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1354586187.git.Martin.Jansa@gmail.com>
References: <cover.1354586187.git.Martin.Jansa@gmail.com>
Subject: [PATCH 38/58] libbonobo: fix QA warnings in packaging
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
X-List-Received-Date: Tue, 04 Dec 2012 02:19:12 -0000

* fixes:
libbonobo-2.24.3: non -staticdev package contains static .a library: libbonobo-dev path '/work/armv7a-vfp-neon-oe-linux-gnueabi/libbonobo/2.24.3-r0/packages-split/libbonobo-dev/usr/lib/orbit-2.0/Bonobo_module.a'
libbonobo-2.24.3: non -staticdev package contains static .a library: libbonobo-dev path '/work/armv7a-vfp-neon-oe-linux-gnueabi/libbonobo/2.24.3-r0/packages-split/libbonobo-dev/usr/lib/bonobo/monikers/libmoniker_std_2.a'

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-gnome/recipes-gnome/bonobo/libbonobo.inc       | 4 ++--
 meta-gnome/recipes-gnome/bonobo/libbonobo_2.24.3.bb | 2 ++
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-gnome/recipes-gnome/bonobo/libbonobo.inc b/meta-gnome/recipes-gnome/bonobo/libbonobo.inc
index 91ce737..d9a8618 100644
--- a/meta-gnome/recipes-gnome/bonobo/libbonobo.inc
+++ b/meta-gnome/recipes-gnome/bonobo/libbonobo.inc
@@ -16,8 +16,8 @@ ORBIT_IDL_SRC = "${STAGING_BINDIR_NATIVE}/orbit-idl-2"
 FILES_${PN} += "${libdir}/orbit-2.0/*.so ${libdir}/bonobo/monikers/*.so"
 FILES_${PN}-dbg += "${libdir}/bonobo/monikers/.debug \
 	${libdir}/bonobo-2.0/samples/.debug ${libdir}/orbit-2.0/.debug"
-FILES_${PN}-dev += "${libdir}/orbit-2.0/* ${libdir}/bonobo/monikers/* \
-	${libdir}/bonobo-2.0/samples"
+FILES_${PN}-dev += "${libdir}/orbit-2.0/*.la ${libdir}/bonobo/monikers/*.la ${libdir}/bonobo-2.0/samples"
+FILES_${PN}-staticdev += "${libdir}/orbit-2.0/*.a ${libdir}/bonobo/monikers/*.a"
 
 LEAD_SONAME = "libbonobo-2.so"
 
diff --git a/meta-gnome/recipes-gnome/bonobo/libbonobo_2.24.3.bb b/meta-gnome/recipes-gnome/bonobo/libbonobo_2.24.3.bb
index c878286..253b46a 100644
--- a/meta-gnome/recipes-gnome/bonobo/libbonobo_2.24.3.bb
+++ b/meta-gnome/recipes-gnome/bonobo/libbonobo_2.24.3.bb
@@ -1,3 +1,5 @@
 require libbonobo.inc
+PR = "r1"
+
 SRC_URI[archive.md5sum] = "b217cef6a187505290c66c5bf8225d38"
 SRC_URI[archive.sha256sum] = "5310957fa90691689c0557218b8833f681666cae160bd84e1f2c2705189a4ebe"
-- 
1.8.0



