Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
	[209.85.210.173])
	by mail.openembedded.org (Postfix) with ESMTP id 4B8F27FD1B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jan 2020 06:38:28 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id 62so2839924pfu.11
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Jan 2020 22:38:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=ambRZFZo9aG1nBxdD8U7/sYSVw2oGVhi5EdWwNlX+No=;
	b=jESn/qglAcrb8ESBzHT05KfhZkvWSOYp27THZP4kqyl5H1KQ+BfDRIBvjg8WsepBmu
	3Ssj1jmBkqvwyqeFVYGUNAs6K9rRhY48paoZQAo1VwCsUlKfOaiNyRviPe+wMQApLs/a
	Vi2JSDYAuLPwuNcYbqIpUhZ6zdCigLNdaN1tY5A/u2qmfJ7ecYPrSrm9aUFObZfSHHgg
	/YIfHrHPt5xV5YYjG5R/UlFxlB4wJbTy8/xrpd78cMOHRcevYj2tusVgxbmHqlRTWQvw
	KpQhECFG8rt9Md5wh/CeRaCd76hJeAuJRQQoKHz6vw5SD78XMXZfMDLipTP4jDmbjwQh
	GRYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=ambRZFZo9aG1nBxdD8U7/sYSVw2oGVhi5EdWwNlX+No=;
	b=jy74ykmEFZNYlodCQHVCXvbwtALcWEIBtiwgkzDr5FPxlDiUn16aJmkS/5dvhTGhTf
	zb4SO0CTSe8O3dCDfSg9/sM/n49QwWuDqHWbzzEBWu9ruyV55dv5+cTv8OyrPO/KTBE3
	owzDMhTiU0mXHl3Ylb4Nr+dYjn+qKEROfYRjigduWleFV+rJfQqh0to6bro2CRoFw/kf
	K2gWAPvzs7G4vl7K++ojA1CZKEKfHrqu5pXXARpSDoI2g3nNdPfXCiBtGQvUREuaMn8x
	Yh+o5hA549IoliED+Iz87EjPEXv1A6ZQ80IE9yx5XmgLn+TYEY+WVVo6DeOPDm0I713+
	1XTA==
X-Gm-Message-State: APjAAAV78I3Wlp0jwxuuA+6EM3M97XHjExQSySJk4GojTa6eC54/wRFT
	Z2QXjqNgEY+hUMqkOD98cijfHSUzkDY=
X-Google-Smtp-Source: APXvYqw3gDCw3NrE82zumRSHzOgO0Kfw35fLnoCrvJBCVaXD2GS3O8sY1xTUQBtyDMHfYkQJmSircg==
X-Received: by 2002:a63:f551:: with SMTP id e17mr9391484pgk.162.1579675108949; 
	Tue, 21 Jan 2020 22:38:28 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::cab1])
	by smtp.gmail.com with ESMTPSA id
	100sm1600283pjo.17.2020.01.21.22.38.28
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 21 Jan 2020 22:38:28 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 21 Jan 2020 22:38:18 -0800
Message-Id: <20200122063823.242098-7-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200122063823.242098-1-raj.khem@gmail.com>
References: <20200122063823.242098-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 07/12] mysql-python: Enable only when meta-py2 is present
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
X-List-Received-Date: Wed, 22 Jan 2020 06:38:28 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb | 3 ++-
 meta-oe/recipes-dbs/mysql/mysql-python_1.2.5.bb            | 7 ++++++-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index f045167e8e..6dda3005e7 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -101,8 +101,9 @@ RDEPENDS_packagegroup-meta-oe-bsp_remove_riscv32 = "efivar efibootmgr"
 
 RDEPENDS_packagegroup-meta-oe-dbs ="\
     leveldb libdbi mariadb mariadb-native \
-    mysql-python postgresql psqlodbc rocksdb soci \
+    postgresql psqlodbc rocksdb soci \
     sqlite \
+    ${@bb.utils.contains("BBPATH", "meta-python2", "mysql-python", "", d)} \
     "
 
 RDEPENDS_packagegroup-meta-oe-devtools ="\
diff --git a/meta-oe/recipes-dbs/mysql/mysql-python_1.2.5.bb b/meta-oe/recipes-dbs/mysql/mysql-python_1.2.5.bb
index 6d52222ce4..f1c2b7701c 100644
--- a/meta-oe/recipes-dbs/mysql/mysql-python_1.2.5.bb
+++ b/meta-oe/recipes-dbs/mysql/mysql-python_1.2.5.bb
@@ -16,4 +16,9 @@ SRC_URI[sha256sum] = "811040b647e5d5686f84db415efd697e6250008b112b6909ba77ac059e
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-inherit setuptools3
+inherit setuptools
+
+python() {
+    if 'meta-python2' not in d.getVar('BBFILE_COLLECTIONS').split():
+        raise bb.parse.SkipRecipe('Requires meta-python2 to be present.')
+}
-- 
2.25.0


