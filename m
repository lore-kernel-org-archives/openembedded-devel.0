Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 15336601D4
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  2 Oct 2016 14:48:57 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id i85so887335pfa.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 02 Oct 2016 07:48:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=2My30jy7MYUsjO+7rDgj3JLQBBneLMWqMuooVwHIF2g=;
	b=Y9HxpmMGYem2dqZ1dr6pS0+cTrOzqumzWLoI4wbDtb4GFK8JBcVcIqVFOw9CCLX/Xg
	lMJtcN00YtOCQfpbB0fp5fot+xo40BXdlsfOOvuej58b4lemyCm1TKvXfQfEl+Z0TzyV
	1O5pk5k0kJw8fcEnRfjc2uMVIFgMawFEE98grC0JheiUHRcSertCL03Nm9An8T6fwzu9
	czAdb2xyr7867Ie9Q2ZA5/WbxXffJoYhtwIYyrtPdcmPL6hZQmOwS6FG0sAReieE46Lp
	qTh7D5eFGoWJx1MhW4F1xWb9b6KMwGA6CL3GzdOXfXOmwExJT3Z6uv6C5FYKLVEbiXV5
	RH6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=2My30jy7MYUsjO+7rDgj3JLQBBneLMWqMuooVwHIF2g=;
	b=LRSzRBKDgxTpQSGSrR4ZFchfTvMVDVzUkF/khov03ursJdjt5wbSRRLDapHseOPYsA
	0Enqp3gS7LBtjrdm4rMHL9/rTbcrHAO51NTdl4AdG9PnAnQvSp/vtC1VtZ3Kkk7YP+/T
	CpAkUB2O0G+5tEoTmytQ7yEK5Hl8MS4Ae5cipc0UV5IX/lmIIBMfFPGjRnib/ntkcPDI
	0QJeL15RcSFWrt7ixAhDEChCzFcwv3Xmz80zNIAL0EDzsFQIqleBnwYEJJkEKQqP+bZG
	HFuSCC+bwRi3OGCRLjZObUvdtfxU0P8M2BD6IaPpH2vEO67cD/gxqoWAONwtXItfcA5/
	+NBg==
X-Gm-Message-State: AA6/9RmPOu+JMQIRiplCMzUqcvVa884VHy6Ry4N7aVmgEkcVyVFadxzD9KLo54F8NqjWqQ==
X-Received: by 10.98.60.142 with SMTP id b14mr17307180pfk.93.1475419739302;
	Sun, 02 Oct 2016 07:48:59 -0700 (PDT)
Received: from akuster-ThinkPad-X240.mvista.com
	([2601:202:4001:9ea0:c1fe:336b:94fd:8c8e])
	by smtp.gmail.com with ESMTPSA id
	si1sm41009615pab.0.2016.10.02.07.48.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 02 Oct 2016 07:48:58 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-devel@lists.openembedded.org
Date: Sun,  2 Oct 2016 07:48:57 -0700
Message-Id: <1475419737-29679-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-oe][PATCH] mariadb: update to version 5.5.52
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
X-List-Received-Date: Sun, 02 Oct 2016 14:49:00 -0000

Update to latest from 5.5.50 to 5.5.52, maintenance updates.
includes CVE-2016-6662 affects < 5.5.51

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../mysql/{mariadb-native_5.5.50.bb => mariadb-native_5.5.52.bb}     | 0
 meta-oe/recipes-support/mysql/mariadb.inc                            | 5 ++---
 .../recipes-support/mysql/{mariadb_5.5.50.bb => mariadb_5.5.52.bb}   | 0
 3 files changed, 2 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-support/mysql/{mariadb-native_5.5.50.bb => mariadb-native_5.5.52.bb} (100%)
 rename meta-oe/recipes-support/mysql/{mariadb_5.5.50.bb => mariadb_5.5.52.bb} (100%)

diff --git a/meta-oe/recipes-support/mysql/mariadb-native_5.5.50.bb b/meta-oe/recipes-support/mysql/mariadb-native_5.5.52.bb
similarity index 100%
rename from meta-oe/recipes-support/mysql/mariadb-native_5.5.50.bb
rename to meta-oe/recipes-support/mysql/mariadb-native_5.5.52.bb
diff --git a/meta-oe/recipes-support/mysql/mariadb.inc b/meta-oe/recipes-support/mysql/mariadb.inc
index 5dd8d64..7725311 100644
--- a/meta-oe/recipes-support/mysql/mariadb.inc
+++ b/meta-oe/recipes-support/mysql/mariadb.inc
@@ -16,9 +16,8 @@ SRC_URI = "http://archive.mariadb.org/mariadb-${PV}/source/mariadb-${PV}.tar.gz
            file://configure.cmake-fix-valgrind.patch \
            file://fix-a-building-failure.patch \
           "
-
-SRC_URI[md5sum] = "5cfb169934170a429589e05f0f5aba9c"
-SRC_URI[sha256sum] = "030b60a787333bf20ec0ee02b02da52474772c069954dc914f894a7703989b76"
+SRC_URI[md5sum] = "fca86f1eaed2163b4bdce4f98f472324"
+SRC_URI[sha256sum] = "e142f9459507b97c5848042863b313ce70750118446bb4e35e5c07fe66007293"
 
 S = "${WORKDIR}/mariadb-${PV}"
 
diff --git a/meta-oe/recipes-support/mysql/mariadb_5.5.50.bb b/meta-oe/recipes-support/mysql/mariadb_5.5.52.bb
similarity index 100%
rename from meta-oe/recipes-support/mysql/mariadb_5.5.50.bb
rename to meta-oe/recipes-support/mysql/mariadb_5.5.52.bb
-- 
2.7.4


