Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
	[209.85.214.180])
	by mail.openembedded.org (Postfix) with ESMTP id 019BA7F4A2
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 31 Aug 2019 21:31:49 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id gn20so4894031plb.2
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 31 Aug 2019 14:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=+vLB6+6nNLEvrRCP8Y9wkPJ3Aip+riOQ5AgmbVt1vPA=;
	b=ebLq8gUQcmhCkJVEtjzZIwH+6neLumVtjTZB8aSynEOSDRzwTG80vjh1rtPR+8W93P
	5hAQnowBMQH0I7ZYFJxwsdHUf3wBfYN2UjtHyLaPMkr89y3tkPiVSyxcEwW731t9XvJP
	Ui0K8N9tpD3C0xdYGKyP3McZVy28jlw+z4feawAOih8DyAQc8eijpKhg5RlK9PTc+dfU
	d/jvdoxzz8LZonqXA9PZ0zn4oEf7BjDvrbC2X4ct29YvI56XiYcpeFK7ASQTTHGNfAe7
	aclWlDd1TcHZsJLLCmZ6Mv5Zr/CawCpR0x+jYnW86hd2KWJBC2UPkb8/TfTw3KFHQYNr
	bM9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=+vLB6+6nNLEvrRCP8Y9wkPJ3Aip+riOQ5AgmbVt1vPA=;
	b=IAK4lGdCwphROJSGKs6Vs7oWACOjKA3DmyqhMH6NchG6z1Gtud6xY+GDFCVCLdECJx
	86rw5yi0NbsIFWZfAoIhKxsstWFNJDsB+PCap6BJhU+V4aA6PH9qT/CdzbG2HV8I7T9I
	1IUYGSxR0kXCHybeOajgYtHZrnXAWTCQVqEJ+KZ2o8EdQ67S4rU9s1VbSUWPTMzT+ggB
	pYih5WakotfZ7lKAQdUt//kdgnA+x85oubQ731Brvk8NTz1CyMgyKceVAEutyygvVT49
	sAZk+Iib7vEgHb3zV5iGl1eqkv5/JKMEznUASQIRXg74eMhjCgvM+5su84xjv888DOGX
	ZfvA==
X-Gm-Message-State: APjAAAWMSemmHRyNX7fv9xovSvqVyEA32x/Z70zX2p3aP0nUPFlYhBad
	Wm8+LC7x5a3C8XzTnpOt2Yps06wY
X-Google-Smtp-Source: APXvYqyvU9S2c3XRKcOeYkkX3zu/6T0ggJEhQ364R+60LaziBVSaJyOeVxm1RyXeFPF3sdZEwvtNyw==
X-Received: by 2002:a17:902:7b97:: with SMTP id
	w23mr22635068pll.283.1567287110932; 
	Sat, 31 Aug 2019 14:31:50 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:8107:6109:754a:f033])
	by smtp.gmail.com with ESMTPSA id
	a18sm8060827pgl.44.2019.08.31.14.31.50
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 31 Aug 2019 14:31:50 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 31 Aug 2019 14:31:24 -0700
Message-Id: <4a2b06e0cc2400f306e97fe1c28adab5940f99e7.1567286967.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1567286967.git.akuster808@gmail.com>
References: <cover.1567286967.git.akuster808@gmail.com>
Subject: [warrior 03/23] mariadb: Upgrade to 10.3.16
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
X-List-Received-Date: Sat, 31 Aug 2019 21:31:50 -0000

From: Mingli Yu <mingli.yu@windriver.com>

License-Update:
The address of Free Software Foundation updated

Bug fixes:
 MDEV-19490: show tables fails when selecting the information_schema database
 MDEV-19541: InnoDB crashes when trying to recover a corrupted page

More details check:
 https://jira.mariadb.org/browse/MDEV-19490
 https://jira.mariadb.org/browse/MDEV-19541

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../{mariadb-native_10.3.15.bb => mariadb-native_10.3.16.bb}      | 0
 meta-oe/recipes-dbs/mysql/mariadb.inc                             | 8 ++++----
 .../recipes-dbs/mysql/{mariadb_10.3.15.bb => mariadb_10.3.16.bb}  | 0
 3 files changed, 4 insertions(+), 4 deletions(-)
 rename meta-oe/recipes-dbs/mysql/{mariadb-native_10.3.15.bb => mariadb-native_10.3.16.bb} (100%)
 rename meta-oe/recipes-dbs/mysql/{mariadb_10.3.15.bb => mariadb_10.3.16.bb} (100%)

diff --git a/meta-oe/recipes-dbs/mysql/mariadb-native_10.3.15.bb b/meta-oe/recipes-dbs/mysql/mariadb-native_10.3.16.bb
similarity index 100%
rename from meta-oe/recipes-dbs/mysql/mariadb-native_10.3.15.bb
rename to meta-oe/recipes-dbs/mysql/mariadb-native_10.3.16.bb
diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/mysql/mariadb.inc
index eed23d2..9a398b3 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb.inc
+++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
@@ -2,9 +2,9 @@ SUMMARY = "A robust, scalable, and reliable SQL server"
 HOMEPAGE = "http://mariadb.org"
 SECTION = "libs"
 LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b1becf0cfa3366e0f4d854d1d264f311"
 
-SRC_URI = "https://downloads.mariadb.org/interstitial/${BPN}-${PV}/source/${BPN}-${PV}.tar.gz \
+SRC_URI = "https://downloads.mariadb.com/MariaDB/${BPN}-${PV}/source/${BPN}-${PV}.tar.gz \
            file://my.cnf \
            file://mysqld.service \
            file://install_db.service \
@@ -19,8 +19,8 @@ SRC_URI = "https://downloads.mariadb.org/interstitial/${BPN}-${PV}/source/${BPN}
            file://clang_version_header_conflict.patch \
            file://fix-arm-atomic.patch \
           "
-SRC_URI[md5sum] = "08edd8b5060a181e6dd3c6aac23218cd"
-SRC_URI[sha256sum] = "27f391a54d544f93850d4edfb3ef1b4cf24f8e27e61e51727b0e7d31bb4d6968"
+SRC_URI[md5sum] = "11220d0b94c5c24caa2e1e9eaba38e31"
+SRC_URI[sha256sum] = "39e9723eaf620afd99b0925b2c2a5a50a89110ba50040adf14cce7cf89e5e21b"
 
 UPSTREAM_CHECK_URI = "https://github.com/MariaDB/server/releases"
 
diff --git a/meta-oe/recipes-dbs/mysql/mariadb_10.3.15.bb b/meta-oe/recipes-dbs/mysql/mariadb_10.3.16.bb
similarity index 100%
rename from meta-oe/recipes-dbs/mysql/mariadb_10.3.15.bb
rename to meta-oe/recipes-dbs/mysql/mariadb_10.3.16.bb
-- 
2.7.4


