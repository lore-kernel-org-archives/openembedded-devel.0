Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 0DE1079558
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Sep 2018 15:55:35 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w8HFtawZ016059
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 17 Sep 2018 08:55:36 -0700 (PDT)
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Mon, 17 Sep 2018 08:55:35 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <raj.khem@gmail.com>
Date: Tue, 18 Sep 2018 00:05:09 +0800
Message-ID: <cover.1537199591.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH 00/19] 19 recipes to split one dpg package only
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
X-List-Received-Date: Mon, 17 Sep 2018 15:55:36 -0000
Content-Type: text/plain

Hi Khem,

As RP replied in previously oe-core mailing, one dbg package is
recommended, so I tweak them in oe one by one.

This pull request is one patch per recipe rather than merge them as
a large one, it may add your merging burden, but it is helpful for reviewing
and rework any of them without resend all.

But if you prefer one patch, I could resend V2.

//Hongxu
The following changes since commit a06c29be2f5bc204f965ee07298c34232c5c39fc:

  klibc: fix build with GCC and -pie for mips, mips64, aarch64 (2018-09-15 07:37:11 -0700)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib hongxu/dbg-split
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=hongxu/dbg-split

Hongxu Jia (19):
  fuse: split one dpg package only
  libtevent: split one dpg package
  libtdb: split one dpg package
  libtalloc: split one dpg package
  isomd5sum: split one dpg package
  gnuplot: split one dpg package
  scsirastools: split one dpg package
  konkretcmpi: split one dpg package
  gpsd: split one dpg package
  wvstreams: split one dpg package
  fontforge: split one dpg package
  xerces-c: split one dpg package
  v4l-utils: split one dpg package
  lmsensors: split one dpg package
  dbench: split one dpg package
  postgresql: split one dpg package
  mariadb: split one dpg package
  pidgin: split one dpg package
  syslog-ng: split one dpg package

 .../recipes-support/fuse/fuse_2.9.8.bb             |  8 +--
 .../recipes-support/libtalloc/libtalloc_2.1.14.bb  |  6 +-
 .../recipes-support/libtdb/libtdb_1.3.16.bb        |  5 +-
 .../recipes-support/libtevent/libtevent_0.9.37.bb  |  5 +-
 meta-oe/recipes-benchmark/dbench/dbench_4.0.bb     |  5 +-
 meta-oe/recipes-bsp/lm_sensors/lmsensors_3.4.0.bb  | 15 ++---
 .../recipes-connectivity/wvdial/wvstreams_4.6.1.bb | 14 ++--
 meta-oe/recipes-dbs/mysql/mariadb.inc              |  9 ++-
 meta-oe/recipes-dbs/postgresql/postgresql.inc      | 74 ++++++----------------
 .../recipes-devtools/xerces-c/xerces-c_3.1.4.bb    |  8 +--
 meta-oe/recipes-extended/gnuplot/gnuplot_5.2.2.bb  |  6 +-
 .../recipes-extended/isomd5sum/isomd5sum_1.2.3.bb  |  5 +-
 .../konkretcmpi/konkretcmpi_0.9.2.bb               |  5 +-
 .../scsirastools/scsirastools_1.6.6.bb             |  8 +--
 .../fontforge/fontforge_20170731.bb                |  5 +-
 .../v4l2apps/v4l-utils_1.12.3.bb                   |  5 +-
 meta-oe/recipes-navigation/gpsd/gpsd_3.17.bb       |  6 +-
 meta-oe/recipes-support/pidgin/pidgin_2.12.0.bb    |  9 +--
 meta-oe/recipes-support/syslog-ng/syslog-ng.inc    |  4 +-
 19 files changed, 81 insertions(+), 121 deletions(-)

-- 
2.7.4


