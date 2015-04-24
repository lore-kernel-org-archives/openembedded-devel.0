Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f174.google.com (mail-pd0-f174.google.com
	[209.85.192.174])
	by mail.openembedded.org (Postfix) with ESMTP id 53412605D2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Apr 2015 18:57:50 +0000 (UTC)
Received: by pdbnk13 with SMTP id nk13so56296696pdb.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Apr 2015 11:57:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=wy3uSFlcDV5vF//RLRvU2xIPPC/CefcnASIxRhPXkQY=;
	b=NRBaM3qI0oJhs3mW+1hyT1NE7ACvW/XpyolCCQlH5vEBcAZOKQtzJ1nFQHuwwFVfqf
	1TbKPVXk7L8g34gltmA4XNRoUhrcm/j2CYuqXL2wZsUGcAWJ7fZETLNNbprxLLV6Pcmg
	9botmSe8pqbX8MyD2UBsfKYfds63j8MbdHBy1RbqMSf2kqTqN/PUzcqosnE6a1kBRp6d
	jtN+nxnV7vWygrw4bUtcA7thoV8wDYjL4CvK2R/A8XUWJHhm1w//StraFX64OcmDhI8n
	0mJHlABFr+a9RIr3eETKqkx9hfxYB/1jLbQQGKSqi14VbieOK/OUok40CmZ2T+/lVm0Q
	W+bg==
X-Received: by 10.68.137.70 with SMTP id qg6mr17368850pbb.125.1429901872142;
	Fri, 24 Apr 2015 11:57:52 -0700 (PDT)
Received: from ?IPv6:2601:c:a700:3ba7:415d:13b2:afc9:74fd?
	([2601:c:a700:3ba7:415d:13b2:afc9:74fd])
	by mx.google.com with ESMTPSA id
	cd10sm11911778pac.7.2015.04.24.11.57.49
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 24 Apr 2015 11:57:50 -0700 (PDT)
Message-ID: <553A922C.6030106@gmail.com>
Date: Fri, 24 Apr 2015 11:57:48 -0700
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
References: <cover.1428334829.git.akuster808@gmail.com>
In-Reply-To: <cover.1428334829.git.akuster808@gmail.com>
Subject: Re: [PATCH 00/33 v2][master] meta-oe misc build fixes
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
X-List-Received-Date: Fri, 24 Apr 2015 18:57:53 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

ping or did I miss a comment somewhere?

- armin

On 04/06/2015 08:46 AM, Armin Kuster wrote:
> V2: downgrade fingerterm back to original 1.0.2, 1.1.14 required qt5.
>
> please consider these misc build fixes for meta-oe. I hope there are not too many dups in the pipe line. I could not tell.
>
> Also I have moved a few recipes out of meta-oe as they have depends on other layers.
>
> The following changes since commit df6c7b1279790d27ebfd58fbdfbac89bde5782ec:
>
>    python-pyopenssl: Upgrade to 0.14 (2015-03-21 16:42:30 +0100)
>
> are available in the git repository at:
>
>    git://github.com/akuster/meta-openembedded.git akuster/build_fixes
>    https://github.com//tree/akuster/build_fixes
>
> Armin Kuster (33):
>    daq: move recipe to meta-networking
>    opencv: build issue
>    collectd: fix world build issue
>    libgxim: fix world build issues
>    networkmanger: meta-oe world build failes
>    fingerterm: update SRC_URI
>    protbuf: update update and build fix
>    serial-forward: fix fetch error
>    dialog: update SRC_URI
>    xterm: fix issue with SRC_URI
>    ckermit: update SRC_URI
>    lirc: fix QA warnings
>    hplib: fix QA warnings
>    udisks: fix QA warnings
>    lio-utils: fix QA warnings
>    pm-qa: Fix QA warnings
>    gateone: Fix QA warnings
>    rarpd: Fix QA warnings
>    syslog-ng: Fix QA warnings
>    pscs-lite: Fix QA warnings
>    fbida: Fix QA warnings
>    qt-creator: Fix QA warnings
>    fio: Fix QA warnings
>    foxtrotgps: Fix QA warnings
>    usbpath: Fix QA warnings
>    wvstreams: Fix QA warnings
>    pksc11-helper: Fix QA warnings
>    lmsensors-config: Fix QA warnings
>    libutempter: update SRC_URI
>    gammu: Fix QA warnings
>    mosh: Fix QA warnings
>    numactl: Fix QA warnings
>    packagekit: Fix QA warnings
>
>   .../recipes-connectivity/daq/daq_2.0.2.bb          |  0
>   ...le-run-test-program-while-cross-compiling.patch |  0
>   ...c-Check-only-for-libsystemd-not-libsystem.patch |  0
>   ...o-run-sbin-dhclient-to-get-the-version-nu.patch |  0
>   .../networkmanager/networkmanager_0.9.8.10.bb      |  0
>   meta-oe/recipes-benchmark/fio/fio_2.2.6.bb         |  2 +-
>   meta-oe/recipes-connectivity/gammu/gammu_1.32.0.bb |  3 ++
>   .../recipes-connectivity/gateone/gateone_git.bb    |  1 +
>   meta-oe/recipes-connectivity/lirc/lirc.inc         |  2 +-
>   meta-oe/recipes-connectivity/lirc/lirc_0.9.2.bb    |  1 +
>   meta-oe/recipes-connectivity/mosh/mosh_1.2.4.bb    |  2 +-
>   .../recipes-connectivity/wvdial/wvstreams_4.6.1.bb |  1 +
>   .../packagekit/packagekit_0.5.6.bb                 |  9 +++---
>   meta-oe/recipes-devtools/pm-qa/pm-qa_git.bb        |  1 +
>   .../{protobuf_2.5.0.bb => protobuf_2.6.1.bb}       | 13 +++++----
>   .../recipes-extended/collectd/collectd_5.4.1.bb    |  3 +-
>   meta-oe/recipes-extended/dialog/dialog.inc         |  2 +-
>   meta-oe/recipes-extended/hplip/hplip_3.12.6.bb     |  3 +-
>   meta-oe/recipes-extended/rarpd/rarpd_ss981107.bb   |  2 ++
>   meta-oe/recipes-graphics/fbida/fbida_git.bb        |  2 +-
>   meta-oe/recipes-graphics/xorg-app/xterm_303.bb     |  2 +-
>   .../foxtrotgps/foxtrotgps_1.1.1.bb                 |  1 +
>   .../{fingerterm_1.0.2.bb => fingerterm.bb}         | 34 ++++++++++------------
>   meta-oe/recipes-qt/qt-creator/qt-creator_2.8.1.bb  |  2 ++
>   meta-oe/recipes-support/ckermit/ckermit_302.bb     |  4 +--
>   .../{libutempter_1.1.6.bb => libutempter.bb}       | 11 ++++---
>   meta-oe/recipes-support/lio-utils/lio-utils_4.1.bb |  3 +-
>   .../lm_sensors/lmsensors-config_1.0.bb             |  2 +-
>   meta-oe/recipes-support/numactl/numactl_2.0.9.bb   |  2 ++
>   .../recipes-support/opencv/opencv-samples_2.4.bb   |  3 ++
>   meta-oe/recipes-support/opencv/opencv_2.4.bb       |  2 ++
>   .../recipes-support/pcsc-lite/pcsc-lite_1.8.6.bb   |  1 +
>   .../pkcs11-helper/pkcs11-helper_1.11.bb            |  2 +-
>   .../serial-utils/serial-forward_git.bb             |  2 +-
>   meta-oe/recipes-support/syslog-ng/syslog-ng.inc    |  2 +-
>   meta-oe/recipes-support/udisks/udisks_1.0.4.bb     |  2 +-
>   meta-oe/recipes-support/usbpath/usbpath_svn.bb     |  2 ++
>   ...CAL_AMFLAGS-isnot-supported-by-autoreconf.patch |  0
>   .../recipes-extended/libgxim/libgxim_0.5.0.bb      |  0
>   39 files changed, 75 insertions(+), 49 deletions(-)
>   rename {meta-oe => meta-networking}/recipes-connectivity/daq/daq_2.0.2.bb (100%)
>   rename {meta-oe => meta-networking}/recipes-connectivity/daq/files/disable-run-test-program-while-cross-compiling.patch (100%)
>   rename {meta-oe => meta-networking}/recipes-connectivity/networkmanager/networkmanager/0001-configure.ac-Check-only-for-libsystemd-not-libsystem.patch (100%)
>   rename {meta-oe => meta-networking}/recipes-connectivity/networkmanager/networkmanager/0001-don-t-try-to-run-sbin-dhclient-to-get-the-version-nu.patch (100%)
>   rename {meta-oe => meta-networking}/recipes-connectivity/networkmanager/networkmanager_0.9.8.10.bb (100%)
>   rename meta-oe/recipes-devtools/protobuf/{protobuf_2.5.0.bb => protobuf_2.6.1.bb} (56%)
>   rename meta-oe/recipes-qt/fingerterm/{fingerterm_1.0.2.bb => fingerterm.bb} (56%)
>   rename meta-oe/recipes-support/libutempter/{libutempter_1.1.6.bb => libutempter.bb} (79%)
>   rename {meta-oe => meta-ruby}/recipes-extended/libgxim/libgxim/multi-line-ACLOCAL_AMFLAGS-isnot-supported-by-autoreconf.patch (100%)
>   rename {meta-oe => meta-ruby}/recipes-extended/libgxim/libgxim_0.5.0.bb (100%)
>

