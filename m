Return-Path: <Changqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1B4ED7E9A0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Jun 2019 01:48:11 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x5S1mCT9014692
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Jun 2019 18:48:12 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.439.0; Thu, 27 Jun 2019 18:48:11 -0700
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 28 Jun 2019 09:48:04 +0800
Message-ID: <1561686490-12445-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH 0/6] Upgrade 5 packages build with waf
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
X-List-Received-Date: Fri, 28 Jun 2019 01:48:11 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

1. refer below link:
https://github.com/samba-team/samba/commit/63d20d7822ead1626f7cb41fdbae6c9300893314#diff-ddc0f7d4ad007f8ee36297b5887dcd24
waf switch to default use python3, so switch waf-samba.bbclass to python3 
and also upgrade 5 recipes that use waf to switch to python3
2. After upgrade, waf have a bug when cross-compile, fix for all the recipes

Changqing Li (6):
  waf-samba: switch to python3
  libldb: upgrade 1.4.1 -> 1.6.3
  libtevent: upgrade 0.9.37 -> 0.10.0
  libtdb: upgrade 1.3.17 -> 1.4.0
  libtalloc: upgrade 2.1.14 -> 2.2.0
  samba: upgrade 4.8.12 -> 4.10.5

 meta-networking/classes/waf-samba.bbclass          |  6 +--
 .../waf-cross-answers/cross-answers-aarch64.txt    |  1 +
 .../waf-cross-answers/cross-answers-aarch64_be.txt |  1 +
 .../files/waf-cross-answers/cross-answers-arm.txt  |  1 +
 .../waf-cross-answers/cross-answers-armeb.txt      |  1 +
 .../files/waf-cross-answers/cross-answers-i586.txt |  1 +
 .../files/waf-cross-answers/cross-answers-i686.txt |  1 +
 .../files/waf-cross-answers/cross-answers-mips.txt |  1 +
 .../waf-cross-answers/cross-answers-mips64.txt     |  1 +
 .../waf-cross-answers/cross-answers-mips64el.txt   |  1 +
 .../waf-cross-answers/cross-answers-mipsel.txt     |  1 +
 .../waf-cross-answers/cross-answers-powerpc.txt    |  1 +
 .../waf-cross-answers/cross-answers-powerpc64.txt  |  1 +
 .../waf-cross-answers/cross-answers-riscv64.txt    |  1 +
 .../waf-cross-answers/cross-answers-x86_64.txt     |  1 +
 .../samba}/0001-libldb-fix-config-error.patch      | 49 +++++++++--------
 ...0001-pyldb-util-don-t-use-PYTHON-ABI-FLAG.patch | 35 ++++++++++++
 .../0001-samba-fix-musl-lib-without-innetgr.patch  | 42 +++++++++++++++
 .../0001-waf-add-support-of-cross_compile.patch    | 62 ++++++++++++++++++++++
 ...-import-target-module-while-cross-compile.patch | 59 +++++++++++---------
 ...rt-target-module-while-cross-compile.patch.bak} | 55 ++++++++++---------
 .../21-add-config-option-without-valgrind.patch    | 48 ++++++-----------
 .../samba/samba/glibc_only.patch                   | 29 +++++++---
 .../samba/{samba_4.8.12.bb => samba_4.10.5.bb}     | 42 ++++++++++-----
 .../0001-waf-add-support-of-cross_compile.patch    | 62 ++++++++++++++++++++++
 ...-import-target-module-while-cross-compile.patch | 56 +++++++++----------
 .../libldb/libldb/options-1.4.1.patch              | 56 +++++++++----------
 .../libldb/{libldb_1.4.1.bb => libldb_1.6.3.bb}    | 22 ++++----
 .../0001-waf-add-support-of-cross_compile.patch    | 62 ++++++++++++++++++++++
 .../{options-2.1.14.patch => options-2.2.0.patch}  | 47 ++++++++--------
 .../{libtalloc_2.1.14.bb => libtalloc_2.2.0.bb}    | 13 +++--
 ...akefile-fix-problem-that-waf-cannot-found.patch | 35 ------------
 .../libtdb/do-not-check-xsltproc-manpages.patch    | 26 ++++++---
 .../tdb-Add-configure-options-for-packages.patch   | 33 +++++-------
 .../libtdb/{libtdb_1.3.17.bb => libtdb_1.4.0.bb}   | 22 +++++---
 .../0001-waf-add-support-of-cross_compile.patch    | 62 ++++++++++++++++++++++
 .../{options-0.9.36.patch => options-0.10.0.patch} | 62 ++++++++++------------
 .../{libtevent_0.9.37.bb => libtevent_0.10.0.bb}   | 26 ++++++---
 38 files changed, 688 insertions(+), 337 deletions(-)
 rename meta-networking/{recipes-support/libldb/libldb => recipes-connectivity/samba/samba}/0001-libldb-fix-config-error.patch (86%)
 create mode 100644 meta-networking/recipes-connectivity/samba/samba/0001-pyldb-util-don-t-use-PYTHON-ABI-FLAG.patch
 create mode 100644 meta-networking/recipes-connectivity/samba/samba/0001-samba-fix-musl-lib-without-innetgr.patch
 create mode 100644 meta-networking/recipes-connectivity/samba/samba/0001-waf-add-support-of-cross_compile.patch
 copy meta-networking/{recipes-support/libldb/libldb/do-not-import-target-module-while-cross-compile.patch => recipes-connectivity/samba/samba/20-do-not-import-target-module-while-cross-compile.patch.bak} (53%)
 rename meta-networking/recipes-connectivity/samba/{samba_4.8.12.bb => samba_4.10.5.bb} (88%)
 create mode 100644 meta-networking/recipes-support/libldb/libldb/0001-waf-add-support-of-cross_compile.patch
 rename meta-networking/recipes-support/libldb/{libldb_1.4.1.bb => libldb_1.6.3.bb} (79%)
 create mode 100644 meta-networking/recipes-support/libtalloc/libtalloc/0001-waf-add-support-of-cross_compile.patch
 rename meta-networking/recipes-support/libtalloc/libtalloc/{options-2.1.14.patch => options-2.2.0.patch} (87%)
 rename meta-networking/recipes-support/libtalloc/{libtalloc_2.1.14.bb => libtalloc_2.2.0.bb} (80%)
 delete mode 100644 meta-networking/recipes-support/libtdb/libtdb/0001-Makefile-fix-problem-that-waf-cannot-found.patch
 rename meta-networking/recipes-support/libtdb/{libtdb_1.3.17.bb => libtdb_1.4.0.bb} (69%)
 create mode 100644 meta-networking/recipes-support/libtevent/libtevent/0001-waf-add-support-of-cross_compile.patch
 rename meta-networking/recipes-support/libtevent/libtevent/{options-0.9.36.patch => options-0.10.0.patch} (82%)
 rename meta-networking/recipes-support/libtevent/{libtevent_0.9.37.bb => libtevent_0.10.0.bb} (60%)

-- 
2.7.4


