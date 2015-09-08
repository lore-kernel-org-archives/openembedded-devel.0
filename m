Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f170.google.com (mail-wi0-f170.google.com
	[209.85.212.170])
	by mail.openembedded.org (Postfix) with ESMTP id BF10465C8A
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Sep 2015 15:43:43 +0000 (UTC)
Received: by wiclk2 with SMTP id lk2so120454297wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 Sep 2015 08:43:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=0wve9z7tVYpz1DqXZuDt8uTNhKP23/sSlYtn2XL0eS8=;
	b=m0triM/nPsfZiIWRht2vtbFDPrCMn2YYLUDVHtioId3gholPD61FmCE4EuQ8Sbx3AK
	Y+ZXuc5PCiGa9T6AmTJgXRRAhgBZjLUYxXiAvN3DFXFk6dZThujtHCULJWJ+osgFWd8F
	4RTs6n+YeDRE3p3jjRFEWf7vO2dFTB0vo35bUsqqYzmimFwStflRAx6PRB1AzQxyB2A0
	dQyDdBEKpv6eTxON+13SHN9SliN/FslP5vv26noOtKjyCGEWL3SuzecgzxOJS2DPhRRN
	kjsqzKogoqVOsMMgSmByaIeJNWkopqrAtmHjgphf4qIaU8qyBPVPEwEZRrp1V0mpuc4Z
	JDNA==
X-Received: by 10.180.76.232 with SMTP id n8mr47424837wiw.72.1441727023900;
	Tue, 08 Sep 2015 08:43:43 -0700 (PDT)
Received: from localhost.localdomain ([5.147.14.94])
	by smtp.googlemail.com with ESMTPSA id
	lu5sm5496240wjb.9.2015.09.08.08.43.43
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 08 Sep 2015 08:43:43 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  8 Sep 2015 17:42:57 +0200
Message-Id: <1441726980-32656-7-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1441726980-32656-1-git-send-email-schnitzeltony@googlemail.com>
References: <1441726980-32656-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 6/9] openbox: add libcroco, librsvg and gdk-pixbuf to DEPENDS
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
X-List-Received-Date: Tue, 08 Sep 2015 15:43:44 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

fixes:

WARNING: QA Issue: openbox-core rdepends on libcroco, but it isn't a build dependency? [build-deps]
WARNING: QA Issue: openbox-core rdepends on librsvg, but it isn't a build dependency? [build-deps]
WARNING: QA Issue: openbox-core rdepends on gdk-pixbuf, but it isn't a build dependency? [build-deps]

why no PACKAGECONFIG?

* libcroco and gdk-pixbuf are not configurable
* librsvg is required to display svg icons which is a basic requirement

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/recipes-graphics/openbox/openbox_3.6.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/openbox/openbox_3.6.1.bb b/meta-oe/recipes-graphics/openbox/openbox_3.6.1.bb
index de4d9f8..44afed2 100644
--- a/meta-oe/recipes-graphics/openbox/openbox_3.6.1.bb
+++ b/meta-oe/recipes-graphics/openbox/openbox_3.6.1.bb
@@ -1,6 +1,6 @@
 SUMMARY = "openbox Window Manager"
 SECTION = "x11/wm"
-DEPENDS = "glib-2.0 pango libxml2 virtual/libx11"
+DEPENDS = "glib-2.0 pango libxml2 virtual/libx11 libcroco librsvg gdk-pixbuf"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
-- 
2.1.0


