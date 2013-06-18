Return-Path: <net147@gmail.com>
Received: from mail-pd0-f174.google.com (mail-pd0-f174.google.com
	[209.85.192.174])
	by mail.openembedded.org (Postfix) with ESMTP id A9285607F8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Jun 2013 07:29:19 +0000 (UTC)
Received: by mail-pd0-f174.google.com with SMTP id 10so3611946pdc.33
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Jun 2013 00:29:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=s8ko4iUGuQFjQhvgNZJz3eWV04TY5NUtjtbWWGODzBI=;
	b=BucinJUCMsMGxL/8aVpErHQ2XcaInQxRtASOj8PA+EIuD5Yzq/5Q2PUfvLJchB3zGM
	H+b1Z/O7D438JC9WgM9GeeV5qFlb7+FFtXjlJRvNK+kVw+leFw+U6Fm+JloWh71VP9s1
	Vdz+v1cEAlPmmRNvjU7awWHIwy65+roymm4R/Jv5p6kkEVrXx90X6tga8vbavl+8m7as
	DLgKq/uXBq//fYtErJYE4iTe2o/OLt5PdfSojnAh4t/gVdLW5xx4UiOrn+teZTcy82zl
	THdzWusJYjb3WWXBqmgY23iUa7GFtozwmBVEhIJj6OVH7Q/A81OlWslHeqXxPAiRGJCv
	Jtmw==
X-Received: by 10.66.160.1 with SMTP id xg1mr1069074pab.25.1371540560761;
	Tue, 18 Jun 2013 00:29:20 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id fn9sm18406139pab.2.2013.06.18.00.29.18
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 18 Jun 2013 00:29:19 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Jun 2013 17:43:25 +1000
Message-Id: <1371541405-3651-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.8.3
Cc: Jonathan Liu <jon@zydex.com>
Subject: [meta-oe][PATCH] cyrus-sasl: move plugin *.so symbolic links to cyrus-sasl package
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
X-List-Received-Date: Tue, 18 Jun 2013 07:29:20 -0000

From: Jonathan Liu <jon@zydex.com>

The Cyrus SASL plugins are loaded without their version number so the
plugin *.so symbolic links need to be placed in the cyrus-sasl package
rather than the cyrus-sasl-dev package.

Signed-off-by: Jonathan Liu <jon@zydex.com>
---
 meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb b/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb
index 0113025..bf6f95c 100644
--- a/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb
+++ b/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb
@@ -36,8 +36,10 @@ SRC_URI[sha256sum] = "8fbc5136512b59bb793657f36fadda6359cae3b08f01fd16b3d406f134
 
 PACKAGES =+ "${PN}-bin"
 
-FILES_${PN}           += "${libdir}/sasl2/*.so.*"
+FILES_${PN}           += "${libdir}/sasl2/*.so*"
 FILES_${PN}-bin       += "${bindir}"
-FILES_${PN}-dev       += "${libdir}/sasl2/*.so ${libdir}/sasl2/*.la"
+FILES_${PN}-dev       += "${libdir}/sasl2/*.la"
 FILES_${PN}-dbg       += "${libdir}/sasl2/.debug"
 FILES_${PN}-staticdev += "${libdir}/sasl2/*.a"
+
+INSANE_SKIP_${PN} += "dev-so"
-- 
1.8.3


