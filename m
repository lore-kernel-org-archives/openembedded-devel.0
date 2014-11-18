Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 4217771FC7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Nov 2014 09:54:53 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id sAI9sphJ013651
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
	Tue, 18 Nov 2014 01:54:52 -0800 (PST)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.174.1; Tue, 18 Nov 2014 01:54:51 -0800
From: Kai Kang <kai.kang@windriver.com>
To: <martin.jansa@gmail.com>
Date: Tue, 18 Nov 2014 17:54:35 +0800
Message-ID: <1416304478-31307-1-git-send-email-kai.kang@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [128.224.153.152]
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH 0/3] V2: Upgrade mariadb from 5.5.39 to 5.5.40
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 18 Nov 2014 09:54:54 -0000
Content-Type: text/plain

V2 update:
* add PACKAGECONFIG libedit
* revert an commit for mariadb test suite which causes modphp and mysql-python fails
* Split config files into sub-packages rather than all together in mariadb-leftover
* add libevent as a dependency

Add this bundle of patches are rebased on orig/master + 

[oe] [meta-oe][PATCH] mariadb: Check valgrind headers only if WITH_VALGRIND is set


Kai Kang (3):
  Update mariadb from version 5.5.39 to 5.5.40
  mariadb: re-package configure files
  mariadb: add dependency libevent

 ...b-native_5.5.39.bb => mariadb-native_5.5.40.bb} |  4 +-
 .../mysql/{mariadb_5.5.39.inc => mariadb.inc}      | 17 +++++---
 meta-oe/recipes-support/mysql/mariadb/my.cnf       |  4 ++
 .../mysql/mariadb/revert-fix-for-MDEV-5120.patch   | 46 ++++++++++++++++++++++
 .../mysql/{mariadb_5.5.39.bb => mariadb_5.5.40.bb} |  5 +--
 5 files changed, 66 insertions(+), 10 deletions(-)
 rename meta-oe/recipes-support/mysql/{mariadb-native_5.5.39.bb => mariadb-native_5.5.40.bb} (82%)
 rename meta-oe/recipes-support/mysql/{mariadb_5.5.39.inc => mariadb.inc} (93%)
 create mode 100644 meta-oe/recipes-support/mysql/mariadb/revert-fix-for-MDEV-5120.patch
 rename meta-oe/recipes-support/mysql/{mariadb_5.5.39.bb => mariadb_5.5.40.bb} (88%)

-- 
1.9.1


