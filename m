Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f174.google.com (mail-pd0-f174.google.com
	[209.85.192.174])
	by mail.openembedded.org (Postfix) with ESMTP id E0C7E60782
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Apr 2014 20:32:41 +0000 (UTC)
Received: by mail-pd0-f174.google.com with SMTP id z10so3534846pdj.33
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Apr 2014 13:32:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=rkJ4kqvezvZvIZy7y3aWNmuHuW/p10Euhz1IISx0Zj4=;
	b=uwGHG6nKdsEj2rpK60fBOPRUQ2aXwYQ6R2nduwbaPuqjNl/sSqg8xMowbCKF1iGyRg
	2Y13TwuR6FAGKP4pQ6dcoN1rY83pmknBqc4xMoFdwqWb1EeNkESTrHQ12lQAVBnYG8hN
	WoFGBfUg1qjLB92iBRkop/IlaMGqFwwKDelHGWvu0k3T3EMV8QMw5SBIcXgrdMhaVQJt
	jGgJbkJ5iyWtTy222E7RJB1feH5k58b7pib1nX7ToWgaRRYwj8H1cL+KcirEJp1y4wRu
	CdphP3+kbDoq/UePfV3nkqWciFMjV2oBCykqeLKNyrS4DnH6RsLq9gEHVY5tnuSZDmXs
	OC2w==
X-Received: by 10.66.144.166 with SMTP id sn6mr11390293pab.100.1398544362895; 
	Sat, 26 Apr 2014 13:32:42 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-140-30.lightspeed.sntcca.sbcglobal.net. [99.57.140.30])
	by mx.google.com with ESMTPSA id
	ci4sm24455471pbb.50.2014.04.26.13.32.41 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 26 Apr 2014 13:32:42 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 26 Apr 2014 13:34:27 -0700
Message-Id: <1398544484-27299-4-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1398544484-27299-1-git-send-email-raj.khem@gmail.com>
References: <1398544484-27299-1-git-send-email-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 04/21] liboauth: New recipe
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
X-List-Received-Date: Sat, 26 Apr 2014 20:32:42 -0000

Its needed newer libgdata

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/liboauth/liboauth_1.0.3.bb |   16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 meta-oe/recipes-support/liboauth/liboauth_1.0.3.bb

diff --git a/meta-oe/recipes-support/liboauth/liboauth_1.0.3.bb b/meta-oe/recipes-support/liboauth/liboauth_1.0.3.bb
new file mode 100644
index 0000000..3aa5746
--- /dev/null
+++ b/meta-oe/recipes-support/liboauth/liboauth_1.0.3.bb
@@ -0,0 +1,16 @@
+# Copyright (C) 2014 Khem Raj <raj.khem@gmail.com>
+# Released under the MIT license (see COPYING.MIT for the terms)
+
+DESCRIPTION = "C library implementing OAuth Core RFC 5849"
+HOMEPAGE = "http://liboauth.sourceforge.net"
+LICENSE = "MIT|GPL-2.0"
+LIC_FILES_CHKSUM = "file://COPYING.MIT;md5=6266718a5241c045c8099d9be48817df \
+                    file://COPYING.GPL;md5=0636e73ff0215e8d672dc4c32c317bb3"
+SECTION = "libs"
+DEPENDS = "curl"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/project/${BPN}/${BP}.tar.gz"
+SRC_URI[md5sum] = "689b46c2b3ab1a39735ac33f714c4f7f"
+SRC_URI[sha256sum] = "0df60157b052f0e774ade8a8bac59d6e8d4b464058cc55f9208d72e41156811f"
+
+inherit autotools
-- 
1.7.10.4


