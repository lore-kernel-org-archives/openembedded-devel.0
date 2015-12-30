Return-Path: <twoerner@gmail.com>
Received: from mail-io0-f172.google.com (mail-io0-f172.google.com
	[209.85.223.172])
	by mail.openembedded.org (Postfix) with ESMTP id 074FC6FFCD
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Dec 2015 18:01:15 +0000 (UTC)
Received: by mail-io0-f172.google.com with SMTP id 1so31020672ion.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Dec 2015 10:01:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=cZXoO5VoJJw4tMp/8tOlAKMMVMJnL1bdGXmbXatOYe0=;
	b=0yNZRN0+qWgeNUwhHgoNX65UhsRRDBn2JLUh99WEJQwby3SyRt7rt9hGWSysJzAho5
	ecFbuS8aZOAaieRzG/EnC/9vYJQT+6Hu2pDrrtwqIYDlpnRalCkM0UYnhMgIwt8crzxY
	5CUdRj0qkVf06BvrpO93/thTVIw5nwNmU98bdSzIfIoR62Y8lIiWgQb/CV0x3Alxef1y
	zObW9lAOWJ9gGXgO3rNj2x/OqFwpS37ha3iboFtAxyosX7k/xkZw2f0VGIz/NmSrYzln
	1cQzTstTiz3JpOp59v4WQppdvw2W64ZwneaO/fR+ARIKc9UJCKcuJUDYVsdEc/D9zFgX
	Vatw==
X-Received: by 10.107.152.21 with SMTP id a21mr23934775ioe.176.1451498476435; 
	Wed, 30 Dec 2015 10:01:16 -0800 (PST)
Received: from openSUSE-i7.site (dsl-67-55-28-109.acanac.net. [67.55.28.109])
	by smtp.gmail.com with ESMTPSA id
	h9sm23156831igh.3.2015.12.30.10.01.12
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 30 Dec 2015 10:01:15 -0800 (PST)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 30 Dec 2015 13:00:58 -0500
Message-Id: <1451498458-17741-1-git-send-email-twoerner@gmail.com>
X-Mailer: git-send-email 2.6.3.368.gf34be46
Subject: [meta-oe][PATCH] nodejs: update from 4.2.3 to 4.2.4
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
X-List-Received-Date: Wed, 30 Dec 2015 18:01:17 -0000

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 .../recipes-devtools/nodejs/{nodejs_4.2.3.bb => nodejs_4.2.4.bb}    | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-devtools/nodejs/{nodejs_4.2.3.bb => nodejs_4.2.4.bb} (93%)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_4.2.3.bb b/meta-oe/recipes-devtools/nodejs/nodejs_4.2.4.bb
similarity index 93%
rename from meta-oe/recipes-devtools/nodejs/nodejs_4.2.3.bb
rename to meta-oe/recipes-devtools/nodejs/nodejs_4.2.4.bb
index 66a3c11..18e23b7 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_4.2.3.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_4.2.4.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "nodeJS Evented I/O for V8 JavaScript"
 HOMEPAGE = "http://nodejs.org"
 LICENSE = "MIT & BSD & Artistic-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=ee90ba97d933fc8d56e97812b7dd62e9"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=963ca39eebcb15ac618bc3006504ae3f"
 
 DEPENDS = "openssl"
 
@@ -12,8 +12,8 @@ COMPATIBLE_MACHINE_mips64 = "(!.*mips64).*"
 SRC_URI = "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.gz \
     file://no-registry.patch \
 "
-SRC_URI[md5sum] = "529a8abd4ca5a2225636767d3f14c382"
-SRC_URI[sha256sum] = "5008ade5feb4b089f59163f66bffddc113f27de5d78edf203e39435c2c5d554f"
+SRC_URI[md5sum] = "86e4d0d8b626f6e60ca7bef02f2543d2"
+SRC_URI[sha256sum] = "4ee244ffede7328d9fa24c3024787e71225b7abaac49fe2b30e68b27460c10ec"
 
 S = "${WORKDIR}/node-v${PV}"
 
-- 
2.6.0.rc3


