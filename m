Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
	[209.85.210.173])
	by mail.openembedded.org (Postfix) with ESMTP id C89676C1BE
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Mar 2019 04:28:05 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id n22so2043237pfa.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 03 Mar 2019 20:28:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=i7bpISbgkeZICDv9HB39C5JU5srTNurDH2H5VJlcpWw=;
	b=tWfuR1i2So0JhcBtYkgOHXWL+LH+P3Ch0h7ujh8vQIIBjdJBrlxB2YGcB0Msizqf0E
	PS91h2bsXde9SbagGN/WntnuKFYAIbbGwOKcj2rT79MvYXARwINI6Iv4Px0IAix1qHkr
	OrYZWsHKwiQTMELMk7gbJyJ8ATdSHO66/3LK6mlVRTU0EloWSgmFSGEIzH5n4tl15FsH
	0zL/3+1tgsOrDW6FBr1vaHgcsCnTmsm+biSBNqdE9eHFRdFDYgzY8jjlu93OLonXqX4S
	BRfCYYfMVKagqpDD2jbrkUNo6bnQQ3nQDhissfsbugFnN31Nd+KrtHLym+9/7It1fRGt
	uvWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=i7bpISbgkeZICDv9HB39C5JU5srTNurDH2H5VJlcpWw=;
	b=YcfNUpsPly3wmGMwZg0UXRcWq+OXl82E8yTVIIX9sqWB42UDCa5Z3fO9UJ/qTzBciH
	N6cpEdGhMwHSDVIrZJL9UkzmjM9LzgL0v3gAc0PVCeWao0kvmbJoDo+vg+u5jQeBSIE1
	7vguoo0weaNNaEaPNXRUOxYiwyr64sLEwBuwu5/CkTZczBBvGaH7Nsb09EeGw8WmdzP6
	k8LEKVN/fDFeyreyJly8OYbeZXOGete3sXukKyD1CsKRGMiSb+0LJYKbwV38l5M2j4ps
	BwySul7k7+lrS12rwO3w7vQL2WtfI1uqNDntNUNFAYtirsZgpdj6hOe/Y9rEHv4BmCTU
	n/vg==
X-Gm-Message-State: APjAAAVhNLtOQQ9hNh9KQEplwdWFvTk1EzdDsyA0ag0vgIb0+y5efe78
	76Ki2X4xsa06UDmMkatxnPQZJcNS
X-Google-Smtp-Source: APXvYqxB5ydgS+5C7+NDsIz2RYsuGUkrMAlDEMFBzwcdXqM6m4K8aTXMqjCUFwsv2QxiCJkbK23PAQ==
X-Received: by 2002:a65:62c2:: with SMTP id m2mr16705884pgv.348.1551673685877; 
	Sun, 03 Mar 2019 20:28:05 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::5fa3])
	by smtp.gmail.com with ESMTPSA id
	m64sm11661915pfi.149.2019.03.03.20.28.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 03 Mar 2019 20:28:05 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  3 Mar 2019 20:27:58 -0800
Message-Id: <20190304042758.30133-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH] mariadb: Upgrade to 5.5.63
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
X-List-Received-Date: Mon, 04 Mar 2019 04:28:06 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../{mariadb-native_5.5.62.bb => mariadb-native_5.5.63.bb}  | 0
 meta-oe/recipes-dbs/mysql/mariadb.inc                       | 6 +++---
 .../mysql/{mariadb_5.5.62.bb => mariadb_5.5.63.bb}          | 0
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-dbs/mysql/{mariadb-native_5.5.62.bb => mariadb-native_5.5.63.bb} (100%)
 rename meta-oe/recipes-dbs/mysql/{mariadb_5.5.62.bb => mariadb_5.5.63.bb} (100%)

diff --git a/meta-oe/recipes-dbs/mysql/mariadb-native_5.5.62.bb b/meta-oe/recipes-dbs/mysql/mariadb-native_5.5.63.bb
similarity index 100%
rename from meta-oe/recipes-dbs/mysql/mariadb-native_5.5.62.bb
rename to meta-oe/recipes-dbs/mysql/mariadb-native_5.5.63.bb
diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/mysql/mariadb.inc
index 8ca5b2ba42..f715542038 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb.inc
+++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
@@ -4,7 +4,7 @@ SECTION = "libs"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
-SRC_URI = "https://downloads.mariadb.org/f/${BP}/source/${BP}.tar.gz \
+SRC_URI = "https://downloads.mariadb.org/interstitial/${BP}/source/${BP}.tar.gz \
            file://fix-cmake-module-path.patch \
            file://remove-bad-path.patch \
            file://fix-mysqlclient-r-version.patch \
@@ -18,8 +18,8 @@ SRC_URI = "https://downloads.mariadb.org/f/${BP}/source/${BP}.tar.gz \
            file://change-cc-to-cc-version.patch \
            file://0001-disable-ucontext-on-musl.patch \
           "
-SRC_URI[md5sum] = "6375d577e9539b839f44d857e70f82b9"
-SRC_URI[sha256sum] = "56a365af71b8a9ec8bfee0801e2dec95011da8ee7507986ca329be11296411db"
+SRC_URI[md5sum] = "f91b31638d4dc47ed43172e56bec2cb7"
+SRC_URI[sha256sum] = "ef1cf79eec32ced9d1051998a8e458bb33dfbc62de297cba37ee8e9f952b21ea"
 
 UPSTREAM_CHECK_URI = "https://github.com/MariaDB/server/releases"
 
diff --git a/meta-oe/recipes-dbs/mysql/mariadb_5.5.62.bb b/meta-oe/recipes-dbs/mysql/mariadb_5.5.63.bb
similarity index 100%
rename from meta-oe/recipes-dbs/mysql/mariadb_5.5.62.bb
rename to meta-oe/recipes-dbs/mysql/mariadb_5.5.63.bb
-- 
2.21.0


