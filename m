Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f177.google.com (mail-qt0-f177.google.com
	[209.85.216.177])
	by mail.openembedded.org (Postfix) with ESMTP id 2960A71E5A
	for <Openembedded-devel@lists.openembedded.org>;
	Mon,  3 Sep 2018 05:43:28 +0000 (UTC)
Received: by mail-qt0-f177.google.com with SMTP id z8-v6so20631665qto.9
	for <Openembedded-devel@lists.openembedded.org>;
	Sun, 02 Sep 2018 22:43:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=WPL+OzZMK2iOsx0O3fG8hRR6/CETaIEwMtYqCZpPWWY=;
	b=i5umaF2GDPNRCgzWsLCrzv3gGVevEa3uEDa2N2fkBPqh41Maa7h/ER8OO5ZnEb7Zyp
	005AlZ5frXIkIzEZtcc8Z3+l4OH3gzXsNcYCpNUPUMRJ+JRR7QqEagniPmgt5VBRCGLj
	othm/2Xt8ZnRCmfPHl3biun017J3PziiQJyZCN5f/TrhKuFNwigmmq26RrExL1tkFCz+
	0lXSv0goLYGl+W/U6IakCWuHS4MB1bUfT5W9YCHGJeT3qyxlKvhhmCNCKCXCv7RN05CJ
	Xy9yJYMBSTNoacJLSgGk5xNx8FWhJM9jmjDzpDAJS1/EN/FRjcTkQqmWZ3ii1bnR8MnS
	BZ1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=WPL+OzZMK2iOsx0O3fG8hRR6/CETaIEwMtYqCZpPWWY=;
	b=Et1RnRzAb3+9HXHY5akAuctyM447Fa4/Na3SgfLIBrJrfjPcVmuh4+AV+KN5Vs2nvc
	Yii1HU2k4ant9B62iuC9PF9XLyUdn9bxxCgsiI5NNiFjhc+pb0KR/35zNQOErP4EpAzW
	Nfo/uNFnW29NfcNIXst2ajAWgNILEi1UVxFx0aWDdppM1brHu+1P0a8fhDZ34BjUoD+V
	qpERaBinuw5H+TIpckosBXCMfOtcLmd8AxmZCJPNgUiTV2qgdCe7HFxYcYeRUM9J6HtQ
	O8B8v5X3VpLtFUjyyzezu7kFer6NPtoJv9lq4HUmNoAC/tGatXywhrjeWf62LTkESRUo
	JcfQ==
X-Gm-Message-State: APzg51B/fiKGUWAjhVvYIQnyxfalspXI0AdcLyZ4daPK9RDqyPFC6YRb
	GMCbFNHUCLVHi2yfkDKWVE+aLx4EToQ0W1z6VIqda30z
X-Google-Smtp-Source: ANB0VdZSuxrcL/GED15GmBNcfbQGRaD+ExMX5PXyf+L1/aTtwXTp3rZzloxoK14CeV9VCauo8IJe5AjRLZCa/xdWXnc=
X-Received: by 2002:ac8:6c8:: with SMTP id
	j8-v6mr24845049qth.314.1535953408402; 
	Sun, 02 Sep 2018 22:43:28 -0700 (PDT)
MIME-Version: 1.0
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 2 Sep 2018 22:43:02 -0700
Message-ID: <CAMKF1spYyj-18urxsniwFac5TV__ve_NY71L_ruyvF+XJ-H3_Q@mail.gmail.com>
To: openembeded-devel <Openembedded-devel@lists.openembedded.org>
Subject: State of the world, 2018-09-02
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
X-List-Received-Date: Mon, 03 Sep 2018 05:43:28 -0000
Content-Type: text/plain; charset="UTF-8"

http://www.openembedded.org/wiki/Bitbake_World_Status

== Number of issues - stats ==
{| class='wikitable'
!|Date     !!colspan='4'|Failed tasks    !!|Signatures
!!colspan='15'|QA !!Comment
|-
|| ||qemuarm ||qemuarm64 ||qemux86 ||qemux86_64 ||all
||already-stripped ||libdir ||textrel ||build-deps ||file-rdeps
||version-going-backwards ||host-user-contaminated
||installed-vs-shipped ||unknown-configure-option ||symlink-to-sysroot
||invalid-pkgconfig ||pkgname ||ldflags ||compile-host-path
||qa_pseudo ||
|-
||2018-09-02 ||38 ||38 ||46 ||36 ||9 ||0 ||0 ||6 ||2 ||0 ||32 ||0 ||0
||1 ||0 ||0 ||0 ||0 ||0 ||0 ||
|}

== Failed tasks 2018-09-02 ==

INFO: jenkins-job.sh-1.8.45 Complete log available at
http://logs.nslu2-linux.org/buildlogs/oe/world/thud/log.report.20180902_193948.log

=== common (31) ===
    * sources/meta-openembedded/meta-multimedia/recipes-dvb/oscam/oscam_svn.bb:do_compile
    * sources/meta-openembedded/meta-multimedia/recipes-multimedia/gstreamer-1.0/gstd_1.0.bb:do_configure
    * sources/meta-openembedded/meta-multimedia/recipes-multimedia/rtmpdump/rtmpdump_2.4.bb:do_compile
    * sources/meta-openembedded/meta-networking/recipes-connectivity/crda/crda_3.18.bb:do_compile
    * sources/meta-openembedded/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb:do_compile
    * sources/meta-openembedded/meta-networking/recipes-daemons/openhpi/openhpi_3.6.1.bb:do_compile
    * sources/meta-openembedded/meta-networking/recipes-irc/znc/znc_git.bb:do_compile
    * sources/meta-openembedded/meta-networking/recipes-protocols/nopoll/nopoll_0.4.2.b297.bb:do_compile
    * sources/meta-openembedded/meta-networking/recipes-protocols/openflow/openflow_git.bb:do_compile
    * sources/meta-openembedded/meta-networking/recipes-support/fetchmail/fetchmail_6.3.26.bb:do_compile
    * sources/meta-openembedded/meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.8.2.bb:do_compile
    * sources/meta-openembedded/meta-networking/recipes-support/uftp/uftp_4.9.3.bb:do_compile
    * sources/meta-openembedded/meta-oe/recipes-connectivity/libimobiledevice/libimobiledevice_1.1.4.bb:do_compile
    * sources/meta-openembedded/meta-oe/recipes-connectivity/libtorrent/libtorrent_git.bb:do_compile
    * sources/meta-openembedded/meta-oe/recipes-connectivity/umip/umip_1.0.bb:do_compile
    * sources/meta-openembedded/meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb:do_compile
    * sources/meta-openembedded/meta-oe/recipes-crypto/pkcs11-helper/pkcs11-helper_1.11.bb:do_compile
    * sources/meta-openembedded/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb:do_compile
    * sources/meta-openembedded/meta-oe/recipes-devtools/uw-imap/uw-imap_2007f.bb:do_compile
    * sources/meta-openembedded/meta-oe/recipes-extended/boinc/boinc-client_7.6.33.bb:do_compile
    * sources/meta-openembedded/meta-oe/recipes-extended/openwsman/openwsman_2.6.4.bb:do_compile
    * sources/meta-openembedded/meta-oe/recipes-extended/pam/pam-ssh-agent-auth_0.10.3.bb:do_compile
    * sources/meta-openembedded/meta-oe/recipes-kernel/ipmitool/ipmitool_1.8.18.bb:do_compile
    * sources/meta-openembedded/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb:do_compile
    * sources/meta-openembedded/meta-oe/recipes-support/asio/asio_1.10.6.bb:do_compile
    * sources/meta-openembedded/meta-oe/recipes-support/libgit2/libgit2_0.24.3.bb:do_compile
    * sources/meta-openembedded/meta-oe/recipes-support/liboauth/liboauth_1.0.3.bb:do_compile
    * sources/meta-openembedded/meta-oe/recipes-support/links/links_2.7.bb:do_compile
    * sources/meta-openembedded/meta-oe/recipes-support/links/links-x11_2.7.bb:do_compile
    * sources/meta-openembedded/meta-oe/recipes-support/opensc/opensc_0.16.0.bb:do_compile
    * sources/meta-openembedded/meta-oe/recipes-support/synergy/synergy_git.bb:do_compile

=== common-x86 (2) ===
    * sources/meta-openembedded/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_git.bb:do_patch
    * sources/meta-openembedded/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_5.2.8.bb:do_compile

=== qemuarm (7) ===
    * sources/meta-openembedded/meta-networking/recipes-connectivity/kea/kea_1.4.0.bb:do_compile
    * sources/meta-openembedded/meta-networking/recipes-support/libldb/libldb_1.4.1.bb:do_package_qa
    * sources/meta-openembedded/meta-oe/recipes-extended/mozjs/mozjs_52.8.1.bb:do_configure
    * sources/meta-openembedded/meta-oe/recipes-extended/redis/redis_4.0.8.bb:do_compile
    * sources/meta-openembedded/meta-oe/recipes-extended/upm/upm_git.bb:do_compile
    * sources/meta-qt5/recipes-qt/qt5/qtbase_git.bb:do_configure
    * sources/openembedded-core/meta/recipes-devtools/go/go-runtime_1.9.bb:do_compile

=== qemuarm64 (4) ===
    * sources/meta-browser/recipes-browser/chromium/chromium-ozone-wayland_64.0.3274.0.r517731.igalia.1.bb:do_compile
    * sources/meta-browser/recipes-browser/chromium/chromium-x11_68.0.3440.106.bb:do_compile
    * sources/meta-openembedded/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_git.bb:do_compile
    * sources/meta-openembedded/meta-python/recipes-devtools/python/python-pyflame_1.6.6.bb:do_compile

=== qemux86 (12) ===
    * sources/meta-openembedded/meta-initramfs/recipes-devtools/klibc/klibc_2.0.4.bb:do_compile
    * sources/meta-openembedded/meta-initramfs/recipes-devtools/klibc/klibc-static-utils_2.0.4.bb:do_compile
    * sources/meta-openembedded/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.3.bb:do_compile
    * sources/meta-openembedded/meta-networking/recipes-protocols/tsocks/tsocks_1.8beta5.bb:do_compile
    * sources/meta-openembedded/meta-oe/recipes-dbs/mongodb/mongodb_git.bb:do_compile
    * sources/meta-openembedded/meta-python/recipes-devtools/python/python3-m2crypto_0.30.1.bb:do_compile
    * sources/meta-openembedded/meta-python/recipes-devtools/python/python-m2crypto_0.30.1.bb:do_compile
    * sources/meta-qt5/recipes-qt/qt5/qt5-creator_4.5.1.bb:do_compile
    * sources/meta-qt5/recipes-qt/qt5/qtwebengine_git.bb:do_compile
    * sources/meta-qt5/recipes-qt/qt5/qtwebkit-examples_git.bb:do_compile
    * sources/openembedded-core/meta/recipes-graphics/mesa/mesa_18.1.7.bb:do_package_qa
    * sources/openembedded-core/meta/recipes-multimedia/x264/x264_git.bb:do_package_qa

=== qemux86_64 (0) ===

=== Number of failed tasks (158) ===
{| class=wikitable
|-
|| qemuarm || 38 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/thud/log.world.qemuarm.20180902_073910.log/
||
|-
|| qemuarm64 || 38 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/thud/log.world.qemuarm64.20180902_084833.log/
||
|-
|| qemux86 || 46 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/thud/log.world.qemux86.20180902_073921.log/
||
|-
|| qemux86_64 || 36 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/thud/log.world.qemux86-64.20180902_092525.log/
||
|}

=== PNBLACKLISTs (0) ===

=== QA issues (41) ===
{| class=wikitable
!| Count ||Issue
|-
||0 ||already-stripped
|-
||0 ||compile-host-path
|-
||0 ||file-rdeps
|-
||0 ||host-user-contaminated
|-
||0 ||installed-vs-shipped
|-
||0 ||invalid-pkgconfig
|-
||0 ||ldflags
|-
||0 ||libdir
|-
||0 ||pkgname
|-
||0 ||qa_pseudo
|-
||0 ||symlink-to-sysroot
|-
||1 ||unknown-configure-option
|-
||2 ||build-deps
|-
||32 ||version-going-backwards
|-
||6 ||textrel
|}



=== Incorrect PACKAGE_ARCH or sstate signatures (9) ===

Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/thud/log.signatures.20180902_095951.log/
    * ERROR: 9 issues were found in these recipes: 96boards-tools
oprofile packagegroup-core-standalone-sdk-target
packagegroup-core-tools-debug packagegroup-self-hosted
phoronix-test-suite phpmyadmin

    * ERROR: 1 errors found in signatures.qemux86.do_configure.sigdata.log
    * ERROR: 1 errors found in
signatures.qemux86.do_populate_sysroot.sigdata.log
    * ERROR: 1 errors found in
signatures.qemux86.do_package_write_ipk.sigdata.log
    * ERROR: 6 errors found in
signatures.qemuarm.do_package_write_ipk.sigdata.log

    * ERROR: oprofile different signature for task
do_configure.sigdata between qemux86copy and qemux86
    * ERROR: 1 errors found in
/home/jenkins/oe/world/oe-build/build/tmpfs/sstate-diff/1535918391/signatures.qemux86.do_configure.sigdata.log
    * ERROR: oprofile different signature for task
do_populate_sysroot.sigdata between qemux86copy and qemux86
    * ERROR: 1 errors found in
/home/jenkins/oe/world/oe-build/build/tmpfs/sstate-diff/1535918391/signatures.qemux86.do_populate_sysroot.sigdata.log
    * ERROR: oprofile different signature for task
do_package_write_ipk.sigdata between qemux86copy and qemux86
    * ERROR: 1 errors found in
/home/jenkins/oe/world/oe-build/build/tmpfs/sstate-diff/1535918391/signatures.qemux86.do_package_write_ipk.sigdata.log
    * ERROR: 96boards-tools different signature for task
do_package_write_ipk.sigdata between qemux86copy and qemuarm
    * ERROR: packagegroup-core-standalone-sdk-target different
signature for task do_package_write_ipk.sigdata between qemux86copy
and qemuarm
    * ERROR: packagegroup-core-tools-debug different signature for
task do_package_write_ipk.sigdata between qemux86copy and qemuarm
    * ERROR: packagegroup-self-hosted different signature for task
do_package_write_ipk.sigdata between qemux86copy and qemuarm
    * ERROR: phoronix-test-suite different signature for task
do_package_write_ipk.sigdata between qemux86copy and qemuarm
    * ERROR: phpmyadmin different signature for task
do_package_write_ipk.sigdata between qemux86copy and qemuarm
    * ERROR: 6 errors found in
/home/jenkins/oe/world/oe-build/build/tmpfs/sstate-diff/1535918391/signatures.qemuarm.do_package_write_ipk.sigdata.log
    * ERROR: 9 issues were found in these recipes: 96boards-tools
oprofile packagegroup-core-standalone-sdk-target
packagegroup-core-tools-debug packagegroup-self-hosted
phoronix-test-suite phpmyadmin


PNBLACKLISTs:
openembedded-core/:
meta-*:
PNBLACKLIST[android-system] = "depends on lxc from
meta-virtualiazation which isn't included in my world builds"
PNBLACKLIST[bigbuckbunny-1080p] = "big and doesn't really need to be
tested so much"
PNBLACKLIST[bigbuckbunny-480p] = "big and doesn't really need to be
tested so much"
PNBLACKLIST[bigbuckbunny-720p] = "big and doesn't really need to be
tested so much"
PNBLACKLIST[bigbuckbunny-720p] = "big and doesn't really need to be
tested so much"
PNBLACKLIST[tearsofsteel-1080p] = "big and doesn't really need to be
tested so much"
PNBLACKLIST[build-appliance-image] = "tries to include whole downloads
directory in /home/builder/poky :/"


QA issues by type:
count: 0 issue: already-stripped


count: 0 issue: libdir


count: 6 issue: textrel
mesa-18.1.7: ELF binary
'/tmp/work/i586-bec-linux-musl/mesa/2_18.1.7-r0/packages-split/libglapi/usr/lib/libglapi.so.0.0.0'
has relocations in .text [textrel]
mesa-18.1.7: ELF binary
'/tmp/work/i586-bec-linux-musl/mesa/2_18.1.7-r0/packages-split/libgles1-mesa/usr/lib/libGLESv1_CM.so.1.1.0'
has relocations in .text [textrel]
mesa-18.1.7: ELF binary
'/tmp/work/i586-bec-linux-musl/mesa/2_18.1.7-r0/packages-split/libgles2-mesa/usr/lib/libGLESv2.so.2.0.0'
has relocations in .text [textrel]
mesa-18.1.7: ELF binary
'/tmp/work/i586-bec-linux-musl/mesa/2_18.1.7-r0/packages-split/libgl-mesa/usr/lib/libGL.so.1.2.0'
has relocations in .text [textrel]
x264-r2854+gitAUTOINC+e9a5903edf: ELF binary
'/tmp/work/i586-bec-linux-musl/x264/r2854+gitAUTOINC+e9a5903edf-r0/packages-split/x264-bin/usr/bin/x264'
has relocations in .text [textrel]
x264-r2854+gitAUTOINC+e9a5903edf: ELF binary
'/tmp/work/i586-bec-linux-musl/x264/r2854+gitAUTOINC+e9a5903edf-r0/packages-split/x264/usr/lib/libx264.so.152'
has relocations in .text [textrel]


count: 2 issue: build-deps
libldb-1.4.1: libldb rdepends on samba, but it isn't a build
dependency, missing samba in DEPENDS or PACKAGECONFIG? [build-deps]
libldb-1.4.1: pyldb rdepends on samba, but it isn't a build
dependency, missing samba in DEPENDS or PACKAGECONFIG? [build-deps]


count: 0 issue: file-rdeps


count: 32 issue: version-going-backwards
packagegroup-core-standalone-sdk-target-1.0: Package version for
package packagegroup-core-standalone-sdk-target-dbg went backwards
which would break package feeds from (0:1.0-r8.2 to 0:1.0-r8.1)
[version-going-backwards]
packagegroup-core-standalone-sdk-target-1.0: Package version for
package packagegroup-core-standalone-sdk-target-dev went backwards
which would break package feeds from (0:1.0-r8.2 to 0:1.0-r8.1)
[version-going-backwards]
packagegroup-core-standalone-sdk-target-1.0: Package version for
package packagegroup-core-standalone-sdk-target-ptest went backwards
which would break package feeds from (0:1.0-r8.2 to 0:1.0-r8.1)
[version-going-backwards]
packagegroup-core-standalone-sdk-target-1.0: Package version for
package packagegroup-core-standalone-sdk-target went backwards which
would break package feeds from (0:1.0-r8.2 to 0:1.0-r8.1)
[version-going-backwards]
packagegroup-core-tools-debug-1.0: Package version for package
packagegroup-core-tools-debug-dbg went backwards which would break
package feeds from (0:1.0-r3.2 to 0:1.0-r3.1)
[version-going-backwards]
packagegroup-core-tools-debug-1.0: Package version for package
packagegroup-core-tools-debug-dev went backwards which would break
package feeds from (0:1.0-r3.2 to 0:1.0-r3.1)
[version-going-backwards]
packagegroup-core-tools-debug-1.0: Package version for package
packagegroup-core-tools-debug-ptest went backwards which would break
package feeds from (0:1.0-r3.2 to 0:1.0-r3.1)
[version-going-backwards]
packagegroup-core-tools-debug-1.0: Package version for package
packagegroup-core-tools-debug went backwards which would break package
feeds from (0:1.0-r3.2 to 0:1.0-r3.1) [version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-dbg went backwards which would break package
feeds from (0:1.0-r13.2 to 0:1.0-r13.1) [version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-debug-dbg went backwards which would break
package feeds from (0:1.0-r13.2 to 0:1.0-r13.1)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-debug-dev went backwards which would break
package feeds from (0:1.0-r13.2 to 0:1.0-r13.1)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-debug-ptest went backwards which would break
package feeds from (0:1.0-r13.2 to 0:1.0-r13.1)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-debug went backwards which would break
package feeds from (0:1.0-r13.2 to 0:1.0-r13.1)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-dev went backwards which would break package
feeds from (0:1.0-r13.2 to 0:1.0-r13.1) [version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-extended-dbg went backwards which would break
package feeds from (0:1.0-r13.2 to 0:1.0-r13.1)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-extended-dev went backwards which would break
package feeds from (0:1.0-r13.2 to 0:1.0-r13.1)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-extended-ptest went backwards which would
break package feeds from (0:1.0-r13.2 to 0:1.0-r13.1)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-extended went backwards which would break
package feeds from (0:1.0-r13.2 to 0:1.0-r13.1)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-graphics-dbg went backwards which would break
package feeds from (0:1.0-r13.2 to 0:1.0-r13.1)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-graphics-dev went backwards which would break
package feeds from (0:1.0-r13.2 to 0:1.0-r13.1)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-graphics-ptest went backwards which would
break package feeds from (0:1.0-r13.2 to 0:1.0-r13.1)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-graphics went backwards which would break
package feeds from (0:1.0-r13.2 to 0:1.0-r13.1)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-host-tools-dbg went backwards which would
break package feeds from (0:1.0-r13.2 to 0:1.0-r13.1)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-host-tools-dev went backwards which would
break package feeds from (0:1.0-r13.2 to 0:1.0-r13.1)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-host-tools-ptest went backwards which would
break package feeds from (0:1.0-r13.2 to 0:1.0-r13.1)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-host-tools went backwards which would break
package feeds from (0:1.0-r13.2 to 0:1.0-r13.1)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-ptest went backwards which would break
package feeds from (0:1.0-r13.2 to 0:1.0-r13.1)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-sdk-dbg went backwards which would break
package feeds from (0:1.0-r13.2 to 0:1.0-r13.1)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-sdk-dev went backwards which would break
package feeds from (0:1.0-r13.2 to 0:1.0-r13.1)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-sdk-ptest went backwards which would break
package feeds from (0:1.0-r13.2 to 0:1.0-r13.1)
[version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted-sdk went backwards which would break package
feeds from (0:1.0-r13.2 to 0:1.0-r13.1) [version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package
packagegroup-self-hosted went backwards which would break package
feeds from (0:1.0-r13.2 to 0:1.0-r13.1) [version-going-backwards]


count: 0 issue: host-user-contaminated


count: 0 issue: installed-vs-shipped


count: 1 issue: unknown-configure-option
gstd-1.0: gstd: configure was passed unrecognised options:
--disable-gtk-doc [unknown-configure-option]


count: 0 issue: symlink-to-sysroot


count: 0 issue: invalid-pkgconfig


count: 0 issue: pkgname


count: 0 issue: ldflags


count: 0 issue: compile-host-path


count: 0 issue: qa_pseudo



This git log matches with the metadata as seen by qemuarm build.
In some cases qemux86 and qemux86-64 builds are built with slightly
different metadata, you can see the exact version near the top of each
log.world.qemu* files linked from the report
~/oe/world/oe-build ~/oe/world/oe-build

== Tested changes (not included in master yet) - bitbake ==
latest upstream commit:
43ff74d tests/fetch: Update gnome.org urls after upstream changes
not included in master yet:

== Tested changes (not included in master yet) - openembedded-core ==
latest upstream commit:
853e049 ruby: improve reproducibility
not included in master yet:
42acb0e lib/oe/package_manager: turn postinst failure warnings into
bitbake failures
163764a sdk/context.py: add ability to check for multilib version of
target package
ce82ee4 sdk/buldgalculator.py: check against multilib for gtk+3
595e992 oeqa/sdk: fixes related to hasPackage semantics
4f662b2 oeqa/runtime/dnf: Make sure test_dnf_install does not skipped
8e280af elfutils: Fix prelink libqb error on mips and mips64
38c410b security_flags.inc: use `?=' to set a default var-lcl_maybe_fortify
0ed4a62 security_flags.inc: add var-SECURITY_STACK_PROTECTOR to
improve variable OVERRIDES
4c3395a allarch: disable allarch when multilib is used
84ecfdc sstate.bbclass: update SSTATE_DUPWHITELIST
7ebcca3 update_font_cache: update script for multilib
211fe48 update_gtk_immodules_cache: update for multilib
fd471d7 statetests.py: drop test_sstate_allarch_samesigs_multilib
f3499c5 multilib: fix install file conflicts
faa944e distutils-common-base.bbclass: Define commonly used compiler variables
b3a9ab7 systemd: Fix qsort_r patch for function return mismatch
3efc123 musl: Update to latest
f76cc1f gpgme: Inherit distutils3-base
a55f49a libarchive: CVE-2017-14501
d463f5e libcgroup: CVE-2018-14348
2bba9f1 libsdl2: Fix left rotated display for RaspPi/VC4/GLES2
bbf2a14 libjpeg-turbo: fix wrongly defined HAVE_STDLIB_H
a3dbcbd kernel-devsrc: fix arm/arm64 target module build
05fd1e8 linux-yocto: drop 4.15 versioned recipe
e045d1c linux-yocto/4.12: drop versioned recipes
c512fee linux-yocto/4.18: remove obselete bsp configuration options
d49393d qemuarm64: add compatibility with -rt
61ccb1f linux-yocto/4.18: update to 4.18.5
4e06577 linux-yocto/4.14: update to v4.14.67
d9cb0fe kernel-yocto/cfg: configuration warning fixes
dec56f2 add todo to worker
92e44d8 boost: Fix invalid const in atomic builtins
2756568 libc-package: Add risc-v specific options to cross-localedef invocation
2b1ee2b glibc-locale: Enable riscv64 and riscv32 in
BINARY_LOCALE_ARCHES supported architectures
ec1e165 packagegroup-core-tools-testapps: Exclude gst-examples on riscv64
d9d742c tcf-agent: Disable non-building features on riscv64
8d831ca gdb: Seprate out gold and dwp into a variable
25da5ab openssh: update from 7.7p1 to 7.8p1
3d48210 package.bbclass: warn if perms conf file does not exist
e12710b openssl: rename openssl 1.0.x to openssl10 and make openssl
1.1.x the default version
47d76ca cryptodev-tests: port to openssl 1.1
b445ab8 openssl: update to 1.1.1
7c9eda8 libressl: add a recipe to support openssh
0ca8fc8 ca-certificates: update to 20180409
6ce8037 openssl: do not tweak so names, use PRIVATE_LIBS instead
8c5db9e go-dep: Update 0.4.1 -> 0.5.0
e6a1e5e linux-firmware: Update to feb25f3e revision
db0f491 mesa: Upgrade 18.1.3 -> 18.1.7
f240dbb recipes: Update git.gnome.org addresses after upstream changes
6626ff8 oeqa/selftest/runtime_test: Fix
runtime_test.TestImage.test_testimage_install after ssl changes
929b1b3 openssl: Handle -conf package file conflicts
86bd28b sysklogd: Use update-alternatives
7c0099b packagegroup-core-x11-sato: Make weak include for gst-examples
665301f musl: Update to 1.1.20

== Tested changes (not included in master yet) - meta-openembedded ==
latest upstream commit:
6964fa5 nmap: install ndiff
not included in master yet:
a4a9c0a xerces-c: Update SRC_URI
77966d0 mbedtls: upgrade to 2.12.0
29158f7 lftp: CVE-2018-10916
cc7bce6 ell: update to 0.8
7d1f239 eventlog: update SRC_URI to fetch from git
e5d9482 xfsprogs: Fix build on mips
093ab60 espeak: Fix cp command to preserve mode
62489d5 espeak: Add -fPIC to CFLAGS needed on some arches with security flags on
3e69704 autofs: specify fifodir and flagdir
815f62b libio-socket-ssl-perl: 2.058 -> 2.059
8b021f3 apache2: set files layout to debian style
6782e58 autofs: Do not use pkg.m4 from build host
2511a25 net-snmp: Fix host contamination
6c9ac25 meta-python: Add python-pyflame recipe
82fc7b9 meta-python: Port python-pyflame to 32-bit ARM
bdf5540 meta-python: Make python-pyflame cope with prelinked ELFs
a855c5b python-pyflame: Limit support to just glibc based systems
9b5562e python-pyflame: Use SHA instead of tag in SRC_URI
5cf9a14 mongodb: Upgrade to 4.0.1 release
eac9bd9 Update maintainers
a24b4c1 lmbench: fix usrmerge install path
38717e1 python-pyflame: Disable for mips arch
1db2116 can-isotp: Upgrade to latest
0c9d8b0 gedit: Add dep on python-six-native
c6b76a8 mongodb: Exclude on mips arch
8d3d529 libpwquality: Inherit distutils3-base
e78cf91 python{3, }-protobuf: consolidate CLEANBROKEN
c591e5d python{, 3}-pint: add recipes for python2 and python3
218c1e7 python{, 3}-intervals: add recipes for python2/3
de3d90e python3-pyconnman: add recipe
d9309e4 python{, 3}-grpcio-tools: update 1.8.4 -> 1.14.1
b3b3449 python{,3}-grpcio: update to 1.14.1
15bd5f4 python{, 3}-m2crypto: update from 0.26.4 -> 0.30.1
196a373 kernel-selftest: Fix the COPYING checksum variablity
0b18276 drbd-utils: fix usrmerge install path
901af82 zsh: Delete ${D}/usr if empty
fd8a326 open-vm-tools: Upgrade to 10.3.0
bae481e wireless-regdb: make wireless-regdb architecture independent
a8c59cf snappy: add -fPIC flags
8e63f18 cyrus-sasl: CLEANBROKEN = "1"
d361917 php: 7.2.8 -> 7.2.9
e427280 nodejs: 8.11.3 -> 8.11.4
0a83476 libcrypt-openssl-guess: Add recipe
1fd6163 libcrypt-openssl-rsa-perl: Update to 0.30
9070ae8 libnet-ssleay-perl: Fix configure issue
60f6414 protobuf: Update from 3.6.0.1 -> 3.6.1
aa6b137 protobuf-c: Update 1.3.0 -> 1.3.1
46aa68d python{, 3}-protobuf: Update 3.6.0 -> 3.6.1
948a85f grpc: update from 1.8.5 -> 1.14.1
840850e php: define PACKAGECONFIG[] for valgrind
48b61ca turbostat: Provide a persistent COPYING file
b3f3251 civetweb: Fix build with clang
028208f memcached: Update to 1.5.10
c7285f6 mcelog: Upgrade to 160
4fb7aa8 cryptsetup: Upgrade to 2.0.4
f60b850 python-pytest-tempdir: add recipe
2b5fb4f python3-pytest-tempdir: add recipe
3465362 python-pytest-helpers-namespace: add recipe
00deeee python3-pytest-helpers-namespace: add recipe
c50d90b spitools: 0.8.1 -> 0.8.3
72869dc rsyslog: update from 8.36 to 8.37
3c6eceb crda: Fix 64bit builds by inheriting siteinfo class
cb57282 ndisc6: Do not use gold linker and disable rpath
58062ba libkcapi: Upgrade to 1.1.3
685715f abiword: use fribidi not libfribidi
e8b9543 vlc: use fribidi not libfribidi
b5d062a kexec-tools-klibc: fix kexec_load() syscall workaround
8eae2f8 kexec-tools-klibc: upgrade to latest master
4abf0f4 phoronix-test-suite: add dependency on lsb_release
d128fce kexec-tools-klibc: sync patches with oe-core
c56b2fc kexec-tools-klibc: package vmcore-dmesg-klibc
28d225b kexec-tools-klibc: add kexec-x32.patch from oe-core
35952ed python-m2crypto: Add STDC_HOSTED to grep regexp
8cb7fd1 jack: Fix build with python 3.7+
85466e3 libp11: Fix build with openssl 1.1+

== Tested changes (not included in master yet) - meta-qt5 ==
latest upstream commit:
9ffdd55 qtscript: Update the custom patch from mainline
not included in master yet:
16eb842 qtscript: Fix build on musl
0ebee59 qt3d-runtime: Fix compile errors as seen with mips/musl
74c0945 qtwebkit: Fix build with musl
3065292 qtwebkit: Fix conflicts with -I and -isystem
7e6a42e qt5-creator: Fix building botan for all non-x86 arches
099ef3e qt5-creator: Strip out redundant RPATH

== Tested changes (not included in master yet) - meta-browser ==
latest upstream commit:
f2e6235 chromium-x11: Enable builds with clang
not included in master yet:
ff59505 chromium: Refactor clang patch to fix chromium-ozone-wayland
~/oe/world/oe-build

