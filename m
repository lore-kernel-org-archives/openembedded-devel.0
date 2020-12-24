Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
 by mx.groups.io with SMTP id smtpd.web12.7710.1608791686610408546
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Dec 2020 22:34:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=OtIdxMO4;
 spf=pass (domain: gmail.com, ip: 209.85.160.176, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f176.google.com with SMTP id h19so962990qtq.13
        for <openembedded-devel@lists.openembedded.org>; Wed, 23 Dec 2020 22:34:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MY0fdyfOR+vt4pr5UStfa7Mt4o6ie5tn4D+vX7Aa+W8=;
        b=OtIdxMO4vEe6pcVIrkM1RsACbt2uk/M/WKq4xMAKB5MMBUU+jYiQVbc8/FgStNq71c
         mxeFwWP5zYOWhTHwn1r99P+67snirR8icMhSP67wuZq265xEbdUVDPwyVdeEdigHN9+3
         tHzMRBcc2iuoQbBKio0AV0o6BV9qzUuaGgYl4DY9YmW8jUNkRLyDe7g3SB9ieVPT5z/R
         S9IpT/Hweh2Y8mdjTKVqfnuGdqNbzI/nbta7rTs8Zoe3PIz/iCTIDMDUMsh7mEcFp6W9
         KC6TolBgNDgM8+9OhcOu1ThbgHbHiKx/lz8NQokntcaN4F3en1SSNMYJ0UX7gO+Jkma6
         b8iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MY0fdyfOR+vt4pr5UStfa7Mt4o6ie5tn4D+vX7Aa+W8=;
        b=f0zOKEyl/inQWV/MM0NG7RZstUEZNnllViekILVlF3Qu9VwWahhzbomum9uYhaCypW
         9AkDPUuA0YbxfX2/5a2kqmBBGRVNhLb7f4ceYafAISKxVQ376Vymuhq7A9p2cDzrle8m
         aHO0njfhXgzqUAHOGQ9kt1nrRK7F+epZQ+4HFpEQtOzHODeGwqTyn/siBFAFIrHKnlzV
         6QEx823EEF3a73epGMvfTn/8+uZUPwe8l1aFijimDR/bX3k6TGowEWKQshfKl0xH0+EO
         dLJQQgDFJifHfcxZkRVcmP4URLMpi5zYh3deVv67Hyc/1qQaYaoxZY3rW7c413rih0F8
         9ksw==
X-Gm-Message-State: AOAM532BbUFxei4a8golBFlH1czT7z/RrI6tqBedIxzrCnJa9Q6nls0R
	2KScEyXdz15SZCpKXtT5r0z7bD/8jeu7CrMPurE=
X-Google-Smtp-Source: ABdhPJy0lU6B+/chFtc7p4YeAwmdE9pfxU/DX9XUHFzSladWJsqh/OuqZsU1dqhVOELDEF/cJEsWwla6maelYY9xuVg=
X-Received: by 2002:aed:2ec6:: with SMTP id k64mr29514415qtd.194.1608791683758;
 Wed, 23 Dec 2020 22:34:43 -0800 (PST)
MIME-Version: 1.0
References: <20201223031046.513846-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20201223031046.513846-1-dmitry.baryshkov@linaro.org>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 23 Dec 2020 22:34:17 -0800
Message-ID: <CAMKF1srVQdu6RfOcROq6ca4ppUGpr5BOSZBDPTNKSGTLGnj8HA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 1/2] android-tools-conf-configfs: add an alternative to anrdoid-tools-conf
To: Dmitry Baryshkov <dbaryshkov@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

I am seeing this warning

WARNING: /mnt/b/yoe/master/sources/meta-openembedded/meta-oe/recipes-devtools/android-tools/android-to
ols-conf-configfs_1.0.bb: Unable to get checksum for
android-tools-conf-configfs SRC_URI entry android
-gadget-setup.machine: file could not be found

while building for qemuriscv32

On Tue, Dec 22, 2020 at 7:11 PM Dmitry Baryshkov <dbaryshkov@gmail.com> wrote:
>
> The package android-tools-conf depends on presence of
> /sys/class/android_usb, which is not present in default (mainline)
> kernels. Add a set of scripts that will use ConfigFS to configure USB
> gadget rather than using non-standard device class.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../10-adbd-configfs.conf                     |  4 +++
>  .../android-gadget-cleanup                    | 24 +++++++++++++
>  .../android-gadget-setup                      | 35 ++++++++++++++++++
>  .../android-gadget-start                      |  7 ++++
>  .../android-tools-conf-configfs_1.0.bb        | 36 +++++++++++++++++++
>  5 files changed, 106 insertions(+)
>  create mode 100644 meta-oe/recipes-devtools/android-tools/android-tools-conf-configfs/10-adbd-configfs.conf
>  create mode 100644 meta-oe/recipes-devtools/android-tools/android-tools-conf-configfs/android-gadget-cleanup
>  create mode 100644 meta-oe/recipes-devtools/android-tools/android-tools-conf-configfs/android-gadget-setup
>  create mode 100644 meta-oe/recipes-devtools/android-tools/android-tools-conf-configfs/android-gadget-start
>  create mode 100644 meta-oe/recipes-devtools/android-tools/android-tools-conf-configfs_1.0.bb
>
> diff --git a/meta-oe/recipes-devtools/android-tools/android-tools-conf-configfs/10-adbd-configfs.conf b/meta-oe/recipes-devtools/android-tools/android-tools-conf-configfs/10-adbd-configfs.conf
> new file mode 100644
> index 000000000000..ddf155a907bc
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/android-tools/android-tools-conf-configfs/10-adbd-configfs.conf
> @@ -0,0 +1,4 @@
> +[Service]
> +ExecStartPre=/usr/bin/android-gadget-setup
> +ExecStartPost=/usr/bin/android-gadget-start
> +ExecStopPost=/usr/bin/android-gadget-cleanup
> diff --git a/meta-oe/recipes-devtools/android-tools/android-tools-conf-configfs/android-gadget-cleanup b/meta-oe/recipes-devtools/android-tools/android-tools-conf-configfs/android-gadget-cleanup
> new file mode 100644
> index 000000000000..517227d4a636
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/android-tools/android-tools-conf-configfs/android-gadget-cleanup
> @@ -0,0 +1,24 @@
> +#!/bin/sh
> +
> +[ -d /sys/kernel/config/usb_gadget ] || exit 0
> +
> +cd /sys/kernel/config/usb_gadget
> +
> +cd adb
> +
> +echo "" > UDC || true
> +
> +killall adbd || true
> +
> +umount /dev/usb-ffs/adb
> +
> +rm configs/c.1/ffs.usb0
> +
> +rmdir configs/c.1/strings/0x409
> +rmdir configs/c.1
> +
> +rmdir functions/ffs.usb0
> +rmdir strings/0x409
> +
> +cd ..
> +rmdir adb
> diff --git a/meta-oe/recipes-devtools/android-tools/android-tools-conf-configfs/android-gadget-setup b/meta-oe/recipes-devtools/android-tools/android-tools-conf-configfs/android-gadget-setup
> new file mode 100644
> index 000000000000..e44d1bacbe3a
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/android-tools/android-tools-conf-configfs/android-gadget-setup
> @@ -0,0 +1,35 @@
> +#!/bin/sh
> +
> +set -e
> +
> +manufacturer=RPB
> +model="Android device"
> +serial=0123456789ABCDEF
> +
> +if [ -r /etc/android-gadget-setup.machine ] ; then
> +       . /etc/android-gadget-setup.machine
> +fi
> +
> +[ -d /sys/kernel/config/usb_gadget ] || modprobe libcomposite
> +
> +cd /sys/kernel/config/usb_gadget
> +
> +[ -d adb ] && /usr/bin/android-gadget-cleanup || true
> +
> +mkdir adb
> +cd adb
> +
> +mkdir configs/c.1
> +mkdir functions/ffs.usb0
> +mkdir strings/0x409
> +mkdir configs/c.1/strings/0x409
> +echo 0x18d1 > idVendor
> +echo 0xd002 > idProduct
> +echo "$serial" > strings/0x409/serialnumber
> +echo "$manufacturer" > strings/0x409/manufacturer
> +echo "$model" > strings/0x409/product
> +echo "Conf 1" > configs/c.1/strings/0x409/configuration
> +ln -s functions/ffs.usb0 configs/c.1
> +
> +mkdir -p /dev/usb-ffs/adb
> +mount -t functionfs usb0 /dev/usb-ffs/adb
> diff --git a/meta-oe/recipes-devtools/android-tools/android-tools-conf-configfs/android-gadget-start b/meta-oe/recipes-devtools/android-tools/android-tools-conf-configfs/android-gadget-start
> new file mode 100644
> index 000000000000..ca6c3df27536
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/android-tools/android-tools-conf-configfs/android-gadget-start
> @@ -0,0 +1,7 @@
> +#!/bin/sh
> +
> +set -e
> +
> +sleep 3
> +
> +ls /sys/class/udc/ > /sys/kernel/config/usb_gadget/adb/UDC
> diff --git a/meta-oe/recipes-devtools/android-tools/android-tools-conf-configfs_1.0.bb b/meta-oe/recipes-devtools/android-tools/android-tools-conf-configfs_1.0.bb
> new file mode 100644
> index 000000000000..a38a8ce90226
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/android-tools/android-tools-conf-configfs_1.0.bb
> @@ -0,0 +1,36 @@
> +DESCRIPTION = "Different utilities from Android - corressponding configuration files for using ConfigFS"
> +SECTION = "console/utils"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
> +
> +SRC_URI = " \
> +    file://android-gadget-setup \
> +    file://android-gadget-start \
> +    file://android-gadget-cleanup \
> +    file://android-gadget-setup.machine \
> +    file://10-adbd-configfs.conf \
> +"
> +
> +PACKAGE_ARCH = "${MACHINE_ARCH}"
> +
> +do_install() {
> +    install -d ${D}${bindir}
> +    install -m 0755 ${WORKDIR}/android-gadget-setup ${D}${bindir}
> +    install -m 0755 ${WORKDIR}/android-gadget-start ${D}${bindir}
> +    install -m 0755 ${WORKDIR}/android-gadget-cleanup ${D}${bindir}
> +
> +    if [ -r ${WORKDIR}/android-gadget-setup.machine ] ; then
> +       install -d ${D}${sysconfdir}
> +       install -m 0644 ${WORKDIR}/android-gadget-setup.machine ${D}${sysconfdir}
> +    fi
> +
> +    install -d ${D}${systemd_unitdir}/system/android-tools-adbd.service.d
> +    install -m 0644 ${WORKDIR}/10-adbd-configfs.conf ${D}${systemd_unitdir}/system/android-tools-adbd.service.d
> +}
> +
> +FILES_${PN} += " \
> +    ${systemd_unitdir}/system/ \
> +"
> +
> +PROVIDES += "android-tools-conf"
> +RPROVIDES_${PN} = "android-tools-conf"
> --
> 2.29.2
>
>
> 
>
