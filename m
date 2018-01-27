Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f176.google.com (mail-pf0-f176.google.com
	[209.85.192.176])
	by mail.openembedded.org (Postfix) with ESMTP id 322357867E
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Jan 2018 01:17:15 +0000 (UTC)
Received: by mail-pf0-f176.google.com with SMTP id c6so1368153pfi.8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Jan 2018 17:17:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=to:from:subject:message-id:date:user-agent:mime-version
	:content-language;
	bh=tg6+HbpmDTWAR31V3SX0vAIvpIW6V1Ad/+2nKVYMM6s=;
	b=mutjDaT966Az4SPErZ2NGXMEpyv8RaH3HqMnKMCTzKOZcLsXOy5H0Ok14+j4lbjjdC
	o8PqVm41bB9CbAwfB4zbaCe3jjLW2rgthAg3fEvO955fACndpD0JypU66wIjMxgz7i89
	re92k7pZR2yIkMBzXKwP2AfAbgSTyuMZHJIxZL9SDwL8zBuwb7AUI5tSSgUSN7TQwZNd
	Rz0afK7kzVGFrhm+BC5vF1cIpC7rPO4BCrzc3VytvcAryhUFS62EkiMd/Ln/AZIeBRqL
	zvQ8IRE2zoDMNbMik831/74WLa1SueF9Kawf1VlJRArbQZYHOecb/n0XQdaLthbvU1yO
	uo0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:to:from:subject:message-id:date:user-agent
	:mime-version:content-language;
	bh=tg6+HbpmDTWAR31V3SX0vAIvpIW6V1Ad/+2nKVYMM6s=;
	b=KNK1ogdgebsJfTFL+PlmxWKU4LpkkdDPbUpcwRrnyHAsyGeRVcBSsl/KWNFIWOt+i7
	LW/BIlNK/D5mi0ilduC/8o6ki1BxrYX7IBE6ZzfFvl6rsb5LwA1deKbGzgbBUZZyD/0D
	E2zL7qLo6/5cMkhft0mTdYF5SGDwoQ+B7mNPhoAVrQomJgVYtiCWRsHI0AEumQUZcal7
	nC6hY2vXM20WM8aJW45xJyP1HVJzcsm5ZnfNpa74e5TDUqVdl6qHV9f/lpNZqoNA/k15
	7ts8esAGEv+oTKiKuMcETxB5uvSHAZ7CPJmgKbKjIzsGkGZwfw6S0UXFl4AWEtDAWKCS
	HLJA==
X-Gm-Message-State: AKwxytdaPYDir0gF8XHrcaVp1aOVuZiX5DbMZqj8j2KiU8h2l0kCM7OH
	Tu4VPscMg/vm980kXjaYdkknRQ==
X-Google-Smtp-Source: AH8x224HQ+T2ucG4fyTn9woOPM3Auz/IBmMVqAtChtg9i7r0UzKeA/sPYmNx++CFIqIxb6nfTuEzpA==
X-Received: by 10.98.178.133 with SMTP id z5mr20589166pfl.88.1517015835399;
	Fri, 26 Jan 2018 17:17:15 -0800 (PST)
Received: from ?IPv6:2601:202:4000:1184:2999:2a82:b9b6:e74c?
	([2601:202:4000:1184:2999:2a82:b9b6:e74c])
	by smtp.gmail.com with ESMTPSA id
	j23sm20720117pfj.42.2018.01.26.17.17.13
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 26 Jan 2018 17:17:14 -0800 (PST)
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
From: akuster808 <akuster808@gmail.com>
Message-ID: <c92b517b-65a7-ee2f-f9cf-4164151610a5@gmail.com>
Date: Fri, 26 Jan 2018 17:17:13 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.0
MIME-Version: 1.0
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: State of the World, Failed tasks 2018-01-24
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
X-List-Received-Date: Sat, 27 Jan 2018 01:17:16 -0000
Content-Language: en-US
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit


== Failed tasks 2018-01-24 ==

INFO: jenkins-job.sh-1.8.43 Complete log available at http://logs.nslu2-linux.org/buildlogs/oe/world/sumo/log.report.20180126_145808.log

=== common (2) ===
    * meta-openembedded/meta-networking/recipes-kernel/wireguard/wireguard-module_0.0.20171221.bb:do_compile
    * virtual:native:meta-openembedded/meta-oe/recipes-connectivity/obexftp/obexftp_0.24.2.bb:do_compile

=== common-x86 (1) ===
    * meta-openembedded/meta-oe/recipes-extended/sysdig/sysdig_git.bb:do_compile

=== qemuarm (4) ===
    * meta-openembedded/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb:do_compile
    * meta-openembedded/meta-oe/recipes-graphics/libyui/libyui-ncurses_git.bb:do_packagedata
    * openembedded-core/meta/recipes-core/glibc/glibc-locale_2.26.bb:do_package_qa
    * openembedded-core/meta/recipes-sato/webkit/webkitgtk_2.18.5.bb:do_compile

=== qemuarm64 (5) ===
    * meta-openembedded/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_1.5.2.bb:do_install
    * meta-openembedded/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_2.0.2.bb:do_configure
    * meta-openembedded/meta-oe/recipes-devtools/luajit/luajit_2.0.5.bb:do_compile
    * openembedded-core/meta/recipes-kernel/kexec/kexec-tools_2.0.16.bb:do_compile
    * openembedded-core/meta/recipes-sato/webkit/webkitgtk_2.18.5.bb:do_configure

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
    * meta-openembedded/meta-oe/recipes-graphics/libyui/libyui-ncurses_git.bb:do_compile
    * meta-openembedded/meta-oe/recipes-kernel/crash/crash_7.2.0.bb:do_compile
    * meta-openembedded/meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.0.bb:do_compile
    * meta-openembedded/meta-oe/recipes-multimedia/alsa/alsa-oss_1.0.17.bb:do_compile
    * meta-qt5/recipes-connectivity/libqofono/libqofono_git.bb:do_compile
    * openembedded-core/meta/recipes-devtools/systemd-bootchart/systemd-bootchart_231.bb:do_compile
    * openembedded-core/meta/recipes-graphics/cogl/cogl-1.0_1.22.2.bb:do_compile
    * openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.12.4.bb:do_compile
    * openembedded-core/meta/recipes-multimedia/x264/x264_git.bb:do_package_qa

=== qemux86_64 (1) ===
    * meta-browser/recipes-browser/chromium/chromium-ozone-wayland_64.0.3274.0.r517731.igalia.1.bb:do_configure

=== Number of failed tasks (51) ===
{| class=wikitable
|-
|| qemuarm 	|| 7	 || http://logs.nslu2-linux.org/buildlogs/oe/world/sumo/log.world.qemuarm.20180123_053638.log/ || http://errors.yoctoproject.org/Errors/Build/52081/
|-
|| qemuarm64 	|| 9	 || http://logs.nslu2-linux.org/buildlogs/oe/world/sumo/log.world.qemuarm64.20180124_075348.log/ || http://errors.yoctoproject.org/Errors/Build/52156/
|-
|| qemux86 	|| 30	 || http://logs.nslu2-linux.org/buildlogs/oe/world/sumo/log.world.qemux86.20180123_053649.log/ || http://errors.yoctoproject.org/Errors/Build/52078/
|-
|| qemux86_64 	|| 5	 || http://logs.nslu2-linux.org/buildlogs/oe/world/sumo/log.world.qemux86-64.20180124_073022.log/ || http://errors.yoctoproject.org/Errors/Build/52155/
|}

=== PNBLACKLISTs (0) ===

=== QA issues (649) ===
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
||116	||version-going-backwards
|-
||1	||installed-vs-shipped
|-
||2	||textrel
|-
||3	||host-user-contaminated
|-
||527	||qa_pseudo
|}



=== Incorrect PACKAGE_ARCH or sstate signatures (0) ===

Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/sumo/log.signatures.20180125_152105.log/


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


count: 116	issue: version-going-backwards
json-glib-1.2.8: Package version for package json-glib-bin went backwards which would break package feeds from (0:1.4.2-r0.0 to 0:1.2.8-r0.25) [version-going-backwards]
json-glib-1.2.8: Package version for package json-glib-bin went backwards which would break package feeds from (0:1.4.2-r0.0 to 0:1.2.8-r0.6) [version-going-backwards]
json-glib-1.2.8: Package version for package json-glib-dbg went backwards which would break package feeds from (0:1.4.2-r0.0 to 0:1.2.8-r0.25) [version-going-backwards]
json-glib-1.2.8: Package version for package json-glib-dbg went backwards which would break package feeds from (0:1.4.2-r0.0 to 0:1.2.8-r0.6) [version-going-backwards]
json-glib-1.2.8: Package version for package json-glib-dev went backwards which would break package feeds from (0:1.4.2-r0.0 to 0:1.2.8-r0.25) [version-going-backwards]
json-glib-1.2.8: Package version for package json-glib-dev went backwards which would break package feeds from (0:1.4.2-r0.0 to 0:1.2.8-r0.6) [version-going-backwards]
json-glib-1.2.8: Package version for package json-glib-doc went backwards which would break package feeds from (0:1.4.2-r0.0 to 0:1.2.8-r0.25) [version-going-backwards]
json-glib-1.2.8: Package version for package json-glib-doc went backwards which would break package feeds from (0:1.4.2-r0.0 to 0:1.2.8-r0.6) [version-going-backwards]
json-glib-1.2.8: Package version for package json-glib-locale-as went backwards which would break package feeds from (0:1.4.2-r0.0 to 0:1.2.8-r0.25) [version-going-backwards]
json-glib-1.2.8: Package version for package json-glib-locale-as went backwards which would break package feeds from (0:1.4.2-r0.0 to 0:1.2.8-r0.6) [version-going-backwards]
json-glib-1.2.8: Package version for package json-glib-locale-bg went backwards which would break package feeds from (0:1.4.2-r0.0 to 0:1.2.8-r0.25) [version-going-backwards]
json-glib-1.2.8: Package version for package json-glib-locale-bg went backwards which would break package feeds from (0:1.4.2-r0.0 to 0:1.2.8-r0.6) [version-going-backwards]
json-glib-1.2.8: Package version for package json-glib-locale-bn-in went backwards which would break package feeds from (0:1.4.2-r0.0 to 0:1.2.8-r0.25) [version-going-backwards]
json-glib-1.2.8: Package version for package json-glib-locale-bn-in went backwards which would break package feeds from (0:1.4.2-r0.0 to 0:1.2.8-r0.6) [version-going-backwards]
json-glib-1.2.8: Package version for package json-glib-locale-bs went backwards which would break package feeds from (0:1.4.2-r0.0 to 0:1.2.8-r0.25) [version-going-backwards]
json-glib-1.2.8: Package version for package json-glib-locale-bs went backwards which would break package feeds from (0:1.4.2-r0.0 to 0:1.2.8-r0.6) [version-going-backwards]
json-glib-1.2.8: Package version for package json-glib-locale-ca+valencia went backwards which would break package feeds from (0:1.4.2-r0.0 to 0:1.2.8-r0.25) [version-going-backwards]
json-glib-1.2.8: Package version for package json-glib-locale-ca+valencia went backwards which would break package feeds from (0:1.4.2-r0.0 to 0:1.2.8-r0.6) [version-going-backwards]
json-glib-1.2.8: Package version for package json-glib-locale-ca went backwards which would break package feeds from (0:1.4.2-r0.0 to 0:1.2.8-r0.25) [version-going-backwards]
json-glib-1.2.8: Package version for package json-glib-locale-ca went backwards which would break package feeds from (0:1.4.2-r0.0 to 0:1.2.8-r0.6) [version-going-backwards]
json-glib-1.2.8: Package version for package json-glib-locale-cs went backwards which would break package feeds from (0:1.4.2-r0.0 to 0:1.2.8-r0.25) [version-going-backwards]
json-glib-1.2.8: Package version for package json-glib-locale-cs went backwards which would break package feeds from (0:1.4.2-r0.0 to 0:1.2.8-r0.6) [version-going-backwards]
json-glib-1.2.8: Package version for package json-glib-locale-da went backwards which would break package feeds from (0:1.4.2-r0.0 to 0:1.2.8-r0.25) [version-going-backwards]
json-glib-1.2.8: Package version for package json-glib-locale-da went backwards which would break package feeds from (0:1.4.2-r0.0 to 0:1.2.8-r0.6) [version-going-backwards]
json-glib-1.2.8: Package version for package json-glib-locale-de went backwards which would break package feeds from (0:1.4.2-r0.0 to 0:1.2.8-r0.25) [version-going-backwards]
json-glib-1.2.8: Package version for package json-glib-locale-de went backwards which would break package feeds from (0:1.4.2-r0.0 to 0:1.2.8-r0.6) [version-going-backwards]
json-glib-1.2.8: Package version for package json-glib-locale-el went backwards which would break package feeds from (0:1.4.2-r0.0 to 0:1.2.8-r0.25) [version-going-backwards]
json-glib-1.2.8: Package version for package json-glib-locale-el went backwards which would break package feeds from (0:1.4.2-r0.0 to 0:1.2.8-r0.6) [version-going-backwards]
json-glib-1.2.8: Package version for package json-glib-locale-en-gb went backwards which would break package feeds from (0:1.4.2-r0.0 to 0:1.2.8-r0.25) [version-going-backwards]
json-glib-1.2.8: Package version for package json-glib-locale-en-gb went backwards which would break package feeds from (0:1.4.2-r0.0 to 0:1.2.8-r0.6) [version-going-backwards]
json-glib-1.2.8: Package version for package json-glib-locale-eo went backwards which would break package feeds from (0:1.4.2-r0.0 to 0:1.2.8-r0.25) [version-going-backwards]
json-glib-1.2.8: Package version for package json-glib-locale-eo went backwards which would break package feeds from (0:1.4.2-r0.0 to 0:1.2.8-r0.6) [version-going-backwards]
json-glib-1.2.8: Package version for package json-glib-locale-es went backwards which would break package feeds from (0:1.4.2-r0.0 to 0:1.2.8-r0.25) [version-going-backwards]
json-glib-1.2.8: Package version for package json-glib-locale-es went backwards which would break package feeds from (0:1.4.2-r0.0 to 0:1.2.8-r0.6) [version-going-backwards]
json-glib-1.2.8: Package version for package json-glib-locale-et went backwards which would break package feeds from (0:1.4.2-r0.0 to 0:1.2.8-r0.25) [version-going-backwards]
json-glib-1.2.8: Package version for package json-glib-locale-et went backwards which would break package feeds from (0:1.4.2-r0.0 to 0:1.2.8-r0.6) [version-going-backwards]
json-glib-1.2.8: Package version for package json-glib-locale-eu went backwards which would break package feeds from (0:1.4.2-r0.0 to 0:1.2.8-r0.25) [version-going-backwards]
json-glib-1.2.8: Package version for package json-glib-locale-eu went backwards which would break package feeds from (0:1.4.2-r0.0 to 0:1.2.8-r0.6) [version-going-backwards]
json-glib-1.2.8: Package version for package json-glib-locale-fr went backwards which would break package feeds from (0:1.4.2-r0.0 to 0:1.2.8-r0.25) [version-going-backwards]
json-glib-1.2.8: Package version for package json-glib-locale-fr went backwards which would break package feeds from (0:1.4.2-r0.0 to 0:1.2.8-r0.6) [version-going-backwards]
json-glib-1.2.8: Package version for package json-glib-locale-fur went backwards which would break package feeds from (0:1.4.2-r0.0 to 0:1.2.8-r0.25) [version-going-backwards]
json-glib-1.2.8: Package version for package json-glib-locale-fur went backwards which would break package feeds from (0:1.4.2-r0.0 to 0:1.2.8-r0.6) [version-going-backwards]
json-glib-1.2.8: Package version for package json-glib-locale-gl went backwards which would break package feeds from (0:1.4.2-r0.0 to 0:1.2.8-r0.25) [version-going-backwards]
json-glib-1.2.8: Package version for package json-glib-locale-gl went backwards which would break package feeds from (0:1.4.2-r0.0 to 0:1.2.8-r0.6) [version-going-backwards]
json-glib-1.2.8: Package version for package json-glib-locale-he went backwards which would break package feeds from (0:1.4.2-r0.0 to 0:1.2.8-r0.25) [version-going-backwards]
json-glib-1.2.8: Package version for package json-glib-locale-he went backwards which would break package feeds from (0:1.4.2-r0.0 to 0:1.2.8-r0.6) [version-going-backwards]
json-glib-1.2.8: Package version for package json-glib-locale-hi went backwards which would break package feeds from (0:1.4.2-r0.0 to 0:1.2.8-r0.25) [version-going-backwards]
json-glib-1.2.8: Package version for package json-glib-locale-hi went backwards which would break package feeds from (0:1.4.2-r0.0 to 0:1.2.8-r0.6) [version-going-backwards]
json-glib-1.2.8: Package version for package json-glib-locale-hu went backwards which would break package feeds from (0:1.4.2-r0.0 to 0:1.2.8-r0.25) [version-going-backwards]
json-glib-1.2.8: Package version for package json-glib-locale-hu went backwards which would break package feeds from (0:1.4.2-r0.0 to 0:1.2.8-r0.6) [version-going-backwards]
json-glib-1.2.8: Package version for package json-glib-locale-id went backwards which would break package feeds from (0:1.4.2-r0.0 to 0:1.2.8-r0.25) [version-going-backwards]
json-glib-1.2.8: Package version for package json-glib-locale-id went backwards which would break package feeds from (0:1.4.2-r0.0 to 0:1.2.8-r0.6) [version-going-backwards]
json-glib-1.2.8: Package version for package json-glib-locale-it went backwards which would break package feeds from (0:1.4.2-r0.0 to 0:1.2.8-r0.25) [version-going-backwards]
json-glib-1.2.8: Package version for package json-glib-locale-it went backwards which would break package feeds from (0:1.4.2-r0.0 to 0:1.2.8-r0.6) [version-going-backwards]
json-glib-1.2.8: Package version for package json-glib-locale-ja went backwards which would break package feeds from (0:1.4.2-r0.0 to 0:1.2.8-r0.25) [version-going-backwards]
json-glib-1.2.8: Package version for package json-glib-locale-ja went backwards which would break package feeds from (0:1.4.2-r0.0 to 0:1.2.8-r0.6) [version-going-backwards]
json-glib-1.2.8: Package version for package json-glib-locale-ko went backwards which would break package feeds from (0:1.4.2-r0.0 to 0:1.2.8-r0.25) [version-going-backwards]
json-glib-1.2.8: Package version for package json-glib-locale-ko went backwards which would break package feeds from (0:1.4.2-r0.0 to 0:1.2.8-r0.6) [version-going-backwards]
json-glib-1.2.8: Package version for package json-glib-locale-ky went backwards which would break package feeds from (0:1.4.2-r0.0 to 0:1.2.8-r0.25) [version-going-backwards]
json-glib-1.2.8: Package version for package json-glib-locale-ky went backwards which would break package feeds from (0:1.4.2-r0.0 to 0:1.2.8-r0.6) [version-going-backwards]
json-glib-1.2.8: Package version for package json-glib-locale-lt went backwards which would break package feeds from (0:1.4.2-r0.0 to 0:1.2.8-r0.25) [version-going-backwards]
json-glib-1.2.8: Package version for package json-glib-locale-lt went backwards which would break package feeds from (0:1.4.2-r0.0 to 0:1.2.8-r0.6) [version-going-backwards]
json-glib-1.2.8: Package version for package json-glib-locale-lv went backwards which would break package feeds from (0:1.4.2-r0.0 to 0:1.2.8-r0.25) [version-going-backwards]
json-glib-1.2.8: Package version for package json-glib-locale-lv went backwards which would break package feeds from (0:1.4.2-r0.0 to 0:1.2.8-r0.6) [version-going-backwards]
json-glib-1.2.8: Package version for package json-glib-locale-ml went backwards which would break package feeds from (0:1.4.2-r0.0 to 0:1.2.8-r0.25) [version-going-backwards]
json-glib-1.2.8: Package version for package json-glib-locale-ml went backwards which would break package feeds from (0:1.4.2-r0.0 to 0:1.2.8-r0.6) [version-going-backwards]
json-glib-1.2.8: Package version for package json-glib-locale-nb went backwards which would break package feeds from (0:1.4.2-r0.0 to 0:1.2.8-r0.25) [version-going-backwards]
json-glib-1.2.8: Package version for package json-glib-locale-nb went backwards which would break package feeds from (0:1.4.2-r0.0 to 0:1.2.8-r0.6) [version-going-backwards]
json-glib-1.2.8: Package version for package json-glib-locale-oc went backwards which would break package feeds from (0:1.4.2-r0.0 to 0:1.2.8-r0.25) [version-going-backwards]
json-glib-1.2.8: Package version for package json-glib-locale-oc went backwards which would break package feeds from (0:1.4.2-r0.0 to 0:1.2.8-r0.6) [version-going-backwards]
json-glib-1.2.8: Package version for package json-glib-locale-or went backwards which would break package feeds from (0:1.4.2-r0.0 to 0:1.2.8-r0.25) [version-going-backwards]
json-glib-1.2.8: Package version for package json-glib-locale-or went backwards which would break package feeds from (0:1.4.2-r0.0 to 0:1.2.8-r0.6) [version-going-backwards]
json-glib-1.2.8: Package version for package json-glib-locale-pa went backwards which would break package feeds from (0:1.4.2-r0.0 to 0:1.2.8-r0.25) [version-going-backwards]
json-glib-1.2.8: Package version for package json-glib-locale-pa went backwards which would break package feeds from (0:1.4.2-r0.0 to 0:1.2.8-r0.6) [version-going-backwards]
json-glib-1.2.8: Package version for package json-glib-locale-pl went backwards which would break package feeds from (0:1.4.2-r0.0 to 0:1.2.8-r0.25) [version-going-backwards]
json-glib-1.2.8: Package version for package json-glib-locale-pl went backwards which would break package feeds from (0:1.4.2-r0.0 to 0:1.2.8-r0.6) [version-going-backwards]
json-glib-1.2.8: Package version for package json-glib-locale-pt-br went backwards which would break package feeds from (0:1.4.2-r0.0 to 0:1.2.8-r0.25) [version-going-backwards]
json-glib-1.2.8: Package version for package json-glib-locale-pt-br went backwards which would break package feeds from (0:1.4.2-r0.0 to 0:1.2.8-r0.6) [version-going-backwards]
json-glib-1.2.8: Package version for package json-glib-locale-pt went backwards which would break package feeds from (0:1.4.2-r0.0 to 0:1.2.8-r0.25) [version-going-backwards]
json-glib-1.2.8: Package version for package json-glib-locale-pt went backwards which would break package feeds from (0:1.4.2-r0.0 to 0:1.2.8-r0.6) [version-going-backwards]
json-glib-1.2.8: Package version for package json-glib-locale-ro went backwards which would break package feeds from (0:1.4.2-r0.0 to 0:1.2.8-r0.25) [version-going-backwards]
json-glib-1.2.8: Package version for package json-glib-locale-ro went backwards which would break package feeds from (0:1.4.2-r0.0 to 0:1.2.8-r0.6) [version-going-backwards]
json-glib-1.2.8: Package version for package json-glib-locale-ru went backwards which would break package feeds from (0:1.4.2-r0.0 to 0:1.2.8-r0.25) [version-going-backwards]
json-glib-1.2.8: Package version for package json-glib-locale-ru went backwards which would break package feeds from (0:1.4.2-r0.0 to 0:1.2.8-r0.6) [version-going-backwards]
json-glib-1.2.8: Package version for package json-glib-locale-sk went backwards which would break package feeds from (0:1.4.2-r0.0 to 0:1.2.8-r0.25) [version-going-backwards]
json-glib-1.2.8: Package version for package json-glib-locale-sk went backwards which would break package feeds from (0:1.4.2-r0.0 to 0:1.2.8-r0.6) [version-going-backwards]
json-glib-1.2.8: Package version for package json-glib-locale-sl went backwards which would break package feeds from (0:1.4.2-r0.0 to 0:1.2.8-r0.25) [version-going-backwards]
json-glib-1.2.8: Package version for package json-glib-locale-sl went backwards which would break package feeds from (0:1.4.2-r0.0 to 0:1.2.8-r0.6) [version-going-backwards]
json-glib-1.2.8: Package version for package json-glib-locale-sr+latin went backwards which would break package feeds from (0:1.4.2-r0.0 to 0:1.2.8-r0.25) [version-going-backwards]
json-glib-1.2.8: Package version for package json-glib-locale-sr+latin went backwards which would break package feeds from (0:1.4.2-r0.0 to 0:1.2.8-r0.6) [version-going-backwards]
json-glib-1.2.8: Package version for package json-glib-locale-sr went backwards which would break package feeds from (0:1.4.2-r0.0 to 0:1.2.8-r0.25) [version-going-backwards]
json-glib-1.2.8: Package version for package json-glib-locale-sr went backwards which would break package feeds from (0:1.4.2-r0.0 to 0:1.2.8-r0.6) [version-going-backwards]
json-glib-1.2.8: Package version for package json-glib-locale-sv went backwards which would break package feeds from (0:1.4.2-r0.0 to 0:1.2.8-r0.25) [version-going-backwards]
json-glib-1.2.8: Package version for package json-glib-locale-sv went backwards which would break package feeds from (0:1.4.2-r0.0 to 0:1.2.8-r0.6) [version-going-backwards]
json-glib-1.2.8: Package version for package json-glib-locale-te went backwards which would break package feeds from (0:1.4.2-r0.0 to 0:1.2.8-r0.25) [version-going-backwards]
json-glib-1.2.8: Package version for package json-glib-locale-te went backwards which would break package feeds from (0:1.4.2-r0.0 to 0:1.2.8-r0.6) [version-going-backwards]
json-glib-1.2.8: Package version for package json-glib-locale-tg went backwards which would break package feeds from (0:1.4.2-r0.0 to 0:1.2.8-r0.25) [version-going-backwards]
json-glib-1.2.8: Package version for package json-glib-locale-tg went backwards which would break package feeds from (0:1.4.2-r0.0 to 0:1.2.8-r0.6) [version-going-backwards]
json-glib-1.2.8: Package version for package json-glib-locale-tr went backwards which would break package feeds from (0:1.4.2-r0.0 to 0:1.2.8-r0.25) [version-going-backwards]
json-glib-1.2.8: Package version for package json-glib-locale-tr went backwards which would break package feeds from (0:1.4.2-r0.0 to 0:1.2.8-r0.6) [version-going-backwards]
json-glib-1.2.8: Package version for package json-glib-locale-ug went backwards which would break package feeds from (0:1.4.2-r0.0 to 0:1.2.8-r0.25) [version-going-backwards]
json-glib-1.2.8: Package version for package json-glib-locale-ug went backwards which would break package feeds from (0:1.4.2-r0.0 to 0:1.2.8-r0.6) [version-going-backwards]
json-glib-1.2.8: Package version for package json-glib-locale-uk went backwards which would break package feeds from (0:1.4.2-r0.0 to 0:1.2.8-r0.25) [version-going-backwards]
json-glib-1.2.8: Package version for package json-glib-locale-uk went backwards which would break package feeds from (0:1.4.2-r0.0 to 0:1.2.8-r0.6) [version-going-backwards]
json-glib-1.2.8: Package version for package json-glib-locale-vi went backwards which would break package feeds from (0:1.4.2-r0.0 to 0:1.2.8-r0.25) [version-going-backwards]
json-glib-1.2.8: Package version for package json-glib-locale-vi went backwards which would break package feeds from (0:1.4.2-r0.0 to 0:1.2.8-r0.6) [version-going-backwards]
json-glib-1.2.8: Package version for package json-glib-locale-zh-cn went backwards which would break package feeds from (0:1.4.2-r0.0 to 0:1.2.8-r0.25) [version-going-backwards]
json-glib-1.2.8: Package version for package json-glib-locale-zh-cn went backwards which would break package feeds from (0:1.4.2-r0.0 to 0:1.2.8-r0.6) [version-going-backwards]
json-glib-1.2.8: Package version for package json-glib-locale-zh-hk went backwards which would break package feeds from (0:1.4.2-r0.0 to 0:1.2.8-r0.25) [version-going-backwards]
json-glib-1.2.8: Package version for package json-glib-locale-zh-hk went backwards which would break package feeds from (0:1.4.2-r0.0 to 0:1.2.8-r0.6) [version-going-backwards]
json-glib-1.2.8: Package version for package json-glib-locale-zh-tw went backwards which would break package feeds from (0:1.4.2-r0.0 to 0:1.2.8-r0.25) [version-going-backwards]
json-glib-1.2.8: Package version for package json-glib-locale-zh-tw went backwards which would break package feeds from (0:1.4.2-r0.0 to 0:1.2.8-r0.6) [version-going-backwards]
json-glib-1.2.8: Package version for package json-glib-staticdev went backwards which would break package feeds from (0:1.4.2-r0.0 to 0:1.2.8-r0.25) [version-going-backwards]
json-glib-1.2.8: Package version for package json-glib-staticdev went backwards which would break package feeds from (0:1.4.2-r0.0 to 0:1.2.8-r0.6) [version-going-backwards]
json-glib-1.2.8: Package version for package json-glib went backwards which would break package feeds from (0:1.4.2-r0.0 to 0:1.2.8-r0.25) [version-going-backwards]
json-glib-1.2.8: Package version for package json-glib went backwards which would break package feeds from (0:1.4.2-r0.0 to 0:1.2.8-r0.6) [version-going-backwards]


count: 3	issue: host-user-contaminated
glibc-locale-2.26: glibc-locale: /glibc-binary-localedata-ar-bh/usr/lib/locale/ar_BH/LC_NUMERIC is owned by uid 3004, which is the same as the user running bitbake. This may be due to host contamination [host-user-contaminated]
glibc-locale-2.26: glibc-locale: /glibc-binary-localedata-ar-eg/usr/lib/locale/ar_EG/LC_PAPER is owned by uid 3004, which is the same as the user running bitbake. This may be due to host contamination [host-user-contaminated]
glibc-locale-2.26: glibc-locale: /glibc-binary-localedata-niu-nu/usr/lib/locale/niu_NU/LC_COLLATE is owned by uid 3004, which is the same as the user running bitbake. This may be due to host contamination [host-user-contaminated]


count: 1	issue: installed-vs-shipped
rdist: 1 installed and not shipped files. [installed-vs-shipped]


count: 0	issue: unknown-configure-option


count: 0	issue: symlink-to-sysroot


count: 0	issue: invalid-pkgconfig


count: 0	issue: pkgname


count: 0	issue: ldflags


count: 0	issue: compile-host-path


count: 527	issue: qa_pseudo
a2jmidid-8: This /work/i586-oe-linux-musl/a2jmidid/8-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
acl-2.2.52: This /work/armv5te-oe-linux-gnueabi/acl/2.2.52-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
alsa-utils-1.1.5: This /work/armv5te-oe-linux-gnueabi/alsa-utils/1.1.5-r0/pseudo/pseudo.log indicates 16 errors [qa_pseudo]
apache2-2.4.29: This /work/aarch64-oe-linux/apache2/2.4.29-r0/pseudo/pseudo.log indicates 7 errors [qa_pseudo]
apache2-2.4.29: This /work/armv5te-oe-linux-gnueabi/apache2/2.4.29-r0/pseudo/pseudo.log indicates 5 errors [qa_pseudo]
apache2-2.4.29: This /work/core2-64-oe-linux/apache2/2.4.29-r0/pseudo/pseudo.log indicates 7 errors [qa_pseudo]
apache2-2.4.29: This /work/i586-oe-linux-musl/apache2/2.4.29-r0/pseudo/pseudo.log indicates 5 errors [qa_pseudo]
apr-util-1.6.0: This /work/core2-64-oe-linux/apr-util/1.6.0-r1/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
arno-iptables-firewall-2.0.1g: This /work/i586-oe-linux-musl/arno-iptables-firewall/2.0.1g-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
asio-1.10.6: This /work/armv5te-oe-linux-gnueabi/asio/1.10.6-r0/pseudo/pseudo.log indicates 5 errors [qa_pseudo]
attr-2.4.47: This /work/core2-64-oe-linux/attr/2.4.47-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
bdftopcf-1.1: This /work/i586-oe-linux-musl/bdftopcf/1.1-r0/pseudo/pseudo.log indicates 9 errors [qa_pseudo]
blktrace-1.1.0+gitAUTOINC+43fc870ce0: This /work/armv5te-oe-linux-gnueabi/blktrace/1.1.0+gitAUTOINC+43fc870ce0-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
bluez5-5.48: This /work/aarch64-oe-linux/bluez5/5.48-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
bluez5-5.48: This /work/armv5te-oe-linux-gnueabi/bluez5/5.48-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
bluez5-5.48: This /work/core2-64-oe-linux/bluez5/5.48-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
bonnie++-1.03e: This /work/core2-64-oe-linux/bonnie++/1.03e-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
boost-1.65.1: This /work/aarch64-oe-linux/boost/1.65.1-r0/pseudo/pseudo.log indicates 18 errors [qa_pseudo]
bootchart2-0.14.8: This /work/core2-64-oe-linux/bootchart2/0.14.8-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
btrfs-tools-4.13.3: This /work/i586-oe-linux-musl/btrfs-tools/4.13.3-r0/pseudo/pseudo.log indicates 16 errors [qa_pseudo]
busybox-1.27.2: This /work/core2-64-oe-linux/busybox/1.27.2-r0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
cairo-1.14.12: This /work/core2-64-oe-linux/cairo/1.14.12-r0/pseudo/pseudo.log indicates 18 errors [qa_pseudo]
can-utils-0.0+gitrAUTOINC+4c8fb05cb4: This /work/armv5te-oe-linux-gnueabi/can-utils/0.0+gitrAUTOINC+4c8fb05cb4-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
chrony-3.2: This /work/aarch64-oe-linux/chrony/3.2-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
chrony-3.2: This /work/armv5te-oe-linux-gnueabi/chrony/3.2-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
chrony-3.2: This /work/i586-oe-linux-musl/chrony/3.2-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
collectd-5.7.2: This /work/core2-64-oe-linux/collectd/5.7.2-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
conntrack-tools-1.4.4: This /work/core2-64-oe-linux/conntrack-tools/1.4.4-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
console-tools-0.3.2: This /work/i586-oe-linux-musl/console-tools/0.3.2-r8/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
corosync-2.4.3: This /work/armv5te-oe-linux-gnueabi/corosync/2.4.3-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
cppunit-1.13.2: This /work/i586-oe-linux-musl/cppunit/1.13.2-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
ctdb-2.5.6: This /work/aarch64-oe-linux/ctdb/2.5.6-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
curlpp-0.8.1: This /work/aarch64-oe-linux/curlpp/0.8.1-r0/pseudo/pseudo.log indicates 7 errors [qa_pseudo]
curlpp-0.8.1: This /work/armv5te-oe-linux-gnueabi/curlpp/0.8.1-r0/pseudo/pseudo.log indicates 5 errors [qa_pseudo]
curlpp-0.8.1: This /work/core2-64-oe-linux/curlpp/0.8.1-r0/pseudo/pseudo.log indicates 7 errors [qa_pseudo]
curlpp-0.8.1: This /work/i586-oe-linux-musl/curlpp/0.8.1-r0/pseudo/pseudo.log indicates 5 errors [qa_pseudo]
cxxtest-4.3: This /work/aarch64-oe-linux/cxxtest/4.3-r0/pseudo/pseudo.log indicates 7 errors [qa_pseudo]
daemontools-0.76: This /work/armv5te-oe-linux-gnueabi/daemontools/0.76-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
dhcp-4.3.6: This /work/aarch64-oe-linux/dhcp/4.3.6-r0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
dhcp-4.3.6: This /work/armv5te-oe-linux-gnueabi/dhcp/4.3.6-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
dhcp-4.3.6: This /work/core2-64-oe-linux/dhcp/4.3.6-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
dhcp-4.3.6: This /work/i586-oe-linux-musl/dhcp/4.3.6-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
dialog-1.3-20160828: This /work/i586-oe-linux-musl/dialog/1.3-20160828-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
directfb-examples-1.7.0: This /work/armv5te-oe-linux-gnueabi/directfb-examples/1.7.0-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
dovecot-2.2.33: This /work/aarch64-oe-linux/dovecot/2.2.33-r0/pseudo/pseudo.log indicates 14 errors [qa_pseudo]
dovecot-2.2.33: This /work/armv5te-oe-linux-gnueabi/dovecot/2.2.33-r0/pseudo/pseudo.log indicates 11 errors [qa_pseudo]
dovecot-2.2.33: This /work/core2-64-oe-linux/dovecot/2.2.33-r0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
dovecot-2.2.33: This /work/i586-oe-linux-musl/dovecot/2.2.33-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
ebtables-2.0.10-4: This /work/aarch64-oe-linux/ebtables/2.0.10-4-r4/pseudo/pseudo.log indicates 7 errors [qa_pseudo]
ebtables-2.0.10-4: This /work/core2-64-oe-linux/ebtables/2.0.10-4-r4/pseudo/pseudo.log indicates 7 errors [qa_pseudo]
ebtables-2.0.10-4: This /work/i586-oe-linux-musl/ebtables/2.0.10-4-r4/pseudo/pseudo.log indicates 5 errors [qa_pseudo]
edac-utils-0.18+gitAUTOINC+f9aa96205f: This /work/core2-64-oe-linux/edac-utils/0.18+gitAUTOINC+f9aa96205f-r0/pseudo/pseudo.log indicates 11 errors [qa_pseudo]
elfutils-0.170: This /work/armv5te-oe-linux-gnueabi/elfutils/0.170-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
epeg-git: This /work/armv5te-oe-linux-gnueabi/epeg/git-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
exfat-utils-1.2.3: This /work/armv5te-oe-linux-gnueabi/exfat-utils/1.2.3-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
expect-5.45.3: This /work/aarch64-oe-linux/expect/5.45.3-r0/pseudo/pseudo.log indicates 11 errors [qa_pseudo]
firefox-l10n-ach-45.9.0esr: This /work/all-oe-linux/firefox-l10n-ach/45.9.0esr-r3/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
firefox-l10n-son-45.9.0esr: This /work/all-oe-linux/firefox-l10n-son/45.9.0esr-r3/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
fluidsynth-1.1.9: This /work/core2-64-oe-linux/fluidsynth/1.1.9-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
freeradius-3.0.15: This /work/aarch64-oe-linux/freeradius/3.0.15-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
fstests-0.1+gitAUTOINC+e5939ff608: This /work/core2-64-oe-linux/fstests/0.1+gitAUTOINC+e5939ff608-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
fuse-exfat-1.2.3: This /work/i586-oe-linux-musl/fuse-exfat/1.2.3-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
gammu-1.32.0: This /work/i586-oe-linux-musl/gammu/1.32.0-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
gateone-1.2+gitAUTOINC+f7a9be46cb: This /work/aarch64-oe-linux/gateone/1.2+gitAUTOINC+f7a9be46cb-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
gateone-1.2+gitAUTOINC+f7a9be46cb: This /work/armv5te-oe-linux-gnueabi/gateone/1.2+gitAUTOINC+f7a9be46cb-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
gateone-1.2+gitAUTOINC+f7a9be46cb: This /work/core2-64-oe-linux/gateone/1.2+gitAUTOINC+f7a9be46cb-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
gateone-1.2+gitAUTOINC+f7a9be46cb: This /work/i586-oe-linux-musl/gateone/1.2+gitAUTOINC+f7a9be46cb-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
geoip-1.6.9: This /work/aarch64-oe-linux/geoip/1.6.9-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
geoip-1.6.9: This /work/armv5te-oe-linux-gnueabi/geoip/1.6.9-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
gettext-0.19.8.1: This /work/armv5te-oe-linux-gnueabi/gettext/0.19.8.1-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
git-2.15.0: This /work/i586-oe-linux-musl/git/2.15.0-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
glibc-2.26: This /work/aarch64-oe-linux/glibc/2.26-r0/pseudo/pseudo.log indicates 532 errors [qa_pseudo]
glibc-2.26: This /work/armv5e-oe-linux-gnueabi/glibc/2.26-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
glibc-2.26: This /work/core2-64-oe-linux/glibc/2.26-r0/pseudo/pseudo.log indicates 383 errors [qa_pseudo]
glibc-locale-2.26: This /work/aarch64-oe-linux/glibc-locale/2.26-r0/pseudo/pseudo.log indicates 15 errors [qa_pseudo]
glibc-locale-2.26: This /work/armv5e-oe-linux-gnueabi/glibc-locale/2.26-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
glibc-locale-2.26: This /work/core2-64-oe-linux/glibc-locale/2.26-r0/pseudo/pseudo.log indicates 17 errors [qa_pseudo]
grubby-8.40: This /work/core2-64-oe-linux/grubby/8.40-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
grub-efi-2.02: This /work/i586-oe-linux-musl/grub-efi/2.02-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
gst-openmax-0.10.1: This /work/aarch64-oe-linux/gst-openmax/0.10.1-r4/pseudo/pseudo.log indicates 20 errors [qa_pseudo]
hunspell-1.6.1: This /work/armv5te-oe-linux-gnueabi/hunspell/1.6.1-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
icu-60.2: This /work/core2-64-oe-linux/icu/60.2-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
icu-60.2: This /work/i586-oe-linux-musl/icu/60.2-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
initscripts-1.0: This /work/aarch64-oe-linux/initscripts/1.0-r155/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
ippool-1.3: This /work/i586-oe-linux-musl/ippool/1.3-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
ipsec-tools-0.8.2: This /work/qemuarm64-oe-linux/ipsec-tools/0.8.2-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
iptables-1.6.1: This /work/armv5te-oe-linux-gnueabi/iptables/1.6.1-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
kbd-2.0.4: This /work/i586-oe-linux-musl/kbd/2.0.4-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
kernelshark-2.6.2: This /work/armv5te-oe-linux-gnueabi/kernelshark/2.6.2-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
kernelshark-2.6.2: This /work/core2-64-oe-linux/kernelshark/2.6.2-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
lcdproc-0.5.8+gitAUTOINC+f5156e2e41: This /work/aarch64-oe-linux/lcdproc/0.5.8+gitAUTOINC+f5156e2e41-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
lcdproc-0.5.8+gitAUTOINC+f5156e2e41: This /work/armv5te-oe-linux-gnueabi/lcdproc/0.5.8+gitAUTOINC+f5156e2e41-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
lcdproc-0.5.8+gitAUTOINC+f5156e2e41: This /work/core2-64-oe-linux/lcdproc/0.5.8+gitAUTOINC+f5156e2e41-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
lftp-4.7.7: This /work/aarch64-oe-linux/lftp/4.7.7-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
libatasmart-0.19: This /work/armv5te-oe-linux-gnueabi/libatasmart/0.19-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
libatasmart-0.19: This /work/i586-oe-linux-musl/libatasmart/0.19-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
libblockdev-2.10: This /work/core2-64-oe-linux/libblockdev/2.10-r0/pseudo/pseudo.log indicates 14 errors [qa_pseudo]
libcap-ng-0.7.8: This /work/aarch64-oe-linux/libcap-ng/0.7.8-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
libcomps-0.1.8+gitAUTOINC+01a4759894: This /work/aarch64-oe-linux/libcomps/0.1.8+gitAUTOINC+01a4759894-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
libconnman-qt5-1.2.4+gitAUTOINC+9d98e12ed6: This /work/aarch64-oe-linux/libconnman-qt5/1.2.4+gitAUTOINC+9d98e12ed6-r0/pseudo/pseudo.log indicates 15 errors [qa_pseudo]
libconnman-qt5-1.2.4+gitAUTOINC+9d98e12ed6: This /work/armv5te-oe-linux-gnueabi/libconnman-qt5/1.2.4+gitAUTOINC+9d98e12ed6-r0/pseudo/pseudo.log indicates 11 errors [qa_pseudo]
libconnman-qt5-1.2.4+gitAUTOINC+9d98e12ed6: This /work/core2-64-oe-linux/libconnman-qt5/1.2.4+gitAUTOINC+9d98e12ed6-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
libconnman-qt5-1.2.4+gitAUTOINC+9d98e12ed6: This /work/i586-oe-linux-musl/libconnman-qt5/1.2.4+gitAUTOINC+9d98e12ed6-r0/pseudo/pseudo.log indicates 11 errors [qa_pseudo]
libdbus-c++-0.9.0: This /work/core2-64-oe-linux/libdbus-c++/0.9.0-r0/pseudo/pseudo.log indicates 18 errors [qa_pseudo]
libdc1394-2.2.5+gitrAUTOINC+5e78f51936: This /work/armv5te-oe-linux-gnueabi/libdc1394/2.2.5+gitrAUTOINC+5e78f51936-r0/pseudo/pseudo.log indicates 16 errors [qa_pseudo]
libdrm-2.4.89: This /work/armv5te-oe-linux-gnueabi/libdrm/2.4.89-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
libeigen-3.3.4: This /work/i586-oe-linux-musl/libeigen/3.3.4-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
libencode-locale-perl-1.05: This /work/core2-64-oe-linux/libencode-locale-perl/1.05-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
libfm-extra-1.2.5: This /work/i586-oe-linux-musl/libfm-extra/1.2.5-r0/pseudo/pseudo.log indicates 16 errors [qa_pseudo]
libice-1.0.9: This /work/aarch64-oe-linux/libice/1_1.0.9-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
libinput-1.8.4: This /work/aarch64-oe-linux/libinput/1.8.4-r0/pseudo/pseudo.log indicates 11 errors [qa_pseudo]
liblbxutil-1.1.0: This /work/core2-64-oe-linux/liblbxutil/1_1.1.0-r11/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
liboauth-1.0.3: This /work/i586-oe-linux-musl/liboauth/1.0.3-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
libpcre2-10.30: This /work/aarch64-oe-linux/libpcre2/10.30-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
libpcre-8.41: This /work/i586-oe-linux-musl/libpcre/8.41-r0/pseudo/pseudo.log indicates 16 errors [qa_pseudo]
libqofono-0.92+gitrAUTOINC+6916cd030b: This /work/aarch64-oe-linux/libqofono/0.92+gitrAUTOINC+6916cd030b-r0/pseudo/pseudo.log indicates 14 errors [qa_pseudo]
libqofono-0.92+gitrAUTOINC+6916cd030b: This /work/armv5te-oe-linux-gnueabi/libqofono/0.92+gitrAUTOINC+6916cd030b-r0/pseudo/pseudo.log indicates 11 errors [qa_pseudo]
libqofono-0.92+gitrAUTOINC+6916cd030b: This /work/core2-64-oe-linux/libqofono/0.92+gitrAUTOINC+6916cd030b-r0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
libssh2-1.8.0: This /work/aarch64-oe-linux/libssh2/1.8.0-r0/pseudo/pseudo.log indicates 11 errors [qa_pseudo]
libtimedate-perl-2.30: This /work/core2-64-oe-linux/libtimedate-perl/2.30-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
libubox-1.0.1+gitAUTOINC+155bf39896: This /work/core2-64-oe-linux/libubox/1.0.1+gitAUTOINC+155bf39896-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
libvncserver-0.9.11: This /work/aarch64-oe-linux/libvncserver/0.9.11-r0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
libvncserver-0.9.11: This /work/armv5te-oe-linux-gnueabi/libvncserver/0.9.11-r0/pseudo/pseudo.log indicates 11 errors [qa_pseudo]
libvncserver-0.9.11: This /work/core2-64-oe-linux/libvncserver/0.9.11-r0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
libvncserver-0.9.11: This /work/i586-oe-linux-musl/libvncserver/0.9.11-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
libwebp-0.6.0: This /work/i586-oe-linux-musl/libwebp/0.6.0-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
libwmf-0.2.8.4: This /work/aarch64-oe-linux/libwmf/0.2.8.4-r3/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
libwmf-0.2.8.4: This /work/armv5te-oe-linux-gnueabi/libwmf/0.2.8.4-r3/pseudo/pseudo.log indicates 11 errors [qa_pseudo]
libwmf-0.2.8.4: This /work/core2-64-oe-linux/libwmf/0.2.8.4-r3/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
libwmf-0.2.8.4: This /work/i586-oe-linux-musl/libwmf/0.2.8.4-r3/pseudo/pseudo.log indicates 11 errors [qa_pseudo]
libxrender-0.9.10: This /work/i586-oe-linux-musl/libxrender/1_0.9.10-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
libxv-1.0.11: This /work/armv5te-oe-linux-gnueabi/libxv/1.0.11-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
linux-atm-2.5.2: This /work/qemuarm-oe-linux-gnueabi/linux-atm/2.5.2-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
lirc-0.9.4d: This /work/aarch64-oe-linux/lirc/0.9.4d-r0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
lirc-0.9.4d: This /work/armv5te-oe-linux-gnueabi/lirc/0.9.4d-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
lirc-0.9.4d: This /work/core2-64-oe-linux/lirc/0.9.4d-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
lirc-0.9.4d: This /work/i586-oe-linux-musl/lirc/0.9.4d-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
lksctp-tools-1.0.17+gitAUTOINC+736b91d340: This /work/aarch64-oe-linux/lksctp-tools/1.0.17+gitAUTOINC+736b91d340-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
lksctp-tools-1.0.17+gitAUTOINC+736b91d340: This /work/core2-64-oe-linux/lksctp-tools/1.0.17+gitAUTOINC+736b91d340-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
lksctp-tools-1.0.17+gitAUTOINC+736b91d340: This /work/i586-oe-linux-musl/lksctp-tools/1.0.17+gitAUTOINC+736b91d340-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
llvm-5.0: This /work/aarch64-oe-linux/llvm/5.0-r0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
llvm-5.0: This /work/core2-64-oe-linux/llvm/5.0-r0/pseudo/pseudo.log indicates 7 errors [qa_pseudo]
llvm-5.0: This /work/i586-oe-linux-musl/llvm/5.0-r0/pseudo/pseudo.log indicates 11 errors [qa_pseudo]
log4cpp-1.1.2: This /work/aarch64-oe-linux/log4cpp/1.1.2-r0/pseudo/pseudo.log indicates 7 errors [qa_pseudo]
log4cpp-1.1.2: This /work/armv5te-oe-linux-gnueabi/log4cpp/1.1.2-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
log4cpp-1.1.2: This /work/i586-oe-linux-musl/log4cpp/1.1.2-r0/pseudo/pseudo.log indicates 5 errors [qa_pseudo]
logwatch-7.4.3: This /work/aarch64-oe-linux/logwatch/7.4.3-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
lttng-tools-2.9.5: This /work/aarch64-oe-linux/lttng-tools/2.9.5-r0/pseudo/pseudo.log indicates 11 errors [qa_pseudo]
lttng-tools-2.9.5: This /work/core2-64-oe-linux/lttng-tools/2.9.5-r0/pseudo/pseudo.log indicates 17 errors [qa_pseudo]
lttng-tools-2.9.5: This /work/i586-oe-linux-musl/lttng-tools/2.9.5-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
maliit-framework-qt5-0.99.0+gitAUTOINC+60b1b10de1: This /work/aarch64-oe-linux/maliit-framework-qt5/0.99.0+gitAUTOINC+60b1b10de1-r0/pseudo/pseudo.log indicates 14 errors [qa_pseudo]
maliit-framework-qt5-0.99.0+gitAUTOINC+60b1b10de1: This /work/armv5te-oe-linux-gnueabi/maliit-framework-qt5/0.99.0+gitAUTOINC+60b1b10de1-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
maliit-framework-qt5-0.99.0+gitAUTOINC+60b1b10de1: This /work/core2-64-oe-linux/maliit-framework-qt5/0.99.0+gitAUTOINC+60b1b10de1-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
mariadb-5.5.57: This /work/armv5e-oe-linux-gnueabi/mariadb/5.5.57-r0/pseudo/pseudo.log indicates 16 errors [qa_pseudo]
matchbox-keyboard-0.1.1: This /work/aarch64-oe-linux/matchbox-keyboard/0.1.1-r0/pseudo/pseudo.log indicates 18 errors [qa_pseudo]
mc-4.8.20: This /work/core2-64-oe-linux/mc/4.8.20-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
mdns-765.50.9: This /work/armv5te-oe-linux-gnueabi/mdns/765.50.9-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
meson-0.44.0: This /work/core2-64-oe-linux/meson/0.44.0-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
mime-support-3.48: This /work/core2-64-oe-linux/mime-support/3.48-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
mmc-utils-0.1: This /work/i586-oe-linux-musl/mmc-utils/0.1-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
mosquitto-1.4.14: This /work/armv5te-oe-linux-gnueabi/mosquitto/1.4.14-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
mosquitto-1.4.14: This /work/core2-64-oe-linux/mosquitto/1.4.14-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
mosquitto-1.4.14: This /work/i586-oe-linux-musl/mosquitto/1.4.14-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
mozilla-devscripts-0.30: This /work/i586-oe-linux-musl/mozilla-devscripts/0.30-r1/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
mpg123-1.25.7: This /work/i586-oe-linux-musl/mpg123/1.25.7-r0/pseudo/pseudo.log indicates 17 errors [qa_pseudo]
mpich-3.2: This /work/aarch64-oe-linux/mpich/3.2-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
mpich-3.2: This /work/core2-64-oe-linux/mpich/3.2-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
mpich-3.2: This /work/i586-oe-linux-musl/mpich/3.2-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
netdata-1.8.0+gitAUTOINC+89ed309252: This /work/aarch64-oe-linux/netdata/1.8.0+gitAUTOINC+89ed309252-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
nettle-3.4: This /work/armv5te-oe-linux-gnueabi/nettle/3.4-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
nginx-1.12.2: This /work/aarch64-oe-linux/nginx/1.12.2-r0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
nginx-1.12.2: This /work/armv5te-oe-linux-gnueabi/nginx/1.12.2-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
nginx-1.12.2: This /work/core2-64-oe-linux/nginx/1.12.2-r0/pseudo/pseudo.log indicates 14 errors [qa_pseudo]
nginx-1.12.2: This /work/i586-oe-linux-musl/nginx/1.12.2-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
nspr-4.17: This /work/armv5te-oe-linux-gnueabi/nspr/4.17-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
ntfs-3g-ntfsprogs-2017.3.23: This /work/aarch64-oe-linux/ntfs-3g-ntfsprogs/2017.3.23-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
ntp-4.2.8p10: This /work/aarch64-oe-linux/ntp/4.2.8p10-r0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
ntp-4.2.8p10: This /work/armv5te-oe-linux-gnueabi/ntp/4.2.8p10-r0/pseudo/pseudo.log indicates 11 errors [qa_pseudo]
ntp-4.2.8p10: This /work/core2-64-oe-linux/ntp/4.2.8p10-r0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
onboard-1.4.1: This /work/core2-64-oe-linux/onboard/1.4.1-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
opencv-3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4: This /work/armv5e-oe-linux-gnueabi/opencv/3.3+gitAUTOINC+87c27a074d_2a9d1b22ed_a62e20676a_34e4206aef_fccf7cd6a4-r0/pseudo/pseudo.log indicates 17 errors [qa_pseudo]
openflow-1.0+gitAUTOINC+c84f33f09d: This /work/aarch64-oe-linux/openflow/1.0+gitAUTOINC+c84f33f09d-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
openhpi-3.6.1: This /work/core2-64-oe-linux/openhpi/3.6.1-r0/pseudo/pseudo.log indicates 14 errors [qa_pseudo]
open-isns-0.97: This /work/aarch64-oe-linux/open-isns/0.97-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
open-isns-0.97: This /work/armv5te-oe-linux-gnueabi/open-isns/0.97-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
open-isns-0.97: This /work/core2-64-oe-linux/open-isns/0.97-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
openldap-2.4.45: This /work/aarch64-oe-linux/openldap/2.4.45-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
openldap-2.4.45: This /work/armv5te-oe-linux-gnueabi/openldap/2.4.45-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
opensaf-5.17.07: This /work/aarch64-oe-linux/opensaf/5.17.07-r0/pseudo/pseudo.log indicates 25 errors [qa_pseudo]
opensaf-5.17.07: This /work/armv5te-oe-linux-gnueabi/opensaf/5.17.07-r0/pseudo/pseudo.log indicates 25 errors [qa_pseudo]
opensaf-5.17.07: This /work/core2-64-oe-linux/opensaf/5.17.07-r0/pseudo/pseudo.log indicates 21 errors [qa_pseudo]
openssh-7.6p1: This /work/aarch64-oe-linux/openssh/7.6p1-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
openssh-7.6p1: This /work/armv5te-oe-linux-gnueabi/openssh/7.6p1-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
openssh-7.6p1: This /work/core2-64-oe-linux/openssh/7.6p1-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
openssh-7.6p1: This /work/i586-oe-linux-musl/openssh/7.6p1-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
openssl-1.0.2m: This /work/i586-oe-linux-musl/openssl/1.0.2m-r0/pseudo/pseudo.log indicates 16 errors [qa_pseudo]
openwsman-2.6.3: This /work/armv5te-oe-linux-gnueabi/openwsman/2.6.3-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
opkg-0.3.5: This /work/core2-64-oe-linux/opkg/1_0.3.5-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
ossp-uuid-1.6.2: This /work/aarch64-oe-linux/ossp-uuid/1.6.2-r2/pseudo/pseudo.log indicates 7 errors [qa_pseudo]
ossp-uuid-1.6.2: This /work/armv5te-oe-linux-gnueabi/ossp-uuid/1.6.2-r2/pseudo/pseudo.log indicates 5 errors [qa_pseudo]
ossp-uuid-1.6.2: This /work/core2-64-oe-linux/ossp-uuid/1.6.2-r2/pseudo/pseudo.log indicates 7 errors [qa_pseudo]
ossp-uuid-1.6.2: This /work/i586-oe-linux-musl/ossp-uuid/1.6.2-r2/pseudo/pseudo.log indicates 5 errors [qa_pseudo]
owfs-2.9p1: This /work/core2-64-oe-linux/owfs/2.9p1-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
pam-ssh-agent-auth-0.10.3: This /work/armv5te-oe-linux-gnueabi/pam-ssh-agent-auth/0.10.3-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
pango-1.40.12: This /work/core2-64-oe-linux/pango/1.40.12-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
perl-5.24.1: This /work/aarch64-oe-linux/perl/5.24.1-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
perl-5.24.1: This /work/core2-64-oe-linux/perl/5.24.1-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
php-7.1.9: This /work/aarch64-oe-linux/php/7.1.9-r0/pseudo/pseudo.log indicates 15 errors [qa_pseudo]
php-7.1.9: This /work/armv5e-oe-linux-gnueabi/php/7.1.9-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
php-7.1.9: This /work/core2-64-oe-linux/php/7.1.9-r0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
php-7.1.9: This /work/i586-oe-linux-musl/php/7.1.9-r0/pseudo/pseudo.log indicates 11 errors [qa_pseudo]
pm-qa-0.5.2: This /work/aarch64-oe-linux/pm-qa/0.5.2-r0/pseudo/pseudo.log indicates 47 errors [qa_pseudo]
pm-qa-0.5.2: This /work/armv5te-oe-linux-gnueabi/pm-qa/0.5.2-r0/pseudo/pseudo.log indicates 27 errors [qa_pseudo]
pm-qa-0.5.2: This /work/core2-64-oe-linux/pm-qa/0.5.2-r0/pseudo/pseudo.log indicates 43 errors [qa_pseudo]
popt-1.16: This /work/aarch64-oe-linux/popt/1.16-r3/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
portaudio-v19-v190600: This /work/aarch64-oe-linux/portaudio-v19/v190600-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
portaudio-v19-v190600: This /work/armv5te-oe-linux-gnueabi/portaudio-v19/v190600-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
portaudio-v19-v190600: This /work/i586-oe-linux-musl/portaudio-v19/v190600-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
postfix-3.2.2: This /work/aarch64-oe-linux/postfix/3.2.2-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
postfix-3.2.2: This /work/armv5te-oe-linux-gnueabi/postfix/3.2.2-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
postfix-3.2.2: This /work/core2-64-oe-linux/postfix/3.2.2-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
postfix-3.2.2: This /work/i586-oe-linux-musl/postfix/3.2.2-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
postgresql-9.4.15: This /work/aarch64-oe-linux/postgresql/9.4.15-r0/pseudo/pseudo.log indicates 15 errors [qa_pseudo]
postgresql-9.4.15: This /work/armv5e-oe-linux-gnueabi/postgresql/9.4.15-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
postgresql-9.4.15: This /work/core2-64-oe-linux/postgresql/9.4.15-r0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
postgresql-9.4.15: This /work/i586-oe-linux-musl/postgresql/9.4.15-r0/pseudo/pseudo.log indicates 11 errors [qa_pseudo]
ppp-2.4.7: This /work/i586-oe-linux-musl/ppp/2.4.7-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
procps-3.3.12: This /work/armv5te-oe-linux-gnueabi/procps/3.3.12-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
procps-3.3.12: This /work/i586-oe-linux-musl/procps/3.3.12-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
proftpd-1.3.6: This /work/aarch64-oe-linux/proftpd/1.3.6-r0/pseudo/pseudo.log indicates 14 errors [qa_pseudo]
proftpd-1.3.6: This /work/armv5te-oe-linux-gnueabi/proftpd/1.3.6-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
proftpd-1.3.6: This /work/core2-64-oe-linux/proftpd/1.3.6-r0/pseudo/pseudo.log indicates 14 errors [qa_pseudo]
proftpd-1.3.6: This /work/i586-oe-linux-musl/proftpd/1.3.6-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
protobuf-c-1.3.0+gitAUTOINC+dac1a65fea: This /work/i586-oe-linux-musl/protobuf-c/1.3.0+gitAUTOINC+dac1a65fea-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
pure-ftpd-1.0.42: This /work/aarch64-oe-linux/pure-ftpd/1.0.42-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
puzzles-0.0+gitAUTOINC+8dfe5cec31: This /work/core2-64-oe-linux/puzzles/1_0.0+gitAUTOINC+8dfe5cec31-r0/pseudo/pseudo.log indicates 18 errors [qa_pseudo]
pyrtm-0.4.2: This /work/armv5te-oe-linux-gnueabi/pyrtm/0.4.2-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
python-2.7.13: This /work/aarch64-oe-linux/python/2.7.13-r1/pseudo/pseudo.log indicates 5 errors [qa_pseudo]
python-2.7.13: This /work/armv5te-oe-linux-gnueabi/python/2.7.13-r1/pseudo/pseudo.log indicates 5 errors [qa_pseudo]
python-2.7.13: This /work/core2-64-oe-linux/python/2.7.13-r1/pseudo/pseudo.log indicates 5 errors [qa_pseudo]
python-2.7.13: This /work/i586-oe-linux-musl/python/2.7.13-r1/pseudo/pseudo.log indicates 5 errors [qa_pseudo]
python3-3.5.3: This /work/aarch64-oe-linux/python3/3.5.3-r1.0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
python3-3.5.3: This /work/armv5te-oe-linux-gnueabi/python3/3.5.3-r1.0/pseudo/pseudo.log indicates 5 errors [qa_pseudo]
python3-3.5.3: This /work/core2-64-oe-linux/python3/3.5.3-r1.0/pseudo/pseudo.log indicates 7 errors [qa_pseudo]
python3-alembic-0.9.7: This /work/aarch64-oe-linux/python3-alembic/0.9.7-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
python3-alembic-0.9.7: This /work/core2-64-oe-linux/python3-alembic/0.9.7-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
python3-asn1crypto-0.24.0: This /work/core2-64-oe-linux/python3-asn1crypto/0.24.0-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
python3-attrs-17.4.0: This /work/core2-64-oe-linux/python3-attrs/17.4.0-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
python3-automat-0.6.0: This /work/core2-64-oe-linux/python3-automat/0.6.0-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
python3-blivetgui-2.1.5: This /work/i586-oe-linux-musl/python3-blivetgui/2.1.5-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
python3-chardet-3.0.4: This /work/aarch64-oe-linux/python3-chardet/3.0.4-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
python3-django-1.11.9: This /work/aarch64-oe-linux/python3-django/1.11.9-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
python3-django-1.11.9: This /work/core2-64-oe-linux/python3-django/1.11.9-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
python3-greenlet-0.4.12: This /work/armv5te-oe-linux-gnueabi/python3-greenlet/0.4.12-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
python3-mako-1.0.7: This /work/armv5te-oe-linux-gnueabi/python3-mako/1.0.7-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
python3-nose-1.3.7: This /work/core2-64-oe-linux/python3-nose/1.3.7-r0/pseudo/pseudo.log indicates 7 errors [qa_pseudo]
python3-pip-9.0.1: This /work/i586-oe-linux-musl/python3-pip/9.0.1-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
python3-pycryptodome-3.4.7: This /work/i586-oe-linux-musl/python3-pycryptodome/3.4.7-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
python3-pyjwt-1.5.3: This /work/i586-oe-linux-musl/python3-pyjwt/1.5.3-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
python3-pykickstart-2.35: This /work/aarch64-oe-linux/python3-pykickstart/2.35-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
python3-pykickstart-2.35: This /work/core2-64-oe-linux/python3-pykickstart/2.35-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
python3-pylint-1.8.1: This /work/aarch64-oe-linux/python3-pylint/1.8.1-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
python3-pylint-1.8.1: This /work/armv5te-oe-linux-gnueabi/python3-pylint/1.8.1-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
python3-pylint-1.8.1: This /work/core2-64-oe-linux/python3-pylint/1.8.1-r0/pseudo/pseudo.log indicates 7 errors [qa_pseudo]
python3-pyserial-3.4: This /work/core2-64-oe-linux/python3-pyserial/3.4-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
python3-pyserial-3.4: This /work/i586-oe-linux-musl/python3-pyserial/3.4-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
python3-pytest-3.3.2: This /work/aarch64-oe-linux/python3-pytest/3.3.2-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
python3-pytest-runner-3.0: This /work/armv5te-oe-linux-gnueabi/python3-pytest-runner/3.0-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
python3-setuptools-38.2.5: This /work/armv5te-oe-linux-gnueabi/python3-setuptools/38.2.5-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
python3-simplejson-3.13.2: This /work/armv5te-oe-linux-gnueabi/python3-simplejson/3.13.2-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
python3-twisted-17.9.0: This /work/i586-oe-linux-musl/python3-twisted/17.9.0-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
python3-webencodings-0.5.1: This /work/aarch64-oe-linux/python3-webencodings/0.5.1-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
python-alembic-0.9.7: This /work/armv5te-oe-linux-gnueabi/python-alembic/0.9.7-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
python-automat-0.6.0: This /work/aarch64-oe-linux/python-automat/0.6.0-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
python-automat-0.6.0: This /work/armv5te-oe-linux-gnueabi/python-automat/0.6.0-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
python-cpuset-1.5.7: This /work/core2-64-oe-linux/python-cpuset/1.5.7-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
python-cpuset-1.5.7: This /work/i586-oe-linux-musl/python-cpuset/1.5.7-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
python-cryptography-vectors-2.1.4: This /work/armv5te-oe-linux-gnueabi/python-cryptography-vectors/2.1.4-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
python-cson-git: This /work/aarch64-oe-linux/python-cson/git-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
python-cython-0.27.3: This /work/core2-64-oe-linux/python-cython/0.27.3-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
python-django-1.11.9: This /work/armv5te-oe-linux-gnueabi/python-django/1.11.9-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
python-django-1.11.9: This /work/i586-oe-linux-musl/python-django/1.11.9-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
python-docutils-0.14rc2: This /work/core2-64-oe-linux/python-docutils/0.14rc2-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
python-future-0.16.0: This /work/armv5te-oe-linux-gnueabi/python-future/0.16.0-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
python-gevent-1.2.2: This /work/aarch64-oe-linux/python-gevent/1.2.2-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
python-gevent-1.2.2: This /work/i586-oe-linux-musl/python-gevent/1.2.2-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
python-imaging-1.1.7: This /work/armv5te-oe-linux-gnueabi/python-imaging/1.1.7-r5/pseudo/pseudo.log indicates 5 errors [qa_pseudo]
python-jsonpointer-1.14: This /work/core2-64-oe-linux/python-jsonpointer/1.14-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
python-jsonschema-2.6.0: This /work/core2-64-oe-linux/python-jsonschema/2.6.0-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
python-mako-1.0.7: This /work/core2-64-oe-linux/python-mako/1.0.7-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
python-netaddr-0.7.19: This /work/armv5te-oe-linux-gnueabi/python-netaddr/0.7.19-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
python-netaddr-0.7.19: This /work/core2-64-oe-linux/python-netaddr/0.7.19-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
python-nose-1.3.7: This /work/core2-64-oe-linux/python-nose/1.3.7-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
python-numpy-1.13.1: This /work/core2-64-oe-linux/python-numpy/1.13.1-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
python-pandas-0.22.0: This /work/core2-64-oe-linux/python-pandas/0.22.0-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
python-pbr-3.1.1: This /work/armv5te-oe-linux-gnueabi/python-pbr/3.1.1-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
python-pip-9.0.1: This /work/armv5te-oe-linux-gnueabi/python-pip/9.0.1-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
python-pycrypto-2.6.1: This /work/core2-64-oe-linux/python-pycrypto/2.6.1-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
python-pycryptodome-3.4.7: This /work/aarch64-oe-linux/python-pycryptodome/3.4.7-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
python-pycryptodome-3.4.7: This /work/armv5te-oe-linux-gnueabi/python-pycryptodome/3.4.7-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
python-pyflakes-1.6.0: This /work/i586-oe-linux-musl/python-pyflakes/1.6.0-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
python-pyjwt-1.5.3: This /work/armv5te-oe-linux-gnueabi/python-pyjwt/1.5.3-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
python-pyjwt-1.5.3: This /work/i586-oe-linux-musl/python-pyjwt/1.5.3-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
python-pylint-1.8.1: This /work/aarch64-oe-linux/python-pylint/1.8.1-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
python-pylint-1.8.1: This /work/armv5te-oe-linux-gnueabi/python-pylint/1.8.1-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
python-pylint-1.8.1: This /work/core2-64-oe-linux/python-pylint/1.8.1-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
python-pylint-1.8.1: This /work/i586-oe-linux-musl/python-pylint/1.8.1-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
python-pyrex-0.9.9: This /work/i586-oe-linux-musl/python-pyrex/0.9.9-r4/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
python-pyserial-3.4: This /work/core2-64-oe-linux/python-pyserial/3.4-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
python-pytest-3.3.2: This /work/i586-oe-linux-musl/python-pytest/3.3.2-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
python-scons-3.0.1: This /work/aarch64-oe-linux/python-scons/3.0.1-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
python-setuptools-38.2.5: This /work/core2-64-oe-linux/python-setuptools/38.2.5-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
python-snakefood-1.4: This /work/core2-64-oe-linux/python-snakefood/1.4-r0/pseudo/pseudo.log indicates 11 errors [qa_pseudo]
python-vobject-0.9.5: This /work/armv5te-oe-linux-gnueabi/python-vobject/0.9.5-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
python-vobject-0.9.5: This /work/i586-oe-linux-musl/python-vobject/0.9.5-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
python-xlrd-1.1.0: This /work/core2-64-oe-linux/python-xlrd/1.1.0-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
pywbem-0.8.0: This /work/armv5te-oe-linux-gnueabi/pywbem/0.8.0-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
qt3d-5.10.0+gitAUTOINC+7bd57d2218: This /work/aarch64-oe-linux/qt3d/5.10.0+gitAUTOINC+7bd57d2218-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
qt3d-5.10.0+gitAUTOINC+7bd57d2218: This /work/armv5te-oe-linux-gnueabi/qt3d/5.10.0+gitAUTOINC+7bd57d2218-r0/pseudo/pseudo.log indicates 18 errors [qa_pseudo]
qt3d-5.10.0+gitAUTOINC+7bd57d2218: This /work/core2-64-oe-linux/qt3d/5.10.0+gitAUTOINC+7bd57d2218-r0/pseudo/pseudo.log indicates 15 errors [qa_pseudo]
qt3d-5.10.0+gitAUTOINC+7bd57d2218: This /work/i586-oe-linux-musl/qt3d/5.10.0+gitAUTOINC+7bd57d2218-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
qt5-creator-3.5.1: This /work/aarch64-oe-linux/qt5-creator/3.5.1-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
qt5everywheredemo-1.0: This /work/armv5te-oe-linux-gnueabi/qt5everywheredemo/1.0-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
qtbase-5.10.0+gitAUTOINC+50117d738a: This /work/aarch64-oe-linux/qtbase/5.10.0+gitAUTOINC+50117d738a-r0/pseudo/pseudo.log indicates 16 errors [qa_pseudo]
qtbase-5.10.0+gitAUTOINC+50117d738a: This /work/armv5te-oe-linux-gnueabi/qtbase/5.10.0+gitAUTOINC+50117d738a-r0/pseudo/pseudo.log indicates 15 errors [qa_pseudo]
qtbase-5.10.0+gitAUTOINC+50117d738a: This /work/core2-64-oe-linux/qtbase/5.10.0+gitAUTOINC+50117d738a-r0/pseudo/pseudo.log indicates 24 errors [qa_pseudo]
qtbase-5.10.0+gitAUTOINC+50117d738a: This /work/i586-oe-linux-musl/qtbase/5.10.0+gitAUTOINC+50117d738a-r0/pseudo/pseudo.log indicates 14 errors [qa_pseudo]
qtcharts-5.10.0+gitAUTOINC+6a9606270e: This /work/aarch64-oe-linux/qtcharts/5.10.0+gitAUTOINC+6a9606270e-r0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
qtcharts-5.10.0+gitAUTOINC+6a9606270e: This /work/armv5te-oe-linux-gnueabi/qtcharts/5.10.0+gitAUTOINC+6a9606270e-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
qtcharts-5.10.0+gitAUTOINC+6a9606270e: This /work/i586-oe-linux-musl/qtcharts/5.10.0+gitAUTOINC+6a9606270e-r0/pseudo/pseudo.log indicates 11 errors [qa_pseudo]
qtconnectivity-5.10.0+gitAUTOINC+bb9b8af08b: This /work/aarch64-oe-linux/qtconnectivity/5.10.0+gitAUTOINC+bb9b8af08b-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
qtconnectivity-5.10.0+gitAUTOINC+bb9b8af08b: This /work/armv5te-oe-linux-gnueabi/qtconnectivity/5.10.0+gitAUTOINC+bb9b8af08b-r0/pseudo/pseudo.log indicates 11 errors [qa_pseudo]
qtconnectivity-5.10.0+gitAUTOINC+bb9b8af08b: This /work/core2-64-oe-linux/qtconnectivity/5.10.0+gitAUTOINC+bb9b8af08b-r0/pseudo/pseudo.log indicates 14 errors [qa_pseudo]
qtconnectivity-5.10.0+gitAUTOINC+bb9b8af08b: This /work/i586-oe-linux-musl/qtconnectivity/5.10.0+gitAUTOINC+bb9b8af08b-r0/pseudo/pseudo.log indicates 11 errors [qa_pseudo]
qtdatavis3d-5.10.0+gitAUTOINC+d2abb20082: This /work/aarch64-oe-linux/qtdatavis3d/5.10.0+gitAUTOINC+d2abb20082-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
qtdatavis3d-5.10.0+gitAUTOINC+d2abb20082: This /work/armv5te-oe-linux-gnueabi/qtdatavis3d/5.10.0+gitAUTOINC+d2abb20082-r0/pseudo/pseudo.log indicates 11 errors [qa_pseudo]
qtdatavis3d-5.10.0+gitAUTOINC+d2abb20082: This /work/i586-oe-linux-musl/qtdatavis3d/5.10.0+gitAUTOINC+d2abb20082-r0/pseudo/pseudo.log indicates 19 errors [qa_pseudo]
qtdeclarative-5.10.0+gitAUTOINC+dac71f3d6f: This /work/armv5te-oe-linux-gnueabi/qtdeclarative/5.10.0+gitAUTOINC+dac71f3d6f-r0/pseudo/pseudo.log indicates 24 errors [qa_pseudo]
qtdeclarative-5.10.0+gitAUTOINC+dac71f3d6f: This /work/core2-64-oe-linux/qtdeclarative/5.10.0+gitAUTOINC+dac71f3d6f-r0/pseudo/pseudo.log indicates 19 errors [qa_pseudo]
qtdeclarative-5.10.0+gitAUTOINC+dac71f3d6f: This /work/i586-oe-linux-musl/qtdeclarative/5.10.0+gitAUTOINC+dac71f3d6f-r0/pseudo/pseudo.log indicates 24 errors [qa_pseudo]
qtenginio-5.10.0+gitAUTOINC+23603a3b08: This /work/aarch64-oe-linux/qtenginio/5.10.0+gitAUTOINC+23603a3b08-r0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
qtenginio-5.10.0+gitAUTOINC+23603a3b08: This /work/armv5te-oe-linux-gnueabi/qtenginio/5.10.0+gitAUTOINC+23603a3b08-r0/pseudo/pseudo.log indicates 11 errors [qa_pseudo]
qtenginio-5.10.0+gitAUTOINC+23603a3b08: This /work/core2-64-oe-linux/qtenginio/5.10.0+gitAUTOINC+23603a3b08-r0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
qtenginio-5.10.0+gitAUTOINC+23603a3b08: This /work/i586-oe-linux-musl/qtenginio/5.10.0+gitAUTOINC+23603a3b08-r0/pseudo/pseudo.log indicates 11 errors [qa_pseudo]
qtgamepad-5.10.0+gitAUTOINC+b505116ee4: This /work/aarch64-oe-linux/qtgamepad/5.10.0+gitAUTOINC+b505116ee4-r0/pseudo/pseudo.log indicates 8 errors [qa_pseudo]
qtgamepad-5.10.0+gitAUTOINC+b505116ee4: This /work/armv5te-oe-linux-gnueabi/qtgamepad/5.10.0+gitAUTOINC+b505116ee4-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
qtgamepad-5.10.0+gitAUTOINC+b505116ee4: This /work/core2-64-oe-linux/qtgamepad/5.10.0+gitAUTOINC+b505116ee4-r0/pseudo/pseudo.log indicates 14 errors [qa_pseudo]
qtgamepad-5.10.0+gitAUTOINC+b505116ee4: This /work/i586-oe-linux-musl/qtgamepad/5.10.0+gitAUTOINC+b505116ee4-r0/pseudo/pseudo.log indicates 11 errors [qa_pseudo]
qtgraphicaleffects-5.10.0+gitAUTOINC+5ca1c00b33: This /work/aarch64-oe-linux/qtgraphicaleffects/5.10.0+gitAUTOINC+5ca1c00b33-r0/pseudo/pseudo.log indicates 18 errors [qa_pseudo]
qtlocation-5.10.0+gitAUTOINC+919bbf503d_572822c8ca: This /work/armv5te-oe-linux-gnueabi/qtlocation/5.10.0+gitAUTOINC+919bbf503d_572822c8ca-r0/pseudo/pseudo.log indicates 11 errors [qa_pseudo]
qtlocation-5.10.0+gitAUTOINC+919bbf503d_572822c8ca: This /work/core2-64-oe-linux/qtlocation/5.10.0+gitAUTOINC+919bbf503d_572822c8ca-r0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
qtlocation-5.10.0+gitAUTOINC+919bbf503d_572822c8ca: This /work/i586-oe-linux-musl/qtlocation/5.10.0+gitAUTOINC+919bbf503d_572822c8ca-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
qtmqtt-5.10.0+gitAUTOINC+45d87f0d92: This /work/aarch64-oe-linux/qtmqtt/5.10.0+gitAUTOINC+45d87f0d92-r0/pseudo/pseudo.log indicates 14 errors [qa_pseudo]
qtmqtt-5.10.0+gitAUTOINC+45d87f0d92: This /work/armv5te-oe-linux-gnueabi/qtmqtt/5.10.0+gitAUTOINC+45d87f0d92-r0/pseudo/pseudo.log indicates 11 errors [qa_pseudo]
qtmqtt-5.10.0+gitAUTOINC+45d87f0d92: This /work/core2-64-oe-linux/qtmqtt/5.10.0+gitAUTOINC+45d87f0d92-r0/pseudo/pseudo.log indicates 7 errors [qa_pseudo]
qtmqtt-5.10.0+gitAUTOINC+45d87f0d92: This /work/i586-oe-linux-musl/qtmqtt/5.10.0+gitAUTOINC+45d87f0d92-r0/pseudo/pseudo.log indicates 5 errors [qa_pseudo]
qtmultimedia-5.10.0+gitAUTOINC+3598915a36: This /work/aarch64-oe-linux/qtmultimedia/5.10.0+gitAUTOINC+3598915a36-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
qtmultimedia-5.10.0+gitAUTOINC+3598915a36: This /work/armv5te-oe-linux-gnueabi/qtmultimedia/5.10.0+gitAUTOINC+3598915a36-r0/pseudo/pseudo.log indicates 11 errors [qa_pseudo]
qtmultimedia-5.10.0+gitAUTOINC+3598915a36: This /work/core2-64-oe-linux/qtmultimedia/5.10.0+gitAUTOINC+3598915a36-r0/pseudo/pseudo.log indicates 14 errors [qa_pseudo]
qtmultimedia-5.10.0+gitAUTOINC+3598915a36: This /work/i586-oe-linux-musl/qtmultimedia/5.10.0+gitAUTOINC+3598915a36-r0/pseudo/pseudo.log indicates 18 errors [qa_pseudo]
qtnetworkauth-5.10.0+gitAUTOINC+febebfb6f0: This /work/aarch64-oe-linux/qtnetworkauth/5.10.0+gitAUTOINC+febebfb6f0-r0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
qtnetworkauth-5.10.0+gitAUTOINC+febebfb6f0: This /work/armv5te-oe-linux-gnueabi/qtnetworkauth/5.10.0+gitAUTOINC+febebfb6f0-r0/pseudo/pseudo.log indicates 18 errors [qa_pseudo]
qtnetworkauth-5.10.0+gitAUTOINC+febebfb6f0: This /work/core2-64-oe-linux/qtnetworkauth/5.10.0+gitAUTOINC+febebfb6f0-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
qtnetworkauth-5.10.0+gitAUTOINC+febebfb6f0: This /work/i586-oe-linux-musl/qtnetworkauth/5.10.0+gitAUTOINC+febebfb6f0-r0/pseudo/pseudo.log indicates 11 errors [qa_pseudo]
qtquick1-5.10.0+gitAUTOINC+b2476dcd53: This /work/aarch64-oe-linux/qtquick1/5.10.0+gitAUTOINC+b2476dcd53-r0/pseudo/pseudo.log indicates 18 errors [qa_pseudo]
qtquick1-5.10.0+gitAUTOINC+b2476dcd53: This /work/armv5te-oe-linux-gnueabi/qtquick1/5.10.0+gitAUTOINC+b2476dcd53-r0/pseudo/pseudo.log indicates 17 errors [qa_pseudo]
qtquick1-5.10.0+gitAUTOINC+b2476dcd53: This /work/core2-64-oe-linux/qtquick1/5.10.0+gitAUTOINC+b2476dcd53-r0/pseudo/pseudo.log indicates 20 errors [qa_pseudo]
qtquick1-5.10.0+gitAUTOINC+b2476dcd53: This /work/i586-oe-linux-musl/qtquick1/5.10.0+gitAUTOINC+b2476dcd53-r0/pseudo/pseudo.log indicates 17 errors [qa_pseudo]
qtquickcontrols2-5.10.0+gitAUTOINC+1265fef3b2: This /work/aarch64-oe-linux/qtquickcontrols2/5.10.0+gitAUTOINC+1265fef3b2-r0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
qtquickcontrols2-5.10.0+gitAUTOINC+1265fef3b2: This /work/armv5te-oe-linux-gnueabi/qtquickcontrols2/5.10.0+gitAUTOINC+1265fef3b2-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
qtquickcontrols2-5.10.0+gitAUTOINC+1265fef3b2: This /work/core2-64-oe-linux/qtquickcontrols2/5.10.0+gitAUTOINC+1265fef3b2-r0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
qtquickcontrols2-5.10.0+gitAUTOINC+1265fef3b2: This /work/i586-oe-linux-musl/qtquickcontrols2/5.10.0+gitAUTOINC+1265fef3b2-r0/pseudo/pseudo.log indicates 11 errors [qa_pseudo]
qtquickcontrols-5.10.0+gitAUTOINC+a749525164: This /work/core2-64-oe-linux/qtquickcontrols/5.10.0+gitAUTOINC+a749525164-r0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
qtremoteobjects-5.10.0+gitAUTOINC+e6eb6ab12d: This /work/aarch64-oe-linux/qtremoteobjects/5.10.0+gitAUTOINC+e6eb6ab12d-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
qtremoteobjects-5.10.0+gitAUTOINC+e6eb6ab12d: This /work/armv5te-oe-linux-gnueabi/qtremoteobjects/5.10.0+gitAUTOINC+e6eb6ab12d-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
qtremoteobjects-5.10.0+gitAUTOINC+e6eb6ab12d: This /work/core2-64-oe-linux/qtremoteobjects/5.10.0+gitAUTOINC+e6eb6ab12d-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
qtremoteobjects-5.10.0+gitAUTOINC+e6eb6ab12d: This /work/i586-oe-linux-musl/qtremoteobjects/5.10.0+gitAUTOINC+e6eb6ab12d-r0/pseudo/pseudo.log indicates 14 errors [qa_pseudo]
qtscript-5.10.0+gitAUTOINC+0bb3f3017f: This /work/aarch64-oe-linux/qtscript/5.10.0+gitAUTOINC+0bb3f3017f-r0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
qtscript-5.10.0+gitAUTOINC+0bb3f3017f: This /work/armv5e-oe-linux-gnueabi/qtscript/5.10.0+gitAUTOINC+0bb3f3017f-r0/pseudo/pseudo.log indicates 11 errors [qa_pseudo]
qtscript-5.10.0+gitAUTOINC+0bb3f3017f: This /work/core2-64-oe-linux/qtscript/5.10.0+gitAUTOINC+0bb3f3017f-r0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
qtscript-5.10.0+gitAUTOINC+0bb3f3017f: This /work/i586-oe-linux-musl/qtscript/5.10.0+gitAUTOINC+0bb3f3017f-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
qtscxml-5.10.0+gitAUTOINC+bbf3be4679: This /work/aarch64-oe-linux/qtscxml/5.10.0+gitAUTOINC+bbf3be4679-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
qtscxml-5.10.0+gitAUTOINC+bbf3be4679: This /work/armv5te-oe-linux-gnueabi/qtscxml/5.10.0+gitAUTOINC+bbf3be4679-r0/pseudo/pseudo.log indicates 11 errors [qa_pseudo]
qtscxml-5.10.0+gitAUTOINC+bbf3be4679: This /work/core2-64-oe-linux/qtscxml/5.10.0+gitAUTOINC+bbf3be4679-r0/pseudo/pseudo.log indicates 16 errors [qa_pseudo]
qtscxml-5.10.0+gitAUTOINC+bbf3be4679: This /work/i586-oe-linux-musl/qtscxml/5.10.0+gitAUTOINC+bbf3be4679-r0/pseudo/pseudo.log indicates 11 errors [qa_pseudo]
qtsensors-5.10.0+gitAUTOINC+7ae7dc3256: This /work/aarch64-oe-linux/qtsensors/5.10.0+gitAUTOINC+7ae7dc3256-r0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
qtsensors-5.10.0+gitAUTOINC+7ae7dc3256: This /work/armv5te-oe-linux-gnueabi/qtsensors/5.10.0+gitAUTOINC+7ae7dc3256-r0/pseudo/pseudo.log indicates 17 errors [qa_pseudo]
qtsensors-5.10.0+gitAUTOINC+7ae7dc3256: This /work/core2-64-oe-linux/qtsensors/5.10.0+gitAUTOINC+7ae7dc3256-r0/pseudo/pseudo.log indicates 11 errors [qa_pseudo]
qtsensors-5.10.0+gitAUTOINC+7ae7dc3256: This /work/i586-oe-linux-musl/qtsensors/5.10.0+gitAUTOINC+7ae7dc3256-r0/pseudo/pseudo.log indicates 11 errors [qa_pseudo]
qtserialbus-5.10.0+gitAUTOINC+f25ddea7b1: This /work/aarch64-oe-linux/qtserialbus/5.10.0+gitAUTOINC+f25ddea7b1-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
qtserialbus-5.10.0+gitAUTOINC+f25ddea7b1: This /work/armv5te-oe-linux-gnueabi/qtserialbus/5.10.0+gitAUTOINC+f25ddea7b1-r0/pseudo/pseudo.log indicates 11 errors [qa_pseudo]
qtserialbus-5.10.0+gitAUTOINC+f25ddea7b1: This /work/core2-64-oe-linux/qtserialbus/5.10.0+gitAUTOINC+f25ddea7b1-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
qtserialbus-5.10.0+gitAUTOINC+f25ddea7b1: This /work/i586-oe-linux-musl/qtserialbus/5.10.0+gitAUTOINC+f25ddea7b1-r0/pseudo/pseudo.log indicates 11 errors [qa_pseudo]
qtserialport-5.10.0+gitAUTOINC+c7d99464c6: This /work/core2-64-oe-linux/qtserialport/5.10.0+gitAUTOINC+c7d99464c6-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
qtserialport-5.10.0+gitAUTOINC+c7d99464c6: This /work/i586-oe-linux-musl/qtserialport/5.10.0+gitAUTOINC+c7d99464c6-r0/pseudo/pseudo.log indicates 5 errors [qa_pseudo]
qtsvg-5.10.0+gitAUTOINC+984ba69772: This /work/aarch64-oe-linux/qtsvg/5.10.0+gitAUTOINC+984ba69772-r0/pseudo/pseudo.log indicates 14 errors [qa_pseudo]
qtsvg-5.10.0+gitAUTOINC+984ba69772: This /work/armv5te-oe-linux-gnueabi/qtsvg/5.10.0+gitAUTOINC+984ba69772-r0/pseudo/pseudo.log indicates 14 errors [qa_pseudo]
qtsvg-5.10.0+gitAUTOINC+984ba69772: This /work/core2-64-oe-linux/qtsvg/5.10.0+gitAUTOINC+984ba69772-r0/pseudo/pseudo.log indicates 17 errors [qa_pseudo]
qtsvg-5.10.0+gitAUTOINC+984ba69772: This /work/i586-oe-linux-musl/qtsvg/5.10.0+gitAUTOINC+984ba69772-r0/pseudo/pseudo.log indicates 11 errors [qa_pseudo]
qtsystems-5.10.0+gitAUTOINC+ca54870ffd: This /work/aarch64-oe-linux/qtsystems/5.10.0+gitAUTOINC+ca54870ffd-r0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
qtsystems-5.10.0+gitAUTOINC+ca54870ffd: This /work/armv5te-oe-linux-gnueabi/qtsystems/5.10.0+gitAUTOINC+ca54870ffd-r0/pseudo/pseudo.log indicates 11 errors [qa_pseudo]
qtsystems-5.10.0+gitAUTOINC+ca54870ffd: This /work/core2-64-oe-linux/qtsystems/5.10.0+gitAUTOINC+ca54870ffd-r0/pseudo/pseudo.log indicates 14 errors [qa_pseudo]
qtsystems-5.10.0+gitAUTOINC+ca54870ffd: This /work/i586-oe-linux-musl/qtsystems/5.10.0+gitAUTOINC+ca54870ffd-r0/pseudo/pseudo.log indicates 11 errors [qa_pseudo]
qttools-5.10.0+gitAUTOINC+3ce89dc37d: This /work/aarch64-oe-linux/qttools/5.10.0+gitAUTOINC+3ce89dc37d-r0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
qttools-5.10.0+gitAUTOINC+3ce89dc37d: This /work/armv5te-oe-linux-gnueabi/qttools/5.10.0+gitAUTOINC+3ce89dc37d-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
qttools-5.10.0+gitAUTOINC+3ce89dc37d: This /work/core2-64-oe-linux/qttools/5.10.0+gitAUTOINC+3ce89dc37d-r0/pseudo/pseudo.log indicates 14 errors [qa_pseudo]
qttools-5.10.0+gitAUTOINC+3ce89dc37d: This /work/i586-oe-linux-musl/qttools/5.10.0+gitAUTOINC+3ce89dc37d-r0/pseudo/pseudo.log indicates 11 errors [qa_pseudo]
qttranslations-5.10.0+gitAUTOINC+f4b0f1684a: This /work/core2-64-oe-linux/qttranslations/5.10.0+gitAUTOINC+f4b0f1684a-r0/pseudo/pseudo.log indicates 7 errors [qa_pseudo]
qtvirtualkeyboard-5.10.0+gitAUTOINC+8546475dd5: This /work/i586-oe-linux-musl/qtvirtualkeyboard/5.10.0+gitAUTOINC+8546475dd5-r0/pseudo/pseudo.log indicates 16 errors [qa_pseudo]
qtwayland-5.10.0+gitAUTOINC+1a457a9dc9: This /work/aarch64-oe-linux/qtwayland/5.10.0+gitAUTOINC+1a457a9dc9-r0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
qtwayland-5.10.0+gitAUTOINC+1a457a9dc9: This /work/armv5te-oe-linux-gnueabi/qtwayland/5.10.0+gitAUTOINC+1a457a9dc9-r0/pseudo/pseudo.log indicates 11 errors [qa_pseudo]
qtwayland-5.10.0+gitAUTOINC+1a457a9dc9: This /work/core2-64-oe-linux/qtwayland/5.10.0+gitAUTOINC+1a457a9dc9-r0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
qtwayland-5.10.0+gitAUTOINC+1a457a9dc9: This /work/i586-oe-linux-musl/qtwayland/5.10.0+gitAUTOINC+1a457a9dc9-r0/pseudo/pseudo.log indicates 11 errors [qa_pseudo]
qtwebchannel-5.10.0+gitAUTOINC+acb01cb27b: This /work/aarch64-oe-linux/qtwebchannel/5.10.0+gitAUTOINC+acb01cb27b-r0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
qtwebchannel-5.10.0+gitAUTOINC+acb01cb27b: This /work/armv5te-oe-linux-gnueabi/qtwebchannel/5.10.0+gitAUTOINC+acb01cb27b-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
qtwebchannel-5.10.0+gitAUTOINC+acb01cb27b: This /work/core2-64-oe-linux/qtwebchannel/5.10.0+gitAUTOINC+acb01cb27b-r0/pseudo/pseudo.log indicates 16 errors [qa_pseudo]
qtwebchannel-5.10.0+gitAUTOINC+acb01cb27b: This /work/i586-oe-linux-musl/qtwebchannel/5.10.0+gitAUTOINC+acb01cb27b-r0/pseudo/pseudo.log indicates 11 errors [qa_pseudo]
qtwebengine-5.10.0+gitAUTOINC+efa6d3f0d3_e36dcec23b: This /work/aarch64-oe-linux/qtwebengine/5.10.0+gitAUTOINC+efa6d3f0d3_e36dcec23b-r0/pseudo/pseudo.log indicates 36 errors [qa_pseudo]
qtwebengine-5.10.0+gitAUTOINC+efa6d3f0d3_e36dcec23b: This /work/core2-64-oe-linux/qtwebengine/5.10.0+gitAUTOINC+efa6d3f0d3_e36dcec23b-r0/pseudo/pseudo.log indicates 36 errors [qa_pseudo]
qtwebengine-5.10.0+gitAUTOINC+efa6d3f0d3_e36dcec23b: This /work/i586-oe-linux-musl/qtwebengine/5.10.0+gitAUTOINC+efa6d3f0d3_e36dcec23b-r0/pseudo/pseudo.log indicates 33 errors [qa_pseudo]
qtwebkit-5.10.0+gitAUTOINC+97c4a80a12: This /work/armv5e-oe-linux-gnueabi/qtwebkit/5.10.0+gitAUTOINC+97c4a80a12-r0/pseudo/pseudo.log indicates 11 errors [qa_pseudo]
qtwebkit-5.10.0+gitAUTOINC+97c4a80a12: This /work/core2-64-oe-linux/qtwebkit/5.10.0+gitAUTOINC+97c4a80a12-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
qtwebkit-5.10.0+gitAUTOINC+97c4a80a12: This /work/i586-oe-linux-musl/qtwebkit/5.10.0+gitAUTOINC+97c4a80a12-r0/pseudo/pseudo.log indicates 30 errors [qa_pseudo]
qtwebkit-examples-5.10.0+gitAUTOINC+a24c780b60: This /work/aarch64-oe-linux/qtwebkit-examples/5.10.0+gitAUTOINC+a24c780b60-r0/pseudo/pseudo.log indicates 14 errors [qa_pseudo]
qtwebkit-examples-5.10.0+gitAUTOINC+a24c780b60: This /work/armv5te-oe-linux-gnueabi/qtwebkit-examples/5.10.0+gitAUTOINC+a24c780b60-r0/pseudo/pseudo.log indicates 11 errors [qa_pseudo]
qtwebkit-examples-5.10.0+gitAUTOINC+a24c780b60: This /work/core2-64-oe-linux/qtwebkit-examples/5.10.0+gitAUTOINC+a24c780b60-r0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
qtwebkit-examples-5.10.0+gitAUTOINC+a24c780b60: This /work/i586-oe-linux-musl/qtwebkit-examples/5.10.0+gitAUTOINC+a24c780b60-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
qtwebsockets-5.10.0+gitAUTOINC+0e4b43383d: This /work/aarch64-oe-linux/qtwebsockets/5.10.0+gitAUTOINC+0e4b43383d-r0/pseudo/pseudo.log indicates 15 errors [qa_pseudo]
qtwebsockets-5.10.0+gitAUTOINC+0e4b43383d: This /work/armv5te-oe-linux-gnueabi/qtwebsockets/5.10.0+gitAUTOINC+0e4b43383d-r0/pseudo/pseudo.log indicates 11 errors [qa_pseudo]
qtwebsockets-5.10.0+gitAUTOINC+0e4b43383d: This /work/core2-64-oe-linux/qtwebsockets/5.10.0+gitAUTOINC+0e4b43383d-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
qtwebsockets-5.10.0+gitAUTOINC+0e4b43383d: This /work/i586-oe-linux-musl/qtwebsockets/5.10.0+gitAUTOINC+0e4b43383d-r0/pseudo/pseudo.log indicates 11 errors [qa_pseudo]
qtwebview-5.10.0+gitAUTOINC+54ea23243c: This /work/aarch64-oe-linux/qtwebview/5.10.0+gitAUTOINC+54ea23243c-r0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
qtwebview-5.10.0+gitAUTOINC+54ea23243c: This /work/core2-64-oe-linux/qtwebview/5.10.0+gitAUTOINC+54ea23243c-r0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
qtwebview-5.10.0+gitAUTOINC+54ea23243c: This /work/i586-oe-linux-musl/qtwebview/5.10.0+gitAUTOINC+54ea23243c-r0/pseudo/pseudo.log indicates 11 errors [qa_pseudo]
qtx11extras-5.10.0+gitAUTOINC+33e3fcc1fb: This /work/aarch64-oe-linux/qtx11extras/5.10.0+gitAUTOINC+33e3fcc1fb-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
qtx11extras-5.10.0+gitAUTOINC+33e3fcc1fb: This /work/armv5te-oe-linux-gnueabi/qtx11extras/5.10.0+gitAUTOINC+33e3fcc1fb-r0/pseudo/pseudo.log indicates 5 errors [qa_pseudo]
qtx11extras-5.10.0+gitAUTOINC+33e3fcc1fb: This /work/core2-64-oe-linux/qtx11extras/5.10.0+gitAUTOINC+33e3fcc1fb-r0/pseudo/pseudo.log indicates 7 errors [qa_pseudo]
qtx11extras-5.10.0+gitAUTOINC+33e3fcc1fb: This /work/i586-oe-linux-musl/qtx11extras/5.10.0+gitAUTOINC+33e3fcc1fb-r0/pseudo/pseudo.log indicates 11 errors [qa_pseudo]
qtxmlpatterns-5.10.0+gitAUTOINC+8b831bdb51: This /work/aarch64-oe-linux/qtxmlpatterns/5.10.0+gitAUTOINC+8b831bdb51-r0/pseudo/pseudo.log indicates 18 errors [qa_pseudo]
qtxmlpatterns-5.10.0+gitAUTOINC+8b831bdb51: This /work/core2-64-oe-linux/qtxmlpatterns/5.10.0+gitAUTOINC+8b831bdb51-r0/pseudo/pseudo.log indicates 18 errors [qa_pseudo]
qtxmlpatterns-5.10.0+gitAUTOINC+8b831bdb51: This /work/i586-oe-linux-musl/qtxmlpatterns/5.10.0+gitAUTOINC+8b831bdb51-r0/pseudo/pseudo.log indicates 11 errors [qa_pseudo]
quagga-1.2.2: This /work/aarch64-oe-linux/quagga/1.2.2-r0/pseudo/pseudo.log indicates 14 errors [qa_pseudo]
quagga-1.2.2: This /work/armv5te-oe-linux-gnueabi/quagga/1.2.2-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
quagga-1.2.2: This /work/i586-oe-linux-musl/quagga/1.2.2-r0/pseudo/pseudo.log indicates 13 errors [qa_pseudo]
qwt-qt5-6.1.3: This /work/aarch64-oe-linux/qwt-qt5/6.1.3-r0/pseudo/pseudo.log indicates 15 errors [qa_pseudo]
radvd-2.17: This /work/aarch64-oe-linux/radvd/2.17-r0/pseudo/pseudo.log indicates 7 errors [qa_pseudo]
radvd-2.17: This /work/armv5te-oe-linux-gnueabi/radvd/2.17-r0/pseudo/pseudo.log indicates 11 errors [qa_pseudo]
radvd-2.17: This /work/core2-64-oe-linux/radvd/2.17-r0/pseudo/pseudo.log indicates 7 errors [qa_pseudo]
radvd-2.17: This /work/i586-oe-linux-musl/radvd/2.17-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
readline-7.0: This /work/armv5te-oe-linux-gnueabi/readline/7.0-r0/pseudo/pseudo.log indicates 16 errors [qa_pseudo]
rrdtool-1.6.0: This /work/i586-oe-linux-musl/rrdtool/1.6.0-r0/pseudo/pseudo.log indicates 16 errors [qa_pseudo]
rsyslog-8.29.0: This /work/aarch64-oe-linux/rsyslog/8.29.0-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
rsyslog-8.29.0: This /work/armv5te-oe-linux-gnueabi/rsyslog/8.29.0-r0/pseudo/pseudo.log indicates 11 errors [qa_pseudo]
rsyslog-8.29.0: This /work/core2-64-oe-linux/rsyslog/8.29.0-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
rsyslog-8.29.0: This /work/i586-oe-linux-musl/rsyslog/8.29.0-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
samba-4.7.0: This /work/aarch64-oe-linux/samba/4.7.0-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
samba-4.7.0: This /work/armv5te-oe-linux-gnueabi/samba/4.7.0-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
samba-4.7.0: This /work/core2-64-oe-linux/samba/4.7.0-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
sblim-sfcb-1.4.9: This /work/aarch64-oe-linux/sblim-sfcb/1.4.9-r0/pseudo/pseudo.log indicates 7 errors [qa_pseudo]
sblim-sfcb-1.4.9: This /work/core2-64-oe-linux/sblim-sfcb/1.4.9-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
sblim-sfcb-1.4.9: This /work/i586-oe-linux-musl/sblim-sfcb/1.4.9-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
scrnsaverproto-1.2.2: This /work/aarch64-oe-linux/scrnsaverproto/1_1.2.2-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
scsirastools-1.6.6: This /work/armv5te-oe-linux-gnueabi/scsirastools/1.6.6-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
sed-4.2.2: This /work/aarch64-oe-linux/sed/4.2.2-r0/pseudo/pseudo.log indicates 11 errors [qa_pseudo]
sed-4.2.2: This /work/armv5te-oe-linux-gnueabi/sed/4.2.2-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
sed-4.2.2: This /work/core2-64-oe-linux/sed/4.2.2-r0/pseudo/pseudo.log indicates 5 errors [qa_pseudo]
shadow-4.2.1: This /work/aarch64-oe-linux/shadow/4.2.1-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
shadow-4.2.1: This /work/armv5te-oe-linux-gnueabi/shadow/4.2.1-r0/pseudo/pseudo.log indicates 11 errors [qa_pseudo]
shadow-4.2.1: This /work/core2-64-oe-linux/shadow/4.2.1-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
simple-mtpfs-git: This /work/i586-oe-linux-musl/simple-mtpfs/git-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
spawn-fcgi-1.6.4: This /work/i586-oe-linux-musl/spawn-fcgi/1.6.4-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
squashfs-tools-4.3+gitrAUTOINC+9c1db6d13a: This /work/aarch64-oe-linux/squashfs-tools/4.3+gitrAUTOINC+9c1db6d13a-r0/pseudo/pseudo.log indicates 11 errors [qa_pseudo]
squid-3.5.26: This /work/armv5te-oe-linux-gnueabi/squid/3.5.26-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
squid-3.5.26: This /work/core2-64-oe-linux/squid/3.5.26-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
squid-3.5.26: This /work/i586-oe-linux-musl/squid/3.5.26-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
start-stop-daemon-1.17.25: This /work/core2-64-oe-linux/start-stop-daemon/1.17.25-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
sthttpd-2.27.1: This /work/aarch64-oe-linux/sthttpd/2.27.1-r0/pseudo/pseudo.log indicates 7 errors [qa_pseudo]
sthttpd-2.27.1: This /work/armv5te-oe-linux-gnueabi/sthttpd/2.27.1-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
sthttpd-2.27.1: This /work/core2-64-oe-linux/sthttpd/2.27.1-r0/pseudo/pseudo.log indicates 7 errors [qa_pseudo]
strace-4.19: This /work/aarch64-oe-linux/strace/4.19-r0/pseudo/pseudo.log indicates 14 errors [qa_pseudo]
strace-4.19: This /work/armv5te-oe-linux-gnueabi/strace/4.19-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
streamripper-1.64.6: This /work/armv5te-oe-linux-gnueabi/streamripper/1.64.6-r0/pseudo/pseudo.log indicates 11 errors [qa_pseudo]
swig-3.0.12: This /work/i586-oe-linux-musl/swig/3.0.12-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
systemd-234: This /work/aarch64-oe-linux/systemd/1_234-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
target-sdk-provides-dummy-1.0: This /work/sdk-provides-dummy-target-oe-linux/target-sdk-provides-dummy/1.0-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
tcf-agent-1.4.0+gitAUTOINC+2dddd5f440: This /work/armv5te-oe-linux-gnueabi/tcf-agent/1.4.0+gitAUTOINC+2dddd5f440-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
tcl-8.6.7: This /work/aarch64-oe-linux/tcl/8.6.7-r0/pseudo/pseudo.log indicates 7 errors [qa_pseudo]
tcl-8.6.7: This /work/armv5te-oe-linux-gnueabi/tcl/8.6.7-r0/pseudo/pseudo.log indicates 5 errors [qa_pseudo]
tcp-wrappers-7.6: This /work/aarch64-oe-linux/tcp-wrappers/7.6-r10/pseudo/pseudo.log indicates 11 errors [qa_pseudo]
tftp-hpa-5.2: This /work/aarch64-oe-linux/tftp-hpa/5.2-r0/pseudo/pseudo.log indicates 7 errors [qa_pseudo]
tftp-hpa-5.2: This /work/armv5te-oe-linux-gnueabi/tftp-hpa/5.2-r0/pseudo/pseudo.log indicates 5 errors [qa_pseudo]
tiff-4.0.9: This /work/core2-64-oe-linux/tiff/4.0.9-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
tokyocabinet-1.4.48: This /work/armv5te-oe-linux-gnueabi/tokyocabinet/1.4.48-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
trace-cmd-2.6.2: This /work/armv5te-oe-linux-gnueabi/trace-cmd/2.6.2-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
traceroute-2.1.0: This /work/core2-64-oe-linux/traceroute/2.1.0-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
tumbler-0.2.0: This /work/aarch64-oe-linux/tumbler/0.2.0-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
udisks-1.0.5: This /work/armv5te-oe-linux-gnueabi/udisks/1.0.5-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
ufw-0.33: This /work/aarch64-oe-linux/ufw/0.33-r0/pseudo/pseudo.log indicates 7 errors [qa_pseudo]
ufw-0.33: This /work/core2-64-oe-linux/ufw/0.33-r0/pseudo/pseudo.log indicates 8 errors [qa_pseudo]
uml-utilities-20040406: This /work/armv5te-oe-linux-gnueabi/uml-utilities/20040406-r1/pseudo/pseudo.log indicates 9 errors [qa_pseudo]
upm-1.3.0-gitAUTOINC+106b6c7062: This /work/armv5te-oe-linux-gnueabi/upm/1.3.0-gitAUTOINC+106b6c7062-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
usrsctp-git: This /work/core2-64-oe-linux/usrsctp/git-r0/pseudo/pseudo.log indicates 11 errors [qa_pseudo]
uthash-2.0.2: This /work/i586-oe-linux-musl/uthash/2.0.2-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
util-linux-2.31: This /work/armv5te-oe-linux-gnueabi/util-linux/2.31-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
util-linux-2.31: This /work/core2-64-oe-linux/util-linux/2.31-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
util-linux-2.31: This /work/i586-oe-linux-musl/util-linux/2.31-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
utouch-frame-1.1.2+gitAUTOINC+95363d5a1f: This /work/i586-oe-linux-musl/utouch-frame/1.1.2+gitAUTOINC+95363d5a1f-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
uw-imap-2007f: This /work/armv5te-oe-linux-gnueabi/uw-imap/2007f-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
vlc-2.2.2: This /work/i586-oe-linux-musl/vlc/2.2.2-r0/pseudo/pseudo.log indicates 16 errors [qa_pseudo]
volatile-binds-1.0: This /work/all-oe-linux/volatile-binds/1.0-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
wayland-1.14.0: This /work/aarch64-oe-linux/wayland/1.14.0-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
weston-3.0.0: This /work/i586-oe-linux-musl/weston/3.0.0-r0/pseudo/pseudo.log indicates 16 errors [qa_pseudo]
xdg-utils-1.1.2: This /work/armv5te-oe-linux-gnueabi/xdg-utils/1.1.2-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
xfce4-appfinder-4.13.0: This /work/core2-64-oe-linux/xfce4-appfinder/4.13.0-r0/pseudo/pseudo.log indicates 18 errors [qa_pseudo]
xfce4-panel-4.12.2: This /work/i586-oe-linux-musl/xfce4-panel/4.12.2-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
xfce4-screenshooter-1.9.1: This /work/core2-64-oe-linux/xfce4-screenshooter/1.9.1-r0/pseudo/pseudo.log indicates 16 errors [qa_pseudo]
xfce4-xkb-plugin-0.8.1: This /work/aarch64-oe-linux/xfce4-xkb-plugin/0.8.1-r0/pseudo/pseudo.log indicates 16 errors [qa_pseudo]
xkeyboard-config-2.22: This /work/aarch64-oe-linux/xkeyboard-config/2.22-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
xmag-1.0.5: This /work/i586-oe-linux-musl/xmag/1.0.5-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
xproto-7.0.31: This /work/armv5te-oe-linux-gnueabi/xproto/1_7.0.31-r0/pseudo/pseudo.log indicates 15 errors [qa_pseudo]
xrdp-0.9.4+gitAUTOINC+c295dd61b8: This /work/aarch64-oe-linux/xrdp/0.9.4+gitAUTOINC+c295dd61b8-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
xrdp-0.9.4+gitAUTOINC+c295dd61b8: This /work/armv5te-oe-linux-gnueabi/xrdp/0.9.4+gitAUTOINC+c295dd61b8-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
xrdp-0.9.4+gitAUTOINC+c295dd61b8: This /work/core2-64-oe-linux/xrdp/0.9.4+gitAUTOINC+c295dd61b8-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
xrdp-0.9.4+gitAUTOINC+c295dd61b8: This /work/i586-oe-linux-musl/xrdp/0.9.4+gitAUTOINC+c295dd61b8-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
xsetmode-1.0.0: This /work/aarch64-oe-linux/xsetmode/1.0.0-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
xsp-1.0.0-8: This /work/aarch64-oe-linux/xsp/1.0.0-8-r0/pseudo/pseudo.log indicates 12 errors [qa_pseudo]
zip-3.0: This /work/i586-oe-linux-musl/zip/3.0-r2/pseudo/pseudo.log indicates 10 errors [qa_pseudo]



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
5e5569c lib/oe/package_manager/sdk: Ensure do_populate_sdk_ext and do_populate_sdk repos don't conflict
not included in master yet: 
f16c806 kernel-devicetree.bbclass: Use lowercase names for shell variables
ad333b3 kernel-devicetree.bbclass: Fix and simplify instalation of DTB files
35b243d kernel.bbclass: use the consistent naming schema for initramfs
e2e7e48 kernel.bbclass: move variables for kernel artifacts names to separate bbclass
955b25c report-error: Allow to upload reports automatically
0e8506e buildhistory.bbclass: metadata-revs show repo parent
6f85cf9 metadata-revs: provide more information
2eee562 qemux86: Add identical qemux86copy variant for tests
8ffe2b9 reproducible_build.bbclass: initial support for binary reproducibility
8317343 cpio: provide cpio-replacement-native
587bd64 image_types.bbclass: improve cpio image reproducibility
541a650 rootfs-postcommands.bbclass: support binary reproducibility
94cf7de sstate.bbclass: Do not cause build failures due to setscene errors
95267c7 insane.bbclass: Add do_qa_pseudo function to check for common errors listed in pseudo.log
2037f6f insane.bbclass: use package_qa_handle_error for do_qa_pseudo
e6d03d6 Revert "libepoxy: convert to meson build"
ad02fe7 Revert "json-glib: update to 1.4.2"
93192c3 gettext: fix PACKAGECONFIGs
eca98bc Revert "Revert "json-glib: update to 1.4.2""
12f8eb7 json-glib: fix meson flags for introspection and documentation

== Tested changes (not included in master yet) - meta-openembedded ==
latest upstream commit: 
9eb33e6 xfce-polkit: fix Name/Comment fields in desktop file
not included in master yet: 
3cebd9e iscsi-initiator-utils: CVE-2017-17840
5e38afc drbd-utils: update SRC_URI
4e6de26 wireguard: udpate to 20171221 version
e00f627 postfix: fix generating aliases db files
3e703ef strongswan: add ${PN}-plugin-curve25519 to RDEPENDS
1216c9b ebtables: Remove bashisms
6af343d cim-schema-exper: 2.39.0 -> 2.50.0
e9fea9b dovecot: 2.2.29 -> 2.2.33
c08d728 quagga: 1.2.1 -> 1.2.2
0a9f10b ntimed: use beginline= in LIC_FILES_CHKSUM
783ecec nghttp2: Move to meta-networking
3d292fa ndisc6: need to set USE_NLS="yes" to use gettext.h
daae9e1 fontforge: explicitly depend on gettext-native
2f00b55 net-snmp: remove U64 typedef
e68d828 python-babel: update to version 2.5.3
839faaf python-certifi: update to version 2018.1.18
4b7c9cb python-setuptools-scm: update to version 1.15.7
7c1311d python-mako: add initial recipe for 1.0.7
b83ca2c python-alembic: update to version 0.9.7
9aabc64 libdbd-mysql-perl: upgrade 4.036 -> 4.043
5fa218b libdbi-perl: upgrade 1.636 -> 1.639
46227d1 fluentbit: use Unix Makefiles OECMAKE generator
3d44918 cmpi-bindings: use Unix Makefiles OECMAKE generator
0e6f2f6 mariadb: use Unix Makefiles OECMAKE generator
7589903 Remove deprecated python3-signal from the RDEPENDS
3764856 Remove deprecated python3-re from the RDEPENDS
f61f5d7 Remove deprecated python3-enum from the RDEPENDS
91a936f Remove deprecated python3-argparse from the RDEPENDS
594d12f Remove deprecated ${PYTHON_PN}-importlib from the RDEPENDS
7ba6190 Remove deprecated python3-selectors from the RDEPENDS
6f45a7e Remove deprecated python3-lang from the RDEPENDS
8c30078 Remove deprecated python-readline from the RDEPENDS
6ec5f35 Remove deprecated python3-textutils from the RDEPENDS
ab50792 Remove deprecated python3-subprocess from the RDEPENDS
5e6831d python-smbus: update to version 4.0
dcbce22 libdbd-sqlite-perl: add UPSTREAM_CHECK_REGEX
45e9c8a libencode-perl: add UPSTREAM_CHECK_REGEX
240ed30 libcgi-perl: upgrade 4.36 -> 4.38
5a94997 libextutils-cppguess-perl: upgrade 0.09 -> 0.12
88b4726 libio-socket-ssl-perl: upgrade 1.997 -> 2.052
23e5c15 libmime-types-perl: upgrade 2.13 -> 2.14
641bb70 libmoo-perl: upgrade 2.003002 -> 2.003004
e1f7231 libnet-dns-perl: upgrade 1.13 -> 1.14
13cce9e libnet-ssleay-perl: upgrade 1.81 -> 1.84
7da3313 librole-tiny-perl: upgrade 2.000005 -> 2.000006
2adfcbd libtest-harness-perl: upgrade 3.36 -> 3.39
9b9bc26 libxml-libxml-perl: upgrade 2.0131 -> 2.0132
2816b84 python[3]-systemd: cleanup common content; fix build for musl
aca267b net-snmp: fix the invalid -fdebug-prefix-map
51909e1 uriparser: add
e891e07 python-tornado: update license checksum for whitespace changes

== Tested changes (not included in master yet) - meta-qt5 ==
latest upstream commit: 
3f2f3a0 qtbase: fix pcre PACKAGECONFIG
not included in master yet: 

== Tested changes (not included in master yet) - meta-browser ==
latest upstream commit: 
8cc24ca Merge pull request #86 from rakuco/oz-wl-command-line-args
not included in master yet: 



