Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f49.google.com (mail-pl0-f49.google.com
	[209.85.160.49])
	by mail.openembedded.org (Postfix) with ESMTP id DC5046E666
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Mar 2018 23:37:31 +0000 (UTC)
Received: by mail-pl0-f49.google.com with SMTP id ay8-v6so4575136plb.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Mar 2018 15:37:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=to:from:subject:message-id:date:user-agent:mime-version
	:content-language;
	bh=VhKZLAwMZOi9yUzUkk2k2FT3VkB1lIDMUKQJKKMu/2Y=;
	b=CxcQekOg/vbglVot4xSAt9eWciPy/zvyT7Nm1isU5y+XEQsGDcCSiacWO4eSJAaRGy
	xCxZZfS9Us+vaG6iSwVQcKgOLJdPWvdwBLwgVwZIcRE0Dd9DTvLSidkD2XTQX3hnnz5g
	MjoKhpqApT2r736CCbdUOuQrwqNfnuvdnNrhEj+8EdurkQSFUZJWrD2616Y9y83fto2O
	Rk9tSroxllhiWFy37HFG4wNreLVaisPSL4ECV47K9sFnMPD7/2CoeEnj53gtDOZ/+bu8
	2ABPagfP/Wz9Jmrz8VC7XOg0CoruLHyB3M1d2unKgdJ42M8Sudjodg0XMYsEofxXhOyn
	hZ3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:to:from:subject:message-id:date:user-agent
	:mime-version:content-language;
	bh=VhKZLAwMZOi9yUzUkk2k2FT3VkB1lIDMUKQJKKMu/2Y=;
	b=an9G6+VP3TFu7LVlc1flFdZLxsT2Gh4uGZxtGz76aX9Ud8HAGR+x38iEepn4t4ldjm
	sz7no2fsPDaBVbUQ7NVQtt45/JCkSIwy+HtHebRi1Jl/3eMKy66m/yCWMqe2yuvK7ttb
	nWcknW3XsjbCTSs7K2qrr+2AaDJWuhrirfybO6FPOjVnpchWclLmhNRl3ezp30tOG5gh
	6EC+v8R1lMPjz3cFNrGQVAl1s9Hhl9GgwdLBXr/f7LyD3javyAoaE828d67+CLMshKdh
	Twbng8SYDtj+AmcAi6CxGFZI72gOtIvLTM8uqFfTUFU/TaNo7yW8o9TG5xJ04aBNYi5y
	pG5Q==
X-Gm-Message-State: APf1xPBA/7u/M7eA0kVVaHxWz7tTC5WN0QFbx9d3ErSEpRcUFNq2W0gz
	b48Ex3kbE3yC5JdoCPe47CiXVQ==
X-Google-Smtp-Source: AG47ELu9zQtwY3d4Z0i5Gaw5+w2ENnvbqx4zS8Et9FLoom5jIcBjKzttT9KlVs3M/v6V+pzeg3UdGw==
X-Received: by 2002:a17:902:b58d:: with SMTP id
	a13-v6mr3492890pls.123.1519947451075; 
	Thu, 01 Mar 2018 15:37:31 -0800 (PST)
Received: from ?IPv6:2601:202:4000:1184:28fe:10b:83ad:e2e?
	([2601:202:4000:1184:28fe:10b:83ad:e2e])
	by smtp.gmail.com with ESMTPSA id
	j19sm6450545pfh.26.2018.03.01.15.37.29
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 01 Mar 2018 15:37:30 -0800 (PST)
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
From: akuster808 <akuster808@gmail.com>
Message-ID: <c6d3abbb-841a-7f24-4b82-474992493bec@gmail.com>
Date: Thu, 1 Mar 2018 15:37:28 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: State of the World, Failed tasks 2018-02-26
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
X-List-Received-Date: Thu, 01 Mar 2018 23:37:32 -0000
Content-Language: en-US
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Several of the new failures popped up after 4.15 kernel update.



== Failed tasks 2018-02-26 ==

INFO: jenkins-job.sh-1.8.43 Complete log available at http://logs.nslu2-linux.org/buildlogs/oe/world/sumo/log.report.20180228_061518.log

=== common (8) ===
    * meta-openembedded/meta-networking/recipes-extended/iscsitarget/iscsitarget_1.4.20.3+svn502.bb:do_compile
    * meta-openembedded/meta-networking/recipes-protocols/tsocks/tsocks_1.8beta5.bb:do_compile
    * meta-openembedded/meta-networking/recipes-support/drbd/drbd_9.0.8-1.bb:do_compile
    * meta-openembedded/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb:do_compile
    * meta-openembedded/meta-oe/recipes-devtools/librcf/librcf_2.2.0.0.bb:do_compile
    * meta-openembedded/meta-oe/recipes-extended/tipcutils/tipcutils_git.bb:do_compile
    * meta-openembedded/meta-oe/recipes-graphics/dnfdragora/dnfdragora_git.bb:do_packagedata
    * meta-openembedded/meta-oe/recipes-graphics/libyui/libyui-ncurses_git.bb:do_compile

=== common-x86 (0) ===

=== qemuarm (10) ===
    * meta-openembedded/meta-filesystems/recipes-utils/aufs-util/aufs-util_git.bb:do_compile
    * meta-openembedded/meta-multimedia/recipes-multimedia/gstreamer-1.0/gstd_1.0.bb:do_configure
    * meta-openembedded/meta-networking/recipes-daemons/keepalived/keepalived_1.3.5.bb:do_compile
    * meta-openembedded/meta-networking/recipes-filter/ebtables/ebtables_2.0.10-4.bb:do_compile
    * meta-openembedded/meta-oe/recipes-benchmark/libc-bench/libc-bench_20110206.bb:do_compile
    * meta-openembedded/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb:do_compile
    * meta-qt5/recipes-qt/qt5/qtgraphicaleffects_git.bb:do_compile
    * meta-qt5/recipes-qt/qt5/qtquickcontrols2_git.bb:do_compile
    * meta-qt5/recipes-qt/qt5/qtquickcontrols_git.bb:do_compile
    * openembedded-core/meta/recipes-sato/webkit/webkitgtk_2.18.6.bb:do_compile

=== qemuarm64 (4) ===
    * meta-openembedded/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_2.0.2.bb:do_configure
    * meta-openembedded/meta-oe/recipes-devtools/luajit/luajit_2.0.5.bb:do_compile
    * meta-qt5/recipes-qt/qt5/qt5-creator_4.5.1.bb:do_compile
    * openembedded-core/meta/recipes-kernel/kexec/kexec-tools_2.0.16.bb:do_compile

=== qemux86 (25) ===
    * meta-browser/recipes-browser/chromium/chromium-x11_64.0.3282.167.bb:do_patch
    * meta-openembedded/meta-networking/recipes-connectivity/rdist/rdist_6.1.5.bb:do_package
    * meta-openembedded/meta-networking/recipes-daemons/opensaf/opensaf_5.18.02.bb:do_compile
    * meta-openembedded/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.3.bb:do_compile
    * meta-openembedded/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh_0.17.bb:do_compile
    * meta-openembedded/meta-networking/recipes-netkit/netkit-rusers/netkit-rusers_0.17.bb:do_compile
    * meta-openembedded/meta-networking/recipes-netkit/netkit-telnet/netkit-telnet_0.17.bb:do_configure
    * meta-openembedded/meta-networking/recipes-support/wireshark/wireshark_2.4.5.bb:do_compile
    * meta-openembedded/meta-oe/recipes-connectivity/telepathy/telepathy-glib_0.24.0.bb:do_compile
    * meta-openembedded/meta-oe/recipes-connectivity/umip/umip_1.0.bb:do_compile
    * meta-openembedded/meta-oe/recipes-connectivity/wvdial/wvdial_1.61.bb:do_compile
    * meta-openembedded/meta-oe/recipes-extended/polkit/polkit_0.113.bb:do_compile
    * meta-openembedded/meta-oe/recipes-extended/tiptop/tiptop_2.3.1.bb:do_compile
    * meta-openembedded/meta-oe/recipes-gnome/libunique/libunique_1.1.6.bb:do_compile
    * meta-openembedded/meta-oe/recipes-kernel/crash/crash_7.2.0.bb:do_compile
    * meta-openembedded/meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.0.bb:do_compile
    * meta-openembedded/meta-oe/recipes-multimedia/alsa/alsa-oss_1.0.28.bb:do_compile
    * meta-openembedded/meta-oe/recipes-test/pm-qa/pm-qa_git.bb:do_compile
    * meta-qt5/recipes-qt/qt5/qtbase_git.bb:do_configure
    * openembedded-core/meta/recipes-connectivity/avahi/avahi_0.7.bb:do_compile
    * openembedded-core/meta/recipes-gnome/gnome/gconf_3.2.6.bb:do_compile
    * openembedded-core/meta/recipes-graphics/cogl/cogl-1.0_1.22.2.bb:do_compile
    * openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.12.4.bb:do_compile
    * openembedded-core/meta/recipes-multimedia/x264/x264_git.bb:do_package_qa
    * openembedded-core/meta/recipes-support/atk/at-spi2-core_2.26.2.bb:do_compile

=== qemux86_64 (3) ===
    * meta-openembedded/meta-oe/recipes-graphics/glm/glm_0.9.8.5.bb:do_compile
    * openembedded-core/meta/recipes-core/glibc/glibc-locale_2.26.bb:do_package_qa
    * virtual:native:meta-openembedded/meta-oe/recipes-support/uim/uim_1.8.6.bb:do_install

=== Number of failed tasks (84) ===
{| class=wikitable
|-
|| qemuarm 	|| 18	 || http://logs.nslu2-linux.org/buildlogs/oe/world/sumo/log.world.qemuarm.20180225_125116.log/ || 
|-
|| qemuarm64 	|| 17	 || http://logs.nslu2-linux.org/buildlogs/oe/world/sumo/log.world.qemuarm64.20180226_174752.log/ || http://errors.yoctoproject.org/Errors/Build/54703/
|-
|| qemux86 	|| 33	 || http://logs.nslu2-linux.org/buildlogs/oe/world/sumo/log.world.qemux86.20180225_125126.log/ || http://errors.yoctoproject.org/Errors/Build/54478/
|-
|| qemux86_64 	|| 16	 || http://logs.nslu2-linux.org/buildlogs/oe/world/sumo/log.world.qemux86-64.20180226_123856.log/ || http://errors.yoctoproject.org/Errors/Build/54702/
|}

=== PNBLACKLISTs (0) ===

=== QA issues (730) ===
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
||0	||qa_pseudo
|-
||0	||symlink-to-sysroot
|-
||1	||installed-vs-shipped
|-
||1	||unknown-configure-option
|-
||2	||host-user-contaminated
|-
||2	||textrel
|-
||724	||version-going-backwards
|}



=== Incorrect PACKAGE_ARCH or sstate signatures (0) ===

Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/sumo/log.signatures.20180228_021751.log/


    * ERROR: Nothing PROVIDES 'samba' (but /home/jenkins/oe/world/shr-core/meta-openembedded/meta-multimedia/recipes-mediacenter/kodi/kodi_17.bb DEPENDS on or otherwise requires it)
    * ERROR: Required build target 'meta-world-pkgdata' has no buildable providers.
    * ERROR: no sigdata files were generated for MACHINE qemux86copy in /home/jenkins/oe/world/shr-core/tmpfs/stamps
    * ERROR: Nothing PROVIDES 'samba' (but /home/jenkins/oe/world/shr-core/meta-openembedded/meta-multimedia/recipes-mediacenter/kodi/kodi_17.bb DEPENDS on or otherwise requires it)
    * ERROR: Required build target 'meta-world-pkgdata' has no buildable providers.
    * ERROR: no sigdata files were generated for MACHINE qemux86 in /home/jenkins/oe/world/shr-core/tmpfs/stamps
    * ERROR: Nothing PROVIDES 'libpam' (but /home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-support/xrdp/xrdp_0.9.4.bb DEPENDS on or otherwise requires it)
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
x264-r2854+gitAUTOINC+e9a5903edf: ELF binary '/work/i586-oe-linux-musl/x264/r2854+gitAUTOINC+e9a5903edf-r0/packages-split/x264-bin/usr/bin/x264' has relocations in .text [textrel]
x264-r2854+gitAUTOINC+e9a5903edf: ELF binary '/work/i586-oe-linux-musl/x264/r2854+gitAUTOINC+e9a5903edf-r0/packages-split/x264/usr/lib/libx264.so.152' has relocations in .text [textrel]


count: 0	issue: build-deps


count: 0	issue: file-rdeps


count: 724	issue: version-going-backwards
qt3d-5.10.1+5.11-alpha+gitAUTOINC+e813fb36e7: Package version for package qt3d-dbg went backwards which would break package feeds from (0:5.10.1+git0+31f424bb81-r0.0 to 0:5.10.1+5.11-alpha+git0+e813fb36e7-r0.0) [version-going-backwards]
qt3d-5.10.1+5.11-alpha+gitAUTOINC+e813fb36e7: Package version for package qt3d-dev went backwards which would break package feeds from (0:5.10.1+git0+31f424bb81-r0.0 to 0:5.10.1+5.11-alpha+git0+e813fb36e7-r0.0) [version-going-backwards]
qt3d-5.10.1+5.11-alpha+gitAUTOINC+e813fb36e7: Package version for package qt3d-doc went backwards which would break package feeds from (0:5.10.1+git0+31f424bb81-r0.0 to 0:5.10.1+5.11-alpha+git0+e813fb36e7-r0.0) [version-going-backwards]
qt3d-5.10.1+5.11-alpha+gitAUTOINC+e813fb36e7: Package version for package qt3d-examples-dbg went backwards which would break package feeds from (0:5.10.1+git0+31f424bb81-r0.0 to 0:5.10.1+5.11-alpha+git0+e813fb36e7-r0.0) [version-going-backwards]
qt3d-5.10.1+5.11-alpha+gitAUTOINC+e813fb36e7: Package version for package qt3d-examples-dev went backwards which would break package feeds from (0:5.10.1+git0+31f424bb81-r0.0 to 0:5.10.1+5.11-alpha+git0+e813fb36e7-r0.0) [version-going-backwards]
qt3d-5.10.1+5.11-alpha+gitAUTOINC+e813fb36e7: Package version for package qt3d-examples-staticdev went backwards which would break package feeds from (0:5.10.1+git0+31f424bb81-r0.0 to 0:5.10.1+5.11-alpha+git0+e813fb36e7-r0.0) [version-going-backwards]
qt3d-5.10.1+5.11-alpha+gitAUTOINC+e813fb36e7: Package version for package qt3d-examples went backwards which would break package feeds from (0:5.10.1+git0+31f424bb81-r0.0 to 0:5.10.1+5.11-alpha+git0+e813fb36e7-r0.0) [version-going-backwards]
qt3d-5.10.1+5.11-alpha+gitAUTOINC+e813fb36e7: Package version for package qt3d-locale went backwards which would break package feeds from (0:5.10.1+git0+31f424bb81-r0.0 to 0:5.10.1+5.11-alpha+git0+e813fb36e7-r0.0) [version-going-backwards]
qt3d-5.10.1+5.11-alpha+gitAUTOINC+e813fb36e7: Package version for package qt3d-mkspecs went backwards which would break package feeds from (0:5.10.1+git0+31f424bb81-r0.0 to 0:5.10.1+5.11-alpha+git0+e813fb36e7-r0.0) [version-going-backwards]
qt3d-5.10.1+5.11-alpha+gitAUTOINC+e813fb36e7: Package version for package qt3d-plugins-dbg went backwards which would break package feeds from (0:5.10.1+git0+31f424bb81-r0.0 to 0:5.10.1+5.11-alpha+git0+e813fb36e7-r0.0) [version-going-backwards]
qt3d-5.10.1+5.11-alpha+gitAUTOINC+e813fb36e7: Package version for package qt3d-plugins went backwards which would break package feeds from (0:5.10.1+git0+31f424bb81-r0.0 to 0:5.10.1+5.11-alpha+git0+e813fb36e7-r0.0) [version-going-backwards]
qt3d-5.10.1+5.11-alpha+gitAUTOINC+e813fb36e7: Package version for package qt3d-qmldesigner went backwards which would break package feeds from (0:5.10.1+git0+31f424bb81-r0.0 to 0:5.10.1+5.11-alpha+git0+e813fb36e7-r0.0) [version-going-backwards]
qt3d-5.10.1+5.11-alpha+gitAUTOINC+e813fb36e7: Package version for package qt3d-qmlplugins-dbg went backwards which would break package feeds from (0:5.10.1+git0+31f424bb81-r0.0 to 0:5.10.1+5.11-alpha+git0+e813fb36e7-r0.0) [version-going-backwards]
qt3d-5.10.1+5.11-alpha+gitAUTOINC+e813fb36e7: Package version for package qt3d-qmlplugins went backwards which would break package feeds from (0:5.10.1+git0+31f424bb81-r0.0 to 0:5.10.1+5.11-alpha+git0+e813fb36e7-r0.0) [version-going-backwards]
qt3d-5.10.1+5.11-alpha+gitAUTOINC+e813fb36e7: Package version for package qt3d-staticdev went backwards which would break package feeds from (0:5.10.1+git0+31f424bb81-r0.0 to 0:5.10.1+5.11-alpha+git0+e813fb36e7-r0.0) [version-going-backwards]
qt3d-5.10.1+5.11-alpha+gitAUTOINC+e813fb36e7: Package version for package qt3d-tools-dbg went backwards which would break package feeds from (0:5.10.1+git0+31f424bb81-r0.0 to 0:5.10.1+5.11-alpha+git0+e813fb36e7-r0.0) [version-going-backwards]
qt3d-5.10.1+5.11-alpha+gitAUTOINC+e813fb36e7: Package version for package qt3d-tools went backwards which would break package feeds from (0:5.10.1+git0+31f424bb81-r0.0 to 0:5.10.1+5.11-alpha+git0+e813fb36e7-r0.0) [version-going-backwards]
qt3d-5.10.1+5.11-alpha+gitAUTOINC+e813fb36e7: Package version for package qt3d went backwards which would break package feeds from (0:5.10.1+git0+31f424bb81-r0.0 to 0:5.10.1+5.11-alpha+git0+e813fb36e7-r0.0) [version-going-backwards]
qtbase-5.10.1+5.11-alpha+gitAUTOINC+17b73b0d2b: Package version for package qtbase-dbg went backwards which would break package feeds from (0:5.10.1+git0+6c6ace9d23-r0.0 to 0:5.10.1+5.11-alpha+git0+17b73b0d2b-r0.0) [version-going-backwards]
qtbase-5.10.1+5.11-alpha+gitAUTOINC+17b73b0d2b: Package version for package qtbase-dev went backwards which would break package feeds from (0:5.10.1+git0+6c6ace9d23-r0.0 to 0:5.10.1+5.11-alpha+git0+17b73b0d2b-r0.0) [version-going-backwards]
qtbase-5.10.1+5.11-alpha+gitAUTOINC+17b73b0d2b: Package version for package qtbase-doc went backwards which would break package feeds from (0:5.10.1+git0+6c6ace9d23-r0.0 to 0:5.10.1+5.11-alpha+git0+17b73b0d2b-r0.0) [version-going-backwards]
qtbase-5.10.1+5.11-alpha+gitAUTOINC+17b73b0d2b: Package version for package qtbase-examples-dbg went backwards which would break package feeds from (0:5.10.1+git0+6c6ace9d23-r0.0 to 0:5.10.1+5.11-alpha+git0+17b73b0d2b-r0.0) [version-going-backwards]
qtbase-5.10.1+5.11-alpha+gitAUTOINC+17b73b0d2b: Package version for package qtbase-examples-dev went backwards which would break package feeds from (0:5.10.1+git0+6c6ace9d23-r0.0 to 0:5.10.1+5.11-alpha+git0+17b73b0d2b-r0.0) [version-going-backwards]
qtbase-5.10.1+5.11-alpha+gitAUTOINC+17b73b0d2b: Package version for package qtbase-examples-staticdev went backwards which would break package feeds from (0:5.10.1+git0+6c6ace9d23-r0.0 to 0:5.10.1+5.11-alpha+git0+17b73b0d2b-r0.0) [version-going-backwards]
qtbase-5.10.1+5.11-alpha+gitAUTOINC+17b73b0d2b: Package version for package qtbase-examples went backwards which would break package feeds from (0:5.10.1+git0+6c6ace9d23-r0.0 to 0:5.10.1+5.11-alpha+git0+17b73b0d2b-r0.0) [version-going-backwards]
qtbase-5.10.1+5.11-alpha+gitAUTOINC+17b73b0d2b: Package version for package qtbase-locale went backwards which would break package feeds from (0:5.10.1+git0+6c6ace9d23-r0.0 to 0:5.10.1+5.11-alpha+git0+17b73b0d2b-r0.0) [version-going-backwards]
qtbase-5.10.1+5.11-alpha+gitAUTOINC+17b73b0d2b: Package version for package qtbase-mkspecs went backwards which would break package feeds from (0:5.10.1+git0+6c6ace9d23-r0.0 to 0:5.10.1+5.11-alpha+git0+17b73b0d2b-r0.0) [version-going-backwards]
qtbase-5.10.1+5.11-alpha+gitAUTOINC+17b73b0d2b: Package version for package qtbase-plugins-dbg went backwards which would break package feeds from (0:5.10.1+git0+6c6ace9d23-r0.0 to 0:5.10.1+5.11-alpha+git0+17b73b0d2b-r0.0) [version-going-backwards]
qtbase-5.10.1+5.11-alpha+gitAUTOINC+17b73b0d2b: Package version for package qtbase-plugins went backwards which would break package feeds from (0:5.10.1+git0+6c6ace9d23-r0.0 to 0:5.10.1+5.11-alpha+git0+17b73b0d2b-r0.0) [version-going-backwards]
qtbase-5.10.1+5.11-alpha+gitAUTOINC+17b73b0d2b: Package version for package qtbase-ptest went backwards which would break package feeds from (0:5.10.1+git0+6c6ace9d23-r0.0 to 0:5.10.1+5.11-alpha+git0+17b73b0d2b-r0.0) [version-going-backwards]
qtbase-5.10.1+5.11-alpha+gitAUTOINC+17b73b0d2b: Package version for package qtbase-qmldesigner went backwards which would break package feeds from (0:5.10.1+git0+6c6ace9d23-r0.0 to 0:5.10.1+5.11-alpha+git0+17b73b0d2b-r0.0) [version-going-backwards]
qtbase-5.10.1+5.11-alpha+gitAUTOINC+17b73b0d2b: Package version for package qtbase-qmlplugins-dbg went backwards which would break package feeds from (0:5.10.1+git0+6c6ace9d23-r0.0 to 0:5.10.1+5.11-alpha+git0+17b73b0d2b-r0.0) [version-going-backwards]
qtbase-5.10.1+5.11-alpha+gitAUTOINC+17b73b0d2b: Package version for package qtbase-qmlplugins went backwards which would break package feeds from (0:5.10.1+git0+6c6ace9d23-r0.0 to 0:5.10.1+5.11-alpha+git0+17b73b0d2b-r0.0) [version-going-backwards]
qtbase-5.10.1+5.11-alpha+gitAUTOINC+17b73b0d2b: Package version for package qtbase-staticdev went backwards which would break package feeds from (0:5.10.1+git0+6c6ace9d23-r0.0 to 0:5.10.1+5.11-alpha+git0+17b73b0d2b-r0.0) [version-going-backwards]
qtbase-5.10.1+5.11-alpha+gitAUTOINC+17b73b0d2b: Package version for package qtbase-tools-dbg went backwards which would break package feeds from (0:5.10.1+git0+6c6ace9d23-r0.0 to 0:5.10.1+5.11-alpha+git0+17b73b0d2b-r0.0) [version-going-backwards]
qtbase-5.10.1+5.11-alpha+gitAUTOINC+17b73b0d2b: Package version for package qtbase-tools went backwards which would break package feeds from (0:5.10.1+git0+6c6ace9d23-r0.0 to 0:5.10.1+5.11-alpha+git0+17b73b0d2b-r0.0) [version-going-backwards]
qtbase-5.10.1+5.11-alpha+gitAUTOINC+17b73b0d2b: Package version for package qtbase went backwards which would break package feeds from (0:5.10.1+git0+6c6ace9d23-r0.0 to 0:5.10.1+5.11-alpha+git0+17b73b0d2b-r0.0) [version-going-backwards]
qtcanvas3d-5.10.1+5.11-alpha+gitAUTOINC+80d7f92b96: Package version for package qtcanvas3d-dbg went backwards which would break package feeds from (0:5.10.1+git0+0eecd96a7b-r0.0 to 0:5.10.1+5.11-alpha+git0+80d7f92b96-r0.0) [version-going-backwards]
qtcanvas3d-5.10.1+5.11-alpha+gitAUTOINC+80d7f92b96: Package version for package qtcanvas3d-dev went backwards which would break package feeds from (0:5.10.1+git0+0eecd96a7b-r0.0 to 0:5.10.1+5.11-alpha+git0+80d7f92b96-r0.0) [version-going-backwards]
qtcanvas3d-5.10.1+5.11-alpha+gitAUTOINC+80d7f92b96: Package version for package qtcanvas3d-doc went backwards which would break package feeds from (0:5.10.1+git0+0eecd96a7b-r0.0 to 0:5.10.1+5.11-alpha+git0+80d7f92b96-r0.0) [version-going-backwards]
qtcanvas3d-5.10.1+5.11-alpha+gitAUTOINC+80d7f92b96: Package version for package qtcanvas3d-examples-dbg went backwards which would break package feeds from (0:5.10.1+git0+0eecd96a7b-r0.0 to 0:5.10.1+5.11-alpha+git0+80d7f92b96-r0.0) [version-going-backwards]
qtcanvas3d-5.10.1+5.11-alpha+gitAUTOINC+80d7f92b96: Package version for package qtcanvas3d-examples-dev went backwards which would break package feeds from (0:5.10.1+git0+0eecd96a7b-r0.0 to 0:5.10.1+5.11-alpha+git0+80d7f92b96-r0.0) [version-going-backwards]
qtcanvas3d-5.10.1+5.11-alpha+gitAUTOINC+80d7f92b96: Package version for package qtcanvas3d-examples-staticdev went backwards which would break package feeds from (0:5.10.1+git0+0eecd96a7b-r0.0 to 0:5.10.1+5.11-alpha+git0+80d7f92b96-r0.0) [version-going-backwards]
qtcanvas3d-5.10.1+5.11-alpha+gitAUTOINC+80d7f92b96: Package version for package qtcanvas3d-examples went backwards which would break package feeds from (0:5.10.1+git0+0eecd96a7b-r0.0 to 0:5.10.1+5.11-alpha+git0+80d7f92b96-r0.0) [version-going-backwards]
qtcanvas3d-5.10.1+5.11-alpha+gitAUTOINC+80d7f92b96: Package version for package qtcanvas3d-locale went backwards which would break package feeds from (0:5.10.1+git0+0eecd96a7b-r0.0 to 0:5.10.1+5.11-alpha+git0+80d7f92b96-r0.0) [version-going-backwards]
qtcanvas3d-5.10.1+5.11-alpha+gitAUTOINC+80d7f92b96: Package version for package qtcanvas3d-mkspecs went backwards which would break package feeds from (0:5.10.1+git0+0eecd96a7b-r0.0 to 0:5.10.1+5.11-alpha+git0+80d7f92b96-r0.0) [version-going-backwards]
qtcanvas3d-5.10.1+5.11-alpha+gitAUTOINC+80d7f92b96: Package version for package qtcanvas3d-plugins-dbg went backwards which would break package feeds from (0:5.10.1+git0+0eecd96a7b-r0.0 to 0:5.10.1+5.11-alpha+git0+80d7f92b96-r0.0) [version-going-backwards]
qtcanvas3d-5.10.1+5.11-alpha+gitAUTOINC+80d7f92b96: Package version for package qtcanvas3d-plugins went backwards which would break package feeds from (0:5.10.1+git0+0eecd96a7b-r0.0 to 0:5.10.1+5.11-alpha+git0+80d7f92b96-r0.0) [version-going-backwards]
qtcanvas3d-5.10.1+5.11-alpha+gitAUTOINC+80d7f92b96: Package version for package qtcanvas3d-qmldesigner went backwards which would break package feeds from (0:5.10.1+git0+0eecd96a7b-r0.0 to 0:5.10.1+5.11-alpha+git0+80d7f92b96-r0.0) [version-going-backwards]
qtcanvas3d-5.10.1+5.11-alpha+gitAUTOINC+80d7f92b96: Package version for package qtcanvas3d-qmlplugins-dbg went backwards which would break package feeds from (0:5.10.1+git0+0eecd96a7b-r0.0 to 0:5.10.1+5.11-alpha+git0+80d7f92b96-r0.0) [version-going-backwards]
qtcanvas3d-5.10.1+5.11-alpha+gitAUTOINC+80d7f92b96: Package version for package qtcanvas3d-qmlplugins went backwards which would break package feeds from (0:5.10.1+git0+0eecd96a7b-r0.0 to 0:5.10.1+5.11-alpha+git0+80d7f92b96-r0.0) [version-going-backwards]
qtcanvas3d-5.10.1+5.11-alpha+gitAUTOINC+80d7f92b96: Package version for package qtcanvas3d-staticdev went backwards which would break package feeds from (0:5.10.1+git0+0eecd96a7b-r0.0 to 0:5.10.1+5.11-alpha+git0+80d7f92b96-r0.0) [version-going-backwards]
qtcanvas3d-5.10.1+5.11-alpha+gitAUTOINC+80d7f92b96: Package version for package qtcanvas3d-tools-dbg went backwards which would break package feeds from (0:5.10.1+git0+0eecd96a7b-r0.0 to 0:5.10.1+5.11-alpha+git0+80d7f92b96-r0.0) [version-going-backwards]
qtcanvas3d-5.10.1+5.11-alpha+gitAUTOINC+80d7f92b96: Package version for package qtcanvas3d-tools went backwards which would break package feeds from (0:5.10.1+git0+0eecd96a7b-r0.0 to 0:5.10.1+5.11-alpha+git0+80d7f92b96-r0.0) [version-going-backwards]
qtcanvas3d-5.10.1+5.11-alpha+gitAUTOINC+80d7f92b96: Package version for package qtcanvas3d went backwards which would break package feeds from (0:5.10.1+git0+0eecd96a7b-r0.0 to 0:5.10.1+5.11-alpha+git0+80d7f92b96-r0.0) [version-going-backwards]
qtcharts-5.10.1+5.11-alpha+gitAUTOINC+1f78a69f4f: Package version for package qtcharts-dbg went backwards which would break package feeds from (0:5.10.1+git0+9a4f99f518-r0.0 to 0:5.10.1+5.11-alpha+git0+1f78a69f4f-r0.0) [version-going-backwards]
qtcharts-5.10.1+5.11-alpha+gitAUTOINC+1f78a69f4f: Package version for package qtcharts-dev went backwards which would break package feeds from (0:5.10.1+git0+9a4f99f518-r0.0 to 0:5.10.1+5.11-alpha+git0+1f78a69f4f-r0.0) [version-going-backwards]
qtcharts-5.10.1+5.11-alpha+gitAUTOINC+1f78a69f4f: Package version for package qtcharts-doc went backwards which would break package feeds from (0:5.10.1+git0+9a4f99f518-r0.0 to 0:5.10.1+5.11-alpha+git0+1f78a69f4f-r0.0) [version-going-backwards]
qtcharts-5.10.1+5.11-alpha+gitAUTOINC+1f78a69f4f: Package version for package qtcharts-examples-dbg went backwards which would break package feeds from (0:5.10.1+git0+9a4f99f518-r0.0 to 0:5.10.1+5.11-alpha+git0+1f78a69f4f-r0.0) [version-going-backwards]
qtcharts-5.10.1+5.11-alpha+gitAUTOINC+1f78a69f4f: Package version for package qtcharts-examples-dev went backwards which would break package feeds from (0:5.10.1+git0+9a4f99f518-r0.0 to 0:5.10.1+5.11-alpha+git0+1f78a69f4f-r0.0) [version-going-backwards]
qtcharts-5.10.1+5.11-alpha+gitAUTOINC+1f78a69f4f: Package version for package qtcharts-examples-staticdev went backwards which would break package feeds from (0:5.10.1+git0+9a4f99f518-r0.0 to 0:5.10.1+5.11-alpha+git0+1f78a69f4f-r0.0) [version-going-backwards]
qtcharts-5.10.1+5.11-alpha+gitAUTOINC+1f78a69f4f: Package version for package qtcharts-examples went backwards which would break package feeds from (0:5.10.1+git0+9a4f99f518-r0.0 to 0:5.10.1+5.11-alpha+git0+1f78a69f4f-r0.0) [version-going-backwards]
qtcharts-5.10.1+5.11-alpha+gitAUTOINC+1f78a69f4f: Package version for package qtcharts-locale went backwards which would break package feeds from (0:5.10.1+git0+9a4f99f518-r0.0 to 0:5.10.1+5.11-alpha+git0+1f78a69f4f-r0.0) [version-going-backwards]
qtcharts-5.10.1+5.11-alpha+gitAUTOINC+1f78a69f4f: Package version for package qtcharts-mkspecs went backwards which would break package feeds from (0:5.10.1+git0+9a4f99f518-r0.0 to 0:5.10.1+5.11-alpha+git0+1f78a69f4f-r0.0) [version-going-backwards]
qtcharts-5.10.1+5.11-alpha+gitAUTOINC+1f78a69f4f: Package version for package qtcharts-plugins-dbg went backwards which would break package feeds from (0:5.10.1+git0+9a4f99f518-r0.0 to 0:5.10.1+5.11-alpha+git0+1f78a69f4f-r0.0) [version-going-backwards]
qtcharts-5.10.1+5.11-alpha+gitAUTOINC+1f78a69f4f: Package version for package qtcharts-plugins went backwards which would break package feeds from (0:5.10.1+git0+9a4f99f518-r0.0 to 0:5.10.1+5.11-alpha+git0+1f78a69f4f-r0.0) [version-going-backwards]
qtcharts-5.10.1+5.11-alpha+gitAUTOINC+1f78a69f4f: Package version for package qtcharts-qmldesigner went backwards which would break package feeds from (0:5.10.1+git0+9a4f99f518-r0.0 to 0:5.10.1+5.11-alpha+git0+1f78a69f4f-r0.0) [version-going-backwards]
qtcharts-5.10.1+5.11-alpha+gitAUTOINC+1f78a69f4f: Package version for package qtcharts-qmlplugins-dbg went backwards which would break package feeds from (0:5.10.1+git0+9a4f99f518-r0.0 to 0:5.10.1+5.11-alpha+git0+1f78a69f4f-r0.0) [version-going-backwards]
qtcharts-5.10.1+5.11-alpha+gitAUTOINC+1f78a69f4f: Package version for package qtcharts-qmlplugins went backwards which would break package feeds from (0:5.10.1+git0+9a4f99f518-r0.0 to 0:5.10.1+5.11-alpha+git0+1f78a69f4f-r0.0) [version-going-backwards]
qtcharts-5.10.1+5.11-alpha+gitAUTOINC+1f78a69f4f: Package version for package qtcharts-staticdev went backwards which would break package feeds from (0:5.10.1+git0+9a4f99f518-r0.0 to 0:5.10.1+5.11-alpha+git0+1f78a69f4f-r0.0) [version-going-backwards]
qtcharts-5.10.1+5.11-alpha+gitAUTOINC+1f78a69f4f: Package version for package qtcharts-tools-dbg went backwards which would break package feeds from (0:5.10.1+git0+9a4f99f518-r0.0 to 0:5.10.1+5.11-alpha+git0+1f78a69f4f-r0.0) [version-going-backwards]
qtcharts-5.10.1+5.11-alpha+gitAUTOINC+1f78a69f4f: Package version for package qtcharts-tools went backwards which would break package feeds from (0:5.10.1+git0+9a4f99f518-r0.0 to 0:5.10.1+5.11-alpha+git0+1f78a69f4f-r0.0) [version-going-backwards]
qtcharts-5.10.1+5.11-alpha+gitAUTOINC+1f78a69f4f: Package version for package qtcharts went backwards which would break package feeds from (0:5.10.1+git0+9a4f99f518-r0.0 to 0:5.10.1+5.11-alpha+git0+1f78a69f4f-r0.0) [version-going-backwards]
qtconnectivity-5.10.1+5.11-alpha+gitAUTOINC+d70fe2ac47: Package version for package qtconnectivity-dbg went backwards which would break package feeds from (0:5.10.1+git0+2331b915d2-r0.0 to 0:5.10.1+5.11-alpha+git0+d70fe2ac47-r0.0) [version-going-backwards]
qtconnectivity-5.10.1+5.11-alpha+gitAUTOINC+d70fe2ac47: Package version for package qtconnectivity-dev went backwards which would break package feeds from (0:5.10.1+git0+2331b915d2-r0.0 to 0:5.10.1+5.11-alpha+git0+d70fe2ac47-r0.0) [version-going-backwards]
qtconnectivity-5.10.1+5.11-alpha+gitAUTOINC+d70fe2ac47: Package version for package qtconnectivity-doc went backwards which would break package feeds from (0:5.10.1+git0+2331b915d2-r0.0 to 0:5.10.1+5.11-alpha+git0+d70fe2ac47-r0.0) [version-going-backwards]
qtconnectivity-5.10.1+5.11-alpha+gitAUTOINC+d70fe2ac47: Package version for package qtconnectivity-examples-dbg went backwards which would break package feeds from (0:5.10.1+git0+2331b915d2-r0.0 to 0:5.10.1+5.11-alpha+git0+d70fe2ac47-r0.0) [version-going-backwards]
qtconnectivity-5.10.1+5.11-alpha+gitAUTOINC+d70fe2ac47: Package version for package qtconnectivity-examples-dev went backwards which would break package feeds from (0:5.10.1+git0+2331b915d2-r0.0 to 0:5.10.1+5.11-alpha+git0+d70fe2ac47-r0.0) [version-going-backwards]
qtconnectivity-5.10.1+5.11-alpha+gitAUTOINC+d70fe2ac47: Package version for package qtconnectivity-examples-staticdev went backwards which would break package feeds from (0:5.10.1+git0+2331b915d2-r0.0 to 0:5.10.1+5.11-alpha+git0+d70fe2ac47-r0.0) [version-going-backwards]
qtconnectivity-5.10.1+5.11-alpha+gitAUTOINC+d70fe2ac47: Package version for package qtconnectivity-examples went backwards which would break package feeds from (0:5.10.1+git0+2331b915d2-r0.0 to 0:5.10.1+5.11-alpha+git0+d70fe2ac47-r0.0) [version-going-backwards]
qtconnectivity-5.10.1+5.11-alpha+gitAUTOINC+d70fe2ac47: Package version for package qtconnectivity-locale went backwards which would break package feeds from (0:5.10.1+git0+2331b915d2-r0.0 to 0:5.10.1+5.11-alpha+git0+d70fe2ac47-r0.0) [version-going-backwards]
qtconnectivity-5.10.1+5.11-alpha+gitAUTOINC+d70fe2ac47: Package version for package qtconnectivity-mkspecs went backwards which would break package feeds from (0:5.10.1+git0+2331b915d2-r0.0 to 0:5.10.1+5.11-alpha+git0+d70fe2ac47-r0.0) [version-going-backwards]
qtconnectivity-5.10.1+5.11-alpha+gitAUTOINC+d70fe2ac47: Package version for package qtconnectivity-plugins-dbg went backwards which would break package feeds from (0:5.10.1+git0+2331b915d2-r0.0 to 0:5.10.1+5.11-alpha+git0+d70fe2ac47-r0.0) [version-going-backwards]
qtconnectivity-5.10.1+5.11-alpha+gitAUTOINC+d70fe2ac47: Package version for package qtconnectivity-plugins went backwards which would break package feeds from (0:5.10.1+git0+2331b915d2-r0.0 to 0:5.10.1+5.11-alpha+git0+d70fe2ac47-r0.0) [version-going-backwards]
qtconnectivity-5.10.1+5.11-alpha+gitAUTOINC+d70fe2ac47: Package version for package qtconnectivity-qmldesigner went backwards which would break package feeds from (0:5.10.1+git0+2331b915d2-r0.0 to 0:5.10.1+5.11-alpha+git0+d70fe2ac47-r0.0) [version-going-backwards]
qtconnectivity-5.10.1+5.11-alpha+gitAUTOINC+d70fe2ac47: Package version for package qtconnectivity-qmlplugins-dbg went backwards which would break package feeds from (0:5.10.1+git0+2331b915d2-r0.0 to 0:5.10.1+5.11-alpha+git0+d70fe2ac47-r0.0) [version-going-backwards]
qtconnectivity-5.10.1+5.11-alpha+gitAUTOINC+d70fe2ac47: Package version for package qtconnectivity-qmlplugins went backwards which would break package feeds from (0:5.10.1+git0+2331b915d2-r0.0 to 0:5.10.1+5.11-alpha+git0+d70fe2ac47-r0.0) [version-going-backwards]
qtconnectivity-5.10.1+5.11-alpha+gitAUTOINC+d70fe2ac47: Package version for package qtconnectivity-staticdev went backwards which would break package feeds from (0:5.10.1+git0+2331b915d2-r0.0 to 0:5.10.1+5.11-alpha+git0+d70fe2ac47-r0.0) [version-going-backwards]
qtconnectivity-5.10.1+5.11-alpha+gitAUTOINC+d70fe2ac47: Package version for package qtconnectivity-tools-dbg went backwards which would break package feeds from (0:5.10.1+git0+2331b915d2-r0.0 to 0:5.10.1+5.11-alpha+git0+d70fe2ac47-r0.0) [version-going-backwards]
qtconnectivity-5.10.1+5.11-alpha+gitAUTOINC+d70fe2ac47: Package version for package qtconnectivity-tools went backwards which would break package feeds from (0:5.10.1+git0+2331b915d2-r0.0 to 0:5.10.1+5.11-alpha+git0+d70fe2ac47-r0.0) [version-going-backwards]
qtconnectivity-5.10.1+5.11-alpha+gitAUTOINC+d70fe2ac47: Package version for package qtconnectivity went backwards which would break package feeds from (0:5.10.1+git0+2331b915d2-r0.0 to 0:5.10.1+5.11-alpha+git0+d70fe2ac47-r0.0) [version-going-backwards]
qtdatavis3d-5.10.1+5.11-alpha+gitAUTOINC+be7e45ca25: Package version for package qtdatavis3d-dbg went backwards which would break package feeds from (0:5.10.1+git0+397e501474-r0.0 to 0:5.10.1+5.11-alpha+git0+be7e45ca25-r0.0) [version-going-backwards]
qtdatavis3d-5.10.1+5.11-alpha+gitAUTOINC+be7e45ca25: Package version for package qtdatavis3d-dev went backwards which would break package feeds from (0:5.10.1+git0+397e501474-r0.0 to 0:5.10.1+5.11-alpha+git0+be7e45ca25-r0.0) [version-going-backwards]
qtdatavis3d-5.10.1+5.11-alpha+gitAUTOINC+be7e45ca25: Package version for package qtdatavis3d-doc went backwards which would break package feeds from (0:5.10.1+git0+397e501474-r0.0 to 0:5.10.1+5.11-alpha+git0+be7e45ca25-r0.0) [version-going-backwards]
qtdatavis3d-5.10.1+5.11-alpha+gitAUTOINC+be7e45ca25: Package version for package qtdatavis3d-examples-dbg went backwards which would break package feeds from (0:5.10.1+git0+397e501474-r0.0 to 0:5.10.1+5.11-alpha+git0+be7e45ca25-r0.0) [version-going-backwards]
qtdatavis3d-5.10.1+5.11-alpha+gitAUTOINC+be7e45ca25: Package version for package qtdatavis3d-examples-dev went backwards which would break package feeds from (0:5.10.1+git0+397e501474-r0.0 to 0:5.10.1+5.11-alpha+git0+be7e45ca25-r0.0) [version-going-backwards]
qtdatavis3d-5.10.1+5.11-alpha+gitAUTOINC+be7e45ca25: Package version for package qtdatavis3d-examples-staticdev went backwards which would break package feeds from (0:5.10.1+git0+397e501474-r0.0 to 0:5.10.1+5.11-alpha+git0+be7e45ca25-r0.0) [version-going-backwards]
qtdatavis3d-5.10.1+5.11-alpha+gitAUTOINC+be7e45ca25: Package version for package qtdatavis3d-examples went backwards which would break package feeds from (0:5.10.1+git0+397e501474-r0.0 to 0:5.10.1+5.11-alpha+git0+be7e45ca25-r0.0) [version-going-backwards]
qtdatavis3d-5.10.1+5.11-alpha+gitAUTOINC+be7e45ca25: Package version for package qtdatavis3d-locale went backwards which would break package feeds from (0:5.10.1+git0+397e501474-r0.0 to 0:5.10.1+5.11-alpha+git0+be7e45ca25-r0.0) [version-going-backwards]
qtdatavis3d-5.10.1+5.11-alpha+gitAUTOINC+be7e45ca25: Package version for package qtdatavis3d-mkspecs went backwards which would break package feeds from (0:5.10.1+git0+397e501474-r0.0 to 0:5.10.1+5.11-alpha+git0+be7e45ca25-r0.0) [version-going-backwards]
qtdatavis3d-5.10.1+5.11-alpha+gitAUTOINC+be7e45ca25: Package version for package qtdatavis3d-plugins-dbg went backwards which would break package feeds from (0:5.10.1+git0+397e501474-r0.0 to 0:5.10.1+5.11-alpha+git0+be7e45ca25-r0.0) [version-going-backwards]
qtdatavis3d-5.10.1+5.11-alpha+gitAUTOINC+be7e45ca25: Package version for package qtdatavis3d-plugins went backwards which would break package feeds from (0:5.10.1+git0+397e501474-r0.0 to 0:5.10.1+5.11-alpha+git0+be7e45ca25-r0.0) [version-going-backwards]
qtdatavis3d-5.10.1+5.11-alpha+gitAUTOINC+be7e45ca25: Package version for package qtdatavis3d-qmldesigner went backwards which would break package feeds from (0:5.10.1+git0+397e501474-r0.0 to 0:5.10.1+5.11-alpha+git0+be7e45ca25-r0.0) [version-going-backwards]
qtdatavis3d-5.10.1+5.11-alpha+gitAUTOINC+be7e45ca25: Package version for package qtdatavis3d-qmlplugins-dbg went backwards which would break package feeds from (0:5.10.1+git0+397e501474-r0.0 to 0:5.10.1+5.11-alpha+git0+be7e45ca25-r0.0) [version-going-backwards]
qtdatavis3d-5.10.1+5.11-alpha+gitAUTOINC+be7e45ca25: Package version for package qtdatavis3d-qmlplugins went backwards which would break package feeds from (0:5.10.1+git0+397e501474-r0.0 to 0:5.10.1+5.11-alpha+git0+be7e45ca25-r0.0) [version-going-backwards]
qtdatavis3d-5.10.1+5.11-alpha+gitAUTOINC+be7e45ca25: Package version for package qtdatavis3d-staticdev went backwards which would break package feeds from (0:5.10.1+git0+397e501474-r0.0 to 0:5.10.1+5.11-alpha+git0+be7e45ca25-r0.0) [version-going-backwards]
qtdatavis3d-5.10.1+5.11-alpha+gitAUTOINC+be7e45ca25: Package version for package qtdatavis3d-tools-dbg went backwards which would break package feeds from (0:5.10.1+git0+397e501474-r0.0 to 0:5.10.1+5.11-alpha+git0+be7e45ca25-r0.0) [version-going-backwards]
qtdatavis3d-5.10.1+5.11-alpha+gitAUTOINC+be7e45ca25: Package version for package qtdatavis3d-tools went backwards which would break package feeds from (0:5.10.1+git0+397e501474-r0.0 to 0:5.10.1+5.11-alpha+git0+be7e45ca25-r0.0) [version-going-backwards]
qtdatavis3d-5.10.1+5.11-alpha+gitAUTOINC+be7e45ca25: Package version for package qtdatavis3d went backwards which would break package feeds from (0:5.10.1+git0+397e501474-r0.0 to 0:5.10.1+5.11-alpha+git0+be7e45ca25-r0.0) [version-going-backwards]
qtdeclarative-5.10.1+5.11-alpha+gitAUTOINC+0975a9c892: Package version for package qtdeclarative-dbg went backwards which would break package feeds from (0:5.10.1+git0+3e91062877-r0.0 to 0:5.10.1+5.11-alpha+git0+0975a9c892-r0.0) [version-going-backwards]
qtdeclarative-5.10.1+5.11-alpha+gitAUTOINC+0975a9c892: Package version for package qtdeclarative-dev went backwards which would break package feeds from (0:5.10.1+git0+3e91062877-r0.0 to 0:5.10.1+5.11-alpha+git0+0975a9c892-r0.0) [version-going-backwards]
qtdeclarative-5.10.1+5.11-alpha+gitAUTOINC+0975a9c892: Package version for package qtdeclarative-doc went backwards which would break package feeds from (0:5.10.1+git0+3e91062877-r0.0 to 0:5.10.1+5.11-alpha+git0+0975a9c892-r0.0) [version-going-backwards]
qtdeclarative-5.10.1+5.11-alpha+gitAUTOINC+0975a9c892: Package version for package qtdeclarative-examples-dbg went backwards which would break package feeds from (0:5.10.1+git0+3e91062877-r0.0 to 0:5.10.1+5.11-alpha+git0+0975a9c892-r0.0) [version-going-backwards]
qtdeclarative-5.10.1+5.11-alpha+gitAUTOINC+0975a9c892: Package version for package qtdeclarative-examples-dev went backwards which would break package feeds from (0:5.10.1+git0+3e91062877-r0.0 to 0:5.10.1+5.11-alpha+git0+0975a9c892-r0.0) [version-going-backwards]
qtdeclarative-5.10.1+5.11-alpha+gitAUTOINC+0975a9c892: Package version for package qtdeclarative-examples-staticdev went backwards which would break package feeds from (0:5.10.1+git0+3e91062877-r0.0 to 0:5.10.1+5.11-alpha+git0+0975a9c892-r0.0) [version-going-backwards]
qtdeclarative-5.10.1+5.11-alpha+gitAUTOINC+0975a9c892: Package version for package qtdeclarative-examples went backwards which would break package feeds from (0:5.10.1+git0+3e91062877-r0.0 to 0:5.10.1+5.11-alpha+git0+0975a9c892-r0.0) [version-going-backwards]
qtdeclarative-5.10.1+5.11-alpha+gitAUTOINC+0975a9c892: Package version for package qtdeclarative-locale went backwards which would break package feeds from (0:5.10.1+git0+3e91062877-r0.0 to 0:5.10.1+5.11-alpha+git0+0975a9c892-r0.0) [version-going-backwards]
qtdeclarative-5.10.1+5.11-alpha+gitAUTOINC+0975a9c892: Package version for package qtdeclarative-mkspecs went backwards which would break package feeds from (0:5.10.1+git0+3e91062877-r0.0 to 0:5.10.1+5.11-alpha+git0+0975a9c892-r0.0) [version-going-backwards]
qtdeclarative-5.10.1+5.11-alpha+gitAUTOINC+0975a9c892: Package version for package qtdeclarative-plugins-dbg went backwards which would break package feeds from (0:5.10.1+git0+3e91062877-r0.0 to 0:5.10.1+5.11-alpha+git0+0975a9c892-r0.0) [version-going-backwards]
qtdeclarative-5.10.1+5.11-alpha+gitAUTOINC+0975a9c892: Package version for package qtdeclarative-plugins went backwards which would break package feeds from (0:5.10.1+git0+3e91062877-r0.0 to 0:5.10.1+5.11-alpha+git0+0975a9c892-r0.0) [version-going-backwards]
qtdeclarative-5.10.1+5.11-alpha+gitAUTOINC+0975a9c892: Package version for package qtdeclarative-ptest went backwards which would break package feeds from (0:5.10.1+git0+3e91062877-r0.0 to 0:5.10.1+5.11-alpha+git0+0975a9c892-r0.0) [version-going-backwards]
qtdeclarative-5.10.1+5.11-alpha+gitAUTOINC+0975a9c892: Package version for package qtdeclarative-qmldesigner went backwards which would break package feeds from (0:5.10.1+git0+3e91062877-r0.0 to 0:5.10.1+5.11-alpha+git0+0975a9c892-r0.0) [version-going-backwards]
qtdeclarative-5.10.1+5.11-alpha+gitAUTOINC+0975a9c892: Package version for package qtdeclarative-qmlplugins-dbg went backwards which would break package feeds from (0:5.10.1+git0+3e91062877-r0.0 to 0:5.10.1+5.11-alpha+git0+0975a9c892-r0.0) [version-going-backwards]
qtdeclarative-5.10.1+5.11-alpha+gitAUTOINC+0975a9c892: Package version for package qtdeclarative-qmlplugins went backwards which would break package feeds from (0:5.10.1+git0+3e91062877-r0.0 to 0:5.10.1+5.11-alpha+git0+0975a9c892-r0.0) [version-going-backwards]
qtdeclarative-5.10.1+5.11-alpha+gitAUTOINC+0975a9c892: Package version for package qtdeclarative-staticdev went backwards which would break package feeds from (0:5.10.1+git0+3e91062877-r0.0 to 0:5.10.1+5.11-alpha+git0+0975a9c892-r0.0) [version-going-backwards]
qtdeclarative-5.10.1+5.11-alpha+gitAUTOINC+0975a9c892: Package version for package qtdeclarative-tools-dbg went backwards which would break package feeds from (0:5.10.1+git0+3e91062877-r0.0 to 0:5.10.1+5.11-alpha+git0+0975a9c892-r0.0) [version-going-backwards]
qtdeclarative-5.10.1+5.11-alpha+gitAUTOINC+0975a9c892: Package version for package qtdeclarative-tools went backwards which would break package feeds from (0:5.10.1+git0+3e91062877-r0.0 to 0:5.10.1+5.11-alpha+git0+0975a9c892-r0.0) [version-going-backwards]
qtdeclarative-5.10.1+5.11-alpha+gitAUTOINC+0975a9c892: Package version for package qtdeclarative went backwards which would break package feeds from (0:5.10.1+git0+3e91062877-r0.0 to 0:5.10.1+5.11-alpha+git0+0975a9c892-r0.0) [version-going-backwards]
qtenginio-5.10.1+5.11-alpha+gitAUTOINC+23603a3b08: Package version for package qtenginio-dbg went backwards which would break package feeds from (0:5.10.1+git0+23603a3b08-r0.0 to 0:5.10.1+5.11-alpha+git0+23603a3b08-r0.0) [version-going-backwards]
qtenginio-5.10.1+5.11-alpha+gitAUTOINC+23603a3b08: Package version for package qtenginio-dev went backwards which would break package feeds from (0:5.10.1+git0+23603a3b08-r0.0 to 0:5.10.1+5.11-alpha+git0+23603a3b08-r0.0) [version-going-backwards]
qtenginio-5.10.1+5.11-alpha+gitAUTOINC+23603a3b08: Package version for package qtenginio-doc went backwards which would break package feeds from (0:5.10.1+git0+23603a3b08-r0.0 to 0:5.10.1+5.11-alpha+git0+23603a3b08-r0.0) [version-going-backwards]
qtenginio-5.10.1+5.11-alpha+gitAUTOINC+23603a3b08: Package version for package qtenginio-examples-dbg went backwards which would break package feeds from (0:5.10.1+git0+23603a3b08-r0.0 to 0:5.10.1+5.11-alpha+git0+23603a3b08-r0.0) [version-going-backwards]
qtenginio-5.10.1+5.11-alpha+gitAUTOINC+23603a3b08: Package version for package qtenginio-examples-dev went backwards which would break package feeds from (0:5.10.1+git0+23603a3b08-r0.0 to 0:5.10.1+5.11-alpha+git0+23603a3b08-r0.0) [version-going-backwards]
qtenginio-5.10.1+5.11-alpha+gitAUTOINC+23603a3b08: Package version for package qtenginio-examples-staticdev went backwards which would break package feeds from (0:5.10.1+git0+23603a3b08-r0.0 to 0:5.10.1+5.11-alpha+git0+23603a3b08-r0.0) [version-going-backwards]
qtenginio-5.10.1+5.11-alpha+gitAUTOINC+23603a3b08: Package version for package qtenginio-examples went backwards which would break package feeds from (0:5.10.1+git0+23603a3b08-r0.0 to 0:5.10.1+5.11-alpha+git0+23603a3b08-r0.0) [version-going-backwards]
qtenginio-5.10.1+5.11-alpha+gitAUTOINC+23603a3b08: Package version for package qtenginio-locale went backwards which would break package feeds from (0:5.10.1+git0+23603a3b08-r0.0 to 0:5.10.1+5.11-alpha+git0+23603a3b08-r0.0) [version-going-backwards]
qtenginio-5.10.1+5.11-alpha+gitAUTOINC+23603a3b08: Package version for package qtenginio-mkspecs went backwards which would break package feeds from (0:5.10.1+git0+23603a3b08-r0.0 to 0:5.10.1+5.11-alpha+git0+23603a3b08-r0.0) [version-going-backwards]
qtenginio-5.10.1+5.11-alpha+gitAUTOINC+23603a3b08: Package version for package qtenginio-plugins-dbg went backwards which would break package feeds from (0:5.10.1+git0+23603a3b08-r0.0 to 0:5.10.1+5.11-alpha+git0+23603a3b08-r0.0) [version-going-backwards]
qtenginio-5.10.1+5.11-alpha+gitAUTOINC+23603a3b08: Package version for package qtenginio-plugins went backwards which would break package feeds from (0:5.10.1+git0+23603a3b08-r0.0 to 0:5.10.1+5.11-alpha+git0+23603a3b08-r0.0) [version-going-backwards]
qtenginio-5.10.1+5.11-alpha+gitAUTOINC+23603a3b08: Package version for package qtenginio-qmldesigner went backwards which would break package feeds from (0:5.10.1+git0+23603a3b08-r0.0 to 0:5.10.1+5.11-alpha+git0+23603a3b08-r0.0) [version-going-backwards]
qtenginio-5.10.1+5.11-alpha+gitAUTOINC+23603a3b08: Package version for package qtenginio-qmlplugins-dbg went backwards which would break package feeds from (0:5.10.1+git0+23603a3b08-r0.0 to 0:5.10.1+5.11-alpha+git0+23603a3b08-r0.0) [version-going-backwards]
qtenginio-5.10.1+5.11-alpha+gitAUTOINC+23603a3b08: Package version for package qtenginio-qmlplugins went backwards which would break package feeds from (0:5.10.1+git0+23603a3b08-r0.0 to 0:5.10.1+5.11-alpha+git0+23603a3b08-r0.0) [version-going-backwards]
qtenginio-5.10.1+5.11-alpha+gitAUTOINC+23603a3b08: Package version for package qtenginio-staticdev went backwards which would break package feeds from (0:5.10.1+git0+23603a3b08-r0.0 to 0:5.10.1+5.11-alpha+git0+23603a3b08-r0.0) [version-going-backwards]
qtenginio-5.10.1+5.11-alpha+gitAUTOINC+23603a3b08: Package version for package qtenginio-tools-dbg went backwards which would break package feeds from (0:5.10.1+git0+23603a3b08-r0.0 to 0:5.10.1+5.11-alpha+git0+23603a3b08-r0.0) [version-going-backwards]
qtenginio-5.10.1+5.11-alpha+gitAUTOINC+23603a3b08: Package version for package qtenginio-tools went backwards which would break package feeds from (0:5.10.1+git0+23603a3b08-r0.0 to 0:5.10.1+5.11-alpha+git0+23603a3b08-r0.0) [version-going-backwards]
qtenginio-5.10.1+5.11-alpha+gitAUTOINC+23603a3b08: Package version for package qtenginio went backwards which would break package feeds from (0:5.10.1+git0+23603a3b08-r0.0 to 0:5.10.1+5.11-alpha+git0+23603a3b08-r0.0) [version-going-backwards]
qtgamepad-5.10.1+5.11-alpha+gitAUTOINC+313f221381: Package version for package qtgamepad-dbg went backwards which would break package feeds from (0:5.10.1+git0+e6f366618d-r0.0 to 0:5.10.1+5.11-alpha+git0+313f221381-r0.0) [version-going-backwards]
qtgamepad-5.10.1+5.11-alpha+gitAUTOINC+313f221381: Package version for package qtgamepad-dev went backwards which would break package feeds from (0:5.10.1+git0+e6f366618d-r0.0 to 0:5.10.1+5.11-alpha+git0+313f221381-r0.0) [version-going-backwards]
qtgamepad-5.10.1+5.11-alpha+gitAUTOINC+313f221381: Package version for package qtgamepad-doc went backwards which would break package feeds from (0:5.10.1+git0+e6f366618d-r0.0 to 0:5.10.1+5.11-alpha+git0+313f221381-r0.0) [version-going-backwards]
qtgamepad-5.10.1+5.11-alpha+gitAUTOINC+313f221381: Package version for package qtgamepad-examples-dbg went backwards which would break package feeds from (0:5.10.1+git0+e6f366618d-r0.0 to 0:5.10.1+5.11-alpha+git0+313f221381-r0.0) [version-going-backwards]
qtgamepad-5.10.1+5.11-alpha+gitAUTOINC+313f221381: Package version for package qtgamepad-examples-dev went backwards which would break package feeds from (0:5.10.1+git0+e6f366618d-r0.0 to 0:5.10.1+5.11-alpha+git0+313f221381-r0.0) [version-going-backwards]
qtgamepad-5.10.1+5.11-alpha+gitAUTOINC+313f221381: Package version for package qtgamepad-examples-staticdev went backwards which would break package feeds from (0:5.10.1+git0+e6f366618d-r0.0 to 0:5.10.1+5.11-alpha+git0+313f221381-r0.0) [version-going-backwards]
qtgamepad-5.10.1+5.11-alpha+gitAUTOINC+313f221381: Package version for package qtgamepad-examples went backwards which would break package feeds from (0:5.10.1+git0+e6f366618d-r0.0 to 0:5.10.1+5.11-alpha+git0+313f221381-r0.0) [version-going-backwards]
qtgamepad-5.10.1+5.11-alpha+gitAUTOINC+313f221381: Package version for package qtgamepad-locale went backwards which would break package feeds from (0:5.10.1+git0+e6f366618d-r0.0 to 0:5.10.1+5.11-alpha+git0+313f221381-r0.0) [version-going-backwards]
qtgamepad-5.10.1+5.11-alpha+gitAUTOINC+313f221381: Package version for package qtgamepad-mkspecs went backwards which would break package feeds from (0:5.10.1+git0+e6f366618d-r0.0 to 0:5.10.1+5.11-alpha+git0+313f221381-r0.0) [version-going-backwards]
qtgamepad-5.10.1+5.11-alpha+gitAUTOINC+313f221381: Package version for package qtgamepad-plugins-dbg went backwards which would break package feeds from (0:5.10.1+git0+e6f366618d-r0.0 to 0:5.10.1+5.11-alpha+git0+313f221381-r0.0) [version-going-backwards]
qtgamepad-5.10.1+5.11-alpha+gitAUTOINC+313f221381: Package version for package qtgamepad-plugins went backwards which would break package feeds from (0:5.10.1+git0+e6f366618d-r0.0 to 0:5.10.1+5.11-alpha+git0+313f221381-r0.0) [version-going-backwards]
qtgamepad-5.10.1+5.11-alpha+gitAUTOINC+313f221381: Package version for package qtgamepad-qmldesigner went backwards which would break package feeds from (0:5.10.1+git0+e6f366618d-r0.0 to 0:5.10.1+5.11-alpha+git0+313f221381-r0.0) [version-going-backwards]
qtgamepad-5.10.1+5.11-alpha+gitAUTOINC+313f221381: Package version for package qtgamepad-qmlplugins-dbg went backwards which would break package feeds from (0:5.10.1+git0+e6f366618d-r0.0 to 0:5.10.1+5.11-alpha+git0+313f221381-r0.0) [version-going-backwards]
qtgamepad-5.10.1+5.11-alpha+gitAUTOINC+313f221381: Package version for package qtgamepad-qmlplugins went backwards which would break package feeds from (0:5.10.1+git0+e6f366618d-r0.0 to 0:5.10.1+5.11-alpha+git0+313f221381-r0.0) [version-going-backwards]
qtgamepad-5.10.1+5.11-alpha+gitAUTOINC+313f221381: Package version for package qtgamepad-staticdev went backwards which would break package feeds from (0:5.10.1+git0+e6f366618d-r0.0 to 0:5.10.1+5.11-alpha+git0+313f221381-r0.0) [version-going-backwards]
qtgamepad-5.10.1+5.11-alpha+gitAUTOINC+313f221381: Package version for package qtgamepad-tools-dbg went backwards which would break package feeds from (0:5.10.1+git0+e6f366618d-r0.0 to 0:5.10.1+5.11-alpha+git0+313f221381-r0.0) [version-going-backwards]
qtgamepad-5.10.1+5.11-alpha+gitAUTOINC+313f221381: Package version for package qtgamepad-tools went backwards which would break package feeds from (0:5.10.1+git0+e6f366618d-r0.0 to 0:5.10.1+5.11-alpha+git0+313f221381-r0.0) [version-going-backwards]
qtgamepad-5.10.1+5.11-alpha+gitAUTOINC+313f221381: Package version for package qtgamepad went backwards which would break package feeds from (0:5.10.1+git0+e6f366618d-r0.0 to 0:5.10.1+5.11-alpha+git0+313f221381-r0.0) [version-going-backwards]
qtgraphicaleffects-5.10.1+5.11-alpha+gitAUTOINC+3e28d47cea: Package version for package qtgraphicaleffects-dbg went backwards which would break package feeds from (0:5.10.1+git0+a38c4da7b5-r0.0 to 0:5.10.1+5.11-alpha+git0+3e28d47cea-r0.0) [version-going-backwards]
qtgraphicaleffects-5.10.1+5.11-alpha+gitAUTOINC+3e28d47cea: Package version for package qtgraphicaleffects-dev went backwards which would break package feeds from (0:5.10.1+git0+a38c4da7b5-r0.0 to 0:5.10.1+5.11-alpha+git0+3e28d47cea-r0.0) [version-going-backwards]
qtgraphicaleffects-5.10.1+5.11-alpha+gitAUTOINC+3e28d47cea: Package version for package qtgraphicaleffects-doc went backwards which would break package feeds from (0:5.10.1+git0+a38c4da7b5-r0.0 to 0:5.10.1+5.11-alpha+git0+3e28d47cea-r0.0) [version-going-backwards]
qtgraphicaleffects-5.10.1+5.11-alpha+gitAUTOINC+3e28d47cea: Package version for package qtgraphicaleffects-examples-dbg went backwards which would break package feeds from (0:5.10.1+git0+a38c4da7b5-r0.0 to 0:5.10.1+5.11-alpha+git0+3e28d47cea-r0.0) [version-going-backwards]
qtgraphicaleffects-5.10.1+5.11-alpha+gitAUTOINC+3e28d47cea: Package version for package qtgraphicaleffects-examples-dev went backwards which would break package feeds from (0:5.10.1+git0+a38c4da7b5-r0.0 to 0:5.10.1+5.11-alpha+git0+3e28d47cea-r0.0) [version-going-backwards]
qtgraphicaleffects-5.10.1+5.11-alpha+gitAUTOINC+3e28d47cea: Package version for package qtgraphicaleffects-examples-staticdev went backwards which would break package feeds from (0:5.10.1+git0+a38c4da7b5-r0.0 to 0:5.10.1+5.11-alpha+git0+3e28d47cea-r0.0) [version-going-backwards]
qtgraphicaleffects-5.10.1+5.11-alpha+gitAUTOINC+3e28d47cea: Package version for package qtgraphicaleffects-examples went backwards which would break package feeds from (0:5.10.1+git0+a38c4da7b5-r0.0 to 0:5.10.1+5.11-alpha+git0+3e28d47cea-r0.0) [version-going-backwards]
qtgraphicaleffects-5.10.1+5.11-alpha+gitAUTOINC+3e28d47cea: Package version for package qtgraphicaleffects-locale went backwards which would break package feeds from (0:5.10.1+git0+a38c4da7b5-r0.0 to 0:5.10.1+5.11-alpha+git0+3e28d47cea-r0.0) [version-going-backwards]
qtgraphicaleffects-5.10.1+5.11-alpha+gitAUTOINC+3e28d47cea: Package version for package qtgraphicaleffects-mkspecs went backwards which would break package feeds from (0:5.10.1+git0+a38c4da7b5-r0.0 to 0:5.10.1+5.11-alpha+git0+3e28d47cea-r0.0) [version-going-backwards]
qtgraphicaleffects-5.10.1+5.11-alpha+gitAUTOINC+3e28d47cea: Package version for package qtgraphicaleffects-plugins-dbg went backwards which would break package feeds from (0:5.10.1+git0+a38c4da7b5-r0.0 to 0:5.10.1+5.11-alpha+git0+3e28d47cea-r0.0) [version-going-backwards]
qtgraphicaleffects-5.10.1+5.11-alpha+gitAUTOINC+3e28d47cea: Package version for package qtgraphicaleffects-plugins went backwards which would break package feeds from (0:5.10.1+git0+a38c4da7b5-r0.0 to 0:5.10.1+5.11-alpha+git0+3e28d47cea-r0.0) [version-going-backwards]
qtgraphicaleffects-5.10.1+5.11-alpha+gitAUTOINC+3e28d47cea: Package version for package qtgraphicaleffects-qmldesigner went backwards which would break package feeds from (0:5.10.1+git0+a38c4da7b5-r0.0 to 0:5.10.1+5.11-alpha+git0+3e28d47cea-r0.0) [version-going-backwards]
qtgraphicaleffects-5.10.1+5.11-alpha+gitAUTOINC+3e28d47cea: Package version for package qtgraphicaleffects-qmlplugins-dbg went backwards which would break package feeds from (0:5.10.1+git0+a38c4da7b5-r0.0 to 0:5.10.1+5.11-alpha+git0+3e28d47cea-r0.0) [version-going-backwards]
qtgraphicaleffects-5.10.1+5.11-alpha+gitAUTOINC+3e28d47cea: Package version for package qtgraphicaleffects-qmlplugins went backwards which would break package feeds from (0:5.10.1+git0+a38c4da7b5-r0.0 to 0:5.10.1+5.11-alpha+git0+3e28d47cea-r0.0) [version-going-backwards]
qtgraphicaleffects-5.10.1+5.11-alpha+gitAUTOINC+3e28d47cea: Package version for package qtgraphicaleffects-staticdev went backwards which would break package feeds from (0:5.10.1+git0+a38c4da7b5-r0.0 to 0:5.10.1+5.11-alpha+git0+3e28d47cea-r0.0) [version-going-backwards]
qtgraphicaleffects-5.10.1+5.11-alpha+gitAUTOINC+3e28d47cea: Package version for package qtgraphicaleffects-tools-dbg went backwards which would break package feeds from (0:5.10.1+git0+a38c4da7b5-r0.0 to 0:5.10.1+5.11-alpha+git0+3e28d47cea-r0.0) [version-going-backwards]
qtgraphicaleffects-5.10.1+5.11-alpha+gitAUTOINC+3e28d47cea: Package version for package qtgraphicaleffects-tools went backwards which would break package feeds from (0:5.10.1+git0+a38c4da7b5-r0.0 to 0:5.10.1+5.11-alpha+git0+3e28d47cea-r0.0) [version-going-backwards]
qtgraphicaleffects-5.10.1+5.11-alpha+gitAUTOINC+3e28d47cea: Package version for package qtgraphicaleffects went backwards which would break package feeds from (0:5.10.1+git0+a38c4da7b5-r0.0 to 0:5.10.1+5.11-alpha+git0+3e28d47cea-r0.0) [version-going-backwards]
qtimageformats-5.10.1+5.11-alpha+gitAUTOINC+f878323a82: Package version for package qtimageformats-dbg went backwards which would break package feeds from (0:5.10.1+git0+892d4a0df7-r0.0 to 0:5.10.1+5.11-alpha+git0+f878323a82-r0.0) [version-going-backwards]
qtimageformats-5.10.1+5.11-alpha+gitAUTOINC+f878323a82: Package version for package qtimageformats-dev went backwards which would break package feeds from (0:5.10.1+git0+892d4a0df7-r0.0 to 0:5.10.1+5.11-alpha+git0+f878323a82-r0.0) [version-going-backwards]
qtimageformats-5.10.1+5.11-alpha+gitAUTOINC+f878323a82: Package version for package qtimageformats-doc went backwards which would break package feeds from (0:5.10.1+git0+892d4a0df7-r0.0 to 0:5.10.1+5.11-alpha+git0+f878323a82-r0.0) [version-going-backwards]
qtimageformats-5.10.1+5.11-alpha+gitAUTOINC+f878323a82: Package version for package qtimageformats-examples-dbg went backwards which would break package feeds from (0:5.10.1+git0+892d4a0df7-r0.0 to 0:5.10.1+5.11-alpha+git0+f878323a82-r0.0) [version-going-backwards]
qtimageformats-5.10.1+5.11-alpha+gitAUTOINC+f878323a82: Package version for package qtimageformats-examples-dev went backwards which would break package feeds from (0:5.10.1+git0+892d4a0df7-r0.0 to 0:5.10.1+5.11-alpha+git0+f878323a82-r0.0) [version-going-backwards]
qtimageformats-5.10.1+5.11-alpha+gitAUTOINC+f878323a82: Package version for package qtimageformats-examples-staticdev went backwards which would break package feeds from (0:5.10.1+git0+892d4a0df7-r0.0 to 0:5.10.1+5.11-alpha+git0+f878323a82-r0.0) [version-going-backwards]
qtimageformats-5.10.1+5.11-alpha+gitAUTOINC+f878323a82: Package version for package qtimageformats-examples went backwards which would break package feeds from (0:5.10.1+git0+892d4a0df7-r0.0 to 0:5.10.1+5.11-alpha+git0+f878323a82-r0.0) [version-going-backwards]
qtimageformats-5.10.1+5.11-alpha+gitAUTOINC+f878323a82: Package version for package qtimageformats-locale went backwards which would break package feeds from (0:5.10.1+git0+892d4a0df7-r0.0 to 0:5.10.1+5.11-alpha+git0+f878323a82-r0.0) [version-going-backwards]
qtimageformats-5.10.1+5.11-alpha+gitAUTOINC+f878323a82: Package version for package qtimageformats-mkspecs went backwards which would break package feeds from (0:5.10.1+git0+892d4a0df7-r0.0 to 0:5.10.1+5.11-alpha+git0+f878323a82-r0.0) [version-going-backwards]
qtimageformats-5.10.1+5.11-alpha+gitAUTOINC+f878323a82: Package version for package qtimageformats-plugins-dbg went backwards which would break package feeds from (0:5.10.1+git0+892d4a0df7-r0.0 to 0:5.10.1+5.11-alpha+git0+f878323a82-r0.0) [version-going-backwards]
qtimageformats-5.10.1+5.11-alpha+gitAUTOINC+f878323a82: Package version for package qtimageformats-plugins went backwards which would break package feeds from (0:5.10.1+git0+892d4a0df7-r0.0 to 0:5.10.1+5.11-alpha+git0+f878323a82-r0.0) [version-going-backwards]
qtimageformats-5.10.1+5.11-alpha+gitAUTOINC+f878323a82: Package version for package qtimageformats-qmldesigner went backwards which would break package feeds from (0:5.10.1+git0+892d4a0df7-r0.0 to 0:5.10.1+5.11-alpha+git0+f878323a82-r0.0) [version-going-backwards]
qtimageformats-5.10.1+5.11-alpha+gitAUTOINC+f878323a82: Package version for package qtimageformats-qmlplugins-dbg went backwards which would break package feeds from (0:5.10.1+git0+892d4a0df7-r0.0 to 0:5.10.1+5.11-alpha+git0+f878323a82-r0.0) [version-going-backwards]
qtimageformats-5.10.1+5.11-alpha+gitAUTOINC+f878323a82: Package version for package qtimageformats-qmlplugins went backwards which would break package feeds from (0:5.10.1+git0+892d4a0df7-r0.0 to 0:5.10.1+5.11-alpha+git0+f878323a82-r0.0) [version-going-backwards]
qtimageformats-5.10.1+5.11-alpha+gitAUTOINC+f878323a82: Package version for package qtimageformats-staticdev went backwards which would break package feeds from (0:5.10.1+git0+892d4a0df7-r0.0 to 0:5.10.1+5.11-alpha+git0+f878323a82-r0.0) [version-going-backwards]
qtimageformats-5.10.1+5.11-alpha+gitAUTOINC+f878323a82: Package version for package qtimageformats-tools-dbg went backwards which would break package feeds from (0:5.10.1+git0+892d4a0df7-r0.0 to 0:5.10.1+5.11-alpha+git0+f878323a82-r0.0) [version-going-backwards]
qtimageformats-5.10.1+5.11-alpha+gitAUTOINC+f878323a82: Package version for package qtimageformats-tools went backwards which would break package feeds from (0:5.10.1+git0+892d4a0df7-r0.0 to 0:5.10.1+5.11-alpha+git0+f878323a82-r0.0) [version-going-backwards]
qtimageformats-5.10.1+5.11-alpha+gitAUTOINC+f878323a82: Package version for package qtimageformats went backwards which would break package feeds from (0:5.10.1+git0+892d4a0df7-r0.0 to 0:5.10.1+5.11-alpha+git0+f878323a82-r0.0) [version-going-backwards]
qtknx-5.10.1+5.11-alpha+gitAUTOINC+4d5a04a079: Package version for package qtknx-dbg went backwards which would break package feeds from (0:5.10.1+git0+29c34e8f07-r0.0 to 0:5.10.1+5.11-alpha+git0+4d5a04a079-r0.0) [version-going-backwards]
qtknx-5.10.1+5.11-alpha+gitAUTOINC+4d5a04a079: Package version for package qtknx-dev went backwards which would break package feeds from (0:5.10.1+git0+29c34e8f07-r0.0 to 0:5.10.1+5.11-alpha+git0+4d5a04a079-r0.0) [version-going-backwards]
qtknx-5.10.1+5.11-alpha+gitAUTOINC+4d5a04a079: Package version for package qtknx-doc went backwards which would break package feeds from (0:5.10.1+git0+29c34e8f07-r0.0 to 0:5.10.1+5.11-alpha+git0+4d5a04a079-r0.0) [version-going-backwards]
qtknx-5.10.1+5.11-alpha+gitAUTOINC+4d5a04a079: Package version for package qtknx-examples-dbg went backwards which would break package feeds from (0:5.10.1+git0+29c34e8f07-r0.0 to 0:5.10.1+5.11-alpha+git0+4d5a04a079-r0.0) [version-going-backwards]
qtknx-5.10.1+5.11-alpha+gitAUTOINC+4d5a04a079: Package version for package qtknx-examples-dev went backwards which would break package feeds from (0:5.10.1+git0+29c34e8f07-r0.0 to 0:5.10.1+5.11-alpha+git0+4d5a04a079-r0.0) [version-going-backwards]
qtknx-5.10.1+5.11-alpha+gitAUTOINC+4d5a04a079: Package version for package qtknx-examples-staticdev went backwards which would break package feeds from (0:5.10.1+git0+29c34e8f07-r0.0 to 0:5.10.1+5.11-alpha+git0+4d5a04a079-r0.0) [version-going-backwards]
qtknx-5.10.1+5.11-alpha+gitAUTOINC+4d5a04a079: Package version for package qtknx-examples went backwards which would break package feeds from (0:5.10.1+git0+29c34e8f07-r0.0 to 0:5.10.1+5.11-alpha+git0+4d5a04a079-r0.0) [version-going-backwards]
qtknx-5.10.1+5.11-alpha+gitAUTOINC+4d5a04a079: Package version for package qtknx-locale went backwards which would break package feeds from (0:5.10.1+git0+29c34e8f07-r0.0 to 0:5.10.1+5.11-alpha+git0+4d5a04a079-r0.0) [version-going-backwards]
qtknx-5.10.1+5.11-alpha+gitAUTOINC+4d5a04a079: Package version for package qtknx-mkspecs went backwards which would break package feeds from (0:5.10.1+git0+29c34e8f07-r0.0 to 0:5.10.1+5.11-alpha+git0+4d5a04a079-r0.0) [version-going-backwards]
qtknx-5.10.1+5.11-alpha+gitAUTOINC+4d5a04a079: Package version for package qtknx-plugins-dbg went backwards which would break package feeds from (0:5.10.1+git0+29c34e8f07-r0.0 to 0:5.10.1+5.11-alpha+git0+4d5a04a079-r0.0) [version-going-backwards]
qtknx-5.10.1+5.11-alpha+gitAUTOINC+4d5a04a079: Package version for package qtknx-plugins went backwards which would break package feeds from (0:5.10.1+git0+29c34e8f07-r0.0 to 0:5.10.1+5.11-alpha+git0+4d5a04a079-r0.0) [version-going-backwards]
qtknx-5.10.1+5.11-alpha+gitAUTOINC+4d5a04a079: Package version for package qtknx-qmldesigner went backwards which would break package feeds from (0:5.10.1+git0+29c34e8f07-r0.0 to 0:5.10.1+5.11-alpha+git0+4d5a04a079-r0.0) [version-going-backwards]
qtknx-5.10.1+5.11-alpha+gitAUTOINC+4d5a04a079: Package version for package qtknx-qmlplugins-dbg went backwards which would break package feeds from (0:5.10.1+git0+29c34e8f07-r0.0 to 0:5.10.1+5.11-alpha+git0+4d5a04a079-r0.0) [version-going-backwards]
qtknx-5.10.1+5.11-alpha+gitAUTOINC+4d5a04a079: Package version for package qtknx-qmlplugins went backwards which would break package feeds from (0:5.10.1+git0+29c34e8f07-r0.0 to 0:5.10.1+5.11-alpha+git0+4d5a04a079-r0.0) [version-going-backwards]
qtknx-5.10.1+5.11-alpha+gitAUTOINC+4d5a04a079: Package version for package qtknx-staticdev went backwards which would break package feeds from (0:5.10.1+git0+29c34e8f07-r0.0 to 0:5.10.1+5.11-alpha+git0+4d5a04a079-r0.0) [version-going-backwards]
qtknx-5.10.1+5.11-alpha+gitAUTOINC+4d5a04a079: Package version for package qtknx-tools-dbg went backwards which would break package feeds from (0:5.10.1+git0+29c34e8f07-r0.0 to 0:5.10.1+5.11-alpha+git0+4d5a04a079-r0.0) [version-going-backwards]
qtknx-5.10.1+5.11-alpha+gitAUTOINC+4d5a04a079: Package version for package qtknx-tools went backwards which would break package feeds from (0:5.10.1+git0+29c34e8f07-r0.0 to 0:5.10.1+5.11-alpha+git0+4d5a04a079-r0.0) [version-going-backwards]
qtknx-5.10.1+5.11-alpha+gitAUTOINC+4d5a04a079: Package version for package qtknx went backwards which would break package feeds from (0:5.10.1+git0+29c34e8f07-r0.0 to 0:5.10.1+5.11-alpha+git0+4d5a04a079-r0.0) [version-going-backwards]
qtlocation-5.10.1+5.11-alpha+gitAUTOINC+d458bd4710_8c1be4ec01: Package version for package qtlocation-dbg went backwards which would break package feeds from (0:5.10.1+git0+ec00ff89be_8c1be4ec01-r0.0 to 0:5.10.1+5.11-alpha+git0+d458bd4710_8c1be4ec01-r0.0) [version-going-backwards]
qtlocation-5.10.1+5.11-alpha+gitAUTOINC+d458bd4710_8c1be4ec01: Package version for package qtlocation-dev went backwards which would break package feeds from (0:5.10.1+git0+ec00ff89be_8c1be4ec01-r0.0 to 0:5.10.1+5.11-alpha+git0+d458bd4710_8c1be4ec01-r0.0) [version-going-backwards]
qtlocation-5.10.1+5.11-alpha+gitAUTOINC+d458bd4710_8c1be4ec01: Package version for package qtlocation-doc went backwards which would break package feeds from (0:5.10.1+git0+ec00ff89be_8c1be4ec01-r0.0 to 0:5.10.1+5.11-alpha+git0+d458bd4710_8c1be4ec01-r0.0) [version-going-backwards]
qtlocation-5.10.1+5.11-alpha+gitAUTOINC+d458bd4710_8c1be4ec01: Package version for package qtlocation-examples-dbg went backwards which would break package feeds from (0:5.10.1+git0+ec00ff89be_8c1be4ec01-r0.0 to 0:5.10.1+5.11-alpha+git0+d458bd4710_8c1be4ec01-r0.0) [version-going-backwards]
qtlocation-5.10.1+5.11-alpha+gitAUTOINC+d458bd4710_8c1be4ec01: Package version for package qtlocation-examples-dev went backwards which would break package feeds from (0:5.10.1+git0+ec00ff89be_8c1be4ec01-r0.0 to 0:5.10.1+5.11-alpha+git0+d458bd4710_8c1be4ec01-r0.0) [version-going-backwards]
qtlocation-5.10.1+5.11-alpha+gitAUTOINC+d458bd4710_8c1be4ec01: Package version for package qtlocation-examples-staticdev went backwards which would break package feeds from (0:5.10.1+git0+ec00ff89be_8c1be4ec01-r0.0 to 0:5.10.1+5.11-alpha+git0+d458bd4710_8c1be4ec01-r0.0) [version-going-backwards]
qtlocation-5.10.1+5.11-alpha+gitAUTOINC+d458bd4710_8c1be4ec01: Package version for package qtlocation-examples went backwards which would break package feeds from (0:5.10.1+git0+ec00ff89be_8c1be4ec01-r0.0 to 0:5.10.1+5.11-alpha+git0+d458bd4710_8c1be4ec01-r0.0) [version-going-backwards]
qtlocation-5.10.1+5.11-alpha+gitAUTOINC+d458bd4710_8c1be4ec01: Package version for package qtlocation-locale went backwards which would break package feeds from (0:5.10.1+git0+ec00ff89be_8c1be4ec01-r0.0 to 0:5.10.1+5.11-alpha+git0+d458bd4710_8c1be4ec01-r0.0) [version-going-backwards]
qtlocation-5.10.1+5.11-alpha+gitAUTOINC+d458bd4710_8c1be4ec01: Package version for package qtlocation-mkspecs went backwards which would break package feeds from (0:5.10.1+git0+ec00ff89be_8c1be4ec01-r0.0 to 0:5.10.1+5.11-alpha+git0+d458bd4710_8c1be4ec01-r0.0) [version-going-backwards]
qtlocation-5.10.1+5.11-alpha+gitAUTOINC+d458bd4710_8c1be4ec01: Package version for package qtlocation-plugins-dbg went backwards which would break package feeds from (0:5.10.1+git0+ec00ff89be_8c1be4ec01-r0.0 to 0:5.10.1+5.11-alpha+git0+d458bd4710_8c1be4ec01-r0.0) [version-going-backwards]
qtlocation-5.10.1+5.11-alpha+gitAUTOINC+d458bd4710_8c1be4ec01: Package version for package qtlocation-plugins went backwards which would break package feeds from (0:5.10.1+git0+ec00ff89be_8c1be4ec01-r0.0 to 0:5.10.1+5.11-alpha+git0+d458bd4710_8c1be4ec01-r0.0) [version-going-backwards]
qtlocation-5.10.1+5.11-alpha+gitAUTOINC+d458bd4710_8c1be4ec01: Package version for package qtlocation-qmldesigner went backwards which would break package feeds from (0:5.10.1+git0+ec00ff89be_8c1be4ec01-r0.0 to 0:5.10.1+5.11-alpha+git0+d458bd4710_8c1be4ec01-r0.0) [version-going-backwards]
qtlocation-5.10.1+5.11-alpha+gitAUTOINC+d458bd4710_8c1be4ec01: Package version for package qtlocation-qmlplugins-dbg went backwards which would break package feeds from (0:5.10.1+git0+ec00ff89be_8c1be4ec01-r0.0 to 0:5.10.1+5.11-alpha+git0+d458bd4710_8c1be4ec01-r0.0) [version-going-backwards]
qtlocation-5.10.1+5.11-alpha+gitAUTOINC+d458bd4710_8c1be4ec01: Package version for package qtlocation-qmlplugins went backwards which would break package feeds from (0:5.10.1+git0+ec00ff89be_8c1be4ec01-r0.0 to 0:5.10.1+5.11-alpha+git0+d458bd4710_8c1be4ec01-r0.0) [version-going-backwards]
qtlocation-5.10.1+5.11-alpha+gitAUTOINC+d458bd4710_8c1be4ec01: Package version for package qtlocation-staticdev went backwards which would break package feeds from (0:5.10.1+git0+ec00ff89be_8c1be4ec01-r0.0 to 0:5.10.1+5.11-alpha+git0+d458bd4710_8c1be4ec01-r0.0) [version-going-backwards]
qtlocation-5.10.1+5.11-alpha+gitAUTOINC+d458bd4710_8c1be4ec01: Package version for package qtlocation-tools-dbg went backwards which would break package feeds from (0:5.10.1+git0+ec00ff89be_8c1be4ec01-r0.0 to 0:5.10.1+5.11-alpha+git0+d458bd4710_8c1be4ec01-r0.0) [version-going-backwards]
qtlocation-5.10.1+5.11-alpha+gitAUTOINC+d458bd4710_8c1be4ec01: Package version for package qtlocation-tools went backwards which would break package feeds from (0:5.10.1+git0+ec00ff89be_8c1be4ec01-r0.0 to 0:5.10.1+5.11-alpha+git0+d458bd4710_8c1be4ec01-r0.0) [version-going-backwards]
qtlocation-5.10.1+5.11-alpha+gitAUTOINC+d458bd4710_8c1be4ec01: Package version for package qtlocation went backwards which would break package feeds from (0:5.10.1+git0+ec00ff89be_8c1be4ec01-r0.0 to 0:5.10.1+5.11-alpha+git0+d458bd4710_8c1be4ec01-r0.0) [version-going-backwards]
qtmqtt-5.10.1+5.11-alpha+gitAUTOINC+b61e7bd318: Package version for package qtmqtt-dbg went backwards which would break package feeds from (0:5.10.1+git0+2c3c2a41c5-r0.0 to 0:5.10.1+5.11-alpha+git0+b61e7bd318-r0.0) [version-going-backwards]
qtmqtt-5.10.1+5.11-alpha+gitAUTOINC+b61e7bd318: Package version for package qtmqtt-dev went backwards which would break package feeds from (0:5.10.1+git0+2c3c2a41c5-r0.0 to 0:5.10.1+5.11-alpha+git0+b61e7bd318-r0.0) [version-going-backwards]
qtmqtt-5.10.1+5.11-alpha+gitAUTOINC+b61e7bd318: Package version for package qtmqtt-doc went backwards which would break package feeds from (0:5.10.1+git0+2c3c2a41c5-r0.0 to 0:5.10.1+5.11-alpha+git0+b61e7bd318-r0.0) [version-going-backwards]
qtmqtt-5.10.1+5.11-alpha+gitAUTOINC+b61e7bd318: Package version for package qtmqtt-examples-dbg went backwards which would break package feeds from (0:5.10.1+git0+2c3c2a41c5-r0.0 to 0:5.10.1+5.11-alpha+git0+b61e7bd318-r0.0) [version-going-backwards]
qtmqtt-5.10.1+5.11-alpha+gitAUTOINC+b61e7bd318: Package version for package qtmqtt-examples-dev went backwards which would break package feeds from (0:5.10.1+git0+2c3c2a41c5-r0.0 to 0:5.10.1+5.11-alpha+git0+b61e7bd318-r0.0) [version-going-backwards]
qtmqtt-5.10.1+5.11-alpha+gitAUTOINC+b61e7bd318: Package version for package qtmqtt-examples-staticdev went backwards which would break package feeds from (0:5.10.1+git0+2c3c2a41c5-r0.0 to 0:5.10.1+5.11-alpha+git0+b61e7bd318-r0.0) [version-going-backwards]
qtmqtt-5.10.1+5.11-alpha+gitAUTOINC+b61e7bd318: Package version for package qtmqtt-examples went backwards which would break package feeds from (0:5.10.1+git0+2c3c2a41c5-r0.0 to 0:5.10.1+5.11-alpha+git0+b61e7bd318-r0.0) [version-going-backwards]
qtmqtt-5.10.1+5.11-alpha+gitAUTOINC+b61e7bd318: Package version for package qtmqtt-locale went backwards which would break package feeds from (0:5.10.1+git0+2c3c2a41c5-r0.0 to 0:5.10.1+5.11-alpha+git0+b61e7bd318-r0.0) [version-going-backwards]
qtmqtt-5.10.1+5.11-alpha+gitAUTOINC+b61e7bd318: Package version for package qtmqtt-mkspecs went backwards which would break package feeds from (0:5.10.1+git0+2c3c2a41c5-r0.0 to 0:5.10.1+5.11-alpha+git0+b61e7bd318-r0.0) [version-going-backwards]
qtmqtt-5.10.1+5.11-alpha+gitAUTOINC+b61e7bd318: Package version for package qtmqtt-plugins-dbg went backwards which would break package feeds from (0:5.10.1+git0+2c3c2a41c5-r0.0 to 0:5.10.1+5.11-alpha+git0+b61e7bd318-r0.0) [version-going-backwards]
qtmqtt-5.10.1+5.11-alpha+gitAUTOINC+b61e7bd318: Package version for package qtmqtt-plugins went backwards which would break package feeds from (0:5.10.1+git0+2c3c2a41c5-r0.0 to 0:5.10.1+5.11-alpha+git0+b61e7bd318-r0.0) [version-going-backwards]
qtmqtt-5.10.1+5.11-alpha+gitAUTOINC+b61e7bd318: Package version for package qtmqtt-qmldesigner went backwards which would break package feeds from (0:5.10.1+git0+2c3c2a41c5-r0.0 to 0:5.10.1+5.11-alpha+git0+b61e7bd318-r0.0) [version-going-backwards]
qtmqtt-5.10.1+5.11-alpha+gitAUTOINC+b61e7bd318: Package version for package qtmqtt-qmlplugins-dbg went backwards which would break package feeds from (0:5.10.1+git0+2c3c2a41c5-r0.0 to 0:5.10.1+5.11-alpha+git0+b61e7bd318-r0.0) [version-going-backwards]
qtmqtt-5.10.1+5.11-alpha+gitAUTOINC+b61e7bd318: Package version for package qtmqtt-qmlplugins went backwards which would break package feeds from (0:5.10.1+git0+2c3c2a41c5-r0.0 to 0:5.10.1+5.11-alpha+git0+b61e7bd318-r0.0) [version-going-backwards]
qtmqtt-5.10.1+5.11-alpha+gitAUTOINC+b61e7bd318: Package version for package qtmqtt-staticdev went backwards which would break package feeds from (0:5.10.1+git0+2c3c2a41c5-r0.0 to 0:5.10.1+5.11-alpha+git0+b61e7bd318-r0.0) [version-going-backwards]
qtmqtt-5.10.1+5.11-alpha+gitAUTOINC+b61e7bd318: Package version for package qtmqtt-tools-dbg went backwards which would break package feeds from (0:5.10.1+git0+2c3c2a41c5-r0.0 to 0:5.10.1+5.11-alpha+git0+b61e7bd318-r0.0) [version-going-backwards]
qtmqtt-5.10.1+5.11-alpha+gitAUTOINC+b61e7bd318: Package version for package qtmqtt-tools went backwards which would break package feeds from (0:5.10.1+git0+2c3c2a41c5-r0.0 to 0:5.10.1+5.11-alpha+git0+b61e7bd318-r0.0) [version-going-backwards]
qtmqtt-5.10.1+5.11-alpha+gitAUTOINC+b61e7bd318: Package version for package qtmqtt went backwards which would break package feeds from (0:5.10.1+git0+2c3c2a41c5-r0.0 to 0:5.10.1+5.11-alpha+git0+b61e7bd318-r0.0) [version-going-backwards]
qtmultimedia-5.10.1+5.11-alpha+gitAUTOINC+0354fdda8b: Package version for package qtmultimedia-dbg went backwards which would break package feeds from (0:5.10.1+git0+038716bb1f-r0.0 to 0:5.10.1+5.11-alpha+git0+0354fdda8b-r0.0) [version-going-backwards]
qtmultimedia-5.10.1+5.11-alpha+gitAUTOINC+0354fdda8b: Package version for package qtmultimedia-dev went backwards which would break package feeds from (0:5.10.1+git0+038716bb1f-r0.0 to 0:5.10.1+5.11-alpha+git0+0354fdda8b-r0.0) [version-going-backwards]
qtmultimedia-5.10.1+5.11-alpha+gitAUTOINC+0354fdda8b: Package version for package qtmultimedia-doc went backwards which would break package feeds from (0:5.10.1+git0+038716bb1f-r0.0 to 0:5.10.1+5.11-alpha+git0+0354fdda8b-r0.0) [version-going-backwards]
qtmultimedia-5.10.1+5.11-alpha+gitAUTOINC+0354fdda8b: Package version for package qtmultimedia-examples-dbg went backwards which would break package feeds from (0:5.10.1+git0+038716bb1f-r0.0 to 0:5.10.1+5.11-alpha+git0+0354fdda8b-r0.0) [version-going-backwards]
qtmultimedia-5.10.1+5.11-alpha+gitAUTOINC+0354fdda8b: Package version for package qtmultimedia-examples-dev went backwards which would break package feeds from (0:5.10.1+git0+038716bb1f-r0.0 to 0:5.10.1+5.11-alpha+git0+0354fdda8b-r0.0) [version-going-backwards]
qtmultimedia-5.10.1+5.11-alpha+gitAUTOINC+0354fdda8b: Package version for package qtmultimedia-examples-staticdev went backwards which would break package feeds from (0:5.10.1+git0+038716bb1f-r0.0 to 0:5.10.1+5.11-alpha+git0+0354fdda8b-r0.0) [version-going-backwards]
qtmultimedia-5.10.1+5.11-alpha+gitAUTOINC+0354fdda8b: Package version for package qtmultimedia-examples went backwards which would break package feeds from (0:5.10.1+git0+038716bb1f-r0.0 to 0:5.10.1+5.11-alpha+git0+0354fdda8b-r0.0) [version-going-backwards]
qtmultimedia-5.10.1+5.11-alpha+gitAUTOINC+0354fdda8b: Package version for package qtmultimedia-locale went backwards which would break package feeds from (0:5.10.1+git0+038716bb1f-r0.0 to 0:5.10.1+5.11-alpha+git0+0354fdda8b-r0.0) [version-going-backwards]
qtmultimedia-5.10.1+5.11-alpha+gitAUTOINC+0354fdda8b: Package version for package qtmultimedia-mkspecs went backwards which would break package feeds from (0:5.10.1+git0+038716bb1f-r0.0 to 0:5.10.1+5.11-alpha+git0+0354fdda8b-r0.0) [version-going-backwards]
qtmultimedia-5.10.1+5.11-alpha+gitAUTOINC+0354fdda8b: Package version for package qtmultimedia-plugins-dbg went backwards which would break package feeds from (0:5.10.1+git0+038716bb1f-r0.0 to 0:5.10.1+5.11-alpha+git0+0354fdda8b-r0.0) [version-going-backwards]
qtmultimedia-5.10.1+5.11-alpha+gitAUTOINC+0354fdda8b: Package version for package qtmultimedia-plugins went backwards which would break package feeds from (0:5.10.1+git0+038716bb1f-r0.0 to 0:5.10.1+5.11-alpha+git0+0354fdda8b-r0.0) [version-going-backwards]
qtmultimedia-5.10.1+5.11-alpha+gitAUTOINC+0354fdda8b: Package version for package qtmultimedia-qmldesigner went backwards which would break package feeds from (0:5.10.1+git0+038716bb1f-r0.0 to 0:5.10.1+5.11-alpha+git0+0354fdda8b-r0.0) [version-going-backwards]
qtmultimedia-5.10.1+5.11-alpha+gitAUTOINC+0354fdda8b: Package version for package qtmultimedia-qmlplugins-dbg went backwards which would break package feeds from (0:5.10.1+git0+038716bb1f-r0.0 to 0:5.10.1+5.11-alpha+git0+0354fdda8b-r0.0) [version-going-backwards]
qtmultimedia-5.10.1+5.11-alpha+gitAUTOINC+0354fdda8b: Package version for package qtmultimedia-qmlplugins went backwards which would break package feeds from (0:5.10.1+git0+038716bb1f-r0.0 to 0:5.10.1+5.11-alpha+git0+0354fdda8b-r0.0) [version-going-backwards]
qtmultimedia-5.10.1+5.11-alpha+gitAUTOINC+0354fdda8b: Package version for package qtmultimedia-staticdev went backwards which would break package feeds from (0:5.10.1+git0+038716bb1f-r0.0 to 0:5.10.1+5.11-alpha+git0+0354fdda8b-r0.0) [version-going-backwards]
qtmultimedia-5.10.1+5.11-alpha+gitAUTOINC+0354fdda8b: Package version for package qtmultimedia-tools-dbg went backwards which would break package feeds from (0:5.10.1+git0+038716bb1f-r0.0 to 0:5.10.1+5.11-alpha+git0+0354fdda8b-r0.0) [version-going-backwards]
qtmultimedia-5.10.1+5.11-alpha+gitAUTOINC+0354fdda8b: Package version for package qtmultimedia-tools went backwards which would break package feeds from (0:5.10.1+git0+038716bb1f-r0.0 to 0:5.10.1+5.11-alpha+git0+0354fdda8b-r0.0) [version-going-backwards]
qtmultimedia-5.10.1+5.11-alpha+gitAUTOINC+0354fdda8b: Package version for package qtmultimedia went backwards which would break package feeds from (0:5.10.1+git0+038716bb1f-r0.0 to 0:5.10.1+5.11-alpha+git0+0354fdda8b-r0.0) [version-going-backwards]
qtnetworkauth-5.10.1+5.11-alpha+gitAUTOINC+e8552ddaf1: Package version for package qtnetworkauth-dbg went backwards which would break package feeds from (0:5.10.1+git0+8f4f2e0cae-r0.0 to 0:5.10.1+5.11-alpha+git0+e8552ddaf1-r0.0) [version-going-backwards]
qtnetworkauth-5.10.1+5.11-alpha+gitAUTOINC+e8552ddaf1: Package version for package qtnetworkauth-dev went backwards which would break package feeds from (0:5.10.1+git0+8f4f2e0cae-r0.0 to 0:5.10.1+5.11-alpha+git0+e8552ddaf1-r0.0) [version-going-backwards]
qtnetworkauth-5.10.1+5.11-alpha+gitAUTOINC+e8552ddaf1: Package version for package qtnetworkauth-doc went backwards which would break package feeds from (0:5.10.1+git0+8f4f2e0cae-r0.0 to 0:5.10.1+5.11-alpha+git0+e8552ddaf1-r0.0) [version-going-backwards]
qtnetworkauth-5.10.1+5.11-alpha+gitAUTOINC+e8552ddaf1: Package version for package qtnetworkauth-examples-dbg went backwards which would break package feeds from (0:5.10.1+git0+8f4f2e0cae-r0.0 to 0:5.10.1+5.11-alpha+git0+e8552ddaf1-r0.0) [version-going-backwards]
qtnetworkauth-5.10.1+5.11-alpha+gitAUTOINC+e8552ddaf1: Package version for package qtnetworkauth-examples-dev went backwards which would break package feeds from (0:5.10.1+git0+8f4f2e0cae-r0.0 to 0:5.10.1+5.11-alpha+git0+e8552ddaf1-r0.0) [version-going-backwards]
qtnetworkauth-5.10.1+5.11-alpha+gitAUTOINC+e8552ddaf1: Package version for package qtnetworkauth-examples-staticdev went backwards which would break package feeds from (0:5.10.1+git0+8f4f2e0cae-r0.0 to 0:5.10.1+5.11-alpha+git0+e8552ddaf1-r0.0) [version-going-backwards]
qtnetworkauth-5.10.1+5.11-alpha+gitAUTOINC+e8552ddaf1: Package version for package qtnetworkauth-examples went backwards which would break package feeds from (0:5.10.1+git0+8f4f2e0cae-r0.0 to 0:5.10.1+5.11-alpha+git0+e8552ddaf1-r0.0) [version-going-backwards]
qtnetworkauth-5.10.1+5.11-alpha+gitAUTOINC+e8552ddaf1: Package version for package qtnetworkauth-locale went backwards which would break package feeds from (0:5.10.1+git0+8f4f2e0cae-r0.0 to 0:5.10.1+5.11-alpha+git0+e8552ddaf1-r0.0) [version-going-backwards]
qtnetworkauth-5.10.1+5.11-alpha+gitAUTOINC+e8552ddaf1: Package version for package qtnetworkauth-mkspecs went backwards which would break package feeds from (0:5.10.1+git0+8f4f2e0cae-r0.0 to 0:5.10.1+5.11-alpha+git0+e8552ddaf1-r0.0) [version-going-backwards]
qtnetworkauth-5.10.1+5.11-alpha+gitAUTOINC+e8552ddaf1: Package version for package qtnetworkauth-plugins-dbg went backwards which would break package feeds from (0:5.10.1+git0+8f4f2e0cae-r0.0 to 0:5.10.1+5.11-alpha+git0+e8552ddaf1-r0.0) [version-going-backwards]
qtnetworkauth-5.10.1+5.11-alpha+gitAUTOINC+e8552ddaf1: Package version for package qtnetworkauth-plugins went backwards which would break package feeds from (0:5.10.1+git0+8f4f2e0cae-r0.0 to 0:5.10.1+5.11-alpha+git0+e8552ddaf1-r0.0) [version-going-backwards]
qtnetworkauth-5.10.1+5.11-alpha+gitAUTOINC+e8552ddaf1: Package version for package qtnetworkauth-qmldesigner went backwards which would break package feeds from (0:5.10.1+git0+8f4f2e0cae-r0.0 to 0:5.10.1+5.11-alpha+git0+e8552ddaf1-r0.0) [version-going-backwards]
qtnetworkauth-5.10.1+5.11-alpha+gitAUTOINC+e8552ddaf1: Package version for package qtnetworkauth-qmlplugins-dbg went backwards which would break package feeds from (0:5.10.1+git0+8f4f2e0cae-r0.0 to 0:5.10.1+5.11-alpha+git0+e8552ddaf1-r0.0) [version-going-backwards]
qtnetworkauth-5.10.1+5.11-alpha+gitAUTOINC+e8552ddaf1: Package version for package qtnetworkauth-qmlplugins went backwards which would break package feeds from (0:5.10.1+git0+8f4f2e0cae-r0.0 to 0:5.10.1+5.11-alpha+git0+e8552ddaf1-r0.0) [version-going-backwards]
qtnetworkauth-5.10.1+5.11-alpha+gitAUTOINC+e8552ddaf1: Package version for package qtnetworkauth-staticdev went backwards which would break package feeds from (0:5.10.1+git0+8f4f2e0cae-r0.0 to 0:5.10.1+5.11-alpha+git0+e8552ddaf1-r0.0) [version-going-backwards]
qtnetworkauth-5.10.1+5.11-alpha+gitAUTOINC+e8552ddaf1: Package version for package qtnetworkauth-tools-dbg went backwards which would break package feeds from (0:5.10.1+git0+8f4f2e0cae-r0.0 to 0:5.10.1+5.11-alpha+git0+e8552ddaf1-r0.0) [version-going-backwards]
qtnetworkauth-5.10.1+5.11-alpha+gitAUTOINC+e8552ddaf1: Package version for package qtnetworkauth-tools went backwards which would break package feeds from (0:5.10.1+git0+8f4f2e0cae-r0.0 to 0:5.10.1+5.11-alpha+git0+e8552ddaf1-r0.0) [version-going-backwards]
qtnetworkauth-5.10.1+5.11-alpha+gitAUTOINC+e8552ddaf1: Package version for package qtnetworkauth went backwards which would break package feeds from (0:5.10.1+git0+8f4f2e0cae-r0.0 to 0:5.10.1+5.11-alpha+git0+e8552ddaf1-r0.0) [version-going-backwards]
qtquick1-5.10.1+5.11-alpha+gitAUTOINC+fa02271a18: Package version for package qtquick1-dbg went backwards which would break package feeds from (0:5.10.1+git0+b2476dcd53-r0.0 to 0:5.10.1+5.11-alpha+git0+fa02271a18-r0.0) [version-going-backwards]
qtquick1-5.10.1+5.11-alpha+gitAUTOINC+fa02271a18: Package version for package qtquick1-dev went backwards which would break package feeds from (0:5.10.1+git0+b2476dcd53-r0.0 to 0:5.10.1+5.11-alpha+git0+fa02271a18-r0.0) [version-going-backwards]
qtquick1-5.10.1+5.11-alpha+gitAUTOINC+fa02271a18: Package version for package qtquick1-doc went backwards which would break package feeds from (0:5.10.1+git0+b2476dcd53-r0.0 to 0:5.10.1+5.11-alpha+git0+fa02271a18-r0.0) [version-going-backwards]
qtquick1-5.10.1+5.11-alpha+gitAUTOINC+fa02271a18: Package version for package qtquick1-examples-dbg went backwards which would break package feeds from (0:5.10.1+git0+b2476dcd53-r0.0 to 0:5.10.1+5.11-alpha+git0+fa02271a18-r0.0) [version-going-backwards]
qtquick1-5.10.1+5.11-alpha+gitAUTOINC+fa02271a18: Package version for package qtquick1-examples-dev went backwards which would break package feeds from (0:5.10.1+git0+b2476dcd53-r0.0 to 0:5.10.1+5.11-alpha+git0+fa02271a18-r0.0) [version-going-backwards]
qtquick1-5.10.1+5.11-alpha+gitAUTOINC+fa02271a18: Package version for package qtquick1-examples-staticdev went backwards which would break package feeds from (0:5.10.1+git0+b2476dcd53-r0.0 to 0:5.10.1+5.11-alpha+git0+fa02271a18-r0.0) [version-going-backwards]
qtquick1-5.10.1+5.11-alpha+gitAUTOINC+fa02271a18: Package version for package qtquick1-examples went backwards which would break package feeds from (0:5.10.1+git0+b2476dcd53-r0.0 to 0:5.10.1+5.11-alpha+git0+fa02271a18-r0.0) [version-going-backwards]
qtquick1-5.10.1+5.11-alpha+gitAUTOINC+fa02271a18: Package version for package qtquick1-locale went backwards which would break package feeds from (0:5.10.1+git0+b2476dcd53-r0.0 to 0:5.10.1+5.11-alpha+git0+fa02271a18-r0.0) [version-going-backwards]
qtquick1-5.10.1+5.11-alpha+gitAUTOINC+fa02271a18: Package version for package qtquick1-mkspecs went backwards which would break package feeds from (0:5.10.1+git0+b2476dcd53-r0.0 to 0:5.10.1+5.11-alpha+git0+fa02271a18-r0.0) [version-going-backwards]
qtquick1-5.10.1+5.11-alpha+gitAUTOINC+fa02271a18: Package version for package qtquick1-plugins-dbg went backwards which would break package feeds from (0:5.10.1+git0+b2476dcd53-r0.0 to 0:5.10.1+5.11-alpha+git0+fa02271a18-r0.0) [version-going-backwards]
qtquick1-5.10.1+5.11-alpha+gitAUTOINC+fa02271a18: Package version for package qtquick1-plugins went backwards which would break package feeds from (0:5.10.1+git0+b2476dcd53-r0.0 to 0:5.10.1+5.11-alpha+git0+fa02271a18-r0.0) [version-going-backwards]
qtquick1-5.10.1+5.11-alpha+gitAUTOINC+fa02271a18: Package version for package qtquick1-ptest went backwards which would break package feeds from (0:5.10.1+git0+b2476dcd53-r0.0 to 0:5.10.1+5.11-alpha+git0+fa02271a18-r0.0) [version-going-backwards]
qtquick1-5.10.1+5.11-alpha+gitAUTOINC+fa02271a18: Package version for package qtquick1-qmldesigner went backwards which would break package feeds from (0:5.10.1+git0+b2476dcd53-r0.0 to 0:5.10.1+5.11-alpha+git0+fa02271a18-r0.0) [version-going-backwards]
qtquick1-5.10.1+5.11-alpha+gitAUTOINC+fa02271a18: Package version for package qtquick1-qmlplugins-dbg went backwards which would break package feeds from (0:5.10.1+git0+b2476dcd53-r0.0 to 0:5.10.1+5.11-alpha+git0+fa02271a18-r0.0) [version-going-backwards]
qtquick1-5.10.1+5.11-alpha+gitAUTOINC+fa02271a18: Package version for package qtquick1-qmlplugins went backwards which would break package feeds from (0:5.10.1+git0+b2476dcd53-r0.0 to 0:5.10.1+5.11-alpha+git0+fa02271a18-r0.0) [version-going-backwards]
qtquick1-5.10.1+5.11-alpha+gitAUTOINC+fa02271a18: Package version for package qtquick1-staticdev went backwards which would break package feeds from (0:5.10.1+git0+b2476dcd53-r0.0 to 0:5.10.1+5.11-alpha+git0+fa02271a18-r0.0) [version-going-backwards]
qtquick1-5.10.1+5.11-alpha+gitAUTOINC+fa02271a18: Package version for package qtquick1-tools-dbg went backwards which would break package feeds from (0:5.10.1+git0+b2476dcd53-r0.0 to 0:5.10.1+5.11-alpha+git0+fa02271a18-r0.0) [version-going-backwards]
qtquick1-5.10.1+5.11-alpha+gitAUTOINC+fa02271a18: Package version for package qtquick1-tools went backwards which would break package feeds from (0:5.10.1+git0+b2476dcd53-r0.0 to 0:5.10.1+5.11-alpha+git0+fa02271a18-r0.0) [version-going-backwards]
qtquick1-5.10.1+5.11-alpha+gitAUTOINC+fa02271a18: Package version for package qtquick1 went backwards which would break package feeds from (0:5.10.1+git0+b2476dcd53-r0.0 to 0:5.10.1+5.11-alpha+git0+fa02271a18-r0.0) [version-going-backwards]
qtquickcontrols2-5.10.1+5.11-alpha+gitAUTOINC+e80d273e6f: Package version for package qtquickcontrols2-dbg went backwards which would break package feeds from (0:5.10.1+git0+e693ad2c4a-r0.0 to 0:5.10.1+5.11-alpha+git0+e80d273e6f-r0.0) [version-going-backwards]
qtquickcontrols2-5.10.1+5.11-alpha+gitAUTOINC+e80d273e6f: Package version for package qtquickcontrols2-dev went backwards which would break package feeds from (0:5.10.1+git0+e693ad2c4a-r0.0 to 0:5.10.1+5.11-alpha+git0+e80d273e6f-r0.0) [version-going-backwards]
qtquickcontrols2-5.10.1+5.11-alpha+gitAUTOINC+e80d273e6f: Package version for package qtquickcontrols2-doc went backwards which would break package feeds from (0:5.10.1+git0+e693ad2c4a-r0.0 to 0:5.10.1+5.11-alpha+git0+e80d273e6f-r0.0) [version-going-backwards]
qtquickcontrols2-5.10.1+5.11-alpha+gitAUTOINC+e80d273e6f: Package version for package qtquickcontrols2-examples-dbg went backwards which would break package feeds from (0:5.10.1+git0+e693ad2c4a-r0.0 to 0:5.10.1+5.11-alpha+git0+e80d273e6f-r0.0) [version-going-backwards]
qtquickcontrols2-5.10.1+5.11-alpha+gitAUTOINC+e80d273e6f: Package version for package qtquickcontrols2-examples-dev went backwards which would break package feeds from (0:5.10.1+git0+e693ad2c4a-r0.0 to 0:5.10.1+5.11-alpha+git0+e80d273e6f-r0.0) [version-going-backwards]
qtquickcontrols2-5.10.1+5.11-alpha+gitAUTOINC+e80d273e6f: Package version for package qtquickcontrols2-examples-staticdev went backwards which would break package feeds from (0:5.10.1+git0+e693ad2c4a-r0.0 to 0:5.10.1+5.11-alpha+git0+e80d273e6f-r0.0) [version-going-backwards]
qtquickcontrols2-5.10.1+5.11-alpha+gitAUTOINC+e80d273e6f: Package version for package qtquickcontrols2-examples went backwards which would break package feeds from (0:5.10.1+git0+e693ad2c4a-r0.0 to 0:5.10.1+5.11-alpha+git0+e80d273e6f-r0.0) [version-going-backwards]
qtquickcontrols2-5.10.1+5.11-alpha+gitAUTOINC+e80d273e6f: Package version for package qtquickcontrols2-locale went backwards which would break package feeds from (0:5.10.1+git0+e693ad2c4a-r0.0 to 0:5.10.1+5.11-alpha+git0+e80d273e6f-r0.0) [version-going-backwards]
qtquickcontrols2-5.10.1+5.11-alpha+gitAUTOINC+e80d273e6f: Package version for package qtquickcontrols2-mkspecs went backwards which would break package feeds from (0:5.10.1+git0+e693ad2c4a-r0.0 to 0:5.10.1+5.11-alpha+git0+e80d273e6f-r0.0) [version-going-backwards]
qtquickcontrols2-5.10.1+5.11-alpha+gitAUTOINC+e80d273e6f: Package version for package qtquickcontrols2-plugins-dbg went backwards which would break package feeds from (0:5.10.1+git0+e693ad2c4a-r0.0 to 0:5.10.1+5.11-alpha+git0+e80d273e6f-r0.0) [version-going-backwards]
qtquickcontrols2-5.10.1+5.11-alpha+gitAUTOINC+e80d273e6f: Package version for package qtquickcontrols2-plugins went backwards which would break package feeds from (0:5.10.1+git0+e693ad2c4a-r0.0 to 0:5.10.1+5.11-alpha+git0+e80d273e6f-r0.0) [version-going-backwards]
qtquickcontrols2-5.10.1+5.11-alpha+gitAUTOINC+e80d273e6f: Package version for package qtquickcontrols2-qmldesigner went backwards which would break package feeds from (0:5.10.1+git0+e693ad2c4a-r0.0 to 0:5.10.1+5.11-alpha+git0+e80d273e6f-r0.0) [version-going-backwards]
qtquickcontrols2-5.10.1+5.11-alpha+gitAUTOINC+e80d273e6f: Package version for package qtquickcontrols2-qmlplugins-dbg went backwards which would break package feeds from (0:5.10.1+git0+e693ad2c4a-r0.0 to 0:5.10.1+5.11-alpha+git0+e80d273e6f-r0.0) [version-going-backwards]
qtquickcontrols2-5.10.1+5.11-alpha+gitAUTOINC+e80d273e6f: Package version for package qtquickcontrols2-qmlplugins went backwards which would break package feeds from (0:5.10.1+git0+e693ad2c4a-r0.0 to 0:5.10.1+5.11-alpha+git0+e80d273e6f-r0.0) [version-going-backwards]
qtquickcontrols2-5.10.1+5.11-alpha+gitAUTOINC+e80d273e6f: Package version for package qtquickcontrols2-staticdev went backwards which would break package feeds from (0:5.10.1+git0+e693ad2c4a-r0.0 to 0:5.10.1+5.11-alpha+git0+e80d273e6f-r0.0) [version-going-backwards]
qtquickcontrols2-5.10.1+5.11-alpha+gitAUTOINC+e80d273e6f: Package version for package qtquickcontrols2-tools-dbg went backwards which would break package feeds from (0:5.10.1+git0+e693ad2c4a-r0.0 to 0:5.10.1+5.11-alpha+git0+e80d273e6f-r0.0) [version-going-backwards]
qtquickcontrols2-5.10.1+5.11-alpha+gitAUTOINC+e80d273e6f: Package version for package qtquickcontrols2-tools went backwards which would break package feeds from (0:5.10.1+git0+e693ad2c4a-r0.0 to 0:5.10.1+5.11-alpha+git0+e80d273e6f-r0.0) [version-going-backwards]
qtquickcontrols2-5.10.1+5.11-alpha+gitAUTOINC+e80d273e6f: Package version for package qtquickcontrols2 went backwards which would break package feeds from (0:5.10.1+git0+e693ad2c4a-r0.0 to 0:5.10.1+5.11-alpha+git0+e80d273e6f-r0.0) [version-going-backwards]
qtquickcontrols-5.10.1+5.11-alpha+gitAUTOINC+6c9f0bfcc4: Package version for package qtquickcontrols-dbg went backwards which would break package feeds from (0:5.10.1+git0+09ebb25aa6-r0.0 to 0:5.10.1+5.11-alpha+git0+6c9f0bfcc4-r0.0) [version-going-backwards]
qtquickcontrols-5.10.1+5.11-alpha+gitAUTOINC+6c9f0bfcc4: Package version for package qtquickcontrols-dev went backwards which would break package feeds from (0:5.10.1+git0+09ebb25aa6-r0.0 to 0:5.10.1+5.11-alpha+git0+6c9f0bfcc4-r0.0) [version-going-backwards]
qtquickcontrols-5.10.1+5.11-alpha+gitAUTOINC+6c9f0bfcc4: Package version for package qtquickcontrols-doc went backwards which would break package feeds from (0:5.10.1+git0+09ebb25aa6-r0.0 to 0:5.10.1+5.11-alpha+git0+6c9f0bfcc4-r0.0) [version-going-backwards]
qtquickcontrols-5.10.1+5.11-alpha+gitAUTOINC+6c9f0bfcc4: Package version for package qtquickcontrols-examples-dbg went backwards which would break package feeds from (0:5.10.1+git0+09ebb25aa6-r0.0 to 0:5.10.1+5.11-alpha+git0+6c9f0bfcc4-r0.0) [version-going-backwards]
qtquickcontrols-5.10.1+5.11-alpha+gitAUTOINC+6c9f0bfcc4: Package version for package qtquickcontrols-examples-dev went backwards which would break package feeds from (0:5.10.1+git0+09ebb25aa6-r0.0 to 0:5.10.1+5.11-alpha+git0+6c9f0bfcc4-r0.0) [version-going-backwards]
qtquickcontrols-5.10.1+5.11-alpha+gitAUTOINC+6c9f0bfcc4: Package version for package qtquickcontrols-examples-staticdev went backwards which would break package feeds from (0:5.10.1+git0+09ebb25aa6-r0.0 to 0:5.10.1+5.11-alpha+git0+6c9f0bfcc4-r0.0) [version-going-backwards]
qtquickcontrols-5.10.1+5.11-alpha+gitAUTOINC+6c9f0bfcc4: Package version for package qtquickcontrols-examples went backwards which would break package feeds from (0:5.10.1+git0+09ebb25aa6-r0.0 to 0:5.10.1+5.11-alpha+git0+6c9f0bfcc4-r0.0) [version-going-backwards]
qtquickcontrols-5.10.1+5.11-alpha+gitAUTOINC+6c9f0bfcc4: Package version for package qtquickcontrols-locale went backwards which would break package feeds from (0:5.10.1+git0+09ebb25aa6-r0.0 to 0:5.10.1+5.11-alpha+git0+6c9f0bfcc4-r0.0) [version-going-backwards]
qtquickcontrols-5.10.1+5.11-alpha+gitAUTOINC+6c9f0bfcc4: Package version for package qtquickcontrols-mkspecs went backwards which would break package feeds from (0:5.10.1+git0+09ebb25aa6-r0.0 to 0:5.10.1+5.11-alpha+git0+6c9f0bfcc4-r0.0) [version-going-backwards]
qtquickcontrols-5.10.1+5.11-alpha+gitAUTOINC+6c9f0bfcc4: Package version for package qtquickcontrols-plugins-dbg went backwards which would break package feeds from (0:5.10.1+git0+09ebb25aa6-r0.0 to 0:5.10.1+5.11-alpha+git0+6c9f0bfcc4-r0.0) [version-going-backwards]
qtquickcontrols-5.10.1+5.11-alpha+gitAUTOINC+6c9f0bfcc4: Package version for package qtquickcontrols-plugins went backwards which would break package feeds from (0:5.10.1+git0+09ebb25aa6-r0.0 to 0:5.10.1+5.11-alpha+git0+6c9f0bfcc4-r0.0) [version-going-backwards]
qtquickcontrols-5.10.1+5.11-alpha+gitAUTOINC+6c9f0bfcc4: Package version for package qtquickcontrols-qmldesigner went backwards which would break package feeds from (0:5.10.1+git0+09ebb25aa6-r0.0 to 0:5.10.1+5.11-alpha+git0+6c9f0bfcc4-r0.0) [version-going-backwards]
qtquickcontrols-5.10.1+5.11-alpha+gitAUTOINC+6c9f0bfcc4: Package version for package qtquickcontrols-qmlplugins-dbg went backwards which would break package feeds from (0:5.10.1+git0+09ebb25aa6-r0.0 to 0:5.10.1+5.11-alpha+git0+6c9f0bfcc4-r0.0) [version-going-backwards]
qtquickcontrols-5.10.1+5.11-alpha+gitAUTOINC+6c9f0bfcc4: Package version for package qtquickcontrols-qmlplugins went backwards which would break package feeds from (0:5.10.1+git0+09ebb25aa6-r0.0 to 0:5.10.1+5.11-alpha+git0+6c9f0bfcc4-r0.0) [version-going-backwards]
qtquickcontrols-5.10.1+5.11-alpha+gitAUTOINC+6c9f0bfcc4: Package version for package qtquickcontrols-staticdev went backwards which would break package feeds from (0:5.10.1+git0+09ebb25aa6-r0.0 to 0:5.10.1+5.11-alpha+git0+6c9f0bfcc4-r0.0) [version-going-backwards]
qtquickcontrols-5.10.1+5.11-alpha+gitAUTOINC+6c9f0bfcc4: Package version for package qtquickcontrols-tools-dbg went backwards which would break package feeds from (0:5.10.1+git0+09ebb25aa6-r0.0 to 0:5.10.1+5.11-alpha+git0+6c9f0bfcc4-r0.0) [version-going-backwards]
qtquickcontrols-5.10.1+5.11-alpha+gitAUTOINC+6c9f0bfcc4: Package version for package qtquickcontrols-tools went backwards which would break package feeds from (0:5.10.1+git0+09ebb25aa6-r0.0 to 0:5.10.1+5.11-alpha+git0+6c9f0bfcc4-r0.0) [version-going-backwards]
qtquickcontrols-5.10.1+5.11-alpha+gitAUTOINC+6c9f0bfcc4: Package version for package qtquickcontrols went backwards which would break package feeds from (0:5.10.1+git0+09ebb25aa6-r0.0 to 0:5.10.1+5.11-alpha+git0+6c9f0bfcc4-r0.0) [version-going-backwards]
qtremoteobjects-5.10.1+5.11-alpha+gitAUTOINC+db6d07b4a5: Package version for package qtremoteobjects-dbg went backwards which would break package feeds from (0:5.10.1+git0+61d2de26db-r0.0 to 0:5.10.1+5.11-alpha+git0+db6d07b4a5-r0.0) [version-going-backwards]
qtremoteobjects-5.10.1+5.11-alpha+gitAUTOINC+db6d07b4a5: Package version for package qtremoteobjects-dev went backwards which would break package feeds from (0:5.10.1+git0+61d2de26db-r0.0 to 0:5.10.1+5.11-alpha+git0+db6d07b4a5-r0.0) [version-going-backwards]
qtremoteobjects-5.10.1+5.11-alpha+gitAUTOINC+db6d07b4a5: Package version for package qtremoteobjects-doc went backwards which would break package feeds from (0:5.10.1+git0+61d2de26db-r0.0 to 0:5.10.1+5.11-alpha+git0+db6d07b4a5-r0.0) [version-going-backwards]
qtremoteobjects-5.10.1+5.11-alpha+gitAUTOINC+db6d07b4a5: Package version for package qtremoteobjects-examples-dbg went backwards which would break package feeds from (0:5.10.1+git0+61d2de26db-r0.0 to 0:5.10.1+5.11-alpha+git0+db6d07b4a5-r0.0) [version-going-backwards]
qtremoteobjects-5.10.1+5.11-alpha+gitAUTOINC+db6d07b4a5: Package version for package qtremoteobjects-examples-dev went backwards which would break package feeds from (0:5.10.1+git0+61d2de26db-r0.0 to 0:5.10.1+5.11-alpha+git0+db6d07b4a5-r0.0) [version-going-backwards]
qtremoteobjects-5.10.1+5.11-alpha+gitAUTOINC+db6d07b4a5: Package version for package qtremoteobjects-examples-staticdev went backwards which would break package feeds from (0:5.10.1+git0+61d2de26db-r0.0 to 0:5.10.1+5.11-alpha+git0+db6d07b4a5-r0.0) [version-going-backwards]
qtremoteobjects-5.10.1+5.11-alpha+gitAUTOINC+db6d07b4a5: Package version for package qtremoteobjects-examples went backwards which would break package feeds from (0:5.10.1+git0+61d2de26db-r0.0 to 0:5.10.1+5.11-alpha+git0+db6d07b4a5-r0.0) [version-going-backwards]
qtremoteobjects-5.10.1+5.11-alpha+gitAUTOINC+db6d07b4a5: Package version for package qtremoteobjects-locale went backwards which would break package feeds from (0:5.10.1+git0+61d2de26db-r0.0 to 0:5.10.1+5.11-alpha+git0+db6d07b4a5-r0.0) [version-going-backwards]
qtremoteobjects-5.10.1+5.11-alpha+gitAUTOINC+db6d07b4a5: Package version for package qtremoteobjects-mkspecs went backwards which would break package feeds from (0:5.10.1+git0+61d2de26db-r0.0 to 0:5.10.1+5.11-alpha+git0+db6d07b4a5-r0.0) [version-going-backwards]
qtremoteobjects-5.10.1+5.11-alpha+gitAUTOINC+db6d07b4a5: Package version for package qtremoteobjects-plugins-dbg went backwards which would break package feeds from (0:5.10.1+git0+61d2de26db-r0.0 to 0:5.10.1+5.11-alpha+git0+db6d07b4a5-r0.0) [version-going-backwards]
qtremoteobjects-5.10.1+5.11-alpha+gitAUTOINC+db6d07b4a5: Package version for package qtremoteobjects-plugins went backwards which would break package feeds from (0:5.10.1+git0+61d2de26db-r0.0 to 0:5.10.1+5.11-alpha+git0+db6d07b4a5-r0.0) [version-going-backwards]
qtremoteobjects-5.10.1+5.11-alpha+gitAUTOINC+db6d07b4a5: Package version for package qtremoteobjects-qmldesigner went backwards which would break package feeds from (0:5.10.1+git0+61d2de26db-r0.0 to 0:5.10.1+5.11-alpha+git0+db6d07b4a5-r0.0) [version-going-backwards]
qtremoteobjects-5.10.1+5.11-alpha+gitAUTOINC+db6d07b4a5: Package version for package qtremoteobjects-qmlplugins-dbg went backwards which would break package feeds from (0:5.10.1+git0+61d2de26db-r0.0 to 0:5.10.1+5.11-alpha+git0+db6d07b4a5-r0.0) [version-going-backwards]
qtremoteobjects-5.10.1+5.11-alpha+gitAUTOINC+db6d07b4a5: Package version for package qtremoteobjects-qmlplugins went backwards which would break package feeds from (0:5.10.1+git0+61d2de26db-r0.0 to 0:5.10.1+5.11-alpha+git0+db6d07b4a5-r0.0) [version-going-backwards]
qtremoteobjects-5.10.1+5.11-alpha+gitAUTOINC+db6d07b4a5: Package version for package qtremoteobjects-staticdev went backwards which would break package feeds from (0:5.10.1+git0+61d2de26db-r0.0 to 0:5.10.1+5.11-alpha+git0+db6d07b4a5-r0.0) [version-going-backwards]
qtremoteobjects-5.10.1+5.11-alpha+gitAUTOINC+db6d07b4a5: Package version for package qtremoteobjects-tools-dbg went backwards which would break package feeds from (0:5.10.1+git0+61d2de26db-r0.0 to 0:5.10.1+5.11-alpha+git0+db6d07b4a5-r0.0) [version-going-backwards]
qtremoteobjects-5.10.1+5.11-alpha+gitAUTOINC+db6d07b4a5: Package version for package qtremoteobjects-tools went backwards which would break package feeds from (0:5.10.1+git0+61d2de26db-r0.0 to 0:5.10.1+5.11-alpha+git0+db6d07b4a5-r0.0) [version-going-backwards]
qtremoteobjects-5.10.1+5.11-alpha+gitAUTOINC+db6d07b4a5: Package version for package qtremoteobjects went backwards which would break package feeds from (0:5.10.1+git0+61d2de26db-r0.0 to 0:5.10.1+5.11-alpha+git0+db6d07b4a5-r0.0) [version-going-backwards]
qtscript-5.10.1+5.11-alpha+gitAUTOINC+781c745277: Package version for package qtscript-dbg went backwards which would break package feeds from (0:5.10.1+git0+76bcf9b526-r0.0 to 0:5.10.1+5.11-alpha+git0+781c745277-r0.0) [version-going-backwards]
qtscript-5.10.1+5.11-alpha+gitAUTOINC+781c745277: Package version for package qtscript-dev went backwards which would break package feeds from (0:5.10.1+git0+76bcf9b526-r0.0 to 0:5.10.1+5.11-alpha+git0+781c745277-r0.0) [version-going-backwards]
qtscript-5.10.1+5.11-alpha+gitAUTOINC+781c745277: Package version for package qtscript-doc went backwards which would break package feeds from (0:5.10.1+git0+76bcf9b526-r0.0 to 0:5.10.1+5.11-alpha+git0+781c745277-r0.0) [version-going-backwards]
qtscript-5.10.1+5.11-alpha+gitAUTOINC+781c745277: Package version for package qtscript-examples-dbg went backwards which would break package feeds from (0:5.10.1+git0+76bcf9b526-r0.0 to 0:5.10.1+5.11-alpha+git0+781c745277-r0.0) [version-going-backwards]
qtscript-5.10.1+5.11-alpha+gitAUTOINC+781c745277: Package version for package qtscript-examples-dev went backwards which would break package feeds from (0:5.10.1+git0+76bcf9b526-r0.0 to 0:5.10.1+5.11-alpha+git0+781c745277-r0.0) [version-going-backwards]
qtscript-5.10.1+5.11-alpha+gitAUTOINC+781c745277: Package version for package qtscript-examples-staticdev went backwards which would break package feeds from (0:5.10.1+git0+76bcf9b526-r0.0 to 0:5.10.1+5.11-alpha+git0+781c745277-r0.0) [version-going-backwards]
qtscript-5.10.1+5.11-alpha+gitAUTOINC+781c745277: Package version for package qtscript-examples went backwards which would break package feeds from (0:5.10.1+git0+76bcf9b526-r0.0 to 0:5.10.1+5.11-alpha+git0+781c745277-r0.0) [version-going-backwards]
qtscript-5.10.1+5.11-alpha+gitAUTOINC+781c745277: Package version for package qtscript-locale went backwards which would break package feeds from (0:5.10.1+git0+76bcf9b526-r0.0 to 0:5.10.1+5.11-alpha+git0+781c745277-r0.0) [version-going-backwards]
qtscript-5.10.1+5.11-alpha+gitAUTOINC+781c745277: Package version for package qtscript-mkspecs went backwards which would break package feeds from (0:5.10.1+git0+76bcf9b526-r0.0 to 0:5.10.1+5.11-alpha+git0+781c745277-r0.0) [version-going-backwards]
qtscript-5.10.1+5.11-alpha+gitAUTOINC+781c745277: Package version for package qtscript-plugins-dbg went backwards which would break package feeds from (0:5.10.1+git0+76bcf9b526-r0.0 to 0:5.10.1+5.11-alpha+git0+781c745277-r0.0) [version-going-backwards]
qtscript-5.10.1+5.11-alpha+gitAUTOINC+781c745277: Package version for package qtscript-plugins went backwards which would break package feeds from (0:5.10.1+git0+76bcf9b526-r0.0 to 0:5.10.1+5.11-alpha+git0+781c745277-r0.0) [version-going-backwards]
qtscript-5.10.1+5.11-alpha+gitAUTOINC+781c745277: Package version for package qtscript-qmldesigner went backwards which would break package feeds from (0:5.10.1+git0+76bcf9b526-r0.0 to 0:5.10.1+5.11-alpha+git0+781c745277-r0.0) [version-going-backwards]
qtscript-5.10.1+5.11-alpha+gitAUTOINC+781c745277: Package version for package qtscript-qmlplugins-dbg went backwards which would break package feeds from (0:5.10.1+git0+76bcf9b526-r0.0 to 0:5.10.1+5.11-alpha+git0+781c745277-r0.0) [version-going-backwards]
qtscript-5.10.1+5.11-alpha+gitAUTOINC+781c745277: Package version for package qtscript-qmlplugins went backwards which would break package feeds from (0:5.10.1+git0+76bcf9b526-r0.0 to 0:5.10.1+5.11-alpha+git0+781c745277-r0.0) [version-going-backwards]
qtscript-5.10.1+5.11-alpha+gitAUTOINC+781c745277: Package version for package qtscript-staticdev went backwards which would break package feeds from (0:5.10.1+git0+76bcf9b526-r0.0 to 0:5.10.1+5.11-alpha+git0+781c745277-r0.0) [version-going-backwards]
qtscript-5.10.1+5.11-alpha+gitAUTOINC+781c745277: Package version for package qtscript-tools-dbg went backwards which would break package feeds from (0:5.10.1+git0+76bcf9b526-r0.0 to 0:5.10.1+5.11-alpha+git0+781c745277-r0.0) [version-going-backwards]
qtscript-5.10.1+5.11-alpha+gitAUTOINC+781c745277: Package version for package qtscript-tools went backwards which would break package feeds from (0:5.10.1+git0+76bcf9b526-r0.0 to 0:5.10.1+5.11-alpha+git0+781c745277-r0.0) [version-going-backwards]
qtscript-5.10.1+5.11-alpha+gitAUTOINC+781c745277: Package version for package qtscript went backwards which would break package feeds from (0:5.10.1+git0+76bcf9b526-r0.0 to 0:5.10.1+5.11-alpha+git0+781c745277-r0.0) [version-going-backwards]
qtscxml-5.10.1+5.11-alpha+gitAUTOINC+544f8c4ef7: Package version for package qtscxml-dbg went backwards which would break package feeds from (0:5.10.1+git0+d9b2f8c56d-r0.0 to 0:5.10.1+5.11-alpha+git0+544f8c4ef7-r0.0) [version-going-backwards]
qtscxml-5.10.1+5.11-alpha+gitAUTOINC+544f8c4ef7: Package version for package qtscxml-dev went backwards which would break package feeds from (0:5.10.1+git0+d9b2f8c56d-r0.0 to 0:5.10.1+5.11-alpha+git0+544f8c4ef7-r0.0) [version-going-backwards]
qtscxml-5.10.1+5.11-alpha+gitAUTOINC+544f8c4ef7: Package version for package qtscxml-doc went backwards which would break package feeds from (0:5.10.1+git0+d9b2f8c56d-r0.0 to 0:5.10.1+5.11-alpha+git0+544f8c4ef7-r0.0) [version-going-backwards]
qtscxml-5.10.1+5.11-alpha+gitAUTOINC+544f8c4ef7: Package version for package qtscxml-examples-dbg went backwards which would break package feeds from (0:5.10.1+git0+d9b2f8c56d-r0.0 to 0:5.10.1+5.11-alpha+git0+544f8c4ef7-r0.0) [version-going-backwards]
qtscxml-5.10.1+5.11-alpha+gitAUTOINC+544f8c4ef7: Package version for package qtscxml-examples-dev went backwards which would break package feeds from (0:5.10.1+git0+d9b2f8c56d-r0.0 to 0:5.10.1+5.11-alpha+git0+544f8c4ef7-r0.0) [version-going-backwards]
qtscxml-5.10.1+5.11-alpha+gitAUTOINC+544f8c4ef7: Package version for package qtscxml-examples-staticdev went backwards which would break package feeds from (0:5.10.1+git0+d9b2f8c56d-r0.0 to 0:5.10.1+5.11-alpha+git0+544f8c4ef7-r0.0) [version-going-backwards]
qtscxml-5.10.1+5.11-alpha+gitAUTOINC+544f8c4ef7: Package version for package qtscxml-examples went backwards which would break package feeds from (0:5.10.1+git0+d9b2f8c56d-r0.0 to 0:5.10.1+5.11-alpha+git0+544f8c4ef7-r0.0) [version-going-backwards]
qtscxml-5.10.1+5.11-alpha+gitAUTOINC+544f8c4ef7: Package version for package qtscxml-locale went backwards which would break package feeds from (0:5.10.1+git0+d9b2f8c56d-r0.0 to 0:5.10.1+5.11-alpha+git0+544f8c4ef7-r0.0) [version-going-backwards]
qtscxml-5.10.1+5.11-alpha+gitAUTOINC+544f8c4ef7: Package version for package qtscxml-mkspecs went backwards which would break package feeds from (0:5.10.1+git0+d9b2f8c56d-r0.0 to 0:5.10.1+5.11-alpha+git0+544f8c4ef7-r0.0) [version-going-backwards]
qtscxml-5.10.1+5.11-alpha+gitAUTOINC+544f8c4ef7: Package version for package qtscxml-plugins-dbg went backwards which would break package feeds from (0:5.10.1+git0+d9b2f8c56d-r0.0 to 0:5.10.1+5.11-alpha+git0+544f8c4ef7-r0.0) [version-going-backwards]
qtscxml-5.10.1+5.11-alpha+gitAUTOINC+544f8c4ef7: Package version for package qtscxml-plugins went backwards which would break package feeds from (0:5.10.1+git0+d9b2f8c56d-r0.0 to 0:5.10.1+5.11-alpha+git0+544f8c4ef7-r0.0) [version-going-backwards]
qtscxml-5.10.1+5.11-alpha+gitAUTOINC+544f8c4ef7: Package version for package qtscxml-qmldesigner went backwards which would break package feeds from (0:5.10.1+git0+d9b2f8c56d-r0.0 to 0:5.10.1+5.11-alpha+git0+544f8c4ef7-r0.0) [version-going-backwards]
qtscxml-5.10.1+5.11-alpha+gitAUTOINC+544f8c4ef7: Package version for package qtscxml-qmlplugins-dbg went backwards which would break package feeds from (0:5.10.1+git0+d9b2f8c56d-r0.0 to 0:5.10.1+5.11-alpha+git0+544f8c4ef7-r0.0) [version-going-backwards]
qtscxml-5.10.1+5.11-alpha+gitAUTOINC+544f8c4ef7: Package version for package qtscxml-qmlplugins went backwards which would break package feeds from (0:5.10.1+git0+d9b2f8c56d-r0.0 to 0:5.10.1+5.11-alpha+git0+544f8c4ef7-r0.0) [version-going-backwards]
qtscxml-5.10.1+5.11-alpha+gitAUTOINC+544f8c4ef7: Package version for package qtscxml-staticdev went backwards which would break package feeds from (0:5.10.1+git0+d9b2f8c56d-r0.0 to 0:5.10.1+5.11-alpha+git0+544f8c4ef7-r0.0) [version-going-backwards]
qtscxml-5.10.1+5.11-alpha+gitAUTOINC+544f8c4ef7: Package version for package qtscxml-tools-dbg went backwards which would break package feeds from (0:5.10.1+git0+d9b2f8c56d-r0.0 to 0:5.10.1+5.11-alpha+git0+544f8c4ef7-r0.0) [version-going-backwards]
qtscxml-5.10.1+5.11-alpha+gitAUTOINC+544f8c4ef7: Package version for package qtscxml-tools went backwards which would break package feeds from (0:5.10.1+git0+d9b2f8c56d-r0.0 to 0:5.10.1+5.11-alpha+git0+544f8c4ef7-r0.0) [version-going-backwards]
qtscxml-5.10.1+5.11-alpha+gitAUTOINC+544f8c4ef7: Package version for package qtscxml went backwards which would break package feeds from (0:5.10.1+git0+d9b2f8c56d-r0.0 to 0:5.10.1+5.11-alpha+git0+544f8c4ef7-r0.0) [version-going-backwards]
qtsensors-5.10.1+5.11-alpha+gitAUTOINC+e8588efb2f: Package version for package qtsensors-dbg went backwards which would break package feeds from (0:5.10.1+git0+d5a94c5595-r0.0 to 0:5.10.1+5.11-alpha+git0+e8588efb2f-r0.0) [version-going-backwards]
qtsensors-5.10.1+5.11-alpha+gitAUTOINC+e8588efb2f: Package version for package qtsensors-dev went backwards which would break package feeds from (0:5.10.1+git0+d5a94c5595-r0.0 to 0:5.10.1+5.11-alpha+git0+e8588efb2f-r0.0) [version-going-backwards]
qtsensors-5.10.1+5.11-alpha+gitAUTOINC+e8588efb2f: Package version for package qtsensors-doc went backwards which would break package feeds from (0:5.10.1+git0+d5a94c5595-r0.0 to 0:5.10.1+5.11-alpha+git0+e8588efb2f-r0.0) [version-going-backwards]
qtsensors-5.10.1+5.11-alpha+gitAUTOINC+e8588efb2f: Package version for package qtsensors-examples-dbg went backwards which would break package feeds from (0:5.10.1+git0+d5a94c5595-r0.0 to 0:5.10.1+5.11-alpha+git0+e8588efb2f-r0.0) [version-going-backwards]
qtsensors-5.10.1+5.11-alpha+gitAUTOINC+e8588efb2f: Package version for package qtsensors-examples-dev went backwards which would break package feeds from (0:5.10.1+git0+d5a94c5595-r0.0 to 0:5.10.1+5.11-alpha+git0+e8588efb2f-r0.0) [version-going-backwards]
qtsensors-5.10.1+5.11-alpha+gitAUTOINC+e8588efb2f: Package version for package qtsensors-examples-staticdev went backwards which would break package feeds from (0:5.10.1+git0+d5a94c5595-r0.0 to 0:5.10.1+5.11-alpha+git0+e8588efb2f-r0.0) [version-going-backwards]
qtsensors-5.10.1+5.11-alpha+gitAUTOINC+e8588efb2f: Package version for package qtsensors-examples went backwards which would break package feeds from (0:5.10.1+git0+d5a94c5595-r0.0 to 0:5.10.1+5.11-alpha+git0+e8588efb2f-r0.0) [version-going-backwards]
qtsensors-5.10.1+5.11-alpha+gitAUTOINC+e8588efb2f: Package version for package qtsensors-locale went backwards which would break package feeds from (0:5.10.1+git0+d5a94c5595-r0.0 to 0:5.10.1+5.11-alpha+git0+e8588efb2f-r0.0) [version-going-backwards]
qtsensors-5.10.1+5.11-alpha+gitAUTOINC+e8588efb2f: Package version for package qtsensors-mkspecs went backwards which would break package feeds from (0:5.10.1+git0+d5a94c5595-r0.0 to 0:5.10.1+5.11-alpha+git0+e8588efb2f-r0.0) [version-going-backwards]
qtsensors-5.10.1+5.11-alpha+gitAUTOINC+e8588efb2f: Package version for package qtsensors-plugins-dbg went backwards which would break package feeds from (0:5.10.1+git0+d5a94c5595-r0.0 to 0:5.10.1+5.11-alpha+git0+e8588efb2f-r0.0) [version-going-backwards]
qtsensors-5.10.1+5.11-alpha+gitAUTOINC+e8588efb2f: Package version for package qtsensors-plugins went backwards which would break package feeds from (0:5.10.1+git0+d5a94c5595-r0.0 to 0:5.10.1+5.11-alpha+git0+e8588efb2f-r0.0) [version-going-backwards]
qtsensors-5.10.1+5.11-alpha+gitAUTOINC+e8588efb2f: Package version for package qtsensors-qmldesigner went backwards which would break package feeds from (0:5.10.1+git0+d5a94c5595-r0.0 to 0:5.10.1+5.11-alpha+git0+e8588efb2f-r0.0) [version-going-backwards]
qtsensors-5.10.1+5.11-alpha+gitAUTOINC+e8588efb2f: Package version for package qtsensors-qmlplugins-dbg went backwards which would break package feeds from (0:5.10.1+git0+d5a94c5595-r0.0 to 0:5.10.1+5.11-alpha+git0+e8588efb2f-r0.0) [version-going-backwards]
qtsensors-5.10.1+5.11-alpha+gitAUTOINC+e8588efb2f: Package version for package qtsensors-qmlplugins went backwards which would break package feeds from (0:5.10.1+git0+d5a94c5595-r0.0 to 0:5.10.1+5.11-alpha+git0+e8588efb2f-r0.0) [version-going-backwards]
qtsensors-5.10.1+5.11-alpha+gitAUTOINC+e8588efb2f: Package version for package qtsensors-staticdev went backwards which would break package feeds from (0:5.10.1+git0+d5a94c5595-r0.0 to 0:5.10.1+5.11-alpha+git0+e8588efb2f-r0.0) [version-going-backwards]
qtsensors-5.10.1+5.11-alpha+gitAUTOINC+e8588efb2f: Package version for package qtsensors-tools-dbg went backwards which would break package feeds from (0:5.10.1+git0+d5a94c5595-r0.0 to 0:5.10.1+5.11-alpha+git0+e8588efb2f-r0.0) [version-going-backwards]
qtsensors-5.10.1+5.11-alpha+gitAUTOINC+e8588efb2f: Package version for package qtsensors-tools went backwards which would break package feeds from (0:5.10.1+git0+d5a94c5595-r0.0 to 0:5.10.1+5.11-alpha+git0+e8588efb2f-r0.0) [version-going-backwards]
qtsensors-5.10.1+5.11-alpha+gitAUTOINC+e8588efb2f: Package version for package qtsensors went backwards which would break package feeds from (0:5.10.1+git0+d5a94c5595-r0.0 to 0:5.10.1+5.11-alpha+git0+e8588efb2f-r0.0) [version-going-backwards]
qtserialbus-5.10.1+5.11-alpha+gitAUTOINC+7c6e9d8f29: Package version for package qtserialbus-dbg went backwards which would break package feeds from (0:5.10.1+git0+d5d35d64d0-r0.0 to 0:5.10.1+5.11-alpha+git0+7c6e9d8f29-r0.0) [version-going-backwards]
qtserialbus-5.10.1+5.11-alpha+gitAUTOINC+7c6e9d8f29: Package version for package qtserialbus-dev went backwards which would break package feeds from (0:5.10.1+git0+d5d35d64d0-r0.0 to 0:5.10.1+5.11-alpha+git0+7c6e9d8f29-r0.0) [version-going-backwards]
qtserialbus-5.10.1+5.11-alpha+gitAUTOINC+7c6e9d8f29: Package version for package qtserialbus-doc went backwards which would break package feeds from (0:5.10.1+git0+d5d35d64d0-r0.0 to 0:5.10.1+5.11-alpha+git0+7c6e9d8f29-r0.0) [version-going-backwards]
qtserialbus-5.10.1+5.11-alpha+gitAUTOINC+7c6e9d8f29: Package version for package qtserialbus-examples-dbg went backwards which would break package feeds from (0:5.10.1+git0+d5d35d64d0-r0.0 to 0:5.10.1+5.11-alpha+git0+7c6e9d8f29-r0.0) [version-going-backwards]
qtserialbus-5.10.1+5.11-alpha+gitAUTOINC+7c6e9d8f29: Package version for package qtserialbus-examples-dev went backwards which would break package feeds from (0:5.10.1+git0+d5d35d64d0-r0.0 to 0:5.10.1+5.11-alpha+git0+7c6e9d8f29-r0.0) [version-going-backwards]
qtserialbus-5.10.1+5.11-alpha+gitAUTOINC+7c6e9d8f29: Package version for package qtserialbus-examples-staticdev went backwards which would break package feeds from (0:5.10.1+git0+d5d35d64d0-r0.0 to 0:5.10.1+5.11-alpha+git0+7c6e9d8f29-r0.0) [version-going-backwards]
qtserialbus-5.10.1+5.11-alpha+gitAUTOINC+7c6e9d8f29: Package version for package qtserialbus-examples went backwards which would break package feeds from (0:5.10.1+git0+d5d35d64d0-r0.0 to 0:5.10.1+5.11-alpha+git0+7c6e9d8f29-r0.0) [version-going-backwards]
qtserialbus-5.10.1+5.11-alpha+gitAUTOINC+7c6e9d8f29: Package version for package qtserialbus-locale went backwards which would break package feeds from (0:5.10.1+git0+d5d35d64d0-r0.0 to 0:5.10.1+5.11-alpha+git0+7c6e9d8f29-r0.0) [version-going-backwards]
qtserialbus-5.10.1+5.11-alpha+gitAUTOINC+7c6e9d8f29: Package version for package qtserialbus-mkspecs went backwards which would break package feeds from (0:5.10.1+git0+d5d35d64d0-r0.0 to 0:5.10.1+5.11-alpha+git0+7c6e9d8f29-r0.0) [version-going-backwards]
qtserialbus-5.10.1+5.11-alpha+gitAUTOINC+7c6e9d8f29: Package version for package qtserialbus-plugins-dbg went backwards which would break package feeds from (0:5.10.1+git0+d5d35d64d0-r0.0 to 0:5.10.1+5.11-alpha+git0+7c6e9d8f29-r0.0) [version-going-backwards]
qtserialbus-5.10.1+5.11-alpha+gitAUTOINC+7c6e9d8f29: Package version for package qtserialbus-plugins went backwards which would break package feeds from (0:5.10.1+git0+d5d35d64d0-r0.0 to 0:5.10.1+5.11-alpha+git0+7c6e9d8f29-r0.0) [version-going-backwards]
qtserialbus-5.10.1+5.11-alpha+gitAUTOINC+7c6e9d8f29: Package version for package qtserialbus-qmldesigner went backwards which would break package feeds from (0:5.10.1+git0+d5d35d64d0-r0.0 to 0:5.10.1+5.11-alpha+git0+7c6e9d8f29-r0.0) [version-going-backwards]
qtserialbus-5.10.1+5.11-alpha+gitAUTOINC+7c6e9d8f29: Package version for package qtserialbus-qmlplugins-dbg went backwards which would break package feeds from (0:5.10.1+git0+d5d35d64d0-r0.0 to 0:5.10.1+5.11-alpha+git0+7c6e9d8f29-r0.0) [version-going-backwards]
qtserialbus-5.10.1+5.11-alpha+gitAUTOINC+7c6e9d8f29: Package version for package qtserialbus-qmlplugins went backwards which would break package feeds from (0:5.10.1+git0+d5d35d64d0-r0.0 to 0:5.10.1+5.11-alpha+git0+7c6e9d8f29-r0.0) [version-going-backwards]
qtserialbus-5.10.1+5.11-alpha+gitAUTOINC+7c6e9d8f29: Package version for package qtserialbus-staticdev went backwards which would break package feeds from (0:5.10.1+git0+d5d35d64d0-r0.0 to 0:5.10.1+5.11-alpha+git0+7c6e9d8f29-r0.0) [version-going-backwards]
qtserialbus-5.10.1+5.11-alpha+gitAUTOINC+7c6e9d8f29: Package version for package qtserialbus-tools-dbg went backwards which would break package feeds from (0:5.10.1+git0+d5d35d64d0-r0.0 to 0:5.10.1+5.11-alpha+git0+7c6e9d8f29-r0.0) [version-going-backwards]
qtserialbus-5.10.1+5.11-alpha+gitAUTOINC+7c6e9d8f29: Package version for package qtserialbus-tools went backwards which would break package feeds from (0:5.10.1+git0+d5d35d64d0-r0.0 to 0:5.10.1+5.11-alpha+git0+7c6e9d8f29-r0.0) [version-going-backwards]
qtserialbus-5.10.1+5.11-alpha+gitAUTOINC+7c6e9d8f29: Package version for package qtserialbus went backwards which would break package feeds from (0:5.10.1+git0+d5d35d64d0-r0.0 to 0:5.10.1+5.11-alpha+git0+7c6e9d8f29-r0.0) [version-going-backwards]
qtserialport-5.10.1+5.11-alpha+gitAUTOINC+aee027f581: Package version for package qtserialport-dbg went backwards which would break package feeds from (0:5.10.1+git0+fa688ac5c3-r0.0 to 0:5.10.1+5.11-alpha+git0+aee027f581-r0.0) [version-going-backwards]
qtserialport-5.10.1+5.11-alpha+gitAUTOINC+aee027f581: Package version for package qtserialport-dev went backwards which would break package feeds from (0:5.10.1+git0+fa688ac5c3-r0.0 to 0:5.10.1+5.11-alpha+git0+aee027f581-r0.0) [version-going-backwards]
qtserialport-5.10.1+5.11-alpha+gitAUTOINC+aee027f581: Package version for package qtserialport-doc went backwards which would break package feeds from (0:5.10.1+git0+fa688ac5c3-r0.0 to 0:5.10.1+5.11-alpha+git0+aee027f581-r0.0) [version-going-backwards]
qtserialport-5.10.1+5.11-alpha+gitAUTOINC+aee027f581: Package version for package qtserialport-examples-dbg went backwards which would break package feeds from (0:5.10.1+git0+fa688ac5c3-r0.0 to 0:5.10.1+5.11-alpha+git0+aee027f581-r0.0) [version-going-backwards]
qtserialport-5.10.1+5.11-alpha+gitAUTOINC+aee027f581: Package version for package qtserialport-examples-dev went backwards which would break package feeds from (0:5.10.1+git0+fa688ac5c3-r0.0 to 0:5.10.1+5.11-alpha+git0+aee027f581-r0.0) [version-going-backwards]
qtserialport-5.10.1+5.11-alpha+gitAUTOINC+aee027f581: Package version for package qtserialport-examples-staticdev went backwards which would break package feeds from (0:5.10.1+git0+fa688ac5c3-r0.0 to 0:5.10.1+5.11-alpha+git0+aee027f581-r0.0) [version-going-backwards]
qtserialport-5.10.1+5.11-alpha+gitAUTOINC+aee027f581: Package version for package qtserialport-examples went backwards which would break package feeds from (0:5.10.1+git0+fa688ac5c3-r0.0 to 0:5.10.1+5.11-alpha+git0+aee027f581-r0.0) [version-going-backwards]
qtserialport-5.10.1+5.11-alpha+gitAUTOINC+aee027f581: Package version for package qtserialport-locale went backwards which would break package feeds from (0:5.10.1+git0+fa688ac5c3-r0.0 to 0:5.10.1+5.11-alpha+git0+aee027f581-r0.0) [version-going-backwards]
qtserialport-5.10.1+5.11-alpha+gitAUTOINC+aee027f581: Package version for package qtserialport-mkspecs went backwards which would break package feeds from (0:5.10.1+git0+fa688ac5c3-r0.0 to 0:5.10.1+5.11-alpha+git0+aee027f581-r0.0) [version-going-backwards]
qtserialport-5.10.1+5.11-alpha+gitAUTOINC+aee027f581: Package version for package qtserialport-plugins-dbg went backwards which would break package feeds from (0:5.10.1+git0+fa688ac5c3-r0.0 to 0:5.10.1+5.11-alpha+git0+aee027f581-r0.0) [version-going-backwards]
qtserialport-5.10.1+5.11-alpha+gitAUTOINC+aee027f581: Package version for package qtserialport-plugins went backwards which would break package feeds from (0:5.10.1+git0+fa688ac5c3-r0.0 to 0:5.10.1+5.11-alpha+git0+aee027f581-r0.0) [version-going-backwards]
qtserialport-5.10.1+5.11-alpha+gitAUTOINC+aee027f581: Package version for package qtserialport-qmldesigner went backwards which would break package feeds from (0:5.10.1+git0+fa688ac5c3-r0.0 to 0:5.10.1+5.11-alpha+git0+aee027f581-r0.0) [version-going-backwards]
qtserialport-5.10.1+5.11-alpha+gitAUTOINC+aee027f581: Package version for package qtserialport-qmlplugins-dbg went backwards which would break package feeds from (0:5.10.1+git0+fa688ac5c3-r0.0 to 0:5.10.1+5.11-alpha+git0+aee027f581-r0.0) [version-going-backwards]
qtserialport-5.10.1+5.11-alpha+gitAUTOINC+aee027f581: Package version for package qtserialport-qmlplugins went backwards which would break package feeds from (0:5.10.1+git0+fa688ac5c3-r0.0 to 0:5.10.1+5.11-alpha+git0+aee027f581-r0.0) [version-going-backwards]
qtserialport-5.10.1+5.11-alpha+gitAUTOINC+aee027f581: Package version for package qtserialport-staticdev went backwards which would break package feeds from (0:5.10.1+git0+fa688ac5c3-r0.0 to 0:5.10.1+5.11-alpha+git0+aee027f581-r0.0) [version-going-backwards]
qtserialport-5.10.1+5.11-alpha+gitAUTOINC+aee027f581: Package version for package qtserialport-tools-dbg went backwards which would break package feeds from (0:5.10.1+git0+fa688ac5c3-r0.0 to 0:5.10.1+5.11-alpha+git0+aee027f581-r0.0) [version-going-backwards]
qtserialport-5.10.1+5.11-alpha+gitAUTOINC+aee027f581: Package version for package qtserialport-tools went backwards which would break package feeds from (0:5.10.1+git0+fa688ac5c3-r0.0 to 0:5.10.1+5.11-alpha+git0+aee027f581-r0.0) [version-going-backwards]
qtserialport-5.10.1+5.11-alpha+gitAUTOINC+aee027f581: Package version for package qtserialport went backwards which would break package feeds from (0:5.10.1+git0+fa688ac5c3-r0.0 to 0:5.10.1+5.11-alpha+git0+aee027f581-r0.0) [version-going-backwards]
qtsvg-5.10.1+5.11-alpha+gitAUTOINC+f4554e29a4: Package version for package qtsvg-dbg went backwards which would break package feeds from (0:5.10.1+git0+af35137016-r0.0 to 0:5.10.1+5.11-alpha+git0+f4554e29a4-r0.0) [version-going-backwards]
qtsvg-5.10.1+5.11-alpha+gitAUTOINC+f4554e29a4: Package version for package qtsvg-dev went backwards which would break package feeds from (0:5.10.1+git0+af35137016-r0.0 to 0:5.10.1+5.11-alpha+git0+f4554e29a4-r0.0) [version-going-backwards]
qtsvg-5.10.1+5.11-alpha+gitAUTOINC+f4554e29a4: Package version for package qtsvg-doc went backwards which would break package feeds from (0:5.10.1+git0+af35137016-r0.0 to 0:5.10.1+5.11-alpha+git0+f4554e29a4-r0.0) [version-going-backwards]
qtsvg-5.10.1+5.11-alpha+gitAUTOINC+f4554e29a4: Package version for package qtsvg-examples-dbg went backwards which would break package feeds from (0:5.10.1+git0+af35137016-r0.0 to 0:5.10.1+5.11-alpha+git0+f4554e29a4-r0.0) [version-going-backwards]
qtsvg-5.10.1+5.11-alpha+gitAUTOINC+f4554e29a4: Package version for package qtsvg-examples-dev went backwards which would break package feeds from (0:5.10.1+git0+af35137016-r0.0 to 0:5.10.1+5.11-alpha+git0+f4554e29a4-r0.0) [version-going-backwards]
qtsvg-5.10.1+5.11-alpha+gitAUTOINC+f4554e29a4: Package version for package qtsvg-examples-staticdev went backwards which would break package feeds from (0:5.10.1+git0+af35137016-r0.0 to 0:5.10.1+5.11-alpha+git0+f4554e29a4-r0.0) [version-going-backwards]
qtsvg-5.10.1+5.11-alpha+gitAUTOINC+f4554e29a4: Package version for package qtsvg-examples went backwards which would break package feeds from (0:5.10.1+git0+af35137016-r0.0 to 0:5.10.1+5.11-alpha+git0+f4554e29a4-r0.0) [version-going-backwards]
qtsvg-5.10.1+5.11-alpha+gitAUTOINC+f4554e29a4: Package version for package qtsvg-locale went backwards which would break package feeds from (0:5.10.1+git0+af35137016-r0.0 to 0:5.10.1+5.11-alpha+git0+f4554e29a4-r0.0) [version-going-backwards]
qtsvg-5.10.1+5.11-alpha+gitAUTOINC+f4554e29a4: Package version for package qtsvg-mkspecs went backwards which would break package feeds from (0:5.10.1+git0+af35137016-r0.0 to 0:5.10.1+5.11-alpha+git0+f4554e29a4-r0.0) [version-going-backwards]
qtsvg-5.10.1+5.11-alpha+gitAUTOINC+f4554e29a4: Package version for package qtsvg-plugins-dbg went backwards which would break package feeds from (0:5.10.1+git0+af35137016-r0.0 to 0:5.10.1+5.11-alpha+git0+f4554e29a4-r0.0) [version-going-backwards]
qtsvg-5.10.1+5.11-alpha+gitAUTOINC+f4554e29a4: Package version for package qtsvg-plugins went backwards which would break package feeds from (0:5.10.1+git0+af35137016-r0.0 to 0:5.10.1+5.11-alpha+git0+f4554e29a4-r0.0) [version-going-backwards]
qtsvg-5.10.1+5.11-alpha+gitAUTOINC+f4554e29a4: Package version for package qtsvg-qmldesigner went backwards which would break package feeds from (0:5.10.1+git0+af35137016-r0.0 to 0:5.10.1+5.11-alpha+git0+f4554e29a4-r0.0) [version-going-backwards]
qtsvg-5.10.1+5.11-alpha+gitAUTOINC+f4554e29a4: Package version for package qtsvg-qmlplugins-dbg went backwards which would break package feeds from (0:5.10.1+git0+af35137016-r0.0 to 0:5.10.1+5.11-alpha+git0+f4554e29a4-r0.0) [version-going-backwards]
qtsvg-5.10.1+5.11-alpha+gitAUTOINC+f4554e29a4: Package version for package qtsvg-qmlplugins went backwards which would break package feeds from (0:5.10.1+git0+af35137016-r0.0 to 0:5.10.1+5.11-alpha+git0+f4554e29a4-r0.0) [version-going-backwards]
qtsvg-5.10.1+5.11-alpha+gitAUTOINC+f4554e29a4: Package version for package qtsvg-staticdev went backwards which would break package feeds from (0:5.10.1+git0+af35137016-r0.0 to 0:5.10.1+5.11-alpha+git0+f4554e29a4-r0.0) [version-going-backwards]
qtsvg-5.10.1+5.11-alpha+gitAUTOINC+f4554e29a4: Package version for package qtsvg-tools-dbg went backwards which would break package feeds from (0:5.10.1+git0+af35137016-r0.0 to 0:5.10.1+5.11-alpha+git0+f4554e29a4-r0.0) [version-going-backwards]
qtsvg-5.10.1+5.11-alpha+gitAUTOINC+f4554e29a4: Package version for package qtsvg-tools went backwards which would break package feeds from (0:5.10.1+git0+af35137016-r0.0 to 0:5.10.1+5.11-alpha+git0+f4554e29a4-r0.0) [version-going-backwards]
qtsvg-5.10.1+5.11-alpha+gitAUTOINC+f4554e29a4: Package version for package qtsvg went backwards which would break package feeds from (0:5.10.1+git0+af35137016-r0.0 to 0:5.10.1+5.11-alpha+git0+f4554e29a4-r0.0) [version-going-backwards]
qtsystems-5.10.1+5.11-alpha+gitAUTOINC+66e45676f5: Package version for package qtsystems-dbg went backwards which would break package feeds from (0:5.10.1+git0+66e45676f5-r0.0 to 0:5.10.1+5.11-alpha+git0+66e45676f5-r0.0) [version-going-backwards]
qtsystems-5.10.1+5.11-alpha+gitAUTOINC+66e45676f5: Package version for package qtsystems-dev went backwards which would break package feeds from (0:5.10.1+git0+66e45676f5-r0.0 to 0:5.10.1+5.11-alpha+git0+66e45676f5-r0.0) [version-going-backwards]
qtsystems-5.10.1+5.11-alpha+gitAUTOINC+66e45676f5: Package version for package qtsystems-doc went backwards which would break package feeds from (0:5.10.1+git0+66e45676f5-r0.0 to 0:5.10.1+5.11-alpha+git0+66e45676f5-r0.0) [version-going-backwards]
qtsystems-5.10.1+5.11-alpha+gitAUTOINC+66e45676f5: Package version for package qtsystems-examples-dbg went backwards which would break package feeds from (0:5.10.1+git0+66e45676f5-r0.0 to 0:5.10.1+5.11-alpha+git0+66e45676f5-r0.0) [version-going-backwards]
qtsystems-5.10.1+5.11-alpha+gitAUTOINC+66e45676f5: Package version for package qtsystems-examples-dev went backwards which would break package feeds from (0:5.10.1+git0+66e45676f5-r0.0 to 0:5.10.1+5.11-alpha+git0+66e45676f5-r0.0) [version-going-backwards]
qtsystems-5.10.1+5.11-alpha+gitAUTOINC+66e45676f5: Package version for package qtsystems-examples-staticdev went backwards which would break package feeds from (0:5.10.1+git0+66e45676f5-r0.0 to 0:5.10.1+5.11-alpha+git0+66e45676f5-r0.0) [version-going-backwards]
qtsystems-5.10.1+5.11-alpha+gitAUTOINC+66e45676f5: Package version for package qtsystems-examples went backwards which would break package feeds from (0:5.10.1+git0+66e45676f5-r0.0 to 0:5.10.1+5.11-alpha+git0+66e45676f5-r0.0) [version-going-backwards]
qtsystems-5.10.1+5.11-alpha+gitAUTOINC+66e45676f5: Package version for package qtsystems-locale went backwards which would break package feeds from (0:5.10.1+git0+66e45676f5-r0.0 to 0:5.10.1+5.11-alpha+git0+66e45676f5-r0.0) [version-going-backwards]
qtsystems-5.10.1+5.11-alpha+gitAUTOINC+66e45676f5: Package version for package qtsystems-mkspecs went backwards which would break package feeds from (0:5.10.1+git0+66e45676f5-r0.0 to 0:5.10.1+5.11-alpha+git0+66e45676f5-r0.0) [version-going-backwards]
qtsystems-5.10.1+5.11-alpha+gitAUTOINC+66e45676f5: Package version for package qtsystems-plugins-dbg went backwards which would break package feeds from (0:5.10.1+git0+66e45676f5-r0.0 to 0:5.10.1+5.11-alpha+git0+66e45676f5-r0.0) [version-going-backwards]
qtsystems-5.10.1+5.11-alpha+gitAUTOINC+66e45676f5: Package version for package qtsystems-plugins went backwards which would break package feeds from (0:5.10.1+git0+66e45676f5-r0.0 to 0:5.10.1+5.11-alpha+git0+66e45676f5-r0.0) [version-going-backwards]
qtsystems-5.10.1+5.11-alpha+gitAUTOINC+66e45676f5: Package version for package qtsystems-qmldesigner went backwards which would break package feeds from (0:5.10.1+git0+66e45676f5-r0.0 to 0:5.10.1+5.11-alpha+git0+66e45676f5-r0.0) [version-going-backwards]
qtsystems-5.10.1+5.11-alpha+gitAUTOINC+66e45676f5: Package version for package qtsystems-qmlplugins-dbg went backwards which would break package feeds from (0:5.10.1+git0+66e45676f5-r0.0 to 0:5.10.1+5.11-alpha+git0+66e45676f5-r0.0) [version-going-backwards]
qtsystems-5.10.1+5.11-alpha+gitAUTOINC+66e45676f5: Package version for package qtsystems-qmlplugins went backwards which would break package feeds from (0:5.10.1+git0+66e45676f5-r0.0 to 0:5.10.1+5.11-alpha+git0+66e45676f5-r0.0) [version-going-backwards]
qtsystems-5.10.1+5.11-alpha+gitAUTOINC+66e45676f5: Package version for package qtsystems-staticdev went backwards which would break package feeds from (0:5.10.1+git0+66e45676f5-r0.0 to 0:5.10.1+5.11-alpha+git0+66e45676f5-r0.0) [version-going-backwards]
qtsystems-5.10.1+5.11-alpha+gitAUTOINC+66e45676f5: Package version for package qtsystems-tools-dbg went backwards which would break package feeds from (0:5.10.1+git0+66e45676f5-r0.0 to 0:5.10.1+5.11-alpha+git0+66e45676f5-r0.0) [version-going-backwards]
qtsystems-5.10.1+5.11-alpha+gitAUTOINC+66e45676f5: Package version for package qtsystems-tools went backwards which would break package feeds from (0:5.10.1+git0+66e45676f5-r0.0 to 0:5.10.1+5.11-alpha+git0+66e45676f5-r0.0) [version-going-backwards]
qtsystems-5.10.1+5.11-alpha+gitAUTOINC+66e45676f5: Package version for package qtsystems went backwards which would break package feeds from (0:5.10.1+git0+66e45676f5-r0.0 to 0:5.10.1+5.11-alpha+git0+66e45676f5-r0.0) [version-going-backwards]
qttools-5.10.1+5.11-alpha+gitAUTOINC+c29a1b03fd: Package version for package qttools-dbg went backwards which would break package feeds from (0:5.10.1+git0+03ebf1c3d6-r0.0 to 0:5.10.1+5.11-alpha+git0+c29a1b03fd-r0.0) [version-going-backwards]
qttools-5.10.1+5.11-alpha+gitAUTOINC+c29a1b03fd: Package version for package qttools-dev went backwards which would break package feeds from (0:5.10.1+git0+03ebf1c3d6-r0.0 to 0:5.10.1+5.11-alpha+git0+c29a1b03fd-r0.0) [version-going-backwards]
qttools-5.10.1+5.11-alpha+gitAUTOINC+c29a1b03fd: Package version for package qttools-doc went backwards which would break package feeds from (0:5.10.1+git0+03ebf1c3d6-r0.0 to 0:5.10.1+5.11-alpha+git0+c29a1b03fd-r0.0) [version-going-backwards]
qttools-5.10.1+5.11-alpha+gitAUTOINC+c29a1b03fd: Package version for package qttools-examples-dbg went backwards which would break package feeds from (0:5.10.1+git0+03ebf1c3d6-r0.0 to 0:5.10.1+5.11-alpha+git0+c29a1b03fd-r0.0) [version-going-backwards]
qttools-5.10.1+5.11-alpha+gitAUTOINC+c29a1b03fd: Package version for package qttools-examples-dev went backwards which would break package feeds from (0:5.10.1+git0+03ebf1c3d6-r0.0 to 0:5.10.1+5.11-alpha+git0+c29a1b03fd-r0.0) [version-going-backwards]
qttools-5.10.1+5.11-alpha+gitAUTOINC+c29a1b03fd: Package version for package qttools-examples-staticdev went backwards which would break package feeds from (0:5.10.1+git0+03ebf1c3d6-r0.0 to 0:5.10.1+5.11-alpha+git0+c29a1b03fd-r0.0) [version-going-backwards]
qttools-5.10.1+5.11-alpha+gitAUTOINC+c29a1b03fd: Package version for package qttools-examples went backwards which would break package feeds from (0:5.10.1+git0+03ebf1c3d6-r0.0 to 0:5.10.1+5.11-alpha+git0+c29a1b03fd-r0.0) [version-going-backwards]
qttools-5.10.1+5.11-alpha+gitAUTOINC+c29a1b03fd: Package version for package qttools-locale went backwards which would break package feeds from (0:5.10.1+git0+03ebf1c3d6-r0.0 to 0:5.10.1+5.11-alpha+git0+c29a1b03fd-r0.0) [version-going-backwards]
qttools-5.10.1+5.11-alpha+gitAUTOINC+c29a1b03fd: Package version for package qttools-mkspecs went backwards which would break package feeds from (0:5.10.1+git0+03ebf1c3d6-r0.0 to 0:5.10.1+5.11-alpha+git0+c29a1b03fd-r0.0) [version-going-backwards]
qttools-5.10.1+5.11-alpha+gitAUTOINC+c29a1b03fd: Package version for package qttools-plugins-dbg went backwards which would break package feeds from (0:5.10.1+git0+03ebf1c3d6-r0.0 to 0:5.10.1+5.11-alpha+git0+c29a1b03fd-r0.0) [version-going-backwards]
qttools-5.10.1+5.11-alpha+gitAUTOINC+c29a1b03fd: Package version for package qttools-plugins went backwards which would break package feeds from (0:5.10.1+git0+03ebf1c3d6-r0.0 to 0:5.10.1+5.11-alpha+git0+c29a1b03fd-r0.0) [version-going-backwards]
qttools-5.10.1+5.11-alpha+gitAUTOINC+c29a1b03fd: Package version for package qttools-ptest went backwards which would break package feeds from (0:5.10.1+git0+03ebf1c3d6-r0.0 to 0:5.10.1+5.11-alpha+git0+c29a1b03fd-r0.0) [version-going-backwards]
qttools-5.10.1+5.11-alpha+gitAUTOINC+c29a1b03fd: Package version for package qttools-qmldesigner went backwards which would break package feeds from (0:5.10.1+git0+03ebf1c3d6-r0.0 to 0:5.10.1+5.11-alpha+git0+c29a1b03fd-r0.0) [version-going-backwards]
qttools-5.10.1+5.11-alpha+gitAUTOINC+c29a1b03fd: Package version for package qttools-qmlplugins-dbg went backwards which would break package feeds from (0:5.10.1+git0+03ebf1c3d6-r0.0 to 0:5.10.1+5.11-alpha+git0+c29a1b03fd-r0.0) [version-going-backwards]
qttools-5.10.1+5.11-alpha+gitAUTOINC+c29a1b03fd: Package version for package qttools-qmlplugins went backwards which would break package feeds from (0:5.10.1+git0+03ebf1c3d6-r0.0 to 0:5.10.1+5.11-alpha+git0+c29a1b03fd-r0.0) [version-going-backwards]
qttools-5.10.1+5.11-alpha+gitAUTOINC+c29a1b03fd: Package version for package qttools-staticdev went backwards which would break package feeds from (0:5.10.1+git0+03ebf1c3d6-r0.0 to 0:5.10.1+5.11-alpha+git0+c29a1b03fd-r0.0) [version-going-backwards]
qttools-5.10.1+5.11-alpha+gitAUTOINC+c29a1b03fd: Package version for package qttools-tools-dbg went backwards which would break package feeds from (0:5.10.1+git0+03ebf1c3d6-r0.0 to 0:5.10.1+5.11-alpha+git0+c29a1b03fd-r0.0) [version-going-backwards]
qttools-5.10.1+5.11-alpha+gitAUTOINC+c29a1b03fd: Package version for package qttools-tools went backwards which would break package feeds from (0:5.10.1+git0+03ebf1c3d6-r0.0 to 0:5.10.1+5.11-alpha+git0+c29a1b03fd-r0.0) [version-going-backwards]
qttools-5.10.1+5.11-alpha+gitAUTOINC+c29a1b03fd: Package version for package qttools went backwards which would break package feeds from (0:5.10.1+git0+03ebf1c3d6-r0.0 to 0:5.10.1+5.11-alpha+git0+c29a1b03fd-r0.0) [version-going-backwards]
qttranslations-5.10.1+5.11-alpha+gitAUTOINC+f1c17f060d: Package version for package qttranslations-assistant went backwards which would break package feeds from (0:5.10.1+git0+c3486e072e-r0.0 to 0:5.10.1+5.11-alpha+git0+f1c17f060d-r0.0) [version-going-backwards]
qttranslations-5.10.1+5.11-alpha+gitAUTOINC+f1c17f060d: Package version for package qttranslations-dbg went backwards which would break package feeds from (0:5.10.1+git0+c3486e072e-r0.0 to 0:5.10.1+5.11-alpha+git0+f1c17f060d-r0.0) [version-going-backwards]
qttranslations-5.10.1+5.11-alpha+gitAUTOINC+f1c17f060d: Package version for package qttranslations-designer went backwards which would break package feeds from (0:5.10.1+git0+c3486e072e-r0.0 to 0:5.10.1+5.11-alpha+git0+f1c17f060d-r0.0) [version-going-backwards]
qttranslations-5.10.1+5.11-alpha+gitAUTOINC+f1c17f060d: Package version for package qttranslations-dev went backwards which would break package feeds from (0:5.10.1+git0+c3486e072e-r0.0 to 0:5.10.1+5.11-alpha+git0+f1c17f060d-r0.0) [version-going-backwards]
qttranslations-5.10.1+5.11-alpha+gitAUTOINC+f1c17f060d: Package version for package qttranslations-doc went backwards which would break package feeds from (0:5.10.1+git0+c3486e072e-r0.0 to 0:5.10.1+5.11-alpha+git0+f1c17f060d-r0.0) [version-going-backwards]
qttranslations-5.10.1+5.11-alpha+gitAUTOINC+f1c17f060d: Package version for package qttranslations-examples-dbg went backwards which would break package feeds from (0:5.10.1+git0+c3486e072e-r0.0 to 0:5.10.1+5.11-alpha+git0+f1c17f060d-r0.0) [version-going-backwards]
qttranslations-5.10.1+5.11-alpha+gitAUTOINC+f1c17f060d: Package version for package qttranslations-examples-dev went backwards which would break package feeds from (0:5.10.1+git0+c3486e072e-r0.0 to 0:5.10.1+5.11-alpha+git0+f1c17f060d-r0.0) [version-going-backwards]
qttranslations-5.10.1+5.11-alpha+gitAUTOINC+f1c17f060d: Package version for package qttranslations-examples-staticdev went backwards which would break package feeds from (0:5.10.1+git0+c3486e072e-r0.0 to 0:5.10.1+5.11-alpha+git0+f1c17f060d-r0.0) [version-going-backwards]
qttranslations-5.10.1+5.11-alpha+gitAUTOINC+f1c17f060d: Package version for package qttranslations-examples went backwards which would break package feeds from (0:5.10.1+git0+c3486e072e-r0.0 to 0:5.10.1+5.11-alpha+git0+f1c17f060d-r0.0) [version-going-backwards]
qttranslations-5.10.1+5.11-alpha+gitAUTOINC+f1c17f060d: Package version for package qttranslations-linguist went backwards which would break package feeds from (0:5.10.1+git0+c3486e072e-r0.0 to 0:5.10.1+5.11-alpha+git0+f1c17f060d-r0.0) [version-going-backwards]
qttranslations-5.10.1+5.11-alpha+gitAUTOINC+f1c17f060d: Package version for package qttranslations-locale went backwards which would break package feeds from (0:5.10.1+git0+c3486e072e-r0.0 to 0:5.10.1+5.11-alpha+git0+f1c17f060d-r0.0) [version-going-backwards]
qttranslations-5.10.1+5.11-alpha+gitAUTOINC+f1c17f060d: Package version for package qttranslations-mkspecs went backwards which would break package feeds from (0:5.10.1+git0+c3486e072e-r0.0 to 0:5.10.1+5.11-alpha+git0+f1c17f060d-r0.0) [version-going-backwards]
qttranslations-5.10.1+5.11-alpha+gitAUTOINC+f1c17f060d: Package version for package qttranslations-plugins-dbg went backwards which would break package feeds from (0:5.10.1+git0+c3486e072e-r0.0 to 0:5.10.1+5.11-alpha+git0+f1c17f060d-r0.0) [version-going-backwards]
qttranslations-5.10.1+5.11-alpha+gitAUTOINC+f1c17f060d: Package version for package qttranslations-plugins went backwards which would break package feeds from (0:5.10.1+git0+c3486e072e-r0.0 to 0:5.10.1+5.11-alpha+git0+f1c17f060d-r0.0) [version-going-backwards]
qttranslations-5.10.1+5.11-alpha+gitAUTOINC+f1c17f060d: Package version for package qttranslations-qmldesigner went backwards which would break package feeds from (0:5.10.1+git0+c3486e072e-r0.0 to 0:5.10.1+5.11-alpha+git0+f1c17f060d-r0.0) [version-going-backwards]
qttranslations-5.10.1+5.11-alpha+gitAUTOINC+f1c17f060d: Package version for package qttranslations-qmlplugins-dbg went backwards which would break package feeds from (0:5.10.1+git0+c3486e072e-r0.0 to 0:5.10.1+5.11-alpha+git0+f1c17f060d-r0.0) [version-going-backwards]
qttranslations-5.10.1+5.11-alpha+gitAUTOINC+f1c17f060d: Package version for package qttranslations-qmlplugins went backwards which would break package feeds from (0:5.10.1+git0+c3486e072e-r0.0 to 0:5.10.1+5.11-alpha+git0+f1c17f060d-r0.0) [version-going-backwards]
qttranslations-5.10.1+5.11-alpha+gitAUTOINC+f1c17f060d: Package version for package qttranslations-qmlviewer went backwards which would break package feeds from (0:5.10.1+git0+c3486e072e-r0.0 to 0:5.10.1+5.11-alpha+git0+f1c17f060d-r0.0) [version-going-backwards]
qttranslations-5.10.1+5.11-alpha+gitAUTOINC+f1c17f060d: Package version for package qttranslations-qtbase went backwards which would break package feeds from (0:5.10.1+git0+c3486e072e-r0.0 to 0:5.10.1+5.11-alpha+git0+f1c17f060d-r0.0) [version-going-backwards]
qttranslations-5.10.1+5.11-alpha+gitAUTOINC+f1c17f060d: Package version for package qttranslations-qtconfig went backwards which would break package feeds from (0:5.10.1+git0+c3486e072e-r0.0 to 0:5.10.1+5.11-alpha+git0+f1c17f060d-r0.0) [version-going-backwards]
qttranslations-5.10.1+5.11-alpha+gitAUTOINC+f1c17f060d: Package version for package qttranslations-qtconnectivity went backwards which would break package feeds from (0:5.10.1+git0+c3486e072e-r0.0 to 0:5.10.1+5.11-alpha+git0+f1c17f060d-r0.0) [version-going-backwards]
qttranslations-5.10.1+5.11-alpha+gitAUTOINC+f1c17f060d: Package version for package qttranslations-qtdeclarative went backwards which would break package feeds from (0:5.10.1+git0+c3486e072e-r0.0 to 0:5.10.1+5.11-alpha+git0+f1c17f060d-r0.0) [version-going-backwards]
qttranslations-5.10.1+5.11-alpha+gitAUTOINC+f1c17f060d: Package version for package qttranslations-qthelp went backwards which would break package feeds from (0:5.10.1+git0+c3486e072e-r0.0 to 0:5.10.1+5.11-alpha+git0+f1c17f060d-r0.0) [version-going-backwards]
qttranslations-5.10.1+5.11-alpha+gitAUTOINC+f1c17f060d: Package version for package qttranslations-qtlocation went backwards which would break package feeds from (0:5.10.1+git0+c3486e072e-r0.0 to 0:5.10.1+5.11-alpha+git0+f1c17f060d-r0.0) [version-going-backwards]
qttranslations-5.10.1+5.11-alpha+gitAUTOINC+f1c17f060d: Package version for package qttranslations-qtmultimedia went backwards which would break package feeds from (0:5.10.1+git0+c3486e072e-r0.0 to 0:5.10.1+5.11-alpha+git0+f1c17f060d-r0.0) [version-going-backwards]
qttranslations-5.10.1+5.11-alpha+gitAUTOINC+f1c17f060d: Package version for package qttranslations-qtquick1 went backwards which would break package feeds from (0:5.10.1+git0+c3486e072e-r0.0 to 0:5.10.1+5.11-alpha+git0+f1c17f060d-r0.0) [version-going-backwards]
qttranslations-5.10.1+5.11-alpha+gitAUTOINC+f1c17f060d: Package version for package qttranslations-qtquickcontrols2 went backwards which would break package feeds from (0:5.10.1+git0+c3486e072e-r0.0 to 0:5.10.1+5.11-alpha+git0+f1c17f060d-r0.0) [version-going-backwards]
qttranslations-5.10.1+5.11-alpha+gitAUTOINC+f1c17f060d: Package version for package qttranslations-qtquickcontrols went backwards which would break package feeds from (0:5.10.1+git0+c3486e072e-r0.0 to 0:5.10.1+5.11-alpha+git0+f1c17f060d-r0.0) [version-going-backwards]
qttranslations-5.10.1+5.11-alpha+gitAUTOINC+f1c17f060d: Package version for package qttranslations-qtscript went backwards which would break package feeds from (0:5.10.1+git0+c3486e072e-r0.0 to 0:5.10.1+5.11-alpha+git0+f1c17f060d-r0.0) [version-going-backwards]
qttranslations-5.10.1+5.11-alpha+gitAUTOINC+f1c17f060d: Package version for package qttranslations-qtserialport went backwards which would break package feeds from (0:5.10.1+git0+c3486e072e-r0.0 to 0:5.10.1+5.11-alpha+git0+f1c17f060d-r0.0) [version-going-backwards]
qttranslations-5.10.1+5.11-alpha+gitAUTOINC+f1c17f060d: Package version for package qttranslations-qtwebengine went backwards which would break package feeds from (0:5.10.1+git0+c3486e072e-r0.0 to 0:5.10.1+5.11-alpha+git0+f1c17f060d-r0.0) [version-going-backwards]
qttranslations-5.10.1+5.11-alpha+gitAUTOINC+f1c17f060d: Package version for package qttranslations-qtwebsockets went backwards which would break package feeds from (0:5.10.1+git0+c3486e072e-r0.0 to 0:5.10.1+5.11-alpha+git0+f1c17f060d-r0.0) [version-going-backwards]
qttranslations-5.10.1+5.11-alpha+gitAUTOINC+f1c17f060d: Package version for package qttranslations-qt went backwards which would break package feeds from (0:5.10.1+git0+c3486e072e-r0.0 to 0:5.10.1+5.11-alpha+git0+f1c17f060d-r0.0) [version-going-backwards]
qttranslations-5.10.1+5.11-alpha+gitAUTOINC+f1c17f060d: Package version for package qttranslations-qtxmlpatterns went backwards which would break package feeds from (0:5.10.1+git0+c3486e072e-r0.0 to 0:5.10.1+5.11-alpha+git0+f1c17f060d-r0.0) [version-going-backwards]
qttranslations-5.10.1+5.11-alpha+gitAUTOINC+f1c17f060d: Package version for package qttranslations-staticdev went backwards which would break package feeds from (0:5.10.1+git0+c3486e072e-r0.0 to 0:5.10.1+5.11-alpha+git0+f1c17f060d-r0.0) [version-going-backwards]
qttranslations-5.10.1+5.11-alpha+gitAUTOINC+f1c17f060d: Package version for package qttranslations-tools-dbg went backwards which would break package feeds from (0:5.10.1+git0+c3486e072e-r0.0 to 0:5.10.1+5.11-alpha+git0+f1c17f060d-r0.0) [version-going-backwards]
qttranslations-5.10.1+5.11-alpha+gitAUTOINC+f1c17f060d: Package version for package qttranslations-tools went backwards which would break package feeds from (0:5.10.1+git0+c3486e072e-r0.0 to 0:5.10.1+5.11-alpha+git0+f1c17f060d-r0.0) [version-going-backwards]
qttranslations-5.10.1+5.11-alpha+gitAUTOINC+f1c17f060d: Package version for package qttranslations went backwards which would break package feeds from (0:5.10.1+git0+c3486e072e-r0.0 to 0:5.10.1+5.11-alpha+git0+f1c17f060d-r0.0) [version-going-backwards]
qtvirtualkeyboard-5.10.1+5.11-alpha+gitAUTOINC+9055bd5665: Package version for package qtvirtualkeyboard-dbg went backwards which would break package feeds from (0:5.10.1+git0+85d35bb122-r0.0 to 0:5.10.1+5.11-alpha+git0+9055bd5665-r0.0) [version-going-backwards]
qtvirtualkeyboard-5.10.1+5.11-alpha+gitAUTOINC+9055bd5665: Package version for package qtvirtualkeyboard-dev went backwards which would break package feeds from (0:5.10.1+git0+85d35bb122-r0.0 to 0:5.10.1+5.11-alpha+git0+9055bd5665-r0.0) [version-going-backwards]
qtvirtualkeyboard-5.10.1+5.11-alpha+gitAUTOINC+9055bd5665: Package version for package qtvirtualkeyboard-dictionaries went backwards which would break package feeds from (0:5.10.1+git0+85d35bb122-r0.0 to 0:5.10.1+5.11-alpha+git0+9055bd5665-r0.0) [version-going-backwards]
qtvirtualkeyboard-5.10.1+5.11-alpha+gitAUTOINC+9055bd5665: Package version for package qtvirtualkeyboard-doc went backwards which would break package feeds from (0:5.10.1+git0+85d35bb122-r0.0 to 0:5.10.1+5.11-alpha+git0+9055bd5665-r0.0) [version-going-backwards]
qtvirtualkeyboard-5.10.1+5.11-alpha+gitAUTOINC+9055bd5665: Package version for package qtvirtualkeyboard-examples-dbg went backwards which would break package feeds from (0:5.10.1+git0+85d35bb122-r0.0 to 0:5.10.1+5.11-alpha+git0+9055bd5665-r0.0) [version-going-backwards]
qtvirtualkeyboard-5.10.1+5.11-alpha+gitAUTOINC+9055bd5665: Package version for package qtvirtualkeyboard-examples-dev went backwards which would break package feeds from (0:5.10.1+git0+85d35bb122-r0.0 to 0:5.10.1+5.11-alpha+git0+9055bd5665-r0.0) [version-going-backwards]
qtvirtualkeyboard-5.10.1+5.11-alpha+gitAUTOINC+9055bd5665: Package version for package qtvirtualkeyboard-examples-staticdev went backwards which would break package feeds from (0:5.10.1+git0+85d35bb122-r0.0 to 0:5.10.1+5.11-alpha+git0+9055bd5665-r0.0) [version-going-backwards]
qtvirtualkeyboard-5.10.1+5.11-alpha+gitAUTOINC+9055bd5665: Package version for package qtvirtualkeyboard-examples went backwards which would break package feeds from (0:5.10.1+git0+85d35bb122-r0.0 to 0:5.10.1+5.11-alpha+git0+9055bd5665-r0.0) [version-going-backwards]
qtvirtualkeyboard-5.10.1+5.11-alpha+gitAUTOINC+9055bd5665: Package version for package qtvirtualkeyboard-locale went backwards which would break package feeds from (0:5.10.1+git0+85d35bb122-r0.0 to 0:5.10.1+5.11-alpha+git0+9055bd5665-r0.0) [version-going-backwards]
qtvirtualkeyboard-5.10.1+5.11-alpha+gitAUTOINC+9055bd5665: Package version for package qtvirtualkeyboard-mkspecs went backwards which would break package feeds from (0:5.10.1+git0+85d35bb122-r0.0 to 0:5.10.1+5.11-alpha+git0+9055bd5665-r0.0) [version-going-backwards]
qtvirtualkeyboard-5.10.1+5.11-alpha+gitAUTOINC+9055bd5665: Package version for package qtvirtualkeyboard-plugins-dbg went backwards which would break package feeds from (0:5.10.1+git0+85d35bb122-r0.0 to 0:5.10.1+5.11-alpha+git0+9055bd5665-r0.0) [version-going-backwards]
qtvirtualkeyboard-5.10.1+5.11-alpha+gitAUTOINC+9055bd5665: Package version for package qtvirtualkeyboard-plugins went backwards which would break package feeds from (0:5.10.1+git0+85d35bb122-r0.0 to 0:5.10.1+5.11-alpha+git0+9055bd5665-r0.0) [version-going-backwards]
qtvirtualkeyboard-5.10.1+5.11-alpha+gitAUTOINC+9055bd5665: Package version for package qtvirtualkeyboard-qmldesigner went backwards which would break package feeds from (0:5.10.1+git0+85d35bb122-r0.0 to 0:5.10.1+5.11-alpha+git0+9055bd5665-r0.0) [version-going-backwards]
qtvirtualkeyboard-5.10.1+5.11-alpha+gitAUTOINC+9055bd5665: Package version for package qtvirtualkeyboard-qmlplugins-dbg went backwards which would break package feeds from (0:5.10.1+git0+85d35bb122-r0.0 to 0:5.10.1+5.11-alpha+git0+9055bd5665-r0.0) [version-going-backwards]
qtvirtualkeyboard-5.10.1+5.11-alpha+gitAUTOINC+9055bd5665: Package version for package qtvirtualkeyboard-qmlplugins went backwards which would break package feeds from (0:5.10.1+git0+85d35bb122-r0.0 to 0:5.10.1+5.11-alpha+git0+9055bd5665-r0.0) [version-going-backwards]
qtvirtualkeyboard-5.10.1+5.11-alpha+gitAUTOINC+9055bd5665: Package version for package qtvirtualkeyboard-staticdev went backwards which would break package feeds from (0:5.10.1+git0+85d35bb122-r0.0 to 0:5.10.1+5.11-alpha+git0+9055bd5665-r0.0) [version-going-backwards]
qtvirtualkeyboard-5.10.1+5.11-alpha+gitAUTOINC+9055bd5665: Package version for package qtvirtualkeyboard-tools-dbg went backwards which would break package feeds from (0:5.10.1+git0+85d35bb122-r0.0 to 0:5.10.1+5.11-alpha+git0+9055bd5665-r0.0) [version-going-backwards]
qtvirtualkeyboard-5.10.1+5.11-alpha+gitAUTOINC+9055bd5665: Package version for package qtvirtualkeyboard-tools went backwards which would break package feeds from (0:5.10.1+git0+85d35bb122-r0.0 to 0:5.10.1+5.11-alpha+git0+9055bd5665-r0.0) [version-going-backwards]
qtvirtualkeyboard-5.10.1+5.11-alpha+gitAUTOINC+9055bd5665: Package version for package qtvirtualkeyboard went backwards which would break package feeds from (0:5.10.1+git0+85d35bb122-r0.0 to 0:5.10.1+5.11-alpha+git0+9055bd5665-r0.0) [version-going-backwards]
qtwayland-5.10.1+5.11-alpha+gitAUTOINC+ec495c9818: Package version for package qtwayland-dbg went backwards which would break package feeds from (0:5.10.1+git0+db36bc0d9c-r0.0 to 0:5.10.1+5.11-alpha+git0+ec495c9818-r0.0) [version-going-backwards]
qtwayland-5.10.1+5.11-alpha+gitAUTOINC+ec495c9818: Package version for package qtwayland-dev went backwards which would break package feeds from (0:5.10.1+git0+db36bc0d9c-r0.0 to 0:5.10.1+5.11-alpha+git0+ec495c9818-r0.0) [version-going-backwards]
qtwayland-5.10.1+5.11-alpha+gitAUTOINC+ec495c9818: Package version for package qtwayland-doc went backwards which would break package feeds from (0:5.10.1+git0+db36bc0d9c-r0.0 to 0:5.10.1+5.11-alpha+git0+ec495c9818-r0.0) [version-going-backwards]
qtwayland-5.10.1+5.11-alpha+gitAUTOINC+ec495c9818: Package version for package qtwayland-examples-dbg went backwards which would break package feeds from (0:5.10.1+git0+db36bc0d9c-r0.0 to 0:5.10.1+5.11-alpha+git0+ec495c9818-r0.0) [version-going-backwards]
qtwayland-5.10.1+5.11-alpha+gitAUTOINC+ec495c9818: Package version for package qtwayland-examples-dev went backwards which would break package feeds from (0:5.10.1+git0+db36bc0d9c-r0.0 to 0:5.10.1+5.11-alpha+git0+ec495c9818-r0.0) [version-going-backwards]
qtwayland-5.10.1+5.11-alpha+gitAUTOINC+ec495c9818: Package version for package qtwayland-examples-staticdev went backwards which would break package feeds from (0:5.10.1+git0+db36bc0d9c-r0.0 to 0:5.10.1+5.11-alpha+git0+ec495c9818-r0.0) [version-going-backwards]
qtwayland-5.10.1+5.11-alpha+gitAUTOINC+ec495c9818: Package version for package qtwayland-examples went backwards which would break package feeds from (0:5.10.1+git0+db36bc0d9c-r0.0 to 0:5.10.1+5.11-alpha+git0+ec495c9818-r0.0) [version-going-backwards]
qtwayland-5.10.1+5.11-alpha+gitAUTOINC+ec495c9818: Package version for package qtwayland-locale went backwards which would break package feeds from (0:5.10.1+git0+db36bc0d9c-r0.0 to 0:5.10.1+5.11-alpha+git0+ec495c9818-r0.0) [version-going-backwards]
qtwayland-5.10.1+5.11-alpha+gitAUTOINC+ec495c9818: Package version for package qtwayland-mkspecs went backwards which would break package feeds from (0:5.10.1+git0+db36bc0d9c-r0.0 to 0:5.10.1+5.11-alpha+git0+ec495c9818-r0.0) [version-going-backwards]
qtwayland-5.10.1+5.11-alpha+gitAUTOINC+ec495c9818: Package version for package qtwayland-plugins-dbg went backwards which would break package feeds from (0:5.10.1+git0+db36bc0d9c-r0.0 to 0:5.10.1+5.11-alpha+git0+ec495c9818-r0.0) [version-going-backwards]
qtwayland-5.10.1+5.11-alpha+gitAUTOINC+ec495c9818: Package version for package qtwayland-plugins went backwards which would break package feeds from (0:5.10.1+git0+db36bc0d9c-r0.0 to 0:5.10.1+5.11-alpha+git0+ec495c9818-r0.0) [version-going-backwards]
qtwayland-5.10.1+5.11-alpha+gitAUTOINC+ec495c9818: Package version for package qtwayland-qmldesigner went backwards which would break package feeds from (0:5.10.1+git0+db36bc0d9c-r0.0 to 0:5.10.1+5.11-alpha+git0+ec495c9818-r0.0) [version-going-backwards]
qtwayland-5.10.1+5.11-alpha+gitAUTOINC+ec495c9818: Package version for package qtwayland-qmlplugins-dbg went backwards which would break package feeds from (0:5.10.1+git0+db36bc0d9c-r0.0 to 0:5.10.1+5.11-alpha+git0+ec495c9818-r0.0) [version-going-backwards]
qtwayland-5.10.1+5.11-alpha+gitAUTOINC+ec495c9818: Package version for package qtwayland-qmlplugins went backwards which would break package feeds from (0:5.10.1+git0+db36bc0d9c-r0.0 to 0:5.10.1+5.11-alpha+git0+ec495c9818-r0.0) [version-going-backwards]
qtwayland-5.10.1+5.11-alpha+gitAUTOINC+ec495c9818: Package version for package qtwayland-staticdev went backwards which would break package feeds from (0:5.10.1+git0+db36bc0d9c-r0.0 to 0:5.10.1+5.11-alpha+git0+ec495c9818-r0.0) [version-going-backwards]
qtwayland-5.10.1+5.11-alpha+gitAUTOINC+ec495c9818: Package version for package qtwayland-tools-dbg went backwards which would break package feeds from (0:5.10.1+git0+db36bc0d9c-r0.0 to 0:5.10.1+5.11-alpha+git0+ec495c9818-r0.0) [version-going-backwards]
qtwayland-5.10.1+5.11-alpha+gitAUTOINC+ec495c9818: Package version for package qtwayland-tools went backwards which would break package feeds from (0:5.10.1+git0+db36bc0d9c-r0.0 to 0:5.10.1+5.11-alpha+git0+ec495c9818-r0.0) [version-going-backwards]
qtwayland-5.10.1+5.11-alpha+gitAUTOINC+ec495c9818: Package version for package qtwayland went backwards which would break package feeds from (0:5.10.1+git0+db36bc0d9c-r0.0 to 0:5.10.1+5.11-alpha+git0+ec495c9818-r0.0) [version-going-backwards]
qtwebchannel-5.10.1+5.11-alpha+gitAUTOINC+01241eb370: Package version for package qtwebchannel-dbg went backwards which would break package feeds from (0:5.10.1+git0+7540a85c82-r0.0 to 0:5.10.1+5.11-alpha+git0+01241eb370-r0.0) [version-going-backwards]
qtwebchannel-5.10.1+5.11-alpha+gitAUTOINC+01241eb370: Package version for package qtwebchannel-dev went backwards which would break package feeds from (0:5.10.1+git0+7540a85c82-r0.0 to 0:5.10.1+5.11-alpha+git0+01241eb370-r0.0) [version-going-backwards]
qtwebchannel-5.10.1+5.11-alpha+gitAUTOINC+01241eb370: Package version for package qtwebchannel-doc went backwards which would break package feeds from (0:5.10.1+git0+7540a85c82-r0.0 to 0:5.10.1+5.11-alpha+git0+01241eb370-r0.0) [version-going-backwards]
qtwebchannel-5.10.1+5.11-alpha+gitAUTOINC+01241eb370: Package version for package qtwebchannel-examples-dbg went backwards which would break package feeds from (0:5.10.1+git0+7540a85c82-r0.0 to 0:5.10.1+5.11-alpha+git0+01241eb370-r0.0) [version-going-backwards]
qtwebchannel-5.10.1+5.11-alpha+gitAUTOINC+01241eb370: Package version for package qtwebchannel-examples-dev went backwards which would break package feeds from (0:5.10.1+git0+7540a85c82-r0.0 to 0:5.10.1+5.11-alpha+git0+01241eb370-r0.0) [version-going-backwards]
qtwebchannel-5.10.1+5.11-alpha+gitAUTOINC+01241eb370: Package version for package qtwebchannel-examples-staticdev went backwards which would break package feeds from (0:5.10.1+git0+7540a85c82-r0.0 to 0:5.10.1+5.11-alpha+git0+01241eb370-r0.0) [version-going-backwards]
qtwebchannel-5.10.1+5.11-alpha+gitAUTOINC+01241eb370: Package version for package qtwebchannel-examples went backwards which would break package feeds from (0:5.10.1+git0+7540a85c82-r0.0 to 0:5.10.1+5.11-alpha+git0+01241eb370-r0.0) [version-going-backwards]
qtwebchannel-5.10.1+5.11-alpha+gitAUTOINC+01241eb370: Package version for package qtwebchannel-locale went backwards which would break package feeds from (0:5.10.1+git0+7540a85c82-r0.0 to 0:5.10.1+5.11-alpha+git0+01241eb370-r0.0) [version-going-backwards]
qtwebchannel-5.10.1+5.11-alpha+gitAUTOINC+01241eb370: Package version for package qtwebchannel-mkspecs went backwards which would break package feeds from (0:5.10.1+git0+7540a85c82-r0.0 to 0:5.10.1+5.11-alpha+git0+01241eb370-r0.0) [version-going-backwards]
qtwebchannel-5.10.1+5.11-alpha+gitAUTOINC+01241eb370: Package version for package qtwebchannel-plugins-dbg went backwards which would break package feeds from (0:5.10.1+git0+7540a85c82-r0.0 to 0:5.10.1+5.11-alpha+git0+01241eb370-r0.0) [version-going-backwards]
qtwebchannel-5.10.1+5.11-alpha+gitAUTOINC+01241eb370: Package version for package qtwebchannel-plugins went backwards which would break package feeds from (0:5.10.1+git0+7540a85c82-r0.0 to 0:5.10.1+5.11-alpha+git0+01241eb370-r0.0) [version-going-backwards]
qtwebchannel-5.10.1+5.11-alpha+gitAUTOINC+01241eb370: Package version for package qtwebchannel-qmldesigner went backwards which would break package feeds from (0:5.10.1+git0+7540a85c82-r0.0 to 0:5.10.1+5.11-alpha+git0+01241eb370-r0.0) [version-going-backwards]
qtwebchannel-5.10.1+5.11-alpha+gitAUTOINC+01241eb370: Package version for package qtwebchannel-qmlplugins-dbg went backwards which would break package feeds from (0:5.10.1+git0+7540a85c82-r0.0 to 0:5.10.1+5.11-alpha+git0+01241eb370-r0.0) [version-going-backwards]
qtwebchannel-5.10.1+5.11-alpha+gitAUTOINC+01241eb370: Package version for package qtwebchannel-qmlplugins went backwards which would break package feeds from (0:5.10.1+git0+7540a85c82-r0.0 to 0:5.10.1+5.11-alpha+git0+01241eb370-r0.0) [version-going-backwards]
qtwebchannel-5.10.1+5.11-alpha+gitAUTOINC+01241eb370: Package version for package qtwebchannel-staticdev went backwards which would break package feeds from (0:5.10.1+git0+7540a85c82-r0.0 to 0:5.10.1+5.11-alpha+git0+01241eb370-r0.0) [version-going-backwards]
qtwebchannel-5.10.1+5.11-alpha+gitAUTOINC+01241eb370: Package version for package qtwebchannel-tools-dbg went backwards which would break package feeds from (0:5.10.1+git0+7540a85c82-r0.0 to 0:5.10.1+5.11-alpha+git0+01241eb370-r0.0) [version-going-backwards]
qtwebchannel-5.10.1+5.11-alpha+gitAUTOINC+01241eb370: Package version for package qtwebchannel-tools went backwards which would break package feeds from (0:5.10.1+git0+7540a85c82-r0.0 to 0:5.10.1+5.11-alpha+git0+01241eb370-r0.0) [version-going-backwards]
qtwebchannel-5.10.1+5.11-alpha+gitAUTOINC+01241eb370: Package version for package qtwebchannel went backwards which would break package feeds from (0:5.10.1+git0+7540a85c82-r0.0 to 0:5.10.1+5.11-alpha+git0+01241eb370-r0.0) [version-going-backwards]
qtwebengine-5.10.1+5.11-alpha+gitAUTOINC+732d09331c_3fa04d2288: Package version for package qtwebengine-dbg went backwards which would break package feeds from (0:5.10.1+git0+9dc8dff7a8_c858cc7609-r0.0 to 0:5.10.1+5.11-alpha+git0+732d09331c_3fa04d2288-r0.0) [version-going-backwards]
qtwebengine-5.10.1+5.11-alpha+gitAUTOINC+732d09331c_3fa04d2288: Package version for package qtwebengine-dev went backwards which would break package feeds from (0:5.10.1+git0+9dc8dff7a8_c858cc7609-r0.0 to 0:5.10.1+5.11-alpha+git0+732d09331c_3fa04d2288-r0.0) [version-going-backwards]
qtwebengine-5.10.1+5.11-alpha+gitAUTOINC+732d09331c_3fa04d2288: Package version for package qtwebengine-doc went backwards which would break package feeds from (0:5.10.1+git0+9dc8dff7a8_c858cc7609-r0.0 to 0:5.10.1+5.11-alpha+git0+732d09331c_3fa04d2288-r0.0) [version-going-backwards]
qtwebengine-5.10.1+5.11-alpha+gitAUTOINC+732d09331c_3fa04d2288: Package version for package qtwebengine-examples-dbg went backwards which would break package feeds from (0:5.10.1+git0+9dc8dff7a8_c858cc7609-r0.0 to 0:5.10.1+5.11-alpha+git0+732d09331c_3fa04d2288-r0.0) [version-going-backwards]
qtwebengine-5.10.1+5.11-alpha+gitAUTOINC+732d09331c_3fa04d2288: Package version for package qtwebengine-examples-dev went backwards which would break package feeds from (0:5.10.1+git0+9dc8dff7a8_c858cc7609-r0.0 to 0:5.10.1+5.11-alpha+git0+732d09331c_3fa04d2288-r0.0) [version-going-backwards]
qtwebengine-5.10.1+5.11-alpha+gitAUTOINC+732d09331c_3fa04d2288: Package version for package qtwebengine-examples-staticdev went backwards which would break package feeds from (0:5.10.1+git0+9dc8dff7a8_c858cc7609-r0.0 to 0:5.10.1+5.11-alpha+git0+732d09331c_3fa04d2288-r0.0) [version-going-backwards]
qtwebengine-5.10.1+5.11-alpha+gitAUTOINC+732d09331c_3fa04d2288: Package version for package qtwebengine-examples went backwards which would break package feeds from (0:5.10.1+git0+9dc8dff7a8_c858cc7609-r0.0 to 0:5.10.1+5.11-alpha+git0+732d09331c_3fa04d2288-r0.0) [version-going-backwards]
qtwebengine-5.10.1+5.11-alpha+gitAUTOINC+732d09331c_3fa04d2288: Package version for package qtwebengine-locale went backwards which would break package feeds from (0:5.10.1+git0+9dc8dff7a8_c858cc7609-r0.0 to 0:5.10.1+5.11-alpha+git0+732d09331c_3fa04d2288-r0.0) [version-going-backwards]
qtwebengine-5.10.1+5.11-alpha+gitAUTOINC+732d09331c_3fa04d2288: Package version for package qtwebengine-mkspecs went backwards which would break package feeds from (0:5.10.1+git0+9dc8dff7a8_c858cc7609-r0.0 to 0:5.10.1+5.11-alpha+git0+732d09331c_3fa04d2288-r0.0) [version-going-backwards]
qtwebengine-5.10.1+5.11-alpha+gitAUTOINC+732d09331c_3fa04d2288: Package version for package qtwebengine-plugins-dbg went backwards which would break package feeds from (0:5.10.1+git0+9dc8dff7a8_c858cc7609-r0.0 to 0:5.10.1+5.11-alpha+git0+732d09331c_3fa04d2288-r0.0) [version-going-backwards]
qtwebengine-5.10.1+5.11-alpha+gitAUTOINC+732d09331c_3fa04d2288: Package version for package qtwebengine-plugins went backwards which would break package feeds from (0:5.10.1+git0+9dc8dff7a8_c858cc7609-r0.0 to 0:5.10.1+5.11-alpha+git0+732d09331c_3fa04d2288-r0.0) [version-going-backwards]
qtwebengine-5.10.1+5.11-alpha+gitAUTOINC+732d09331c_3fa04d2288: Package version for package qtwebengine-qmldesigner went backwards which would break package feeds from (0:5.10.1+git0+9dc8dff7a8_c858cc7609-r0.0 to 0:5.10.1+5.11-alpha+git0+732d09331c_3fa04d2288-r0.0) [version-going-backwards]
qtwebengine-5.10.1+5.11-alpha+gitAUTOINC+732d09331c_3fa04d2288: Package version for package qtwebengine-qmlplugins-dbg went backwards which would break package feeds from (0:5.10.1+git0+9dc8dff7a8_c858cc7609-r0.0 to 0:5.10.1+5.11-alpha+git0+732d09331c_3fa04d2288-r0.0) [version-going-backwards]
qtwebengine-5.10.1+5.11-alpha+gitAUTOINC+732d09331c_3fa04d2288: Package version for package qtwebengine-qmlplugins went backwards which would break package feeds from (0:5.10.1+git0+9dc8dff7a8_c858cc7609-r0.0 to 0:5.10.1+5.11-alpha+git0+732d09331c_3fa04d2288-r0.0) [version-going-backwards]
qtwebengine-5.10.1+5.11-alpha+gitAUTOINC+732d09331c_3fa04d2288: Package version for package qtwebengine-staticdev went backwards which would break package feeds from (0:5.10.1+git0+9dc8dff7a8_c858cc7609-r0.0 to 0:5.10.1+5.11-alpha+git0+732d09331c_3fa04d2288-r0.0) [version-going-backwards]
qtwebengine-5.10.1+5.11-alpha+gitAUTOINC+732d09331c_3fa04d2288: Package version for package qtwebengine-tools-dbg went backwards which would break package feeds from (0:5.10.1+git0+9dc8dff7a8_c858cc7609-r0.0 to 0:5.10.1+5.11-alpha+git0+732d09331c_3fa04d2288-r0.0) [version-going-backwards]
qtwebengine-5.10.1+5.11-alpha+gitAUTOINC+732d09331c_3fa04d2288: Package version for package qtwebengine-tools went backwards which would break package feeds from (0:5.10.1+git0+9dc8dff7a8_c858cc7609-r0.0 to 0:5.10.1+5.11-alpha+git0+732d09331c_3fa04d2288-r0.0) [version-going-backwards]
qtwebengine-5.10.1+5.11-alpha+gitAUTOINC+732d09331c_3fa04d2288: Package version for package qtwebengine went backwards which would break package feeds from (0:5.10.1+git0+9dc8dff7a8_c858cc7609-r0.0 to 0:5.10.1+5.11-alpha+git0+732d09331c_3fa04d2288-r0.0) [version-going-backwards]
qtwebkit-5.10.1+5.11-alpha+gitAUTOINC+beaeeb9988: Package version for package qtwebkit-dbg went backwards which would break package feeds from (0:5.10.1+git0+97c4a80a12-r0.0 to 0:5.10.1+5.11-alpha+git0+beaeeb9988-r0.0) [version-going-backwards]
qtwebkit-5.10.1+5.11-alpha+gitAUTOINC+beaeeb9988: Package version for package qtwebkit-dev went backwards which would break package feeds from (0:5.10.1+git0+97c4a80a12-r0.0 to 0:5.10.1+5.11-alpha+git0+beaeeb9988-r0.0) [version-going-backwards]
qtwebkit-5.10.1+5.11-alpha+gitAUTOINC+beaeeb9988: Package version for package qtwebkit-doc went backwards which would break package feeds from (0:5.10.1+git0+97c4a80a12-r0.0 to 0:5.10.1+5.11-alpha+git0+beaeeb9988-r0.0) [version-going-backwards]
qtwebkit-5.10.1+5.11-alpha+gitAUTOINC+beaeeb9988: Package version for package qtwebkit-locale went backwards which would break package feeds from (0:5.10.1+git0+97c4a80a12-r0.0 to 0:5.10.1+5.11-alpha+git0+beaeeb9988-r0.0) [version-going-backwards]
qtwebkit-5.10.1+5.11-alpha+gitAUTOINC+beaeeb9988: Package version for package qtwebkit-mkspecs went backwards which would break package feeds from (0:5.10.1+git0+97c4a80a12-r0.0 to 0:5.10.1+5.11-alpha+git0+beaeeb9988-r0.0) [version-going-backwards]
qtwebkit-5.10.1+5.11-alpha+gitAUTOINC+beaeeb9988: Package version for package qtwebkit-plugins-dbg went backwards which would break package feeds from (0:5.10.1+git0+97c4a80a12-r0.0 to 0:5.10.1+5.11-alpha+git0+beaeeb9988-r0.0) [version-going-backwards]
qtwebkit-5.10.1+5.11-alpha+gitAUTOINC+beaeeb9988: Package version for package qtwebkit-plugins went backwards which would break package feeds from (0:5.10.1+git0+97c4a80a12-r0.0 to 0:5.10.1+5.11-alpha+git0+beaeeb9988-r0.0) [version-going-backwards]
qtwebkit-5.10.1+5.11-alpha+gitAUTOINC+beaeeb9988: Package version for package qtwebkit-qmldesigner went backwards which would break package feeds from (0:5.10.1+git0+97c4a80a12-r0.0 to 0:5.10.1+5.11-alpha+git0+beaeeb9988-r0.0) [version-going-backwards]
qtwebkit-5.10.1+5.11-alpha+gitAUTOINC+beaeeb9988: Package version for package qtwebkit-qmlplugins-dbg went backwards which would break package feeds from (0:5.10.1+git0+97c4a80a12-r0.0 to 0:5.10.1+5.11-alpha+git0+beaeeb9988-r0.0) [version-going-backwards]
qtwebkit-5.10.1+5.11-alpha+gitAUTOINC+beaeeb9988: Package version for package qtwebkit-qmlplugins went backwards which would break package feeds from (0:5.10.1+git0+97c4a80a12-r0.0 to 0:5.10.1+5.11-alpha+git0+beaeeb9988-r0.0) [version-going-backwards]
qtwebkit-5.10.1+5.11-alpha+gitAUTOINC+beaeeb9988: Package version for package qtwebkit-staticdev went backwards which would break package feeds from (0:5.10.1+git0+97c4a80a12-r0.0 to 0:5.10.1+5.11-alpha+git0+beaeeb9988-r0.0) [version-going-backwards]
qtwebkit-5.10.1+5.11-alpha+gitAUTOINC+beaeeb9988: Package version for package qtwebkit-tools-dbg went backwards which would break package feeds from (0:5.10.1+git0+97c4a80a12-r0.0 to 0:5.10.1+5.11-alpha+git0+beaeeb9988-r0.0) [version-going-backwards]
qtwebkit-5.10.1+5.11-alpha+gitAUTOINC+beaeeb9988: Package version for package qtwebkit-tools went backwards which would break package feeds from (0:5.10.1+git0+97c4a80a12-r0.0 to 0:5.10.1+5.11-alpha+git0+beaeeb9988-r0.0) [version-going-backwards]
qtwebkit-5.10.1+5.11-alpha+gitAUTOINC+beaeeb9988: Package version for package qtwebkit went backwards which would break package feeds from (0:5.10.1+git0+97c4a80a12-r0.0 to 0:5.10.1+5.11-alpha+git0+beaeeb9988-r0.0) [version-going-backwards]
qtwebkit-examples-5.10.1+5.11-alpha+gitAUTOINC+2d68492004: Package version for package qtwebkit-examples-dbg went backwards which would break package feeds from (0:5.10.1+git0+a24c780b60-r0.0 to 0:5.10.1+5.11-alpha+git0+2d68492004-r0.0) [version-going-backwards]
qtwebkit-examples-5.10.1+5.11-alpha+gitAUTOINC+2d68492004: Package version for package qtwebkit-examples-dev went backwards which would break package feeds from (0:5.10.1+git0+a24c780b60-r0.0 to 0:5.10.1+5.11-alpha+git0+2d68492004-r0.0) [version-going-backwards]
qtwebkit-examples-5.10.1+5.11-alpha+gitAUTOINC+2d68492004: Package version for package qtwebkit-examples-doc went backwards which would break package feeds from (0:5.10.1+git0+a24c780b60-r0.0 to 0:5.10.1+5.11-alpha+git0+2d68492004-r0.0) [version-going-backwards]
qtwebkit-examples-5.10.1+5.11-alpha+gitAUTOINC+2d68492004: Package version for package qtwebkit-examples-examples-dbg went backwards which would break package feeds from (0:5.10.1+git0+a24c780b60-r0.0 to 0:5.10.1+5.11-alpha+git0+2d68492004-r0.0) [version-going-backwards]
qtwebkit-examples-5.10.1+5.11-alpha+gitAUTOINC+2d68492004: Package version for package qtwebkit-examples-examples-dev went backwards which would break package feeds from (0:5.10.1+git0+a24c780b60-r0.0 to 0:5.10.1+5.11-alpha+git0+2d68492004-r0.0) [version-going-backwards]
qtwebkit-examples-5.10.1+5.11-alpha+gitAUTOINC+2d68492004: Package version for package qtwebkit-examples-examples-staticdev went backwards which would break package feeds from (0:5.10.1+git0+a24c780b60-r0.0 to 0:5.10.1+5.11-alpha+git0+2d68492004-r0.0) [version-going-backwards]
qtwebkit-examples-5.10.1+5.11-alpha+gitAUTOINC+2d68492004: Package version for package qtwebkit-examples-examples went backwards which would break package feeds from (0:5.10.1+git0+a24c780b60-r0.0 to 0:5.10.1+5.11-alpha+git0+2d68492004-r0.0) [version-going-backwards]
qtwebkit-examples-5.10.1+5.11-alpha+gitAUTOINC+2d68492004: Package version for package qtwebkit-examples-locale went backwards which would break package feeds from (0:5.10.1+git0+a24c780b60-r0.0 to 0:5.10.1+5.11-alpha+git0+2d68492004-r0.0) [version-going-backwards]
qtwebkit-examples-5.10.1+5.11-alpha+gitAUTOINC+2d68492004: Package version for package qtwebkit-examples-mkspecs went backwards which would break package feeds from (0:5.10.1+git0+a24c780b60-r0.0 to 0:5.10.1+5.11-alpha+git0+2d68492004-r0.0) [version-going-backwards]
qtwebkit-examples-5.10.1+5.11-alpha+gitAUTOINC+2d68492004: Package version for package qtwebkit-examples-plugins-dbg went backwards which would break package feeds from (0:5.10.1+git0+a24c780b60-r0.0 to 0:5.10.1+5.11-alpha+git0+2d68492004-r0.0) [version-going-backwards]
qtwebkit-examples-5.10.1+5.11-alpha+gitAUTOINC+2d68492004: Package version for package qtwebkit-examples-plugins went backwards which would break package feeds from (0:5.10.1+git0+a24c780b60-r0.0 to 0:5.10.1+5.11-alpha+git0+2d68492004-r0.0) [version-going-backwards]
qtwebkit-examples-5.10.1+5.11-alpha+gitAUTOINC+2d68492004: Package version for package qtwebkit-examples-qmldesigner went backwards which would break package feeds from (0:5.10.1+git0+a24c780b60-r0.0 to 0:5.10.1+5.11-alpha+git0+2d68492004-r0.0) [version-going-backwards]
qtwebkit-examples-5.10.1+5.11-alpha+gitAUTOINC+2d68492004: Package version for package qtwebkit-examples-qmlplugins-dbg went backwards which would break package feeds from (0:5.10.1+git0+a24c780b60-r0.0 to 0:5.10.1+5.11-alpha+git0+2d68492004-r0.0) [version-going-backwards]
qtwebkit-examples-5.10.1+5.11-alpha+gitAUTOINC+2d68492004: Package version for package qtwebkit-examples-qmlplugins went backwards which would break package feeds from (0:5.10.1+git0+a24c780b60-r0.0 to 0:5.10.1+5.11-alpha+git0+2d68492004-r0.0) [version-going-backwards]
qtwebkit-examples-5.10.1+5.11-alpha+gitAUTOINC+2d68492004: Package version for package qtwebkit-examples-staticdev went backwards which would break package feeds from (0:5.10.1+git0+a24c780b60-r0.0 to 0:5.10.1+5.11-alpha+git0+2d68492004-r0.0) [version-going-backwards]
qtwebkit-examples-5.10.1+5.11-alpha+gitAUTOINC+2d68492004: Package version for package qtwebkit-examples-tools-dbg went backwards which would break package feeds from (0:5.10.1+git0+a24c780b60-r0.0 to 0:5.10.1+5.11-alpha+git0+2d68492004-r0.0) [version-going-backwards]
qtwebkit-examples-5.10.1+5.11-alpha+gitAUTOINC+2d68492004: Package version for package qtwebkit-examples-tools went backwards which would break package feeds from (0:5.10.1+git0+a24c780b60-r0.0 to 0:5.10.1+5.11-alpha+git0+2d68492004-r0.0) [version-going-backwards]
qtwebkit-examples-5.10.1+5.11-alpha+gitAUTOINC+2d68492004: Package version for package qtwebkit-examples went backwards which would break package feeds from (0:5.10.1+git0+a24c780b60-r0.0 to 0:5.10.1+5.11-alpha+git0+2d68492004-r0.0) [version-going-backwards]
qtwebsockets-5.10.1+5.11-alpha+gitAUTOINC+8a549aca7b: Package version for package qtwebsockets-dbg went backwards which would break package feeds from (0:5.10.1+git0+2160c268ec-r0.0 to 0:5.10.1+5.11-alpha+git0+8a549aca7b-r0.0) [version-going-backwards]
qtwebsockets-5.10.1+5.11-alpha+gitAUTOINC+8a549aca7b: Package version for package qtwebsockets-dev went backwards which would break package feeds from (0:5.10.1+git0+2160c268ec-r0.0 to 0:5.10.1+5.11-alpha+git0+8a549aca7b-r0.0) [version-going-backwards]
qtwebsockets-5.10.1+5.11-alpha+gitAUTOINC+8a549aca7b: Package version for package qtwebsockets-doc went backwards which would break package feeds from (0:5.10.1+git0+2160c268ec-r0.0 to 0:5.10.1+5.11-alpha+git0+8a549aca7b-r0.0) [version-going-backwards]
qtwebsockets-5.10.1+5.11-alpha+gitAUTOINC+8a549aca7b: Package version for package qtwebsockets-examples-dbg went backwards which would break package feeds from (0:5.10.1+git0+2160c268ec-r0.0 to 0:5.10.1+5.11-alpha+git0+8a549aca7b-r0.0) [version-going-backwards]
qtwebsockets-5.10.1+5.11-alpha+gitAUTOINC+8a549aca7b: Package version for package qtwebsockets-examples-dev went backwards which would break package feeds from (0:5.10.1+git0+2160c268ec-r0.0 to 0:5.10.1+5.11-alpha+git0+8a549aca7b-r0.0) [version-going-backwards]
qtwebsockets-5.10.1+5.11-alpha+gitAUTOINC+8a549aca7b: Package version for package qtwebsockets-examples-staticdev went backwards which would break package feeds from (0:5.10.1+git0+2160c268ec-r0.0 to 0:5.10.1+5.11-alpha+git0+8a549aca7b-r0.0) [version-going-backwards]
qtwebsockets-5.10.1+5.11-alpha+gitAUTOINC+8a549aca7b: Package version for package qtwebsockets-examples went backwards which would break package feeds from (0:5.10.1+git0+2160c268ec-r0.0 to 0:5.10.1+5.11-alpha+git0+8a549aca7b-r0.0) [version-going-backwards]
qtwebsockets-5.10.1+5.11-alpha+gitAUTOINC+8a549aca7b: Package version for package qtwebsockets-locale went backwards which would break package feeds from (0:5.10.1+git0+2160c268ec-r0.0 to 0:5.10.1+5.11-alpha+git0+8a549aca7b-r0.0) [version-going-backwards]
qtwebsockets-5.10.1+5.11-alpha+gitAUTOINC+8a549aca7b: Package version for package qtwebsockets-mkspecs went backwards which would break package feeds from (0:5.10.1+git0+2160c268ec-r0.0 to 0:5.10.1+5.11-alpha+git0+8a549aca7b-r0.0) [version-going-backwards]
qtwebsockets-5.10.1+5.11-alpha+gitAUTOINC+8a549aca7b: Package version for package qtwebsockets-plugins-dbg went backwards which would break package feeds from (0:5.10.1+git0+2160c268ec-r0.0 to 0:5.10.1+5.11-alpha+git0+8a549aca7b-r0.0) [version-going-backwards]
qtwebsockets-5.10.1+5.11-alpha+gitAUTOINC+8a549aca7b: Package version for package qtwebsockets-plugins went backwards which would break package feeds from (0:5.10.1+git0+2160c268ec-r0.0 to 0:5.10.1+5.11-alpha+git0+8a549aca7b-r0.0) [version-going-backwards]
qtwebsockets-5.10.1+5.11-alpha+gitAUTOINC+8a549aca7b: Package version for package qtwebsockets-qmldesigner went backwards which would break package feeds from (0:5.10.1+git0+2160c268ec-r0.0 to 0:5.10.1+5.11-alpha+git0+8a549aca7b-r0.0) [version-going-backwards]
qtwebsockets-5.10.1+5.11-alpha+gitAUTOINC+8a549aca7b: Package version for package qtwebsockets-qmlplugins-dbg went backwards which would break package feeds from (0:5.10.1+git0+2160c268ec-r0.0 to 0:5.10.1+5.11-alpha+git0+8a549aca7b-r0.0) [version-going-backwards]
qtwebsockets-5.10.1+5.11-alpha+gitAUTOINC+8a549aca7b: Package version for package qtwebsockets-qmlplugins went backwards which would break package feeds from (0:5.10.1+git0+2160c268ec-r0.0 to 0:5.10.1+5.11-alpha+git0+8a549aca7b-r0.0) [version-going-backwards]
qtwebsockets-5.10.1+5.11-alpha+gitAUTOINC+8a549aca7b: Package version for package qtwebsockets-staticdev went backwards which would break package feeds from (0:5.10.1+git0+2160c268ec-r0.0 to 0:5.10.1+5.11-alpha+git0+8a549aca7b-r0.0) [version-going-backwards]
qtwebsockets-5.10.1+5.11-alpha+gitAUTOINC+8a549aca7b: Package version for package qtwebsockets-tools-dbg went backwards which would break package feeds from (0:5.10.1+git0+2160c268ec-r0.0 to 0:5.10.1+5.11-alpha+git0+8a549aca7b-r0.0) [version-going-backwards]
qtwebsockets-5.10.1+5.11-alpha+gitAUTOINC+8a549aca7b: Package version for package qtwebsockets-tools went backwards which would break package feeds from (0:5.10.1+git0+2160c268ec-r0.0 to 0:5.10.1+5.11-alpha+git0+8a549aca7b-r0.0) [version-going-backwards]
qtwebsockets-5.10.1+5.11-alpha+gitAUTOINC+8a549aca7b: Package version for package qtwebsockets went backwards which would break package feeds from (0:5.10.1+git0+2160c268ec-r0.0 to 0:5.10.1+5.11-alpha+git0+8a549aca7b-r0.0) [version-going-backwards]
qtwebview-5.10.1+5.11-alpha+gitAUTOINC+cf23a402b9: Package version for package qtwebview-dbg went backwards which would break package feeds from (0:5.10.1+git0+7445cd2861-r0.0 to 0:5.10.1+5.11-alpha+git0+cf23a402b9-r0.0) [version-going-backwards]
qtwebview-5.10.1+5.11-alpha+gitAUTOINC+cf23a402b9: Package version for package qtwebview-dev went backwards which would break package feeds from (0:5.10.1+git0+7445cd2861-r0.0 to 0:5.10.1+5.11-alpha+git0+cf23a402b9-r0.0) [version-going-backwards]
qtwebview-5.10.1+5.11-alpha+gitAUTOINC+cf23a402b9: Package version for package qtwebview-doc went backwards which would break package feeds from (0:5.10.1+git0+7445cd2861-r0.0 to 0:5.10.1+5.11-alpha+git0+cf23a402b9-r0.0) [version-going-backwards]
qtwebview-5.10.1+5.11-alpha+gitAUTOINC+cf23a402b9: Package version for package qtwebview-examples-dbg went backwards which would break package feeds from (0:5.10.1+git0+7445cd2861-r0.0 to 0:5.10.1+5.11-alpha+git0+cf23a402b9-r0.0) [version-going-backwards]
qtwebview-5.10.1+5.11-alpha+gitAUTOINC+cf23a402b9: Package version for package qtwebview-examples-dev went backwards which would break package feeds from (0:5.10.1+git0+7445cd2861-r0.0 to 0:5.10.1+5.11-alpha+git0+cf23a402b9-r0.0) [version-going-backwards]
qtwebview-5.10.1+5.11-alpha+gitAUTOINC+cf23a402b9: Package version for package qtwebview-examples-staticdev went backwards which would break package feeds from (0:5.10.1+git0+7445cd2861-r0.0 to 0:5.10.1+5.11-alpha+git0+cf23a402b9-r0.0) [version-going-backwards]
qtwebview-5.10.1+5.11-alpha+gitAUTOINC+cf23a402b9: Package version for package qtwebview-examples went backwards which would break package feeds from (0:5.10.1+git0+7445cd2861-r0.0 to 0:5.10.1+5.11-alpha+git0+cf23a402b9-r0.0) [version-going-backwards]
qtwebview-5.10.1+5.11-alpha+gitAUTOINC+cf23a402b9: Package version for package qtwebview-locale went backwards which would break package feeds from (0:5.10.1+git0+7445cd2861-r0.0 to 0:5.10.1+5.11-alpha+git0+cf23a402b9-r0.0) [version-going-backwards]
qtwebview-5.10.1+5.11-alpha+gitAUTOINC+cf23a402b9: Package version for package qtwebview-mkspecs went backwards which would break package feeds from (0:5.10.1+git0+7445cd2861-r0.0 to 0:5.10.1+5.11-alpha+git0+cf23a402b9-r0.0) [version-going-backwards]
qtwebview-5.10.1+5.11-alpha+gitAUTOINC+cf23a402b9: Package version for package qtwebview-plugins-dbg went backwards which would break package feeds from (0:5.10.1+git0+7445cd2861-r0.0 to 0:5.10.1+5.11-alpha+git0+cf23a402b9-r0.0) [version-going-backwards]
qtwebview-5.10.1+5.11-alpha+gitAUTOINC+cf23a402b9: Package version for package qtwebview-plugins went backwards which would break package feeds from (0:5.10.1+git0+7445cd2861-r0.0 to 0:5.10.1+5.11-alpha+git0+cf23a402b9-r0.0) [version-going-backwards]
qtwebview-5.10.1+5.11-alpha+gitAUTOINC+cf23a402b9: Package version for package qtwebview-qmldesigner went backwards which would break package feeds from (0:5.10.1+git0+7445cd2861-r0.0 to 0:5.10.1+5.11-alpha+git0+cf23a402b9-r0.0) [version-going-backwards]
qtwebview-5.10.1+5.11-alpha+gitAUTOINC+cf23a402b9: Package version for package qtwebview-qmlplugins-dbg went backwards which would break package feeds from (0:5.10.1+git0+7445cd2861-r0.0 to 0:5.10.1+5.11-alpha+git0+cf23a402b9-r0.0) [version-going-backwards]
qtwebview-5.10.1+5.11-alpha+gitAUTOINC+cf23a402b9: Package version for package qtwebview-qmlplugins went backwards which would break package feeds from (0:5.10.1+git0+7445cd2861-r0.0 to 0:5.10.1+5.11-alpha+git0+cf23a402b9-r0.0) [version-going-backwards]
qtwebview-5.10.1+5.11-alpha+gitAUTOINC+cf23a402b9: Package version for package qtwebview-staticdev went backwards which would break package feeds from (0:5.10.1+git0+7445cd2861-r0.0 to 0:5.10.1+5.11-alpha+git0+cf23a402b9-r0.0) [version-going-backwards]
qtwebview-5.10.1+5.11-alpha+gitAUTOINC+cf23a402b9: Package version for package qtwebview-tools-dbg went backwards which would break package feeds from (0:5.10.1+git0+7445cd2861-r0.0 to 0:5.10.1+5.11-alpha+git0+cf23a402b9-r0.0) [version-going-backwards]
qtwebview-5.10.1+5.11-alpha+gitAUTOINC+cf23a402b9: Package version for package qtwebview-tools went backwards which would break package feeds from (0:5.10.1+git0+7445cd2861-r0.0 to 0:5.10.1+5.11-alpha+git0+cf23a402b9-r0.0) [version-going-backwards]
qtwebview-5.10.1+5.11-alpha+gitAUTOINC+cf23a402b9: Package version for package qtwebview went backwards which would break package feeds from (0:5.10.1+git0+7445cd2861-r0.0 to 0:5.10.1+5.11-alpha+git0+cf23a402b9-r0.0) [version-going-backwards]
qtx11extras-5.10.1+5.11-alpha+gitAUTOINC+78a10dad08: Package version for package qtx11extras-dbg went backwards which would break package feeds from (0:5.10.1+git0+a751298bc3-r0.0 to 0:5.10.1+5.11-alpha+git0+78a10dad08-r0.0) [version-going-backwards]
qtx11extras-5.10.1+5.11-alpha+gitAUTOINC+78a10dad08: Package version for package qtx11extras-dev went backwards which would break package feeds from (0:5.10.1+git0+a751298bc3-r0.0 to 0:5.10.1+5.11-alpha+git0+78a10dad08-r0.0) [version-going-backwards]
qtx11extras-5.10.1+5.11-alpha+gitAUTOINC+78a10dad08: Package version for package qtx11extras-doc went backwards which would break package feeds from (0:5.10.1+git0+a751298bc3-r0.0 to 0:5.10.1+5.11-alpha+git0+78a10dad08-r0.0) [version-going-backwards]
qtx11extras-5.10.1+5.11-alpha+gitAUTOINC+78a10dad08: Package version for package qtx11extras-examples-dbg went backwards which would break package feeds from (0:5.10.1+git0+a751298bc3-r0.0 to 0:5.10.1+5.11-alpha+git0+78a10dad08-r0.0) [version-going-backwards]
qtx11extras-5.10.1+5.11-alpha+gitAUTOINC+78a10dad08: Package version for package qtx11extras-examples-dev went backwards which would break package feeds from (0:5.10.1+git0+a751298bc3-r0.0 to 0:5.10.1+5.11-alpha+git0+78a10dad08-r0.0) [version-going-backwards]
qtx11extras-5.10.1+5.11-alpha+gitAUTOINC+78a10dad08: Package version for package qtx11extras-examples-staticdev went backwards which would break package feeds from (0:5.10.1+git0+a751298bc3-r0.0 to 0:5.10.1+5.11-alpha+git0+78a10dad08-r0.0) [version-going-backwards]
qtx11extras-5.10.1+5.11-alpha+gitAUTOINC+78a10dad08: Package version for package qtx11extras-examples went backwards which would break package feeds from (0:5.10.1+git0+a751298bc3-r0.0 to 0:5.10.1+5.11-alpha+git0+78a10dad08-r0.0) [version-going-backwards]
qtx11extras-5.10.1+5.11-alpha+gitAUTOINC+78a10dad08: Package version for package qtx11extras-locale went backwards which would break package feeds from (0:5.10.1+git0+a751298bc3-r0.0 to 0:5.10.1+5.11-alpha+git0+78a10dad08-r0.0) [version-going-backwards]
qtx11extras-5.10.1+5.11-alpha+gitAUTOINC+78a10dad08: Package version for package qtx11extras-mkspecs went backwards which would break package feeds from (0:5.10.1+git0+a751298bc3-r0.0 to 0:5.10.1+5.11-alpha+git0+78a10dad08-r0.0) [version-going-backwards]
qtx11extras-5.10.1+5.11-alpha+gitAUTOINC+78a10dad08: Package version for package qtx11extras-plugins-dbg went backwards which would break package feeds from (0:5.10.1+git0+a751298bc3-r0.0 to 0:5.10.1+5.11-alpha+git0+78a10dad08-r0.0) [version-going-backwards]
qtx11extras-5.10.1+5.11-alpha+gitAUTOINC+78a10dad08: Package version for package qtx11extras-plugins went backwards which would break package feeds from (0:5.10.1+git0+a751298bc3-r0.0 to 0:5.10.1+5.11-alpha+git0+78a10dad08-r0.0) [version-going-backwards]
qtx11extras-5.10.1+5.11-alpha+gitAUTOINC+78a10dad08: Package version for package qtx11extras-qmldesigner went backwards which would break package feeds from (0:5.10.1+git0+a751298bc3-r0.0 to 0:5.10.1+5.11-alpha+git0+78a10dad08-r0.0) [version-going-backwards]
qtx11extras-5.10.1+5.11-alpha+gitAUTOINC+78a10dad08: Package version for package qtx11extras-qmlplugins-dbg went backwards which would break package feeds from (0:5.10.1+git0+a751298bc3-r0.0 to 0:5.10.1+5.11-alpha+git0+78a10dad08-r0.0) [version-going-backwards]
qtx11extras-5.10.1+5.11-alpha+gitAUTOINC+78a10dad08: Package version for package qtx11extras-qmlplugins went backwards which would break package feeds from (0:5.10.1+git0+a751298bc3-r0.0 to 0:5.10.1+5.11-alpha+git0+78a10dad08-r0.0) [version-going-backwards]
qtx11extras-5.10.1+5.11-alpha+gitAUTOINC+78a10dad08: Package version for package qtx11extras-staticdev went backwards which would break package feeds from (0:5.10.1+git0+a751298bc3-r0.0 to 0:5.10.1+5.11-alpha+git0+78a10dad08-r0.0) [version-going-backwards]
qtx11extras-5.10.1+5.11-alpha+gitAUTOINC+78a10dad08: Package version for package qtx11extras-tools-dbg went backwards which would break package feeds from (0:5.10.1+git0+a751298bc3-r0.0 to 0:5.10.1+5.11-alpha+git0+78a10dad08-r0.0) [version-going-backwards]
qtx11extras-5.10.1+5.11-alpha+gitAUTOINC+78a10dad08: Package version for package qtx11extras-tools went backwards which would break package feeds from (0:5.10.1+git0+a751298bc3-r0.0 to 0:5.10.1+5.11-alpha+git0+78a10dad08-r0.0) [version-going-backwards]
qtx11extras-5.10.1+5.11-alpha+gitAUTOINC+78a10dad08: Package version for package qtx11extras went backwards which would break package feeds from (0:5.10.1+git0+a751298bc3-r0.0 to 0:5.10.1+5.11-alpha+git0+78a10dad08-r0.0) [version-going-backwards]
qtxmlpatterns-5.10.1+5.11-alpha+gitAUTOINC+c892ceec1c: Package version for package qtxmlpatterns-dbg went backwards which would break package feeds from (0:5.10.1+git0+7c4113d6e6-r0.0 to 0:5.10.1+5.11-alpha+git0+c892ceec1c-r0.0) [version-going-backwards]
qtxmlpatterns-5.10.1+5.11-alpha+gitAUTOINC+c892ceec1c: Package version for package qtxmlpatterns-dev went backwards which would break package feeds from (0:5.10.1+git0+7c4113d6e6-r0.0 to 0:5.10.1+5.11-alpha+git0+c892ceec1c-r0.0) [version-going-backwards]
qtxmlpatterns-5.10.1+5.11-alpha+gitAUTOINC+c892ceec1c: Package version for package qtxmlpatterns-doc went backwards which would break package feeds from (0:5.10.1+git0+7c4113d6e6-r0.0 to 0:5.10.1+5.11-alpha+git0+c892ceec1c-r0.0) [version-going-backwards]
qtxmlpatterns-5.10.1+5.11-alpha+gitAUTOINC+c892ceec1c: Package version for package qtxmlpatterns-examples-dbg went backwards which would break package feeds from (0:5.10.1+git0+7c4113d6e6-r0.0 to 0:5.10.1+5.11-alpha+git0+c892ceec1c-r0.0) [version-going-backwards]
qtxmlpatterns-5.10.1+5.11-alpha+gitAUTOINC+c892ceec1c: Package version for package qtxmlpatterns-examples-dev went backwards which would break package feeds from (0:5.10.1+git0+7c4113d6e6-r0.0 to 0:5.10.1+5.11-alpha+git0+c892ceec1c-r0.0) [version-going-backwards]
qtxmlpatterns-5.10.1+5.11-alpha+gitAUTOINC+c892ceec1c: Package version for package qtxmlpatterns-examples-staticdev went backwards which would break package feeds from (0:5.10.1+git0+7c4113d6e6-r0.0 to 0:5.10.1+5.11-alpha+git0+c892ceec1c-r0.0) [version-going-backwards]
qtxmlpatterns-5.10.1+5.11-alpha+gitAUTOINC+c892ceec1c: Package version for package qtxmlpatterns-examples went backwards which would break package feeds from (0:5.10.1+git0+7c4113d6e6-r0.0 to 0:5.10.1+5.11-alpha+git0+c892ceec1c-r0.0) [version-going-backwards]
qtxmlpatterns-5.10.1+5.11-alpha+gitAUTOINC+c892ceec1c: Package version for package qtxmlpatterns-locale went backwards which would break package feeds from (0:5.10.1+git0+7c4113d6e6-r0.0 to 0:5.10.1+5.11-alpha+git0+c892ceec1c-r0.0) [version-going-backwards]
qtxmlpatterns-5.10.1+5.11-alpha+gitAUTOINC+c892ceec1c: Package version for package qtxmlpatterns-mkspecs went backwards which would break package feeds from (0:5.10.1+git0+7c4113d6e6-r0.0 to 0:5.10.1+5.11-alpha+git0+c892ceec1c-r0.0) [version-going-backwards]
qtxmlpatterns-5.10.1+5.11-alpha+gitAUTOINC+c892ceec1c: Package version for package qtxmlpatterns-plugins-dbg went backwards which would break package feeds from (0:5.10.1+git0+7c4113d6e6-r0.0 to 0:5.10.1+5.11-alpha+git0+c892ceec1c-r0.0) [version-going-backwards]
qtxmlpatterns-5.10.1+5.11-alpha+gitAUTOINC+c892ceec1c: Package version for package qtxmlpatterns-plugins went backwards which would break package feeds from (0:5.10.1+git0+7c4113d6e6-r0.0 to 0:5.10.1+5.11-alpha+git0+c892ceec1c-r0.0) [version-going-backwards]
qtxmlpatterns-5.10.1+5.11-alpha+gitAUTOINC+c892ceec1c: Package version for package qtxmlpatterns-ptest went backwards which would break package feeds from (0:5.10.1+git0+7c4113d6e6-r0.0 to 0:5.10.1+5.11-alpha+git0+c892ceec1c-r0.0) [version-going-backwards]
qtxmlpatterns-5.10.1+5.11-alpha+gitAUTOINC+c892ceec1c: Package version for package qtxmlpatterns-qmldesigner went backwards which would break package feeds from (0:5.10.1+git0+7c4113d6e6-r0.0 to 0:5.10.1+5.11-alpha+git0+c892ceec1c-r0.0) [version-going-backwards]
qtxmlpatterns-5.10.1+5.11-alpha+gitAUTOINC+c892ceec1c: Package version for package qtxmlpatterns-qmlplugins-dbg went backwards which would break package feeds from (0:5.10.1+git0+7c4113d6e6-r0.0 to 0:5.10.1+5.11-alpha+git0+c892ceec1c-r0.0) [version-going-backwards]
qtxmlpatterns-5.10.1+5.11-alpha+gitAUTOINC+c892ceec1c: Package version for package qtxmlpatterns-qmlplugins went backwards which would break package feeds from (0:5.10.1+git0+7c4113d6e6-r0.0 to 0:5.10.1+5.11-alpha+git0+c892ceec1c-r0.0) [version-going-backwards]
qtxmlpatterns-5.10.1+5.11-alpha+gitAUTOINC+c892ceec1c: Package version for package qtxmlpatterns-staticdev went backwards which would break package feeds from (0:5.10.1+git0+7c4113d6e6-r0.0 to 0:5.10.1+5.11-alpha+git0+c892ceec1c-r0.0) [version-going-backwards]
qtxmlpatterns-5.10.1+5.11-alpha+gitAUTOINC+c892ceec1c: Package version for package qtxmlpatterns-tools-dbg went backwards which would break package feeds from (0:5.10.1+git0+7c4113d6e6-r0.0 to 0:5.10.1+5.11-alpha+git0+c892ceec1c-r0.0) [version-going-backwards]
qtxmlpatterns-5.10.1+5.11-alpha+gitAUTOINC+c892ceec1c: Package version for package qtxmlpatterns-tools went backwards which would break package feeds from (0:5.10.1+git0+7c4113d6e6-r0.0 to 0:5.10.1+5.11-alpha+git0+c892ceec1c-r0.0) [version-going-backwards]
qtxmlpatterns-5.10.1+5.11-alpha+gitAUTOINC+c892ceec1c: Package version for package qtxmlpatterns went backwards which would break package feeds from (0:5.10.1+git0+7c4113d6e6-r0.0 to 0:5.10.1+5.11-alpha+git0+c892ceec1c-r0.0) [version-going-backwards]


count: 2	issue: host-user-contaminated
glibc-locale-2.26: glibc-locale: /glibc-binary-localedata-ar-ss/usr/lib/locale/ar_SS/LC_PAPER is owned by uid 3004, which is the same as the user running bitbake. This may be due to host contamination [host-user-contaminated]
glibc-locale-2.26: glibc-locale: /glibc-binary-localedata-cmn-tw/usr/lib/locale/cmn_TW/LC_PAPER is owned by uid 3004, which is the same as the user running bitbake. This may be due to host contamination [host-user-contaminated]


count: 1	issue: installed-vs-shipped
rdist: 1 installed and not shipped files. [installed-vs-shipped]


count: 1	issue: unknown-configure-option
gstd-1.0: gstd: configure was passed unrecognised options: --disable-gtk-doc [unknown-configure-option]


count: 0	issue: symlink-to-sysroot


count: 0	issue: invalid-pkgconfig


count: 0	issue: pkgname


count: 0	issue: ldflags


count: 0	issue: compile-host-path


count: 0	issue: qa_pseudo



This git log matches with the metadata as seen by qemuarm build.
In some cases qemux86 and qemux86-64 builds are built with slightly
different metadata, you can see the exact version near the top of each
log.world.qemu* files linked from the report

== Tested changes (not included in master yet) - bitbake ==
latest upstream commit: 
34da85e bitbake-user-manual: Added cross reference to "Layers" section.
not included in master yet: 
b296b3c world-image: add extra target
f16506c fetch2: Allow Fetch.download() to warn instead of error

== Tested changes (not included in master yet) - openembedded-core ==
latest upstream commit: 
b30153a buildhistory-diff: honour report_all flag
not included in master yet: 
843ab2e waf.bbclass: check that waf exists before trying to execute it
02cd2e2 libpam: be more strict about user's sanity
f31c95b iputils: add libidn dependency
7265b3e insane.bbclass: Add do_qa_pseudo function to check for common errors listed in pseudo.log
08f017b kernel-devicetree.bbclass: Use lowercase names for shell variables
7cd95d1 kernel-devicetree.bbclass: Fix and simplify instalation of DTB files
309fcc5 kernel.bbclass: use the consistent naming schema for initramfs
b245214 kernel.bbclass: move variables for kernel artifacts names to separate bbclass
8adb1c2 report-error: Allow to upload reports automatically
6400902 sstate.bbclass: Do not cause build failures due to setscene errors
f6d7320 buildhistory.bbclass: metadata-revs show repo parent
d35c0bd metadata-revs: provide more information
2680274 qemux86: Add identical qemux86copy variant for tests
0f993ef reproducible_build.bbclass: initial support for binary reproducibility
55931de cpio: provide cpio-replacement-native
91e154d image_types.bbclass: improve cpio image reproducibility
1c3031d rootfs-postcommands.bbclass: support binary reproducibility
b66c2df Revert "libepoxy: convert to meson build"
1d17cfe pseudo: update to latest master
a1b4e21 pseudo: bump SRCREV

== Tested changes (not included in master yet) - meta-openembedded ==
latest upstream commit: 
d0619b6 xrdp: enable cpliboard
not included in master yet: 
115f8c1 wireguard: udpate to 20171221 version
5569308 cim-schema-exper: 2.39.0 -> 2.50.0
7688c6c waf-cross-answers: Add cross-answers-aarch64_be.txt
328d7ce classes/recipes: Convert SkipPackage -> SkipRecipe
d95320b libgpiod: fix packaging of tools
61e3de5 samba: Add packagegroup
f3d0187 net-snmp: Fix compiler options with paths in net-snmp-config
576fc05 obexftp: use makefile instead of ninja cmake generator
4e550b6 samba, openwsman, pam-ssh-agent-auth, sblim-sfcb, passwdqc, python-pam, smbnetfs: require pam in DISTRO_FEATURES
69728f6 geoipupdate: 2.4.0 -> 2.5.0
ad7c702 mdns: Do not include nss.h with musl
e409431 iscsi-initiator-utils: Upgrade to 2.0.876
73b3beb samba: Refresh musl pam patch
760185b miniupnpd: update to 2.0.20180203 and add systemd service
f16e098 wireshark: Update Package to 2.2.12
2fa544f opensaf: Upgrade to 5.18.02
eb87248 libtalloc: Upgrade to 2.1.11
c53f29d postfix: adapt pkg_postinst to postinst_intercept
f683e3c geoip: 1.6.9 -> 1.6.11
f71f046 waf-samba.bbclass: No longer inherit waf.bbclass
6413b99 dhcpcd: update to 6.11.5
52ca949 zsh: move to recipes-shells
e5993ae tcsh: move to recipes-shells
87b30fb sqlite: move to recipes-dbs
800e812 mysql: move to recipes-dbs
7262896 psqlodbc: move to recipes-dbs
1f461c6 libdbi: move to recipes-dbs
9eea207 soci: move to recipes-dbs
bd24dcf mongodb: move to recipes-dbs
e5fa613 ipmitool: move to recipes-kernel
38f6634 ipmiutil: move to recipes-kernel
cf7476f testfloat: move to recipe-tests
adc7cd3 fbtest: move to recipe-tests
84d72a0 cxxtest: move to recipes-test
bc6f85f pm-qa: move to recipe-test
52d910b cunit: move to recipes-test
de8786a cppunit: move to recipes-test
d6def03 tomoyo-tools: move to recipes-secuity
3ec27ec leveldb: move to recipes-security
09fe7d1 cpufrequtils: move to recipes-bsp
c601912 lm_sensors: move to recipes-bsp
a986288 libmcryt: movre to recipes-crypto
04ade44 engine-pkcs11: move to recipes-crypto
47c9637 pkcs11-helper: move to recipes-crypto
0281cf1 libcrypto: move to recipes-crypto
be9c92a passwdqc: move to recipes-security
3d52dd1 evtest: move to recipes-test
eba5aa8 cryptsetup: move to crypto
3ac8eb2 edac-utils: move to recipes-bsp
7c13d98 flashrom: move to recipes-bsp
b0171c8 efibootmgr: move to recipes-bsps
8b3be1a lsscsi: move to recipes-bsps
c5491ab rocksdb: move to recipes-bsp
d23e30d acpitools: move to recipes-bsp
9f977ac efivar: move to recipes-bsp
43cd3d5 dash: move dash to recipes-shell
6263354 postgres: move to recipes-dbs
77e3346 wireshark: update to new 2.4.5 series
0a33f23 openl2tp: fix compile issue with 4.15 kernel
23e827a python3-requests: drop incorrect RDEPENDS
7948726 nodejs: Add support for building on ppc64le
a850a34 gstd: Add Gst-Deamon recipe
91f30e4 python-evdev: add python3 version of the recipe
c240618 fix(p7zip): fix CVE-2017-17969
9eae784 nodejs: Update from 8.9.0 -> 8.9.4
f7df889 ] python-oauthlib: Add python-oauthlib and python3-oauthlib.
bed46fe mraa: Update recipe to use v1.9.0
581e236 upm: Update recipe to use v1.6.0
80db6e3 libmodule-pluggable-perl: use upstream instead of github.com/moto-timo
0ca711c libmodule-runtime-perl: upgrade to 0.016, use upstream
9160d8d python-systemd: fix dependencies
0ca221a opusfile: add new recipe
db21129 sox: bump 14.4.0 -> 14.4.2
230a7f9 vboxguestdrivers: upgrade to 5.2.6
de66932 python-pybind11: update to version 2.2.2
0a3f5a3 python-pymisp: update to version 2.4.87.1
d91ae12 python-pexpect: update to version 4.4.0
a24e103 python-msg: update to version 0.5.5
9154030 python-can: update to version 2.1.0
e4b7c41 python-pytz: update to version 2018.3
f3d9272 python-isort: update to version 4.3.4
d120453 python-alembic: update to version 0.9.8
d890521 python-webcolors: update to version 1.8.1
b8c89b8 python-ply: update to version 3.11
54c977e python-pytest: update to version 3.4.1
3b73192 python-typing: update to version 3.6.4

== Tested changes (not included in master yet) - meta-qt5 ==
latest upstream commit: 
e60e849 qtpurchasing: upgrade to 5.10.1
not included in master yet: 
c984f40 qtbase: Add packageconfigs for renameat2 and getentropy use
fe8e38c qtbase: don't enable renameat2 by default
6e663f4 qt5-git.inc: drop nobranch=1
caa615b qt5: upgrade to 5.11 Alpha
caad8dd qt5-creator: upgrade to 4.5.1
9e3b496 packagegroup-qt5-toolchain-target: drop both qtwebkit packages

== Tested changes (not included in master yet) - meta-browser ==
latest upstream commit: 
a413b4f Merge pull request #96 from rakuco/m64-167
not included in master yet: 


