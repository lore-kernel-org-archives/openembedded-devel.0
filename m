Return-Path: <raj.khem@gmail.com>
Received: from mail-io0-f196.google.com (mail-io0-f196.google.com
	[209.85.223.196])
	by mail.openembedded.org (Postfix) with ESMTP id C3D4B77ABF
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Apr 2017 03:47:45 +0000 (UTC)
Received: by mail-io0-f196.google.com with SMTP id d203so52528165iof.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Apr 2017 20:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=1NrcSME4hOM6sz7kTxh3WBFvN1JDDPs/ij/g5gnjWeE=;
	b=UqdjLSNC2Uqu2SBu9ZHbM52UtkKwwdXeYeoRG1tfmKXIaP5ef4RzoPgNLN6Jhv6vkh
	sfkP5Zb34bD5ftnawC2Ti4HWFNvbgpb31YeYEWFI8tl63VZDtCcM9+2P2JFDFyq2fI65
	I8UPGYh9SXqjfp81z+sW4GNsn0PCOD4d0nwB7Ubj+26YbwacmKTk8CsqAiBC8bZyH4eP
	KUS8DvU09hv3hBKHI3VE/V5ms3GXrzacnn064Ji1fzn4Ik+xf6r1hwiUP/DWYGvo+WYI
	D4p6r27TrCyCkuL1i8R6kPXyVT8RY8wnul+Pg02F6LUktVSy0ULHo9q0TnZMnoDPslB3
	TBpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=1NrcSME4hOM6sz7kTxh3WBFvN1JDDPs/ij/g5gnjWeE=;
	b=KtKwx5Z50E7UGABQXwFzwDeO1ob3osfG0H7SICqr+rCaV/931s7A+qMnl8s20+1Gek
	eAI2c8mHfKbs9zF91j4t22Mu4bVJm1T/y1tRklmSSGk/W6sWfqi81wOVBtW9LS7t/u+n
	1GTazTC+VRKbEBdwrmkOFjFXvNaDrnjCH7Qd8/J+q+TsAYtVM6IpfT0sOvwiRI4wPqVd
	RZY3QerPTpfoL8d19s4gAz+zjpTL3XBl6t5RgixB2IuXC6MKMtyYJ2sit5OxaQL27BsL
	EZXzLR5SXBUF7an9bY4y5Db3IBHibv8ig93kpwO6zwc5pnZMs5aqqRjgZC+s+qXm13Zu
	9nwg==
X-Gm-Message-State: AN3rC/5q9b/lDWvb/QwYePCyQoIILE/99u87PtfhcNv+LnQY/GEEYNCa
	NxvUWCEQRc9s1bqa
X-Received: by 10.107.173.136 with SMTP id m8mr11586646ioo.190.1493092066477; 
	Mon, 24 Apr 2017 20:47:46 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192])
	by smtp.gmail.com with ESMTPSA id 9sm1244118itm.6.2017.04.24.20.47.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 24 Apr 2017 20:47:45 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 24 Apr 2017 20:47:17 -0700
Message-Id: <20170425034719.8630-9-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.2
In-Reply-To: <20170425034719.8630-1-raj.khem@gmail.com>
References: <20170425034719.8630-1-raj.khem@gmail.com>
Subject: [meta-oe][ 09/11] geis: Fix build with gcc7
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 25 Apr 2017 03:47:46 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...pare-the-first-character-of-string-to-nul.patch | 43 ++++++++++++++++++++++
 .../canonical-multitouch/geis_2.2.17.bb            |  5 ++-
 2 files changed, 46 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-support/canonical-multitouch/geis/0001-libgeis-Compare-the-first-character-of-string-to-nul.patch

diff --git a/meta-oe/recipes-support/canonical-multitouch/geis/0001-libgeis-Compare-the-first-character-of-string-to-nul.patch b/meta-oe/recipes-support/canonical-multitouch/geis/0001-libgeis-Compare-the-first-character-of-string-to-nul.patch
new file mode 100644
index 000000000..3b3acab24
--- /dev/null
+++ b/meta-oe/recipes-support/canonical-multitouch/geis/0001-libgeis-Compare-the-first-character-of-string-to-nul.patch
@@ -0,0 +1,43 @@
+From 1e48821ba109b00e9c2931f12aa206c4ef54fd71 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 24 Apr 2017 12:34:55 -0700
+Subject: [PATCH] libgeis: Compare the first character of string to null
+
+gcc7 wants to be specific when it comes to comparing characters
+and strings
+
+fixes
+
+| ../../../../../../../workspace/sources/geis/libgeis/geis_v1.c: In function '_v1_subscribe_device':
+| ../../../../../../../workspace/sources/geis/libgeis/geis_v1.c:613:20: error: comparison between pointer and zero character constant [-Werror=pointer-compare]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ libgeis/geis_v1.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/libgeis/geis_v1.c b/libgeis/geis_v1.c
+index 67045ee..07c0851 100644
+--- a/libgeis/geis_v1.c
++++ b/libgeis/geis_v1.c
+@@ -610,7 +610,7 @@ _v1_subscribe_device(GeisInstance instance,
+                      const char **gesture_list)
+ {
+   GeisStatus result = GEIS_UNKNOWN_ERROR;
+-  if (gesture_list == GEIS_ALL_GESTURES)
++  if (gesture_list[0][0] == GEIS_ALL_GESTURES)
+   {
+     geis_debug("subscribing device %d for all gestures", device_id);
+   }
+@@ -757,7 +757,7 @@ geis_unsubscribe(GeisInstance     instance,
+                  GeisGestureType *gesture_list)
+ {
+   GeisStatus status = GEIS_STATUS_NOT_SUPPORTED;
+-  if (gesture_list == GEIS_ALL_GESTURES)
++  if (gesture_list[0] == GEIS_ALL_GESTURES)
+   {
+     status = geis_subscription_deactivate(instance->subscription);
+   }
+-- 
+2.12.2
+
diff --git a/meta-oe/recipes-support/canonical-multitouch/geis_2.2.17.bb b/meta-oe/recipes-support/canonical-multitouch/geis_2.2.17.bb
index 281dc3d42..976aafb4f 100644
--- a/meta-oe/recipes-support/canonical-multitouch/geis_2.2.17.bb
+++ b/meta-oe/recipes-support/canonical-multitouch/geis_2.2.17.bb
@@ -19,9 +19,10 @@ REQUIRED_DISTRO_FEATURES = "x11"
 
 DEPENDS += "grail dbus-glib python3 virtual/libx11 libxext libxi libxcb dbus frame"
 
-SRC_URI = "https://launchpad.net/${BPN}/trunk/${PV}/+download/${BPN}-${PV}.tar.xz\
+SRC_URI = "https://launchpad.net/${BPN}/trunk/${PV}/+download/${BPN}-${PV}.tar.xz \
            file://fix-indentation-for-gcc6.patch \
-"
+           file://0001-libgeis-Compare-the-first-character-of-string-to-nul.patch \
+           "
 SRC_URI[md5sum] = "2ff9d76a3ea5794516bb02c9d1924faf"
 SRC_URI[sha256sum] = "8a60f5683852094038904e690d23cc5a90a980fc52da67f0f28890baa25c70eb"
 
-- 
2.12.2


