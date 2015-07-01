Return-Path: <net147@gmail.com>
Received: from mail-pd0-f169.google.com (mail-pd0-f169.google.com
	[209.85.192.169])
	by mail.openembedded.org (Postfix) with ESMTP id 90C9F65C5F
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Jul 2015 06:34:34 +0000 (UTC)
Received: by pdjd13 with SMTP id d13so20175306pdj.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Jun 2015 23:34:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=gb6OmKva8J2gTW5svsQWOlh4yv542Sy+5F4wnMclJDA=;
	b=j24sFNHs9Hjte3gjVhL+HTz9sPkOX2puJaR1V+DZoy4feiio/GgyjT7ZnPANRkylmQ
	wCtEavgXcCC8c6nkHfDjrbJL8FeJ5SJxMLo0jsRGgcs/5YB8l12pbYQGk9J9LX7GWsdh
	7cwzn8nS4BvlK4vS5n+9CADtQz5H1op8Zbmv7BITsyayiqf8A+8WCyX2KL7rMnk/5eIQ
	pYRY6KNx6Ap9DIG0fNDG7KMgxWQVe3/MQIdDRRL+0fatbTVFYliFPkz6fM6Z10YJMOjK
	KRh7ut6L4ZPU3YqQxSlnILUnbTsFWFBCTY2DwMyiNpYb/c869IujFyTBAssj6gM4uWku
	0Q+Q==
X-Received: by 10.70.125.230 with SMTP id mt6mr51982917pdb.55.1435732474809;
	Tue, 30 Jun 2015 23:34:34 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id ud3sm958989pbc.10.2015.06.30.23.34.33
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 30 Jun 2015 23:34:34 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  1 Jul 2015 16:33:31 +1000
Message-Id: <1435732411-23079-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 2.4.4
Subject: [meta-oe][PATCH] qrencode: new recipe
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
X-List-Received-Date: Wed, 01 Jul 2015 06:34:34 -0000

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 meta-oe/recipes-graphics/qrencode/qrencode_git.bb | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/qrencode/qrencode_git.bb

diff --git a/meta-oe/recipes-graphics/qrencode/qrencode_git.bb b/meta-oe/recipes-graphics/qrencode/qrencode_git.bb
new file mode 100644
index 0000000..fc7b020
--- /dev/null
+++ b/meta-oe/recipes-graphics/qrencode/qrencode_git.bb
@@ -0,0 +1,16 @@
+SUMMARY = "C library for encoding data in a QR Code symbol"
+AUTHOR = "Kentaro Fukuchi"
+HOMEPAGE = "http://fukuchi.org/works/qrencode/"
+SECTION = "libs"
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=2d5025d4aa3495befef8f17206a5b0a1"
+PV = "3.4.4+git${SRCPV}"
+
+SRCREV = "1b565c7b599029818fc596e7da4371a3083da36c"
+SRC_URI = "git://github.com/fukuchi/libqrencode.git;protocol=git"
+
+S = "${WORKDIR}/git"
+
+inherit autotools pkgconfig
+
+EXTRA_OECONF += "--without-tools --without-tests"
-- 
2.4.4


