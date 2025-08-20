Return-Path: <jan.vermaete@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C3EDCA0EDC
	for <webhook@archiver.kernel.org>; Wed, 20 Aug 2025 19:00:05 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web11.5389.1755716401083580683
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Aug 2025 12:00:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eDRrvN/v;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: jan.vermaete@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-45a1b004a31so1377135e9.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 20 Aug 2025 12:00:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755716399; x=1756321199; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lmolN0pvP5s93t0WZf7RrMGzVE4AtZBbSi/XkK09dQs=;
        b=eDRrvN/vk/NSQvfXOQq0GAFr3ujkE5Wm/sV5IZmZCGBkpG5yS+1ESq+pwederR5S6X
         5x1MBc+ou4B1PMYmUUz+CN1NMoilJ9FUg6KoWO8QeZ7iZe4v0B+g1hKa32XLeHF5z/ZD
         z8RHV5nYZP634ZBaaJauMwF5/YxRkvEiwE8Hjqa7HCzdQBA1Ls4kFrjZC5i1GpM93fkG
         msA0+hVQQgtsOP1HcurNMuEwTWyNmzzWNAdmE1WTMAPfwrnrEn8S7aZGUMQ4yEDpAQ0j
         T9okizcfyoXRSLEIrxZJ6jHqLYAHNpZ+Efs8Ush3fd7nZ7UvdjiKa7lNf3SZoYIARIm9
         /X6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755716399; x=1756321199;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lmolN0pvP5s93t0WZf7RrMGzVE4AtZBbSi/XkK09dQs=;
        b=jDSyGwCDp9Yt7qS0cGQVTXQBtdBNQKS4DgEl2nQxL9zmidw+TmY6fn7b6abkmbhNP3
         diBCF/ICpuXkY3QiELihoAeY9K5os/2S8MqEX0FlfNNbeAMvcxY8VWqTTzG0HIUmW/xy
         xGJh2NlDUcbKOIf9Xwq9KsjQNItwxPp1i6DxLEfRLoa4QZB1hj5sBiRPEZIpbd6tBuDi
         ihJDIRKM1LxMch2MyR8IUGumiIIhvInbFE381JmnplmWe4hsCTvdnqps/WU2jcTVN2Hu
         A/uil49vYs2cUtRb4FIjyBpO09+jxr+YYilqd6AZiwfbWzJ1k2ETiB8hu/JCb7xwGfHX
         KIvQ==
X-Gm-Message-State: AOJu0YwWq6TnrVaM5hirsins3xE4jbWRsi1U5bQNo6Di1RCWQqXeTotG
	f6pNmItnt1AMvHNYmL5txAq4sSHnRXOkqv2IS49p/fqKICHht0px5I190BTsxQ==
X-Gm-Gg: ASbGncsh7ZmhBCRNp77fjSAfUv+oivhkgzRYFnMr0yZUmuxwMU/PES6Fj/zgmOIJ9Vp
	iaLg5ieK3WCaFr33ad1TqtB1fPWRVdVW4QIDEexzqi8YHFiPXW99JFLFG3i6+LX921mVHo+mfyx
	nO1y30PyfWC6yksvFVjqCxUx43G4t6mDA9s49MhoWhv2cxHth1eZ4eIblqzADEfDW8JfOzgHr4Z
	YJCwzI4qeXUDqR2ogvZvoJ1WS2iw2fhQqgkYN0cAmViYcHdzELTvni5Y6+cKhSnhEgn3b0fWqJx
	YDSUE/E/ISDm3BQ93Zl0bC1Il45ppPEEXswn0ko2vgmW0quaHPmV+zVAxoOKW/7i6X2jkLcqit7
	3h6qT0aXtEGLwdMfGQ83QIxHE+oh2Hztq8Z1UA+YrcNG7AH+wQJilWmvDlBywCZfw3RYB5GdpR5
	Yplx1UKBQzAdHcA4/OsUmJDI3FOw0k4vLrMhMEHyAkwdKOj1QL
X-Google-Smtp-Source: AGHT+IGYuBNSxtm50moE555bCc3yw8YWSPEDn4as5zDEEQtGXJIAB8OJiyCPwu3xRAHxcSy5nI6X6g==
X-Received: by 2002:a5d:5d09:0:b0:3b7:901c:92ee with SMTP id ffacd0b85a97d-3c32eccf05fmr2967255f8f.58.1755716399084;
        Wed, 20 Aug 2025 11:59:59 -0700 (PDT)
Received: from localhost.localdomain (2a02-1812-512-2c00-5cba-763c-2ed2-f98a.ip6.access.telenet.be. [2a02:1812:512:2c00:5cba:763c:2ed2:f98a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b47c310a6sm45985945e9.8.2025.08.20.11.59.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 11:59:58 -0700 (PDT)
From: Jan Vermaete <jan.vermaete@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jan Vermaete <jan.vermaete@gmail.com>
Subject: [meta-oe][PATCH] freeglut: changed SRC_URI to github + added UPSTREAM_CHECK
Date: Wed, 20 Aug 2025 20:59:54 +0200
Message-Id: <20250820185954.9559-1-jan.vermaete@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 20 Aug 2025 19:00:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119046

- added HOMEPAGE
- downloads are now from github
  "Stable releases are available on our releases page on github, where you can find more information about each release. All releases are also mirrored on the old downloads page on sourceforge."
  @see: https://freeglut.sourceforge.net/
- fixed 'devtool check-upgrade-status'

Signed-off-by: Jan Vermaete <jan.vermaete@gmail.com>
---
 meta-oe/recipes-graphics/freeglut/freeglut_3.4.0.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/freeglut/freeglut_3.4.0.bb b/meta-oe/recipes-graphics/freeglut/freeglut_3.4.0.bb
index 069f0f43f6..13f3d111fe 100644
--- a/meta-oe/recipes-graphics/freeglut/freeglut_3.4.0.bb
+++ b/meta-oe/recipes-graphics/freeglut/freeglut_3.4.0.bb
@@ -1,9 +1,10 @@
 DESCRIPTION = "FreeGLUT is a free-software/open-source alternative to the OpenGL \
                Utility Toolkit (GLUT) library"
+HOMEPAGE = "https://freeglut.sourceforge.net"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=89c0b58a3e01ce3d8254c9f59e78adfb"
 
-SRC_URI = "https://sourceforge.net/projects/${BPN}/files/${BPN}/${PV}/${BPN}-${PV}.tar.gz"
+SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/v${PV}/${BPN}-${PV}.tar.gz"
 SRC_URI[sha256sum] = "3c0bcb915d9b180a97edaebd011b7a1de54583a838644dcd42bb0ea0c6f3eaec"
 
 inherit cmake features_check pkgconfig
@@ -26,6 +27,9 @@ PROVIDES += "mesa-glut"
 
 DEPENDS = "virtual/libgl libxi"
 
+UPSTREAM_CHECK_REGEX = "releases/tag/v(?P<pver>\d+(\.\d+)+)"
+UPSTREAM_CHECK_URI = "https://github.com/${BPN}/${BPN}/releases"
+
 do_install:append() {
     # Remove buildpaths
     sed -i "s#${RECIPE_SYSROOT}##g" ${D}${libdir}/cmake/FreeGLUT/FreeGLUTTargets.cmake
-- 
2.39.5


