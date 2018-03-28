Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id 69A4578591
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Mar 2018 15:14:00 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id z73so2602553wrb.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Mar 2018 08:14:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=BPEbIotelcrP0LB8JSdSrcFDaGta0uA6AWuS2tGKMzw=;
	b=isBYpbQLVdPNcW6JMVhUJG1FD48mxASi/BgR4Tc7Gx3YLDy+r6+Txow133uU1+r0Za
	HiYlkMmkyTHrYLgQUV/ytqaRWxqiZtBi7N9/vFsmmGLmSklbOo0O7MKIBMp1CM0MN5S7
	X+UResHdmaoLMS1ETC6jogbbEGXFB5EwhWFQNt1tfTouFkMpzWRom5ahBpdMo5sNH62T
	0XFiFCSnqhAo+02tYKKTj2+Hc/m4tasz7P6Xw4CsJhNnAn0uTSS/a+WVHtlsVFKGYWo5
	6TpW9q+bJ5JNh8bNbHnlRmGgKSxzNzo3NtQ/U/DmF4pc478rdxXrTrNjjl5zACU3ontT
	FzkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=BPEbIotelcrP0LB8JSdSrcFDaGta0uA6AWuS2tGKMzw=;
	b=YZb2IKfxdyHf4SD8SIjQW9q74zdwb0ga1/hVN6C89zkvJqMtlhBMEyrZov49zxwGkN
	kUzuyrZABUuoTpcZCps08mdOEpK07T1eWTESaSe98kXrmqQynFUM6QeulWAAVaN59KfO
	tICHPWRN/UtdDREYcxNJ+VtsGoup8UCHrBW0i8UEjlgkrTEUA1+GCp5+hMqeqsPIyGHS
	Nkpty/357LyUEwla3hU738lbrG5V9X3wxOJH3Gk7ndVnkjHOgsO7se/6OSV7H/8TnInm
	9WPaR0E4BkpxgyzXJpFIRFrOk8FGgtXCydGD3Wd/pN7mn1dD/XBslfxDSoNHmzOvPAhs
	sqrg==
X-Gm-Message-State: AElRT7G6mI0djXOoA2nShB6V/F7F+5yspEHK6O6FOJoln7TcfoQ+dsoo
	PK+uggMlI6PyWrhzXXJ57o0LBQ==
X-Google-Smtp-Source: AIpwx4//iwKn649PVrOoeQeIw8INRYIX2qS01FEyUqKCme4hB6TETuCi3bxGck9WX1EmGL+ZGLfMig==
X-Received: by 10.223.185.73 with SMTP id b9mr3312554wrg.229.1522250040986;
	Wed, 28 Mar 2018 08:14:00 -0700 (PDT)
Received: from localhost.localdomain (p50971113.dip0.t-ipconnect.de.
	[80.151.17.19]) by smtp.gmail.com with ESMTPSA id
	n49sm5986665wrn.90.2018.03.28.08.14.00
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 28 Mar 2018 08:14:00 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 28 Mar 2018 17:13:29 +0200
Message-Id: <20180328151331.20660-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.3
MIME-Version: 1.0
Subject: [PATCH 1/3] libsdl-ttf: refresh automake_foreign.patch
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
X-List-Received-Date: Wed, 28 Mar 2018 15:14:00 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../libsdl-ttf/files/automake_foreign.patch          | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/meta-oe/recipes-support/libsdl-ttf/files/automake_foreign.patch b/meta-oe/recipes-support/libsdl-ttf/files/automake_foreign.patch
index 2d5bd6d91..c2e41f93e 100644
--- a/meta-oe/recipes-support/libsdl-ttf/files/automake_foreign.patch
+++ b/meta-oe/recipes-support/libsdl-ttf/files/automake_foreign.patch
@@ -1,9 +1,17 @@
-Index: SDL2_ttf-2.0.14/Makefile.am
-===================================================================
---- SDL2_ttf-2.0.14.orig/Makefile.am
-+++ SDL2_ttf-2.0.14/Makefile.am
-@@ -1,6 +1,8 @@
- # Makefile.am for the SDL truetype font loading library and viewer
+From fbd50a815483eb2edeb6cb8e52a94d1987a762b3 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 9 May 2017 00:57:10 -0700
+
+---
+ Makefile.am | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/Makefile.am b/Makefile.am
+index 8166d91..8e05e49 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -2,6 +2,8 @@
+ 
  lib_LTLIBRARIES = libSDL2_ttf.la
  
 +AUTOMAKE_OPTIONS = foreign
-- 
2.14.3


