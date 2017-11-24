Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 939E278840
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Nov 2017 01:52:59 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id vAO1qxG8012181
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 23 Nov 2017 17:52:59 -0800 (PST)
Received: from [128.224.162.151] (128.224.162.151) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.361.1;
	Thu, 23 Nov 2017 17:52:58 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: Khem Raj <raj.khem@gmail.com>, "Burton, Ross" <ross.burton@intel.com>,
	Michael Halstead <michael@yoctoproject.org>
References: <cover.1511437793.git.hongxu.jia@windriver.com>
	<CAJTo0La5+dpVjgmDnkqP3wX+M2L-1sk11-wxreL1+7xR1anYfg@mail.gmail.com>
	<CAMKF1sp96uZ5JY9NDPg=+eEmx7qivCe=5sJ=2gSxjO83k98vqw@mail.gmail.com>
Message-ID: <aa13bf27-012d-1a09-fd47-1f36dd2742d1@windriver.com>
Date: Fri, 24 Nov 2017 09:55:39 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1sp96uZ5JY9NDPg=+eEmx7qivCe=5sJ=2gSxjO83k98vqw@mail.gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 00/15] create meta-installer layer
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
X-List-Received-Date: Fri, 24 Nov 2017 01:52:59 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2017年11月24日 08:35, Khem Raj wrote:
>
> On Thu, Nov 23, 2017 at 4:15 AM Burton, Ross <ross.burton@intel.com 
> <mailto:ross.burton@intel.com>> wrote:
>
>     I honestly don't see why this has to belong in meta-openembedded
>     and can't live in a standalone repository.
>
>
> I share the same opinion it should probably be
>  Repo of its own
>

Hi Ross & Khem,

Since both of you think it should be as a standalone repository,
I do not insist on it.

Hi Michael,

Would you please create a repository on http://git.yoctoproject.org/
the layer name called `meta-installer', should I resend pull request
for review or directly push the repo contents to it once it's created.

If the latter one, should I send my ssh pub key to you privately?

//Hongxu


>
>     Ross
>
>     On 23 November 2017 at 12:09, Hongxu Jia <hongxu.jia@windriver.com
>     <mailto:hongxu.jia@windriver.com>> wrote:
>
>         The meta-installer layer provides a collection of installation
>         programs based on OE platform.
>
>         One implementation is the target installer 'anaconda', the version
>         is 26.21.11 which is based on Fedora 26.
>
>         The anacoda requires:
>         - systemd as init manager
>         - python3
>         - dnf2/rpm4
>         - gobject-introspection which requires qemu-usermode
>           in MACHINE_FEATURES
>
>         The anaconda provides:
>         - graphic install and text install.
>
>         - package based (dnf/rpm) install and image (copy)
>           based install.
>
>         - package based (dnf/rpm) install from local and
>           remote rpm sources such as CDs and DVDs, images
>           stored on a hard drive, NFS, HTTP, and FTP.
>
>         - kickstart install which provides a fully unattended
>           installation that can be duplicated on scores of machines.
>
>         - install over VNC on headless machines.
>
>         - timezone setting.
>
>         - root password setting.
>
>         - user account creation.
>
>         - a variety of advanced storage devices including
>           LVM, Btrfs, Ext4, and filesystem encryption.
>
>         TODO (currently not support):
>         - keyboard setting
>
>         - language support setting
>
>         - network & host name setting
>
>         //Hongxu
>
>         The following changes since commit
>         34aa4c3202b427f59f843dc43a4e1afda4f81d13:
>
>           usb-modeswitch: add usb-modeswitch@.service (2017-11-19
>         13:45:38 -0800)
>
>         are available in the git repository at:
>
>           git://git.openembedded.org/openembedded-core-contrib
>         <http://git.openembedded.org/openembedded-core-contrib>
>         hongxu/meta-installer
>         http://cgit.openembedded.org/openembedded-core-contrib/log/?h=hongxu/meta-installer
>
>         Hongxu Jia (15):
>           meta-installer: create layer
>           meta-installer: add kernel config
>           meta-installer: add anaconda support for target build
>           meta-installer: add distro anaconda for host build
>           meta-installer: add systemd/systemd-serialgetty bbappend
>           meta-installer: add gtk+3 bbappend
>           meta-installer: add initramfs-live-boot bbappend
>           meta-installer: add xserver-xf86-config bbappend
>           meta-installer: add multipath-tools bbappend
>           meta-installer: add recipe packagegroup-installer-x11-anaconda
>           meta-installer: add recipe yocto-compat-logos
>           meta-installer: add recipe anaconda-init
>           meta-installer: add recipe anaconda 26.21.11
>           meta-installer: add recipe core-image-anaconda
>           meta-installer: add recipe core-image-anaconda-initramfs
>
>          meta-installer/COPYING.MIT                         | 17 +
>          meta-installer/README                              | 47 ++
>          meta-installer/README.anaconda                     | 341
>         ++++++++++++
>          meta-installer/classes/anaconda_image.bbclass      | 321
>         +++++++++++
>          meta-installer/classes/anaconda_kernel.bbclass     | 14 +
>          .../classes/anaconda_support_image.bbclass         | 40 ++
>          .../classes/anaconda_support_kernel.bbclass        |  8 +
>          meta-installer/conf/distro/anaconda.conf           | 33 ++
>          meta-installer/conf/layer.conf                     | 31 ++
>          meta-installer/licenses/FLTK                       | 530
>         ++++++++++++++++++
>          .../systemd/files/serial-getty@.service            | 40 ++
>          .../systemd/files/serial-screen-anaconda.sh        |  5 +
>          .../systemd/systemd-serialgetty.bbappend           | 12 +
>          .../recipes-core/systemd/systemd_%.bbappend        |  6 +
>          ...for-anaconda-installer-while-loading-libA.patch | 84 +++
>          .../recipes-gnome/gtk+/gtk+3_%.%.%.bbappend        |  3 +
>          .../xorg-xserver/xserver-xf86-config_0.1.bbappend  | 12 +
>          .../anaconda-init/anaconda-init.bb <http://anaconda-init.bb>
>                |  77 +++
>          .../anaconda-init/anaconda-init/COPYING            | 339
>         ++++++++++++
>          .../anaconda-init/anaconda-init/Xusername          |  1 +
>          .../anaconda-init/anaconda-init/anaconda-init      | 362
>         +++++++++++++
>          .../anaconda-init/anaconda-init-screen@.service    | 22 +
>          .../anaconda-init/anaconda-init.service            | 13 +
>          .../anaconda-init/anaconda-init.target             |  6 +
>          .../anaconda/files/0001-do-not-support-po.patch    | 41 ++
>          ...02-widgets-Makefile.am-do-not-compile-doc.patch | 28 +
>          ...t-Use-system-Python-when-running-Anaconda.patch | 42 ++
>          ...4-pyanaconda-flags.py-drop-selinux-module.patch | 48 ++
>          ...ckage-site-dir-for-installclass-searching.patch | 38 ++
>          ...06-do-not-load-the-system-wide-Xresources.patch | 53 ++
>          .../0007-tweak-iso-mount-dir-and-kernel-name.patch | 95 ++++
>          .../0008-dnfpayload.py-customize-for-WRLinux.patch | 597
>         +++++++++++++++++++++
>          ...cessary-noverifyssl-for-http-ftp-protocol.patch | 32 ++
>          .../0010-dynamic-detect-workable-locale.patch      | 77 +++
>          .../files/0011-improve-thread-monitor.patch        | 55 ++
>          .../anaconda/files/0012-disable-audit.patch        | 64 +++
>          ...py-Change-grub2-settings-to-match-oe-core.patch | 137 +++++
>          .../files/0014-tweak-detect-kernel-version.patch   | 96 ++++
>          .../0015-tweak-grub-config-file-for-WRLinux.patch  | 28 +
>          ...time.tzset-to-apply-timezone-changes-when.patch | 66 +++
>          ...rt-Authconfig-Firewall-Firstboot-Timezone.patch | 216 ++++++++
>          .../files/0018-invisible-help-button.patch         | 32 ++
>          .../0019-disable-non-implemented-functions.patch   | 41 ++
>          .../files/0020-disable-geoloc-by-default.patch     | 30 ++
>          .../anaconda/files/0021-support-UEFI-boot.patch    | 38 ++
>          ...o-not-verify-ssl-certification-by-default.patch | 44 ++
>          .../files/0023-tweak-default-nfs-mount-point.patch | 30 ++
>          .../0024-fix-quoted-empty-string-failed.patch      | 46 ++
>          ...support-ISO-hold-by-hard-drive-partitions.patch | 31 ++
>          ...x-cannot-stat-usr-share-gettext-gettext.h.patch | 27 +
>          .../0027-fix-Wind-River-boot-menu-not-work.patch   | 35 ++
>          .../files/0028-tweak-bootloader-fs-type.patch      | 31 ++
>          .../files/0029-support-timezone-setting.patch      | 95 ++++
>          .../anaconda/files/0030-disable-ntp-support.patch  | 230 ++++++++
>          .../0031-do-not-support-manually-set-time.patch    | 32 ++
>          .../files/0032-support-user-account-creation.patch | 73 +++
>          .../files/0033-detect-existence-of-Xorg.patch      | 45 ++
>          ...-write-network-conf-failed-while-liveinst.patch | 40 ++
>          ...mmits-to-support-reboot-for-live-installs.patch | 72 +++
>          ...tory-setting-do-not-support-local-ISO-fil.patch | 72 +++
>          ...ext-repository-setting-support-http-proxy.patch | 95 ++++
>          ...-set-keyboard-xlayouts-with-us-by-default.patch | 50 ++
>          ...xt-do-not-support-network-setting-for-now.patch | 33 ++
>          .../0040-tweak-boot-storage-sanity-check.patch     | 31 ++
>          ...tart-do-not-support-network-configuration.patch | 29 +
>          ...042-support-to-get-kickstart-from-network.patch | 48 ++
>          ...0043-support-authentication-for-kickstart.patch | 133 +++++
>          ...nloading-file-from-http-ftp-server-to-tar.patch | 175 ++++++
>          .../0045-live-install-supports-kickstart.patch     | 47 ++
>          .../files/0046-support-initramfs-boot.patch        | 48 ++
>          ...47-fix-hang-while-installed-system-reboot.patch | 30 ++
>          ...talled-system-boot-from-encrypt-fs-failed.patch | 48 ++
>          ...n-destination-disable-iSCSI-network-disks.patch | 29 +
>          .../0050-update-region-while-city-changes.patch    | 32 ++
>          .../0051-timezone-fix-set-US-Alaska-failed.patch   | 38 ++
>          ...remove-incorrect-prefix-of-addon-repo-url.patch | 42 ++
>          .../0053-fix-write-sysconfig-network-failed.patch  | 32 ++
>          ...naconda-ui-gui-utils.py-tweak-mouse-arrow.patch | 31 ++
>          ...5-tweak-search-location-of-new-kernel-pkg.patch | 30 ++
>          .../0056-always-write-fstab-after-install.patch    | 31 ++
>          ...e-grub-install-to-generate-efi-filesystem.patch | 60 +++
>          .../files/0058-do-not-support-closest-mirror.patch | 96 ++++
>          .../0059-tweak-MAX_TREEINFO_DOWNLOAD_RETRIES.patch | 42 ++
>          .../anaconda/files/0060-tweak-time-setting.patch   | 106 ++++
>          ...62-Add-dracut-args-for-home-to-bootloader.patch | 35 ++
>          .../files/0063-do-not-customize-window-theme.patch | 55 ++
>          .../files/0064-tweak-product-short-name.patch      | 33 ++
>          .../anaconda/files/0065-disable-dmraid.patch       | 57 ++
>          .../files/0066-tweak-shebang-of-bash.patch         | 25 +
>          .../anaconda/files/0067-Tweak-label-name.patch     | 56 ++
>          ...068-livepayload.py-copy-grub-from-host-os.patch | 51 ++
>          .../files/0069-test-existence-of-noverifyssl.patch | 31 ++
>          .../anaconda/files/81-edit-sudoers.ks              |  3 +
>          .../recipes-installer/anaconda/files/wrlinux.py    | 112 ++++
>          .../anaconda/python3-anaconda_26.21.11.bb
>         <http://python3-anaconda_26.21.11.bb>         | 161 ++++++
>          .../images/core-image-anaconda-initramfs.bb
>         <http://core-image-anaconda-initramfs.bb>       |  33 ++
>          .../images/core-image-anaconda.bb
>         <http://core-image-anaconda.bb>               |  34 ++
>          .../initrdscripts/files/init-live.sh               | 249
>         +++++++++
>          .../initrdscripts/initramfs-live-boot_1.0.bbappend |  5 +
>          .../recipes-installer/logos/yocto-compat-logos.bb
>         <http://yocto-compat-logos.bb> |  24 +
>          .../logos/yocto-compat-logos/COPYING               | 339
>         ++++++++++++
>          .../logos/yocto-compat-logos/banner_yocto1.png     | Bin 0 ->
>         44650 bytes
>          .../logos/yocto-compat-logos/banner_yocto2.png     | Bin 0 ->
>         39223 bytes
>          .../logos/yocto-compat-logos/sidebar-logo.png      | Bin 0 ->
>         17651 bytes
>          .../logos/yocto-compat-logos/topbar-bg.png         | Bin 0 ->
>         77956 bytes
>          .../packagegroup-installer-x11-anaconda.bb
>         <http://packagegroup-installer-x11-anaconda.bb>        |  28 +
>          .../packagegroups/packagegroup-anaconda-support.bb
>         <http://packagegroup-anaconda-support.bb> |  26 +
>          .../recipes-kernel/linux/files/crypt.cfg           |  2 +
>          .../recipes-kernel/linux/files/crypt.scc           |  1 +
>          .../recipes-kernel/linux/files/dmthin.cfg          |  1 +
>          .../recipes-kernel/linux/files/dmthin.scc          |  1 +
>          .../recipes-kernel/linux/files/efivars.cfg         |  1 +
>          .../recipes-kernel/linux/files/efivars.scc         |  1 +
>          meta-installer/recipes-kernel/linux/files/ide.cfg  |  5 +
>          meta-installer/recipes-kernel/linux/files/ide.scc  |  1 +
>          .../recipes-kernel/linux/files/liveinstall.cfg     |  5 +
>          .../recipes-kernel/linux/files/liveinstall.scc     |  1 +
>          .../recipes-kernel/linux/files/multipath.cfg       |  3 +
>          .../recipes-kernel/linux/files/multipath.scc       |  1 +
>          .../multipath-tools/multipath-tools_%.bbappend     |  8 +
>          120 files changed, 7845 insertions(+)
>          create mode 100644 meta-installer/COPYING.MIT
>          create mode 100644 meta-installer/README
>          create mode 100644 meta-installer/README.anaconda
>          create mode 100644 meta-installer/classes/anaconda_image.bbclass
>          create mode 100644 meta-installer/classes/anaconda_kernel.bbclass
>          create mode 100644
>         meta-installer/classes/anaconda_support_image.bbclass
>          create mode 100644
>         meta-installer/classes/anaconda_support_kernel.bbclass
>          create mode 100644 meta-installer/conf/distro/anaconda.conf
>          create mode 100644 meta-installer/conf/layer.conf
>          create mode 100644 meta-installer/licenses/FLTK
>          create mode 100644
>         meta-installer/recipes-core/systemd/files/serial-getty@.service
>          create mode 100644
>         meta-installer/recipes-core/systemd/files/serial-screen-anaconda.sh
>          create mode 100644
>         meta-installer/recipes-core/systemd/systemd-serialgetty.bbappend
>          create mode 100644
>         meta-installer/recipes-core/systemd/systemd_%.bbappend
>          create mode 100644
>         meta-installer/recipes-gnome/gtk+/files/workaround-for-anaconda-installer-while-loading-libA.patch
>          create mode 100644
>         meta-installer/recipes-gnome/gtk+/gtk+3_%.%.%.bbappend
>          create mode 100644
>         meta-installer/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bbappend
>          create mode 100644
>         meta-installer/recipes-installer/anaconda-init/anaconda-init.bb
>         <http://anaconda-init.bb>
>          create mode 100644
>         meta-installer/recipes-installer/anaconda-init/anaconda-init/COPYING
>          create mode 100644
>         meta-installer/recipes-installer/anaconda-init/anaconda-init/Xusername
>          create mode 100644
>         meta-installer/recipes-installer/anaconda-init/anaconda-init/anaconda-init
>          create mode 100644
>         meta-installer/recipes-installer/anaconda-init/anaconda-init/anaconda-init-screen@.service
>          create mode 100644
>         meta-installer/recipes-installer/anaconda-init/anaconda-init/anaconda-init.service
>          create mode 100644
>         meta-installer/recipes-installer/anaconda-init/anaconda-init/anaconda-init.target
>          create mode 100644
>         meta-installer/recipes-installer/anaconda/files/0001-do-not-support-po.patch
>          create mode 100644
>         meta-installer/recipes-installer/anaconda/files/0002-widgets-Makefile.am-do-not-compile-doc.patch
>          create mode 100644
>         meta-installer/recipes-installer/anaconda/files/0003-Revert-Use-system-Python-when-running-Anaconda.patch
>          create mode 100644
>         meta-installer/recipes-installer/anaconda/files/0004-pyanaconda-flags.py-drop-selinux-module.patch
>          create mode 100644
>         meta-installer/recipes-installer/anaconda/files/0005-add-package-site-dir-for-installclass-searching.patch
>          create mode 100644
>         meta-installer/recipes-installer/anaconda/files/0006-do-not-load-the-system-wide-Xresources.patch
>          create mode 100644
>         meta-installer/recipes-installer/anaconda/files/0007-tweak-iso-mount-dir-and-kernel-name.patch
>          create mode 100644
>         meta-installer/recipes-installer/anaconda/files/0008-dnfpayload.py-customize-for-WRLinux.patch
>          create mode 100644
>         meta-installer/recipes-installer/anaconda/files/0009-Remove-unnecessary-noverifyssl-for-http-ftp-protocol.patch
>          create mode 100644
>         meta-installer/recipes-installer/anaconda/files/0010-dynamic-detect-workable-locale.patch
>          create mode 100644
>         meta-installer/recipes-installer/anaconda/files/0011-improve-thread-monitor.patch
>          create mode 100644
>         meta-installer/recipes-installer/anaconda/files/0012-disable-audit.patch
>          create mode 100644
>         meta-installer/recipes-installer/anaconda/files/0013-bootloader.py-Change-grub2-settings-to-match-oe-core.patch
>          create mode 100644
>         meta-installer/recipes-installer/anaconda/files/0014-tweak-detect-kernel-version.patch
>          create mode 100644
>         meta-installer/recipes-installer/anaconda/files/0015-tweak-grub-config-file-for-WRLinux.patch
>          create mode 100644
>         meta-installer/recipes-installer/anaconda/files/0016-Revert-Use-time.tzset-to-apply-timezone-changes-when.patch
>          create mode 100644
>         meta-installer/recipes-installer/anaconda/files/0017-kickstart-Authconfig-Firewall-Firstboot-Timezone.patch
>          create mode 100644
>         meta-installer/recipes-installer/anaconda/files/0018-invisible-help-button.patch
>          create mode 100644
>         meta-installer/recipes-installer/anaconda/files/0019-disable-non-implemented-functions.patch
>          create mode 100644
>         meta-installer/recipes-installer/anaconda/files/0020-disable-geoloc-by-default.patch
>          create mode 100644
>         meta-installer/recipes-installer/anaconda/files/0021-support-UEFI-boot.patch
>          create mode 100644
>         meta-installer/recipes-installer/anaconda/files/0022-do-not-verify-ssl-certification-by-default.patch
>          create mode 100644
>         meta-installer/recipes-installer/anaconda/files/0023-tweak-default-nfs-mount-point.patch
>          create mode 100644
>         meta-installer/recipes-installer/anaconda/files/0024-fix-quoted-empty-string-failed.patch
>          create mode 100644
>         meta-installer/recipes-installer/anaconda/files/0025-do-not-support-ISO-hold-by-hard-drive-partitions.patch
>          create mode 100644
>         meta-installer/recipes-installer/anaconda/files/0026-fix-cannot-stat-usr-share-gettext-gettext.h.patch
>          create mode 100644
>         meta-installer/recipes-installer/anaconda/files/0027-fix-Wind-River-boot-menu-not-work.patch
>          create mode 100644
>         meta-installer/recipes-installer/anaconda/files/0028-tweak-bootloader-fs-type.patch
>          create mode 100644
>         meta-installer/recipes-installer/anaconda/files/0029-support-timezone-setting.patch
>          create mode 100644
>         meta-installer/recipes-installer/anaconda/files/0030-disable-ntp-support.patch
>          create mode 100644
>         meta-installer/recipes-installer/anaconda/files/0031-do-not-support-manually-set-time.patch
>          create mode 100644
>         meta-installer/recipes-installer/anaconda/files/0032-support-user-account-creation.patch
>          create mode 100644
>         meta-installer/recipes-installer/anaconda/files/0033-detect-existence-of-Xorg.patch
>          create mode 100644
>         meta-installer/recipes-installer/anaconda/files/0034-fix-write-network-conf-failed-while-liveinst.patch
>          create mode 100644
>         meta-installer/recipes-installer/anaconda/files/0035-revert-commits-to-support-reboot-for-live-installs.patch
>          create mode 100644
>         meta-installer/recipes-installer/anaconda/files/0036-text-repository-setting-do-not-support-local-ISO-fil.patch
>          create mode 100644
>         meta-installer/recipes-installer/anaconda/files/0037-text-repository-setting-support-http-proxy.patch
>          create mode 100644
>         meta-installer/recipes-installer/anaconda/files/0038-set-keyboard-xlayouts-with-us-by-default.patch
>          create mode 100644
>         meta-installer/recipes-installer/anaconda/files/0039-text-do-not-support-network-setting-for-now.patch
>          create mode 100644
>         meta-installer/recipes-installer/anaconda/files/0040-tweak-boot-storage-sanity-check.patch
>          create mode 100644
>         meta-installer/recipes-installer/anaconda/files/0041-kickstart-do-not-support-network-configuration.patch
>          create mode 100644
>         meta-installer/recipes-installer/anaconda/files/0042-support-to-get-kickstart-from-network.patch
>          create mode 100644
>         meta-installer/recipes-installer/anaconda/files/0043-support-authentication-for-kickstart.patch
>          create mode 100644
>         meta-installer/recipes-installer/anaconda/files/0044-support-downloading-file-from-http-ftp-server-to-tar.patch
>          create mode 100644
>         meta-installer/recipes-installer/anaconda/files/0045-live-install-supports-kickstart.patch
>          create mode 100644
>         meta-installer/recipes-installer/anaconda/files/0046-support-initramfs-boot.patch
>          create mode 100644
>         meta-installer/recipes-installer/anaconda/files/0047-fix-hang-while-installed-system-reboot.patch
>          create mode 100644
>         meta-installer/recipes-installer/anaconda/files/0048-fix-installed-system-boot-from-encrypt-fs-failed.patch
>          create mode 100644
>         meta-installer/recipes-installer/anaconda/files/0049-installation-destination-disable-iSCSI-network-disks.patch
>          create mode 100644
>         meta-installer/recipes-installer/anaconda/files/0050-update-region-while-city-changes.patch
>          create mode 100644
>         meta-installer/recipes-installer/anaconda/files/0051-timezone-fix-set-US-Alaska-failed.patch
>          create mode 100644
>         meta-installer/recipes-installer/anaconda/files/0052-remove-incorrect-prefix-of-addon-repo-url.patch
>          create mode 100644
>         meta-installer/recipes-installer/anaconda/files/0053-fix-write-sysconfig-network-failed.patch
>          create mode 100644
>         meta-installer/recipes-installer/anaconda/files/0054-pyanaconda-ui-gui-utils.py-tweak-mouse-arrow.patch
>          create mode 100644
>         meta-installer/recipes-installer/anaconda/files/0055-tweak-search-location-of-new-kernel-pkg.patch
>          create mode 100644
>         meta-installer/recipes-installer/anaconda/files/0056-always-write-fstab-after-install.patch
>          create mode 100644
>         meta-installer/recipes-installer/anaconda/files/0057-invoke-grub-install-to-generate-efi-filesystem.patch
>          create mode 100644
>         meta-installer/recipes-installer/anaconda/files/0058-do-not-support-closest-mirror.patch
>          create mode 100644
>         meta-installer/recipes-installer/anaconda/files/0059-tweak-MAX_TREEINFO_DOWNLOAD_RETRIES.patch
>          create mode 100644
>         meta-installer/recipes-installer/anaconda/files/0060-tweak-time-setting.patch
>          create mode 100644
>         meta-installer/recipes-installer/anaconda/files/0062-Add-dracut-args-for-home-to-bootloader.patch
>          create mode 100644
>         meta-installer/recipes-installer/anaconda/files/0063-do-not-customize-window-theme.patch
>          create mode 100644
>         meta-installer/recipes-installer/anaconda/files/0064-tweak-product-short-name.patch
>          create mode 100644
>         meta-installer/recipes-installer/anaconda/files/0065-disable-dmraid.patch
>          create mode 100644
>         meta-installer/recipes-installer/anaconda/files/0066-tweak-shebang-of-bash.patch
>          create mode 100644
>         meta-installer/recipes-installer/anaconda/files/0067-Tweak-label-name.patch
>          create mode 100644
>         meta-installer/recipes-installer/anaconda/files/0068-livepayload.py-copy-grub-from-host-os.patch
>          create mode 100644
>         meta-installer/recipes-installer/anaconda/files/0069-test-existence-of-noverifyssl.patch
>          create mode 100644
>         meta-installer/recipes-installer/anaconda/files/81-edit-sudoers.ks
>          create mode 100644
>         meta-installer/recipes-installer/anaconda/files/wrlinux.py
>          create mode 100755
>         meta-installer/recipes-installer/anaconda/python3-anaconda_26.21.11.bb
>         <http://python3-anaconda_26.21.11.bb>
>          create mode 100644
>         meta-installer/recipes-installer/images/core-image-anaconda-initramfs.bb
>         <http://core-image-anaconda-initramfs.bb>
>          create mode 100644
>         meta-installer/recipes-installer/images/core-image-anaconda.bb
>         <http://core-image-anaconda.bb>
>          create mode 100644
>         meta-installer/recipes-installer/initrdscripts/files/init-live.sh
>          create mode 100644
>         meta-installer/recipes-installer/initrdscripts/initramfs-live-boot_1.0.bbappend
>          create mode 100644
>         meta-installer/recipes-installer/logos/yocto-compat-logos.bb
>         <http://yocto-compat-logos.bb>
>          create mode 100644
>         meta-installer/recipes-installer/logos/yocto-compat-logos/COPYING
>          create mode 100644
>         meta-installer/recipes-installer/logos/yocto-compat-logos/banner_yocto1.png
>          create mode 100644
>         meta-installer/recipes-installer/logos/yocto-compat-logos/banner_yocto2.png
>          create mode 100644
>         meta-installer/recipes-installer/logos/yocto-compat-logos/sidebar-logo.png
>          create mode 100644
>         meta-installer/recipes-installer/logos/yocto-compat-logos/topbar-bg.png
>          create mode 100644
>         meta-installer/recipes-installer/packagegroups/packagegroup-installer-x11-anaconda.bb
>         <http://packagegroup-installer-x11-anaconda.bb>
>          create mode 100644
>         meta-installer/recipes-installersupport/packagegroups/packagegroup-anaconda-support.bb
>         <http://packagegroup-anaconda-support.bb>
>          create mode 100644
>         meta-installer/recipes-kernel/linux/files/crypt.cfg
>          create mode 100644
>         meta-installer/recipes-kernel/linux/files/crypt.scc
>          create mode 100644
>         meta-installer/recipes-kernel/linux/files/dmthin.cfg
>          create mode 100644
>         meta-installer/recipes-kernel/linux/files/dmthin.scc
>          create mode 100644
>         meta-installer/recipes-kernel/linux/files/efivars.cfg
>          create mode 100644
>         meta-installer/recipes-kernel/linux/files/efivars.scc
>          create mode 100644
>         meta-installer/recipes-kernel/linux/files/ide.cfg
>          create mode 100644
>         meta-installer/recipes-kernel/linux/files/ide.scc
>          create mode 100644
>         meta-installer/recipes-kernel/linux/files/liveinstall.cfg
>          create mode 100644
>         meta-installer/recipes-kernel/linux/files/liveinstall.scc
>          create mode 100644
>         meta-installer/recipes-kernel/linux/files/multipath.cfg
>          create mode 100644
>         meta-installer/recipes-kernel/linux/files/multipath.scc
>          create mode 100644
>         meta-installer/recipes-support/multipath-tools/multipath-tools_%.bbappend
>
>
>         --
>         2.8.1
>
>         --
>         _______________________________________________
>         Openembedded-devel mailing list
>         Openembedded-devel@lists.openembedded.org
>         <mailto:Openembedded-devel@lists.openembedded.org>
>         http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>


