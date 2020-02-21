Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id BE3496023B
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Feb 2020 20:46:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 48PNlv3Qmyz4c
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Feb 2020 21:46:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1582317979;
	bh=lBKU2TJ9RndCeHs/Vn83Xmp5P5W8AsA8OOyNuq4WM7E=;
	h=From:To:Subject:Date:From;
	b=MLf9t6o5pHdvTFnPHItC8ri0fz3rlqJX/v+GNSK7LrZnqv8N1r8j9oNomIMg8Wb08
	XT+v+aDOKsUk2CkPcDEVs693JEgzXzK8Unj8FrLCjFNZFj4mTwCHrk6oZ+5JToJTdj
	G4+vBJvhUsuRx4h+3QplbzwqTfkTG81W5hDAs53sCpunOkHlX5vEimwHKaq5u1qFDS
	Bb0wjDQ6g5g1mU0uEEBjaBHIP/zCYTxMc6QD/YrcsEfxsgLErtUkqrHe6ldC65UN4S
	xuaxWmJvzaWc2Ehm6n0cL/TDcjoxEZlM836SXSGsvSWvs84+KRq8LxcyqBa94p7lsM
	DdxYM25ChxIkRVqcl+89dUDlMgwC8qT7pM3KzzFlm5iajxtOyof6ocVI4sKZzpIBL7
	mVS4aRHKzz6uQGJUohpOGm5hOxMc7RR+2+Lkom2NAQ5D70jR8d7WWN/GsZMfeYJctP
	kbIgUScrBAb0Yl6Pjk+NiYhBp6jIbqLFYEx4Ls9o1m90cKUZhItPCAL+qIvn6FSQPP
	TU1pugJQMdxna7H+EU0oMknvESbUnYr/YSOdV6BipQIfL3EfvdGReB3l3h2KlS+dCM
	i2dW+f4YlGCX6JclV7jzRt9q1zQv98OuM5qmt3/pR5/iFBjn793+GAgt+CH0kvCJ/K
	Q0uU3VORToAM6pVCATeqUWro=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 21 Feb 2020 22:46:16 +0200
Message-Id: <20200221204617.13912-2-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][warrior][PATCH] mariadb: upgrade 10.3.16 -> 10.3.18
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
X-List-Received-Date: Fri, 21 Feb 2020 20:46:19 -0000

From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
[Bug fix only update
https://mariadb.com/kb/en/library/mariadb-10318-release-notes/
includes:
CVE-2019-2805
CVE-2019-2740
CVE-2019-2739
CVE-2019-2737
CVE-2019-2758 ]
Signed-off-by: Armin Kuster <akuster808@gmail.com>
Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 .../{mariadb-native_10.3.16.bb => mariadb-native_10.3.18.bb}  | 0
 meta-oe/recipes-dbs/mysql/mariadb.inc                         | 4 ++--
 .../mysql/{mariadb_10.3.16.bb => mariadb_10.3.18.bb}          | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-dbs/mysql/{mariadb-native_10.3.16.bb => mariadb-native_10.3.18.bb} (100%)
 rename meta-oe/recipes-dbs/mysql/{mariadb_10.3.16.bb => mariadb_10.3.18.bb} (100%)

diff --git a/meta-oe/recipes-dbs/mysql/mariadb-native_10.3.16.bb b/meta-oe/recipes-dbs/mysql/mariadb-native_10.3.18.bb
similarity index 100%
rename from meta-oe/recipes-dbs/mysql/mariadb-native_10.3.16.bb
rename to meta-oe/recipes-dbs/mysql/mariadb-native_10.3.18.bb
diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/mysql/mariadb.inc
index 37abf45d8..c2a30bc99 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb.inc
+++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
@@ -19,8 +19,8 @@ SRC_URI = "http://archive.mariadb.org/${BP}/source/${BP}.tar.gz \
            file://clang_version_header_conflict.patch \
            file://fix-arm-atomic.patch \
           "
-SRC_URI[md5sum] = "11220d0b94c5c24caa2e1e9eaba38e31"
-SRC_URI[sha256sum] = "39e9723eaf620afd99b0925b2c2a5a50a89110ba50040adf14cce7cf89e5e21b"
+SRC_URI[md5sum] = "b3524c0825c3a1c255496daea38304a0"
+SRC_URI[sha256sum] = "69456ca85bf9d96c6d28b4ade2a9f6787d79a602e27ef941f9ba4e0b55dddedc"
 
 UPSTREAM_CHECK_URI = "https://github.com/MariaDB/server/releases"
 
diff --git a/meta-oe/recipes-dbs/mysql/mariadb_10.3.16.bb b/meta-oe/recipes-dbs/mysql/mariadb_10.3.18.bb
similarity index 100%
rename from meta-oe/recipes-dbs/mysql/mariadb_10.3.16.bb
rename to meta-oe/recipes-dbs/mysql/mariadb_10.3.18.bb
-- 
2.17.1


