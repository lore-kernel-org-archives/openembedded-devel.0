Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1TBttv-0005sm-Dc
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 Sep 2012 22:51:11 +0200
Received: by bkcik5 with SMTP id ik5so132752bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Sep 2012 13:38:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=0SUfHiVF7cnNOxodxHhw3TwsOoQWmvaBTjqo56hJHOc=;
	b=hU+eMkaIELSQ6hEGsdrWH20xslzGvN3DBB/knpf+v9avyBm715QOo18bofV8YR25ig
	idTv5i/6BF5EcrqK0xdLUU/ytc0Zcq/JsjJwI8+6czaabhBceD60lrQLTuT9MK+perNd
	JDrT2lMxOeABm19VZ3HSKkmGt8cPNuVg9YZCHxpKWNQmZZxKFE9KO2ARW6FyX59XoEzT
	KAK4ZWyeX1ZbLaXrMsf7rZGa8DiUv0kGX0CItPSXVfymoJhZUIeMalK444xUyurJ7YHd
	kA4YBXPN6CnNCxHoDfHXStC+b1alGJ2fetExy0GWYCQS6EhyQZKLxQVyWQoZM/rZ2o8P
	gjlQ==
Received: by 10.204.147.65 with SMTP id k1mr6664581bkv.29.1347482318986;
	Wed, 12 Sep 2012 13:38:38 -0700 (PDT)
Received: from mizar.localdomain
	(host43-254-dynamic.30-79-r.retail.telecomitalia.it. [79.30.254.43])
	by mx.google.com with ESMTPS id j9sm12959797bkv.0.2012.09.12.13.38.36
	(version=SSLv3 cipher=OTHER); Wed, 12 Sep 2012 13:38:37 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 12 Sep 2012 22:38:31 +0200
Message-Id: <1347482311-7068-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <1347481415-4249-1-git-send-email-andrea.adami@gmail.com>
References: <1347481415-4249-1-git-send-email-andrea.adami@gmail.com>
Subject: [meta-handheld][PATCH v2] zaurus.inc: fix xserver/mesa virtual providers
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
X-List-Received-Date: Wed, 12 Sep 2012 20:51:11 -0000

* xserver-xorg-lite has been removed with commit 5868358
* mesa-xlib has been removed with commit 7a815ca
*
* default-providers.inc gives following settings:
* PREFERRED_PROVIDER_virtual/xserver ?=  "xserver-xorg"
* PREFERRED_PROVIDER_virtual/xserver-xf86 ?= "xserver-xorg"
* PREFERRED_PROVIDER_virtual/libgl ?= "mesa-dri"
* PREFERRED_PROVIDER_virtual/libgles1 ?= "mesa-dri"
* PREFERRED_PROVIDER_virtual/libgles2 ?= "mesa-dri"
* PREFERRED_PROVIDER_virtual/libx11 ?= "libx11"

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 conf/machine/include/zaurus.inc |    7 +++----
 1 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/conf/machine/include/zaurus.inc b/conf/machine/include/zaurus.inc
index 3f5c642..99fd7bd 100644
--- a/conf/machine/include/zaurus.inc
+++ b/conf/machine/include/zaurus.inc
@@ -60,10 +60,9 @@ EXTRA_IMAGECMD_sum.jffs2_collie = "--pad -l --eraseblock=0x20000 -n"
 # xserver
 #########
 
-PREFERRED_PROVIDER_virtual/xserver = "xserver-xorg-lite"
-PREFERRED_PROVIDER_virtual/xserver-xf86 = "xserver-xorg-lite"
-XSERVER = "xserver-xorg-lite xf86-video-fbdev xf86-input-keyboard xf86-input-mouse xf86-input-evdev"
-PREFERRED_PROVIDER_virtual/libgl = "mesa-xlib"
+# Zaurus gets preferred providers settings
+# from distro/include/default-providers.inc
+XSERVER = "xserver-xorg xf86-video-fbdev xf86-input-keyboard xf86-input-mouse xf86-input-evdev"
 
 ########
 # kernel
-- 
1.7.8.6



