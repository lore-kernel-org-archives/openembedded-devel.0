Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f66.google.com (mail-pl0-f66.google.com
	[209.85.160.66])
	by mail.openembedded.org (Postfix) with ESMTP id 1A19572F42
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Feb 2018 21:33:29 +0000 (UTC)
Received: by mail-pl0-f66.google.com with SMTP id v3so8123683plg.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Feb 2018 13:33:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=OsSiWhE/LO/cEidoDibv0N6CWtMHLeHiFzwPV/8PB4I=;
	b=fxQ8kQ74VdBohqKPuBI9r4AouCW23GlgsENVwdrR1H7PASfLzVWyBHGxcy4iEUkVLC
	cokPzG8RiaPLyLmpJBQXH77OC3jjIWF58qYiwo+1xP5skSixdFvfoWnU2O/PXsea8PpR
	t2QjXzMPfdK8Q8VXx5I2gpA7sLOnV9xyNHE54oSt6KjrVlNsFLDaZGLPBv+FjEmhxSjf
	rIZW6k8WF6YRFbCy51qe51dCzbLERrkDlMoZlxlf4ChTE6mzTTP/GX/9HbYQKc2DsfVX
	sUSAv4Rg0WTX1TUvUGcD50s+0z9hed8eyxrltQlsJ+0vSETShW16r7Mb1OztaiOWwv1A
	oOQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=OsSiWhE/LO/cEidoDibv0N6CWtMHLeHiFzwPV/8PB4I=;
	b=Yvqp/l2n18NsTgQ4I470dn4H31zon57ArKxExYPPY6JIuj1WEoyGgySr7LqoO/Zvxc
	ee4qkqufpsGiIMEuSsPtgM0JcaJQGRqdg9ThhNwPqJHiLUAKI6Lc1tAwVtkF8aKpT7x6
	ywM6yrR8n5rVlr8oRksbKaAfv9qx3bEW72rtsm4iLfuWBQQhWl4iSXGniLzXk9yzz3Q9
	LuuJ2412seZcEy8BlzmDEWogadGwdL7Sdw+gn8ERhwS+Vj91lv8sBM5pekKDblvLZaqZ
	vBrbSEwqvoFUy86BoN2SuFvIJArcoqP2imVqRAvac3Oka7eqUMA4nPg4MCPvhh+k5/fv
	Cang==
X-Gm-Message-State: APf1xPA+nTvKVhzRzfRhhy8h74KCtxj48pS+adrKtWhJLs6uyFBoTr/W
	VbzfNnQOYy1ef1WzGdr6ld+7Hw==
X-Google-Smtp-Source: AH8x224aeA99qHqaotaA/kgl9SBfIHjU7KHelptnsYAq0k+f0WpzH7S1EgBZz20woNkhufGZfEUTCQ==
X-Received: by 2002:a17:902:7082:: with SMTP id
	z2-v6mr8631553plk.244.1519594411194; 
	Sun, 25 Feb 2018 13:33:31 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4000:1184:ad95:2a34:2e02:2fdf])
	by smtp.gmail.com with ESMTPSA id
	64sm12014600pgj.39.2018.02.25.13.33.30
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 25 Feb 2018 13:33:30 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 25 Feb 2018 13:32:54 -0800
Message-Id: <1519594406-24490-4-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1519594406-24490-1-git-send-email-akuster808@gmail.com>
References: <1519594406-24490-1-git-send-email-akuster808@gmail.com>
Subject: [meta-oe][PATCH 04/36] mysql: move to recipes-dbs
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
X-List-Received-Date: Sun, 25 Feb 2018 21:33:30 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/{recipes-support => recipes-dbs}/mysql/mariadb-native_5.5.57.bb   | 0
 meta-oe/{recipes-support => recipes-dbs}/mysql/mariadb.inc                | 0
 .../mysql/mariadb/0001-disable-ucontext-on-musl.patch                     | 0
 .../mysql/mariadb/change-cc-to-cc-version.patch                           | 0
 .../mysql/mariadb/configure.cmake-fix-valgrind.patch                      | 0
 .../mysql/mariadb/fix-a-building-failure.patch                            | 0
 .../mysql/mariadb/fix-cmake-module-path.patch                             | 0
 .../mysql/mariadb/fix-mysqlclient-r-version.patch                         | 0
 meta-oe/{recipes-support => recipes-dbs}/mysql/mariadb/install_db         | 0
 meta-oe/{recipes-support => recipes-dbs}/mysql/mariadb/install_db.service | 0
 meta-oe/{recipes-support => recipes-dbs}/mysql/mariadb/my.cnf             | 0
 .../{recipes-support => recipes-dbs}/mysql/mariadb/mysql-systemd-start    | 0
 meta-oe/{recipes-support => recipes-dbs}/mysql/mariadb/mysqld.service     | 0
 .../{recipes-support => recipes-dbs}/mysql/mariadb/remove-bad-path.patch  | 0
 meta-oe/{recipes-support => recipes-dbs}/mysql/mariadb_5.5.57.bb          | 0
 meta-oe/{recipes-support => recipes-dbs}/mysql/mysql-python_1.2.5.bb      | 0
 16 files changed, 0 insertions(+), 0 deletions(-)
 rename meta-oe/{recipes-support => recipes-dbs}/mysql/mariadb-native_5.5.57.bb (100%)
 rename meta-oe/{recipes-support => recipes-dbs}/mysql/mariadb.inc (100%)
 rename meta-oe/{recipes-support => recipes-dbs}/mysql/mariadb/0001-disable-ucontext-on-musl.patch (100%)
 rename meta-oe/{recipes-support => recipes-dbs}/mysql/mariadb/change-cc-to-cc-version.patch (100%)
 rename meta-oe/{recipes-support => recipes-dbs}/mysql/mariadb/configure.cmake-fix-valgrind.patch (100%)
 rename meta-oe/{recipes-support => recipes-dbs}/mysql/mariadb/fix-a-building-failure.patch (100%)
 rename meta-oe/{recipes-support => recipes-dbs}/mysql/mariadb/fix-cmake-module-path.patch (100%)
 rename meta-oe/{recipes-support => recipes-dbs}/mysql/mariadb/fix-mysqlclient-r-version.patch (100%)
 rename meta-oe/{recipes-support => recipes-dbs}/mysql/mariadb/install_db (100%)
 rename meta-oe/{recipes-support => recipes-dbs}/mysql/mariadb/install_db.service (100%)
 rename meta-oe/{recipes-support => recipes-dbs}/mysql/mariadb/my.cnf (100%)
 rename meta-oe/{recipes-support => recipes-dbs}/mysql/mariadb/mysql-systemd-start (100%)
 rename meta-oe/{recipes-support => recipes-dbs}/mysql/mariadb/mysqld.service (100%)
 rename meta-oe/{recipes-support => recipes-dbs}/mysql/mariadb/remove-bad-path.patch (100%)
 rename meta-oe/{recipes-support => recipes-dbs}/mysql/mariadb_5.5.57.bb (100%)
 rename meta-oe/{recipes-support => recipes-dbs}/mysql/mysql-python_1.2.5.bb (100%)

diff --git a/meta-oe/recipes-support/mysql/mariadb-native_5.5.57.bb b/meta-oe/recipes-dbs/mysql/mariadb-native_5.5.57.bb
similarity index 100%
rename from meta-oe/recipes-support/mysql/mariadb-native_5.5.57.bb
rename to meta-oe/recipes-dbs/mysql/mariadb-native_5.5.57.bb
diff --git a/meta-oe/recipes-support/mysql/mariadb.inc b/meta-oe/recipes-dbs/mysql/mariadb.inc
similarity index 100%
rename from meta-oe/recipes-support/mysql/mariadb.inc
rename to meta-oe/recipes-dbs/mysql/mariadb.inc
diff --git a/meta-oe/recipes-support/mysql/mariadb/0001-disable-ucontext-on-musl.patch b/meta-oe/recipes-dbs/mysql/mariadb/0001-disable-ucontext-on-musl.patch
similarity index 100%
rename from meta-oe/recipes-support/mysql/mariadb/0001-disable-ucontext-on-musl.patch
rename to meta-oe/recipes-dbs/mysql/mariadb/0001-disable-ucontext-on-musl.patch
diff --git a/meta-oe/recipes-support/mysql/mariadb/change-cc-to-cc-version.patch b/meta-oe/recipes-dbs/mysql/mariadb/change-cc-to-cc-version.patch
similarity index 100%
rename from meta-oe/recipes-support/mysql/mariadb/change-cc-to-cc-version.patch
rename to meta-oe/recipes-dbs/mysql/mariadb/change-cc-to-cc-version.patch
diff --git a/meta-oe/recipes-support/mysql/mariadb/configure.cmake-fix-valgrind.patch b/meta-oe/recipes-dbs/mysql/mariadb/configure.cmake-fix-valgrind.patch
similarity index 100%
rename from meta-oe/recipes-support/mysql/mariadb/configure.cmake-fix-valgrind.patch
rename to meta-oe/recipes-dbs/mysql/mariadb/configure.cmake-fix-valgrind.patch
diff --git a/meta-oe/recipes-support/mysql/mariadb/fix-a-building-failure.patch b/meta-oe/recipes-dbs/mysql/mariadb/fix-a-building-failure.patch
similarity index 100%
rename from meta-oe/recipes-support/mysql/mariadb/fix-a-building-failure.patch
rename to meta-oe/recipes-dbs/mysql/mariadb/fix-a-building-failure.patch
diff --git a/meta-oe/recipes-support/mysql/mariadb/fix-cmake-module-path.patch b/meta-oe/recipes-dbs/mysql/mariadb/fix-cmake-module-path.patch
similarity index 100%
rename from meta-oe/recipes-support/mysql/mariadb/fix-cmake-module-path.patch
rename to meta-oe/recipes-dbs/mysql/mariadb/fix-cmake-module-path.patch
diff --git a/meta-oe/recipes-support/mysql/mariadb/fix-mysqlclient-r-version.patch b/meta-oe/recipes-dbs/mysql/mariadb/fix-mysqlclient-r-version.patch
similarity index 100%
rename from meta-oe/recipes-support/mysql/mariadb/fix-mysqlclient-r-version.patch
rename to meta-oe/recipes-dbs/mysql/mariadb/fix-mysqlclient-r-version.patch
diff --git a/meta-oe/recipes-support/mysql/mariadb/install_db b/meta-oe/recipes-dbs/mysql/mariadb/install_db
similarity index 100%
rename from meta-oe/recipes-support/mysql/mariadb/install_db
rename to meta-oe/recipes-dbs/mysql/mariadb/install_db
diff --git a/meta-oe/recipes-support/mysql/mariadb/install_db.service b/meta-oe/recipes-dbs/mysql/mariadb/install_db.service
similarity index 100%
rename from meta-oe/recipes-support/mysql/mariadb/install_db.service
rename to meta-oe/recipes-dbs/mysql/mariadb/install_db.service
diff --git a/meta-oe/recipes-support/mysql/mariadb/my.cnf b/meta-oe/recipes-dbs/mysql/mariadb/my.cnf
similarity index 100%
rename from meta-oe/recipes-support/mysql/mariadb/my.cnf
rename to meta-oe/recipes-dbs/mysql/mariadb/my.cnf
diff --git a/meta-oe/recipes-support/mysql/mariadb/mysql-systemd-start b/meta-oe/recipes-dbs/mysql/mariadb/mysql-systemd-start
similarity index 100%
rename from meta-oe/recipes-support/mysql/mariadb/mysql-systemd-start
rename to meta-oe/recipes-dbs/mysql/mariadb/mysql-systemd-start
diff --git a/meta-oe/recipes-support/mysql/mariadb/mysqld.service b/meta-oe/recipes-dbs/mysql/mariadb/mysqld.service
similarity index 100%
rename from meta-oe/recipes-support/mysql/mariadb/mysqld.service
rename to meta-oe/recipes-dbs/mysql/mariadb/mysqld.service
diff --git a/meta-oe/recipes-support/mysql/mariadb/remove-bad-path.patch b/meta-oe/recipes-dbs/mysql/mariadb/remove-bad-path.patch
similarity index 100%
rename from meta-oe/recipes-support/mysql/mariadb/remove-bad-path.patch
rename to meta-oe/recipes-dbs/mysql/mariadb/remove-bad-path.patch
diff --git a/meta-oe/recipes-support/mysql/mariadb_5.5.57.bb b/meta-oe/recipes-dbs/mysql/mariadb_5.5.57.bb
similarity index 100%
rename from meta-oe/recipes-support/mysql/mariadb_5.5.57.bb
rename to meta-oe/recipes-dbs/mysql/mariadb_5.5.57.bb
diff --git a/meta-oe/recipes-support/mysql/mysql-python_1.2.5.bb b/meta-oe/recipes-dbs/mysql/mysql-python_1.2.5.bb
similarity index 100%
rename from meta-oe/recipes-support/mysql/mysql-python_1.2.5.bb
rename to meta-oe/recipes-dbs/mysql/mysql-python_1.2.5.bb
-- 
2.7.4


