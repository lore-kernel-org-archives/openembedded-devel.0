Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f54.google.com (mail-pg0-f54.google.com [74.125.83.54])
	by mail.openembedded.org (Postfix) with ESMTP id 1F096780CD
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 30 Dec 2017 22:33:24 +0000 (UTC)
Received: by mail-pg0-f54.google.com with SMTP id g7so22180956pgs.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 30 Dec 2017 14:33:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=to:from:subject:message-id:date:user-agent:mime-version
	:content-language;
	bh=PE+zn/93EsbCsLQOlM9S4jJqS25Zk1AgU8do4J6BU7g=;
	b=GCbZaaFsMuRZgQ5Whr2YtAQPMzPTxqXRLVqL8xXGz1xH0YrdXEs3cc/khADvC8NxT6
	qmtIEcU96H4v85k3e0FWTIkbMOq638u7JwVxQxvNfADbIU/6W+XZUcksuF+822tkBO/6
	6eWOXjssixOoVB9prAFWcJP+QF5Phr2KwjyHk+RQTuxw7Gfn/6c4U4nCjdEyvPGnc5Gd
	hMRw1mOe0zcVkKWBbP52mlLEzwi9oKN/YtJWOPJwriIF4NqQWTGGUjZ7b4+nPEudwA+d
	0ho4+sS3XkQg/4yTXQIAyWBSvOiCqX3Bg/6cQllGEPS30Ivzah1fbMexoVb8GKEN33tQ
	NCBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:to:from:subject:message-id:date:user-agent
	:mime-version:content-language;
	bh=PE+zn/93EsbCsLQOlM9S4jJqS25Zk1AgU8do4J6BU7g=;
	b=mRt8wxK+RH40LW7e7179PztH7TukS6/rYCggD3zR8vQTjg5+GNNx5/8rVx5GGB7D1w
	6riT4cdcQiX2EUrgp+bS/B0F2TDoy7sBq8clAY9ePOBgn45D1hk26Kb5OptJo5O+fMdv
	mzQmJ26pvcOr1EbCjgiC+hcmfLBwAa0yKKwQya2UVSvSkoDAxH1teZ/hnYAOO8e5evns
	COE4o1ahkA8WwOXATH/MgIeEdVeSULfd+0+1nv5ow3XPAPPyOPIvk6LrQQZzbqoc9w7E
	/x0ffLaPqJfK1jVhi+wO/gOaSOX1FGALLMkbjhsAe5OIKaBE9FgYIYhzZ10bVlPV3af/
	0E4g==
X-Gm-Message-State: AKGB3mJpMokONY97WfpxAlBa4vUlZuKIQXRB6U/A8x3Eah7sGcrPk5fI
	Ldrhx/sSJV1vvH+f3zn/hOoSZA==
X-Google-Smtp-Source: ACJfBosRoJCLqszunlcync+FTXedLiJGrr26ITYTuVgau36ULU+amQOkCWrFTue0XhPdTPE9vbVVDA==
X-Received: by 10.101.78.138 with SMTP id b10mr33345553pgs.36.1514673204300;
	Sat, 30 Dec 2017 14:33:24 -0800 (PST)
Received: from ?IPv6:2601:202:4000:1184:48c6:76be:ab56:bed9?
	([2601:202:4000:1184:48c6:76be:ab56:bed9])
	by smtp.gmail.com with ESMTPSA id
	m25sm86418558pfk.37.2017.12.30.14.33.22
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 30 Dec 2017 14:33:23 -0800 (PST)
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
From: akuster808 <akuster808@gmail.com>
Message-ID: <02a1862d-11eb-db95-d1d1-3c9a612a0024@gmail.com>
Date: Sat, 30 Dec 2017 14:33:21 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.0
MIME-Version: 1.0
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: State of bitbake world, Failed tasks 2017-12-28
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
X-List-Received-Date: Sat, 30 Dec 2017 22:33:25 -0000
Content-Language: en-US
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Last planned build for 2017.

Thanks to all who submit updates, fixes and comments.

Happy New Year Too all.


kind regards,

Armin


==================== REPORT START ================== 

http://www.openembedded.org/wiki/Bitbake_World_Status

== Number of issues - stats ==
{| class='wikitable'
!|Date		     !!colspan='4'|Failed tasks			    !!|Signatures		  !!colspan='15'|QA !!Comment
|-
||		||qemuarm	||qemuarm64	||qemux86	||qemux86_64	||all 	||already-stripped	||libdir	||textrel	||build-deps	||file-rdeps	||version-going-backwards	||host-user-contaminated	||installed-vs-shipped	||unknown-configure-option	||symlink-to-sysroot	||invalid-pkgconfig	||pkgname	||ldflags	||compile-host-path	||qa_pseudo	||	
|-
||2017-12-28	||10	||12	||35	||8	||0	||0		||0		||2		||0		||3		||1420		||1		||1		||0		||0		||0		||0		||0		||0		||9		||	
|}

== Failed tasks 2017-12-28 ==

INFO: jenkins-job.sh-1.8.43 Complete log available at http://logs.nslu2-linux.org/buildlogs/oe/world/sumo/log.report.20171230_093533.log

=== common (7) ===
    * meta-openembedded/meta-gnome/recipes-gnome/eds/evolution-data-server_git.bb:do_compile
    * meta-openembedded/meta-networking/recipes-daemons/keepalived/keepalived_1.3.5.bb:do_configure
    * meta-openembedded/meta-networking/recipes-daemons/postfix/postfix_3.2.2.bb:do_install
    * meta-openembedded/meta-networking/recipes-kernel/wireguard/wireguard-module_0.0.20170810.bb:do_compile
    * meta-openembedded/meta-networking/recipes-support/ntop/ntop_5.0.1.bb:do_configure
    * meta-openembedded/meta-networking/recipes-support/tinyproxy/tinyproxy_1.8.4.bb:do_prepare_recipe_sysroot
    * meta-openembedded/meta-oe/recipes-connectivity/smstools3/smstools3_3.1.21.bb:do_package_qa

=== common-x86 (0) ===

=== qemuarm (3) ===
    * meta-openembedded/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb:do_compile
    * openembedded-core/meta/recipes-core/glibc/glibc-locale_2.26.bb:do_package_qa
    * openembedded-core/meta/recipes-sato/webkit/webkitgtk_2.18.3.bb:do_compile

=== qemuarm64 (5) ===
    * meta-openembedded/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_1.5.2.bb:do_install
    * meta-openembedded/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_2.0.2.bb:do_configure
    * meta-openembedded/meta-oe/recipes-devtools/luajit/luajit_2.0.5.bb:do_compile
    * openembedded-core/meta/recipes-kernel/kexec/kexec-tools_2.0.15.bb:do_compile
    * openembedded-core/meta/recipes-sato/webkit/webkitgtk_2.18.3.bb:do_configure

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

=== Number of failed tasks (65) ===
{| class=wikitable
|-
|| qemuarm 	|| 10	 || http://logs.nslu2-linux.org/buildlogs/oe/world/sumo/log.world.qemuarm.20171228_172031.log/ || http://errors.yoctoproject.org/Errors/Build/49924/
|-
|| qemuarm64 	|| 12	 || http://logs.nslu2-linux.org/buildlogs/oe/world/sumo/log.world.qemuarm64.20171228_202957.log/ || http://errors.yoctoproject.org/Errors/Build/49930/
|-
|| qemux86 	|| 35	 || http://logs.nslu2-linux.org/buildlogs/oe/world/sumo/log.world.qemux86.20171228_172043.log/ || http://errors.yoctoproject.org/Errors/Build/49925/
|-
|| qemux86_64 	|| 8	 || http://logs.nslu2-linux.org/buildlogs/oe/world/sumo/log.world.qemux86-64.20171228_203427.log/ || http://errors.yoctoproject.org/Errors/Build/49929/
|}

=== PNBLACKLISTs (0) ===

=== QA issues (1436) ===
{| class=wikitable
!| Count		||Issue
|-
||0	||already-stripped
|-
||0	||build-deps
|-
||0	||compile-host-path
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
||1420	||version-going-backwards
|-
||1	||host-user-contaminated
|-
||1	||installed-vs-shipped
|-
||2	||textrel
|-
||3	||file-rdeps
|-
||9	||qa_pseudo
|}



=== Incorrect PACKAGE_ARCH or sstate signatures (0) ===

Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/sumo/log.signatures.20171228_232322.log/


    * ERROR: Nothing RPROVIDES 'glibc-utils' (but /home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-support/uim/uim_1.8.6.bb RDEPENDS on or otherwise requires it)
    * ERROR: Required build target 'meta-world-pkgdata' has no buildable providers.
    * ERROR: no sigdata files were generated for MACHINE qemux86copy in /home/jenkins/oe/world/shr-core/tmpfs/stamps
    * ERROR: Nothing RPROVIDES 'glibc-utils' (but /home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-support/uim/uim_1.8.6.bb RDEPENDS on or otherwise requires it)
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


count: 3	issue: file-rdeps
smstools3-3.1.21: /usr/bin/sendsms contained in package smstools3 requires /bin/bash, but no providers found in RDEPENDS_smstools3? [file-rdeps]
smstools3-3.1.21: /usr/bin/sms2unicode contained in package smstools3 requires /bin/bash, but no providers found in RDEPENDS_smstools3? [file-rdeps]
smstools3-3.1.21: /usr/bin/unicode2sms contained in package smstools3 requires /bin/bash, but no providers found in RDEPENDS_smstools3? [file-rdeps]


count: 1420	issue: version-going-backwards
adwaita-icon-theme-3.26.0: Package version for package adwaita-icon-theme-cursors went backwards which would break package feeds from (0:3.26.0-r0.8 to 0:3.26.0-r0.7) [version-going-backwards]
adwaita-icon-theme-3.26.0: Package version for package adwaita-icon-theme-hires went backwards which would break package feeds from (0:3.26.0-r0.8 to 0:3.26.0-r0.7) [version-going-backwards]
adwaita-icon-theme-3.26.0: Package version for package adwaita-icon-theme-symbolic-hires went backwards which would break package feeds from (0:3.26.0-r0.8 to 0:3.26.0-r0.7) [version-going-backwards]
adwaita-icon-theme-3.26.0: Package version for package adwaita-icon-theme-symbolic went backwards which would break package feeds from (0:3.26.0-r0.8 to 0:3.26.0-r0.7) [version-going-backwards]
adwaita-icon-theme-3.26.0: Package version for package adwaita-icon-theme went backwards which would break package feeds from (0:3.26.0-r0.8 to 0:3.26.0-r0.7) [version-going-backwards]
autoconf-archive-2016.09.16: Package version for package autoconf-archive-doc went backwards which would break package feeds from (0:2016.09.16-r0.8 to 0:2016.09.16-r0.7) [version-going-backwards]
autoconf-archive-2016.09.16: Package version for package autoconf-archive went backwards which would break package feeds from (0:2016.09.16-r0.8 to 0:2016.09.16-r0.7) [version-going-backwards]
ca-certificates-20170717: Package version for package ca-certificates-dbg went backwards which would break package feeds from (0:20170717-r0.8 to 0:20170717-r0.7) [version-going-backwards]
ca-certificates-20170717: Package version for package ca-certificates-dev went backwards which would break package feeds from (0:20170717-r0.8 to 0:20170717-r0.7) [version-going-backwards]
ca-certificates-20170717: Package version for package ca-certificates-doc went backwards which would break package feeds from (0:20170717-r0.8 to 0:20170717-r0.7) [version-going-backwards]
ca-certificates-20170717: Package version for package ca-certificates-locale went backwards which would break package feeds from (0:20170717-r0.8 to 0:20170717-r0.7) [version-going-backwards]
ca-certificates-20170717: Package version for package ca-certificates-staticdev went backwards which would break package feeds from (0:20170717-r0.8 to 0:20170717-r0.7) [version-going-backwards]
ca-certificates-20170717: Package version for package ca-certificates went backwards which would break package feeds from (0:20170717-r0.8 to 0:20170717-r0.7) [version-going-backwards]
cantarell-fonts-0.0.24: Package version for package cantarell-fonts-dbg went backwards which would break package feeds from (0:0.0.24-r0.8 to 0:0.0.24-r0.7) [version-going-backwards]
cantarell-fonts-0.0.24: Package version for package cantarell-fonts-dev went backwards which would break package feeds from (0:0.0.24-r0.8 to 0:0.0.24-r0.7) [version-going-backwards]
cantarell-fonts-0.0.24: Package version for package cantarell-fonts-doc went backwards which would break package feeds from (0:0.0.24-r0.8 to 0:0.0.24-r0.7) [version-going-backwards]
cantarell-fonts-0.0.24: Package version for package cantarell-fonts-locale went backwards which would break package feeds from (0:0.0.24-r0.8 to 0:0.0.24-r0.7) [version-going-backwards]
cantarell-fonts-0.0.24: Package version for package cantarell-fonts-staticdev went backwards which would break package feeds from (0:0.0.24-r0.8 to 0:0.0.24-r0.7) [version-going-backwards]
cantarell-fonts-0.0.24: Package version for package cantarell-fonts went backwards which would break package feeds from (0:0.0.24-r0.8 to 0:0.0.24-r0.7) [version-going-backwards]
docbook-xml-dtd4-4.5: Package version for package docbook-xml-dtd4-dbg went backwards which would break package feeds from (0:4.5-r0.8 to 0:4.5-r0.7) [version-going-backwards]
docbook-xml-dtd4-4.5: Package version for package docbook-xml-dtd4-dev went backwards which would break package feeds from (0:4.5-r0.8 to 0:4.5-r0.7) [version-going-backwards]
docbook-xml-dtd4-4.5: Package version for package docbook-xml-dtd4-doc went backwards which would break package feeds from (0:4.5-r0.8 to 0:4.5-r0.7) [version-going-backwards]
docbook-xml-dtd4-4.5: Package version for package docbook-xml-dtd4-locale went backwards which would break package feeds from (0:4.5-r0.8 to 0:4.5-r0.7) [version-going-backwards]
docbook-xml-dtd4-4.5: Package version for package docbook-xml-dtd4-staticdev went backwards which would break package feeds from (0:4.5-r0.8 to 0:4.5-r0.7) [version-going-backwards]
docbook-xml-dtd4-4.5: Package version for package docbook-xml-dtd4 went backwards which would break package feeds from (0:4.5-r0.8 to 0:4.5-r0.7) [version-going-backwards]
docbook-xsl-stylesheets-1.79.1: Package version for package docbook-xsl-stylesheets-dbg went backwards which would break package feeds from (0:1.79.1-r0.8 to 0:1.79.1-r0.7) [version-going-backwards]
docbook-xsl-stylesheets-1.79.1: Package version for package docbook-xsl-stylesheets-dev went backwards which would break package feeds from (0:1.79.1-r0.8 to 0:1.79.1-r0.7) [version-going-backwards]
docbook-xsl-stylesheets-1.79.1: Package version for package docbook-xsl-stylesheets-doc went backwards which would break package feeds from (0:1.79.1-r0.8 to 0:1.79.1-r0.7) [version-going-backwards]
docbook-xsl-stylesheets-1.79.1: Package version for package docbook-xsl-stylesheets-locale went backwards which would break package feeds from (0:1.79.1-r0.8 to 0:1.79.1-r0.7) [version-going-backwards]
docbook-xsl-stylesheets-1.79.1: Package version for package docbook-xsl-stylesheets-staticdev went backwards which would break package feeds from (0:1.79.1-r0.8 to 0:1.79.1-r0.7) [version-going-backwards]
docbook-xsl-stylesheets-1.79.1: Package version for package docbook-xsl-stylesheets went backwards which would break package feeds from (0:1.79.1-r0.8 to 0:1.79.1-r0.7) [version-going-backwards]
encodings-1.0.4: Package version for package encodings-dbg went backwards which would break package feeds from (1:1.0.4-r2.1.8 to 1:1.0.4-r2.1.7) [version-going-backwards]
encodings-1.0.4: Package version for package encodings-dev went backwards which would break package feeds from (1:1.0.4-r2.1.8 to 1:1.0.4-r2.1.7) [version-going-backwards]
encodings-1.0.4: Package version for package encodings-doc went backwards which would break package feeds from (1:1.0.4-r2.1.8 to 1:1.0.4-r2.1.7) [version-going-backwards]
encodings-1.0.4: Package version for package encodings-locale went backwards which would break package feeds from (1:1.0.4-r2.1.8 to 1:1.0.4-r2.1.7) [version-going-backwards]
encodings-1.0.4: Package version for package encodings-staticdev went backwards which would break package feeds from (1:1.0.4-r2.1.8 to 1:1.0.4-r2.1.7) [version-going-backwards]
encodings-1.0.4: Package version for package encodings went backwards which would break package feeds from (1:1.0.4-r2.1.8 to 1:1.0.4-r2.1.7) [version-going-backwards]
faenza-icon-theme-1.3: Package version for package faenza-icon-theme-dbg went backwards which would break package feeds from (0:1.3-r0.8 to 0:1.3-r0.7) [version-going-backwards]
faenza-icon-theme-1.3: Package version for package faenza-icon-theme-dev went backwards which would break package feeds from (0:1.3-r0.8 to 0:1.3-r0.7) [version-going-backwards]
faenza-icon-theme-1.3: Package version for package faenza-icon-theme-doc went backwards which would break package feeds from (0:1.3-r0.8 to 0:1.3-r0.7) [version-going-backwards]
faenza-icon-theme-1.3: Package version for package faenza-icon-theme-locale went backwards which would break package feeds from (0:1.3-r0.8 to 0:1.3-r0.7) [version-going-backwards]
faenza-icon-theme-1.3: Package version for package faenza-icon-theme-staticdev went backwards which would break package feeds from (0:1.3-r0.8 to 0:1.3-r0.7) [version-going-backwards]
faenza-icon-theme-1.3: Package version for package faenza-icon-theme went backwards which would break package feeds from (0:1.3-r0.8 to 0:1.3-r0.7) [version-going-backwards]
firefox-addon-webconverger-20120228: Package version for package firefox-addon-webconverger-dbg went backwards which would break package feeds from (0:20120228-r5.8 to 0:20120228-r5.7) [version-going-backwards]
firefox-addon-webconverger-20120228: Package version for package firefox-addon-webconverger-dev went backwards which would break package feeds from (0:20120228-r5.8 to 0:20120228-r5.7) [version-going-backwards]
firefox-addon-webconverger-20120228: Package version for package firefox-addon-webconverger-doc went backwards which would break package feeds from (0:20120228-r5.8 to 0:20120228-r5.7) [version-going-backwards]
firefox-addon-webconverger-20120228: Package version for package firefox-addon-webconverger-locale went backwards which would break package feeds from (0:20120228-r5.8 to 0:20120228-r5.7) [version-going-backwards]
firefox-addon-webconverger-20120228: Package version for package firefox-addon-webconverger-staticdev went backwards which would break package feeds from (0:20120228-r5.8 to 0:20120228-r5.7) [version-going-backwards]
firefox-addon-webconverger-20120228: Package version for package firefox-addon-webconverger went backwards which would break package feeds from (0:20120228-r5.8 to 0:20120228-r5.7) [version-going-backwards]
firefox-l10n-ach-45.9.0esr: Package version for package firefox-l10n-ach-dbg went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-ach-45.9.0esr: Package version for package firefox-l10n-ach-dev went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-ach-45.9.0esr: Package version for package firefox-l10n-ach-doc went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-ach-45.9.0esr: Package version for package firefox-l10n-ach-locale went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-ach-45.9.0esr: Package version for package firefox-l10n-ach-staticdev went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-ach-45.9.0esr: Package version for package firefox-l10n-ach went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-af-45.9.0esr: Package version for package firefox-l10n-af-dbg went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-af-45.9.0esr: Package version for package firefox-l10n-af-dev went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-af-45.9.0esr: Package version for package firefox-l10n-af-doc went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-af-45.9.0esr: Package version for package firefox-l10n-af-locale went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-af-45.9.0esr: Package version for package firefox-l10n-af-staticdev went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-af-45.9.0esr: Package version for package firefox-l10n-af went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-an-45.9.0esr: Package version for package firefox-l10n-an-dbg went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-an-45.9.0esr: Package version for package firefox-l10n-an-dev went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-an-45.9.0esr: Package version for package firefox-l10n-an-doc went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-an-45.9.0esr: Package version for package firefox-l10n-an-locale went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-an-45.9.0esr: Package version for package firefox-l10n-an-staticdev went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-an-45.9.0esr: Package version for package firefox-l10n-an went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-ar-45.9.0esr: Package version for package firefox-l10n-ar-dbg went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-ar-45.9.0esr: Package version for package firefox-l10n-ar-dev went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-ar-45.9.0esr: Package version for package firefox-l10n-ar-doc went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-ar-45.9.0esr: Package version for package firefox-l10n-ar-locale went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-ar-45.9.0esr: Package version for package firefox-l10n-ar-staticdev went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-ar-45.9.0esr: Package version for package firefox-l10n-ar went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-as-45.9.0esr: Package version for package firefox-l10n-as-dbg went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-as-45.9.0esr: Package version for package firefox-l10n-as-dev went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-as-45.9.0esr: Package version for package firefox-l10n-as-doc went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-as-45.9.0esr: Package version for package firefox-l10n-as-locale went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-as-45.9.0esr: Package version for package firefox-l10n-as-staticdev went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-as-45.9.0esr: Package version for package firefox-l10n-as went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-ast-45.9.0esr: Package version for package firefox-l10n-ast-dbg went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-ast-45.9.0esr: Package version for package firefox-l10n-ast-dev went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-ast-45.9.0esr: Package version for package firefox-l10n-ast-doc went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-ast-45.9.0esr: Package version for package firefox-l10n-ast-locale went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-ast-45.9.0esr: Package version for package firefox-l10n-ast-staticdev went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-ast-45.9.0esr: Package version for package firefox-l10n-ast went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-az-45.9.0esr: Package version for package firefox-l10n-az-dbg went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-az-45.9.0esr: Package version for package firefox-l10n-az-dev went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-az-45.9.0esr: Package version for package firefox-l10n-az-doc went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-az-45.9.0esr: Package version for package firefox-l10n-az-locale went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-az-45.9.0esr: Package version for package firefox-l10n-az-staticdev went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-az-45.9.0esr: Package version for package firefox-l10n-az went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-be-45.9.0esr: Package version for package firefox-l10n-be-dbg went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-be-45.9.0esr: Package version for package firefox-l10n-be-dev went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-be-45.9.0esr: Package version for package firefox-l10n-be-doc went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-be-45.9.0esr: Package version for package firefox-l10n-be-locale went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-be-45.9.0esr: Package version for package firefox-l10n-be-staticdev went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-be-45.9.0esr: Package version for package firefox-l10n-be went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-bg-45.9.0esr: Package version for package firefox-l10n-bg-dbg went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-bg-45.9.0esr: Package version for package firefox-l10n-bg-dev went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-bg-45.9.0esr: Package version for package firefox-l10n-bg-doc went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-bg-45.9.0esr: Package version for package firefox-l10n-bg-locale went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-bg-45.9.0esr: Package version for package firefox-l10n-bg-staticdev went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-bg-45.9.0esr: Package version for package firefox-l10n-bg went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-bn-bd-45.9.0esr: Package version for package firefox-l10n-bn-bd-dbg went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-bn-bd-45.9.0esr: Package version for package firefox-l10n-bn-bd-dev went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-bn-bd-45.9.0esr: Package version for package firefox-l10n-bn-bd-doc went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-bn-bd-45.9.0esr: Package version for package firefox-l10n-bn-bd-locale went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-bn-bd-45.9.0esr: Package version for package firefox-l10n-bn-bd-staticdev went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-bn-bd-45.9.0esr: Package version for package firefox-l10n-bn-bd went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-bn-in-45.9.0esr: Package version for package firefox-l10n-bn-in-dbg went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-bn-in-45.9.0esr: Package version for package firefox-l10n-bn-in-dev went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-bn-in-45.9.0esr: Package version for package firefox-l10n-bn-in-doc went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-bn-in-45.9.0esr: Package version for package firefox-l10n-bn-in-locale went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-bn-in-45.9.0esr: Package version for package firefox-l10n-bn-in-staticdev went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-bn-in-45.9.0esr: Package version for package firefox-l10n-bn-in went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-br-45.9.0esr: Package version for package firefox-l10n-br-dbg went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-br-45.9.0esr: Package version for package firefox-l10n-br-dev went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-br-45.9.0esr: Package version for package firefox-l10n-br-doc went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-br-45.9.0esr: Package version for package firefox-l10n-br-locale went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-br-45.9.0esr: Package version for package firefox-l10n-br-staticdev went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-br-45.9.0esr: Package version for package firefox-l10n-br went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-bs-45.9.0esr: Package version for package firefox-l10n-bs-dbg went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-bs-45.9.0esr: Package version for package firefox-l10n-bs-dev went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-bs-45.9.0esr: Package version for package firefox-l10n-bs-doc went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-bs-45.9.0esr: Package version for package firefox-l10n-bs-locale went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-bs-45.9.0esr: Package version for package firefox-l10n-bs-staticdev went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-bs-45.9.0esr: Package version for package firefox-l10n-bs went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-ca-45.9.0esr: Package version for package firefox-l10n-ca-dbg went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-ca-45.9.0esr: Package version for package firefox-l10n-ca-dev went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-ca-45.9.0esr: Package version for package firefox-l10n-ca-doc went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-ca-45.9.0esr: Package version for package firefox-l10n-ca-locale went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-ca-45.9.0esr: Package version for package firefox-l10n-ca-staticdev went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-ca-45.9.0esr: Package version for package firefox-l10n-ca went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-cs-45.9.0esr: Package version for package firefox-l10n-cs-dbg went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-cs-45.9.0esr: Package version for package firefox-l10n-cs-dev went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-cs-45.9.0esr: Package version for package firefox-l10n-cs-doc went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-cs-45.9.0esr: Package version for package firefox-l10n-cs-locale went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-cs-45.9.0esr: Package version for package firefox-l10n-cs-staticdev went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-cs-45.9.0esr: Package version for package firefox-l10n-cs went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-cy-45.9.0esr: Package version for package firefox-l10n-cy-dbg went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-cy-45.9.0esr: Package version for package firefox-l10n-cy-dev went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-cy-45.9.0esr: Package version for package firefox-l10n-cy-doc went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-cy-45.9.0esr: Package version for package firefox-l10n-cy-locale went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-cy-45.9.0esr: Package version for package firefox-l10n-cy-staticdev went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-cy-45.9.0esr: Package version for package firefox-l10n-cy went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-da-45.9.0esr: Package version for package firefox-l10n-da-dbg went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-da-45.9.0esr: Package version for package firefox-l10n-da-dev went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-da-45.9.0esr: Package version for package firefox-l10n-da-doc went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-da-45.9.0esr: Package version for package firefox-l10n-da-locale went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-da-45.9.0esr: Package version for package firefox-l10n-da-staticdev went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-da-45.9.0esr: Package version for package firefox-l10n-da went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-de-45.9.0esr: Package version for package firefox-l10n-de-dbg went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-de-45.9.0esr: Package version for package firefox-l10n-de-dev went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-de-45.9.0esr: Package version for package firefox-l10n-de-doc went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-de-45.9.0esr: Package version for package firefox-l10n-de-locale went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-de-45.9.0esr: Package version for package firefox-l10n-de-staticdev went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-de-45.9.0esr: Package version for package firefox-l10n-de went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-dsb-45.9.0esr: Package version for package firefox-l10n-dsb-dbg went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-dsb-45.9.0esr: Package version for package firefox-l10n-dsb-dev went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-dsb-45.9.0esr: Package version for package firefox-l10n-dsb-doc went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-dsb-45.9.0esr: Package version for package firefox-l10n-dsb-locale went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-dsb-45.9.0esr: Package version for package firefox-l10n-dsb-staticdev went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-dsb-45.9.0esr: Package version for package firefox-l10n-dsb went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-el-45.9.0esr: Package version for package firefox-l10n-el-dbg went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-el-45.9.0esr: Package version for package firefox-l10n-el-dev went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-el-45.9.0esr: Package version for package firefox-l10n-el-doc went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-el-45.9.0esr: Package version for package firefox-l10n-el-locale went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-el-45.9.0esr: Package version for package firefox-l10n-el-staticdev went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-el-45.9.0esr: Package version for package firefox-l10n-el went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-en-gb-45.9.0esr: Package version for package firefox-l10n-en-gb-dbg went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-en-gb-45.9.0esr: Package version for package firefox-l10n-en-gb-dev went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-en-gb-45.9.0esr: Package version for package firefox-l10n-en-gb-doc went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-en-gb-45.9.0esr: Package version for package firefox-l10n-en-gb-locale went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-en-gb-45.9.0esr: Package version for package firefox-l10n-en-gb-staticdev went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-en-gb-45.9.0esr: Package version for package firefox-l10n-en-gb went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-en-us-45.9.0esr: Package version for package firefox-l10n-en-us-dbg went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-en-us-45.9.0esr: Package version for package firefox-l10n-en-us-dev went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-en-us-45.9.0esr: Package version for package firefox-l10n-en-us-doc went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-en-us-45.9.0esr: Package version for package firefox-l10n-en-us-locale went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-en-us-45.9.0esr: Package version for package firefox-l10n-en-us-staticdev went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-en-us-45.9.0esr: Package version for package firefox-l10n-en-us went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-en-za-45.9.0esr: Package version for package firefox-l10n-en-za-dbg went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-en-za-45.9.0esr: Package version for package firefox-l10n-en-za-dev went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-en-za-45.9.0esr: Package version for package firefox-l10n-en-za-doc went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-en-za-45.9.0esr: Package version for package firefox-l10n-en-za-locale went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-en-za-45.9.0esr: Package version for package firefox-l10n-en-za-staticdev went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-en-za-45.9.0esr: Package version for package firefox-l10n-en-za went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-eo-45.9.0esr: Package version for package firefox-l10n-eo-dbg went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-eo-45.9.0esr: Package version for package firefox-l10n-eo-dev went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-eo-45.9.0esr: Package version for package firefox-l10n-eo-doc went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-eo-45.9.0esr: Package version for package firefox-l10n-eo-locale went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-eo-45.9.0esr: Package version for package firefox-l10n-eo-staticdev went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-eo-45.9.0esr: Package version for package firefox-l10n-eo went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-es-ar-45.9.0esr: Package version for package firefox-l10n-es-ar-dbg went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-es-ar-45.9.0esr: Package version for package firefox-l10n-es-ar-dev went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-es-ar-45.9.0esr: Package version for package firefox-l10n-es-ar-doc went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-es-ar-45.9.0esr: Package version for package firefox-l10n-es-ar-locale went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-es-ar-45.9.0esr: Package version for package firefox-l10n-es-ar-staticdev went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-es-ar-45.9.0esr: Package version for package firefox-l10n-es-ar went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-es-cl-45.9.0esr: Package version for package firefox-l10n-es-cl-dbg went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-es-cl-45.9.0esr: Package version for package firefox-l10n-es-cl-dev went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-es-cl-45.9.0esr: Package version for package firefox-l10n-es-cl-doc went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-es-cl-45.9.0esr: Package version for package firefox-l10n-es-cl-locale went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-es-cl-45.9.0esr: Package version for package firefox-l10n-es-cl-staticdev went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-es-cl-45.9.0esr: Package version for package firefox-l10n-es-cl went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-es-es-45.9.0esr: Package version for package firefox-l10n-es-es-dbg went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-es-es-45.9.0esr: Package version for package firefox-l10n-es-es-dev went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-es-es-45.9.0esr: Package version for package firefox-l10n-es-es-doc went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-es-es-45.9.0esr: Package version for package firefox-l10n-es-es-locale went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-es-es-45.9.0esr: Package version for package firefox-l10n-es-es-staticdev went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-es-es-45.9.0esr: Package version for package firefox-l10n-es-es went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-es-mx-45.9.0esr: Package version for package firefox-l10n-es-mx-dbg went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-es-mx-45.9.0esr: Package version for package firefox-l10n-es-mx-dev went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-es-mx-45.9.0esr: Package version for package firefox-l10n-es-mx-doc went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-es-mx-45.9.0esr: Package version for package firefox-l10n-es-mx-locale went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-es-mx-45.9.0esr: Package version for package firefox-l10n-es-mx-staticdev went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-es-mx-45.9.0esr: Package version for package firefox-l10n-es-mx went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-et-45.9.0esr: Package version for package firefox-l10n-et-dbg went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-et-45.9.0esr: Package version for package firefox-l10n-et-dev went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-et-45.9.0esr: Package version for package firefox-l10n-et-doc went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-et-45.9.0esr: Package version for package firefox-l10n-et-locale went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-et-45.9.0esr: Package version for package firefox-l10n-et-staticdev went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-et-45.9.0esr: Package version for package firefox-l10n-et went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-eu-45.9.0esr: Package version for package firefox-l10n-eu-dbg went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-eu-45.9.0esr: Package version for package firefox-l10n-eu-dev went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-eu-45.9.0esr: Package version for package firefox-l10n-eu-doc went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-eu-45.9.0esr: Package version for package firefox-l10n-eu-locale went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-eu-45.9.0esr: Package version for package firefox-l10n-eu-staticdev went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-eu-45.9.0esr: Package version for package firefox-l10n-eu went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-fa-45.9.0esr: Package version for package firefox-l10n-fa-dbg went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-fa-45.9.0esr: Package version for package firefox-l10n-fa-dev went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-fa-45.9.0esr: Package version for package firefox-l10n-fa-doc went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-fa-45.9.0esr: Package version for package firefox-l10n-fa-locale went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-fa-45.9.0esr: Package version for package firefox-l10n-fa-staticdev went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-fa-45.9.0esr: Package version for package firefox-l10n-fa went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-ff-45.9.0esr: Package version for package firefox-l10n-ff-dbg went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-ff-45.9.0esr: Package version for package firefox-l10n-ff-dev went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-ff-45.9.0esr: Package version for package firefox-l10n-ff-doc went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-ff-45.9.0esr: Package version for package firefox-l10n-ff-locale went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-ff-45.9.0esr: Package version for package firefox-l10n-ff-staticdev went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-ff-45.9.0esr: Package version for package firefox-l10n-ff went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-fi-45.9.0esr: Package version for package firefox-l10n-fi-dbg went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-fi-45.9.0esr: Package version for package firefox-l10n-fi-dev went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-fi-45.9.0esr: Package version for package firefox-l10n-fi-doc went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-fi-45.9.0esr: Package version for package firefox-l10n-fi-locale went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-fi-45.9.0esr: Package version for package firefox-l10n-fi-staticdev went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-fi-45.9.0esr: Package version for package firefox-l10n-fi went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-fr-45.9.0esr: Package version for package firefox-l10n-fr-dbg went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-fr-45.9.0esr: Package version for package firefox-l10n-fr-dev went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-fr-45.9.0esr: Package version for package firefox-l10n-fr-doc went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-fr-45.9.0esr: Package version for package firefox-l10n-fr-locale went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-fr-45.9.0esr: Package version for package firefox-l10n-fr-staticdev went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-fr-45.9.0esr: Package version for package firefox-l10n-fr went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-fy-nl-45.9.0esr: Package version for package firefox-l10n-fy-nl-dbg went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-fy-nl-45.9.0esr: Package version for package firefox-l10n-fy-nl-dev went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-fy-nl-45.9.0esr: Package version for package firefox-l10n-fy-nl-doc went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-fy-nl-45.9.0esr: Package version for package firefox-l10n-fy-nl-locale went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-fy-nl-45.9.0esr: Package version for package firefox-l10n-fy-nl-staticdev went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-fy-nl-45.9.0esr: Package version for package firefox-l10n-fy-nl went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-ga-ie-45.9.0esr: Package version for package firefox-l10n-ga-ie-dbg went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-ga-ie-45.9.0esr: Package version for package firefox-l10n-ga-ie-dev went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-ga-ie-45.9.0esr: Package version for package firefox-l10n-ga-ie-doc went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-ga-ie-45.9.0esr: Package version for package firefox-l10n-ga-ie-locale went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-ga-ie-45.9.0esr: Package version for package firefox-l10n-ga-ie-staticdev went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-ga-ie-45.9.0esr: Package version for package firefox-l10n-ga-ie went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-gd-45.9.0esr: Package version for package firefox-l10n-gd-dbg went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-gd-45.9.0esr: Package version for package firefox-l10n-gd-dev went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-gd-45.9.0esr: Package version for package firefox-l10n-gd-doc went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-gd-45.9.0esr: Package version for package firefox-l10n-gd-locale went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-gd-45.9.0esr: Package version for package firefox-l10n-gd-staticdev went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-gd-45.9.0esr: Package version for package firefox-l10n-gd went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-gl-45.9.0esr: Package version for package firefox-l10n-gl-dbg went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-gl-45.9.0esr: Package version for package firefox-l10n-gl-dev went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-gl-45.9.0esr: Package version for package firefox-l10n-gl-doc went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-gl-45.9.0esr: Package version for package firefox-l10n-gl-locale went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-gl-45.9.0esr: Package version for package firefox-l10n-gl-staticdev went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-gl-45.9.0esr: Package version for package firefox-l10n-gl went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-gn-45.9.0esr: Package version for package firefox-l10n-gn-dbg went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-gn-45.9.0esr: Package version for package firefox-l10n-gn-dev went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-gn-45.9.0esr: Package version for package firefox-l10n-gn-doc went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-gn-45.9.0esr: Package version for package firefox-l10n-gn-locale went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-gn-45.9.0esr: Package version for package firefox-l10n-gn-staticdev went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-gn-45.9.0esr: Package version for package firefox-l10n-gn went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-gu-in-45.9.0esr: Package version for package firefox-l10n-gu-in-dbg went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-gu-in-45.9.0esr: Package version for package firefox-l10n-gu-in-dev went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-gu-in-45.9.0esr: Package version for package firefox-l10n-gu-in-doc went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-gu-in-45.9.0esr: Package version for package firefox-l10n-gu-in-locale went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-gu-in-45.9.0esr: Package version for package firefox-l10n-gu-in-staticdev went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-gu-in-45.9.0esr: Package version for package firefox-l10n-gu-in went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-he-45.9.0esr: Package version for package firefox-l10n-he-dbg went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-he-45.9.0esr: Package version for package firefox-l10n-he-dev went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-he-45.9.0esr: Package version for package firefox-l10n-he-doc went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-he-45.9.0esr: Package version for package firefox-l10n-he-locale went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-he-45.9.0esr: Package version for package firefox-l10n-he-staticdev went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-he-45.9.0esr: Package version for package firefox-l10n-he went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-hi-in-45.9.0esr: Package version for package firefox-l10n-hi-in-dbg went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-hi-in-45.9.0esr: Package version for package firefox-l10n-hi-in-dev went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-hi-in-45.9.0esr: Package version for package firefox-l10n-hi-in-doc went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-hi-in-45.9.0esr: Package version for package firefox-l10n-hi-in-locale went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-hi-in-45.9.0esr: Package version for package firefox-l10n-hi-in-staticdev went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-hi-in-45.9.0esr: Package version for package firefox-l10n-hi-in went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-hr-45.9.0esr: Package version for package firefox-l10n-hr-dbg went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-hr-45.9.0esr: Package version for package firefox-l10n-hr-dev went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-hr-45.9.0esr: Package version for package firefox-l10n-hr-doc went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-hr-45.9.0esr: Package version for package firefox-l10n-hr-locale went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-hr-45.9.0esr: Package version for package firefox-l10n-hr-staticdev went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-hr-45.9.0esr: Package version for package firefox-l10n-hr went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-hsb-45.9.0esr: Package version for package firefox-l10n-hsb-dbg went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-hsb-45.9.0esr: Package version for package firefox-l10n-hsb-dev went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-hsb-45.9.0esr: Package version for package firefox-l10n-hsb-doc went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-hsb-45.9.0esr: Package version for package firefox-l10n-hsb-locale went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-hsb-45.9.0esr: Package version for package firefox-l10n-hsb-staticdev went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-hsb-45.9.0esr: Package version for package firefox-l10n-hsb went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-hu-45.9.0esr: Package version for package firefox-l10n-hu-dbg went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-hu-45.9.0esr: Package version for package firefox-l10n-hu-dev went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-hu-45.9.0esr: Package version for package firefox-l10n-hu-doc went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-hu-45.9.0esr: Package version for package firefox-l10n-hu-locale went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-hu-45.9.0esr: Package version for package firefox-l10n-hu-staticdev went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-hu-45.9.0esr: Package version for package firefox-l10n-hu went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-hy-am-45.9.0esr: Package version for package firefox-l10n-hy-am-dbg went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-hy-am-45.9.0esr: Package version for package firefox-l10n-hy-am-dev went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-hy-am-45.9.0esr: Package version for package firefox-l10n-hy-am-doc went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-hy-am-45.9.0esr: Package version for package firefox-l10n-hy-am-locale went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-hy-am-45.9.0esr: Package version for package firefox-l10n-hy-am-staticdev went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-hy-am-45.9.0esr: Package version for package firefox-l10n-hy-am went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-id-45.9.0esr: Package version for package firefox-l10n-id-dbg went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-id-45.9.0esr: Package version for package firefox-l10n-id-dev went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-id-45.9.0esr: Package version for package firefox-l10n-id-doc went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-id-45.9.0esr: Package version for package firefox-l10n-id-locale went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-id-45.9.0esr: Package version for package firefox-l10n-id-staticdev went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-id-45.9.0esr: Package version for package firefox-l10n-id went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-is-45.9.0esr: Package version for package firefox-l10n-is-dbg went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-is-45.9.0esr: Package version for package firefox-l10n-is-dev went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-is-45.9.0esr: Package version for package firefox-l10n-is-doc went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-is-45.9.0esr: Package version for package firefox-l10n-is-locale went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-is-45.9.0esr: Package version for package firefox-l10n-is-staticdev went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-is-45.9.0esr: Package version for package firefox-l10n-is went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-it-45.9.0esr: Package version for package firefox-l10n-it-dbg went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-it-45.9.0esr: Package version for package firefox-l10n-it-dev went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-it-45.9.0esr: Package version for package firefox-l10n-it-doc went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-it-45.9.0esr: Package version for package firefox-l10n-it-locale went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-it-45.9.0esr: Package version for package firefox-l10n-it-staticdev went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-it-45.9.0esr: Package version for package firefox-l10n-it went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-ja-45.9.0esr: Package version for package firefox-l10n-ja-dbg went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-ja-45.9.0esr: Package version for package firefox-l10n-ja-dev went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-ja-45.9.0esr: Package version for package firefox-l10n-ja-doc went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-ja-45.9.0esr: Package version for package firefox-l10n-ja-locale went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-ja-45.9.0esr: Package version for package firefox-l10n-ja-staticdev went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-ja-45.9.0esr: Package version for package firefox-l10n-ja went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-kk-45.9.0esr: Package version for package firefox-l10n-kk-dbg went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-kk-45.9.0esr: Package version for package firefox-l10n-kk-dev went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-kk-45.9.0esr: Package version for package firefox-l10n-kk-doc went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-kk-45.9.0esr: Package version for package firefox-l10n-kk-locale went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-kk-45.9.0esr: Package version for package firefox-l10n-kk-staticdev went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-kk-45.9.0esr: Package version for package firefox-l10n-kk went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-km-45.9.0esr: Package version for package firefox-l10n-km-dbg went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-km-45.9.0esr: Package version for package firefox-l10n-km-dev went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-km-45.9.0esr: Package version for package firefox-l10n-km-doc went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-km-45.9.0esr: Package version for package firefox-l10n-km-locale went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-km-45.9.0esr: Package version for package firefox-l10n-km-staticdev went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-km-45.9.0esr: Package version for package firefox-l10n-km went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-kn-45.9.0esr: Package version for package firefox-l10n-kn-dbg went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-kn-45.9.0esr: Package version for package firefox-l10n-kn-dev went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-kn-45.9.0esr: Package version for package firefox-l10n-kn-doc went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-kn-45.9.0esr: Package version for package firefox-l10n-kn-locale went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-kn-45.9.0esr: Package version for package firefox-l10n-kn-staticdev went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-kn-45.9.0esr: Package version for package firefox-l10n-kn went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-ko-45.9.0esr: Package version for package firefox-l10n-ko-dbg went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-ko-45.9.0esr: Package version for package firefox-l10n-ko-dev went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-ko-45.9.0esr: Package version for package firefox-l10n-ko-doc went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-ko-45.9.0esr: Package version for package firefox-l10n-ko-locale went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-ko-45.9.0esr: Package version for package firefox-l10n-ko-staticdev went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-ko-45.9.0esr: Package version for package firefox-l10n-ko went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-lij-45.9.0esr: Package version for package firefox-l10n-lij-dbg went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-lij-45.9.0esr: Package version for package firefox-l10n-lij-dev went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-lij-45.9.0esr: Package version for package firefox-l10n-lij-doc went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-lij-45.9.0esr: Package version for package firefox-l10n-lij-locale went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-lij-45.9.0esr: Package version for package firefox-l10n-lij-staticdev went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-lij-45.9.0esr: Package version for package firefox-l10n-lij went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-lt-45.9.0esr: Package version for package firefox-l10n-lt-dbg went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-lt-45.9.0esr: Package version for package firefox-l10n-lt-dev went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-lt-45.9.0esr: Package version for package firefox-l10n-lt-doc went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-lt-45.9.0esr: Package version for package firefox-l10n-lt-locale went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-lt-45.9.0esr: Package version for package firefox-l10n-lt-staticdev went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-lt-45.9.0esr: Package version for package firefox-l10n-lt went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-lv-45.9.0esr: Package version for package firefox-l10n-lv-dbg went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-lv-45.9.0esr: Package version for package firefox-l10n-lv-dev went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-lv-45.9.0esr: Package version for package firefox-l10n-lv-doc went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-lv-45.9.0esr: Package version for package firefox-l10n-lv-locale went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-lv-45.9.0esr: Package version for package firefox-l10n-lv-staticdev went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-lv-45.9.0esr: Package version for package firefox-l10n-lv went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-mai-45.9.0esr: Package version for package firefox-l10n-mai-dbg went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-mai-45.9.0esr: Package version for package firefox-l10n-mai-dev went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-mai-45.9.0esr: Package version for package firefox-l10n-mai-doc went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-mai-45.9.0esr: Package version for package firefox-l10n-mai-locale went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-mai-45.9.0esr: Package version for package firefox-l10n-mai-staticdev went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-mai-45.9.0esr: Package version for package firefox-l10n-mai went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-mk-45.9.0esr: Package version for package firefox-l10n-mk-dbg went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-mk-45.9.0esr: Package version for package firefox-l10n-mk-dev went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-mk-45.9.0esr: Package version for package firefox-l10n-mk-doc went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-mk-45.9.0esr: Package version for package firefox-l10n-mk-locale went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-mk-45.9.0esr: Package version for package firefox-l10n-mk-staticdev went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-mk-45.9.0esr: Package version for package firefox-l10n-mk went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-ml-45.9.0esr: Package version for package firefox-l10n-ml-dbg went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-ml-45.9.0esr: Package version for package firefox-l10n-ml-dev went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-ml-45.9.0esr: Package version for package firefox-l10n-ml-doc went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-ml-45.9.0esr: Package version for package firefox-l10n-ml-locale went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-ml-45.9.0esr: Package version for package firefox-l10n-ml-staticdev went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-ml-45.9.0esr: Package version for package firefox-l10n-ml went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-mr-45.9.0esr: Package version for package firefox-l10n-mr-dbg went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-mr-45.9.0esr: Package version for package firefox-l10n-mr-dev went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-mr-45.9.0esr: Package version for package firefox-l10n-mr-doc went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-mr-45.9.0esr: Package version for package firefox-l10n-mr-locale went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-mr-45.9.0esr: Package version for package firefox-l10n-mr-staticdev went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-mr-45.9.0esr: Package version for package firefox-l10n-mr went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-ms-45.9.0esr: Package version for package firefox-l10n-ms-dbg went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-ms-45.9.0esr: Package version for package firefox-l10n-ms-dev went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-ms-45.9.0esr: Package version for package firefox-l10n-ms-doc went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-ms-45.9.0esr: Package version for package firefox-l10n-ms-locale went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-ms-45.9.0esr: Package version for package firefox-l10n-ms-staticdev went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-ms-45.9.0esr: Package version for package firefox-l10n-ms went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-nb-no-45.9.0esr: Package version for package firefox-l10n-nb-no-dbg went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-nb-no-45.9.0esr: Package version for package firefox-l10n-nb-no-dev went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-nb-no-45.9.0esr: Package version for package firefox-l10n-nb-no-doc went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-nb-no-45.9.0esr: Package version for package firefox-l10n-nb-no-locale went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-nb-no-45.9.0esr: Package version for package firefox-l10n-nb-no-staticdev went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-nb-no-45.9.0esr: Package version for package firefox-l10n-nb-no went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-nl-45.9.0esr: Package version for package firefox-l10n-nl-dbg went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-nl-45.9.0esr: Package version for package firefox-l10n-nl-dev went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-nl-45.9.0esr: Package version for package firefox-l10n-nl-doc went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-nl-45.9.0esr: Package version for package firefox-l10n-nl-locale went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-nl-45.9.0esr: Package version for package firefox-l10n-nl-staticdev went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-nl-45.9.0esr: Package version for package firefox-l10n-nl went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-nn-no-45.9.0esr: Package version for package firefox-l10n-nn-no-dbg went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-nn-no-45.9.0esr: Package version for package firefox-l10n-nn-no-dev went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-nn-no-45.9.0esr: Package version for package firefox-l10n-nn-no-doc went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-nn-no-45.9.0esr: Package version for package firefox-l10n-nn-no-locale went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-nn-no-45.9.0esr: Package version for package firefox-l10n-nn-no-staticdev went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-nn-no-45.9.0esr: Package version for package firefox-l10n-nn-no went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-or-45.9.0esr: Package version for package firefox-l10n-or-dbg went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-or-45.9.0esr: Package version for package firefox-l10n-or-dev went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-or-45.9.0esr: Package version for package firefox-l10n-or-doc went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-or-45.9.0esr: Package version for package firefox-l10n-or-locale went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-or-45.9.0esr: Package version for package firefox-l10n-or-staticdev went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-or-45.9.0esr: Package version for package firefox-l10n-or went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-pa-in-45.9.0esr: Package version for package firefox-l10n-pa-in-dbg went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-pa-in-45.9.0esr: Package version for package firefox-l10n-pa-in-dev went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-pa-in-45.9.0esr: Package version for package firefox-l10n-pa-in-doc went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-pa-in-45.9.0esr: Package version for package firefox-l10n-pa-in-locale went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-pa-in-45.9.0esr: Package version for package firefox-l10n-pa-in-staticdev went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-pa-in-45.9.0esr: Package version for package firefox-l10n-pa-in went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-pl-45.9.0esr: Package version for package firefox-l10n-pl-dbg went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-pl-45.9.0esr: Package version for package firefox-l10n-pl-dev went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-pl-45.9.0esr: Package version for package firefox-l10n-pl-doc went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-pl-45.9.0esr: Package version for package firefox-l10n-pl-locale went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-pl-45.9.0esr: Package version for package firefox-l10n-pl-staticdev went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-pl-45.9.0esr: Package version for package firefox-l10n-pl went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-pt-br-45.9.0esr: Package version for package firefox-l10n-pt-br-dbg went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-pt-br-45.9.0esr: Package version for package firefox-l10n-pt-br-dev went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-pt-br-45.9.0esr: Package version for package firefox-l10n-pt-br-doc went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-pt-br-45.9.0esr: Package version for package firefox-l10n-pt-br-locale went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-pt-br-45.9.0esr: Package version for package firefox-l10n-pt-br-staticdev went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-pt-br-45.9.0esr: Package version for package firefox-l10n-pt-br went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-pt-pt-45.9.0esr: Package version for package firefox-l10n-pt-pt-dbg went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-pt-pt-45.9.0esr: Package version for package firefox-l10n-pt-pt-dev went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-pt-pt-45.9.0esr: Package version for package firefox-l10n-pt-pt-doc went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-pt-pt-45.9.0esr: Package version for package firefox-l10n-pt-pt-locale went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-pt-pt-45.9.0esr: Package version for package firefox-l10n-pt-pt-staticdev went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-pt-pt-45.9.0esr: Package version for package firefox-l10n-pt-pt went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-rm-45.9.0esr: Package version for package firefox-l10n-rm-dbg went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-rm-45.9.0esr: Package version for package firefox-l10n-rm-dev went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-rm-45.9.0esr: Package version for package firefox-l10n-rm-doc went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-rm-45.9.0esr: Package version for package firefox-l10n-rm-locale went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-rm-45.9.0esr: Package version for package firefox-l10n-rm-staticdev went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-rm-45.9.0esr: Package version for package firefox-l10n-rm went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-ro-45.9.0esr: Package version for package firefox-l10n-ro-dbg went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-ro-45.9.0esr: Package version for package firefox-l10n-ro-dev went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-ro-45.9.0esr: Package version for package firefox-l10n-ro-doc went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-ro-45.9.0esr: Package version for package firefox-l10n-ro-locale went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-ro-45.9.0esr: Package version for package firefox-l10n-ro-staticdev went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-ro-45.9.0esr: Package version for package firefox-l10n-ro went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-ru-45.9.0esr: Package version for package firefox-l10n-ru-dbg went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-ru-45.9.0esr: Package version for package firefox-l10n-ru-dev went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-ru-45.9.0esr: Package version for package firefox-l10n-ru-doc went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-ru-45.9.0esr: Package version for package firefox-l10n-ru-locale went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-ru-45.9.0esr: Package version for package firefox-l10n-ru-staticdev went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-ru-45.9.0esr: Package version for package firefox-l10n-ru went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-si-45.9.0esr: Package version for package firefox-l10n-si-dbg went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-si-45.9.0esr: Package version for package firefox-l10n-si-dev went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-si-45.9.0esr: Package version for package firefox-l10n-si-doc went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-si-45.9.0esr: Package version for package firefox-l10n-si-locale went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-si-45.9.0esr: Package version for package firefox-l10n-si-staticdev went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-si-45.9.0esr: Package version for package firefox-l10n-si went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-sk-45.9.0esr: Package version for package firefox-l10n-sk-dbg went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-sk-45.9.0esr: Package version for package firefox-l10n-sk-dev went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-sk-45.9.0esr: Package version for package firefox-l10n-sk-doc went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-sk-45.9.0esr: Package version for package firefox-l10n-sk-locale went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-sk-45.9.0esr: Package version for package firefox-l10n-sk-staticdev went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-sk-45.9.0esr: Package version for package firefox-l10n-sk went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-sl-45.9.0esr: Package version for package firefox-l10n-sl-dbg went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-sl-45.9.0esr: Package version for package firefox-l10n-sl-dev went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-sl-45.9.0esr: Package version for package firefox-l10n-sl-doc went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-sl-45.9.0esr: Package version for package firefox-l10n-sl-locale went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-sl-45.9.0esr: Package version for package firefox-l10n-sl-staticdev went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-sl-45.9.0esr: Package version for package firefox-l10n-sl went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-son-45.9.0esr: Package version for package firefox-l10n-son-dbg went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-son-45.9.0esr: Package version for package firefox-l10n-son-dev went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-son-45.9.0esr: Package version for package firefox-l10n-son-doc went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-son-45.9.0esr: Package version for package firefox-l10n-son-locale went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-son-45.9.0esr: Package version for package firefox-l10n-son-staticdev went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-son-45.9.0esr: Package version for package firefox-l10n-son went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-sq-45.9.0esr: Package version for package firefox-l10n-sq-dbg went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-sq-45.9.0esr: Package version for package firefox-l10n-sq-dev went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-sq-45.9.0esr: Package version for package firefox-l10n-sq-doc went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-sq-45.9.0esr: Package version for package firefox-l10n-sq-locale went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-sq-45.9.0esr: Package version for package firefox-l10n-sq-staticdev went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-sq-45.9.0esr: Package version for package firefox-l10n-sq went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-sr-45.9.0esr: Package version for package firefox-l10n-sr-dbg went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-sr-45.9.0esr: Package version for package firefox-l10n-sr-dev went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-sr-45.9.0esr: Package version for package firefox-l10n-sr-doc went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-sr-45.9.0esr: Package version for package firefox-l10n-sr-locale went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-sr-45.9.0esr: Package version for package firefox-l10n-sr-staticdev went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-sr-45.9.0esr: Package version for package firefox-l10n-sr went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-sv-se-45.9.0esr: Package version for package firefox-l10n-sv-se-dbg went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-sv-se-45.9.0esr: Package version for package firefox-l10n-sv-se-dev went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-sv-se-45.9.0esr: Package version for package firefox-l10n-sv-se-doc went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-sv-se-45.9.0esr: Package version for package firefox-l10n-sv-se-locale went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-sv-se-45.9.0esr: Package version for package firefox-l10n-sv-se-staticdev went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-sv-se-45.9.0esr: Package version for package firefox-l10n-sv-se went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-ta-45.9.0esr: Package version for package firefox-l10n-ta-dbg went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-ta-45.9.0esr: Package version for package firefox-l10n-ta-dev went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-ta-45.9.0esr: Package version for package firefox-l10n-ta-doc went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-ta-45.9.0esr: Package version for package firefox-l10n-ta-locale went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-ta-45.9.0esr: Package version for package firefox-l10n-ta-staticdev went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-ta-45.9.0esr: Package version for package firefox-l10n-ta went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-te-45.9.0esr: Package version for package firefox-l10n-te-dbg went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-te-45.9.0esr: Package version for package firefox-l10n-te-dev went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-te-45.9.0esr: Package version for package firefox-l10n-te-doc went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-te-45.9.0esr: Package version for package firefox-l10n-te-locale went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-te-45.9.0esr: Package version for package firefox-l10n-te-staticdev went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-te-45.9.0esr: Package version for package firefox-l10n-te went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-th-45.9.0esr: Package version for package firefox-l10n-th-dbg went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-th-45.9.0esr: Package version for package firefox-l10n-th-dev went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-th-45.9.0esr: Package version for package firefox-l10n-th-doc went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-th-45.9.0esr: Package version for package firefox-l10n-th-locale went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-th-45.9.0esr: Package version for package firefox-l10n-th-staticdev went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-th-45.9.0esr: Package version for package firefox-l10n-th went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-tr-45.9.0esr: Package version for package firefox-l10n-tr-dbg went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-tr-45.9.0esr: Package version for package firefox-l10n-tr-dev went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-tr-45.9.0esr: Package version for package firefox-l10n-tr-doc went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-tr-45.9.0esr: Package version for package firefox-l10n-tr-locale went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-tr-45.9.0esr: Package version for package firefox-l10n-tr-staticdev went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-tr-45.9.0esr: Package version for package firefox-l10n-tr went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-uk-45.9.0esr: Package version for package firefox-l10n-uk-dbg went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-uk-45.9.0esr: Package version for package firefox-l10n-uk-dev went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-uk-45.9.0esr: Package version for package firefox-l10n-uk-doc went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-uk-45.9.0esr: Package version for package firefox-l10n-uk-locale went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-uk-45.9.0esr: Package version for package firefox-l10n-uk-staticdev went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-uk-45.9.0esr: Package version for package firefox-l10n-uk went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-uz-45.9.0esr: Package version for package firefox-l10n-uz-dbg went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-uz-45.9.0esr: Package version for package firefox-l10n-uz-dev went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-uz-45.9.0esr: Package version for package firefox-l10n-uz-doc went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-uz-45.9.0esr: Package version for package firefox-l10n-uz-locale went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-uz-45.9.0esr: Package version for package firefox-l10n-uz-staticdev went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-uz-45.9.0esr: Package version for package firefox-l10n-uz went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-vi-45.9.0esr: Package version for package firefox-l10n-vi-dbg went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-vi-45.9.0esr: Package version for package firefox-l10n-vi-dev went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-vi-45.9.0esr: Package version for package firefox-l10n-vi-doc went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-vi-45.9.0esr: Package version for package firefox-l10n-vi-locale went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-vi-45.9.0esr: Package version for package firefox-l10n-vi-staticdev went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-vi-45.9.0esr: Package version for package firefox-l10n-vi went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-xh-45.9.0esr: Package version for package firefox-l10n-xh-dbg went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-xh-45.9.0esr: Package version for package firefox-l10n-xh-dev went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-xh-45.9.0esr: Package version for package firefox-l10n-xh-doc went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-xh-45.9.0esr: Package version for package firefox-l10n-xh-locale went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-xh-45.9.0esr: Package version for package firefox-l10n-xh-staticdev went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-xh-45.9.0esr: Package version for package firefox-l10n-xh went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-zh-cn-45.9.0esr: Package version for package firefox-l10n-zh-cn-dbg went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-zh-cn-45.9.0esr: Package version for package firefox-l10n-zh-cn-dev went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-zh-cn-45.9.0esr: Package version for package firefox-l10n-zh-cn-doc went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-zh-cn-45.9.0esr: Package version for package firefox-l10n-zh-cn-locale went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-zh-cn-45.9.0esr: Package version for package firefox-l10n-zh-cn-staticdev went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-zh-cn-45.9.0esr: Package version for package firefox-l10n-zh-cn went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-zh-tw-45.9.0esr: Package version for package firefox-l10n-zh-tw-dbg went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-zh-tw-45.9.0esr: Package version for package firefox-l10n-zh-tw-dev went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-zh-tw-45.9.0esr: Package version for package firefox-l10n-zh-tw-doc went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-zh-tw-45.9.0esr: Package version for package firefox-l10n-zh-tw-locale went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-zh-tw-45.9.0esr: Package version for package firefox-l10n-zh-tw-staticdev went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
firefox-l10n-zh-tw-45.9.0esr: Package version for package firefox-l10n-zh-tw went backwards which would break package feeds from (0:45.9.0esr-r3.8 to 0:45.9.0esr-r3.7) [version-going-backwards]
font-alias-1.0.3: Package version for package font-alias-dbg went backwards which would break package feeds from (1:1.0.3-r2.3.8 to 1:1.0.3-r2.3.7) [version-going-backwards]
font-alias-1.0.3: Package version for package font-alias-dev went backwards which would break package feeds from (1:1.0.3-r2.3.8 to 1:1.0.3-r2.3.7) [version-going-backwards]
font-alias-1.0.3: Package version for package font-alias-doc went backwards which would break package feeds from (1:1.0.3-r2.3.8 to 1:1.0.3-r2.3.7) [version-going-backwards]
font-alias-1.0.3: Package version for package font-alias-locale went backwards which would break package feeds from (1:1.0.3-r2.3.8 to 1:1.0.3-r2.3.7) [version-going-backwards]
font-alias-1.0.3: Package version for package font-alias-staticdev went backwards which would break package feeds from (1:1.0.3-r2.3.8 to 1:1.0.3-r2.3.7) [version-going-backwards]
font-alias-1.0.3: Package version for package font-alias went backwards which would break package feeds from (1:1.0.3-r2.3.8 to 1:1.0.3-r2.3.7) [version-going-backwards]
gnome-common-3.18.0: Package version for package gnome-common-dbg went backwards which would break package feeds from (0:3.18.0-r0.10 to 0:3.18.0-r0.9) [version-going-backwards]
gnome-common-3.18.0: Package version for package gnome-common-dev went backwards which would break package feeds from (0:3.18.0-r0.10 to 0:3.18.0-r0.9) [version-going-backwards]
gnome-common-3.18.0: Package version for package gnome-common-doc went backwards which would break package feeds from (0:3.18.0-r0.10 to 0:3.18.0-r0.9) [version-going-backwards]
gnome-common-3.18.0: Package version for package gnome-common-locale went backwards which would break package feeds from (0:3.18.0-r0.10 to 0:3.18.0-r0.9) [version-going-backwards]
gnome-common-3.18.0: Package version for package gnome-common-staticdev went backwards which would break package feeds from (0:3.18.0-r0.10 to 0:3.18.0-r0.9) [version-going-backwards]
gnome-common-3.18.0: Package version for package gnome-common went backwards which would break package feeds from (0:3.18.0-r0.10 to 0:3.18.0-r0.9) [version-going-backwards]
hicolor-icon-theme-0.17: Package version for package hicolor-icon-theme-dbg went backwards which would break package feeds from (0:0.17-r0.8 to 0:0.17-r0.7) [version-going-backwards]
hicolor-icon-theme-0.17: Package version for package hicolor-icon-theme-dev went backwards which would break package feeds from (0:0.17-r0.8 to 0:0.17-r0.7) [version-going-backwards]
hicolor-icon-theme-0.17: Package version for package hicolor-icon-theme-doc went backwards which would break package feeds from (0:0.17-r0.8 to 0:0.17-r0.7) [version-going-backwards]
hicolor-icon-theme-0.17: Package version for package hicolor-icon-theme-locale went backwards which would break package feeds from (0:0.17-r0.8 to 0:0.17-r0.7) [version-going-backwards]
hicolor-icon-theme-0.17: Package version for package hicolor-icon-theme-staticdev went backwards which would break package feeds from (0:0.17-r0.8 to 0:0.17-r0.7) [version-going-backwards]
hicolor-icon-theme-0.17: Package version for package hicolor-icon-theme went backwards which would break package feeds from (0:0.17-r0.8 to 0:0.17-r0.7) [version-going-backwards]
icon-naming-utils-0.8.90: Package version for package icon-naming-utils-dbg went backwards which would break package feeds from (0:0.8.90-r5.8 to 0:0.8.90-r5.7) [version-going-backwards]
icon-naming-utils-0.8.90: Package version for package icon-naming-utils-dev went backwards which would break package feeds from (0:0.8.90-r5.8 to 0:0.8.90-r5.7) [version-going-backwards]
icon-naming-utils-0.8.90: Package version for package icon-naming-utils-doc went backwards which would break package feeds from (0:0.8.90-r5.8 to 0:0.8.90-r5.7) [version-going-backwards]
icon-naming-utils-0.8.90: Package version for package icon-naming-utils-locale went backwards which would break package feeds from (0:0.8.90-r5.8 to 0:0.8.90-r5.7) [version-going-backwards]
icon-naming-utils-0.8.90: Package version for package icon-naming-utils-staticdev went backwards which would break package feeds from (0:0.8.90-r5.8 to 0:0.8.90-r5.7) [version-going-backwards]
icon-naming-utils-0.8.90: Package version for package icon-naming-utils went backwards which would break package feeds from (0:0.8.90-r5.8 to 0:0.8.90-r5.7) [version-going-backwards]
initramfs-boot-1.0: Package version for package initramfs-boot-dbg went backwards which would break package feeds from (0:1.0-r2.8 to 0:1.0-r2.7) [version-going-backwards]
initramfs-boot-1.0: Package version for package initramfs-boot-dev went backwards which would break package feeds from (0:1.0-r2.8 to 0:1.0-r2.7) [version-going-backwards]
initramfs-boot-1.0: Package version for package initramfs-boot-doc went backwards which would break package feeds from (0:1.0-r2.8 to 0:1.0-r2.7) [version-going-backwards]
initramfs-boot-1.0: Package version for package initramfs-boot-locale went backwards which would break package feeds from (0:1.0-r2.8 to 0:1.0-r2.7) [version-going-backwards]
initramfs-boot-1.0: Package version for package initramfs-boot-staticdev went backwards which would break package feeds from (0:1.0-r2.8 to 0:1.0-r2.7) [version-going-backwards]
initramfs-boot-1.0: Package version for package initramfs-boot went backwards which would break package feeds from (0:1.0-r2.8 to 0:1.0-r2.7) [version-going-backwards]
initramfs-debug-1.0: Package version for package initramfs-debug-dbg went backwards which would break package feeds from (0:1.0-r0.8 to 0:1.0-r0.7) [version-going-backwards]
initramfs-debug-1.0: Package version for package initramfs-debug-dev went backwards which would break package feeds from (0:1.0-r0.8 to 0:1.0-r0.7) [version-going-backwards]
initramfs-debug-1.0: Package version for package initramfs-debug-doc went backwards which would break package feeds from (0:1.0-r0.8 to 0:1.0-r0.7) [version-going-backwards]
initramfs-debug-1.0: Package version for package initramfs-debug-locale went backwards which would break package feeds from (0:1.0-r0.8 to 0:1.0-r0.7) [version-going-backwards]
initramfs-debug-1.0: Package version for package initramfs-debug-staticdev went backwards which would break package feeds from (0:1.0-r0.8 to 0:1.0-r0.7) [version-going-backwards]
initramfs-debug-1.0: Package version for package initramfs-debug went backwards which would break package feeds from (0:1.0-r0.8 to 0:1.0-r0.7) [version-going-backwards]
initramfs-framework-1.0: Package version for package initramfs-framework-base went backwards which would break package feeds from (0:1.0-r4.8 to 0:1.0-r4.7) [version-going-backwards]
initramfs-framework-1.0: Package version for package initramfs-module-debug went backwards which would break package feeds from (0:1.0-r4.8 to 0:1.0-r4.7) [version-going-backwards]
initramfs-framework-1.0: Package version for package initramfs-module-e2fs went backwards which would break package feeds from (0:1.0-r4.8 to 0:1.0-r4.7) [version-going-backwards]
initramfs-framework-1.0: Package version for package initramfs-module-exec went backwards which would break package feeds from (0:1.0-r4.8 to 0:1.0-r4.7) [version-going-backwards]
initramfs-framework-1.0: Package version for package initramfs-module-mdev went backwards which would break package feeds from (0:1.0-r4.8 to 0:1.0-r4.7) [version-going-backwards]
initramfs-framework-1.0: Package version for package initramfs-module-rootfs went backwards which would break package feeds from (0:1.0-r4.8 to 0:1.0-r4.7) [version-going-backwards]
initramfs-framework-1.0: Package version for package initramfs-module-udev went backwards which would break package feeds from (0:1.0-r4.8 to 0:1.0-r4.7) [version-going-backwards]
initramfs-module-setup-live-1.0: Package version for package initramfs-module-setup-live-dbg went backwards which would break package feeds from (0:1.0-r4.8 to 0:1.0-r4.7) [version-going-backwards]
initramfs-module-setup-live-1.0: Package version for package initramfs-module-setup-live-dev went backwards which would break package feeds from (0:1.0-r4.8 to 0:1.0-r4.7) [version-going-backwards]
initramfs-module-setup-live-1.0: Package version for package initramfs-module-setup-live-doc went backwards which would break package feeds from (0:1.0-r4.8 to 0:1.0-r4.7) [version-going-backwards]
initramfs-module-setup-live-1.0: Package version for package initramfs-module-setup-live-locale went backwards which would break package feeds from (0:1.0-r4.8 to 0:1.0-r4.7) [version-going-backwards]
initramfs-module-setup-live-1.0: Package version for package initramfs-module-setup-live-staticdev went backwards which would break package feeds from (0:1.0-r4.8 to 0:1.0-r4.7) [version-going-backwards]
initramfs-module-setup-live-1.0: Package version for package initramfs-module-setup-live went backwards which would break package feeds from (0:1.0-r4.8 to 0:1.0-r4.7) [version-going-backwards]
iso-codes-3.76: Package version for package iso-codes-dbg went backwards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [version-going-backwards]
iso-codes-3.76: Package version for package iso-codes-dev went backwards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [version-going-backwards]
iso-codes-3.76: Package version for package iso-codes-doc went backwards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [version-going-backwards]
iso-codes-3.76: Package version for package iso-codes-locale-af went backwards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [version-going-backwards]
iso-codes-3.76: Package version for package iso-codes-locale-am went backwards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [version-going-backwards]
iso-codes-3.76: Package version for package iso-codes-locale-ar went backwards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [version-going-backwards]
iso-codes-3.76: Package version for package iso-codes-locale-ast went backwards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [version-going-backwards]
iso-codes-3.76: Package version for package iso-codes-locale-as went backwards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [version-going-backwards]
iso-codes-3.76: Package version for package iso-codes-locale-az went backwards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [version-going-backwards]
iso-codes-3.76: Package version for package iso-codes-locale-be went backwards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [version-going-backwards]
iso-codes-3.76: Package version for package iso-codes-locale-bg went backwards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [version-going-backwards]
iso-codes-3.76: Package version for package iso-codes-locale-bn-in went backwards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [version-going-backwards]
iso-codes-3.76: Package version for package iso-codes-locale-bn went backwards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [version-going-backwards]
iso-codes-3.76: Package version for package iso-codes-locale-br went backwards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [version-going-backwards]
iso-codes-3.76: Package version for package iso-codes-locale-bs went backwards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [version-going-backwards]
iso-codes-3.76: Package version for package iso-codes-locale-byn went backwards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [version-going-backwards]
iso-codes-3.76: Package version for package iso-codes-locale-ca went backwards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [version-going-backwards]
iso-codes-3.76: Package version for package iso-codes-locale-crh went backwards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [version-going-backwards]
iso-codes-3.76: Package version for package iso-codes-locale-cs went backwards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [version-going-backwards]
iso-codes-3.76: Package version for package iso-codes-locale-cy went backwards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [version-going-backwards]
iso-codes-3.76: Package version for package iso-codes-locale-da went backwards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [version-going-backwards]
iso-codes-3.76: Package version for package iso-codes-locale-de went backwards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [version-going-backwards]
iso-codes-3.76: Package version for package iso-codes-locale-dz went backwards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [version-going-backwards]
iso-codes-3.76: Package version for package iso-codes-locale-el went backwards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [version-going-backwards]
iso-codes-3.76: Package version for package iso-codes-locale-en went backwards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [version-going-backwards]
iso-codes-3.76: Package version for package iso-codes-locale-eo went backwards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [version-going-backwards]
iso-codes-3.76: Package version for package iso-codes-locale-es went backwards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [version-going-backwards]
iso-codes-3.76: Package version for package iso-codes-locale-et went backwards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [version-going-backwards]
iso-codes-3.76: Package version for package iso-codes-locale-eu went backwards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [version-going-backwards]
iso-codes-3.76: Package version for package iso-codes-locale-fa went backwards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [version-going-backwards]
iso-codes-3.76: Package version for package iso-codes-locale-fi went backwards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [version-going-backwards]
iso-codes-3.76: Package version for package iso-codes-locale-fo went backwards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [version-going-backwards]
iso-codes-3.76: Package version for package iso-codes-locale-fr went backwards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [version-going-backwards]
iso-codes-3.76: Package version for package iso-codes-locale-ga went backwards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [version-going-backwards]
iso-codes-3.76: Package version for package iso-codes-locale-gez went backwards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [version-going-backwards]
iso-codes-3.76: Package version for package iso-codes-locale-gl went backwards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [version-going-backwards]
iso-codes-3.76: Package version for package iso-codes-locale-gu went backwards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [version-going-backwards]
iso-codes-3.76: Package version for package iso-codes-locale-haw went backwards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [version-going-backwards]
iso-codes-3.76: Package version for package iso-codes-locale-he went backwards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [version-going-backwards]
iso-codes-3.76: Package version for package iso-codes-locale-hi went backwards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [version-going-backwards]
iso-codes-3.76: Package version for package iso-codes-locale-hr went backwards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [version-going-backwards]
iso-codes-3.76: Package version for package iso-codes-locale-hu went backwards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [version-going-backwards]
iso-codes-3.76: Package version for package iso-codes-locale-hy went backwards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [version-going-backwards]
iso-codes-3.76: Package version for package iso-codes-locale-ia went backwards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [version-going-backwards]
iso-codes-3.76: Package version for package iso-codes-locale-id went backwards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [version-going-backwards]
iso-codes-3.76: Package version for package iso-codes-locale-is went backwards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [version-going-backwards]
iso-codes-3.76: Package version for package iso-codes-locale-it went backwards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [version-going-backwards]
iso-codes-3.76: Package version for package iso-codes-locale-ja went backwards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [version-going-backwards]
iso-codes-3.76: Package version for package iso-codes-locale-ka went backwards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [version-going-backwards]
iso-codes-3.76: Package version for package iso-codes-locale-kk went backwards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [version-going-backwards]
iso-codes-3.76: Package version for package iso-codes-locale-km went backwards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [version-going-backwards]
iso-codes-3.76: Package version for package iso-codes-locale-kn went backwards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [version-going-backwards]
iso-codes-3.76: Package version for package iso-codes-locale-kok went backwards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [version-going-backwards]
iso-codes-3.76: Package version for package iso-codes-locale-ko went backwards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [version-going-backwards]
iso-codes-3.76: Package version for package iso-codes-locale-ku went backwards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [version-going-backwards]
iso-codes-3.76: Package version for package iso-codes-locale-lt went backwards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [version-going-backwards]
iso-codes-3.76: Package version for package iso-codes-locale-lv went backwards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [version-going-backwards]
iso-codes-3.76: Package version for package iso-codes-locale-mi went backwards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [version-going-backwards]
iso-codes-3.76: Package version for package iso-codes-locale-mk went backwards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [version-going-backwards]
iso-codes-3.76: Package version for package iso-codes-locale-ml went backwards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [version-going-backwards]
iso-codes-3.76: Package version for package iso-codes-locale-mn went backwards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [version-going-backwards]
iso-codes-3.76: Package version for package iso-codes-locale-mr went backwards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [version-going-backwards]
iso-codes-3.76: Package version for package iso-codes-locale-ms went backwards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [version-going-backwards]
iso-codes-3.76: Package version for package iso-codes-locale-mt went backwards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [version-going-backwards]
iso-codes-3.76: Package version for package iso-codes-locale-nb went backwards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [version-going-backwards]
iso-codes-3.76: Package version for package iso-codes-locale-ne went backwards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [version-going-backwards]
iso-codes-3.76: Package version for package iso-codes-locale-nl went backwards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [version-going-backwards]
iso-codes-3.76: Package version for package iso-codes-locale-nn went backwards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [version-going-backwards]
iso-codes-3.76: Package version for package iso-codes-locale-nso went backwards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [version-going-backwards]
iso-codes-3.76: Package version for package iso-codes-locale-oc went backwards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [version-going-backwards]
iso-codes-3.76: Package version for package iso-codes-locale-or went backwards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [version-going-backwards]
iso-codes-3.76: Package version for package iso-codes-locale-pa went backwards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [version-going-backwards]
iso-codes-3.76: Package version for package iso-codes-locale-pl went backwards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [version-going-backwards]
iso-codes-3.76: Package version for package iso-codes-locale-ps went backwards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [version-going-backwards]
iso-codes-3.76: Package version for package iso-codes-locale-pt-br went backwards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [version-going-backwards]
iso-codes-3.76: Package version for package iso-codes-locale-pt went backwards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [version-going-backwards]
iso-codes-3.76: Package version for package iso-codes-locale-ro went backwards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [version-going-backwards]
iso-codes-3.76: Package version for package iso-codes-locale-ru went backwards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [version-going-backwards]
iso-codes-3.76: Package version for package iso-codes-locale-rw went backwards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [version-going-backwards]
iso-codes-3.76: Package version for package iso-codes-locale-si went backwards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [version-going-backwards]
iso-codes-3.76: Package version for package iso-codes-locale-sk went backwards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [version-going-backwards]
iso-codes-3.76: Package version for package iso-codes-locale-sl went backwards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [version-going-backwards]
iso-codes-3.76: Package version for package iso-codes-locale-so went backwards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [version-going-backwards]
iso-codes-3.76: Package version for package iso-codes-locale-sq went backwards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [version-going-backwards]
iso-codes-3.76: Package version for package iso-codes-locale-sr+latin went backwards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [version-going-backwards]
iso-codes-3.76: Package version for package iso-codes-locale-sr went backwards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [version-going-backwards]
iso-codes-3.76: Package version for package iso-codes-locale-sv went backwards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [version-going-backwards]
iso-codes-3.76: Package version for package iso-codes-locale-sw went backwards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [version-going-backwards]
iso-codes-3.76: Package version for package iso-codes-locale-ta went backwards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [version-going-backwards]
iso-codes-3.76: Package version for package iso-codes-locale-te went backwards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [version-going-backwards]
iso-codes-3.76: Package version for package iso-codes-locale-th went backwards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [version-going-backwards]
iso-codes-3.76: Package version for package iso-codes-locale-tig went backwards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [version-going-backwards]
iso-codes-3.76: Package version for package iso-codes-locale-ti went backwards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [version-going-backwards]
iso-codes-3.76: Package version for package iso-codes-locale-tk went backwards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [version-going-backwards]
iso-codes-3.76: Package version for package iso-codes-locale-tl went backwards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [version-going-backwards]
iso-codes-3.76: Package version for package iso-codes-locale-tr went backwards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [version-going-backwards]
iso-codes-3.76: Package version for package iso-codes-locale-tt+iqtelif went backwards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [version-going-backwards]
iso-codes-3.76: Package version for package iso-codes-locale-tt went backwards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [version-going-backwards]
iso-codes-3.76: Package version for package iso-codes-locale-ug went backwards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [version-going-backwards]
iso-codes-3.76: Package version for package iso-codes-locale-uk went backwards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [version-going-backwards]
iso-codes-3.76: Package version for package iso-codes-locale-ve went backwards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [version-going-backwards]
iso-codes-3.76: Package version for package iso-codes-locale-vi went backwards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [version-going-backwards]
iso-codes-3.76: Package version for package iso-codes-locale-wal went backwards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [version-going-backwards]
iso-codes-3.76: Package version for package iso-codes-locale-wa went backwards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [version-going-backwards]
iso-codes-3.76: Package version for package iso-codes-locale-wo went backwards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [version-going-backwards]
iso-codes-3.76: Package version for package iso-codes-locale-xh went backwards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [version-going-backwards]
iso-codes-3.76: Package version for package iso-codes-locale-zh-cn went backwards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [version-going-backwards]
iso-codes-3.76: Package version for package iso-codes-locale-zh-hk went backwards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [version-going-backwards]
iso-codes-3.76: Package version for package iso-codes-locale-zh-tw went backwards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [version-going-backwards]
iso-codes-3.76: Package version for package iso-codes-locale-zu went backwards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [version-going-backwards]
iso-codes-3.76: Package version for package iso-codes-staticdev went backwards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [version-going-backwards]
iso-codes-3.76: Package version for package iso-codes went backwards which would break package feeds from (0:3.76-r0.8 to 0:3.76-r0.7) [version-going-backwards]
liberation-fonts-2.00.1: Package version for package liberation-fonts went backwards which would break package feeds from (1:2.00.1-r0.8 to 1:2.00.1-r0.7) [version-going-backwards]
linux-firmware-0.0+gitAUTOINC+bf04291309: Package version for package linux-firmware-adsp-sst-license went backwards which would break package feeds from (1:0.0+git0+bf04291309-r0.8 to 1:0.0+git0+bf04291309-r0.7) [version-going-backwards]
linux-firmware-0.0+gitAUTOINC+bf04291309: Package version for package linux-firmware-adsp-sst went backwards which would break package feeds from (1:0.0+git0+bf04291309-r0.8 to 1:0.0+git0+bf04291309-r0.7) [version-going-backwards]
linux-firmware-0.0+gitAUTOINC+bf04291309: Package version for package linux-firmware-ar3k-license went backwards which would break package feeds from (1:0.0+git0+bf04291309-r0.8 to 1:0.0+git0+bf04291309-r0.7) [version-going-backwards]
linux-firmware-0.0+gitAUTOINC+bf04291309: Package version for package linux-firmware-ar3k went backwards which would break package feeds from (1:0.0+git0+bf04291309-r0.8 to 1:0.0+git0+bf04291309-r0.7) [version-going-backwards]
linux-firmware-0.0+gitAUTOINC+bf04291309: Package version for package linux-firmware-ar9170 went backwards which would break package feeds from (1:0.0+git0+bf04291309-r0.8 to 1:0.0+git0+bf04291309-r0.7) [version-going-backwards]
linux-firmware-0.0+gitAUTOINC+bf04291309: Package version for package linux-firmware-ath10k-license went backwards which would break package feeds from (1:0.0+git0+bf04291309-r0.8 to 1:0.0+git0+bf04291309-r0.7) [version-going-backwards]
linux-firmware-0.0+gitAUTOINC+bf04291309: Package version for package linux-firmware-ath10k went backwards which would break package feeds from (1:0.0+git0+bf04291309-r0.8 to 1:0.0+git0+bf04291309-r0.7) [version-going-backwards]
linux-firmware-0.0+gitAUTOINC+bf04291309: Package version for package linux-firmware-ath6k went backwards which would break package feeds from (1:0.0+git0+bf04291309-r0.8 to 1:0.0+git0+bf04291309-r0.7) [version-going-backwards]
linux-firmware-0.0+gitAUTOINC+bf04291309: Package version for package linux-firmware-ath9k went backwards which would break package feeds from (1:0.0+git0+bf04291309-r0.8 to 1:0.0+git0+bf04291309-r0.7) [version-going-backwards]
linux-firmware-0.0+gitAUTOINC+bf04291309: Package version for package linux-firmware-atheros-license went backwards which would break package feeds from (1:0.0+git0+bf04291309-r0.8 to 1:0.0+git0+bf04291309-r0.7) [version-going-backwards]
linux-firmware-0.0+gitAUTOINC+bf04291309: Package version for package linux-firmware-bcm4329 went backwards which would break package feeds from (1:0.0+git0+bf04291309-r0.8 to 1:0.0+git0+bf04291309-r0.7) [version-going-backwards]
linux-firmware-0.0+gitAUTOINC+bf04291309: Package version for package linux-firmware-bcm4330 went backwards which would break package feeds from (1:0.0+git0+bf04291309-r0.8 to 1:0.0+git0+bf04291309-r0.7) [version-going-backwards]
linux-firmware-0.0+gitAUTOINC+bf04291309: Package version for package linux-firmware-bcm43340 went backwards which would break package feeds from (1:0.0+git0+bf04291309-r0.8 to 1:0.0+git0+bf04291309-r0.7) [version-going-backwards]
linux-firmware-0.0+gitAUTOINC+bf04291309: Package version for package linux-firmware-bcm4334 went backwards which would break package feeds from (1:0.0+git0+bf04291309-r0.8 to 1:0.0+git0+bf04291309-r0.7) [version-going-backwards]
linux-firmware-0.0+gitAUTOINC+bf04291309: Package version for package linux-firmware-bcm43362 went backwards which would break package feeds from (1:0.0+git0+bf04291309-r0.8 to 1:0.0+git0+bf04291309-r0.7) [version-going-backwards]
linux-firmware-0.0+gitAUTOINC+bf04291309: Package version for package linux-firmware-bcm4339 went backwards which would break package feeds from (1:0.0+git0+bf04291309-r0.8 to 1:0.0+git0+bf04291309-r0.7) [version-going-backwards]
linux-firmware-0.0+gitAUTOINC+bf04291309: Package version for package linux-firmware-bcm43430 went backwards which would break package feeds from (1:0.0+git0+bf04291309-r0.8 to 1:0.0+git0+bf04291309-r0.7) [version-going-backwards]
linux-firmware-0.0+gitAUTOINC+bf04291309: Package version for package linux-firmware-bcm4354 went backwards which would break package feeds from (1:0.0+git0+bf04291309-r0.8 to 1:0.0+git0+bf04291309-r0.7) [version-going-backwards]
linux-firmware-0.0+gitAUTOINC+bf04291309: Package version for package linux-firmware-bnx2-mips went backwards which would break package feeds from (1:0.0+git0+bf04291309-r0.8 to 1:0.0+git0+bf04291309-r0.7) [version-going-backwards]
linux-firmware-0.0+gitAUTOINC+bf04291309: Package version for package linux-firmware-broadcom-license went backwards which would break package feeds from (1:0.0+git0+bf04291309-r0.8 to 1:0.0+git0+bf04291309-r0.7) [version-going-backwards]
linux-firmware-0.0+gitAUTOINC+bf04291309: Package version for package linux-firmware-carl9170 went backwards which would break package feeds from (1:0.0+git0+bf04291309-r0.8 to 1:0.0+git0+bf04291309-r0.7) [version-going-backwards]
linux-firmware-0.0+gitAUTOINC+bf04291309: Package version for package linux-firmware-dbg went backwards which would break package feeds from (1:0.0+git0+bf04291309-r0.8 to 1:0.0+git0+bf04291309-r0.7) [version-going-backwards]
linux-firmware-0.0+gitAUTOINC+bf04291309: Package version for package linux-firmware-dev went backwards which would break package feeds from (1:0.0+git0+bf04291309-r0.8 to 1:0.0+git0+bf04291309-r0.7) [version-going-backwards]
linux-firmware-0.0+gitAUTOINC+bf04291309: Package version for package linux-firmware-doc went backwards which would break package feeds from (1:0.0+git0+bf04291309-r0.8 to 1:0.0+git0+bf04291309-r0.7) [version-going-backwards]
linux-firmware-0.0+gitAUTOINC+bf04291309: Package version for package linux-firmware-gplv2-license went backwards which would break package feeds from (1:0.0+git0+bf04291309-r0.8 to 1:0.0+git0+bf04291309-r0.7) [version-going-backwards]
linux-firmware-0.0+gitAUTOINC+bf04291309: Package version for package linux-firmware-i915-license went backwards which would break package feeds from (1:0.0+git0+bf04291309-r0.8 to 1:0.0+git0+bf04291309-r0.7) [version-going-backwards]
linux-firmware-0.0+gitAUTOINC+bf04291309: Package version for package linux-firmware-i915 went backwards which would break package feeds from (1:0.0+git0+bf04291309-r0.8 to 1:0.0+git0+bf04291309-r0.7) [version-going-backwards]
linux-firmware-0.0+gitAUTOINC+bf04291309: Package version for package linux-firmware-ibt-11-5 went backwards which would break package feeds from (1:0.0+git0+bf04291309-r0.8 to 1:0.0+git0+bf04291309-r0.7) [version-going-backwards]
linux-firmware-0.0+gitAUTOINC+bf04291309: Package version for package linux-firmware-ibt-12-16 went backwards which would break package feeds from (1:0.0+git0+bf04291309-r0.8 to 1:0.0+git0+bf04291309-r0.7) [version-going-backwards]
linux-firmware-0.0+gitAUTOINC+bf04291309: Package version for package linux-firmware-ibt-hw-37-7 went backwards which would break package feeds from (1:0.0+git0+bf04291309-r0.8 to 1:0.0+git0+bf04291309-r0.7) [version-going-backwards]
linux-firmware-0.0+gitAUTOINC+bf04291309: Package version for package linux-firmware-ibt-hw-37-8 went backwards which would break package feeds from (1:0.0+git0+bf04291309-r0.8 to 1:0.0+git0+bf04291309-r0.7) [version-going-backwards]
linux-firmware-0.0+gitAUTOINC+bf04291309: Package version for package linux-firmware-ibt-license went backwards which would break package feeds from (1:0.0+git0+bf04291309-r0.8 to 1:0.0+git0+bf04291309-r0.7) [version-going-backwards]
linux-firmware-0.0+gitAUTOINC+bf04291309: Package version for package linux-firmware-ibt-misc went backwards which would break package feeds from (1:0.0+git0+bf04291309-r0.8 to 1:0.0+git0+bf04291309-r0.7) [version-going-backwards]
linux-firmware-0.0+gitAUTOINC+bf04291309: Package version for package linux-firmware-ibt went backwards which would break package feeds from (1:0.0+git0+bf04291309-r0.8 to 1:0.0+git0+bf04291309-r0.7) [version-going-backwards]
linux-firmware-0.0+gitAUTOINC+bf04291309: Package version for package linux-firmware-imx-sdma-imx6q went backwards which would break package feeds from (1:0.0+git0+bf04291309-r0.8 to 1:0.0+git0+bf04291309-r0.7) [version-going-backwards]
linux-firmware-0.0+gitAUTOINC+bf04291309: Package version for package linux-firmware-imx-sdma-imx7d went backwards which would break package feeds from (1:0.0+git0+bf04291309-r0.8 to 1:0.0+git0+bf04291309-r0.7) [version-going-backwards]
linux-firmware-0.0+gitAUTOINC+bf04291309: Package version for package linux-firmware-imx-sdma-license went backwards which would break package feeds from (1:0.0+git0+bf04291309-r0.8 to 1:0.0+git0+bf04291309-r0.7) [version-going-backwards]
linux-firmware-0.0+gitAUTOINC+bf04291309: Package version for package linux-firmware-iwlwifi-135-6 went backwards which would break package feeds from (1:0.0+git0+bf04291309-r0.8 to 1:0.0+git0+bf04291309-r0.7) [version-going-backwards]
linux-firmware-0.0+gitAUTOINC+bf04291309: Package version for package linux-firmware-iwlwifi-3160-10 went backwards which would break package feeds from (1:0.0+git0+bf04291309-r0.8 to 1:0.0+git0+bf04291309-r0.7) [version-going-backwards]
linux-firmware-0.0+gitAUTOINC+bf04291309: Package version for package linux-firmware-iwlwifi-3160-12 went backwards which would break package feeds from (1:0.0+git0+bf04291309-r0.8 to 1:0.0+git0+bf04291309-r0.7) [version-going-backwards]
linux-firmware-0.0+gitAUTOINC+bf04291309: Package version for package linux-firmware-iwlwifi-3160-13 went backwards which would break package feeds from (1:0.0+git0+bf04291309-r0.8 to 1:0.0+git0+bf04291309-r0.7) [version-going-backwards]
linux-firmware-0.0+gitAUTOINC+bf04291309: Package version for package linux-firmware-iwlwifi-3160-16 went backwards which would break package feeds from (1:0.0+git0+bf04291309-r0.8 to 1:0.0+git0+bf04291309-r0.7) [version-going-backwards]
linux-firmware-0.0+gitAUTOINC+bf04291309: Package version for package linux-firmware-iwlwifi-3160-17 went backwards which would break package feeds from (1:0.0+git0+bf04291309-r0.8 to 1:0.0+git0+bf04291309-r0.7) [version-going-backwards]
linux-firmware-0.0+gitAUTOINC+bf04291309: Package version for package linux-firmware-iwlwifi-3160-7 went backwards which would break package feeds from (1:0.0+git0+bf04291309-r0.8 to 1:0.0+git0+bf04291309-r0.7) [version-going-backwards]
linux-firmware-0.0+gitAUTOINC+bf04291309: Package version for package linux-firmware-iwlwifi-3160-8 went backwards which would break package feeds from (1:0.0+git0+bf04291309-r0.8 to 1:0.0+git0+bf04291309-r0.7) [version-going-backwards]
linux-firmware-0.0+gitAUTOINC+bf04291309: Package version for package linux-firmware-iwlwifi-3160-9 went backwards which would break package feeds from (1:0.0+git0+bf04291309-r0.8 to 1:0.0+git0+bf04291309-r0.7) [version-going-backwards]
linux-firmware-0.0+gitAUTOINC+bf04291309: Package version for package linux-firmware-iwlwifi-6000-4 went backwards which would break package feeds from (1:0.0+git0+bf04291309-r0.8 to 1:0.0+git0+bf04291309-r0.7) [version-going-backwards]
linux-firmware-0.0+gitAUTOINC+bf04291309: Package version for package linux-firmware-iwlwifi-6000g2a-5 went backwards which would break package feeds from (1:0.0+git0+bf04291309-r0.8 to 1:0.0+git0+bf04291309-r0.7) [version-going-backwards]
linux-firmware-0.0+gitAUTOINC+bf04291309: Package version for package linux-firmware-iwlwifi-6000g2a-6 went backwards which would break package feeds from (1:0.0+git0+bf04291309-r0.8 to 1:0.0+git0+bf04291309-r0.7) [version-going-backwards]
linux-firmware-0.0+gitAUTOINC+bf04291309: Package version for package linux-firmware-iwlwifi-6000g2b-5 went backwards which would break package feeds from (1:0.0+git0+bf04291309-r0.8 to 1:0.0+git0+bf04291309-r0.7) [version-going-backwards]
linux-firmware-0.0+gitAUTOINC+bf04291309: Package version for package linux-firmware-iwlwifi-6000g2b-6 went backwards which would break package feeds from (1:0.0+git0+bf04291309-r0.8 to 1:0.0+git0+bf04291309-r0.7) [version-going-backwards]
linux-firmware-0.0+gitAUTOINC+bf04291309: Package version for package linux-firmware-iwlwifi-6050-4 went backwards which would break package feeds from (1:0.0+git0+bf04291309-r0.8 to 1:0.0+git0+bf04291309-r0.7) [version-going-backwards]
linux-firmware-0.0+gitAUTOINC+bf04291309: Package version for package linux-firmware-iwlwifi-6050-5 went backwards which would break package feeds from (1:0.0+git0+bf04291309-r0.8 to 1:0.0+git0+bf04291309-r0.7) [version-going-backwards]
linux-firmware-0.0+gitAUTOINC+bf04291309: Package version for package linux-firmware-iwlwifi-7260 went backwards which would break package feeds from (1:0.0+git0+bf04291309-r0.8 to 1:0.0+git0+bf04291309-r0.7) [version-going-backwards]
linux-firmware-0.0+gitAUTOINC+bf04291309: Package version for package linux-firmware-iwlwifi-7265d went backwards which would break package feeds from (1:0.0+git0+bf04291309-r0.8 to 1:0.0+git0+bf04291309-r0.7) [version-going-backwards]
linux-firmware-0.0+gitAUTOINC+bf04291309: Package version for package linux-firmware-iwlwifi-7265 went backwards which would break package feeds from (1:0.0+git0+bf04291309-r0.8 to 1:0.0+git0+bf04291309-r0.7) [version-going-backwards]
linux-firmware-0.0+gitAUTOINC+bf04291309: Package version for package linux-firmware-iwlwifi-8000c went backwards which would break package feeds from (1:0.0+git0+bf04291309-r0.8 to 1:0.0+git0+bf04291309-r0.7) [version-going-backwards]
linux-firmware-0.0+gitAUTOINC+bf04291309: Package version for package linux-firmware-iwlwifi-8265 went backwards which would break package feeds from (1:0.0+git0+bf04291309-r0.8 to 1:0.0+git0+bf04291309-r0.7) [version-going-backwards]
linux-firmware-0.0+gitAUTOINC+bf04291309: Package version for package linux-firmware-iwlwifi-license went backwards which would break package feeds from (1:0.0+git0+bf04291309-r0.8 to 1:0.0+git0+bf04291309-r0.7) [version-going-backwards]
linux-firmware-0.0+gitAUTOINC+bf04291309: Package version for package linux-firmware-iwlwifi-misc went backwards which would break package feeds from (1:0.0+git0+bf04291309-r0.8 to 1:0.0+git0+bf04291309-r0.7) [version-going-backwards]
linux-firmware-0.0+gitAUTOINC+bf04291309: Package version for package linux-firmware-iwlwifi went backwards which would break package feeds from (1:0.0+git0+bf04291309-r0.8 to 1:0.0+git0+bf04291309-r0.7) [version-going-backwards]
linux-firmware-0.0+gitAUTOINC+bf04291309: Package version for package linux-firmware-license went backwards which would break package feeds from (1:0.0+git0+bf04291309-r0.8 to 1:0.0+git0+bf04291309-r0.7) [version-going-backwards]
linux-firmware-0.0+gitAUTOINC+bf04291309: Package version for package linux-firmware-locale went backwards which would break package feeds from (1:0.0+git0+bf04291309-r0.8 to 1:0.0+git0+bf04291309-r0.7) [version-going-backwards]
linux-firmware-0.0+gitAUTOINC+bf04291309: Package version for package linux-firmware-marvell-license went backwards which would break package feeds from (1:0.0+git0+bf04291309-r0.8 to 1:0.0+git0+bf04291309-r0.7) [version-going-backwards]
linux-firmware-0.0+gitAUTOINC+bf04291309: Package version for package linux-firmware-mt7601u-license went backwards which would break package feeds from (1:0.0+git0+bf04291309-r0.8 to 1:0.0+git0+bf04291309-r0.7) [version-going-backwards]
linux-firmware-0.0+gitAUTOINC+bf04291309: Package version for package linux-firmware-mt7601u went backwards which would break package feeds from (1:0.0+git0+bf04291309-r0.8 to 1:0.0+git0+bf04291309-r0.7) [version-going-backwards]
linux-firmware-0.0+gitAUTOINC+bf04291309: Package version for package linux-firmware-netronome-license went backwards which would break package feeds from (1:0.0+git0+bf04291309-r0.8 to 1:0.0+git0+bf04291309-r0.7) [version-going-backwards]
linux-firmware-0.0+gitAUTOINC+bf04291309: Package version for package linux-firmware-netronome went backwards which would break package feeds from (1:0.0+git0+bf04291309-r0.8 to 1:0.0+git0+bf04291309-r0.7) [version-going-backwards]
linux-firmware-0.0+gitAUTOINC+bf04291309: Package version for package linux-firmware-pcie8897 went backwards which would break package feeds from (1:0.0+git0+bf04291309-r0.8 to 1:0.0+git0+bf04291309-r0.7) [version-going-backwards]
linux-firmware-0.0+gitAUTOINC+bf04291309: Package version for package linux-firmware-pcie8997 went backwards which would break package feeds from (1:0.0+git0+bf04291309-r0.8 to 1:0.0+git0+bf04291309-r0.7) [version-going-backwards]
linux-firmware-0.0+gitAUTOINC+bf04291309: Package version for package linux-firmware-qat-license went backwards which would break package feeds from (1:0.0+git0+bf04291309-r0.8 to 1:0.0+git0+bf04291309-r0.7) [version-going-backwards]
linux-firmware-0.0+gitAUTOINC+bf04291309: Package version for package linux-firmware-qat went backwards which would break package feeds from (1:0.0+git0+bf04291309-r0.8 to 1:0.0+git0+bf04291309-r0.7) [version-going-backwards]
linux-firmware-0.0+gitAUTOINC+bf04291309: Package version for package linux-firmware-qca went backwards which would break package feeds from (1:0.0+git0+bf04291309-r0.8 to 1:0.0+git0+bf04291309-r0.7) [version-going-backwards]
linux-firmware-0.0+gitAUTOINC+bf04291309: Package version for package linux-firmware-radeon-license went backwards which would break package feeds from (1:0.0+git0+bf04291309-r0.8 to 1:0.0+git0+bf04291309-r0.7) [version-going-backwards]
linux-firmware-0.0+gitAUTOINC+bf04291309: Package version for package linux-firmware-radeon went backwards which would break package feeds from (1:0.0+git0+bf04291309-r0.8 to 1:0.0+git0+bf04291309-r0.7) [version-going-backwards]
linux-firmware-0.0+gitAUTOINC+bf04291309: Package version for package linux-firmware-ralink-license went backwards which would break package feeds from (1:0.0+git0+bf04291309-r0.8 to 1:0.0+git0+bf04291309-r0.7) [version-going-backwards]
linux-firmware-0.0+gitAUTOINC+bf04291309: Package version for package linux-firmware-ralink went backwards which would break package feeds from (1:0.0+git0+bf04291309-r0.8 to 1:0.0+git0+bf04291309-r0.7) [version-going-backwards]
linux-firmware-0.0+gitAUTOINC+bf04291309: Package version for package linux-firmware-rtl8188 went backwards which would break package feeds from (1:0.0+git0+bf04291309-r0.8 to 1:0.0+git0+bf04291309-r0.7) [version-going-backwards]
linux-firmware-0.0+gitAUTOINC+bf04291309: Package version for package linux-firmware-rtl8192ce went backwards which would break package feeds from (1:0.0+git0+bf04291309-r0.8 to 1:0.0+git0+bf04291309-r0.7) [version-going-backwards]
linux-firmware-0.0+gitAUTOINC+bf04291309: Package version for package linux-firmware-rtl8192cu went backwards which would break package feeds from (1:0.0+git0+bf04291309-r0.8 to 1:0.0+git0+bf04291309-r0.7) [version-going-backwards]
linux-firmware-0.0+gitAUTOINC+bf04291309: Package version for package linux-firmware-rtl8192su went backwards which would break package feeds from (1:0.0+git0+bf04291309-r0.8 to 1:0.0+git0+bf04291309-r0.7) [version-going-backwards]
linux-firmware-0.0+gitAUTOINC+bf04291309: Package version for package linux-firmware-rtl8723 went backwards which would break package feeds from (1:0.0+git0+bf04291309-r0.8 to 1:0.0+git0+bf04291309-r0.7) [version-going-backwards]
linux-firmware-0.0+gitAUTOINC+bf04291309: Package version for package linux-firmware-rtl8821 went backwards which would break package feeds from (1:0.0+git0+bf04291309-r0.8 to 1:0.0+git0+bf04291309-r0.7) [version-going-backwards]
linux-firmware-0.0+gitAUTOINC+bf04291309: Package version for package linux-firmware-rtl-license went backwards which would break package feeds from (1:0.0+git0+bf04291309-r0.8 to 1:0.0+git0+bf04291309-r0.7) [version-going-backwards]
linux-firmware-0.0+gitAUTOINC+bf04291309: Package version for package linux-firmware-sd8686 went backwards which would break package feeds from (1:0.0+git0+bf04291309-r0.8 to 1:0.0+git0+bf04291309-r0.7) [version-going-backwards]
linux-firmware-0.0+gitAUTOINC+bf04291309: Package version for package linux-firmware-sd8688 went backwards which would break package feeds from (1:0.0+git0+bf04291309-r0.8 to 1:0.0+git0+bf04291309-r0.7) [version-going-backwards]
linux-firmware-0.0+gitAUTOINC+bf04291309: Package version for package linux-firmware-sd8787 went backwards which would break package feeds from (1:0.0+git0+bf04291309-r0.8 to 1:0.0+git0+bf04291309-r0.7) [version-going-backwards]
linux-firmware-0.0+gitAUTOINC+bf04291309: Package version for package linux-firmware-sd8797 went backwards which would break package feeds from (1:0.0+git0+bf04291309-r0.8 to 1:0.0+git0+bf04291309-r0.7) [version-going-backwards]
linux-firmware-0.0+gitAUTOINC+bf04291309: Package version for package linux-firmware-sd8801 went backwards which would break package feeds from (1:0.0+git0+bf04291309-r0.8 to 1:0.0+git0+bf04291309-r0.7) [version-going-backwards]
linux-firmware-0.0+gitAUTOINC+bf04291309: Package version for package linux-firmware-sd8887 went backwards which would break package feeds from (1:0.0+git0+bf04291309-r0.8 to 1:0.0+git0+bf04291309-r0.7) [version-going-backwards]
linux-firmware-0.0+gitAUTOINC+bf04291309: Package version for package linux-firmware-sd8897 went backwards which would break package feeds from (1:0.0+git0+bf04291309-r0.8 to 1:0.0+git0+bf04291309-r0.7) [version-going-backwards]
linux-firmware-0.0+gitAUTOINC+bf04291309: Package version for package linux-firmware-staticdev went backwards which would break package feeds from (1:0.0+git0+bf04291309-r0.8 to 1:0.0+git0+bf04291309-r0.7) [version-going-backwards]
linux-firmware-0.0+gitAUTOINC+bf04291309: Package version for package linux-firmware-ti-connectivity-license went backwards which would break package feeds from (1:0.0+git0+bf04291309-r0.8 to 1:0.0+git0+bf04291309-r0.7) [version-going-backwards]
linux-firmware-0.0+gitAUTOINC+bf04291309: Package version for package linux-firmware-vt6656-license went backwards which would break package feeds from (1:0.0+git0+bf04291309-r0.8 to 1:0.0+git0+bf04291309-r0.7) [version-going-backwards]
linux-firmware-0.0+gitAUTOINC+bf04291309: Package version for package linux-firmware-vt6656 went backwards which would break package feeds from (1:0.0+git0+bf04291309-r0.8 to 1:0.0+git0+bf04291309-r0.7) [version-going-backwards]
linux-firmware-0.0+gitAUTOINC+bf04291309: Package version for package linux-firmware went backwards which would break package feeds from (1:0.0+git0+bf04291309-r0.8 to 1:0.0+git0+bf04291309-r0.7) [version-going-backwards]
linux-firmware-0.0+gitAUTOINC+bf04291309: Package version for package linux-firmware-whence-license went backwards which would break package feeds from (1:0.0+git0+bf04291309-r0.8 to 1:0.0+git0+bf04291309-r0.7) [version-going-backwards]
linux-firmware-0.0+gitAUTOINC+bf04291309: Package version for package linux-firmware-wl12xx went backwards which would break package feeds from (1:0.0+git0+bf04291309-r0.8 to 1:0.0+git0+bf04291309-r0.7) [version-going-backwards]
linux-firmware-0.0+gitAUTOINC+bf04291309: Package version for package linux-firmware-wl18xx went backwards which would break package feeds from (1:0.0+git0+bf04291309-r0.8 to 1:0.0+git0+bf04291309-r0.7) [version-going-backwards]
mplayer-common-0.0.1: Package version for package mplayer-common-dbg went backwards which would break package feeds from (0:0.0.1-r1.8 to 0:0.0.1-r1.7) [version-going-backwards]
mplayer-common-0.0.1: Package version for package mplayer-common-dev went backwards which would break package feeds from (0:0.0.1-r1.8 to 0:0.0.1-r1.7) [version-going-backwards]
mplayer-common-0.0.1: Package version for package mplayer-common-doc went backwards which would break package feeds from (0:0.0.1-r1.8 to 0:0.0.1-r1.7) [version-going-backwards]
mplayer-common-0.0.1: Package version for package mplayer-common-locale went backwards which would break package feeds from (0:0.0.1-r1.8 to 0:0.0.1-r1.7) [version-going-backwards]
mplayer-common-0.0.1: Package version for package mplayer-common-staticdev went backwards which would break package feeds from (0:0.0.1-r1.8 to 0:0.0.1-r1.7) [version-going-backwards]
mplayer-common-0.0.1: Package version for package mplayer-common went backwards which would break package feeds from (0:0.0.1-r1.8 to 0:0.0.1-r1.7) [version-going-backwards]
nativesdk-buildtools-perl-dummy-1.0: Package version for package nativesdk-buildtools-perl-dummy-dbg went backwards which would break package feeds from (0:1.0-r2.8 to 0:1.0-r2.7) [version-going-backwards]
nativesdk-buildtools-perl-dummy-1.0: Package version for package nativesdk-buildtools-perl-dummy-dev went backwards which would break package feeds from (0:1.0-r2.8 to 0:1.0-r2.7) [version-going-backwards]
nativesdk-buildtools-perl-dummy-1.0: Package version for package nativesdk-buildtools-perl-dummy-doc went backwards which would break package feeds from (0:1.0-r2.8 to 0:1.0-r2.7) [version-going-backwards]
nativesdk-buildtools-perl-dummy-1.0: Package version for package nativesdk-buildtools-perl-dummy-locale went backwards which would break package feeds from (0:1.0-r2.8 to 0:1.0-r2.7) [version-going-backwards]
nativesdk-buildtools-perl-dummy-1.0: Package version for package nativesdk-buildtools-perl-dummy-staticdev went backwards which would break package feeds from (0:1.0-r2.8 to 0:1.0-r2.7) [version-going-backwards]
nativesdk-buildtools-perl-dummy-1.0: Package version for package nativesdk-buildtools-perl-dummy went backwards which would break package feeds from (0:1.0-r2.8 to 0:1.0-r2.7) [version-going-backwards]
openzone-1.2.3: Package version for package openzone-black-slim went backwards which would break package feeds from (0:1.2.3-r0.8 to 0:1.2.3-r0.7) [version-going-backwards]
openzone-1.2.3: Package version for package openzone-black went backwards which would break package feeds from (0:1.2.3-r0.8 to 0:1.2.3-r0.7) [version-going-backwards]
openzone-1.2.3: Package version for package openzone-dbg went backwards which would break package feeds from (0:1.2.3-r0.8 to 0:1.2.3-r0.7) [version-going-backwards]
openzone-1.2.3: Package version for package openzone-dev went backwards which would break package feeds from (0:1.2.3-r0.8 to 0:1.2.3-r0.7) [version-going-backwards]
openzone-1.2.3: Package version for package openzone-doc went backwards which would break package feeds from (0:1.2.3-r0.8 to 0:1.2.3-r0.7) [version-going-backwards]
openzone-1.2.3: Package version for package openzone-fire-slim went backwards which would break package feeds from (0:1.2.3-r0.8 to 0:1.2.3-r0.7) [version-going-backwards]
openzone-1.2.3: Package version for package openzone-fire went backwards which would break package feeds from (0:1.2.3-r0.8 to 0:1.2.3-r0.7) [version-going-backwards]
openzone-1.2.3: Package version for package openzone-ice-slim went backwards which would break package feeds from (0:1.2.3-r0.8 to 0:1.2.3-r0.7) [version-going-backwards]
openzone-1.2.3: Package version for package openzone-ice went backwards which would break package feeds from (0:1.2.3-r0.8 to 0:1.2.3-r0.7) [version-going-backwards]
openzone-1.2.3: Package version for package openzone-locale went backwards which would break package feeds from (0:1.2.3-r0.8 to 0:1.2.3-r0.7) [version-going-backwards]
openzone-1.2.3: Package version for package openzone-staticdev went backwards which would break package feeds from (0:1.2.3-r0.8 to 0:1.2.3-r0.7) [version-going-backwards]
openzone-1.2.3: Package version for package openzone went backwards which would break package feeds from (0:1.2.3-r0.8 to 0:1.2.3-r0.7) [version-going-backwards]
openzone-1.2.3: Package version for package openzone-white-slim went backwards which would break package feeds from (0:1.2.3-r0.8 to 0:1.2.3-r0.7) [version-going-backwards]
openzone-1.2.3: Package version for package openzone-white went backwards which would break package feeds from (0:1.2.3-r0.8 to 0:1.2.3-r0.7) [version-going-backwards]
os-release-1.0: Package version for package os-release-dbg went backwards which would break package feeds from (0:1.0-r0.8 to 0:1.0-r0.7) [version-going-backwards]
os-release-1.0: Package version for package os-release-dev went backwards which would break package feeds from (0:1.0-r0.8 to 0:1.0-r0.7) [version-going-backwards]
os-release-1.0: Package version for package os-release-doc went backwards which would break package feeds from (0:1.0-r0.8 to 0:1.0-r0.7) [version-going-backwards]
os-release-1.0: Package version for package os-release-locale went backwards which would break package feeds from (0:1.0-r0.8 to 0:1.0-r0.7) [version-going-backwards]
os-release-1.0: Package version for package os-release-staticdev went backwards which would break package feeds from (0:1.0-r0.8 to 0:1.0-r0.7) [version-going-backwards]
os-release-1.0: Package version for package os-release went backwards which would break package feeds from (0:1.0-r0.8 to 0:1.0-r0.7) [version-going-backwards]
packagegroup-core-buildessential-1.0: Package version for package packagegroup-core-buildessential-dbg went backwards which would break package feeds from (0:1.0-r0.8 to 0:1.0-r0.7) [version-going-backwards]
packagegroup-core-buildessential-1.0: Package version for package packagegroup-core-buildessential-dev went backwards which would break package feeds from (0:1.0-r0.8 to 0:1.0-r0.7) [version-going-backwards]
packagegroup-core-buildessential-1.0: Package version for package packagegroup-core-buildessential-ptest went backwards which would break package feeds from (0:1.0-r0.8 to 0:1.0-r0.7) [version-going-backwards]
packagegroup-core-buildessential-1.0: Package version for package packagegroup-core-buildessential went backwards which would break package feeds from (0:1.0-r0.8 to 0:1.0-r0.7) [version-going-backwards]
packagegroup-core-clutter-1.0: Package version for package packagegroup-core-clutter-core-dbg went backwards which would break package feeds from (0:1.0-r6.8 to 0:1.0-r6.7) [version-going-backwards]
packagegroup-core-clutter-1.0: Package version for package packagegroup-core-clutter-core-dev went backwards which would break package feeds from (0:1.0-r6.8 to 0:1.0-r6.7) [version-going-backwards]
packagegroup-core-clutter-1.0: Package version for package packagegroup-core-clutter-core-ptest went backwards which would break package feeds from (0:1.0-r6.8 to 0:1.0-r6.7) [version-going-backwards]
packagegroup-core-clutter-1.0: Package version for package packagegroup-core-clutter-core went backwards which would break package feeds from (0:1.0-r6.8 to 0:1.0-r6.7) [version-going-backwards]
packagegroup-core-device-devel-1.0: Package version for package packagegroup-core-device-devel-dbg went backwards which would break package feeds from (0:1.0-r1.8 to 0:1.0-r1.7) [version-going-backwards]
packagegroup-core-device-devel-1.0: Package version for package packagegroup-core-device-devel-dev went backwards which would break package feeds from (0:1.0-r1.8 to 0:1.0-r1.7) [version-going-backwards]
packagegroup-core-device-devel-1.0: Package version for package packagegroup-core-device-devel-ptest went backwards which would break package feeds from (0:1.0-r1.8 to 0:1.0-r1.7) [version-going-backwards]
packagegroup-core-device-devel-1.0: Package version for package packagegroup-core-device-devel went backwards which would break package feeds from (0:1.0-r1.8 to 0:1.0-r1.7) [version-going-backwards]
packagegroup-core-eclipse-debug-1.0: Package version for package packagegroup-core-eclipse-debug-dbg went backwards which would break package feeds from (0:1.0-r0.8 to 0:1.0-r0.7) [version-going-backwards]
packagegroup-core-eclipse-debug-1.0: Package version for package packagegroup-core-eclipse-debug-dev went backwards which would break package feeds from (0:1.0-r0.8 to 0:1.0-r0.7) [version-going-backwards]
packagegroup-core-eclipse-debug-1.0: Package version for package packagegroup-core-eclipse-debug-ptest went backwards which would break package feeds from (0:1.0-r0.8 to 0:1.0-r0.7) [version-going-backwards]
packagegroup-core-eclipse-debug-1.0: Package version for package packagegroup-core-eclipse-debug went backwards which would break package feeds from (0:1.0-r0.8 to 0:1.0-r0.7) [version-going-backwards]
packagegroup-core-full-cmdline-1.0: Package version for package packagegroup-core-full-cmdline-dbg went backwards which would break package feeds from (0:1.0-r6.8 to 0:1.0-r6.7) [version-going-backwards]
packagegroup-core-full-cmdline-1.0: Package version for package packagegroup-core-full-cmdline-dev-utils-dbg went backwards which would break package feeds from (0:1.0-r6.8 to 0:1.0-r6.7) [version-going-backwards]
packagegroup-core-full-cmdline-1.0: Package version for package packagegroup-core-full-cmdline-dev-utils-dev went backwards which would break package feeds from (0:1.0-r6.8 to 0:1.0-r6.7) [version-going-backwards]
packagegroup-core-full-cmdline-1.0: Package version for package packagegroup-core-full-cmdline-dev-utils-ptest went backwards which would break package feeds from (0:1.0-r6.8 to 0:1.0-r6.7) [version-going-backwards]
packagegroup-core-full-cmdline-1.0: Package version for package packagegroup-core-full-cmdline-dev-utils went backwards which would break package feeds from (0:1.0-r6.8 to 0:1.0-r6.7) [version-going-backwards]
packagegroup-core-full-cmdline-1.0: Package version for package packagegroup-core-full-cmdline-dev went backwards which would break package feeds from (0:1.0-r6.8 to 0:1.0-r6.7) [version-going-backwards]
packagegroup-core-full-cmdline-1.0: Package version for package packagegroup-core-full-cmdline-extended-dbg went backwards which would break package feeds from (0:1.0-r6.8 to 0:1.0-r6.7) [version-going-backwards]
packagegroup-core-full-cmdline-1.0: Package version for package packagegroup-core-full-cmdline-extended-dev went backwards which would break package feeds from (0:1.0-r6.8 to 0:1.0-r6.7) [version-going-backwards]
packagegroup-core-full-cmdline-1.0: Package version for package packagegroup-core-full-cmdline-extended-ptest went backwards which would break package feeds from (0:1.0-r6.8 to 0:1.0-r6.7) [version-going-backwards]
packagegroup-core-full-cmdline-1.0: Package version for package packagegroup-core-full-cmdline-extended went backwards which would break package feeds from (0:1.0-r6.8 to 0:1.0-r6.7) [version-going-backwards]
packagegroup-core-full-cmdline-1.0: Package version for package packagegroup-core-full-cmdline-initscripts-dbg went backwards which would break package feeds from (0:1.0-r6.8 to 0:1.0-r6.7) [version-going-backwards]
packagegroup-core-full-cmdline-1.0: Package version for package packagegroup-core-full-cmdline-initscripts-dev went backwards which would break package feeds from (0:1.0-r6.8 to 0:1.0-r6.7) [version-going-backwards]
packagegroup-core-full-cmdline-1.0: Package version for package packagegroup-core-full-cmdline-initscripts-ptest went backwards which would break package feeds from (0:1.0-r6.8 to 0:1.0-r6.7) [version-going-backwards]
packagegroup-core-full-cmdline-1.0: Package version for package packagegroup-core-full-cmdline-initscripts went backwards which would break package feeds from (0:1.0-r6.8 to 0:1.0-r6.7) [version-going-backwards]
packagegroup-core-full-cmdline-1.0: Package version for package packagegroup-core-full-cmdline-libs-dbg went backwards which would break package feeds from (0:1.0-r6.8 to 0:1.0-r6.7) [version-going-backwards]
packagegroup-core-full-cmdline-1.0: Package version for package packagegroup-core-full-cmdline-libs-dev went backwards which would break package feeds from (0:1.0-r6.8 to 0:1.0-r6.7) [version-going-backwards]
packagegroup-core-full-cmdline-1.0: Package version for package packagegroup-core-full-cmdline-libs-ptest went backwards which would break package feeds from (0:1.0-r6.8 to 0:1.0-r6.7) [version-going-backwards]
packagegroup-core-full-cmdline-1.0: Package version for package packagegroup-core-full-cmdline-libs went backwards which would break package feeds from (0:1.0-r6.8 to 0:1.0-r6.7) [version-going-backwards]
packagegroup-core-full-cmdline-1.0: Package version for package packagegroup-core-full-cmdline-multiuser-dbg went backwards which would break package feeds from (0:1.0-r6.8 to 0:1.0-r6.7) [version-going-backwards]
packagegroup-core-full-cmdline-1.0: Package version for package packagegroup-core-full-cmdline-multiuser-dev went backwards which would break package feeds from (0:1.0-r6.8 to 0:1.0-r6.7) [version-going-backwards]
packagegroup-core-full-cmdline-1.0: Package version for package packagegroup-core-full-cmdline-multiuser-ptest went backwards which would break package feeds from (0:1.0-r6.8 to 0:1.0-r6.7) [version-going-backwards]
packagegroup-core-full-cmdline-1.0: Package version for package packagegroup-core-full-cmdline-multiuser went backwards which would break package feeds from (0:1.0-r6.8 to 0:1.0-r6.7) [version-going-backwards]
packagegroup-core-full-cmdline-1.0: Package version for package packagegroup-core-full-cmdline-ptest went backwards which would break package feeds from (0:1.0-r6.8 to 0:1.0-r6.7) [version-going-backwards]
packagegroup-core-full-cmdline-1.0: Package version for package packagegroup-core-full-cmdline-sys-services-dbg went backwards which would break package feeds from (0:1.0-r6.8 to 0:1.0-r6.7) [version-going-backwards]
packagegroup-core-full-cmdline-1.0: Package version for package packagegroup-core-full-cmdline-sys-services-dev went backwards which would break package feeds from (0:1.0-r6.8 to 0:1.0-r6.7) [version-going-backwards]
packagegroup-core-full-cmdline-1.0: Package version for package packagegroup-core-full-cmdline-sys-services-ptest went backwards which would break package feeds from (0:1.0-r6.8 to 0:1.0-r6.7) [version-going-backwards]
packagegroup-core-full-cmdline-1.0: Package version for package packagegroup-core-full-cmdline-sys-services went backwards which would break package feeds from (0:1.0-r6.8 to 0:1.0-r6.7) [version-going-backwards]
packagegroup-core-full-cmdline-1.0: Package version for package packagegroup-core-full-cmdline-utils-dbg went backwards which would break package feeds from (0:1.0-r6.8 to 0:1.0-r6.7) [version-going-backwards]
packagegroup-core-full-cmdline-1.0: Package version for package packagegroup-core-full-cmdline-utils-dev went backwards which would break package feeds from (0:1.0-r6.8 to 0:1.0-r6.7) [version-going-backwards]
packagegroup-core-full-cmdline-1.0: Package version for package packagegroup-core-full-cmdline-utils-ptest went backwards which would break package feeds from (0:1.0-r6.8 to 0:1.0-r6.7) [version-going-backwards]
packagegroup-core-full-cmdline-1.0: Package version for package packagegroup-core-full-cmdline-utils went backwards which would break package feeds from (0:1.0-r6.8 to 0:1.0-r6.7) [version-going-backwards]
packagegroup-core-full-cmdline-1.0: Package version for package packagegroup-core-full-cmdline went backwards which would break package feeds from (0:1.0-r6.8 to 0:1.0-r6.7) [version-going-backwards]
packagegroup-core-nfs-1.0: Package version for package packagegroup-core-nfs-client-dbg went backwards which would break package feeds from (0:1.0-r2.8 to 0:1.0-r2.7) [version-going-backwards]
packagegroup-core-nfs-1.0: Package version for package packagegroup-core-nfs-client-dev went backwards which would break package feeds from (0:1.0-r2.8 to 0:1.0-r2.7) [version-going-backwards]
packagegroup-core-nfs-1.0: Package version for package packagegroup-core-nfs-client-ptest went backwards which would break package feeds from (0:1.0-r2.8 to 0:1.0-r2.7) [version-going-backwards]
packagegroup-core-nfs-1.0: Package version for package packagegroup-core-nfs-client went backwards which would break package feeds from (0:1.0-r2.8 to 0:1.0-r2.7) [version-going-backwards]
packagegroup-core-nfs-1.0: Package version for package packagegroup-core-nfs-server-dbg went backwards which would break package feeds from (0:1.0-r2.8 to 0:1.0-r2.7) [version-going-backwards]
packagegroup-core-nfs-1.0: Package version for package packagegroup-core-nfs-server-dev went backwards which would break package feeds from (0:1.0-r2.8 to 0:1.0-r2.7) [version-going-backwards]
packagegroup-core-nfs-1.0: Package version for package packagegroup-core-nfs-server-ptest went backwards which would break package feeds from (0:1.0-r2.8 to 0:1.0-r2.7) [version-going-backwards]
packagegroup-core-nfs-1.0: Package version for package packagegroup-core-nfs-server went backwards which would break package feeds from (0:1.0-r2.8 to 0:1.0-r2.7) [version-going-backwards]
packagegroup-core-ssh-dropbear-1.0: Package version for package packagegroup-core-ssh-dropbear-dbg went backwards which would break package feeds from (0:1.0-r1.8 to 0:1.0-r1.7) [version-going-backwards]
packagegroup-core-ssh-dropbear-1.0: Package version for package packagegroup-core-ssh-dropbear-dev went backwards which would break package feeds from (0:1.0-r1.8 to 0:1.0-r1.7) [version-going-backwards]
packagegroup-core-ssh-dropbear-1.0: Package version for package packagegroup-core-ssh-dropbear-ptest went backwards which would break package feeds from (0:1.0-r1.8 to 0:1.0-r1.7) [version-going-backwards]
packagegroup-core-ssh-dropbear-1.0: Package version for package packagegroup-core-ssh-dropbear went backwards which would break package feeds from (0:1.0-r1.8 to 0:1.0-r1.7) [version-going-backwards]
packagegroup-core-ssh-openssh-1.0: Package version for package packagegroup-core-ssh-openssh-dbg went backwards which would break package feeds from (0:1.0-r1.8 to 0:1.0-r1.7) [version-going-backwards]
packagegroup-core-ssh-openssh-1.0: Package version for package packagegroup-core-ssh-openssh-dev went backwards which would break package feeds from (0:1.0-r1.8 to 0:1.0-r1.7) [version-going-backwards]
packagegroup-core-ssh-openssh-1.0: Package version for package packagegroup-core-ssh-openssh-ptest went backwards which would break package feeds from (0:1.0-r1.8 to 0:1.0-r1.7) [version-going-backwards]
packagegroup-core-ssh-openssh-1.0: Package version for package packagegroup-core-ssh-openssh went backwards which would break package feeds from (0:1.0-r1.8 to 0:1.0-r1.7) [version-going-backwards]
packagegroup-core-standalone-sdk-target-1.0: Package version for package packagegroup-core-standalone-sdk-target-dbg went backwards which would break package feeds from (0:1.0-r8.11 to 0:1.0-r8.10) [version-going-backwards]
packagegroup-core-standalone-sdk-target-1.0: Package version for package packagegroup-core-standalone-sdk-target-dev went backwards which would break package feeds from (0:1.0-r8.11 to 0:1.0-r8.10) [version-going-backwards]
packagegroup-core-standalone-sdk-target-1.0: Package version for package packagegroup-core-standalone-sdk-target-ptest went backwards which would break package feeds from (0:1.0-r8.11 to 0:1.0-r8.10) [version-going-backwards]
packagegroup-core-standalone-sdk-target-1.0: Package version for package packagegroup-core-standalone-sdk-target went backwards which would break package feeds from (0:1.0-r8.11 to 0:1.0-r8.10) [version-going-backwards]
packagegroup-core-tools-debug-1.0: Package version for package packagegroup-core-tools-debug-dbg went backwards which would break package feeds from (0:1.0-r3.11 to 0:1.0-r3.10) [version-going-backwards]
packagegroup-core-tools-debug-1.0: Package version for package packagegroup-core-tools-debug-dev went backwards which would break package feeds from (0:1.0-r3.11 to 0:1.0-r3.10) [version-going-backwards]
packagegroup-core-tools-debug-1.0: Package version for package packagegroup-core-tools-debug-ptest went backwards which would break package feeds from (0:1.0-r3.11 to 0:1.0-r3.10) [version-going-backwards]
packagegroup-core-tools-debug-1.0: Package version for package packagegroup-core-tools-debug went backwards which would break package feeds from (0:1.0-r3.11 to 0:1.0-r3.10) [version-going-backwards]
packagegroup-core-x11-1.0: Package version for package packagegroup-core-x11-dbg went backwards which would break package feeds from (0:1.0-r40.8 to 0:1.0-r40.7) [version-going-backwards]
packagegroup-core-x11-1.0: Package version for package packagegroup-core-x11-dev went backwards which would break package feeds from (0:1.0-r40.8 to 0:1.0-r40.7) [version-going-backwards]
packagegroup-core-x11-1.0: Package version for package packagegroup-core-x11-ptest went backwards which would break package feeds from (0:1.0-r40.8 to 0:1.0-r40.7) [version-going-backwards]
packagegroup-core-x11-1.0: Package version for package packagegroup-core-x11-utils-dbg went backwards which would break package feeds from (0:1.0-r40.8 to 0:1.0-r40.7) [version-going-backwards]
packagegroup-core-x11-1.0: Package version for package packagegroup-core-x11-utils-dev went backwards which would break package feeds from (0:1.0-r40.8 to 0:1.0-r40.7) [version-going-backwards]
packagegroup-core-x11-1.0: Package version for package packagegroup-core-x11-utils-ptest went backwards which would break package feeds from (0:1.0-r40.8 to 0:1.0-r40.7) [version-going-backwards]
packagegroup-core-x11-1.0: Package version for package packagegroup-core-x11-utils went backwards which would break package feeds from (0:1.0-r40.8 to 0:1.0-r40.7) [version-going-backwards]
packagegroup-core-x11-1.0: Package version for package packagegroup-core-x11 went backwards which would break package feeds from (0:1.0-r40.8 to 0:1.0-r40.7) [version-going-backwards]
packagegroup-core-x11-base-1.0: Package version for package packagegroup-core-x11-base-dbg went backwards which would break package feeds from (0:1.0-r1.8 to 0:1.0-r1.7) [version-going-backwards]
packagegroup-core-x11-base-1.0: Package version for package packagegroup-core-x11-base-dev went backwards which would break package feeds from (0:1.0-r1.8 to 0:1.0-r1.7) [version-going-backwards]
packagegroup-core-x11-base-1.0: Package version for package packagegroup-core-x11-base-ptest went backwards which would break package feeds from (0:1.0-r1.8 to 0:1.0-r1.7) [version-going-backwards]
packagegroup-core-x11-base-1.0: Package version for package packagegroup-core-x11-base went backwards which would break package feeds from (0:1.0-r1.8 to 0:1.0-r1.7) [version-going-backwards]
packagegroup-fonts-truetype-1.0: Package version for package packagegroup-fonts-truetype-chinese-dbg went backwards which would break package feeds from (0:1.0-r2.8 to 0:1.0-r2.7) [version-going-backwards]
packagegroup-fonts-truetype-1.0: Package version for package packagegroup-fonts-truetype-chinese-dev went backwards which would break package feeds from (0:1.0-r2.8 to 0:1.0-r2.7) [version-going-backwards]
packagegroup-fonts-truetype-1.0: Package version for package packagegroup-fonts-truetype-chinese-ptest went backwards which would break package feeds from (0:1.0-r2.8 to 0:1.0-r2.7) [version-going-backwards]
packagegroup-fonts-truetype-1.0: Package version for package packagegroup-fonts-truetype-chinese went backwards which would break package feeds from (0:1.0-r2.8 to 0:1.0-r2.7) [version-going-backwards]
packagegroup-fonts-truetype-1.0: Package version for package packagegroup-fonts-truetype-core-dbg went backwards which would break package feeds from (0:1.0-r2.8 to 0:1.0-r2.7) [version-going-backwards]
packagegroup-fonts-truetype-1.0: Package version for package packagegroup-fonts-truetype-core-dev went backwards which would break package feeds from (0:1.0-r2.8 to 0:1.0-r2.7) [version-going-backwards]
packagegroup-fonts-truetype-1.0: Package version for package packagegroup-fonts-truetype-core-ptest went backwards which would break package feeds from (0:1.0-r2.8 to 0:1.0-r2.7) [version-going-backwards]
packagegroup-fonts-truetype-1.0: Package version for package packagegroup-fonts-truetype-core went backwards which would break package feeds from (0:1.0-r2.8 to 0:1.0-r2.7) [version-going-backwards]
packagegroup-fonts-truetype-1.0: Package version for package packagegroup-fonts-truetype-dbg went backwards which would break package feeds from (0:1.0-r2.8 to 0:1.0-r2.7) [version-going-backwards]
packagegroup-fonts-truetype-1.0: Package version for package packagegroup-fonts-truetype-dev went backwards which would break package feeds from (0:1.0-r2.8 to 0:1.0-r2.7) [version-going-backwards]
packagegroup-fonts-truetype-1.0: Package version for package packagegroup-fonts-truetype-japanese-dbg went backwards which would break package feeds from (0:1.0-r2.8 to 0:1.0-r2.7) [version-going-backwards]
packagegroup-fonts-truetype-1.0: Package version for package packagegroup-fonts-truetype-japanese-dev went backwards which would break package feeds from (0:1.0-r2.8 to 0:1.0-r2.7) [version-going-backwards]
packagegroup-fonts-truetype-1.0: Package version for package packagegroup-fonts-truetype-japanese-ptest went backwards which would break package feeds from (0:1.0-r2.8 to 0:1.0-r2.7) [version-going-backwards]
packagegroup-fonts-truetype-1.0: Package version for package packagegroup-fonts-truetype-japanese went backwards which would break package feeds from (0:1.0-r2.8 to 0:1.0-r2.7) [version-going-backwards]
packagegroup-fonts-truetype-1.0: Package version for package packagegroup-fonts-truetype-ptest went backwards which would break package feeds from (0:1.0-r2.8 to 0:1.0-r2.7) [version-going-backwards]
packagegroup-fonts-truetype-1.0: Package version for package packagegroup-fonts-truetype went backwards which would break package feeds from (0:1.0-r2.8 to 0:1.0-r2.7) [version-going-backwards]
packagegroup-go-sdk-target-1.0: Package version for package packagegroup-go-sdk-target-dbg went backwards which would break package feeds from (0:1.0-r0.8 to 0:1.0-r0.7) [version-going-backwards]
packagegroup-go-sdk-target-1.0: Package version for package packagegroup-go-sdk-target-dev went backwards which would break package feeds from (0:1.0-r0.8 to 0:1.0-r0.7) [version-going-backwards]
packagegroup-go-sdk-target-1.0: Package version for package packagegroup-go-sdk-target-ptest went backwards which would break package feeds from (0:1.0-r0.8 to 0:1.0-r0.7) [version-going-backwards]
packagegroup-go-sdk-target-1.0: Package version for package packagegroup-go-sdk-target went backwards which would break package feeds from (0:1.0-r0.8 to 0:1.0-r0.7) [version-going-backwards]
packagegroup-qt5-qtcreator-debug-1.0: Package version for package packagegroup-qt5-qtcreator-debug-dbg went backwards which would break package feeds from (0:1.0-r0.10 to 0:1.0-r0.9) [version-going-backwards]
packagegroup-qt5-qtcreator-debug-1.0: Package version for package packagegroup-qt5-qtcreator-debug-dev went backwards which would break package feeds from (0:1.0-r0.10 to 0:1.0-r0.9) [version-going-backwards]
packagegroup-qt5-qtcreator-debug-1.0: Package version for package packagegroup-qt5-qtcreator-debug-ptest went backwards which would break package feeds from (0:1.0-r0.10 to 0:1.0-r0.9) [version-going-backwards]
packagegroup-qt5-qtcreator-debug-1.0: Package version for package packagegroup-qt5-qtcreator-debug went backwards which would break package feeds from (0:1.0-r0.10 to 0:1.0-r0.9) [version-going-backwards]
packagegroup-qt5-toolchain-target-1.0: Package version for package packagegroup-qt5-toolchain-target went backwards which would break package feeds from (0:1.0-r0.8 to 0:1.0-r0.7) [version-going-backwards]
packagegroup-sdk-target-1.0: Package version for package packagegroup-sdk-target-dbg went backwards which would break package feeds from (0:1.0-r1.8 to 0:1.0-r1.7) [version-going-backwards]
packagegroup-sdk-target-1.0: Package version for package packagegroup-sdk-target-dev went backwards which would break package feeds from (0:1.0-r1.8 to 0:1.0-r1.7) [version-going-backwards]
packagegroup-sdk-target-1.0: Package version for package packagegroup-sdk-target-ptest went backwards which would break package feeds from (0:1.0-r1.8 to 0:1.0-r1.7) [version-going-backwards]
packagegroup-sdk-target-1.0: Package version for package packagegroup-sdk-target went backwards which would break package feeds from (0:1.0-r1.8 to 0:1.0-r1.7) [version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package packagegroup-self-hosted-dbg went backwards which would break package feeds from (0:1.0-r13.11 to 0:1.0-r13.10) [version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package packagegroup-self-hosted-debug-dbg went backwards which would break package feeds from (0:1.0-r13.11 to 0:1.0-r13.10) [version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package packagegroup-self-hosted-debug-dev went backwards which would break package feeds from (0:1.0-r13.11 to 0:1.0-r13.10) [version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package packagegroup-self-hosted-debug-ptest went backwards which would break package feeds from (0:1.0-r13.11 to 0:1.0-r13.10) [version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package packagegroup-self-hosted-debug went backwards which would break package feeds from (0:1.0-r13.11 to 0:1.0-r13.10) [version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package packagegroup-self-hosted-dev went backwards which would break package feeds from (0:1.0-r13.11 to 0:1.0-r13.10) [version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package packagegroup-self-hosted-extended-dbg went backwards which would break package feeds from (0:1.0-r13.11 to 0:1.0-r13.10) [version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package packagegroup-self-hosted-extended-dev went backwards which would break package feeds from (0:1.0-r13.11 to 0:1.0-r13.10) [version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package packagegroup-self-hosted-extended-ptest went backwards which would break package feeds from (0:1.0-r13.11 to 0:1.0-r13.10) [version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package packagegroup-self-hosted-extended went backwards which would break package feeds from (0:1.0-r13.11 to 0:1.0-r13.10) [version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package packagegroup-self-hosted-graphics-dbg went backwards which would break package feeds from (0:1.0-r13.11 to 0:1.0-r13.10) [version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package packagegroup-self-hosted-graphics-dev went backwards which would break package feeds from (0:1.0-r13.11 to 0:1.0-r13.10) [version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package packagegroup-self-hosted-graphics-ptest went backwards which would break package feeds from (0:1.0-r13.11 to 0:1.0-r13.10) [version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package packagegroup-self-hosted-graphics went backwards which would break package feeds from (0:1.0-r13.11 to 0:1.0-r13.10) [version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package packagegroup-self-hosted-host-tools-dbg went backwards which would break package feeds from (0:1.0-r13.11 to 0:1.0-r13.10) [version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package packagegroup-self-hosted-host-tools-dev went backwards which would break package feeds from (0:1.0-r13.11 to 0:1.0-r13.10) [version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package packagegroup-self-hosted-host-tools-ptest went backwards which would break package feeds from (0:1.0-r13.11 to 0:1.0-r13.10) [version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package packagegroup-self-hosted-host-tools went backwards which would break package feeds from (0:1.0-r13.11 to 0:1.0-r13.10) [version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package packagegroup-self-hosted-ptest went backwards which would break package feeds from (0:1.0-r13.11 to 0:1.0-r13.10) [version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package packagegroup-self-hosted-sdk-dbg went backwards which would break package feeds from (0:1.0-r13.11 to 0:1.0-r13.10) [version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package packagegroup-self-hosted-sdk-dev went backwards which would break package feeds from (0:1.0-r13.11 to 0:1.0-r13.10) [version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package packagegroup-self-hosted-sdk-ptest went backwards which would break package feeds from (0:1.0-r13.11 to 0:1.0-r13.10) [version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package packagegroup-self-hosted-sdk went backwards which would break package feeds from (0:1.0-r13.11 to 0:1.0-r13.10) [version-going-backwards]
packagegroup-self-hosted-1.0: Package version for package packagegroup-self-hosted went backwards which would break package feeds from (0:1.0-r13.11 to 0:1.0-r13.10) [version-going-backwards]
packagegroup-tools-bluetooth-1.0: Package version for package packagegroup-tools-bluetooth-dbg went backwards which would break package feeds from (0:1.0-r0.9 to 0:1.0-r0.8) [version-going-backwards]
packagegroup-tools-bluetooth-1.0: Package version for package packagegroup-tools-bluetooth-dev went backwards which would break package feeds from (0:1.0-r0.9 to 0:1.0-r0.8) [version-going-backwards]
packagegroup-tools-bluetooth-1.0: Package version for package packagegroup-tools-bluetooth-ptest went backwards which would break package feeds from (0:1.0-r0.9 to 0:1.0-r0.8) [version-going-backwards]
packagegroup-tools-bluetooth-1.0: Package version for package packagegroup-tools-bluetooth went backwards which would break package feeds from (0:1.0-r0.9 to 0:1.0-r0.8) [version-going-backwards]
packagegroup-xfce-base-1.0: Package version for package packagegroup-xfce-base-dbg went backwards which would break package feeds from (0:1.0-r5.8 to 0:1.0-r5.7) [version-going-backwards]
packagegroup-xfce-base-1.0: Package version for package packagegroup-xfce-base-dev went backwards which would break package feeds from (0:1.0-r5.8 to 0:1.0-r5.7) [version-going-backwards]
packagegroup-xfce-base-1.0: Package version for package packagegroup-xfce-base-ptest went backwards which would break package feeds from (0:1.0-r5.8 to 0:1.0-r5.7) [version-going-backwards]
packagegroup-xfce-base-1.0: Package version for package packagegroup-xfce-base went backwards which would break package feeds from (0:1.0-r5.8 to 0:1.0-r5.7) [version-going-backwards]
packagegroup-xfce-extended-1.0: Package version for package packagegroup-xfce-extended-dbg went backwards which would break package feeds from (0:1.0-r10.8 to 0:1.0-r10.7) [version-going-backwards]
packagegroup-xfce-extended-1.0: Package version for package packagegroup-xfce-extended-dev went backwards which would break package feeds from (0:1.0-r10.8 to 0:1.0-r10.7) [version-going-backwards]
packagegroup-xfce-extended-1.0: Package version for package packagegroup-xfce-extended-ptest went backwards which would break package feeds from (0:1.0-r10.8 to 0:1.0-r10.7) [version-going-backwards]
packagegroup-xfce-extended-1.0: Package version for package packagegroup-xfce-extended went backwards which would break package feeds from (0:1.0-r10.8 to 0:1.0-r10.7) [version-going-backwards]
packagegroup-xfce-multimedia-1.0: Package version for package packagegroup-xfce-multimedia-dbg went backwards which would break package feeds from (0:1.0-r0.8 to 0:1.0-r0.7) [version-going-backwards]
packagegroup-xfce-multimedia-1.0: Package version for package packagegroup-xfce-multimedia-dev went backwards which would break package feeds from (0:1.0-r0.8 to 0:1.0-r0.7) [version-going-backwards]
packagegroup-xfce-multimedia-1.0: Package version for package packagegroup-xfce-multimedia-ptest went backwards which would break package feeds from (0:1.0-r0.8 to 0:1.0-r0.7) [version-going-backwards]
packagegroup-xfce-multimedia-1.0: Package version for package packagegroup-xfce-multimedia went backwards which would break package feeds from (0:1.0-r0.8 to 0:1.0-r0.7) [version-going-backwards]
phoronix-test-suite-7.4.0: Package version for package phoronix-test-suite-dbg went backwards which would break package feeds from (0:7.4.0-r0.8 to 0:7.4.0-r0.7) [version-going-backwards]
phoronix-test-suite-7.4.0: Package version for package phoronix-test-suite-dev went backwards which would break package feeds from (0:7.4.0-r0.8 to 0:7.4.0-r0.7) [version-going-backwards]
phoronix-test-suite-7.4.0: Package version for package phoronix-test-suite-doc went backwards which would break package feeds from (0:7.4.0-r0.8 to 0:7.4.0-r0.7) [version-going-backwards]
phoronix-test-suite-7.4.0: Package version for package phoronix-test-suite-locale went backwards which would break package feeds from (0:7.4.0-r0.8 to 0:7.4.0-r0.7) [version-going-backwards]
phoronix-test-suite-7.4.0: Package version for package phoronix-test-suite-staticdev went backwards which would break package feeds from (0:7.4.0-r0.8 to 0:7.4.0-r0.7) [version-going-backwards]
phoronix-test-suite-7.4.0: Package version for package phoronix-test-suite went backwards which would break package feeds from (0:7.4.0-r0.8 to 0:7.4.0-r0.7) [version-going-backwards]
phpmyadmin-4.7.6: Package version for package phpmyadmin-dbg went backwards which would break package feeds from (0:4.7.6-r0.2 to 0:4.7.6-r0.1) [version-going-backwards]
phpmyadmin-4.7.6: Package version for package phpmyadmin-dev went backwards which would break package feeds from (0:4.7.6-r0.2 to 0:4.7.6-r0.1) [version-going-backwards]
phpmyadmin-4.7.6: Package version for package phpmyadmin-doc went backwards which would break package feeds from (0:4.7.6-r0.2 to 0:4.7.6-r0.1) [version-going-backwards]
phpmyadmin-4.7.6: Package version for package phpmyadmin-locale went backwards which would break package feeds from (0:4.7.6-r0.2 to 0:4.7.6-r0.1) [version-going-backwards]
phpmyadmin-4.7.6: Package version for package phpmyadmin-staticdev went backwards which would break package feeds from (0:4.7.6-r0.2 to 0:4.7.6-r0.1) [version-going-backwards]
phpmyadmin-4.7.6: Package version for package phpmyadmin went backwards which would break package feeds from (0:4.7.6-r0.2 to 0:4.7.6-r0.1) [version-going-backwards]
poppler-data-0.4.8: Package version for package poppler-data-dbg went backwards which would break package feeds from (0:0.4.8-r0.7 to 0:0.4.8-r0.6) [version-going-backwards]
poppler-data-0.4.8: Package version for package poppler-data-dev went backwards which would break package feeds from (0:0.4.8-r0.7 to 0:0.4.8-r0.6) [version-going-backwards]
poppler-data-0.4.8: Package version for package poppler-data-doc went backwards which would break package feeds from (0:0.4.8-r0.7 to 0:0.4.8-r0.6) [version-going-backwards]
poppler-data-0.4.8: Package version for package poppler-data-locale went backwards which would break package feeds from (0:0.4.8-r0.7 to 0:0.4.8-r0.6) [version-going-backwards]
poppler-data-0.4.8: Package version for package poppler-data-staticdev went backwards which would break package feeds from (0:0.4.8-r0.7 to 0:0.4.8-r0.6) [version-going-backwards]
poppler-data-0.4.8: Package version for package poppler-data went backwards which would break package feeds from (0:0.4.8-r0.7 to 0:0.4.8-r0.6) [version-going-backwards]
ppp-dialin-0.1: Package version for package ppp-dialin-dbg went backwards which would break package feeds from (0:0.1-r8.8 to 0:0.1-r8.7) [version-going-backwards]
ppp-dialin-0.1: Package version for package ppp-dialin-dev went backwards which would break package feeds from (0:0.1-r8.8 to 0:0.1-r8.7) [version-going-backwards]
ppp-dialin-0.1: Package version for package ppp-dialin-doc went backwards which would break package feeds from (0:0.1-r8.8 to 0:0.1-r8.7) [version-going-backwards]
ppp-dialin-0.1: Package version for package ppp-dialin-locale went backwards which would break package feeds from (0:0.1-r8.8 to 0:0.1-r8.7) [version-going-backwards]
ppp-dialin-0.1: Package version for package ppp-dialin-staticdev went backwards which would break package feeds from (0:0.1-r8.8 to 0:0.1-r8.7) [version-going-backwards]
ppp-dialin-0.1: Package version for package ppp-dialin went backwards which would break package feeds from (0:0.1-r8.8 to 0:0.1-r8.7) [version-going-backwards]
pulseaudio-client-conf-sato-1: Package version for package pulseaudio-client-conf-sato-dbg went backwards which would break package feeds from (0:1-r0.8 to 0:1-r0.7) [version-going-backwards]
pulseaudio-client-conf-sato-1: Package version for package pulseaudio-client-conf-sato-dev went backwards which would break package feeds from (0:1-r0.8 to 0:1-r0.7) [version-going-backwards]
pulseaudio-client-conf-sato-1: Package version for package pulseaudio-client-conf-sato-doc went backwards which would break package feeds from (0:1-r0.8 to 0:1-r0.7) [version-going-backwards]
pulseaudio-client-conf-sato-1: Package version for package pulseaudio-client-conf-sato-locale went backwards which would break package feeds from (0:1-r0.8 to 0:1-r0.7) [version-going-backwards]
pulseaudio-client-conf-sato-1: Package version for package pulseaudio-client-conf-sato-staticdev went backwards which would break package feeds from (0:1-r0.8 to 0:1-r0.7) [version-going-backwards]
pulseaudio-client-conf-sato-1: Package version for package pulseaudio-client-conf-sato went backwards which would break package feeds from (0:1-r0.8 to 0:1-r0.7) [version-going-backwards]
qt5-demo-extrafiles-1.0: Package version for package qt5-demo-extrafiles-dbg went backwards which would break package feeds from (0:1.0-r0.8 to 0:1.0-r0.7) [version-going-backwards]
qt5-demo-extrafiles-1.0: Package version for package qt5-demo-extrafiles-dev went backwards which would break package feeds from (0:1.0-r0.8 to 0:1.0-r0.7) [version-going-backwards]
qt5-demo-extrafiles-1.0: Package version for package qt5-demo-extrafiles-doc went backwards which would break package feeds from (0:1.0-r0.8 to 0:1.0-r0.7) [version-going-backwards]
qt5-demo-extrafiles-1.0: Package version for package qt5-demo-extrafiles-locale went backwards which would break package feeds from (0:1.0-r0.8 to 0:1.0-r0.7) [version-going-backwards]
qt5-demo-extrafiles-1.0: Package version for package qt5-demo-extrafiles-staticdev went backwards which would break package feeds from (0:1.0-r0.8 to 0:1.0-r0.7) [version-going-backwards]
qt5-demo-extrafiles-1.0: Package version for package qt5-demo-extrafiles went backwards which would break package feeds from (0:1.0-r0.8 to 0:1.0-r0.7) [version-going-backwards]
resolvconf-1.79: Package version for package resolvconf-dbg went backwards which would break package feeds from (0:1.79-r0.8 to 0:1.79-r0.7) [version-going-backwards]
resolvconf-1.79: Package version for package resolvconf-dev went backwards which would break package feeds from (0:1.79-r0.8 to 0:1.79-r0.7) [version-going-backwards]
resolvconf-1.79: Package version for package resolvconf-doc went backwards which would break package feeds from (0:1.79-r0.8 to 0:1.79-r0.7) [version-going-backwards]
resolvconf-1.79: Package version for package resolvconf-locale went backwards which would break package feeds from (0:1.79-r0.8 to 0:1.79-r0.7) [version-going-backwards]
resolvconf-1.79: Package version for package resolvconf-staticdev went backwards which would break package feeds from (0:1.79-r0.8 to 0:1.79-r0.7) [version-going-backwards]
resolvconf-1.79: Package version for package resolvconf went backwards which would break package feeds from (0:1.79-r0.8 to 0:1.79-r0.7) [version-going-backwards]
rodent-icon-theme-5.0: Package version for package rodent-icon-theme-dbg went backwards which would break package feeds from (0:5.0-r0.8 to 0:5.0-r0.7) [version-going-backwards]
rodent-icon-theme-5.0: Package version for package rodent-icon-theme-dev went backwards which would break package feeds from (0:5.0-r0.8 to 0:5.0-r0.7) [version-going-backwards]
rodent-icon-theme-5.0: Package version for package rodent-icon-theme-doc went backwards which would break package feeds from (0:5.0-r0.8 to 0:5.0-r0.7) [version-going-backwards]
rodent-icon-theme-5.0: Package version for package rodent-icon-theme-locale went backwards which would break package feeds from (0:5.0-r0.8 to 0:5.0-r0.7) [version-going-backwards]
rodent-icon-theme-5.0: Package version for package rodent-icon-theme-staticdev went backwards which would break package feeds from (0:5.0-r0.8 to 0:5.0-r0.7) [version-going-backwards]
rodent-icon-theme-5.0: Package version for package rodent-icon-theme went backwards which would break package feeds from (0:5.0-r0.8 to 0:5.0-r0.7) [version-going-backwards]
run-postinsts-1.0: Package version for package run-postinsts-dbg went backwards which would break package feeds from (0:1.0-r9.8 to 0:1.0-r9.7) [version-going-backwards]
run-postinsts-1.0: Package version for package run-postinsts-dev went backwards which would break package feeds from (0:1.0-r9.8 to 0:1.0-r9.7) [version-going-backwards]
run-postinsts-1.0: Package version for package run-postinsts-doc went backwards which would break package feeds from (0:1.0-r9.8 to 0:1.0-r9.7) [version-going-backwards]
run-postinsts-1.0: Package version for package run-postinsts-locale went backwards which would break package feeds from (0:1.0-r9.8 to 0:1.0-r9.7) [version-going-backwards]
run-postinsts-1.0: Package version for package run-postinsts-staticdev went backwards which would break package feeds from (0:1.0-r9.8 to 0:1.0-r9.7) [version-going-backwards]
run-postinsts-1.0: Package version for package run-postinsts went backwards which would break package feeds from (0:1.0-r9.8 to 0:1.0-r9.7) [version-going-backwards]
shutdown-desktop-1.0: Package version for package shutdown-desktop-dbg went backwards which would break package feeds from (0:1.0-r1.8 to 0:1.0-r1.7) [version-going-backwards]
shutdown-desktop-1.0: Package version for package shutdown-desktop-dev went backwards which would break package feeds from (0:1.0-r1.8 to 0:1.0-r1.7) [version-going-backwards]
shutdown-desktop-1.0: Package version for package shutdown-desktop-doc went backwards which would break package feeds from (0:1.0-r1.8 to 0:1.0-r1.7) [version-going-backwards]
shutdown-desktop-1.0: Package version for package shutdown-desktop-locale went backwards which would break package feeds from (0:1.0-r1.8 to 0:1.0-r1.7) [version-going-backwards]
shutdown-desktop-1.0: Package version for package shutdown-desktop-staticdev went backwards which would break package feeds from (0:1.0-r1.8 to 0:1.0-r1.7) [version-going-backwards]
shutdown-desktop-1.0: Package version for package shutdown-desktop went backwards which would break package feeds from (0:1.0-r1.8 to 0:1.0-r1.7) [version-going-backwards]
source-han-sans-cn-fonts-1.004: Package version for package source-han-sans-cn-fonts-dbg went backwards which would break package feeds from (0:1.004-r0.8 to 0:1.004-r0.7) [version-going-backwards]
source-han-sans-cn-fonts-1.004: Package version for package source-han-sans-cn-fonts-dev went backwards which would break package feeds from (0:1.004-r0.8 to 0:1.004-r0.7) [version-going-backwards]
source-han-sans-cn-fonts-1.004: Package version for package source-han-sans-cn-fonts-doc went backwards which would break package feeds from (0:1.004-r0.8 to 0:1.004-r0.7) [version-going-backwards]
source-han-sans-cn-fonts-1.004: Package version for package source-han-sans-cn-fonts-locale went backwards which would break package feeds from (0:1.004-r0.8 to 0:1.004-r0.7) [version-going-backwards]
source-han-sans-cn-fonts-1.004: Package version for package source-han-sans-cn-fonts-staticdev went backwards which would break package feeds from (0:1.004-r0.8 to 0:1.004-r0.7) [version-going-backwards]
source-han-sans-cn-fonts-1.004: Package version for package source-han-sans-cn-fonts went backwards which would break package feeds from (0:1.004-r0.8 to 0:1.004-r0.7) [version-going-backwards]
source-han-sans-jp-fonts-1.004: Package version for package source-han-sans-jp-fonts-dbg went backwards which would break package feeds from (0:1.004-r0.8 to 0:1.004-r0.7) [version-going-backwards]
source-han-sans-jp-fonts-1.004: Package version for package source-han-sans-jp-fonts-dev went backwards which would break package feeds from (0:1.004-r0.8 to 0:1.004-r0.7) [version-going-backwards]
source-han-sans-jp-fonts-1.004: Package version for package source-han-sans-jp-fonts-doc went backwards which would break package feeds from (0:1.004-r0.8 to 0:1.004-r0.7) [version-going-backwards]
source-han-sans-jp-fonts-1.004: Package version for package source-han-sans-jp-fonts-locale went backwards which would break package feeds from (0:1.004-r0.8 to 0:1.004-r0.7) [version-going-backwards]
source-han-sans-jp-fonts-1.004: Package version for package source-han-sans-jp-fonts-staticdev went backwards which would break package feeds from (0:1.004-r0.8 to 0:1.004-r0.7) [version-going-backwards]
source-han-sans-jp-fonts-1.004: Package version for package source-han-sans-jp-fonts went backwards which would break package feeds from (0:1.004-r0.8 to 0:1.004-r0.7) [version-going-backwards]
source-han-sans-kr-fonts-1.004: Package version for package source-han-sans-kr-fonts-dbg went backwards which would break package feeds from (0:1.004-r0.8 to 0:1.004-r0.7) [version-going-backwards]
source-han-sans-kr-fonts-1.004: Package version for package source-han-sans-kr-fonts-dev went backwards which would break package feeds from (0:1.004-r0.8 to 0:1.004-r0.7) [version-going-backwards]
source-han-sans-kr-fonts-1.004: Package version for package source-han-sans-kr-fonts-doc went backwards which would break package feeds from (0:1.004-r0.8 to 0:1.004-r0.7) [version-going-backwards]
source-han-sans-kr-fonts-1.004: Package version for package source-han-sans-kr-fonts-locale went backwards which would break package feeds from (0:1.004-r0.8 to 0:1.004-r0.7) [version-going-backwards]
source-han-sans-kr-fonts-1.004: Package version for package source-han-sans-kr-fonts-staticdev went backwards which would break package feeds from (0:1.004-r0.8 to 0:1.004-r0.7) [version-going-backwards]
source-han-sans-kr-fonts-1.004: Package version for package source-han-sans-kr-fonts went backwards which would break package feeds from (0:1.004-r0.8 to 0:1.004-r0.7) [version-going-backwards]
source-han-sans-tw-fonts-1.004: Package version for package source-han-sans-tw-fonts-dbg went backwards which would break package feeds from (0:1.004-r0.8 to 0:1.004-r0.7) [version-going-backwards]
source-han-sans-tw-fonts-1.004: Package version for package source-han-sans-tw-fonts-dev went backwards which would break package feeds from (0:1.004-r0.8 to 0:1.004-r0.7) [version-going-backwards]
source-han-sans-tw-fonts-1.004: Package version for package source-han-sans-tw-fonts-doc went backwards which would break package feeds from (0:1.004-r0.8 to 0:1.004-r0.7) [version-going-backwards]
source-han-sans-tw-fonts-1.004: Package version for package source-han-sans-tw-fonts-locale went backwards which would break package feeds from (0:1.004-r0.8 to 0:1.004-r0.7) [version-going-backwards]
source-han-sans-tw-fonts-1.004: Package version for package source-han-sans-tw-fonts-staticdev went backwards which would break package feeds from (0:1.004-r0.8 to 0:1.004-r0.7) [version-going-backwards]
source-han-sans-tw-fonts-1.004: Package version for package source-han-sans-tw-fonts went backwards which would break package feeds from (0:1.004-r0.8 to 0:1.004-r0.7) [version-going-backwards]
terminus-font-4.38: Package version for package terminus-font-consolefonts went backwards which would break package feeds from (0:4.38-r0.8 to 0:4.38-r0.7) [version-going-backwards]
terminus-font-4.38: Package version for package terminus-font-consoletrans went backwards which would break package feeds from (0:4.38-r0.8 to 0:4.38-r0.7) [version-going-backwards]
terminus-font-4.38: Package version for package terminus-font-dbg went backwards which would break package feeds from (0:4.38-r0.8 to 0:4.38-r0.7) [version-going-backwards]
terminus-font-4.38: Package version for package terminus-font-dev went backwards which would break package feeds from (0:4.38-r0.8 to 0:4.38-r0.7) [version-going-backwards]
terminus-font-4.38: Package version for package terminus-font-doc went backwards which would break package feeds from (0:4.38-r0.8 to 0:4.38-r0.7) [version-going-backwards]
terminus-font-4.38: Package version for package terminus-font-locale went backwards which would break package feeds from (0:4.38-r0.8 to 0:4.38-r0.7) [version-going-backwards]
terminus-font-4.38: Package version for package terminus-font-pcf went backwards which would break package feeds from (0:4.38-r0.8 to 0:4.38-r0.7) [version-going-backwards]
terminus-font-4.38: Package version for package terminus-font-staticdev went backwards which would break package feeds from (0:4.38-r0.8 to 0:4.38-r0.7) [version-going-backwards]
terminus-font-4.38: Package version for package terminus-font went backwards which would break package feeds from (0:4.38-r0.8 to 0:4.38-r0.7) [version-going-backwards]
tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package tesseract-lang-afr went backwards which would break package feeds from (0:3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-going-backwards]
tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package tesseract-lang-amh went backwards which would break package feeds from (0:3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-going-backwards]
tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package tesseract-lang-ara went backwards which would break package feeds from (0:3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-going-backwards]
tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package tesseract-lang-asm went backwards which would break package feeds from (0:3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-going-backwards]
tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package tesseract-lang-aze-cyrl went backwards which would break package feeds from (0:3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-going-backwards]
tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package tesseract-lang-aze went backwards which would break package feeds from (0:3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-going-backwards]
tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package tesseract-lang-bel went backwards which would break package feeds from (0:3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-going-backwards]
tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package tesseract-lang-ben went backwards which would break package feeds from (0:3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-going-backwards]
tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package tesseract-lang-bod went backwards which would break package feeds from (0:3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-going-backwards]
tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package tesseract-lang-bos went backwards which would break package feeds from (0:3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-going-backwards]
tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package tesseract-lang-bul went backwards which would break package feeds from (0:3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-going-backwards]
tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package tesseract-lang-cat went backwards which would break package feeds from (0:3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-going-backwards]
tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package tesseract-lang-ceb went backwards which would break package feeds from (0:3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-going-backwards]
tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package tesseract-lang-ces went backwards which would break package feeds from (0:3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-going-backwards]
tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package tesseract-lang-chi-sim went backwards which would break package feeds from (0:3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-going-backwards]
tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package tesseract-lang-chi-tra went backwards which would break package feeds from (0:3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-going-backwards]
tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package tesseract-lang-chr went backwards which would break package feeds from (0:3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-going-backwards]
tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package tesseract-lang-cym went backwards which would break package feeds from (0:3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-going-backwards]
tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package tesseract-lang-dan-frak went backwards which would break package feeds from (0:3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-going-backwards]
tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package tesseract-lang-dan went backwards which would break package feeds from (0:3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-going-backwards]
tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package tesseract-lang-dbg went backwards which would break package feeds from (0:3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-going-backwards]
tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package tesseract-lang-deu-frak went backwards which would break package feeds from (0:3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-going-backwards]
tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package tesseract-lang-deu went backwards which would break package feeds from (0:3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-going-backwards]
tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package tesseract-lang-dev went backwards which would break package feeds from (0:3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-going-backwards]
tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package tesseract-lang-doc went backwards which would break package feeds from (0:3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-going-backwards]
tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package tesseract-lang-dzo went backwards which would break package feeds from (0:3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-going-backwards]
tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package tesseract-lang-ell went backwards which would break package feeds from (0:3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-going-backwards]
tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package tesseract-lang-eng went backwards which would break package feeds from (0:3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-going-backwards]
tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package tesseract-lang-enm went backwards which would break package feeds from (0:3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-going-backwards]
tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package tesseract-lang-epo went backwards which would break package feeds from (0:3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-going-backwards]
tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package tesseract-lang-equ went backwards which would break package feeds from (0:3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-going-backwards]
tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package tesseract-lang-est went backwards which would break package feeds from (0:3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-going-backwards]
tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package tesseract-lang-eus went backwards which would break package feeds from (0:3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-going-backwards]
tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package tesseract-lang-fas went backwards which would break package feeds from (0:3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-going-backwards]
tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package tesseract-lang-fin went backwards which would break package feeds from (0:3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-going-backwards]
tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package tesseract-lang-fra went backwards which would break package feeds from (0:3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-going-backwards]
tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package tesseract-lang-frk went backwards which would break package feeds from (0:3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-going-backwards]
tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package tesseract-lang-frm went backwards which would break package feeds from (0:3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-going-backwards]
tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package tesseract-lang-gle went backwards which would break package feeds from (0:3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-going-backwards]
tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package tesseract-lang-glg went backwards which would break package feeds from (0:3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-going-backwards]
tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package tesseract-lang-grc went backwards which would break package feeds from (0:3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-going-backwards]
tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package tesseract-lang-guj went backwards which would break package feeds from (0:3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-going-backwards]
tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package tesseract-lang-hat went backwards which would break package feeds from (0:3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-going-backwards]
tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package tesseract-lang-heb went backwards which would break package feeds from (0:3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-going-backwards]
tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package tesseract-lang-hin went backwards which would break package feeds from (0:3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-going-backwards]
tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package tesseract-lang-hrv went backwards which would break package feeds from (0:3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-going-backwards]
tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package tesseract-lang-hun went backwards which would break package feeds from (0:3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-going-backwards]
tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package tesseract-lang-iku went backwards which would break package feeds from (0:3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-going-backwards]
tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package tesseract-lang-ind went backwards which would break package feeds from (0:3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-going-backwards]
tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package tesseract-lang-isl went backwards which would break package feeds from (0:3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-going-backwards]
tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package tesseract-lang-ita-old went backwards which would break package feeds from (0:3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-going-backwards]
tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package tesseract-lang-ita went backwards which would break package feeds from (0:3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-going-backwards]
tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package tesseract-lang-jav went backwards which would break package feeds from (0:3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-going-backwards]
tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package tesseract-lang-jpn went backwards which would break package feeds from (0:3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-going-backwards]
tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package tesseract-lang-kan went backwards which would break package feeds from (0:3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-going-backwards]
tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package tesseract-lang-kat-old went backwards which would break package feeds from (0:3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-going-backwards]
tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package tesseract-lang-kat went backwards which would break package feeds from (0:3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-going-backwards]
tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package tesseract-lang-kaz went backwards which would break package feeds from (0:3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-going-backwards]
tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package tesseract-lang-khm went backwards which would break package feeds from (0:3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-going-backwards]
tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package tesseract-lang-kir went backwards which would break package feeds from (0:3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-going-backwards]
tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package tesseract-lang-kor went backwards which would break package feeds from (0:3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-going-backwards]
tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package tesseract-lang-kur went backwards which would break package feeds from (0:3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-going-backwards]
tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package tesseract-lang-lao went backwards which would break package feeds from (0:3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-going-backwards]
tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package tesseract-lang-lat went backwards which would break package feeds from (0:3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-going-backwards]
tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package tesseract-lang-lav went backwards which would break package feeds from (0:3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-going-backwards]
tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package tesseract-lang-lit went backwards which would break package feeds from (0:3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-going-backwards]
tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package tesseract-lang-locale went backwards which would break package feeds from (0:3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-going-backwards]
tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package tesseract-lang-mal went backwards which would break package feeds from (0:3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-going-backwards]
tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package tesseract-lang-mar went backwards which would break package feeds from (0:3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-going-backwards]
tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package tesseract-lang-mkd went backwards which would break package feeds from (0:3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-going-backwards]
tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package tesseract-lang-mlt went backwards which would break package feeds from (0:3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-going-backwards]
tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package tesseract-lang-msa went backwards which would break package feeds from (0:3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-going-backwards]
tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package tesseract-lang-mya went backwards which would break package feeds from (0:3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-going-backwards]
tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package tesseract-lang-nep went backwards which would break package feeds from (0:3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-going-backwards]
tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package tesseract-lang-nld went backwards which would break package feeds from (0:3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-going-backwards]
tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package tesseract-lang-nor went backwards which would break package feeds from (0:3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-going-backwards]
tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package tesseract-lang-ori went backwards which would break package feeds from (0:3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-going-backwards]
tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package tesseract-lang-osd went backwards which would break package feeds from (0:3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-going-backwards]
tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package tesseract-lang-pan went backwards which would break package feeds from (0:3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-going-backwards]
tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package tesseract-lang-pol went backwards which would break package feeds from (0:3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-going-backwards]
tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package tesseract-lang-por went backwards which would break package feeds from (0:3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-going-backwards]
tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package tesseract-lang-pus went backwards which would break package feeds from (0:3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-going-backwards]
tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package tesseract-lang-ron went backwards which would break package feeds from (0:3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-going-backwards]
tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package tesseract-lang-rus went backwards which would break package feeds from (0:3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-going-backwards]
tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package tesseract-lang-san went backwards which would break package feeds from (0:3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-going-backwards]
tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package tesseract-lang-sin went backwards which would break package feeds from (0:3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-going-backwards]
tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package tesseract-lang-slk-frak went backwards which would break package feeds from (0:3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-going-backwards]
tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package tesseract-lang-slk went backwards which would break package feeds from (0:3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-going-backwards]
tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package tesseract-lang-slv went backwards which would break package feeds from (0:3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-going-backwards]
tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package tesseract-lang-spa-old went backwards which would break package feeds from (0:3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-going-backwards]
tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package tesseract-lang-spa went backwards which would break package feeds from (0:3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-going-backwards]
tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package tesseract-lang-sqi went backwards which would break package feeds from (0:3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-going-backwards]
tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package tesseract-lang-srp-latn went backwards which would break package feeds from (0:3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-going-backwards]
tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package tesseract-lang-srp went backwards which would break package feeds from (0:3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-going-backwards]
tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package tesseract-lang-staticdev went backwards which would break package feeds from (0:3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-going-backwards]
tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package tesseract-lang-swa went backwards which would break package feeds from (0:3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-going-backwards]
tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package tesseract-lang-swe went backwards which would break package feeds from (0:3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-going-backwards]
tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package tesseract-lang-syr went backwards which would break package feeds from (0:3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-going-backwards]
tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package tesseract-lang-tam went backwards which would break package feeds from (0:3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-going-backwards]
tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package tesseract-lang-tel went backwards which would break package feeds from (0:3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-going-backwards]
tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package tesseract-lang-tgk went backwards which would break package feeds from (0:3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-going-backwards]
tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package tesseract-lang-tgl went backwards which would break package feeds from (0:3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-going-backwards]
tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package tesseract-lang-tha went backwards which would break package feeds from (0:3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-going-backwards]
tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package tesseract-lang-tir went backwards which would break package feeds from (0:3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-going-backwards]
tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package tesseract-lang-tur went backwards which would break package feeds from (0:3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-going-backwards]
tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package tesseract-lang-uig went backwards which would break package feeds from (0:3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-going-backwards]
tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package tesseract-lang-ukr went backwards which would break package feeds from (0:3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-going-backwards]
tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package tesseract-lang-urd went backwards which would break package feeds from (0:3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-going-backwards]
tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package tesseract-lang-uzb-cyrl went backwards which would break package feeds from (0:3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-going-backwards]
tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package tesseract-lang-uzb went backwards which would break package feeds from (0:3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-going-backwards]
tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package tesseract-lang-vie went backwards which would break package feeds from (0:3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-going-backwards]
tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package tesseract-lang went backwards which would break package feeds from (0:3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-going-backwards]
tesseract-lang-3.04.00+gitAUTOINC+3cf1e2df1f: Package version for package tesseract-lang-yid went backwards which would break package feeds from (0:3.04.00+git0+3cf1e2df1f-r0.8 to 0:3.04.00+git0+3cf1e2df1f-r0.7) [version-going-backwards]
ttf-abyssinica-1.500: Package version for package ttf-abyssinica-dbg went backwards which would break package feeds from (0:1.500-r0.8 to 0:1.500-r0.7) [version-going-backwards]
ttf-abyssinica-1.500: Package version for package ttf-abyssinica-dev went backwards which would break package feeds from (0:1.500-r0.8 to 0:1.500-r0.7) [version-going-backwards]
ttf-abyssinica-1.500: Package version for package ttf-abyssinica-doc went backwards which would break package feeds from (0:1.500-r0.8 to 0:1.500-r0.7) [version-going-backwards]
ttf-abyssinica-1.500: Package version for package ttf-abyssinica-locale went backwards which would break package feeds from (0:1.500-r0.8 to 0:1.500-r0.7) [version-going-backwards]
ttf-abyssinica-1.500: Package version for package ttf-abyssinica-staticdev went backwards which would break package feeds from (0:1.500-r0.8 to 0:1.500-r0.7) [version-going-backwards]
ttf-abyssinica-1.500: Package version for package ttf-abyssinica went backwards which would break package feeds from (0:1.500-r0.8 to 0:1.500-r0.7) [version-going-backwards]
ttf-arphic-uming-20080216: Package version for package ttf-arphic-uming-dbg went backwards which would break package feeds from (0:20080216-r6.8 to 0:20080216-r6.7) [version-going-backwards]
ttf-arphic-uming-20080216: Package version for package ttf-arphic-uming-dev went backwards which would break package feeds from (0:20080216-r6.8 to 0:20080216-r6.7) [version-going-backwards]
ttf-arphic-uming-20080216: Package version for package ttf-arphic-uming-doc went backwards which would break package feeds from (0:20080216-r6.8 to 0:20080216-r6.7) [version-going-backwards]
ttf-arphic-uming-20080216: Package version for package ttf-arphic-uming-locale went backwards which would break package feeds from (0:20080216-r6.8 to 0:20080216-r6.7) [version-going-backwards]
ttf-arphic-uming-20080216: Package version for package ttf-arphic-uming-staticdev went backwards which would break package feeds from (0:20080216-r6.8 to 0:20080216-r6.7) [version-going-backwards]
ttf-arphic-uming-20080216: Package version for package ttf-arphic-uming went backwards which would break package feeds from (0:20080216-r6.8 to 0:20080216-r6.7) [version-going-backwards]
ttf-dejavu-2.37: Package version for package ttf-dejavu-common went backwards which would break package feeds from (0:2.37-r7.8 to 0:2.37-r7.7) [version-going-backwards]
ttf-dejavu-2.37: Package version for package ttf-dejavu-mathtexgyre went backwards which would break package feeds from (0:2.37-r7.8 to 0:2.37-r7.7) [version-going-backwards]
ttf-dejavu-2.37: Package version for package ttf-dejavu-sans-condensed went backwards which would break package feeds from (0:2.37-r7.8 to 0:2.37-r7.7) [version-going-backwards]
ttf-dejavu-2.37: Package version for package ttf-dejavu-sans-mono went backwards which would break package feeds from (0:2.37-r7.8 to 0:2.37-r7.7) [version-going-backwards]
ttf-dejavu-2.37: Package version for package ttf-dejavu-sans went backwards which would break package feeds from (0:2.37-r7.8 to 0:2.37-r7.7) [version-going-backwards]
ttf-dejavu-2.37: Package version for package ttf-dejavu-serif-condensed went backwards which would break package feeds from (0:2.37-r7.8 to 0:2.37-r7.7) [version-going-backwards]
ttf-dejavu-2.37: Package version for package ttf-dejavu-serif went backwards which would break package feeds from (0:2.37-r7.8 to 0:2.37-r7.7) [version-going-backwards]
ttf-droid-0.1+gitrAUTOINC+21e6e2de1f: Package version for package ttf-droid-sans-fallback went backwards which would break package feeds from (0:0.1+gitr0+21e6e2de1f-r3.8 to 0:0.1+gitr0+21e6e2de1f-r3.7) [version-going-backwards]
ttf-droid-0.1+gitrAUTOINC+21e6e2de1f: Package version for package ttf-droid-sans-japanese went backwards which would break package feeds from (0:0.1+gitr0+21e6e2de1f-r3.8 to 0:0.1+gitr0+21e6e2de1f-r3.7) [version-going-backwards]
ttf-droid-0.1+gitrAUTOINC+21e6e2de1f: Package version for package ttf-droid-sans-mono went backwards which would break package feeds from (0:0.1+gitr0+21e6e2de1f-r3.8 to 0:0.1+gitr0+21e6e2de1f-r3.7) [version-going-backwards]
ttf-droid-0.1+gitrAUTOINC+21e6e2de1f: Package version for package ttf-droid-sans went backwards which would break package feeds from (0:0.1+gitr0+21e6e2de1f-r3.8 to 0:0.1+gitr0+21e6e2de1f-r3.7) [version-going-backwards]
ttf-droid-0.1+gitrAUTOINC+21e6e2de1f: Package version for package ttf-droid-serif went backwards which would break package feeds from (0:0.1+gitr0+21e6e2de1f-r3.8 to 0:0.1+gitr0+21e6e2de1f-r3.7) [version-going-backwards]
ttf-gentium-1.02: Package version for package ttf-gentium-alt went backwards which would break package feeds from (0:1.02-r8.8 to 0:1.02-r8.7) [version-going-backwards]
ttf-gentium-1.02: Package version for package ttf-gentium went backwards which would break package feeds from (0:1.02-r8.8 to 0:1.02-r8.7) [version-going-backwards]
ttf-hunkyfonts-0.3.0: Package version for package ttf-hunky-sans went backwards which would break package feeds from (0:0.3.0-r7.8 to 0:0.3.0-r7.7) [version-going-backwards]
ttf-hunkyfonts-0.3.0: Package version for package ttf-hunky-serif went backwards which would break package feeds from (0:0.3.0-r7.8 to 0:0.3.0-r7.7) [version-going-backwards]
ttf-inconsolata-20100526: Package version for package ttf-inconsolata-dbg went backwards which would break package feeds from (0:20100526-r0.8 to 0:20100526-r0.7) [version-going-backwards]
ttf-inconsolata-20100526: Package version for package ttf-inconsolata-dev went backwards which would break package feeds from (0:20100526-r0.8 to 0:20100526-r0.7) [version-going-backwards]
ttf-inconsolata-20100526: Package version for package ttf-inconsolata-doc went backwards which would break package feeds from (0:20100526-r0.8 to 0:20100526-r0.7) [version-going-backwards]
ttf-inconsolata-20100526: Package version for package ttf-inconsolata-locale went backwards which would break package feeds from (0:20100526-r0.8 to 0:20100526-r0.7) [version-going-backwards]
ttf-inconsolata-20100526: Package version for package ttf-inconsolata-staticdev went backwards which would break package feeds from (0:20100526-r0.8 to 0:20100526-r0.7) [version-going-backwards]
ttf-inconsolata-20100526: Package version for package ttf-inconsolata went backwards which would break package feeds from (0:20100526-r0.8 to 0:20100526-r0.7) [version-going-backwards]
ttf-liberation-0.2: Package version for package ttf-liberation-mono went backwards which would break package feeds from (0:0.2-r7.8 to 0:0.2-r7.7) [version-going-backwards]
ttf-liberation-0.2: Package version for package ttf-liberation-sans went backwards which would break package feeds from (0:0.2-r7.8 to 0:0.2-r7.7) [version-going-backwards]
ttf-liberation-0.2: Package version for package ttf-liberation-serif went backwards which would break package feeds from (0:0.2-r7.8 to 0:0.2-r7.7) [version-going-backwards]
ttf-liberation-sans-narrow-1.07.4: Package version for package ttf-liberation-sans-narrow went backwards which would break package feeds from (0:1.07.4-r0.8 to 0:1.07.4-r0.7) [version-going-backwards]
ttf-lklug-0.6-14.20090803cvs.fc24: Package version for package ttf-lklug-dbg went backwards which would break package feeds from (0:0.6-14.20090803cvs.fc24-r0.8 to 0:0.6-14.20090803cvs.fc24-r0.7) [version-going-backwards]
ttf-lklug-0.6-14.20090803cvs.fc24: Package version for package ttf-lklug-dev went backwards which would break package feeds from (0:0.6-14.20090803cvs.fc24-r0.8 to 0:0.6-14.20090803cvs.fc24-r0.7) [version-going-backwards]
ttf-lklug-0.6-14.20090803cvs.fc24: Package version for package ttf-lklug-doc went backwards which would break package feeds from (0:0.6-14.20090803cvs.fc24-r0.8 to 0:0.6-14.20090803cvs.fc24-r0.7) [version-going-backwards]
ttf-lklug-0.6-14.20090803cvs.fc24: Package version for package ttf-lklug-locale went backwards which would break package feeds from (0:0.6-14.20090803cvs.fc24-r0.8 to 0:0.6-14.20090803cvs.fc24-r0.7) [version-going-backwards]
ttf-lklug-0.6-14.20090803cvs.fc24: Package version for package ttf-lklug-staticdev went backwards which would break package feeds from (0:0.6-14.20090803cvs.fc24-r0.8 to 0:0.6-14.20090803cvs.fc24-r0.7) [version-going-backwards]
ttf-lklug-0.6-14.20090803cvs.fc24: Package version for package ttf-lklug went backwards which would break package feeds from (0:0.6-14.20090803cvs.fc24-r0.8 to 0:0.6-14.20090803cvs.fc24-r0.7) [version-going-backwards]
ttf-lohit-2: Package version for package ttf-lohit-dbg went backwards which would break package feeds from (0:2-r0.8 to 0:2-r0.7) [version-going-backwards]
ttf-lohit-2: Package version for package ttf-lohit-dev went backwards which would break package feeds from (0:2-r0.8 to 0:2-r0.7) [version-going-backwards]
ttf-lohit-2: Package version for package ttf-lohit-doc went backwards which would break package feeds from (0:2-r0.8 to 0:2-r0.7) [version-going-backwards]
ttf-lohit-2: Package version for package ttf-lohit-locale went backwards which would break package feeds from (0:2-r0.8 to 0:2-r0.7) [version-going-backwards]
ttf-lohit-2: Package version for package ttf-lohit-staticdev went backwards which would break package feeds from (0:2-r0.8 to 0:2-r0.7) [version-going-backwards]
ttf-lohit-2: Package version for package ttf-lohit went backwards which would break package feeds from (0:2-r0.8 to 0:2-r0.7) [version-going-backwards]
ttf-mplus-027: Package version for package ttf-mplus-1c-black went backwards which would break package feeds from (0:027-r4.8 to 0:027-r4.7) [version-going-backwards]
ttf-mplus-027: Package version for package ttf-mplus-1c-bold went backwards which would break package feeds from (0:027-r4.8 to 0:027-r4.7) [version-going-backwards]
ttf-mplus-027: Package version for package ttf-mplus-1c-heavy went backwards which would break package feeds from (0:027-r4.8 to 0:027-r4.7) [version-going-backwards]
ttf-mplus-027: Package version for package ttf-mplus-1c-light went backwards which would break package feeds from (0:027-r4.8 to 0:027-r4.7) [version-going-backwards]
ttf-mplus-027: Package version for package ttf-mplus-1c-medium went backwards which would break package feeds from (0:027-r4.8 to 0:027-r4.7) [version-going-backwards]
ttf-mplus-027: Package version for package ttf-mplus-1c-regular went backwards which would break package feeds from (0:027-r4.8 to 0:027-r4.7) [version-going-backwards]
ttf-mplus-027: Package version for package ttf-mplus-1c-thin went backwards which would break package feeds from (0:027-r4.8 to 0:027-r4.7) [version-going-backwards]
ttf-mplus-027: Package version for package ttf-mplus-1m-bold went backwards which would break package feeds from (0:027-r4.8 to 0:027-r4.7) [version-going-backwards]
ttf-mplus-027: Package version for package ttf-mplus-1m-light went backwards which would break package feeds from (0:027-r4.8 to 0:027-r4.7) [version-going-backwards]
ttf-mplus-027: Package version for package ttf-mplus-1m-medium went backwards which would break package feeds from (0:027-r4.8 to 0:027-r4.7) [version-going-backwards]
ttf-mplus-027: Package version for package ttf-mplus-1mn-bold went backwards which would break package feeds from (0:027-r4.8 to 0:027-r4.7) [version-going-backwards]
ttf-mplus-027: Package version for package ttf-mplus-1mn-light went backwards which would break package feeds from (0:027-r4.8 to 0:027-r4.7) [version-going-backwards]
ttf-mplus-027: Package version for package ttf-mplus-1mn-medium went backwards which would break package feeds from (0:027-r4.8 to 0:027-r4.7) [version-going-backwards]
ttf-mplus-027: Package version for package ttf-mplus-1mn-regular went backwards which would break package feeds from (0:027-r4.8 to 0:027-r4.7) [version-going-backwards]
ttf-mplus-027: Package version for package ttf-mplus-1mn-thin went backwards which would break package feeds from (0:027-r4.8 to 0:027-r4.7) [version-going-backwards]
ttf-mplus-027: Package version for package ttf-mplus-1m-regular went backwards which would break package feeds from (0:027-r4.8 to 0:027-r4.7) [version-going-backwards]
ttf-mplus-027: Package version for package ttf-mplus-1m-thin went backwards which would break package feeds from (0:027-r4.8 to 0:027-r4.7) [version-going-backwards]
ttf-mplus-027: Package version for package ttf-mplus-1p-black went backwards which would break package feeds from (0:027-r4.8 to 0:027-r4.7) [version-going-backwards]
ttf-mplus-027: Package version for package ttf-mplus-1p-bold went backwards which would break package feeds from (0:027-r4.8 to 0:027-r4.7) [version-going-backwards]
ttf-mplus-027: Package version for package ttf-mplus-1p-heavy went backwards which would break package feeds from (0:027-r4.8 to 0:027-r4.7) [version-going-backwards]
ttf-mplus-027: Package version for package ttf-mplus-1p-light went backwards which would break package feeds from (0:027-r4.8 to 0:027-r4.7) [version-going-backwards]
ttf-mplus-027: Package version for package ttf-mplus-1p-medium went backwards which would break package feeds from (0:027-r4.8 to 0:027-r4.7) [version-going-backwards]
ttf-mplus-027: Package version for package ttf-mplus-1p-regular went backwards which would break package feeds from (0:027-r4.8 to 0:027-r4.7) [version-going-backwards]
ttf-mplus-027: Package version for package ttf-mplus-1p-thin went backwards which would break package feeds from (0:027-r4.8 to 0:027-r4.7) [version-going-backwards]
ttf-mplus-027: Package version for package ttf-mplus-2c-black went backwards which would break package feeds from (0:027-r4.8 to 0:027-r4.7) [version-going-backwards]
ttf-mplus-027: Package version for package ttf-mplus-2c-bold went backwards which would break package feeds from (0:027-r4.8 to 0:027-r4.7) [version-going-backwards]
ttf-mplus-027: Package version for package ttf-mplus-2c-heavy went backwards which would break package feeds from (0:027-r4.8 to 0:027-r4.7) [version-going-backwards]
ttf-mplus-027: Package version for package ttf-mplus-2c-light went backwards which would break package feeds from (0:027-r4.8 to 0:027-r4.7) [version-going-backwards]
ttf-mplus-027: Package version for package ttf-mplus-2c-medium went backwards which would break package feeds from (0:027-r4.8 to 0:027-r4.7) [version-going-backwards]
ttf-mplus-027: Package version for package ttf-mplus-2c-regular went backwards which would break package feeds from (0:027-r4.8 to 0:027-r4.7) [version-going-backwards]
ttf-mplus-027: Package version for package ttf-mplus-2c-thin went backwards which would break package feeds from (0:027-r4.8 to 0:027-r4.7) [version-going-backwards]
ttf-mplus-027: Package version for package ttf-mplus-2m-bold went backwards which would break package feeds from (0:027-r4.8 to 0:027-r4.7) [version-going-backwards]
ttf-mplus-027: Package version for package ttf-mplus-2m-light went backwards which would break package feeds from (0:027-r4.8 to 0:027-r4.7) [version-going-backwards]
ttf-mplus-027: Package version for package ttf-mplus-2m-medium went backwards which would break package feeds from (0:027-r4.8 to 0:027-r4.7) [version-going-backwards]
ttf-mplus-027: Package version for package ttf-mplus-2m-regular went backwards which would break package feeds from (0:027-r4.8 to 0:027-r4.7) [version-going-backwards]
ttf-mplus-027: Package version for package ttf-mplus-2m-thin went backwards which would break package feeds from (0:027-r4.8 to 0:027-r4.7) [version-going-backwards]
ttf-mplus-027: Package version for package ttf-mplus-2p-black went backwards which would break package feeds from (0:027-r4.8 to 0:027-r4.7) [version-going-backwards]
ttf-mplus-027: Package version for package ttf-mplus-2p-bold went backwards which would break package feeds from (0:027-r4.8 to 0:027-r4.7) [version-going-backwards]
ttf-mplus-027: Package version for package ttf-mplus-2p-heavy went backwards which would break package feeds from (0:027-r4.8 to 0:027-r4.7) [version-going-backwards]
ttf-mplus-027: Package version for package ttf-mplus-2p-light went backwards which would break package feeds from (0:027-r4.8 to 0:027-r4.7) [version-going-backwards]
ttf-mplus-027: Package version for package ttf-mplus-2p-medium went backwards which would break package feeds from (0:027-r4.8 to 0:027-r4.7) [version-going-backwards]
ttf-mplus-027: Package version for package ttf-mplus-2p-regular went backwards which would break package feeds from (0:027-r4.8 to 0:027-r4.7) [version-going-backwards]
ttf-mplus-027: Package version for package ttf-mplus-2p-thin went backwards which would break package feeds from (0:027-r4.8 to 0:027-r4.7) [version-going-backwards]
ttf-mplus-027: Package version for package ttf-mplus-dbg went backwards which would break package feeds from (0:027-r4.8 to 0:027-r4.7) [version-going-backwards]
ttf-mplus-027: Package version for package ttf-mplus-dev went backwards which would break package feeds from (0:027-r4.8 to 0:027-r4.7) [version-going-backwards]
ttf-mplus-027: Package version for package ttf-mplus-doc went backwards which would break package feeds from (0:027-r4.8 to 0:027-r4.7) [version-going-backwards]
ttf-mplus-027: Package version for package ttf-mplus-locale went backwards which would break package feeds from (0:027-r4.8 to 0:027-r4.7) [version-going-backwards]
ttf-mplus-027: Package version for package ttf-mplus-staticdev went backwards which would break package feeds from (0:027-r4.8 to 0:027-r4.7) [version-going-backwards]
ttf-mplus-027: Package version for package ttf-mplus went backwards which would break package feeds from (0:027-r4.8 to 0:027-r4.7) [version-going-backwards]
ttf-pt-sans-1.1: Package version for package ttf-pt-sans-dbg went backwards which would break package feeds from (0:1.1-r0.8 to 0:1.1-r0.7) [version-going-backwards]
ttf-pt-sans-1.1: Package version for package ttf-pt-sans-dev went backwards which would break package feeds from (0:1.1-r0.8 to 0:1.1-r0.7) [version-going-backwards]
ttf-pt-sans-1.1: Package version for package ttf-pt-sans-doc went backwards which would break package feeds from (0:1.1-r0.8 to 0:1.1-r0.7) [version-going-backwards]
ttf-pt-sans-1.1: Package version for package ttf-pt-sans-locale went backwards which would break package feeds from (0:1.1-r0.8 to 0:1.1-r0.7) [version-going-backwards]
ttf-pt-sans-1.1: Package version for package ttf-pt-sans-staticdev went backwards which would break package feeds from (0:1.1-r0.8 to 0:1.1-r0.7) [version-going-backwards]
ttf-pt-sans-1.1: Package version for package ttf-pt-sans went backwards which would break package feeds from (0:1.1-r0.8 to 0:1.1-r0.7) [version-going-backwards]
ttf-sazanami-20040629: Package version for package ttf-sazanami-gothic went backwards which would break package feeds from (0:20040629-r9.8 to 0:20040629-r9.7) [version-going-backwards]
ttf-sazanami-20040629: Package version for package ttf-sazanami-mincho went backwards which would break package feeds from (0:20040629-r9.8 to 0:20040629-r9.7) [version-going-backwards]
ttf-tlwg-0.6.1: Package version for package ttf-tlwg went backwards which would break package feeds from (0:0.6.1-r0.8 to 0:0.6.1-r0.7) [version-going-backwards]
ttf-ubuntu-font-family-0.80: Package version for package ttf-ubuntu-mono went backwards which would break package feeds from (0:0.80-r1.8 to 0:0.80-r1.7) [version-going-backwards]
ttf-ubuntu-font-family-0.80: Package version for package ttf-ubuntu-sans went backwards which would break package feeds from (0:0.80-r1.8 to 0:0.80-r1.7) [version-going-backwards]
ttf-vlgothic-20141206: Package version for package ttf-vlgothic went backwards which would break package feeds from (0:20141206-r0.8 to 0:20141206-r0.7) [version-going-backwards]
ttf-wqy-zenhei-0.9.45: Package version for package ttf-wqy-zenhei went backwards which would break package feeds from (0:0.9.45-r0.8 to 0:0.9.45-r0.7) [version-going-backwards]
tzdata-2017c: Package version for package tzdata-africa went backwards which would break package feeds from (0:2017c-r0.8 to 0:2017c-r0.7) [version-going-backwards]
tzdata-2017c: Package version for package tzdata-americas went backwards which would break package feeds from (0:2017c-r0.8 to 0:2017c-r0.7) [version-going-backwards]
tzdata-2017c: Package version for package tzdata-antarctica went backwards which would break package feeds from (0:2017c-r0.8 to 0:2017c-r0.7) [version-going-backwards]
tzdata-2017c: Package version for package tzdata-arctic went backwards which would break package feeds from (0:2017c-r0.8 to 0:2017c-r0.7) [version-going-backwards]
tzdata-2017c: Package version for package tzdata-asia went backwards which would break package feeds from (0:2017c-r0.8 to 0:2017c-r0.7) [version-going-backwards]
tzdata-2017c: Package version for package tzdata-atlantic went backwards which would break package feeds from (0:2017c-r0.8 to 0:2017c-r0.7) [version-going-backwards]
tzdata-2017c: Package version for package tzdata-australia went backwards which would break package feeds from (0:2017c-r0.8 to 0:2017c-r0.7) [version-going-backwards]
tzdata-2017c: Package version for package tzdata-europe went backwards which would break package feeds from (0:2017c-r0.8 to 0:2017c-r0.7) [version-going-backwards]
tzdata-2017c: Package version for package tzdata-misc went backwards which would break package feeds from (0:2017c-r0.8 to 0:2017c-r0.7) [version-going-backwards]
tzdata-2017c: Package version for package tzdata-pacific went backwards which would break package feeds from (0:2017c-r0.8 to 0:2017c-r0.7) [version-going-backwards]
tzdata-2017c: Package version for package tzdata-posix went backwards which would break package feeds from (0:2017c-r0.8 to 0:2017c-r0.7) [version-going-backwards]
tzdata-2017c: Package version for package tzdata-right went backwards which would break package feeds from (0:2017c-r0.8 to 0:2017c-r0.7) [version-going-backwards]
tzdata-2017c: Package version for package tzdata went backwards which would break package feeds from (0:2017c-r0.8 to 0:2017c-r0.7) [version-going-backwards]
update-rc.d-0.7: Package version for package update-rc.d-dbg went backwards which would break package feeds from (0:0.7-r5.8 to 0:0.7-r5.7) [version-going-backwards]
update-rc.d-0.7: Package version for package update-rc.d-dev went backwards which would break package feeds from (0:0.7-r5.8 to 0:0.7-r5.7) [version-going-backwards]
update-rc.d-0.7: Package version for package update-rc.d-doc went backwards which would break package feeds from (0:0.7-r5.8 to 0:0.7-r5.7) [version-going-backwards]
update-rc.d-0.7: Package version for package update-rc.d-locale went backwards which would break package feeds from (0:0.7-r5.8 to 0:0.7-r5.7) [version-going-backwards]
update-rc.d-0.7: Package version for package update-rc.d-staticdev went backwards which would break package feeds from (0:0.7-r5.8 to 0:0.7-r5.7) [version-going-backwards]
update-rc.d-0.7: Package version for package update-rc.d went backwards which would break package feeds from (0:0.7-r5.8 to 0:0.7-r5.7) [version-going-backwards]
usbinit-1.0: Package version for package usbinit-dbg went backwards which would break package feeds from (0:1.0-r3.8 to 0:1.0-r3.7) [version-going-backwards]
usbinit-1.0: Package version for package usbinit-dev went backwards which would break package feeds from (0:1.0-r3.8 to 0:1.0-r3.7) [version-going-backwards]
usbinit-1.0: Package version for package usbinit-doc went backwards which would break package feeds from (0:1.0-r3.8 to 0:1.0-r3.7) [version-going-backwards]
usbinit-1.0: Package version for package usbinit-locale went backwards which would break package feeds from (0:1.0-r3.8 to 0:1.0-r3.7) [version-going-backwards]
usbinit-1.0: Package version for package usbinit-staticdev went backwards which would break package feeds from (0:1.0-r3.8 to 0:1.0-r3.7) [version-going-backwards]
usbinit-1.0: Package version for package usbinit went backwards which would break package feeds from (0:1.0-r3.8 to 0:1.0-r3.7) [version-going-backwards]
usb-modeswitch-data-20170205: Package version for package usb-modeswitch-data-dbg went backwards which would break package feeds from (0:20170205-r0.8 to 0:20170205-r0.7) [version-going-backwards]
usb-modeswitch-data-20170205: Package version for package usb-modeswitch-data-dev went backwards which would break package feeds from (0:20170205-r0.8 to 0:20170205-r0.7) [version-going-backwards]
usb-modeswitch-data-20170205: Package version for package usb-modeswitch-data-doc went backwards which would break package feeds from (0:20170205-r0.8 to 0:20170205-r0.7) [version-going-backwards]
usb-modeswitch-data-20170205: Package version for package usb-modeswitch-data-locale went backwards which would break package feeds from (0:20170205-r0.8 to 0:20170205-r0.7) [version-going-backwards]
usb-modeswitch-data-20170205: Package version for package usb-modeswitch-data-staticdev went backwards which would break package feeds from (0:20170205-r0.8 to 0:20170205-r0.7) [version-going-backwards]
usb-modeswitch-data-20170205: Package version for package usb-modeswitch-data went backwards which would break package feeds from (0:20170205-r0.8 to 0:20170205-r0.7) [version-going-backwards]
volatile-binds-1.0: Package version for package volatile-binds-dbg went backwards which would break package feeds from (0:1.0-r0.8 to 0:1.0-r0.7) [version-going-backwards]
volatile-binds-1.0: Package version for package volatile-binds-dev went backwards which would break package feeds from (0:1.0-r0.8 to 0:1.0-r0.7) [version-going-backwards]
volatile-binds-1.0: Package version for package volatile-binds-doc went backwards which would break package feeds from (0:1.0-r0.8 to 0:1.0-r0.7) [version-going-backwards]
volatile-binds-1.0: Package version for package volatile-binds-locale went backwards which would break package feeds from (0:1.0-r0.8 to 0:1.0-r0.7) [version-going-backwards]
volatile-binds-1.0: Package version for package volatile-binds-staticdev went backwards which would break package feeds from (0:1.0-r0.8 to 0:1.0-r0.7) [version-going-backwards]
volatile-binds-1.0: Package version for package volatile-binds went backwards which would break package feeds from (0:1.0-r0.8 to 0:1.0-r0.7) [version-going-backwards]
wayland-protocols-1.12: Package version for package wayland-protocols went backwards which would break package feeds from (0:1.12-r0.5 to 0:1.12-r0.4) [version-going-backwards]
weston-init-1.0: Package version for package weston-init-dbg went backwards which would break package feeds from (0:1.0-r0.8 to 0:1.0-r0.7) [version-going-backwards]
weston-init-1.0: Package version for package weston-init-dev went backwards which would break package feeds from (0:1.0-r0.8 to 0:1.0-r0.7) [version-going-backwards]
weston-init-1.0: Package version for package weston-init-doc went backwards which would break package feeds from (0:1.0-r0.8 to 0:1.0-r0.7) [version-going-backwards]
weston-init-1.0: Package version for package weston-init-locale went backwards which would break package feeds from (0:1.0-r0.8 to 0:1.0-r0.7) [version-going-backwards]
weston-init-1.0: Package version for package weston-init-staticdev went backwards which would break package feeds from (0:1.0-r0.8 to 0:1.0-r0.7) [version-going-backwards]
weston-init-1.0: Package version for package weston-init went backwards which would break package feeds from (0:1.0-r0.8 to 0:1.0-r0.7) [version-going-backwards]
xcursor-transparent-theme-0.1.1+gitAUTOINC+23c8af5ba4: Package version for package xcursor-transparent-theme-dbg went backwards which would break package feeds from (0:0.1.1+git0+23c8af5ba4-r0.8 to 0:0.1.1+git0+23c8af5ba4-r0.7) [version-going-backwards]
xcursor-transparent-theme-0.1.1+gitAUTOINC+23c8af5ba4: Package version for package xcursor-transparent-theme-dev went backwards which would break package feeds from (0:0.1.1+git0+23c8af5ba4-r0.8 to 0:0.1.1+git0+23c8af5ba4-r0.7) [version-going-backwards]
xcursor-transparent-theme-0.1.1+gitAUTOINC+23c8af5ba4: Package version for package xcursor-transparent-theme-doc went backwards which would break package feeds from (0:0.1.1+git0+23c8af5ba4-r0.8 to 0:0.1.1+git0+23c8af5ba4-r0.7) [version-going-backwards]
xcursor-transparent-theme-0.1.1+gitAUTOINC+23c8af5ba4: Package version for package xcursor-transparent-theme-locale went backwards which would break package feeds from (0:0.1.1+git0+23c8af5ba4-r0.8 to 0:0.1.1+git0+23c8af5ba4-r0.7) [version-going-backwards]
xcursor-transparent-theme-0.1.1+gitAUTOINC+23c8af5ba4: Package version for package xcursor-transparent-theme-staticdev went backwards which would break package feeds from (0:0.1.1+git0+23c8af5ba4-r0.8 to 0:0.1.1+git0+23c8af5ba4-r0.7) [version-going-backwards]
xcursor-transparent-theme-0.1.1+gitAUTOINC+23c8af5ba4: Package version for package xcursor-transparent-theme went backwards which would break package feeds from (0:0.1.1+git0+23c8af5ba4-r0.8 to 0:0.1.1+git0+23c8af5ba4-r0.7) [version-going-backwards]
xfce-dusk-gtk3-1.3: Package version for package xfce-dusk-gtk3-dbg went backwards which would break package feeds from (0:1.3-r0.8 to 0:1.3-r0.7) [version-going-backwards]
xfce-dusk-gtk3-1.3: Package version for package xfce-dusk-gtk3-dev went backwards which would break package feeds from (0:1.3-r0.8 to 0:1.3-r0.7) [version-going-backwards]
xfce-dusk-gtk3-1.3: Package version for package xfce-dusk-gtk3-doc went backwards which would break package feeds from (0:1.3-r0.8 to 0:1.3-r0.7) [version-going-backwards]
xfce-dusk-gtk3-1.3: Package version for package xfce-dusk-gtk3-locale went backwards which would break package feeds from (0:1.3-r0.8 to 0:1.3-r0.7) [version-going-backwards]
xfce-dusk-gtk3-1.3: Package version for package xfce-dusk-gtk3-staticdev went backwards which would break package feeds from (0:1.3-r0.8 to 0:1.3-r0.7) [version-going-backwards]
xfce-dusk-gtk3-1.3: Package version for package xfce-dusk-gtk3 went backwards which would break package feeds from (0:1.3-r0.8 to 0:1.3-r0.7) [version-going-backwards]
xorg-fonts-100dpi-1.0: Package version for package xorg-fonts-100dpi-dbg went backwards which would break package feeds from (0:1.0-r0.8 to 0:1.0-r0.7) [version-going-backwards]
xorg-fonts-100dpi-1.0: Package version for package xorg-fonts-100dpi-dev went backwards which would break package feeds from (0:1.0-r0.8 to 0:1.0-r0.7) [version-going-backwards]
xorg-fonts-100dpi-1.0: Package version for package xorg-fonts-100dpi-ptest went backwards which would break package feeds from (0:1.0-r0.8 to 0:1.0-r0.7) [version-going-backwards]
xorg-fonts-100dpi-1.0: Package version for package xorg-fonts-100dpi went backwards which would break package feeds from (0:1.0-r0.8 to 0:1.0-r0.7) [version-going-backwards]
xorg-minimal-fonts-1.0: Package version for package xorg-minimal-fonts went backwards which would break package feeds from (1:1.0-r2.8 to 1:1.0-r2.7) [version-going-backwards]
xuser-account-0.1: Package version for package xuser-account-dbg went backwards which would break package feeds from (0:0.1-r0.8 to 0:0.1-r0.7) [version-going-backwards]
xuser-account-0.1: Package version for package xuser-account-dev went backwards which would break package feeds from (0:0.1-r0.8 to 0:0.1-r0.7) [version-going-backwards]
xuser-account-0.1: Package version for package xuser-account-doc went backwards which would break package feeds from (0:0.1-r0.8 to 0:0.1-r0.7) [version-going-backwards]
xuser-account-0.1: Package version for package xuser-account-locale went backwards which would break package feeds from (0:0.1-r0.8 to 0:0.1-r0.7) [version-going-backwards]
xuser-account-0.1: Package version for package xuser-account-staticdev went backwards which would break package feeds from (0:0.1-r0.8 to 0:0.1-r0.7) [version-going-backwards]
xuser-account-0.1: Package version for package xuser-account went backwards which would break package feeds from (0:0.1-r0.8 to 0:0.1-r0.7) [version-going-backwards]


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


count: 9	issue: qa_pseudo
ell-git: This /work/armv5te-oe-linux-gnueabi/ell/git-r0/pseudo/pseudo.log indicates 8 errors [qa_pseudo]
packagegroup-core-full-cmdline-1.0: This /work/all-oe-linux/packagegroup-core-full-cmdline/1.0-r6/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
python3-netaddr-0.7.19: This /work/aarch64-oe-linux/python3-netaddr/0.7.19-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
python3-pyserial-3.4: This /work/armv5te-oe-linux-gnueabi/python3-pyserial/3.4-r0/pseudo/pseudo.log indicates 6 errors [qa_pseudo]
python-ndg-httpsclient-0.4.3: This /work/i586-oe-linux-musl/python-ndg-httpsclient/0.4.3-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
python-pyserial-3.4: This /work/core2-64-oe-linux/python-pyserial/3.4-r0/pseudo/pseudo.log indicates 4 errors [qa_pseudo]
run-postinsts-1.0: This /work/all-oe-linux/run-postinsts/1.0-r9/pseudo/pseudo.log indicates 9 errors [qa_pseudo]
ttf-tlwg-0.6.1: This /work/all-oe-linux/ttf-tlwg/0.6.1-r0/pseudo/pseudo.log indicates 10 errors [qa_pseudo]
xinit-1.3.4: This /work/armv5te-oe-linux-gnueabi/xinit/1_1.3.4-r0/pseudo/pseudo.log indicates 7 errors [qa_pseudo]



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
9c63095 dnfdragora: new add
not included in master yet: 
15ae852 plymouth: fix path to systemd-tty-ask-password-agent
84f6b43 gvfs: update 1.32.1 -> 1.34.1
5a5a504 plymouth: do not install systemd units manually
8e0e88b plymouth: packageconfig gtk needs gtk+3 as depends
4e91671 open-isns: Fix build with musl
f31a31a bridge-utils: modify the AR to cross toolchain
38e6520 ssmtp: misc recipe updates + add Debian "partial loss of message body" fix
208d371 dovecot: Fix parallel build
5a93918 dnsmasq: update SRC_URI for versions 2.69 and earlier
0cbe304 postfix: fix send mail failure and eliminate warning
8e14b20 openvpn: Upgrade 2.4.3 -> 2.4.4
3891460 arptables: Fix do_install task
7cedc81 lksctp-tools: update and remove from blacklist
eae779c freediameter: add new recipe
6cf2cfb net-snmp: support openssl without 3des
0e0ec76c stunnel: fix compile error when openssl disable des support
d622865 bridge-utils: update to v1.6
9c43787 corosync: 2.4.2 -> 2.4.3
789e0dd cyrus-sasl: virtual/db isn't used by core, change to db
08c03c4 postfix: virtual/db isn't used by core, change to db
7ea6967 networkmanager: add consolekit only when x11 is enabled
edea80d iscsi-initiator-utils: check file existence before moving
74c9f42 iscsi-initiator-utils: remove the distro_features_check
e2f3541 open-isns: add sysvinit support
29ad88c libtalloc: update to version 2.1.10
7f7ede2 libtevent: update to version 0.99.33
506cbff libtdb: update to version 1.3.15
8c566ab libldb: update to version 1.2.2
20ab33f Revert "samba: add missing RDEPENDS"
03e923d samba: move to version 4.7.0
fa07eb1 pcmciautils: add (from oe-core)
8d4377a chrony: Update to version 3.2
49268af site: move from meta-oe to meta-networking
593aca4 inetutils: make -syslog rconflict with other system loggers
f555fbb net-snmp: fix invalid paths in target net-snmp-config
aafdd48d cifs-utils: mount.cifs should build without samba dependency
85a769b wireshark: Update to 2.2.11
6e8441b python-pymisc: update to version 2.4.85
1b2de6f python-flask-wtf: update to version 0.14.2
f9e33c6 python-parted: update to version 3.11.1
91b4e1d python-networkx: update to version 2.0
e68340c python3-langtable: update to version 0.0.38
20050b6 python-pyperclip: add an initial recipe for version 1.6.0
a4e96d0 python-cmd2: update RDEPENDS to include pyperclip
d030a84 python-pyflakes: update to version 1.6.0
cbc89c6 smstools3: update to 3.1.21; drop uneeded patches
9251ee1 xrdp: CVE-2017-16927
1b1a46a hwloc: fix multilib problem
cf53f63 tinyproxy: 'nobody' should belong to 'nogroup'
5592659 postfix: drop NATIVE_INSTALL_WORKS
5aa27b8 libyui-ncurses: new add
b3452fa leveldb: fix checking for SSE flag
5c05f86 python-whoosh: add RDEPENDS to work on minimal python installs
aebc64b python-zopeinterface: update RDEPENDS to include datetime
e94c419 python-pycparser: add pprint to the RDEPENDS
5b36c80 python-netaddr: update to RDEPENDS to work on minimal python installs
0b2d9df python-pyroute2: re-add the RDEPENDS that were removed and verify on the latest release
8ecc12e python-pyserial: reorganize packaging and update RDEPENDS
5c211e5 python-pandas: add json to the RDEPENDS list

== Tested changes (not included in master yet) - meta-qt5 ==
latest upstream commit: 
3cf0bbb qtbase_git: install qt.conf for the target
not included in master yet: 
0fd9104 packagegroup-qt5-qtcreator-debug: remove qtdeclarative-plugins

== Tested changes (not included in master yet) - meta-browser ==
latest upstream commit: 
8cc24ca Merge pull request #86 from rakuco/oz-wl-command-line-args
not included in master yet: 


