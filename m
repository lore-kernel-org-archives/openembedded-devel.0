Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f174.google.com (mail-ea0-f174.google.com
	[209.85.215.174])
	by mail.openembedded.org (Postfix) with ESMTP id 5CA1C6B7D0
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Jan 2014 12:57:31 +0000 (UTC)
Received: by mail-ea0-f174.google.com with SMTP id b10so5869012eae.33
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Jan 2014 04:57:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=i4i22mTFGBwp2MyzvaZRN95IIu+4un3pHpDSs3FZVnM=;
	b=FWbMd9GEx4TeMdYVz6wMlh8jBEWGjh4ToT9+CJbV0c3zwyrGOIuBX76g+VANaDQg6S
	OtjzaR25dhyViGxCNRnf1GXpbo2taA+vTv48gPKPVVYf9sanX1SRU1N9VtFppeVqn0SC
	LBa+mqfyXAK66sdxHO+4LAkOXnBjFieG6mDabqdQ+NC/O543UEJ2hOgIjoAtC51YXqrt
	VGsofjAFMSo/M7t8xkdkHAJFg5QenoovylWLsUAKj543bwMztQPE/S7Gm534cdquO9X8
	b1G2CpBTDeAQDZboROUSj5/ybM0MF04s0/yNsxBMDSCEJ2C/ze2RC9xJan1TL8jhrrFd
	oUxg==
X-Received: by 10.15.26.200 with SMTP id n48mr11103957eeu.46.1388581051935;
	Wed, 01 Jan 2014 04:57:31 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id 1sm126890446eeg.4.2014.01.01.04.57.31
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 01 Jan 2014 04:57:31 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  1 Jan 2014 13:57:24 +0100
Message-Id: <1388581046-8713-6-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.4.3
In-Reply-To: <1388581046-8713-1-git-send-email-Martin.Jansa@gmail.com>
References: <1388581046-8713-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][WIP][PATCH 6/8] freerdp: Fix branch param and set better PV in recipe
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
X-List-Received-Date: Wed, 01 Jan 2014 12:57:32 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/freerdp/freerdp.inc    | 2 --
 meta-oe/recipes-support/freerdp/freerdp_git.bb | 5 ++---
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/meta-oe/recipes-support/freerdp/freerdp.inc b/meta-oe/recipes-support/freerdp/freerdp.inc
index 65c61c2..34dac4b 100644
--- a/meta-oe/recipes-support/freerdp/freerdp.inc
+++ b/meta-oe/recipes-support/freerdp/freerdp.inc
@@ -8,8 +8,6 @@ SECTION = "x11/network"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-INC_PR = "r1"
-
 inherit pkgconfig cmake
 
 EXTRA_OECMAKE += "-DWITH_PULSEAUDIO=ON \
diff --git a/meta-oe/recipes-support/freerdp/freerdp_git.bb b/meta-oe/recipes-support/freerdp/freerdp_git.bb
index 434e89a..0e9bf06 100644
--- a/meta-oe/recipes-support/freerdp/freerdp_git.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp_git.bb
@@ -5,13 +5,12 @@ include freerdp.inc
 
 inherit gitpkgv
 
-PV = "gitr${SRCPV}"
+PV = "1.0.2+gitr${SRCPV}"
 PKGV = "${GITPKGVTAG}"
-PR = "${INC_PR}.2"
 
 EXTRA_OECMAKE += "-DWITH_MANPAGES=OFF"
 
 SRCREV = "f311acaffb9190567e2b478a98d7cbfaf2709f6b"
-SRC_URI = "git://github.com/FreeRDP/FreeRDP.git"
+SRC_URI = "git://github.com/FreeRDP/FreeRDP.git;branch=stable-1.0"
 
 S = "${WORKDIR}/git"
-- 
1.8.4.3


