Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 86C946C37E
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Jul 2019 05:24:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45xp5H34NHz3l
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Jul 2019 07:24:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1564377843;
	bh=SAEqzi+FHSRoBJCpVqeaHzz9U2Wb5UiU3+Ffrq3zDbU=;
	h=From:To:Subject:Date:From;
	b=FPDStH1znQ09PaQ8KlFvonRzXAoNi1Wvlt/xQxj5V6IWAanTMwQe7N2oDHZ+7vEFE
	a6W0YoLY84NicyupJpwnRftw2HgCFwt63fYc+HznU1x1r3HowZv7TyDsvUMBiMbmP2
	FBi1Qxg9bMMxoz6d66AvG/k7QmrLGGDTIHH0GcFhIml90iVObj+lbt95suzOQOs2hO
	GxJCKG4PaorxAcvYzYOnxZYLYdb6BufTq+U7IRKOZgZrm+q/GF8ACI+UBdok0eWzA6
	OG5cQ9b+lKBpR3CVe/fDHOIn/3C3PV0UQu2FqvxxAoGm7KLnw8IvoexfjVjjWn/yG8
	zRVxJff0qbD8w9Qk9jFoYmLghWkNyHn4Yr5AL7pxLYOjp+Ge1CEgxLUdtBlzsCtXyx
	mVbc/kebWybRV6huRs2eQsNAz6ghDPsM34idJI21jnBAIfXTV4JJb0K05NLgKpDpVb
	7SqdECbcInVhlXE37bT6FAHnSz1GwjfMOZschKraA3voHJoyy/nKpSotw3M0NOtxU6
	HSHx4s1Am1xr/ibOiRLLNK1MVn04ySCy/McLajhOdyqDW/4bs3spnXksZS8FrfeCTd
	zfNePaTcGH8wRcRiQXKBRrVJo5E7r8N0i1aaudSeO3ugG7W2QPDQgzkRi9giWJtQu5
	OdwvPsVGw5hSkNana5/BPPCE=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 29 Jul 2019 08:24:02 +0300
Message-Id: <20190729052402.15070-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-gnome][PATCH] libgsf: Drop the obsolete inherit gconf
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
X-List-Received-Date: Mon, 29 Jul 2019 05:24:03 -0000

libgsf stopped using gconf in 2011.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta-gnome/recipes-gnome/libgsf/libgsf_1.14.45.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.45.bb b/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.45.bb
index e2a838b3a..ac36ceb04 100644
--- a/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.45.bb
+++ b/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.45.bb
@@ -7,7 +7,7 @@ SECTION = "libs"
 
 DEPENDS= "libxml2 bzip2 glib-2.0 zlib intltool-native gnome-common-native"
 
-inherit autotools pkgconfig gnomebase gconf gobject-introspection
+inherit autotools pkgconfig gnomebase gobject-introspection
 
 SRC_URI += "file://0001-configure.ac-drop-a-copy-paste-of-introspection.m4-m.patch"
 
-- 
2.17.1


