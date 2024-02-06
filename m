Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52593C48297
	for <webhook@archiver.kernel.org>; Tue,  6 Feb 2024 17:20:08 +0000 (UTC)
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
 by mx.groups.io with SMTP id smtpd.web10.27424.1707240006008389349
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Feb 2024 09:20:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dy1ffcRN;
 spf=pass (domain: gmail.com, ip: 209.85.160.41, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-214def5da12so3632731fac.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 06 Feb 2024 09:20:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707240005; x=1707844805; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SmFRd2GtgszFnN0YwE4ftUibPjzF5UlX4H7MJr7C0+4=;
        b=dy1ffcRN9aiu6jYpgN5iGl6OUoajhvmdV+HVNTukLINnuXMgQHRMw8wmif+qEc6jAY
         pSvlz027teK0qSt7SjUyJh+zSHL1OboT9q206UAcMmUUZQeatyh7pSMaCdKwUWN7vNU0
         UNesjvNopzs+pQBSkRSZKBDzvVygKoQ6l69t+jLvU/d4FEYGJK/pBGs+PuyTDQpfY2/x
         ntgowPV3I0cfb+nDIBuLsa0yPsVCzbsqq3tHX/gjAPE39/d6RjOkpwo4ZYCHoVkSfOn9
         +tqejTi5hNeiC8O3DCj/tGmENDtJQskOyZSftdeezg4pFUUHZVb1PTvZ0Haa3lAePKz4
         B6XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707240005; x=1707844805;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SmFRd2GtgszFnN0YwE4ftUibPjzF5UlX4H7MJr7C0+4=;
        b=cYjWRTKChuxxMe01NJTml0ILDy2Q+RM6lvszkCsbojB5+HPyjH6As56V3YPvgZa0WI
         eja0CZMhAehDtbZaKvBebNp+pO96xD+tE2QbSVQiWyDNncWty65RSYqUjF1NR9SknfrD
         QV02k4OWA1PuK7rIERqdd4y6C3KqlvJQHEC3VH9vmanuNXlKT4gZy+XXNhrRjQU3JBq5
         2r7SysgpawY2BG4i0w8ywRjBUoG//EL/IdPMB83p3WhzwZziTadvOJ52i5Cwaq7Vi80q
         JEytqjMuDNe6zL2aOzwh1kLTeJWtEmDmPTAU2bx0bd3qX+bWsxle+SngHnNecj9hAol1
         yosA==
X-Gm-Message-State: AOJu0YwRuP9vkC9q6M7/O664hDAvRDtvkacwFalh4Y8uzXaXmbXVxvZb
	6JWLg+652WMArC8PIdP/QSOika/csJpBxMznx/iqBbeTSklcmXO/PjjzXz37adexP1v3ttfgjjj
	0DJoGtiEKUzVFu+/uHvJcnGjmJZMuH711NKRfeQ==
X-Google-Smtp-Source: AGHT+IEdiBCWMfhXa8jGDBAXSV1uxGrq5NLYcLFTzs8JMWvnVSE3qIYd+kS9pSqSJ9oTm9flDUwq57Lycm4YTeeBH7A=
X-Received: by 2002:a05:6870:d10e:b0:214:fdd8:f08b with SMTP id
 e14-20020a056870d10e00b00214fdd8f08bmr3805517oac.36.1707240004157; Tue, 06
 Feb 2024 09:20:04 -0800 (PST)
MIME-Version: 1.0
References: <20240206132812.1362456-1-martin.jansa@gmail.com>
In-Reply-To: <20240206132812.1362456-1-martin.jansa@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 6 Feb 2024 09:19:37 -0800
Message-ID: <CAMKF1soStxMSTiAOkGsWkjsjt91dajuA=v-=AN0fxay3UeAdhA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][RFC][PATCH 1/5] recipes: drop ${SRCPV} usage
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Feb 2024 17:20:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108636

Thanks for this cleanup. Can you rebase it on master-next and resend ?
it will make my life easier

Applying: recipes: drop ${SRCPV} usage
Patch failed at 0001 recipes: drop ${SRCPV} usage
...
error: meta-oe/recipes-extended/sanlock/sanlock_3.9.0.bb: does not
exist in index

On Tue, Feb 6, 2024 at 5:28=E2=80=AFAM Martin Jansa <martin.jansa@gmail.com=
> wrote:
>
> * Drop SRCPV similarly like oe-core did in:
>   https://git.openembedded.org/openembedded-core/commit/?h=3Dnanbield&id=
=3D843f82a246a535c353e08072f252d1dc78217872
>
> * SRCPV is deferred now from PV to PKGV since:
>   https://git.openembedded.org/openembedded-core/commit/?h=3Dnanbield&id=
=3Da8e7b0f932b9ea69b3a218fca18041676c65aba0
>
> Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> ---
>  meta-filesystems/recipes-filesystems/yaffs2/yaffs2-utils_git.bb | 2 +-
>  meta-filesystems/recipes-utils/aufs-util/aufs-util_git.bb       | 2 +-
>  meta-filesystems/recipes-utils/overlayfs/overlayfs-tools_git.bb | 2 +-
>  meta-gnome/recipes-gnome/devilspie/devilspie2_0.44.bb           | 2 +-
>  meta-gnome/recipes-support/keybinder/keybinder_3.0.bb           | 2 +-
>  meta-initramfs/recipes-bsp/kexecboot/kexecboot_git.bb           | 2 +-
>  meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_git.bb    | 2 +-
>  meta-multimedia/recipes-dvb/oscam/oscam_svn.bb                  | 2 +-
>  meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb          | 2 +-
>  meta-multimedia/recipes-multimedia/bluealsa/bluealsa_git.bb     | 2 +-
>  .../recipes-multimedia/dleyna/dleyna-server_0.6.0.bb            | 2 +-
>  meta-multimedia/recipes-multimedia/libsquish/libsquish_git.bb   | 2 +-
>  .../recipes-multimedia/musicbrainz/libmusicbrainz_git.bb        | 2 +-
>  .../recipes-support/gst-instruments/gst-instruments_git.bb      | 2 +-
>  meta-networking/recipes-connectivity/bearssl/bearssl_0.6.bb     | 2 +-
>  meta-networking/recipes-connectivity/bluepy/bluepy_git.bb       | 2 +-
>  .../recipes-connectivity/openthread/ot-br-posix_git.bb          | 2 +-
>  .../recipes-connectivity/openthread/ot-daemon_git.bb            | 2 +-
>  meta-networking/recipes-connectivity/openthread/wpantund_git.bb | 2 +-
>  meta-networking/recipes-connectivity/relayd/relayd_git.bb       | 2 +-
>  meta-networking/recipes-filter/ulogd2/ulogd2_2.0.8.bb           | 2 +-
>  meta-networking/recipes-protocols/openflow/openflow_git.bb      | 2 +-
>  meta-networking/recipes-protocols/openlldp/openlldp_1.1.0.bb    | 2 +-
>  meta-networking/recipes-support/arptables/arptables_git.bb      | 2 +-
>  meta-networking/recipes-support/celt051/celt051_git.bb          | 2 +-
>  .../recipes-support/lksctp-tools/lksctp-tools_1.0.19.bb         | 2 +-
>  .../recipes-support/lowpan-tools/lowpan-tools_git.bb            | 2 +-
>  meta-networking/recipes-support/netcf/netcf_0.2.8.bb            | 2 +-
>  meta-networking/recipes-support/netperf/netperf_git.bb          | 2 +-
>  meta-networking/recipes-support/ntimed/ntimed_git.bb            | 2 +-
>  meta-networking/recipes-support/phytool/phytool.bb              | 2 +-
>  .../dynamic-layers/meta-python/recipes-bsp/rwmem/rwmem_1.2.bb   | 2 +-
>  .../meta-python/recipes-extended/lcdproc/lcdproc_git.bb         | 2 +-
>  meta-oe/recipes-benchmark/cpuburn/cpuburn-arm_git.bb            | 2 +-
>  meta-oe/recipes-benchmark/libc-bench/libc-bench_git.bb          | 2 +-
>  meta-oe/recipes-benchmark/tinymembench/tinymembench_git.bb      | 2 +-
>  meta-oe/recipes-bsp/edac-utils/edac-utils_git.bb                | 2 +-
>  meta-oe/recipes-bsp/firmwared/firmwared_git.bb                  | 2 +-
>  meta-oe/recipes-connectivity/gattlib/gattlib_git.bb             | 2 +-
>  .../libimobiledevice-glue/libimobiledevice-glue_git.bb          | 2 +-
>  .../libimobiledevice/libimobiledevice_git.bb                    | 2 +-
>  meta-oe/recipes-connectivity/libqrtr-glib/libqrtr-glib_git.bb   | 2 +-
>  meta-oe/recipes-connectivity/rtorrent/rtorrent_git.bb           | 2 +-
>  meta-oe/recipes-connectivity/usbmuxd/usbmuxd_git.bb             | 2 +-
>  meta-oe/recipes-core/dbus/dbus-daemon-proxy_git.bb              | 2 +-
>  meta-oe/recipes-core/glfw/glfw_3.3.8.bb                         | 2 +-
>  meta-oe/recipes-core/libnfc/libnfc_git.bb                       | 2 +-
>  meta-oe/recipes-core/mdbus2/mdbus2_git.bb                       | 2 +-
>  meta-oe/recipes-core/musl-rpmatch/musl-rpmatch_git.bb           | 2 +-
>  meta-oe/recipes-core/opencl/opencl-clhpp_git.bb                 | 2 +-
>  meta-oe/recipes-crypto/pkcs11-helper/pkcs11-helper_1.30.0.bb    | 2 +-
>  meta-oe/recipes-devtools/apitrace/apitrace_11.1.bb              | 2 +-
>  meta-oe/recipes-devtools/concurrencykit/concurrencykit_git.bb   | 2 +-
>  meta-oe/recipes-devtools/guider/guider_3.9.8.bb                 | 2 +-
>  meta-oe/recipes-devtools/libubox/libubox_git.bb                 | 2 +-
>  meta-oe/recipes-devtools/lshw/lshw_02.20.bb                     | 2 +-
>  meta-oe/recipes-devtools/ltrace/ltrace_git.bb                   | 2 +-
>  meta-oe/recipes-devtools/nlohmann-fifo/nlohmann-fifo_git.bb     | 2 +-
>  meta-oe/recipes-devtools/openocd/openocd_git.bb                 | 2 +-
>  meta-oe/recipes-devtools/pmtools/pmtools_git.bb                 | 2 +-
>  meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb             | 2 +-
>  meta-oe/recipes-devtools/yasm/yasm_git.bb                       | 2 +-
>  meta-oe/recipes-extended/docopt.cpp/docopt.cpp_git.bb           | 2 +-
>  meta-oe/recipes-extended/figlet/figlet_git.bb                   | 2 +-
>  meta-oe/recipes-extended/jpnevulator/jpnevulator_git.bb         | 2 +-
>  meta-oe/recipes-extended/libbacktrace/libbacktrace_git.bb       | 2 +-
>  meta-oe/recipes-extended/libimobiledevice/libplist_git.bb       | 2 +-
>  meta-oe/recipes-extended/libimobiledevice/libusbmuxd_git.bb     | 2 +-
>  meta-oe/recipes-extended/libuio/libuio_0.2.1.bb                 | 2 +-
>  meta-oe/recipes-extended/md5deep/md5deep_git.bb                 | 2 +-
>  meta-oe/recipes-extended/mraa/mraa_git.bb                       | 2 +-
>  meta-oe/recipes-extended/p8platform/p8platform_git.bb           | 2 +-
>  meta-oe/recipes-extended/properties-cpp/properties-cpp_git.bb   | 2 +-
>  meta-oe/recipes-extended/qad/qad_git.bb                         | 2 +-
>  meta-oe/recipes-extended/qcbor/qcbor_git.bb                     | 2 +-
>  meta-oe/recipes-extended/sanlock/sanlock_3.9.0.bb               | 2 +-
>  meta-oe/recipes-extended/socketcan/can-isotp_git.bb             | 2 +-
>  meta-oe/recipes-extended/tipcutils/tipcutils_git.bb             | 2 +-
>  meta-oe/recipes-extended/triggerhappy/triggerhappy_git.bb       | 2 +-
>  meta-oe/recipes-extended/upm/upm_git.bb                         | 2 +-
>  meta-oe/recipes-extended/zsync/zsync-curl_git.bb                | 2 +-
>  meta-oe/recipes-graphics/aml/aml_git.bb                         | 2 +-
>  meta-oe/recipes-graphics/fbida/fbida_git.bb                     | 2 +-
>  meta-oe/recipes-graphics/glm/glm_0.9.9.8.bb                     | 2 +-
>  meta-oe/recipes-graphics/openbox/obconf_git.bb                  | 2 +-
>  .../parallel-deqp-runner/parallel-deqp-runner_git.bb            | 2 +-
>  meta-oe/recipes-graphics/ttf-fonts/ttf-droid_git.bb             | 2 +-
>  meta-oe/recipes-graphics/x11vnc/x11vnc_0.9.16.bb                | 2 +-
>  meta-oe/recipes-multimedia/faad2/faad2_2.11.1.bb                | 2 +-
>  meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.26.1.bb         | 2 +-
>  .../recipes-support/ace-cloud-editor/ace-cloud-editor_git.bb    | 2 +-
>  meta-oe/recipes-support/cli11/cli11_2.3.2.bb                    | 2 +-
>  meta-oe/recipes-support/edid-decode/edid-decode_git.bb          | 2 +-
>  meta-oe/recipes-support/evemu-tools/evemu-tools_git.bb          | 2 +-
>  meta-oe/recipes-support/function2/function2_4.2.4.bb            | 2 +-
>  meta-oe/recipes-support/hunspell/hunspell-dictionaries.bb       | 2 +-
>  meta-oe/recipes-support/idevicerestore/idevicerestore_git.bb    | 2 +-
>  meta-oe/recipes-support/iksemel/iksemel_1.5.bb                  | 2 +-
>  meta-oe/recipes-support/iniparser/iniparser_4.1.bb              | 2 +-
>  meta-oe/recipes-support/libb64/libb64_2.0.0.1.bb                | 2 +-
>  meta-oe/recipes-support/libcereal/libcereal_1.3.2.bb            | 2 +-
>  meta-oe/recipes-support/libcyusbserial/libcyusbserial_git.bb    | 2 +-
>  meta-oe/recipes-support/libfann/libfann_git.bb                  | 2 +-
>  meta-oe/recipes-support/libusbgx/libusbgx_git.bb                | 2 +-
>  meta-oe/recipes-support/lio-utils/lio-utils_4.1.bb              | 2 +-
>  meta-oe/recipes-support/mcelog/mce-test_git.bb                  | 2 +-
>  meta-oe/recipes-support/ne10/ne10_1.2.1.bb                      | 2 +-
>  meta-oe/recipes-support/picocom/picocom_git.bb                  | 2 +-
>  meta-oe/recipes-support/pidgin/icyque_git.bb                    | 2 +-
>  meta-oe/recipes-support/pidgin/purple-skypeweb_git.bb           | 2 +-
>  meta-oe/recipes-support/portaudio/portaudio-v19_19.7.0.bb       | 2 +-
>  meta-oe/recipes-support/serial-utils/pty-forward-native.bb      | 2 +-
>  meta-oe/recipes-support/serial-utils/serial-forward_git.bb      | 2 +-
>  meta-oe/recipes-support/synergy/synergy_git.bb                  | 2 +-
>  meta-oe/recipes-support/utouch/utouch-evemu_git.bb              | 2 +-
>  meta-oe/recipes-support/utouch/utouch-frame_git.bb              | 2 +-
>  meta-oe/recipes-support/utouch/utouch-mtview_git.bb             | 2 +-
>  meta-oe/recipes-support/zbar/zbar_git.bb                        | 2 +-
>  meta-oe/recipes-test/cmocka/cmocka_1.1.7.bb                     | 2 +-
>  meta-oe/recipes-test/linux-serial-test/linux-serial-test_git.bb | 2 +-
>  meta-python/recipes-devtools/gyp/gyp_git.bb                     | 2 +-
>  meta-webserver/recipes-httpd/apache-mod/apache-websocket_git.bb | 2 +-
>  meta-webserver/recipes-httpd/cherokee/cherokee_git.bb           | 2 +-
>  123 files changed, 123 insertions(+), 123 deletions(-)
>
> diff --git a/meta-filesystems/recipes-filesystems/yaffs2/yaffs2-utils_git=
.bb b/meta-filesystems/recipes-filesystems/yaffs2/yaffs2-utils_git.bb
> index 6bf321e237..7228172b80 100644
> --- a/meta-filesystems/recipes-filesystems/yaffs2/yaffs2-utils_git.bb
> +++ b/meta-filesystems/recipes-filesystems/yaffs2/yaffs2-utils_git.bb
> @@ -9,7 +9,7 @@ LIC_FILES_CHKSUM =3D "file://utils/mkyaffs2image.c;beginl=
ine=3D11;endline=3D13;md5=3D5f5
>                      file://utils/mkyaffsimage.c;beginline=3D10;endline=
=3D12;md5=3D5f5464f9b3e981ca574e65b00e438561 \
>                      "
>
> -PV =3D "0.0+git${SRCPV}"
> +PV =3D "0.0+git"
>
>  DEPENDS =3D "mtd-utils"
>
> diff --git a/meta-filesystems/recipes-utils/aufs-util/aufs-util_git.bb b/=
meta-filesystems/recipes-utils/aufs-util/aufs-util_git.bb
> index fbf7753b02..ad846af470 100644
> --- a/meta-filesystems/recipes-utils/aufs-util/aufs-util_git.bb
> +++ b/meta-filesystems/recipes-utils/aufs-util/aufs-util_git.bb
> @@ -19,7 +19,7 @@ SRC_URI[aufs_type.sha256sum] =3D "7ff6566adb9c7a3b6862c=
dc85a690ab546f1d0bc81ddd595
>
>  UPSTREAM_CHECK_COMMITS =3D "1"
>
> -PV =3D "4.9+git${SRCPV}"
> +PV =3D "4.9+git"
>
>  S =3D "${WORKDIR}/git"
>
> diff --git a/meta-filesystems/recipes-utils/overlayfs/overlayfs-tools_git=
.bb b/meta-filesystems/recipes-utils/overlayfs/overlayfs-tools_git.bb
> index ca2ec9cc4f..47613207af 100644
> --- a/meta-filesystems/recipes-utils/overlayfs/overlayfs-tools_git.bb
> +++ b/meta-filesystems/recipes-utils/overlayfs/overlayfs-tools_git.bb
> @@ -7,7 +7,7 @@ SRC_URI =3D "\
>      git://github.com/kmxz/overlayfs-tools.git;protocol=3Dhttps;branch=3D=
master \
>  "
>
> -PV =3D "1.0+git${SRCPV}"
> +PV =3D "1.0+git"
>  SRCREV =3D "b5e5a829895ac98ccfe4629fbfbd8b819262bd00"
>
>  S =3D "${WORKDIR}/git"
> diff --git a/meta-gnome/recipes-gnome/devilspie/devilspie2_0.44.bb b/meta=
-gnome/recipes-gnome/devilspie/devilspie2_0.44.bb
> index 01900cce39..90c12efadf 100644
> --- a/meta-gnome/recipes-gnome/devilspie/devilspie2_0.44.bb
> +++ b/meta-gnome/recipes-gnome/devilspie/devilspie2_0.44.bb
> @@ -6,7 +6,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D00aefaa50aad75=
c21367df66102d542c \
>
>  DEPENDS =3D "gtk+ glib-2.0 libwnck libxinerama lua virtual/libx11"
>
> -PV .=3D "+git${SRCPV}"
> +PV .=3D "+git"
>
>  SRCREV =3D "b9d7ad9c09a5fb17a1562ee1d892798c646e9ec9"
>
> diff --git a/meta-gnome/recipes-support/keybinder/keybinder_3.0.bb b/meta=
-gnome/recipes-support/keybinder/keybinder_3.0.bb
> index 278592dc6e..7960009078 100644
> --- a/meta-gnome/recipes-support/keybinder/keybinder_3.0.bb
> +++ b/meta-gnome/recipes-support/keybinder/keybinder_3.0.bb
> @@ -11,7 +11,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D1f18f9c6d8b4=
cfcc7d7804a243a4c0b4"
>  S =3D "${WORKDIR}/git"
>
>  SRCREV =3D "736ccef40d39603b8111c8a3a0bca0319bbafdc0"
> -PV =3D "3.0+git${SRCPV}"
> +PV =3D "3.0+git"
>  SRC_URI =3D "git://github.com/engla/keybinder.git;branch=3Dkeybinder-3.0=
;protocol=3Dhttps \
>  "
>
> diff --git a/meta-initramfs/recipes-bsp/kexecboot/kexecboot_git.bb b/meta=
-initramfs/recipes-bsp/kexecboot/kexecboot_git.bb
> index 62d1effccc..a92c0e8966 100644
> --- a/meta-initramfs/recipes-bsp/kexecboot/kexecboot_git.bb
> +++ b/meta-initramfs/recipes-bsp/kexecboot/kexecboot_git.bb
> @@ -3,7 +3,7 @@ DESCRIPTION =3D "kexecboot is a graphical linux-as-bootlo=
ader implementation based
>  HOMEPAGE =3D "https://github.com/kexecboot/kexecboot/wiki"
>  LICENSE =3D "GPL-2.0-only"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9ba36caa9b7df079bae=
19f"
> -PV =3D "0.6+git${SRCPV}"
> +PV =3D "0.6+git"
>  S =3D "${WORKDIR}/git"
>  SRC_URI =3D "git://github.com/kexecboot/kexecboot.git;branch=3Dmaster;pr=
otocol=3Dhttps"
>  SRC_URI:append:libc-klibc =3D "\
> diff --git a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_git.bb=
 b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_git.bb
> index 5c7e84cc99..adfc3ba73a 100644
> --- a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_git.bb
> +++ b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_git.bb
> @@ -5,7 +5,7 @@ SECTION =3D "kernel/userland"
>  LICENSE =3D "GPL-2.0-only"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dea5bed2f60d357618ca161ad539f7=
c0a \
>                      file://kexec/kexec.c;beginline=3D1;endline=3D20;md5=
=3Daf10f6ae4a8715965e648aa687ad3e09"
> -PV =3D "2.0.18+git${SRCPV}"
> +PV =3D "2.0.18+git"
>
>  DEPENDS =3D "zlib xz"
>
> diff --git a/meta-multimedia/recipes-dvb/oscam/oscam_svn.bb b/meta-multim=
edia/recipes-dvb/oscam/oscam_svn.bb
> index bd2df5d8d6..8fbf9ab2c8 100644
> --- a/meta-multimedia/recipes-dvb/oscam/oscam_svn.bb
> +++ b/meta-multimedia/recipes-dvb/oscam/oscam_svn.bb
> @@ -9,7 +9,7 @@ DEPENDS =3D "libusb1 openssl pcsc-lite"
>  SRC_URI =3D "svn://www.streamboard.tv/svn/oscam;module=3Dtrunk;protocol=
=3Dhttp \
>             "
>  SRCREV =3D "11718"
> -PV =3D "1.10+${SRCPV}"
> +PV =3D "1.10+"
>
>  S =3D "${WORKDIR}/trunk"
>
> diff --git a/meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb b/met=
a-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb
> index d64ee96f78..2d79777001 100644
> --- a/meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb
> +++ b/meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb
> @@ -13,7 +13,7 @@ SRC_URI =3D "git://github.com/tvheadend/tvheadend.git;b=
ranch=3Dmaster;protocol=3Dhttps
>             "
>
>  SRCREV =3D "cc602833684953fc3e6f1c89d4f08f6dfef179e3"
> -PV =3D "4.3+git${SRCPV}"
> +PV =3D "4.3+git"
>  PKGV =3D "4.3+git${GITPKGV}"
>
>  S =3D "${WORKDIR}/git"
> diff --git a/meta-multimedia/recipes-multimedia/bluealsa/bluealsa_git.bb =
b/meta-multimedia/recipes-multimedia/bluealsa/bluealsa_git.bb
> index ab0d8bca9f..5007c88fff 100644
> --- a/meta-multimedia/recipes-multimedia/bluealsa/bluealsa_git.bb
> +++ b/meta-multimedia/recipes-multimedia/bluealsa/bluealsa_git.bb
> @@ -8,7 +8,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D8449a4f133a93f=
6254b496d4fb476e83"
>  SRC_URI =3D "git://github.com/Arkq/bluez-alsa.git;protocol=3Dhttps;branc=
h=3Dmaster"
>
>  SRCREV =3D "dd05a1baa261b94da9ba977b5e3392c8b4dc7a5e"
> -PV =3D "4.0.0+git${SRCPV}"
> +PV =3D "4.0.0+git"
>
>  S  =3D "${WORKDIR}/git"
>
> diff --git a/meta-multimedia/recipes-multimedia/dleyna/dleyna-server_0.6.=
0.bb b/meta-multimedia/recipes-multimedia/dleyna/dleyna-server_0.6.0.bb
> index 719aecede1..b0a347f252 100644
> --- a/meta-multimedia/recipes-multimedia/dleyna/dleyna-server_0.6.0.bb
> +++ b/meta-multimedia/recipes-multimedia/dleyna/dleyna-server_0.6.0.bb
> @@ -11,7 +11,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4fbd65380cdd=
255951079008b364516c \
>  DEPENDS =3D "glib-2.0 gssdp gupnp gupnp-av gupnp-dlna libsoup-2.4 libxml=
2 dleyna-core"
>  RDEPENDS:${PN} =3D "dleyna-connector-dbus"
>
> -PV .=3D "+git${SRCPV}"
> +PV .=3D "+git"
>  SRC_URI =3D "git://github.com/01org/${BPN}.git;branch=3Dmaster;protocol=
=3Dhttps"
>  SRCREV =3D "eb895ae82715e9889a948ffa810c0f828b4f4c76"
>  S =3D "${WORKDIR}/git"
> diff --git a/meta-multimedia/recipes-multimedia/libsquish/libsquish_git.b=
b b/meta-multimedia/recipes-multimedia/libsquish/libsquish_git.bb
> index fb74881c03..3d631ea0b6 100644
> --- a/meta-multimedia/recipes-multimedia/libsquish/libsquish_git.bb
> +++ b/meta-multimedia/recipes-multimedia/libsquish/libsquish_git.bb
> @@ -3,7 +3,7 @@ SUMMARY =3D "The squish library (abbreviated to libsquish=
) is an open source DXT c
>  LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D "file://alpha.cpp;beginline=3D3;endline=3D22;md5=3D=
6665e479f71feb92d590ea9ae9b9f6d5"
>
> -PV =3D "1.10+git${SRCPV}"
> +PV =3D "1.10+git"
>
>  SRCREV =3D "52e7d93c5947f72380521116c05d97c528863ba8"
>  SRC_URI =3D "git://github.com/OpenELEC/libsquish.git;protocol=3Dhttps;br=
anch=3Dmaster \
> diff --git a/meta-multimedia/recipes-multimedia/musicbrainz/libmusicbrain=
z_git.bb b/meta-multimedia/recipes-multimedia/musicbrainz/libmusicbrainz_gi=
t.bb
> index 3b365444e2..e8b10bc680 100644
> --- a/meta-multimedia/recipes-multimedia/musicbrainz/libmusicbrainz_git.b=
b
> +++ b/meta-multimedia/recipes-multimedia/musicbrainz/libmusicbrainz_git.b=
b
> @@ -5,7 +5,7 @@ LICENSE =3D "LGPL-2.1-or-later"
>  LIC_FILES_CHKSUM =3D "file://COPYING.txt;md5=3Dfbc093901857fcd118f065f90=
0982c24"
>  DEPENDS =3D "expat libxml2 libxml2-native neon neon-native libmusicbrain=
z-native"
>
> -PV =3D "5.1.0+git${SRCPV}"
> +PV =3D "5.1.0+git"
>
>  SRCREV =3D "8be45b12a86bc0e46f2f836c8ac88e1e98d82aee"
>  SRC_URI =3D "git://github.com/metabrainz/libmusicbrainz.git;branch=3Dmas=
ter;protocol=3Dhttps \
> diff --git a/meta-multimedia/recipes-support/gst-instruments/gst-instrume=
nts_git.bb b/meta-multimedia/recipes-support/gst-instruments/gst-instrument=
s_git.bb
> index 8f0ad65120..df688bbcda 100644
> --- a/meta-multimedia/recipes-support/gst-instruments/gst-instruments_git=
.bb
> +++ b/meta-multimedia/recipes-support/gst-instruments/gst-instruments_git=
.bb
> @@ -6,7 +6,7 @@ LICENSE =3D "LGPL-3.0-only"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3De6a600fd5e1d9cbde2d983680233a=
d02"
>  DEPENDS =3D "gstreamer1.0"
>  SRCREV =3D "cb8977a6711657e32853159cd539d1d75fcbc772"
> -PV =3D "0.3.1+git${SRCPV}"
> +PV =3D "0.3.1+git"
>
>  SRC_URI =3D "git://github.com/kirushyk/gst-instruments.git;protocol=3Dht=
tps;branch=3Dmaster"
>
> diff --git a/meta-networking/recipes-connectivity/bearssl/bearssl_0.6.bb =
b/meta-networking/recipes-connectivity/bearssl/bearssl_0.6.bb
> index 1e70a3dec6..39569e9d06 100644
> --- a/meta-networking/recipes-connectivity/bearssl/bearssl_0.6.bb
> +++ b/meta-networking/recipes-connectivity/bearssl/bearssl_0.6.bb
> @@ -23,7 +23,7 @@ inherit lib_package
>  LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D1fc37e1037ae673975fbcb96a=
98f7191"
>
> -PV .=3D "+git${SRCPV}"
> +PV .=3D "+git"
>  SRCREV =3D "79c060eea3eea1257797f15ea1608a9a9923aa6f"
>  SRC_URI =3D "git://www.bearssl.org/git/BearSSL;protocol=3Dhttps;branch=
=3Dmaster \
>             file://0002-test-test_x509.c-fix-potential-overflow-issue.pat=
ch \
> diff --git a/meta-networking/recipes-connectivity/bluepy/bluepy_git.bb b/=
meta-networking/recipes-connectivity/bluepy/bluepy_git.bb
> index 8e164708ed..5b784d9a04 100644
> --- a/meta-networking/recipes-connectivity/bluepy/bluepy_git.bb
> +++ b/meta-networking/recipes-connectivity/bluepy/bluepy_git.bb
> @@ -5,7 +5,7 @@ LICENSE =3D "GPL-2.0-only & PD"
>  LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D59e0d45ea684dda215889aa1b=
5acd001"
>  DEPENDS =3D "glib-2.0"
>  SRCREV =3D "7ad565231a97c304c0eff45f2649cd005e69db09"
> -PV =3D "1.3.0+git${SRCPV}"
> +PV =3D "1.3.0+git"
>
>  SRC_URI =3D "git://github.com/IanHarvey/bluepy.git;protocol=3Dhttps;bran=
ch=3Dmaster \
>             file://0001-bluepy-Fix-username-issue-with-tarballs.patch \
> diff --git a/meta-networking/recipes-connectivity/openthread/ot-br-posix_=
git.bb b/meta-networking/recipes-connectivity/openthread/ot-br-posix_git.bb
> index 720228dc14..71e5a8d43b 100644
> --- a/meta-networking/recipes-connectivity/openthread/ot-br-posix_git.bb
> +++ b/meta-networking/recipes-connectivity/openthread/ot-br-posix_git.bb
> @@ -12,7 +12,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D87109e44b2fd=
a96a8991f27684a7349c \
>                      "
>  DEPENDS =3D "autoconf-archive dbus readline avahi jsoncpp boost libnetfi=
lter-queue"
>  SRCREV =3D "ad6822257ffddbac295db97186e4ab449a2ed32a"
> -PV =3D "0.3.0+git${SRCPV}"
> +PV =3D "0.3.0+git"
>
>  SRC_URI =3D "gitsm://github.com/openthread/ot-br-posix.git;protocol=3Dht=
tps;branch=3Dmain \
>             file://0001-otbr-agent.service.in-remove-pre-exec-hook-for-md=
ns-.patch \
> diff --git a/meta-networking/recipes-connectivity/openthread/ot-daemon_gi=
t.bb b/meta-networking/recipes-connectivity/openthread/ot-daemon_git.bb
> index 18703d6c4d..1583a3f837 100644
> --- a/meta-networking/recipes-connectivity/openthread/ot-daemon_git.bb
> +++ b/meta-networking/recipes-connectivity/openthread/ot-daemon_git.bb
> @@ -9,7 +9,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D543b6fe90ec590=
1a683320a36390c65f \
>                      "
>  DEPENDS =3D "readline"
>  SRCREV =3D "7dfde1f12923f03c9680be4d838b94b7a2320324"
> -PV =3D "0.1+git${SRCPV}"
> +PV =3D "0.1+git"
>
>  SRC_URI =3D "git://github.com/openthread/openthread.git;protocol=3Dhttps=
;branch=3Dmain \
>             file://0001-bn_mul.h-fix-x86-PIC-inline-ASM-compilation-with-=
GCC.patch \
> diff --git a/meta-networking/recipes-connectivity/openthread/wpantund_git=
.bb b/meta-networking/recipes-connectivity/openthread/wpantund_git.bb
> index ebb3fc3c1c..b75d686e58 100644
> --- a/meta-networking/recipes-connectivity/openthread/wpantund_git.bb
> +++ b/meta-networking/recipes-connectivity/openthread/wpantund_git.bb
> @@ -13,7 +13,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3De7820bc7f7d1=
638a6b54fc2e8d7fb103 \
>                      "
>  DEPENDS =3D "autoconf-archive dbus readline boost"
>  SRCREV =3D "0fb1f57e4224e2df3e630e146702bfcf63fbf07a"
> -PV =3D "0.07.01+git${SRCPV}"
> +PV =3D "0.07.01+git"
>
>  SRC_URI =3D "gitsm://github.com/openthread/wpantund.git;protocol=3Dhttps=
;branch=3Dmaster \
>             "
> diff --git a/meta-networking/recipes-connectivity/relayd/relayd_git.bb b/=
meta-networking/recipes-connectivity/relayd/relayd_git.bb
> index 79e1743fdf..871df69909 100644
> --- a/meta-networking/recipes-connectivity/relayd/relayd_git.bb
> +++ b/meta-networking/recipes-connectivity/relayd/relayd_git.bb
> @@ -8,7 +8,7 @@ DEPENDS =3D "libubox"
>  SRC_URI =3D "git://git.openwrt.org/project/relayd.git;branch=3Dmaster"
>
>  SRCREV =3D "f646ba40489371e69f624f2dee2fc4e19ceec00e"
> -PV =3D "0.0.1+git${SRCPV}"
> +PV =3D "0.0.1+git"
>
>  UPSTREAM_CHECK_COMMITS =3D "1"
>
> diff --git a/meta-networking/recipes-filter/ulogd2/ulogd2_2.0.8.bb b/meta=
-networking/recipes-filter/ulogd2/ulogd2_2.0.8.bb
> index 19bd32ccd4..d075ec4788 100644
> --- a/meta-networking/recipes-filter/ulogd2/ulogd2_2.0.8.bb
> +++ b/meta-networking/recipes-filter/ulogd2/ulogd2_2.0.8.bb
> @@ -9,7 +9,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dc93c0550bd3173=
f4504b2cbd8991e50b"
>  DEPENDS =3D "libnfnetlink"
>  PROVIDES =3D "ulogd"
>
> -PV .=3D "+git${SRCPV}"
> +PV .=3D "+git"
>
>  SRC_URI =3D "git://git.netfilter.org/ulogd2;branch=3Dmaster \
>             file://ulogd.init \
> diff --git a/meta-networking/recipes-protocols/openflow/openflow_git.bb b=
/meta-networking/recipes-protocols/openflow/openflow_git.bb
> index 1ac5dd4105..f39888e8f1 100644
> --- a/meta-networking/recipes-protocols/openflow/openflow_git.bb
> +++ b/meta-networking/recipes-protocols/openflow/openflow_git.bb
> @@ -1,7 +1,7 @@
>  include ${BPN}.inc
>
>  SRCREV =3D "c84f33f09d5dbcfc9b489f64cb30475bf36f653a"
> -PV =3D "1.0+git${SRCPV}"
> +PV =3D "1.0+git"
>
>  SRC_URI +=3D "file://0001-Check-and-use-strlcpy-from-libc-before-definin=
g-own.patch \
>             file://0002-lib-netdev-Adjust-header-include-sequence.patch \
> diff --git a/meta-networking/recipes-protocols/openlldp/openlldp_1.1.0.bb=
 b/meta-networking/recipes-protocols/openlldp/openlldp_1.1.0.bb
> index 812f4fbcf0..71d738ddc1 100644
> --- a/meta-networking/recipes-protocols/openlldp/openlldp_1.1.0.bb
> +++ b/meta-networking/recipes-protocols/openlldp/openlldp_1.1.0.bb
> @@ -13,7 +13,7 @@ inherit ${@bb.utils.contains('DISTRO_FEATURES', 'system=
d', 'systemd', '', d)}
>  DEPENDS =3D "libnl libconfig readline"
>
>  SRCREV =3D "85e55837a81d710e5baa7da47f7ed0d205c8ede5"
> -PV .=3D "+git${SRCPV}"
> +PV .=3D "+git"
>  SRC_URI =3D "git://github.com/intel/openlldp.git;protocol=3Dhttps;branch=
=3Dbranch-1.1 \
>             file://0001-Fix-musl-libc-build-issue.patch \
>             file://0001-autotools-Add-include-path-to-generated-version.h=
.patch \
> diff --git a/meta-networking/recipes-support/arptables/arptables_git.bb b=
/meta-networking/recipes-support/arptables/arptables_git.bb
> index 898b69682d..949794bf30 100644
> --- a/meta-networking/recipes-support/arptables/arptables_git.bb
> +++ b/meta-networking/recipes-support/arptables/arptables_git.bb
> @@ -3,7 +3,7 @@ SECTION =3D "net"
>  LICENSE =3D "GPL-2.0-only"
>  LIC_FILES_CHKSUM =3D "file://${COREBASE}/meta/files/common-licenses/GPL-=
2.0-only;md5=3D801f80980d171dd6425610833a22dbe6"
>  SRCREV =3D "efae8949e31f8b2eb6290f377a28384cecaf105a"
> -PV =3D "0.0.5+git${SRCPV}"
> +PV =3D "0.0.5+git"
>
>  SRC_URI =3D " \
>      git://git.netfilter.org/arptables;branch=3Dmaster \
> diff --git a/meta-networking/recipes-support/celt051/celt051_git.bb b/met=
a-networking/recipes-support/celt051/celt051_git.bb
> index 62682cfce3..4842a0fbdf 100644
> --- a/meta-networking/recipes-support/celt051/celt051_git.bb
> +++ b/meta-networking/recipes-support/celt051/celt051_git.bb
> @@ -12,7 +12,7 @@ like Speex, GSM, or G.729."
>  LICENSE =3D "BSD-2-Clause"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D375f60ab360d17f0172737036ff15=
5b2"
>
> -PV =3D "0.5.1.3+git${SRCPV}"
> +PV =3D "0.5.1.3+git"
>
>  SRCREV =3D "5555aae843f57241d005e330b9cb65602d56db0f"
>
> diff --git a/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.=
0.19.bb b/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.19.=
bb
> index 4a9d2f54d9..3f945eeeee 100644
> --- a/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.19.bb
> +++ b/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.19.bb
> @@ -10,7 +10,7 @@ LIC_FILES_CHKSUM =3D " \
>
>  SRCREV =3D "05b50d379ff0037de4957bb2a1befcce88b70225"
>
> -PV .=3D "+git${SRCPV}"
> +PV .=3D "+git"
>  LK_REL =3D "1.0.19"
>
>  SRC_URI =3D " \
> diff --git a/meta-networking/recipes-support/lowpan-tools/lowpan-tools_gi=
t.bb b/meta-networking/recipes-support/lowpan-tools/lowpan-tools_git.bb
> index baaff1f219..f0b7e9184e 100644
> --- a/meta-networking/recipes-support/lowpan-tools/lowpan-tools_git.bb
> +++ b/meta-networking/recipes-support/lowpan-tools/lowpan-tools_git.bb
> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D751419260aa954=
499f7abaabaa882bbe"
>
>  DEPENDS =3D "flex-native bison-native libnl python"
>
> -PV =3D "0.3.1+git${SRCPV}"
> +PV =3D "0.3.1+git"
>  SRC_URI =3D "git://github.com/linux-wpan/lowpan-tools;branch=3Dmaster;pr=
otocol=3Dhttps \
>             file://no-help2man.patch \
>             file://0001-Fix-build-errors-with-clang.patch \
> diff --git a/meta-networking/recipes-support/netcf/netcf_0.2.8.bb b/meta-=
networking/recipes-support/netcf/netcf_0.2.8.bb
> index f60bb9f104..59ce3e9991 100644
> --- a/meta-networking/recipes-support/netcf/netcf_0.2.8.bb
> +++ b/meta-networking/recipes-support/netcf/netcf_0.2.8.bb
> @@ -7,7 +7,7 @@ LICENSE =3D "LGPL-2.1-only"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dfb919cc88dbe06ec0b0bd50e001cc=
f1f"
>
>  SRCREV =3D "2c5d4255857531bc09d91dcd02e86545f29004d4"
> -PV .=3D "+git${SRCPV}"
> +PV .=3D "+git"
>
>  SRC_URI =3D "git://pagure.io/netcf.git;protocol=3Dhttps;branch=3Dmaster =
\
>  "
> diff --git a/meta-networking/recipes-support/netperf/netperf_git.bb b/met=
a-networking/recipes-support/netperf/netperf_git.bb
> index 4074f0cd07..6e459eeeb4 100644
> --- a/meta-networking/recipes-support/netperf/netperf_git.bb
> +++ b/meta-networking/recipes-support/netperf/netperf_git.bb
> @@ -5,7 +5,7 @@ HOMEPAGE =3D "http://www.netperf.org/"
>  LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3De661ab33a2a71ad6652c178dedf8a=
aa2"
>
> -PV =3D "2.7.0+git${SRCPV}"
> +PV =3D "2.7.0+git"
>
>  SRC_URI =3D "git://github.com/HewlettPackard/netperf.git;branch=3Dmaster=
;protocol=3Dhttps \
>             file://cpu_set.patch \
> diff --git a/meta-networking/recipes-support/ntimed/ntimed_git.bb b/meta-=
networking/recipes-support/ntimed/ntimed_git.bb
> index 9badfd75d1..955c03f42d 100644
> --- a/meta-networking/recipes-support/ntimed/ntimed_git.bb
> +++ b/meta-networking/recipes-support/ntimed/ntimed_git.bb
> @@ -11,7 +11,7 @@ LIC_FILES_CHKSUM =3D "file://main.c;beginline=3D2;endli=
ne=3D24;md5=3D89db8e76f2951f3fad1
>  SRC_URI =3D "git://github.com/bsdphk/Ntimed;branch=3Dmaster;protocol=3Dh=
ttps \
>             file://use-ldflags.patch"
>
> -PV =3D "0.0+git${SRCPV}"
> +PV =3D "0.0+git"
>  SRCREV =3D "db0abbb4c80f2ecef6bc5d9639bca5bea28532a2"
>
>  S =3D "${WORKDIR}/git"
> diff --git a/meta-networking/recipes-support/phytool/phytool.bb b/meta-ne=
tworking/recipes-support/phytool/phytool.bb
> index c2c4335910..b918e50c68 100644
> --- a/meta-networking/recipes-support/phytool/phytool.bb
> +++ b/meta-networking/recipes-support/phytool/phytool.bb
> @@ -2,7 +2,7 @@ SUMMARY =3D "PHY interface tool for Linux"
>  LICENSE =3D "GPL-2.0-only"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D39bba7d2cf0ba1036f2a6e2be52fe=
3f0"
>
> -PV =3D "2+git${SRCPV}"
> +PV =3D "2+git"
>  SRCREV =3D "8882328c08ba2efb13c049812098f1d0cb8adf0c"
>  SRC_URI =3D "git://github.com/wkz/phytool.git;branch=3Dmaster;protocol=
=3Dhttps"
>
> diff --git a/meta-oe/dynamic-layers/meta-python/recipes-bsp/rwmem/rwmem_1=
.2.bb b/meta-oe/dynamic-layers/meta-python/recipes-bsp/rwmem/rwmem_1.2.bb
> index bff82fe35d..90c9a7147c 100644
> --- a/meta-oe/dynamic-layers/meta-python/recipes-bsp/rwmem/rwmem_1.2.bb
> +++ b/meta-oe/dynamic-layers/meta-python/recipes-bsp/rwmem/rwmem_1.2.bb
> @@ -13,7 +13,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Db234ee4d69f5=
fce4486a80fdaf4a4263"
>
>  DEPENDS +=3D "fmt libinih"
>
> -PV .=3D "+git${SRCPV}"
> +PV .=3D "+git"
>
>  SRCREV =3D "8416326777b2aada0706539b8f9f6acefa476b16"
>
> diff --git a/meta-oe/dynamic-layers/meta-python/recipes-extended/lcdproc/=
lcdproc_git.bb b/meta-oe/dynamic-layers/meta-python/recipes-extended/lcdpro=
c/lcdproc_git.bb
> index 4cae4947f2..c29c51a2ae 100644
> --- a/meta-oe/dynamic-layers/meta-python/recipes-extended/lcdproc/lcdproc=
_git.bb
> +++ b/meta-oe/dynamic-layers/meta-python/recipes-extended/lcdproc/lcdproc=
_git.bb
> @@ -9,7 +9,7 @@ DEPENDS =3D "ncurses lirc"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D18810669f13b87348459e611d31ab=
760 \
>                      file://README.md;beginline=3D107;md5=3D5db392f043253=
a2d64b1737068ce6b58"
>
> -PV =3D "0.5.9+git${SRCPV}"
> +PV =3D "0.5.9+git"
>  SRCREV =3D "0e2ce9b9c46c47363436f9ee730f7c71bf455f0f"
>  SRC_URI =3D "git://github.com/lcdproc/lcdproc;branch=3Dmaster;protocol=
=3Dhttps"
>
> diff --git a/meta-oe/recipes-benchmark/cpuburn/cpuburn-arm_git.bb b/meta-=
oe/recipes-benchmark/cpuburn/cpuburn-arm_git.bb
> index 7969af6c37..c58524aa64 100644
> --- a/meta-oe/recipes-benchmark/cpuburn/cpuburn-arm_git.bb
> +++ b/meta-oe/recipes-benchmark/cpuburn/cpuburn-arm_git.bb
> @@ -7,7 +7,7 @@ PROVIDES +=3D "cpuburn-neon"
>
>  SRCREV =3D "ad7e646700d14b81413297bda02fb7fe96613c3f"
>
> -PV =3D "1.0+git${SRCPV}"
> +PV =3D "1.0+git"
>
>  SRC_URI =3D "git://github.com/ssvb/cpuburn-arm.git;branch=3Dmaster;proto=
col=3Dhttps \
>             file://0001-cpuburn-a8.S-Remove-.func-.endfunc.patch \
> diff --git a/meta-oe/recipes-benchmark/libc-bench/libc-bench_git.bb b/met=
a-oe/recipes-benchmark/libc-bench/libc-bench_git.bb
> index 17bbb9b6ce..4ace4515ad 100644
> --- a/meta-oe/recipes-benchmark/libc-bench/libc-bench_git.bb
> +++ b/meta-oe/recipes-benchmark/libc-bench/libc-bench_git.bb
> @@ -7,7 +7,7 @@ LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D "file://COPYRIGHT;md5=3D9a825c63897c53f487ef900598c=
31527"
>
>  SRCREV =3D "b6b2ce5f9f87a09b14499cb00c600c601f022634"
> -PV =3D "20110206+git${SRCPV}"
> +PV =3D "20110206+git"
>
>  SRC_URI =3D "git://git.musl-libc.org/libc-bench;branch=3Dmaster \
>             file://0001-build-Do-not-override-ldflags-from-environment.pa=
tch \
> diff --git a/meta-oe/recipes-benchmark/tinymembench/tinymembench_git.bb b=
/meta-oe/recipes-benchmark/tinymembench/tinymembench_git.bb
> index 025aacf251..200a0de849 100644
> --- a/meta-oe/recipes-benchmark/tinymembench/tinymembench_git.bb
> +++ b/meta-oe/recipes-benchmark/tinymembench/tinymembench_git.bb
> @@ -6,7 +6,7 @@ HOMEPAGE =3D "https://github.com/ssvb/tinymembench/wiki"
>  LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D "file://main.c;endline=3D22;md5=3D879b9bbb608514548=
85b5fa47eb6b345"
>
> -PV =3D "0.4.9+git${SRCPV}"
> +PV =3D "0.4.9+git"
>
>  SRCREV =3D "a2cf6d7e382e3aea1eb39173174d9fa28cad15f3"
>  SRC_URI =3D "git://github.com/ssvb/tinymembench.git;branch=3Dmaster;prot=
ocol=3Dhttps \
> diff --git a/meta-oe/recipes-bsp/edac-utils/edac-utils_git.bb b/meta-oe/r=
ecipes-bsp/edac-utils/edac-utils_git.bb
> index 455859ec86..03076cbc60 100644
> --- a/meta-oe/recipes-bsp/edac-utils/edac-utils_git.bb
> +++ b/meta-oe/recipes-bsp/edac-utils/edac-utils_git.bb
> @@ -11,7 +11,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5=
fce4486a80fdaf4a4263"
>  DEPENDS =3D " sysfsutils"
>
>  SRCREV =3D "1c57818ecee186aa47af0342149577df5302c022"
> -PV =3D "0.18+git${SRCPV}"
> +PV =3D "0.18+git"
>
>  S =3D "${WORKDIR}/git"
>
> diff --git a/meta-oe/recipes-bsp/firmwared/firmwared_git.bb b/meta-oe/rec=
ipes-bsp/firmwared/firmwared_git.bb
> index e8b491a435..0a041835e1 100644
> --- a/meta-oe/recipes-bsp/firmwared/firmwared_git.bb
> +++ b/meta-oe/recipes-bsp/firmwared/firmwared_git.bb
> @@ -10,7 +10,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE-APACHE;md5=3D7b486=
c2338d225a1405d979ed2c15ce8 \
>  SRC_URI =3D "git://github.com/teg/firmwared.git;branch=3Dmaster;protocol=
=3Dhttps \
>             file://firmwared.service"
>
> -PV =3D "0+git${SRCPV}"
> +PV =3D "0+git"
>  SRCREV =3D "2e6b5db43d63a5c0283a4cae9a6a20b7ad107a04"
>
>  S =3D "${WORKDIR}/git"
> diff --git a/meta-oe/recipes-connectivity/gattlib/gattlib_git.bb b/meta-o=
e/recipes-connectivity/gattlib/gattlib_git.bb
> index aec41edf7a..f54d833a01 100644
> --- a/meta-oe/recipes-connectivity/gattlib/gattlib_git.bb
> +++ b/meta-oe/recipes-connectivity/gattlib/gattlib_git.bb
> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D "file://CMakeLists.txt;beginline=3D1=
;endline=3D6;md5=3Da87ee154f005
>  DEPENDS =3D "bluez5 glib-2.0"
>  DEPENDS +=3D "glib-2.0-native"
>
> -PV =3D "0.2+git${SRCPV}"
> +PV =3D "0.2+git"
>
>  SRC_URI =3D "git://github.com/labapart/gattlib.git;branch=3Dmaster;proto=
col=3Dhttps \
>             file://dbus-avoid-strange-chars-from-the-build-dir.patch \
> diff --git a/meta-oe/recipes-connectivity/libimobiledevice-glue/libimobil=
edevice-glue_git.bb b/meta-oe/recipes-connectivity/libimobiledevice-glue/li=
bimobiledevice-glue_git.bb
> index b63aabdc0c..d37c547c98 100644
> --- a/meta-oe/recipes-connectivity/libimobiledevice-glue/libimobiledevice=
-glue_git.bb
> +++ b/meta-oe/recipes-connectivity/libimobiledevice-glue/libimobiledevice=
-glue_git.bb
> @@ -8,7 +8,7 @@ HOMEPAGE =3D "http://www.libimobiledevice.org/"
>
>  DEPENDS =3D "libplist"
>
> -PV =3D "1.0.0+git${SRCPV}"
> +PV =3D "1.0.0+git"
>
>  SRCREV =3D "114098d30e783fbb3def5c9b49427a86621cfcb1"
>  SRC_URI =3D "git://github.com/libimobiledevice/libimobiledevice-glue;pro=
tocol=3Dhttps;branch=3Dmaster"
> diff --git a/meta-oe/recipes-connectivity/libimobiledevice/libimobiledevi=
ce_git.bb b/meta-oe/recipes-connectivity/libimobiledevice/libimobiledevice_=
git.bb
> index 1a0590c57b..b8d7e8872b 100644
> --- a/meta-oe/recipes-connectivity/libimobiledevice/libimobiledevice_git.=
bb
> +++ b/meta-oe/recipes-connectivity/libimobiledevice/libimobiledevice_git.=
bb
> @@ -8,7 +8,7 @@ HOMEPAGE =3D "http://www.libimobiledevice.org/"
>
>  DEPENDS =3D "libplist usbmuxd libusbmuxd libtasn1 gnutls libgcrypt libim=
obiledevice-glue openssl"
>
> -PV =3D "1.3.0+git${SRCPV}"
> +PV =3D "1.3.0+git"
>
>  SRCREV =3D "860ffb707af3af94467d2ece4ad258dda957c6cd"
>  SRC_URI =3D "git://github.com/libimobiledevice/libimobiledevice;protocol=
=3Dhttps;branch=3Dmaster \
> diff --git a/meta-oe/recipes-connectivity/libqrtr-glib/libqrtr-glib_git.b=
b b/meta-oe/recipes-connectivity/libqrtr-glib/libqrtr-glib_git.bb
> index 7bac3117cd..3549cac568 100644
> --- a/meta-oe/recipes-connectivity/libqrtr-glib/libqrtr-glib_git.bb
> +++ b/meta-oe/recipes-connectivity/libqrtr-glib/libqrtr-glib_git.bb
> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSES/LGPL-2.1-or-later.t=
xt;md5=3D4fbd65380cdd255951
>
>  SRC_URI =3D "git://gitlab.freedesktop.org/mobile-broadband/libqrtr-glib.=
git;protocol=3Dhttps;branch=3Dqrtr-1-2"
>
> -PV =3D "1.2.2+git${SRCPV}"
> +PV =3D "1.2.2+git"
>  SRCREV =3D "8991f0e93713ebf4da48ae4f23940ead42f64c8c"
>
>  S =3D "${WORKDIR}/git"
> diff --git a/meta-oe/recipes-connectivity/rtorrent/rtorrent_git.bb b/meta=
-oe/recipes-connectivity/rtorrent/rtorrent_git.bb
> index d5411b19b2..d9cca404d7 100644
> --- a/meta-oe/recipes-connectivity/rtorrent/rtorrent_git.bb
> +++ b/meta-oe/recipes-connectivity/rtorrent/rtorrent_git.bb
> @@ -8,7 +8,7 @@ DEPENDS =3D "autoconf-archive libsigc++-2.0 curl cppunit =
libtool libtorrent ncurse
>  SRC_URI =3D "git://github.com/rakshasa/rtorrent;branch=3Dmaster;protocol=
=3Dhttps"
>  SRCREV =3D "d067bd802e44f0e6a747aabcc311ada2175fd550"
>
> -PV =3D "0.9.8+git${SRCPV}"
> +PV =3D "0.9.8+git"
>
>  S =3D "${WORKDIR}/git"
>
> diff --git a/meta-oe/recipes-connectivity/usbmuxd/usbmuxd_git.bb b/meta-o=
e/recipes-connectivity/usbmuxd/usbmuxd_git.bb
> index 1492234495..569d6a41cf 100644
> --- a/meta-oe/recipes-connectivity/usbmuxd/usbmuxd_git.bb
> +++ b/meta-oe/recipes-connectivity/usbmuxd/usbmuxd_git.bb
> @@ -9,7 +9,7 @@ DEPENDS =3D "udev libusb1 libplist libimobiledevice-glue"
>  inherit autotools pkgconfig gitpkgv systemd
>
>  PKGV =3D "${GITPKGVTAG}"
> -PV =3D "1.1.2+git${SRCPV}"
> +PV =3D "1.1.2+git"
>
>  SRCREV =3D "01c94c77f59404924f1c46d99c4e5e0c7817281b"
>  SRC_URI =3D "git://github.com/libimobiledevice/usbmuxd;protocol=3Dhttps;=
branch=3Dmaster"
> diff --git a/meta-oe/recipes-core/dbus/dbus-daemon-proxy_git.bb b/meta-oe=
/recipes-core/dbus/dbus-daemon-proxy_git.bb
> index d096cd618e..122a3f9916 100644
> --- a/meta-oe/recipes-core/dbus/dbus-daemon-proxy_git.bb
> +++ b/meta-oe/recipes-core/dbus/dbus-daemon-proxy_git.bb
> @@ -3,7 +3,7 @@ LICENSE =3D "LGPL-2.1-or-later"
>  LIC_FILES_CHKSUM =3D "file://dbus-daemon-proxy.c;endline=3D19;md5=3D41df=
6d21fe1c97d6a1cc22a5bf374cba"
>  DEPENDS =3D "dbus dbus-glib"
>  SRCREV =3D "1226a0a1374628ff191f6d8a56000be5e53e7608"
> -PV =3D "0.0.0+gitr${SRCPV}"
> +PV =3D "0.0.0+gitr"
>  PR =3D "r1.59"
>
>  SRC_URI =3D "git://github.com/alban/dbus-daemon-proxy;branch=3Dmaster;pr=
otocol=3Dhttps \
> diff --git a/meta-oe/recipes-core/glfw/glfw_3.3.8.bb b/meta-oe/recipes-co=
re/glfw/glfw_3.3.8.bb
> index ad7a3a7ed4..684355ef3e 100644
> --- a/meta-oe/recipes-core/glfw/glfw_3.3.8.bb
> +++ b/meta-oe/recipes-core/glfw/glfw_3.3.8.bb
> @@ -10,7 +10,7 @@ SECTION =3D "lib"
>
>  inherit pkgconfig cmake features_check
>
> -PV .=3D "+git${SRCPV}"
> +PV .=3D "+git"
>  SRCREV =3D "7482de6071d21db77a7236155da44c172a7f6c9e"
>  SRC_URI =3D "git://github.com/glfw/glfw.git;branch=3D3.3-stable;protocol=
=3Dhttps"
>
> diff --git a/meta-oe/recipes-core/libnfc/libnfc_git.bb b/meta-oe/recipes-=
core/libnfc/libnfc_git.bb
> index 9733749628..a97a2841f7 100644
> --- a/meta-oe/recipes-core/libnfc/libnfc_git.bb
> +++ b/meta-oe/recipes-core/libnfc/libnfc_git.bb
> @@ -7,7 +7,7 @@ SECTION =3D "libs"
>
>  inherit autotools pkgconfig
>
> -PV =3D "1.8.0+git${SRCPV}"
> +PV =3D "1.8.0+git"
>
>  S =3D "${WORKDIR}/git"
>  SRCREV =3D "f02ff51449240102c27a97173dc495e8e7789046"
> diff --git a/meta-oe/recipes-core/mdbus2/mdbus2_git.bb b/meta-oe/recipes-=
core/mdbus2/mdbus2_git.bb
> index c6db78b4ab..a7ac358f27 100644
> --- a/meta-oe/recipes-core/mdbus2/mdbus2_git.bb
> +++ b/meta-oe/recipes-core/mdbus2/mdbus2_git.bb
> @@ -4,7 +4,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Debb5c50ab7cab4=
baeffba14977030c07"
>
>  DEPENDS =3D "readline"
>
> -PV =3D "2.3.3+git${SRCPV}"
> +PV =3D "2.3.3+git"
>
>  SRC_URI =3D "git://github.com/freesmartphone/mdbus.git;protocol=3Dhttps;=
branch=3Dmaster \
>             file://0001-Fix-arguments-in-GLib.DBusSignalCallback-for-Vala=
-0..patch \
> diff --git a/meta-oe/recipes-core/musl-rpmatch/musl-rpmatch_git.bb b/meta=
-oe/recipes-core/musl-rpmatch/musl-rpmatch_git.bb
> index 163a74ebe3..0bb45b8eaf 100644
> --- a/meta-oe/recipes-core/musl-rpmatch/musl-rpmatch_git.bb
> +++ b/meta-oe/recipes-core/musl-rpmatch/musl-rpmatch_git.bb
> @@ -4,7 +4,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D81a81bf31abecc=
50c20862fc8a716329"
>
>  SRC_URI =3D "gitsm://github.com/pullmoll/musl-rpmatch.git;protocol=3Dhtt=
ps;branch=3Dmaster"
>
> -PV =3D "1.0+git${SRCPV}"
> +PV =3D "1.0+git"
>  SRCREV =3D "46267b154987d3e1f25d3a75423faa62bb5ee342"
>
>  inherit autotools
> diff --git a/meta-oe/recipes-core/opencl/opencl-clhpp_git.bb b/meta-oe/re=
cipes-core/opencl/opencl-clhpp_git.bb
> index 8a712602cc..7ae0362d37 100644
> --- a/meta-oe/recipes-core/opencl/opencl-clhpp_git.bb
> +++ b/meta-oe/recipes-core/opencl/opencl-clhpp_git.bb
> @@ -6,7 +6,7 @@ SRC_URI =3D "git://github.com/KhronosGroup/OpenCL-CLHPP.g=
it;protocol=3Dhttps;branch=3D
>  LICENSE  =3D "Apache-2.0"
>  LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D3b83ef96387f14655fc854ddc=
3c6bd57"
>
> -PV =3D "2.0.16+git${SRCPV}"
> +PV =3D "2.0.16+git"
>  SRCREV =3D "1df82b9749739f2681081092ae163bb0f0d40f66"
>
>  S =3D "${WORKDIR}/git"
> diff --git a/meta-oe/recipes-crypto/pkcs11-helper/pkcs11-helper_1.30.0.bb=
 b/meta-oe/recipes-crypto/pkcs11-helper/pkcs11-helper_1.30.0.bb
> index df6ca75461..d3922cf79e 100644
> --- a/meta-oe/recipes-crypto/pkcs11-helper/pkcs11-helper_1.30.0.bb
> +++ b/meta-oe/recipes-crypto/pkcs11-helper/pkcs11-helper_1.30.0.bb
> @@ -20,7 +20,7 @@ SRC_URI =3D "git://github.com/OpenSC/${BPN}.git;branch=
=3Dmaster;protocol=3Dhttps"
>  S =3D "${WORKDIR}/git"
>  # master
>  SRCREV =3D "8bed16034f629a0361fa8ff89deed2b43dc45d8b"
> -PV .=3D "+1.30.0+git${SRCPV}"
> +PV .=3D "+1.30.0+git"
>
>  UPSTREAM_CHECK_GITTAGREGEX =3D "pkcs11-helper-(?P<pver>\d+(\.\d+)+)"
>
> diff --git a/meta-oe/recipes-devtools/apitrace/apitrace_11.1.bb b/meta-oe=
/recipes-devtools/apitrace/apitrace_11.1.bb
> index aed7977595..d872c4dbb5 100644
> --- a/meta-oe/recipes-devtools/apitrace/apitrace_11.1.bb
> +++ b/meta-oe/recipes-devtools/apitrace/apitrace_11.1.bb
> @@ -6,7 +6,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Daeb969185a143c=
3c25130bc2c3ef9a50 \
>                      file://thirdparty/snappy/COPYING;md5=3Df62f3080324a9=
7b3159a7a7e61812d0c"
>
>  SRCREV =3D "9352fc02bba106fbbeef9e8452ef34643c0d0764"
> -PV .=3D "+11.1+git${SRCPV}"
> +PV .=3D "+11.1+git"
>  SRC_URI =3D "gitsm://github.com/${BPN}/${BPN}.git;branch=3Dmaster;protoc=
ol=3Dhttps \
>            "
>
> diff --git a/meta-oe/recipes-devtools/concurrencykit/concurrencykit_git.b=
b b/meta-oe/recipes-devtools/concurrencykit/concurrencykit_git.bb
> index 277fac9f7c..47a3d88853 100644
> --- a/meta-oe/recipes-devtools/concurrencykit/concurrencykit_git.bb
> +++ b/meta-oe/recipes-devtools/concurrencykit/concurrencykit_git.bb
> @@ -7,7 +7,7 @@ LICENSE =3D "BSD-2-Clause & Apache-2.0"
>  HOMEPAGE =3D "http://concurrencykit.org"
>  SECTION =3D "base"
>
> -PV =3D "0.7.0+git${SRCPV}"
> +PV =3D "0.7.0+git"
>  SRCREV =3D "6e8e5bec2e2f8cef2072a68579cbb07ababf3331"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Da0b24c1a8f9ad516a297d055b0294=
231"
>  SRC_URI =3D "git://github.com/concurrencykit/ck.git;branch=3Dmaster;prot=
ocol=3Dhttps \
> diff --git a/meta-oe/recipes-devtools/guider/guider_3.9.8.bb b/meta-oe/re=
cipes-devtools/guider/guider_3.9.8.bb
> index 15d43e9790..0d93297a07 100644
> --- a/meta-oe/recipes-devtools/guider/guider_3.9.8.bb
> +++ b/meta-oe/recipes-devtools/guider/guider_3.9.8.bb
> @@ -5,7 +5,7 @@ BUGTRACKER =3D "https://github.com/iipeace/guider/issues"
>  LICENSE =3D "GPL-2.0-or-later"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D2c1c00f9d3ed9e24fa69b932b7e7a=
ff2"
>
> -PV =3D "3.9.8+git${SRCPV}"
> +PV =3D "3.9.8+git"
>
>  SRC_URI =3D "git://github.com/iipeace/${BPN};branch=3Dmaster;protocol=3D=
https"
>  SRCREV =3D "a502cd93b13235b7539557a91328de00b7c51bc3"
> diff --git a/meta-oe/recipes-devtools/libubox/libubox_git.bb b/meta-oe/re=
cipes-devtools/libubox/libubox_git.bb
> index b2898c9c7f..39e18cdafd 100644
> --- a/meta-oe/recipes-devtools/libubox/libubox_git.bb
> +++ b/meta-oe/recipes-devtools/libubox/libubox_git.bb
> @@ -20,7 +20,7 @@ SRC_URI =3D "\
>  "
>
>  SRCREV =3D "07413cce72e19520af55dfcbc765484f5ab41dd9"
> -PV =3D "1.0.1+git${SRCPV}"
> +PV =3D "1.0.1+git"
>
>  S =3D "${WORKDIR}/git"
>
> diff --git a/meta-oe/recipes-devtools/lshw/lshw_02.20.bb b/meta-oe/recipe=
s-devtools/lshw/lshw_02.20.bb
> index 70ae38caa2..0fb68d8684 100644
> --- a/meta-oe/recipes-devtools/lshw/lshw_02.20.bb
> +++ b/meta-oe/recipes-devtools/lshw/lshw_02.20.bb
> @@ -11,7 +11,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5=
fce4486a80fdaf4a4263"
>
>  COMPATIBLE_HOST =3D "(i.86|x86_64|arm|aarch64|riscv64).*-linux"
>
> -PV .=3D "+git${SRCPV}"
> +PV .=3D "+git"
>  SRCREV =3D "4c6497c8b0a67cd9fa9693e9101a7cafd3297e81"
>  SRC_URI =3D " \
>      git://github.com/lyonel/lshw.git;protocol=3Dhttps;branch=3Dmaster \
> diff --git a/meta-oe/recipes-devtools/ltrace/ltrace_git.bb b/meta-oe/reci=
pes-devtools/ltrace/ltrace_git.bb
> index d690dd4f02..63971970cf 100644
> --- a/meta-oe/recipes-devtools/ltrace/ltrace_git.bb
> +++ b/meta-oe/recipes-devtools/ltrace/ltrace_git.bb
> @@ -10,7 +10,7 @@ LICENSE =3D "GPL-2.0-only"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Deb723b61539feef013de476e68b5c=
50a"
>
>  PE =3D "1"
> -PV =3D "7.91+git${SRCPV}"
> +PV =3D "7.91+git"
>  SRCREV =3D "c22d359433b333937ee3d803450dc41998115685"
>
>  DEPENDS =3D "elfutils"
> diff --git a/meta-oe/recipes-devtools/nlohmann-fifo/nlohmann-fifo_git.bb =
b/meta-oe/recipes-devtools/nlohmann-fifo/nlohmann-fifo_git.bb
> index b5d05d40e5..36e46021bb 100644
> --- a/meta-oe/recipes-devtools/nlohmann-fifo/nlohmann-fifo_git.bb
> +++ b/meta-oe/recipes-devtools/nlohmann-fifo/nlohmann-fifo_git.bb
> @@ -6,7 +6,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.MIT;md5=3Db67209a1e3=
6b682a8226de19d265b1e0"
>
>  SRC_URI =3D "git://github.com/nlohmann/fifo_map.git;branch=3Dmaster;prot=
ocol=3Dhttps"
>
> -PV =3D "1.0.0+git${SRCPV}"
> +PV =3D "1.0.0+git"
>
>  SRCREV =3D "d732aaf9a315415ae8fd7eb11e3a4c1f80e42a48"
>
> diff --git a/meta-oe/recipes-devtools/openocd/openocd_git.bb b/meta-oe/re=
cipes-devtools/openocd/openocd_git.bb
> index 19ef987387..36cdb00f2b 100644
> --- a/meta-oe/recipes-devtools/openocd/openocd_git.bb
> +++ b/meta-oe/recipes-devtools/openocd/openocd_git.bb
> @@ -17,7 +17,7 @@ SRCREV_git2cl =3D "8373c9f74993e218a08819cbcdbab3f3564b=
beba"
>  SRCREV_jimtcl =3D "fcbb4499a6b46ef69e7a95da53e30796e20817f0"
>  SRCREV_libjaylink =3D "9aa7a5957c07bb6e862fc1a6d3153d109c7407e4"
>
> -PV =3D "0.12+gitr${SRCPV}"
> +PV =3D "0.12+gitr"
>  S =3D "${WORKDIR}/git"
>
>  inherit pkgconfig autotools-brokensep gettext
> diff --git a/meta-oe/recipes-devtools/pmtools/pmtools_git.bb b/meta-oe/re=
cipes-devtools/pmtools/pmtools_git.bb
> index 56d895a099..ad149de12c 100644
> --- a/meta-oe/recipes-devtools/pmtools/pmtools_git.bb
> +++ b/meta-oe/recipes-devtools/pmtools/pmtools_git.bb
> @@ -4,7 +4,7 @@ HOMEPAGE =3D "http://lesswatts.org/projects/acpi"
>  LICENSE =3D "GPL-2.0-or-later"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D0636e73ff0215e8d672dc4c32c317=
bb3"
>
> -PV =3D "20130209+git${SRCPV}"
> +PV =3D "20130209+git"
>
>  SRC_URI =3D "git://github.com/anyc/pmtools.git;branch=3Dmaster;protocol=
=3Dhttps \
>      file://pmtools-switch-to-dynamic-buffer-for-huge-ACPI-table.patch \
> diff --git a/meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb b/meta-o=
e/recipes-devtools/rapidjson/rapidjson_git.bb
> index 65294fafad..8519479c4d 100644
> --- a/meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb
> +++ b/meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb
> @@ -8,7 +8,7 @@ SRC_URI =3D "git://github.com/miloyip/rapidjson.git;branc=
h=3Dmaster;protocol=3Dhttps"
>
>  SRCREV =3D "0ccdbf364c577803e2a751f5aededce935314313"
>
> -PV =3D "1.1.0+git${SRCPV}"
> +PV =3D "1.1.0+git"
>
>  S =3D "${WORKDIR}/git"
>
> diff --git a/meta-oe/recipes-devtools/yasm/yasm_git.bb b/meta-oe/recipes-=
devtools/yasm/yasm_git.bb
> index 26540b4295..079f805d6c 100644
> --- a/meta-oe/recipes-devtools/yasm/yasm_git.bb
> +++ b/meta-oe/recipes-devtools/yasm/yasm_git.bb
> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Da12d8903508fb6=
bfd49d8d82c6170dd9"
>  DEPENDS +=3D "flex-native bison-native"
>  PACKAGECONFIG[docs] =3D ",,xmlto-native,"
>
> -PV =3D "1.3.0+git${SRCPV}"
> +PV =3D "1.3.0+git"
>  # v1.3.0
>  SRCREV =3D "ba463d3c26c0ece2e797b8d6381b161633b5971a"
>  SRC_URI =3D "git://github.com/yasm/yasm.git;branch=3Dmaster;protocol=3Dh=
ttps \
> diff --git a/meta-oe/recipes-extended/docopt.cpp/docopt.cpp_git.bb b/meta=
-oe/recipes-extended/docopt.cpp/docopt.cpp_git.bb
> index 28db39ac20..3d438871ed 100644
> --- a/meta-oe/recipes-extended/docopt.cpp/docopt.cpp_git.bb
> +++ b/meta-oe/recipes-extended/docopt.cpp/docopt.cpp_git.bb
> @@ -15,7 +15,7 @@ LIC_FILES_CHKSUM =3D "\
>
>  DEPENDS =3D "boost"
>  SRCREV =3D "42ebcec9dc2c99a1b3a4542787572045763ad196"
> -PV =3D "0.6.3+git${SRCPV}"
> +PV =3D "0.6.3+git"
>
>  SRC_URI =3D "\
>      git://github.com/docopt/docopt.cpp.git;protocol=3Dhttps;branch=3Dmas=
ter \
> diff --git a/meta-oe/recipes-extended/figlet/figlet_git.bb b/meta-oe/reci=
pes-extended/figlet/figlet_git.bb
> index 61b050aac6..9789ac16d4 100644
> --- a/meta-oe/recipes-extended/figlet/figlet_git.bb
> +++ b/meta-oe/recipes-extended/figlet/figlet_git.bb
> @@ -8,7 +8,7 @@ SRC_URI =3D "git://github.com/cmatsuoka/figlet.git;branch=
=3Dmaster;protocol=3Dhttps \
>             file://0001-build-add-autotools-support-to-allow-easy-cross-c=
omp.patch"
>  SRCREV =3D "5bbcd7383a8c3a531299b216b0c734e1495c6db3"
>  S =3D "${WORKDIR}/git"
> -PV =3D "2.2.5+git${SRCPV}"
> +PV =3D "2.2.5+git"
>
>  inherit autotools
>
> diff --git a/meta-oe/recipes-extended/jpnevulator/jpnevulator_git.bb b/me=
ta-oe/recipes-extended/jpnevulator/jpnevulator_git.bb
> index 39d6459227..bfa0e79d8f 100644
> --- a/meta-oe/recipes-extended/jpnevulator/jpnevulator_git.bb
> +++ b/meta-oe/recipes-extended/jpnevulator/jpnevulator_git.bb
> @@ -2,7 +2,7 @@ SUMMARY =3D "A handy serial sniffer"
>  LICENSE =3D "GPL-2.0-only"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D892f569a555ba9c07a568a7c0c4fa=
63a"
>
> -PV =3D "2.3.6+git${SRCPV}"
> +PV =3D "2.3.6+git"
>
>  SRC_URI =3D "git://github.com/snarlistic/jpnevulator.git;protocol=3Dhttp=
s;branch=3Dmaster"
>  SRCREV =3D "bc1d4f6587a4a4829b5d55e3ca7ad584da6de545"
> diff --git a/meta-oe/recipes-extended/libbacktrace/libbacktrace_git.bb b/=
meta-oe/recipes-extended/libbacktrace/libbacktrace_git.bb
> index 6f2ead9a8d..d540737bc9 100644
> --- a/meta-oe/recipes-extended/libbacktrace/libbacktrace_git.bb
> +++ b/meta-oe/recipes-extended/libbacktrace/libbacktrace_git.bb
> @@ -10,7 +10,7 @@ DEPENDS +=3D "libunwind"
>
>  SRC_URI =3D "git://github.com/ianlancetaylor/libbacktrace;protocol=3Dhtt=
ps;branch=3Dmaster"
>
> -PV =3D "1.0+git${SRCPV}"
> +PV =3D "1.0+git"
>  SRCREV =3D "9ae4f4ae4481b1e69d38ed810980d33103544613"
>
>  S =3D "${WORKDIR}/git"
> diff --git a/meta-oe/recipes-extended/libimobiledevice/libplist_git.bb b/=
meta-oe/recipes-extended/libimobiledevice/libplist_git.bb
> index 6fbc28394f..26dd821f96 100644
> --- a/meta-oe/recipes-extended/libimobiledevice/libplist_git.bb
> +++ b/meta-oe/recipes-extended/libimobiledevice/libplist_git.bb
> @@ -8,7 +8,7 @@ DEPENDS =3D "libxml2 glib-2.0 swig python3"
>
>  inherit autotools pkgconfig python3native python3targetconfig
>
> -PV =3D "2.3.0+git${SRCPV}"
> +PV =3D "2.3.0+git"
>
>  SRCREV =3D "2cd858c679d25633077ca78b67182a9b77653816"
>  SRC_URI =3D "git://github.com/libimobiledevice/libplist;protocol=3Dhttps=
;branch=3Dmaster"
> diff --git a/meta-oe/recipes-extended/libimobiledevice/libusbmuxd_git.bb =
b/meta-oe/recipes-extended/libimobiledevice/libusbmuxd_git.bb
> index 91a9b4af2c..b9f5c34094 100644
> --- a/meta-oe/recipes-extended/libimobiledevice/libusbmuxd_git.bb
> +++ b/meta-oe/recipes-extended/libimobiledevice/libusbmuxd_git.bb
> @@ -7,7 +7,7 @@ DEPENDS =3D "udev libusb1 libplist libimobiledevice-glue"
>  inherit autotools pkgconfig gitpkgv
>
>  PKGV =3D "${GITPKGVTAG}"
> -PV =3D "2.0.2+git${SRCPV}"
> +PV =3D "2.0.2+git"
>
>  SRCREV =3D "36ffb7ab6e2a7e33bd1b56398a88895b7b8c615a"
>  SRC_URI =3D "git://github.com/libimobiledevice/libusbmuxd;protocol=3Dhtt=
ps;branch=3Dmaster"
> diff --git a/meta-oe/recipes-extended/libuio/libuio_0.2.1.bb b/meta-oe/re=
cipes-extended/libuio/libuio_0.2.1.bb
> index 65bf9ba647..6e6c8cc226 100644
> --- a/meta-oe/recipes-extended/libuio/libuio_0.2.1.bb
> +++ b/meta-oe/recipes-extended/libuio/libuio_0.2.1.bb
> @@ -7,7 +7,7 @@ SRCREV =3D "17d96e8f9a5bce7cee5e2222855ab46a246dba51"
>
>  SRC_URI =3D "git://git.code.sf.net/p/libuio/code;branch=3Dmaster;protoco=
l=3Dhttps"
>
> -PV .=3D "+0.2.2+git${SRCPV}"
> +PV .=3D "+0.2.2+git"
>
>  inherit autotools
>
> diff --git a/meta-oe/recipes-extended/md5deep/md5deep_git.bb b/meta-oe/re=
cipes-extended/md5deep/md5deep_git.bb
> index b1a38cf6f2..5351a37db6 100644
> --- a/meta-oe/recipes-extended/md5deep/md5deep_git.bb
> +++ b/meta-oe/recipes-extended/md5deep/md5deep_git.bb
> @@ -4,7 +4,7 @@ HOMEPAGE =3D "http://md5deep.sourceforge.net"
>  LICENSE =3D "GPL-2.0-only"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D9190f660105b9a56cdb272309bfd5=
491"
>
> -PV =3D "4.4+git${SRCPV}"
> +PV =3D "4.4+git"
>
>  SRCREV =3D "877613493ff44807888ce1928129574be393cbb0"
>
> diff --git a/meta-oe/recipes-extended/mraa/mraa_git.bb b/meta-oe/recipes-=
extended/mraa/mraa_git.bb
> index 61f36d724d..37bd36432f 100644
> --- a/meta-oe/recipes-extended/mraa/mraa_git.bb
> +++ b/meta-oe/recipes-extended/mraa/mraa_git.bb
> @@ -6,7 +6,7 @@ LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D91e7de50a8d3cf01057f318d72460=
acd"
>
>  SRCREV =3D "3c288a09109969eef9c2da7d92d3c62f92a015cc"
> -PV =3D "2.2.0+git${SRCPV}"
> +PV =3D "2.2.0+git"
>
>  SRC_URI =3D "git://github.com/eclipse/${BPN}.git;protocol=3Dhttps;branch=
=3Dmaster \
>             file://0001-cmake-Use-a-regular-expression-to-match-x86-archi=
tec.patch \
> diff --git a/meta-oe/recipes-extended/p8platform/p8platform_git.bb b/meta=
-oe/recipes-extended/p8platform/p8platform_git.bb
> index bb9574feb2..dc7280f099 100644
> --- a/meta-oe/recipes-extended/p8platform/p8platform_git.bb
> +++ b/meta-oe/recipes-extended/p8platform/p8platform_git.bb
> @@ -4,7 +4,7 @@ HOMEPAGE =3D "http://libcec.pulse-eight.com/"
>  LICENSE =3D "GPL-2.0-or-later"
>  LIC_FILES_CHKSUM =3D "file://src/os.h;md5=3D752555fa94e82005d45fd201fee5=
bd33"
>
> -PV =3D "2.1.0.1+git${SRCPV}"
> +PV =3D "2.1.0.1+git"
>
>  SRC_URI =3D "git://github.com/Pulse-Eight/platform.git;branch=3Dmaster;p=
rotocol=3Dhttps"
>  SRCREV =3D "a7cd0d5780ed80a4e70480d1650749f29e8a1fb2"
> diff --git a/meta-oe/recipes-extended/properties-cpp/properties-cpp_git.b=
b b/meta-oe/recipes-extended/properties-cpp/properties-cpp_git.bb
> index 88a18aa137..25951c9de4 100644
> --- a/meta-oe/recipes-extended/properties-cpp/properties-cpp_git.bb
> +++ b/meta-oe/recipes-extended/properties-cpp/properties-cpp_git.bb
> @@ -6,7 +6,7 @@ SECTION =3D "libs"
>  LICENSE =3D "LGPL-3.0-only"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3De6a600fd5e1d9cbde2d983680233a=
d02"
>
> -PV =3D "0.0.1+git${SRCPV}"
> +PV =3D "0.0.1+git"
>
>  SRCREV =3D "45863e849b39c4921d6553e6d27e267a96ac7d77"
>  SRC_URI =3D "git://github.com/lib-cpp/${BPN}.git;branch=3Dmaster;protoco=
l=3Dhttps"
> diff --git a/meta-oe/recipes-extended/qad/qad_git.bb b/meta-oe/recipes-ex=
tended/qad/qad_git.bb
> index 056f28a0a4..0bc94121a7 100644
> --- a/meta-oe/recipes-extended/qad/qad_git.bb
> +++ b/meta-oe/recipes-extended/qad/qad_git.bb
> @@ -15,7 +15,7 @@ SRC_URI =3D "git://gitlab.com/CodethinkLabs/qad/qad;bra=
nch=3Dmain;protocol=3Dhttps \
>  SRCREV =3D "ae0c099c1fdc0ca6f5d631cea6b302937122b362"
>
>  S =3D "${WORKDIR}/git"
> -PV =3D "0.0+git${SRCPV}"
> +PV =3D "0.0+git"
>
>  DEPENDS =3D "cjson libmicrohttpd libdrm libpng"
>
> diff --git a/meta-oe/recipes-extended/qcbor/qcbor_git.bb b/meta-oe/recipe=
s-extended/qcbor/qcbor_git.bb
> index 9c562d5a66..a87454fa95 100644
> --- a/meta-oe/recipes-extended/qcbor/qcbor_git.bb
> +++ b/meta-oe/recipes-extended/qcbor/qcbor_git.bb
> @@ -12,7 +12,7 @@ SRC_URI =3D "git://github.com/laurencelundblade/QCBOR;p=
rotocol=3Dhttps;branch=3Dmaster
>
>  SRCREV =3D "44754f738c6534a4304a83d4c6e97b3d3193d887"
>
> -PV =3D "1.2+git${SRCPV}"
> +PV =3D "1.2+git"
>
>  S =3D "${WORKDIR}/git"
>
> diff --git a/meta-oe/recipes-extended/sanlock/sanlock_3.9.0.bb b/meta-oe/=
recipes-extended/sanlock/sanlock_3.9.0.bb
> index fa1c6c7ecd..a5a3b43feb 100644
> --- a/meta-oe/recipes-extended/sanlock/sanlock_3.9.0.bb
> +++ b/meta-oe/recipes-extended/sanlock/sanlock_3.9.0.bb
> @@ -11,7 +11,7 @@ SECTION =3D "utils"
>  LICENSE =3D "LGPL-2.0-or-later & GPL-2.0-only & GPL-2.0-or-later"
>  LIC_FILES_CHKSUM =3D "file://README.license;md5=3D60487bf0bf429d6b5aa72b=
6d37a0eb22"
>
> -PV .=3D "+git${SRCPV}"
> +PV .=3D "+git"
>
>  SRC_URI =3D "git://pagure.io/sanlock.git;protocol=3Dhttp;branch=3Dmaster=
 \
>             file://0001-sanlock-Replace-cp-a-with-cp-R-no-dereference-pre=
ser.patch \
> diff --git a/meta-oe/recipes-extended/socketcan/can-isotp_git.bb b/meta-o=
e/recipes-extended/socketcan/can-isotp_git.bb
> index 993efab395..a60b55e7e7 100644
> --- a/meta-oe/recipes-extended/socketcan/can-isotp_git.bb
> +++ b/meta-oe/recipes-extended/socketcan/can-isotp_git.bb
> @@ -1,7 +1,7 @@
>  LICENSE =3D "GPL-2.0-only"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D72d977d697c3c05830fdff00a7448=
931"
>  SRCREV =3D "beb4650660179963a8ed5b5cbf2085cc1b34f608"
> -PV =3D "1.0+git${SRCPV}"
> +PV =3D "1.0+git"
>
>  SRC_URI =3D "git://github.com/hartkopp/can-isotp.git;protocol=3Dhttps;br=
anch=3Dmaster"
>
> diff --git a/meta-oe/recipes-extended/tipcutils/tipcutils_git.bb b/meta-o=
e/recipes-extended/tipcutils/tipcutils_git.bb
> index fc64ec0fcb..596aa260e7 100644
> --- a/meta-oe/recipes-extended/tipcutils/tipcutils_git.bb
> +++ b/meta-oe/recipes-extended/tipcutils/tipcutils_git.bb
> @@ -9,7 +9,7 @@ SRC_URI =3D "git://git.code.sf.net/p/tipc/tipcutils;branc=
h=3Dmaster \
>             file://0001-test-ptts-Set-recv-buffer-size-too-max-to-receive=
-as.patch \
>             "
>  SRCREV =3D "7ab2211b87414ba240b0b2e4af219c1057c9cf9a"
> -PV =3D "2.2.0+git${SRCPV}"
> +PV =3D "2.2.0+git"
>
>  inherit autotools pkgconfig
>
> diff --git a/meta-oe/recipes-extended/triggerhappy/triggerhappy_git.bb b/=
meta-oe/recipes-extended/triggerhappy/triggerhappy_git.bb
> index 3a3dd192be..0b14f9557a 100644
> --- a/meta-oe/recipes-extended/triggerhappy/triggerhappy_git.bb
> +++ b/meta-oe/recipes-extended/triggerhappy/triggerhappy_git.bb
> @@ -6,7 +6,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd32239bcb67346=
3ab874e80d47fae504"
>
>  # matches debian/0.5.0-1 tag
>  SRCREV =3D "44a173195986d0d853316cb02a58785ded66c12b"
> -PV =3D "0.5.0+git${SRCPV}"
> +PV =3D "0.5.0+git"
>  SRC_URI =3D "git://github.com/wertarbyte/${BPN}.git;branch=3Ddebian;prot=
ocol=3Dhttps"
>
>  S =3D "${WORKDIR}/git"
> diff --git a/meta-oe/recipes-extended/upm/upm_git.bb b/meta-oe/recipes-ex=
tended/upm/upm_git.bb
> index a86f4a80d8..8468ff775d 100644
> --- a/meta-oe/recipes-extended/upm/upm_git.bb
> +++ b/meta-oe/recipes-extended/upm/upm_git.bb
> @@ -8,7 +8,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D66493d54e65bfc=
12c7983ff2e884f37f"
>  DEPENDS =3D "libjpeg-turbo mraa python3-setuptools-native"
>
>  SRCREV =3D "5cf20df96c6b35c19d5b871ba4e319e96b4df72d"
> -PV =3D "2.0.0+git${SRCPV}"
> +PV =3D "2.0.0+git"
>
>  SRC_URI =3D "git://github.com/eclipse/${BPN}.git;protocol=3Dhttps;branch=
=3Dmaster \
>             file://0001-CMakeLists.txt-Use-SWIG_SUPPORT_FILES-to-find-the=
-li.patch \
> diff --git a/meta-oe/recipes-extended/zsync/zsync-curl_git.bb b/meta-oe/r=
ecipes-extended/zsync/zsync-curl_git.bb
> index 84593387d3..1bc4010f8a 100644
> --- a/meta-oe/recipes-extended/zsync/zsync-curl_git.bb
> +++ b/meta-oe/recipes-extended/zsync/zsync-curl_git.bb
> @@ -10,7 +10,7 @@ SRC_URI =3D "git://github.com/probonopd/zsync-curl;prot=
ocol=3Dhttps;branch=3Dmaster \
>             file://make.patch"
>  SRCREV =3D "00141c2806ccc4ddf2ff6263ee1612d19c0b713f"
>
> -PV =3D "0.6.2+git${SRCPV}"
> +PV =3D "0.6.2+git"
>
>  inherit autotools
>
> diff --git a/meta-oe/recipes-graphics/aml/aml_git.bb b/meta-oe/recipes-gr=
aphics/aml/aml_git.bb
> index eed62adae0..2633e0d215 100644
> --- a/meta-oe/recipes-graphics/aml/aml_git.bb
> +++ b/meta-oe/recipes-graphics/aml/aml_git.bb
> @@ -8,7 +8,7 @@ SRC_URI =3D "git://github.com/any1/aml;branch=3Dmaster;pr=
otocol=3Dhttps"
>
>  SRCREV =3D "b83f3576ce4187d9285f06e9066ef43a691464d4"
>
> -PV =3D "0.3.0+git${SRCPV}"
> +PV =3D "0.3.0+git"
>
>  S =3D "${WORKDIR}/git"
>
> diff --git a/meta-oe/recipes-graphics/fbida/fbida_git.bb b/meta-oe/recipe=
s-graphics/fbida/fbida_git.bb
> index 65c9041a3b..247a1fcbb2 100644
> --- a/meta-oe/recipes-graphics/fbida/fbida_git.bb
> +++ b/meta-oe/recipes-graphics/fbida/fbida_git.bb
> @@ -9,7 +9,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3De8feb78a32950a=
909621bbb51f634b39"
>
>  DEPENDS =3D "virtual/libiconv jpeg fontconfig freetype libexif libdrm pi=
xman udev libinput cairo"
>
> -PV =3D "2.14+git${SRCPV}"
> +PV =3D "2.14+git"
>  SRC_URI =3D "git://github.com/kraxel/fbida;protocol=3Dhttps;branch=3Dmas=
ter \
>             file://fix-preprocessor.patch \
>             file://support-jpeg-turbo.patch \
> diff --git a/meta-oe/recipes-graphics/glm/glm_0.9.9.8.bb b/meta-oe/recipe=
s-graphics/glm/glm_0.9.9.8.bb
> index 3797314b47..dd520b245e 100644
> --- a/meta-oe/recipes-graphics/glm/glm_0.9.9.8.bb
> +++ b/meta-oe/recipes-graphics/glm/glm_0.9.9.8.bb
> @@ -18,7 +18,7 @@ SRC_URI =3D " \
>      file://glmTargets.cmake \
>  "
>  SRCREV =3D "efec5db081e3aad807d0731e172ac597f6a39447"
> -PV .=3D "+0.9.9.9+git${SRCPV}"
> +PV .=3D "+0.9.9.9+git"
>
>  S =3D "${WORKDIR}/git"
>
> diff --git a/meta-oe/recipes-graphics/openbox/obconf_git.bb b/meta-oe/rec=
ipes-graphics/openbox/obconf_git.bb
> index efffd962d4..1210af70ea 100644
> --- a/meta-oe/recipes-graphics/openbox/obconf_git.bb
> +++ b/meta-oe/recipes-graphics/openbox/obconf_git.bb
> @@ -8,7 +8,7 @@ DEPENDS =3D " \
>      startup-notification \
>      gtk+3 \
>  "
> -PV =3D "2.0.4+git${SRCPV}"
> +PV =3D "2.0.4+git"
>
>  SRCREV =3D "63ec47c5e295ad4f09d1df6d92afb7e10c3fec39"
>  SRC_URI =3D " \
> diff --git a/meta-oe/recipes-graphics/parallel-deqp-runner/parallel-deqp-=
runner_git.bb b/meta-oe/recipes-graphics/parallel-deqp-runner/parallel-deqp=
-runner_git.bb
> index eff6ad8f83..2ec89bc05b 100644
> --- a/meta-oe/recipes-graphics/parallel-deqp-runner/parallel-deqp-runner_=
git.bb
> +++ b/meta-oe/recipes-graphics/parallel-deqp-runner/parallel-deqp-runner_=
git.bb
> @@ -7,7 +7,7 @@ SRC_URI =3D "git://gitlab.freedesktop.org/mesa/parallel-d=
eqp-runner.git;protocol=3Dh
>             "
>
>  # Modify these as desired
> -PV =3D "2020.06.15+git${SRCPV}"
> +PV =3D "2020.06.15+git"
>  SRCREV =3D "e1642fb691d29b1462504b58916f7f514a963e80"
>
>  S =3D "${WORKDIR}/git"
> diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-droid_git.bb b/meta-o=
e/recipes-graphics/ttf-fonts/ttf-droid_git.bb
> index 7fa155a22f..119612cd73 100644
> --- a/meta-oe/recipes-graphics/ttf-fonts/ttf-droid_git.bb
> +++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-droid_git.bb
> @@ -5,7 +5,7 @@ HOMEPAGE =3D "http://www.droidfonts.com/"
>  LICENSE =3D "Apache-2.0"
>  LIC_FILES_CHKSUM =3D "file://README.txt;md5=3D83544262a86f1f1ec761e75897=
df92bc"
>  SRCREV =3D "21e6e2de1f0062f949fcc52d0b4559dfa3246e0e"
> -PV =3D "0.1+gitr${SRCPV}"
> +PV =3D "0.1+gitr"
>  PR =3D "r3"
>
>  SRC_URI =3D "git://github.com/android/platform_frameworks_base.git;branc=
h=3Dmaster;protocol=3Dhttps"
> diff --git a/meta-oe/recipes-graphics/x11vnc/x11vnc_0.9.16.bb b/meta-oe/r=
ecipes-graphics/x11vnc/x11vnc_0.9.16.bb
> index 3633bbc26b..74f80e1844 100644
> --- a/meta-oe/recipes-graphics/x11vnc/x11vnc_0.9.16.bb
> +++ b/meta-oe/recipes-graphics/x11vnc/x11vnc_0.9.16.bb
> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fc=
e4486a80fdaf4a4263 \
>                      file://src/x11vnc.h;endline=3D31;md5=3De871a2ad00477=
6794b616822dcab6314"
>
>  SRCREV =3D "87cd0530f438372dda3c70bb491a6fd19f09acc2"
> -PV .=3D "+git${SRCPV}"
> +PV .=3D "+git"
>
>  SRC_URI =3D "git://github.com/LibVNC/x11vnc;branch=3Dmaster;protocol=3Dh=
ttps \
>             file://starting-fix.patch \
> diff --git a/meta-oe/recipes-multimedia/faad2/faad2_2.11.1.bb b/meta-oe/r=
ecipes-multimedia/faad2/faad2_2.11.1.bb
> index 76e8f72c4f..bec9b75ebd 100644
> --- a/meta-oe/recipes-multimedia/faad2/faad2_2.11.1.bb
> +++ b/meta-oe/recipes-multimedia/faad2/faad2_2.11.1.bb
> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D381c8cbe277a7b=
c1ee2ae6083a04c958"
>
>  LICENSE_FLAGS =3D "commercial"
>
> -PV .=3D "+git${SRCPV}"
> +PV .=3D "+git"
>
>  SRC_URI =3D "git://github.com/knik0/faad2.git;branch=3Dmaster;protocol=
=3Dhttps"
>  SRCREV =3D "216f00e8ddba6f2c64caf481a04f1ddd78b93e78"
> diff --git a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.26.1.bb b/me=
ta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.26.1.bb
> index 594b51b439..52759ef18e 100644
> --- a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.26.1.bb
> +++ b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.26.1.bb
> @@ -32,7 +32,7 @@ SRC_URI =3D "\
>
>  SRCREV =3D "4aee01a027923cab1e40969f56f8ba58d3e6c0d1"
>
> -PV .=3D "+git${SRCPV}"
> +PV .=3D "+git"
>
>  S =3D "${WORKDIR}/git"
>
> diff --git a/meta-oe/recipes-support/ace-cloud-editor/ace-cloud-editor_gi=
t.bb b/meta-oe/recipes-support/ace-cloud-editor/ace-cloud-editor_git.bb
> index 746d4182a9..6d64ab71bf 100644
> --- a/meta-oe/recipes-support/ace-cloud-editor/ace-cloud-editor_git.bb
> +++ b/meta-oe/recipes-support/ace-cloud-editor/ace-cloud-editor_git.bb
> @@ -6,7 +6,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D794d11c5219c59=
c9efa2487c2b4066b2"
>
>  SRC_URI =3D "git://github.com/ajaxorg/ace-builds.git;protocol=3Dhttps;br=
anch=3Dmaster"
>
> -PV =3D "02.07.17+git${SRCPV}"
> +PV =3D "02.07.17+git"
>  SRCREV =3D "812e2c56aed246931a667f16c28b096e34597016"
>
>  FILES:${PN} =3D "${datadir}/ace-builds"
> diff --git a/meta-oe/recipes-support/cli11/cli11_2.3.2.bb b/meta-oe/recip=
es-support/cli11/cli11_2.3.2.bb
> index 7c6b2547cb..ef3c951bbf 100644
> --- a/meta-oe/recipes-support/cli11/cli11_2.3.2.bb
> +++ b/meta-oe/recipes-support/cli11/cli11_2.3.2.bb
> @@ -4,7 +4,7 @@ HOMEPAGE =3D "https://github.com/CLIUtils/CLI11"
>  LICENSE =3D "BSD-3-Clause"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dafb20fe5f67e21074b10b864d9563=
c11"
>  SRCREV =3D "291c58789c031208f08f4f261a858b5b7083e8e2"
> -PV .=3D "+git${SRCPV}"
> +PV .=3D "+git"
>
>  SRC_URI +=3D "gitsm://github.com/CLIUtils/CLI11;branch=3Dmain;protocol=
=3Dhttps \
>              https://github.com/philsquared/Catch/releases/download/v2.13=
.7/catch.hpp \
> diff --git a/meta-oe/recipes-support/edid-decode/edid-decode_git.bb b/met=
a-oe/recipes-support/edid-decode/edid-decode_git.bb
> index 48b52eefca..bb8c9de71d 100644
> --- a/meta-oe/recipes-support/edid-decode/edid-decode_git.bb
> +++ b/meta-oe/recipes-support/edid-decode/edid-decode_git.bb
> @@ -8,7 +8,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D2ef696d66c1561=
39232201f223c22592"
>
>  SRC_URI=3D "git://git.linuxtv.org/edid-decode.git;protocol=3Dhttps;branc=
h=3Dmaster"
>  SRCREV =3D "5920bf2a756b2f748c49ff6a08b9f421026473c5"
> -PV =3D "0.0+git${SRCPV}"
> +PV =3D "0.0+git"
>  S =3D "${WORKDIR}/git"
>
>  do_install() {
> diff --git a/meta-oe/recipes-support/evemu-tools/evemu-tools_git.bb b/met=
a-oe/recipes-support/evemu-tools/evemu-tools_git.bb
> index 4501b082de..b8cd1f620a 100644
> --- a/meta-oe/recipes-support/evemu-tools/evemu-tools_git.bb
> +++ b/meta-oe/recipes-support/evemu-tools/evemu-tools_git.bb
> @@ -11,7 +11,7 @@ SRCREV =3D "86a5627dbeac8d9d9bc34326a758d6a477e876e4"
>  SRC_URI =3D "git://git@gitlab.freedesktop.org/libevdev/evemu.git;protoco=
l=3Dhttps;branch=3Dmaster"
>
>  S =3D "${WORKDIR}/git"
> -PV =3D "gitr${SRCPV}"
> +PV =3D "gitr"
>
>  inherit autotools pkgconfig
>
> diff --git a/meta-oe/recipes-support/function2/function2_4.2.4.bb b/meta-=
oe/recipes-support/function2/function2_4.2.4.bb
> index 2748b84f7c..98d05f6e25 100644
> --- a/meta-oe/recipes-support/function2/function2_4.2.4.bb
> +++ b/meta-oe/recipes-support/function2/function2_4.2.4.bb
> @@ -4,7 +4,7 @@ HOMEPAGE =3D "https://naios.github.io/function2"
>  LICENSE =3D "BSL-1.0"
>  LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3De4224ccaecb14d942c71d31be=
f20d78c"
>  SRCREV =3D "a354bd093d2b6e50c9325dbce84d20b4e77aabc6"
> -PV .=3D "+git${SRCPV}"
> +PV .=3D "+git"
>
>  SRC_URI +=3D "gitsm://github.com/Naios/function2;branch=3Dmaster;protoco=
l=3Dhttps"
>
> diff --git a/meta-oe/recipes-support/hunspell/hunspell-dictionaries.bb b/=
meta-oe/recipes-support/hunspell/hunspell-dictionaries.bb
> index 047acf28db..0ec426afb9 100644
> --- a/meta-oe/recipes-support/hunspell/hunspell-dictionaries.bb
> +++ b/meta-oe/recipes-support/hunspell/hunspell-dictionaries.bb
> @@ -133,7 +133,7 @@ LIC_FILES_CHKSUM =3D " \
>
>  RDEPENDS:${PN} =3D "hunspell"
>
> -PV =3D "0.0.0+git${SRCPV}"
> +PV =3D "0.0.0+git"
>  SRCREV =3D "820a65e539e34a3a8c2a855d2450b84745c624ee"
>  SRC_URI =3D "git://github.com/wooorm/dictionaries.git;branch=3Dmaster;pr=
otocol=3Dhttps"
>
> diff --git a/meta-oe/recipes-support/idevicerestore/idevicerestore_git.bb=
 b/meta-oe/recipes-support/idevicerestore/idevicerestore_git.bb
> index 3dbd8db63f..8218b08084 100644
> --- a/meta-oe/recipes-support/idevicerestore/idevicerestore_git.bb
> +++ b/meta-oe/recipes-support/idevicerestore/idevicerestore_git.bb
> @@ -8,7 +8,7 @@ HOMEPAGE =3D "http://www.libimobiledevice.org/"
>
>  DEPENDS =3D "libirecovery libimobiledevice libzip curl libimobiledevice-=
glue openssl"
>
> -PV =3D "1.0.1+git${SRCPV}"
> +PV =3D "1.0.1+git"
>
>  SRCREV =3D "ecae6c6e8ca6b6bad080a1c73f10ffd0e67d75a7"
>  SRC_URI =3D "git://github.com/libimobiledevice/idevicerestore;protocol=
=3Dhttps;branch=3Dmaster"
> diff --git a/meta-oe/recipes-support/iksemel/iksemel_1.5.bb b/meta-oe/rec=
ipes-support/iksemel/iksemel_1.5.bb
> index e01c0897bb..017e7d26a6 100644
> --- a/meta-oe/recipes-support/iksemel/iksemel_1.5.bb
> +++ b/meta-oe/recipes-support/iksemel/iksemel_1.5.bb
> @@ -5,7 +5,7 @@ LICENSE =3D "LGPL-2.1-only"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd8045f3b8f929c1cb29a1e3fd737b=
499"
>
>  SRCREV =3D "978b733462e41efd5db72bc9974cb3b0d1d5f6fa"
> -PV =3D "1.5+git${SRCPV}"
> +PV =3D "1.5+git"
>
>  SRC_URI =3D "git://github.com/meduketto/iksemel.git;protocol=3Dhttps;bra=
nch=3Dmaster \
>             file://fix-configure-option-parsing.patch \
> diff --git a/meta-oe/recipes-support/iniparser/iniparser_4.1.bb b/meta-oe=
/recipes-support/iniparser/iniparser_4.1.bb
> index 5e42cdcb06..c80668d279 100644
> --- a/meta-oe/recipes-support/iniparser/iniparser_4.1.bb
> +++ b/meta-oe/recipes-support/iniparser/iniparser_4.1.bb
> @@ -6,7 +6,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3De02baf71c76e06=
50e667d7da133379ac"
>
>  DEPENDS =3D "doxygen-native"
>
> -PV .=3D "+git${SRCPV}"
> +PV .=3D "+git"
>
>  SRC_URI =3D "git://github.com/ndevilla/iniparser.git;protocol=3Dhttps;br=
anch=3Dmaster \
>             file://0001-iniparser.pc-Make-libpath-a-variable.patch \
> diff --git a/meta-oe/recipes-support/libb64/libb64_2.0.0.1.bb b/meta-oe/r=
ecipes-support/libb64/libb64_2.0.0.1.bb
> index 6a1e7b75e1..e0683b177b 100644
> --- a/meta-oe/recipes-support/libb64/libb64_2.0.0.1.bb
> +++ b/meta-oe/recipes-support/libb64/libb64_2.0.0.1.bb
> @@ -6,7 +6,7 @@ HOMEPAGE =3D "https://github.com/libb64"
>  LICENSE =3D "PD"
>  LIC_FILES_CHKSUM =3D "file://LICENSE.md;md5=3D81296a564fa0621472714aae7c=
763d96"
>
> -PV .=3D "+2.0.0.2+git${SRCPV}"
> +PV .=3D "+2.0.0.2+git"
>  SRCREV =3D "ce864b17ea0e24a91e77c7dd3eb2d1ac4175b3f0"
>
>  SRC_URI =3D "git://github.com/libb64/libb64;protocol=3Dhttps;branch=3Dma=
ster \
> diff --git a/meta-oe/recipes-support/libcereal/libcereal_1.3.2.bb b/meta-=
oe/recipes-support/libcereal/libcereal_1.3.2.bb
> index c5f26ecb4e..e100265f7d 100644
> --- a/meta-oe/recipes-support/libcereal/libcereal_1.3.2.bb
> +++ b/meta-oe/recipes-support/libcereal/libcereal_1.3.2.bb
> @@ -16,7 +16,7 @@ DEPENDS =3D " ${@bb.utils.contains('DISTRO_FEATURES', '=
ptest', 'boost', '', d)} "
>
>  PROVIDES +=3D "${PN}-dev"
>
> -PV .=3D "+git${SRCPV}"
> +PV .=3D "+git"
>  SRCREV =3D "ebef1e929807629befafbb2918ea1a08c7194554"
>  SRC_URI =3D "git://github.com/USCiLab/cereal.git;branch=3Dmaster;protoco=
l=3Dhttps \
>             file://0001-sandbox-Do-not-use-int8_t-in-std-uniform_int_dist=
rib.patch \
> diff --git a/meta-oe/recipes-support/libcyusbserial/libcyusbserial_git.bb=
 b/meta-oe/recipes-support/libcyusbserial/libcyusbserial_git.bb
> index a69194996b..dd7f457b10 100644
> --- a/meta-oe/recipes-support/libcyusbserial/libcyusbserial_git.bb
> +++ b/meta-oe/recipes-support/libcyusbserial/libcyusbserial_git.bb
> @@ -5,7 +5,7 @@ LICENSE =3D "LGPL-2.1-only"
>  LIC_FILES_CHKSUM =3D "file://COPYING.LESSER.txt;md5=3D4fbd65380cdd255951=
079008b364516c"
>  DEPENDS =3D "libusb udev"
>
> -PV =3D "1.0.0+git${SRCPV}"
> +PV =3D "1.0.0+git"
>
>  SRCREV =3D "655e2d544183d094f0e2d119c7e0c6206a0ddb3f"
>  SRC_URI =3D "git://github.com/cyrozap/${BPN}.git;branch=3Dmaster;protoco=
l=3Dhttps \
> diff --git a/meta-oe/recipes-support/libfann/libfann_git.bb b/meta-oe/rec=
ipes-support/libfann/libfann_git.bb
> index 2f52a0f3bd..40f91ac43d 100644
> --- a/meta-oe/recipes-support/libfann/libfann_git.bb
> +++ b/meta-oe/recipes-support/libfann/libfann_git.bb
> @@ -12,7 +12,7 @@ SRCREV ?=3D "7ec1fc7e5bd734f1d3c89b095e630e83c86b9be1"
>  SRC_URI =3D "git://github.com/libfann/fann.git;branch=3Dmaster;protocol=
=3Dhttps \
>            "
>
> -PV =3D "2.2.0+git${SRCPV}"
> +PV =3D "2.2.0+git"
>
>  S =3D "${WORKDIR}/git"
>
> diff --git a/meta-oe/recipes-support/libusbgx/libusbgx_git.bb b/meta-oe/r=
ecipes-support/libusbgx/libusbgx_git.bb
> index 7998b0c155..f8ebcc7767 100644
> --- a/meta-oe/recipes-support/libusbgx/libusbgx_git.bb
> +++ b/meta-oe/recipes-support/libusbgx/libusbgx_git.bb
> @@ -5,7 +5,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fc=
e4486a80fdaf4a4263 \
>
>  inherit autotools pkgconfig systemd update-rc.d update-alternatives
>
> -PV =3D "0.2.0+git${SRCPV}"
> +PV =3D "0.2.0+git"
>  SRCREV =3D "721e3a1cbd7e2b6361bb439d3959e7403e4f0092"
>  SRCBRANCH =3D "master"
>  SRC_URI =3D " \
> diff --git a/meta-oe/recipes-support/lio-utils/lio-utils_4.1.bb b/meta-oe=
/recipes-support/lio-utils/lio-utils_4.1.bb
> index 48be8dfa96..844e5acf90 100644
> --- a/meta-oe/recipes-support/lio-utils/lio-utils_4.1.bb
> +++ b/meta-oe/recipes-support/lio-utils/lio-utils_4.1.bb
> @@ -4,7 +4,7 @@ HOMEPAGE =3D "http://linux-iscsi.org/index.php/Lio-utils"
>  LICENSE =3D "GPL-2.0-only"
>  LIC_FILES_CHKSUM =3D "file://debian/copyright;md5=3Dc3ea231a32635cbb5deb=
edf3e88aa3df"
>
> -PV =3D "4.1+git${SRCPV}"
> +PV =3D "4.1+git"
>
>  SRC_URI =3D "git://github.com/Datera/lio-utils.git;branch=3Dmaster;proto=
col=3Dhttps \
>             file://0001-Makefiles-Respect-environment-variables-and-add-L=
DFL.patch \
> diff --git a/meta-oe/recipes-support/mcelog/mce-test_git.bb b/meta-oe/rec=
ipes-support/mcelog/mce-test_git.bb
> index fd302db897..05e98e86ed 100644
> --- a/meta-oe/recipes-support/mcelog/mce-test_git.bb
> +++ b/meta-oe/recipes-support/mcelog/mce-test_git.bb
> @@ -15,7 +15,7 @@ SRC_URI =3D "git://git.kernel.org/pub/scm/utils/cpu/mce=
/mce-test.git;protocol=3Dgit;
>             file://0001-gcov_merge.py-scov_merge.py-switch-to-python3.pat=
ch \
>            "
>  SRCREV =3D "025014dedca39d2b8a57a82e52286e72e157d73a"
> -PV =3D "20222810+git${SRCPV}"
> +PV =3D "20222810+git"
>
>  RDEPENDS:${PN} =3D "mcelog mce-inject dialog bash"
>
> diff --git a/meta-oe/recipes-support/ne10/ne10_1.2.1.bb b/meta-oe/recipes=
-support/ne10/ne10_1.2.1.bb
> index 5193df3174..21ef9fdc3b 100644
> --- a/meta-oe/recipes-support/ne10/ne10_1.2.1.bb
> +++ b/meta-oe/recipes-support/ne10/ne10_1.2.1.bb
> @@ -11,7 +11,7 @@ SRC_URI =3D "git://github.com/projectNe10/Ne10.git;bran=
ch=3Dmaster;protocol=3Dhttps \
>  SRCREV =3D "18c4c982a595dad069cd8df4932aefb1d257591f"
>
>  S =3D "${WORKDIR}/git"
> -PV .=3D "gitr+${SRCPV}"
> +PV .=3D "gitr+"
>
>  inherit cmake
>
> diff --git a/meta-oe/recipes-support/picocom/picocom_git.bb b/meta-oe/rec=
ipes-support/picocom/picocom_git.bb
> index 4ec256bb99..cc0d88faca 100644
> --- a/meta-oe/recipes-support/picocom/picocom_git.bb
> +++ b/meta-oe/recipes-support/picocom/picocom_git.bb
> @@ -5,7 +5,7 @@ HOMEPAGE =3D "https://gitlab.com/wsakernel/picocom"
>  LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D3000e4830620e310fe65c0eb6=
9df9e8a"
>
>  BASEPV =3D "2023-04"
> -PV =3D "${BASEPV}+git${SRCPV}"
> +PV =3D "${BASEPV}+git"
>
>  SRCREV =3D "12537df0314767d5af35bddddbbca3694e6a0342"
>
> diff --git a/meta-oe/recipes-support/pidgin/icyque_git.bb b/meta-oe/recip=
es-support/pidgin/icyque_git.bb
> index fe75415de2..76ed26e88e 100644
> --- a/meta-oe/recipes-support/pidgin/icyque_git.bb
> +++ b/meta-oe/recipes-support/pidgin/icyque_git.bb
> @@ -5,7 +5,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D1ebbd3e34237af=
26da5dc08a4e440464"
>
>  DEPENDS =3D "pidgin json-glib"
>
> -PV =3D "0.1+gitr${SRCPV}"
> +PV =3D "0.1+gitr"
>
>  inherit pkgconfig
>
> diff --git a/meta-oe/recipes-support/pidgin/purple-skypeweb_git.bb b/meta=
-oe/recipes-support/pidgin/purple-skypeweb_git.bb
> index 96b97b6744..1981f1ee9c 100644
> --- a/meta-oe/recipes-support/pidgin/purple-skypeweb_git.bb
> +++ b/meta-oe/recipes-support/pidgin/purple-skypeweb_git.bb
> @@ -11,7 +11,7 @@ SRC_URI =3D "git://github.com/EionRobb/skype4pidgin;bra=
nch=3Dmaster;protocol=3Dhttps"
>  SRCREV =3D "b226d1c457d73900ae89b8a7469247fbe33677a6"
>
>  S =3D "${WORKDIR}/git"
> -PV =3D "1.7+git${SRCPV}"
> +PV =3D "1.7+git"
>
>  do_compile() {
>      oe_runmake -C skypeweb;
> diff --git a/meta-oe/recipes-support/portaudio/portaudio-v19_19.7.0.bb b/=
meta-oe/recipes-support/portaudio/portaudio-v19_19.7.0.bb
> index c49a2599ac..2bf4d0a449 100644
> --- a/meta-oe/recipes-support/portaudio/portaudio-v19_19.7.0.bb
> +++ b/meta-oe/recipes-support/portaudio/portaudio-v19_19.7.0.bb
> @@ -3,7 +3,7 @@ SECTION =3D "libs/multimedia"
>  LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D26107732c2ab637c5710446fc=
faf02df"
>
> -PV .=3D "+git${SRCPV}"
> +PV .=3D "+git"
>
>  SRC_URI =3D "git://github.com/PortAudio/portaudio.git;branch=3Dmaster;pr=
otocol=3Dhttps"
>  SRCREV =3D "929e2e8f7af281c5eb4fa07758930d542ec43d97"
> diff --git a/meta-oe/recipes-support/serial-utils/pty-forward-native.bb b=
/meta-oe/recipes-support/serial-utils/pty-forward-native.bb
> index 2fe61e6f59..41a93f3249 100644
> --- a/meta-oe/recipes-support/serial-utils/pty-forward-native.bb
> +++ b/meta-oe/recipes-support/serial-utils/pty-forward-native.bb
> @@ -3,7 +3,7 @@ LICENSE =3D "GPL-2.0-only"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Debb5c50ab7cab4baeffba14977030=
c07"
>  SECTION =3D "console/network"
>  SRCREV =3D "00dbec2636ae0385ad028587e20e446272ff97ec"
> -PV =3D "1.1+gitr${SRCPV}"
> +PV =3D "1.1+gitr"
>
>  SRC_URI =3D "git://github.com/freesmartphone/cornucopia.git;protocol=3Dh=
ttps;branch=3Dmaster"
>  S =3D "${WORKDIR}/git/tools/serial_forward"
> diff --git a/meta-oe/recipes-support/serial-utils/serial-forward_git.bb b=
/meta-oe/recipes-support/serial-utils/serial-forward_git.bb
> index 84bb25e4cd..751bdffead 100644
> --- a/meta-oe/recipes-support/serial-utils/serial-forward_git.bb
> +++ b/meta-oe/recipes-support/serial-utils/serial-forward_git.bb
> @@ -3,7 +3,7 @@ LICENSE =3D "GPL-2.0-only"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Debb5c50ab7cab4baeffba14977030=
c07"
>  SECTION =3D "console/devel"
>  SRCREV =3D "07c6fdede0870edc37a8d51d033b6e7e29aa7c91"
> -PV =3D "1.1+gitr${SRCPV}"
> +PV =3D "1.1+gitr"
>
>  SRC_URI =3D "git://github.com/freesmartphone/cornucopia.git;branch=3Dmas=
ter;protocol=3Dhttps \
>             file://0001-serial_forward-Disable-default-static-linking.pat=
ch;striplevel=3D3 \
> diff --git a/meta-oe/recipes-support/synergy/synergy_git.bb b/meta-oe/rec=
ipes-support/synergy/synergy_git.bb
> index f2e7a91618..fb767942fe 100644
> --- a/meta-oe/recipes-support/synergy/synergy_git.bb
> +++ b/meta-oe/recipes-support/synergy/synergy_git.bb
> @@ -13,7 +13,7 @@ SRC_URI =3D "git://github.com/symless/synergy-core;prot=
ocol=3Dhttps;nobranch=3D1"
>
>  # Version 1.10.1-stable
>  SRCREV ?=3D "1b4c076127687aceac931d269e898beaac1cad9f"
> -PV =3D "1.10.1+git${SRCPV}"
> +PV =3D "1.10.1+git"
>
>  S =3D "${WORKDIR}/git"
>
> diff --git a/meta-oe/recipes-support/utouch/utouch-evemu_git.bb b/meta-oe=
/recipes-support/utouch/utouch-evemu_git.bb
> index a6d09f69e9..bd69dbb11c 100644
> --- a/meta-oe/recipes-support/utouch/utouch-evemu_git.bb
> +++ b/meta-oe/recipes-support/utouch/utouch-evemu_git.bb
> @@ -12,7 +12,7 @@ SRC_URI =3D "git://bitmath.org/git/evemu.git;protocol=
=3Dhttp;branch=3Dmaster \
>             "
>  SRCREV =3D "9752b50e922572e4cd214ac45ed95e4ee410fe24"
>
> -PV =3D "1.0.6+git${SRCPV}"
> +PV =3D "1.0.6+git"
>
>  S =3D "${WORKDIR}/git"
>
> diff --git a/meta-oe/recipes-support/utouch/utouch-frame_git.bb b/meta-oe=
/recipes-support/utouch/utouch-frame_git.bb
> index 3b1cf60c27..ddd27a7e30 100644
> --- a/meta-oe/recipes-support/utouch/utouch-frame_git.bb
> +++ b/meta-oe/recipes-support/utouch/utouch-frame_git.bb
> @@ -16,6 +16,6 @@ SRC_URI =3D "git://bitmath.org/git/frame.git;protocol=
=3Dhttp;branch=3Dmaster \
>             "
>  SRCREV =3D "95363d5a1f7394d71144bf3b408ef4e6db4350fc"
>
> -PV =3D "1.1.2+git${SRCPV}"
> +PV =3D "1.1.2+git"
>
>  S =3D "${WORKDIR}/git"
> diff --git a/meta-oe/recipes-support/utouch/utouch-mtview_git.bb b/meta-o=
e/recipes-support/utouch/utouch-mtview_git.bb
> index e348e39bba..d964d7f263 100644
> --- a/meta-oe/recipes-support/utouch/utouch-mtview_git.bb
> +++ b/meta-oe/recipes-support/utouch/utouch-mtview_git.bb
> @@ -14,6 +14,6 @@ SRCREV =3D "ad437c38dc111cf3990a03abf14efe1b5d89604b"
>
>  DEPENDS +=3D "mtdev utouch-frame utouch-evemu libx11"
>
> -PV =3D "1.1.7+git${SRCPV}"
> +PV =3D "1.1.7+git"
>
>  S =3D "${WORKDIR}/git"
> diff --git a/meta-oe/recipes-support/zbar/zbar_git.bb b/meta-oe/recipes-s=
upport/zbar/zbar_git.bb
> index 3be1f27a6f..975779cd18 100644
> --- a/meta-oe/recipes-support/zbar/zbar_git.bb
> +++ b/meta-oe/recipes-support/zbar/zbar_git.bb
> @@ -16,7 +16,7 @@ SRC_URI =3D "git://github.com/mchehab/zbar.git;branch=
=3Dmaster;protocol=3Dhttps \
>  SRCREV =3D "89e7900d85dd54ef351a7ed582aec6a5a5d7fa37"
>
>  S =3D "${WORKDIR}/git"
> -PV =3D "0.23.1+git${SRCPV}"
> +PV =3D "0.23.1+git"
>
>  DEPENDS +=3D "xmlto-native"
>
> diff --git a/meta-oe/recipes-test/cmocka/cmocka_1.1.7.bb b/meta-oe/recipe=
s-test/cmocka/cmocka_1.1.7.bb
> index 7461fcc4d7..6c94e9e275 100644
> --- a/meta-oe/recipes-test/cmocka/cmocka_1.1.7.bb
> +++ b/meta-oe/recipes-test/cmocka/cmocka_1.1.7.bb
> @@ -7,7 +7,7 @@ LICENSE =3D "Apache-2.0"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D3b83ef96387f14655fc854ddc3c6b=
d57"
>
>  SRCREV =3D "a01cc69ee9536f90e57c61a198f2d1944d3d4313"
> -PV .=3D "+git${SRCPV}"
> +PV .=3D "+git"
>  SRC_URI =3D "git://git.cryptomilk.org/projects/cmocka.git;protocol=3Dhtt=
ps;branch=3Dstable-1.1 \
>             file://0001-include-Check-for-previous-declaration-of-uintptr=
_t.patch \
>             file://run-ptest \
> diff --git a/meta-oe/recipes-test/linux-serial-test/linux-serial-test_git=
.bb b/meta-oe/recipes-test/linux-serial-test/linux-serial-test_git.bb
> index 7abdcb2523..e909676abc 100644
> --- a/meta-oe/recipes-test/linux-serial-test/linux-serial-test_git.bb
> +++ b/meta-oe/recipes-test/linux-serial-test/linux-serial-test_git.bb
> @@ -5,7 +5,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSES/MIT;md5=3D544799d0b=
492f119fa04641d1b8868ed"
>
>  SRC_URI =3D "git://github.com/cbrake/linux-serial-test.git;protocol=3Dht=
tps;branch=3Dmaster"
>
> -PV =3D "0+git${SRCPV}"
> +PV =3D "0+git"
>  SRCREV =3D "2ee61484167eab846f7b7c565284d7c350d738d3"
>
>  S =3D "${WORKDIR}/git"
> diff --git a/meta-python/recipes-devtools/gyp/gyp_git.bb b/meta-python/re=
cipes-devtools/gyp/gyp_git.bb
> index 0f94a4476d..6ac4228a8b 100644
> --- a/meta-python/recipes-devtools/gyp/gyp_git.bb
> +++ b/meta-python/recipes-devtools/gyp/gyp_git.bb
> @@ -9,7 +9,7 @@ SRC_URI =3D "git://chromium.googlesource.com/external/gyp=
;protocol=3Dhttps;branch=3Dma
>  SRCREV =3D "a03d7413becefc8d55c8aa3df58b55b9bd0e9052"
>
>  S =3D "${WORKDIR}/git"
> -PV =3D "0.1+git${SRCPV}"
> +PV =3D "0.1+git"
>
>  inherit setuptools3
>
> diff --git a/meta-webserver/recipes-httpd/apache-mod/apache-websocket_git=
.bb b/meta-webserver/recipes-httpd/apache-mod/apache-websocket_git.bb
> index 040788609e..4dbf595c19 100644
> --- a/meta-webserver/recipes-httpd/apache-mod/apache-websocket_git.bb
> +++ b/meta-webserver/recipes-httpd/apache-mod/apache-websocket_git.bb
> @@ -15,7 +15,7 @@ SRC_URI =3D "git://github.com/jchampio/apache-websocket=
.git;branch=3Dmaster;protocol
>
>  SRCREV =3D "0ee34c77fc78ff08fd548706300b80a7bc7874e4"
>
> -PV =3D "0.1.2+git${SRCPV}"
> +PV =3D "0.1.2+git"
>
>  S =3D "${WORKDIR}/git"
>
> diff --git a/meta-webserver/recipes-httpd/cherokee/cherokee_git.bb b/meta=
-webserver/recipes-httpd/cherokee/cherokee_git.bb
> index 3dc4ca8bbb..7763a31881 100644
> --- a/meta-webserver/recipes-httpd/cherokee/cherokee_git.bb
> +++ b/meta-webserver/recipes-httpd/cherokee/cherokee_git.bb
> @@ -8,7 +8,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9ba3=
6caa9b7df079bae19f"
>  DEPENDS =3D "unzip-native libpcre openssl mysql5 ${@bb.utils.contains('D=
ISTRO_FEATURES', 'pam', 'libpam', '', d)}"
>
>  SRCREV =3D "9a75e65b876bcc376cb6b379dca1f7ce4a055c59"
> -PV =3D "1.2.104+git${SRCPV}"
> +PV =3D "1.2.104+git"
>  SRC_URI =3D "git://github.com/cherokee/webserver;branch=3Dmaster;protoco=
l=3Dhttps \
>             file://cherokee.init \
>             file://cherokee.service \
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#108628): https://lists.openembedded.org/g/openembedde=
d-devel/message/108628
> Mute This Topic: https://lists.openembedded.org/mt/104197308/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

