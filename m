Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f42.google.com (mail-pa0-f42.google.com
	[209.85.220.42])
	by mail.openembedded.org (Postfix) with ESMTP id 941DC766E5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Aug 2015 20:34:45 +0000 (UTC)
Received: by paccq16 with SMTP id cq16so836389pac.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Aug 2015 13:34:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=3YnaCnklAv9wUjO0cjR90r851XDmizVZQkJmvkNX02c=;
	b=nVX6ct5AQLpQbIKv1W6/hy5UhlLNSbja1YwY8sCe2TfocOzUPlNONdwO8uNXzpSKuE
	x9fZlFu2DvdUDHGh0gVfjkMj7VbsWe/bCba7m2wL2Eygt1vMQIhMRpSlEfLe3YLv7icK
	f5lNvzYKt7N0gqkfQyK4WZmw3YqTNFeP8F56Eht2Nf0fayFF6j+PykjEtdOZYy0dKkE0
	AOw3aryClRKxQ4tSKVh3c2qw4/VDq0ENi6zh14kHZfM0dMMPyaZtWg8fnycf3dgKuPIg
	9l5deC25RcZUaJDNNWng4TItO+rLg2X6EL/kb+3vPNgG+w8XQc/o8iyUnJf0RBn5vYfZ
	l8bA==
X-Received: by 10.66.66.172 with SMTP id g12mr80288564pat.21.1439498085512;
	Thu, 13 Aug 2015 13:34:45 -0700 (PDT)
Received: from ?IPv6:2601:202:4000:1239:e515:2fc5:d7bb:e982?
	([2601:202:4000:1239:e515:2fc5:d7bb:e982])
	by smtp.googlemail.com with ESMTPSA id
	qc9sm3671392pab.18.2015.08.13.13.34.43
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 13 Aug 2015 13:34:44 -0700 (PDT)
Message-ID: <55CCFF62.30603@gmail.com>
Date: Thu, 13 Aug 2015 13:34:42 -0700
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org, otavio@ossystems.com.br
References: <cover.1438618378.git.akuster808@gmail.com>
In-Reply-To: <cover.1438618378.git.akuster808@gmail.com>
Subject: Re: [PATCH 00/55] For meta-oe fido-next
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
X-List-Received-Date: Thu, 13 Aug 2015 20:34:45 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

can I get a status on this request?

- armin

On 08/03/2015 09:22 AM, Armin Kuster wrote:
> I don't recall if I sent this pull request already.
>
> Please consider these changes for Meta-openembedded fido next
>
> The following changes since commit c841231b9f327d2d06d19d2ba1324dd86b83617c:
>
>    netperf: fix the broken download url (2015-08-03 11:42:33 +0200)
>
> are available in the git repository at:
>
>    git://github.com/akuster/meta-openembedded akuster/fido-next
>    https://github.com/akuster/meta-openembedded/tree/akuster/fido-next
>
> Armin Kuster (27):
>    collectd: fix world build issue
>    libgxim: fix world build issues
>    protobuf: update update and build fix
>    serial-forward: fix fetch error
>    lirc: fix QA warnings
>    hplib: fix QA warnings
>    udisks: fix QA warnings
>    lio-utils: fix QA warnings
>    pm-qa: Fix QA warnings
>    gateone: Fix QA warnings
>    rarpd: Fix QA warnings
>    pscs-lite: Fix QA warnings
>    fbida: Fix QA warnings
>    qt-creator: Fix QA warnings
>    fio: Fix QA warnings
>    foxtrotgps: Fix QA warnings
>    usbpath: Fix QA warnings
>    wvstreams: Fix QA warnings
>    pksc11-helper: Fix QA warnings
>    libutempter: update SRC_URI
>    gammu: Fix QA warnings
>    mosh: Fix QA warnings
>    numactl: Fix QA warnings
>    xterm: fix issue with SRC_URI
>    ckermit: update SRC_URI
>    packagekit: Fix QA warnings
>    daq: move recipe to meta-networking
>
> Chunrong Guo (2):
>    polkit: do not hardcode the libdir
>    mozjs: fix the compile error of powerpc64
>
> Dmitry Eremin-Solenikov (1):
>    syslog-ng: add util-linux to DEPENDS list
>
> Dominic Sacré (1):
>    fio: add missing build dependency on zlib
>
> Haris Okanovic (1):
>    start-stop-daemon: Fix RCONFLICTS typo
>
> Hugo Vasconcelos Saldanha (1):
>    libssh2: fix CVE-2015-1782
>
> Josep Puigdemont (1):
>    libhugetlbfs: project moved to github
>
> Khem Raj (2):
>    polkit-gnome: Upgrade 0.102 -> 0.105
>    gdm: Whitelist it
>
> Robert Yang (1):
>    opensaf: RDEPENDS on python and bash
>
> Yi Zhao (17):
>    smstools: fix PN -> BPN for multilib
>    hexedit: fix PN -> BPN for multilib
>    fbgrab: fix PN -> BPN for multilib
>    takao-fonts: fix PN -> BPN for multilib
>    xbitmaps: fix PN -> BPN for multilib
>    navit: fix PN -> BPN for multilib
>    omgps: fix PN -> BPN for multilib
>    orrery: fix PN -> BPN for multilib
>    fltk: fix PN -> BPN for multilib
>    mime-support: fix PN -> BPN for multilib
>    openct: fix PN -> BPN for multilib
>    picocom: fix PN -> BPN for multilib
>    soci: fix PN -> BPN for multilib
>    mozjs: fix PN -> BPN for multilib
>    iperf: fix ${PN}-${PV} -> ${BP} for multilib
>    synergy: fix ${PN}-${PV} -> ${BP} for multilib
>    gpsd: fix PN -> BPN for multilib
>
> gary.robertson@linaro.org (1):
>    libhugetlbfs: x86 - don't link against host libs
>
>   meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb         |   2 -
>   .../recipes-connectivity/daq/daq_2.0.2.bb          |   0
>   ...le-run-test-program-while-cross-compiling.patch |   0
>   .../recipes-daemons/opensaf/opensaf_4.5.0.bb       |   2 +
>   meta-oe/recipes-benchmark/fio/fio_2.2.6.bb         |   5 +-
>   meta-oe/recipes-benchmark/iperf/iperf_2.0.5.bb     |   2 +-
>   ...86-avoid-host-library-search-in-cross-dev.patch |  48 +++++++++
>   .../libhugetlbfs/libhugetlbfs_git.bb               |   5 +-
>   meta-oe/recipes-connectivity/gammu/gammu_1.32.0.bb |   2 +
>   meta-oe/recipes-connectivity/lirc/lirc.inc         |   2 +-
>   meta-oe/recipes-connectivity/lirc/lirc_0.9.2.bb    |   1 +
>   meta-oe/recipes-connectivity/mosh/mosh_1.2.4.bb    |   2 +-
>   .../smstools3/smstools3_3.1.15.bb                  |   2 +-
>   .../recipes-connectivity/wvdial/wvstreams_4.6.1.bb |   1 +
>   .../packagekit/packagekit_0.5.6.bb                 |   9 +-
>   meta-oe/recipes-devtools/pm-qa/pm-qa_git.bb        |   1 +
>   .../{protobuf_2.5.0.bb => protobuf_2.6.1.bb}       |  13 ++-
>   .../recipes-extended/collectd/collectd_5.4.1.bb    |   3 +-
>   meta-oe/recipes-extended/hexedit/hexedit_1.2.13.bb |   2 +-
>   meta-oe/recipes-extended/hplip/hplip_3.12.6.bb     |   1 +
>   .../mozjs/fix-the-compile-error-of-powerpc64.patch |  18 ++++
>   meta-oe/recipes-extended/mozjs/mozjs_17.0.0.bb     |   5 +-
>   .../polkit/files/gtk-doc-check.patch               |  12 +++
>   ...polkit-gnome_0.102.bb => polkit-gnome_0.105.bb} |  14 +--
>   .../polkit/0001-do-not-hardcoded-libdir.patch      |  44 ++++++++
>   meta-oe/recipes-extended/polkit/polkit_0.112.bb    |   1 +
>   meta-oe/recipes-extended/rarpd/rarpd_ss981107.bb   |   2 +
>   meta-oe/recipes-graphics/fbgrab/fbgrab_1.2.bb      |   2 +-
>   meta-oe/recipes-graphics/fbida/fbida_2.10.bb       |   2 +-
>   .../takao-fonts/takao-fonts_003.02.01.bb           |   2 +-
>   meta-oe/recipes-graphics/xorg-app/xterm_303.bb     |   2 +-
>   .../xorg-data/xorg-data-common.inc                 |   2 +-
>   .../foxtrotgps/foxtrotgps_1.1.1.bb                 |   1 +
>   meta-oe/recipes-navigation/gpsd/gpsd_3.10.bb       |   4 +-
>   meta-oe/recipes-navigation/navit/navit.inc         |  24 ++---
>   meta-oe/recipes-navigation/navit/navit_svn.bb      |   2 +-
>   meta-oe/recipes-navigation/omgps/omgps_svn.bb      |   2 +-
>   meta-oe/recipes-navigation/orrery/orrery_2.7.bb    |   2 +-
>   meta-oe/recipes-qt/qt-creator/qt-creator_2.8.1.bb  |   2 +
>   meta-oe/recipes-support/ckermit/ckermit_302.bb     |   4 +-
>   meta-oe/recipes-support/fltk/fltk_1.1.10.bb        |   2 +-
>   .../libssh2/libssh2-1.4.3/CVE-2015-1782.patch      | 115 +++++++++++++++++++++
>   meta-oe/recipes-support/libssh2/libssh2_1.4.3.bb   |   4 +-
>   .../{libutempter_1.1.6.bb => libutempter.bb}       |  11 +-
>   meta-oe/recipes-support/lio-utils/lio-utils_4.1.bb |   3 +-
>   .../mime-support/mime-support_3.48.bb              |   4 +-
>   meta-oe/recipes-support/numactl/numactl_2.0.9.bb   |   2 +
>   meta-oe/recipes-support/openct/openct_0.6.20.bb    |   2 +-
>   .../recipes-support/pcsc-lite/pcsc-lite_1.8.6.bb   |   1 +
>   meta-oe/recipes-support/picocom/picocom_1.7.bb     |   2 +-
>   .../pkcs11-helper/pkcs11-helper_1.11.bb            |   2 +-
>   .../serial-utils/serial-forward_git.bb             |   2 +-
>   meta-oe/recipes-support/soci/soci_3.2.2.bb         |   2 +-
>   .../start-stop-daemon_1.16.0.2.bb                  |   2 +-
>   meta-oe/recipes-support/synergy/synergy_1.3.8.bb   |   2 +-
>   meta-oe/recipes-support/syslog-ng/syslog-ng.inc    |   3 +-
>   meta-oe/recipes-support/udisks/udisks_1.0.4.bb     |   2 +-
>   meta-oe/recipes-support/usbpath/usbpath_svn.bb     |   2 +
>   .../recipes-connectivity/gateone/gateone_git.bb    |   1 +
>   ...CAL_AMFLAGS-isnot-supported-by-autoreconf.patch |   0
>   .../recipes-extended/libgxim/libgxim_0.5.0.bb      |   0
>   61 files changed, 345 insertions(+), 69 deletions(-)
>   rename {meta-oe => meta-networking}/recipes-connectivity/daq/daq_2.0.2.bb (100%)
>   rename {meta-oe => meta-networking}/recipes-connectivity/daq/files/disable-run-test-program-while-cross-compiling.patch (100%)
>   create mode 100644 meta-oe/recipes-benchmark/libhugetlbfs/files/0001-x86-avoid-host-library-search-in-cross-dev.patch
>   rename meta-oe/recipes-devtools/protobuf/{protobuf_2.5.0.bb => protobuf_2.6.1.bb} (56%)
>   create mode 100644 meta-oe/recipes-extended/mozjs/mozjs/fix-the-compile-error-of-powerpc64.patch
>   create mode 100644 meta-oe/recipes-extended/polkit/files/gtk-doc-check.patch
>   rename meta-oe/recipes-extended/polkit/{polkit-gnome_0.102.bb => polkit-gnome_0.105.bb} (62%)
>   create mode 100644 meta-oe/recipes-extended/polkit/polkit/0001-do-not-hardcoded-libdir.patch
>   create mode 100644 meta-oe/recipes-support/libssh2/libssh2-1.4.3/CVE-2015-1782.patch
>   rename meta-oe/recipes-support/libutempter/{libutempter_1.1.6.bb => libutempter.bb} (79%)
>   rename {meta-oe => meta-ruby}/recipes-extended/libgxim/libgxim/multi-line-ACLOCAL_AMFLAGS-isnot-supported-by-autoreconf.patch (100%)
>   rename {meta-oe => meta-ruby}/recipes-extended/libgxim/libgxim_0.5.0.bb (100%)
>

