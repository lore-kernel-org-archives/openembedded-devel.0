Return-Path: <Changqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6303F7E7BF
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  2 Jul 2019 01:58:12 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x621wDqo026387
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 1 Jul 2019 18:58:13 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.439.0; Mon, 1 Jul 2019 18:58:13 -0700
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 2 Jul 2019 09:58:05 +0800
Message-ID: <1562032691-128301-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [meta-networking][PATCH 0/6 V2] Upgrade 5 packages build with waf
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
X-List-Received-Date: Tue, 02 Jul 2019 01:58:12 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

1. refer below link:
https://github.com/samba-team/samba/commit/63d20d7822ead1626f7cb41fdbae6c9300893314#diff-ddc0f7d4ad007f8ee36297b5887dcd24
waf switch to default use python3, so switch waf-samba.bbclass to python3 
and also upgrade 5 recipes that use waf to switch to python3
2. After upgrade, waf have a bug when cross-compile, fix for all the recipe


Changqing Li (6):
  waf-samba: switch to python3
  libldb: upgrade 1.4.1 -> 1.5.4
  libtevent: upgrade 0.9.37 -> 0.10.0
  libtdb: upgrade 1.3.17 -> 1.4.0
  libtalloc: upgrade 2.1.14 -> 2.2.0
  samba: upgrade 4.8.12 -> 4.10.5

 meta-networking/classes/waf-samba.bbclass          |  6 +-
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
 .../0001-samba-fix-musl-lib-without-innetgr.patch  | 42 +++++++++++
 .../0001-waf-add-support-of-cross_compile.patch    | 62 +++++++++++++++
 ...-import-target-module-while-cross-compile.patch | 59 ++++++++-------
 .../21-add-config-option-without-valgrind.patch    | 48 +++++-------
 .../samba/samba/glibc_only.patch                   | 29 ++++++--
 .../samba/{samba_4.8.12.bb => samba_4.10.5.bb}     | 52 ++++++-------
 .../libldb/0001-libldb-fix-config-error.patch      | 87 ----------------------
 .../0001-waf-add-support-of-cross_compile.patch    | 62 +++++++++++++++
 ...-import-target-module-while-cross-compile.patch | 56 +++++++-------
 .../{options-1.4.1.patch => options-1.5.4.patch}   | 67 +++++++----------
 .../libldb/{libldb_1.4.1.bb => libldb_1.5.4.bb}    | 24 +++---
 .../0001-waf-add-support-of-cross_compile.patch    | 62 +++++++++++++++
 .../{options-2.1.14.patch => options-2.2.0.patch}  | 47 ++++++------
 .../{libtalloc_2.1.14.bb => libtalloc_2.2.0.bb}    | 13 +++-
 ...akefile-fix-problem-that-waf-cannot-found.patch | 35 ---------
 .../libtdb/do-not-check-xsltproc-manpages.patch    | 15 ----
 .../tdb-Add-configure-options-for-packages.patch   | 33 ++++----
 .../libtdb/{libtdb_1.3.17.bb => libtdb_1.4.0.bb}   | 21 ++++--
 .../0001-waf-add-support-of-cross_compile.patch    | 62 +++++++++++++++
 .../{options-0.9.36.patch => options-0.10.0.patch} | 62 +++++++--------
 .../{libtevent_0.9.37.bb => libtevent_0.10.0.bb}   | 26 +++++--
 36 files changed, 580 insertions(+), 404 deletions(-)
 create mode 100644 meta-networking/recipes-connectivity/samba/samba/0001-samba-fix-musl-lib-without-innetgr.patch
 create mode 100644 meta-networking/recipes-connectivity/samba/samba/0001-waf-add-support-of-cross_compile.patch
 rename meta-networking/recipes-connectivity/samba/{samba_4.8.12.bb => samba_4.10.5.bb} (89%)
 delete mode 100644 meta-networking/recipes-support/libldb/libldb/0001-libldb-fix-config-error.patch
 create mode 100644 meta-networking/recipes-support/libldb/libldb/0001-waf-add-support-of-cross_compile.patch
 rename meta-networking/recipes-support/libldb/libldb/{options-1.4.1.patch => options-1.5.4.patch} (79%)
 rename meta-networking/recipes-support/libldb/{libldb_1.4.1.bb => libldb_1.5.4.bb} (79%)
 create mode 100644 meta-networking/recipes-support/libtalloc/libtalloc/0001-waf-add-support-of-cross_compile.patch
 rename meta-networking/recipes-support/libtalloc/libtalloc/{options-2.1.14.patch => options-2.2.0.patch} (87%)
 rename meta-networking/recipes-support/libtalloc/{libtalloc_2.1.14.bb => libtalloc_2.2.0.bb} (80%)
 delete mode 100644 meta-networking/recipes-support/libtdb/libtdb/0001-Makefile-fix-problem-that-waf-cannot-found.patch
 delete mode 100644 meta-networking/recipes-support/libtdb/libtdb/do-not-check-xsltproc-manpages.patch
 rename meta-networking/recipes-support/libtdb/{libtdb_1.3.17.bb => libtdb_1.4.0.bb} (71%)
 create mode 100644 meta-networking/recipes-support/libtevent/libtevent/0001-waf-add-support-of-cross_compile.patch
 rename meta-networking/recipes-support/libtevent/libtevent/{options-0.9.36.patch => options-0.10.0.patch} (82%)
 rename meta-networking/recipes-support/libtevent/{libtevent_0.9.37.bb => libtevent_0.10.0.bb} (60%)

-- 
2.7.4


