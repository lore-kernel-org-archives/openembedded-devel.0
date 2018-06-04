Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f45.google.com (mail-pg0-f45.google.com [74.125.83.45])
	by mail.openembedded.org (Postfix) with ESMTP id 9C8957472A
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Jun 2018 02:48:56 +0000 (UTC)
Received: by mail-pg0-f45.google.com with SMTP id p21-v6so13785398pgd.11
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 03 Jun 2018 19:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=dMi2Pl78peoa6Kq5HdnocxG54LpidZPx4J8jfwODsS8=;
	b=q93mkKI34/ZpSh5IN2SKsiYAyMeVKJuqhLvrqH0BZw5mG3gZPZeIwM+XUzI+TbFiFE
	/MQavEGXAiSLWiVRVN7+lV7tnVje94cYnqBG7wN1xbC3fTDbDEC6wnEZ9pVjt5qMR7fu
	u4or83B7pc0YCtRQ6I0yzogkh/gMLGKsh4XKydCGKuPRt3PMogCMjDn3unWJJF3dACz3
	bHVeyhDZjkVsh7Opyde+UJhHT/cc2JDheWyrD4Lyk7Ncs7I7htoQZYxozc0kWd6ccJxp
	ULXsYRxkRoxRSdOLQXwGwyS/5RXv8tcQZvT/AbV5Edy2J7pgEipNwdSsGD9l4eVd4HsJ
	EH2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=dMi2Pl78peoa6Kq5HdnocxG54LpidZPx4J8jfwODsS8=;
	b=uhsMSbEZX5KLEGjv6inVgWuRfXCXPXm/efsXJDmjc8zR9M3lRSsNhKvbf01PjGaXp7
	lwY/H1HVma3eG+i5fQazZEdIApWAsv77aedQ1jC22nst+o8VO7iZCN+RqQsCJtPeAweX
	aU+seoIAYDqzCE6jPiY0PUNIFPdbO03YRg1Z+YS3+mjYD88BRs6ry9Jw2KlBGvHscMjE
	l+3y3CRPrEFh0uvxGjLeZpTc3Wb0dnUZfsyuBxmV4Q3B5L6O7813pMQbkDI++uE4tPCy
	4CKoI7gC2xYoTSy4FXJacYks7pUJuWXEJsjKFg8PJts78c6ALpUizhTYpYitXZH2knuk
	yJpA==
X-Gm-Message-State: APt69E0ebgSQ6fEZLse0qxRzH+JKGGjrjWlNnI/fNE0d0rMj7JTngXA6
	pa7xDHu9B3Qrn6bIiV4IcmE=
X-Google-Smtp-Source: ADUXVKJwZ5ukPGPAQWJYVPTaOFKCwIttDBCwzIv/cqcdPiV4C9+lT1u2AhwXclUvWX1V0hd0ZjIEow==
X-Received: by 2002:a62:211a:: with SMTP id
	h26-v6mr8958099pfh.133.1528080537749; 
	Sun, 03 Jun 2018 19:48:57 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4000:1184:f1bd:c539:22b:bbf1])
	by smtp.gmail.com with ESMTPSA id
	o10-v6sm62844021pgc.80.2018.06.03.19.48.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 03 Jun 2018 19:48:57 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-devel@lists.openembedded.org
Date: Sun,  3 Jun 2018 19:48:35 -0700
Message-Id: <1a4b76431b2c9ef21b5a6f1e5038918668e5d779.1528080420.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1528080420.git.akuster808@gmail.com>
References: <cover.1528080420.git.akuster808@gmail.com>
Subject: [morty 01/15] poco: make cmake packages relocatable
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
X-List-Received-Date: Mon, 04 Jun 2018 02:48:56 -0000

From: Pascal Bach <pascal.bach@siemens.com>

Before the path to the dependencies was hard coded into the generated
PocoConfig.cmake file. This causes issues with sstate.

This change overrides the libraries with just the library names and thus
let's the linker take care of finding them.

Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
(cherry picked from commit 49ea5f4fa4a350f4e0c0e0ece855174274e5fcc1)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-support/poco/poco_1.7.5.bb | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/meta-oe/recipes-support/poco/poco_1.7.5.bb b/meta-oe/recipes-support/poco/poco_1.7.5.bb
index 0fc50e1..4045643 100644
--- a/meta-oe/recipes-support/poco/poco_1.7.5.bb
+++ b/meta-oe/recipes-support/poco/poco_1.7.5.bb
@@ -21,6 +21,7 @@ SRC_URI = " \
 S = "${WORKDIR}/git"
 
 EXTRA_OECMAKE = "-DCMAKE_BUILD_TYPE=RelWithDebInfo -DPOCO_UNBUNDLED=ON \
+                  -DZLIB_LIBRARY_RELEASE:STRING=z -DPCRE_LIBRARY:STRING=pcre \
                  ${@bb.utils.contains('PTEST_ENABLED', '1', '-DENABLE_TESTS=ON ', '', d)}"
 
 # For the native build we want to use the bundled version
@@ -34,16 +35,16 @@ EXTRA_OECMAKE_append = " -DCMAKE_SKIP_RPATH=ON"
 # these don't have dependencies outside oe-core
 PACKAGECONFIG ??= "XML JSON MongoDB PDF Util Net NetSSL Crypto Data DataSQLite Zip"
 
-PACKAGECONFIG[XML] = "-DENABLE_XML=ON,-DENABLE_XML=OFF,expat"
+PACKAGECONFIG[XML] = "-DENABLE_XML=ON -DEXPAT_LIBRARY:STRING=expat,-DENABLE_XML=OFF,expat"
 PACKAGECONFIG[JSON] = "-DENABLE_JSON=ON,-DENABLE_JSON=OFF"
 PACKAGECONFIG[MongoDB] = "-DENABLE_MONGODB=ON,-DENABLE_MONGODB=OFF"
 PACKAGECONFIG[PDF] = "-DENABLE_PDF=ON,-DENABLE_PDF=OFF,zlib"
 PACKAGECONFIG[Util] = "-DENABLE_UTIL=ON,-DENABLE_UTIL=OFF"
 PACKAGECONFIG[Net] = "-DENABLE_NET=ON,-DENABLE_NET=OFF"
-PACKAGECONFIG[NetSSL] = "-DENABLE_NETSSL=ON,-DENABLE_NETSSL=OFF,openssl"
-PACKAGECONFIG[Crypto] = "-DENABLE_CRYPTO=ON,-DENABLE_CRYPTO=OFF,openssl"
+PACKAGECONFIG[NetSSL] = "-DENABLE_NETSSL=ON -DOPENSSL_SSL_LIBRARY:STRING=ssl -DOPENSSL_CRYPTO_LIBRARY:STRING=crypto,-DENABLE_NETSSL=OFF,openssl"
+PACKAGECONFIG[Crypto] = "-DENABLE_CRYPTO=ON -DOPENSSL_SSL_LIBRARY:STRING=ssl -DOPENSSL_CRYPTO_LIBRARY:STRING=crypto,-DENABLE_CRYPTO=OFF,openssl"
 PACKAGECONFIG[Data] = "-DENABLE_DATA=ON,-DENABLE_DATA=OFF"
-PACKAGECONFIG[DataSQLite] = "-DENABLE_DATA_SQLITE=ON,-DENABLE_DATA_SQLITE=OFF,sqlite3"
+PACKAGECONFIG[DataSQLite] = "-DENABLE_DATA_SQLITE=ON -DSQLITE3_LIBRARY:STRING=sqlite3,-DENABLE_DATA_SQLITE=OFF,sqlite3"
 PACKAGECONFIG[Zip] = "-DENABLE_ZIP=ON,-DENABLE_ZIP=OFF"
 
 # Additional components not build by default,
@@ -51,7 +52,7 @@ PACKAGECONFIG[Zip] = "-DENABLE_ZIP=ON,-DENABLE_ZIP=OFF"
 # or they don't work on all architectures
 PACKAGECONFIG[mod_poco] = "-DENABLE_APACHECONNECTOR=ON,-DENABLE_APACHECONNECTOR=OFF,apr apache2"
 PACKAGECONFIG[CppParser] = "-DENABLE_CPPPARSER=ON,-DENABLE_CPPPARSER=OFF"
-PACKAGECONFIG[DataMySQL] = "-DENABLE_DATA_MYSQL=ON,-DENABLE_DATA_MYSQL=OFF,mariadb"
+PACKAGECONFIG[DataMySQL] = "-DENABLE_DATA_MYSQL=ON -DMYSQL_LIB:STRING=mysqlclient_r,-DENABLE_DATA_MYSQL=OFF,mariadb"
 PACKAGECONFIG[DataODBC] = "-DENABLE_DATA_ODBC=ON,-DENABLE_DATA_ODBC=OFF,libiodbc"
 PACKAGECONFIG[PageCompiler] = "-DENABLE_PAGECOMPILER=ON,-DENABLE_PAGECOMPILER=OFF"
 PACKAGECONFIG[PageCompilerFile2Page] = "-DENABLE_PAGECOMPILER_FILE2PAGE=ON,-DENABLE_PAGECOMPILER_FILE2PAGE=OFF"
-- 
2.7.4


