Return-Path: <raj.khem@gmail.com>
Received: from mail-it0-f65.google.com (mail-it0-f65.google.com
	[209.85.214.65])
	by mail.openembedded.org (Postfix) with ESMTP id 4AC8071DDD
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Apr 2017 05:21:33 +0000 (UTC)
Received: by mail-it0-f65.google.com with SMTP id e132so13852453ite.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Apr 2017 22:21:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=DyftTWdBdGYaM6PiS3I5lFJ70UFUBTsMRouN+yJHw78=;
	b=U/pSgvohGr71VgcQvkWs4KSOpip1cUggtY68TA1oSxyoWAlneSYrY6bKZXt1V/RhiG
	IdewxHcH2WDLT8p906s04juDOnqG74mxUaBEFVFtYjOoS4Ha5VjNrqWIamEOP9d4omHA
	WVFzOJCKxPxb2JkEr9UUSaYmTH+EmsMNTB9WbAWxR+livdHrLC5uERO33ZStoKDW9iy3
	u8qATJwdbJn+yO0/bRjSYdLmMAkwriCCM5xZYQmq2R4aB0wptvj6X4VSE8fv6SC16Z7A
	mMNwygMG5NbfHM7Imnf07jd6z2XgmXkGwy1rw8HKvtZXwyvJhLidlq7jiyzYznefHUOb
	8yxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=DyftTWdBdGYaM6PiS3I5lFJ70UFUBTsMRouN+yJHw78=;
	b=NqYme6RJzdKlpdrwyAL15Kx9TopAPQuWbuaOopjIENRcM7QtqQfyjqgxrsQCqPsdf8
	XJi/oIYBvcx5dqkeuZhhb90L/TMbeblm9s9VMC1oNMlCNxXFmlaA59ETLzp515/syME/
	6NSPkcGg6k1l2J0G6K3eM9NMNDtSFT2Qi9MFYNpj/lsEWAddpIFyoEG1N6y0MCfTJYPQ
	iutukudFVoTZzjz3Bb18CRf0Zird8K4eIjyy3XJduBbsZewIGc9QhvaMAdmhK2NxeImI
	bSVG/OYYVfYpLMWlHaer5uVQEZwpelMzQMBxIDVW9QRadKq50FNcxsFnPfkL7gRHtsMs
	hCsA==
X-Gm-Message-State: AN3rC/6O3ftt+6VfE06vzlBZ+Pv2AcL0tm8MJFRyNzzA+Aj5tm/iyeOo
	LmA1/+swXBx0db7p
X-Received: by 10.84.135.34 with SMTP id 31mr30002368pli.99.1493011294447;
	Sun, 23 Apr 2017 22:21:34 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	v13sm24001176pgo.44.2017.04.23.22.21.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 23 Apr 2017 22:21:33 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 23 Apr 2017 22:20:55 -0700
Message-Id: <20170424052058.4952-14-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.2
In-Reply-To: <20170424052058.4952-1-raj.khem@gmail.com>
References: <20170424052058.4952-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 14/17] mariadb: Upgrade to 5.5.55
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
X-List-Received-Date: Mon, 24 Apr 2017 05:21:33 -0000

Fix build with gcc7

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../{mariadb-native_5.5.52.bb => mariadb-native_5.5.55.bb}  |  0
 meta-oe/recipes-support/mysql/mariadb.inc                   |  5 +++--
 meta-oe/recipes-support/mysql/mariadb/gcc7.patch            | 13 +++++++++++++
 .../mysql/{mariadb_5.5.52.bb => mariadb_5.5.55.bb}          |  0
 4 files changed, 16 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/mysql/{mariadb-native_5.5.52.bb => mariadb-native_5.5.55.bb} (100%)
 create mode 100644 meta-oe/recipes-support/mysql/mariadb/gcc7.patch
 rename meta-oe/recipes-support/mysql/{mariadb_5.5.52.bb => mariadb_5.5.55.bb} (100%)

diff --git a/meta-oe/recipes-support/mysql/mariadb-native_5.5.52.bb b/meta-oe/recipes-support/mysql/mariadb-native_5.5.55.bb
similarity index 100%
rename from meta-oe/recipes-support/mysql/mariadb-native_5.5.52.bb
rename to meta-oe/recipes-support/mysql/mariadb-native_5.5.55.bb
diff --git a/meta-oe/recipes-support/mysql/mariadb.inc b/meta-oe/recipes-support/mysql/mariadb.inc
index 401907251..fd9dcbd1a 100644
--- a/meta-oe/recipes-support/mysql/mariadb.inc
+++ b/meta-oe/recipes-support/mysql/mariadb.inc
@@ -17,9 +17,10 @@ SRC_URI = "http://downloads.mariadb.com/MariaDB/mariadb-${PV}/source/mariadb-${P
            file://fix-a-building-failure.patch \
            file://change-cc-to-cc-version.patch \
            file://0001-disable-ucontext-on-musl.patch \
+           file://gcc7.patch \
           "
-SRC_URI[md5sum] = "fca86f1eaed2163b4bdce4f98f472324"
-SRC_URI[sha256sum] = "e142f9459507b97c5848042863b313ce70750118446bb4e35e5c07fe66007293"
+SRC_URI[md5sum] = "54a0bbbc9b67308e7c076622d02f0fcd"
+SRC_URI[sha256sum] = "cb94e315d0fc90c62db5a6c7829c9966f674285d99b3ba3ffa575fb4a26edc86"
 
 S = "${WORKDIR}/mariadb-${PV}"
 
diff --git a/meta-oe/recipes-support/mysql/mariadb/gcc7.patch b/meta-oe/recipes-support/mysql/mariadb/gcc7.patch
new file mode 100644
index 000000000..3e75b26c7
--- /dev/null
+++ b/meta-oe/recipes-support/mysql/mariadb/gcc7.patch
@@ -0,0 +1,13 @@
+Index: mariadb-5.5.55/client/mysql.cc
+===================================================================
+--- mariadb-5.5.55.orig/client/mysql.cc
++++ mariadb-5.5.55/client/mysql.cc
+@@ -2850,7 +2850,7 @@ You can turn off this feature to get a q
+         mysql_free_result(fields);
+         break;
+       }
+-      field_names[i][num_fields*2]= '\0';
++      field_names[i][num_fields*2][0]= '\0';
+       j=0;
+       while ((sql_field=mysql_fetch_field(fields)))
+       {
diff --git a/meta-oe/recipes-support/mysql/mariadb_5.5.52.bb b/meta-oe/recipes-support/mysql/mariadb_5.5.55.bb
similarity index 100%
rename from meta-oe/recipes-support/mysql/mariadb_5.5.52.bb
rename to meta-oe/recipes-support/mysql/mariadb_5.5.55.bb
-- 
2.12.2


