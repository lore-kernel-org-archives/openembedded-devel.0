Return-Path: <net147@gmail.com>
Received: from mail-pa0-f51.google.com (mail-pa0-f51.google.com
	[209.85.220.51])
	by mail.openembedded.org (Postfix) with ESMTP id 802AB6FFCC
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 12 Mar 2016 12:15:06 +0000 (UTC)
Received: by mail-pa0-f51.google.com with SMTP id fe3so104234611pab.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 12 Mar 2016 04:15:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=ZmiCrzmrOaZvEE8VRbMfGj3bS8WzzgqCt2H6DzFO5go=;
	b=krR6F51b7n8PlBjnk0uBIVqL+hTE51w7tQ0GNSYdROaqNGwlq4xh7UsXHLdz2gXTIa
	5+zI4unbJAc7JZlFt+Y559hSdPp912rBcoIxiUbi6WzpnV4AAzBI+JMtVHE7EbBTPJN2
	P6SdyOKk3KYsuNeY72NZpodddo5I2mjKZLqTlIinrcJvKpGbpqagm/Z/xy29rXpx8TpB
	gMNFkSw6y6BYf+oXWxia1rB0jjDkRzThUQu0pztvaGM7W9lLf0OHeOFBNs17Vwn9OKXF
	TJVdUrpe2CFEgBur6ua/yWUobZwtRrEqwQgi9c7Iqcb441qulepcpP+VMuRTdD/LB3tw
	OAkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ZmiCrzmrOaZvEE8VRbMfGj3bS8WzzgqCt2H6DzFO5go=;
	b=NMmk/azSreHKkzapxmjQFAP4XYcjQLH4FbMHcTGlETrr8ohoGmCQvT4uh0aJbmNj1R
	+YSTNjoBUJqRrcdC3OUiKyFdx562ydrrZpJEcHrGyEREuMnF3hGNFAmr7se8fDKSLkri
	b8h1+T2FouoGioRpeZsN7gVvFkztL+0hdB16zX6ApvkIQRljz5YuDTkvVWFQCirUHzFw
	8fAYan8sYSbITa3YJQkkUSXos81YmvyT+3KmgXOqGkWBiW/7VRcXddrpdUfap9IIVHPF
	Jslp771NnyAFGh295KIhZ8HzYV/mGCvYLI0kjQkf+Dw0xxznlCBbf+rHFmjWx2+Gfvfs
	fsHw==
X-Gm-Message-State: AD7BkJLKFg7ABfVVzBFxuG3bGZgoSl49XcPCa7BgJS78Fo0axVZ7vgX2m5cUIn5fFQjOPg==
X-Received: by 10.67.21.231 with SMTP id hn7mr23215377pad.150.1457784907827;
	Sat, 12 Mar 2016 04:15:07 -0800 (PST)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by smtp.gmail.com with ESMTPSA id
	f66sm19573849pff.8.2016.03.12.04.15.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 12 Mar 2016 04:15:07 -0800 (PST)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 12 Mar 2016 23:15:46 +1100
Message-Id: <1457784946-13234-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 2.7.1
Subject: [meta-oe][PATCH] nodejs: update to 4.4.0
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
X-List-Received-Date: Sat, 12 Mar 2016 12:15:08 -0000

LICENSE checksum has changed to fix a small error in the URL for the
npm public registry, changing the URL from "https://registry.npmjs.com"
to "https://registry.npmjs.org".

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 .../recipes-devtools/nodejs/{nodejs_4.3.2.bb => nodejs_4.4.0.bb}    | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-devtools/nodejs/{nodejs_4.3.2.bb => nodejs_4.4.0.bb} (93%)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_4.3.2.bb b/meta-oe/recipes-devtools/nodejs/nodejs_4.4.0.bb
similarity index 93%
rename from meta-oe/recipes-devtools/nodejs/nodejs_4.3.2.bb
rename to meta-oe/recipes-devtools/nodejs/nodejs_4.4.0.bb
index c58fad5..4cdb067 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_4.3.2.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_4.4.0.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "nodeJS Evented I/O for V8 JavaScript"
 HOMEPAGE = "http://nodejs.org"
 LICENSE = "MIT & BSD & Artistic-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=003f16759ef967194d594a5ac6490401"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=b70c304f43f326ddbc3474ba2b685522"
 
 DEPENDS = "openssl"
 
@@ -12,8 +12,8 @@ COMPATIBLE_MACHINE_mips64 = "(!.*mips64).*"
 SRC_URI = "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.xz \
     file://no-registry.patch \
 "
-SRC_URI[md5sum] = "03f1424a1cfd322b5ba89da507d4cf07"
-SRC_URI[sha256sum] = "f0c5761a7e4f520ab8793cb2dcabbd7dfd7f5839ce4f2cf79d9d52d1c2da5bca"
+SRC_URI[md5sum] = "260800bfed6c3cb5dd2146343cb07241"
+SRC_URI[sha256sum] = "6ae44ae9a9cd1f102ca7f3ea09ca6223afe88fab4911f1bf21c9da2a1e795f1d"
 
 S = "${WORKDIR}/node-v${PV}"
 
-- 
2.7.1


