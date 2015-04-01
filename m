Return-Path: <net147@gmail.com>
Received: from mail-pd0-f177.google.com (mail-pd0-f177.google.com
	[209.85.192.177])
	by mail.openembedded.org (Postfix) with ESMTP id 1A2076013D
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Apr 2015 02:38:52 +0000 (UTC)
Received: by pddn5 with SMTP id n5so39793525pdd.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Mar 2015 19:38:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=dM8GMA36C5iqKqxiazI3sAlho6S4M1AT3wNW7ZqcLaI=;
	b=0O0uf4F/8v0MLHHbZo3tlt626koL3qw9/bf8EnM3ffeL/rPGP45Bw2RULf6/9wTdoo
	7lnyU2R8CgkBsgG3KrPComDG0/hscR2ZftXgJb98z2PoOUNzJFsZMJBbZ8bnOjNUVspV
	3E8Re1T3TGS8TbUjcCBQPE9XRgGpyxqvgvwHNf3TfT4KAPO7HZK2VzLs3PHzd+dknm0Z
	Kg4QgTbQl4cRokIaNxwR0zTXhnioHLuBaTOBUN/wEgIWE4qRlid2pXDAnbDJACKYwhGV
	fj+m+xNe+xK6MdzIflX2Hw0z0k/jGHuo/A7kWk1v7+LykXbJP8vyAL99o9e9XBg0OBNN
	dVRw==
X-Received: by 10.68.110.37 with SMTP id hx5mr73710846pbb.46.1427855933934;
	Tue, 31 Mar 2015 19:38:53 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id dl1sm306989pdb.75.2015.03.31.19.38.52
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 31 Mar 2015 19:38:53 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  1 Apr 2015 13:36:12 +1100
Message-Id: <1427855772-13120-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 2.3.4
Subject: [meta-oe][PATCH] nodejs: update to 0.12.2
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
X-List-Received-Date: Wed, 01 Apr 2015 02:38:53 -0000

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 .../recipes-devtools/nodejs/{nodejs_0.12.0.bb => nodejs_0.12.2.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/nodejs/{nodejs_0.12.0.bb => nodejs_0.12.2.bb} (95%)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_0.12.0.bb b/meta-oe/recipes-devtools/nodejs/nodejs_0.12.2.bb
similarity index 95%
rename from meta-oe/recipes-devtools/nodejs/nodejs_0.12.0.bb
rename to meta-oe/recipes-devtools/nodejs/nodejs_0.12.2.bb
index cefc0bc..945d9b4 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_0.12.0.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_0.12.2.bb
@@ -6,8 +6,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=14115ff11211df04b031ec7d40b6d31b"
 DEPENDS = "openssl"
 
 SRC_URI = "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.gz"
-SRC_URI[md5sum] = "62c8d9c74c8f68193f60e4cba020eb48"
-SRC_URI[sha256sum] = "9700e23af4e9b3643af48cef5f2ad20a1331ff531a12154eef2bfb0bb1682e32"
+SRC_URI[md5sum] = "b7f4a9f2e361a7026789a7d6c45a6d30"
+SRC_URI[sha256sum] = "ac7e78ade93e633e7ed628532bb8e650caba0c9c33af33581957f3382e2a772d"
 
 S = "${WORKDIR}/node-v${PV}"
 
-- 
2.3.4


