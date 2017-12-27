Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f42.google.com (mail-pl0-f42.google.com
	[209.85.160.42])
	by mail.openembedded.org (Postfix) with ESMTP id 87C4260043
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Dec 2017 03:02:23 +0000 (UTC)
Received: by mail-pl0-f42.google.com with SMTP id b96so18785604pli.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Dec 2017 19:02:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=to:from:subject:message-id:date:user-agent:mime-version
	:content-language;
	bh=+gFGBdGGr/todQk3/tJdedlseRcsJ3SaxGNZOsMelvM=;
	b=o6YXqm0Q6kPTp5m7J2TyoReCkp2Jml5DXrg8KSDUgLiN7His8N7vaEZa6oAHpVLWN5
	xWTAn/rGO1tb3L+j5pbG7ymyHo2dTAMYuj5bCsyhN0OeT8apJ068rJPTvEXuuA7V33B3
	xvr1HffiTNocR3Tv8eUAGMG3pCFbIZyJV69FtM+/QsQ32by0tcBpl+zm+ZLT29aqRjyn
	uo8VzouGtnWeP7/9vDFhWg4t9JkwQOdenJ2C8DlbKT742VqjZyx7/xDKcuTU4HqLl9r5
	fMt9nmmoAKRwol7z6EdaxRgvMfPw/2wu39VWyGE72oxffa2YEvbuvfTX1Abpiw90PbN3
	Gpsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:to:from:subject:message-id:date:user-agent
	:mime-version:content-language;
	bh=+gFGBdGGr/todQk3/tJdedlseRcsJ3SaxGNZOsMelvM=;
	b=qLVeCz/8vhdO4XXZe30W6MBlAcgS6s6dwoCITXk/tD7l3PcPXZeOP4HMmCvsRhWOWf
	U5pSg1MH34ZhZ3n40iS9ITiuiZyn9IFlhVU238mvqegaD/UlQNnAMX40veOfazsQ6pjd
	1shKMUiXWNaBZs93ZY1bBDm6VfPdbVwioedgek94GYC0R9v/g8PPA1xhHXzs/gpJht5S
	9XMW5W7N/YbeuQ0TCea9kW3TOnpW8M/h+GEFXI8MSMypgHKq7pjOY0vIV5rF5Yp6dvbu
	KiWD7fOJw/4EZNJtupilwlwFt2DMCC+EK7smQPQ83bGyGGLfZMf2uFo3cr4D6MJpfpa0
	YXqg==
X-Gm-Message-State: AKGB3mLl9YUno4r4ECM84OfCQrAWHFY5AN3XZXKsVO3cdThjWdiBQ2TU
	faNqZfyTm1Ge9l+kGjUS/i9k9w==
X-Google-Smtp-Source: ACJfBot6SbOFYT5kMFP/CuzFpz87uNeWqHnqaBVHF23swNvi0nOjF4s91pJdhZQ5XiGR65HSgXl8Hg==
X-Received: by 10.84.248.132 with SMTP id q4mr27919874pll.121.1514343743317;
	Tue, 26 Dec 2017 19:02:23 -0800 (PST)
Received: from ?IPv6:2601:202:4000:1184:bd87:68dc:7ad5:c07b?
	([2601:202:4000:1184:bd87:68dc:7ad5:c07b])
	by smtp.gmail.com with ESMTPSA id
	l19sm23821412pgc.57.2017.12.26.19.02.22
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 26 Dec 2017 19:02:22 -0800 (PST)
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
From: akuster808 <akuster808@gmail.com>
Message-ID: <24ffd0e9-be46-66d0-a526-f99a2bf907de@gmail.com>
Date: Tue, 26 Dec 2017 19:02:21 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.0
MIME-Version: 1.0
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: State of bitbake world, Failed tasks 2017-12-24
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
X-List-Received-Date: Wed, 27 Dec 2017 03:02:23 -0000
Content-Language: en-US
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit



http://www.openembedded.org/wiki/Bitbake_World_Status

== Number of issues - stats ==
{| class='wikitable'
!|Date		     !!colspan='4'|Failed tasks			    !!|Signatures		  !!colspan='15'|QA !!Comment
|-
||		||qemuarm	||qemuarm64	||qemux86	||qemux86_64	||all 	||already-stripped	||libdir	||textrel	||build-deps	||file-rdeps	||version-going-backwards	||host-user-contaminated	||installed-vs-shipped	||unknown-configure-option	||symlink-to-sysroot	||invalid-pkgconfig	||pkgname	||ldflags	||compile-host-path	||qa_pseudo	||	
|-
||2017-12-24	||11	||11	||33	||7	||0	||0		||0		||2		||0		||0		||0		||1		||1		||0		||0		||0		||0		||0		||0		||544		||	
|}

== Failed tasks 2017-12-24 ==

INFO: jenkins-job.sh-1.8.43 Complete log available at http://logs.nslu2-linux.org/buildlogs/oe/world/sumo/log.report.20171226_161411.log

=== common (6) ===
    * meta-openembedded/meta-gnome/recipes-gnome/eds/evolution-data-server_git.bb:do_compile
    * meta-openembedded/meta-networking/recipes-daemons/keepalived/keepalived_1.3.5.bb:do_configure
    * meta-openembedded/meta-networking/recipes-daemons/postfix/postfix_3.2.2.bb:do_install
    * meta-openembedded/meta-networking/recipes-kernel/wireguard/wireguard-module_0.0.20170810.bb:do_compile
    * meta-openembedded/meta-networking/recipes-support/ntop/ntop_5.0.1.bb:do_configure
    * meta-openembedded/meta-oe/recipes-support/xorg-xrdp/xorgxrdp_0.2.5.bb:do_package_qa

=== common-x86 (0) ===

=== qemuarm (5) ===
    * meta-openembedded/meta-oe/recipes-benchmark/iperf2/iperf2_2.0.10.bb:do_compile
    * meta-openembedded/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb:do_compile
    * openembedded-core/meta/recipes-core/glibc/glibc-locale_2.26.bb:do_package_qa
    * openembedded-core/meta/recipes-sato/webkit/webkitgtk_2.18.3.bb:do_compile
    * virtual:native:meta-openembedded/meta-oe/recipes-devtools/protobuf/protobuf-c_1.3.0.bb:do_compile

=== qemuarm64 (5) ===
    * meta-openembedded/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_1.5.2.bb:do_install
    * meta-openembedded/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_2.0.2.bb:do_configure
    * meta-openembedded/meta-oe/recipes-devtools/luajit/luajit_2.0.5.bb:do_compile
    * openembedded-core/meta/recipes-kernel/kexec/kexec-tools_2.0.15.bb:do_compile
    * openembedded-core/meta/recipes-sato/webkit/webkitgtk_2.18.3.bb:do_configure

=== qemux86 (27) ===
    * meta-browser/recipes-browser/chromium/chromium-ozone-wayland_64.0.3274.0.r517731.igalia.1.bb:do_compile
    * meta-browser/recipes-browser/chromium/chromium-x11_62.0.3202.94.bb:do_compile
    * meta-browser/recipes-browser/firefox/firefox_45.9.0esr.bb:do_compile
    * meta-openembedded/meta-networking/recipes-connectivity/rdist/rdist_6.1.5.bb:do_package
    * meta-openembedded/meta-networking/recipes-connectivity/samba/samba_4.7.0.bb:do_patch
    * meta-openembedded/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.0.874.bb:do_compile
    * meta-openembedded/meta-networking/recipes-daemons/opensaf/opensaf_5.17.07.bb:do_compile
    * meta-openembedded/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.3.bb:do_compile
    * meta-openembedded/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh_0.17.bb:do_compile
    * meta-openembedded/meta-networking/recipes-netkit/netkit-rusers/netkit-rusers_0.17.bb:do_compile
    * meta-openembedded/meta-networking/recipes-netkit/netkit-telnet/netkit-telnet_0.17.bb:do_configure
    * meta-openembedded/meta-networking/recipes-protocols/mdns/mdns_765.50.9.bb:do_compile
    * meta-openembedded/meta-networking/recipes-protocols/tsocks/tsocks_1.8beta5.bb:do_compile
    * meta-openembedded/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb:do_compile
    * meta-openembedded/meta-oe/recipes-connectivity/umip/umip_1.0.bb:do_compile
    * meta-openembedded/meta-oe/recipes-connectivity/wvdial/wvdial_1.61.bb:do_compile
    * meta-openembedded/meta-oe/recipes-devtools/pm-qa/pm-qa_git.bb:do_compile
    * meta-openembedded/meta-oe/recipes-extended/mraa/mraa_git.bb:do_compile
    * meta-openembedded/meta-oe/recipes-kernel/crash/crash_7.1.9.bb:do_compile
    * meta-openembedded/meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.0.bb:do_compile
    * meta-openembedded/meta-oe/recipes-multimedia/alsa/alsa-oss_1.0.17.bb:do_compile
    * meta-openembedded/meta-python/recipes-devtools/python/python3-systemd_234.bb:do_compile
    * meta-openembedded/meta-python/recipes-devtools/python/python-systemd_234.bb:do_compile
    * openembedded-core/meta/recipes-devtools/systemd-bootchart/systemd-bootchart_231.bb:do_compile
    * openembedded-core/meta/recipes-graphics/cogl/cogl-1.0_1.22.2.bb:do_compile
    * openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.12.3.bb:do_compile
    * openembedded-core/meta/recipes-multimedia/x264/x264_git.bb:do_package_qa

=== qemux86_64 (1) ===
    * meta-browser/recipes-browser/chromium/chromium-ozone-wayland_64.0.3274.0.r517731.igalia.1.bb:do_configure

=== Number of failed tasks (62) ===
{| class=wikitable
|-
|| qemuarm 	|| 11	 || http://logs.nslu2-linux.org/buildlogs/oe/world/sumo/log.world.qemuarm.20171223_013252.log/ || http://errors.yoctoproject.org/Errors/Build/49820/
|-
|| qemuarm64 	|| 11	 || http://logs.nslu2-linux.org/buildlogs/oe/world/sumo/log.world.qemuarm64.20171224_045701.log/ || http://errors.yoctoproject.org/Errors/Build/49855/
|-
|| qemux86 	|| 33	 || http://logs.nslu2-linux.org/buildlogs/oe/world/sumo/log.world.qemux86.20171223_013252.log/ || http://errors.yoctoproject.org/Errors/Build/49819/
|-
|| qemux86_64 	|| 7	 || http://logs.nslu2-linux.org/buildlogs/oe/world/sumo/log.world.qemux86-64.20171224_042839.log/ || http://errors.yoctoproject.org/Errors/Build/49854/
|}

=== PNBLACKLISTs (0) ===

=== QA issues (548) ===
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
||1	||host-user-contaminated
|-
||1	||installed-vs-shipped
|-
||2	||textrel
|-
||544	||qa_pseudo
|}



=== Incorrect PACKAGE_ARCH or sstate signatures (0) ===

Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/sumo/log.signatures.20171225_115031.log/


    * ERROR: Nothing RPROVIDES 'glibc-utils' (but /home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-support/uim/uim_1.8.6.bb RDEPENDS on or otherwise requires it)
    * ERROR: Required build target 'meta-world-pkgdata' has no buildable providers.
    * ERROR: no sigdata files were generated for MACHINE qemux86copy in /home/jenkins/oe/world/shr-core/tmpfs/stamps
    * ERROR: Nothing RPROVIDES 'python3-blinker' (but /home/jenkins/oe/world/shr-core/meta-openembedded/meta-python/recipes-devtools/python/python3-flask-nav_0.6.bb RDEPENDS on or otherwise requires it)
    * ERROR: Required build target 'meta-world-pkgdata' has no buildable providers.
    * ERROR: no sigdata files were generated for MACHINE qemux86 in /home/jenkins/oe/world/shr-core/tmpfs/stamps
    * ERROR: Nothing RPROVIDES 'python3-blinker' (but /home/jenkins/oe/world/shr-core/meta-openembedded/meta-python/recipes-devtools/python/python3-flask-nav_0.6.bb RDEPENDS on or otherwise requires it)
    * ERROR: Required build target 'meta-world-pkgdata' has no buildable providers.
    * ERROR: no sigdata files were generated for MACHINE qemuarm in /home/jenkins/oe/world/shr-core/tmpfs/stamps


PNBLACKLISTs:
openembedded-core/:
meta-browser:
meta-openembedded:
meta-qt5:
PNBLACKLIST[android-system] = "depends on lxc from meta-virtualiazation which isn't included in my world builds"
PNBLACKLIST[bigbuckbunny-1080p] = "big and doesn't really need to be tested so much"
PNBLACKLIST[bigbuckbunny-480p] = "big and doesn't really need to be tested so much"
PNBLACKLIST[bigbuckbunny-720p] = "big and doesn't really need to be tested so much"
PNBLACKLIST[bigbuckbunny-720p] = "big and doesn't really need to be tested so much"
PNBLACKLIST[tearsofsteel-1080p] = "big and doesn't really need to be tested so much"
PNBLACKLIST[build-appliance-image] = "tries to include whole downloads directory in /home/builder/poky :/"


QA issues by type:
count: 0	issue: already-stripped


count: 0	issue: libdir


count: 2	issue: textrel
x264-r2731+gitAUTOINC+2b741f81e5: ELF binary '/work/i586-oe-linux-musl/x264/r2731+gitAUTOINC+2b741f81e5-r0/packages-split/x264-bin/usr/bin/x264' has relocations in .text [textrel]
x264-r2731+gitAUTOINC+2b741f81e5: ELF binary '/work/i586-oe-linux-musl/x264/r2731+gitAUTOINC+2b741f81e5-r0/packages-split/x264/usr/lib/libx264.so.148' has relocations in .text [textrel]


count: 0	issue: build-deps


count: 0	issue: file-rdeps


count: 0	issue: version-going-backwards


count: 1	issue: host-user-contaminated
glibc-locale-2.26: glibc-locale: /glibc-binary-localedata-ar-sy.iso-8859-6/usr/lib/locale/ar_SY.ISO-8859-6/LC_PAPER is owned by uid 3004, which is the same as the user running bitbake. This may be due to host contamination [host-user-contaminated]


count: 1	issue: installed-vs-shipped
rdist: 1 installed and not shipped files. [installed-vs-shipped]


count: 0	issue: unknown-configure-option


count: 0	issue: symlink-to-sysroot


count: 0	issue: invalid-pkgconfig


count: 0	issue: pkgname


count: 0	issue: ldflags


count: 0	issue: compile-host-path


count: 544	issue: qa_pseudo
alsa-tools-1.1.5: This /work/aarch64-oe-linux/alsa-tools/1.1.5-r0/pseudo/pseudo.log indicates 18 errors [qa_pseudo]
alsa-tools-1.1.5: This /work/armv5te-oe-linux-gnueabi/alsa-tools/1.1.5-r0/pseudo/pseudo.log indicates 16 errors [qa_pseudo]
android-tools-5.1.1.r37: This /work/i586-oe-linux-musl/android-tools/5.1.1.r37-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
aoetools-36: This /work/i586-oe-linux-musl/aoetools/36-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
apache2-2.4.29: This /work/aarch64-oe-linux/apache2/2.4.29-r0/pseudo/pseudo.log indicates 7 errors [qa_pseudo]
apache2-2.4.29: This /work/armv5te-oe-linux-gnueabi/apache2/2.4.29-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
apache2-2.4.29: This /work/core2-64-oe-linux/apache2/2.4.29-r0/pseudo/pseudo.log indicates 7 errors [qa_pseudo]
apache2-2.4.29: This /work/i586-oe-linux-musl/apache2/2.4.29-r0/pseudo/pseudo.log indicates 8 errors [qa_pseudo]
apr-1.6.2: This /work/armv5te-oe-linux-gnueabi/apr/1.6.2-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
apt-1.2.24: This /work/i586-oe-linux-musl/apt/1.2.24-r0/pseudo/pseudo.log indicates 18 errors [qa_pseudo]
atop-2.2.3: This /work/armv5te-oe-linux-gnueabi/atop/2.2.3-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
attr-2.4.47: This /work/i586-oe-linux-musl/attr/2.4.47-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
avahi-ui-0.6.32: This /work/i586-oe-linux-musl/avahi-ui/0.6.32-r0/pseudo/pseudo.log indicates 18 errors [qa_pseudo]
bash-4.4: This /work/core2-64-oe-linux/bash/4.4-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
bdwgc-7.6.0: This /work/i586-oe-linux-musl/bdwgc/7.6.0-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
beecrypt-4.2.1: This /work/armv5te-oe-linux-gnueabi/beecrypt/4.2.1-r3/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
beecrypt-4.2.1: This /work/core2-64-oe-linux/beecrypt/4.2.1-r3/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
bind-9.10.6: This /work/armv5te-oe-linux-gnueabi/bind/9.10.6-r0/pseudo/pseudo.log indicates 16 errors [qa_pseudo]
blktrace-1.1.0+gitAUTOINC+43fc870ce0: This /work/i586-oe-linux-musl/blktrace/1.1.0+gitAUTOINC+43fc870ce0-r0/pseudo/pseudo.log indicates 7 errors [qa_pseudo]
bluez5-5.47: This /work/aarch64-oe-linux/bluez5/5.47-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
bluez5-5.47: This /work/armv5te-oe-linux-gnueabi/bluez5/5.47-r0/pseudo/pseudo.log indicates 16 errors [qa_pseudo]
bluez5-5.47: This /work/core2-64-oe-linux/bluez5/5.47-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
bluez5-5.47: This /work/i586-oe-linux-musl/bluez5/5.47-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
bmap-tools-3.4: This /work/aarch64-oe-linux/bmap-tools/3.4-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
boost-1.65.1: This /work/aarch64-oe-linux/boost/1.65.1-r0/pseudo/pseudo.log indicates 18 errors [qa_pseudo]
bootchart-1.17: This /work/armv5te-oe-linux-gnueabi/bootchart/1_1.17-r1/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
ca-certificates-20170717: This /work/all-oe-linux/ca-certificates/20170717-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
cairomm-1.12.0: This /work/i586-oe-linux-musl/cairomm/1.12.0-r0/pseudo/pseudo.log indicates 16 errors [qa_pseudo]
canutils-4.0.6: This /work/armv5te-oe-linux-gnueabi/canutils/4.0.6-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
c-ares-1.13.0+gitrAUTOINC+3be1924221: This /work/aarch64-oe-linux/c-ares/1.13.0+gitrAUTOINC+3be1924221-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
chrony-3.2: This /work/aarch64-oe-linux/chrony/3.2-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
chrony-3.2: This /work/core2-64-oe-linux/chrony/3.2-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
chrony-3.2: This /work/i586-oe-linux-musl/chrony/3.2-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
collectd-5.7.2: This /work/armv5te-oe-linux-gnueabi/collectd/5.7.2-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
consolekit-0.4.6: This /work/aarch64-oe-linux/consolekit/0.4.6-r0/pseudo/pseudo.log indicates 18 errors [qa_pseudo]
coreutils-8.28: This /work/i586-oe-linux-musl/coreutils/8.28-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
corosync-2.4.3: This /work/armv5te-oe-linux-gnueabi/corosync/2.4.3-r0/pseudo/pseudo.log indicates 16 errors [qa_pseudo]
cryptsetup-1.7.4: This /work/aarch64-oe-linux/cryptsetup/1.7.4-r0/pseudo/pseudo.log indicates 18 errors [qa_pseudo]
ctdb-2.5.6: This /work/aarch64-oe-linux/ctdb/2.5.6-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
curlpp-0.8.1: This /work/aarch64-oe-linux/curlpp/0.8.1-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
curlpp-0.8.1: This /work/core2-64-oe-linux/curlpp/0.8.1-r0/pseudo/pseudo.log indicates 7 errors [qa_pseudo]
curlpp-0.8.1: This /work/i586-oe-linux-musl/curlpp/0.8.1-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
cve-check-tool-5.6.4: This /work/armv5te-oe-linux-gnueabi/cve-check-tool/5.6.4-r0/pseudo/pseudo.log indicates 16 errors [qa_pseudo]
cve-check-tool-5.6.4: This /work/i586-oe-linux-musl/cve-check-tool/5.6.4-r0/pseudo/pseudo.log indicates 18 errors [qa_pseudo]
devilspie2-0.42: This /work/core2-64-oe-linux/devilspie2/0.42-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
dhcp-4.3.6: This /work/aarch64-oe-linux/dhcp/4.3.6-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
dhcp-4.3.6: This /work/armv5te-oe-linux-gnueabi/dhcp/4.3.6-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
dhcp-4.3.6: This /work/core2-64-oe-linux/dhcp/4.3.6-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
dhcp-4.3.6: This /work/i586-oe-linux-musl/dhcp/4.3.6-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
directfb-examples-1.7.0: This /work/armv5te-oe-linux-gnueabi/directfb-examples/1.7.0-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
dlm-4.0.2: This /work/armv5te-oe-linux-gnueabi/dlm/4.0.2-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
dovecot-2.2.29: This /work/aarch64-oe-linux/dovecot/2.2.29-r0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
dovecot-2.2.29: This /work/armv5te-oe-linux-gnueabi/dovecot/2.2.29-r0/pseudo/pseudo.log indicates 11 errors [qa_pseudo]
dovecot-2.2.29: This /work/core2-64-oe-linux/dovecot/2.2.29-r0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
dovecot-2.2.29: This /work/i586-oe-linux-musl/dovecot/2.2.29-r0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
dracut-045+git39c9b67f86145953aa30def9d77c68597a4ccfe8: This /work/core2-64-oe-linux/dracut/1_045+git39c9b67f86145953aa30def9d77c68597a4ccfe8-r0/pseudo/pseudo.log indicates 11 errors [qa_pseudo]
dracut-045+git39c9b67f86145953aa30def9d77c68597a4ccfe8: This /work/i586-oe-linux-musl/dracut/1_045+git39c9b67f86145953aa30def9d77c68597a4ccfe8-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
drbd-utils-8.9.6: This /work/core2-64-oe-linux/drbd-utils/8.9.6-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
ebtables-2.0.10-4: This /work/aarch64-oe-linux/ebtables/2.0.10-4-r4/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
ebtables-2.0.10-4: This /work/armv5te-oe-linux-gnueabi/ebtables/2.0.10-4-r4/pseudo/pseudo.log indicates 5 errors [qa_pseudo]
ebtables-2.0.10-4: This /work/core2-64-oe-linux/ebtables/2.0.10-4-r4/pseudo/pseudo.log indicates 7 errors [qa_pseudo]
eglinfo-fb-1.0.0: This /work/core2-64-oe-linux/eglinfo-fb/1.0.0-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
espeak-1.48.04: This /work/i586-oe-linux-musl/espeak/1.48.04-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
expat-2.2.5: This /work/core2-64-oe-linux/expat/2.2.5-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
expat-2.2.5: This /work/i586-oe-linux-musl/expat/2.2.5-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
expect-5.45.3: This /work/i586-oe-linux-musl/expect/5.45.3-r0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
faad2-2.7: This /work/armv5te-oe-linux-gnueabi/faad2/2.7-r1/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
firefox-45.9.0esr: This /work/core2-64-oe-linux/firefox/45.9.0esr-r0/pseudo/pseudo.log indicates 18 errors [qa_pseudo]
firefox-l10n-ar-45.9.0esr: This /work/all-oe-linux/firefox-l10n-ar/45.9.0esr-r3/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
firefox-l10n-en-za-45.9.0esr: This /work/all-oe-linux/firefox-l10n-en-za/45.9.0esr-r3/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
firefox-l10n-mai-45.9.0esr: This /work/all-oe-linux/firefox-l10n-mai/45.9.0esr-r3/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
firefox-l10n-vi-45.9.0esr: This /work/all-oe-linux/firefox-l10n-vi/45.9.0esr-r3/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
flex-2.6.0: This /work/armv5te-oe-linux-gnueabi/flex/2.6.0-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
foomatic-filters-4.0.17: This /work/i586-oe-linux-musl/foomatic-filters/4.0.17-r1/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
freediameter-1.2.1: This /work/i586-oe-linux-musl/freediameter/1.2.1-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
freeradius-3.0.15: This /work/aarch64-oe-linux/freeradius/3.0.15-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
gateone-1.2+gitAUTOINC+f7a9be46cb: This /work/aarch64-oe-linux/gateone/1.2+gitAUTOINC+f7a9be46cb-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
gateone-1.2+gitAUTOINC+f7a9be46cb: This /work/armv5te-oe-linux-gnueabi/gateone/1.2+gitAUTOINC+f7a9be46cb-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
gateone-1.2+gitAUTOINC+f7a9be46cb: This /work/core2-64-oe-linux/gateone/1.2+gitAUTOINC+f7a9be46cb-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
gateone-1.2+gitAUTOINC+f7a9be46cb: This /work/i586-oe-linux-musl/gateone/1.2+gitAUTOINC+f7a9be46cb-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
geis-2.2.17: This /work/armv5te-oe-linux-gnueabi/geis/2.2.17-r0/pseudo/pseudo.log indicates 16 errors [qa_pseudo]
geoclue-2.4.4: This /work/aarch64-oe-linux/geoclue/2.4.4-r0/pseudo/pseudo.log indicates 18 errors [qa_pseudo]
gettext-0.19.8.1: This /work/i586-oe-linux-musl/gettext/0.19.8.1-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
glib-2.0-2.54.2: This /work/i586-oe-linux-musl/glib-2.0/1_2.54.2-r0/pseudo/pseudo.log indicates 16 errors [qa_pseudo]
glibc-2.26: This /work/aarch64-oe-linux/glibc/2.26-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
glibc-2.26: This /work/armv5e-oe-linux-gnueabi/glibc/2.26-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
glibc-locale-2.26: This /work/aarch64-oe-linux/glibc-locale/2.26-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
glibc-locale-2.26: This /work/armv5e-oe-linux-gnueabi/glibc-locale/2.26-r0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
glibc-locale-2.26: This /work/core2-64-oe-linux/glibc-locale/2.26-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
gnome-desktop3-3.26.2: This /work/armv5te-oe-linux-gnueabi/gnome-desktop3/3.26.2-r0/pseudo/pseudo.log indicates 16 errors [qa_pseudo]
gpm-1.99.7+git1fd19417b8a4dd9945347e98dfa97e4cfd798d77: This /work/aarch64-oe-linux/gpm/1.99.7+git1fd19417b8a4dd9945347e98dfa97e4cfd798d77-r2/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
grub-2.02: This /work/aarch64-oe-linux/grub/2.02-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
grub-efi-2.02: This /work/i586-oe-linux-musl/grub-efi/2.02-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
gsoap-2.8.51: This /work/i586-oe-linux-musl/gsoap/2.8.51-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
gst-fluendo-mpegdemux-0.10.85: This /work/core2-64-oe-linux/gst-fluendo-mpegdemux/0.10.85-r0/pseudo/pseudo.log indicates 18 errors [qa_pseudo]
gst-player-0.0.1+gitAUTOINC+ee3c226c82: This /work/armv5te-oe-linux-gnueabi/gst-player/0.0.1+gitAUTOINC+ee3c226c82-r0/pseudo/pseudo.log indicates 16 errors [qa_pseudo]
gtkmathview-0.8.0+gitAUTOINC+0bc2cfa0a4: This /work/armv5te-oe-linux-gnueabi/gtkmathview/0.8.0+gitAUTOINC+0bc2cfa0a4-r3/pseudo/pseudo.log indicates 16 errors [qa_pseudo]
gupnp-av-0.12.10: This /work/i586-oe-linux-musl/gupnp-av/0.12.10-r0/pseudo/pseudo.log indicates 18 errors [qa_pseudo]
hplip-3.12.6: This /work/core2-64-oe-linux/hplip/3.12.6-r1/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
iceauth-1.0.7: This /work/armv5te-oe-linux-gnueabi/iceauth/1.0.7-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
icu-60.1: This /work/aarch64-oe-linux/icu/60.1-r0/pseudo/pseudo.log indicates 7 errors [qa_pseudo]
icu-60.1: This /work/core2-64-oe-linux/icu/60.1-r0/pseudo/pseudo.log indicates 7 errors [qa_pseudo]
icu-60.1: This /work/i586-oe-linux-musl/icu/60.1-r0/pseudo/pseudo.log indicates 7 errors [qa_pseudo]
initscripts-1.0: This /work/armv5te-oe-linux-gnueabi/initscripts/1.0-r155/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
iptables-1.6.1: This /work/aarch64-oe-linux/iptables/1.6.1-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
iptables-1.6.1: This /work/i586-oe-linux-musl/iptables/1.6.1-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
irssi-1.0.4: This /work/aarch64-oe-linux/irssi/1.0.4-r0/pseudo/pseudo.log indicates 18 errors [qa_pseudo]
jack-1.9.10+gitAUTOINC+2d1d323505: This /work/armv5te-oe-linux-gnueabi/jack/1.9.10+gitAUTOINC+2d1d323505-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
kbd-2.0.4: This /work/aarch64-oe-linux/kbd/2.0.4-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
kexec-tools-2.0.15: This /work/core2-64-oe-linux/kexec-tools/2.0.15-r1/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
lcdproc-0.5.8+gitAUTOINC+f5156e2e41: This /work/aarch64-oe-linux/lcdproc/0.5.8+gitAUTOINC+f5156e2e41-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
lcdproc-0.5.8+gitAUTOINC+f5156e2e41: This /work/armv5te-oe-linux-gnueabi/lcdproc/0.5.8+gitAUTOINC+f5156e2e41-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
lcdproc-0.5.8+gitAUTOINC+f5156e2e41: This /work/core2-64-oe-linux/lcdproc/0.5.8+gitAUTOINC+f5156e2e41-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
lcdproc-0.5.8+gitAUTOINC+f5156e2e41: This /work/i586-oe-linux-musl/lcdproc/0.5.8+gitAUTOINC+f5156e2e41-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
leveldb-1.20+gitAUTOINC+a53934a3ae: This /work/armv5te-oe-linux-gnueabi/leveldb/1.20+gitAUTOINC+a53934a3ae-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
libatasmart-0.19: This /work/aarch64-oe-linux/libatasmart/0.19-r0/pseudo/pseudo.log indicates 18 errors [qa_pseudo]
libatasmart-0.19: This /work/armv5te-oe-linux-gnueabi/libatasmart/0.19-r0/pseudo/pseudo.log indicates 16 errors [qa_pseudo]
libatasmart-0.19: This /work/i586-oe-linux-musl/libatasmart/0.19-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
libauthen-sasl-perl-2.16: This /work/armv5te-oe-linux-gnueabi/libauthen-sasl-perl/2.16-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
libblockdev-2.10: This /work/aarch64-oe-linux/libblockdev/2.10-r0/pseudo/pseudo.log indicates 18 errors [qa_pseudo]
libcap-ng-0.7.8: This /work/aarch64-oe-linux/libcap-ng/0.7.8-r0/pseudo/pseudo.log indicates 7 errors [qa_pseudo]
libcgroup-0.41: This /work/i586-oe-linux-musl/libcgroup/0.41-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
libconnman-qt5-1.2.4+gitAUTOINC+9d98e12ed6: This /work/aarch64-oe-linux/libconnman-qt5/1.2.4+gitAUTOINC+9d98e12ed6-r0/pseudo/pseudo.log indicates 11 errors [qa_pseudo]
libconnman-qt5-1.2.4+gitAUTOINC+9d98e12ed6: This /work/armv5te-oe-linux-gnueabi/libconnman-qt5/1.2.4+gitAUTOINC+9d98e12ed6-r0/pseudo/pseudo.log indicates 11 errors [qa_pseudo]
libconnman-qt5-1.2.4+gitAUTOINC+9d98e12ed6: This /work/core2-64-oe-linux/libconnman-qt5/1.2.4+gitAUTOINC+9d98e12ed6-r0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
libconnman-qt5-1.2.4+gitAUTOINC+9d98e12ed6: This /work/i586-oe-linux-musl/libconnman-qt5/1.2.4+gitAUTOINC+9d98e12ed6-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
libencode-perl-2.83: This /work/i586-oe-linux-musl/libencode-perl/2.83-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
libgcrypt-1.8.1: This /work/core2-64-oe-linux/libgcrypt/1.8.1-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
libiio-0.8+gitAUTOINC+08f947d5e4: This /work/core2-64-oe-linux/libiio/0.8+gitAUTOINC+08f947d5e4-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
libldb-1.2.2: This /work/i586-oe-linux-musl/libldb/1.2.2-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
libmnl-1.0.4: This /work/core2-64-oe-linux/libmnl/1.0.4-r0/pseudo/pseudo.log indicates 11 errors [qa_pseudo]
libotr-4.1.1: This /work/armv5te-oe-linux-gnueabi/libotr/4.1.1-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
libqofono-0.92+gitrAUTOINC+6916cd030b: This /work/aarch64-oe-linux/libqofono/0.92+gitrAUTOINC+6916cd030b-r0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
libqofono-0.92+gitrAUTOINC+6916cd030b: This /work/armv5te-oe-linux-gnueabi/libqofono/0.92+gitrAUTOINC+6916cd030b-r0/pseudo/pseudo.log indicates 11 errors [qa_pseudo]
libqofono-0.92+gitrAUTOINC+6916cd030b: This /work/core2-64-oe-linux/libqofono/0.92+gitrAUTOINC+6916cd030b-r0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
libreport-2.9.2: This /work/i586-oe-linux-musl/libreport/2.9.2-r0/pseudo/pseudo.log indicates 14 errors [qa_pseudo]
libsdl2-2.0.7: This /work/aarch64-oe-linux/libsdl2/2.0.7-r0/pseudo/pseudo.log indicates 22 errors [qa_pseudo]
libsdl2-2.0.7: This /work/i586-oe-linux-musl/libsdl2/2.0.7-r0/pseudo/pseudo.log indicates 18 errors [qa_pseudo]
libteam-1.27: This /work/core2-64-oe-linux/libteam/1.27-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
libtool-cross-2.4.6: This /work/aarch64-oe-linux/libtool-cross/2.4.6-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
libtool-cross-2.4.6: This /work/armv5te-oe-linux-gnueabi/libtool-cross/2.4.6-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
libtool-cross-2.4.6: This /work/core2-64-oe-linux/libtool-cross/2.4.6-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
libtool-cross-2.4.6: This /work/i586-oe-linux-musl/libtool-cross/2.4.6-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
libvncserver-0.9.11: This /work/aarch64-oe-linux/libvncserver/0.9.11-r0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
libvncserver-0.9.11: This /work/armv5te-oe-linux-gnueabi/libvncserver/0.9.11-r0/pseudo/pseudo.log indicates 11 errors [qa_pseudo]
libvncserver-0.9.11: This /work/core2-64-oe-linux/libvncserver/0.9.11-r0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
libvncserver-0.9.11: This /work/i586-oe-linux-musl/libvncserver/0.9.11-r0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
libvorbis-1.3.5: This /work/armv5te-oe-linux-gnueabi/libvorbis/1.3.5-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
libwebp-0.6.0: This /work/i586-oe-linux-musl/libwebp/0.6.0-r0/pseudo/pseudo.log indicates 11 errors [qa_pseudo]
libwmf-0.2.8.4: This /work/aarch64-oe-linux/libwmf/0.2.8.4-r3/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
libwmf-0.2.8.4: This /work/armv5te-oe-linux-gnueabi/libwmf/0.2.8.4-r3/pseudo/pseudo.log indicates 11 errors [qa_pseudo]
libwmf-0.2.8.4: This /work/core2-64-oe-linux/libwmf/0.2.8.4-r3/pseudo/pseudo.log indicates 19 errors [qa_pseudo]
libwmf-0.2.8.4: This /work/i586-oe-linux-musl/libwmf/0.2.8.4-r3/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
libxkbui-1.0.2: This /work/core2-64-oe-linux/libxkbui/1_1.0.2-r10/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
libxml++-2.40.1: This /work/core2-64-oe-linux/libxml++/2.40.1-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
libxml-sax-perl-0.99: This /work/i586-oe-linux-musl/libxml-sax-perl/0.99-r2/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
linux-libc-headers-4.12: This /work/core2-64-oe-linux/linux-libc-headers/4.12-r0/pseudo/pseudo.log indicates 18 errors [qa_pseudo]
lio-utils-4.1+gitAUTOINC+28bd928655: This /work/i586-oe-linux-musl/lio-utils/4.1+gitAUTOINC+28bd928655-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
lirc-0.9.4d: This /work/aarch64-oe-linux/lirc/0.9.4d-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
lirc-0.9.4d: This /work/armv5te-oe-linux-gnueabi/lirc/0.9.4d-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
lirc-0.9.4d: This /work/core2-64-oe-linux/lirc/0.9.4d-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
lirc-0.9.4d: This /work/i586-oe-linux-musl/lirc/0.9.4d-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
lldpd-0.9.8: This /work/i586-oe-linux-musl/lldpd/0.9.8-r0/pseudo/pseudo.log indicates 18 errors [qa_pseudo]
llvm-5.0: This /work/aarch64-oe-linux/llvm/5.0-r0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
llvm-5.0: This /work/armv5e-oe-linux-gnueabi/llvm/5.0-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
llvm-5.0: This /work/core2-64-oe-linux/llvm/5.0-r0/pseudo/pseudo.log indicates 7 errors [qa_pseudo]
llvm-5.0: This /work/i586-oe-linux-musl/llvm/5.0-r0/pseudo/pseudo.log indicates 7 errors [qa_pseudo]
log4cpp-1.1.2: This /work/aarch64-oe-linux/log4cpp/1.1.2-r0/pseudo/pseudo.log indicates 7 errors [qa_pseudo]
log4cpp-1.1.2: This /work/armv5te-oe-linux-gnueabi/log4cpp/1.1.2-r0/pseudo/pseudo.log indicates 5 errors [qa_pseudo]
log4cpp-1.1.2: This /work/core2-64-oe-linux/log4cpp/1.1.2-r0/pseudo/pseudo.log indicates 7 errors [qa_pseudo]
log4cpp-1.1.2: This /work/i586-oe-linux-musl/log4cpp/1.1.2-r0/pseudo/pseudo.log indicates 7 errors [qa_pseudo]
lttng-tools-2.9.5: This /work/aarch64-oe-linux/lttng-tools/2.9.5-r0/pseudo/pseudo.log indicates 17 errors [qa_pseudo]
lttng-tools-2.9.5: This /work/armv5te-oe-linux-gnueabi/lttng-tools/2.9.5-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
lttng-tools-2.9.5: This /work/core2-64-oe-linux/lttng-tools/2.9.5-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
lvm2-2.02.171: This /work/armv5te-oe-linux-gnueabi/lvm2/2.02.171-r0/pseudo/pseudo.log indicates 17 errors [qa_pseudo]
maliit-framework-qt5-0.99.0+gitAUTOINC+60b1b10de1: This /work/aarch64-oe-linux/maliit-framework-qt5/0.99.0+gitAUTOINC+60b1b10de1-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
maliit-framework-qt5-0.99.0+gitAUTOINC+60b1b10de1: This /work/armv5te-oe-linux-gnueabi/maliit-framework-qt5/0.99.0+gitAUTOINC+60b1b10de1-r0/pseudo/pseudo.log indicates 15 errors [qa_pseudo]
maliit-framework-qt5-0.99.0+gitAUTOINC+60b1b10de1: This /work/core2-64-oe-linux/maliit-framework-qt5/0.99.0+gitAUTOINC+60b1b10de1-r0/pseudo/pseudo.log indicates 15 errors [qa_pseudo]
maliit-framework-qt5-0.99.0+gitAUTOINC+60b1b10de1: This /work/i586-oe-linux-musl/maliit-framework-qt5/0.99.0+gitAUTOINC+60b1b10de1-r0/pseudo/pseudo.log indicates 11 errors [qa_pseudo]
maliit-plugins-qt5-0.99.0+gitAUTOINC+c6a3485926: This /work/core2-64-oe-linux/maliit-plugins-qt5/0.99.0+gitAUTOINC+c6a3485926-r0/pseudo/pseudo.log indicates 14 errors [qa_pseudo]
mariadb-5.5.57: This /work/core2-64-oe-linux/mariadb/5.5.57-r0/pseudo/pseudo.log indicates 18 errors [qa_pseudo]
matchbox-config-gtk-0.2: This /work/core2-64-oe-linux/matchbox-config-gtk/0.2-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
matchbox-session-0.1: This /work/armv5te-oe-linux-gnueabi/matchbox-session/0.1-r4/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
mc-4.8.20: This /work/i586-oe-linux-musl/mc/4.8.20-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
md5deep-4.4: This /work/i586-oe-linux-musl/md5deep/4.4-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
memtester-4.3.0: This /work/i586-oe-linux-musl/memtester/4.3.0-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
menulibre-2.1.3: This /work/armv5te-oe-linux-gnueabi/menulibre/2.1.3-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
mesa-demos-8.3.0: This /work/aarch64-oe-linux/mesa-demos/8.3.0-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
meson-0.40.1: This /work/aarch64-oe-linux/meson/0.40.1-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
monkey-1.5.6: This /work/core2-64-oe-linux/monkey/1.5.6-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
mosquitto-1.4.14: This /work/aarch64-oe-linux/mosquitto/1.4.14-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
mosquitto-1.4.14: This /work/armv5te-oe-linux-gnueabi/mosquitto/1.4.14-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
mozilla-devscripts-0.30: This /work/armv5te-oe-linux-gnueabi/mozilla-devscripts/0.30-r1/pseudo/pseudo.log indicates 5 errors [qa_pseudo]
mozilla-devscripts-0.30: This /work/core2-64-oe-linux/mozilla-devscripts/0.30-r1/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
mozilla-devscripts-0.30: This /work/i586-oe-linux-musl/mozilla-devscripts/0.30-r1/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
mpich-3.2: This /work/armv5te-oe-linux-gnueabi/mpich/3.2-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
mpich-3.2: This /work/core2-64-oe-linux/mpich/3.2-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
mpich-3.2: This /work/i586-oe-linux-musl/mpich/3.2-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
mtd-utils-2.0.0: This /work/aarch64-oe-linux/mtd-utils/2.0.0-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
ncftp-3.2.6: This /work/aarch64-oe-linux/ncftp/3.2.6-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
netcat-0.7.1: This /work/i586-oe-linux-musl/netcat/0.7.1-r3/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
nettle-3.4: This /work/i586-oe-linux-musl/nettle/3.4-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
networkmanager-1.4.4: This /work/i586-oe-linux-musl/networkmanager/1.4.4-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
nginx-1.12.2: This /work/aarch64-oe-linux/nginx/1.12.2-r0/pseudo/pseudo.log indicates 14 errors [qa_pseudo]
nginx-1.12.2: This /work/core2-64-oe-linux/nginx/1.12.2-r0/pseudo/pseudo.log indicates 14 errors [qa_pseudo]
nspr-4.17: This /work/core2-64-oe-linux/nspr/4.17-r0/pseudo/pseudo.log indicates 11 errors [qa_pseudo]
ntimed-0.0+gitAUTOINC+db0abbb4c8: This /work/armv5te-oe-linux-gnueabi/ntimed/0.0+gitAUTOINC+db0abbb4c8-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
ntp-4.2.8p10: This /work/aarch64-oe-linux/ntp/4.2.8p10-r0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
ntp-4.2.8p10: This /work/armv5te-oe-linux-gnueabi/ntp/4.2.8p10-r0/pseudo/pseudo.log indicates 11 errors [qa_pseudo]
ntp-4.2.8p10: This /work/core2-64-oe-linux/ntp/4.2.8p10-r0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
ntp-4.2.8p10: This /work/i586-oe-linux-musl/ntp/4.2.8p10-r0/pseudo/pseudo.log indicates 19 errors [qa_pseudo]
numactl-2.0.11+gitAUTOINC+ea3a70681c: This /work/core2-64-oe-linux/numactl/2.0.11+gitAUTOINC+ea3a70681c-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
onboard-1.4.1: This /work/i586-oe-linux-musl/onboard/1.4.1-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4: This /work/core2-64-oe-linux/opencv/3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0/pseudo/pseudo.log indicates 18 errors [qa_pseudo]
openflow-1.0+gitAUTOINC+c84f33f09d: This /work/aarch64-oe-linux/openflow/1.0+gitAUTOINC+c84f33f09d-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
openhpi-3.6.1: This /work/aarch64-oe-linux/openhpi/3.6.1-r0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
openhpi-3.6.1: This /work/core2-64-oe-linux/openhpi/3.6.1-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
openhpi-3.6.1: This /work/i586-oe-linux-musl/openhpi/3.6.1-r0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
openipmi-2.0.24: This /work/i586-oe-linux-musl/openipmi/2.0.24-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
open-isns-0.97: This /work/aarch64-oe-linux/open-isns/0.97-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
open-isns-0.97: This /work/armv5te-oe-linux-gnueabi/open-isns/0.97-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
open-isns-0.97: This /work/core2-64-oe-linux/open-isns/0.97-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
open-isns-0.97: This /work/i586-oe-linux-musl/open-isns/0.97-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
openl2tp-1.8: This /work/i586-oe-linux-musl/openl2tp/1.8-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
openlmi-tools-0.10.5: This /work/armv5te-oe-linux-gnueabi/openlmi-tools/0.10.5-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
opensaf-5.17.07: This /work/aarch64-oe-linux/opensaf/5.17.07-r0/pseudo/pseudo.log indicates 22 errors [qa_pseudo]
opensaf-5.17.07: This /work/armv5te-oe-linux-gnueabi/opensaf/5.17.07-r0/pseudo/pseudo.log indicates 14 errors [qa_pseudo]
opensaf-5.17.07: This /work/core2-64-oe-linux/opensaf/5.17.07-r0/pseudo/pseudo.log indicates 17 errors [qa_pseudo]
openssh-7.6p1: This /work/aarch64-oe-linux/openssh/7.6p1-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
openssh-7.6p1: This /work/armv5te-oe-linux-gnueabi/openssh/7.6p1-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
openssh-7.6p1: This /work/i586-oe-linux-musl/openssh/7.6p1-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
oprofile-1.1.0: This /work/core2-64-oe-linux/oprofile/1.1.0-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
oprofile-1.1.0: This /work/i586-oe-linux-musl/oprofile/1.1.0-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
ossp-uuid-1.6.2: This /work/aarch64-oe-linux/ossp-uuid/1.6.2-r2/pseudo/pseudo.log indicates 7 errors [qa_pseudo]
ossp-uuid-1.6.2: This /work/armv5te-oe-linux-gnueabi/ossp-uuid/1.6.2-r2/pseudo/pseudo.log indicates 5 errors [qa_pseudo]
ossp-uuid-1.6.2: This /work/core2-64-oe-linux/ossp-uuid/1.6.2-r2/pseudo/pseudo.log indicates 8 errors [qa_pseudo]
ossp-uuid-1.6.2: This /work/i586-oe-linux-musl/ossp-uuid/1.6.2-r2/pseudo/pseudo.log indicates 7 errors [qa_pseudo]
packagegroup-core-tools-debug-1.0: This /work/all-oe-linux/packagegroup-core-tools-debug/1.0-r3/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
packagegroup-fonts-truetype-1.0: This /work/all-oe-linux/packagegroup-fonts-truetype/1.0-r2/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
packagegroup-qt5-qtcreator-debug-1.0: This /work/all-oe-linux/packagegroup-qt5-qtcreator-debug/1.0-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
packagegroup-xfce-base-1.0: This /work/all-oe-linux/packagegroup-xfce-base/1.0-r5/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
pangomm-2.40.1: This /work/aarch64-oe-linux/pangomm/2.40.1-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
perf-1.0: This /work/qemuarm64-oe-linux/perf/1.0-r9/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
perl-5.24.1: This /work/aarch64-oe-linux/perl/5.24.1-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
perl-5.24.1: This /work/armv5te-oe-linux-gnueabi/perl/5.24.1-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
perl-5.24.1: This /work/core2-64-oe-linux/perl/5.24.1-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
php-7.1.9: This /work/aarch64-oe-linux/php/7.1.9-r0/pseudo/pseudo.log indicates 14 errors [qa_pseudo]
php-7.1.9: This /work/armv5e-oe-linux-gnueabi/php/7.1.9-r0/pseudo/pseudo.log indicates 11 errors [qa_pseudo]
php-7.1.9: This /work/core2-64-oe-linux/php/7.1.9-r0/pseudo/pseudo.log indicates 15 errors [qa_pseudo]
php-7.1.9: This /work/i586-oe-linux-musl/php/7.1.9-r0/pseudo/pseudo.log indicates 14 errors [qa_pseudo]
pidgin-otr-4.0.2: This /work/armv5te-oe-linux-gnueabi/pidgin-otr/4.0.2-r0/pseudo/pseudo.log indicates 11 errors [qa_pseudo]
pm-qa-0.5.2: This /work/aarch64-oe-linux/pm-qa/0.5.2-r0/pseudo/pseudo.log indicates 37 errors [qa_pseudo]
pm-qa-0.5.2: This /work/armv5te-oe-linux-gnueabi/pm-qa/0.5.2-r0/pseudo/pseudo.log indicates 35 errors [qa_pseudo]
pm-qa-0.5.2: This /work/core2-64-oe-linux/pm-qa/0.5.2-r0/pseudo/pseudo.log indicates 35 errors [qa_pseudo]
pm-utils-1.4.1: This /work/armv5te-oe-linux-gnueabi/pm-utils/1.4.1-r1/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
po4a-0.49: This /work/core2-64-oe-linux/po4a/0.49-r0/pseudo/pseudo.log indicates 16 errors [qa_pseudo]
poco-1.8.0.1: This /work/aarch64-oe-linux/poco/1.8.0.1-r0/pseudo/pseudo.log indicates 7 errors [qa_pseudo]
poco-1.8.0.1: This /work/core2-64-oe-linux/poco/1.8.0.1-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
postgresql-9.4.15: This /work/aarch64-oe-linux/postgresql/9.4.15-r0/pseudo/pseudo.log indicates 14 errors [qa_pseudo]
postgresql-9.4.15: This /work/armv5e-oe-linux-gnueabi/postgresql/9.4.15-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
postgresql-9.4.15: This /work/core2-64-oe-linux/postgresql/9.4.15-r0/pseudo/pseudo.log indicates 11 errors [qa_pseudo]
postgresql-9.4.15: This /work/i586-oe-linux-musl/postgresql/9.4.15-r0/pseudo/pseudo.log indicates 14 errors [qa_pseudo]
ppp-2.4.7: This /work/armv5te-oe-linux-gnueabi/ppp/2.4.7-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
ppp-2.4.7: This /work/core2-64-oe-linux/ppp/2.4.7-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
ppp-2.4.7: This /work/i586-oe-linux-musl/ppp/2.4.7-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
procps-3.3.12: This /work/core2-64-oe-linux/procps/3.3.12-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
proftpd-1.3.6: This /work/armv5te-oe-linux-gnueabi/proftpd/1.3.6-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
proftpd-1.3.6: This /work/core2-64-oe-linux/proftpd/1.3.6-r0/pseudo/pseudo.log indicates 14 errors [qa_pseudo]
ptpd-2.3.1: This /work/core2-64-oe-linux/ptpd/2.3.1-r0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
puzzles-0.0+gitAUTOINC+8dfe5cec31: This /work/i586-oe-linux-musl/puzzles/1_0.0+gitAUTOINC+8dfe5cec31-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
pyrtm-0.4.2: This /work/aarch64-oe-linux/pyrtm/0.4.2-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
pyrtm-0.4.2: This /work/core2-64-oe-linux/pyrtm/0.4.2-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
python-2.7.13: This /work/aarch64-oe-linux/python/2.7.13-r1/pseudo/pseudo.log indicates 5 errors [qa_pseudo]
python-2.7.13: This /work/armv5te-oe-linux-gnueabi/python/2.7.13-r1/pseudo/pseudo.log indicates 5 errors [qa_pseudo]
python-2.7.13: This /work/core2-64-oe-linux/python/2.7.13-r1/pseudo/pseudo.log indicates 5 errors [qa_pseudo]
python-2.7.13: This /work/i586-oe-linux-musl/python/2.7.13-r1/pseudo/pseudo.log indicates 5 errors [qa_pseudo]
python3-3.5.3: This /work/aarch64-oe-linux/python3/3.5.3-r1.0/pseudo/pseudo.log indicates 7 errors [qa_pseudo]
python3-3.5.3: This /work/armv5te-oe-linux-gnueabi/python3/3.5.3-r1.0/pseudo/pseudo.log indicates 5 errors [qa_pseudo]
python3-3.5.3: This /work/core2-64-oe-linux/python3/3.5.3-r1.0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
python3-3.5.3: This /work/i586-oe-linux-musl/python3/3.5.3-r1.0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
python3-automat-0.6.0: This /work/aarch64-oe-linux/python3-automat/0.6.0-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
python3-automat-0.6.0: This /work/armv5te-oe-linux-gnueabi/python3-automat/0.6.0-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
python3-django-1.11.8: This /work/aarch64-oe-linux/python3-django/1.11.8-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
python3-django-1.11.8: This /work/i586-oe-linux-musl/python3-django/1.11.8-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
python3-docutils-0.14: This /work/aarch64-oe-linux/python3-docutils/0.14-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
python3-docutils-0.14: This /work/core2-64-oe-linux/python3-docutils/0.14-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
python3-dominate-2.3.1: This /work/core2-64-oe-linux/python3-dominate/2.3.1-r0/pseudo/pseudo.log indicates 11 errors [qa_pseudo]
python3-flask-0.12.2: This /work/core2-64-oe-linux/python3-flask/0.12.2-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
python3-flask-user-0.6.19: This /work/core2-64-oe-linux/python3-flask-user/0.6.19-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
python3-idna-2.6: This /work/i586-oe-linux-musl/python3-idna/2.6-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
python3-isort-4.2.15: This /work/armv5te-oe-linux-gnueabi/python3-isort/4.2.15-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
python3-jsonschema-2.6.0: This /work/armv5te-oe-linux-gnueabi/python3-jsonschema/2.6.0-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
python3-mako-1.0.7: This /work/i586-oe-linux-musl/python3-mako/1.0.7-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
python3-mprpc-0.1.16: This /work/i586-oe-linux-musl/python3-mprpc/0.1.16-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
python3-ndg-httpsclient-0.4.3: This /work/core2-64-oe-linux/python3-ndg-httpsclient/0.4.3-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
python3-netaddr-0.7.19: This /work/core2-64-oe-linux/python3-netaddr/0.7.19-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
python3-nose-1.3.7: This /work/core2-64-oe-linux/python3-nose/1.3.7-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
python3-pip-9.0.1: This /work/aarch64-oe-linux/python3-pip/9.0.1-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
python3-pip-9.0.1: This /work/armv5te-oe-linux-gnueabi/python3-pip/9.0.1-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
python3-pip-9.0.1: This /work/i586-oe-linux-musl/python3-pip/9.0.1-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
python3-pykickstart-2.35: This /work/aarch64-oe-linux/python3-pykickstart/2.35-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
python3-pykickstart-2.35: This /work/armv5te-oe-linux-gnueabi/python3-pykickstart/2.35-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
python3-pylint-1.8.1: This /work/aarch64-oe-linux/python3-pylint/1.8.1-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
python3-pylint-1.8.1: This /work/armv5te-oe-linux-gnueabi/python3-pylint/1.8.1-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
python3-pylint-1.8.1: This /work/core2-64-oe-linux/python3-pylint/1.8.1-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
python3-pylint-1.8.1: This /work/i586-oe-linux-musl/python3-pylint/1.8.1-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
python3-pyserial-3.4: This /work/aarch64-oe-linux/python3-pyserial/3.4-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
python3-pytest-3.3.1: This /work/aarch64-oe-linux/python3-pytest/3.3.1-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
python3-pytest-3.3.1: This /work/i586-oe-linux-musl/python3-pytest/3.3.1-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
python3-twisted-17.9.0: This /work/armv5te-oe-linux-gnueabi/python3-twisted/17.9.0-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
python3-wrapt-1.10.11: This /work/i586-oe-linux-musl/python3-wrapt/1.10.11-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
python-alembic-0.9.6: This /work/core2-64-oe-linux/python-alembic/0.9.6-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
python-asn1crypto-0.24.0: This /work/aarch64-oe-linux/python-asn1crypto/0.24.0-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
python-astroid-1.6.0: This /work/i586-oe-linux-musl/python-astroid/1.6.0-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
python-can-2.0.0b1: This /work/core2-64-oe-linux/python-can/2.0.0b1-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
python-chardet-3.0.4: This /work/aarch64-oe-linux/python-chardet/3.0.4-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
python-chardet-3.0.4: This /work/i586-oe-linux-musl/python-chardet/3.0.4-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
python-cheetah-2.4.4: This /work/i586-oe-linux-musl/python-cheetah/2.4.4-r3/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
python-cpuset-1.5.7: This /work/aarch64-oe-linux/python-cpuset/1.5.7-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
python-cpuset-1.5.7: This /work/armv5te-oe-linux-gnueabi/python-cpuset/1.5.7-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
python-cpuset-1.5.7: This /work/core2-64-oe-linux/python-cpuset/1.5.7-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
python-cython-0.27.3: This /work/aarch64-oe-linux/python-cython/0.27.3-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
python-django-1.11.8: This /work/armv5te-oe-linux-gnueabi/python-django/1.11.8-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
python-docutils-0.14rc2: This /work/armv5te-oe-linux-gnueabi/python-docutils/0.14rc2-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
python-epydoc-3.0.1: This /work/aarch64-oe-linux/python-epydoc/3.0.1-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
python-flask-0.12.2: This /work/i586-oe-linux-musl/python-flask/0.12.2-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
python-future-0.16.0: This /work/core2-64-oe-linux/python-future/0.16.0-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
python-imaging-1.1.7: This /work/armv5te-oe-linux-gnueabi/python-imaging/1.1.7-r5/pseudo/pseudo.log indicates 5 errors [qa_pseudo]
python-imaging-1.1.7: This /work/i586-oe-linux-musl/python-imaging/1.1.7-r5/pseudo/pseudo.log indicates 7 errors [qa_pseudo]
python-isort-4.2.15: This /work/i586-oe-linux-musl/python-isort/4.2.15-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
python-itsdangerous-0.24: This /work/core2-64-oe-linux/python-itsdangerous/0.24-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
python-jsonpointer-1.14: This /work/i586-oe-linux-musl/python-jsonpointer/1.14-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
python-lxml-4.1.1: This /work/core2-64-oe-linux/python-lxml/4.1.1-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
python-mock-2.0.0: This /work/core2-64-oe-linux/python-mock/2.0.0-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
python-nose-1.3.7: This /work/armv5te-oe-linux-gnueabi/python-nose/1.3.7-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
python-numeric-24.2: This /work/armv5te-oe-linux-gnueabi/python-numeric/24.2-ml3/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
python-numpy-1.13.1: This /work/armv5te-oe-linux-gnueabi/python-numpy/1.13.1-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
python-pep8-1.7.1: This /work/armv5te-oe-linux-gnueabi/python-pep8/1.7.1-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
python-pep8-1.7.1: This /work/i586-oe-linux-musl/python-pep8/1.7.1-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
python-pip-9.0.1: This /work/aarch64-oe-linux/python-pip/9.0.1-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
python-pycrypto-2.6.1: This /work/i586-oe-linux-musl/python-pycrypto/2.6.1-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
python-pylint-1.8.1: This /work/aarch64-oe-linux/python-pylint/1.8.1-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
python-pylint-1.8.1: This /work/armv5te-oe-linux-gnueabi/python-pylint/1.8.1-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
python-pylint-1.8.1: This /work/core2-64-oe-linux/python-pylint/1.8.1-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
python-pylint-1.8.1: This /work/i586-oe-linux-musl/python-pylint/1.8.1-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
python-pyro4-4.63: This /work/core2-64-oe-linux/python-pyro4/4.63-r0/pseudo/pseudo.log indicates 7 errors [qa_pseudo]
python-pytest-3.3.1: This /work/armv5te-oe-linux-gnueabi/python-pytest/3.3.1-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
python-pytest-3.3.1: This /work/core2-64-oe-linux/python-pytest/3.3.1-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
python-sdnotify-0.3.2: This /work/core2-64-oe-linux/python-sdnotify/0.3.2-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
python-slip-dbus-0.6.1: This /work/core2-64-oe-linux/python-slip-dbus/0.6.1-r0/pseudo/pseudo.log indicates 14 errors [qa_pseudo]
python-sparts-0.7.3: This /work/core2-64-oe-linux/python-sparts/0.7.3-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
python-tornado-4.5.2: This /work/aarch64-oe-linux/python-tornado/4.5.2-r0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
python-vobject-0.9.5: This /work/i586-oe-linux-musl/python-vobject/0.9.5-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
python-xlrd-1.1.0: This /work/i586-oe-linux-musl/python-xlrd/1.1.0-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
python-yappi-0.98: This /work/i586-oe-linux-musl/python-yappi/0.98-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
pywbem-0.8.0: This /work/aarch64-oe-linux/pywbem/0.8.0-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
qt3d-5.10.0+gitAUTOINC+7bd57d2218: This /work/aarch64-oe-linux/qt3d/5.10.0+gitAUTOINC+7bd57d2218-r0/pseudo/pseudo.log indicates 14 errors [qa_pseudo]
qt3d-5.10.0+gitAUTOINC+7bd57d2218: This /work/armv5te-oe-linux-gnueabi/qt3d/5.10.0+gitAUTOINC+7bd57d2218-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
qt3d-5.10.0+gitAUTOINC+7bd57d2218: This /work/core2-64-oe-linux/qt3d/5.10.0+gitAUTOINC+7bd57d2218-r0/pseudo/pseudo.log indicates 14 errors [qa_pseudo]
qt3d-5.10.0+gitAUTOINC+7bd57d2218: This /work/i586-oe-linux-musl/qt3d/5.10.0+gitAUTOINC+7bd57d2218-r0/pseudo/pseudo.log indicates 18 errors [qa_pseudo]
qt5-creator-3.5.1: This /work/aarch64-oe-linux/qt5-creator/3.5.1-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
qt5-demo-extrafiles-1.0: This /work/all-oe-linux/qt5-demo-extrafiles/1.0-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
qtbase-5.10.0+gitAUTOINC+50117d738a: This /work/aarch64-oe-linux/qtbase/5.10.0+gitAUTOINC+50117d738a-r0/pseudo/pseudo.log indicates 348 errors [qa_pseudo]
qtbase-5.10.0+gitAUTOINC+50117d738a: This /work/armv5te-oe-linux-gnueabi/qtbase/5.10.0+gitAUTOINC+50117d738a-r0/pseudo/pseudo.log indicates 17 errors [qa_pseudo]
qtbase-5.10.0+gitAUTOINC+50117d738a: This /work/core2-64-oe-linux/qtbase/5.10.0+gitAUTOINC+50117d738a-r0/pseudo/pseudo.log indicates 377 errors [qa_pseudo]
qtbase-5.10.0+gitAUTOINC+50117d738a: This /work/i586-oe-linux-musl/qtbase/5.10.0+gitAUTOINC+50117d738a-r0/pseudo/pseudo.log indicates 24 errors [qa_pseudo]
qtcharts-5.10.0+gitAUTOINC+6a9606270e: This /work/aarch64-oe-linux/qtcharts/5.10.0+gitAUTOINC+6a9606270e-r0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
qtcharts-5.10.0+gitAUTOINC+6a9606270e: This /work/armv5te-oe-linux-gnueabi/qtcharts/5.10.0+gitAUTOINC+6a9606270e-r0/pseudo/pseudo.log indicates 14 errors [qa_pseudo]
qtcharts-5.10.0+gitAUTOINC+6a9606270e: This /work/core2-64-oe-linux/qtcharts/5.10.0+gitAUTOINC+6a9606270e-r0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
qtcharts-5.10.0+gitAUTOINC+6a9606270e: This /work/i586-oe-linux-musl/qtcharts/5.10.0+gitAUTOINC+6a9606270e-r0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
qtconnectivity-5.10.0+gitAUTOINC+bb9b8af08b: This /work/aarch64-oe-linux/qtconnectivity/5.10.0+gitAUTOINC+bb9b8af08b-r0/pseudo/pseudo.log indicates 14 errors [qa_pseudo]
qtconnectivity-5.10.0+gitAUTOINC+bb9b8af08b: This /work/armv5te-oe-linux-gnueabi/qtconnectivity/5.10.0+gitAUTOINC+bb9b8af08b-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
qtconnectivity-5.10.0+gitAUTOINC+bb9b8af08b: This /work/core2-64-oe-linux/qtconnectivity/5.10.0+gitAUTOINC+bb9b8af08b-r0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
qtconnectivity-5.10.0+gitAUTOINC+bb9b8af08b: This /work/i586-oe-linux-musl/qtconnectivity/5.10.0+gitAUTOINC+bb9b8af08b-r0/pseudo/pseudo.log indicates 14 errors [qa_pseudo]
qtdatavis3d-5.10.0+gitAUTOINC+d2abb20082: This /work/aarch64-oe-linux/qtdatavis3d/5.10.0+gitAUTOINC+d2abb20082-r0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
qtdatavis3d-5.10.0+gitAUTOINC+d2abb20082: This /work/armv5te-oe-linux-gnueabi/qtdatavis3d/5.10.0+gitAUTOINC+d2abb20082-r0/pseudo/pseudo.log indicates 11 errors [qa_pseudo]
qtdatavis3d-5.10.0+gitAUTOINC+d2abb20082: This /work/core2-64-oe-linux/qtdatavis3d/5.10.0+gitAUTOINC+d2abb20082-r0/pseudo/pseudo.log indicates 14 errors [qa_pseudo]
qtdatavis3d-5.10.0+gitAUTOINC+d2abb20082: This /work/i586-oe-linux-musl/qtdatavis3d/5.10.0+gitAUTOINC+d2abb20082-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
qtdeclarative-5.10.0+gitAUTOINC+dac71f3d6f: This /work/aarch64-oe-linux/qtdeclarative/5.10.0+gitAUTOINC+dac71f3d6f-r0/pseudo/pseudo.log indicates 24 errors [qa_pseudo]
qtdeclarative-5.10.0+gitAUTOINC+dac71f3d6f: This /work/armv5te-oe-linux-gnueabi/qtdeclarative/5.10.0+gitAUTOINC+dac71f3d6f-r0/pseudo/pseudo.log indicates 21 errors [qa_pseudo]
qtdeclarative-5.10.0+gitAUTOINC+dac71f3d6f: This /work/core2-64-oe-linux/qtdeclarative/5.10.0+gitAUTOINC+dac71f3d6f-r0/pseudo/pseudo.log indicates 28 errors [qa_pseudo]
qtdeclarative-5.10.0+gitAUTOINC+dac71f3d6f: This /work/i586-oe-linux-musl/qtdeclarative/5.10.0+gitAUTOINC+dac71f3d6f-r0/pseudo/pseudo.log indicates 19 errors [qa_pseudo]
qtenginio-5.10.0+gitAUTOINC+23603a3b08: This /work/aarch64-oe-linux/qtenginio/5.10.0+gitAUTOINC+23603a3b08-r0/pseudo/pseudo.log indicates 14 errors [qa_pseudo]
qtenginio-5.10.0+gitAUTOINC+23603a3b08: This /work/armv5te-oe-linux-gnueabi/qtenginio/5.10.0+gitAUTOINC+23603a3b08-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
qtenginio-5.10.0+gitAUTOINC+23603a3b08: This /work/core2-64-oe-linux/qtenginio/5.10.0+gitAUTOINC+23603a3b08-r0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
qtenginio-5.10.0+gitAUTOINC+23603a3b08: This /work/i586-oe-linux-musl/qtenginio/5.10.0+gitAUTOINC+23603a3b08-r0/pseudo/pseudo.log indicates 17 errors [qa_pseudo]
qtgamepad-5.10.0+gitAUTOINC+b505116ee4: This /work/aarch64-oe-linux/qtgamepad/5.10.0+gitAUTOINC+b505116ee4-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
qtgamepad-5.10.0+gitAUTOINC+b505116ee4: This /work/armv5te-oe-linux-gnueabi/qtgamepad/5.10.0+gitAUTOINC+b505116ee4-r0/pseudo/pseudo.log indicates 11 errors [qa_pseudo]
qtgamepad-5.10.0+gitAUTOINC+b505116ee4: This /work/core2-64-oe-linux/qtgamepad/5.10.0+gitAUTOINC+b505116ee4-r0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
qtgamepad-5.10.0+gitAUTOINC+b505116ee4: This /work/i586-oe-linux-musl/qtgamepad/5.10.0+gitAUTOINC+b505116ee4-r0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
qtlocation-5.10.0+gitAUTOINC+919bbf503d_572822c8ca: This /work/aarch64-oe-linux/qtlocation/5.10.0+gitAUTOINC+919bbf503d_572822c8ca-r0/pseudo/pseudo.log indicates 14 errors [qa_pseudo]
qtlocation-5.10.0+gitAUTOINC+919bbf503d_572822c8ca: This /work/armv5te-oe-linux-gnueabi/qtlocation/5.10.0+gitAUTOINC+919bbf503d_572822c8ca-r0/pseudo/pseudo.log indicates 16 errors [qa_pseudo]
qtlocation-5.10.0+gitAUTOINC+919bbf503d_572822c8ca: This /work/core2-64-oe-linux/qtlocation/5.10.0+gitAUTOINC+919bbf503d_572822c8ca-r0/pseudo/pseudo.log indicates 15 errors [qa_pseudo]
qtlocation-5.10.0+gitAUTOINC+919bbf503d_572822c8ca: This /work/i586-oe-linux-musl/qtlocation/5.10.0+gitAUTOINC+919bbf503d_572822c8ca-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
qtmultimedia-5.10.0+gitAUTOINC+3598915a36: This /work/aarch64-oe-linux/qtmultimedia/5.10.0+gitAUTOINC+3598915a36-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
qtmultimedia-5.10.0+gitAUTOINC+3598915a36: This /work/armv5te-oe-linux-gnueabi/qtmultimedia/5.10.0+gitAUTOINC+3598915a36-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
qtmultimedia-5.10.0+gitAUTOINC+3598915a36: This /work/core2-64-oe-linux/qtmultimedia/5.10.0+gitAUTOINC+3598915a36-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
qtmultimedia-5.10.0+gitAUTOINC+3598915a36: This /work/i586-oe-linux-musl/qtmultimedia/5.10.0+gitAUTOINC+3598915a36-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
qtnetworkauth-5.10.0+gitAUTOINC+febebfb6f0: This /work/aarch64-oe-linux/qtnetworkauth/5.10.0+gitAUTOINC+febebfb6f0-r0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
qtnetworkauth-5.10.0+gitAUTOINC+febebfb6f0: This /work/armv5te-oe-linux-gnueabi/qtnetworkauth/5.10.0+gitAUTOINC+febebfb6f0-r0/pseudo/pseudo.log indicates 11 errors [qa_pseudo]
qtnetworkauth-5.10.0+gitAUTOINC+febebfb6f0: This /work/core2-64-oe-linux/qtnetworkauth/5.10.0+gitAUTOINC+febebfb6f0-r0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
qtnetworkauth-5.10.0+gitAUTOINC+febebfb6f0: This /work/i586-oe-linux-musl/qtnetworkauth/5.10.0+gitAUTOINC+febebfb6f0-r0/pseudo/pseudo.log indicates 7 errors [qa_pseudo]
qtquick1-5.10.0+gitAUTOINC+b2476dcd53: This /work/aarch64-oe-linux/qtquick1/5.10.0+gitAUTOINC+b2476dcd53-r0/pseudo/pseudo.log indicates 31 errors [qa_pseudo]
qtquick1-5.10.0+gitAUTOINC+b2476dcd53: This /work/armv5te-oe-linux-gnueabi/qtquick1/5.10.0+gitAUTOINC+b2476dcd53-r0/pseudo/pseudo.log indicates 17 errors [qa_pseudo]
qtquick1-5.10.0+gitAUTOINC+b2476dcd53: This /work/core2-64-oe-linux/qtquick1/5.10.0+gitAUTOINC+b2476dcd53-r0/pseudo/pseudo.log indicates 21 errors [qa_pseudo]
qtquick1-5.10.0+gitAUTOINC+b2476dcd53: This /work/i586-oe-linux-musl/qtquick1/5.10.0+gitAUTOINC+b2476dcd53-r0/pseudo/pseudo.log indicates 18 errors [qa_pseudo]
qtquickcontrols2-5.10.0+gitAUTOINC+1265fef3b2: This /work/aarch64-oe-linux/qtquickcontrols2/5.10.0+gitAUTOINC+1265fef3b2-r0/pseudo/pseudo.log indicates 19 errors [qa_pseudo]
qtquickcontrols2-5.10.0+gitAUTOINC+1265fef3b2: This /work/core2-64-oe-linux/qtquickcontrols2/5.10.0+gitAUTOINC+1265fef3b2-r0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
qtquickcontrols2-5.10.0+gitAUTOINC+1265fef3b2: This /work/i586-oe-linux-musl/qtquickcontrols2/5.10.0+gitAUTOINC+1265fef3b2-r0/pseudo/pseudo.log indicates 11 errors [qa_pseudo]
qtquickcontrols-5.10.0+gitAUTOINC+a749525164: This /work/armv5te-oe-linux-gnueabi/qtquickcontrols/5.10.0+gitAUTOINC+a749525164-r0/pseudo/pseudo.log indicates 22 errors [qa_pseudo]
qtquickcontrols-5.10.0+gitAUTOINC+a749525164: This /work/core2-64-oe-linux/qtquickcontrols/5.10.0+gitAUTOINC+a749525164-r0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
qtremoteobjects-5.10.0+gitAUTOINC+e6eb6ab12d: This /work/aarch64-oe-linux/qtremoteobjects/5.10.0+gitAUTOINC+e6eb6ab12d-r0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
qtremoteobjects-5.10.0+gitAUTOINC+e6eb6ab12d: This /work/armv5te-oe-linux-gnueabi/qtremoteobjects/5.10.0+gitAUTOINC+e6eb6ab12d-r0/pseudo/pseudo.log indicates 11 errors [qa_pseudo]
qtremoteobjects-5.10.0+gitAUTOINC+e6eb6ab12d: This /work/core2-64-oe-linux/qtremoteobjects/5.10.0+gitAUTOINC+e6eb6ab12d-r0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
qtscript-5.10.0+gitAUTOINC+0bb3f3017f: This /work/aarch64-oe-linux/qtscript/5.10.0+gitAUTOINC+0bb3f3017f-r0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
qtscript-5.10.0+gitAUTOINC+0bb3f3017f: This /work/armv5e-oe-linux-gnueabi/qtscript/5.10.0+gitAUTOINC+0bb3f3017f-r0/pseudo/pseudo.log indicates 11 errors [qa_pseudo]
qtscript-5.10.0+gitAUTOINC+0bb3f3017f: This /work/core2-64-oe-linux/qtscript/5.10.0+gitAUTOINC+0bb3f3017f-r0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
qtscript-5.10.0+gitAUTOINC+0bb3f3017f: This /work/i586-oe-linux-musl/qtscript/5.10.0+gitAUTOINC+0bb3f3017f-r0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
qtscxml-5.10.0+gitAUTOINC+bbf3be4679: This /work/aarch64-oe-linux/qtscxml/5.10.0+gitAUTOINC+bbf3be4679-r0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
qtscxml-5.10.0+gitAUTOINC+bbf3be4679: This /work/armv5te-oe-linux-gnueabi/qtscxml/5.10.0+gitAUTOINC+bbf3be4679-r0/pseudo/pseudo.log indicates 11 errors [qa_pseudo]
qtscxml-5.10.0+gitAUTOINC+bbf3be4679: This /work/core2-64-oe-linux/qtscxml/5.10.0+gitAUTOINC+bbf3be4679-r0/pseudo/pseudo.log indicates 14 errors [qa_pseudo]
qtscxml-5.10.0+gitAUTOINC+bbf3be4679: This /work/i586-oe-linux-musl/qtscxml/5.10.0+gitAUTOINC+bbf3be4679-r0/pseudo/pseudo.log indicates 14 errors [qa_pseudo]
qtsensors-5.10.0+gitAUTOINC+7ae7dc3256: This /work/aarch64-oe-linux/qtsensors/5.10.0+gitAUTOINC+7ae7dc3256-r0/pseudo/pseudo.log indicates 19 errors [qa_pseudo]
qtsensors-5.10.0+gitAUTOINC+7ae7dc3256: This /work/armv5te-oe-linux-gnueabi/qtsensors/5.10.0+gitAUTOINC+7ae7dc3256-r0/pseudo/pseudo.log indicates 11 errors [qa_pseudo]
qtsensors-5.10.0+gitAUTOINC+7ae7dc3256: This /work/core2-64-oe-linux/qtsensors/5.10.0+gitAUTOINC+7ae7dc3256-r0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
qtsensors-5.10.0+gitAUTOINC+7ae7dc3256: This /work/i586-oe-linux-musl/qtsensors/5.10.0+gitAUTOINC+7ae7dc3256-r0/pseudo/pseudo.log indicates 29 errors [qa_pseudo]
qtserialbus-5.10.0+gitAUTOINC+f25ddea7b1: This /work/aarch64-oe-linux/qtserialbus/5.10.0+gitAUTOINC+f25ddea7b1-r0/pseudo/pseudo.log indicates 14 errors [qa_pseudo]
qtserialbus-5.10.0+gitAUTOINC+f25ddea7b1: This /work/armv5te-oe-linux-gnueabi/qtserialbus/5.10.0+gitAUTOINC+f25ddea7b1-r0/pseudo/pseudo.log indicates 11 errors [qa_pseudo]
qtserialbus-5.10.0+gitAUTOINC+f25ddea7b1: This /work/core2-64-oe-linux/qtserialbus/5.10.0+gitAUTOINC+f25ddea7b1-r0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
qtserialbus-5.10.0+gitAUTOINC+f25ddea7b1: This /work/i586-oe-linux-musl/qtserialbus/5.10.0+gitAUTOINC+f25ddea7b1-r0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
qtserialport-5.10.0+gitAUTOINC+c7d99464c6: This /work/armv5te-oe-linux-gnueabi/qtserialport/5.10.0+gitAUTOINC+c7d99464c6-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
qtserialport-5.10.0+gitAUTOINC+c7d99464c6: This /work/core2-64-oe-linux/qtserialport/5.10.0+gitAUTOINC+c7d99464c6-r0/pseudo/pseudo.log indicates 7 errors [qa_pseudo]
qtserialport-5.10.0+gitAUTOINC+c7d99464c6: This /work/i586-oe-linux-musl/qtserialport/5.10.0+gitAUTOINC+c7d99464c6-r0/pseudo/pseudo.log indicates 7 errors [qa_pseudo]
qtsvg-5.10.0+gitAUTOINC+984ba69772: This /work/aarch64-oe-linux/qtsvg/5.10.0+gitAUTOINC+984ba69772-r0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
qtsvg-5.10.0+gitAUTOINC+984ba69772: This /work/armv5te-oe-linux-gnueabi/qtsvg/5.10.0+gitAUTOINC+984ba69772-r0/pseudo/pseudo.log indicates 11 errors [qa_pseudo]
qtsvg-5.10.0+gitAUTOINC+984ba69772: This /work/core2-64-oe-linux/qtsvg/5.10.0+gitAUTOINC+984ba69772-r0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
qtsvg-5.10.0+gitAUTOINC+984ba69772: This /work/i586-oe-linux-musl/qtsvg/5.10.0+gitAUTOINC+984ba69772-r0/pseudo/pseudo.log indicates 14 errors [qa_pseudo]
qtsystems-5.10.0+gitAUTOINC+ca54870ffd: This /work/aarch64-oe-linux/qtsystems/5.10.0+gitAUTOINC+ca54870ffd-r0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
qtsystems-5.10.0+gitAUTOINC+ca54870ffd: This /work/armv5te-oe-linux-gnueabi/qtsystems/5.10.0+gitAUTOINC+ca54870ffd-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
qtsystems-5.10.0+gitAUTOINC+ca54870ffd: This /work/core2-64-oe-linux/qtsystems/5.10.0+gitAUTOINC+ca54870ffd-r0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
qtsystems-5.10.0+gitAUTOINC+ca54870ffd: This /work/i586-oe-linux-musl/qtsystems/5.10.0+gitAUTOINC+ca54870ffd-r0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
qttools-5.10.0+gitAUTOINC+3ce89dc37d: This /work/aarch64-oe-linux/qttools/5.10.0+gitAUTOINC+3ce89dc37d-r0/pseudo/pseudo.log indicates 19 errors [qa_pseudo]
qttools-5.10.0+gitAUTOINC+3ce89dc37d: This /work/armv5te-oe-linux-gnueabi/qttools/5.10.0+gitAUTOINC+3ce89dc37d-r0/pseudo/pseudo.log indicates 19 errors [qa_pseudo]
qttools-5.10.0+gitAUTOINC+3ce89dc37d: This /work/core2-64-oe-linux/qttools/5.10.0+gitAUTOINC+3ce89dc37d-r0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
qttools-5.10.0+gitAUTOINC+3ce89dc37d: This /work/i586-oe-linux-musl/qttools/5.10.0+gitAUTOINC+3ce89dc37d-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
qtwayland-5.10.0+gitAUTOINC+1a457a9dc9: This /work/aarch64-oe-linux/qtwayland/5.10.0+gitAUTOINC+1a457a9dc9-r0/pseudo/pseudo.log indicates 14 errors [qa_pseudo]
qtwayland-5.10.0+gitAUTOINC+1a457a9dc9: This /work/armv5te-oe-linux-gnueabi/qtwayland/5.10.0+gitAUTOINC+1a457a9dc9-r0/pseudo/pseudo.log indicates 11 errors [qa_pseudo]
qtwayland-5.10.0+gitAUTOINC+1a457a9dc9: This /work/core2-64-oe-linux/qtwayland/5.10.0+gitAUTOINC+1a457a9dc9-r0/pseudo/pseudo.log indicates 14 errors [qa_pseudo]
qtwayland-5.10.0+gitAUTOINC+1a457a9dc9: This /work/i586-oe-linux-musl/qtwayland/5.10.0+gitAUTOINC+1a457a9dc9-r0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
qtwebchannel-5.10.0+gitAUTOINC+acb01cb27b: This /work/aarch64-oe-linux/qtwebchannel/5.10.0+gitAUTOINC+acb01cb27b-r0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
qtwebchannel-5.10.0+gitAUTOINC+acb01cb27b: This /work/armv5te-oe-linux-gnueabi/qtwebchannel/5.10.0+gitAUTOINC+acb01cb27b-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
qtwebchannel-5.10.0+gitAUTOINC+acb01cb27b: This /work/core2-64-oe-linux/qtwebchannel/5.10.0+gitAUTOINC+acb01cb27b-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
qtwebchannel-5.10.0+gitAUTOINC+acb01cb27b: This /work/i586-oe-linux-musl/qtwebchannel/5.10.0+gitAUTOINC+acb01cb27b-r0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
qtwebengine-5.10.0+gitAUTOINC+efa6d3f0d3_e36dcec23b: This /work/aarch64-oe-linux/qtwebengine/5.10.0+gitAUTOINC+efa6d3f0d3_e36dcec23b-r0/pseudo/pseudo.log indicates 36 errors [qa_pseudo]
qtwebengine-5.10.0+gitAUTOINC+efa6d3f0d3_e36dcec23b: This /work/core2-64-oe-linux/qtwebengine/5.10.0+gitAUTOINC+efa6d3f0d3_e36dcec23b-r0/pseudo/pseudo.log indicates 36 errors [qa_pseudo]
qtwebengine-5.10.0+gitAUTOINC+efa6d3f0d3_e36dcec23b: This /work/i586-oe-linux-musl/qtwebengine/5.10.0+gitAUTOINC+efa6d3f0d3_e36dcec23b-r0/pseudo/pseudo.log indicates 34 errors [qa_pseudo]
qtwebkit-5.10.0+gitAUTOINC+97c4a80a12: This /work/aarch64-oe-linux/qtwebkit/5.10.0+gitAUTOINC+97c4a80a12-r0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
qtwebkit-5.10.0+gitAUTOINC+97c4a80a12: This /work/armv5e-oe-linux-gnueabi/qtwebkit/5.10.0+gitAUTOINC+97c4a80a12-r0/pseudo/pseudo.log indicates 11 errors [qa_pseudo]
qtwebkit-5.10.0+gitAUTOINC+97c4a80a12: This /work/core2-64-oe-linux/qtwebkit/5.10.0+gitAUTOINC+97c4a80a12-r0/pseudo/pseudo.log indicates 28 errors [qa_pseudo]
qtwebkit-5.10.0+gitAUTOINC+97c4a80a12: This /work/i586-oe-linux-musl/qtwebkit/5.10.0+gitAUTOINC+97c4a80a12-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
qtwebkit-examples-5.10.0+gitAUTOINC+a24c780b60: This /work/aarch64-oe-linux/qtwebkit-examples/5.10.0+gitAUTOINC+a24c780b60-r0/pseudo/pseudo.log indicates 14 errors [qa_pseudo]
qtwebkit-examples-5.10.0+gitAUTOINC+a24c780b60: This /work/armv5te-oe-linux-gnueabi/qtwebkit-examples/5.10.0+gitAUTOINC+a24c780b60-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
qtwebkit-examples-5.10.0+gitAUTOINC+a24c780b60: This /work/core2-64-oe-linux/qtwebkit-examples/5.10.0+gitAUTOINC+a24c780b60-r0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
qtwebkit-examples-5.10.0+gitAUTOINC+a24c780b60: This /work/i586-oe-linux-musl/qtwebkit-examples/5.10.0+gitAUTOINC+a24c780b60-r0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
qtwebsockets-5.10.0+gitAUTOINC+0e4b43383d: This /work/aarch64-oe-linux/qtwebsockets/5.10.0+gitAUTOINC+0e4b43383d-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
qtwebsockets-5.10.0+gitAUTOINC+0e4b43383d: This /work/armv5te-oe-linux-gnueabi/qtwebsockets/5.10.0+gitAUTOINC+0e4b43383d-r0/pseudo/pseudo.log indicates 11 errors [qa_pseudo]
qtwebsockets-5.10.0+gitAUTOINC+0e4b43383d: This /work/core2-64-oe-linux/qtwebsockets/5.10.0+gitAUTOINC+0e4b43383d-r0/pseudo/pseudo.log indicates 17 errors [qa_pseudo]
qtwebsockets-5.10.0+gitAUTOINC+0e4b43383d: This /work/i586-oe-linux-musl/qtwebsockets/5.10.0+gitAUTOINC+0e4b43383d-r0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
qtwebview-5.10.0+gitAUTOINC+54ea23243c: This /work/aarch64-oe-linux/qtwebview/5.10.0+gitAUTOINC+54ea23243c-r0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
qtwebview-5.10.0+gitAUTOINC+54ea23243c: This /work/core2-64-oe-linux/qtwebview/5.10.0+gitAUTOINC+54ea23243c-r0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
qtwebview-5.10.0+gitAUTOINC+54ea23243c: This /work/i586-oe-linux-musl/qtwebview/5.10.0+gitAUTOINC+54ea23243c-r0/pseudo/pseudo.log indicates 11 errors [qa_pseudo]
qtx11extras-5.10.0+gitAUTOINC+33e3fcc1fb: This /work/aarch64-oe-linux/qtx11extras/5.10.0+gitAUTOINC+33e3fcc1fb-r0/pseudo/pseudo.log indicates 7 errors [qa_pseudo]
qtx11extras-5.10.0+gitAUTOINC+33e3fcc1fb: This /work/armv5te-oe-linux-gnueabi/qtx11extras/5.10.0+gitAUTOINC+33e3fcc1fb-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
qtx11extras-5.10.0+gitAUTOINC+33e3fcc1fb: This /work/core2-64-oe-linux/qtx11extras/5.10.0+gitAUTOINC+33e3fcc1fb-r0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
qtxmlpatterns-5.10.0+gitAUTOINC+8b831bdb51: This /work/aarch64-oe-linux/qtxmlpatterns/5.10.0+gitAUTOINC+8b831bdb51-r0/pseudo/pseudo.log indicates 22 errors [qa_pseudo]
qtxmlpatterns-5.10.0+gitAUTOINC+8b831bdb51: This /work/core2-64-oe-linux/qtxmlpatterns/5.10.0+gitAUTOINC+8b831bdb51-r0/pseudo/pseudo.log indicates 25 errors [qa_pseudo]
qtxmlpatterns-5.10.0+gitAUTOINC+8b831bdb51: This /work/i586-oe-linux-musl/qtxmlpatterns/5.10.0+gitAUTOINC+8b831bdb51-r0/pseudo/pseudo.log indicates 17 errors [qa_pseudo]
quagga-1.2.1: This /work/aarch64-oe-linux/quagga/1.2.1-r0/pseudo/pseudo.log indicates 14 errors [qa_pseudo]
quagga-1.2.1: This /work/core2-64-oe-linux/quagga/1.2.1-r0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
quagga-1.2.1: This /work/i586-oe-linux-musl/quagga/1.2.1-r0/pseudo/pseudo.log indicates 15 errors [qa_pseudo]
quilt-0.65: This /work/aarch64-oe-linux/quilt/0.65-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
rabbitmq-c-0.7.0: This /work/aarch64-oe-linux/rabbitmq-c/0.7.0-r0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
radvd-2.17: This /work/aarch64-oe-linux/radvd/2.17-r0/pseudo/pseudo.log indicates 7 errors [qa_pseudo]
radvd-2.17: This /work/armv5te-oe-linux-gnueabi/radvd/2.17-r0/pseudo/pseudo.log indicates 5 errors [qa_pseudo]
radvd-2.17: This /work/core2-64-oe-linux/radvd/2.17-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
radvd-2.17: This /work/i586-oe-linux-musl/radvd/2.17-r0/pseudo/pseudo.log indicates 7 errors [qa_pseudo]
rapidjson-1.1.0+gitAUTOINC+e5635fb27f: This /work/core2-64-oe-linux/rapidjson/1.1.0+gitAUTOINC+e5635fb27f-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
rsyslog-8.29.0: This /work/aarch64-oe-linux/rsyslog/8.29.0-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
rsyslog-8.29.0: This /work/armv5te-oe-linux-gnueabi/rsyslog/8.29.0-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
rsyslog-8.29.0: This /work/core2-64-oe-linux/rsyslog/8.29.0-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
rsyslog-8.29.0: This /work/i586-oe-linux-musl/rsyslog/8.29.0-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
samba-4.7.0: This /work/aarch64-oe-linux/samba/4.7.0-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
samba-4.7.0: This /work/core2-64-oe-linux/samba/4.7.0-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
schroedinger-1.0.11: This /work/core2-64-oe-linux/schroedinger/1.0.11-r0/pseudo/pseudo.log indicates 18 errors [qa_pseudo]
sdparm-1.10: This /work/core2-64-oe-linux/sdparm/1.10-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
sed-4.2.2: This /work/core2-64-oe-linux/sed/4.2.2-r0/pseudo/pseudo.log indicates 14 errors [qa_pseudo]
shadow-4.2.1: This /work/armv5te-oe-linux-gnueabi/shadow/4.2.1-r0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
slang-2.3.1a: This /work/i586-oe-linux-musl/slang/2.3.1a-r0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
squid-3.5.26: This /work/aarch64-oe-linux/squid/3.5.26-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
squid-3.5.26: This /work/armv5te-oe-linux-gnueabi/squid/3.5.26-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
squid-3.5.26: This /work/core2-64-oe-linux/squid/3.5.26-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
sthttpd-2.27.1: This /work/aarch64-oe-linux/sthttpd/2.27.1-r0/pseudo/pseudo.log indicates 7 errors [qa_pseudo]
sthttpd-2.27.1: This /work/armv5te-oe-linux-gnueabi/sthttpd/2.27.1-r0/pseudo/pseudo.log indicates 5 errors [qa_pseudo]
sthttpd-2.27.1: This /work/i586-oe-linux-musl/sthttpd/2.27.1-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
strace-4.19: This /work/aarch64-oe-linux/strace/4.19-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
strace-4.19: This /work/armv5te-oe-linux-gnueabi/strace/4.19-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
strace-4.19: This /work/core2-64-oe-linux/strace/4.19-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
strace-4.19: This /work/i586-oe-linux-musl/strace/4.19-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
syslog-ng-3.8.1: This /work/i586-oe-linux-musl/syslog-ng/3.8.1-r0/pseudo/pseudo.log indicates 18 errors [qa_pseudo]
tcl-8.6.7: This /work/aarch64-oe-linux/tcl/8.6.7-r0/pseudo/pseudo.log indicates 7 errors [qa_pseudo]
tcl-8.6.7: This /work/armv5te-oe-linux-gnueabi/tcl/8.6.7-r0/pseudo/pseudo.log indicates 5 errors [qa_pseudo]
tcl-8.6.7: This /work/core2-64-oe-linux/tcl/8.6.7-r0/pseudo/pseudo.log indicates 8 errors [qa_pseudo]
telepathy-idle-0.2.0: This /work/core2-64-oe-linux/telepathy-idle/0.2.0-r0/pseudo/pseudo.log indicates 18 errors [qa_pseudo]
tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: This /work/all-oe-linux/tesseract-lang/3.04.00+gitAUTOINC+3cf1e2df1f-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
tftp-hpa-5.2: This /work/aarch64-oe-linux/tftp-hpa/5.2-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
tftp-hpa-5.2: This /work/armv5te-oe-linux-gnueabi/tftp-hpa/5.2-r0/pseudo/pseudo.log indicates 5 errors [qa_pseudo]
tftp-hpa-5.2: This /work/i586-oe-linux-musl/tftp-hpa/5.2-r0/pseudo/pseudo.log indicates 7 errors [qa_pseudo]
tipcutils-2.2.0+gitAUTOINC+7ab2211b87: This /work/qemuarm-oe-linux-gnueabi/tipcutils/2.2.0+gitAUTOINC+7ab2211b87-r0/pseudo/pseudo.log indicates 9 errors [qa_pseudo]
tipcutils-2.2.0+gitAUTOINC+7ab2211b87: This /work/qemux86-oe-linux-musl/tipcutils/2.2.0+gitAUTOINC+7ab2211b87-r0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
ttf-abyssinica-1.500: This /work/all-oe-linux/ttf-abyssinica/1.500-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
udisks-1.0.5: This /work/aarch64-oe-linux/udisks/1.0.5-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
ufw-0.33: This /work/aarch64-oe-linux/ufw/0.33-r0/pseudo/pseudo.log indicates 7 errors [qa_pseudo]
ufw-0.33: This /work/armv5te-oe-linux-gnueabi/ufw/0.33-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
ufw-0.33: This /work/core2-64-oe-linux/ufw/0.33-r0/pseudo/pseudo.log indicates 8 errors [qa_pseudo]
ufw-0.33: This /work/i586-oe-linux-musl/ufw/0.33-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
upm-1.3.0-gitAUTOINC+106b6c7062: This /work/core2-64-oe-linux/upm/1.3.0-gitAUTOINC+106b6c7062-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
usrsctp-git: This /work/core2-64-oe-linux/usrsctp/git-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
util-linux-2.31: This /work/aarch64-oe-linux/util-linux/2.31-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
util-linux-2.31: This /work/armv5te-oe-linux-gnueabi/util-linux/2.31-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
util-linux-2.31: This /work/core2-64-oe-linux/util-linux/2.31-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
which-2.21: This /work/aarch64-oe-linux/which/2.21-r3/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
xbitmaps-1.1.1: This /work/aarch64-oe-linux/xbitmaps/1.1.1-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
xf86-video-ati-7.8.0: This /work/core2-64-oe-linux/xf86-video-ati/2_7.8.0-r0/pseudo/pseudo.log indicates 18 errors [qa_pseudo]
xfce4-fsguard-plugin-1.1.0: This /work/armv5te-oe-linux-gnueabi/xfce4-fsguard-plugin/1.1.0-r0/pseudo/pseudo.log indicates 16 errors [qa_pseudo]
xfce4-panel-4.12.1: This /work/armv5te-oe-linux-gnueabi/xfce4-panel/4.12.1-r0/pseudo/pseudo.log indicates 16 errors [qa_pseudo]
xfmpc-0.2.3: This /work/core2-64-oe-linux/xfmpc/0.2.3-r0/pseudo/pseudo.log indicates 18 errors [qa_pseudo]
xkeyboard-config-2.22: This /work/aarch64-oe-linux/xkeyboard-config/2.22-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
xmlrpc-c-1.31.0: This /work/i586-oe-linux-musl/xmlrpc-c/1.31.0-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
xproto-7.0.31: This /work/armv5te-oe-linux-gnueabi/xproto/1_7.0.31-r0/pseudo/pseudo.log indicates 16 errors [qa_pseudo]
xrdp-0.9.4+gitAUTOINC+c295dd61b8: This /work/aarch64-oe-linux/xrdp/0.9.4+gitAUTOINC+c295dd61b8-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
xrdp-0.9.4+gitAUTOINC+c295dd61b8: This /work/armv5te-oe-linux-gnueabi/xrdp/0.9.4+gitAUTOINC+c295dd61b8-r0/pseudo/pseudo.log indicates 16 errors [qa_pseudo]
xrestop-0.4: This /work/aarch64-oe-linux/xrestop/0.4-r3/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
xserver-common-1.34: This /work/i586-oe-linux-musl/xserver-common/1.34-r9/pseudo/pseudo.log indicates 11 errors [qa_pseudo]
zeromq-4.1.6: This /work/core2-64-oe-linux/zeromq/4.1.6-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]



This git log matches with the metadata as seen by qemuarm build.
In some cases qemux86 and qemux86-64 builds are built with slightly
different metadata, you can see the exact version near the top of each
log.world.qemu* files linked from the report

== Tested changes (not included in master yet) - bitbake ==
latest upstream commit: 
2d14d60 toaster: add 'nobuild' option to Toaster
not included in master yet: 
1f7d23b world-image: add extra target
2d550e0 fetch2: Allow Fetch.download() to warn instead of error

== Tested changes (not included in master yet) - openembedded-core ==
latest upstream commit: 
3cf8bda linux-yocto/4.12: CQM and kmemleak fixes
not included in master yet: 
08820d0 kernel-devicetree.bbclass: Use lowercase names for shell variables
b2927b3 kernel-devicetree.bbclass: Fix and simplify instalation of DTB files
5e51422 kernel.bbclass: use the consistent naming schema for initramfs
2ba5049 kernel.bbclass: move variables for kernel artifacts names to separate bbclass
ec8f030 report-error: Allow to upload reports automatically
c38d29a buildhistory.bbclass: metadata-revs show repo parent
82daf30 metadata-revs: provide more information
8b10f52 qemux86: Add identical qemux86copy variant for tests
348c2cd reproducible_build.bbclass: initial support for binary reproducibility
3d0964e cpio: provide cpio-replacement-native
4bed115 image_types.bbclass: improve cpio image reproducibility
f591379 rootfs-postcommands.bbclass: support binary reproducibility
588fd12 sstate.bbclass: Do not cause build failures due to setscene errors
36fd765 insane.bbclass: Add do_qa_pseudo function to check for common errors listed in pseudo.log
477965f insane.bbclass: use package_qa_handle_error for do_qa_pseudo

== Tested changes (not included in master yet) - meta-openembedded ==
latest upstream commit: 
cf993a2 Move RDEPENDS on libasound-module to bluez4 since it has been removed from bluez5
not included in master yet: 
63ca1e1 open-isns: Fix build with musl
794178e bridge-utils: modify the AR to cross toolchain
fa407cd ssmtp: misc recipe updates + add Debian "partial loss of message body" fix
e8f9c4d dovecot: Fix parallel build
5fff6ae dnsmasq: update SRC_URI for versions 2.69 and earlier
3e71a16 postfix: fix send mail failure and eliminate warning
6d117d0 openvpn: Upgrade 2.4.3 -> 2.4.4
2057477 arptables: Fix do_install task
f15a30e lksctp-tools: update and remove from blacklist
ec00574 freediameter: add new recipe
cc741c9 net-snmp: support openssl without 3des
1d409dd stunnel: fix compile error when openssl disable des support
9843c27 bridge-utils: update to v1.6
1deb001 corosync: 2.4.2 -> 2.4.3
ad60dae cyrus-sasl: virtual/db isn't used by core, change to db
d55c07e postfix: virtual/db isn't used by core, change to db
78b08b7 networkmanager: add consolekit only when x11 is enabled
d415478 iscsi-initiator-utils: check file existence before moving
6751b38 iscsi-initiator-utils: remove the distro_features_check
72539bf open-isns: add sysvinit support
a9a9a82 libtalloc: update to version 2.1.10
c07d8d4 libtevent: update to version 0.99.33
880374b libtdb: update to version 1.3.15
9adc88f libldb: update to version 1.2.2
200f1fd Revert "samba: add missing RDEPENDS"
df08615 samba: move to version 4.7.0
5bf0fea pcmciautils: add (from oe-core)
817bf36 chrony: Update to version 3.2
3984a8d site: move from meta-oe to meta-networking
9006867 inetutils: make -syslog rconflict with other system loggers
f072db8 net-snmp: fix invalid paths in target net-snmp-config
bb3be9a cifs-utils: mount.cifs should build without samba dependency
8d91e29 gvfs: update 1.32.1 -> 1.34.1
46facdd plymouth: do not install systemd units manually
40275d5 plymouth: packageconfig gtk needs gtk+3 as depends
52b56ba plymouth: fix path to systemd-tty-ask-password-agent
f177f56 fltk-native: remove fltk-config from image
01046ee fltk: remove fltk-native from DEPENDS
bd7e2dd fltk: do not suffix shared library names with '_SHARED'
a36ad88 Add FLTK to licenses to avoid warning when building fltk / fltk-native
b72eaab Revert "iperf: remove depricated package"
f809eca iperf: rename to iperf2 and bump 2.0.5 -> 2.0.10
3ebe23d gtk-xfce-engine: Fix build with glib-2.0 > 2.53
9136193 libgnome: Fix invalid UTF-8 in header
9c34da7 libgnomeui: Fix build with newer glib-2.0
74d2265 python-flask-login: update to version 0.4.1
07418e3 python-pexpect: update to version 4.3.1
1a94f37 python-pymongo: update to version 3.6.0
e126560 python-astroid: update to version 1.6.0
3e5d1ca python-psutil: update to version 5.4.2
6015b30 python-pandas: update to version 0.21.1
a373327 python-simplejson: update to version 3.13.2
8dffcac python-asn1crypto: update to version 0.24.0
000ded1 python-attr: update to version 0.3.1
3697f18 python-cryptography: update to version 2.1.4
ea1afe4 python-cryptography-vectors: update to version 2.1.4
c538737 python-pluggy: add initial recipe for version 0.6.0
ad26f89 python-pytest: update to version 3.3.1
2e1add4 python-pymisp: update to version 2.4.84
19e8126 python-pycparser: update RDEPENDS to add ply
f639a7f python-html5lib: update to version 1.0.1
4acd3ec python-webencodings: update RDEPENDS to include json
ae37454 python-pylint: update to version 1.8.1
4dc8985 python-ipaddress: update to version 1.0.19
51588f5 python-aws-iot-device-sdk-python: update to version 1.3.1
796325b python-pyopenssl: update to version 17.5.0
d67478c python-twisted: avoid downloading build dependencies
68853fe python-automat: fix build dependencies to avoid download during do_compile
8d18fac python-pysocks: update to version 1.6.8
7b59007 python-werkzeug: update to version 0.13
59f433e python-pytest-runner: update to version 3.0
f4481ee python-django: update to version 1.11.8
87c8a90 python3-cassandra-driver: update to version 3.12.0
e3dd84d nginx: update to version 1.13.7
4ebb362 phpmyadmin: update to version 4.7.6
bd7ecb4 xorgxrdp: new add
08612a0 dnfdragora: new add
81c9e87 vim: Security Advisory - vim - CVE-2017-17087
6ae4d25 rygel: Add lms PACKAGECONFIG item
963cf1d libyui: new add
1f228f0 Adding LUA to SDK
cdf59bf protobuf: add ptest support
3624472 wireshark: Update to 2.2.11

== Tested changes (not included in master yet) - meta-qt5 ==
latest upstream commit: 
06d1c47 qtwebengine: make test suite succeed
not included in master yet: 
5ae76bb Upgrade to Qt 5.10.0
1421787 Fix missing OE_QMAKE_STRIP env variable
1be652e qwt-qt5: rewrite completely
70f36eb qt5: use correct HostPrefix
507e54d qtlocation: correct PACKAGECONFIG for mapboxgl
f3e0cef gstreamer1.0-plugins-bad: add expansion parameter
d27c019 qt5: remove use of OE_QMAKE_WAYLAND_SCANNER
aeeaa93 qtbase: mkspecs: add default toolchain options
3cf0bbb qtbase_git: install qt.conf for the target

== Tested changes (not included in master yet) - meta-browser ==
latest upstream commit: 
8cc24ca Merge pull request #86 from rakuco/oz-wl-command-line-args
not included in master yet: 


