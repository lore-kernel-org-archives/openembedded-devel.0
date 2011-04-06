Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Q7RCB-0003b1-1T
	for openembedded-devel@lists.openembedded.org;
	Wed, 06 Apr 2011 13:46:47 +0200
Received: by mail-fx0-f47.google.com with SMTP id 19so1044407fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Apr 2011 04:44:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=PMWY0LrQgpyX3Id7hbsyoudGoD5IMMwyDxC0X1mw00w=;
	b=reZkwkH+EFM4a4h3akosY+H9DH4DhW2q6TzIPVO2VdkRDAdjYZBPY7Ks8VC6vzeURm
	rfzCcIRsUSaPKQgXa2+HdfdQCoexC6cTtTkzdn3pwnuGWQRQaLnNqZSPlFXMC1tcHvv0
	U7b4LNT9FEMmJYRPi3jbfgBWpy+f0y1D4IcuA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=EB9HYvpbve1QUjyUho9kOOuy0nvoNFu3jMKSCJftNeziJxr8qCcZw9JxmgzMo6oj6t
	DdhGt42f+KD04+Sf0mtx6/opLc9pxsAiNSekG2zybn9YcaxSZTSctiqW/qf6czHYxv/Z
	GPCDMd7Tw67Gf8fnSeD9k1p2houdrQD0T/LT0=
Received: by 10.223.85.195 with SMTP id p3mr976930fal.0.1302090282616;
	Wed, 06 Apr 2011 04:44:42 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 14sm51768fas.6.2011.04.06.04.44.40
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 06 Apr 2011 04:44:41 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  6 Apr 2011 13:44:08 +0200
Message-Id: <1302090248-16251-6-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <1302090248-16251-1-git-send-email-Martin.Jansa@gmail.com>
References: <1302090248-16251-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH 5/5] xf86-input-tslib: WIP, start with xserver-1.10.ABI.patch
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
X-List-Received-Date: Wed, 06 Apr 2011 11:46:47 -0000

* but later dropped support for xf86-input-tslib
* https://bugs.launchpad.net/ubuntu/+source/xf86-input-tslib/+bug/714353

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../xf86-input-tslib/xserver-1.10.ABI.patch        |   70 ++++++++++++++++++++
 recipes/xorg-driver/xf86-input-tslib_0.0.6.bb      |    1 +
 2 files changed, 71 insertions(+), 0 deletions(-)
 create mode 100644 recipes/xorg-driver/xf86-input-tslib/xserver-1.10.ABI.patch

diff --git a/recipes/xorg-driver/xf86-input-tslib/xserver-1.10.ABI.patch b/recipes/xorg-driver/xf86-input-tslib/xserver-1.10.ABI.patch
new file mode 100644
index 0000000..d73a2c6
--- /dev/null
+++ b/recipes/xorg-driver/xf86-input-tslib/xserver-1.10.ABI.patch
@@ -0,0 +1,70 @@
+Index: xf86-input-tslib/src/tslib.c
+===================================================================
+--- xf86-input-tslib/src/tslib.c	(revision 48)
++++ xf86-input-tslib/src/tslib.c	(working copy)
+@@ -106,7 +106,7 @@
+ }
+ 
+ static Bool
+-ConvertProc( LocalDevicePtr local,
++ConvertProc( InputInfoPtr local,
+ 			 int first,
+ 			 int num,
+ 			 int v0,
+@@ -135,7 +135,7 @@
+     return t;
+ }
+ 
+-static void ReadInput (LocalDevicePtr local)
++static void ReadInput (InputInfoPtr local)
+ {
+ 	struct ts_priv *priv = (struct ts_priv *) (local->private);
+ 	struct ts_sample samp;
+@@ -382,7 +382,11 @@
+ 					       axiswidth - 1,	/* max val */
+ 					       axiswidth,	/* resolution */
+ 					       0,		/* min_res */
+-					       axiswidth);	/* max_res */
++					       axiswidth
++#if GET_ABI_MAJOR(ABI_XINPUT_VERSION) >= 12
++					       ,Absolute	/* max_res */
++#endif
++					       );
+ 
+ 		InitValuatorAxisStruct(device, 1,
+ #if GET_ABI_MAJOR(ABI_XINPUT_VERSION) >= 7
+@@ -392,7 +396,11 @@
+ 					       axisheight - 1,	/* max val */
+ 					       axisheight,	/* resolution */
+ 					       0,		/* min_res */
+-					       axisheight);	/* max_res */
++					       axisheight       /* max_res */
++#if GET_ABI_MAJOR(ABI_XINPUT_VERSION) >= 12
++					       ,Absolute
++#endif
++					       );
+ 
+ 		if (InitProximityClassDeviceStruct (device) == FALSE) {
+ 			ErrorF ("Unable to allocate EVTouch touchscreen ProximityClassDeviceStruct\n");
+@@ -445,7 +453,7 @@
+  * called when the module subsection is found in XF86Config
+  */
+ static InputInfoPtr
+-xf86TslibInit(InputDriverPtr drv, IDevPtr dev, int flags)
++xf86TslibInit(InputDriverPtr drv, InputInfoPtr dev, int flags)
+ {
+ 	struct ts_priv *priv;
+ 	char *s;
+@@ -455,10 +463,11 @@
+         if (!priv)
+                 return NULL;
+ 
+-	if (!(pInfo = xf86AllocateInput(drv, 0))) {
++	if (!(pInfo = xf86AllocateInput())) {
+ 		xfree(priv);
+ 		return NULL;
+ 	}
++	xf86AddInput(drv, pInfo);
+ 
+ 	/* Initialise the InputInfoRec. */
+ 	pInfo->name = dev->identifier;
diff --git a/recipes/xorg-driver/xf86-input-tslib_0.0.6.bb b/recipes/xorg-driver/xf86-input-tslib_0.0.6.bb
index a1cecaa..decd4a6 100644
--- a/recipes/xorg-driver/xf86-input-tslib_0.0.6.bb
+++ b/recipes/xorg-driver/xf86-input-tslib_0.0.6.bb
@@ -10,6 +10,7 @@ SRC_URI = "http://www.pengutronix.de/software/xf86-input-tslib/download/xf86-inp
            file://10-x11-input-tslib.fdi \
            file://xserver-174-XGetPointerControl.patch \
            file://99-xf86-input-tslib.rules \
+	   file://xserver-1.10.ABI.patch \
 "
 SRC_URI[archive.md5sum] = "b7a4d2f11637ee3fcf432e044b1d017f"
 SRC_URI[archive.sha256sum] = "5f46fdef095a6e44a69e0f0b57c7d665224b26d990d006611236d8332e85b105"
-- 
1.7.4.1



