Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 95F54786CB
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Jan 2018 09:14:13 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id v123so319093wmd.5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Jan 2018 01:14:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=B1TeEESnddfZBlIP9Y3Pr4iox4E1/1egYTIXXTIC/Ko=;
	b=BxYMHPCimtsqyhhncFTUw0Z+DIH3KXeOQfHBU014TEbHkudTpxk5n+rqQL+/i3Cin3
	m9IKHmeDCbmMmQPDKQCAY610gkiEfWo4FWDlFW7Qxe8ZG5JaZzvvILCuex3cHc5/TSnV
	0syMg7sKPG2W80hASC1oHOxdrDCbSyqokm981OFhb7wJaLL+1rCwTs8D4oa/ZbO0rhRC
	izWGkFE6t8iqN85ksqVGeXIM+bZqWeoaOUN9vDMKiQDERVSxKXjhdaIpf5AqV7tY3qZw
	EiKoBSZ2bVszpPwRLmv0ragu354WP57vHSYRpzaHU1VOvoFy+3z3MMy1tb2xO0R08Svp
	lW5A==
X-Gm-Message-State: AKGB3mI8ahM6hZj6yyJtv/ObkrAlu6nN6wUyjmxIzsyl7KaVwXFRyQBb
	azNb0pn/wM+u9uuaV6q+7oXsqIA/
X-Google-Smtp-Source: ACJfBovhfUFFukDQNnRp6hzGPvkxnaCWK8QCiGxt4uiqgNatRqtCkhDSoQl34oDJjcT7blr84YX5gA==
X-Received: by 10.80.167.161 with SMTP id i30mr47367178edc.26.1516007654599;
	Mon, 15 Jan 2018 01:14:14 -0800 (PST)
Received: from tfsielt31850.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	d3sm17254591edc.15.2018.01.15.01.14.13
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 15 Jan 2018 01:14:13 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 15 Jan 2018 09:14:06 +0000
Message-Id: <20180115091408.1133-6-git@andred.net>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180115091408.1133-1-git@andred.net>
References: <20180115091408.1133-1-git@andred.net>
MIME-Version: 1.0
Subject: [meta-python][PATCH 6/8] python-lxml: use beginline= in LIC_FILES_CHKSUM
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
X-List-Received-Date: Mon, 15 Jan 2018 09:14:14 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <andre.draszik@jci.com>

'startline' is not a recognised keyword, it's beginline.

python-lxml: The new md5 checksum is 939e7430ce85e1242ff50c4ee9430752
python-lxml: Here is the selected license text:
vvvvvvvvvvvvvvvvvvvvvvvvvvvv beginline=2 vvvvvvvvvvvvvvvvvvvvvvvvvvvvv
<!--
         (c) International Organization for Standardization 2005.
        Permission to copy in any form is granted for use with conforming
        SGML systems and applications as defined in ISO 8879,
        provided this notice is included in all copies.
-->
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ endline=7 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

python-lxml: The new md5 checksum is cc86b7b2bbc678e13f58ea403eb9929b
python-lxml: Here is the selected license text:
vvvvvvvvvvvvvvvvvvvvvvvvvvvv beginline=2 vvvvvvvvvvvvvvvvvvvvvvvvvvvvv
<!-- Implmentation for the Schematron XML Schema Language.
	http://www.ascc.net/xml/resource/schematron/schematron.html

 Copyright (c) 2000,2001 Rick Jelliffe and Academia Sinica Computing Center, Taiwan

 This software is provided 'as-is', without any express or implied warranty.
 In no event will the authors be held liable for any damages arising from
 the use of this software.

 Permission is granted to anyone to use this software for any purpose,
...
 1. The origin of this software must not be misrepresented; you must not claim
 that you wrote the original software. If you use this software in a product,
 an acknowledgment in the product documentation would be appreciated but is
 not required.

 2. Altered source versions must be plainly marked as such, and must not be
 misrepresented as being the original software.

 3. This notice may not be removed or altered from any source distribution.
-->
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ endline=24 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

python-lxml: The new md5 checksum is 5b03236d293dc3784205542b409d2f53
python-lxml: Here is the selected license text:
vvvvvvvvvvvvvvvvvvvvvvvvvvvv beginline=2 vvvvvvvvvvvvvvvvvvvvvvvvvvvvv
<!--
	Stylesheet for extracting Schematron information from a RELAX-NG schema.
	Based on the stylesheet for extracting Schematron information from W3C XML Schema.
	Created by Eddie Robertsson 2002/06/01
        2009/12/10      hj: changed Schematron namespace to ISO URI (Holger Joukl)
-->
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ endline=7 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Signed-off-by: André Draszik <andre.draszik@jci.com>
---
 meta-python/recipes-devtools/python/python-lxml.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python-lxml.inc b/meta-python/recipes-devtools/python/python-lxml.inc
index f153c0ae8..98a1af4b8 100644
--- a/meta-python/recipes-devtools/python/python-lxml.inc
+++ b/meta-python/recipes-devtools/python/python-lxml.inc
@@ -11,9 +11,9 @@ LIC_FILES_CHKSUM = "file://LICENSES.txt;md5=e4c045ebad958ead4b48008f70838403 \
                     file://doc/licenses/elementtree.txt;md5=eb34d036a6e3d56314ee49a6852ac891 \
                     file://doc/licenses/BSD.txt;md5=700a1fc17f4797d4f2d34970c8ee694b \
                     file://doc/licenses/GPL.txt;md5=94d55d512a9ba36caa9b7df079bae19f \
-                    file://src/lxml/isoschematron/resources/rng/iso-schematron.rng;startline=2;endline=7;md5=a2914d12acc7066b3f5b60e8f94a012e \
-                    file://src/lxml/isoschematron/resources/xsl/iso-schematron-xslt1/iso_schematron_message.xsl;startline=2;endline=24;md5=96976dcc66249c51e8026b159ca5e755 \
-                    file://src/lxml/isoschematron/resources/xsl/RNG2Schtrn.xsl;startline=2;endline=7;md5=5cac4ad4b5e131a10e9af755b10fbbb7 \
+                    file://src/lxml/isoschematron/resources/rng/iso-schematron.rng;beginline=2;endline=7;md5=939e7430ce85e1242ff50c4ee9430752 \
+                    file://src/lxml/isoschematron/resources/xsl/iso-schematron-xslt1/iso_schematron_message.xsl;beginline=2;endline=24;md5=cc86b7b2bbc678e13f58ea403eb9929b \
+                    file://src/lxml/isoschematron/resources/xsl/RNG2Schtrn.xsl;beginline=2;endline=7;md5=5b03236d293dc3784205542b409d2f53 \
                     "
 
 DEPENDS += "libxml2 libxslt"
-- 
2.15.1


