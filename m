Return-Path: <george.mccollister@gmail.com>
Received: from mail-io0-f194.google.com (mail-io0-f194.google.com
	[209.85.223.194])
	by mail.openembedded.org (Postfix) with ESMTP id B581E71A19
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Nov 2016 22:19:45 +0000 (UTC)
Received: by mail-io0-f194.google.com with SMTP id h133so32461017ioe.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Nov 2016 14:19:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=T22BTSX6Sk/kv7F86Ki60J8aVFPlyltIAu3BSTy1Yu8=;
	b=b3eXzWMtVzSyy9P8C9BA4yJEOcghq+QKDxqH54VxNiVRJOCoBalivM6iFgex1ugXeT
	AsBLKEgao06bBgkxwTwDwQh8rpRWxInPip6vFwgXlaKj2AwGCeaPAzBFy5dRnitJIHYG
	eN0p6Q2aek8fw+Xjl9cL156dASDmr/JbrQRSSA/ZZm7foRALi/E5qw3XmMf2orwYD3lm
	DnLJzC2UDAp2x9gPNPT+WEfHkdEsnHv3X0QtvA8rrIEMwhJgdC6hPtEQ4yijgcCC9VvA
	M25AK6b7B9szkgJFYH/eeeGh6viKPjbb8QX3A4uUutyAvaqxWpVc2TIxOvxha5R5WV+k
	Tcpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=T22BTSX6Sk/kv7F86Ki60J8aVFPlyltIAu3BSTy1Yu8=;
	b=dGO4pu3QakQZw77ZDGw+9AU4FLGfgvVYVOTuSI9iz8xmbq39AdsmR4ry55gYAbJe9P
	VUZ7eEZS/8im7ULvBTu4xgkG/GJEszUTwpHkUYJYrbARFy5Ihuc+LrlmGulqiVVIG0lv
	jycEImyDzHEfZ4r9prJB0cBzb7QEHUrP0NAJe/6Y6uOwZmnmy64FQPXZgukgdsHsjYzD
	YNxL8f7+U4bJrdQQ+GXIS2+QKZOFnzC7ayx8OYMI/cbdLQ0rF9GWOCfnaSkSV5oDSItO
	sl2u6fEuUGBtSUiba6IIPQ9L5B83NGBcGbo0JtqlpowVZTGLqX5d5R7yd0hGQr5wu8Qx
	8FFA==
X-Gm-Message-State: AKaTC02V/yhRjnSrxmtS4u0FXAql3bs2C8Z5R+3jG6gNSkoARsWNnwGvxfh1n2AMX8GuuA==
X-Received: by 10.36.4.20 with SMTP id 20mr25289353itb.109.1480457986986;
	Tue, 29 Nov 2016 14:19:46 -0800 (PST)
Received: from localhost.localdomain (216-21-169-52.slc.googlefiber.net.
	[216.21.169.52]) by smtp.gmail.com with ESMTPSA id
	j201sm1579971ita.2.2016.11.29.14.19.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 29 Nov 2016 14:19:46 -0800 (PST)
From: George McCollister <george.mccollister@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 29 Nov 2016 16:19:12 -0600
Message-Id: <20161129221912.21538-1-george.mccollister@gmail.com>
X-Mailer: git-send-email 2.9.3
Subject: [meta-browser][PATCH] chromium: Remove dependency on Linux 4.5
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
X-List-Received-Date: Tue, 29 Nov 2016 22:19:45 -0000

Add a patch adapted from qtwebengine to remove the dependency on Linux
4.5 when glibc >= 2.24 is used. This resolves the problem with tabs
always showing "Aw, snap!".

Signed-off-by: George McCollister <george.mccollister@gmail.com>
---
 .../chromium/Do-not-depend-on-Linux-4.5.patch      | 33 ++++++++++++++++++++++
 recipes-browser/chromium/chromium_52.0.2743.76.bb  |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 recipes-browser/chromium/chromium/chromium/Do-not-depend-on-Linux-4.5.patch

diff --git a/recipes-browser/chromium/chromium/chromium/Do-not-depend-on-Linux-4.5.patch b/recipes-browser/chromium/chromium/chromium/Do-not-depend-on-Linux-4.5.patch
new file mode 100644
index 0000000..fce37cd
--- /dev/null
+++ b/recipes-browser/chromium/chromium/chromium/Do-not-depend-on-Linux-4.5.patch
@@ -0,0 +1,33 @@
+From 6e5f0405559780ee3c45825f065e216bf472c262 Mon Sep 17 00:00:00 2001
+From: Allan Sandfeld Jensen <allan.jensen@theqtcompany.com>
+Date: Tue, 9 Aug 2016 16:21:29 +0200
+Subject: [PATCH] Do not depend on Linux 4.5
+
+Avoid using MADV_FREE that was only recently added to Linux. It will fail when
+run on older Linux kernels.
+
+Change-Id: I9b0369fb31402f088b2327c12f70dd39f5e4c8c0
+Reviewed-by: Peter Varga <pvarga@inf.u-szeged.hu>
+---
+ third_party/WebKit/Source/wtf/allocator/PageAllocator.cpp | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/third_party/WebKit/Source/wtf/allocator/PageAllocator.cpp b/third_party/WebKit/Source/wtf/allocator/PageAllocator.cpp
+index 12c9a7b..1639013 100644
+--- a/third_party/WebKit/Source/wtf/allocator/PageAllocator.cpp
++++ b/third_party/WebKit/Source/wtf/allocator/PageAllocator.cpp
+@@ -41,6 +41,11 @@
+ #include <errno.h>
+ #include <sys/mman.h>
+ 
++#if OS(LINUX) && defined(MADV_FREE)
++// Added in Linux 4.5, but we don't want to depend on 4.5 at runtime
++#undef MADV_FREE
++#endif
++
+ #ifndef MADV_FREE
+ #define MADV_FREE MADV_DONTNEED
+ #endif
+-- 
+2.9.3
+
diff --git a/recipes-browser/chromium/chromium_52.0.2743.76.bb b/recipes-browser/chromium/chromium_52.0.2743.76.bb
index 14b519c..d85d893 100644
--- a/recipes-browser/chromium/chromium_52.0.2743.76.bb
+++ b/recipes-browser/chromium/chromium_52.0.2743.76.bb
@@ -9,6 +9,7 @@ SRC_URI += "\
         file://0005-Override-root-filesystem-access-restriction.patch \
         file://chromium/0011-Replace-readdir_r-with-readdir.patch \
         file://chromium/remove-Werror.patch \
+        file://chromium/Do-not-depend-on-Linux-4.5.patch \
         ${@bb.utils.contains('PACKAGECONFIG', 'component-build', 'file://component-build.gypi', '', d)} \
         ${@bb.utils.contains('PACKAGECONFIG', 'ignore-lost-context', 'file://0001-Remove-accelerated-Canvas-support-from-blacklist.patch', '', d)} \
 "
-- 
2.9.3


