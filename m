Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wg0-f44.google.com (mail-wg0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id C3FF76AC95
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 May 2015 21:14:27 +0000 (UTC)
Received: by wgbgq6 with SMTP id gq6so81070394wgb.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 May 2015 14:14:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=exrBTDUed3mpVjcopQlbvnqheNX84L8YD114AlzgMBA=;
	b=s2egOzwax9Pcqxg+eGmuBz7NhU4/gRfw/0nTZfz1P72y5tuhomwn6kTiri3sa9GzEZ
	RTESID0XgwL8dwK3xss3mOKZPt92cls6pd404c2+6f9CWaTy/VfHqIyYp9sxwVDx2Ra3
	JBD0MwwCezZglEcOC9f8bXouPjm+nbuCcVgd8VF8bfStItO5DBbvRnTPeKKf8wkRjJz4
	KB+n5w7WWOG8Pd4Jmzeg7lWoiWSowuLRzhTMGiVSrGomu2yTA7fe/1PlxnHlgUFqsP9k
	713E42dEJqQqVg2v0ClNonwQCQqn4feonOgfe06q4m5cDbs9ScIG4hympc6cO/hd2hCf
	6aBw==
X-Received: by 10.180.81.194 with SMTP id c2mr23831061wiy.94.1432588468469;
	Mon, 25 May 2015 14:14:28 -0700 (PDT)
Received: from localhost.localdomain (p5B0A35C6.dip0.t-ipconnect.de.
	[91.10.53.198])
	by mx.google.com with ESMTPSA id 16sm18515406wjs.41.2015.05.25.14.14.25
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 25 May 2015 14:14:26 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 25 May 2015 23:13:59 +0200
Message-Id: <1432588449-31413-3-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1432588449-31413-1-git-send-email-schnitzeltony@googlemail.com>
References: <1432588449-31413-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 02/12] openjpeg: initial add 2.1.0
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
X-List-Received-Date: Mon, 25 May 2015 21:14:28 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/recipes-graphics/openjpeg/openjpeg_2.1.0.bb | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/openjpeg/openjpeg_2.1.0.bb

diff --git a/meta-oe/recipes-graphics/openjpeg/openjpeg_2.1.0.bb b/meta-oe/recipes-graphics/openjpeg/openjpeg_2.1.0.bb
new file mode 100644
index 0000000..9f6dd57
--- /dev/null
+++ b/meta-oe/recipes-graphics/openjpeg/openjpeg_2.1.0.bb
@@ -0,0 +1,18 @@
+DESCRIPTION = "OpenJPEG library is an open-source JPEG 2000 codec"
+HOMEPAGE = "http://www.openjpeg.org/index.php?menu=main"
+
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=c648878b4840d7babaade1303e7f108c"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/project/${BPN}.mirror/${PV}/${BPN}-${PV}.tar.gz"
+SRC_URI[md5sum] = "f6419fcc233df84f9a81eb36633c6db6"
+SRC_URI[sha256sum] = "1232bb814fd88d8ed314c94f0bfebb03de8559583a33abbe8c64ef3fc0a8ff03"
+
+inherit cmake
+
+DEPENDS = "libpng tiff lcms"
+
+# standard path for *.cmake
+EXTRA_OECMAKE += "-DOPENJPEG_INSTALL_PACKAGE_DIR=${baselib}/cmake"
+
+FILES_${PN}-dev += "${libdir}/cmake/*.cmake"
-- 
1.9.3


