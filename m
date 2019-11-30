Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
	[209.85.214.177])
	by mail.openembedded.org (Postfix) with ESMTP id 3024F7F8A0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 30 Nov 2019 18:10:54 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id ay6so14264777plb.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 30 Nov 2019 10:10:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=r6uTC/kbaIOmUtwTvt+4PniDem4sW0XC0PfdkdNS7TA=;
	b=SPGErP/JKCM17WSax+UoSDQnD2YRkPgi7AznCYBnyHFFqiB4TsMsUO0/rdTkRJMMJ4
	x3VFL99T15dd9VQLy9lswdhwhLVjCzkC5dLnd8cQWvqaRXdvmWQK3a+9VQTPT0a63dG/
	uZ+n7AtLeRfMqtxr6NDLY/EtWlRVXrFA7YBtLST3U7HVm6uhsZ7Upil6oPU/ecet9GYE
	MMFR52Jim7livu4CtqLY/2hsFWLBTfUOI9BNu3FyGpyTbP+B6WZIL7KVVwOEvXXmhgt5
	uMaL0fw5fnkpp/IWizMAAoT3k29KOnI16V59nm6vprJXvA36cuTCp8kIOZxcGE4C/LQq
	jLTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=r6uTC/kbaIOmUtwTvt+4PniDem4sW0XC0PfdkdNS7TA=;
	b=UygeJHyzcyNgwTFqRfRkSJORSHdfrYcziavhh0OKsMbEgXI9CVCp935HVIrRHkLr4H
	dA/FjAW7isSFxdBLFgY050Vjy8qBApAc61lXIEuz3EozybbifdEwoIIhFdeQBeZz35SG
	7/Aejv0iMd3IboZ0W2A8TPda6pyHPZrSZfKdXua4sVK7In5EBRLlY44DEm4if5KfPE0/
	ReBr5MGS5goPlU0c4KK0xfIDcUZLztHQOHGOX5YDv/PQTRZsUK/ooEwD0idFchQX0Jn7
	wvgFcZ4cJWjYXvMaN4ZpS3H8zsvdl5nf7bA3Rj7j9n30/0DbWyOeXy50Pz8/IbXATV73
	Lm3A==
X-Gm-Message-State: APjAAAWrU0BxDcDtpEp+GT/wVW42eQ8zNLCJZjqpvJzUotFmpN0LmDaI
	vpSH+v2y9VyOI/WYalypGQUN35vN
X-Google-Smtp-Source: APXvYqz0LxF9BzYDEnI0HGh0TTY5g9d55ivXiRWiyNcW6vvhKd6g76WIWdikLg9eTBj8snqE6YkTSQ==
X-Received: by 2002:a17:90a:db43:: with SMTP id
	u3mr25897821pjx.56.1575137455104; 
	Sat, 30 Nov 2019 10:10:55 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0:c050:b516:8fc6:8cbf])
	by smtp.gmail.com with ESMTPSA id d6sm490762pju.8.2019.11.30.10.10.54
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 30 Nov 2019 10:10:54 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 30 Nov 2019 10:10:36 -0800
Message-Id: <c151fb020b60f165b704974f5160805d6e19ddf0.1575137343.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1575137343.git.akuster808@gmail.com>
References: <cover.1575137343.git.akuster808@gmail.com>
Subject: [PATCH 06/15] mariadb: upgrade 10.3.16 -> 10.3.18
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
X-List-Received-Date: Sat, 30 Nov 2019 18:10:54 -0000

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
---
 .../mysql/{mariadb-native_10.3.16.bb => mariadb-native_10.3.18.bb}    | 0
 meta-oe/recipes-dbs/mysql/mariadb.inc                                 | 4 ++--
 meta-oe/recipes-dbs/mysql/{mariadb_10.3.16.bb => mariadb_10.3.18.bb}  | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-dbs/mysql/{mariadb-native_10.3.16.bb => mariadb-native_10.3.18.bb} (100%)
 rename meta-oe/recipes-dbs/mysql/{mariadb_10.3.16.bb => mariadb_10.3.18.bb} (100%)

diff --git a/meta-oe/recipes-dbs/mysql/mariadb-native_10.3.16.bb b/meta-oe/recipes-dbs/mysql/mariadb-native_10.3.18.bb
similarity index 100%
rename from meta-oe/recipes-dbs/mysql/mariadb-native_10.3.16.bb
rename to meta-oe/recipes-dbs/mysql/mariadb-native_10.3.18.bb
diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/mysql/mariadb.inc
index f1c71fe..e1ae58a 100644
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
2.7.4


