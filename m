Return-Path: <Changqing.Li@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 44EFF6D28F
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Nov 2018 09:39:45 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id wAR9dQmt020867
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Nov 2018 01:39:36 -0800
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Tue, 27 Nov 2018 01:39:15 -0800
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 27 Nov 2018 17:39:07 +0800
Message-ID: <1543311554-293342-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [meta-oe][PATCH 0/7] *** Upgrade 7 recipes ***
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
X-List-Received-Date: Tue, 27 Nov 2018 09:39:45 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

*** BLURB HERE ***

Changqing Li (7):
  sg3-utils: upgrade to 1.44
  satyr: upgrade to 0.27
  multipath-tools: upgrade to 0.7.9
  pangomm: upgrade to 2.42.0
  libblockdev: upgrade to 2.20
  postgresql: upgrade to 11.1
  phoronix-test-suite: upgrade to 8.2.0

 ...suite_8.0.1.bb => phoronix-test-suite_8.2.0.bb} |    4 +-
 ...py-of-the-timezone-library-with-IANA-rele.patch | 1164 ----
 ...e-zone-data-files-to-tzdata-release-2018f.patch | 6452 --------------------
 .../postgresql/files/not-check-libperl.patch       |   25 +-
 meta-oe/recipes-dbs/postgresql/postgresql_10.5.bb  |   12 -
 meta-oe/recipes-dbs/postgresql/postgresql_11.1.bb  |   10 +
 .../{libblockdev_2.18.bb => libblockdev_2.20.bb}   |    2 +-
 .../pango/{pangomm_2.40.1.bb => pangomm_2.42.0.bb} |    4 +-
 ...ools-add-RDAC-SUN-ArrayStorage-to-hwtable.patch |   42 -
 ...ools-remove-c-from-__cpluscplus-misspelle.patch |   33 -
 ...ools-remove-emacs-autoconfig-of-kpartx-gp.patch |   43 -
 ...ools-replace-FSF-address-with-a-www-point.patch |  191 -
 ...ools-Remove-trailing-leading-whitespaces-.patch |  156 -
 ...path-tools-fix-compilation-with-musl-libc.patch |   58 -
 ...ools-add-x-to-doc-preclean.pl-and-split-m.patch |   27 -
 ...ools-refresh-kernel-doc-from-kernel-sourc.patch |  784 ---
 ...ools-configure-hitachi-ams2000-and-hus100.patch |   56 -
 ...ath-don-t-reject-maps-with-undefined-prio.patch |   42 -
 ...ltipathd-handle-errors-in-uxlsnr-as-fatal.patch |   57 -
 ...h-fix-error-parsing-find_multipaths-stric.patch |   36 -
 ...h-print-correct-default-for-delay_-_check.patch |   40 -
 ...onf.5-clarify-property-whitelist-handling.patch |   31 -
 .../0015-mpathpersist-add-all_tg_pt-option.patch   |  317 -
 .../files/0016-libmultipath-remove-rbd-code.patch  | 1093 ----
 .../0017-mpathpersist-fix-aptpl-support.patch      |  543 --
 ...ath-don-t-check-timestamps-without-a-path.patch |   34 -
 ...-libmultipath-fix-detect-alua-corner-case.patch |   35 -
 .../0020-multipath-fix-setting-conf-version.patch  |   39 -
 ...-the-property-blacklist-exception-builtin.patch |   91 +-
 ...0023-RH-don-t-start-without-a-config-file.patch |   51 +-
 .../0024-RH-use-rpm-optflags-if-present.patch      |   53 +-
 .../files/0025-RH-add-mpathconf.patch              |   22 +-
 ...ds-from-kernel-cmdline-mpath.wwids-with-A.patch |  134 +-
 ...-warn-on-invalid-regex-instead-of-failing.patch |   76 +-
 ...reset-default-find_mutipaths-value-to-off.patch |   21 +-
 ...ools-modify-Makefile.inc-for-cross-compil.patch |   18 +-
 .../files/0030-Always-use-devmapper.patch          |   11 +-
 .../0031-Always-use-devmapper-for-kpartx.patch     |    9 +-
 ...ath-tools_0.7.7.bb => multipath-tools_0.7.9.bb} |   22 +-
 .../satyr/{satyr_0.26.bb => satyr_0.27.bb}         |    2 +-
 .../sg3-utils/sg3-utils/glibc-2.28.patch           |   24 -
 .../{sg3-utils_1.42.bb => sg3-utils_1.44.bb}       |    5 +-
 42 files changed, 296 insertions(+), 11573 deletions(-)
 rename meta-oe/recipes-benchmark/phoronix-test-suite/{phoronix-test-suite_8.0.1.bb => phoronix-test-suite_8.2.0.bb} (90%)
 delete mode 100644 meta-oe/recipes-dbs/postgresql/files/0001-Sync-our-copy-of-the-timezone-library-with-IANA-rele.patch
 delete mode 100644 meta-oe/recipes-dbs/postgresql/files/0001-Update-time-zone-data-files-to-tzdata-release-2018f.patch
 delete mode 100644 meta-oe/recipes-dbs/postgresql/postgresql_10.5.bb
 create mode 100644 meta-oe/recipes-dbs/postgresql/postgresql_11.1.bb
 rename meta-oe/recipes-extended/libblockdev/{libblockdev_2.18.bb => libblockdev_2.20.bb} (97%)
 rename meta-oe/recipes-graphics/pango/{pangomm_2.40.1.bb => pangomm_2.42.0.bb} (83%)
 delete mode 100644 meta-oe/recipes-support/multipath-tools/files/0001-multipath-tools-add-RDAC-SUN-ArrayStorage-to-hwtable.patch
 delete mode 100644 meta-oe/recipes-support/multipath-tools/files/0002-multipath-tools-remove-c-from-__cpluscplus-misspelle.patch
 delete mode 100644 meta-oe/recipes-support/multipath-tools/files/0003-multipath-tools-remove-emacs-autoconfig-of-kpartx-gp.patch
 delete mode 100644 meta-oe/recipes-support/multipath-tools/files/0004-multipath-tools-replace-FSF-address-with-a-www-point.patch
 delete mode 100644 meta-oe/recipes-support/multipath-tools/files/0005-multipath-tools-Remove-trailing-leading-whitespaces-.patch
 delete mode 100644 meta-oe/recipes-support/multipath-tools/files/0006-multipath-tools-fix-compilation-with-musl-libc.patch
 delete mode 100644 meta-oe/recipes-support/multipath-tools/files/0007-multipath-tools-add-x-to-doc-preclean.pl-and-split-m.patch
 delete mode 100644 meta-oe/recipes-support/multipath-tools/files/0008-multipath-tools-refresh-kernel-doc-from-kernel-sourc.patch
 delete mode 100644 meta-oe/recipes-support/multipath-tools/files/0009-multipath-tools-configure-hitachi-ams2000-and-hus100.patch
 delete mode 100644 meta-oe/recipes-support/multipath-tools/files/0010-libmultipath-don-t-reject-maps-with-undefined-prio.patch
 delete mode 100644 meta-oe/recipes-support/multipath-tools/files/0011-multipathd-handle-errors-in-uxlsnr-as-fatal.patch
 delete mode 100644 meta-oe/recipes-support/multipath-tools/files/0012-libmultipath-fix-error-parsing-find_multipaths-stric.patch
 delete mode 100644 meta-oe/recipes-support/multipath-tools/files/0013-libmultipath-print-correct-default-for-delay_-_check.patch
 delete mode 100644 meta-oe/recipes-support/multipath-tools/files/0014-multipath.conf.5-clarify-property-whitelist-handling.patch
 delete mode 100644 meta-oe/recipes-support/multipath-tools/files/0015-mpathpersist-add-all_tg_pt-option.patch
 delete mode 100644 meta-oe/recipes-support/multipath-tools/files/0016-libmultipath-remove-rbd-code.patch
 delete mode 100644 meta-oe/recipes-support/multipath-tools/files/0017-mpathpersist-fix-aptpl-support.patch
 delete mode 100644 meta-oe/recipes-support/multipath-tools/files/0018-multipath-don-t-check-timestamps-without-a-path.patch
 delete mode 100644 meta-oe/recipes-support/multipath-tools/files/0019-libmultipath-fix-detect-alua-corner-case.patch
 delete mode 100644 meta-oe/recipes-support/multipath-tools/files/0020-multipath-fix-setting-conf-version.patch
 rename meta-oe/recipes-support/multipath-tools/{multipath-tools_0.7.7.bb => multipath-tools_0.7.9.bb} (72%)
 rename meta-oe/recipes-support/satyr/{satyr_0.26.bb => satyr_0.27.bb} (94%)
 delete mode 100644 meta-oe/recipes-support/sg3-utils/sg3-utils/glibc-2.28.patch
 rename meta-oe/recipes-support/sg3-utils/{sg3-utils_1.42.bb => sg3-utils_1.44.bb} (78%)

-- 
2.7.4


