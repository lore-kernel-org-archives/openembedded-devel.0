Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f51.google.com (mail-pa0-f51.google.com
	[209.85.220.51])
	by mail.openembedded.org (Postfix) with ESMTP id D1AAD65E7C
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Apr 2014 07:29:21 +0000 (UTC)
Received: by mail-pa0-f51.google.com with SMTP id fb1so4847180pad.38
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Apr 2014 00:29:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=h8ECvxtEMSW2kwyc6q0yXsee/U8feh9e9LR97WszFq8=;
	b=w4Kg9F6HlkgogD5mlu7mYc3hDIC0SmHSzf6wubb6JDawmTWT7daHEQVpziwCW5Bt9D
	av0QnzrbKp27ExjzxrSk5m+oerVzSGClUK7O7KYTo3C/NGkN0mBhwLkLuXBy6JDt8L5Y
	BxIbYht/1R5YjHRSwgz5XPEb9zjJzLaX+MnME3h9XlWpEqOQSFhGV61mmtBszk1ngKt1
	W7E4hZ7o+cGSH89V7LUMpeHdZemkPrLjqt9mE8xYXID+kw3nY9b1CXtYisLmB84IoBQU
	aey46LKsVfRyuhdEIGOHuoYPOtECAsMAS7z179dEZ8d2etUa3d0MYP2n2Q0jIdkOFnbb
	k03w==
X-Received: by 10.69.20.107 with SMTP id hb11mr23095283pbd.99.1398670162481;
	Mon, 28 Apr 2014 00:29:22 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-140-30.lightspeed.sntcca.sbcglobal.net. [99.57.140.30])
	by mx.google.com with ESMTPSA id
	xk3sm32881627pbb.65.2014.04.28.00.29.21 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 28 Apr 2014 00:29:21 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 28 Apr 2014 00:31:25 -0700
Message-Id: <1398670285-14395-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [meta-gnome][PATCH V3] libgdata: Fix build when S != B
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
X-List-Received-Date: Mon, 28 Apr 2014 07:29:24 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-gnome/recipes-gnome/libgdata/libgdata_0.7.1.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/libgdata/libgdata_0.7.1.bb b/meta-gnome/recipes-gnome/libgdata/libgdata_0.7.1.bb
index 8f6675d..2affacc 100644
--- a/meta-gnome/recipes-gnome/libgdata/libgdata_0.7.1.bb
+++ b/meta-gnome/recipes-gnome/libgdata/libgdata_0.7.1.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24 \
 
 DEPENDS = "libxml2 glib-2.0 libsoup-2.4"
 
-inherit gnomebase pkgconfig autotools gettext
+inherit gnomebase pkgconfig autotools-brokensep gettext
 
 SRC_URI[archive.md5sum] = "ec5262cbcb07b63b58d45aa3ac636096"
 SRC_URI[archive.sha256sum] = "fb244138276a5ce98510b0e2408bbf6f9ce0fd8cdcf86f07cd4be38afbb7c2bc"
-- 
1.7.10.4


