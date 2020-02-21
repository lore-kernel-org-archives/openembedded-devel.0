Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 20E8561778
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Feb 2020 20:44:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 48PNk32S3wz4c
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Feb 2020 21:44:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1582317883;
	bh=lBKU2TJ9RndCeHs/Vn83Xmp5P5W8AsA8OOyNuq4WM7E=;
	h=From:To:Subject:Date:From;
	b=GrLfvMkzmPTrie7lRbUtEAFUv64dRbThrLnQzvrNdz2zMnxQFjFHdNKfBm6Kk5mTE
	5G8VC41pWPZhJQzloILVCiEfCGBKjHFNHSqMhmDo6oHagGk7bl5LilYKeq80s+O8et
	znam/DQnRKwbw/xSKC9WR4sdB6HO6Vb3Hj34enZ8UMJBgmHy57Gxp6aFc7qiyXXQ1+
	s/DjTcqGElDUSlDPP+/5NRRyZ3owWHHimWFuYG++kKo1G5rizKS9s+dBnzdKvOjpQs
	Cxb6WwKDyV+P0rVhxqH3jw6q6/oZ5Bq2OzfJrXM9RUs0JSSKmB5dJFPbFG6nSJxYQz
	iyaswKh646vD8PDPf6UPUeRgkNlNI8h7i/nB0XoxHkwDm9I9KPnyWTSAV2vS7L6sYV
	FpYpok8B4lRlCrJ3r/3KB8Hf05aYQk0m49iL3lyu8XUowe7K1UxUEA/EOxrcOZJFwg
	JypncN5MHCP9THO8bP5ke6T0C89yE98R1rGMBWShYzWpduq0y0jJewz8ASSm83M0EM
	04uLbTYUSPOWeON7kOwLyoIJvEiXiD5LhMI8NRICLrKWQTpkrzuYaaRCdeHTERTzHL
	7Og+9PQHU5UK8VW5U7yDMh9n/mZVbTV2fyW3g+BdGUfBGDuq51yfp8RcXw8Nu+z/pS
	1Lz1gfyWI4ZLxwiGnant4L3A=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 21 Feb 2020 22:44:39 +0200
Message-Id: <20200221204440.16807-2-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-networking][warrior][PATCH] mariadb: upgrade 10.3.16 -> 10.3.18
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
X-List-Received-Date: Fri, 21 Feb 2020 20:44:43 -0000

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


