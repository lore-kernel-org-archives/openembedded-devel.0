Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E55BBC433F5
	for <webhook@archiver.kernel.org>; Sat,  8 Oct 2022 07:53:00 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.65])
 by mx.groups.io with SMTP id smtpd.web10.1940.1665215575024205763
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 08 Oct 2022 00:52:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=XnH1s5w9;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.65,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1665215573; i=@fujitsu.com;
	bh=Rx79wPfCQuSZH+rcODK03nnSqL2Hriib3jpKxREwgGY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=XnH1s5w9mUi6K/eHZWcWEcIfaiJFO28L2ao0Wypw3Hw8Hyq5CQcAufLPhgSFZ3HqK
	 YkfECJMwsdJ2LadG5wB5k9bHbC8er4/NGIhaDAnm+KRqAbrCLqWBi5DFHmO20jliHG
	 lAk6/gX2yC94f/BCYwylIf9PqCyyWtE6HNY9M89VpFqY3AdOYy4lK9pIMi4CSLsLbd
	 z7JTZxpygv8Y0pQ64m9hiEjqp9krkPtrGnlSys0Pf0m1NS18SnuaAksz5sqDzNSkqO
	 6lPmbN+0TCqqPLE5V7Ku0D86ptiUEs4JvxFkXvqr0P2QBkDhrlq0JaH+kFJ/X5cfoT
	 m+ECOInEaHKEQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrJIsWRWlGSWpSXmKPExsViZ8MxSTdExzH
  Z4NUcCYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNaP5z2r2gsniFRtOr2NqYFwj0sXIxSEk8IRR
  4sLULnYI5zqTxK/f3WwQzm5GiSk7rwBlODnYBNQkpt+6wQpiiwjoSyydvYcZxGYWUJF48bsHr
  EZYwEGie95FsDgLUPzdsVZGEJtXwEniyOQ/bCC2hICCxJSH78FqOAWcJX68XQ9mCwHV7N7ymw
  miXlDi5MwnLBDzJSQOvnjBDNGrKDH7cjMLhF0hMWtWGxOErSZx9dwm5gmMgrOQtM9C0r6AkWk
  Vo1VSUWZ6RkluYmaOrqGBga6hoamuoa6RobleYpVuol5qqW55anGJrqFeYnmxXmpxsV5xZW5y
  TopeXmrJJkZgGKcUM97cwdja91PvEKMkB5OSKO/TrQ7JQnxJ+SmVGYnFGfFFpTmpxYcYZTg4l
  CR4O1Qdk4UEi1LTUyvSMnOAMQWTluDgURLhDdAGSvMWFyTmFmemQ6ROMdpzrG04sJeZY+rsf/
  uZOZaDyZlf2w4wC7Hk5eelSonzbgNpEwBpyyjNgxsKSwGXGGWlhHkZGRgYhHgKUotyM0tQ5V8
  xinMwKgnzSqgDTeHJzCuB2/0K6CwmoLOsHtqBnFWSiJCSamCa+9vmSGXHtbSKyaekVpj9ueGz
  4OExzxcdW+0XVxTfjpg673GlcOk1Tvt/WzcWPFrEbPuAd/Kykwz9MyNULNfZm6w5bM1x/5/mj
  Jq7tZsfTKqewrrKnn9Vax2DzVfRr8tMHj7dEvtqphrvrGCzzW0Pgqx+fjn2yNes2dLdVyKKre
  /O2e/KMl8kZUti9Da9mnJ4rl2M2OKL23e1cRrKhjt/PvnrcJ2fc9i7Bh32CTuCG+LSjFdIyjQ
  Yz0q6WSq740H5imKjxhXMy7Xnnj8rUPZFqX9GrP/X939KilbqfP3ml8/DEP79MENnTmu7R1nc
  3fMV65s3dQpxai7lDtjhOtPkqWgfb7/g+vxD97LsTFOUWIozEg21mIuKEwFZ/YNgfAMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-9.tower-587.messagelabs.com!1665215572!66901!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 1808 invoked from network); 8 Oct 2022 07:52:52 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-9.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 8 Oct 2022 07:52:52 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 05E67100078
	for <openembedded-devel@lists.openembedded.org>;
 Sat,  8 Oct 2022 08:52:52 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id ED3831000CD
	for <openembedded-devel@lists.openembedded.org>;
 Sat,  8 Oct 2022 08:52:51 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Sat, 8 Oct 2022 08:52:50 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] freeglut: upgrade 3.2.1 -> 3.4.0
Date: Sat, 8 Oct 2022 15:52:14 +0800
Message-ID: <1665215534-23236-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1665215534-23236-1-git-send-email-wangmy@fujitsu.com>
References: <1665215534-23236-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 08 Oct 2022 07:53:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/99095

Changelog:
=========
Add GLUT_ACTIVE_SUPER modifier, and corresponding GLUT_KEY_SUPER_L and GLUT_KEY_SUPER_R special keys.
Fix RGB mode (GLUT_RGBA) colors on 8bpp displays on windows (construct default RGB332 palette).
Fix indexed color context creation on X11 and windows (GLUT_INDEX).
Add missing colormap management functions for X11 and windows (glutSetColor, glutGetColor).
Fix crash when calling glutTimerFuncUcall.
Fix FreeBSD build by essentially disabling the joystick code for newer FreeBSD versions.
Add fallbacks for the old GLX (<1.3) context creation API (glXChooseVisual/glXCreateContext)
Add fallbacks for OpenGL 1.0 (no vertex arrays/client state).
Use nanosleep instead of usleep on UNIX, which is more widely supported on old UNIX systems.
Fix build on X11 if GL_SAMPLES is not defined.
Fix overly strict context version checking on Android leading to context creation failure in some cases.
Fix GLUT_CURSOR_INFO on windows, should be IDC_HAND, not IDC_HELP.
Fix mismatched font declarations on X11.
Add alternative simple ways to build freeglut with native tools only, without having to use cmake.
Fix build on windows with cmake 3.0.0. Explicitly link with gdi32.
Fix build on MSVC 2005.
Fix build on MacOS X. Link with all the necessary X libraries.
Fix build on SGI IRIX.
Fix build on Android (mismatched function prototypes and missing glutCreateMenuUcall).
Add support for the ninja multi-config generator.
Removed spurious dependency on a C++ compiler. One of the demos was being compiled as C++ for no reason.
Silence unnecessary warnings when VBOs or GLSL are not available.
New demo programs: 3dview, keyboard, joystick.
Documentation: added MacOS X build instructions.
Made it possible to eventually support building freeglut as a single compilation unit
Other minor fixes.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../freeglut/{freeglut_3.2.1.bb => freeglut_3.4.0.bb}          | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-oe/recipes-graphics/freeglut/{freeglut_3.2.1.bb => freeglut_3.4.0.bb} (81%)

diff --git a/meta-oe/recipes-graphics/freeglut/freeglut_3.2.1.bb b/meta-oe/recipes-graphics/freeglut/freeglut_3.4.0.bb
similarity index 81%
rename from meta-oe/recipes-graphics/freeglut/freeglut_3.2.1.bb
rename to meta-oe/recipes-graphics/freeglut/freeglut_3.4.0.bb
index 6ef9f74c70..627ce23544 100644
--- a/meta-oe/recipes-graphics/freeglut/freeglut_3.2.1.bb
+++ b/meta-oe/recipes-graphics/freeglut/freeglut_3.4.0.bb
@@ -4,8 +4,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=89c0b58a3e01ce3d8254c9f59e78adfb"
 
 SRC_URI = "https://sourceforge.net/projects/${BPN}/files/${BPN}/${PV}/${BPN}-${PV}.tar.gz"
-SRC_URI[md5sum] = "cd5c670c1086358598a6d4a9d166949d"
-SRC_URI[sha256sum] = "d4000e02102acaf259998c870e25214739d1f16f67f99cb35e4f46841399da68"
+SRC_URI[sha256sum] = "3c0bcb915d9b180a97edaebd011b7a1de54583a838644dcd42bb0ea0c6f3eaec"
 
 inherit cmake features_check
 
-- 
2.25.1


