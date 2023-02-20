Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46928C636CC
	for <webhook@archiver.kernel.org>; Mon, 20 Feb 2023 07:42:38 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web11.8112.1676878953361430931
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 19 Feb 2023 23:42:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=QjckGlGt;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1676878951; i=@fujitsu.com;
	bh=lJTA52cndi2q05WiN8ju/l5lzoUOo3QDrV74o2wNqCc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=QjckGlGttEwm3a/LHbIprV+4hq6ms0LniDcsXfJ2RTzDmaVXUSB6X37o3CRMwk2wQ
	 5sh/FrUFhWjY4MYSLwjDh7TLJ7kiRFOjr+1x3MinNCF3Grlhgw3CmkzYk3qusksQzH
	 nmCIwxOV3Y3pgs3iGrwn057n3dJa9ryRft6tXkWaDYXppzV+iCMbpEnJrrTMM3nn2h
	 JnlkYQ3g7cQPLnJ3rxtr/jtdfKjZwi8yXjSvyx/1m3LsEeMPl4cpOJoulV00IZQp6n
	 ZBNQgBdqDCFHqUSm+4Y6/ieQoeTAL4swxoojIx3cSRoDs0CRp0rhkRrV/E2nhSXDS6
	 AEsLVbncsnZzA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrOIsWRWlGSWpSXmKPExsViZ8MxSTdN5XO
  ywbWZVhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8aS1cfZC65ZVDxe/pK9gfG6XhcjF4eQwBNG
  ic8tTawQzg0mibYLp9ggnL2MElOOL2LsYuTkYBOQkrhx/z8biC0ioC+xdPYeZhCbWUBF4sXvH
  vYuRg4OYQF7ia3L60DCLAKqEhM/3WQCsXkFnCRePWsGa5UQUJCY8vA9WCungLPE442XWEBahY
  Bqmr7wQJQLSpyc+YQFYrqExMEXL5ghWhUlZl9uZoGwKyVaP/yCstUkrp7bxDyBUXAWkvZZSNo
  XMDKtYjQrTi0qSy3StdBLKspMzyjJTczM0Uus0k3USy3VzcsvKsnQNdRLLC/WSy0u1iuuzE3O
  SdHLSy3ZxAgM3ZTi5B87GHf1/dU7xCjJwaQkyrtJ+HOyEF9SfkplRmJxRnxRaU5q8SFGGQ4OJ
  QneKkWgnGBRanpqRVpmDjCOYNISHDxKIrzS0kBp3uKCxNzizHSI1ClGY45tn/ftZebo3N91gF
  mIJS8/L1VKnFdBGahUAKQ0ozQPbhAsvi8xykoJ8zIyMDAI8RSkFuVmlqDKv2IU52BUEuY9DnI
  PT2ZeCdy+V0CnMAGd4v7jA8gpJYkIKakGJq9WVW/Hqyrra1Kyfz362+TFrZa3z+zflEeXWRR+
  ndxgLLZg76xXJV/V7/w66bV7+X8Lf8M9r3eLyymd+uw2h8Fl94SzV44eCn/2K4fl4Ut1pz0u2
  mWK2zoXa3wsf76l+nz9astoB8Zrfut3R80UPSK12fyP+UGJVrc/5Ycml0e/fsCfGPPifLRwqN
  y7uhUv+Spsj7v//MZSMe+mVu6GHWqb26dYp+X86mG4MC8x0uNa7wkpO/05ibbLmx2USnJUi3N
  Xzr7s4GbWHRGVuioq3aDuX8T9KLv/BZY7jOKWlwlOf/vgHPO/JV/4l5t2cEo/UM9KZ7hjFdbu
  MvefqcW+zHV/7u3ZaWjWtGZpvuP5y0osxRmJhlrMRcWJAOTSgGtqAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-15.tower-732.messagelabs.com!1676878950!165634!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.102.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 14904 invoked from network); 20 Feb 2023 07:42:30 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-15.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 20 Feb 2023 07:42:30 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 5C5C91000D2
	for <openembedded-devel@lists.openembedded.org>; Mon, 20 Feb 2023 07:42:30 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 5033F1000C1
	for <openembedded-devel@lists.openembedded.org>; Mon, 20 Feb 2023 07:42:30 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 20 Feb 2023 07:42:28 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] sg3-utils: upgrade 1.45 -> 1.47
Date: Mon, 20 Feb 2023 15:41:51 +0800
Message-ID: <1676878912-15532-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1676878912-15532-1-git-send-email-wangmy@fujitsu.com>
References: <1676878912-15532-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Feb 2023 07:42:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101162

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update:
 delete extra spaces
 "Kurt Garloff <garloff at suse dot de>" changed to "Kurt Garloff"
 copyright year updated to 2021
 "-10th April 2012" updated to "4th October 2021"

Changelog:
==========
  - sg_rep_zones: add support for REPORT ZONE DOMAINS and
    REPORT REALMS in this utility
  - sg_raw: fix prints of NVMe NVM command names
  - sg_ses: fix Windows problem "No command (cdb) given"
    - fix crash when '-m LEN' < 252
    - guard against smaller '--maxlen=' values
  - sg_logs: additions to Volume statistics lpage [ssc5r05c]
    - additions to Command duration limits statistics log
      page [spc6r06]
  - sg_vpd: fix do_hex type on some recent pages
    - zoned block dev char vpd: add zone alignment mode and
      zone starting LBA granularity [zbc2r11]
  - sg_read_buffer: fix --length= problem
  - sg_dd, sgm_dd, sgp_dd: don't close negative file descriptors
  - sg_dd: srand48_r() and mrand48_r() are GNU libc specific,
    put conditional in so non-reentrant version used otherwise
    - 'iflag=00,ff' places the 32 bit block address (big endian)
      into each block
  - sgp_dd: major rework, fix issue with error being ignored
    - new: --chkaddr which checks for block address in each block
    - add check for stdatomic.h presence in configure.ac
  - sg_xcopy: tweak CSCD identification descriptor
  - sg_get_elem_status: fix issue with '--maxlen=' option
    - add 2 depopulation revocation health attributes [sbc5r01]
  - transport error handling improved. To fix report of a
    BAD_TARGET transport error but the utility still continued.
    - introduce SG_LIB_TRANSPORT_ERROR [35] exit status
  - several utilities: override '--maxlen=LEN' when LEN
    is < 16 (or 4), take default (or 4) instead
  - scripts: 55-scsi-sg3_id.rules remove outdated rule
  - sg_lib: add sg_scsi_status_is_good(),
    sg_scsi_status_is_bad() and sg_get_zone_type_str()
  - pt_linux: fix verify(BytChk=0) which Linux SNTL translated
    to write, other SNTL cleanups
  - pt_linux_nvme: fix fua setting
  - pt: check_pt_file_handle() add return value of 5 for
    FreeBSD for nvme(cam)
  - pt: new configure option --enable-pt_dummy builds the
    library with sg_pt_dummy.c instead of OS specific code;
    for experimenting with --inhex= decoding on netbsd
  - pt: add Haiku OS support
  - gcc -fanalyzer fixes: in sg_pt_linux.c + sg_write_x.c
  - sg_pt_dummy.c: add list of functions that a new pt
    needs to define
  - configure.ac: tweak to accept uclinux as linux
  - move some hex files from examples to inhex directory
  - major rework of lib/sg_pt_freebsd.c; make SNTL as similar
    as practical to the Linux implementation
  - add testing/sg_take_snap
  - change links to http://sg.danny/cz/sg/* to https
  - sg_rep_pip: new utility: report provisioning initialization
    pattern command
  - sg_turs: estimated time-to-ready [spc6r03]
    - add --delay=MS option
  - sg_requests: substantial cleanup
  - sg_vpd: add Format presets and Concurrent positioning ranges
    - add hot-pluggable field in standard Inquiry [spc6r05]
    - fix vendor struct opts_t alignment
  - sg_inq: add hot-pluggable field in standard Inquiry
  - sg_dd: --verify : separate category for miscompare errors
    - --verify : oflag=coe continue on miscompares, counts them
    - add cdl= operand for command duration limit indexes
    - add oflag=nocreat and conv=nocreat : OFILE must exist
    - add iflag=00, ff, random flags
    - setup conditional auto rule for getrandom()
    - add command timeout after comma in time= operand
  - sg_get_elem_status: add ralwd bit sbc4r20a
  - sg_write_x: add dld bits to write(32) [sbc4r19a]
  - sg_rep_zones: print invalid write pointer LBA as -1 rather
    than 16 "f"s
  - sg_opcodes: improve handling of RWCDLP field
  - sg_ses: use fan speed factor field for calculation [ses4r04]
    - add --all (-a) option, same action as --join
  - sg_compare_and_write: add examples section to its manpage
  - sg_modes: document '-s' option (same as '-6')
  - sg_sanitize + sg_format: when --verbose given once report
    probable success; without --verbose 'no news is good news'
  - sg_zone: add Remove element and modify zones command
  - sg_raw: increase maximum data-in and data-out buffer size
    from 64 KB to 1 MB
    - fix --cmdfile= handling
    - add --nvm option to send commands from the NVM command set
    - add --cmdset option to bypass cdb heuristic
    - add --scan= first_opcode,last_opcode
  - sg_pt_freebsd: allow device names without leading /dev/
    thus fix for regression introduced in rev 731 (ver: 1.43)
  - sg_pt_solaris+sg_pt_osf1: fix problem with clear_scsi_pt_obj()
    which needs to remember is_nvme and dev_fd values
  - sg_lib: add ZBC (2020) feature set entries
  - sg_lib: restore elements and rebuild command added
  - sg_lib,sg_pt: add partial_clear_scsi_pt_obj(),
    get_scsi_pt_cdb_len() and get_scsi_pt_cdb_buf()
    - add do_nvm_pt() for the NVM (sub-)command set
    - tweak transport error handling in Linux
  - sg_lib: Linux NVMe SNTL: add read, write and verify;
    synchronize cache and write same translations
    - add dummy start stop unit and test unit ready commands
    - wire cache mpage's WCE to nvme 'volatile write cache'
    - fix crash in sg_f2hex_arr() when fname not found
  - sg_lib: reprint cdb with illegal request sense key
    - asc/ascq match asc-num.txt @t10 20200708 [spc6r02]
  - gcc-10: suppress warnings
  - autoconf: upgrade version 2.69 to 2.70
  - remove space from end of source lines for git-svn
  - testing/sg_mrq_testing: new, for blocking mrq usage
  - testing/sgs_dd: add evfd flags and eventfd processing
  - testing: remove master-slave terminology for sgv4
  - examples: add nvme_read_ctl.hex and nvme_write_ctl.hex

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../sg3-utils/{sg3-utils_1.45.bb => sg3-utils_1.47.bb}       | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-support/sg3-utils/{sg3-utils_1.45.bb => sg3-utils_1.47.bb} (72%)

diff --git a/meta-oe/recipes-support/sg3-utils/sg3-utils_1.45.bb b/meta-oe/recipes-support/sg3-utils/sg3-utils_1.47.bb
similarity index 72%
rename from meta-oe/recipes-support/sg3-utils/sg3-utils_1.45.bb
rename to meta-oe/recipes-support/sg3-utils/sg3-utils_1.47.bb
index ac12f9561..fe129b8ed 100644
--- a/meta-oe/recipes-support/sg3-utils/sg3-utils_1.45.bb
+++ b/meta-oe/recipes-support/sg3-utils/sg3-utils_1.47.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "http://sg.danny.cz/sg/sg3_utils.html"
 SECTION = "console/admin"
 
 LICENSE = "GPL-2.0-or-later & BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://COPYING;md5=f90da7fc52172599dbf082d7620f18ca"
+LIC_FILES_CHKSUM = "file://COPYING;md5=f685699d3ac82f108aa880043fa3feb7"
 
 SRC_URI = "http://sg.danny.cz/sg/p/sg3_utils-${PV}.tgz \
 "
@@ -14,8 +14,7 @@ MIRRORS += "http://sg.danny.cz/sg/p https://fossies.org/linux/misc"
 
 UPSTREAM_CHECK_REGEX = "sg3_utils-(?P<pver>\d+(\.\d+)+)\.tgz"
 
-SRC_URI[md5sum] = "2e71d7cd925dcc48acb24afaaaac7990"
-SRC_URI[sha256sum] = "0b87c971af52af7cebebcce343eac6bd3d73febb3c72af9ce41a4552f1605a61"
+SRC_URI[sha256sum] = "8673c7faca849b6b34764332d2aa91f72db05bff7382bb836d0688795199c3e1"
 
 inherit autotools-brokensep
 
-- 
2.34.1


