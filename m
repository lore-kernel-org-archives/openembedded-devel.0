Return-Path: <cjp256@gmail.com>
Received: from mail-io0-f194.google.com (mail-io0-f194.google.com
	[209.85.223.194])
	by mail.openembedded.org (Postfix) with ESMTP id B3B6D76075
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 May 2018 14:48:26 +0000 (UTC)
Received: by mail-io0-f194.google.com with SMTP id e12-v6so7283525iob.8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 May 2018 07:48:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=d6GCSLlWXe6E0SXA0h0JZy6kwXKPlqbYMS+wV48T3CA=;
	b=uKMzRnPQ+YZ5k7aHBOBOuClE06KkCcgau97e5ZndbknnXTKEyun+96wLizrNVuVRFn
	sMsidoMDRO5cKbFctq21xVWnSCwb/Xrgn5Jv7nHoQo/MR3wIA/THz2l3gYx/jWyjL0Va
	3lx7X+2q5nehSvc9S1zU0+Mlba0wD9LdAXcEK/TXSdTjyz2nHbPhejuGH63cc5j+7H/3
	FtsVuQzEHzWJLnn+A7736kWQySW31CJCsVquptSliU5rWoHSGzKBzKYyEGWr26qhAkn0
	ooHIT7cFB/Ua5j6yH0LbDySACN4ANbUEdWukde+zcCBdfnlK7Hncm3nvPRxJes+BVILC
	+dPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=d6GCSLlWXe6E0SXA0h0JZy6kwXKPlqbYMS+wV48T3CA=;
	b=kCCAiqY2LMtfuJkTLFwxEeRpUnCxvmGEJR64d7TR1a/kWqIdhBBQge+jlFwguvXrH5
	hnTsoj7osXQZ8ulASiFsQ/dN4Dva1Ui27Jn7Irm6LNjriOaiW1boHwvuqkAEEgjnWgum
	VZ6wTy6AyMKooaUQjFg9I1Z7ml0+rRA5dxVGMgsToISkVB8xbIJM221Yzz0c+WxFZFnb
	dgaJayEiHl+Z590C8y+hQvXuf21gjIpKBpuKjfXzS7nSwP8Ne8/O9lZOaFAQfPb09EBR
	5Ul33bwWjBMkjTnKJyu9M8dmvxYiRAEPKPHb5/xWKN4V9CCB41qG5qPfblromAI+xQMV
	KSyw==
X-Gm-Message-State: ALKqPwdMamLyWSQCVnCsqstzOWWE8n7pNYWzDbTETxdgylZT4l/h+Zuc
	AOfV3t8ohkYpu1KWYH4UULbjGL3gHyPqvfOJqN0=
X-Google-Smtp-Source: AB8JxZpL1t23D4ph+8g2T+qFHRM499cyWA4KYKZOoGr9b1ua3SlFepskVcUKtESU+SfkZLi/kV2h9VHSA3l0GuhPews=
X-Received: by 2002:a6b:bd86:: with SMTP id
	n128-v6mr6313011iof.221.1526050106980; 
	Fri, 11 May 2018 07:48:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a02:712b:0:0:0:0:0 with HTTP; Fri, 11 May 2018 07:48:06
	-0700 (PDT)
In-Reply-To: <a35cb7f645372cbc1f904b55496e70db43283761.1495783956.git.hongxu.jia@windriver.com>
References: <cover.1495783956.git.hongxu.jia@windriver.com>
	<a35cb7f645372cbc1f904b55496e70db43283761.1495783956.git.hongxu.jia@windriver.com>
From: Chris Patterson <cjp256@gmail.com>
Date: Fri, 11 May 2018 10:48:06 -0400
Message-ID: <CABZSBQd=VTdvDa38uJGD=BQkbZQZ_t=ZUjmg27WdyPsGNkOSHw@mail.gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH 4/4] lvm2/libdevmapper: fix invoking lvcreate failed
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
X-List-Received-Date: Fri, 11 May 2018 14:48:26 -0000
Content-Type: text/plain; charset="UTF-8"

Sorry to resurrect such an old thread... :)

The dependency on udev brings back the c the libdevmapper circular
dependency when systemd is used with cryptsetup.  (systemd ->
cryptsetup -> libdevmapper -> udev|systemd).

Any thoughts on how to properly fix that (other than removing udev
from PACKAGECONFIG)?

On Fri, May 26, 2017 at 3:37 AM, Hongxu Jia <hongxu.jia@windriver.com> wrote:
> Previously, libdevmapper is separated from lvm2 in the following commit:
> ---
> commit 7f17da154372b5ec33947766783444961e8aa67c
> Author: Chen Qi <Qi.Chen@windriver.com>
> Date:   Mon Apr 24 16:06:41 2017 +0800
>
>     lvm2: separate libdevmapper to avoid circular dependency
> ---
>
> It caused invoking lvcreate failed:
> ---
> root@qemux86-64:~# lvm pvcreate /dev/sda
>   Physical volume "/dev/sda" successfully created.
> root@qemux86-64:~# lvm vgcreate -s 4096K wrl /dev/sda
>   Volume group "wrl" successfully created
> root@qemux86-64:~# lvm lvcreate -n swap -L 2293648K -y --type linear wrl
>   Rounding up size to full physical extent 2.19 GiB
>   /dev/wrl/swap: not found: device not cleared
>   Aborting. Failed to wipe start of new LV.
> ---
>
> The lvm2 and libdevmapper should use the same PACKAGECONFIG
> and EXTRA_OECONF.
>
> And do not manually remove useless files.
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  .../recipes-support/lvm2/libdevmapper_2.02.166.bb  | 21 ++-----------
>  meta-oe/recipes-support/lvm2/lvm2.inc              | 26 +++++++++++++++-
>  .../0001-explicitly-do-not-install-libdm.patch     | 36 ++++++++++++++++++++++
>  meta-oe/recipes-support/lvm2/lvm2_2.02.171.bb      | 31 ++-----------------
>  4 files changed, 65 insertions(+), 49 deletions(-)
>  create mode 100644 meta-oe/recipes-support/lvm2/lvm2/0001-explicitly-do-not-install-libdm.patch
>
> diff --git a/meta-oe/recipes-support/lvm2/libdevmapper_2.02.166.bb b/meta-oe/recipes-support/lvm2/libdevmapper_2.02.166.bb
> index fd1fc2c..3cf939d 100644
> --- a/meta-oe/recipes-support/lvm2/libdevmapper_2.02.166.bb
> +++ b/meta-oe/recipes-support/lvm2/libdevmapper_2.02.166.bb
> @@ -5,27 +5,10 @@ SRC_URI[sha256sum] = "e120b066b85b224552efda40204488c5123de068725676fd6e5c8bc655
>
>  DEPENDS += "autoconf-archive-native"
>
> -PACKAGECONFIG = ""
> -
> -# Unset user/group to unbreak install.
> -EXTRA_OECONF = "--with-user= \
> -                --with-group= \
> -                --enable-pkgconfig \
> -                --with-usrlibdir=${libdir} \
> -"
> -
>  TARGET_CC_ARCH += "${LDFLAGS}"
>
> -do_install_append() {
> -    # Remove things unrelated to libdevmapper
> -    rm -rf ${D}${sysconfdir}
> -    for i in `ls ${D}${sbindir}/*`; do
> -       if [ $i != ${D}${sbindir}/dmsetup ]; then
> -           rm $i
> -       fi
> -    done
> -    # Remove docs
> -    rm -rf ${D}${datadir}
> +do_install() {
> +    oe_runmake 'DESTDIR=${D}' -C libdm install
>  }
>
>  RRECOMMENDS_${PN}_append_class-target = " lvm2-udevrules"
> diff --git a/meta-oe/recipes-support/lvm2/lvm2.inc b/meta-oe/recipes-support/lvm2/lvm2.inc
> index cb5a9e0..c2dac95 100644
> --- a/meta-oe/recipes-support/lvm2/lvm2.inc
> +++ b/meta-oe/recipes-support/lvm2/lvm2.inc
> @@ -18,11 +18,18 @@ S = "${WORKDIR}/LVM2.${PV}"
>
>  inherit autotools-brokensep pkgconfig systemd
>
> +LVM2_PACKAGECONFIG = "dmeventd lvmetad"
> +LVM2_PACKAGECONFIG_append_class-target = " \
> +    ${@bb.utils.filter('DISTRO_FEATURES', 'selinux', d)} \
> +    thin-provisioning-tools \
> +    udev \
> +"
> +
>  # odirect is always enabled because there currently is a bug in
>  # lib/device/dev-io.c which prevents compiling without it. It is
>  # better to stick to configurations that were actually tested by
>  # upstream...
> -PACKAGECONFIG_append = " odirect"
> +PACKAGECONFIG ??= "odirect ${LVM2_PACKAGECONFIG}"
>
>  PACKAGECONFIG[dmeventd] = "--enable-dmeventd,--disable-dmeventd"
>  PACKAGECONFIG[lvmetad] = "--enable-lvmetad,--disable-lvmetad"
> @@ -31,3 +38,20 @@ PACKAGECONFIG[readline] = "--enable-readline,--disable-readline,readline"
>  PACKAGECONFIG[selinux] = "--enable-selinux,--disable-selinux,libselinux"
>  PACKAGECONFIG[thin-provisioning-tools] = "--with-thin=internal,--with-thin=none,,thin-provisioning-tools"
>  PACKAGECONFIG[udev] = "--enable-udev_sync --enable-udev_rules --with-udevdir=${nonarch_base_libdir}/udev/rules.d,--disable-udev_sync --disable-udev_rules,udev"
> +
> +# Unset user/group to unbreak install.
> +EXTRA_OECONF = "--with-user= \
> +                --with-group= \
> +                --enable-realtime \
> +                --enable-applib \
> +                --enable-cmdlib \
> +                --enable-pkgconfig \
> +                --with-usrlibdir=${libdir} \
> +                --with-systemdsystemunitdir=${systemd_system_unitdir} \
> +                --disable-thin_check_needs_check \
> +                --with-thin-check=${sbindir}/thin_check \
> +                --with-thin-dump=${sbindir}/thin_dump \
> +                --with-thin-repair=${sbindir}/thin_repair \
> +                --with-thin-restore=${sbindir}/thin_restore \
> +"
> +
> diff --git a/meta-oe/recipes-support/lvm2/lvm2/0001-explicitly-do-not-install-libdm.patch b/meta-oe/recipes-support/lvm2/lvm2/0001-explicitly-do-not-install-libdm.patch
> new file mode 100644
> index 0000000..e85818d
> --- /dev/null
> +++ b/meta-oe/recipes-support/lvm2/lvm2/0001-explicitly-do-not-install-libdm.patch
> @@ -0,0 +1,36 @@
> +From 0a8e466fcf99622896e070c5133165e4278e8cfb Mon Sep 17 00:00:00 2001
> +From: Hongxu Jia <hongxu.jia@windriver.com>
> +Date: Thu, 25 May 2017 05:27:11 -0400
> +Subject: [PATCH] explicitly do not install libdm
> +
> +Already have package libdevmapper which split from lvm2,
> +explicitly do not do the installation here.
> +
> +Upstream-Status: Inappropriate [meta-oe specific]
> +
> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> +---
> + libdm/Makefile.in | 6 ++++--
> + 1 file changed, 4 insertions(+), 2 deletions(-)
> +
> +diff --git a/libdm/Makefile.in b/libdm/Makefile.in
> +index 3c9a4ce..45c91c6 100644
> +--- a/libdm/Makefile.in
> ++++ b/libdm/Makefile.in
> +@@ -77,9 +77,11 @@ ifeq ("@PKGCONFIG@", "yes")
> +   INSTALL_TYPE += install_pkgconfig
> + endif
> +
> +-install: $(INSTALL_TYPE) install_include
> ++install:
> ++      echo "Do not install device mappler in lvm2"
> +
> +-install_device-mapper: install
> ++install_device-mapper:
> ++      echo "Do not install device mappler in lvm2"
> +
> + install_include: $(srcdir)/libdevmapper.h
> +       $(INSTALL_DATA) -D $< $(includedir)/$(<F)
> +--
> +2.8.1
> +
> diff --git a/meta-oe/recipes-support/lvm2/lvm2_2.02.171.bb b/meta-oe/recipes-support/lvm2/lvm2_2.02.171.bb
> index 38c4414..84881e7 100644
> --- a/meta-oe/recipes-support/lvm2/lvm2_2.02.171.bb
> +++ b/meta-oe/recipes-support/lvm2/lvm2_2.02.171.bb
> @@ -3,32 +3,9 @@ require lvm2.inc
>  SRC_URI[md5sum] = "153b7bb643eb26073274968e9026fa8f"
>  SRC_URI[sha256sum] = "b815a711a2fabaa5c3dc1a4a284df0268bf0f325f0fc0f5c9530c9bbb54b9964"
>
> -DEPENDS += "autoconf-archive-native"
> -
> -LVM2_PACKAGECONFIG = "dmeventd lvmetad"
> -LVM2_PACKAGECONFIG_append_class-target = " \
> -    ${@bb.utils.filter('DISTRO_FEATURES', 'selinux', d)} \
> -    thin-provisioning-tools \
> -    udev \
> -"
> +SRC_URI += "file://0001-explicitly-do-not-install-libdm.patch"
>
> -PACKAGECONFIG ??= "${LVM2_PACKAGECONFIG}"
> -
> -# Unset user/group to unbreak install.
> -EXTRA_OECONF = "--with-user= \
> -                --with-group= \
> -                --enable-realtime \
> -                --enable-applib \
> -                --enable-cmdlib \
> -                --enable-pkgconfig \
> -                --with-usrlibdir=${libdir} \
> -                --with-systemdsystemunitdir=${systemd_system_unitdir} \
> -                --disable-thin_check_needs_check \
> -                --with-thin-check=${sbindir}/thin_check \
> -                --with-thin-dump=${sbindir}/thin_dump \
> -                --with-thin-repair=${sbindir}/thin_repair \
> -                --with-thin-restore=${sbindir}/thin_restore \
> -"
> +DEPENDS += "autoconf-archive-native"
>
>  CACHED_CONFIGUREVARS += "MODPROBE_CMD=${base_sbindir}/modprobe"
>
> @@ -45,10 +22,6 @@ do_install_append() {
>          mv ${D}${sysconfdir}/rc.d/init.d ${D}${sysconfdir}/init.d
>          rm -rf ${D}${sysconfdir}/rc.d
>      fi
> -    # Remove things related to libdevmapper
> -    rm -f ${D}${sbindir}/dmsetup
> -    rm -f ${D}${libdir}/libdevmapper.so.*
> -    rm -f ${D}${libdir}/libdevmapper.so ${D}${libdir}/pkgconfig/devmapper.pc ${D}${includedir}/libdevmapper.h
>  }
>
>  PACKAGE_BEFORE_PN = "${PN}-scripts ${PN}-udevrules"
> --
> 2.8.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

