Return-Path: <net147@gmail.com>
Received: from mail-pd0-f171.google.com (mail-pd0-f171.google.com
	[209.85.192.171])
	by mail.openembedded.org (Postfix) with ESMTP id 171C86AE18
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Aug 2013 13:43:02 +0000 (UTC)
Received: by mail-pd0-f171.google.com with SMTP id g10so696064pdj.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Aug 2013 06:43:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=+A1xES1fnQ42Wo7rTTI7EezKennVDIrtmzH5y1ehN1w=;
	b=ZavSBC3IGoqAbTy8QhBp+VWsUq+lVbrw/3xx83PKm+MvpbLTinPb5EcEzOjSl8Eeu4
	j/O8AZ0UHipUzt9UvGfq41m0MAyNZBmOAEdRD0fyMsLtVeRsS6qV8w65OVkQBJDNEOHX
	bHMrkMngNWSIODswz8nKULi3Myg5FzovYCjhXH6078NHkjBJ/d2JUA2GzvoVJ/PSqVAi
	/ZmSCEAoR1OITVFjgvfpRfMGV6alc1TkdZbgvlrc49e3nMiyj5uYqvqzZ4U5F9K7tke7
	pu4a5Ngr8WS4NkHQJxmk+ko8vBIceMnDffnGGtOu6zYZ54YHXnTjoAlGXzLpX+GP3WrC
	94FQ==
X-Received: by 10.68.125.226 with SMTP id mt2mr11221593pbb.115.1377265382722; 
	Fri, 23 Aug 2013 06:43:02 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id vz4sm1188388pab.11.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 23 Aug 2013 06:43:02 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 23 Aug 2013 23:38:24 +1000
Message-Id: <1377265104-14340-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.8.3.4
Subject: [meta-oe][PATCH] xf86-video-ati: new recipe
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
X-List-Received-Date: Fri, 23 Aug 2013 13:43:02 -0000

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 .../recipes-graphics/xorg-driver/xf86-video-ati_7.2.0.bb  | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/xorg-driver/xf86-video-ati_7.2.0.bb

diff --git a/meta-oe/recipes-graphics/xorg-driver/xf86-video-ati_7.2.0.bb b/meta-oe/recipes-graphics/xorg-driver/xf86-video-ati_7.2.0.bb
new file mode 100644
index 0000000..7703a17
--- /dev/null
+++ b/meta-oe/recipes-graphics/xorg-driver/xf86-video-ati_7.2.0.bb
@@ -0,0 +1,15 @@
+require recipes-graphics/xorg-driver/xorg-driver-video.inc
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=aabff1606551f9461ccf567739af63dc"
+
+SUMMARY = "X.Org X server -- ATI Radeon video driver"
+
+DESCRIPTION = "Open-source X.org graphics driver for ATI Radeon graphics"
+
+DEPENDS += "virtual/libx11 libxvmc drm xf86driproto glproto \
+            virtual/libgl xineramaproto libpciaccess"
+
+COMPATIBLE_HOST = '(i.86|x86_64).*-linux'
+
+SRC_URI[md5sum] = "5ab9a826699e5c86ef89fca43ebb3821"
+SRC_URI[sha256sum] = "f30f5efdc8d7d18d06eda7ef2f91a8b7290f1cfbf6ff26362cd47ab8969daec4"
-- 
1.8.3.4


