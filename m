Return-Path: <Changqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E5FD36B11A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Feb 2019 02:02:18 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x1L22JT1027101
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Feb 2019 18:02:19 -0800 (PST)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.435.0; Wed, 20 Feb 2019 18:02:19 -0800
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 21 Feb 2019 10:02:13 +0800
Message-ID: <1550714538-415016-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH 0/5] Upgrade recipes
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
X-List-Received-Date: Thu, 21 Feb 2019 02:02:19 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>


Changqing Li (5):
  postgresql: upgrade 1.11.1 -> 1.11.2
  smartmontools: upgrade 6.6 -> 7.0
  xf86-video-mga: upgrade 1.6.5 -> 2.0.0
  unixodbc: upgrade 2.3.6 -> 2.3.7
  uthash: upgrade 2.0.2 -> 2.1.0

 meta-oe/recipes-dbs/postgresql/postgresql_11.1.bb  | 10 --------
 meta-oe/recipes-dbs/postgresql/postgresql_11.2.bb  | 10 ++++++++
 ...p-Use-realpath-BSD-POSIX-instead-of-canon.patch | 28 ----------------------
 .../{smartmontools_6.6.bb => smartmontools_7.0.bb} |  5 ++--
 ...-video-mga_1.6.5.bb => xf86-video-mga_2.0.0.bb} |  4 ++--
 .../{unixodbc_2.3.6.bb => unixodbc_2.3.7.bb}       |  6 ++---
 .../uthash/{uthash_2.0.2.bb => uthash_2.1.0.bb}    |  6 ++---
 7 files changed, 20 insertions(+), 49 deletions(-)
 delete mode 100644 meta-oe/recipes-dbs/postgresql/postgresql_11.1.bb
 create mode 100644 meta-oe/recipes-dbs/postgresql/postgresql_11.2.bb
 delete mode 100644 meta-oe/recipes-extended/smartmontools/files/0001-os_linux.cpp-Use-realpath-BSD-POSIX-instead-of-canon.patch
 rename meta-oe/recipes-extended/smartmontools/{smartmontools_6.6.bb => smartmontools_7.0.bb} (89%)
 rename meta-oe/recipes-graphics/xorg-driver/{xf86-video-mga_1.6.5.bb => xf86-video-mga_2.0.0.bb} (81%)
 rename meta-oe/recipes-support/unixodbc/{unixodbc_2.3.6.bb => unixodbc_2.3.7.bb} (75%)
 rename meta-oe/recipes-support/uthash/{uthash_2.0.2.bb => uthash_2.1.0.bb} (85%)

-- 
2.7.4


