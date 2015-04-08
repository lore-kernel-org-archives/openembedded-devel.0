Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f170.google.com (mail-wi0-f170.google.com
	[209.85.212.170])
	by mail.openembedded.org (Postfix) with ESMTP id BB79A60089
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Apr 2015 21:13:28 +0000 (UTC)
Received: by wiun10 with SMTP id n10so74159957wiu.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Apr 2015 14:13:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=Azr/QEgGUfpbKxS7dxqNlwiuCbwq58hIIATXA+FGQyE=;
	b=fAIxrJO1NYoe9gboWd78vW6C63Q9K6q5FaZzoud55IjUcZtin2elbFNEexlitU45DV
	F7PRSSlhOZN8nRnkiD3sFB0bzelH5gygZaHpnd1J+o9pkCmVXZwrgOsBZuJVYg1B79dZ
	w87he24hRRuPK52y/MoiomTEFhX45NkRo+CJRb6TvSK7SfvgWdwvj9R45N+Gh5ZQknUE
	Zd2C+DCm9NRG5VYpiiKerapTPAP2VaHw77XV4kCtUn674HBXIP5K8rEQATs8PTLv3kR6
	bj/q2lpMYNrzFcs1ugK8R5zi570KKtMk/yeStQ9p3qcQ5W32aZGtW585LqrdBXBp7zMr
	vXAw==
X-Received: by 10.194.77.7 with SMTP id o7mr35563066wjw.95.1428527609725;
	Wed, 08 Apr 2015 14:13:29 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id l3sm17292346wik.16.2015.04.08.14.13.28
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 08 Apr 2015 14:13:28 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  8 Apr 2015 23:13:16 +0200
Message-Id: <1428527596-17648-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.3.5
Subject: [meta-oe][PATCH] nodejs4, liblinebreak: use "Zlib" instead of "zlib" for LICENSE
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
X-List-Received-Date: Wed, 08 Apr 2015 21:13:30 -0000

* otherwise zlib license text provider isn't found:
  WARNING: The license listed zlib was not in the licenses collected for liblinebreak
  WARNING: liblinebreak: No generic license file exists for: zlib in any provider

[YOCTO #7584]

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-devtools/nodejs/nodejs4_0.4.12.bb        | 2 +-
 meta-oe/recipes-support/liblinebreak/liblinebreak_1.2.bb | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs4_0.4.12.bb b/meta-oe/recipes-devtools/nodejs/nodejs4_0.4.12.bb
index 268a10a..c73cefc 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs4_0.4.12.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs4_0.4.12.bb
@@ -1,6 +1,6 @@
 SUMMARY = "nodeJS Evented I/O for V8 JavaScript"
 HOMEPAGE = "http://nodejs.org"
-LICENSE = "MIT & zlib"
+LICENSE = "MIT & Zlib"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d6237f3a840aef5b7880fb4e49eecfe5"
 
 DEPENDS = "openssl"
diff --git a/meta-oe/recipes-support/liblinebreak/liblinebreak_1.2.bb b/meta-oe/recipes-support/liblinebreak/liblinebreak_1.2.bb
index 2a5efad..d0463a6 100644
--- a/meta-oe/recipes-support/liblinebreak/liblinebreak_1.2.bb
+++ b/meta-oe/recipes-support/liblinebreak/liblinebreak_1.2.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Liblinebreak is an implementation of the line breaking algorithm as described in Unicode 5.1.0 Standard Annex 14, Revision 22"
 HOMEPAGE = "http://vimgadgets.sourceforge.net/liblinebreak/"
 SECTION = "libs"
-LICENSE = "zlib"
+LICENSE = "Zlib"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=3715191da62bafb5cfc4ff36195b2ec3"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/project/vimgadgets/liblinebreak/${PV}/liblinebreak-${PV}.tar.gz"
-- 
2.3.5


