Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web12.5646.1621325367785549991
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 May 2021 01:09:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=p3/NhIcU;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1621325365; i=@fujitsu.com;
	bh=SwVvkdwcG1UX6OGCId0yBPImXOQMy/WkWMO94YfK80w=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=p3/NhIcUW2kTivnyudBCCpgIfmK/TrhStKE8mzQj/TtrbxaZa4pzeO2roUxQMqnE0
	 Y+x8A1NVQRnNMFraUr881y08z2zcDgAgpVDWlpL5cQUxsJfy4Q5ft8V2An9Y2jnity
	 XyRLnYL7D/nuNhzYpJdJ/yVyd/HwCCA3Bw36SP+n7BkvG02KGuJq4ZMBOzR1dDk04s
	 ARAedb/Xbk5vbUincS9JKz7zzmwq9yJnENvSW4ysi0ltLnRVF3q6RSoJOUaSJKPZ3H
	 wzEmyR7W4bITTqFWjulIYOisjKvm8TbSGJhwk1tuXYmKQAWctuIKSIJNblZAGj+fc+
	 Oz0FOw0CR5YHg==
Received: from [100.113.7.141] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-b.eu-central-1.aws.symcld.net id 80/54-57985-43673A06; Tue, 18 May 2021 08:09:24 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrNIsWRWlGSWpSXmKPExsViZ8MRqmtUtjj
  B4Od7FYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePnpJ3sBQuFK2a+/8rcwLhdoIuRi0NIYDaT
  xPvb/9ghnBOMErumLWXpYuTkYBNQk5h+6wYriC0ioC+xdPYeZhCbWUBF4sXvHnYQW1jASmLpg
  n4wm0VAVWLFmh4mEJtXwEni/rz9YL0SAgoSUx6+Z4aIC0qcnPmEBWKOhMTBFy+YIWoUJWZfbm
  aBsCskXh++xDyBkXcWkpZZSFoWMDKtYrRMKspMzyjJTczM0TU0MNA1NDTWNdE1MjDVS6zSTdJ
  LLdVNTs0rKUoEyuollhfrFVfmJuek6OWllmxiBIZYSiHL2R2MX15/0DvEKMnBpCTKa3Z/UYIQ
  X1J+SmVGYnFGfFFpTmrxIUYZDg4lCd5nJYsThASLUtNTK9Iyc4DhDpOW4OBREuG9DJLmLS5Iz
  C3OTIdInWI05nj3c/EiZo6Tq5YsYhZiycvPS5US5+0BKRUAKc0ozYMbBIvDS4yyUsK8jAwMDE
  I8BalFuZklqPKvGMU5GJWEectApvBk5pXA7XsFdAoT0Cn/GxeBnFKSiJCSamAKDmt+eOJk69X
  OWIMXE3TbEtfe/XftwsLrEx02XzeJXZfS88rPy+tl7dloMyU7tz1L9kpZPKvIP7A21Hi/12u3
  yPXPug2lFl0X+Ze/98eCRGsdQYOgS6zd71m2zlLbdWttXnDpqeDat0f0PW7/ZRHb8VanaLtpQ
  xHDnGa9N4+F1dVzA5mPvl7Q2TvDc1OzDFOmsczETb9nPZ6V15hp8XfGw5VchZ5T8nYKcN75Zn
  p1Tb3dF+k30zfO3io9J/FRpP+Mo9YXLu17NGsP7zbNrgtVOauX+e9+pK8zpV3l/byisokBnZb
  eT99NnONx7MWEicmeTc56VxYvMG5YKRE6zV8rf4lwP6f6TJ5vfgKiK9S+KbEUZyQaajEXFScC
  AJq0E9k+AwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-7.tower-245.messagelabs.com!1621325362!123268!1
X-Originating-IP: [62.60.8.85]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 27669 invoked from network); 18 May 2021 08:09:22 -0000
Received: from unknown (HELO mailhost4.uk.fujitsu.com) (62.60.8.85)
  by server-7.tower-245.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 18 May 2021 08:09:22 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost4.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 14I89L7V011032
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 May 2021 09:09:21 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Tue, 18 May 2021 09:09:20 +0100
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] libsdl: Fix CVE-2019-13616
Date: Tue, 18 May 2021 16:09:11 +0800
Message-ID: <1621325351-16562-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

  References
  https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-13616

  SDL (Simple DirectMedia Layer) through 1.2.15 and 2.x through 2.0.9 has a heap-based buffer over-read
  in BlitNtoN in video/SDL_blit_N.c when called from SDL_SoftBlit in video/SDL_blit.c.

  Upstream-Status: Backport [https://github.com/libsdl-org/SDL/commit/97fefd050976bbbfca9608499f6a7d9fb86e70db]
  CVE: CVE-2019-13616

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libsdl/libsdl-1.2.15/CVE-2019-13616.patch | 27 +++++++++++++++++++
 .../recipes-graphics/libsdl/libsdl_1.2.15.bb  |  1 +
 2 files changed, 28 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/libsdl/libsdl-1.2.15/CVE-2019-13616.patch

diff --git a/meta-oe/recipes-graphics/libsdl/libsdl-1.2.15/CVE-2019-13616.patch b/meta-oe/recipes-graphics/libsdl/libsdl-1.2.15/CVE-2019-13616.patch
new file mode 100644
index 000000000..2db67966c
--- /dev/null
+++ b/meta-oe/recipes-graphics/libsdl/libsdl-1.2.15/CVE-2019-13616.patch
@@ -0,0 +1,27 @@
+From 97fefd050976bbbfca9608499f6a7d9fb86e70db Mon Sep 17 00:00:00 2001
+From: Sam Lantinga <slouken@libsdl.org>
+Date: Tue, 30 Jul 2019 11:00:00 -0700
+Subject: [PATCH] Fixed bug 4538 - validate image size when loading BMP files
+---
+ src/video/SDL_bmp.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/src/video/SDL_bmp.c b/src/video/SDL_bmp.c
+index 8eadc5f..5b5e12c 100644
+--- a/src/video/SDL_bmp.c
++++ b/src/video/SDL_bmp.c
+@@ -143,6 +143,11 @@ SDL_Surface * SDL_LoadBMP_RW (SDL_RWops *src, int freesrc)
+ 	(void) biYPelsPerMeter;
+ 	(void) biClrImportant;
+ 
++        if (biWidth <= 0 || biHeight == 0) {
++            SDL_SetError("BMP file with bad dimensions (%dx%d)", biWidth, biHeight);
++            was_error = SDL_TRUE;
++            goto done;
++        }
+ 	if (biHeight < 0) {
+ 		topDown = SDL_TRUE;
+ 		biHeight = -biHeight;
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-graphics/libsdl/libsdl_1.2.15.bb b/meta-oe/recipes-graphics/libsdl/libsdl_1.2.15.bb
index 7a0190832..d91a1856b 100644
--- a/meta-oe/recipes-graphics/libsdl/libsdl_1.2.15.bb
+++ b/meta-oe/recipes-graphics/libsdl/libsdl_1.2.15.bb
@@ -27,6 +27,7 @@ SRC_URI = "http://www.libsdl.org/release/SDL-${PV}.tar.gz \
            file://CVE-2019-7637.patch \
            file://CVE-2019-7638.patch \
            file://CVE-2019-7576.patch \
+           file://CVE-2019-13616.patch \
           "
 
 UPSTREAM_CHECK_REGEX = "SDL-(?P<pver>\d+(\.\d+)+)\.tar"
-- 
2.25.1

