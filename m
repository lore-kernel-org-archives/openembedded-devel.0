Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f181.google.com (mail-pf0-f181.google.com
	[209.85.192.181])
	by mail.openembedded.org (Postfix) with ESMTP id DF10978721
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 Jan 2018 22:14:33 +0000 (UTC)
Received: by mail-pf0-f181.google.com with SMTP id t5so5608486pfi.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 Jan 2018 14:14:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=to:from:subject:message-id:date:user-agent:mime-version
	:content-language;
	bh=P3lSI0t8LAEEhkubMzynuQLYUon0D9FksSRK1kOo6KA=;
	b=oGWC+LH64tzgrXbq+dZFsoZ7ByFx2+NEj9w8IQWK0q/LjEfz8+WtFoYpqYAaybJ6F5
	mIxcBpTX8YiSfnhqH47g0wzr2+8BQNhD7qbBZ1tagT1an/36uwk3eE4zikpp4MTLdVgl
	HWyvET7SBn2Q3y7wg9Lw4MZ/70sFC2Y7cLNBt7u3IfZux8IIh4yYftH2DQLOXAlf8u5k
	lD5swxRV7Fz7uqVCstHBTF8m8qrjACVleoW/eN3XBQx8TKp3/tYIR/p+STV31WCGyged
	IxnnEpHBdnhVXYNn8Lf+xXLVIIWRi41E4L/T5UMGTu3+DLkkBJg5rCsYwGcH4RNf82L9
	+Y/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:to:from:subject:message-id:date:user-agent
	:mime-version:content-language;
	bh=P3lSI0t8LAEEhkubMzynuQLYUon0D9FksSRK1kOo6KA=;
	b=eyUT7vk8DHbNnuTFHOj9kgfCvMK+pIPvnvkl/D78Jqo3jUSjabr9S2RXQw8LALa96b
	TFtHbmPFrEQdZcn5s37vtKYlZEzwL8F/j6kZZnJsSKC4A7qeRowtHvwb4izahxKnMb1c
	B1c/r5/QfYsbvsqtJxUzRmo74m50uY380HRLNKyimsHyt9F0ZT+IV/nH+zfZd5q65oFu
	LPQqkH8jfE4QS2cEz7SrE6Zjpj5TKK96mk9aljoOqE5AXLLYVv8yvsj/ioOgnF0CjOzm
	lIFNBlYhCCYO4NmRDd0L3ajntPvzA5gt90eGxKTZZvHOmxAfimD/Fy6geTvBvzk3NDMY
	RBNA==
X-Gm-Message-State: AKwxytdn30afTCQJDlBuGZwUAxGvvEzx0JbKYrAItGnEUhsSveWIgkJe
	LNDerzofn+3da26a6dwgBWGiQQ==
X-Google-Smtp-Source: AH8x226eV4e7VJcCW6fOqkPt1fdXI6zTX1OOSvjmiW0A4drOg0Tvj7LZ+x4IjpacEqfn7JegOr3u0Q==
X-Received: by 2002:a17:902:44c:: with SMTP id
	70-v6mr2376260ple.221.1516572873706; 
	Sun, 21 Jan 2018 14:14:33 -0800 (PST)
Received: from ?IPv6:2601:202:4000:1184:a4cf:fc1a:2afa:5e49?
	([2601:202:4000:1184:a4cf:fc1a:2afa:5e49])
	by smtp.gmail.com with ESMTPSA id
	l188sm1173544pgl.72.2018.01.21.14.14.31
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 21 Jan 2018 14:14:32 -0800 (PST)
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
From: akuster808 <akuster808@gmail.com>
Message-ID: <5398622c-04a5-cc43-db21-593a2a2eabbc@gmail.com>
Date: Sun, 21 Jan 2018 14:14:31 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.0
MIME-Version: 1.0
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: State of the world, Failed tasks 2018-01-19
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
X-List-Received-Date: Sun, 21 Jan 2018 22:14:34 -0000
Content-Language: en-US
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

== Failed tasks 2018-01-19 ==

INFO: jenkins-job.sh-1.8.43 Complete log available at http://logs.nslu2-linux.org/buildlogs/oe/world/sumo/log.report.20180121_120311.log

=== common (8) ===
    * meta-openembedded/meta-networking/recipes-daemons/keepalived/keepalived_1.3.5.bb:do_configure
    * meta-openembedded/meta-networking/recipes-kernel/wireguard/wireguard-module_0.0.20171221.bb:do_compile
    * meta-openembedded/meta-networking/recipes-support/ipcalc/ipcalc_0.2.0.bb:do_package_qa
    * meta-openembedded/meta-networking/recipes-support/ntop/ntop_5.0.1.bb:do_configure
    * meta-openembedded/meta-oe/recipes-support/poco/poco_1.8.1.bb:do_compile
    * meta-openembedded/meta-python/recipes-devtools/python/python3-tornado_4.5.3.bb:do_populate_lic
    * meta-openembedded/meta-python/recipes-devtools/python/python-tornado_4.5.3.bb:do_populate_lic
    * virtual:native:meta-openembedded/meta-oe/recipes-graphics/fontforge/fontforge_20170731.bb:do_compile

=== common-x86 (0) ===

=== qemuarm (5) ===
    * meta-openembedded/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb:do_compile
    * meta-openembedded/meta-oe/recipes-extended/tiptop/tiptop_2.3.bb:do_compile
    * meta-openembedded/meta-oe/recipes-graphics/libyui/libyui-ncurses_git.bb:do_packagedata
    * openembedded-core/meta/recipes-core/glibc/glibc-locale_2.26.bb:do_package_qa
    * openembedded-core/meta/recipes-sato/webkit/webkitgtk_2.18.5.bb:do_compile

=== qemuarm64 (11) ===
    * meta-openembedded/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_1.5.2.bb:do_install
    * meta-openembedded/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_2.0.2.bb:do_configure
    * meta-openembedded/meta-oe/recipes-devtools/luajit/luajit_2.0.5.bb:do_compile
    * meta-openembedded/meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings_git.bb:do_compile
    * meta-openembedded/meta-oe/recipes-extended/fluentbit/fluentbit_0.12.1.bb:do_compile
    * meta-openembedded/meta-oe/recipes-support/mysql/mariadb-native_5.5.57.bb:do_install
    * meta-openembedded/meta-python/recipes-devtools/python/python3-smbus_3.1.2.bb:do_compile
    * meta-openembedded/meta-python/recipes-devtools/python/python-smbus_3.1.2.bb:do_compile
    * openembedded-core/meta/recipes-kernel/kexec/kexec-tools_2.0.16.bb:do_compile
    * openembedded-core/meta/recipes-sato/webkit/webkitgtk_2.18.5.bb:do_configure
    * virtual:native:meta-openembedded/meta-oe/recipes-connectivity/obexftp/obexftp_0.24.2.bb:do_compile

=== qemux86 (28) ===
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
    * meta-openembedded/meta-oe/recipes-graphics/libyui/libyui-ncurses_git.bb:do_compile
    * meta-openembedded/meta-oe/recipes-kernel/crash/crash_7.2.0.bb:do_compile
    * meta-openembedded/meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.0.bb:do_compile
    * meta-openembedded/meta-oe/recipes-multimedia/alsa/alsa-oss_1.0.17.bb:do_compile
    * meta-openembedded/meta-python/recipes-devtools/python/python3-systemd_234.bb:do_compile
    * meta-openembedded/meta-python/recipes-devtools/python/python-systemd_234.bb:do_compile
    * openembedded-core/meta/recipes-devtools/systemd-bootchart/systemd-bootchart_231.bb:do_compile
    * openembedded-core/meta/recipes-graphics/cogl/cogl-1.0_1.22.2.bb:do_compile
    * openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.12.4.bb:do_compile
    * openembedded-core/meta/recipes-multimedia/x264/x264_git.bb:do_package_qa

=== qemux86_64 (2) ===
    * meta-browser/recipes-browser/chromium/chromium-ozone-wayland_64.0.3274.0.r517731.igalia.1.bb:do_configure
    * meta-openembedded/meta-oe/recipes-extended/sysdig/sysdig_git.bb:do_compile

=== Number of failed tasks (88) ===
{| class=wikitable
|-
|| qemuarm 	|| 13	 || http://logs.nslu2-linux.org/buildlogs/oe/world/sumo/log.world.qemuarm.20180118_062402.log/ || http://errors.yoctoproject.org/Errors/Build/51537/
|-
|| qemuarm64 	|| 20	 || http://logs.nslu2-linux.org/buildlogs/oe/world/sumo/log.world.qemuarm64.20180119_100824.log/ || 
|-
|| qemux86 	|| 37	 || http://logs.nslu2-linux.org/buildlogs/oe/world/sumo/log.world.qemux86.20180118_062414.log/ || http://errors.yoctoproject.org/Errors/Build/51536/
|-
|| qemux86_64 	|| 18	 || http://logs.nslu2-linux.org/buildlogs/oe/world/sumo/log.world.qemux86-64.20180119_094710.log/ || http://errors.yoctoproject.org/Errors/Build/51576/
|}

=== PNBLACKLISTs (0) ===

=== QA issues (504) ===
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
||1	||installed-vs-shipped
|-
||2	||textrel
|-
||3	||host-user-contaminated
|-
||494	||qa_pseudo
|-
||4	||ldflags
|}



=== Incorrect PACKAGE_ARCH or sstate signatures (0) ===

Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/sumo/log.signatures.20180120_173130.log/


    * ERROR: Nothing RPROVIDES 'glibc-utils' (but /home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-support/uim/uim_1.8.6.bb RDEPENDS on or otherwise requires it)
    * ERROR: Required build target 'meta-world-pkgdata' has no buildable providers.
    * ERROR: no sigdata files were generated for MACHINE qemux86copy in /home/jenkins/oe/world/shr-core/tmpfs/stamps
    * ERROR: Nothing RPROVIDES 'glibc-gconv-euc-jp' (but /home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-support/uim/uim_1.8.6.bb RDEPENDS on or otherwise requires it)
    * ERROR: Required build target 'meta-world-pkgdata' has no buildable providers.
    * ERROR: no sigdata files were generated for MACHINE qemux86 in /home/jenkins/oe/world/shr-core/tmpfs/stamps


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


count: 3	issue: host-user-contaminated
glibc-locale-2.26: glibc-locale: /glibc-binary-localedata-af-za/usr/lib/locale/af_ZA/LC_PAPER is owned by uid 3004, which is the same as the user running bitbake. This may be due to host contamination [host-user-contaminated]
glibc-locale-2.26: glibc-locale: /glibc-binary-localedata-fr-ch/usr/lib/locale/fr_CH/LC_COLLATE is owned by uid 3004, which is the same as the user running bitbake. This may be due to host contamination [host-user-contaminated]
glibc-locale-2.26: glibc-locale: /glibc-binary-localedata-ml-in/usr/lib/locale/ml_IN/LC_PAPER is owned by uid 3004, which is the same as the user running bitbake. This may be due to host contamination [host-user-contaminated]


count: 1	issue: installed-vs-shipped
rdist: 1 installed and not shipped files. [installed-vs-shipped]


count: 0	issue: unknown-configure-option


count: 0	issue: symlink-to-sysroot


count: 0	issue: invalid-pkgconfig


count: 0	issue: pkgname


count: 4	issue: ldflags
ipcalc-0.2.0: No GNU_HASH in the elf binary: '/tmp/work/aarch64-oe-linux/ipcalc/0.2.0-r0/packages-split/ipcalc/usr/bin/ipcalc' [ldflags]
ipcalc-0.2.0: No GNU_HASH in the elf binary: '/tmp/work/armv5te-oe-linux-gnueabi/ipcalc/0.2.0-r0/packages-split/ipcalc/usr/bin/ipcalc' [ldflags]
ipcalc-0.2.0: No GNU_HASH in the elf binary: '/tmp/work/core2-64-oe-linux/ipcalc/0.2.0-r0/packages-split/ipcalc/usr/bin/ipcalc' [ldflags]
ipcalc-0.2.0: No GNU_HASH in the elf binary: '/tmp/work/i586-oe-linux-musl/ipcalc/0.2.0-r0/packages-split/ipcalc/usr/bin/ipcalc' [ldflags]


count: 0	issue: compile-host-path


count: 494	issue: qa_pseudo
acl-2.2.52: This /work/aarch64-oe-linux/acl/2.2.52-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
acpid-2.0.28: This /work/i586-oe-linux-musl/acpid/2.0.28-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
android-tools-5.1.1.r37: This /work/core2-64-oe-linux/android-tools/5.1.1.r37-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
apache2-2.4.29: This /work/aarch64-oe-linux/apache2/2.4.29-r0/pseudo/pseudo.log indicates 5 errors [qa_pseudo]
apache2-2.4.29: This /work/armv5te-oe-linux-gnueabi/apache2/2.4.29-r0/pseudo/pseudo.log indicates 7 errors [qa_pseudo]
apache2-2.4.29: This /work/core2-64-oe-linux/apache2/2.4.29-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
apache2-2.4.29: This /work/i586-oe-linux-musl/apache2/2.4.29-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
apr-util-1.6.0: This /work/core2-64-oe-linux/apr-util/1.6.0-r1/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
apt-1.2.24: This /work/i586-oe-linux-musl/apt/1.2.24-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
attr-2.4.47: This /work/armv5te-oe-linux-gnueabi/attr/2.4.47-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
autofs-5.1.2: This /work/aarch64-oe-linux/autofs/5.1.2-r0/pseudo/pseudo.log indicates 16 errors [qa_pseudo]
babl-0.1.28: This /work/armv5te-oe-linux-gnueabi/babl/0.1.28-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
bluez5-5.48: This /work/aarch64-oe-linux/bluez5/5.48-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
bluez5-5.48: This /work/armv5te-oe-linux-gnueabi/bluez5/5.48-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
bluez5-5.48: This /work/i586-oe-linux-musl/bluez5/5.48-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
bmap-tools-3.4: This /work/aarch64-oe-linux/bmap-tools/3.4-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
busybox-1.27.2: This /work/aarch64-oe-linux/busybox/1.27.2-r0/pseudo/pseudo.log indicates 11 errors [qa_pseudo]
busybox-1.27.2: This /work/i586-oe-linux-musl/busybox/1.27.2-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
ceres-solver-1.13: This /work/core2-64-oe-linux/ceres-solver/1.13-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
chrony-3.2: This /work/aarch64-oe-linux/chrony/3.2-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
chrony-3.2: This /work/armv5te-oe-linux-gnueabi/chrony/3.2-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
chrony-3.2: This /work/core2-64-oe-linux/chrony/3.2-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
chrony-3.2: This /work/i586-oe-linux-musl/chrony/3.2-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
ckermit-302: This /work/aarch64-oe-linux/ckermit/302-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
clutter-gst-3.0-3.0.24: This /work/armv5te-oe-linux-gnueabi/clutter-gst-3.0/3.0.24-r0/pseudo/pseudo.log indicates 16 errors [qa_pseudo]
cmpi-bindings-git: This /work/armv5te-oe-linux-gnueabi/cmpi-bindings/git-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
connman-1.35: This /work/armv5te-oe-linux-gnueabi/connman/1.35-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
coreutils-8.29: This /work/i586-oe-linux-musl/coreutils/8.29-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
corosync-2.4.3: This /work/i586-oe-linux-musl/corosync/2.4.3-r0/pseudo/pseudo.log indicates 17 errors [qa_pseudo]
ctdb-2.5.6: This /work/aarch64-oe-linux/ctdb/2.5.6-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
ctdb-2.5.6: This /work/core2-64-oe-linux/ctdb/2.5.6-r0/pseudo/pseudo.log indicates 7 errors [qa_pseudo]
curlpp-0.8.1: This /work/aarch64-oe-linux/curlpp/0.8.1-r0/pseudo/pseudo.log indicates 5 errors [qa_pseudo]
curlpp-0.8.1: This /work/armv5te-oe-linux-gnueabi/curlpp/0.8.1-r0/pseudo/pseudo.log indicates 7 errors [qa_pseudo]
curlpp-0.8.1: This /work/core2-64-oe-linux/curlpp/0.8.1-r0/pseudo/pseudo.log indicates 7 errors [qa_pseudo]
curlpp-0.8.1: This /work/i586-oe-linux-musl/curlpp/0.8.1-r0/pseudo/pseudo.log indicates 5 errors [qa_pseudo]
cyrus-sasl-2.1.26: This /work/armv5te-oe-linux-gnueabi/cyrus-sasl/2.1.26-r0/pseudo/pseudo.log indicates 19 errors [qa_pseudo]
dbench-4.0: This /work/armv5te-oe-linux-gnueabi/dbench/4.0-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
dhcp-4.3.6: This /work/aarch64-oe-linux/dhcp/4.3.6-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
dhcp-4.3.6: This /work/armv5te-oe-linux-gnueabi/dhcp/4.3.6-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
dhcp-4.3.6: This /work/core2-64-oe-linux/dhcp/4.3.6-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
diffutils-3.6: This /work/armv5te-oe-linux-gnueabi/diffutils/3.6-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
directfb-1.7.7: This /work/i586-oe-linux-musl/directfb/1.7.7-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
dovecot-2.2.33: This /work/aarch64-oe-linux/dovecot/2.2.33-r0/pseudo/pseudo.log indicates 11 errors [qa_pseudo]
dovecot-2.2.33: This /work/armv5te-oe-linux-gnueabi/dovecot/2.2.33-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
dovecot-2.2.33: This /work/core2-64-oe-linux/dovecot/2.2.33-r0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
dovecot-2.2.33: This /work/i586-oe-linux-musl/dovecot/2.2.33-r0/pseudo/pseudo.log indicates 11 errors [qa_pseudo]
dracut-045+git39c9b67f86145953aa30def9d77c68597a4ccfe8: This /work/i586-oe-linux-musl/dracut/1_045+git39c9b67f86145953aa30def9d77c68597a4ccfe8-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
drbd-utils-8.9.6: This /work/armv5te-oe-linux-gnueabi/drbd-utils/8.9.6-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
ebtables-2.0.10-4: This /work/aarch64-oe-linux/ebtables/2.0.10-4-r4/pseudo/pseudo.log indicates 5 errors [qa_pseudo]
ebtables-2.0.10-4: This /work/armv5te-oe-linux-gnueabi/ebtables/2.0.10-4-r4/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
ebtables-2.0.10-4: This /work/core2-64-oe-linux/ebtables/2.0.10-4-r4/pseudo/pseudo.log indicates 7 errors [qa_pseudo]
ebtables-2.0.10-4: This /work/i586-oe-linux-musl/ebtables/2.0.10-4-r4/pseudo/pseudo.log indicates 5 errors [qa_pseudo]
edac-utils-0.18+gitAUTOINC+f9aa96205f: This /work/aarch64-oe-linux/edac-utils/0.18+gitAUTOINC+f9aa96205f-r0/pseudo/pseudo.log indicates 5 errors [qa_pseudo]
elfutils-0.170: This /work/aarch64-oe-linux/elfutils/0.170-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
expect-5.45.3: This /work/armv5te-oe-linux-gnueabi/expect/5.45.3-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
firefox-addon-webconverger-20120228: This /work/all-oe-linux/firefox-addon-webconverger/20120228-r5/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
firefox-l10n-as-45.9.0esr: This /work/all-oe-linux/firefox-l10n-as/45.9.0esr-r3/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
firefox-l10n-it-45.9.0esr: This /work/all-oe-linux/firefox-l10n-it/45.9.0esr-r3/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
flashrom-0.9.9: This /work/core2-64-oe-linux/flashrom/0.9.9-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
freediameter-1.2.1: This /work/core2-64-oe-linux/freediameter/1.2.1-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
gammu-1.32.0: This /work/i586-oe-linux-musl/gammu/1.32.0-r0/pseudo/pseudo.log indicates 16 errors [qa_pseudo]
gateone-1.2+gitAUTOINC+f7a9be46cb: This /work/core2-64-oe-linux/gateone/1.2+gitAUTOINC+f7a9be46cb-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
gateone-1.2+gitAUTOINC+f7a9be46cb: This /work/i586-oe-linux-musl/gateone/1.2+gitAUTOINC+f7a9be46cb-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
gdk-pixbuf-2.36.11: This /work/aarch64-oe-linux/gdk-pixbuf/2.36.11-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
geoip-1.6.9: This /work/i586-oe-linux-musl/geoip/1.6.9-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
giflib-5.1.4: This /work/aarch64-oe-linux/giflib/5.1.4-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
git-2.15.0: This /work/aarch64-oe-linux/git/2.15.0-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
git-2.15.0: This /work/i586-oe-linux-musl/git/2.15.0-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
glew-2.1.0: This /work/core2-64-oe-linux/glew/2.1.0-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
glib-2.0-2.54.2: This /work/aarch64-oe-linux/glib-2.0/1_2.54.2-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
glib-2.0-2.54.2: This /work/armv5e-oe-linux-gnueabi/glib-2.0/1_2.54.2-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
glibc-2.26: This /work/aarch64-oe-linux/glibc/2.26-r0/pseudo/pseudo.log indicates 26 errors [qa_pseudo]
glibc-2.26: This /work/core2-64-oe-linux/glibc/2.26-r0/pseudo/pseudo.log indicates 11 errors [qa_pseudo]
glibc-locale-2.26: This /work/aarch64-oe-linux/glibc-locale/2.26-r0/pseudo/pseudo.log indicates 11 errors [qa_pseudo]
glibc-locale-2.26: This /work/armv5e-oe-linux-gnueabi/glibc-locale/2.26-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
glibc-locale-2.26: This /work/core2-64-oe-linux/glibc-locale/2.26-r0/pseudo/pseudo.log indicates 8 errors [qa_pseudo]
gptfdisk-1.0.3: This /work/core2-64-oe-linux/gptfdisk/1.0.3-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
gst-fluendo-mpegdemux-0.10.85: This /work/i586-oe-linux-musl/gst-fluendo-mpegdemux/0.10.85-r0/pseudo/pseudo.log indicates 16 errors [qa_pseudo]
gst-plugins-base-0.10.36: This /work/core2-64-oe-linux/gst-plugins-base/0.10.36-r8/pseudo/pseudo.log indicates 18 errors [qa_pseudo]
gst-plugins-good-0.10.31: This /work/i586-oe-linux-musl/gst-plugins-good/0.10.31-r8/pseudo/pseudo.log indicates 11 errors [qa_pseudo]
gstreamer1.0-omx-1.12.4: This /work/core2-64-oe-linux/gstreamer1.0-omx/1.12.4-r0/pseudo/pseudo.log indicates 18 errors [qa_pseudo]
ifuse-1.1.2: This /work/i586-oe-linux-musl/ifuse/1.1.2-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
ipsec-tools-0.8.2: This /work/qemuarm-oe-linux-gnueabi/ipsec-tools/0.8.2-r0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
iptraf-ng-1.1.4: This /work/core2-64-oe-linux/iptraf-ng/1.1.4-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
kexec-tools-2.0.16: This /work/i586-oe-linux-musl/kexec-tools/2.0.16-r1/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
kodi-17.3+gitrAUTOINC+6abeebd5ba: This /work/armv5te-oe-linux-gnueabi/kodi/17.3+gitrAUTOINC+6abeebd5ba-r0/pseudo/pseudo.log indicates 18 errors [qa_pseudo]
konkretcmpi-0.9.2: This /work/core2-64-oe-linux/konkretcmpi/0.9.2-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
lcdproc-0.5.8+gitAUTOINC+f5156e2e41: This /work/aarch64-oe-linux/lcdproc/0.5.8+gitAUTOINC+f5156e2e41-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
lcdproc-0.5.8+gitAUTOINC+f5156e2e41: This /work/armv5te-oe-linux-gnueabi/lcdproc/0.5.8+gitAUTOINC+f5156e2e41-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
lcdproc-0.5.8+gitAUTOINC+f5156e2e41: This /work/i586-oe-linux-musl/lcdproc/0.5.8+gitAUTOINC+f5156e2e41-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
lcms-2.7: This /work/core2-64-oe-linux/lcms/2.7-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
less-527: This /work/armv5te-oe-linux-gnueabi/less/527-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
libatasmart-0.19: This /work/core2-64-oe-linux/libatasmart/0.19-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
libblockdev-2.10: This /work/armv5te-oe-linux-gnueabi/libblockdev/2.10-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
libblockdev-2.10: This /work/i586-oe-linux-musl/libblockdev/2.10-r0/pseudo/pseudo.log indicates 16 errors [qa_pseudo]
libconnman-qt5-1.2.4+gitAUTOINC+9d98e12ed6: This /work/aarch64-oe-linux/libconnman-qt5/1.2.4+gitAUTOINC+9d98e12ed6-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
libconnman-qt5-1.2.4+gitAUTOINC+9d98e12ed6: This /work/core2-64-oe-linux/libconnman-qt5/1.2.4+gitAUTOINC+9d98e12ed6-r0/pseudo/pseudo.log indicates 7 errors [qa_pseudo]
libconnman-qt5-1.2.4+gitAUTOINC+9d98e12ed6: This /work/i586-oe-linux-musl/libconnman-qt5/1.2.4+gitAUTOINC+9d98e12ed6-r0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
libdbus-c++-0.9.0: This /work/i586-oe-linux-musl/libdbus-c++/0.9.0-r0/pseudo/pseudo.log indicates 16 errors [qa_pseudo]
libextutils-installpaths-perl-0.011: This /work/armv5te-oe-linux-gnueabi/libextutils-installpaths-perl/0.011-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
libice-1.0.9: This /work/core2-64-oe-linux/libice/1_1.0.9-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
libidn-1.33: This /work/core2-64-oe-linux/libidn/1.33-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
libjpeg-turbo-1.5.3: This /work/armv5te-oe-linux-gnueabi/libjpeg-turbo/1_1.5.3-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
libldb-1.2.2: This /work/armv5te-oe-linux-gnueabi/libldb/1.2.2-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
libmng-2.0.3: This /work/armv5te-oe-linux-gnueabi/libmng/2.0.3-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
libmtp-1.1.5: This /work/aarch64-oe-linux/libmtp/1.1.5-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
libnewt-python-0.52.20: This /work/armv5te-oe-linux-gnueabi/libnewt-python/0.52.20-r0/pseudo/pseudo.log indicates 16 errors [qa_pseudo]
libomxil-0.9.3: This /work/i586-oe-linux-musl/libomxil/0.9.3-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
libqofono-0.92+gitrAUTOINC+6916cd030b: This /work/aarch64-oe-linux/libqofono/0.92+gitrAUTOINC+6916cd030b-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
libqofono-0.92+gitrAUTOINC+6916cd030b: This /work/armv5te-oe-linux-gnueabi/libqofono/0.92+gitrAUTOINC+6916cd030b-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
libqofono-0.92+gitrAUTOINC+6916cd030b: This /work/core2-64-oe-linux/libqofono/0.92+gitrAUTOINC+6916cd030b-r0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
libqofono-0.92+gitrAUTOINC+6916cd030b: This /work/i586-oe-linux-musl/libqofono/0.92+gitrAUTOINC+6916cd030b-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
librcf-2.2.0.0: This /work/aarch64-oe-linux/librcf/2.2.0.0-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
libsombok3-2.4.0: This /work/armv5te-oe-linux-gnueabi/libsombok3/2.4.0-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
libtext-charwidth-perl-0.04: This /work/aarch64-oe-linux/libtext-charwidth-perl/0.04-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
libtool-cross-2.4.6: This /work/aarch64-oe-linux/libtool-cross/2.4.6-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
libtool-cross-2.4.6: This /work/armv5te-oe-linux-gnueabi/libtool-cross/2.4.6-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
libtool-cross-2.4.6: This /work/core2-64-oe-linux/libtool-cross/2.4.6-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
liburi-perl-1.72: This /work/armv5te-oe-linux-gnueabi/liburi-perl/1.72-r0/pseudo/pseudo.log indicates 11 errors [qa_pseudo]
libva-utils-1.8.3: This /work/i586-oe-linux-musl/libva-utils/1.8.3-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
libvncserver-0.9.11: This /work/aarch64-oe-linux/libvncserver/0.9.11-r0/pseudo/pseudo.log indicates 11 errors [qa_pseudo]
libvncserver-0.9.11: This /work/armv5te-oe-linux-gnueabi/libvncserver/0.9.11-r0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
libvncserver-0.9.11: This /work/core2-64-oe-linux/libvncserver/0.9.11-r0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
libvncserver-0.9.11: This /work/i586-oe-linux-musl/libvncserver/0.9.11-r0/pseudo/pseudo.log indicates 11 errors [qa_pseudo]
libwmf-0.2.8.4: This /work/armv5te-oe-linux-gnueabi/libwmf/0.2.8.4-r3/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
libwmf-0.2.8.4: This /work/core2-64-oe-linux/libwmf/0.2.8.4-r3/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
libwmf-0.2.8.4: This /work/i586-oe-linux-musl/libwmf/0.2.8.4-r3/pseudo/pseudo.log indicates 11 errors [qa_pseudo]
libx11-1.6.5: This /work/aarch64-oe-linux/libx11/1_1.6.5-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
libxfce4util-4.12.1: This /work/i586-oe-linux-musl/libxfce4util/4.12.1-r0/pseudo/pseudo.log indicates 16 errors [qa_pseudo]
lirc-0.9.4d: This /work/aarch64-oe-linux/lirc/0.9.4d-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
lirc-0.9.4d: This /work/armv5te-oe-linux-gnueabi/lirc/0.9.4d-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
lirc-0.9.4d: This /work/core2-64-oe-linux/lirc/0.9.4d-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
lirc-0.9.4d: This /work/i586-oe-linux-musl/lirc/0.9.4d-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
llvm-5.0: This /work/i586-oe-linux-musl/llvm/5.0-r0/pseudo/pseudo.log indicates 5 errors [qa_pseudo]
log4cpp-1.1.2: This /work/aarch64-oe-linux/log4cpp/1.1.2-r0/pseudo/pseudo.log indicates 5 errors [qa_pseudo]
log4cpp-1.1.2: This /work/armv5te-oe-linux-gnueabi/log4cpp/1.1.2-r0/pseudo/pseudo.log indicates 7 errors [qa_pseudo]
log4cpp-1.1.2: This /work/core2-64-oe-linux/log4cpp/1.1.2-r0/pseudo/pseudo.log indicates 7 errors [qa_pseudo]
log4cpp-1.1.2: This /work/i586-oe-linux-musl/log4cpp/1.1.2-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
logwatch-7.4.3: This /work/aarch64-oe-linux/logwatch/7.4.3-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
logwatch-7.4.3: This /work/armv5te-oe-linux-gnueabi/logwatch/7.4.3-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
ltp-20170929: This /work/i586-oe-linux-musl/ltp/20170929-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
lttng-tools-2.9.5: This /work/core2-64-oe-linux/lttng-tools/2.9.5-r0/pseudo/pseudo.log indicates 17 errors [qa_pseudo]
maliit-framework-qt5-0.99.0+gitAUTOINC+60b1b10de1: This /work/armv5te-oe-linux-gnueabi/maliit-framework-qt5/0.99.0+gitAUTOINC+60b1b10de1-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
maliit-framework-qt5-0.99.0+gitAUTOINC+60b1b10de1: This /work/core2-64-oe-linux/maliit-framework-qt5/0.99.0+gitAUTOINC+60b1b10de1-r0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
maliit-framework-qt5-0.99.0+gitAUTOINC+60b1b10de1: This /work/i586-oe-linux-musl/maliit-framework-qt5/0.99.0+gitAUTOINC+60b1b10de1-r0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
maliit-plugins-qt5-0.99.0+gitAUTOINC+c6a3485926: This /work/core2-64-oe-linux/maliit-plugins-qt5/0.99.0+gitAUTOINC+c6a3485926-r0/pseudo/pseudo.log indicates 19 errors [qa_pseudo]
mariadb-5.5.57: This /work/armv5e-oe-linux-gnueabi/mariadb/5.5.57-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
matchbox-keyboard-0.1.1: This /work/i586-oe-linux-musl/matchbox-keyboard/0.1.1-r0/pseudo/pseudo.log indicates 16 errors [qa_pseudo]
mbedtls-1.3.17: This /work/armv5te-oe-linux-gnueabi/mbedtls/1.3.17-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
mc-4.8.20: This /work/aarch64-oe-linux/mc/4.8.20-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
mc-4.8.20: This /work/i586-oe-linux-musl/mc/4.8.20-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
menulibre-2.1.3: This /work/aarch64-oe-linux/menulibre/2.1.3-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
mesa-demos-8.3.0: This /work/aarch64-oe-linux/mesa-demos/8.3.0-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
mesa-demos-8.3.0: This /work/i586-oe-linux-musl/mesa-demos/8.3.0-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
meson-0.44.0: This /work/armv5te-oe-linux-gnueabi/meson/0.44.0-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
modemmanager-1.6.4: This /work/armv5te-oe-linux-gnueabi/modemmanager/1.6.4-r0/pseudo/pseudo.log indicates 18 errors [qa_pseudo]
mosquitto-1.4.14: This /work/aarch64-oe-linux/mosquitto/1.4.14-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
mosquitto-1.4.14: This /work/i586-oe-linux-musl/mosquitto/1.4.14-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
mpg123-1.25.7: This /work/aarch64-oe-linux/mpg123/1.25.7-r0/pseudo/pseudo.log indicates 11 errors [qa_pseudo]
mpich-3.2: This /work/aarch64-oe-linux/mpich/3.2-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
mpich-3.2: This /work/core2-64-oe-linux/mpich/3.2-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
mpich-3.2: This /work/i586-oe-linux-musl/mpich/3.2-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
nana-2.5: This /work/core2-64-oe-linux/nana/2.5-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
netcf-0.2.8+gitAUTOINC+2c5d425585: This /work/i586-oe-linux-musl/netcf/0.2.8+gitAUTOINC+2c5d425585-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
netkit-telnet-0.17: This /work/armv5te-oe-linux-gnueabi/netkit-telnet/0.17-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
nettle-3.4: This /work/armv5te-oe-linux-gnueabi/nettle/3.4-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
nginx-1.12.2: This /work/core2-64-oe-linux/nginx/1.12.2-r0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
nginx-1.12.2: This /work/i586-oe-linux-musl/nginx/1.12.2-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
nspr-4.17: This /work/armv5te-oe-linux-gnueabi/nspr/4.17-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
nspr-4.17: This /work/core2-64-oe-linux/nspr/4.17-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
nss-3.34.1: This /work/core2-64-oe-linux/nss/3.34.1-r0/pseudo/pseudo.log indicates 7 errors [qa_pseudo]
ntfs-3g-ntfsprogs-2017.3.23: This /work/armv5te-oe-linux-gnueabi/ntfs-3g-ntfsprogs/2017.3.23-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
ntp-4.2.8p10: This /work/aarch64-oe-linux/ntp/4.2.8p10-r0/pseudo/pseudo.log indicates 11 errors [qa_pseudo]
ntp-4.2.8p10: This /work/armv5te-oe-linux-gnueabi/ntp/4.2.8p10-r0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
ntp-4.2.8p10: This /work/core2-64-oe-linux/ntp/4.2.8p10-r0/pseudo/pseudo.log indicates 14 errors [qa_pseudo]
ntp-4.2.8p10: This /work/i586-oe-linux-musl/ntp/4.2.8p10-r0/pseudo/pseudo.log indicates 11 errors [qa_pseudo]
onboard-1.4.1: This /work/i586-oe-linux-musl/onboard/1.4.1-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
onig-5.9.6: This /work/i586-oe-linux-musl/onig/5.9.6-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
openflow-1.0+gitAUTOINC+c84f33f09d: This /work/armv5te-oe-linux-gnueabi/openflow/1.0+gitAUTOINC+c84f33f09d-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
openhpi-3.6.1: This /work/core2-64-oe-linux/openhpi/3.6.1-r0/pseudo/pseudo.log indicates 16 errors [qa_pseudo]
openhpi-3.6.1: This /work/i586-oe-linux-musl/openhpi/3.6.1-r0/pseudo/pseudo.log indicates 11 errors [qa_pseudo]
open-isns-0.97: This /work/aarch64-oe-linux/open-isns/0.97-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
open-isns-0.97: This /work/armv5te-oe-linux-gnueabi/open-isns/0.97-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
open-isns-0.97: This /work/core2-64-oe-linux/open-isns/0.97-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
open-isns-0.97: This /work/i586-oe-linux-musl/open-isns/0.97-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
openldap-2.4.45: This /work/aarch64-oe-linux/openldap/2.4.45-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
openlmi-tools-0.10.5: This /work/core2-64-oe-linux/openlmi-tools/0.10.5-r0/pseudo/pseudo.log indicates 7 errors [qa_pseudo]
opensaf-5.17.07: This /work/aarch64-oe-linux/opensaf/5.17.07-r0/pseudo/pseudo.log indicates 21 errors [qa_pseudo]
opensaf-5.17.07: This /work/armv5te-oe-linux-gnueabi/opensaf/5.17.07-r0/pseudo/pseudo.log indicates 21 errors [qa_pseudo]
opensaf-5.17.07: This /work/core2-64-oe-linux/opensaf/5.17.07-r0/pseudo/pseudo.log indicates 16 errors [qa_pseudo]
openssh-7.6p1: This /work/aarch64-oe-linux/openssh/7.6p1-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
openssh-7.6p1: This /work/armv5te-oe-linux-gnueabi/openssh/7.6p1-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
openssh-7.6p1: This /work/core2-64-oe-linux/openssh/7.6p1-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
openssh-7.6p1: This /work/i586-oe-linux-musl/openssh/7.6p1-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
oprofile-1.1.0: This /work/core2-64-oe-linux/oprofile/1.1.0-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
ossp-uuid-1.6.2: This /work/aarch64-oe-linux/ossp-uuid/1.6.2-r2/pseudo/pseudo.log indicates 5 errors [qa_pseudo]
ossp-uuid-1.6.2: This /work/armv5te-oe-linux-gnueabi/ossp-uuid/1.6.2-r2/pseudo/pseudo.log indicates 7 errors [qa_pseudo]
ossp-uuid-1.6.2: This /work/core2-64-oe-linux/ossp-uuid/1.6.2-r2/pseudo/pseudo.log indicates 7 errors [qa_pseudo]
ossp-uuid-1.6.2: This /work/i586-oe-linux-musl/ossp-uuid/1.6.2-r2/pseudo/pseudo.log indicates 5 errors [qa_pseudo]
packagegroup-tools-bluetooth-1.0: This /work/all-oe-linux/packagegroup-tools-bluetooth/1.0-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
paho-mqtt-c-1.2.0: This /work/armv5te-oe-linux-gnueabi/paho-mqtt-c/1.2.0-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
parole-0.8.1: This /work/armv5te-oe-linux-gnueabi/parole/0.8.1-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
parted-3.2: This /work/armv5te-oe-linux-gnueabi/parted/3.2-r1/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
perf-1.0: This /work/qemux86_64-oe-linux/perf/1.0-r9/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
perl-5.24.1: This /work/aarch64-oe-linux/perl/5.24.1-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
php-7.1.9: This /work/armv5e-oe-linux-gnueabi/php/7.1.9-r0/pseudo/pseudo.log indicates 14 errors [qa_pseudo]
php-7.1.9: This /work/i586-oe-linux-musl/php/7.1.9-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
pigz-2.3.4: This /work/core2-64-oe-linux/pigz/2.3.4-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
pm-qa-0.5.2: This /work/aarch64-oe-linux/pm-qa/0.5.2-r0/pseudo/pseudo.log indicates 44 errors [qa_pseudo]
pm-qa-0.5.2: This /work/armv5te-oe-linux-gnueabi/pm-qa/0.5.2-r0/pseudo/pseudo.log indicates 48 errors [qa_pseudo]
pm-qa-0.5.2: This /work/core2-64-oe-linux/pm-qa/0.5.2-r0/pseudo/pseudo.log indicates 7 errors [qa_pseudo]
pmtools-20130209+gitAUTOINC+3ebe0e54c5: This /work/i586-oe-linux-musl/pmtools/20130209+gitAUTOINC+3ebe0e54c5-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
po4a-0.49: This /work/core2-64-oe-linux/po4a/0.49-r0/pseudo/pseudo.log indicates 11 errors [qa_pseudo]
popt-1.16: This /work/aarch64-oe-linux/popt/1.16-r3/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
portaudio-v19-v190600: This /work/armv5te-oe-linux-gnueabi/portaudio-v19/v190600-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
postfix-3.2.2: This /work/armv5te-oe-linux-gnueabi/postfix/3.2.2-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
postfix-3.2.2: This /work/core2-64-oe-linux/postfix/3.2.2-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
postfix-3.2.2: This /work/i586-oe-linux-musl/postfix/3.2.2-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
postgresql-9.4.15: This /work/aarch64-oe-linux/postgresql/9.4.15-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
postgresql-9.4.15: This /work/armv5e-oe-linux-gnueabi/postgresql/9.4.15-r0/pseudo/pseudo.log indicates 14 errors [qa_pseudo]
postgresql-9.4.15: This /work/core2-64-oe-linux/postgresql/9.4.15-r0/pseudo/pseudo.log indicates 14 errors [qa_pseudo]
postgresql-9.4.15: This /work/i586-oe-linux-musl/postgresql/9.4.15-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
ppp-2.4.7: This /work/i586-oe-linux-musl/ppp/2.4.7-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
prelink-1.0+gitAUTOINC+05aeafd053: This /work/armv5te-oe-linux-gnueabi/prelink/1.0+gitAUTOINC+05aeafd053-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
proftpd-1.3.6: This /work/aarch64-oe-linux/proftpd/1.3.6-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
proftpd-1.3.6: This /work/armv5te-oe-linux-gnueabi/proftpd/1.3.6-r0/pseudo/pseudo.log indicates 14 errors [qa_pseudo]
proftpd-1.3.6: This /work/core2-64-oe-linux/proftpd/1.3.6-r0/pseudo/pseudo.log indicates 14 errors [qa_pseudo]
psqlodbc-09.05.0300: This /work/i586-oe-linux-musl/psqlodbc/09.05.0300-r0/pseudo/pseudo.log indicates 16 errors [qa_pseudo]
pyrtm-0.4.2: This /work/i586-oe-linux-musl/pyrtm/0.4.2-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
python-2.7.13: This /work/aarch64-oe-linux/python/2.7.13-r1/pseudo/pseudo.log indicates 5 errors [qa_pseudo]
python-2.7.13: This /work/armv5te-oe-linux-gnueabi/python/2.7.13-r1/pseudo/pseudo.log indicates 5 errors [qa_pseudo]
python-2.7.13: This /work/core2-64-oe-linux/python/2.7.13-r1/pseudo/pseudo.log indicates 5 errors [qa_pseudo]
python-2.7.13: This /work/i586-oe-linux-musl/python/2.7.13-r1/pseudo/pseudo.log indicates 5 errors [qa_pseudo]
python3-3.5.3: This /work/aarch64-oe-linux/python3/3.5.3-r1.0/pseudo/pseudo.log indicates 5 errors [qa_pseudo]
python3-3.5.3: This /work/armv5te-oe-linux-gnueabi/python3/3.5.3-r1.0/pseudo/pseudo.log indicates 7 errors [qa_pseudo]
python3-3.5.3: This /work/core2-64-oe-linux/python3/3.5.3-r1.0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
python3-3.5.3: This /work/i586-oe-linux-musl/python3/3.5.3-r1.0/pseudo/pseudo.log indicates 15 errors [qa_pseudo]
python3-blivetgui-2.1.5: This /work/core2-64-oe-linux/python3-blivetgui/2.1.5-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
python3-cassandra-driver-3.12.0: This /work/armv5te-oe-linux-gnueabi/python3-cassandra-driver/3.12.0-r0/pseudo/pseudo.log indicates 11 errors [qa_pseudo]
python3-django-1.11.9: This /work/armv5te-oe-linux-gnueabi/python3-django/1.11.9-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
python3-docutils-0.14: This /work/armv5te-oe-linux-gnueabi/python3-docutils/0.14-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
python3-dominate-2.3.1: This /work/armv5te-oe-linux-gnueabi/python3-dominate/2.3.1-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
python3-flask-0.12.2: This /work/aarch64-oe-linux/python3-flask/0.12.2-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
python3-jsonpatch-1.21: This /work/armv5te-oe-linux-gnueabi/python3-jsonpatch/1.21-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
python3-jsonschema-2.6.0: This /work/aarch64-oe-linux/python3-jsonschema/2.6.0-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
python3-lazy-object-proxy-1.3.1: This /work/armv5te-oe-linux-gnueabi/python3-lazy-object-proxy/1.3.1-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
python3-nose-1.3.7: This /work/i586-oe-linux-musl/python3-nose/1.3.7-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
python3-paho-mqtt-1.3.1: This /work/core2-64-oe-linux/python3-paho-mqtt/1.3.1-r0/pseudo/pseudo.log indicates 16 errors [qa_pseudo]
python3-pip-9.0.1: This /work/armv5te-oe-linux-gnueabi/python3-pip/9.0.1-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
python3-pip-9.0.1: This /work/core2-64-oe-linux/python3-pip/9.0.1-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
python3-psutil-5.4.3: This /work/aarch64-oe-linux/python3-psutil/5.4.3-r0/pseudo/pseudo.log indicates 9 errors [qa_pseudo]
python3-pycryptodome-3.4.7: This /work/core2-64-oe-linux/python3-pycryptodome/3.4.7-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
python3-pyjwt-1.5.3: This /work/i586-oe-linux-musl/python3-pyjwt/1.5.3-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
python3-pylint-1.8.1: This /work/aarch64-oe-linux/python3-pylint/1.8.1-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
python3-pylint-1.8.1: This /work/armv5te-oe-linux-gnueabi/python3-pylint/1.8.1-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
python3-pylint-1.8.1: This /work/core2-64-oe-linux/python3-pylint/1.8.1-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
python3-pylint-1.8.1: This /work/i586-oe-linux-musl/python3-pylint/1.8.1-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
python3-pymisp-2.4.85.1: This /work/aarch64-oe-linux/python3-pymisp/2.4.85.1-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
python3-pyserial-3.4: This /work/aarch64-oe-linux/python3-pyserial/3.4-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
python3-pyserial-3.4: This /work/armv5te-oe-linux-gnueabi/python3-pyserial/3.4-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
python3-pytest-3.3.2: This /work/aarch64-oe-linux/python3-pytest/3.3.2-r0/pseudo/pseudo.log indicates 11 errors [qa_pseudo]
python3-twisted-17.9.0: This /work/core2-64-oe-linux/python3-twisted/17.9.0-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
python-alembic-0.9.6: This /work/core2-64-oe-linux/python-alembic/0.9.6-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
python-alembic-0.9.6: This /work/i586-oe-linux-musl/python-alembic/0.9.6-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
python-automat-0.6.0: This /work/armv5te-oe-linux-gnueabi/python-automat/0.6.0-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
python-automat-0.6.0: This /work/core2-64-oe-linux/python-automat/0.6.0-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
python-babel-2.5.1: This /work/i586-oe-linux-musl/python-babel/2.5.1-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
python-bcrypt-3.1.4: This /work/core2-64-oe-linux/python-bcrypt/3.1.4-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
python-cheetah-2.4.4: This /work/core2-64-oe-linux/python-cheetah/2.4.4-r3/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
python-cson-git: This /work/core2-64-oe-linux/python-cson/git-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
python-epydoc-3.0.1: This /work/i586-oe-linux-musl/python-epydoc/3.0.1-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
python-evdev-0.7.0: This /work/core2-64-oe-linux/python-evdev/0.7.0-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
python-feedformatter-0.4: This /work/core2-64-oe-linux/python-feedformatter/0.4-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
python-flask-xstatic-0.0.1: This /work/i586-oe-linux-musl/python-flask-xstatic/0.0.1-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
python-gevent-1.2.2: This /work/aarch64-oe-linux/python-gevent/1.2.2-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
python-imaging-1.1.7: This /work/aarch64-oe-linux/python-imaging/1.1.7-r5/pseudo/pseudo.log indicates 5 errors [qa_pseudo]
python-imaging-1.1.7: This /work/core2-64-oe-linux/python-imaging/1.1.7-r5/pseudo/pseudo.log indicates 8 errors [qa_pseudo]
python-imaging-1.1.7: This /work/i586-oe-linux-musl/python-imaging/1.1.7-r5/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
python-jsonpatch-1.21: This /work/armv5te-oe-linux-gnueabi/python-jsonpatch/1.21-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
python-netaddr-0.7.19: This /work/armv5te-oe-linux-gnueabi/python-netaddr/0.7.19-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
python-numeric-24.2: This /work/armv5te-oe-linux-gnueabi/python-numeric/24.2-ml3/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
python-numeric-24.2: This /work/i586-oe-linux-musl/python-numeric/24.2-ml3/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
python-numpy-1.13.1: This /work/armv5te-oe-linux-gnueabi/python-numpy/1.13.1-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
python-pbr-3.1.1: This /work/core2-64-oe-linux/python-pbr/3.1.1-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
python-pexpect-4.3.1: This /work/i586-oe-linux-musl/python-pexpect/4.3.1-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
python-pycryptodome-3.4.7: This /work/i586-oe-linux-musl/python-pycryptodome/3.4.7-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
python-pyflakes-1.6.0: This /work/aarch64-oe-linux/python-pyflakes/1.6.0-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
python-pylint-1.8.1: This /work/aarch64-oe-linux/python-pylint/1.8.1-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
python-pylint-1.8.1: This /work/core2-64-oe-linux/python-pylint/1.8.1-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
python-pylint-1.8.1: This /work/i586-oe-linux-musl/python-pylint/1.8.1-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
python-pyro4-4.63: This /work/armv5te-oe-linux-gnueabi/python-pyro4/4.63-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
python-pyserial-3.4: This /work/i586-oe-linux-musl/python-pyserial/3.4-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
python-scons-3.0.1: This /work/core2-64-oe-linux/python-scons/3.0.1-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
python-setuptools-38.2.5: This /work/core2-64-oe-linux/python-setuptools/38.2.5-r0/pseudo/pseudo.log indicates 7 errors [qa_pseudo]
python-setuptools-38.2.5: This /work/i586-oe-linux-musl/python-setuptools/38.2.5-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
python-snimpy-0.8.12: This /work/armv5te-oe-linux-gnueabi/python-snimpy/0.8.12-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
python-strict-rfc3339-0.7: This /work/core2-64-oe-linux/python-strict-rfc3339/0.7-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
python-thrift-0.10.0: This /work/aarch64-oe-linux/python-thrift/0.10.0-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
python-twisted-17.9.0: This /work/core2-64-oe-linux/python-twisted/17.9.0-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
python-vobject-0.9.5: This /work/armv5te-oe-linux-gnueabi/python-vobject/0.9.5-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
python-yappi-0.98: This /work/i586-oe-linux-musl/python-yappi/0.98-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
pywbem-0.8.0: This /work/core2-64-oe-linux/pywbem/0.8.0-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
pywbem-0.8.0: This /work/i586-oe-linux-musl/pywbem/0.8.0-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
qt3d-5.10.0+gitAUTOINC+7bd57d2218: This /work/aarch64-oe-linux/qt3d/5.10.0+gitAUTOINC+7bd57d2218-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
qt3d-5.10.0+gitAUTOINC+7bd57d2218: This /work/armv5te-oe-linux-gnueabi/qt3d/5.10.0+gitAUTOINC+7bd57d2218-r0/pseudo/pseudo.log indicates 24 errors [qa_pseudo]
qt3d-5.10.0+gitAUTOINC+7bd57d2218: This /work/core2-64-oe-linux/qt3d/5.10.0+gitAUTOINC+7bd57d2218-r0/pseudo/pseudo.log indicates 16 errors [qa_pseudo]
qt3d-5.10.0+gitAUTOINC+7bd57d2218: This /work/i586-oe-linux-musl/qt3d/5.10.0+gitAUTOINC+7bd57d2218-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
qt5-creator-3.5.1: This /work/aarch64-oe-linux/qt5-creator/3.5.1-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
qt5everywheredemo-1.0: This /work/armv5te-oe-linux-gnueabi/qt5everywheredemo/1.0-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
qtbase-5.10.0+gitAUTOINC+50117d738a: This /work/aarch64-oe-linux/qtbase/5.10.0+gitAUTOINC+50117d738a-r0/pseudo/pseudo.log indicates 36 errors [qa_pseudo]
qtbase-5.10.0+gitAUTOINC+50117d738a: This /work/armv5te-oe-linux-gnueabi/qtbase/5.10.0+gitAUTOINC+50117d738a-r0/pseudo/pseudo.log indicates 15 errors [qa_pseudo]
qtbase-5.10.0+gitAUTOINC+50117d738a: This /work/core2-64-oe-linux/qtbase/5.10.0+gitAUTOINC+50117d738a-r0/pseudo/pseudo.log indicates 17 errors [qa_pseudo]
qtbase-5.10.0+gitAUTOINC+50117d738a: This /work/i586-oe-linux-musl/qtbase/5.10.0+gitAUTOINC+50117d738a-r0/pseudo/pseudo.log indicates 15 errors [qa_pseudo]
qtcharts-5.10.0+gitAUTOINC+6a9606270e: This /work/aarch64-oe-linux/qtcharts/5.10.0+gitAUTOINC+6a9606270e-r0/pseudo/pseudo.log indicates 11 errors [qa_pseudo]
qtcharts-5.10.0+gitAUTOINC+6a9606270e: This /work/armv5te-oe-linux-gnueabi/qtcharts/5.10.0+gitAUTOINC+6a9606270e-r0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
qtcharts-5.10.0+gitAUTOINC+6a9606270e: This /work/core2-64-oe-linux/qtcharts/5.10.0+gitAUTOINC+6a9606270e-r0/pseudo/pseudo.log indicates 14 errors [qa_pseudo]
qtcharts-5.10.0+gitAUTOINC+6a9606270e: This /work/i586-oe-linux-musl/qtcharts/5.10.0+gitAUTOINC+6a9606270e-r0/pseudo/pseudo.log indicates 11 errors [qa_pseudo]
qtconnectivity-5.10.0+gitAUTOINC+bb9b8af08b: This /work/aarch64-oe-linux/qtconnectivity/5.10.0+gitAUTOINC+bb9b8af08b-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
qtconnectivity-5.10.0+gitAUTOINC+bb9b8af08b: This /work/armv5te-oe-linux-gnueabi/qtconnectivity/5.10.0+gitAUTOINC+bb9b8af08b-r0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
qtconnectivity-5.10.0+gitAUTOINC+bb9b8af08b: This /work/core2-64-oe-linux/qtconnectivity/5.10.0+gitAUTOINC+bb9b8af08b-r0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
qtconnectivity-5.10.0+gitAUTOINC+bb9b8af08b: This /work/i586-oe-linux-musl/qtconnectivity/5.10.0+gitAUTOINC+bb9b8af08b-r0/pseudo/pseudo.log indicates 11 errors [qa_pseudo]
qtdatavis3d-5.10.0+gitAUTOINC+d2abb20082: This /work/aarch64-oe-linux/qtdatavis3d/5.10.0+gitAUTOINC+d2abb20082-r0/pseudo/pseudo.log indicates 36 errors [qa_pseudo]
qtdatavis3d-5.10.0+gitAUTOINC+d2abb20082: This /work/armv5te-oe-linux-gnueabi/qtdatavis3d/5.10.0+gitAUTOINC+d2abb20082-r0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
qtdatavis3d-5.10.0+gitAUTOINC+d2abb20082: This /work/core2-64-oe-linux/qtdatavis3d/5.10.0+gitAUTOINC+d2abb20082-r0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
qtdatavis3d-5.10.0+gitAUTOINC+d2abb20082: This /work/i586-oe-linux-musl/qtdatavis3d/5.10.0+gitAUTOINC+d2abb20082-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
qtdeclarative-5.10.0+gitAUTOINC+dac71f3d6f: This /work/aarch64-oe-linux/qtdeclarative/5.10.0+gitAUTOINC+dac71f3d6f-r0/pseudo/pseudo.log indicates 19 errors [qa_pseudo]
qtdeclarative-5.10.0+gitAUTOINC+dac71f3d6f: This /work/armv5te-oe-linux-gnueabi/qtdeclarative/5.10.0+gitAUTOINC+dac71f3d6f-r0/pseudo/pseudo.log indicates 17 errors [qa_pseudo]
qtdeclarative-5.10.0+gitAUTOINC+dac71f3d6f: This /work/core2-64-oe-linux/qtdeclarative/5.10.0+gitAUTOINC+dac71f3d6f-r0/pseudo/pseudo.log indicates 19 errors [qa_pseudo]
qtdeclarative-5.10.0+gitAUTOINC+dac71f3d6f: This /work/i586-oe-linux-musl/qtdeclarative/5.10.0+gitAUTOINC+dac71f3d6f-r0/pseudo/pseudo.log indicates 22 errors [qa_pseudo]
qtenginio-5.10.0+gitAUTOINC+23603a3b08: This /work/aarch64-oe-linux/qtenginio/5.10.0+gitAUTOINC+23603a3b08-r0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
qtenginio-5.10.0+gitAUTOINC+23603a3b08: This /work/armv5te-oe-linux-gnueabi/qtenginio/5.10.0+gitAUTOINC+23603a3b08-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
qtenginio-5.10.0+gitAUTOINC+23603a3b08: This /work/core2-64-oe-linux/qtenginio/5.10.0+gitAUTOINC+23603a3b08-r0/pseudo/pseudo.log indicates 11 errors [qa_pseudo]
qtenginio-5.10.0+gitAUTOINC+23603a3b08: This /work/i586-oe-linux-musl/qtenginio/5.10.0+gitAUTOINC+23603a3b08-r0/pseudo/pseudo.log indicates 11 errors [qa_pseudo]
qtgamepad-5.10.0+gitAUTOINC+b505116ee4: This /work/aarch64-oe-linux/qtgamepad/5.10.0+gitAUTOINC+b505116ee4-r0/pseudo/pseudo.log indicates 11 errors [qa_pseudo]
qtgamepad-5.10.0+gitAUTOINC+b505116ee4: This /work/armv5te-oe-linux-gnueabi/qtgamepad/5.10.0+gitAUTOINC+b505116ee4-r0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
qtgamepad-5.10.0+gitAUTOINC+b505116ee4: This /work/core2-64-oe-linux/qtgamepad/5.10.0+gitAUTOINC+b505116ee4-r0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
qtgamepad-5.10.0+gitAUTOINC+b505116ee4: This /work/i586-oe-linux-musl/qtgamepad/5.10.0+gitAUTOINC+b505116ee4-r0/pseudo/pseudo.log indicates 11 errors [qa_pseudo]
qtlocation-5.10.0+gitAUTOINC+919bbf503d_572822c8ca: This /work/aarch64-oe-linux/qtlocation/5.10.0+gitAUTOINC+919bbf503d_572822c8ca-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
qtlocation-5.10.0+gitAUTOINC+919bbf503d_572822c8ca: This /work/armv5te-oe-linux-gnueabi/qtlocation/5.10.0+gitAUTOINC+919bbf503d_572822c8ca-r0/pseudo/pseudo.log indicates 17 errors [qa_pseudo]
qtlocation-5.10.0+gitAUTOINC+919bbf503d_572822c8ca: This /work/core2-64-oe-linux/qtlocation/5.10.0+gitAUTOINC+919bbf503d_572822c8ca-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
qtlocation-5.10.0+gitAUTOINC+919bbf503d_572822c8ca: This /work/i586-oe-linux-musl/qtlocation/5.10.0+gitAUTOINC+919bbf503d_572822c8ca-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
qtmqtt-5.10.0+gitAUTOINC+45d87f0d92: This /work/aarch64-oe-linux/qtmqtt/5.10.0+gitAUTOINC+45d87f0d92-r0/pseudo/pseudo.log indicates 5 errors [qa_pseudo]
qtmqtt-5.10.0+gitAUTOINC+45d87f0d92: This /work/armv5te-oe-linux-gnueabi/qtmqtt/5.10.0+gitAUTOINC+45d87f0d92-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
qtmqtt-5.10.0+gitAUTOINC+45d87f0d92: This /work/core2-64-oe-linux/qtmqtt/5.10.0+gitAUTOINC+45d87f0d92-r0/pseudo/pseudo.log indicates 7 errors [qa_pseudo]
qtmqtt-5.10.0+gitAUTOINC+45d87f0d92: This /work/i586-oe-linux-musl/qtmqtt/5.10.0+gitAUTOINC+45d87f0d92-r0/pseudo/pseudo.log indicates 5 errors [qa_pseudo]
qtmultimedia-5.10.0+gitAUTOINC+3598915a36: This /work/aarch64-oe-linux/qtmultimedia/5.10.0+gitAUTOINC+3598915a36-r0/pseudo/pseudo.log indicates 11 errors [qa_pseudo]
qtmultimedia-5.10.0+gitAUTOINC+3598915a36: This /work/armv5te-oe-linux-gnueabi/qtmultimedia/5.10.0+gitAUTOINC+3598915a36-r0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
qtmultimedia-5.10.0+gitAUTOINC+3598915a36: This /work/core2-64-oe-linux/qtmultimedia/5.10.0+gitAUTOINC+3598915a36-r0/pseudo/pseudo.log indicates 14 errors [qa_pseudo]
qtmultimedia-5.10.0+gitAUTOINC+3598915a36: This /work/i586-oe-linux-musl/qtmultimedia/5.10.0+gitAUTOINC+3598915a36-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
qtnetworkauth-5.10.0+gitAUTOINC+febebfb6f0: This /work/aarch64-oe-linux/qtnetworkauth/5.10.0+gitAUTOINC+febebfb6f0-r0/pseudo/pseudo.log indicates 11 errors [qa_pseudo]
qtnetworkauth-5.10.0+gitAUTOINC+febebfb6f0: This /work/armv5te-oe-linux-gnueabi/qtnetworkauth/5.10.0+gitAUTOINC+febebfb6f0-r0/pseudo/pseudo.log indicates 7 errors [qa_pseudo]
qtnetworkauth-5.10.0+gitAUTOINC+febebfb6f0: This /work/core2-64-oe-linux/qtnetworkauth/5.10.0+gitAUTOINC+febebfb6f0-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
qtnetworkauth-5.10.0+gitAUTOINC+febebfb6f0: This /work/i586-oe-linux-musl/qtnetworkauth/5.10.0+gitAUTOINC+febebfb6f0-r0/pseudo/pseudo.log indicates 11 errors [qa_pseudo]
qtquick1-5.10.0+gitAUTOINC+b2476dcd53: This /work/aarch64-oe-linux/qtquick1/5.10.0+gitAUTOINC+b2476dcd53-r0/pseudo/pseudo.log indicates 24 errors [qa_pseudo]
qtquick1-5.10.0+gitAUTOINC+b2476dcd53: This /work/armv5te-oe-linux-gnueabi/qtquick1/5.10.0+gitAUTOINC+b2476dcd53-r0/pseudo/pseudo.log indicates 20 errors [qa_pseudo]
qtquick1-5.10.0+gitAUTOINC+b2476dcd53: This /work/core2-64-oe-linux/qtquick1/5.10.0+gitAUTOINC+b2476dcd53-r0/pseudo/pseudo.log indicates 20 errors [qa_pseudo]
qtquick1-5.10.0+gitAUTOINC+b2476dcd53: This /work/i586-oe-linux-musl/qtquick1/5.10.0+gitAUTOINC+b2476dcd53-r0/pseudo/pseudo.log indicates 17 errors [qa_pseudo]
qtquickcontrols2-5.10.0+gitAUTOINC+1265fef3b2: This /work/aarch64-oe-linux/qtquickcontrols2/5.10.0+gitAUTOINC+1265fef3b2-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
qtquickcontrols2-5.10.0+gitAUTOINC+1265fef3b2: This /work/armv5te-oe-linux-gnueabi/qtquickcontrols2/5.10.0+gitAUTOINC+1265fef3b2-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
qtquickcontrols2-5.10.0+gitAUTOINC+1265fef3b2: This /work/core2-64-oe-linux/qtquickcontrols2/5.10.0+gitAUTOINC+1265fef3b2-r0/pseudo/pseudo.log indicates 15 errors [qa_pseudo]
qtquickcontrols2-5.10.0+gitAUTOINC+1265fef3b2: This /work/i586-oe-linux-musl/qtquickcontrols2/5.10.0+gitAUTOINC+1265fef3b2-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
qtquickcontrols-5.10.0+gitAUTOINC+a749525164: This /work/aarch64-oe-linux/qtquickcontrols/5.10.0+gitAUTOINC+a749525164-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
qtquickcontrols-5.10.0+gitAUTOINC+a749525164: This /work/i586-oe-linux-musl/qtquickcontrols/5.10.0+gitAUTOINC+a749525164-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
qtremoteobjects-5.10.0+gitAUTOINC+e6eb6ab12d: This /work/aarch64-oe-linux/qtremoteobjects/5.10.0+gitAUTOINC+e6eb6ab12d-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
qtremoteobjects-5.10.0+gitAUTOINC+e6eb6ab12d: This /work/armv5te-oe-linux-gnueabi/qtremoteobjects/5.10.0+gitAUTOINC+e6eb6ab12d-r0/pseudo/pseudo.log indicates 24 errors [qa_pseudo]
qtremoteobjects-5.10.0+gitAUTOINC+e6eb6ab12d: This /work/core2-64-oe-linux/qtremoteobjects/5.10.0+gitAUTOINC+e6eb6ab12d-r0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
qtremoteobjects-5.10.0+gitAUTOINC+e6eb6ab12d: This /work/i586-oe-linux-musl/qtremoteobjects/5.10.0+gitAUTOINC+e6eb6ab12d-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
qtscript-5.10.0+gitAUTOINC+0bb3f3017f: This /work/aarch64-oe-linux/qtscript/5.10.0+gitAUTOINC+0bb3f3017f-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
qtscript-5.10.0+gitAUTOINC+0bb3f3017f: This /work/armv5e-oe-linux-gnueabi/qtscript/5.10.0+gitAUTOINC+0bb3f3017f-r0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
qtscript-5.10.0+gitAUTOINC+0bb3f3017f: This /work/core2-64-oe-linux/qtscript/5.10.0+gitAUTOINC+0bb3f3017f-r0/pseudo/pseudo.log indicates 14 errors [qa_pseudo]
qtscript-5.10.0+gitAUTOINC+0bb3f3017f: This /work/i586-oe-linux-musl/qtscript/5.10.0+gitAUTOINC+0bb3f3017f-r0/pseudo/pseudo.log indicates 11 errors [qa_pseudo]
qtscxml-5.10.0+gitAUTOINC+bbf3be4679: This /work/aarch64-oe-linux/qtscxml/5.10.0+gitAUTOINC+bbf3be4679-r0/pseudo/pseudo.log indicates 11 errors [qa_pseudo]
qtscxml-5.10.0+gitAUTOINC+bbf3be4679: This /work/armv5te-oe-linux-gnueabi/qtscxml/5.10.0+gitAUTOINC+bbf3be4679-r0/pseudo/pseudo.log indicates 11 errors [qa_pseudo]
qtscxml-5.10.0+gitAUTOINC+bbf3be4679: This /work/core2-64-oe-linux/qtscxml/5.10.0+gitAUTOINC+bbf3be4679-r0/pseudo/pseudo.log indicates 11 errors [qa_pseudo]
qtscxml-5.10.0+gitAUTOINC+bbf3be4679: This /work/i586-oe-linux-musl/qtscxml/5.10.0+gitAUTOINC+bbf3be4679-r0/pseudo/pseudo.log indicates 11 errors [qa_pseudo]
qtsensors-5.10.0+gitAUTOINC+7ae7dc3256: This /work/aarch64-oe-linux/qtsensors/5.10.0+gitAUTOINC+7ae7dc3256-r0/pseudo/pseudo.log indicates 11 errors [qa_pseudo]
qtsensors-5.10.0+gitAUTOINC+7ae7dc3256: This /work/core2-64-oe-linux/qtsensors/5.10.0+gitAUTOINC+7ae7dc3256-r0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
qtserialbus-5.10.0+gitAUTOINC+f25ddea7b1: This /work/aarch64-oe-linux/qtserialbus/5.10.0+gitAUTOINC+f25ddea7b1-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
qtserialbus-5.10.0+gitAUTOINC+f25ddea7b1: This /work/armv5te-oe-linux-gnueabi/qtserialbus/5.10.0+gitAUTOINC+f25ddea7b1-r0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
qtserialbus-5.10.0+gitAUTOINC+f25ddea7b1: This /work/core2-64-oe-linux/qtserialbus/5.10.0+gitAUTOINC+f25ddea7b1-r0/pseudo/pseudo.log indicates 14 errors [qa_pseudo]
qtserialbus-5.10.0+gitAUTOINC+f25ddea7b1: This /work/i586-oe-linux-musl/qtserialbus/5.10.0+gitAUTOINC+f25ddea7b1-r0/pseudo/pseudo.log indicates 11 errors [qa_pseudo]
qtserialport-5.10.0+gitAUTOINC+c7d99464c6: This /work/aarch64-oe-linux/qtserialport/5.10.0+gitAUTOINC+c7d99464c6-r0/pseudo/pseudo.log indicates 11 errors [qa_pseudo]
qtserialport-5.10.0+gitAUTOINC+c7d99464c6: This /work/armv5te-oe-linux-gnueabi/qtserialport/5.10.0+gitAUTOINC+c7d99464c6-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
qtserialport-5.10.0+gitAUTOINC+c7d99464c6: This /work/core2-64-oe-linux/qtserialport/5.10.0+gitAUTOINC+c7d99464c6-r0/pseudo/pseudo.log indicates 8 errors [qa_pseudo]
qtserialport-5.10.0+gitAUTOINC+c7d99464c6: This /work/i586-oe-linux-musl/qtserialport/5.10.0+gitAUTOINC+c7d99464c6-r0/pseudo/pseudo.log indicates 5 errors [qa_pseudo]
qtsvg-5.10.0+gitAUTOINC+984ba69772: This /work/aarch64-oe-linux/qtsvg/5.10.0+gitAUTOINC+984ba69772-r0/pseudo/pseudo.log indicates 11 errors [qa_pseudo]
qtsvg-5.10.0+gitAUTOINC+984ba69772: This /work/armv5te-oe-linux-gnueabi/qtsvg/5.10.0+gitAUTOINC+984ba69772-r0/pseudo/pseudo.log indicates 16 errors [qa_pseudo]
qtsvg-5.10.0+gitAUTOINC+984ba69772: This /work/core2-64-oe-linux/qtsvg/5.10.0+gitAUTOINC+984ba69772-r0/pseudo/pseudo.log indicates 14 errors [qa_pseudo]
qtsvg-5.10.0+gitAUTOINC+984ba69772: This /work/i586-oe-linux-musl/qtsvg/5.10.0+gitAUTOINC+984ba69772-r0/pseudo/pseudo.log indicates 11 errors [qa_pseudo]
qtsystems-5.10.0+gitAUTOINC+ca54870ffd: This /work/aarch64-oe-linux/qtsystems/5.10.0+gitAUTOINC+ca54870ffd-r0/pseudo/pseudo.log indicates 11 errors [qa_pseudo]
qtsystems-5.10.0+gitAUTOINC+ca54870ffd: This /work/armv5te-oe-linux-gnueabi/qtsystems/5.10.0+gitAUTOINC+ca54870ffd-r0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
qtsystems-5.10.0+gitAUTOINC+ca54870ffd: This /work/core2-64-oe-linux/qtsystems/5.10.0+gitAUTOINC+ca54870ffd-r0/pseudo/pseudo.log indicates 11 errors [qa_pseudo]
qtsystems-5.10.0+gitAUTOINC+ca54870ffd: This /work/i586-oe-linux-musl/qtsystems/5.10.0+gitAUTOINC+ca54870ffd-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
qttools-5.10.0+gitAUTOINC+3ce89dc37d: This /work/aarch64-oe-linux/qttools/5.10.0+gitAUTOINC+3ce89dc37d-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
qttools-5.10.0+gitAUTOINC+3ce89dc37d: This /work/armv5te-oe-linux-gnueabi/qttools/5.10.0+gitAUTOINC+3ce89dc37d-r0/pseudo/pseudo.log indicates 14 errors [qa_pseudo]
qttools-5.10.0+gitAUTOINC+3ce89dc37d: This /work/core2-64-oe-linux/qttools/5.10.0+gitAUTOINC+3ce89dc37d-r0/pseudo/pseudo.log indicates 15 errors [qa_pseudo]
qttools-5.10.0+gitAUTOINC+3ce89dc37d: This /work/i586-oe-linux-musl/qttools/5.10.0+gitAUTOINC+3ce89dc37d-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
qtwayland-5.10.0+gitAUTOINC+1a457a9dc9: This /work/aarch64-oe-linux/qtwayland/5.10.0+gitAUTOINC+1a457a9dc9-r0/pseudo/pseudo.log indicates 16 errors [qa_pseudo]
qtwayland-5.10.0+gitAUTOINC+1a457a9dc9: This /work/armv5te-oe-linux-gnueabi/qtwayland/5.10.0+gitAUTOINC+1a457a9dc9-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
qtwayland-5.10.0+gitAUTOINC+1a457a9dc9: This /work/core2-64-oe-linux/qtwayland/5.10.0+gitAUTOINC+1a457a9dc9-r0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
qtwayland-5.10.0+gitAUTOINC+1a457a9dc9: This /work/i586-oe-linux-musl/qtwayland/5.10.0+gitAUTOINC+1a457a9dc9-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
qtwebchannel-5.10.0+gitAUTOINC+acb01cb27b: This /work/aarch64-oe-linux/qtwebchannel/5.10.0+gitAUTOINC+acb01cb27b-r0/pseudo/pseudo.log indicates 11 errors [qa_pseudo]
qtwebchannel-5.10.0+gitAUTOINC+acb01cb27b: This /work/armv5te-oe-linux-gnueabi/qtwebchannel/5.10.0+gitAUTOINC+acb01cb27b-r0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
qtwebchannel-5.10.0+gitAUTOINC+acb01cb27b: This /work/i586-oe-linux-musl/qtwebchannel/5.10.0+gitAUTOINC+acb01cb27b-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
qtwebengine-5.10.0+gitAUTOINC+efa6d3f0d3_e36dcec23b: This /work/aarch64-oe-linux/qtwebengine/5.10.0+gitAUTOINC+efa6d3f0d3_e36dcec23b-r0/pseudo/pseudo.log indicates 35 errors [qa_pseudo]
qtwebengine-5.10.0+gitAUTOINC+efa6d3f0d3_e36dcec23b: This /work/core2-64-oe-linux/qtwebengine/5.10.0+gitAUTOINC+efa6d3f0d3_e36dcec23b-r0/pseudo/pseudo.log indicates 36 errors [qa_pseudo]
qtwebengine-5.10.0+gitAUTOINC+efa6d3f0d3_e36dcec23b: This /work/i586-oe-linux-musl/qtwebengine/5.10.0+gitAUTOINC+efa6d3f0d3_e36dcec23b-r0/pseudo/pseudo.log indicates 52 errors [qa_pseudo]
qtwebkit-5.10.0+gitAUTOINC+97c4a80a12: This /work/aarch64-oe-linux/qtwebkit/5.10.0+gitAUTOINC+97c4a80a12-r0/pseudo/pseudo.log indicates 11 errors [qa_pseudo]
qtwebkit-5.10.0+gitAUTOINC+97c4a80a12: This /work/armv5e-oe-linux-gnueabi/qtwebkit/5.10.0+gitAUTOINC+97c4a80a12-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
qtwebkit-5.10.0+gitAUTOINC+97c4a80a12: This /work/core2-64-oe-linux/qtwebkit/5.10.0+gitAUTOINC+97c4a80a12-r0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
qtwebkit-examples-5.10.0+gitAUTOINC+a24c780b60: This /work/aarch64-oe-linux/qtwebkit-examples/5.10.0+gitAUTOINC+a24c780b60-r0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
qtwebkit-examples-5.10.0+gitAUTOINC+a24c780b60: This /work/armv5te-oe-linux-gnueabi/qtwebkit-examples/5.10.0+gitAUTOINC+a24c780b60-r0/pseudo/pseudo.log indicates 14 errors [qa_pseudo]
qtwebkit-examples-5.10.0+gitAUTOINC+a24c780b60: This /work/core2-64-oe-linux/qtwebkit-examples/5.10.0+gitAUTOINC+a24c780b60-r0/pseudo/pseudo.log indicates 14 errors [qa_pseudo]
qtwebkit-examples-5.10.0+gitAUTOINC+a24c780b60: This /work/i586-oe-linux-musl/qtwebkit-examples/5.10.0+gitAUTOINC+a24c780b60-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
qtwebsockets-5.10.0+gitAUTOINC+0e4b43383d: This /work/aarch64-oe-linux/qtwebsockets/5.10.0+gitAUTOINC+0e4b43383d-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
qtwebsockets-5.10.0+gitAUTOINC+0e4b43383d: This /work/armv5te-oe-linux-gnueabi/qtwebsockets/5.10.0+gitAUTOINC+0e4b43383d-r0/pseudo/pseudo.log indicates 16 errors [qa_pseudo]
qtwebsockets-5.10.0+gitAUTOINC+0e4b43383d: This /work/core2-64-oe-linux/qtwebsockets/5.10.0+gitAUTOINC+0e4b43383d-r0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
qtwebsockets-5.10.0+gitAUTOINC+0e4b43383d: This /work/i586-oe-linux-musl/qtwebsockets/5.10.0+gitAUTOINC+0e4b43383d-r0/pseudo/pseudo.log indicates 11 errors [qa_pseudo]
qtwebview-5.10.0+gitAUTOINC+54ea23243c: This /work/aarch64-oe-linux/qtwebview/5.10.0+gitAUTOINC+54ea23243c-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
qtwebview-5.10.0+gitAUTOINC+54ea23243c: This /work/core2-64-oe-linux/qtwebview/5.10.0+gitAUTOINC+54ea23243c-r0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
qtwebview-5.10.0+gitAUTOINC+54ea23243c: This /work/i586-oe-linux-musl/qtwebview/5.10.0+gitAUTOINC+54ea23243c-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
qtx11extras-5.10.0+gitAUTOINC+33e3fcc1fb: This /work/aarch64-oe-linux/qtx11extras/5.10.0+gitAUTOINC+33e3fcc1fb-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
qtx11extras-5.10.0+gitAUTOINC+33e3fcc1fb: This /work/armv5te-oe-linux-gnueabi/qtx11extras/5.10.0+gitAUTOINC+33e3fcc1fb-r0/pseudo/pseudo.log indicates 14 errors [qa_pseudo]
qtx11extras-5.10.0+gitAUTOINC+33e3fcc1fb: This /work/core2-64-oe-linux/qtx11extras/5.10.0+gitAUTOINC+33e3fcc1fb-r0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
qtx11extras-5.10.0+gitAUTOINC+33e3fcc1fb: This /work/i586-oe-linux-musl/qtx11extras/5.10.0+gitAUTOINC+33e3fcc1fb-r0/pseudo/pseudo.log indicates 11 errors [qa_pseudo]
qtxmlpatterns-5.10.0+gitAUTOINC+8b831bdb51: This /work/aarch64-oe-linux/qtxmlpatterns/5.10.0+gitAUTOINC+8b831bdb51-r0/pseudo/pseudo.log indicates 18 errors [qa_pseudo]
qtxmlpatterns-5.10.0+gitAUTOINC+8b831bdb51: This /work/armv5te-oe-linux-gnueabi/qtxmlpatterns/5.10.0+gitAUTOINC+8b831bdb51-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
qtxmlpatterns-5.10.0+gitAUTOINC+8b831bdb51: This /work/core2-64-oe-linux/qtxmlpatterns/5.10.0+gitAUTOINC+8b831bdb51-r0/pseudo/pseudo.log indicates 18 errors [qa_pseudo]
qtxmlpatterns-5.10.0+gitAUTOINC+8b831bdb51: This /work/i586-oe-linux-musl/qtxmlpatterns/5.10.0+gitAUTOINC+8b831bdb51-r0/pseudo/pseudo.log indicates 16 errors [qa_pseudo]
quagga-1.2.2: This /work/aarch64-oe-linux/quagga/1.2.2-r0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
quagga-1.2.2: This /work/armv5te-oe-linux-gnueabi/quagga/1.2.2-r0/pseudo/pseudo.log indicates 15 errors [qa_pseudo]
quagga-1.2.2: This /work/core2-64-oe-linux/quagga/1.2.2-r0/pseudo/pseudo.log indicates 15 errors [qa_pseudo]
qwt-qt5-6.1.3: This /work/aarch64-oe-linux/qwt-qt5/6.1.3-r0/pseudo/pseudo.log indicates 11 errors [qa_pseudo]
radvd-2.17: This /work/aarch64-oe-linux/radvd/2.17-r0/pseudo/pseudo.log indicates 5 errors [qa_pseudo]
radvd-2.17: This /work/armv5te-oe-linux-gnueabi/radvd/2.17-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
radvd-2.17: This /work/core2-64-oe-linux/radvd/2.17-r0/pseudo/pseudo.log indicates 5 errors [qa_pseudo]
radvd-2.17: This /work/i586-oe-linux-musl/radvd/2.17-r0/pseudo/pseudo.log indicates 5 errors [qa_pseudo]
rdist-6.1.5: This /work/core2-64-oe-linux/rdist/6.1.5-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
readline-7.0: This /work/core2-64-oe-linux/readline/7.0-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
rsyslog-8.29.0: This /work/aarch64-oe-linux/rsyslog/8.29.0-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
samba-4.7.0: This /work/armv5te-oe-linux-gnueabi/samba/4.7.0-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
samba-4.7.0: This /work/core2-64-oe-linux/samba/4.7.0-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
screen-4.6.1: This /work/core2-64-oe-linux/screen/4.6.1-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
sed-4.2.2: This /work/aarch64-oe-linux/sed/4.2.2-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
sed-4.2.2: This /work/armv5te-oe-linux-gnueabi/sed/4.2.2-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
sed-4.2.2: This /work/core2-64-oe-linux/sed/4.2.2-r0/pseudo/pseudo.log indicates 11 errors [qa_pseudo]
sed-4.2.2: This /work/i586-oe-linux-musl/sed/4.2.2-r0/pseudo/pseudo.log indicates 11 errors [qa_pseudo]
serial-forward-1.1+gitrAUTOINC+07c6fdede0: This /work/i586-oe-linux-musl/serial-forward/1.1+gitrAUTOINC+07c6fdede0-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
shadow-4.2.1: This /work/i586-oe-linux-musl/shadow/4.2.1-r0/pseudo/pseudo.log indicates 5 errors [qa_pseudo]
smem-1.4: This /work/core2-64-oe-linux/smem/1.4-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
squid-3.5.26: This /work/armv5te-oe-linux-gnueabi/squid/3.5.26-r0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
sthttpd-2.27.1: This /work/aarch64-oe-linux/sthttpd/2.27.1-r0/pseudo/pseudo.log indicates 5 errors [qa_pseudo]
sthttpd-2.27.1: This /work/armv5te-oe-linux-gnueabi/sthttpd/2.27.1-r0/pseudo/pseudo.log indicates 7 errors [qa_pseudo]
sthttpd-2.27.1: This /work/core2-64-oe-linux/sthttpd/2.27.1-r0/pseudo/pseudo.log indicates 8 errors [qa_pseudo]
strace-4.19: This /work/aarch64-oe-linux/strace/4.19-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
strace-4.19: This /work/armv5te-oe-linux-gnueabi/strace/4.19-r0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
strace-4.19: This /work/core2-64-oe-linux/strace/4.19-r0/pseudo/pseudo.log indicates 11 errors [qa_pseudo]
strace-4.19: This /work/i586-oe-linux-musl/strace/4.19-r0/pseudo/pseudo.log indicates 18 errors [qa_pseudo]
strongswan-5.5.3: This /work/aarch64-oe-linux/strongswan/5.5.3-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
syslog-ng-3.8.1: This /work/armv5te-oe-linux-gnueabi/syslog-ng/3.8.1-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
systemd-234: This /work/aarch64-oe-linux/systemd/1_234-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
sysvinit-inittab-2.88dsf: This /work/qemuarm64-oe-linux/sysvinit-inittab/2.88dsf-r10/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
tcl-8.6.7: This /work/armv5te-oe-linux-gnueabi/tcl/8.6.7-r0/pseudo/pseudo.log indicates 8 errors [qa_pseudo]
tcl-8.6.7: This /work/i586-oe-linux-musl/tcl/8.6.7-r0/pseudo/pseudo.log indicates 5 errors [qa_pseudo]
tftp-hpa-5.2: This /work/aarch64-oe-linux/tftp-hpa/5.2-r0/pseudo/pseudo.log indicates 5 errors [qa_pseudo]
tftp-hpa-5.2: This /work/armv5te-oe-linux-gnueabi/tftp-hpa/5.2-r0/pseudo/pseudo.log indicates 7 errors [qa_pseudo]
tftp-hpa-5.2: This /work/core2-64-oe-linux/tftp-hpa/5.2-r0/pseudo/pseudo.log indicates 7 errors [qa_pseudo]
tftp-hpa-5.2: This /work/i586-oe-linux-musl/tftp-hpa/5.2-r0/pseudo/pseudo.log indicates 5 errors [qa_pseudo]
tomoyo-tools-2.5.0: This /work/armv5te-oe-linux-gnueabi/tomoyo-tools/2.5.0-r0/pseudo/pseudo.log indicates 11 errors [qa_pseudo]
trace-cmd-2.6.2: This /work/aarch64-oe-linux/trace-cmd/2.6.2-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
ttf-sazanami-20040629: This /work/all-oe-linux/ttf-sazanami/20040629-r9/pseudo/pseudo.log indicates 14 errors [qa_pseudo]
ubi-utils-klibc-1.5.2: This /work/armv5te-oe-linux-gnueabi/ubi-utils-klibc/1.5.2-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
udisks-1.0.5: This /work/core2-64-oe-linux/udisks/1.0.5-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
unifdef-2.11: This /work/core2-64-oe-linux/unifdef/2.11-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
usrsctp-git: This /work/aarch64-oe-linux/usrsctp/git-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
uthash-2.0.2: This /work/core2-64-oe-linux/uthash/2.0.2-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
util-linux-2.31: This /work/aarch64-oe-linux/util-linux/2.31-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
util-linux-2.31: This /work/armv5te-oe-linux-gnueabi/util-linux/2.31-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
vblade-22: This /work/core2-64-oe-linux/vblade/22-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
vpnc-0.5.3r550-2jnpr1: This /work/aarch64-oe-linux/vpnc/0.5.3r550-2jnpr1-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
vpnc-0.5.3r550-2jnpr1: This /work/core2-64-oe-linux/vpnc/0.5.3r550-2jnpr1-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
wavpack-4.60.1: This /work/i586-oe-linux-musl/wavpack/4.60.1-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
wireshark-2.2.11: This /work/i586-oe-linux-musl/wireshark/1_2.2.11-r0/pseudo/pseudo.log indicates 16 errors [qa_pseudo]
xcb-util-keysyms-0.4.0: This /work/aarch64-oe-linux/xcb-util-keysyms/0.4.0-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
xcb-util-renderutil-0.3.9: This /work/armv5te-oe-linux-gnueabi/xcb-util-renderutil/0.3.9-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
xdg-user-dirs-0.15: This /work/armv5te-oe-linux-gnueabi/xdg-user-dirs/0.15-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
xdpyinfo-1.3.2: This /work/armv5te-oe-linux-gnueabi/xdpyinfo/1_1.3.2-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
xfce4-systemload-plugin-1.2.1: This /work/i586-oe-linux-musl/xfce4-systemload-plugin/1.2.1-r0/pseudo/pseudo.log indicates 16 errors [qa_pseudo]
xfce4-verve-plugin-1.1.0: This /work/core2-64-oe-linux/xfce4-verve-plugin/1.1.0-r0/pseudo/pseudo.log indicates 18 errors [qa_pseudo]
xfsprogs-4.12.0: This /work/i586-oe-linux-musl/xfsprogs/4.12.0-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
xkbevd-1.1.4: This /work/core2-64-oe-linux/xkbevd/1.1.4-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
xl2tpd-1.3.9+gitAUTOINC+f114c10ac5: This /work/qemuarm-oe-linux-gnueabi/xl2tpd/1.3.9+gitAUTOINC+f114c10ac5-r0/pseudo/pseudo.log indicates 7 errors [qa_pseudo]
xl2tpd-1.3.9+gitAUTOINC+f114c10ac5: This /work/qemux86_64-oe-linux/xl2tpd/1.3.9+gitAUTOINC+f114c10ac5-r0/pseudo/pseudo.log indicates 7 errors [qa_pseudo]
xz-5.2.3: This /work/aarch64-oe-linux/xz/5.2.3-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]



This git log matches with the metadata as seen by qemuarm build.
In some cases qemux86 and qemux86-64 builds are built with slightly
different metadata, you can see the exact version near the top of each
log.world.qemu* files linked from the report

== Tested changes (not included in master yet) - bitbake ==
latest upstream commit: 
a783bd7 bitbake-user-manual: Removed stray parenthesis
not included in master yet: 
7f8b0af world-image: add extra target
d027c93 fetch2: Allow Fetch.download() to warn instead of error

== Tested changes (not included in master yet) - openembedded-core ==
latest upstream commit: 
77144bc multilib.bbclass: deltask populate_sdk and populate_sdk_ext
not included in master yet: 
6ad395c kernel-devicetree.bbclass: Use lowercase names for shell variables
e538c46 kernel-devicetree.bbclass: Fix and simplify instalation of DTB files
352c899 kernel.bbclass: use the consistent naming schema for initramfs
da7c829 kernel.bbclass: move variables for kernel artifacts names to separate bbclass
afaf512 report-error: Allow to upload reports automatically
8762109 buildhistory.bbclass: metadata-revs show repo parent
fd33511 metadata-revs: provide more information
7a2421a qemux86: Add identical qemux86copy variant for tests
f0ac7db reproducible_build.bbclass: initial support for binary reproducibility
06678cd cpio: provide cpio-replacement-native
843c01c image_types.bbclass: improve cpio image reproducibility
cc083d0 rootfs-postcommands.bbclass: support binary reproducibility
410e932 sstate.bbclass: Do not cause build failures due to setscene errors
dcaecbb insane.bbclass: Add do_qa_pseudo function to check for common errors listed in pseudo.log
555eef0 insane.bbclass: use package_qa_handle_error for do_qa_pseudo
33d9835 Revert "libepoxy: convert to meson build"
3797122 Revert "json-glib: update to 1.4.2"

== Tested changes (not included in master yet) - meta-openembedded ==
latest upstream commit: 
8cef6b3 meson: remove recipe and class
not included in master yet: 
0ff940f iscsi-initiator-utils: CVE-2017-17840
57091c7 drbd-utils: update SRC_URI
ce3ef41 wireguard: udpate to 20171221 version
1fed475 postfix: fix generating aliases db files
4e2b153 strongswan: add ${PN}-plugin-curve25519 to RDEPENDS
9560fca nautilus: new add
4f9081e uthash: update to v2.0.2
ee3c551 uthash: add ptest support
94d3ccb mosquitto: use uthash from meta-oe
12315c0 mosquitto: simplify build patch
260aea7 ebtables: Remove bashisms
4ca355b python-cffi: update to version 1.11.4
efdffda python-pymisp: update to version 2.4.85.1
d01024c python-decorator: update to version 4.2.1
1e82d05 cim-schema-exper: 2.39.0 -> 2.50.0
82a44f6 dovecot: 2.2.29 -> 2.2.33
8114e85 crash: 7.1.9 -> 7.2.0
f654d8a quagga: 1.2.1 -> 1.2.2
a5ffdb4 engine-pkcs11: replace startline=1 with beginline=1 in LIC_FILES_CHKSUM
f8ba1b6 ntimed: use beginline= in LIC_FILES_CHKSUM
e611d3e python-flask-pymongo: replace startline=1 with beginline=1 in LIC_FILES_CHKSUM
dfaf537 python-smbus: replace startline=1 with beginline=1 in LIC_FILES_CHKSUM
b05eba0 python-webencodings: use beginline= in LIC_FILES_CHKSUM
7ae93cf python-parse: use beginline= in LIC_FILES_CHKSUM
2500dfd python-ujson: use beginline= in LIC_FILES_CHKSUM
a24deef python-lxml: use beginline= in LIC_FILES_CHKSUM
2d4dcdb python-pyparted: use beginline= in LIC_FILES_CHKSUM
e668b16 python-tornado: use beginline= in LIC_FILES_CHKSUM
2eb1bcc python-javaobj-py3: add initial recipe for version 0.2.3
451a350 python-pyasn1-modules: add initial recipe for version 0.2.1
108c11e python-pycryptodome: add initial recipe for version 3.4.7
466c185 python-twofish: add initial recipe for version 0.3.0
ef0d1fe python-pyjwt: add initial recipe for version 1.5.3
cc9b5c6 python-pyjks: add initial recipe for version 17.1.1
0ef5349 nghttp2: Move to meta-networking
116423c haveged: Add sysvinit support
7d47e22 ndisc6: need to set USE_NLS="yes" to use gettext.h
cafb49e luajit: create developer symlinks
c49cf4d poco: update to 1.8.1
20d6ae8 ipcalc: add initial recipe for version 0.2.0
533d44a xfce4-panel: update 4.12.1 -> 4.12.2
c13a10c xfce4-power-manager: update 1.6.0 -> 1.6.1
0b98b2a xfce4-pulseaudio-plugin: update 0.3.3 -> 0.3.4
2110819 evolution-data-server: update 3.2.3 -> 3.26.3
4e02547 pimlico/dates: remove recipe
2cc96d4 remove gdm leftovers
9a44dec remove gnome system-tools leftovers
45098c9 remove libgnomecups leftovers
c6de269 remove gnome tracker leftovers
193485f jack: Update 1.9.12
74b0b78 fluidsynth: update 1.1.8 -> 1.1.9
dc868a5 gtksourceview3: initial add 3.24.6
86ebbb1 gtksourceview-classic-light: initial add 1.0
c58d03a xfce-polkit: fix Name/Comment fields in desktop file

== Tested changes (not included in master yet) - meta-qt5 ==
latest upstream commit: 
3f2f3a0 qtbase: fix pcre PACKAGECONFIG
not included in master yet: 

== Tested changes (not included in master yet) - meta-browser ==
latest upstream commit: 
8cc24ca Merge pull request #86 from rakuco/oz-wl-command-line-args
not included in master yet: 


