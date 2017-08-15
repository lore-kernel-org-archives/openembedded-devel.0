Return-Path: <martin.jansa@gmail.com>
Received: from mail-vk0-f47.google.com (mail-vk0-f47.google.com
	[209.85.213.47])
	by mail.openembedded.org (Postfix) with ESMTP id B3EBA7833B;
	Tue, 15 Aug 2017 20:54:47 +0000 (UTC)
Received: by mail-vk0-f47.google.com with SMTP id n125so6419686vke.1;
	Tue, 15 Aug 2017 13:54:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=cSWQlSPVBoC5RM87Fo3uQHOvWmTCQ7xQrQyR+48jGlw=;
	b=LmVP7rEEcWkQ7M7YHFKoV8E3WfpnqhIKDn0b8pcI7J/7IUNqf8Ae2H1DaeQbYWTnWE
	0eUXG++c6FEbUkOJO1hedm0OLQMHzzRJBKGcoGQR4wI8qo3XfUOFaoD11R+HvxC+lL+R
	rd4zy3IqiF3ZNinAx3JTYPKgw+Napqm/anBNcGVuQbx9xcGiDeIcCwvTWwfz2tOT26JG
	TZSzp9UhGwOXkdzBzLHF0rFubkB23qOcFSkfGTodQOZFbaXbw4AuvmheWzOHltuC185t
	r+E5kYcMT8bs5094vTZl0/b42L9qBgOeBCmPaYaEDGVhlosaI1uBA9u6cTIAkNi8A8Hc
	JVkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=cSWQlSPVBoC5RM87Fo3uQHOvWmTCQ7xQrQyR+48jGlw=;
	b=RE7k3s81ZBvy8bOdD1f4wSjGyj86i5Su0C8TKULHUrSCNVioMcoEy8jXAzPS3b4W8r
	rCJALy+y6u89zikCeW1zpcjOyWlxBTTj+nTKKJXqkhJcghWprn1sWCkFJVcaDSQYA/sz
	CGEsPCSaH7pK9WzLAHVNill+Cljrs+bl3rPHFwhxpiIySxsXFHJQou751rUHOGFOfuPr
	vkFDcnas+zAksHV0BhaoMVkWueuQHTsjktchfQYbvy1VLztTi113R32V/fcSajoP0jB8
	aJhnuaZErpaRc9iIDcbEmNd5HuTxqO0ym1c0e3ovBiNGQwpMPlWffI9edV5Q0s1d2z7C
	hYGQ==
X-Gm-Message-State: AHYfb5j2u3KSSW+BjGNO6GR5ztkv0SiQmoHoaTP9QYYRqpIlu2+52N/6
	aHqvZUsLMQ3dbmYi7MFsj7Cu3M7zaMOs
X-Received: by 10.31.154.1 with SMTP id c1mr19993042vke.97.1502830488209; Tue,
	15 Aug 2017 13:54:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.122.88 with HTTP; Tue, 15 Aug 2017 13:54:47 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 15 Aug 2017 22:54:47 +0200
Message-ID: <CA+chaQe-dRsfrLiwwGr+zrCFGdAipva9eBmKA=Q9fv6y82Tq4w@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, 
	openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: State of bitbake world, Failed tasks 2017-08-15
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
X-List-Received-Date: Tue, 15 Aug 2017 20:54:48 -0000
Content-Type: text/plain; charset="UTF-8"

Most of these issues are probably caused by openssl upgrade in oe-core.

http://www.openembedded.org/wiki/Bitbake_World_Status

== Number of issues - stats ==
{| class='wikitable'
!|Date		     !!colspan='3'|Failed tasks			    !!|Signatures		
!!colspan='14'|QA !!Comment
|-
||		||qemuarm	||qemux86	||qemux86_64	||all
	||already-stripped	||libdir	||textrel	||build-deps	||file-rdeps	||version-going-backwards	||host-user-contaminated	||installed-vs-shipped	||unknown-configure-option	||symlink-to-sysroot	||invalid-pkgconfig	||pkgname	||ldflags	||compile-host-path	||
|-

||2017-08-15	||41	||35	||45	||0	||0		||0		||2		||0		||0		||0		||0		||0		||0		||0		||0		||0		||0		||0		||
|}

== Failed tasks 2017-08-15 ==

INFO: jenkins-job.sh-1.8.25 Complete log available at
http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.report.20170815_105243.log

=== common (30) ===
    * meta-openembedded/meta-multimedia/recipes-multimedia/rtmpdump/rtmpdump_2.4.bb:do_compile
    * meta-openembedded/meta-networking/recipes-connectivity/lftp/lftp_4.7.7.bb:do_compile
    * meta-openembedded/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb:do_compile
    * meta-openembedded/meta-networking/recipes-irc/znc/znc_git.bb:do_compile
    * meta-openembedded/meta-networking/recipes-protocols/nopoll/nopoll_0.4.2.b297.bb:do_compile
    * meta-openembedded/meta-networking/recipes-support/fetchmail/fetchmail_6.3.26.bb:do_compile
    * meta-openembedded/meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.8.2.bb:do_compile
    * meta-openembedded/meta-networking/recipes-support/openvpn/openvpn_2.4.2.bb:do_compile
    * meta-openembedded/meta-networking/recipes-support/uftp/uftp_4.9.3.bb:do_compile
    * meta-openembedded/meta-oe/recipes-connectivity/libtorrent/libtorrent_git.bb:do_compile
    * meta-openembedded/meta-oe/recipes-devtools/librcf/librcf_2.2.0.0.bb:do_compile
    * meta-openembedded/meta-oe/recipes-devtools/uw-imap/uw-imap_2007f.bb:do_compile
    * meta-openembedded/meta-oe/recipes-extended/cfengine/cfengine_3.9.0.bb:do_compile
    * meta-openembedded/meta-oe/recipes-extended/mailx/mailx_12.5-5.bb:do_compile
    * meta-openembedded/meta-oe/recipes-extended/openwsman/openwsman_2.6.2.bb:do_compile
    * meta-openembedded/meta-oe/recipes-extended/pam/pam-ssh-agent-auth_0.10.3.bb:do_compile
    * meta-openembedded/meta-oe/recipes-support/asio/asio_1.10.6.bb:do_compile
    * meta-openembedded/meta-oe/recipes-support/ipmitool/ipmitool_1.8.18.bb:do_compile
    * meta-openembedded/meta-oe/recipes-support/libgit2/libgit2_0.24.3.bb:do_compile
    * meta-openembedded/meta-oe/recipes-support/liboauth/liboauth_1.0.3.bb:do_compile
    * meta-openembedded/meta-oe/recipes-support/libp11/libp11_0.4.0.bb:do_compile
    * meta-openembedded/meta-oe/recipes-support/links/links_2.7.bb:do_compile
    * meta-openembedded/meta-oe/recipes-support/links/links-x11_2.7.bb:do_compile
    * meta-openembedded/meta-oe/recipes-support/pkcs11-helper/pkcs11-helper_1.11.bb:do_compile
    * meta-openembedded/meta-oe/recipes-support/postgresql/postgresql_9.4.11.bb:do_configure
    * meta-openembedded/meta-oe/recipes-support/synergy/synergy_git.bb:do_compile
    * meta-openembedded/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-rsa-perl_0.28.bb:do_compile
    * meta-openembedded/meta-python/recipes-devtools/python/python-m2crypto_0.25.1.bb:do_compile
    * virtual:native:meta-openembedded/meta-oe/recipes-support/gsoap/gsoap_2.8.12.bb:do_compile
    * virtual:native:meta-openembedded/meta-python/recipes-devtools/python/python-m2crypto_0.25.1.bb:do_compile

=== common-x86 (2) ===
    * meta-openembedded/meta-oe/recipes-devtools/nodejs/nodejs_4.8.3.bb:do_compile
    * meta-openembedded/meta-oe/recipes-support/mongodb/mongodb_git.bb:do_compile

=== qemuarm (11) ===
    * meta-openembedded/meta-multimedia/recipes-dvb/oscam/oscam_svn.bb:do_compile
    * meta-openembedded/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb:do_compile
    * meta-openembedded/meta-oe/recipes-connectivity/libimobiledevice/libimobiledevice_1.1.4.bb:do_compile
    * meta-openembedded/meta-oe/recipes-connectivity/thrift/thrift_0.9.3.bb:do_compile
    * meta-openembedded/meta-oe/recipes-connectivity/umip/umip_1.0.bb:do_compile
    * meta-openembedded/meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb:do_compile
    * meta-openembedded/meta-oe/recipes-support/freerdp/freerdp_git.bb:do_compile
    * meta-openembedded/meta-oe/recipes-support/mysql/mariadb_5.5.55.bb:do_compile
    * meta-openembedded/meta-oe/recipes-support/opensc/opensc_0.16.0.bb:do_compile
    * meta-openembedded/meta-oe/recipes-support/syslog-ng/syslog-ng_3.8.1.bb:do_compile
    * openembedded-core/meta/recipes-devtools/llvm/llvm_git.bb:do_compile

=== qemux86 (1) ===
    * openembedded-core/meta/recipes-core/systemd/systemd_234.bb:do_compile

=== qemux86_64 (4) ===
    * meta-browser/recipes-mozilla/firefox/firefox_45.9.0esr.bb:do_compile
    * meta-openembedded/meta-oe/recipes-extended/boinc/boinc-client_7.6.33.bb:do_compile
    * meta-openembedded/meta-oe/recipes-support/xmlstarlet/xmlstarlet_1.6.1.bb:do_compile
    * meta-qt5/recipes-qt/qt5/qtbase_git.bb:do_compile

=== Number of failed tasks (121) ===
{| class=wikitable
|-
|| qemuarm 	|| 41	 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.world.qemuarm.20170813_013421.log/
|| http://errors.yoctoproject.org/Errors/Build/43360/
|-
|| qemux86 	|| 35	 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.world.qemux86.20170813_013415.log/
|| http://errors.yoctoproject.org/Errors/Build/43332/http://errors.yoctoproject.org/Errors/Build/43333/
|-
|| qemux86_64 	|| 45	 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.world.qemux86-64.20170815_024611.log/
|| http://errors.yoctoproject.org/Errors/Build/43400/
|}

=== PNBLACKLISTs (1) ===

=== QA issues (2) ===
{| class=wikitable
!| Count		||Issue
|-
||0	||already-stripped
|-
||0	||build-deps
|-
||0	||compile-host-path
|-
||0	||file-rdeps
|-
||0	||host-user-contaminated
|-
||0	||installed-vs-shipped
|-
||0	||invalid-pkgconfig
|-
||0	||ldflags
|-
||0	||libdir
|-
||0	||pkgname
|-
||0	||symlink-to-sysroot
|-
||0	||unknown-configure-option
|-
||0	||version-going-backwards
|-
||2	||textrel
|}



=== Incorrect PACKAGE_ARCH or sstate signatures (0) ===

Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.signatures.20170813_193705.log/

No issues detected


PNBLACKLISTs:
openembedded-core/:
meta-browser:
meta-openembedded:
meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.17.bb:PNBLACKLIST[lksctp-tools]
?= "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', "BROKEN:
fails to link against sctp_connectx symbol", '', d)}"
meta-qt5:
meta-smartphone:
meta-webos-ports:
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
count: 0	issue: already-stripped


count: 0	issue: libdir


count: 2	issue: textrel
x264-r2731+gitAUTOINC+2b741f81e5: ELF binary
'/tmp/work/i586-oe-linux/x264/r2731+gitAUTOINC+2b741f81e5-r0/packages-split/x264-bin/usr/bin/x264'
has relocations in .text [textrel]
x264-r2731+gitAUTOINC+2b741f81e5: ELF binary
'/tmp/work/i586-oe-linux/x264/r2731+gitAUTOINC+2b741f81e5-r0/packages-split/x264/usr/lib/libx264.so.148'
has relocations in .text [textrel]


count: 0	issue: build-deps


count: 0	issue: file-rdeps


count: 0	issue: version-going-backwards


count: 0	issue: host-user-contaminated


count: 0	issue: installed-vs-shipped


count: 0	issue: unknown-configure-option


count: 0	issue: symlink-to-sysroot


count: 0	issue: invalid-pkgconfig

count: 0	issue: pkgname


count: 0	issue: ldflags


count: 0	issue: compile-host-path



== Tested changes (not included in master yet) - bitbake ==
latest upstream commit:
218e4b6 cooker: Ignore common bitbake files for the parse cache invalidation
not included in master yet:
7906cf9 world-image: add extra target

== Tested changes (not included in master yet) - openembedded-core ==

latest upstream commit:
5a25ed1 image-prelink: Disable for musl images
not included in master yet:
5e89705 report-error: Allow to upload reports automatically
e775bfb buildhistory.bbclass: metadata-revs show repo parent
7f967a7 metadata-revs: provide more information
b2ed35d qemux86: Add identical qemux86copy variant for tests
3b75f37 rm_work: fix build break for do_image_complete

== Tested changes (not included in master yet) - meta-openembedded ==

latest upstream commit:
ac2a6d2 json-spirit: Add -latomic to LDFLAGS
not included in master yet:
6ff499b dnsmasq: disable the service by default
ca0e943 rdate: Fix build with hardening
7e3d8e4 strongswan: Include stdint.h for uintptr_t
217431e netkit-rpc: Fix build with hardening flags
f3819cc netkit-telnet: Fix build with hardening
048e071 ncftp: Upgrade to 3.2.6
61495a9 autofs: Add build dependency on libnsl2
96e606d openhpi: Fix build on 64bit platforms e.g. aarch64
7feddb1 security_flags.inc: Delete
a4723a6 pptp-linux: Upgrade to 1.9.0
ab4774e ebtables: replace ebtables-save perl script with bash rewrite
3a96b76 pimd: Upgrade to 2.3.2
aa43496 igmpproxy: Include missing sys/tupes.h and define _GNU_SOURCE
92bc7d2 rdate: Define logwtmp if libc != glibc
a04b53f netkit-ftp: Include sys/types.h for u_long definition
feb1653 postfix: Disable nis support on musl
93ee634 zeroconf: Fix build with musl
163c868 netperf: change SRC_URI to git repository
4c2b4c4 ippool: Fix build errors found with hardening flags
5ebba48 openflow: Fix build with musl
610e392 xl2tpd: Update to 1.3.9
53982a0 c-ares: update 1.12.0 -> 1.13.0
b101101 radvd: 2.14 -> 2.17
9a7309d libesmtp: Fix config.h define for snprintf detection
b9b2b01 drbd: Add recipe
b7b27a5 net-snmp: fix engineBoots value on SIGHUP
f8559af openl2tp: add LGPL-2.1 license
ce8ed9a openl2tp: add init script and systemd support
4f97a6c ntop: add new recipe
21479a9 libtdb: update 1.3.12 -> 1.3.14
d946a42 ndisc6: Upgrade to 1.0.3
f3dd13e memcached: Update to 1.5.0
3436c8e tcpdump: remove unnecessary patch
209a90c squid: Add missing dependencies on openssl expat and libxml2
5061e4f postfix: Upgrade to 3.2.2
33dff9b mpv: Update to version 0.26.0.
691f88c python3-blivet: add recipe 2.2.0
f50575c python3-blivetgui: add recipe 2.1.5
7ce1100 librcf: Add -latomic to LDFLAGS
0061517 recipes: remove blacklisted recipes

== Tested changes (not included in master yet) - meta-qt5 ==
latest upstream commit:
8960831 qwt-qt5.inc: fix QA warning
not included in master yet:
6e9892a qtbase: add ptest
d53382f qt5-ptest: fix build with yocto < 2.3 (pyro)
9042969 qtbase: Fix ptests with clang
0b41b62 qtbase: Use sched_yield instead of pthread_yield
17d94b7 quazip: update to 0.7.3 and add missing metadata
3963daa qtwebkit: Backport a patch to fix build with icu-59
7efcea9 qt3d: Fix build with clang

== Tested changes (not included in master yet) - meta-browser ==
latest upstream commit:
e3c3aa0 Merge pull request #57 from kraj/kraj/master
not included in master yet:
e961581 gnome-settings-daemon: remove the bbappend for removed recipe

== Tested changes (not included in master yet) - meta-webos-ports ==

latest upstream commit:
03f4072 alsa-lib: Remove
0001-ucm-fix-handling-of-config-files-when-file-type-is-n.patch
not included in master yet:

== Tested changes (not included in master yet) - meta-smartphone ==
latest upstream commit:
1fe2b3b android-system-image-tenderloin: update Android image
not included in master yet:
e468a34 meta-shr, meta-fso: remove blacklisted recipes

