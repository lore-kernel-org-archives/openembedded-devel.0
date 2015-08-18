Return-Path: <mario.goulart@gmail.com>
Received: from mail-qg0-f48.google.com (mail-qg0-f48.google.com
	[209.85.192.48])
	by mail.openembedded.org (Postfix) with ESMTP id AB48F60043
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Aug 2015 20:09:26 +0000 (UTC)
Received: by qgeb6 with SMTP id b6so7882199qge.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Aug 2015 13:09:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:organization;
	bh=vYzpwz1lPy8vxyvzRcuHJPvudvHWz9DJUlhW4vsQFCQ=;
	b=nlJoIOWVC+NTjfiABE5p/gA6DEdoPihadUZDEioQHpJI+H+2jX4oKlEX2F8FhPPlSw
	KvT3C2Lsnlob75XMNAQQ+rdO7qV3R2D3WRB1pkQN4WzWwArGP7L5UPG0w7OWnhly5dXe
	fE+9XYywj6Cw80J9Z+KnWbpMilPL386IcKdwJpTBPdKCnWoPjptB4Z4WuMaamm4bz873
	dcAUnUOOcahuhIcKSWZbpbGD4+zA44DPqfZNioptei7NFhJ5O+zP+RdXWMJxq6ii5/Ga
	OwFdEYCYSjftsngIMm05cjeLiTvw/1hL317RZwIyKzzSKQ2Pr+TvV89mGSmTwUaFfxBN
	Iq2w==
X-Received: by 10.140.93.132 with SMTP id d4mr15796906qge.58.1439928566387;
	Tue, 18 Aug 2015 13:09:26 -0700 (PDT)
Received: from centrium.lab.ossystems.com.br ([177.100.224.148])
	by smtp.gmail.com with ESMTPSA id
	f106sm10753656qgd.30.2015.08.18.13.09.24
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 18 Aug 2015 13:09:25 -0700 (PDT)
Sender: Mario Domenech Goulart <mario.goulart@gmail.com>
From: Mario Domenech Goulart <mario@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Aug 2015 17:14:29 -0300
Message-Id: <1439928871-17797-1-git-send-email-mario@ossystems.com.br>
X-Mailer: git-send-email 2.1.4
Organization: O.S. Systems Software LTDA.
Cc: Mario Domenech Goulart <mario@ossystems.com.br>
Subject: [meta-java][PATCH 1/3] Don't depend on a hardcoded compiler
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
X-List-Received-Date: Tue, 18 Aug 2015 20:09:26 -0000

The recipes below depended on a hardcoded native compile
(ecj-initial-native).  Since we may use another native compiler to
build them, we set the dependency in virtual/javac-native instead.

* cacao
* classpath-native
* jamvm

Signed-off-by: Mario Domenech Goulart <mario@ossystems.com.br>
---
 recipes-core/cacao/cacao_1.6.1.bb               | 2 +-
 recipes-core/classpath/classpath-native_0.99.bb | 2 +-
 recipes-core/jamvm/jamvm.inc                    | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-core/cacao/cacao_1.6.1.bb b/recipes-core/cacao/cacao_1.6.1.bb
index 65aaf93..14ff019 100644
--- a/recipes-core/cacao/cacao_1.6.1.bb
+++ b/recipes-core/cacao/cacao_1.6.1.bb
@@ -4,7 +4,7 @@ LICENSE  = "GPL-2.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 SECTION  = "interpreters"
 
-DEPENDS_class-native = "zlib-native libtool-native ecj-initial-native fastjar-native classpath-native bdwgc-native"
+DEPENDS_class-native = "zlib-native libtool-native virtual/javac-native fastjar-native classpath-native bdwgc-native"
 PROVIDES_class-native = "virtual/java-native"
 
 DEPENDS = "zlib libtool classpath virtual/javac-native bdwgc"
diff --git a/recipes-core/classpath/classpath-native_0.99.bb b/recipes-core/classpath/classpath-native_0.99.bb
index 02951b9..cf297d9 100644
--- a/recipes-core/classpath/classpath-native_0.99.bb
+++ b/recipes-core/classpath/classpath-native_0.99.bb
@@ -1,7 +1,7 @@
 require classpath-native.inc
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=af0004801732bc4b20d90f351cf80510"
-DEPENDS += "ecj-initial-native"
+DEPENDS += "virtual/javac-native"
 
 PR = "${INC_PR}.0"
 
diff --git a/recipes-core/jamvm/jamvm.inc b/recipes-core/jamvm/jamvm.inc
index 5893cbc..bed1c5d 100644
--- a/recipes-core/jamvm/jamvm.inc
+++ b/recipes-core/jamvm/jamvm.inc
@@ -4,7 +4,7 @@ LICENSE = "GPL-2.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
 DEPENDS = "zlib classpath virtual/javac-native libffi"
-DEPENDS_virtclass-native = "zlib-native classpath-native ecj-initial-native libffi-native"
+DEPENDS_virtclass-native = "zlib-native classpath-native virtual/javac-native libffi-native"
 
 RDEPENDS_${PN} = "classpath"
 RDEPENDS_${PN}_virtclass-native = ""
-- 
2.1.4


