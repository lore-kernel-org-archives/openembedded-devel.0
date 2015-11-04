Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id BAE0D770F4
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Nov 2015 23:44:23 +0000 (UTC)
Received: by wmeg8 with SMTP id g8so255650wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Nov 2015 15:44:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=3yweUf+Pm8SFHGffoZG78oRRgsI33HaSGMKKCFJHaBI=;
	b=SI67xyXY+ov+B3V4i23Qz225FViNOLcsWlcrhC6CeYzJUnZy325/nuaaK5YmS823W8
	aBxEQu1xJ3+EUfI22Bw0zrjI6RwgMwwNP2MBESJHm7yP7q85F8YrMwC9SeoiKc44lrEo
	Am01YvpXDuaN4/AO+5aHWmDKFujzYhUIxcV4yNM+2FVCFSrBu/ybKW5DjNFwk2HvwUYk
	tIHp3ErJD+55potKNze0yiNj7vdbJlEDEAVT51wMi0a197s3EIpZr/nclIA0ZZ2hlsie
	YRowpiy4f2Vz723BPL9C0+PJ9SZOS3CXvOL1hbpVNqzVrPvNUNpnYqYbhyQ2eMpTNNZQ
	y+bQ==
X-Received: by 10.28.23.66 with SMTP id 63mr27577974wmx.4.1446680662768;
	Wed, 04 Nov 2015 15:44:22 -0800 (PST)
Received: from localhost.localdomain (p5B0A127D.dip0.t-ipconnect.de.
	[91.10.18.125]) by smtp.googlemail.com with ESMTPSA id
	184sm5390014wmk.10.2015.11.04.15.44.21
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 04 Nov 2015 15:44:22 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  5 Nov 2015 00:43:47 +0100
Message-Id: <1446680640-31722-6-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1446680640-31722-1-git-send-email-schnitzeltony@googlemail.com>
References: <1446680640-31722-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH][v2 05/18] gparted: add gtk-icon-cache to inherit
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
X-List-Received-Date: Wed, 04 Nov 2015 23:44:25 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-gnome/recipes-extended/gparted/gparted_0.24.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-extended/gparted/gparted_0.24.0.bb b/meta-gnome/recipes-extended/gparted/gparted_0.24.0.bb
index d77d1ed..0fe95a0 100644
--- a/meta-gnome/recipes-extended/gparted/gparted_0.24.0.bb
+++ b/meta-gnome/recipes-extended/gparted/gparted_0.24.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://gparted.org/index.php"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
-inherit autotools pkgconfig
+inherit autotools pkgconfig gtk-icon-cache
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}/${BPN}-${PV}/${BPN}-${PV}.tar.bz2"
 SRC_URI[md5sum] = "b8480274c68876acff5965d4346710e7"
-- 
2.1.0


