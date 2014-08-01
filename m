Return-Path: <koen@dominion.thruhere.net>
Received: from mail-we0-f178.google.com (mail-we0-f178.google.com
	[74.125.82.178])
	by mail.openembedded.org (Postfix) with ESMTP id 1790E60167
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Aug 2014 13:35:12 +0000 (UTC)
Received: by mail-we0-f178.google.com with SMTP id w61so4305034wes.23
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Aug 2014 06:35:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=OBsBrhfsjj9TmUbmzgJR9+wS3Cif9JnpBh+0EmZg5WU=;
	b=QJ6+gzMoSB8mTCDXkCFecwNH560jhN6IpwyB/ZjYzmsWlCVWPNegzCxQS4UE6G2eqI
	+00pTbYvVJJ+5hUc4Mr5VXcy/FaHoLyHn3CP3wxx83ef9USeTx/kFa3MEdaWQLTSjcao
	FxRuqsiuLuBzTKGzbAfx83CsTmtNdl88Ae22OrWyrMo8x+XcnuFJYkDyWtjMcPDbZZFi
	cESa9AYspwnW/3Cxr/lLHJ7yxx69N24zSP+WGu77x95RxcFJrfUVSxnziK7s2KuI2az8
	VbCggNLymrdFFvNmG8rR0sHIGYYzeCmmlWydyFKOrFVUeZGAZk8ktWE25ajCIk3TfGkm
	rqJw==
X-Gm-Message-State: ALoCoQkSEj4BNjP7oTIZ9xHksrR+RX4bp7q4ZwAzbIDTyIFoMOiPXQc+WZeYk484AvgBe+yrIqAr
X-Received: by 10.180.189.234 with SMTP id gl10mr6982480wic.56.1406900110870; 
	Fri, 01 Aug 2014 06:35:10 -0700 (PDT)
Received: from localhost ([2001:610:612:0:beee:7bff:fe9e:ae56])
	by mx.google.com with ESMTPSA id
	v14sm21003618wjw.38.2014.08.01.06.35.09 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 01 Aug 2014 06:35:10 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  1 Aug 2014 15:34:50 +0200
Message-Id: <1406900096-31368-4-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.9.0
In-Reply-To: <1406900096-31368-1-git-send-email-koen@dominion.thruhere.net>
References: <1406900096-31368-1-git-send-email-koen@dominion.thruhere.net>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-gnome][PATCH 04/10] nautilus: fix S!=B
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
X-List-Received-Date: Fri, 01 Aug 2014 13:35:13 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta-gnome/recipes-gnome/nautilus/nautilus_2.32.2.bb | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta-gnome/recipes-gnome/nautilus/nautilus_2.32.2.bb b/meta-gnome/recipes-gnome/nautilus/nautilus_2.32.2.bb
index f7c7c1e..58a45b1 100644
--- a/meta-gnome/recipes-gnome/nautilus/nautilus_2.32.2.bb
+++ b/meta-gnome/recipes-gnome/nautilus/nautilus_2.32.2.bb
@@ -8,12 +8,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=7c0048536e43642a1f3a724c2909872b \
 
 PR = "r6"
 
-PNBLACKLIST[nautilus] = "BROKEN: doesn't build with B!=S"
-
 DEPENDS = "gdk-pixbuf gtk+ libunique gvfs librsvg libexif esound gnome-desktop orbit2-native"
 # optional: tracker
 
-inherit gnome
+inherit gnome autotools-brokensep
 
 SRC_URI[archive.md5sum] = "51565aa10d1625dff56e381228346911"
 SRC_URI[archive.sha256sum] = "2d4ff28c7a7aa5d40eb2468149954a564c257a305183773057584d22d15347a2"
-- 
1.9.0


