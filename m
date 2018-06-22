Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id AA9DA7554F
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Jun 2018 02:03:31 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w5M23VRg005220
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 21 Jun 2018 19:03:31 -0700 (PDT)
Received: from [128.224.162.179] (128.224.162.179) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.399.0;
	Thu, 21 Jun 2018 19:03:30 -0700
To: Khem Raj <raj.khem@gmail.com>, <openembedded-devel@lists.openembedded.org>
References: <20180621075845.5422-1-kai.kang@windriver.com>
	<20180621075845.5422-2-kai.kang@windriver.com>
	<38fa69a5-e34a-4eae-ae74-5fa5066e40d4@gmail.com>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <b550f031-050f-eb5e-d872-b690cf91f064@windriver.com>
Date: Fri, 22 Jun 2018 10:03:36 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <38fa69a5-e34a-4eae-ae74-5fa5066e40d4@gmail.com>
Subject: Re: [PATCH 1/1] mozjs17: exclude mips64 from COMPATIBLE_HOST
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
X-List-Received-Date: Fri, 22 Jun 2018 02:03:31 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 2018年06月22日 07:22, Khem Raj wrote:
> Hi Kai
>
> On 6/21/18 12:58 AM, kai.kang@windriver.com wrote:
>> From: Kai Kang <kai.kang@windriver.com>
>>
>> The latest stable version of package polkit is 0.113 which requires
>> mozjs 17. mozjs 17 doesn't support mips64. mips64 has been supported
>> from mozjs 45.
>>
>> https://bugzilla.mozilla.org/show_bug.cgi?id=1140954
>>
>> Exclude mips64 from COMPATIBLE_HOST for mozjs, polkit and packages which
>> depend on polkit directly or indirectly. And remove 'polkit' from
>> PACKAGECONFIG of modemmanager for mips64.
>>
>
> I would suggest that we consider the option of upgrading mozjs to 45+
> and also upgrade polkit to 0.114 which was released few months ago.

Sorry, I forgot to write more about it in cover letter.
According to file 'NEWS' in polkit repo, version 0.114 is a development 
release.

https://cgit.freedesktop.org/polkit/log/NEWS

--------------
polkit 0.114
--------------

WARNING WARNING WARNING: This is a prerelease on the road to polkit
1.0. Public API might change and certain parts of the code still needs
some security review. Use at your own risk.

So I suppose we should not upgrade to 0.114 and the follwing 0.115. And 
it seems
version 1.0 will not be released soon, that why I send this 
COMPATIBALE_HOST patch.

Thanks,
Kai

>
>
>> Signed-off-by: Kai Kang <kai.kang@windriver.com>
>> ---
>>   .../network-manager-applet/network-manager-applet_1.8.10.bb  | 5 +++++
>>   meta-gnome/recipes-gnome/gedit/gedit_2.30.4.bb               | 5 +++++
>>   meta-gnome/recipes-gnome/gvfs/gvfs_1.36.0.bb                 | 3 +++
>>   .../networkmanager/networkmanager-openvpn_1.2.8.bb           | 5 +++++
>>   .../networkmanager/networkmanager_1.10.6.bb                  | 3 +++
>>   .../python-networkmanager/python-networkmanager_2.0.1.bb     | 5 +++++
>>   .../modemmanager/modemmanager_1.7.991.bb                     | 2 ++
>>   meta-oe/recipes-extended/mozjs/mozjs_17.0.0.bb               | 3 +++
>>   meta-oe/recipes-extended/polkit/polkit-group-rule.inc        | 3 +++
>>   meta-oe/recipes-extended/polkit/polkit_0.113.bb              | 3 +++
>>   meta-oe/recipes-support/udisks/udisks2_2.7.6.bb              | 3 +++
>>   meta-oe/recipes-support/udisks/udisks_1.0.5.bb               | 3 +++
>>   meta-oe/recipes-support/upower/upower_0.99.7.bb              | 3 +++
>>   meta-xfce/classes/thunar-plugin.bbclass                      | 5 +++++
>>   meta-xfce/recipes-apps/xfce-polkit/xfce-polkit_0.2.bb        | 3 +++
>>   meta-xfce/recipes-core/images/core-image-minimal-xfce.bb     | 5 +++++
>>   .../systemload/xfce4-systemload-plugin_1.2.1.bb              | 5 +++++
>>   .../weather/xfce4-weather-plugin_0.8.10.bb                   | 5 +++++
>>   .../recipes-panel-plugins/xkb/xfce4-xkb-plugin_0.8.1.bb      | 5 +++++
>>   .../recipes-xfce/packagegroups/packagegroup-xfce-base.bb     | 4 ++++
>>   .../recipes-xfce/packagegroups/packagegroup-xfce-extended.bb | 4 ++++
>>   meta-xfce/recipes-xfce/thunar/thunar_1.8.0.bb                | 5 +++++
>>   .../xfce4-power-manager/xfce4-power-manager_1.6.1.bb         | 5 +++++
>>   meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.12.1.bb | 3 +++
>>   meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_git.bb  | 5 +++++
>>   meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.12.4.bb         | 5 +++++
>>   26 files changed, 105 insertions(+)
>>
>> diff --git 
>> a/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.8.10.bb 
>> b/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.8.10.bb 
>>
>> index 91ae8b740..581243354 100644
>> --- 
>> a/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.8.10.bb
>> +++ 
>> b/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.8.10.bb
>> @@ -14,6 +14,11 @@ REQUIRED_DISTRO_FEATURES = "x11"
>>   SRC_URI[archive.md5sum] = "eae3be75e77ff1a7ea3174be25e62d03"
>>   SRC_URI[archive.sha256sum] = 
>> "0adc4bfae8b49f7a1d929c22ef20933bd41fb4a8b458280f44c65f9e45b4c9c3"
>>   +# dependency chain:
>> +# networkmanager -> polkit -> mozjs17
>> +# mozjs17 does not support mips64
>> +COMPATIBLE_HOST = "^(?!mips64).*"
>> +
>>   PACKAGECONFIG[modemmanager] = 
>> "--with-wwan,--without-wwan,modemmanager"
>>   PACKAGECONFIG ??= ""
>>   diff --git a/meta-gnome/recipes-gnome/gedit/gedit_2.30.4.bb 
>> b/meta-gnome/recipes-gnome/gedit/gedit_2.30.4.bb
>> index ba425ad6b..bd8e51c59 100644
>> --- a/meta-gnome/recipes-gnome/gedit/gedit_2.30.4.bb
>> +++ b/meta-gnome/recipes-gnome/gedit/gedit_2.30.4.bb
>> @@ -22,6 +22,11 @@ SRC_URI[archive.md5sum] = 
>> "e1eecb0a92a1a363b3d375ec5ac0fb3b"
>>   SRC_URI[archive.sha256sum] = 
>> "a561fe3dd1d199baede1bd07c4ee65f06fc7c494dd4d3327117f04149a608e3c"
>>   GNOME_COMPRESS_TYPE="bz2"
>>   +# dependency chain:
>> +# gvfs -> polkit -> mozjs17
>> +# mozjs17 does not support mips64
>> +COMPATIBLE_HOST = "^(?!mips64).*"
>> +
>>   EXTRA_OECONF = "--disable-scrollkeeper \
>>                   --enable-gvfs-metadata"
>>   diff --git a/meta-gnome/recipes-gnome/gvfs/gvfs_1.36.0.bb 
>> b/meta-gnome/recipes-gnome/gvfs/gvfs_1.36.0.bb
>> index 5f7391285..641253204 100644
>> --- a/meta-gnome/recipes-gnome/gvfs/gvfs_1.36.0.bb
>> +++ b/meta-gnome/recipes-gnome/gvfs/gvfs_1.36.0.bb
>> @@ -16,6 +16,9 @@ do_configure_prepend() {
>>       touch ${S}/ABOUT-NLS
>>   }
>>   +# polkit depends on mozjs17 which not support mips64
>> +COMPATIBLE_HOST = "^(?!mips64).*"
>> +
>>   EXTRA_OECONF = " \
>>       --disable-gdu \
>>       --enable-udisks2 \
>> diff --git 
>> a/meta-networking/recipes-connectivity/networkmanager/networkmanager-openvpn_1.2.8.bb 
>> b/meta-networking/recipes-connectivity/networkmanager/networkmanager-openvpn_1.2.8.bb 
>>
>> index 1b604ad52..4b013ad76 100644
>> --- 
>> a/meta-networking/recipes-connectivity/networkmanager/networkmanager-openvpn_1.2.8.bb
>> +++ 
>> b/meta-networking/recipes-connectivity/networkmanager/networkmanager-openvpn_1.2.8.bb
>> @@ -14,6 +14,11 @@ SRC_URI[sha256sum] = 
>> "3e0b4007f248d96df4b8eb5d0f937536044af7053debbbf525e67c9bc5
>>     S = "${WORKDIR}/NetworkManager-openvpn-${PV}"
>>   +# dependency chain:
>> +# networkmanager -> polkit -> mozjs17
>> +# mozjs17 does not support mips64
>> +COMPATIBLE_HOST = "^(?!mips64).*"
>> +
>>   PACKAGECONFIG[gnome] = "--with-gnome,--without-gnome"
>>     do_install_append () {
>> diff --git 
>> a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.10.6.bb 
>> b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.10.6.bb 
>>
>> index 605d371b1..10e22c773 100644
>> --- 
>> a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.10.6.bb
>> +++ 
>> b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.10.6.bb
>> @@ -43,6 +43,9 @@ SRC_URI[sha256sum] = 
>> "6af0b1e856a3725f88791f55c4fbb04105dc0b20dbf182aaec8aad1648
>>     S = "${WORKDIR}/NetworkManager-${PV}"
>>   +# polkit depends on mozjs17 which not support mips64
>> +COMPATIBLE_HOST = "^(?!mips64).*"
>> +
>>   EXTRA_OECONF = " \
>>       --disable-ifcfg-rh \
>>       --disable-ifnet \
>> diff --git 
>> a/meta-networking/recipes-connectivity/python-networkmanager/python-networkmanager_2.0.1.bb 
>> b/meta-networking/recipes-connectivity/python-networkmanager/python-networkmanager_2.0.1.bb 
>>
>> index 4e41aa576..9e583b2ef 100644
>> --- 
>> a/meta-networking/recipes-connectivity/python-networkmanager/python-networkmanager_2.0.1.bb
>> +++ 
>> b/meta-networking/recipes-connectivity/python-networkmanager/python-networkmanager_2.0.1.bb
>> @@ -10,4 +10,9 @@ SRC_URI[sha256sum] = 
>> "bc36507506ad29bfdac941b0987ebd1cc9633c9a9291d7378e229e4515
>>   PYPI_PACKAGE = "python-networkmanager"
>>   inherit pypi setuptools
>>   +# dependency chain:
>> +# networkmanager -> polkit -> mozjs17
>> +# mozjs17 does not support mips64
>> +COMPATIBLE_HOST = "^(?!mips64).*"
>> +
>>   RDEPENDS_${PN} = "networkmanager python-dbus python-six"
>> diff --git 
>> a/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.7.991.bb 
>> b/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.7.991.bb
>> index 26b56d17d..9f5be637e 100644
>> --- a/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.7.991.bb
>> +++ b/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.7.991.bb
>> @@ -23,6 +23,8 @@ S = "${WORKDIR}/ModemManager-${PV}"
>>   PACKAGECONFIG ??= "mbim qmi polkit \
>>       ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)} \
>>   "
>> +# polkit depends on mozjs which not support mips64
>> +PACKAGECONFIG_remove_mips64 = "polkit"
>>     PACKAGECONFIG[systemd] = 
>> "--with-systemdsystemunitdir=${systemd_unitdir}/system/,,"
>>   PACKAGECONFIG[polkit] = "--with-polkit=yes,--with-polkit=no,polkit"
>> diff --git a/meta-oe/recipes-extended/mozjs/mozjs_17.0.0.bb 
>> b/meta-oe/recipes-extended/mozjs/mozjs_17.0.0.bb
>> index 49b7f156e..7f8f0529b 100644
>> --- a/meta-oe/recipes-extended/mozjs/mozjs_17.0.0.bb
>> +++ b/meta-oe/recipes-extended/mozjs/mozjs_17.0.0.bb
>> @@ -50,6 +50,9 @@ EXTRA_OECONF_append_armv4 = " \
>>   PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}"
>>   PACKAGECONFIG[x11] = "--with-x --x-includes=${STAGING_INCDIR} 
>> --x-libraries=${STAGING_LIBDIR},--without-x,virtual/libx11"
>>   +# mozjs17 does not support mips64
>> +COMPATIBLE_HOST = "^(?!mips64).*"
>> +
>>   # mozjs requires autoreconf 2.13
>>   do_configure() {
>>       export HOST_CFLAGS="${BUILD_CFLAGS}"
>> diff --git a/meta-oe/recipes-extended/polkit/polkit-group-rule.inc 
>> b/meta-oe/recipes-extended/polkit/polkit-group-rule.inc
>> index 40e400542..d4befc8bb 100644
>> --- a/meta-oe/recipes-extended/polkit/polkit-group-rule.inc
>> +++ b/meta-oe/recipes-extended/polkit/polkit-group-rule.inc
>> @@ -1,6 +1,9 @@
>>   # polkit must prepare polkitd group
>>   DEPENDS += "polkit"
>>   +# polkit depends on mozjs17 which not support mips64
>> +COMPATIBLE_HOST = "^(?!mips64).*"
>> +
>>   inherit useradd
>>     do_install_prepend() {
>> diff --git a/meta-oe/recipes-extended/polkit/polkit_0.113.bb 
>> b/meta-oe/recipes-extended/polkit/polkit_0.113.bb
>> index f34928fe3..f9c3cdf75 100644
>> --- a/meta-oe/recipes-extended/polkit/polkit_0.113.bb
>> +++ b/meta-oe/recipes-extended/polkit/polkit_0.113.bb
>> @@ -27,6 +27,9 @@ SRC_URI = 
>> "http://www.freedesktop.org/software/polkit/releases/polkit-${PV}.tar.
>>   SRC_URI[md5sum] = "4b77776c9e4f897dcfe03b2c34198edf"
>>   SRC_URI[sha256sum] = 
>> "e1c095093c654951f78f8618d427faf91cf62abdefed98de40ff65eca6413c81"
>>   +# mozjs17 does not support mips64
>> +COMPATIBLE_HOST = "^(?!mips64).*"
>> +
>>   EXTRA_OECONF = "--with-os-type=moblin --disable-man-pages"
>>     do_compile_prepend () {
>> diff --git a/meta-oe/recipes-support/udisks/udisks2_2.7.6.bb 
>> b/meta-oe/recipes-support/udisks/udisks2_2.7.6.bb
>> index 4d22afd0d..1340074c5 100644
>> --- a/meta-oe/recipes-support/udisks/udisks2_2.7.6.bb
>> +++ b/meta-oe/recipes-support/udisks/udisks2_2.7.6.bb
>> @@ -28,6 +28,9 @@ S = "${WORKDIR}/git"
>>     CVE_PRODUCT = "udisks"
>>   +# polkit depends on mozjs17 which does NOT support mips64
>> +COMPATIBLE_HOST = "^(?!mips64).*"
>> +
>>   inherit autotools systemd gtk-doc gobject-introspection
>>     EXTRA_OECONF = "--disable-man --disable-gtk-doc"
>> diff --git a/meta-oe/recipes-support/udisks/udisks_1.0.5.bb 
>> b/meta-oe/recipes-support/udisks/udisks_1.0.5.bb
>> index e33266001..a80238392 100644
>> --- a/meta-oe/recipes-support/udisks/udisks_1.0.5.bb
>> +++ b/meta-oe/recipes-support/udisks/udisks_1.0.5.bb
>> @@ -22,6 +22,9 @@ SRC_URI = " \
>>   SRC_URI[udisks.md5sum] = "70d48dcfe523a74cd7c7fbbc2847fcdd"
>>   SRC_URI[udisks.sha256sum] = 
>> "f2ec82eb0ea7e01dc299b5b29b3c18cdf861236ec43dcff66b3552b4b31c6f71"
>>   +# polkit depends on mozjs17 which does not support mips64
>> +COMPATIBLE_HOST = "^(?!mips64).*"
>> +
>>   inherit autotools-brokensep systemd gtk-doc
>>     PACKAGECONFIG ??= "libdevmapper"
>> diff --git a/meta-oe/recipes-support/upower/upower_0.99.7.bb 
>> b/meta-oe/recipes-support/upower/upower_0.99.7.bb
>> index 973fbe771..27f1a70b6 100644
>> --- a/meta-oe/recipes-support/upower/upower_0.99.7.bb
>> +++ b/meta-oe/recipes-support/upower/upower_0.99.7.bb
>> @@ -8,6 +8,9 @@ SRC_URI = 
>> "http://upower.freedesktop.org/releases/${BPN}-${PV}.tar.xz"
>>   SRC_URI[md5sum] = "236bb439d9ff1151450b3d8582399532"
>>   SRC_URI[sha256sum] = 
>> "24bcc2f6ab25a2533bac70b587bcb019e591293076920f5b5e04bdedc140a401"
>>   +# polkit depends on mozjs17 which does not support mips64
>> +COMPATIBLE_HOST = "^(?!mips64).*"
>> +
>>   inherit autotools pkgconfig gettext gobject-introspection systemd
>>     PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 
>> 'systemd', d)}"
>> diff --git a/meta-xfce/classes/thunar-plugin.bbclass 
>> b/meta-xfce/classes/thunar-plugin.bbclass
>> index 692f121d8..2f6216ba3 100644
>> --- a/meta-xfce/classes/thunar-plugin.bbclass
>> +++ b/meta-xfce/classes/thunar-plugin.bbclass
>> @@ -4,6 +4,11 @@ REQUIRED_DISTRO_FEATURES = "x11"
>>     DEPENDS += "thunar"
>>   +# dependency chain:
>> +# thunar -> gvfs -> polkit -> mozjs17
>> +# mozjs17 does not support mips64
>> +COMPATIBLE_HOST = "^(?!mips64).*"
>> +
>>   SRC_URI = 
>> "http://archive.xfce.org/src/thunar-plugins/${BPN}/${@'${PV}'[0:3]}/${BPN}-${PV}.tar.bz2"
>>     FILES_${PN} += "${libdir}/thunarx-3/*.so"
>> diff --git a/meta-xfce/recipes-apps/xfce-polkit/xfce-polkit_0.2.bb 
>> b/meta-xfce/recipes-apps/xfce-polkit/xfce-polkit_0.2.bb
>> index 54bf7c752..2fa5300f1 100644
>> --- a/meta-xfce/recipes-apps/xfce-polkit/xfce-polkit_0.2.bb
>> +++ b/meta-xfce/recipes-apps/xfce-polkit/xfce-polkit_0.2.bb
>> @@ -12,3 +12,6 @@ SRC_URI = " \
>>   "
>>   SRCREV = "6ad1ee833c9e22e4dd72a8f7d54562d046965283"
>>   S = "${WORKDIR}/git"
>> +
>> +# polkit depends on mozjs17 which not support mips64
>> +COMPATIBLE_HOST = "^(?!mips64).*"
>> diff --git a/meta-xfce/recipes-core/images/core-image-minimal-xfce.bb 
>> b/meta-xfce/recipes-core/images/core-image-minimal-xfce.bb
>> index 21930ba14..99ce78cb5 100644
>> --- a/meta-xfce/recipes-core/images/core-image-minimal-xfce.bb
>> +++ b/meta-xfce/recipes-core/images/core-image-minimal-xfce.bb
>> @@ -16,3 +16,8 @@ LICENSE = "MIT"
>>   export IMAGE_BASENAME = "core-image-minimal-xfce"
>>     inherit core-image
>> +
>> +# dependency chain:
>> +# packagegroup-xfce-base -> xfce4-session -> polkit -> mozjs17
>> +# mozjs17 does not support mips64
>> +COMPATIBLE_HOST = "^(?!mips64).*"
>> diff --git 
>> a/meta-xfce/recipes-panel-plugins/systemload/xfce4-systemload-plugin_1.2.1.bb 
>> b/meta-xfce/recipes-panel-plugins/systemload/xfce4-systemload-plugin_1.2.1.bb 
>>
>> index eeb451863..c95d59eee 100644
>> --- 
>> a/meta-xfce/recipes-panel-plugins/systemload/xfce4-systemload-plugin_1.2.1.bb
>> +++ 
>> b/meta-xfce/recipes-panel-plugins/systemload/xfce4-systemload-plugin_1.2.1.bb
>> @@ -9,3 +9,8 @@ DEPENDS += "upower"
>>     SRC_URI[md5sum] = "550277af9886c47005117110f6e7ec0d"
>>   SRC_URI[sha256sum] = 
>> "2bf7d0802534a1eb2e9f251af2bb97abc3f58608c1f01511d302c06111d34812"
>> +
>> +# dependency chain:
>> +# upower -> polkit -> mozjs17
>> +# polkit depends on mozjs17 which not support mips64
>> +COMPATIBLE_HOST = "^(?!mips64).*"
>> diff --git 
>> a/meta-xfce/recipes-panel-plugins/weather/xfce4-weather-plugin_0.8.10.bb 
>> b/meta-xfce/recipes-panel-plugins/weather/xfce4-weather-plugin_0.8.10.bb
>> index 649eaaafb..f3468ed7a 100644
>> --- 
>> a/meta-xfce/recipes-panel-plugins/weather/xfce4-weather-plugin_0.8.10.bb
>> +++ 
>> b/meta-xfce/recipes-panel-plugins/weather/xfce4-weather-plugin_0.8.10.bb
>> @@ -10,4 +10,9 @@ DEPENDS += "libsoup-2.4 dbus-glib upower"
>>   SRC_URI[md5sum] = "bba7f750b97c8fc3656715268edad792"
>>   SRC_URI[sha256sum] = 
>> "ee6d43c444904631c240470e15e96215c2ce451158bfdbf234bce892bf60eab8"
>>   +# dependency chain:
>> +# upower -> polkit -> mozjs17
>> +# mozjs17 does not support mips64
>> +COMPATIBLE_HOST = "^(?!mips64).*"
>> +
>>   FILES_${PN} += "${datadir}/xfce4/weather"
>> diff --git 
>> a/meta-xfce/recipes-panel-plugins/xkb/xfce4-xkb-plugin_0.8.1.bb 
>> b/meta-xfce/recipes-panel-plugins/xkb/xfce4-xkb-plugin_0.8.1.bb
>> index 8ee374035..26289443f 100644
>> --- a/meta-xfce/recipes-panel-plugins/xkb/xfce4-xkb-plugin_0.8.1.bb
>> +++ b/meta-xfce/recipes-panel-plugins/xkb/xfce4-xkb-plugin_0.8.1.bb
>> @@ -14,3 +14,8 @@ DEPENDS += "libxklavier libwnck3 librsvg garcon"
>>   FILES_${PN} += "${datadir}/xfce4/xkb"
>>     RDEPENDS_${PN} = "xfce4-settings"
>> +
>> +# dependency chain:
>> +# xfce4-settings -> upower -> polkit -> mozjs17
>> +# mozjs17 does not support mips64
>> +COMPATIBLE_HOST = "^(?!mips64).*"
>> diff --git 
>> a/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-base.bb 
>> b/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-base.bb
>> index 140de416b..6b169a0c4 100644
>> --- a/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-base.bb
>> +++ b/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-base.bb
>> @@ -8,6 +8,10 @@ inherit packagegroup distro_features_check
>>     REQUIRED_DISTRO_FEATURES = "x11"
>>   +# some core packages such as thunar, xfdesktop and xfce4-session 
>> fininally
>> +# depend on polkit with depends on mozjs. But mozjs17 does not 
>> support mips64.
>> +COMPATIBLE_HOST = "^(?!mips64).*"
>> +
>>   RDEPENDS_${PN} = " \
>>       xfwm4 \
>>       xfce4-session \
>> diff --git 
>> a/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb 
>> b/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb
>> index 2e0f7f5b4..477335f36 100644
>> --- a/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb
>> +++ b/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb
>> @@ -9,6 +9,10 @@ inherit packagegroup distro_features_check
>>     REQUIRED_DISTRO_FEATURES = "x11"
>>   +# some core packages in packagegroup-xfce-base finally depend on 
>> polkit which
>> +# depend on mozjs but mozjs17 does not support mips64
>> +COMPATIBLE_HOST = "^(?!mips64).*"
>> +
>>   # mandatory
>>   RDEPENDS_${PN} = " \
>>       packagegroup-xfce-base \
>> diff --git a/meta-xfce/recipes-xfce/thunar/thunar_1.8.0.bb 
>> b/meta-xfce/recipes-xfce/thunar/thunar_1.8.0.bb
>> index f03fd63e0..6ba5b6c3f 100644
>> --- a/meta-xfce/recipes-xfce/thunar/thunar_1.8.0.bb
>> +++ b/meta-xfce/recipes-xfce/thunar/thunar_1.8.0.bb
>> @@ -14,6 +14,11 @@ SRC_URI[sha256sum] = 
>> "acf151bceedb20aed45a6da61d7bb85a4a03964090c80454e72e61e7fc
>>     S = "${WORKDIR}/Thunar-${PV}/"
>>   +# dependency chain:
>> +# gvfs -> polkit -> mozjs17
>> +# polkit depends on mozjs17 which not support mips64
>> +COMPATIBLE_HOST = "^(?!mips64).*"
>> +
>>   PACKAGECONFIG ??= ""
>>   PACKAGECONFIG[pcre] = "--enable-pcre,--disable-pcre,libpcre"
>>   diff --git 
>> a/meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_1.6.1.bb 
>> b/meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_1.6.1.bb 
>>
>> index ed117b0a6..3be7336fc 100644
>> --- 
>> a/meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_1.6.1.bb
>> +++ 
>> b/meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_1.6.1.bb
>> @@ -15,6 +15,11 @@ DEPENDS += "gtk+3 glib-2.0 dbus-glib xfconf 
>> libxfce4ui libxfce4util libnotify \
>>   SRC_URI[md5sum] = "17f0e6464ad6b3bc6a657f595bf91430"
>>   SRC_URI[sha256sum] = 
>> "1ea825452343b895566068018b6d5078608f8f46ce8075ba6bbb4b848f48656b"
>>   +# dependency chain:
>> +# upower -> polkit -> mozjs17
>> +# mozjs17 does not support mips64
>> +COMPATIBLE_HOST = "^(?!mips64).*"
>> +
>>   EXTRA_OECONF = " \
>>       --enable-network-manager \
>>       --enable-panel-plugins \
>> diff --git 
>> a/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.12.1.bb 
>> b/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.12.1.bb
>> index 899edbf0a..75931d361 100644
>> --- a/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.12.1.bb
>> +++ b/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.12.1.bb
>> @@ -15,6 +15,9 @@ SRC_URI += " \
>>       file://0001-configure.in-hard-code-path-to-iceauth.patch \
>>   "
>>   +# polkit depends on mozjs17 which does not support mips64
>> +COMPATIBLE_HOST = "^(?!mips64).*"
>> +
>>   ALTERNATIVE_${PN} = "x-session-manager"
>>   ALTERNATIVE_TARGET[x-session-manager] = "${bindir}/xfce4-session"
>>   ALTERNATIVE_PRIORITY_${PN} = "100"
>> diff --git 
>> a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_git.bb 
>> b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_git.bb
>> index d937653fa..d5b1bc5af 100644
>> --- a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_git.bb
>> +++ b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_git.bb
>> @@ -21,6 +21,11 @@ SRCREV = "b701ac8b66b83c17469dd5009da51eeb59eba442"
>>   S = "${WORKDIR}/git"
>>   PV = "4.12.3+git${SRCPV}"
>>   +# dependency chain:
>> +# upower -> polkit -> mozjs17
>> +# mozjs17 does not support mips64
>> +COMPATIBLE_HOST = "^(?!mips64).*"
>> +
>>   EXTRA_OECONF += "--enable-maintainer-mode --disable-debug"
>>     PACKAGECONFIG ??= " \
>> diff --git a/meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.12.4.bb 
>> b/meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.12.4.bb
>> index d9cbe7196..e53f15265 100644
>> --- a/meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.12.4.bb
>> +++ b/meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.12.4.bb
>> @@ -11,6 +11,11 @@ REQUIRED_DISTRO_FEATURES = "x11"
>>   SRC_URI[md5sum] = "7571889368be72df185ce2d470f37198"
>>   SRC_URI[sha256sum] = 
>> "098a35510562907e1431d5adbfa8307484a235c1dec6a43e2d58d2ac4241f1cb"
>>   +# dependency chain:
>> +# thunar -> gvfs -> polkit -> mozjs17
>> +# mozjs17 does not support mips64
>> +COMPATIBLE_HOST = "^(?!mips64).*"
>> +
>>   PACKAGECONFIG ??= ""
>>   PACKAGECONFIG[notify] = 
>> "--enable-notifications,--disable-notifications,libnotify"
>>
>

-- 
Regards,
Neil | Kai Kang


