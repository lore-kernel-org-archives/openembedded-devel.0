Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A33FEC61DA4
	for <webhook@archiver.kernel.org>; Wed, 22 Feb 2023 09:03:35 +0000 (UTC)
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
 by mx.groups.io with SMTP id smtpd.web11.4493.1677056611079650938
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Feb 2023 01:03:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=WBO6LqQ2;
 spf=pass (domain: gmail.com, ip: 209.85.160.44, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-1720887dfcdso8916253fac.6
        for <openembedded-devel@lists.openembedded.org>; Wed, 22 Feb 2023 01:03:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BRXOq2x9Ja5kY22dRLlAhKXMmgZdexysyYgRij5tGqM=;
        b=WBO6LqQ28Nu6kJgY2FxsHDSJ/bKjpHoNi6aGdXa2dnY3AOy2Qiw00YdIzbQMD4qorU
         m47o1IjuRCgT0E+yO+cDH4O7/3YLcYoD4dyKtLu8Ok/yvhqVxxFRx2bRxEchQvfUNDNw
         GnDduDVjlui5rM2Fl9bzBSj9wrLJ9vOX1hJmhS/UUF4MrWGvipLhAWn/lPzqTVEfzxBv
         QC0kqdcheAg+NMuNyKQAQjYQ32KezHK4LxGu6aljD7kex3zDTfqfSNyn21sfvHG0KahB
         0lFIJtDZtMOxo8VFzlxZ3hoDFaLo9uu7PsugWVHpG8I/WLHnbP0NkivhtCfYm5yNPPXS
         3Y6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BRXOq2x9Ja5kY22dRLlAhKXMmgZdexysyYgRij5tGqM=;
        b=MFE0hziulp0609/b5mKauRGasHO6obGyO3uA770AfsZWTb9a0wY2xgjbkEigU61SHP
         bGrS01X35IgcbyEjk+b9BIkFr/AeANEE51zDqSpNTMxxMO2HxNbVUuU9ZSQ6V/GF//xn
         /ksuWV4mhTQ9XsvPkmOddyORqT7o9ZVl+FbHYs+WDoY1sNLlq8upiZT2Bv63AzKITy7W
         8y+0bli8IGfCOCAUo7B2hbPJkf02zo+xeNeOFxOTyAuX8ySHqJr7e5vkB+FxDWOC+pkN
         MyXOe3k8i1W3DfJ+jxnvSYjK+G++IIDIjv1/0c2X3gDCaRCS8hL+SKDm3+s6lGyMK+2M
         IQVA==
X-Gm-Message-State: AO0yUKWI1VzBCQQDOUpIQu1YgVmSFGr1lKrzdDb3i/WA1OcGTbluE3f0
	SfX18B1G9AmVuRbHOV87COdodpWfEwOG9W2Ci2c=
X-Google-Smtp-Source: AK7set/7TRe+b4nACu3uyahqH18o+v1hQF5l9v+ix8m4ORGZ/DoYu/pKk6qiPpTLBD7TAFqP24URW3KAa37FTPJg5Cc=
X-Received: by 2002:a05:6870:d188:b0:163:b85e:f1ca with SMTP id
 a8-20020a056870d18800b00163b85ef1camr1121959oac.262.1677056609994; Wed, 22
 Feb 2023 01:03:29 -0800 (PST)
MIME-Version: 1.0
References: <1676878912-15532-1-git-send-email-wangmy@fujitsu.com> <1676878912-15532-3-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1676878912-15532-3-git-send-email-wangmy@fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 22 Feb 2023 01:03:03 -0800
Message-ID: <CAMKF1spCq1Yf8zZp9wCZHrfdt5phpn4TAcmdo+aOYPWWXrPjpg@mail.gmail.com>
Subject: Re: [oe] [meta-oe] [PATCH] sg3-utils: upgrade 1.45 -> 1.47
To: wangmy <wangmy@fujitsu.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Feb 2023 09:03:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101201

fails to build with clang -
https://errors.yoctoproject.org/Errors/Details/695671/

On Sun, Feb 19, 2023 at 11:42 PM wangmy <wangmy@fujitsu.com> wrote:
>
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> License-Update:
>  delete extra spaces
>  "Kurt Garloff <garloff at suse dot de>" changed to "Kurt Garloff"
>  copyright year updated to 2021
>  "-10th April 2012" updated to "4th October 2021"
>
> Changelog:
> ==========
>   - sg_rep_zones: add support for REPORT ZONE DOMAINS and
>     REPORT REALMS in this utility
>   - sg_raw: fix prints of NVMe NVM command names
>   - sg_ses: fix Windows problem "No command (cdb) given"
>     - fix crash when '-m LEN' < 252
>     - guard against smaller '--maxlen=' values
>   - sg_logs: additions to Volume statistics lpage [ssc5r05c]
>     - additions to Command duration limits statistics log
>       page [spc6r06]
>   - sg_vpd: fix do_hex type on some recent pages
>     - zoned block dev char vpd: add zone alignment mode and
>       zone starting LBA granularity [zbc2r11]
>   - sg_read_buffer: fix --length= problem
>   - sg_dd, sgm_dd, sgp_dd: don't close negative file descriptors
>   - sg_dd: srand48_r() and mrand48_r() are GNU libc specific,
>     put conditional in so non-reentrant version used otherwise
>     - 'iflag=00,ff' places the 32 bit block address (big endian)
>       into each block
>   - sgp_dd: major rework, fix issue with error being ignored
>     - new: --chkaddr which checks for block address in each block
>     - add check for stdatomic.h presence in configure.ac
>   - sg_xcopy: tweak CSCD identification descriptor
>   - sg_get_elem_status: fix issue with '--maxlen=' option
>     - add 2 depopulation revocation health attributes [sbc5r01]
>   - transport error handling improved. To fix report of a
>     BAD_TARGET transport error but the utility still continued.
>     - introduce SG_LIB_TRANSPORT_ERROR [35] exit status
>   - several utilities: override '--maxlen=LEN' when LEN
>     is < 16 (or 4), take default (or 4) instead
>   - scripts: 55-scsi-sg3_id.rules remove outdated rule
>   - sg_lib: add sg_scsi_status_is_good(),
>     sg_scsi_status_is_bad() and sg_get_zone_type_str()
>   - pt_linux: fix verify(BytChk=0) which Linux SNTL translated
>     to write, other SNTL cleanups
>   - pt_linux_nvme: fix fua setting
>   - pt: check_pt_file_handle() add return value of 5 for
>     FreeBSD for nvme(cam)
>   - pt: new configure option --enable-pt_dummy builds the
>     library with sg_pt_dummy.c instead of OS specific code;
>     for experimenting with --inhex= decoding on netbsd
>   - pt: add Haiku OS support
>   - gcc -fanalyzer fixes: in sg_pt_linux.c + sg_write_x.c
>   - sg_pt_dummy.c: add list of functions that a new pt
>     needs to define
>   - configure.ac: tweak to accept uclinux as linux
>   - move some hex files from examples to inhex directory
>   - major rework of lib/sg_pt_freebsd.c; make SNTL as similar
>     as practical to the Linux implementation
>   - add testing/sg_take_snap
>   - change links to http://sg.danny/cz/sg/* to https
>   - sg_rep_pip: new utility: report provisioning initialization
>     pattern command
>   - sg_turs: estimated time-to-ready [spc6r03]
>     - add --delay=MS option
>   - sg_requests: substantial cleanup
>   - sg_vpd: add Format presets and Concurrent positioning ranges
>     - add hot-pluggable field in standard Inquiry [spc6r05]
>     - fix vendor struct opts_t alignment
>   - sg_inq: add hot-pluggable field in standard Inquiry
>   - sg_dd: --verify : separate category for miscompare errors
>     - --verify : oflag=coe continue on miscompares, counts them
>     - add cdl= operand for command duration limit indexes
>     - add oflag=nocreat and conv=nocreat : OFILE must exist
>     - add iflag=00, ff, random flags
>     - setup conditional auto rule for getrandom()
>     - add command timeout after comma in time= operand
>   - sg_get_elem_status: add ralwd bit sbc4r20a
>   - sg_write_x: add dld bits to write(32) [sbc4r19a]
>   - sg_rep_zones: print invalid write pointer LBA as -1 rather
>     than 16 "f"s
>   - sg_opcodes: improve handling of RWCDLP field
>   - sg_ses: use fan speed factor field for calculation [ses4r04]
>     - add --all (-a) option, same action as --join
>   - sg_compare_and_write: add examples section to its manpage
>   - sg_modes: document '-s' option (same as '-6')
>   - sg_sanitize + sg_format: when --verbose given once report
>     probable success; without --verbose 'no news is good news'
>   - sg_zone: add Remove element and modify zones command
>   - sg_raw: increase maximum data-in and data-out buffer size
>     from 64 KB to 1 MB
>     - fix --cmdfile= handling
>     - add --nvm option to send commands from the NVM command set
>     - add --cmdset option to bypass cdb heuristic
>     - add --scan= first_opcode,last_opcode
>   - sg_pt_freebsd: allow device names without leading /dev/
>     thus fix for regression introduced in rev 731 (ver: 1.43)
>   - sg_pt_solaris+sg_pt_osf1: fix problem with clear_scsi_pt_obj()
>     which needs to remember is_nvme and dev_fd values
>   - sg_lib: add ZBC (2020) feature set entries
>   - sg_lib: restore elements and rebuild command added
>   - sg_lib,sg_pt: add partial_clear_scsi_pt_obj(),
>     get_scsi_pt_cdb_len() and get_scsi_pt_cdb_buf()
>     - add do_nvm_pt() for the NVM (sub-)command set
>     - tweak transport error handling in Linux
>   - sg_lib: Linux NVMe SNTL: add read, write and verify;
>     synchronize cache and write same translations
>     - add dummy start stop unit and test unit ready commands
>     - wire cache mpage's WCE to nvme 'volatile write cache'
>     - fix crash in sg_f2hex_arr() when fname not found
>   - sg_lib: reprint cdb with illegal request sense key
>     - asc/ascq match asc-num.txt @t10 20200708 [spc6r02]
>   - gcc-10: suppress warnings
>   - autoconf: upgrade version 2.69 to 2.70
>   - remove space from end of source lines for git-svn
>   - testing/sg_mrq_testing: new, for blocking mrq usage
>   - testing/sgs_dd: add evfd flags and eventfd processing
>   - testing: remove master-slave terminology for sgv4
>   - examples: add nvme_read_ctl.hex and nvme_write_ctl.hex
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  .../sg3-utils/{sg3-utils_1.45.bb => sg3-utils_1.47.bb}       | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>  rename meta-oe/recipes-support/sg3-utils/{sg3-utils_1.45.bb => sg3-utils_1.47.bb} (72%)
>
> diff --git a/meta-oe/recipes-support/sg3-utils/sg3-utils_1.45.bb b/meta-oe/recipes-support/sg3-utils/sg3-utils_1.47.bb
> similarity index 72%
> rename from meta-oe/recipes-support/sg3-utils/sg3-utils_1.45.bb
> rename to meta-oe/recipes-support/sg3-utils/sg3-utils_1.47.bb
> index ac12f9561..fe129b8ed 100644
> --- a/meta-oe/recipes-support/sg3-utils/sg3-utils_1.45.bb
> +++ b/meta-oe/recipes-support/sg3-utils/sg3-utils_1.47.bb
> @@ -6,7 +6,7 @@ HOMEPAGE = "http://sg.danny.cz/sg/sg3_utils.html"
>  SECTION = "console/admin"
>
>  LICENSE = "GPL-2.0-or-later & BSD-2-Clause"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=f90da7fc52172599dbf082d7620f18ca"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=f685699d3ac82f108aa880043fa3feb7"
>
>  SRC_URI = "http://sg.danny.cz/sg/p/sg3_utils-${PV}.tgz \
>  "
> @@ -14,8 +14,7 @@ MIRRORS += "http://sg.danny.cz/sg/p https://fossies.org/linux/misc"
>
>  UPSTREAM_CHECK_REGEX = "sg3_utils-(?P<pver>\d+(\.\d+)+)\.tgz"
>
> -SRC_URI[md5sum] = "2e71d7cd925dcc48acb24afaaaac7990"
> -SRC_URI[sha256sum] = "0b87c971af52af7cebebcce343eac6bd3d73febb3c72af9ce41a4552f1605a61"
> +SRC_URI[sha256sum] = "8673c7faca849b6b34764332d2aa91f72db05bff7382bb836d0688795199c3e1"
>
>  inherit autotools-brokensep
>
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#101162): https://lists.openembedded.org/g/openembedded-devel/message/101162
> Mute This Topic: https://lists.openembedded.org/mt/97082178/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

