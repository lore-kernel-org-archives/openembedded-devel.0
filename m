Return-Path: <biannm@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id E9493722D4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Nov 2014 08:52:59 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.04,848,1406563200"; d="scan'208";a="44140438"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 28 Nov 2014 16:49:40 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id sAS8qbsG008569
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Nov 2014 16:52:38 +0800
Received: from localhost.localdomain (10.167.226.31) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Fri, 28 Nov 2014 16:53:01 +0800
From: Bian Naimeng <biannm@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 28 Nov 2014 16:49:42 +0800
Message-ID: <1417164585-46087-1-git-send-email-biannm@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.31]
Subject: [PATCH 0/3] add some recipes
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
X-List-Received-Date: Fri, 28 Nov 2014 08:53:02 -0000
Content-Type: text/plain

Bian Naimeng (3):
  [meta-oe] daemontools: add recipe
  [meta-oe] dmraid: add recipe
  [meta-oe] drbd: add recipe

 .../recipes-extended/dmraid/dmraid_1.0.0.rc16.bb   |  71 +++++
 .../dmraid/files/01_fix_broken_linking.patch       | 121 +++++++++
 .../dmraid/files/02_disable_dmreg.patch            | 134 ++++++++++
 .../files/03_fix_hyphen-used-as-minus-sign.patch   | 291 +++++++++++++++++++++
 .../dmraid/files/04_promise-add-offsets.patch      |  13 +
 .../dmraid/files/05_exit_code.patch                |  22 ++
 .../dmraid/files/06_support_virtio_devices.patch   |  13 +
 .../dmraid/files/07_isw-probe-hpa.patch            | 144 ++++++++++
 .../files/08_activate_multiple_raid_sets.patch     |  12 +
 .../dmraid/files/09_pdc_raid10_failure..patch      |  14 +
 .../dmraid/files/10_ddf1_lsi_persistent_name.patch |  20 ++
 .../files/11_fix_isw_sectors_calculation.patch     |  14 +
 .../dmraid/files/12_jmicron_namefix.patch          |  20 ++
 .../dmraid/files/13_fix_testing.patch              |  24 ++
 .../files/14_pdc_dump_extended_metadata.patch      | 147 +++++++++++
 .../15_drop_p_for_partition_conditional.patch      |  31 +++
 .../dmraid/files/16_change-uuid.patch              |  77 ++++++
 .../files/17_convert-dmraid45-to-dmraid.patch      | 273 +++++++++++++++++++
 .../dmraid/files/18_ignore-too-small-devices.patch |  39 +++
 .../files/19_compile-dmraid-in-subdir-tools.patch  |  20 ++
 .../20_specifies-install-dir-by-DESTDIR.patch      | 123 +++++++++
 meta-oe/recipes-extended/drbd/drbd_8.4.4.bb        |  57 ++++
 meta-oe/recipes-extended/drbd/files/drbd.service   |  12 +
 ...or.h-include-errno.h-instead-of-extern-int.diff |  25 ++
 ....c-.-supervise-may-be-a-symlink-if-it-s-da.diff |  47 ++++
 .../daemontools/daemontools/cross-compile.patch    |  45 ++++
 .../daemontools/daemontools_0.76.bb                |  47 ++++
 27 files changed, 1856 insertions(+)
 create mode 100644 meta-oe/recipes-extended/dmraid/dmraid_1.0.0.rc16.bb
 create mode 100644 meta-oe/recipes-extended/dmraid/files/01_fix_broken_linking.patch
 create mode 100644 meta-oe/recipes-extended/dmraid/files/02_disable_dmreg.patch
 create mode 100644 meta-oe/recipes-extended/dmraid/files/03_fix_hyphen-used-as-minus-sign.patch
 create mode 100644 meta-oe/recipes-extended/dmraid/files/04_promise-add-offsets.patch
 create mode 100644 meta-oe/recipes-extended/dmraid/files/05_exit_code.patch
 create mode 100644 meta-oe/recipes-extended/dmraid/files/06_support_virtio_devices.patch
 create mode 100644 meta-oe/recipes-extended/dmraid/files/07_isw-probe-hpa.patch
 create mode 100644 meta-oe/recipes-extended/dmraid/files/08_activate_multiple_raid_sets.patch
 create mode 100644 meta-oe/recipes-extended/dmraid/files/09_pdc_raid10_failure..patch
 create mode 100644 meta-oe/recipes-extended/dmraid/files/10_ddf1_lsi_persistent_name.patch
 create mode 100644 meta-oe/recipes-extended/dmraid/files/11_fix_isw_sectors_calculation.patch
 create mode 100644 meta-oe/recipes-extended/dmraid/files/12_jmicron_namefix.patch
 create mode 100644 meta-oe/recipes-extended/dmraid/files/13_fix_testing.patch
 create mode 100644 meta-oe/recipes-extended/dmraid/files/14_pdc_dump_extended_metadata.patch
 create mode 100644 meta-oe/recipes-extended/dmraid/files/15_drop_p_for_partition_conditional.patch
 create mode 100644 meta-oe/recipes-extended/dmraid/files/16_change-uuid.patch
 create mode 100644 meta-oe/recipes-extended/dmraid/files/17_convert-dmraid45-to-dmraid.patch
 create mode 100644 meta-oe/recipes-extended/dmraid/files/18_ignore-too-small-devices.patch
 create mode 100644 meta-oe/recipes-extended/dmraid/files/19_compile-dmraid-in-subdir-tools.patch
 create mode 100644 meta-oe/recipes-extended/dmraid/files/20_specifies-install-dir-by-DESTDIR.patch
 create mode 100644 meta-oe/recipes-extended/drbd/drbd_8.4.4.bb
 create mode 100644 meta-oe/recipes-extended/drbd/files/drbd.service
 create mode 100644 meta-oe/recipes-support/daemontools/daemontools/0001-error.h-include-errno.h-instead-of-extern-int.diff
 create mode 100644 meta-oe/recipes-support/daemontools/daemontools/0002-supervise.c-.-supervise-may-be-a-symlink-if-it-s-da.diff
 create mode 100644 meta-oe/recipes-support/daemontools/daemontools/cross-compile.patch
 create mode 100644 meta-oe/recipes-support/daemontools/daemontools_0.76.bb

-- 
1.9.1


