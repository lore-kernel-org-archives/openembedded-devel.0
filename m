Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1F6FC48297
	for <webhook@archiver.kernel.org>; Tue,  6 Feb 2024 18:02:18 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web11.28456.1707242528360666450
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Feb 2024 10:02:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fqOVpWgA;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-40fb3b5893eso48063535e9.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 06 Feb 2024 10:02:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707242527; x=1707847327; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vmqHfoic3HGu0P3vnVGhJ4d0WavyK2N1iwwPkqp0IMo=;
        b=fqOVpWgAFwMIQRA7miDUnOYXulVHT8l4ev0RbdRaQEm3001sKOFlC3bTEQuAquuJQD
         Qjcmf59ffn/GtQHDTRbxoIN1dIY7rK9GNn3OQC1luQaYBD6YeMvGULFzhLd8jpLhI7l3
         P4Tsw2uLsJoTwNMW12qSvpawACh7LbfgNxk3jEjXXBt+yFOsZefZ0t9O6mdaH3qBEIkN
         Wrlgmi41QFHga4csD2cLngXaRUSxpz3GB9qg9M+eCaE00T+RBZ2MkvZnHNNYJH1J2RRK
         /9Ys63/zReojyX+mwlsn4oo29on4GqFCCRbqtCEXoTQXsdhKgHegzGmbirdjqN/2KY5m
         f9WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707242527; x=1707847327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vmqHfoic3HGu0P3vnVGhJ4d0WavyK2N1iwwPkqp0IMo=;
        b=dOvcGQy77cuebRIzGsHEMMQ4VEjBJ+gmcbMxitwLQZA/G564a3IKTfVq/jaQrG9Lm6
         UB9r2WsHK+H1qhded65VqMHPl9OpA83IKDqUD/4uv7Qqr7mr6W5b1q9eFclTN2IkE+21
         9bvTCgSA/KZCojnUCST3fevvrEUV0UsTVIFtXZHBq0O+HvM1lfvbbVVj6ZDSyBC9N0Ru
         Q2JzPl9AZ2QQEfY87gs1FjtHZmsQALw2dbTVVkndIbb9bRxTEzoWtnfm1DR7Pa5tE+17
         n30KRx0HpuzEzK2u3G0xpLSdbsMtYcd32ZXo2WekkZCzh/r+Xe1VIKlcw3VfyfArvMMS
         ya0Q==
X-Gm-Message-State: AOJu0YyQPmnwroNdsvvtmaMKE9NnD0nDoYzD55q0sr14gEPOcoWjZgs/
	ft05hOfPaj7Y2Acdgd/mwPx/uWIE0zMSQhx7MSRdmRXtkXYarP1CrWlSFlS3MyRJ9/r/65bJglD
	f52Ijzq8w9ko/ssES8HFfXY2phiNTTyVPxUc=
X-Google-Smtp-Source: AGHT+IGG3W5ORjHFrZRepD4mPhfEz7CsqLMghVPSL0ILSIgOQXzATt7Q81uEccuQXqin2BEdr6tGylBwYxalCbcKQZ4=
X-Received: by 2002:a5d:4a45:0:b0:33a:e6dc:2e98 with SMTP id
 v5-20020a5d4a45000000b0033ae6dc2e98mr2047911wrs.5.1707242525624; Tue, 06 Feb
 2024 10:02:05 -0800 (PST)
MIME-Version: 1.0
References: <20240206132812.1362456-1-martin.jansa@gmail.com> <CAMKF1soStxMSTiAOkGsWkjsjt91dajuA=v-=AN0fxay3UeAdhA@mail.gmail.com>
In-Reply-To: <CAMKF1soStxMSTiAOkGsWkjsjt91dajuA=v-=AN0fxay3UeAdhA@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 6 Feb 2024 19:01:51 +0100
Message-ID: <CA+chaQenrj_a1-q_kmMaxH9bc-JZkeVByke=8+eGJWR2UABVvA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][RFC][PATCH 1/5] recipes: drop ${SRCPV} usage
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000490fc70610ba6049"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Feb 2024 18:02:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108637

--000000000000490fc70610ba6049
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

rebased and pushed as
https://git.openembedded.org/meta-openembedded-contrib/log/?h=3Djansa/maste=
r-next

On Tue, Feb 6, 2024 at 6:20=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrote:

> Thanks for this cleanup. Can you rebase it on master-next and resend ?
> it will make my life easier
>
> Applying: recipes: drop ${SRCPV} usage
> Patch failed at 0001 recipes: drop ${SRCPV} usage
> ...
> error: meta-oe/recipes-extended/sanlock/sanlock_3.9.0.bb: does not
> exist in index
>
> On Tue, Feb 6, 2024 at 5:28=E2=80=AFAM Martin Jansa <martin.jansa@gmail.c=
om>
> wrote:
> >
> > * Drop SRCPV similarly like oe-core did in:
> >
> https://git.openembedded.org/openembedded-core/commit/?h=3Dnanbield&id=3D=
843f82a246a535c353e08072f252d1dc78217872
> >
> > * SRCPV is deferred now from PV to PKGV since:
> >
> https://git.openembedded.org/openembedded-core/commit/?h=3Dnanbield&id=3D=
a8e7b0f932b9ea69b3a218fca18041676c65aba0
> >
> > Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> > ---
> >  meta-filesystems/recipes-filesystems/yaffs2/yaffs2-utils_git.bb | 2 +-
> >  meta-filesystems/recipes-utils/aufs-util/aufs-util_git.bb       | 2 +-
> >  meta-filesystems/recipes-utils/overlayfs/overlayfs-tools_git.bb | 2 +-
> >  meta-gnome/recipes-gnome/devilspie/devilspie2_0.44.bb           | 2 +-
> >  meta-gnome/recipes-support/keybinder/keybinder_3.0.bb           | 2 +-
> >  meta-initramfs/recipes-bsp/kexecboot/kexecboot_git.bb           | 2 +-
> >  meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_git.bb    | 2 +-
> >  meta-multimedia/recipes-dvb/oscam/oscam_svn.bb                  | 2 +-
> >  meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb          | 2 +-
> >  meta-multimedia/recipes-multimedia/bluealsa/bluealsa_git.bb     | 2 +-
> >  .../recipes-multimedia/dleyna/dleyna-server_0.6.0.bb            | 2 +-
> >  meta-multimedia/recipes-multimedia/libsquish/libsquish_git.bb   | 2 +-
> >  .../recipes-multimedia/musicbrainz/libmusicbrainz_git.bb        | 2 +-
> >  .../recipes-support/gst-instruments/gst-instruments_git.bb      | 2 +-
> >  meta-networking/recipes-connectivity/bearssl/bearssl_0.6.bb     | 2 +-
> >  meta-networking/recipes-connectivity/bluepy/bluepy_git.bb       | 2 +-
> >  .../recipes-connectivity/openthread/ot-br-posix_git.bb          | 2 +-
> >  .../recipes-connectivity/openthread/ot-daemon_git.bb            | 2 +-
> >  meta-networking/recipes-connectivity/openthread/wpantund_git.bb | 2 +-
> >  meta-networking/recipes-connectivity/relayd/relayd_git.bb       | 2 +-
> >  meta-networking/recipes-filter/ulogd2/ulogd2_2.0.8.bb           | 2 +-
> >  meta-networking/recipes-protocols/openflow/openflow_git.bb      | 2 +-
> >  meta-networking/recipes-protocols/openlldp/openlldp_1.1.0.bb    | 2 +-
> >  meta-networking/recipes-support/arptables/arptables_git.bb      | 2 +-
> >  meta-networking/recipes-support/celt051/celt051_git.bb          | 2 +-
> >  .../recipes-support/lksctp-tools/lksctp-tools_1.0.19.bb         | 2 +-
> >  .../recipes-support/lowpan-tools/lowpan-tools_git.bb            | 2 +-
> >  meta-networking/recipes-support/netcf/netcf_0.2.8.bb            | 2 +-
> >  meta-networking/recipes-support/netperf/netperf_git.bb          | 2 +-
> >  meta-networking/recipes-support/ntimed/ntimed_git.bb            | 2 +-
> >  meta-networking/recipes-support/phytool/phytool.bb              | 2 +-
> >  .../dynamic-layers/meta-python/recipes-bsp/rwmem/rwmem_1.2.bb   | 2 +-
> >  .../meta-python/recipes-extended/lcdproc/lcdproc_git.bb         | 2 +-
> >  meta-oe/recipes-benchmark/cpuburn/cpuburn-arm_git.bb            | 2 +-
> >  meta-oe/recipes-benchmark/libc-bench/libc-bench_git.bb          | 2 +-
> >  meta-oe/recipes-benchmark/tinymembench/tinymembench_git.bb      | 2 +-
> >  meta-oe/recipes-bsp/edac-utils/edac-utils_git.bb                | 2 +-
> >  meta-oe/recipes-bsp/firmwared/firmwared_git.bb                  | 2 +-
> >  meta-oe/recipes-connectivity/gattlib/gattlib_git.bb             | 2 +-
> >  .../libimobiledevice-glue/libimobiledevice-glue_git.bb          | 2 +-
> >  .../libimobiledevice/libimobiledevice_git.bb                    | 2 +-
> >  meta-oe/recipes-connectivity/libqrtr-glib/libqrtr-glib_git.bb   | 2 +-
> >  meta-oe/recipes-connectivity/rtorrent/rtorrent_git.bb           | 2 +-
> >  meta-oe/recipes-connectivity/usbmuxd/usbmuxd_git.bb             | 2 +-
> >  meta-oe/recipes-core/dbus/dbus-daemon-proxy_git.bb              | 2 +-
> >  meta-oe/recipes-core/glfw/glfw_3.3.8.bb                         | 2 +-
> >  meta-oe/recipes-core/libnfc/libnfc_git.bb                       | 2 +-
> >  meta-oe/recipes-core/mdbus2/mdbus2_git.bb                       | 2 +-
> >  meta-oe/recipes-core/musl-rpmatch/musl-rpmatch_git.bb           | 2 +-
> >  meta-oe/recipes-core/opencl/opencl-clhpp_git.bb                 | 2 +-
> >  meta-oe/recipes-crypto/pkcs11-helper/pkcs11-helper_1.30.0.bb    | 2 +-
> >  meta-oe/recipes-devtools/apitrace/apitrace_11.1.bb              | 2 +-
> >  meta-oe/recipes-devtools/concurrencykit/concurrencykit_git.bb   | 2 +-
> >  meta-oe/recipes-devtools/guider/guider_3.9.8.bb                 | 2 +-
> >  meta-oe/recipes-devtools/libubox/libubox_git.bb                 | 2 +-
> >  meta-oe/recipes-devtools/lshw/lshw_02.20.bb                     | 2 +-
> >  meta-oe/recipes-devtools/ltrace/ltrace_git.bb                   | 2 +-
> >  meta-oe/recipes-devtools/nlohmann-fifo/nlohmann-fifo_git.bb     | 2 +-
> >  meta-oe/recipes-devtools/openocd/openocd_git.bb                 | 2 +-
> >  meta-oe/recipes-devtools/pmtools/pmtools_git.bb                 | 2 +-
> >  meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb             | 2 +-
> >  meta-oe/recipes-devtools/yasm/yasm_git.bb                       | 2 +-
> >  meta-oe/recipes-extended/docopt.cpp/docopt.cpp_git.bb           | 2 +-
> >  meta-oe/recipes-extended/figlet/figlet_git.bb                   | 2 +-
> >  meta-oe/recipes-extended/jpnevulator/jpnevulator_git.bb         | 2 +-
> >  meta-oe/recipes-extended/libbacktrace/libbacktrace_git.bb       | 2 +-
> >  meta-oe/recipes-extended/libimobiledevice/libplist_git.bb       | 2 +-
> >  meta-oe/recipes-extended/libimobiledevice/libusbmuxd_git.bb     | 2 +-
> >  meta-oe/recipes-extended/libuio/libuio_0.2.1.bb                 | 2 +-
> >  meta-oe/recipes-extended/md5deep/md5deep_git.bb                 | 2 +-
> >  meta-oe/recipes-extended/mraa/mraa_git.bb                       | 2 +-
> >  meta-oe/recipes-extended/p8platform/p8platform_git.bb           | 2 +-
> >  meta-oe/recipes-extended/properties-cpp/properties-cpp_git.bb   | 2 +-
> >  meta-oe/recipes-extended/qad/qad_git.bb                         | 2 +-
> >  meta-oe/recipes-extended/qcbor/qcbor_git.bb                     | 2 +-
> >  meta-oe/recipes-extended/sanlock/sanlock_3.9.0.bb               | 2 +-
> >  meta-oe/recipes-extended/socketcan/can-isotp_git.bb             | 2 +-
> >  meta-oe/recipes-extended/tipcutils/tipcutils_git.bb             | 2 +-
> >  meta-oe/recipes-extended/triggerhappy/triggerhappy_git.bb       | 2 +-
> >  meta-oe/recipes-extended/upm/upm_git.bb                         | 2 +-
> >  meta-oe/recipes-extended/zsync/zsync-curl_git.bb                | 2 +-
> >  meta-oe/recipes-graphics/aml/aml_git.bb                         | 2 +-
> >  meta-oe/recipes-graphics/fbida/fbida_git.bb                     | 2 +-
> >  meta-oe/recipes-graphics/glm/glm_0.9.9.8.bb                     | 2 +-
> >  meta-oe/recipes-graphics/openbox/obconf_git.bb                  | 2 +-
> >  .../parallel-deqp-runner/parallel-deqp-runner_git.bb            | 2 +-
> >  meta-oe/recipes-graphics/ttf-fonts/ttf-droid_git.bb             | 2 +-
> >  meta-oe/recipes-graphics/x11vnc/x11vnc_0.9.16.bb                | 2 +-
> >  meta-oe/recipes-multimedia/faad2/faad2_2.11.1.bb                | 2 +-
> >  meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.26.1.bb         | 2 +-
> >  .../recipes-support/ace-cloud-editor/ace-cloud-editor_git.bb    | 2 +-
> >  meta-oe/recipes-support/cli11/cli11_2.3.2.bb                    | 2 +-
> >  meta-oe/recipes-support/edid-decode/edid-decode_git.bb          | 2 +-
> >  meta-oe/recipes-support/evemu-tools/evemu-tools_git.bb          | 2 +-
> >  meta-oe/recipes-support/function2/function2_4.2.4.bb            | 2 +-
> >  meta-oe/recipes-support/hunspell/hunspell-dictionaries.bb       | 2 +-
> >  meta-oe/recipes-support/idevicerestore/idevicerestore_git.bb    | 2 +-
> >  meta-oe/recipes-support/iksemel/iksemel_1.5.bb                  | 2 +-
> >  meta-oe/recipes-support/iniparser/iniparser_4.1.bb              | 2 +-
> >  meta-oe/recipes-support/libb64/libb64_2.0.0.1.bb                | 2 +-
> >  meta-oe/recipes-support/libcereal/libcereal_1.3.2.bb            | 2 +-
> >  meta-oe/recipes-support/libcyusbserial/libcyusbserial_git.bb    | 2 +-
> >  meta-oe/recipes-support/libfann/libfann_git.bb                  | 2 +-
> >  meta-oe/recipes-support/libusbgx/libusbgx_git.bb                | 2 +-
> >  meta-oe/recipes-support/lio-utils/lio-utils_4.1.bb              | 2 +-
> >  meta-oe/recipes-support/mcelog/mce-test_git.bb                  | 2 +-
> >  meta-oe/recipes-support/ne10/ne10_1.2.1.bb                      | 2 +-
> >  meta-oe/recipes-support/picocom/picocom_git.bb                  | 2 +-
> >  meta-oe/recipes-support/pidgin/icyque_git.bb                    | 2 +-
> >  meta-oe/recipes-support/pidgin/purple-skypeweb_git.bb           | 2 +-
> >  meta-oe/recipes-support/portaudio/portaudio-v19_19.7.0.bb       | 2 +-
> >  meta-oe/recipes-support/serial-utils/pty-forward-native.bb      | 2 +-
> >  meta-oe/recipes-support/serial-utils/serial-forward_git.bb      | 2 +-
> >  meta-oe/recipes-support/synergy/synergy_git.bb                  | 2 +-
> >  meta-oe/recipes-support/utouch/utouch-evemu_git.bb              | 2 +-
> >  meta-oe/recipes-support/utouch/utouch-frame_git.bb              | 2 +-
> >  meta-oe/recipes-support/utouch/utouch-mtview_git.bb             | 2 +-
> >  meta-oe/recipes-support/zbar/zbar_git.bb                        | 2 +-
> >  meta-oe/recipes-test/cmocka/cmocka_1.1.7.bb                     | 2 +-
> >  meta-oe/recipes-test/linux-serial-test/linux-serial-test_git.bb | 2 +-
> >  meta-python/recipes-devtools/gyp/gyp_git.bb                     | 2 +-
> >  meta-webserver/recipes-httpd/apache-mod/apache-websocket_git.bb | 2 +-
> >  meta-webserver/recipes-httpd/cherokee/cherokee_git.bb           | 2 +-
> >  123 files changed, 123 insertions(+), 123 deletions(-)
> >
> > diff --git a/meta-filesystems/recipes-filesystems/yaffs2/
> yaffs2-utils_git.bb b/meta-filesystems/recipes-filesystems/yaffs2/
> yaffs2-utils_git.bb
> > index 6bf321e237..7228172b80 100644
> > --- a/meta-filesystems/recipes-filesystems/yaffs2/yaffs2-utils_git.bb
> > +++ b/meta-filesystems/recipes-filesystems/yaffs2/yaffs2-utils_git.bb
> > @@ -9,7 +9,7 @@ LIC_FILES_CHKSUM =3D
> "file://utils/mkyaffs2image.c;beginline=3D11;endline=3D13;md5=3D5f5
> >
> file://utils/mkyaffsimage.c;beginline=3D10;endline=3D12;md5=3D5f5464f9b3e=
981ca574e65b00e438561
> \
> >                      "
> >
> > -PV =3D "0.0+git${SRCPV}"
> > +PV =3D "0.0+git"
> >
> >  DEPENDS =3D "mtd-utils"
> >
> > diff --git a/meta-filesystems/recipes-utils/aufs-util/aufs-util_git.bb
> b/meta-filesystems/recipes-utils/aufs-util/aufs-util_git.bb
> > index fbf7753b02..ad846af470 100644
> > --- a/meta-filesystems/recipes-utils/aufs-util/aufs-util_git.bb
> > +++ b/meta-filesystems/recipes-utils/aufs-util/aufs-util_git.bb
> > @@ -19,7 +19,7 @@ SRC_URI[aufs_type.sha256sum] =3D
> "7ff6566adb9c7a3b6862cdc85a690ab546f1d0bc81ddd595
> >
> >  UPSTREAM_CHECK_COMMITS =3D "1"
> >
> > -PV =3D "4.9+git${SRCPV}"
> > +PV =3D "4.9+git"
> >
> >  S =3D "${WORKDIR}/git"
> >
> > diff --git a/meta-filesystems/recipes-utils/overlayfs/
> overlayfs-tools_git.bb b/meta-filesystems/recipes-utils/overlayfs/
> overlayfs-tools_git.bb
> > index ca2ec9cc4f..47613207af 100644
> > --- a/meta-filesystems/recipes-utils/overlayfs/overlayfs-tools_git.bb
> > +++ b/meta-filesystems/recipes-utils/overlayfs/overlayfs-tools_git.bb
> > @@ -7,7 +7,7 @@ SRC_URI =3D "\
> >      git://
> github.com/kmxz/overlayfs-tools.git;protocol=3Dhttps;branch=3Dmaster \
> >  "
> >
> > -PV =3D "1.0+git${SRCPV}"
> > +PV =3D "1.0+git"
> >  SRCREV =3D "b5e5a829895ac98ccfe4629fbfbd8b819262bd00"
> >
> >  S =3D "${WORKDIR}/git"
> > diff --git a/meta-gnome/recipes-gnome/devilspie/devilspie2_0.44.bb
> b/meta-gnome/recipes-gnome/devilspie/devilspie2_0.44.bb
> > index 01900cce39..90c12efadf 100644
> > --- a/meta-gnome/recipes-gnome/devilspie/devilspie2_0.44.bb
> > +++ b/meta-gnome/recipes-gnome/devilspie/devilspie2_0.44.bb
> > @@ -6,7 +6,7 @@ LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3D00aefaa50aad75c21367df66102d542c \
> >
> >  DEPENDS =3D "gtk+ glib-2.0 libwnck libxinerama lua virtual/libx11"
> >
> > -PV .=3D "+git${SRCPV}"
> > +PV .=3D "+git"
> >
> >  SRCREV =3D "b9d7ad9c09a5fb17a1562ee1d892798c646e9ec9"
> >
> > diff --git a/meta-gnome/recipes-support/keybinder/keybinder_3.0.bb
> b/meta-gnome/recipes-support/keybinder/keybinder_3.0.bb
> > index 278592dc6e..7960009078 100644
> > --- a/meta-gnome/recipes-support/keybinder/keybinder_3.0.bb
> > +++ b/meta-gnome/recipes-support/keybinder/keybinder_3.0.bb
> > @@ -11,7 +11,7 @@ LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3D1f18f9c6d8b4cfcc7d7804a243a4c0b4"
> >  S =3D "${WORKDIR}/git"
> >
> >  SRCREV =3D "736ccef40d39603b8111c8a3a0bca0319bbafdc0"
> > -PV =3D "3.0+git${SRCPV}"
> > +PV =3D "3.0+git"
> >  SRC_URI =3D "git://
> github.com/engla/keybinder.git;branch=3Dkeybinder-3.0;protocol=3Dhttps \
> >  "
> >
> > diff --git a/meta-initramfs/recipes-bsp/kexecboot/kexecboot_git.bb
> b/meta-initramfs/recipes-bsp/kexecboot/kexecboot_git.bb
> > index 62d1effccc..a92c0e8966 100644
> > --- a/meta-initramfs/recipes-bsp/kexecboot/kexecboot_git.bb
> > +++ b/meta-initramfs/recipes-bsp/kexecboot/kexecboot_git.bb
> > @@ -3,7 +3,7 @@ DESCRIPTION =3D "kexecboot is a graphical
> linux-as-bootloader implementation based
> >  HOMEPAGE =3D "https://github.com/kexecboot/kexecboot/wiki"
> >  LICENSE =3D "GPL-2.0-only"
> >  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9ba36caa9b7df079b=
ae19f"
> > -PV =3D "0.6+git${SRCPV}"
> > +PV =3D "0.6+git"
> >  S =3D "${WORKDIR}/git"
> >  SRC_URI =3D "git://
> github.com/kexecboot/kexecboot.git;branch=3Dmaster;protocol=3Dhttps"
> >  SRC_URI:append:libc-klibc =3D "\
> > diff --git a/meta-initramfs/recipes-kernel/kexec/
> kexec-tools-klibc_git.bb b/meta-initramfs/recipes-kernel/kexec/
> kexec-tools-klibc_git.bb
> > index 5c7e84cc99..adfc3ba73a 100644
> > --- a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_git.bb
> > +++ b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_git.bb
> > @@ -5,7 +5,7 @@ SECTION =3D "kernel/userland"
> >  LICENSE =3D "GPL-2.0-only"
> >  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dea5bed2f60d357618ca161ad539=
f7c0a
> \
> >
> file://kexec/kexec.c;beginline=3D1;endline=3D20;md5=3Daf10f6ae4a8715965e6=
48aa687ad3e09"
> > -PV =3D "2.0.18+git${SRCPV}"
> > +PV =3D "2.0.18+git"
> >
> >  DEPENDS =3D "zlib xz"
> >
> > diff --git a/meta-multimedia/recipes-dvb/oscam/oscam_svn.bb
> b/meta-multimedia/recipes-dvb/oscam/oscam_svn.bb
> > index bd2df5d8d6..8fbf9ab2c8 100644
> > --- a/meta-multimedia/recipes-dvb/oscam/oscam_svn.bb
> > +++ b/meta-multimedia/recipes-dvb/oscam/oscam_svn.bb
> > @@ -9,7 +9,7 @@ DEPENDS =3D "libusb1 openssl pcsc-lite"
> >  SRC_URI =3D "svn://
> www.streamboard.tv/svn/oscam;module=3Dtrunk;protocol=3Dhttp \
> >             "
> >  SRCREV =3D "11718"
> > -PV =3D "1.10+${SRCPV}"
> > +PV =3D "1.10+"
> >
> >  S =3D "${WORKDIR}/trunk"
> >
> > diff --git a/meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb
> b/meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb
> > index d64ee96f78..2d79777001 100644
> > --- a/meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb
> > +++ b/meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb
> > @@ -13,7 +13,7 @@ SRC_URI =3D "git://
> github.com/tvheadend/tvheadend.git;branch=3Dmaster;protocol=3Dhttps
> >             "
> >
> >  SRCREV =3D "cc602833684953fc3e6f1c89d4f08f6dfef179e3"
> > -PV =3D "4.3+git${SRCPV}"
> > +PV =3D "4.3+git"
> >  PKGV =3D "4.3+git${GITPKGV}"
> >
> >  S =3D "${WORKDIR}/git"
> > diff --git a/meta-multimedia/recipes-multimedia/bluealsa/bluealsa_git.b=
b
> b/meta-multimedia/recipes-multimedia/bluealsa/bluealsa_git.bb
> > index ab0d8bca9f..5007c88fff 100644
> > --- a/meta-multimedia/recipes-multimedia/bluealsa/bluealsa_git.bb
> > +++ b/meta-multimedia/recipes-multimedia/bluealsa/bluealsa_git.bb
> > @@ -8,7 +8,7 @@ LIC_FILES_CHKSUM =3D
> "file://LICENSE;md5=3D8449a4f133a93f6254b496d4fb476e83"
> >  SRC_URI =3D "git://
> github.com/Arkq/bluez-alsa.git;protocol=3Dhttps;branch=3Dmaster"
> >
> >  SRCREV =3D "dd05a1baa261b94da9ba977b5e3392c8b4dc7a5e"
> > -PV =3D "4.0.0+git${SRCPV}"
> > +PV =3D "4.0.0+git"
> >
> >  S  =3D "${WORKDIR}/git"
> >
> > diff --git a/meta-multimedia/recipes-multimedia/dleyna/
> dleyna-server_0.6.0.bb b/meta-multimedia/recipes-multimedia/dleyna/
> dleyna-server_0.6.0.bb
> > index 719aecede1..b0a347f252 100644
> > --- a/meta-multimedia/recipes-multimedia/dleyna/dleyna-server_0.6.0.bb
> > +++ b/meta-multimedia/recipes-multimedia/dleyna/dleyna-server_0.6.0.bb
> > @@ -11,7 +11,7 @@ LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3D4fbd65380cdd255951079008b364516c \
> >  DEPENDS =3D "glib-2.0 gssdp gupnp gupnp-av gupnp-dlna libsoup-2.4 libx=
ml2
> dleyna-core"
> >  RDEPENDS:${PN} =3D "dleyna-connector-dbus"
> >
> > -PV .=3D "+git${SRCPV}"
> > +PV .=3D "+git"
> >  SRC_URI =3D "git://
> github.com/01org/${BPN}.git;branch=3Dmaster;protocol=3Dhttps
> <http://github.com/01org/$%7BBPN%7D.git;branch=3Dmaster;protocol=3Dhttps>=
"
> >  SRCREV =3D "eb895ae82715e9889a948ffa810c0f828b4f4c76"
> >  S =3D "${WORKDIR}/git"
> > diff --git a/meta-multimedia/recipes-multimedia/libsquish/
> libsquish_git.bb b/meta-multimedia/recipes-multimedia/libsquish/
> libsquish_git.bb
> > index fb74881c03..3d631ea0b6 100644
> > --- a/meta-multimedia/recipes-multimedia/libsquish/libsquish_git.bb
> > +++ b/meta-multimedia/recipes-multimedia/libsquish/libsquish_git.bb
> > @@ -3,7 +3,7 @@ SUMMARY =3D "The squish library (abbreviated to libsqui=
sh)
> is an open source DXT c
> >  LICENSE =3D "MIT"
> >  LIC_FILES_CHKSUM =3D
> "file://alpha.cpp;beginline=3D3;endline=3D22;md5=3D6665e479f71feb92d590ea=
9ae9b9f6d5"
> >
> > -PV =3D "1.10+git${SRCPV}"
> > +PV =3D "1.10+git"
> >
> >  SRCREV =3D "52e7d93c5947f72380521116c05d97c528863ba8"
> >  SRC_URI =3D "git://
> github.com/OpenELEC/libsquish.git;protocol=3Dhttps;branch=3Dmaster \
> > diff --git a/meta-multimedia/recipes-multimedia/musicbrainz/
> libmusicbrainz_git.bb b/meta-multimedia/recipes-multimedia/musicbrainz/
> libmusicbrainz_git.bb
> > index 3b365444e2..e8b10bc680 100644
> > --- a/meta-multimedia/recipes-multimedia/musicbrainz/
> libmusicbrainz_git.bb
> > +++ b/meta-multimedia/recipes-multimedia/musicbrainz/
> libmusicbrainz_git.bb
> > @@ -5,7 +5,7 @@ LICENSE =3D "LGPL-2.1-or-later"
> >  LIC_FILES_CHKSUM =3D
> "file://COPYING.txt;md5=3Dfbc093901857fcd118f065f900982c24"
> >  DEPENDS =3D "expat libxml2 libxml2-native neon neon-native
> libmusicbrainz-native"
> >
> > -PV =3D "5.1.0+git${SRCPV}"
> > +PV =3D "5.1.0+git"
> >
> >  SRCREV =3D "8be45b12a86bc0e46f2f836c8ac88e1e98d82aee"
> >  SRC_URI =3D "git://
> github.com/metabrainz/libmusicbrainz.git;branch=3Dmaster;protocol=3Dhttps=
 \
> > diff --git a/meta-multimedia/recipes-support/gst-instruments/
> gst-instruments_git.bb b/meta-multimedia/recipes-support/gst-instruments/
> gst-instruments_git.bb
> > index 8f0ad65120..df688bbcda 100644
> > --- a/meta-multimedia/recipes-support/gst-instruments/
> gst-instruments_git.bb
> > +++ b/meta-multimedia/recipes-support/gst-instruments/
> gst-instruments_git.bb
> > @@ -6,7 +6,7 @@ LICENSE =3D "LGPL-3.0-only"
> >  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3De6a600fd5e1d9cbde2d98368023=
3ad02"
> >  DEPENDS =3D "gstreamer1.0"
> >  SRCREV =3D "cb8977a6711657e32853159cd539d1d75fcbc772"
> > -PV =3D "0.3.1+git${SRCPV}"
> > +PV =3D "0.3.1+git"
> >
> >  SRC_URI =3D "git://
> github.com/kirushyk/gst-instruments.git;protocol=3Dhttps;branch=3Dmaster"
> >
> > diff --git a/meta-networking/recipes-connectivity/bearssl/bearssl_0.6.b=
b
> b/meta-networking/recipes-connectivity/bearssl/bearssl_0.6.bb
> > index 1e70a3dec6..39569e9d06 100644
> > --- a/meta-networking/recipes-connectivity/bearssl/bearssl_0.6.bb
> > +++ b/meta-networking/recipes-connectivity/bearssl/bearssl_0.6.bb
> > @@ -23,7 +23,7 @@ inherit lib_package
> >  LICENSE =3D "MIT"
> >  LIC_FILES_CHKSUM =3D
> "file://LICENSE.txt;md5=3D1fc37e1037ae673975fbcb96a98f7191"
> >
> > -PV .=3D "+git${SRCPV}"
> > +PV .=3D "+git"
> >  SRCREV =3D "79c060eea3eea1257797f15ea1608a9a9923aa6f"
> >  SRC_URI =3D "git://
> www.bearssl.org/git/BearSSL;protocol=3Dhttps;branch=3Dmaster \
> >
>  file://0002-test-test_x509.c-fix-potential-overflow-issue.patch \
> > diff --git a/meta-networking/recipes-connectivity/bluepy/bluepy_git.bb
> b/meta-networking/recipes-connectivity/bluepy/bluepy_git.bb
> > index 8e164708ed..5b784d9a04 100644
> > --- a/meta-networking/recipes-connectivity/bluepy/bluepy_git.bb
> > +++ b/meta-networking/recipes-connectivity/bluepy/bluepy_git.bb
> > @@ -5,7 +5,7 @@ LICENSE =3D "GPL-2.0-only & PD"
> >  LIC_FILES_CHKSUM =3D
> "file://LICENSE.txt;md5=3D59e0d45ea684dda215889aa1b5acd001"
> >  DEPENDS =3D "glib-2.0"
> >  SRCREV =3D "7ad565231a97c304c0eff45f2649cd005e69db09"
> > -PV =3D "1.3.0+git${SRCPV}"
> > +PV =3D "1.3.0+git"
> >
> >  SRC_URI =3D "git://
> github.com/IanHarvey/bluepy.git;protocol=3Dhttps;branch=3Dmaster \
> >             file://0001-bluepy-Fix-username-issue-with-tarballs.patch \
> > diff --git a/meta-networking/recipes-connectivity/openthread/
> ot-br-posix_git.bb b/meta-networking/recipes-connectivity/openthread/
> ot-br-posix_git.bb
> > index 720228dc14..71e5a8d43b 100644
> > --- a/meta-networking/recipes-connectivity/openthread/ot-br-posix_git.b=
b
> > +++ b/meta-networking/recipes-connectivity/openthread/ot-br-posix_git.b=
b
> > @@ -12,7 +12,7 @@ LIC_FILES_CHKSUM =3D
> "file://LICENSE;md5=3D87109e44b2fda96a8991f27684a7349c \
> >                      "
> >  DEPENDS =3D "autoconf-archive dbus readline avahi jsoncpp boost
> libnetfilter-queue"
> >  SRCREV =3D "ad6822257ffddbac295db97186e4ab449a2ed32a"
> > -PV =3D "0.3.0+git${SRCPV}"
> > +PV =3D "0.3.0+git"
> >
> >  SRC_URI =3D "gitsm://
> github.com/openthread/ot-br-posix.git;protocol=3Dhttps;branch=3Dmain \
> >
>  file://0001-otbr-agent.service.in-remove-pre-exec-hook-for-mdns-.patch \
> > diff --git a/meta-networking/recipes-connectivity/openthread/
> ot-daemon_git.bb b/meta-networking/recipes-connectivity/openthread/
> ot-daemon_git.bb
> > index 18703d6c4d..1583a3f837 100644
> > --- a/meta-networking/recipes-connectivity/openthread/ot-daemon_git.bb
> > +++ b/meta-networking/recipes-connectivity/openthread/ot-daemon_git.bb
> > @@ -9,7 +9,7 @@ LIC_FILES_CHKSUM =3D
> "file://LICENSE;md5=3D543b6fe90ec5901a683320a36390c65f \
> >                      "
> >  DEPENDS =3D "readline"
> >  SRCREV =3D "7dfde1f12923f03c9680be4d838b94b7a2320324"
> > -PV =3D "0.1+git${SRCPV}"
> > +PV =3D "0.1+git"
> >
> >  SRC_URI =3D "git://
> github.com/openthread/openthread.git;protocol=3Dhttps;branch=3Dmain \
> >
>  file://0001-bn_mul.h-fix-x86-PIC-inline-ASM-compilation-with-GCC.patch \
> > diff --git a/meta-networking/recipes-connectivity/openthread/
> wpantund_git.bb b/meta-networking/recipes-connectivity/openthread/
> wpantund_git.bb
> > index ebb3fc3c1c..b75d686e58 100644
> > --- a/meta-networking/recipes-connectivity/openthread/wpantund_git.bb
> > +++ b/meta-networking/recipes-connectivity/openthread/wpantund_git.bb
> > @@ -13,7 +13,7 @@ LIC_FILES_CHKSUM =3D
> "file://LICENSE;md5=3De7820bc7f7d1638a6b54fc2e8d7fb103 \
> >                      "
> >  DEPENDS =3D "autoconf-archive dbus readline boost"
> >  SRCREV =3D "0fb1f57e4224e2df3e630e146702bfcf63fbf07a"
> > -PV =3D "0.07.01+git${SRCPV}"
> > +PV =3D "0.07.01+git"
> >
> >  SRC_URI =3D "gitsm://
> github.com/openthread/wpantund.git;protocol=3Dhttps;branch=3Dmaster \
> >             "
> > diff --git a/meta-networking/recipes-connectivity/relayd/relayd_git.bb
> b/meta-networking/recipes-connectivity/relayd/relayd_git.bb
> > index 79e1743fdf..871df69909 100644
> > --- a/meta-networking/recipes-connectivity/relayd/relayd_git.bb
> > +++ b/meta-networking/recipes-connectivity/relayd/relayd_git.bb
> > @@ -8,7 +8,7 @@ DEPENDS =3D "libubox"
> >  SRC_URI =3D "git://git.openwrt.org/project/relayd.git;branch=3Dmaster"
> >
> >  SRCREV =3D "f646ba40489371e69f624f2dee2fc4e19ceec00e"
> > -PV =3D "0.0.1+git${SRCPV}"
> > +PV =3D "0.0.1+git"
> >
> >  UPSTREAM_CHECK_COMMITS =3D "1"
> >
> > diff --git a/meta-networking/recipes-filter/ulogd2/ulogd2_2.0.8.bb
> b/meta-networking/recipes-filter/ulogd2/ulogd2_2.0.8.bb
> > index 19bd32ccd4..d075ec4788 100644
> > --- a/meta-networking/recipes-filter/ulogd2/ulogd2_2.0.8.bb
> > +++ b/meta-networking/recipes-filter/ulogd2/ulogd2_2.0.8.bb
> > @@ -9,7 +9,7 @@ LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3Dc93c0550bd3173f4504b2cbd8991e50b"
> >  DEPENDS =3D "libnfnetlink"
> >  PROVIDES =3D "ulogd"
> >
> > -PV .=3D "+git${SRCPV}"
> > +PV .=3D "+git"
> >
> >  SRC_URI =3D "git://git.netfilter.org/ulogd2;branch=3Dmaster \
> >             file://ulogd.init \
> > diff --git a/meta-networking/recipes-protocols/openflow/openflow_git.bb
> b/meta-networking/recipes-protocols/openflow/openflow_git.bb
> > index 1ac5dd4105..f39888e8f1 100644
> > --- a/meta-networking/recipes-protocols/openflow/openflow_git.bb
> > +++ b/meta-networking/recipes-protocols/openflow/openflow_git.bb
> > @@ -1,7 +1,7 @@
> >  include ${BPN}.inc
> >
> >  SRCREV =3D "c84f33f09d5dbcfc9b489f64cb30475bf36f653a"
> > -PV =3D "1.0+git${SRCPV}"
> > +PV =3D "1.0+git"
> >
> >  SRC_URI +=3D
> "file://0001-Check-and-use-strlcpy-from-libc-before-defining-own.patch \
> >             file://0002-lib-netdev-Adjust-header-include-sequence.patch=
 \
> > diff --git a/meta-networking/recipes-protocols/openlldp/
> openlldp_1.1.0.bb b/meta-networking/recipes-protocols/openlldp/
> openlldp_1.1.0.bb
> > index 812f4fbcf0..71d738ddc1 100644
> > --- a/meta-networking/recipes-protocols/openlldp/openlldp_1.1.0.bb
> > +++ b/meta-networking/recipes-protocols/openlldp/openlldp_1.1.0.bb
> > @@ -13,7 +13,7 @@ inherit ${@bb.utils.contains('DISTRO_FEATURES',
> 'systemd', 'systemd', '', d)}
> >  DEPENDS =3D "libnl libconfig readline"
> >
> >  SRCREV =3D "85e55837a81d710e5baa7da47f7ed0d205c8ede5"
> > -PV .=3D "+git${SRCPV}"
> > +PV .=3D "+git"
> >  SRC_URI =3D "git://
> github.com/intel/openlldp.git;protocol=3Dhttps;branch=3Dbranch-1.1 \
> >             file://0001-Fix-musl-libc-build-issue.patch \
> >
>  file://0001-autotools-Add-include-path-to-generated-version.h.patch \
> > diff --git a/meta-networking/recipes-support/arptables/arptables_git.bb
> b/meta-networking/recipes-support/arptables/arptables_git.bb
> > index 898b69682d..949794bf30 100644
> > --- a/meta-networking/recipes-support/arptables/arptables_git.bb
> > +++ b/meta-networking/recipes-support/arptables/arptables_git.bb
> > @@ -3,7 +3,7 @@ SECTION =3D "net"
> >  LICENSE =3D "GPL-2.0-only"
> >  LIC_FILES_CHKSUM =3D
> "file://${COREBASE}/meta/files/common-licenses/GPL-2.0-only;md5=3D801f809=
80d171dd6425610833a22dbe6"
> >  SRCREV =3D "efae8949e31f8b2eb6290f377a28384cecaf105a"
> > -PV =3D "0.0.5+git${SRCPV}"
> > +PV =3D "0.0.5+git"
> >
> >  SRC_URI =3D " \
> >      git://git.netfilter.org/arptables;branch=3Dmaster \
> > diff --git a/meta-networking/recipes-support/celt051/celt051_git.bb
> b/meta-networking/recipes-support/celt051/celt051_git.bb
> > index 62682cfce3..4842a0fbdf 100644
> > --- a/meta-networking/recipes-support/celt051/celt051_git.bb
> > +++ b/meta-networking/recipes-support/celt051/celt051_git.bb
> > @@ -12,7 +12,7 @@ like Speex, GSM, or G.729."
> >  LICENSE =3D "BSD-2-Clause"
> >  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D375f60ab360d17f0172737036ff=
155b2"
> >
> > -PV =3D "0.5.1.3+git${SRCPV}"
> > +PV =3D "0.5.1.3+git"
> >
> >  SRCREV =3D "5555aae843f57241d005e330b9cb65602d56db0f"
> >
> > diff --git a/meta-networking/recipes-support/lksctp-tools/
> lksctp-tools_1.0.19.bb b/meta-networking/recipes-support/lksctp-tools/
> lksctp-tools_1.0.19.bb
> > index 4a9d2f54d9..3f945eeeee 100644
> > --- a/meta-networking/recipes-support/lksctp-tools/
> lksctp-tools_1.0.19.bb
> > +++ b/meta-networking/recipes-support/lksctp-tools/
> lksctp-tools_1.0.19.bb
> > @@ -10,7 +10,7 @@ LIC_FILES_CHKSUM =3D " \
> >
> >  SRCREV =3D "05b50d379ff0037de4957bb2a1befcce88b70225"
> >
> > -PV .=3D "+git${SRCPV}"
> > +PV .=3D "+git"
> >  LK_REL =3D "1.0.19"
> >
> >  SRC_URI =3D " \
> > diff --git a/meta-networking/recipes-support/lowpan-tools/
> lowpan-tools_git.bb b/meta-networking/recipes-support/lowpan-tools/
> lowpan-tools_git.bb
> > index baaff1f219..f0b7e9184e 100644
> > --- a/meta-networking/recipes-support/lowpan-tools/lowpan-tools_git.bb
> > +++ b/meta-networking/recipes-support/lowpan-tools/lowpan-tools_git.bb
> > @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3D751419260aa954499f7abaabaa882bbe"
> >
> >  DEPENDS =3D "flex-native bison-native libnl python"
> >
> > -PV =3D "0.3.1+git${SRCPV}"
> > +PV =3D "0.3.1+git"
> >  SRC_URI =3D "git://
> github.com/linux-wpan/lowpan-tools;branch=3Dmaster;protocol=3Dhttps \
> >             file://no-help2man.patch \
> >             file://0001-Fix-build-errors-with-clang.patch \
> > diff --git a/meta-networking/recipes-support/netcf/netcf_0.2.8.bb
> b/meta-networking/recipes-support/netcf/netcf_0.2.8.bb
> > index f60bb9f104..59ce3e9991 100644
> > --- a/meta-networking/recipes-support/netcf/netcf_0.2.8.bb
> > +++ b/meta-networking/recipes-support/netcf/netcf_0.2.8.bb
> > @@ -7,7 +7,7 @@ LICENSE =3D "LGPL-2.1-only"
> >  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dfb919cc88dbe06ec0b0bd50e001=
ccf1f"
> >
> >  SRCREV =3D "2c5d4255857531bc09d91dcd02e86545f29004d4"
> > -PV .=3D "+git${SRCPV}"
> > +PV .=3D "+git"
> >
> >  SRC_URI =3D "git://pagure.io/netcf.git;protocol=3Dhttps;branch=3Dmaste=
r \
> >  "
> > diff --git a/meta-networking/recipes-support/netperf/netperf_git.bb
> b/meta-networking/recipes-support/netperf/netperf_git.bb
> > index 4074f0cd07..6e459eeeb4 100644
> > --- a/meta-networking/recipes-support/netperf/netperf_git.bb
> > +++ b/meta-networking/recipes-support/netperf/netperf_git.bb
> > @@ -5,7 +5,7 @@ HOMEPAGE =3D "http://www.netperf.org/"
> >  LICENSE =3D "MIT"
> >  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3De661ab33a2a71ad6652c178dedf=
8aaa2"
> >
> > -PV =3D "2.7.0+git${SRCPV}"
> > +PV =3D "2.7.0+git"
> >
> >  SRC_URI =3D "git://
> github.com/HewlettPackard/netperf.git;branch=3Dmaster;protocol=3Dhttps \
> >             file://cpu_set.patch \
> > diff --git a/meta-networking/recipes-support/ntimed/ntimed_git.bb
> b/meta-networking/recipes-support/ntimed/ntimed_git.bb
> > index 9badfd75d1..955c03f42d 100644
> > --- a/meta-networking/recipes-support/ntimed/ntimed_git.bb
> > +++ b/meta-networking/recipes-support/ntimed/ntimed_git.bb
> > @@ -11,7 +11,7 @@ LIC_FILES_CHKSUM =3D
> "file://main.c;beginline=3D2;endline=3D24;md5=3D89db8e76f2951f3fad1
> >  SRC_URI =3D "git://github.com/bsdphk/Ntimed;branch=3Dmaster;protocol=
=3Dhttps
> \
> >             file://use-ldflags.patch"
> >
> > -PV =3D "0.0+git${SRCPV}"
> > +PV =3D "0.0+git"
> >  SRCREV =3D "db0abbb4c80f2ecef6bc5d9639bca5bea28532a2"
> >
> >  S =3D "${WORKDIR}/git"
> > diff --git a/meta-networking/recipes-support/phytool/phytool.bb
> b/meta-networking/recipes-support/phytool/phytool.bb
> > index c2c4335910..b918e50c68 100644
> > --- a/meta-networking/recipes-support/phytool/phytool.bb
> > +++ b/meta-networking/recipes-support/phytool/phytool.bb
> > @@ -2,7 +2,7 @@ SUMMARY =3D "PHY interface tool for Linux"
> >  LICENSE =3D "GPL-2.0-only"
> >  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D39bba7d2cf0ba1036f2a6e2be52=
fe3f0"
> >
> > -PV =3D "2+git${SRCPV}"
> > +PV =3D "2+git"
> >  SRCREV =3D "8882328c08ba2efb13c049812098f1d0cb8adf0c"
> >  SRC_URI =3D "git://
> github.com/wkz/phytool.git;branch=3Dmaster;protocol=3Dhttps"
> >
> > diff --git a/meta-oe/dynamic-layers/meta-python/recipes-bsp/rwmem/
> rwmem_1.2.bb b/meta-oe/dynamic-layers/meta-python/recipes-bsp/rwmem/
> rwmem_1.2.bb
> > index bff82fe35d..90c9a7147c 100644
> > --- a/meta-oe/dynamic-layers/meta-python/recipes-bsp/rwmem/rwmem_1.2.bb
> > +++ b/meta-oe/dynamic-layers/meta-python/recipes-bsp/rwmem/rwmem_1.2.bb
> > @@ -13,7 +13,7 @@ LIC_FILES_CHKSUM =3D
> "file://LICENSE;md5=3Db234ee4d69f5fce4486a80fdaf4a4263"
> >
> >  DEPENDS +=3D "fmt libinih"
> >
> > -PV .=3D "+git${SRCPV}"
> > +PV .=3D "+git"
> >
> >  SRCREV =3D "8416326777b2aada0706539b8f9f6acefa476b16"
> >
> > diff --git a/meta-oe/dynamic-layers/meta-python/recipes-extended/lcdpro=
c/
> lcdproc_git.bb
> b/meta-oe/dynamic-layers/meta-python/recipes-extended/lcdproc/
> lcdproc_git.bb
> > index 4cae4947f2..c29c51a2ae 100644
> > --- a/meta-oe/dynamic-layers/meta-python/recipes-extended/lcdproc/
> lcdproc_git.bb
> > +++ b/meta-oe/dynamic-layers/meta-python/recipes-extended/lcdproc/
> lcdproc_git.bb
> > @@ -9,7 +9,7 @@ DEPENDS =3D "ncurses lirc"
> >  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D18810669f13b87348459e611d31=
ab760
> \
> >
> file://README.md;beginline=3D107;md5=3D5db392f043253a2d64b1737068ce6b58"
> >
> > -PV =3D "0.5.9+git${SRCPV}"
> > +PV =3D "0.5.9+git"
> >  SRCREV =3D "0e2ce9b9c46c47363436f9ee730f7c71bf455f0f"
> >  SRC_URI =3D "git://
> github.com/lcdproc/lcdproc;branch=3Dmaster;protocol=3Dhttps"
> >
> > diff --git a/meta-oe/recipes-benchmark/cpuburn/cpuburn-arm_git.bb
> b/meta-oe/recipes-benchmark/cpuburn/cpuburn-arm_git.bb
> > index 7969af6c37..c58524aa64 100644
> > --- a/meta-oe/recipes-benchmark/cpuburn/cpuburn-arm_git.bb
> > +++ b/meta-oe/recipes-benchmark/cpuburn/cpuburn-arm_git.bb
> > @@ -7,7 +7,7 @@ PROVIDES +=3D "cpuburn-neon"
> >
> >  SRCREV =3D "ad7e646700d14b81413297bda02fb7fe96613c3f"
> >
> > -PV =3D "1.0+git${SRCPV}"
> > +PV =3D "1.0+git"
> >
> >  SRC_URI =3D "git://
> github.com/ssvb/cpuburn-arm.git;branch=3Dmaster;protocol=3Dhttps \
> >             file://0001-cpuburn-a8.S-Remove-.func-.endfunc.patch \
> > diff --git a/meta-oe/recipes-benchmark/libc-bench/libc-bench_git.bb
> b/meta-oe/recipes-benchmark/libc-bench/libc-bench_git.bb
> > index 17bbb9b6ce..4ace4515ad 100644
> > --- a/meta-oe/recipes-benchmark/libc-bench/libc-bench_git.bb
> > +++ b/meta-oe/recipes-benchmark/libc-bench/libc-bench_git.bb
> > @@ -7,7 +7,7 @@ LICENSE =3D "MIT"
> >  LIC_FILES_CHKSUM =3D
> "file://COPYRIGHT;md5=3D9a825c63897c53f487ef900598c31527"
> >
> >  SRCREV =3D "b6b2ce5f9f87a09b14499cb00c600c601f022634"
> > -PV =3D "20110206+git${SRCPV}"
> > +PV =3D "20110206+git"
> >
> >  SRC_URI =3D "git://git.musl-libc.org/libc-bench;branch=3Dmaster \
> >
>  file://0001-build-Do-not-override-ldflags-from-environment.patch \
> > diff --git a/meta-oe/recipes-benchmark/tinymembench/tinymembench_git.bb
> b/meta-oe/recipes-benchmark/tinymembench/tinymembench_git.bb
> > index 025aacf251..200a0de849 100644
> > --- a/meta-oe/recipes-benchmark/tinymembench/tinymembench_git.bb
> > +++ b/meta-oe/recipes-benchmark/tinymembench/tinymembench_git.bb
> > @@ -6,7 +6,7 @@ HOMEPAGE =3D "https://github.com/ssvb/tinymembench/wiki=
"
> >  LICENSE =3D "MIT"
> >  LIC_FILES_CHKSUM =3D
> "file://main.c;endline=3D22;md5=3D879b9bbb60851454885b5fa47eb6b345"
> >
> > -PV =3D "0.4.9+git${SRCPV}"
> > +PV =3D "0.4.9+git"
> >
> >  SRCREV =3D "a2cf6d7e382e3aea1eb39173174d9fa28cad15f3"
> >  SRC_URI =3D "git://
> github.com/ssvb/tinymembench.git;branch=3Dmaster;protocol=3Dhttps \
> > diff --git a/meta-oe/recipes-bsp/edac-utils/edac-utils_git.bb
> b/meta-oe/recipes-bsp/edac-utils/edac-utils_git.bb
> > index 455859ec86..03076cbc60 100644
> > --- a/meta-oe/recipes-bsp/edac-utils/edac-utils_git.bb
> > +++ b/meta-oe/recipes-bsp/edac-utils/edac-utils_git.bb
> > @@ -11,7 +11,7 @@ LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4263"
> >  DEPENDS =3D " sysfsutils"
> >
> >  SRCREV =3D "1c57818ecee186aa47af0342149577df5302c022"
> > -PV =3D "0.18+git${SRCPV}"
> > +PV =3D "0.18+git"
> >
> >  S =3D "${WORKDIR}/git"
> >
> > diff --git a/meta-oe/recipes-bsp/firmwared/firmwared_git.bb
> b/meta-oe/recipes-bsp/firmwared/firmwared_git.bb
> > index e8b491a435..0a041835e1 100644
> > --- a/meta-oe/recipes-bsp/firmwared/firmwared_git.bb
> > +++ b/meta-oe/recipes-bsp/firmwared/firmwared_git.bb
> > @@ -10,7 +10,7 @@ LIC_FILES_CHKSUM =3D
> "file://LICENSE-APACHE;md5=3D7b486c2338d225a1405d979ed2c15ce8 \
> >  SRC_URI =3D "git://
> github.com/teg/firmwared.git;branch=3Dmaster;protocol=3Dhttps \
> >             file://firmwared.service"
> >
> > -PV =3D "0+git${SRCPV}"
> > +PV =3D "0+git"
> >  SRCREV =3D "2e6b5db43d63a5c0283a4cae9a6a20b7ad107a04"
> >
> >  S =3D "${WORKDIR}/git"
> > diff --git a/meta-oe/recipes-connectivity/gattlib/gattlib_git.bb
> b/meta-oe/recipes-connectivity/gattlib/gattlib_git.bb
> > index aec41edf7a..f54d833a01 100644
> > --- a/meta-oe/recipes-connectivity/gattlib/gattlib_git.bb
> > +++ b/meta-oe/recipes-connectivity/gattlib/gattlib_git.bb
> > @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D
> "file://CMakeLists.txt;beginline=3D1;endline=3D6;md5=3Da87ee154f005
> >  DEPENDS =3D "bluez5 glib-2.0"
> >  DEPENDS +=3D "glib-2.0-native"
> >
> > -PV =3D "0.2+git${SRCPV}"
> > +PV =3D "0.2+git"
> >
> >  SRC_URI =3D "git://
> github.com/labapart/gattlib.git;branch=3Dmaster;protocol=3Dhttps \
> >             file://dbus-avoid-strange-chars-from-the-build-dir.patch \
> > diff --git a/meta-oe/recipes-connectivity/libimobiledevice-glue/
> libimobiledevice-glue_git.bb
> b/meta-oe/recipes-connectivity/libimobiledevice-glue/
> libimobiledevice-glue_git.bb
> > index b63aabdc0c..d37c547c98 100644
> > --- a/meta-oe/recipes-connectivity/libimobiledevice-glue/
> libimobiledevice-glue_git.bb
> > +++ b/meta-oe/recipes-connectivity/libimobiledevice-glue/
> libimobiledevice-glue_git.bb
> > @@ -8,7 +8,7 @@ HOMEPAGE =3D "http://www.libimobiledevice.org/"
> >
> >  DEPENDS =3D "libplist"
> >
> > -PV =3D "1.0.0+git${SRCPV}"
> > +PV =3D "1.0.0+git"
> >
> >  SRCREV =3D "114098d30e783fbb3def5c9b49427a86621cfcb1"
> >  SRC_URI =3D "git://
> github.com/libimobiledevice/libimobiledevice-glue;protocol=3Dhttps;branch=
=3Dmaster
> "
> > diff --git a/meta-oe/recipes-connectivity/libimobiledevice/
> libimobiledevice_git.bb b/meta-oe/recipes-connectivity/libimobiledevice/
> libimobiledevice_git.bb
> > index 1a0590c57b..b8d7e8872b 100644
> > --- a/meta-oe/recipes-connectivity/libimobiledevice/
> libimobiledevice_git.bb
> > +++ b/meta-oe/recipes-connectivity/libimobiledevice/
> libimobiledevice_git.bb
> > @@ -8,7 +8,7 @@ HOMEPAGE =3D "http://www.libimobiledevice.org/"
> >
> >  DEPENDS =3D "libplist usbmuxd libusbmuxd libtasn1 gnutls libgcrypt
> libimobiledevice-glue openssl"
> >
> > -PV =3D "1.3.0+git${SRCPV}"
> > +PV =3D "1.3.0+git"
> >
> >  SRCREV =3D "860ffb707af3af94467d2ece4ad258dda957c6cd"
> >  SRC_URI =3D "git://
> github.com/libimobiledevice/libimobiledevice;protocol=3Dhttps;branch=3Dma=
ster
> \
> > diff --git a/meta-oe/recipes-connectivity/libqrtr-glib/
> libqrtr-glib_git.bb b/meta-oe/recipes-connectivity/libqrtr-glib/
> libqrtr-glib_git.bb
> > index 7bac3117cd..3549cac568 100644
> > --- a/meta-oe/recipes-connectivity/libqrtr-glib/libqrtr-glib_git.bb
> > +++ b/meta-oe/recipes-connectivity/libqrtr-glib/libqrtr-glib_git.bb
> > @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D
> "file://LICENSES/LGPL-2.1-or-later.txt;md5=3D4fbd65380cdd255951
> >
> >  SRC_URI =3D "git://
> gitlab.freedesktop.org/mobile-broadband/libqrtr-glib.git;protocol=3Dhttps=
;branch=3Dqrtr-1-2
> "
> >
> > -PV =3D "1.2.2+git${SRCPV}"
> > +PV =3D "1.2.2+git"
> >  SRCREV =3D "8991f0e93713ebf4da48ae4f23940ead42f64c8c"
> >
> >  S =3D "${WORKDIR}/git"
> > diff --git a/meta-oe/recipes-connectivity/rtorrent/rtorrent_git.bb
> b/meta-oe/recipes-connectivity/rtorrent/rtorrent_git.bb
> > index d5411b19b2..d9cca404d7 100644
> > --- a/meta-oe/recipes-connectivity/rtorrent/rtorrent_git.bb
> > +++ b/meta-oe/recipes-connectivity/rtorrent/rtorrent_git.bb
> > @@ -8,7 +8,7 @@ DEPENDS =3D "autoconf-archive libsigc++-2.0 curl cppuni=
t
> libtool libtorrent ncurse
> >  SRC_URI =3D "git://
> github.com/rakshasa/rtorrent;branch=3Dmaster;protocol=3Dhttps"
> >  SRCREV =3D "d067bd802e44f0e6a747aabcc311ada2175fd550"
> >
> > -PV =3D "0.9.8+git${SRCPV}"
> > +PV =3D "0.9.8+git"
> >
> >  S =3D "${WORKDIR}/git"
> >
> > diff --git a/meta-oe/recipes-connectivity/usbmuxd/usbmuxd_git.bb
> b/meta-oe/recipes-connectivity/usbmuxd/usbmuxd_git.bb
> > index 1492234495..569d6a41cf 100644
> > --- a/meta-oe/recipes-connectivity/usbmuxd/usbmuxd_git.bb
> > +++ b/meta-oe/recipes-connectivity/usbmuxd/usbmuxd_git.bb
> > @@ -9,7 +9,7 @@ DEPENDS =3D "udev libusb1 libplist libimobiledevice-glu=
e"
> >  inherit autotools pkgconfig gitpkgv systemd
> >
> >  PKGV =3D "${GITPKGVTAG}"
> > -PV =3D "1.1.2+git${SRCPV}"
> > +PV =3D "1.1.2+git"
> >
> >  SRCREV =3D "01c94c77f59404924f1c46d99c4e5e0c7817281b"
> >  SRC_URI =3D "git://
> github.com/libimobiledevice/usbmuxd;protocol=3Dhttps;branch=3Dmaster"
> > diff --git a/meta-oe/recipes-core/dbus/dbus-daemon-proxy_git.bb
> b/meta-oe/recipes-core/dbus/dbus-daemon-proxy_git.bb
> > index d096cd618e..122a3f9916 100644
> > --- a/meta-oe/recipes-core/dbus/dbus-daemon-proxy_git.bb
> > +++ b/meta-oe/recipes-core/dbus/dbus-daemon-proxy_git.bb
> > @@ -3,7 +3,7 @@ LICENSE =3D "LGPL-2.1-or-later"
> >  LIC_FILES_CHKSUM =3D
> "file://dbus-daemon-proxy.c;endline=3D19;md5=3D41df6d21fe1c97d6a1cc22a5bf=
374cba"
> >  DEPENDS =3D "dbus dbus-glib"
> >  SRCREV =3D "1226a0a1374628ff191f6d8a56000be5e53e7608"
> > -PV =3D "0.0.0+gitr${SRCPV}"
> > +PV =3D "0.0.0+gitr"
> >  PR =3D "r1.59"
> >
> >  SRC_URI =3D "git://
> github.com/alban/dbus-daemon-proxy;branch=3Dmaster;protocol=3Dhttps \
> > diff --git a/meta-oe/recipes-core/glfw/glfw_3.3.8.bb
> b/meta-oe/recipes-core/glfw/glfw_3.3.8.bb
> > index ad7a3a7ed4..684355ef3e 100644
> > --- a/meta-oe/recipes-core/glfw/glfw_3.3.8.bb
> > +++ b/meta-oe/recipes-core/glfw/glfw_3.3.8.bb
> > @@ -10,7 +10,7 @@ SECTION =3D "lib"
> >
> >  inherit pkgconfig cmake features_check
> >
> > -PV .=3D "+git${SRCPV}"
> > +PV .=3D "+git"
> >  SRCREV =3D "7482de6071d21db77a7236155da44c172a7f6c9e"
> >  SRC_URI =3D "git://
> github.com/glfw/glfw.git;branch=3D3.3-stable;protocol=3Dhttps"
> >
> > diff --git a/meta-oe/recipes-core/libnfc/libnfc_git.bb
> b/meta-oe/recipes-core/libnfc/libnfc_git.bb
> > index 9733749628..a97a2841f7 100644
> > --- a/meta-oe/recipes-core/libnfc/libnfc_git.bb
> > +++ b/meta-oe/recipes-core/libnfc/libnfc_git.bb
> > @@ -7,7 +7,7 @@ SECTION =3D "libs"
> >
> >  inherit autotools pkgconfig
> >
> > -PV =3D "1.8.0+git${SRCPV}"
> > +PV =3D "1.8.0+git"
> >
> >  S =3D "${WORKDIR}/git"
> >  SRCREV =3D "f02ff51449240102c27a97173dc495e8e7789046"
> > diff --git a/meta-oe/recipes-core/mdbus2/mdbus2_git.bb
> b/meta-oe/recipes-core/mdbus2/mdbus2_git.bb
> > index c6db78b4ab..a7ac358f27 100644
> > --- a/meta-oe/recipes-core/mdbus2/mdbus2_git.bb
> > +++ b/meta-oe/recipes-core/mdbus2/mdbus2_git.bb
> > @@ -4,7 +4,7 @@ LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3Debb5c50ab7cab4baeffba14977030c07"
> >
> >  DEPENDS =3D "readline"
> >
> > -PV =3D "2.3.3+git${SRCPV}"
> > +PV =3D "2.3.3+git"
> >
> >  SRC_URI =3D "git://
> github.com/freesmartphone/mdbus.git;protocol=3Dhttps;branch=3Dmaster \
> >
>  file://0001-Fix-arguments-in-GLib.DBusSignalCallback-for-Vala-0..patch \
> > diff --git a/meta-oe/recipes-core/musl-rpmatch/musl-rpmatch_git.bb
> b/meta-oe/recipes-core/musl-rpmatch/musl-rpmatch_git.bb
> > index 163a74ebe3..0bb45b8eaf 100644
> > --- a/meta-oe/recipes-core/musl-rpmatch/musl-rpmatch_git.bb
> > +++ b/meta-oe/recipes-core/musl-rpmatch/musl-rpmatch_git.bb
> > @@ -4,7 +4,7 @@ LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3D81a81bf31abecc50c20862fc8a716329"
> >
> >  SRC_URI =3D "gitsm://
> github.com/pullmoll/musl-rpmatch.git;protocol=3Dhttps;branch=3Dmaster"
> >
> > -PV =3D "1.0+git${SRCPV}"
> > +PV =3D "1.0+git"
> >  SRCREV =3D "46267b154987d3e1f25d3a75423faa62bb5ee342"
> >
> >  inherit autotools
> > diff --git a/meta-oe/recipes-core/opencl/opencl-clhpp_git.bb
> b/meta-oe/recipes-core/opencl/opencl-clhpp_git.bb
> > index 8a712602cc..7ae0362d37 100644
> > --- a/meta-oe/recipes-core/opencl/opencl-clhpp_git.bb
> > +++ b/meta-oe/recipes-core/opencl/opencl-clhpp_git.bb
> > @@ -6,7 +6,7 @@ SRC_URI =3D "git://
> github.com/KhronosGroup/OpenCL-CLHPP.git;protocol=3Dhttps;branch=3D
> >  LICENSE  =3D "Apache-2.0"
> >  LIC_FILES_CHKSUM =3D
> "file://LICENSE.txt;md5=3D3b83ef96387f14655fc854ddc3c6bd57"
> >
> > -PV =3D "2.0.16+git${SRCPV}"
> > +PV =3D "2.0.16+git"
> >  SRCREV =3D "1df82b9749739f2681081092ae163bb0f0d40f66"
> >
> >  S =3D "${WORKDIR}/git"
> > diff --git a/meta-oe/recipes-crypto/pkcs11-helper/
> pkcs11-helper_1.30.0.bb b/meta-oe/recipes-crypto/pkcs11-helper/
> pkcs11-helper_1.30.0.bb
> > index df6ca75461..d3922cf79e 100644
> > --- a/meta-oe/recipes-crypto/pkcs11-helper/pkcs11-helper_1.30.0.bb
> > +++ b/meta-oe/recipes-crypto/pkcs11-helper/pkcs11-helper_1.30.0.bb
> > @@ -20,7 +20,7 @@ SRC_URI =3D "git://
> github.com/OpenSC/${BPN}.git;branch=3Dmaster;protocol=3Dhttps
> <http://github.com/OpenSC/$%7BBPN%7D.git;branch=3Dmaster;protocol=3Dhttps=
>"
> >  S =3D "${WORKDIR}/git"
> >  # master
> >  SRCREV =3D "8bed16034f629a0361fa8ff89deed2b43dc45d8b"
> > -PV .=3D "+1.30.0+git${SRCPV}"
> > +PV .=3D "+1.30.0+git"
> >
> >  UPSTREAM_CHECK_GITTAGREGEX =3D "pkcs11-helper-(?P<pver>\d+(\.\d+)+)"
> >
> > diff --git a/meta-oe/recipes-devtools/apitrace/apitrace_11.1.bb
> b/meta-oe/recipes-devtools/apitrace/apitrace_11.1.bb
> > index aed7977595..d872c4dbb5 100644
> > --- a/meta-oe/recipes-devtools/apitrace/apitrace_11.1.bb
> > +++ b/meta-oe/recipes-devtools/apitrace/apitrace_11.1.bb
> > @@ -6,7 +6,7 @@ LIC_FILES_CHKSUM =3D
> "file://LICENSE;md5=3Daeb969185a143c3c25130bc2c3ef9a50 \
> >
> file://thirdparty/snappy/COPYING;md5=3Df62f3080324a97b3159a7a7e61812d0c"
> >
> >  SRCREV =3D "9352fc02bba106fbbeef9e8452ef34643c0d0764"
> > -PV .=3D "+11.1+git${SRCPV}"
> > +PV .=3D "+11.1+git"
> >  SRC_URI =3D "gitsm://
> github.com/${BPN}/${BPN}.git;branch=3Dmaster;protocol=3Dhttps
> <http://github.com/$%7BBPN%7D/$%7BBPN%7D.git;branch=3Dmaster;protocol=3Dh=
ttps>
> \
> >            "
> >
> > diff --git a/meta-oe/recipes-devtools/concurrencykit/
> concurrencykit_git.bb b/meta-oe/recipes-devtools/concurrencykit/
> concurrencykit_git.bb
> > index 277fac9f7c..47a3d88853 100644
> > --- a/meta-oe/recipes-devtools/concurrencykit/concurrencykit_git.bb
> > +++ b/meta-oe/recipes-devtools/concurrencykit/concurrencykit_git.bb
> > @@ -7,7 +7,7 @@ LICENSE =3D "BSD-2-Clause & Apache-2.0"
> >  HOMEPAGE =3D "http://concurrencykit.org"
> >  SECTION =3D "base"
> >
> > -PV =3D "0.7.0+git${SRCPV}"
> > +PV =3D "0.7.0+git"
> >  SRCREV =3D "6e8e5bec2e2f8cef2072a68579cbb07ababf3331"
> >  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Da0b24c1a8f9ad516a297d055b02=
94231"
> >  SRC_URI =3D "git://
> github.com/concurrencykit/ck.git;branch=3Dmaster;protocol=3Dhttps \
> > diff --git a/meta-oe/recipes-devtools/guider/guider_3.9.8.bb
> b/meta-oe/recipes-devtools/guider/guider_3.9.8.bb
> > index 15d43e9790..0d93297a07 100644
> > --- a/meta-oe/recipes-devtools/guider/guider_3.9.8.bb
> > +++ b/meta-oe/recipes-devtools/guider/guider_3.9.8.bb
> > @@ -5,7 +5,7 @@ BUGTRACKER =3D "https://github.com/iipeace/guider/issue=
s"
> >  LICENSE =3D "GPL-2.0-or-later"
> >  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D2c1c00f9d3ed9e24fa69b932b7e=
7aff2"
> >
> > -PV =3D "3.9.8+git${SRCPV}"
> > +PV =3D "3.9.8+git"
> >
> >  SRC_URI =3D "git://github.com/iipeace/${BPN};branch=3Dmaster;protocol=
=3Dhttps
> <http://github.com/iipeace/$%7BBPN%7D;branch=3Dmaster;protocol=3Dhttps>"
> >  SRCREV =3D "a502cd93b13235b7539557a91328de00b7c51bc3"
> > diff --git a/meta-oe/recipes-devtools/libubox/libubox_git.bb
> b/meta-oe/recipes-devtools/libubox/libubox_git.bb
> > index b2898c9c7f..39e18cdafd 100644
> > --- a/meta-oe/recipes-devtools/libubox/libubox_git.bb
> > +++ b/meta-oe/recipes-devtools/libubox/libubox_git.bb
> > @@ -20,7 +20,7 @@ SRC_URI =3D "\
> >  "
> >
> >  SRCREV =3D "07413cce72e19520af55dfcbc765484f5ab41dd9"
> > -PV =3D "1.0.1+git${SRCPV}"
> > +PV =3D "1.0.1+git"
> >
> >  S =3D "${WORKDIR}/git"
> >
> > diff --git a/meta-oe/recipes-devtools/lshw/lshw_02.20.bb
> b/meta-oe/recipes-devtools/lshw/lshw_02.20.bb
> > index 70ae38caa2..0fb68d8684 100644
> > --- a/meta-oe/recipes-devtools/lshw/lshw_02.20.bb
> > +++ b/meta-oe/recipes-devtools/lshw/lshw_02.20.bb
> > @@ -11,7 +11,7 @@ LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4263"
> >
> >  COMPATIBLE_HOST =3D "(i.86|x86_64|arm|aarch64|riscv64).*-linux"
> >
> > -PV .=3D "+git${SRCPV}"
> > +PV .=3D "+git"
> >  SRCREV =3D "4c6497c8b0a67cd9fa9693e9101a7cafd3297e81"
> >  SRC_URI =3D " \
> >      git://github.com/lyonel/lshw.git;protocol=3Dhttps;branch=3Dmaster =
\
> > diff --git a/meta-oe/recipes-devtools/ltrace/ltrace_git.bb
> b/meta-oe/recipes-devtools/ltrace/ltrace_git.bb
> > index d690dd4f02..63971970cf 100644
> > --- a/meta-oe/recipes-devtools/ltrace/ltrace_git.bb
> > +++ b/meta-oe/recipes-devtools/ltrace/ltrace_git.bb
> > @@ -10,7 +10,7 @@ LICENSE =3D "GPL-2.0-only"
> >  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Deb723b61539feef013de476e68b=
5c50a"
> >
> >  PE =3D "1"
> > -PV =3D "7.91+git${SRCPV}"
> > +PV =3D "7.91+git"
> >  SRCREV =3D "c22d359433b333937ee3d803450dc41998115685"
> >
> >  DEPENDS =3D "elfutils"
> > diff --git a/meta-oe/recipes-devtools/nlohmann-fifo/nlohmann-fifo_git.b=
b
> b/meta-oe/recipes-devtools/nlohmann-fifo/nlohmann-fifo_git.bb
> > index b5d05d40e5..36e46021bb 100644
> > --- a/meta-oe/recipes-devtools/nlohmann-fifo/nlohmann-fifo_git.bb
> > +++ b/meta-oe/recipes-devtools/nlohmann-fifo/nlohmann-fifo_git.bb
> > @@ -6,7 +6,7 @@ LIC_FILES_CHKSUM =3D
> "file://LICENSE.MIT;md5=3Db67209a1e36b682a8226de19d265b1e0"
> >
> >  SRC_URI =3D "git://
> github.com/nlohmann/fifo_map.git;branch=3Dmaster;protocol=3Dhttps"
> >
> > -PV =3D "1.0.0+git${SRCPV}"
> > +PV =3D "1.0.0+git"
> >
> >  SRCREV =3D "d732aaf9a315415ae8fd7eb11e3a4c1f80e42a48"
> >
> > diff --git a/meta-oe/recipes-devtools/openocd/openocd_git.bb
> b/meta-oe/recipes-devtools/openocd/openocd_git.bb
> > index 19ef987387..36cdb00f2b 100644
> > --- a/meta-oe/recipes-devtools/openocd/openocd_git.bb
> > +++ b/meta-oe/recipes-devtools/openocd/openocd_git.bb
> > @@ -17,7 +17,7 @@ SRCREV_git2cl =3D
> "8373c9f74993e218a08819cbcdbab3f3564bbeba"
> >  SRCREV_jimtcl =3D "fcbb4499a6b46ef69e7a95da53e30796e20817f0"
> >  SRCREV_libjaylink =3D "9aa7a5957c07bb6e862fc1a6d3153d109c7407e4"
> >
> > -PV =3D "0.12+gitr${SRCPV}"
> > +PV =3D "0.12+gitr"
> >  S =3D "${WORKDIR}/git"
> >
> >  inherit pkgconfig autotools-brokensep gettext
> > diff --git a/meta-oe/recipes-devtools/pmtools/pmtools_git.bb
> b/meta-oe/recipes-devtools/pmtools/pmtools_git.bb
> > index 56d895a099..ad149de12c 100644
> > --- a/meta-oe/recipes-devtools/pmtools/pmtools_git.bb
> > +++ b/meta-oe/recipes-devtools/pmtools/pmtools_git.bb
> > @@ -4,7 +4,7 @@ HOMEPAGE =3D "http://lesswatts.org/projects/acpi"
> >  LICENSE =3D "GPL-2.0-or-later"
> >  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D0636e73ff0215e8d672dc4c32c3=
17bb3"
> >
> > -PV =3D "20130209+git${SRCPV}"
> > +PV =3D "20130209+git"
> >
> >  SRC_URI =3D "git://
> github.com/anyc/pmtools.git;branch=3Dmaster;protocol=3Dhttps \
> >      file://pmtools-switch-to-dynamic-buffer-for-huge-ACPI-table.patch =
\
> > diff --git a/meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb
> b/meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb
> > index 65294fafad..8519479c4d 100644
> > --- a/meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb
> > +++ b/meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb
> > @@ -8,7 +8,7 @@ SRC_URI =3D "git://
> github.com/miloyip/rapidjson.git;branch=3Dmaster;protocol=3Dhttps"
> >
> >  SRCREV =3D "0ccdbf364c577803e2a751f5aededce935314313"
> >
> > -PV =3D "1.1.0+git${SRCPV}"
> > +PV =3D "1.1.0+git"
> >
> >  S =3D "${WORKDIR}/git"
> >
> > diff --git a/meta-oe/recipes-devtools/yasm/yasm_git.bb
> b/meta-oe/recipes-devtools/yasm/yasm_git.bb
> > index 26540b4295..079f805d6c 100644
> > --- a/meta-oe/recipes-devtools/yasm/yasm_git.bb
> > +++ b/meta-oe/recipes-devtools/yasm/yasm_git.bb
> > @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3Da12d8903508fb6bfd49d8d82c6170dd9"
> >  DEPENDS +=3D "flex-native bison-native"
> >  PACKAGECONFIG[docs] =3D ",,xmlto-native,"
> >
> > -PV =3D "1.3.0+git${SRCPV}"
> > +PV =3D "1.3.0+git"
> >  # v1.3.0
> >  SRCREV =3D "ba463d3c26c0ece2e797b8d6381b161633b5971a"
> >  SRC_URI =3D "git://github.com/yasm/yasm.git;branch=3Dmaster;protocol=
=3Dhttps
> \
> > diff --git a/meta-oe/recipes-extended/docopt.cpp/docopt.cpp_git.bb
> b/meta-oe/recipes-extended/docopt.cpp/docopt.cpp_git.bb
> > index 28db39ac20..3d438871ed 100644
> > --- a/meta-oe/recipes-extended/docopt.cpp/docopt.cpp_git.bb
> > +++ b/meta-oe/recipes-extended/docopt.cpp/docopt.cpp_git.bb
> > @@ -15,7 +15,7 @@ LIC_FILES_CHKSUM =3D "\
> >
> >  DEPENDS =3D "boost"
> >  SRCREV =3D "42ebcec9dc2c99a1b3a4542787572045763ad196"
> > -PV =3D "0.6.3+git${SRCPV}"
> > +PV =3D "0.6.3+git"
> >
> >  SRC_URI =3D "\
> >      git://github.com/docopt/docopt.cpp.git;protocol=3Dhttps;branch=3Dm=
aster
> \
> > diff --git a/meta-oe/recipes-extended/figlet/figlet_git.bb
> b/meta-oe/recipes-extended/figlet/figlet_git.bb
> > index 61b050aac6..9789ac16d4 100644
> > --- a/meta-oe/recipes-extended/figlet/figlet_git.bb
> > +++ b/meta-oe/recipes-extended/figlet/figlet_git.bb
> > @@ -8,7 +8,7 @@ SRC_URI =3D "git://
> github.com/cmatsuoka/figlet.git;branch=3Dmaster;protocol=3Dhttps \
> >
>  file://0001-build-add-autotools-support-to-allow-easy-cross-comp.patch"
> >  SRCREV =3D "5bbcd7383a8c3a531299b216b0c734e1495c6db3"
> >  S =3D "${WORKDIR}/git"
> > -PV =3D "2.2.5+git${SRCPV}"
> > +PV =3D "2.2.5+git"
> >
> >  inherit autotools
> >
> > diff --git a/meta-oe/recipes-extended/jpnevulator/jpnevulator_git.bb
> b/meta-oe/recipes-extended/jpnevulator/jpnevulator_git.bb
> > index 39d6459227..bfa0e79d8f 100644
> > --- a/meta-oe/recipes-extended/jpnevulator/jpnevulator_git.bb
> > +++ b/meta-oe/recipes-extended/jpnevulator/jpnevulator_git.bb
> > @@ -2,7 +2,7 @@ SUMMARY =3D "A handy serial sniffer"
> >  LICENSE =3D "GPL-2.0-only"
> >  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D892f569a555ba9c07a568a7c0c4=
fa63a"
> >
> > -PV =3D "2.3.6+git${SRCPV}"
> > +PV =3D "2.3.6+git"
> >
> >  SRC_URI =3D "git://
> github.com/snarlistic/jpnevulator.git;protocol=3Dhttps;branch=3Dmaster"
> >  SRCREV =3D "bc1d4f6587a4a4829b5d55e3ca7ad584da6de545"
> > diff --git a/meta-oe/recipes-extended/libbacktrace/libbacktrace_git.bb
> b/meta-oe/recipes-extended/libbacktrace/libbacktrace_git.bb
> > index 6f2ead9a8d..d540737bc9 100644
> > --- a/meta-oe/recipes-extended/libbacktrace/libbacktrace_git.bb
> > +++ b/meta-oe/recipes-extended/libbacktrace/libbacktrace_git.bb
> > @@ -10,7 +10,7 @@ DEPENDS +=3D "libunwind"
> >
> >  SRC_URI =3D "git://
> github.com/ianlancetaylor/libbacktrace;protocol=3Dhttps;branch=3Dmaster"
> >
> > -PV =3D "1.0+git${SRCPV}"
> > +PV =3D "1.0+git"
> >  SRCREV =3D "9ae4f4ae4481b1e69d38ed810980d33103544613"
> >
> >  S =3D "${WORKDIR}/git"
> > diff --git a/meta-oe/recipes-extended/libimobiledevice/libplist_git.bb
> b/meta-oe/recipes-extended/libimobiledevice/libplist_git.bb
> > index 6fbc28394f..26dd821f96 100644
> > --- a/meta-oe/recipes-extended/libimobiledevice/libplist_git.bb
> > +++ b/meta-oe/recipes-extended/libimobiledevice/libplist_git.bb
> > @@ -8,7 +8,7 @@ DEPENDS =3D "libxml2 glib-2.0 swig python3"
> >
> >  inherit autotools pkgconfig python3native python3targetconfig
> >
> > -PV =3D "2.3.0+git${SRCPV}"
> > +PV =3D "2.3.0+git"
> >
> >  SRCREV =3D "2cd858c679d25633077ca78b67182a9b77653816"
> >  SRC_URI =3D "git://
> github.com/libimobiledevice/libplist;protocol=3Dhttps;branch=3Dmaster"
> > diff --git a/meta-oe/recipes-extended/libimobiledevice/libusbmuxd_git.b=
b
> b/meta-oe/recipes-extended/libimobiledevice/libusbmuxd_git.bb
> > index 91a9b4af2c..b9f5c34094 100644
> > --- a/meta-oe/recipes-extended/libimobiledevice/libusbmuxd_git.bb
> > +++ b/meta-oe/recipes-extended/libimobiledevice/libusbmuxd_git.bb
> > @@ -7,7 +7,7 @@ DEPENDS =3D "udev libusb1 libplist libimobiledevice-glu=
e"
> >  inherit autotools pkgconfig gitpkgv
> >
> >  PKGV =3D "${GITPKGVTAG}"
> > -PV =3D "2.0.2+git${SRCPV}"
> > +PV =3D "2.0.2+git"
> >
> >  SRCREV =3D "36ffb7ab6e2a7e33bd1b56398a88895b7b8c615a"
> >  SRC_URI =3D "git://
> github.com/libimobiledevice/libusbmuxd;protocol=3Dhttps;branch=3Dmaster"
> > diff --git a/meta-oe/recipes-extended/libuio/libuio_0.2.1.bb
> b/meta-oe/recipes-extended/libuio/libuio_0.2.1.bb
> > index 65bf9ba647..6e6c8cc226 100644
> > --- a/meta-oe/recipes-extended/libuio/libuio_0.2.1.bb
> > +++ b/meta-oe/recipes-extended/libuio/libuio_0.2.1.bb
> > @@ -7,7 +7,7 @@ SRCREV =3D "17d96e8f9a5bce7cee5e2222855ab46a246dba51"
> >
> >  SRC_URI =3D "git://
> git.code.sf.net/p/libuio/code;branch=3Dmaster;protocol=3Dhttps"
> >
> > -PV .=3D "+0.2.2+git${SRCPV}"
> > +PV .=3D "+0.2.2+git"
> >
> >  inherit autotools
> >
> > diff --git a/meta-oe/recipes-extended/md5deep/md5deep_git.bb
> b/meta-oe/recipes-extended/md5deep/md5deep_git.bb
> > index b1a38cf6f2..5351a37db6 100644
> > --- a/meta-oe/recipes-extended/md5deep/md5deep_git.bb
> > +++ b/meta-oe/recipes-extended/md5deep/md5deep_git.bb
> > @@ -4,7 +4,7 @@ HOMEPAGE =3D "http://md5deep.sourceforge.net"
> >  LICENSE =3D "GPL-2.0-only"
> >  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D9190f660105b9a56cdb272309bf=
d5491"
> >
> > -PV =3D "4.4+git${SRCPV}"
> > +PV =3D "4.4+git"
> >
> >  SRCREV =3D "877613493ff44807888ce1928129574be393cbb0"
> >
> > diff --git a/meta-oe/recipes-extended/mraa/mraa_git.bb
> b/meta-oe/recipes-extended/mraa/mraa_git.bb
> > index 61f36d724d..37bd36432f 100644
> > --- a/meta-oe/recipes-extended/mraa/mraa_git.bb
> > +++ b/meta-oe/recipes-extended/mraa/mraa_git.bb
> > @@ -6,7 +6,7 @@ LICENSE =3D "MIT"
> >  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D91e7de50a8d3cf01057f318d724=
60acd"
> >
> >  SRCREV =3D "3c288a09109969eef9c2da7d92d3c62f92a015cc"
> > -PV =3D "2.2.0+git${SRCPV}"
> > +PV =3D "2.2.0+git"
> >
> >  SRC_URI =3D "git://
> github.com/eclipse/${BPN}.git;protocol=3Dhttps;branch=3Dmaster
> <http://github.com/eclipse/$%7BBPN%7D.git;protocol=3Dhttps;branch=3Dmaste=
r> \
> >
>  file://0001-cmake-Use-a-regular-expression-to-match-x86-architec.patch \
> > diff --git a/meta-oe/recipes-extended/p8platform/p8platform_git.bb
> b/meta-oe/recipes-extended/p8platform/p8platform_git.bb
> > index bb9574feb2..dc7280f099 100644
> > --- a/meta-oe/recipes-extended/p8platform/p8platform_git.bb
> > +++ b/meta-oe/recipes-extended/p8platform/p8platform_git.bb
> > @@ -4,7 +4,7 @@ HOMEPAGE =3D "http://libcec.pulse-eight.com/"
> >  LICENSE =3D "GPL-2.0-or-later"
> >  LIC_FILES_CHKSUM =3D
> "file://src/os.h;md5=3D752555fa94e82005d45fd201fee5bd33"
> >
> > -PV =3D "2.1.0.1+git${SRCPV}"
> > +PV =3D "2.1.0.1+git"
> >
> >  SRC_URI =3D "git://
> github.com/Pulse-Eight/platform.git;branch=3Dmaster;protocol=3Dhttps"
> >  SRCREV =3D "a7cd0d5780ed80a4e70480d1650749f29e8a1fb2"
> > diff --git a/meta-oe/recipes-extended/properties-cpp/
> properties-cpp_git.bb b/meta-oe/recipes-extended/properties-cpp/
> properties-cpp_git.bb
> > index 88a18aa137..25951c9de4 100644
> > --- a/meta-oe/recipes-extended/properties-cpp/properties-cpp_git.bb
> > +++ b/meta-oe/recipes-extended/properties-cpp/properties-cpp_git.bb
> > @@ -6,7 +6,7 @@ SECTION =3D "libs"
> >  LICENSE =3D "LGPL-3.0-only"
> >  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3De6a600fd5e1d9cbde2d98368023=
3ad02"
> >
> > -PV =3D "0.0.1+git${SRCPV}"
> > +PV =3D "0.0.1+git"
> >
> >  SRCREV =3D "45863e849b39c4921d6553e6d27e267a96ac7d77"
> >  SRC_URI =3D "git://
> github.com/lib-cpp/${BPN}.git;branch=3Dmaster;protocol=3Dhttps
> <http://github.com/lib-cpp/$%7BBPN%7D.git;branch=3Dmaster;protocol=3Dhttp=
s>"
> > diff --git a/meta-oe/recipes-extended/qad/qad_git.bb
> b/meta-oe/recipes-extended/qad/qad_git.bb
> > index 056f28a0a4..0bc94121a7 100644
> > --- a/meta-oe/recipes-extended/qad/qad_git.bb
> > +++ b/meta-oe/recipes-extended/qad/qad_git.bb
> > @@ -15,7 +15,7 @@ SRC_URI =3D "git://
> gitlab.com/CodethinkLabs/qad/qad;branch=3Dmain;protocol=3Dhttps \
> >  SRCREV =3D "ae0c099c1fdc0ca6f5d631cea6b302937122b362"
> >
> >  S =3D "${WORKDIR}/git"
> > -PV =3D "0.0+git${SRCPV}"
> > +PV =3D "0.0+git"
> >
> >  DEPENDS =3D "cjson libmicrohttpd libdrm libpng"
> >
> > diff --git a/meta-oe/recipes-extended/qcbor/qcbor_git.bb
> b/meta-oe/recipes-extended/qcbor/qcbor_git.bb
> > index 9c562d5a66..a87454fa95 100644
> > --- a/meta-oe/recipes-extended/qcbor/qcbor_git.bb
> > +++ b/meta-oe/recipes-extended/qcbor/qcbor_git.bb
> > @@ -12,7 +12,7 @@ SRC_URI =3D "git://
> github.com/laurencelundblade/QCBOR;protocol=3Dhttps;branch=3Dmaster
> >
> >  SRCREV =3D "44754f738c6534a4304a83d4c6e97b3d3193d887"
> >
> > -PV =3D "1.2+git${SRCPV}"
> > +PV =3D "1.2+git"
> >
> >  S =3D "${WORKDIR}/git"
> >
> > diff --git a/meta-oe/recipes-extended/sanlock/sanlock_3.9.0.bb
> b/meta-oe/recipes-extended/sanlock/sanlock_3.9.0.bb
> > index fa1c6c7ecd..a5a3b43feb 100644
> > --- a/meta-oe/recipes-extended/sanlock/sanlock_3.9.0.bb
> > +++ b/meta-oe/recipes-extended/sanlock/sanlock_3.9.0.bb
> > @@ -11,7 +11,7 @@ SECTION =3D "utils"
> >  LICENSE =3D "LGPL-2.0-or-later & GPL-2.0-only & GPL-2.0-or-later"
> >  LIC_FILES_CHKSUM =3D
> "file://README.license;md5=3D60487bf0bf429d6b5aa72b6d37a0eb22"
> >
> > -PV .=3D "+git${SRCPV}"
> > +PV .=3D "+git"
> >
> >  SRC_URI =3D "git://pagure.io/sanlock.git;protocol=3Dhttp;branch=3Dmast=
er \
> >
>  file://0001-sanlock-Replace-cp-a-with-cp-R-no-dereference-preser.patch \
> > diff --git a/meta-oe/recipes-extended/socketcan/can-isotp_git.bb
> b/meta-oe/recipes-extended/socketcan/can-isotp_git.bb
> > index 993efab395..a60b55e7e7 100644
> > --- a/meta-oe/recipes-extended/socketcan/can-isotp_git.bb
> > +++ b/meta-oe/recipes-extended/socketcan/can-isotp_git.bb
> > @@ -1,7 +1,7 @@
> >  LICENSE =3D "GPL-2.0-only"
> >  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D72d977d697c3c05830fdff00a74=
48931"
> >  SRCREV =3D "beb4650660179963a8ed5b5cbf2085cc1b34f608"
> > -PV =3D "1.0+git${SRCPV}"
> > +PV =3D "1.0+git"
> >
> >  SRC_URI =3D "git://
> github.com/hartkopp/can-isotp.git;protocol=3Dhttps;branch=3Dmaster"
> >
> > diff --git a/meta-oe/recipes-extended/tipcutils/tipcutils_git.bb
> b/meta-oe/recipes-extended/tipcutils/tipcutils_git.bb
> > index fc64ec0fcb..596aa260e7 100644
> > --- a/meta-oe/recipes-extended/tipcutils/tipcutils_git.bb
> > +++ b/meta-oe/recipes-extended/tipcutils/tipcutils_git.bb
> > @@ -9,7 +9,7 @@ SRC_URI =3D "git://
> git.code.sf.net/p/tipc/tipcutils;branch=3Dmaster \
> >
>  file://0001-test-ptts-Set-recv-buffer-size-too-max-to-receive-as.patch \
> >             "
> >  SRCREV =3D "7ab2211b87414ba240b0b2e4af219c1057c9cf9a"
> > -PV =3D "2.2.0+git${SRCPV}"
> > +PV =3D "2.2.0+git"
> >
> >  inherit autotools pkgconfig
> >
> > diff --git a/meta-oe/recipes-extended/triggerhappy/triggerhappy_git.bb
> b/meta-oe/recipes-extended/triggerhappy/triggerhappy_git.bb
> > index 3a3dd192be..0b14f9557a 100644
> > --- a/meta-oe/recipes-extended/triggerhappy/triggerhappy_git.bb
> > +++ b/meta-oe/recipes-extended/triggerhappy/triggerhappy_git.bb
> > @@ -6,7 +6,7 @@ LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3Dd32239bcb673463ab874e80d47fae504"
> >
> >  # matches debian/0.5.0-1 tag
> >  SRCREV =3D "44a173195986d0d853316cb02a58785ded66c12b"
> > -PV =3D "0.5.0+git${SRCPV}"
> > +PV =3D "0.5.0+git"
> >  SRC_URI =3D "git://
> github.com/wertarbyte/${BPN}.git;branch=3Ddebian;protocol=3Dhttps
> <http://github.com/wertarbyte/$%7BBPN%7D.git;branch=3Ddebian;protocol=3Dh=
ttps>
> "
> >
> >  S =3D "${WORKDIR}/git"
> > diff --git a/meta-oe/recipes-extended/upm/upm_git.bb
> b/meta-oe/recipes-extended/upm/upm_git.bb
> > index a86f4a80d8..8468ff775d 100644
> > --- a/meta-oe/recipes-extended/upm/upm_git.bb
> > +++ b/meta-oe/recipes-extended/upm/upm_git.bb
> > @@ -8,7 +8,7 @@ LIC_FILES_CHKSUM =3D
> "file://LICENSE;md5=3D66493d54e65bfc12c7983ff2e884f37f"
> >  DEPENDS =3D "libjpeg-turbo mraa python3-setuptools-native"
> >
> >  SRCREV =3D "5cf20df96c6b35c19d5b871ba4e319e96b4df72d"
> > -PV =3D "2.0.0+git${SRCPV}"
> > +PV =3D "2.0.0+git"
> >
> >  SRC_URI =3D "git://
> github.com/eclipse/${BPN}.git;protocol=3Dhttps;branch=3Dmaster
> <http://github.com/eclipse/$%7BBPN%7D.git;protocol=3Dhttps;branch=3Dmaste=
r> \
> >
>  file://0001-CMakeLists.txt-Use-SWIG_SUPPORT_FILES-to-find-the-li.patch \
> > diff --git a/meta-oe/recipes-extended/zsync/zsync-curl_git.bb
> b/meta-oe/recipes-extended/zsync/zsync-curl_git.bb
> > index 84593387d3..1bc4010f8a 100644
> > --- a/meta-oe/recipes-extended/zsync/zsync-curl_git.bb
> > +++ b/meta-oe/recipes-extended/zsync/zsync-curl_git.bb
> > @@ -10,7 +10,7 @@ SRC_URI =3D "git://
> github.com/probonopd/zsync-curl;protocol=3Dhttps;branch=3Dmaster \
> >             file://make.patch"
> >  SRCREV =3D "00141c2806ccc4ddf2ff6263ee1612d19c0b713f"
> >
> > -PV =3D "0.6.2+git${SRCPV}"
> > +PV =3D "0.6.2+git"
> >
> >  inherit autotools
> >
> > diff --git a/meta-oe/recipes-graphics/aml/aml_git.bb
> b/meta-oe/recipes-graphics/aml/aml_git.bb
> > index eed62adae0..2633e0d215 100644
> > --- a/meta-oe/recipes-graphics/aml/aml_git.bb
> > +++ b/meta-oe/recipes-graphics/aml/aml_git.bb
> > @@ -8,7 +8,7 @@ SRC_URI =3D "git://
> github.com/any1/aml;branch=3Dmaster;protocol=3Dhttps"
> >
> >  SRCREV =3D "b83f3576ce4187d9285f06e9066ef43a691464d4"
> >
> > -PV =3D "0.3.0+git${SRCPV}"
> > +PV =3D "0.3.0+git"
> >
> >  S =3D "${WORKDIR}/git"
> >
> > diff --git a/meta-oe/recipes-graphics/fbida/fbida_git.bb
> b/meta-oe/recipes-graphics/fbida/fbida_git.bb
> > index 65c9041a3b..247a1fcbb2 100644
> > --- a/meta-oe/recipes-graphics/fbida/fbida_git.bb
> > +++ b/meta-oe/recipes-graphics/fbida/fbida_git.bb
> > @@ -9,7 +9,7 @@ LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3De8feb78a32950a909621bbb51f634b39"
> >
> >  DEPENDS =3D "virtual/libiconv jpeg fontconfig freetype libexif libdrm
> pixman udev libinput cairo"
> >
> > -PV =3D "2.14+git${SRCPV}"
> > +PV =3D "2.14+git"
> >  SRC_URI =3D "git://github.com/kraxel/fbida;protocol=3Dhttps;branch=3Dm=
aster \
> >             file://fix-preprocessor.patch \
> >             file://support-jpeg-turbo.patch \
> > diff --git a/meta-oe/recipes-graphics/glm/glm_0.9.9.8.bb
> b/meta-oe/recipes-graphics/glm/glm_0.9.9.8.bb
> > index 3797314b47..dd520b245e 100644
> > --- a/meta-oe/recipes-graphics/glm/glm_0.9.9.8.bb
> > +++ b/meta-oe/recipes-graphics/glm/glm_0.9.9.8.bb
> > @@ -18,7 +18,7 @@ SRC_URI =3D " \
> >      file://glmTargets.cmake \
> >  "
> >  SRCREV =3D "efec5db081e3aad807d0731e172ac597f6a39447"
> > -PV .=3D "+0.9.9.9+git${SRCPV}"
> > +PV .=3D "+0.9.9.9+git"
> >
> >  S =3D "${WORKDIR}/git"
> >
> > diff --git a/meta-oe/recipes-graphics/openbox/obconf_git.bb
> b/meta-oe/recipes-graphics/openbox/obconf_git.bb
> > index efffd962d4..1210af70ea 100644
> > --- a/meta-oe/recipes-graphics/openbox/obconf_git.bb
> > +++ b/meta-oe/recipes-graphics/openbox/obconf_git.bb
> > @@ -8,7 +8,7 @@ DEPENDS =3D " \
> >      startup-notification \
> >      gtk+3 \
> >  "
> > -PV =3D "2.0.4+git${SRCPV}"
> > +PV =3D "2.0.4+git"
> >
> >  SRCREV =3D "63ec47c5e295ad4f09d1df6d92afb7e10c3fec39"
> >  SRC_URI =3D " \
> > diff --git a/meta-oe/recipes-graphics/parallel-deqp-runner/
> parallel-deqp-runner_git.bb
> b/meta-oe/recipes-graphics/parallel-deqp-runner/
> parallel-deqp-runner_git.bb
> > index eff6ad8f83..2ec89bc05b 100644
> > --- a/meta-oe/recipes-graphics/parallel-deqp-runner/
> parallel-deqp-runner_git.bb
> > +++ b/meta-oe/recipes-graphics/parallel-deqp-runner/
> parallel-deqp-runner_git.bb
> > @@ -7,7 +7,7 @@ SRC_URI =3D "git://
> gitlab.freedesktop.org/mesa/parallel-deqp-runner.git;protocol=3Dh
> >             "
> >
> >  # Modify these as desired
> > -PV =3D "2020.06.15+git${SRCPV}"
> > +PV =3D "2020.06.15+git"
> >  SRCREV =3D "e1642fb691d29b1462504b58916f7f514a963e80"
> >
> >  S =3D "${WORKDIR}/git"
> > diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-droid_git.bb
> b/meta-oe/recipes-graphics/ttf-fonts/ttf-droid_git.bb
> > index 7fa155a22f..119612cd73 100644
> > --- a/meta-oe/recipes-graphics/ttf-fonts/ttf-droid_git.bb
> > +++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-droid_git.bb
> > @@ -5,7 +5,7 @@ HOMEPAGE =3D "http://www.droidfonts.com/"
> >  LICENSE =3D "Apache-2.0"
> >  LIC_FILES_CHKSUM =3D
> "file://README.txt;md5=3D83544262a86f1f1ec761e75897df92bc"
> >  SRCREV =3D "21e6e2de1f0062f949fcc52d0b4559dfa3246e0e"
> > -PV =3D "0.1+gitr${SRCPV}"
> > +PV =3D "0.1+gitr"
> >  PR =3D "r3"
> >
> >  SRC_URI =3D "git://
> github.com/android/platform_frameworks_base.git;branch=3Dmaster;protocol=
=3Dhttps
> "
> > diff --git a/meta-oe/recipes-graphics/x11vnc/x11vnc_0.9.16.bb
> b/meta-oe/recipes-graphics/x11vnc/x11vnc_0.9.16.bb
> > index 3633bbc26b..74f80e1844 100644
> > --- a/meta-oe/recipes-graphics/x11vnc/x11vnc_0.9.16.bb
> > +++ b/meta-oe/recipes-graphics/x11vnc/x11vnc_0.9.16.bb
> > @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4263 \
> >
> file://src/x11vnc.h;endline=3D31;md5=3De871a2ad004776794b616822dcab6314"
> >
> >  SRCREV =3D "87cd0530f438372dda3c70bb491a6fd19f09acc2"
> > -PV .=3D "+git${SRCPV}"
> > +PV .=3D "+git"
> >
> >  SRC_URI =3D "git://github.com/LibVNC/x11vnc;branch=3Dmaster;protocol=
=3Dhttps
> \
> >             file://starting-fix.patch \
> > diff --git a/meta-oe/recipes-multimedia/faad2/faad2_2.11.1.bb
> b/meta-oe/recipes-multimedia/faad2/faad2_2.11.1.bb
> > index 76e8f72c4f..bec9b75ebd 100644
> > --- a/meta-oe/recipes-multimedia/faad2/faad2_2.11.1.bb
> > +++ b/meta-oe/recipes-multimedia/faad2/faad2_2.11.1.bb
> > @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3D381c8cbe277a7bc1ee2ae6083a04c958"
> >
> >  LICENSE_FLAGS =3D "commercial"
> >
> > -PV .=3D "+git${SRCPV}"
> > +PV .=3D "+git"
> >
> >  SRC_URI =3D "git://
> github.com/knik0/faad2.git;branch=3Dmaster;protocol=3Dhttps"
> >  SRCREV =3D "216f00e8ddba6f2c64caf481a04f1ddd78b93e78"
> > diff --git a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.26.1.bb
> b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.26.1.bb
> > index 594b51b439..52759ef18e 100644
> > --- a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.26.1.bb
> > +++ b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.26.1.bb
> > @@ -32,7 +32,7 @@ SRC_URI =3D "\
> >
> >  SRCREV =3D "4aee01a027923cab1e40969f56f8ba58d3e6c0d1"
> >
> > -PV .=3D "+git${SRCPV}"
> > +PV .=3D "+git"
> >
> >  S =3D "${WORKDIR}/git"
> >
> > diff --git a/meta-oe/recipes-support/ace-cloud-editor/
> ace-cloud-editor_git.bb b/meta-oe/recipes-support/ace-cloud-editor/
> ace-cloud-editor_git.bb
> > index 746d4182a9..6d64ab71bf 100644
> > --- a/meta-oe/recipes-support/ace-cloud-editor/ace-cloud-editor_git.bb
> > +++ b/meta-oe/recipes-support/ace-cloud-editor/ace-cloud-editor_git.bb
> > @@ -6,7 +6,7 @@ LIC_FILES_CHKSUM =3D
> "file://LICENSE;md5=3D794d11c5219c59c9efa2487c2b4066b2"
> >
> >  SRC_URI =3D "git://
> github.com/ajaxorg/ace-builds.git;protocol=3Dhttps;branch=3Dmaster"
> >
> > -PV =3D "02.07.17+git${SRCPV}"
> > +PV =3D "02.07.17+git"
> >  SRCREV =3D "812e2c56aed246931a667f16c28b096e34597016"
> >
> >  FILES:${PN} =3D "${datadir}/ace-builds"
> > diff --git a/meta-oe/recipes-support/cli11/cli11_2.3.2.bb
> b/meta-oe/recipes-support/cli11/cli11_2.3.2.bb
> > index 7c6b2547cb..ef3c951bbf 100644
> > --- a/meta-oe/recipes-support/cli11/cli11_2.3.2.bb
> > +++ b/meta-oe/recipes-support/cli11/cli11_2.3.2.bb
> > @@ -4,7 +4,7 @@ HOMEPAGE =3D "https://github.com/CLIUtils/CLI11"
> >  LICENSE =3D "BSD-3-Clause"
> >  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dafb20fe5f67e21074b10b864d95=
63c11"
> >  SRCREV =3D "291c58789c031208f08f4f261a858b5b7083e8e2"
> > -PV .=3D "+git${SRCPV}"
> > +PV .=3D "+git"
> >
> >  SRC_URI +=3D "gitsm://
> github.com/CLIUtils/CLI11;branch=3Dmain;protocol=3Dhttps \
> >
> https://github.com/philsquared/Catch/releases/download/v2.13.7/catch.hpp =
\
> > diff --git a/meta-oe/recipes-support/edid-decode/edid-decode_git.bb
> b/meta-oe/recipes-support/edid-decode/edid-decode_git.bb
> > index 48b52eefca..bb8c9de71d 100644
> > --- a/meta-oe/recipes-support/edid-decode/edid-decode_git.bb
> > +++ b/meta-oe/recipes-support/edid-decode/edid-decode_git.bb
> > @@ -8,7 +8,7 @@ LIC_FILES_CHKSUM =3D
> "file://LICENSE;md5=3D2ef696d66c156139232201f223c22592"
> >
> >  SRC_URI=3D "git://
> git.linuxtv.org/edid-decode.git;protocol=3Dhttps;branch=3Dmaster"
> >  SRCREV =3D "5920bf2a756b2f748c49ff6a08b9f421026473c5"
> > -PV =3D "0.0+git${SRCPV}"
> > +PV =3D "0.0+git"
> >  S =3D "${WORKDIR}/git"
> >
> >  do_install() {
> > diff --git a/meta-oe/recipes-support/evemu-tools/evemu-tools_git.bb
> b/meta-oe/recipes-support/evemu-tools/evemu-tools_git.bb
> > index 4501b082de..b8cd1f620a 100644
> > --- a/meta-oe/recipes-support/evemu-tools/evemu-tools_git.bb
> > +++ b/meta-oe/recipes-support/evemu-tools/evemu-tools_git.bb
> > @@ -11,7 +11,7 @@ SRCREV =3D "86a5627dbeac8d9d9bc34326a758d6a477e876e4"
> >  SRC_URI =3D "git://
> git@gitlab.freedesktop.org/libevdev/evemu.git;protocol=3Dhttps;branch=3Dm=
aster
> "
> >
> >  S =3D "${WORKDIR}/git"
> > -PV =3D "gitr${SRCPV}"
> > +PV =3D "gitr"
> >
> >  inherit autotools pkgconfig
> >
> > diff --git a/meta-oe/recipes-support/function2/function2_4.2.4.bb
> b/meta-oe/recipes-support/function2/function2_4.2.4.bb
> > index 2748b84f7c..98d05f6e25 100644
> > --- a/meta-oe/recipes-support/function2/function2_4.2.4.bb
> > +++ b/meta-oe/recipes-support/function2/function2_4.2.4.bb
> > @@ -4,7 +4,7 @@ HOMEPAGE =3D "https://naios.github.io/function2"
> >  LICENSE =3D "BSL-1.0"
> >  LIC_FILES_CHKSUM =3D
> "file://LICENSE.txt;md5=3De4224ccaecb14d942c71d31bef20d78c"
> >  SRCREV =3D "a354bd093d2b6e50c9325dbce84d20b4e77aabc6"
> > -PV .=3D "+git${SRCPV}"
> > +PV .=3D "+git"
> >
> >  SRC_URI +=3D "gitsm://
> github.com/Naios/function2;branch=3Dmaster;protocol=3Dhttps"
> >
> > diff --git a/meta-oe/recipes-support/hunspell/hunspell-dictionaries.bb
> b/meta-oe/recipes-support/hunspell/hunspell-dictionaries.bb
> > index 047acf28db..0ec426afb9 100644
> > --- a/meta-oe/recipes-support/hunspell/hunspell-dictionaries.bb
> > +++ b/meta-oe/recipes-support/hunspell/hunspell-dictionaries.bb
> > @@ -133,7 +133,7 @@ LIC_FILES_CHKSUM =3D " \
> >
> >  RDEPENDS:${PN} =3D "hunspell"
> >
> > -PV =3D "0.0.0+git${SRCPV}"
> > +PV =3D "0.0.0+git"
> >  SRCREV =3D "820a65e539e34a3a8c2a855d2450b84745c624ee"
> >  SRC_URI =3D "git://
> github.com/wooorm/dictionaries.git;branch=3Dmaster;protocol=3Dhttps"
> >
> > diff --git a/meta-oe/recipes-support/idevicerestore/
> idevicerestore_git.bb b/meta-oe/recipes-support/idevicerestore/
> idevicerestore_git.bb
> > index 3dbd8db63f..8218b08084 100644
> > --- a/meta-oe/recipes-support/idevicerestore/idevicerestore_git.bb
> > +++ b/meta-oe/recipes-support/idevicerestore/idevicerestore_git.bb
> > @@ -8,7 +8,7 @@ HOMEPAGE =3D "http://www.libimobiledevice.org/"
> >
> >  DEPENDS =3D "libirecovery libimobiledevice libzip curl
> libimobiledevice-glue openssl"
> >
> > -PV =3D "1.0.1+git${SRCPV}"
> > +PV =3D "1.0.1+git"
> >
> >  SRCREV =3D "ecae6c6e8ca6b6bad080a1c73f10ffd0e67d75a7"
> >  SRC_URI =3D "git://
> github.com/libimobiledevice/idevicerestore;protocol=3Dhttps;branch=3Dmast=
er"
> > diff --git a/meta-oe/recipes-support/iksemel/iksemel_1.5.bb
> b/meta-oe/recipes-support/iksemel/iksemel_1.5.bb
> > index e01c0897bb..017e7d26a6 100644
> > --- a/meta-oe/recipes-support/iksemel/iksemel_1.5.bb
> > +++ b/meta-oe/recipes-support/iksemel/iksemel_1.5.bb
> > @@ -5,7 +5,7 @@ LICENSE =3D "LGPL-2.1-only"
> >  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd8045f3b8f929c1cb29a1e3fd73=
7b499"
> >
> >  SRCREV =3D "978b733462e41efd5db72bc9974cb3b0d1d5f6fa"
> > -PV =3D "1.5+git${SRCPV}"
> > +PV =3D "1.5+git"
> >
> >  SRC_URI =3D "git://
> github.com/meduketto/iksemel.git;protocol=3Dhttps;branch=3Dmaster \
> >             file://fix-configure-option-parsing.patch \
> > diff --git a/meta-oe/recipes-support/iniparser/iniparser_4.1.bb
> b/meta-oe/recipes-support/iniparser/iniparser_4.1.bb
> > index 5e42cdcb06..c80668d279 100644
> > --- a/meta-oe/recipes-support/iniparser/iniparser_4.1.bb
> > +++ b/meta-oe/recipes-support/iniparser/iniparser_4.1.bb
> > @@ -6,7 +6,7 @@ LIC_FILES_CHKSUM =3D
> "file://LICENSE;md5=3De02baf71c76e0650e667d7da133379ac"
> >
> >  DEPENDS =3D "doxygen-native"
> >
> > -PV .=3D "+git${SRCPV}"
> > +PV .=3D "+git"
> >
> >  SRC_URI =3D "git://
> github.com/ndevilla/iniparser.git;protocol=3Dhttps;branch=3Dmaster \
> >             file://0001-iniparser.pc-Make-libpath-a-variable.patch \
> > diff --git a/meta-oe/recipes-support/libb64/libb64_2.0.0.1.bb
> b/meta-oe/recipes-support/libb64/libb64_2.0.0.1.bb
> > index 6a1e7b75e1..e0683b177b 100644
> > --- a/meta-oe/recipes-support/libb64/libb64_2.0.0.1.bb
> > +++ b/meta-oe/recipes-support/libb64/libb64_2.0.0.1.bb
> > @@ -6,7 +6,7 @@ HOMEPAGE =3D "https://github.com/libb64"
> >  LICENSE =3D "PD"
> >  LIC_FILES_CHKSUM =3D
> "file://LICENSE.md;md5=3D81296a564fa0621472714aae7c763d96"
> >
> > -PV .=3D "+2.0.0.2+git${SRCPV}"
> > +PV .=3D "+2.0.0.2+git"
> >  SRCREV =3D "ce864b17ea0e24a91e77c7dd3eb2d1ac4175b3f0"
> >
> >  SRC_URI =3D "git://github.com/libb64/libb64;protocol=3Dhttps;branch=3D=
master
> \
> > diff --git a/meta-oe/recipes-support/libcereal/libcereal_1.3.2.bb
> b/meta-oe/recipes-support/libcereal/libcereal_1.3.2.bb
> > index c5f26ecb4e..e100265f7d 100644
> > --- a/meta-oe/recipes-support/libcereal/libcereal_1.3.2.bb
> > +++ b/meta-oe/recipes-support/libcereal/libcereal_1.3.2.bb
> > @@ -16,7 +16,7 @@ DEPENDS =3D " ${@bb.utils.contains('DISTRO_FEATURES',
> 'ptest', 'boost', '', d)} "
> >
> >  PROVIDES +=3D "${PN}-dev"
> >
> > -PV .=3D "+git${SRCPV}"
> > +PV .=3D "+git"
> >  SRCREV =3D "ebef1e929807629befafbb2918ea1a08c7194554"
> >  SRC_URI =3D "git://
> github.com/USCiLab/cereal.git;branch=3Dmaster;protocol=3Dhttps \
> >
>  file://0001-sandbox-Do-not-use-int8_t-in-std-uniform_int_distrib.patch \
> > diff --git a/meta-oe/recipes-support/libcyusbserial/
> libcyusbserial_git.bb b/meta-oe/recipes-support/libcyusbserial/
> libcyusbserial_git.bb
> > index a69194996b..dd7f457b10 100644
> > --- a/meta-oe/recipes-support/libcyusbserial/libcyusbserial_git.bb
> > +++ b/meta-oe/recipes-support/libcyusbserial/libcyusbserial_git.bb
> > @@ -5,7 +5,7 @@ LICENSE =3D "LGPL-2.1-only"
> >  LIC_FILES_CHKSUM =3D
> "file://COPYING.LESSER.txt;md5=3D4fbd65380cdd255951079008b364516c"
> >  DEPENDS =3D "libusb udev"
> >
> > -PV =3D "1.0.0+git${SRCPV}"
> > +PV =3D "1.0.0+git"
> >
> >  SRCREV =3D "655e2d544183d094f0e2d119c7e0c6206a0ddb3f"
> >  SRC_URI =3D "git://
> github.com/cyrozap/${BPN}.git;branch=3Dmaster;protocol=3Dhttps
> <http://github.com/cyrozap/$%7BBPN%7D.git;branch=3Dmaster;protocol=3Dhttp=
s> \
> > diff --git a/meta-oe/recipes-support/libfann/libfann_git.bb
> b/meta-oe/recipes-support/libfann/libfann_git.bb
> > index 2f52a0f3bd..40f91ac43d 100644
> > --- a/meta-oe/recipes-support/libfann/libfann_git.bb
> > +++ b/meta-oe/recipes-support/libfann/libfann_git.bb
> > @@ -12,7 +12,7 @@ SRCREV ?=3D "7ec1fc7e5bd734f1d3c89b095e630e83c86b9be1=
"
> >  SRC_URI =3D "git://
> github.com/libfann/fann.git;branch=3Dmaster;protocol=3Dhttps \
> >            "
> >
> > -PV =3D "2.2.0+git${SRCPV}"
> > +PV =3D "2.2.0+git"
> >
> >  S =3D "${WORKDIR}/git"
> >
> > diff --git a/meta-oe/recipes-support/libusbgx/libusbgx_git.bb
> b/meta-oe/recipes-support/libusbgx/libusbgx_git.bb
> > index 7998b0c155..f8ebcc7767 100644
> > --- a/meta-oe/recipes-support/libusbgx/libusbgx_git.bb
> > +++ b/meta-oe/recipes-support/libusbgx/libusbgx_git.bb
> > @@ -5,7 +5,7 @@ LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4263 \
> >
> >  inherit autotools pkgconfig systemd update-rc.d update-alternatives
> >
> > -PV =3D "0.2.0+git${SRCPV}"
> > +PV =3D "0.2.0+git"
> >  SRCREV =3D "721e3a1cbd7e2b6361bb439d3959e7403e4f0092"
> >  SRCBRANCH =3D "master"
> >  SRC_URI =3D " \
> > diff --git a/meta-oe/recipes-support/lio-utils/lio-utils_4.1.bb
> b/meta-oe/recipes-support/lio-utils/lio-utils_4.1.bb
> > index 48be8dfa96..844e5acf90 100644
> > --- a/meta-oe/recipes-support/lio-utils/lio-utils_4.1.bb
> > +++ b/meta-oe/recipes-support/lio-utils/lio-utils_4.1.bb
> > @@ -4,7 +4,7 @@ HOMEPAGE =3D "http://linux-iscsi.org/index.php/Lio-util=
s"
> >  LICENSE =3D "GPL-2.0-only"
> >  LIC_FILES_CHKSUM =3D
> "file://debian/copyright;md5=3Dc3ea231a32635cbb5debedf3e88aa3df"
> >
> > -PV =3D "4.1+git${SRCPV}"
> > +PV =3D "4.1+git"
> >
> >  SRC_URI =3D "git://
> github.com/Datera/lio-utils.git;branch=3Dmaster;protocol=3Dhttps \
> >
>  file://0001-Makefiles-Respect-environment-variables-and-add-LDFL.patch \
> > diff --git a/meta-oe/recipes-support/mcelog/mce-test_git.bb
> b/meta-oe/recipes-support/mcelog/mce-test_git.bb
> > index fd302db897..05e98e86ed 100644
> > --- a/meta-oe/recipes-support/mcelog/mce-test_git.bb
> > +++ b/meta-oe/recipes-support/mcelog/mce-test_git.bb
> > @@ -15,7 +15,7 @@ SRC_URI =3D "git://
> git.kernel.org/pub/scm/utils/cpu/mce/mce-test.git;protocol=3Dgit;
> >
>  file://0001-gcov_merge.py-scov_merge.py-switch-to-python3.patch \
> >            "
> >  SRCREV =3D "025014dedca39d2b8a57a82e52286e72e157d73a"
> > -PV =3D "20222810+git${SRCPV}"
> > +PV =3D "20222810+git"
> >
> >  RDEPENDS:${PN} =3D "mcelog mce-inject dialog bash"
> >
> > diff --git a/meta-oe/recipes-support/ne10/ne10_1.2.1.bb
> b/meta-oe/recipes-support/ne10/ne10_1.2.1.bb
> > index 5193df3174..21ef9fdc3b 100644
> > --- a/meta-oe/recipes-support/ne10/ne10_1.2.1.bb
> > +++ b/meta-oe/recipes-support/ne10/ne10_1.2.1.bb
> > @@ -11,7 +11,7 @@ SRC_URI =3D "git://
> github.com/projectNe10/Ne10.git;branch=3Dmaster;protocol=3Dhttps \
> >  SRCREV =3D "18c4c982a595dad069cd8df4932aefb1d257591f"
> >
> >  S =3D "${WORKDIR}/git"
> > -PV .=3D "gitr+${SRCPV}"
> > +PV .=3D "gitr+"
> >
> >  inherit cmake
> >
> > diff --git a/meta-oe/recipes-support/picocom/picocom_git.bb
> b/meta-oe/recipes-support/picocom/picocom_git.bb
> > index 4ec256bb99..cc0d88faca 100644
> > --- a/meta-oe/recipes-support/picocom/picocom_git.bb
> > +++ b/meta-oe/recipes-support/picocom/picocom_git.bb
> > @@ -5,7 +5,7 @@ HOMEPAGE =3D "https://gitlab.com/wsakernel/picocom"
> >  LIC_FILES_CHKSUM =3D
> "file://LICENSE.txt;md5=3D3000e4830620e310fe65c0eb69df9e8a"
> >
> >  BASEPV =3D "2023-04"
> > -PV =3D "${BASEPV}+git${SRCPV}"
> > +PV =3D "${BASEPV}+git"
> >
> >  SRCREV =3D "12537df0314767d5af35bddddbbca3694e6a0342"
> >
> > diff --git a/meta-oe/recipes-support/pidgin/icyque_git.bb
> b/meta-oe/recipes-support/pidgin/icyque_git.bb
> > index fe75415de2..76ed26e88e 100644
> > --- a/meta-oe/recipes-support/pidgin/icyque_git.bb
> > +++ b/meta-oe/recipes-support/pidgin/icyque_git.bb
> > @@ -5,7 +5,7 @@ LIC_FILES_CHKSUM =3D
> "file://LICENSE;md5=3D1ebbd3e34237af26da5dc08a4e440464"
> >
> >  DEPENDS =3D "pidgin json-glib"
> >
> > -PV =3D "0.1+gitr${SRCPV}"
> > +PV =3D "0.1+gitr"
> >
> >  inherit pkgconfig
> >
> > diff --git a/meta-oe/recipes-support/pidgin/purple-skypeweb_git.bb
> b/meta-oe/recipes-support/pidgin/purple-skypeweb_git.bb
> > index 96b97b6744..1981f1ee9c 100644
> > --- a/meta-oe/recipes-support/pidgin/purple-skypeweb_git.bb
> > +++ b/meta-oe/recipes-support/pidgin/purple-skypeweb_git.bb
> > @@ -11,7 +11,7 @@ SRC_URI =3D "git://
> github.com/EionRobb/skype4pidgin;branch=3Dmaster;protocol=3Dhttps"
> >  SRCREV =3D "b226d1c457d73900ae89b8a7469247fbe33677a6"
> >
> >  S =3D "${WORKDIR}/git"
> > -PV =3D "1.7+git${SRCPV}"
> > +PV =3D "1.7+git"
> >
> >  do_compile() {
> >      oe_runmake -C skypeweb;
> > diff --git a/meta-oe/recipes-support/portaudio/portaudio-v19_19.7.0.bb
> b/meta-oe/recipes-support/portaudio/portaudio-v19_19.7.0.bb
> > index c49a2599ac..2bf4d0a449 100644
> > --- a/meta-oe/recipes-support/portaudio/portaudio-v19_19.7.0.bb
> > +++ b/meta-oe/recipes-support/portaudio/portaudio-v19_19.7.0.bb
> > @@ -3,7 +3,7 @@ SECTION =3D "libs/multimedia"
> >  LICENSE =3D "MIT"
> >  LIC_FILES_CHKSUM =3D
> "file://LICENSE.txt;md5=3D26107732c2ab637c5710446fcfaf02df"
> >
> > -PV .=3D "+git${SRCPV}"
> > +PV .=3D "+git"
> >
> >  SRC_URI =3D "git://
> github.com/PortAudio/portaudio.git;branch=3Dmaster;protocol=3Dhttps"
> >  SRCREV =3D "929e2e8f7af281c5eb4fa07758930d542ec43d97"
> > diff --git a/meta-oe/recipes-support/serial-utils/pty-forward-native.bb
> b/meta-oe/recipes-support/serial-utils/pty-forward-native.bb
> > index 2fe61e6f59..41a93f3249 100644
> > --- a/meta-oe/recipes-support/serial-utils/pty-forward-native.bb
> > +++ b/meta-oe/recipes-support/serial-utils/pty-forward-native.bb
> > @@ -3,7 +3,7 @@ LICENSE =3D "GPL-2.0-only"
> >  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Debb5c50ab7cab4baeffba149770=
30c07"
> >  SECTION =3D "console/network"
> >  SRCREV =3D "00dbec2636ae0385ad028587e20e446272ff97ec"
> > -PV =3D "1.1+gitr${SRCPV}"
> > +PV =3D "1.1+gitr"
> >
> >  SRC_URI =3D "git://
> github.com/freesmartphone/cornucopia.git;protocol=3Dhttps;branch=3Dmaster=
"
> >  S =3D "${WORKDIR}/git/tools/serial_forward"
> > diff --git a/meta-oe/recipes-support/serial-utils/serial-forward_git.bb
> b/meta-oe/recipes-support/serial-utils/serial-forward_git.bb
> > index 84bb25e4cd..751bdffead 100644
> > --- a/meta-oe/recipes-support/serial-utils/serial-forward_git.bb
> > +++ b/meta-oe/recipes-support/serial-utils/serial-forward_git.bb
> > @@ -3,7 +3,7 @@ LICENSE =3D "GPL-2.0-only"
> >  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Debb5c50ab7cab4baeffba149770=
30c07"
> >  SECTION =3D "console/devel"
> >  SRCREV =3D "07c6fdede0870edc37a8d51d033b6e7e29aa7c91"
> > -PV =3D "1.1+gitr${SRCPV}"
> > +PV =3D "1.1+gitr"
> >
> >  SRC_URI =3D "git://
> github.com/freesmartphone/cornucopia.git;branch=3Dmaster;protocol=3Dhttps=
 \
> >
>  file://0001-serial_forward-Disable-default-static-linking.patch;striplev=
el=3D3
> \
> > diff --git a/meta-oe/recipes-support/synergy/synergy_git.bb
> b/meta-oe/recipes-support/synergy/synergy_git.bb
> > index f2e7a91618..fb767942fe 100644
> > --- a/meta-oe/recipes-support/synergy/synergy_git.bb
> > +++ b/meta-oe/recipes-support/synergy/synergy_git.bb
> > @@ -13,7 +13,7 @@ SRC_URI =3D "git://
> github.com/symless/synergy-core;protocol=3Dhttps;nobranch=3D1"
> >
> >  # Version 1.10.1-stable
> >  SRCREV ?=3D "1b4c076127687aceac931d269e898beaac1cad9f"
> > -PV =3D "1.10.1+git${SRCPV}"
> > +PV =3D "1.10.1+git"
> >
> >  S =3D "${WORKDIR}/git"
> >
> > diff --git a/meta-oe/recipes-support/utouch/utouch-evemu_git.bb
> b/meta-oe/recipes-support/utouch/utouch-evemu_git.bb
> > index a6d09f69e9..bd69dbb11c 100644
> > --- a/meta-oe/recipes-support/utouch/utouch-evemu_git.bb
> > +++ b/meta-oe/recipes-support/utouch/utouch-evemu_git.bb
> > @@ -12,7 +12,7 @@ SRC_URI =3D "git://
> bitmath.org/git/evemu.git;protocol=3Dhttp;branch=3Dmaster \
> >             "
> >  SRCREV =3D "9752b50e922572e4cd214ac45ed95e4ee410fe24"
> >
> > -PV =3D "1.0.6+git${SRCPV}"
> > +PV =3D "1.0.6+git"
> >
> >  S =3D "${WORKDIR}/git"
> >
> > diff --git a/meta-oe/recipes-support/utouch/utouch-frame_git.bb
> b/meta-oe/recipes-support/utouch/utouch-frame_git.bb
> > index 3b1cf60c27..ddd27a7e30 100644
> > --- a/meta-oe/recipes-support/utouch/utouch-frame_git.bb
> > +++ b/meta-oe/recipes-support/utouch/utouch-frame_git.bb
> > @@ -16,6 +16,6 @@ SRC_URI =3D "git://
> bitmath.org/git/frame.git;protocol=3Dhttp;branch=3Dmaster \
> >             "
> >  SRCREV =3D "95363d5a1f7394d71144bf3b408ef4e6db4350fc"
> >
> > -PV =3D "1.1.2+git${SRCPV}"
> > +PV =3D "1.1.2+git"
> >
> >  S =3D "${WORKDIR}/git"
> > diff --git a/meta-oe/recipes-support/utouch/utouch-mtview_git.bb
> b/meta-oe/recipes-support/utouch/utouch-mtview_git.bb
> > index e348e39bba..d964d7f263 100644
> > --- a/meta-oe/recipes-support/utouch/utouch-mtview_git.bb
> > +++ b/meta-oe/recipes-support/utouch/utouch-mtview_git.bb
> > @@ -14,6 +14,6 @@ SRCREV =3D "ad437c38dc111cf3990a03abf14efe1b5d89604b"
> >
> >  DEPENDS +=3D "mtdev utouch-frame utouch-evemu libx11"
> >
> > -PV =3D "1.1.7+git${SRCPV}"
> > +PV =3D "1.1.7+git"
> >
> >  S =3D "${WORKDIR}/git"
> > diff --git a/meta-oe/recipes-support/zbar/zbar_git.bb
> b/meta-oe/recipes-support/zbar/zbar_git.bb
> > index 3be1f27a6f..975779cd18 100644
> > --- a/meta-oe/recipes-support/zbar/zbar_git.bb
> > +++ b/meta-oe/recipes-support/zbar/zbar_git.bb
> > @@ -16,7 +16,7 @@ SRC_URI =3D "git://
> github.com/mchehab/zbar.git;branch=3Dmaster;protocol=3Dhttps \
> >  SRCREV =3D "89e7900d85dd54ef351a7ed582aec6a5a5d7fa37"
> >
> >  S =3D "${WORKDIR}/git"
> > -PV =3D "0.23.1+git${SRCPV}"
> > +PV =3D "0.23.1+git"
> >
> >  DEPENDS +=3D "xmlto-native"
> >
> > diff --git a/meta-oe/recipes-test/cmocka/cmocka_1.1.7.bb
> b/meta-oe/recipes-test/cmocka/cmocka_1.1.7.bb
> > index 7461fcc4d7..6c94e9e275 100644
> > --- a/meta-oe/recipes-test/cmocka/cmocka_1.1.7.bb
> > +++ b/meta-oe/recipes-test/cmocka/cmocka_1.1.7.bb
> > @@ -7,7 +7,7 @@ LICENSE =3D "Apache-2.0"
> >  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D3b83ef96387f14655fc854ddc3c=
6bd57"
> >
> >  SRCREV =3D "a01cc69ee9536f90e57c61a198f2d1944d3d4313"
> > -PV .=3D "+git${SRCPV}"
> > +PV .=3D "+git"
> >  SRC_URI =3D "git://
> git.cryptomilk.org/projects/cmocka.git;protocol=3Dhttps;branch=3Dstable-1=
.1 \
> >
>  file://0001-include-Check-for-previous-declaration-of-uintptr_t.patch \
> >             file://run-ptest \
> > diff --git a/meta-oe/recipes-test/linux-serial-test/
> linux-serial-test_git.bb b/meta-oe/recipes-test/linux-serial-test/
> linux-serial-test_git.bb
> > index 7abdcb2523..e909676abc 100644
> > --- a/meta-oe/recipes-test/linux-serial-test/linux-serial-test_git.bb
> > +++ b/meta-oe/recipes-test/linux-serial-test/linux-serial-test_git.bb
> > @@ -5,7 +5,7 @@ LIC_FILES_CHKSUM =3D
> "file://LICENSES/MIT;md5=3D544799d0b492f119fa04641d1b8868ed"
> >
> >  SRC_URI =3D "git://
> github.com/cbrake/linux-serial-test.git;protocol=3Dhttps;branch=3Dmaster"
> >
> > -PV =3D "0+git${SRCPV}"
> > +PV =3D "0+git"
> >  SRCREV =3D "2ee61484167eab846f7b7c565284d7c350d738d3"
> >
> >  S =3D "${WORKDIR}/git"
> > diff --git a/meta-python/recipes-devtools/gyp/gyp_git.bb
> b/meta-python/recipes-devtools/gyp/gyp_git.bb
> > index 0f94a4476d..6ac4228a8b 100644
> > --- a/meta-python/recipes-devtools/gyp/gyp_git.bb
> > +++ b/meta-python/recipes-devtools/gyp/gyp_git.bb
> > @@ -9,7 +9,7 @@ SRC_URI =3D "git://
> chromium.googlesource.com/external/gyp;protocol=3Dhttps;branch=3Dma
> >  SRCREV =3D "a03d7413becefc8d55c8aa3df58b55b9bd0e9052"
> >
> >  S =3D "${WORKDIR}/git"
> > -PV =3D "0.1+git${SRCPV}"
> > +PV =3D "0.1+git"
> >
> >  inherit setuptools3
> >
> > diff --git a/meta-webserver/recipes-httpd/apache-mod/
> apache-websocket_git.bb b/meta-webserver/recipes-httpd/apache-mod/
> apache-websocket_git.bb
> > index 040788609e..4dbf595c19 100644
> > --- a/meta-webserver/recipes-httpd/apache-mod/apache-websocket_git.bb
> > +++ b/meta-webserver/recipes-httpd/apache-mod/apache-websocket_git.bb
> > @@ -15,7 +15,7 @@ SRC_URI =3D "git://
> github.com/jchampio/apache-websocket.git;branch=3Dmaster;protocol
> >
> >  SRCREV =3D "0ee34c77fc78ff08fd548706300b80a7bc7874e4"
> >
> > -PV =3D "0.1.2+git${SRCPV}"
> > +PV =3D "0.1.2+git"
> >
> >  S =3D "${WORKDIR}/git"
> >
> > diff --git a/meta-webserver/recipes-httpd/cherokee/cherokee_git.bb
> b/meta-webserver/recipes-httpd/cherokee/cherokee_git.bb
> > index 3dc4ca8bbb..7763a31881 100644
> > --- a/meta-webserver/recipes-httpd/cherokee/cherokee_git.bb
> > +++ b/meta-webserver/recipes-httpd/cherokee/cherokee_git.bb
> > @@ -8,7 +8,7 @@ LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3D94d55d512a9ba36caa9b7df079bae19f"
> >  DEPENDS =3D "unzip-native libpcre openssl mysql5
> ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
> >
> >  SRCREV =3D "9a75e65b876bcc376cb6b379dca1f7ce4a055c59"
> > -PV =3D "1.2.104+git${SRCPV}"
> > +PV =3D "1.2.104+git"
> >  SRC_URI =3D "git://
> github.com/cherokee/webserver;branch=3Dmaster;protocol=3Dhttps \
> >             file://cherokee.init \
> >             file://cherokee.service \
> > --
> > 2.43.0
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#108628):
> https://lists.openembedded.org/g/openembedded-devel/message/108628
> > Mute This Topic: https://lists.openembedded.org/mt/104197308/1997914
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[
> raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>

--000000000000490fc70610ba6049
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi,</div><div><br></div>rebased and pushed as=C2=A0<a=
 href=3D"https://git.openembedded.org/meta-openembedded-contrib/log/?h=3Dja=
nsa/master-next">https://git.openembedded.org/meta-openembedded-contrib/log=
/?h=3Djansa/master-next</a></div><br><div class=3D"gmail_quote"><div dir=3D=
"ltr" class=3D"gmail_attr">On Tue, Feb 6, 2024 at 6:20=E2=80=AFPM Khem Raj =
&lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Thanks for this=
 cleanup. Can you rebase it on master-next and resend ?<br>
it will make my life easier<br>
<br>
Applying: recipes: drop ${SRCPV} usage<br>
Patch failed at 0001 recipes: drop ${SRCPV} usage<br>
...<br>
error: meta-oe/recipes-extended/sanlock/<a href=3D"http://sanlock_3.9.0.bb"=
 rel=3D"noreferrer" target=3D"_blank">sanlock_3.9.0.bb</a>: does not<br>
exist in index<br>
<br>
On Tue, Feb 6, 2024 at 5:28=E2=80=AFAM Martin Jansa &lt;<a href=3D"mailto:m=
artin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a>&gt; wro=
te:<br>
&gt;<br>
&gt; * Drop SRCPV similarly like oe-core did in:<br>
&gt;=C2=A0 =C2=A0<a href=3D"https://git.openembedded.org/openembedded-core/=
commit/?h=3Dnanbield&amp;id=3D843f82a246a535c353e08072f252d1dc78217872" rel=
=3D"noreferrer" target=3D"_blank">https://git.openembedded.org/openembedded=
-core/commit/?h=3Dnanbield&amp;id=3D843f82a246a535c353e08072f252d1dc7821787=
2</a><br>
&gt;<br>
&gt; * SRCPV is deferred now from PV to PKGV since:<br>
&gt;=C2=A0 =C2=A0<a href=3D"https://git.openembedded.org/openembedded-core/=
commit/?h=3Dnanbield&amp;id=3Da8e7b0f932b9ea69b3a218fca18041676c65aba0" rel=
=3D"noreferrer" target=3D"_blank">https://git.openembedded.org/openembedded=
-core/commit/?h=3Dnanbield&amp;id=3Da8e7b0f932b9ea69b3a218fca18041676c65aba=
0</a><br>
&gt;<br>
&gt; Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:martin.jansa@gmail.c=
om" target=3D"_blank">martin.jansa@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta-filesystems/recipes-filesystems/yaffs2/<a href=3D"http://ya=
ffs2-utils_git.bb" rel=3D"noreferrer" target=3D"_blank">yaffs2-utils_git.bb=
</a> | 2 +-<br>
&gt;=C2=A0 meta-filesystems/recipes-utils/aufs-util/<a href=3D"http://aufs-=
util_git.bb" rel=3D"noreferrer" target=3D"_blank">aufs-util_git.bb</a>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
&gt;=C2=A0 meta-filesystems/recipes-utils/overlayfs/<a href=3D"http://overl=
ayfs-tools_git.bb" rel=3D"noreferrer" target=3D"_blank">overlayfs-tools_git=
.bb</a> | 2 +-<br>
&gt;=C2=A0 meta-gnome/recipes-gnome/devilspie/<a href=3D"http://devilspie2_=
0.44.bb" rel=3D"noreferrer" target=3D"_blank">devilspie2_0.44.bb</a>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
&gt;=C2=A0 meta-gnome/recipes-support/keybinder/<a href=3D"http://keybinder=
_3.0.bb" rel=3D"noreferrer" target=3D"_blank">keybinder_3.0.bb</a>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
&gt;=C2=A0 meta-initramfs/recipes-bsp/kexecboot/<a href=3D"http://kexecboot=
_git.bb" rel=3D"noreferrer" target=3D"_blank">kexecboot_git.bb</a>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
&gt;=C2=A0 meta-initramfs/recipes-kernel/kexec/<a href=3D"http://kexec-tool=
s-klibc_git.bb" rel=3D"noreferrer" target=3D"_blank">kexec-tools-klibc_git.=
bb</a>=C2=A0 =C2=A0 | 2 +-<br>
&gt;=C2=A0 meta-multimedia/recipes-dvb/oscam/<a href=3D"http://oscam_svn.bb=
" rel=3D"noreferrer" target=3D"_blank">oscam_svn.bb</a>=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
&gt;=C2=A0 meta-multimedia/recipes-dvb/tvheadend/<a href=3D"http://tvheaden=
d_git.bb" rel=3D"noreferrer" target=3D"_blank">tvheadend_git.bb</a>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
&gt;=C2=A0 meta-multimedia/recipes-multimedia/bluealsa/<a href=3D"http://bl=
uealsa_git.bb" rel=3D"noreferrer" target=3D"_blank">bluealsa_git.bb</a>=C2=
=A0 =C2=A0 =C2=A0| 2 +-<br>
&gt;=C2=A0 .../recipes-multimedia/dleyna/<a href=3D"http://dleyna-server_0.=
6.0.bb" rel=3D"noreferrer" target=3D"_blank">dleyna-server_0.6.0.bb</a>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
&gt;=C2=A0 meta-multimedia/recipes-multimedia/libsquish/<a href=3D"http://l=
ibsquish_git.bb" rel=3D"noreferrer" target=3D"_blank">libsquish_git.bb</a>=
=C2=A0 =C2=A0| 2 +-<br>
&gt;=C2=A0 .../recipes-multimedia/musicbrainz/<a href=3D"http://libmusicbra=
inz_git.bb" rel=3D"noreferrer" target=3D"_blank">libmusicbrainz_git.bb</a>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
&gt;=C2=A0 .../recipes-support/gst-instruments/<a href=3D"http://gst-instru=
ments_git.bb" rel=3D"noreferrer" target=3D"_blank">gst-instruments_git.bb</=
a>=C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
&gt;=C2=A0 meta-networking/recipes-connectivity/bearssl/<a href=3D"http://b=
earssl_0.6.bb" rel=3D"noreferrer" target=3D"_blank">bearssl_0.6.bb</a>=C2=
=A0 =C2=A0 =C2=A0| 2 +-<br>
&gt;=C2=A0 meta-networking/recipes-connectivity/bluepy/<a href=3D"http://bl=
uepy_git.bb" rel=3D"noreferrer" target=3D"_blank">bluepy_git.bb</a>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0| 2 +-<br>
&gt;=C2=A0 .../recipes-connectivity/openthread/<a href=3D"http://ot-br-posi=
x_git.bb" rel=3D"noreferrer" target=3D"_blank">ot-br-posix_git.bb</a>=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
&gt;=C2=A0 .../recipes-connectivity/openthread/<a href=3D"http://ot-daemon_=
git.bb" rel=3D"noreferrer" target=3D"_blank">ot-daemon_git.bb</a>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
&gt;=C2=A0 meta-networking/recipes-connectivity/openthread/<a href=3D"http:=
//wpantund_git.bb" rel=3D"noreferrer" target=3D"_blank">wpantund_git.bb</a>=
 | 2 +-<br>
&gt;=C2=A0 meta-networking/recipes-connectivity/relayd/<a href=3D"http://re=
layd_git.bb" rel=3D"noreferrer" target=3D"_blank">relayd_git.bb</a>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0| 2 +-<br>
&gt;=C2=A0 meta-networking/recipes-filter/ulogd2/<a href=3D"http://ulogd2_2=
.0.8.bb" rel=3D"noreferrer" target=3D"_blank">ulogd2_2.0.8.bb</a>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
&gt;=C2=A0 meta-networking/recipes-protocols/openflow/<a href=3D"http://ope=
nflow_git.bb" rel=3D"noreferrer" target=3D"_blank">openflow_git.bb</a>=C2=
=A0 =C2=A0 =C2=A0 | 2 +-<br>
&gt;=C2=A0 meta-networking/recipes-protocols/openlldp/<a href=3D"http://ope=
nlldp_1.1.0.bb" rel=3D"noreferrer" target=3D"_blank">openlldp_1.1.0.bb</a>=
=C2=A0 =C2=A0 | 2 +-<br>
&gt;=C2=A0 meta-networking/recipes-support/arptables/<a href=3D"http://arpt=
ables_git.bb" rel=3D"noreferrer" target=3D"_blank">arptables_git.bb</a>=C2=
=A0 =C2=A0 =C2=A0 | 2 +-<br>
&gt;=C2=A0 meta-networking/recipes-support/celt051/<a href=3D"http://celt05=
1_git.bb" rel=3D"noreferrer" target=3D"_blank">celt051_git.bb</a>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
&gt;=C2=A0 .../recipes-support/lksctp-tools/<a href=3D"http://lksctp-tools_=
1.0.19.bb" rel=3D"noreferrer" target=3D"_blank">lksctp-tools_1.0.19.bb</a>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
&gt;=C2=A0 .../recipes-support/lowpan-tools/<a href=3D"http://lowpan-tools_=
git.bb" rel=3D"noreferrer" target=3D"_blank">lowpan-tools_git.bb</a>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
&gt;=C2=A0 meta-networking/recipes-support/netcf/<a href=3D"http://netcf_0.=
2.8.bb" rel=3D"noreferrer" target=3D"_blank">netcf_0.2.8.bb</a>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
&gt;=C2=A0 meta-networking/recipes-support/netperf/<a href=3D"http://netper=
f_git.bb" rel=3D"noreferrer" target=3D"_blank">netperf_git.bb</a>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
&gt;=C2=A0 meta-networking/recipes-support/ntimed/<a href=3D"http://ntimed_=
git.bb" rel=3D"noreferrer" target=3D"_blank">ntimed_git.bb</a>=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
&gt;=C2=A0 meta-networking/recipes-support/phytool/<a href=3D"http://phytoo=
l.bb" rel=3D"noreferrer" target=3D"_blank">phytool.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
&gt;=C2=A0 .../dynamic-layers/meta-python/recipes-bsp/rwmem/<a href=3D"http=
://rwmem_1.2.bb" rel=3D"noreferrer" target=3D"_blank">rwmem_1.2.bb</a>=C2=
=A0 =C2=A0| 2 +-<br>
&gt;=C2=A0 .../meta-python/recipes-extended/lcdproc/<a href=3D"http://lcdpr=
oc_git.bb" rel=3D"noreferrer" target=3D"_blank">lcdproc_git.bb</a>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
&gt;=C2=A0 meta-oe/recipes-benchmark/cpuburn/<a href=3D"http://cpuburn-arm_=
git.bb" rel=3D"noreferrer" target=3D"_blank">cpuburn-arm_git.bb</a>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
&gt;=C2=A0 meta-oe/recipes-benchmark/libc-bench/<a href=3D"http://libc-benc=
h_git.bb" rel=3D"noreferrer" target=3D"_blank">libc-bench_git.bb</a>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
&gt;=C2=A0 meta-oe/recipes-benchmark/tinymembench/<a href=3D"http://tinymem=
bench_git.bb" rel=3D"noreferrer" target=3D"_blank">tinymembench_git.bb</a>=
=C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
&gt;=C2=A0 meta-oe/recipes-bsp/edac-utils/<a href=3D"http://edac-utils_git.=
bb" rel=3D"noreferrer" target=3D"_blank">edac-utils_git.bb</a>=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
&gt;=C2=A0 meta-oe/recipes-bsp/firmwared/<a href=3D"http://firmwared_git.bb=
" rel=3D"noreferrer" target=3D"_blank">firmwared_git.bb</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
&gt;=C2=A0 meta-oe/recipes-connectivity/gattlib/<a href=3D"http://gattlib_g=
it.bb" rel=3D"noreferrer" target=3D"_blank">gattlib_git.bb</a>=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
&gt;=C2=A0 .../libimobiledevice-glue/<a href=3D"http://libimobiledevice-glu=
e_git.bb" rel=3D"noreferrer" target=3D"_blank">libimobiledevice-glue_git.bb=
</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
&gt;=C2=A0 .../libimobiledevice/<a href=3D"http://libimobiledevice_git.bb" =
rel=3D"noreferrer" target=3D"_blank">libimobiledevice_git.bb</a>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
&gt;=C2=A0 meta-oe/recipes-connectivity/libqrtr-glib/<a href=3D"http://libq=
rtr-glib_git.bb" rel=3D"noreferrer" target=3D"_blank">libqrtr-glib_git.bb</=
a>=C2=A0 =C2=A0| 2 +-<br>
&gt;=C2=A0 meta-oe/recipes-connectivity/rtorrent/<a href=3D"http://rtorrent=
_git.bb" rel=3D"noreferrer" target=3D"_blank">rtorrent_git.bb</a>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
&gt;=C2=A0 meta-oe/recipes-connectivity/usbmuxd/<a href=3D"http://usbmuxd_g=
it.bb" rel=3D"noreferrer" target=3D"_blank">usbmuxd_git.bb</a>=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
&gt;=C2=A0 meta-oe/recipes-core/dbus/<a href=3D"http://dbus-daemon-proxy_gi=
t.bb" rel=3D"noreferrer" target=3D"_blank">dbus-daemon-proxy_git.bb</a>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
&gt;=C2=A0 meta-oe/recipes-core/glfw/<a href=3D"http://glfw_3.3.8.bb" rel=
=3D"noreferrer" target=3D"_blank">glfw_3.3.8.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br=
>
&gt;=C2=A0 meta-oe/recipes-core/libnfc/<a href=3D"http://libnfc_git.bb" rel=
=3D"noreferrer" target=3D"_blank">libnfc_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
&gt;=C2=A0 meta-oe/recipes-core/mdbus2/<a href=3D"http://mdbus2_git.bb" rel=
=3D"noreferrer" target=3D"_blank">mdbus2_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
&gt;=C2=A0 meta-oe/recipes-core/musl-rpmatch/<a href=3D"http://musl-rpmatch=
_git.bb" rel=3D"noreferrer" target=3D"_blank">musl-rpmatch_git.bb</a>=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
&gt;=C2=A0 meta-oe/recipes-core/opencl/<a href=3D"http://opencl-clhpp_git.b=
b" rel=3D"noreferrer" target=3D"_blank">opencl-clhpp_git.bb</a>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
&gt;=C2=A0 meta-oe/recipes-crypto/pkcs11-helper/<a href=3D"http://pkcs11-he=
lper_1.30.0.bb" rel=3D"noreferrer" target=3D"_blank">pkcs11-helper_1.30.0.b=
b</a>=C2=A0 =C2=A0 | 2 +-<br>
&gt;=C2=A0 meta-oe/recipes-devtools/apitrace/<a href=3D"http://apitrace_11.=
1.bb" rel=3D"noreferrer" target=3D"_blank">apitrace_11.1.bb</a>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
&gt;=C2=A0 meta-oe/recipes-devtools/concurrencykit/<a href=3D"http://concur=
rencykit_git.bb" rel=3D"noreferrer" target=3D"_blank">concurrencykit_git.bb=
</a>=C2=A0 =C2=A0| 2 +-<br>
&gt;=C2=A0 meta-oe/recipes-devtools/guider/<a href=3D"http://guider_3.9.8.b=
b" rel=3D"noreferrer" target=3D"_blank">guider_3.9.8.bb</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
&gt;=C2=A0 meta-oe/recipes-devtools/libubox/<a href=3D"http://libubox_git.b=
b" rel=3D"noreferrer" target=3D"_blank">libubox_git.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
&gt;=C2=A0 meta-oe/recipes-devtools/lshw/<a href=3D"http://lshw_02.20.bb" r=
el=3D"noreferrer" target=3D"_blank">lshw_02.20.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
&gt;=C2=A0 meta-oe/recipes-devtools/ltrace/<a href=3D"http://ltrace_git.bb"=
 rel=3D"noreferrer" target=3D"_blank">ltrace_git.bb</a>=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
&gt;=C2=A0 meta-oe/recipes-devtools/nlohmann-fifo/<a href=3D"http://nlohman=
n-fifo_git.bb" rel=3D"noreferrer" target=3D"_blank">nlohmann-fifo_git.bb</a=
>=C2=A0 =C2=A0 =C2=A0| 2 +-<br>
&gt;=C2=A0 meta-oe/recipes-devtools/openocd/<a href=3D"http://openocd_git.b=
b" rel=3D"noreferrer" target=3D"_blank">openocd_git.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
&gt;=C2=A0 meta-oe/recipes-devtools/pmtools/<a href=3D"http://pmtools_git.b=
b" rel=3D"noreferrer" target=3D"_blank">pmtools_git.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
&gt;=C2=A0 meta-oe/recipes-devtools/rapidjson/<a href=3D"http://rapidjson_g=
it.bb" rel=3D"noreferrer" target=3D"_blank">rapidjson_git.bb</a>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
&gt;=C2=A0 meta-oe/recipes-devtools/yasm/<a href=3D"http://yasm_git.bb" rel=
=3D"noreferrer" target=3D"_blank">yasm_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
&gt;=C2=A0 meta-oe/recipes-extended/docopt.cpp/<a href=3D"http://docopt.cpp=
_git.bb" rel=3D"noreferrer" target=3D"_blank">docopt.cpp_git.bb</a>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
&gt;=C2=A0 meta-oe/recipes-extended/figlet/<a href=3D"http://figlet_git.bb"=
 rel=3D"noreferrer" target=3D"_blank">figlet_git.bb</a>=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
&gt;=C2=A0 meta-oe/recipes-extended/jpnevulator/<a href=3D"http://jpnevulat=
or_git.bb" rel=3D"noreferrer" target=3D"_blank">jpnevulator_git.bb</a>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
&gt;=C2=A0 meta-oe/recipes-extended/libbacktrace/<a href=3D"http://libbackt=
race_git.bb" rel=3D"noreferrer" target=3D"_blank">libbacktrace_git.bb</a>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
&gt;=C2=A0 meta-oe/recipes-extended/libimobiledevice/<a href=3D"http://libp=
list_git.bb" rel=3D"noreferrer" target=3D"_blank">libplist_git.bb</a>=C2=A0=
 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
&gt;=C2=A0 meta-oe/recipes-extended/libimobiledevice/<a href=3D"http://libu=
sbmuxd_git.bb" rel=3D"noreferrer" target=3D"_blank">libusbmuxd_git.bb</a>=
=C2=A0 =C2=A0 =C2=A0| 2 +-<br>
&gt;=C2=A0 meta-oe/recipes-extended/libuio/<a href=3D"http://libuio_0.2.1.b=
b" rel=3D"noreferrer" target=3D"_blank">libuio_0.2.1.bb</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
&gt;=C2=A0 meta-oe/recipes-extended/md5deep/<a href=3D"http://md5deep_git.b=
b" rel=3D"noreferrer" target=3D"_blank">md5deep_git.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
&gt;=C2=A0 meta-oe/recipes-extended/mraa/<a href=3D"http://mraa_git.bb" rel=
=3D"noreferrer" target=3D"_blank">mraa_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
&gt;=C2=A0 meta-oe/recipes-extended/p8platform/<a href=3D"http://p8platform=
_git.bb" rel=3D"noreferrer" target=3D"_blank">p8platform_git.bb</a>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
&gt;=C2=A0 meta-oe/recipes-extended/properties-cpp/<a href=3D"http://proper=
ties-cpp_git.bb" rel=3D"noreferrer" target=3D"_blank">properties-cpp_git.bb=
</a>=C2=A0 =C2=A0| 2 +-<br>
&gt;=C2=A0 meta-oe/recipes-extended/qad/<a href=3D"http://qad_git.bb" rel=
=3D"noreferrer" target=3D"_blank">qad_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
&gt;=C2=A0 meta-oe/recipes-extended/qcbor/<a href=3D"http://qcbor_git.bb" r=
el=3D"noreferrer" target=3D"_blank">qcbor_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
&gt;=C2=A0 meta-oe/recipes-extended/sanlock/<a href=3D"http://sanlock_3.9.0=
.bb" rel=3D"noreferrer" target=3D"_blank">sanlock_3.9.0.bb</a>=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
&gt;=C2=A0 meta-oe/recipes-extended/socketcan/<a href=3D"http://can-isotp_g=
it.bb" rel=3D"noreferrer" target=3D"_blank">can-isotp_git.bb</a>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
&gt;=C2=A0 meta-oe/recipes-extended/tipcutils/<a href=3D"http://tipcutils_g=
it.bb" rel=3D"noreferrer" target=3D"_blank">tipcutils_git.bb</a>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
&gt;=C2=A0 meta-oe/recipes-extended/triggerhappy/<a href=3D"http://triggerh=
appy_git.bb" rel=3D"noreferrer" target=3D"_blank">triggerhappy_git.bb</a>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
&gt;=C2=A0 meta-oe/recipes-extended/upm/<a href=3D"http://upm_git.bb" rel=
=3D"noreferrer" target=3D"_blank">upm_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
&gt;=C2=A0 meta-oe/recipes-extended/zsync/<a href=3D"http://zsync-curl_git.=
bb" rel=3D"noreferrer" target=3D"_blank">zsync-curl_git.bb</a>=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
&gt;=C2=A0 meta-oe/recipes-graphics/aml/<a href=3D"http://aml_git.bb" rel=
=3D"noreferrer" target=3D"_blank">aml_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
&gt;=C2=A0 meta-oe/recipes-graphics/fbida/<a href=3D"http://fbida_git.bb" r=
el=3D"noreferrer" target=3D"_blank">fbida_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
&gt;=C2=A0 meta-oe/recipes-graphics/glm/<a href=3D"http://glm_0.9.9.8.bb" r=
el=3D"noreferrer" target=3D"_blank">glm_0.9.9.8.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
&gt;=C2=A0 meta-oe/recipes-graphics/openbox/<a href=3D"http://obconf_git.bb=
" rel=3D"noreferrer" target=3D"_blank">obconf_git.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
&gt;=C2=A0 .../parallel-deqp-runner/<a href=3D"http://parallel-deqp-runner_=
git.bb" rel=3D"noreferrer" target=3D"_blank">parallel-deqp-runner_git.bb</a=
>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
&gt;=C2=A0 meta-oe/recipes-graphics/ttf-fonts/<a href=3D"http://ttf-droid_g=
it.bb" rel=3D"noreferrer" target=3D"_blank">ttf-droid_git.bb</a>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
&gt;=C2=A0 meta-oe/recipes-graphics/x11vnc/<a href=3D"http://x11vnc_0.9.16.=
bb" rel=3D"noreferrer" target=3D"_blank">x11vnc_0.9.16.bb</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
&gt;=C2=A0 meta-oe/recipes-multimedia/faad2/<a href=3D"http://faad2_2.11.1.=
bb" rel=3D"noreferrer" target=3D"_blank">faad2_2.11.1.bb</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
&gt;=C2=A0 meta-oe/recipes-multimedia/v4l2apps/<a href=3D"http://v4l-utils_=
1.26.1.bb" rel=3D"noreferrer" target=3D"_blank">v4l-utils_1.26.1.bb</a>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
&gt;=C2=A0 .../recipes-support/ace-cloud-editor/<a href=3D"http://ace-cloud=
-editor_git.bb" rel=3D"noreferrer" target=3D"_blank">ace-cloud-editor_git.b=
b</a>=C2=A0 =C2=A0 | 2 +-<br>
&gt;=C2=A0 meta-oe/recipes-support/cli11/<a href=3D"http://cli11_2.3.2.bb" =
rel=3D"noreferrer" target=3D"_blank">cli11_2.3.2.bb</a>=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
&gt;=C2=A0 meta-oe/recipes-support/edid-decode/<a href=3D"http://edid-decod=
e_git.bb" rel=3D"noreferrer" target=3D"_blank">edid-decode_git.bb</a>=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
&gt;=C2=A0 meta-oe/recipes-support/evemu-tools/<a href=3D"http://evemu-tool=
s_git.bb" rel=3D"noreferrer" target=3D"_blank">evemu-tools_git.bb</a>=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
&gt;=C2=A0 meta-oe/recipes-support/function2/<a href=3D"http://function2_4.=
2.4.bb" rel=3D"noreferrer" target=3D"_blank">function2_4.2.4.bb</a>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
&gt;=C2=A0 meta-oe/recipes-support/hunspell/<a href=3D"http://hunspell-dict=
ionaries.bb" rel=3D"noreferrer" target=3D"_blank">hunspell-dictionaries.bb<=
/a>=C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
&gt;=C2=A0 meta-oe/recipes-support/idevicerestore/<a href=3D"http://idevice=
restore_git.bb" rel=3D"noreferrer" target=3D"_blank">idevicerestore_git.bb<=
/a>=C2=A0 =C2=A0 | 2 +-<br>
&gt;=C2=A0 meta-oe/recipes-support/iksemel/<a href=3D"http://iksemel_1.5.bb=
" rel=3D"noreferrer" target=3D"_blank">iksemel_1.5.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
&gt;=C2=A0 meta-oe/recipes-support/iniparser/<a href=3D"http://iniparser_4.=
1.bb" rel=3D"noreferrer" target=3D"_blank">iniparser_4.1.bb</a>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
&gt;=C2=A0 meta-oe/recipes-support/libb64/<a href=3D"http://libb64_2.0.0.1.=
bb" rel=3D"noreferrer" target=3D"_blank">libb64_2.0.0.1.bb</a>=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
&gt;=C2=A0 meta-oe/recipes-support/libcereal/<a href=3D"http://libcereal_1.=
3.2.bb" rel=3D"noreferrer" target=3D"_blank">libcereal_1.3.2.bb</a>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
&gt;=C2=A0 meta-oe/recipes-support/libcyusbserial/<a href=3D"http://libcyus=
bserial_git.bb" rel=3D"noreferrer" target=3D"_blank">libcyusbserial_git.bb<=
/a>=C2=A0 =C2=A0 | 2 +-<br>
&gt;=C2=A0 meta-oe/recipes-support/libfann/<a href=3D"http://libfann_git.bb=
" rel=3D"noreferrer" target=3D"_blank">libfann_git.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
&gt;=C2=A0 meta-oe/recipes-support/libusbgx/<a href=3D"http://libusbgx_git.=
bb" rel=3D"noreferrer" target=3D"_blank">libusbgx_git.bb</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
&gt;=C2=A0 meta-oe/recipes-support/lio-utils/<a href=3D"http://lio-utils_4.=
1.bb" rel=3D"noreferrer" target=3D"_blank">lio-utils_4.1.bb</a>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
&gt;=C2=A0 meta-oe/recipes-support/mcelog/<a href=3D"http://mce-test_git.bb=
" rel=3D"noreferrer" target=3D"_blank">mce-test_git.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
&gt;=C2=A0 meta-oe/recipes-support/ne10/<a href=3D"http://ne10_1.2.1.bb" re=
l=3D"noreferrer" target=3D"_blank">ne10_1.2.1.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
&gt;=C2=A0 meta-oe/recipes-support/picocom/<a href=3D"http://picocom_git.bb=
" rel=3D"noreferrer" target=3D"_blank">picocom_git.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
&gt;=C2=A0 meta-oe/recipes-support/pidgin/<a href=3D"http://icyque_git.bb" =
rel=3D"noreferrer" target=3D"_blank">icyque_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
&gt;=C2=A0 meta-oe/recipes-support/pidgin/<a href=3D"http://purple-skypeweb=
_git.bb" rel=3D"noreferrer" target=3D"_blank">purple-skypeweb_git.bb</a>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
&gt;=C2=A0 meta-oe/recipes-support/portaudio/<a href=3D"http://portaudio-v1=
9_19.7.0.bb" rel=3D"noreferrer" target=3D"_blank">portaudio-v19_19.7.0.bb</=
a>=C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
&gt;=C2=A0 meta-oe/recipes-support/serial-utils/<a href=3D"http://pty-forwa=
rd-native.bb" rel=3D"noreferrer" target=3D"_blank">pty-forward-native.bb</a=
>=C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
&gt;=C2=A0 meta-oe/recipes-support/serial-utils/<a href=3D"http://serial-fo=
rward_git.bb" rel=3D"noreferrer" target=3D"_blank">serial-forward_git.bb</a=
>=C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
&gt;=C2=A0 meta-oe/recipes-support/synergy/<a href=3D"http://synergy_git.bb=
" rel=3D"noreferrer" target=3D"_blank">synergy_git.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
&gt;=C2=A0 meta-oe/recipes-support/utouch/<a href=3D"http://utouch-evemu_gi=
t.bb" rel=3D"noreferrer" target=3D"_blank">utouch-evemu_git.bb</a>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
&gt;=C2=A0 meta-oe/recipes-support/utouch/<a href=3D"http://utouch-frame_gi=
t.bb" rel=3D"noreferrer" target=3D"_blank">utouch-frame_git.bb</a>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
&gt;=C2=A0 meta-oe/recipes-support/utouch/<a href=3D"http://utouch-mtview_g=
it.bb" rel=3D"noreferrer" target=3D"_blank">utouch-mtview_git.bb</a>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
&gt;=C2=A0 meta-oe/recipes-support/zbar/<a href=3D"http://zbar_git.bb" rel=
=3D"noreferrer" target=3D"_blank">zbar_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
&gt;=C2=A0 meta-oe/recipes-test/cmocka/<a href=3D"http://cmocka_1.1.7.bb" r=
el=3D"noreferrer" target=3D"_blank">cmocka_1.1.7.bb</a>=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
&gt;=C2=A0 meta-oe/recipes-test/linux-serial-test/<a href=3D"http://linux-s=
erial-test_git.bb" rel=3D"noreferrer" target=3D"_blank">linux-serial-test_g=
it.bb</a> | 2 +-<br>
&gt;=C2=A0 meta-python/recipes-devtools/gyp/<a href=3D"http://gyp_git.bb" r=
el=3D"noreferrer" target=3D"_blank">gyp_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
&gt;=C2=A0 meta-webserver/recipes-httpd/apache-mod/<a href=3D"http://apache=
-websocket_git.bb" rel=3D"noreferrer" target=3D"_blank">apache-websocket_gi=
t.bb</a> | 2 +-<br>
&gt;=C2=A0 meta-webserver/recipes-httpd/cherokee/<a href=3D"http://cherokee=
_git.bb" rel=3D"noreferrer" target=3D"_blank">cherokee_git.bb</a>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
&gt;=C2=A0 123 files changed, 123 insertions(+), 123 deletions(-)<br>
&gt;<br>
&gt; diff --git a/meta-filesystems/recipes-filesystems/yaffs2/<a href=3D"ht=
tp://yaffs2-utils_git.bb" rel=3D"noreferrer" target=3D"_blank">yaffs2-utils=
_git.bb</a> b/meta-filesystems/recipes-filesystems/yaffs2/<a href=3D"http:/=
/yaffs2-utils_git.bb" rel=3D"noreferrer" target=3D"_blank">yaffs2-utils_git=
.bb</a><br>
&gt; index 6bf321e237..7228172b80 100644<br>
&gt; --- a/meta-filesystems/recipes-filesystems/yaffs2/<a href=3D"http://ya=
ffs2-utils_git.bb" rel=3D"noreferrer" target=3D"_blank">yaffs2-utils_git.bb=
</a><br>
&gt; +++ b/meta-filesystems/recipes-filesystems/yaffs2/<a href=3D"http://ya=
ffs2-utils_git.bb" rel=3D"noreferrer" target=3D"_blank">yaffs2-utils_git.bb=
</a><br>
&gt; @@ -9,7 +9,7 @@ LIC_FILES_CHKSUM =3D &quot;file://utils/mkyaffs2image.=
c;beginline=3D11;endline=3D13;md5=3D5f5<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 file://utils/mkyaffsimage.c;beginline=3D10;endline=3D12;md5=3D5f5464=
f9b3e981ca574e65b00e438561 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &quot;<br>
&gt;<br>
&gt; -PV =3D &quot;0.0+git${SRCPV}&quot;<br>
&gt; +PV =3D &quot;0.0+git&quot;<br>
&gt;<br>
&gt;=C2=A0 DEPENDS =3D &quot;mtd-utils&quot;<br>
&gt;<br>
&gt; diff --git a/meta-filesystems/recipes-utils/aufs-util/<a href=3D"http:=
//aufs-util_git.bb" rel=3D"noreferrer" target=3D"_blank">aufs-util_git.bb</=
a> b/meta-filesystems/recipes-utils/aufs-util/<a href=3D"http://aufs-util_g=
it.bb" rel=3D"noreferrer" target=3D"_blank">aufs-util_git.bb</a><br>
&gt; index fbf7753b02..ad846af470 100644<br>
&gt; --- a/meta-filesystems/recipes-utils/aufs-util/<a href=3D"http://aufs-=
util_git.bb" rel=3D"noreferrer" target=3D"_blank">aufs-util_git.bb</a><br>
&gt; +++ b/meta-filesystems/recipes-utils/aufs-util/<a href=3D"http://aufs-=
util_git.bb" rel=3D"noreferrer" target=3D"_blank">aufs-util_git.bb</a><br>
&gt; @@ -19,7 +19,7 @@ SRC_URI[aufs_type.sha256sum] =3D &quot;7ff6566adb9c7=
a3b6862cdc85a690ab546f1d0bc81ddd595<br>
&gt;<br>
&gt;=C2=A0 UPSTREAM_CHECK_COMMITS =3D &quot;1&quot;<br>
&gt;<br>
&gt; -PV =3D &quot;4.9+git${SRCPV}&quot;<br>
&gt; +PV =3D &quot;4.9+git&quot;<br>
&gt;<br>
&gt;=C2=A0 S =3D &quot;${WORKDIR}/git&quot;<br>
&gt;<br>
&gt; diff --git a/meta-filesystems/recipes-utils/overlayfs/<a href=3D"http:=
//overlayfs-tools_git.bb" rel=3D"noreferrer" target=3D"_blank">overlayfs-to=
ols_git.bb</a> b/meta-filesystems/recipes-utils/overlayfs/<a href=3D"http:/=
/overlayfs-tools_git.bb" rel=3D"noreferrer" target=3D"_blank">overlayfs-too=
ls_git.bb</a><br>
&gt; index ca2ec9cc4f..47613207af 100644<br>
&gt; --- a/meta-filesystems/recipes-utils/overlayfs/<a href=3D"http://overl=
ayfs-tools_git.bb" rel=3D"noreferrer" target=3D"_blank">overlayfs-tools_git=
.bb</a><br>
&gt; +++ b/meta-filesystems/recipes-utils/overlayfs/<a href=3D"http://overl=
ayfs-tools_git.bb" rel=3D"noreferrer" target=3D"_blank">overlayfs-tools_git=
.bb</a><br>
&gt; @@ -7,7 +7,7 @@ SRC_URI =3D &quot;\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 git://<a href=3D"http://github.com/kmxz/overlayfs-=
tools.git;protocol=3Dhttps;branch=3Dmaster" rel=3D"noreferrer" target=3D"_b=
lank">github.com/kmxz/overlayfs-tools.git;protocol=3Dhttps;branch=3Dmaster<=
/a> \<br>
&gt;=C2=A0 &quot;<br>
&gt;<br>
&gt; -PV =3D &quot;1.0+git${SRCPV}&quot;<br>
&gt; +PV =3D &quot;1.0+git&quot;<br>
&gt;=C2=A0 SRCREV =3D &quot;b5e5a829895ac98ccfe4629fbfbd8b819262bd00&quot;<=
br>
&gt;<br>
&gt;=C2=A0 S =3D &quot;${WORKDIR}/git&quot;<br>
&gt; diff --git a/meta-gnome/recipes-gnome/devilspie/<a href=3D"http://devi=
lspie2_0.44.bb" rel=3D"noreferrer" target=3D"_blank">devilspie2_0.44.bb</a>=
 b/meta-gnome/recipes-gnome/devilspie/<a href=3D"http://devilspie2_0.44.bb"=
 rel=3D"noreferrer" target=3D"_blank">devilspie2_0.44.bb</a><br>
&gt; index 01900cce39..90c12efadf 100644<br>
&gt; --- a/meta-gnome/recipes-gnome/devilspie/<a href=3D"http://devilspie2_=
0.44.bb" rel=3D"noreferrer" target=3D"_blank">devilspie2_0.44.bb</a><br>
&gt; +++ b/meta-gnome/recipes-gnome/devilspie/<a href=3D"http://devilspie2_=
0.44.bb" rel=3D"noreferrer" target=3D"_blank">devilspie2_0.44.bb</a><br>
&gt; @@ -6,7 +6,7 @@ LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D00aefa=
a50aad75c21367df66102d542c \<br>
&gt;<br>
&gt;=C2=A0 DEPENDS =3D &quot;gtk+ glib-2.0 libwnck libxinerama lua virtual/=
libx11&quot;<br>
&gt;<br>
&gt; -PV .=3D &quot;+git${SRCPV}&quot;<br>
&gt; +PV .=3D &quot;+git&quot;<br>
&gt;<br>
&gt;=C2=A0 SRCREV =3D &quot;b9d7ad9c09a5fb17a1562ee1d892798c646e9ec9&quot;<=
br>
&gt;<br>
&gt; diff --git a/meta-gnome/recipes-support/keybinder/<a href=3D"http://ke=
ybinder_3.0.bb" rel=3D"noreferrer" target=3D"_blank">keybinder_3.0.bb</a> b=
/meta-gnome/recipes-support/keybinder/<a href=3D"http://keybinder_3.0.bb" r=
el=3D"noreferrer" target=3D"_blank">keybinder_3.0.bb</a><br>
&gt; index 278592dc6e..7960009078 100644<br>
&gt; --- a/meta-gnome/recipes-support/keybinder/<a href=3D"http://keybinder=
_3.0.bb" rel=3D"noreferrer" target=3D"_blank">keybinder_3.0.bb</a><br>
&gt; +++ b/meta-gnome/recipes-support/keybinder/<a href=3D"http://keybinder=
_3.0.bb" rel=3D"noreferrer" target=3D"_blank">keybinder_3.0.bb</a><br>
&gt; @@ -11,7 +11,7 @@ LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D1f18=
f9c6d8b4cfcc7d7804a243a4c0b4&quot;<br>
&gt;=C2=A0 S =3D &quot;${WORKDIR}/git&quot;<br>
&gt;<br>
&gt;=C2=A0 SRCREV =3D &quot;736ccef40d39603b8111c8a3a0bca0319bbafdc0&quot;<=
br>
&gt; -PV =3D &quot;3.0+git${SRCPV}&quot;<br>
&gt; +PV =3D &quot;3.0+git&quot;<br>
&gt;=C2=A0 SRC_URI =3D &quot;git://<a href=3D"http://github.com/engla/keybi=
nder.git;branch=3Dkeybinder-3.0;protocol=3Dhttps" rel=3D"noreferrer" target=
=3D"_blank">github.com/engla/keybinder.git;branch=3Dkeybinder-3.0;protocol=
=3Dhttps</a> \<br>
&gt;=C2=A0 &quot;<br>
&gt;<br>
&gt; diff --git a/meta-initramfs/recipes-bsp/kexecboot/<a href=3D"http://ke=
xecboot_git.bb" rel=3D"noreferrer" target=3D"_blank">kexecboot_git.bb</a> b=
/meta-initramfs/recipes-bsp/kexecboot/<a href=3D"http://kexecboot_git.bb" r=
el=3D"noreferrer" target=3D"_blank">kexecboot_git.bb</a><br>
&gt; index 62d1effccc..a92c0e8966 100644<br>
&gt; --- a/meta-initramfs/recipes-bsp/kexecboot/<a href=3D"http://kexecboot=
_git.bb" rel=3D"noreferrer" target=3D"_blank">kexecboot_git.bb</a><br>
&gt; +++ b/meta-initramfs/recipes-bsp/kexecboot/<a href=3D"http://kexecboot=
_git.bb" rel=3D"noreferrer" target=3D"_blank">kexecboot_git.bb</a><br>
&gt; @@ -3,7 +3,7 @@ DESCRIPTION =3D &quot;kexecboot is a graphical linux-a=
s-bootloader implementation based<br>
&gt;=C2=A0 HOMEPAGE =3D &quot;<a href=3D"https://github.com/kexecboot/kexec=
boot/wiki" rel=3D"noreferrer" target=3D"_blank">https://github.com/kexecboo=
t/kexecboot/wiki</a>&quot;<br>
&gt;=C2=A0 LICENSE =3D &quot;GPL-2.0-only&quot;<br>
&gt;=C2=A0 LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D94d55d512a9ba36c=
aa9b7df079bae19f&quot;<br>
&gt; -PV =3D &quot;0.6+git${SRCPV}&quot;<br>
&gt; +PV =3D &quot;0.6+git&quot;<br>
&gt;=C2=A0 S =3D &quot;${WORKDIR}/git&quot;<br>
&gt;=C2=A0 SRC_URI =3D &quot;git://<a href=3D"http://github.com/kexecboot/k=
execboot.git;branch=3Dmaster;protocol=3Dhttps" rel=3D"noreferrer" target=3D=
"_blank">github.com/kexecboot/kexecboot.git;branch=3Dmaster;protocol=3Dhttp=
s</a>&quot;<br>
&gt;=C2=A0 SRC_URI:append:libc-klibc =3D &quot;\<br>
&gt; diff --git a/meta-initramfs/recipes-kernel/kexec/<a href=3D"http://kex=
ec-tools-klibc_git.bb" rel=3D"noreferrer" target=3D"_blank">kexec-tools-kli=
bc_git.bb</a> b/meta-initramfs/recipes-kernel/kexec/<a href=3D"http://kexec=
-tools-klibc_git.bb" rel=3D"noreferrer" target=3D"_blank">kexec-tools-klibc=
_git.bb</a><br>
&gt; index 5c7e84cc99..adfc3ba73a 100644<br>
&gt; --- a/meta-initramfs/recipes-kernel/kexec/<a href=3D"http://kexec-tool=
s-klibc_git.bb" rel=3D"noreferrer" target=3D"_blank">kexec-tools-klibc_git.=
bb</a><br>
&gt; +++ b/meta-initramfs/recipes-kernel/kexec/<a href=3D"http://kexec-tool=
s-klibc_git.bb" rel=3D"noreferrer" target=3D"_blank">kexec-tools-klibc_git.=
bb</a><br>
&gt; @@ -5,7 +5,7 @@ SECTION =3D &quot;kernel/userland&quot;<br>
&gt;=C2=A0 LICENSE =3D &quot;GPL-2.0-only&quot;<br>
&gt;=C2=A0 LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Dea5bed2f60d35761=
8ca161ad539f7c0a \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 file://kexec/kexec.c;beginline=3D1;endline=3D20;md5=3Daf10f6ae4a8715=
965e648aa687ad3e09&quot;<br>
&gt; -PV =3D &quot;2.0.18+git${SRCPV}&quot;<br>
&gt; +PV =3D &quot;2.0.18+git&quot;<br>
&gt;<br>
&gt;=C2=A0 DEPENDS =3D &quot;zlib xz&quot;<br>
&gt;<br>
&gt; diff --git a/meta-multimedia/recipes-dvb/oscam/<a href=3D"http://oscam=
_svn.bb" rel=3D"noreferrer" target=3D"_blank">oscam_svn.bb</a> b/meta-multi=
media/recipes-dvb/oscam/<a href=3D"http://oscam_svn.bb" rel=3D"noreferrer" =
target=3D"_blank">oscam_svn.bb</a><br>
&gt; index bd2df5d8d6..8fbf9ab2c8 100644<br>
&gt; --- a/meta-multimedia/recipes-dvb/oscam/<a href=3D"http://oscam_svn.bb=
" rel=3D"noreferrer" target=3D"_blank">oscam_svn.bb</a><br>
&gt; +++ b/meta-multimedia/recipes-dvb/oscam/<a href=3D"http://oscam_svn.bb=
" rel=3D"noreferrer" target=3D"_blank">oscam_svn.bb</a><br>
&gt; @@ -9,7 +9,7 @@ DEPENDS =3D &quot;libusb1 openssl pcsc-lite&quot;<br>
&gt;=C2=A0 SRC_URI =3D &quot;svn://<a href=3D"http://www.streamboard.tv/svn=
/oscam;module=3Dtrunk;protocol=3Dhttp" rel=3D"noreferrer" target=3D"_blank"=
>www.streamboard.tv/svn/oscam;module=3Dtrunk;protocol=3Dhttp</a> \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt;=C2=A0 SRCREV =3D &quot;11718&quot;<br>
&gt; -PV =3D &quot;1.10+${SRCPV}&quot;<br>
&gt; +PV =3D &quot;1.10+&quot;<br>
&gt;<br>
&gt;=C2=A0 S =3D &quot;${WORKDIR}/trunk&quot;<br>
&gt;<br>
&gt; diff --git a/meta-multimedia/recipes-dvb/tvheadend/<a href=3D"http://t=
vheadend_git.bb" rel=3D"noreferrer" target=3D"_blank">tvheadend_git.bb</a> =
b/meta-multimedia/recipes-dvb/tvheadend/<a href=3D"http://tvheadend_git.bb"=
 rel=3D"noreferrer" target=3D"_blank">tvheadend_git.bb</a><br>
&gt; index d64ee96f78..2d79777001 100644<br>
&gt; --- a/meta-multimedia/recipes-dvb/tvheadend/<a href=3D"http://tvheaden=
d_git.bb" rel=3D"noreferrer" target=3D"_blank">tvheadend_git.bb</a><br>
&gt; +++ b/meta-multimedia/recipes-dvb/tvheadend/<a href=3D"http://tvheaden=
d_git.bb" rel=3D"noreferrer" target=3D"_blank">tvheadend_git.bb</a><br>
&gt; @@ -13,7 +13,7 @@ SRC_URI =3D &quot;git://<a href=3D"http://github.com=
/tvheadend/tvheadend.git;branch=3Dmaster;protocol=3Dhttps" rel=3D"noreferre=
r" target=3D"_blank">github.com/tvheadend/tvheadend.git;branch=3Dmaster;pro=
tocol=3Dhttps</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt;<br>
&gt;=C2=A0 SRCREV =3D &quot;cc602833684953fc3e6f1c89d4f08f6dfef179e3&quot;<=
br>
&gt; -PV =3D &quot;4.3+git${SRCPV}&quot;<br>
&gt; +PV =3D &quot;4.3+git&quot;<br>
&gt;=C2=A0 PKGV =3D &quot;4.3+git${GITPKGV}&quot;<br>
&gt;<br>
&gt;=C2=A0 S =3D &quot;${WORKDIR}/git&quot;<br>
&gt; diff --git a/meta-multimedia/recipes-multimedia/bluealsa/<a href=3D"ht=
tp://bluealsa_git.bb" rel=3D"noreferrer" target=3D"_blank">bluealsa_git.bb<=
/a> b/meta-multimedia/recipes-multimedia/bluealsa/<a href=3D"http://blueals=
a_git.bb" rel=3D"noreferrer" target=3D"_blank">bluealsa_git.bb</a><br>
&gt; index ab0d8bca9f..5007c88fff 100644<br>
&gt; --- a/meta-multimedia/recipes-multimedia/bluealsa/<a href=3D"http://bl=
uealsa_git.bb" rel=3D"noreferrer" target=3D"_blank">bluealsa_git.bb</a><br>
&gt; +++ b/meta-multimedia/recipes-multimedia/bluealsa/<a href=3D"http://bl=
uealsa_git.bb" rel=3D"noreferrer" target=3D"_blank">bluealsa_git.bb</a><br>
&gt; @@ -8,7 +8,7 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D8449a4=
f133a93f6254b496d4fb476e83&quot;<br>
&gt;=C2=A0 SRC_URI =3D &quot;git://<a href=3D"http://github.com/Arkq/bluez-=
alsa.git;protocol=3Dhttps;branch=3Dmaster" rel=3D"noreferrer" target=3D"_bl=
ank">github.com/Arkq/bluez-alsa.git;protocol=3Dhttps;branch=3Dmaster</a>&qu=
ot;<br>
&gt;<br>
&gt;=C2=A0 SRCREV =3D &quot;dd05a1baa261b94da9ba977b5e3392c8b4dc7a5e&quot;<=
br>
&gt; -PV =3D &quot;4.0.0+git${SRCPV}&quot;<br>
&gt; +PV =3D &quot;4.0.0+git&quot;<br>
&gt;<br>
&gt;=C2=A0 S=C2=A0 =3D &quot;${WORKDIR}/git&quot;<br>
&gt;<br>
&gt; diff --git a/meta-multimedia/recipes-multimedia/dleyna/<a href=3D"http=
://dleyna-server_0.6.0.bb" rel=3D"noreferrer" target=3D"_blank">dleyna-serv=
er_0.6.0.bb</a> b/meta-multimedia/recipes-multimedia/dleyna/<a href=3D"http=
://dleyna-server_0.6.0.bb" rel=3D"noreferrer" target=3D"_blank">dleyna-serv=
er_0.6.0.bb</a><br>
&gt; index 719aecede1..b0a347f252 100644<br>
&gt; --- a/meta-multimedia/recipes-multimedia/dleyna/<a href=3D"http://dley=
na-server_0.6.0.bb" rel=3D"noreferrer" target=3D"_blank">dleyna-server_0.6.=
0.bb</a><br>
&gt; +++ b/meta-multimedia/recipes-multimedia/dleyna/<a href=3D"http://dley=
na-server_0.6.0.bb" rel=3D"noreferrer" target=3D"_blank">dleyna-server_0.6.=
0.bb</a><br>
&gt; @@ -11,7 +11,7 @@ LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D4fbd=
65380cdd255951079008b364516c \<br>
&gt;=C2=A0 DEPENDS =3D &quot;glib-2.0 gssdp gupnp gupnp-av gupnp-dlna libso=
up-2.4 libxml2 dleyna-core&quot;<br>
&gt;=C2=A0 RDEPENDS:${PN} =3D &quot;dleyna-connector-dbus&quot;<br>
&gt;<br>
&gt; -PV .=3D &quot;+git${SRCPV}&quot;<br>
&gt; +PV .=3D &quot;+git&quot;<br>
&gt;=C2=A0 SRC_URI =3D &quot;git://<a href=3D"http://github.com/01org/$%7BB=
PN%7D.git;branch=3Dmaster;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_b=
lank">github.com/01org/${BPN}.git;branch=3Dmaster;protocol=3Dhttps</a>&quot=
;<br>
&gt;=C2=A0 SRCREV =3D &quot;eb895ae82715e9889a948ffa810c0f828b4f4c76&quot;<=
br>
&gt;=C2=A0 S =3D &quot;${WORKDIR}/git&quot;<br>
&gt; diff --git a/meta-multimedia/recipes-multimedia/libsquish/<a href=3D"h=
ttp://libsquish_git.bb" rel=3D"noreferrer" target=3D"_blank">libsquish_git.=
bb</a> b/meta-multimedia/recipes-multimedia/libsquish/<a href=3D"http://lib=
squish_git.bb" rel=3D"noreferrer" target=3D"_blank">libsquish_git.bb</a><br=
>
&gt; index fb74881c03..3d631ea0b6 100644<br>
&gt; --- a/meta-multimedia/recipes-multimedia/libsquish/<a href=3D"http://l=
ibsquish_git.bb" rel=3D"noreferrer" target=3D"_blank">libsquish_git.bb</a><=
br>
&gt; +++ b/meta-multimedia/recipes-multimedia/libsquish/<a href=3D"http://l=
ibsquish_git.bb" rel=3D"noreferrer" target=3D"_blank">libsquish_git.bb</a><=
br>
&gt; @@ -3,7 +3,7 @@ SUMMARY =3D &quot;The squish library (abbreviated to l=
ibsquish) is an open source DXT c<br>
&gt;=C2=A0 LICENSE =3D &quot;MIT&quot;<br>
&gt;=C2=A0 LIC_FILES_CHKSUM =3D &quot;file://alpha.cpp;beginline=3D3;endlin=
e=3D22;md5=3D6665e479f71feb92d590ea9ae9b9f6d5&quot;<br>
&gt;<br>
&gt; -PV =3D &quot;1.10+git${SRCPV}&quot;<br>
&gt; +PV =3D &quot;1.10+git&quot;<br>
&gt;<br>
&gt;=C2=A0 SRCREV =3D &quot;52e7d93c5947f72380521116c05d97c528863ba8&quot;<=
br>
&gt;=C2=A0 SRC_URI =3D &quot;git://<a href=3D"http://github.com/OpenELEC/li=
bsquish.git;protocol=3Dhttps;branch=3Dmaster" rel=3D"noreferrer" target=3D"=
_blank">github.com/OpenELEC/libsquish.git;protocol=3Dhttps;branch=3Dmaster<=
/a> \<br>
&gt; diff --git a/meta-multimedia/recipes-multimedia/musicbrainz/<a href=3D=
"http://libmusicbrainz_git.bb" rel=3D"noreferrer" target=3D"_blank">libmusi=
cbrainz_git.bb</a> b/meta-multimedia/recipes-multimedia/musicbrainz/<a href=
=3D"http://libmusicbrainz_git.bb" rel=3D"noreferrer" target=3D"_blank">libm=
usicbrainz_git.bb</a><br>
&gt; index 3b365444e2..e8b10bc680 100644<br>
&gt; --- a/meta-multimedia/recipes-multimedia/musicbrainz/<a href=3D"http:/=
/libmusicbrainz_git.bb" rel=3D"noreferrer" target=3D"_blank">libmusicbrainz=
_git.bb</a><br>
&gt; +++ b/meta-multimedia/recipes-multimedia/musicbrainz/<a href=3D"http:/=
/libmusicbrainz_git.bb" rel=3D"noreferrer" target=3D"_blank">libmusicbrainz=
_git.bb</a><br>
&gt; @@ -5,7 +5,7 @@ LICENSE =3D &quot;LGPL-2.1-or-later&quot;<br>
&gt;=C2=A0 LIC_FILES_CHKSUM =3D &quot;file://COPYING.txt;md5=3Dfbc093901857=
fcd118f065f900982c24&quot;<br>
&gt;=C2=A0 DEPENDS =3D &quot;expat libxml2 libxml2-native neon neon-native =
libmusicbrainz-native&quot;<br>
&gt;<br>
&gt; -PV =3D &quot;5.1.0+git${SRCPV}&quot;<br>
&gt; +PV =3D &quot;5.1.0+git&quot;<br>
&gt;<br>
&gt;=C2=A0 SRCREV =3D &quot;8be45b12a86bc0e46f2f836c8ac88e1e98d82aee&quot;<=
br>
&gt;=C2=A0 SRC_URI =3D &quot;git://<a href=3D"http://github.com/metabrainz/=
libmusicbrainz.git;branch=3Dmaster;protocol=3Dhttps" rel=3D"noreferrer" tar=
get=3D"_blank">github.com/metabrainz/libmusicbrainz.git;branch=3Dmaster;pro=
tocol=3Dhttps</a> \<br>
&gt; diff --git a/meta-multimedia/recipes-support/gst-instruments/<a href=
=3D"http://gst-instruments_git.bb" rel=3D"noreferrer" target=3D"_blank">gst=
-instruments_git.bb</a> b/meta-multimedia/recipes-support/gst-instruments/<=
a href=3D"http://gst-instruments_git.bb" rel=3D"noreferrer" target=3D"_blan=
k">gst-instruments_git.bb</a><br>
&gt; index 8f0ad65120..df688bbcda 100644<br>
&gt; --- a/meta-multimedia/recipes-support/gst-instruments/<a href=3D"http:=
//gst-instruments_git.bb" rel=3D"noreferrer" target=3D"_blank">gst-instrume=
nts_git.bb</a><br>
&gt; +++ b/meta-multimedia/recipes-support/gst-instruments/<a href=3D"http:=
//gst-instruments_git.bb" rel=3D"noreferrer" target=3D"_blank">gst-instrume=
nts_git.bb</a><br>
&gt; @@ -6,7 +6,7 @@ LICENSE =3D &quot;LGPL-3.0-only&quot;<br>
&gt;=C2=A0 LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3De6a600fd5e1d9cbd=
e2d983680233ad02&quot;<br>
&gt;=C2=A0 DEPENDS =3D &quot;gstreamer1.0&quot;<br>
&gt;=C2=A0 SRCREV =3D &quot;cb8977a6711657e32853159cd539d1d75fcbc772&quot;<=
br>
&gt; -PV =3D &quot;0.3.1+git${SRCPV}&quot;<br>
&gt; +PV =3D &quot;0.3.1+git&quot;<br>
&gt;<br>
&gt;=C2=A0 SRC_URI =3D &quot;git://<a href=3D"http://github.com/kirushyk/gs=
t-instruments.git;protocol=3Dhttps;branch=3Dmaster" rel=3D"noreferrer" targ=
et=3D"_blank">github.com/kirushyk/gst-instruments.git;protocol=3Dhttps;bran=
ch=3Dmaster</a>&quot;<br>
&gt;<br>
&gt; diff --git a/meta-networking/recipes-connectivity/bearssl/<a href=3D"h=
ttp://bearssl_0.6.bb" rel=3D"noreferrer" target=3D"_blank">bearssl_0.6.bb</=
a> b/meta-networking/recipes-connectivity/bearssl/<a href=3D"http://bearssl=
_0.6.bb" rel=3D"noreferrer" target=3D"_blank">bearssl_0.6.bb</a><br>
&gt; index 1e70a3dec6..39569e9d06 100644<br>
&gt; --- a/meta-networking/recipes-connectivity/bearssl/<a href=3D"http://b=
earssl_0.6.bb" rel=3D"noreferrer" target=3D"_blank">bearssl_0.6.bb</a><br>
&gt; +++ b/meta-networking/recipes-connectivity/bearssl/<a href=3D"http://b=
earssl_0.6.bb" rel=3D"noreferrer" target=3D"_blank">bearssl_0.6.bb</a><br>
&gt; @@ -23,7 +23,7 @@ inherit lib_package<br>
&gt;=C2=A0 LICENSE =3D &quot;MIT&quot;<br>
&gt;=C2=A0 LIC_FILES_CHKSUM =3D &quot;file://LICENSE.txt;md5=3D1fc37e1037ae=
673975fbcb96a98f7191&quot;<br>
&gt;<br>
&gt; -PV .=3D &quot;+git${SRCPV}&quot;<br>
&gt; +PV .=3D &quot;+git&quot;<br>
&gt;=C2=A0 SRCREV =3D &quot;79c060eea3eea1257797f15ea1608a9a9923aa6f&quot;<=
br>
&gt;=C2=A0 SRC_URI =3D &quot;git://<a href=3D"http://www.bearssl.org/git/Be=
arSSL;protocol=3Dhttps;branch=3Dmaster" rel=3D"noreferrer" target=3D"_blank=
">www.bearssl.org/git/BearSSL;protocol=3Dhttps;branch=3Dmaster</a> \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0002-test-test_x=
509.c-fix-potential-overflow-issue.patch \<br>
&gt; diff --git a/meta-networking/recipes-connectivity/bluepy/<a href=3D"ht=
tp://bluepy_git.bb" rel=3D"noreferrer" target=3D"_blank">bluepy_git.bb</a> =
b/meta-networking/recipes-connectivity/bluepy/<a href=3D"http://bluepy_git.=
bb" rel=3D"noreferrer" target=3D"_blank">bluepy_git.bb</a><br>
&gt; index 8e164708ed..5b784d9a04 100644<br>
&gt; --- a/meta-networking/recipes-connectivity/bluepy/<a href=3D"http://bl=
uepy_git.bb" rel=3D"noreferrer" target=3D"_blank">bluepy_git.bb</a><br>
&gt; +++ b/meta-networking/recipes-connectivity/bluepy/<a href=3D"http://bl=
uepy_git.bb" rel=3D"noreferrer" target=3D"_blank">bluepy_git.bb</a><br>
&gt; @@ -5,7 +5,7 @@ LICENSE =3D &quot;GPL-2.0-only &amp; PD&quot;<br>
&gt;=C2=A0 LIC_FILES_CHKSUM =3D &quot;file://LICENSE.txt;md5=3D59e0d45ea684=
dda215889aa1b5acd001&quot;<br>
&gt;=C2=A0 DEPENDS =3D &quot;glib-2.0&quot;<br>
&gt;=C2=A0 SRCREV =3D &quot;7ad565231a97c304c0eff45f2649cd005e69db09&quot;<=
br>
&gt; -PV =3D &quot;1.3.0+git${SRCPV}&quot;<br>
&gt; +PV =3D &quot;1.3.0+git&quot;<br>
&gt;<br>
&gt;=C2=A0 SRC_URI =3D &quot;git://<a href=3D"http://github.com/IanHarvey/b=
luepy.git;protocol=3Dhttps;branch=3Dmaster" rel=3D"noreferrer" target=3D"_b=
lank">github.com/IanHarvey/bluepy.git;protocol=3Dhttps;branch=3Dmaster</a> =
\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-bluepy-Fix-=
username-issue-with-tarballs.patch \<br>
&gt; diff --git a/meta-networking/recipes-connectivity/openthread/<a href=
=3D"http://ot-br-posix_git.bb" rel=3D"noreferrer" target=3D"_blank">ot-br-p=
osix_git.bb</a> b/meta-networking/recipes-connectivity/openthread/<a href=
=3D"http://ot-br-posix_git.bb" rel=3D"noreferrer" target=3D"_blank">ot-br-p=
osix_git.bb</a><br>
&gt; index 720228dc14..71e5a8d43b 100644<br>
&gt; --- a/meta-networking/recipes-connectivity/openthread/<a href=3D"http:=
//ot-br-posix_git.bb" rel=3D"noreferrer" target=3D"_blank">ot-br-posix_git.=
bb</a><br>
&gt; +++ b/meta-networking/recipes-connectivity/openthread/<a href=3D"http:=
//ot-br-posix_git.bb" rel=3D"noreferrer" target=3D"_blank">ot-br-posix_git.=
bb</a><br>
&gt; @@ -12,7 +12,7 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D8710=
9e44b2fda96a8991f27684a7349c \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &quot;<br>
&gt;=C2=A0 DEPENDS =3D &quot;autoconf-archive dbus readline avahi jsoncpp b=
oost libnetfilter-queue&quot;<br>
&gt;=C2=A0 SRCREV =3D &quot;ad6822257ffddbac295db97186e4ab449a2ed32a&quot;<=
br>
&gt; -PV =3D &quot;0.3.0+git${SRCPV}&quot;<br>
&gt; +PV =3D &quot;0.3.0+git&quot;<br>
&gt;<br>
&gt;=C2=A0 SRC_URI =3D &quot;gitsm://<a href=3D"http://github.com/openthrea=
d/ot-br-posix.git;protocol=3Dhttps;branch=3Dmain" rel=3D"noreferrer" target=
=3D"_blank">github.com/openthread/ot-br-posix.git;protocol=3Dhttps;branch=
=3Dmain</a> \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-otbr-agent.=
service.in-remove-pre-exec-hook-for-mdns-.patch \<br>
&gt; diff --git a/meta-networking/recipes-connectivity/openthread/<a href=
=3D"http://ot-daemon_git.bb" rel=3D"noreferrer" target=3D"_blank">ot-daemon=
_git.bb</a> b/meta-networking/recipes-connectivity/openthread/<a href=3D"ht=
tp://ot-daemon_git.bb" rel=3D"noreferrer" target=3D"_blank">ot-daemon_git.b=
b</a><br>
&gt; index 18703d6c4d..1583a3f837 100644<br>
&gt; --- a/meta-networking/recipes-connectivity/openthread/<a href=3D"http:=
//ot-daemon_git.bb" rel=3D"noreferrer" target=3D"_blank">ot-daemon_git.bb</=
a><br>
&gt; +++ b/meta-networking/recipes-connectivity/openthread/<a href=3D"http:=
//ot-daemon_git.bb" rel=3D"noreferrer" target=3D"_blank">ot-daemon_git.bb</=
a><br>
&gt; @@ -9,7 +9,7 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D543b6f=
e90ec5901a683320a36390c65f \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &quot;<br>
&gt;=C2=A0 DEPENDS =3D &quot;readline&quot;<br>
&gt;=C2=A0 SRCREV =3D &quot;7dfde1f12923f03c9680be4d838b94b7a2320324&quot;<=
br>
&gt; -PV =3D &quot;0.1+git${SRCPV}&quot;<br>
&gt; +PV =3D &quot;0.1+git&quot;<br>
&gt;<br>
&gt;=C2=A0 SRC_URI =3D &quot;git://<a href=3D"http://github.com/openthread/=
openthread.git;protocol=3Dhttps;branch=3Dmain" rel=3D"noreferrer" target=3D=
"_blank">github.com/openthread/openthread.git;protocol=3Dhttps;branch=3Dmai=
n</a> \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-bn_mul.h-fi=
x-x86-PIC-inline-ASM-compilation-with-GCC.patch \<br>
&gt; diff --git a/meta-networking/recipes-connectivity/openthread/<a href=
=3D"http://wpantund_git.bb" rel=3D"noreferrer" target=3D"_blank">wpantund_g=
it.bb</a> b/meta-networking/recipes-connectivity/openthread/<a href=3D"http=
://wpantund_git.bb" rel=3D"noreferrer" target=3D"_blank">wpantund_git.bb</a=
><br>
&gt; index ebb3fc3c1c..b75d686e58 100644<br>
&gt; --- a/meta-networking/recipes-connectivity/openthread/<a href=3D"http:=
//wpantund_git.bb" rel=3D"noreferrer" target=3D"_blank">wpantund_git.bb</a>=
<br>
&gt; +++ b/meta-networking/recipes-connectivity/openthread/<a href=3D"http:=
//wpantund_git.bb" rel=3D"noreferrer" target=3D"_blank">wpantund_git.bb</a>=
<br>
&gt; @@ -13,7 +13,7 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3De782=
0bc7f7d1638a6b54fc2e8d7fb103 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &quot;<br>
&gt;=C2=A0 DEPENDS =3D &quot;autoconf-archive dbus readline boost&quot;<br>
&gt;=C2=A0 SRCREV =3D &quot;0fb1f57e4224e2df3e630e146702bfcf63fbf07a&quot;<=
br>
&gt; -PV =3D &quot;0.07.01+git${SRCPV}&quot;<br>
&gt; +PV =3D &quot;0.07.01+git&quot;<br>
&gt;<br>
&gt;=C2=A0 SRC_URI =3D &quot;gitsm://<a href=3D"http://github.com/openthrea=
d/wpantund.git;protocol=3Dhttps;branch=3Dmaster" rel=3D"noreferrer" target=
=3D"_blank">github.com/openthread/wpantund.git;protocol=3Dhttps;branch=3Dma=
ster</a> \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt; diff --git a/meta-networking/recipes-connectivity/relayd/<a href=3D"ht=
tp://relayd_git.bb" rel=3D"noreferrer" target=3D"_blank">relayd_git.bb</a> =
b/meta-networking/recipes-connectivity/relayd/<a href=3D"http://relayd_git.=
bb" rel=3D"noreferrer" target=3D"_blank">relayd_git.bb</a><br>
&gt; index 79e1743fdf..871df69909 100644<br>
&gt; --- a/meta-networking/recipes-connectivity/relayd/<a href=3D"http://re=
layd_git.bb" rel=3D"noreferrer" target=3D"_blank">relayd_git.bb</a><br>
&gt; +++ b/meta-networking/recipes-connectivity/relayd/<a href=3D"http://re=
layd_git.bb" rel=3D"noreferrer" target=3D"_blank">relayd_git.bb</a><br>
&gt; @@ -8,7 +8,7 @@ DEPENDS =3D &quot;libubox&quot;<br>
&gt;=C2=A0 SRC_URI =3D &quot;git://<a href=3D"http://git.openwrt.org/projec=
t/relayd.git;branch=3Dmaster" rel=3D"noreferrer" target=3D"_blank">git.open=
wrt.org/project/relayd.git;branch=3Dmaster</a>&quot;<br>
&gt;<br>
&gt;=C2=A0 SRCREV =3D &quot;f646ba40489371e69f624f2dee2fc4e19ceec00e&quot;<=
br>
&gt; -PV =3D &quot;0.0.1+git${SRCPV}&quot;<br>
&gt; +PV =3D &quot;0.0.1+git&quot;<br>
&gt;<br>
&gt;=C2=A0 UPSTREAM_CHECK_COMMITS =3D &quot;1&quot;<br>
&gt;<br>
&gt; diff --git a/meta-networking/recipes-filter/ulogd2/<a href=3D"http://u=
logd2_2.0.8.bb" rel=3D"noreferrer" target=3D"_blank">ulogd2_2.0.8.bb</a> b/=
meta-networking/recipes-filter/ulogd2/<a href=3D"http://ulogd2_2.0.8.bb" re=
l=3D"noreferrer" target=3D"_blank">ulogd2_2.0.8.bb</a><br>
&gt; index 19bd32ccd4..d075ec4788 100644<br>
&gt; --- a/meta-networking/recipes-filter/ulogd2/<a href=3D"http://ulogd2_2=
.0.8.bb" rel=3D"noreferrer" target=3D"_blank">ulogd2_2.0.8.bb</a><br>
&gt; +++ b/meta-networking/recipes-filter/ulogd2/<a href=3D"http://ulogd2_2=
.0.8.bb" rel=3D"noreferrer" target=3D"_blank">ulogd2_2.0.8.bb</a><br>
&gt; @@ -9,7 +9,7 @@ LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Dc93c05=
50bd3173f4504b2cbd8991e50b&quot;<br>
&gt;=C2=A0 DEPENDS =3D &quot;libnfnetlink&quot;<br>
&gt;=C2=A0 PROVIDES =3D &quot;ulogd&quot;<br>
&gt;<br>
&gt; -PV .=3D &quot;+git${SRCPV}&quot;<br>
&gt; +PV .=3D &quot;+git&quot;<br>
&gt;<br>
&gt;=C2=A0 SRC_URI =3D &quot;git://<a href=3D"http://git.netfilter.org/ulog=
d2;branch=3Dmaster" rel=3D"noreferrer" target=3D"_blank">git.netfilter.org/=
ulogd2;branch=3Dmaster</a> \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://ulogd.init \<br>
&gt; diff --git a/meta-networking/recipes-protocols/openflow/<a href=3D"htt=
p://openflow_git.bb" rel=3D"noreferrer" target=3D"_blank">openflow_git.bb</=
a> b/meta-networking/recipes-protocols/openflow/<a href=3D"http://openflow_=
git.bb" rel=3D"noreferrer" target=3D"_blank">openflow_git.bb</a><br>
&gt; index 1ac5dd4105..f39888e8f1 100644<br>
&gt; --- a/meta-networking/recipes-protocols/openflow/<a href=3D"http://ope=
nflow_git.bb" rel=3D"noreferrer" target=3D"_blank">openflow_git.bb</a><br>
&gt; +++ b/meta-networking/recipes-protocols/openflow/<a href=3D"http://ope=
nflow_git.bb" rel=3D"noreferrer" target=3D"_blank">openflow_git.bb</a><br>
&gt; @@ -1,7 +1,7 @@<br>
&gt;=C2=A0 include ${BPN}.inc<br>
&gt;<br>
&gt;=C2=A0 SRCREV =3D &quot;c84f33f09d5dbcfc9b489f64cb30475bf36f653a&quot;<=
br>
&gt; -PV =3D &quot;1.0+git${SRCPV}&quot;<br>
&gt; +PV =3D &quot;1.0+git&quot;<br>
&gt;<br>
&gt;=C2=A0 SRC_URI +=3D &quot;file://0001-Check-and-use-strlcpy-from-libc-b=
efore-defining-own.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0002-lib-netdev-=
Adjust-header-include-sequence.patch \<br>
&gt; diff --git a/meta-networking/recipes-protocols/openlldp/<a href=3D"htt=
p://openlldp_1.1.0.bb" rel=3D"noreferrer" target=3D"_blank">openlldp_1.1.0.=
bb</a> b/meta-networking/recipes-protocols/openlldp/<a href=3D"http://openl=
ldp_1.1.0.bb" rel=3D"noreferrer" target=3D"_blank">openlldp_1.1.0.bb</a><br=
>
&gt; index 812f4fbcf0..71d738ddc1 100644<br>
&gt; --- a/meta-networking/recipes-protocols/openlldp/<a href=3D"http://ope=
nlldp_1.1.0.bb" rel=3D"noreferrer" target=3D"_blank">openlldp_1.1.0.bb</a><=
br>
&gt; +++ b/meta-networking/recipes-protocols/openlldp/<a href=3D"http://ope=
nlldp_1.1.0.bb" rel=3D"noreferrer" target=3D"_blank">openlldp_1.1.0.bb</a><=
br>
&gt; @@ -13,7 +13,7 @@ inherit ${@bb.utils.contains(&#39;DISTRO_FEATURES&#3=
9;, &#39;systemd&#39;, &#39;systemd&#39;, &#39;&#39;, d)}<br>
&gt;=C2=A0 DEPENDS =3D &quot;libnl libconfig readline&quot;<br>
&gt;<br>
&gt;=C2=A0 SRCREV =3D &quot;85e55837a81d710e5baa7da47f7ed0d205c8ede5&quot;<=
br>
&gt; -PV .=3D &quot;+git${SRCPV}&quot;<br>
&gt; +PV .=3D &quot;+git&quot;<br>
&gt;=C2=A0 SRC_URI =3D &quot;git://<a href=3D"http://github.com/intel/openl=
ldp.git;protocol=3Dhttps;branch=3Dbranch-1.1" rel=3D"noreferrer" target=3D"=
_blank">github.com/intel/openlldp.git;protocol=3Dhttps;branch=3Dbranch-1.1<=
/a> \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Fix-musl-li=
bc-build-issue.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-autotools-A=
dd-include-path-to-generated-version.h.patch \<br>
&gt; diff --git a/meta-networking/recipes-support/arptables/<a href=3D"http=
://arptables_git.bb" rel=3D"noreferrer" target=3D"_blank">arptables_git.bb<=
/a> b/meta-networking/recipes-support/arptables/<a href=3D"http://arptables=
_git.bb" rel=3D"noreferrer" target=3D"_blank">arptables_git.bb</a><br>
&gt; index 898b69682d..949794bf30 100644<br>
&gt; --- a/meta-networking/recipes-support/arptables/<a href=3D"http://arpt=
ables_git.bb" rel=3D"noreferrer" target=3D"_blank">arptables_git.bb</a><br>
&gt; +++ b/meta-networking/recipes-support/arptables/<a href=3D"http://arpt=
ables_git.bb" rel=3D"noreferrer" target=3D"_blank">arptables_git.bb</a><br>
&gt; @@ -3,7 +3,7 @@ SECTION =3D &quot;net&quot;<br>
&gt;=C2=A0 LICENSE =3D &quot;GPL-2.0-only&quot;<br>
&gt;=C2=A0 LIC_FILES_CHKSUM =3D &quot;file://${COREBASE}/meta/files/common-=
licenses/GPL-2.0-only;md5=3D801f80980d171dd6425610833a22dbe6&quot;<br>
&gt;=C2=A0 SRCREV =3D &quot;efae8949e31f8b2eb6290f377a28384cecaf105a&quot;<=
br>
&gt; -PV =3D &quot;0.0.5+git${SRCPV}&quot;<br>
&gt; +PV =3D &quot;0.0.5+git&quot;<br>
&gt;<br>
&gt;=C2=A0 SRC_URI =3D &quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 git://<a href=3D"http://git.netfilter.org/arptable=
s;branch=3Dmaster" rel=3D"noreferrer" target=3D"_blank">git.netfilter.org/a=
rptables;branch=3Dmaster</a> \<br>
&gt; diff --git a/meta-networking/recipes-support/celt051/<a href=3D"http:/=
/celt051_git.bb" rel=3D"noreferrer" target=3D"_blank">celt051_git.bb</a> b/=
meta-networking/recipes-support/celt051/<a href=3D"http://celt051_git.bb" r=
el=3D"noreferrer" target=3D"_blank">celt051_git.bb</a><br>
&gt; index 62682cfce3..4842a0fbdf 100644<br>
&gt; --- a/meta-networking/recipes-support/celt051/<a href=3D"http://celt05=
1_git.bb" rel=3D"noreferrer" target=3D"_blank">celt051_git.bb</a><br>
&gt; +++ b/meta-networking/recipes-support/celt051/<a href=3D"http://celt05=
1_git.bb" rel=3D"noreferrer" target=3D"_blank">celt051_git.bb</a><br>
&gt; @@ -12,7 +12,7 @@ like Speex, GSM, or G.729.&quot;<br>
&gt;=C2=A0 LICENSE =3D &quot;BSD-2-Clause&quot;<br>
&gt;=C2=A0 LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D375f60ab360d17f0=
172737036ff155b2&quot;<br>
&gt;<br>
&gt; -PV =3D &quot;0.5.1.3+git${SRCPV}&quot;<br>
&gt; +PV =3D &quot;0.5.1.3+git&quot;<br>
&gt;<br>
&gt;=C2=A0 SRCREV =3D &quot;5555aae843f57241d005e330b9cb65602d56db0f&quot;<=
br>
&gt;<br>
&gt; diff --git a/meta-networking/recipes-support/lksctp-tools/<a href=3D"h=
ttp://lksctp-tools_1.0.19.bb" rel=3D"noreferrer" target=3D"_blank">lksctp-t=
ools_1.0.19.bb</a> b/meta-networking/recipes-support/lksctp-tools/<a href=
=3D"http://lksctp-tools_1.0.19.bb" rel=3D"noreferrer" target=3D"_blank">lks=
ctp-tools_1.0.19.bb</a><br>
&gt; index 4a9d2f54d9..3f945eeeee 100644<br>
&gt; --- a/meta-networking/recipes-support/lksctp-tools/<a href=3D"http://l=
ksctp-tools_1.0.19.bb" rel=3D"noreferrer" target=3D"_blank">lksctp-tools_1.=
0.19.bb</a><br>
&gt; +++ b/meta-networking/recipes-support/lksctp-tools/<a href=3D"http://l=
ksctp-tools_1.0.19.bb" rel=3D"noreferrer" target=3D"_blank">lksctp-tools_1.=
0.19.bb</a><br>
&gt; @@ -10,7 +10,7 @@ LIC_FILES_CHKSUM =3D &quot; \<br>
&gt;<br>
&gt;=C2=A0 SRCREV =3D &quot;05b50d379ff0037de4957bb2a1befcce88b70225&quot;<=
br>
&gt;<br>
&gt; -PV .=3D &quot;+git${SRCPV}&quot;<br>
&gt; +PV .=3D &quot;+git&quot;<br>
&gt;=C2=A0 LK_REL =3D &quot;1.0.19&quot;<br>
&gt;<br>
&gt;=C2=A0 SRC_URI =3D &quot; \<br>
&gt; diff --git a/meta-networking/recipes-support/lowpan-tools/<a href=3D"h=
ttp://lowpan-tools_git.bb" rel=3D"noreferrer" target=3D"_blank">lowpan-tool=
s_git.bb</a> b/meta-networking/recipes-support/lowpan-tools/<a href=3D"http=
://lowpan-tools_git.bb" rel=3D"noreferrer" target=3D"_blank">lowpan-tools_g=
it.bb</a><br>
&gt; index baaff1f219..f0b7e9184e 100644<br>
&gt; --- a/meta-networking/recipes-support/lowpan-tools/<a href=3D"http://l=
owpan-tools_git.bb" rel=3D"noreferrer" target=3D"_blank">lowpan-tools_git.b=
b</a><br>
&gt; +++ b/meta-networking/recipes-support/lowpan-tools/<a href=3D"http://l=
owpan-tools_git.bb" rel=3D"noreferrer" target=3D"_blank">lowpan-tools_git.b=
b</a><br>
&gt; @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D751419=
260aa954499f7abaabaa882bbe&quot;<br>
&gt;<br>
&gt;=C2=A0 DEPENDS =3D &quot;flex-native bison-native libnl python&quot;<br=
>
&gt;<br>
&gt; -PV =3D &quot;0.3.1+git${SRCPV}&quot;<br>
&gt; +PV =3D &quot;0.3.1+git&quot;<br>
&gt;=C2=A0 SRC_URI =3D &quot;git://<a href=3D"http://github.com/linux-wpan/=
lowpan-tools;branch=3Dmaster;protocol=3Dhttps" rel=3D"noreferrer" target=3D=
"_blank">github.com/linux-wpan/lowpan-tools;branch=3Dmaster;protocol=3Dhttp=
s</a> \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://no-help2man.patc=
h \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Fix-build-e=
rrors-with-clang.patch \<br>
&gt; diff --git a/meta-networking/recipes-support/netcf/<a href=3D"http://n=
etcf_0.2.8.bb" rel=3D"noreferrer" target=3D"_blank">netcf_0.2.8.bb</a> b/me=
ta-networking/recipes-support/netcf/<a href=3D"http://netcf_0.2.8.bb" rel=
=3D"noreferrer" target=3D"_blank">netcf_0.2.8.bb</a><br>
&gt; index f60bb9f104..59ce3e9991 100644<br>
&gt; --- a/meta-networking/recipes-support/netcf/<a href=3D"http://netcf_0.=
2.8.bb" rel=3D"noreferrer" target=3D"_blank">netcf_0.2.8.bb</a><br>
&gt; +++ b/meta-networking/recipes-support/netcf/<a href=3D"http://netcf_0.=
2.8.bb" rel=3D"noreferrer" target=3D"_blank">netcf_0.2.8.bb</a><br>
&gt; @@ -7,7 +7,7 @@ LICENSE =3D &quot;LGPL-2.1-only&quot;<br>
&gt;=C2=A0 LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Dfb919cc88dbe06ec=
0b0bd50e001ccf1f&quot;<br>
&gt;<br>
&gt;=C2=A0 SRCREV =3D &quot;2c5d4255857531bc09d91dcd02e86545f29004d4&quot;<=
br>
&gt; -PV .=3D &quot;+git${SRCPV}&quot;<br>
&gt; +PV .=3D &quot;+git&quot;<br>
&gt;<br>
&gt;=C2=A0 SRC_URI =3D &quot;git://<a href=3D"http://pagure.io/netcf.git;pr=
otocol=3Dhttps;branch=3Dmaster" rel=3D"noreferrer" target=3D"_blank">pagure=
.io/netcf.git;protocol=3Dhttps;branch=3Dmaster</a> \<br>
&gt;=C2=A0 &quot;<br>
&gt; diff --git a/meta-networking/recipes-support/netperf/<a href=3D"http:/=
/netperf_git.bb" rel=3D"noreferrer" target=3D"_blank">netperf_git.bb</a> b/=
meta-networking/recipes-support/netperf/<a href=3D"http://netperf_git.bb" r=
el=3D"noreferrer" target=3D"_blank">netperf_git.bb</a><br>
&gt; index 4074f0cd07..6e459eeeb4 100644<br>
&gt; --- a/meta-networking/recipes-support/netperf/<a href=3D"http://netper=
f_git.bb" rel=3D"noreferrer" target=3D"_blank">netperf_git.bb</a><br>
&gt; +++ b/meta-networking/recipes-support/netperf/<a href=3D"http://netper=
f_git.bb" rel=3D"noreferrer" target=3D"_blank">netperf_git.bb</a><br>
&gt; @@ -5,7 +5,7 @@ HOMEPAGE =3D &quot;<a href=3D"http://www.netperf.org/"=
 rel=3D"noreferrer" target=3D"_blank">http://www.netperf.org/</a>&quot;<br>
&gt;=C2=A0 LICENSE =3D &quot;MIT&quot;<br>
&gt;=C2=A0 LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3De661ab33a2a71ad6=
652c178dedf8aaa2&quot;<br>
&gt;<br>
&gt; -PV =3D &quot;2.7.0+git${SRCPV}&quot;<br>
&gt; +PV =3D &quot;2.7.0+git&quot;<br>
&gt;<br>
&gt;=C2=A0 SRC_URI =3D &quot;git://<a href=3D"http://github.com/HewlettPack=
ard/netperf.git;branch=3Dmaster;protocol=3Dhttps" rel=3D"noreferrer" target=
=3D"_blank">github.com/HewlettPackard/netperf.git;branch=3Dmaster;protocol=
=3Dhttps</a> \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://cpu_set.patch \<=
br>
&gt; diff --git a/meta-networking/recipes-support/ntimed/<a href=3D"http://=
ntimed_git.bb" rel=3D"noreferrer" target=3D"_blank">ntimed_git.bb</a> b/met=
a-networking/recipes-support/ntimed/<a href=3D"http://ntimed_git.bb" rel=3D=
"noreferrer" target=3D"_blank">ntimed_git.bb</a><br>
&gt; index 9badfd75d1..955c03f42d 100644<br>
&gt; --- a/meta-networking/recipes-support/ntimed/<a href=3D"http://ntimed_=
git.bb" rel=3D"noreferrer" target=3D"_blank">ntimed_git.bb</a><br>
&gt; +++ b/meta-networking/recipes-support/ntimed/<a href=3D"http://ntimed_=
git.bb" rel=3D"noreferrer" target=3D"_blank">ntimed_git.bb</a><br>
&gt; @@ -11,7 +11,7 @@ LIC_FILES_CHKSUM =3D &quot;file://main.c;beginline=
=3D2;endline=3D24;md5=3D89db8e76f2951f3fad1<br>
&gt;=C2=A0 SRC_URI =3D &quot;git://<a href=3D"http://github.com/bsdphk/Ntim=
ed;branch=3Dmaster;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_blank">g=
ithub.com/bsdphk/Ntimed;branch=3Dmaster;protocol=3Dhttps</a> \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://use-ldflags.patc=
h&quot;<br>
&gt;<br>
&gt; -PV =3D &quot;0.0+git${SRCPV}&quot;<br>
&gt; +PV =3D &quot;0.0+git&quot;<br>
&gt;=C2=A0 SRCREV =3D &quot;db0abbb4c80f2ecef6bc5d9639bca5bea28532a2&quot;<=
br>
&gt;<br>
&gt;=C2=A0 S =3D &quot;${WORKDIR}/git&quot;<br>
&gt; diff --git a/meta-networking/recipes-support/phytool/<a href=3D"http:/=
/phytool.bb" rel=3D"noreferrer" target=3D"_blank">phytool.bb</a> b/meta-net=
working/recipes-support/phytool/<a href=3D"http://phytool.bb" rel=3D"norefe=
rrer" target=3D"_blank">phytool.bb</a><br>
&gt; index c2c4335910..b918e50c68 100644<br>
&gt; --- a/meta-networking/recipes-support/phytool/<a href=3D"http://phytoo=
l.bb" rel=3D"noreferrer" target=3D"_blank">phytool.bb</a><br>
&gt; +++ b/meta-networking/recipes-support/phytool/<a href=3D"http://phytoo=
l.bb" rel=3D"noreferrer" target=3D"_blank">phytool.bb</a><br>
&gt; @@ -2,7 +2,7 @@ SUMMARY =3D &quot;PHY interface tool for Linux&quot;<b=
r>
&gt;=C2=A0 LICENSE =3D &quot;GPL-2.0-only&quot;<br>
&gt;=C2=A0 LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D39bba7d2cf0ba103=
6f2a6e2be52fe3f0&quot;<br>
&gt;<br>
&gt; -PV =3D &quot;2+git${SRCPV}&quot;<br>
&gt; +PV =3D &quot;2+git&quot;<br>
&gt;=C2=A0 SRCREV =3D &quot;8882328c08ba2efb13c049812098f1d0cb8adf0c&quot;<=
br>
&gt;=C2=A0 SRC_URI =3D &quot;git://<a href=3D"http://github.com/wkz/phytool=
.git;branch=3Dmaster;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_blank"=
>github.com/wkz/phytool.git;branch=3Dmaster;protocol=3Dhttps</a>&quot;<br>
&gt;<br>
&gt; diff --git a/meta-oe/dynamic-layers/meta-python/recipes-bsp/rwmem/<a h=
ref=3D"http://rwmem_1.2.bb" rel=3D"noreferrer" target=3D"_blank">rwmem_1.2.=
bb</a> b/meta-oe/dynamic-layers/meta-python/recipes-bsp/rwmem/<a href=3D"ht=
tp://rwmem_1.2.bb" rel=3D"noreferrer" target=3D"_blank">rwmem_1.2.bb</a><br=
>
&gt; index bff82fe35d..90c9a7147c 100644<br>
&gt; --- a/meta-oe/dynamic-layers/meta-python/recipes-bsp/rwmem/<a href=3D"=
http://rwmem_1.2.bb" rel=3D"noreferrer" target=3D"_blank">rwmem_1.2.bb</a><=
br>
&gt; +++ b/meta-oe/dynamic-layers/meta-python/recipes-bsp/rwmem/<a href=3D"=
http://rwmem_1.2.bb" rel=3D"noreferrer" target=3D"_blank">rwmem_1.2.bb</a><=
br>
&gt; @@ -13,7 +13,7 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3Db234=
ee4d69f5fce4486a80fdaf4a4263&quot;<br>
&gt;<br>
&gt;=C2=A0 DEPENDS +=3D &quot;fmt libinih&quot;<br>
&gt;<br>
&gt; -PV .=3D &quot;+git${SRCPV}&quot;<br>
&gt; +PV .=3D &quot;+git&quot;<br>
&gt;<br>
&gt;=C2=A0 SRCREV =3D &quot;8416326777b2aada0706539b8f9f6acefa476b16&quot;<=
br>
&gt;<br>
&gt; diff --git a/meta-oe/dynamic-layers/meta-python/recipes-extended/lcdpr=
oc/<a href=3D"http://lcdproc_git.bb" rel=3D"noreferrer" target=3D"_blank">l=
cdproc_git.bb</a> b/meta-oe/dynamic-layers/meta-python/recipes-extended/lcd=
proc/<a href=3D"http://lcdproc_git.bb" rel=3D"noreferrer" target=3D"_blank"=
>lcdproc_git.bb</a><br>
&gt; index 4cae4947f2..c29c51a2ae 100644<br>
&gt; --- a/meta-oe/dynamic-layers/meta-python/recipes-extended/lcdproc/<a h=
ref=3D"http://lcdproc_git.bb" rel=3D"noreferrer" target=3D"_blank">lcdproc_=
git.bb</a><br>
&gt; +++ b/meta-oe/dynamic-layers/meta-python/recipes-extended/lcdproc/<a h=
ref=3D"http://lcdproc_git.bb" rel=3D"noreferrer" target=3D"_blank">lcdproc_=
git.bb</a><br>
&gt; @@ -9,7 +9,7 @@ DEPENDS =3D &quot;ncurses lirc&quot;<br>
&gt;=C2=A0 LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D18810669f13b8734=
8459e611d31ab760 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 file://README.md;beginline=3D107;md5=3D5db392f043253a2d64b1737068ce6=
b58&quot;<br>
&gt;<br>
&gt; -PV =3D &quot;0.5.9+git${SRCPV}&quot;<br>
&gt; +PV =3D &quot;0.5.9+git&quot;<br>
&gt;=C2=A0 SRCREV =3D &quot;0e2ce9b9c46c47363436f9ee730f7c71bf455f0f&quot;<=
br>
&gt;=C2=A0 SRC_URI =3D &quot;git://<a href=3D"http://github.com/lcdproc/lcd=
proc;branch=3Dmaster;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_blank"=
>github.com/lcdproc/lcdproc;branch=3Dmaster;protocol=3Dhttps</a>&quot;<br>
&gt;<br>
&gt; diff --git a/meta-oe/recipes-benchmark/cpuburn/<a href=3D"http://cpubu=
rn-arm_git.bb" rel=3D"noreferrer" target=3D"_blank">cpuburn-arm_git.bb</a> =
b/meta-oe/recipes-benchmark/cpuburn/<a href=3D"http://cpuburn-arm_git.bb" r=
el=3D"noreferrer" target=3D"_blank">cpuburn-arm_git.bb</a><br>
&gt; index 7969af6c37..c58524aa64 100644<br>
&gt; --- a/meta-oe/recipes-benchmark/cpuburn/<a href=3D"http://cpuburn-arm_=
git.bb" rel=3D"noreferrer" target=3D"_blank">cpuburn-arm_git.bb</a><br>
&gt; +++ b/meta-oe/recipes-benchmark/cpuburn/<a href=3D"http://cpuburn-arm_=
git.bb" rel=3D"noreferrer" target=3D"_blank">cpuburn-arm_git.bb</a><br>
&gt; @@ -7,7 +7,7 @@ PROVIDES +=3D &quot;cpuburn-neon&quot;<br>
&gt;<br>
&gt;=C2=A0 SRCREV =3D &quot;ad7e646700d14b81413297bda02fb7fe96613c3f&quot;<=
br>
&gt;<br>
&gt; -PV =3D &quot;1.0+git${SRCPV}&quot;<br>
&gt; +PV =3D &quot;1.0+git&quot;<br>
&gt;<br>
&gt;=C2=A0 SRC_URI =3D &quot;git://<a href=3D"http://github.com/ssvb/cpubur=
n-arm.git;branch=3Dmaster;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_b=
lank">github.com/ssvb/cpuburn-arm.git;branch=3Dmaster;protocol=3Dhttps</a> =
\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-cpuburn-a8.=
S-Remove-.func-.endfunc.patch \<br>
&gt; diff --git a/meta-oe/recipes-benchmark/libc-bench/<a href=3D"http://li=
bc-bench_git.bb" rel=3D"noreferrer" target=3D"_blank">libc-bench_git.bb</a>=
 b/meta-oe/recipes-benchmark/libc-bench/<a href=3D"http://libc-bench_git.bb=
" rel=3D"noreferrer" target=3D"_blank">libc-bench_git.bb</a><br>
&gt; index 17bbb9b6ce..4ace4515ad 100644<br>
&gt; --- a/meta-oe/recipes-benchmark/libc-bench/<a href=3D"http://libc-benc=
h_git.bb" rel=3D"noreferrer" target=3D"_blank">libc-bench_git.bb</a><br>
&gt; +++ b/meta-oe/recipes-benchmark/libc-bench/<a href=3D"http://libc-benc=
h_git.bb" rel=3D"noreferrer" target=3D"_blank">libc-bench_git.bb</a><br>
&gt; @@ -7,7 +7,7 @@ LICENSE =3D &quot;MIT&quot;<br>
&gt;=C2=A0 LIC_FILES_CHKSUM =3D &quot;file://COPYRIGHT;md5=3D9a825c63897c53=
f487ef900598c31527&quot;<br>
&gt;<br>
&gt;=C2=A0 SRCREV =3D &quot;b6b2ce5f9f87a09b14499cb00c600c601f022634&quot;<=
br>
&gt; -PV =3D &quot;20110206+git${SRCPV}&quot;<br>
&gt; +PV =3D &quot;20110206+git&quot;<br>
&gt;<br>
&gt;=C2=A0 SRC_URI =3D &quot;git://<a href=3D"http://git.musl-libc.org/libc=
-bench;branch=3Dmaster" rel=3D"noreferrer" target=3D"_blank">git.musl-libc.=
org/libc-bench;branch=3Dmaster</a> \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-build-Do-no=
t-override-ldflags-from-environment.patch \<br>
&gt; diff --git a/meta-oe/recipes-benchmark/tinymembench/<a href=3D"http://=
tinymembench_git.bb" rel=3D"noreferrer" target=3D"_blank">tinymembench_git.=
bb</a> b/meta-oe/recipes-benchmark/tinymembench/<a href=3D"http://tinymembe=
nch_git.bb" rel=3D"noreferrer" target=3D"_blank">tinymembench_git.bb</a><br=
>
&gt; index 025aacf251..200a0de849 100644<br>
&gt; --- a/meta-oe/recipes-benchmark/tinymembench/<a href=3D"http://tinymem=
bench_git.bb" rel=3D"noreferrer" target=3D"_blank">tinymembench_git.bb</a><=
br>
&gt; +++ b/meta-oe/recipes-benchmark/tinymembench/<a href=3D"http://tinymem=
bench_git.bb" rel=3D"noreferrer" target=3D"_blank">tinymembench_git.bb</a><=
br>
&gt; @@ -6,7 +6,7 @@ HOMEPAGE =3D &quot;<a href=3D"https://github.com/ssvb/=
tinymembench/wiki" rel=3D"noreferrer" target=3D"_blank">https://github.com/=
ssvb/tinymembench/wiki</a>&quot;<br>
&gt;=C2=A0 LICENSE =3D &quot;MIT&quot;<br>
&gt;=C2=A0 LIC_FILES_CHKSUM =3D &quot;file://main.c;endline=3D22;md5=3D879b=
9bbb60851454885b5fa47eb6b345&quot;<br>
&gt;<br>
&gt; -PV =3D &quot;0.4.9+git${SRCPV}&quot;<br>
&gt; +PV =3D &quot;0.4.9+git&quot;<br>
&gt;<br>
&gt;=C2=A0 SRCREV =3D &quot;a2cf6d7e382e3aea1eb39173174d9fa28cad15f3&quot;<=
br>
&gt;=C2=A0 SRC_URI =3D &quot;git://<a href=3D"http://github.com/ssvb/tinyme=
mbench.git;branch=3Dmaster;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_=
blank">github.com/ssvb/tinymembench.git;branch=3Dmaster;protocol=3Dhttps</a=
> \<br>
&gt; diff --git a/meta-oe/recipes-bsp/edac-utils/<a href=3D"http://edac-uti=
ls_git.bb" rel=3D"noreferrer" target=3D"_blank">edac-utils_git.bb</a> b/met=
a-oe/recipes-bsp/edac-utils/<a href=3D"http://edac-utils_git.bb" rel=3D"nor=
eferrer" target=3D"_blank">edac-utils_git.bb</a><br>
&gt; index 455859ec86..03076cbc60 100644<br>
&gt; --- a/meta-oe/recipes-bsp/edac-utils/<a href=3D"http://edac-utils_git.=
bb" rel=3D"noreferrer" target=3D"_blank">edac-utils_git.bb</a><br>
&gt; +++ b/meta-oe/recipes-bsp/edac-utils/<a href=3D"http://edac-utils_git.=
bb" rel=3D"noreferrer" target=3D"_blank">edac-utils_git.bb</a><br>
&gt; @@ -11,7 +11,7 @@ LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Db234=
ee4d69f5fce4486a80fdaf4a4263&quot;<br>
&gt;=C2=A0 DEPENDS =3D &quot; sysfsutils&quot;<br>
&gt;<br>
&gt;=C2=A0 SRCREV =3D &quot;1c57818ecee186aa47af0342149577df5302c022&quot;<=
br>
&gt; -PV =3D &quot;0.18+git${SRCPV}&quot;<br>
&gt; +PV =3D &quot;0.18+git&quot;<br>
&gt;<br>
&gt;=C2=A0 S =3D &quot;${WORKDIR}/git&quot;<br>
&gt;<br>
&gt; diff --git a/meta-oe/recipes-bsp/firmwared/<a href=3D"http://firmwared=
_git.bb" rel=3D"noreferrer" target=3D"_blank">firmwared_git.bb</a> b/meta-o=
e/recipes-bsp/firmwared/<a href=3D"http://firmwared_git.bb" rel=3D"noreferr=
er" target=3D"_blank">firmwared_git.bb</a><br>
&gt; index e8b491a435..0a041835e1 100644<br>
&gt; --- a/meta-oe/recipes-bsp/firmwared/<a href=3D"http://firmwared_git.bb=
" rel=3D"noreferrer" target=3D"_blank">firmwared_git.bb</a><br>
&gt; +++ b/meta-oe/recipes-bsp/firmwared/<a href=3D"http://firmwared_git.bb=
" rel=3D"noreferrer" target=3D"_blank">firmwared_git.bb</a><br>
&gt; @@ -10,7 +10,7 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE-APACHE;md5=
=3D7b486c2338d225a1405d979ed2c15ce8 \<br>
&gt;=C2=A0 SRC_URI =3D &quot;git://<a href=3D"http://github.com/teg/firmwar=
ed.git;branch=3Dmaster;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_blan=
k">github.com/teg/firmwared.git;branch=3Dmaster;protocol=3Dhttps</a> \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://firmwared.servic=
e&quot;<br>
&gt;<br>
&gt; -PV =3D &quot;0+git${SRCPV}&quot;<br>
&gt; +PV =3D &quot;0+git&quot;<br>
&gt;=C2=A0 SRCREV =3D &quot;2e6b5db43d63a5c0283a4cae9a6a20b7ad107a04&quot;<=
br>
&gt;<br>
&gt;=C2=A0 S =3D &quot;${WORKDIR}/git&quot;<br>
&gt; diff --git a/meta-oe/recipes-connectivity/gattlib/<a href=3D"http://ga=
ttlib_git.bb" rel=3D"noreferrer" target=3D"_blank">gattlib_git.bb</a> b/met=
a-oe/recipes-connectivity/gattlib/<a href=3D"http://gattlib_git.bb" rel=3D"=
noreferrer" target=3D"_blank">gattlib_git.bb</a><br>
&gt; index aec41edf7a..f54d833a01 100644<br>
&gt; --- a/meta-oe/recipes-connectivity/gattlib/<a href=3D"http://gattlib_g=
it.bb" rel=3D"noreferrer" target=3D"_blank">gattlib_git.bb</a><br>
&gt; +++ b/meta-oe/recipes-connectivity/gattlib/<a href=3D"http://gattlib_g=
it.bb" rel=3D"noreferrer" target=3D"_blank">gattlib_git.bb</a><br>
&gt; @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D &quot;file://CMakeLists.txt;begin=
line=3D1;endline=3D6;md5=3Da87ee154f005<br>
&gt;=C2=A0 DEPENDS =3D &quot;bluez5 glib-2.0&quot;<br>
&gt;=C2=A0 DEPENDS +=3D &quot;glib-2.0-native&quot;<br>
&gt;<br>
&gt; -PV =3D &quot;0.2+git${SRCPV}&quot;<br>
&gt; +PV =3D &quot;0.2+git&quot;<br>
&gt;<br>
&gt;=C2=A0 SRC_URI =3D &quot;git://<a href=3D"http://github.com/labapart/ga=
ttlib.git;branch=3Dmaster;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_b=
lank">github.com/labapart/gattlib.git;branch=3Dmaster;protocol=3Dhttps</a> =
\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://dbus-avoid-stran=
ge-chars-from-the-build-dir.patch \<br>
&gt; diff --git a/meta-oe/recipes-connectivity/libimobiledevice-glue/<a hre=
f=3D"http://libimobiledevice-glue_git.bb" rel=3D"noreferrer" target=3D"_bla=
nk">libimobiledevice-glue_git.bb</a> b/meta-oe/recipes-connectivity/libimob=
iledevice-glue/<a href=3D"http://libimobiledevice-glue_git.bb" rel=3D"noref=
errer" target=3D"_blank">libimobiledevice-glue_git.bb</a><br>
&gt; index b63aabdc0c..d37c547c98 100644<br>
&gt; --- a/meta-oe/recipes-connectivity/libimobiledevice-glue/<a href=3D"ht=
tp://libimobiledevice-glue_git.bb" rel=3D"noreferrer" target=3D"_blank">lib=
imobiledevice-glue_git.bb</a><br>
&gt; +++ b/meta-oe/recipes-connectivity/libimobiledevice-glue/<a href=3D"ht=
tp://libimobiledevice-glue_git.bb" rel=3D"noreferrer" target=3D"_blank">lib=
imobiledevice-glue_git.bb</a><br>
&gt; @@ -8,7 +8,7 @@ HOMEPAGE =3D &quot;<a href=3D"http://www.libimobiledev=
ice.org/" rel=3D"noreferrer" target=3D"_blank">http://www.libimobiledevice.=
org/</a>&quot;<br>
&gt;<br>
&gt;=C2=A0 DEPENDS =3D &quot;libplist&quot;<br>
&gt;<br>
&gt; -PV =3D &quot;1.0.0+git${SRCPV}&quot;<br>
&gt; +PV =3D &quot;1.0.0+git&quot;<br>
&gt;<br>
&gt;=C2=A0 SRCREV =3D &quot;114098d30e783fbb3def5c9b49427a86621cfcb1&quot;<=
br>
&gt;=C2=A0 SRC_URI =3D &quot;git://<a href=3D"http://github.com/libimobiled=
evice/libimobiledevice-glue;protocol=3Dhttps;branch=3Dmaster" rel=3D"norefe=
rrer" target=3D"_blank">github.com/libimobiledevice/libimobiledevice-glue;p=
rotocol=3Dhttps;branch=3Dmaster</a>&quot;<br>
&gt; diff --git a/meta-oe/recipes-connectivity/libimobiledevice/<a href=3D"=
http://libimobiledevice_git.bb" rel=3D"noreferrer" target=3D"_blank">libimo=
biledevice_git.bb</a> b/meta-oe/recipes-connectivity/libimobiledevice/<a hr=
ef=3D"http://libimobiledevice_git.bb" rel=3D"noreferrer" target=3D"_blank">=
libimobiledevice_git.bb</a><br>
&gt; index 1a0590c57b..b8d7e8872b 100644<br>
&gt; --- a/meta-oe/recipes-connectivity/libimobiledevice/<a href=3D"http://=
libimobiledevice_git.bb" rel=3D"noreferrer" target=3D"_blank">libimobiledev=
ice_git.bb</a><br>
&gt; +++ b/meta-oe/recipes-connectivity/libimobiledevice/<a href=3D"http://=
libimobiledevice_git.bb" rel=3D"noreferrer" target=3D"_blank">libimobiledev=
ice_git.bb</a><br>
&gt; @@ -8,7 +8,7 @@ HOMEPAGE =3D &quot;<a href=3D"http://www.libimobiledev=
ice.org/" rel=3D"noreferrer" target=3D"_blank">http://www.libimobiledevice.=
org/</a>&quot;<br>
&gt;<br>
&gt;=C2=A0 DEPENDS =3D &quot;libplist usbmuxd libusbmuxd libtasn1 gnutls li=
bgcrypt libimobiledevice-glue openssl&quot;<br>
&gt;<br>
&gt; -PV =3D &quot;1.3.0+git${SRCPV}&quot;<br>
&gt; +PV =3D &quot;1.3.0+git&quot;<br>
&gt;<br>
&gt;=C2=A0 SRCREV =3D &quot;860ffb707af3af94467d2ece4ad258dda957c6cd&quot;<=
br>
&gt;=C2=A0 SRC_URI =3D &quot;git://<a href=3D"http://github.com/libimobiled=
evice/libimobiledevice;protocol=3Dhttps;branch=3Dmaster" rel=3D"noreferrer"=
 target=3D"_blank">github.com/libimobiledevice/libimobiledevice;protocol=3D=
https;branch=3Dmaster</a> \<br>
&gt; diff --git a/meta-oe/recipes-connectivity/libqrtr-glib/<a href=3D"http=
://libqrtr-glib_git.bb" rel=3D"noreferrer" target=3D"_blank">libqrtr-glib_g=
it.bb</a> b/meta-oe/recipes-connectivity/libqrtr-glib/<a href=3D"http://lib=
qrtr-glib_git.bb" rel=3D"noreferrer" target=3D"_blank">libqrtr-glib_git.bb<=
/a><br>
&gt; index 7bac3117cd..3549cac568 100644<br>
&gt; --- a/meta-oe/recipes-connectivity/libqrtr-glib/<a href=3D"http://libq=
rtr-glib_git.bb" rel=3D"noreferrer" target=3D"_blank">libqrtr-glib_git.bb</=
a><br>
&gt; +++ b/meta-oe/recipes-connectivity/libqrtr-glib/<a href=3D"http://libq=
rtr-glib_git.bb" rel=3D"noreferrer" target=3D"_blank">libqrtr-glib_git.bb</=
a><br>
&gt; @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSES/LGPL-2.1-or=
-later.txt;md5=3D4fbd65380cdd255951<br>
&gt;<br>
&gt;=C2=A0 SRC_URI =3D &quot;git://<a href=3D"http://gitlab.freedesktop.org=
/mobile-broadband/libqrtr-glib.git;protocol=3Dhttps;branch=3Dqrtr-1-2" rel=
=3D"noreferrer" target=3D"_blank">gitlab.freedesktop.org/mobile-broadband/l=
ibqrtr-glib.git;protocol=3Dhttps;branch=3Dqrtr-1-2</a>&quot;<br>
&gt;<br>
&gt; -PV =3D &quot;1.2.2+git${SRCPV}&quot;<br>
&gt; +PV =3D &quot;1.2.2+git&quot;<br>
&gt;=C2=A0 SRCREV =3D &quot;8991f0e93713ebf4da48ae4f23940ead42f64c8c&quot;<=
br>
&gt;<br>
&gt;=C2=A0 S =3D &quot;${WORKDIR}/git&quot;<br>
&gt; diff --git a/meta-oe/recipes-connectivity/rtorrent/<a href=3D"http://r=
torrent_git.bb" rel=3D"noreferrer" target=3D"_blank">rtorrent_git.bb</a> b/=
meta-oe/recipes-connectivity/rtorrent/<a href=3D"http://rtorrent_git.bb" re=
l=3D"noreferrer" target=3D"_blank">rtorrent_git.bb</a><br>
&gt; index d5411b19b2..d9cca404d7 100644<br>
&gt; --- a/meta-oe/recipes-connectivity/rtorrent/<a href=3D"http://rtorrent=
_git.bb" rel=3D"noreferrer" target=3D"_blank">rtorrent_git.bb</a><br>
&gt; +++ b/meta-oe/recipes-connectivity/rtorrent/<a href=3D"http://rtorrent=
_git.bb" rel=3D"noreferrer" target=3D"_blank">rtorrent_git.bb</a><br>
&gt; @@ -8,7 +8,7 @@ DEPENDS =3D &quot;autoconf-archive libsigc++-2.0 curl =
cppunit libtool libtorrent ncurse<br>
&gt;=C2=A0 SRC_URI =3D &quot;git://<a href=3D"http://github.com/rakshasa/rt=
orrent;branch=3Dmaster;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_blan=
k">github.com/rakshasa/rtorrent;branch=3Dmaster;protocol=3Dhttps</a>&quot;<=
br>
&gt;=C2=A0 SRCREV =3D &quot;d067bd802e44f0e6a747aabcc311ada2175fd550&quot;<=
br>
&gt;<br>
&gt; -PV =3D &quot;0.9.8+git${SRCPV}&quot;<br>
&gt; +PV =3D &quot;0.9.8+git&quot;<br>
&gt;<br>
&gt;=C2=A0 S =3D &quot;${WORKDIR}/git&quot;<br>
&gt;<br>
&gt; diff --git a/meta-oe/recipes-connectivity/usbmuxd/<a href=3D"http://us=
bmuxd_git.bb" rel=3D"noreferrer" target=3D"_blank">usbmuxd_git.bb</a> b/met=
a-oe/recipes-connectivity/usbmuxd/<a href=3D"http://usbmuxd_git.bb" rel=3D"=
noreferrer" target=3D"_blank">usbmuxd_git.bb</a><br>
&gt; index 1492234495..569d6a41cf 100644<br>
&gt; --- a/meta-oe/recipes-connectivity/usbmuxd/<a href=3D"http://usbmuxd_g=
it.bb" rel=3D"noreferrer" target=3D"_blank">usbmuxd_git.bb</a><br>
&gt; +++ b/meta-oe/recipes-connectivity/usbmuxd/<a href=3D"http://usbmuxd_g=
it.bb" rel=3D"noreferrer" target=3D"_blank">usbmuxd_git.bb</a><br>
&gt; @@ -9,7 +9,7 @@ DEPENDS =3D &quot;udev libusb1 libplist libimobiledevi=
ce-glue&quot;<br>
&gt;=C2=A0 inherit autotools pkgconfig gitpkgv systemd<br>
&gt;<br>
&gt;=C2=A0 PKGV =3D &quot;${GITPKGVTAG}&quot;<br>
&gt; -PV =3D &quot;1.1.2+git${SRCPV}&quot;<br>
&gt; +PV =3D &quot;1.1.2+git&quot;<br>
&gt;<br>
&gt;=C2=A0 SRCREV =3D &quot;01c94c77f59404924f1c46d99c4e5e0c7817281b&quot;<=
br>
&gt;=C2=A0 SRC_URI =3D &quot;git://<a href=3D"http://github.com/libimobiled=
evice/usbmuxd;protocol=3Dhttps;branch=3Dmaster" rel=3D"noreferrer" target=
=3D"_blank">github.com/libimobiledevice/usbmuxd;protocol=3Dhttps;branch=3Dm=
aster</a>&quot;<br>
&gt; diff --git a/meta-oe/recipes-core/dbus/<a href=3D"http://dbus-daemon-p=
roxy_git.bb" rel=3D"noreferrer" target=3D"_blank">dbus-daemon-proxy_git.bb<=
/a> b/meta-oe/recipes-core/dbus/<a href=3D"http://dbus-daemon-proxy_git.bb"=
 rel=3D"noreferrer" target=3D"_blank">dbus-daemon-proxy_git.bb</a><br>
&gt; index d096cd618e..122a3f9916 100644<br>
&gt; --- a/meta-oe/recipes-core/dbus/<a href=3D"http://dbus-daemon-proxy_gi=
t.bb" rel=3D"noreferrer" target=3D"_blank">dbus-daemon-proxy_git.bb</a><br>
&gt; +++ b/meta-oe/recipes-core/dbus/<a href=3D"http://dbus-daemon-proxy_gi=
t.bb" rel=3D"noreferrer" target=3D"_blank">dbus-daemon-proxy_git.bb</a><br>
&gt; @@ -3,7 +3,7 @@ LICENSE =3D &quot;LGPL-2.1-or-later&quot;<br>
&gt;=C2=A0 LIC_FILES_CHKSUM =3D &quot;file://dbus-daemon-proxy.c;endline=3D=
19;md5=3D41df6d21fe1c97d6a1cc22a5bf374cba&quot;<br>
&gt;=C2=A0 DEPENDS =3D &quot;dbus dbus-glib&quot;<br>
&gt;=C2=A0 SRCREV =3D &quot;1226a0a1374628ff191f6d8a56000be5e53e7608&quot;<=
br>
&gt; -PV =3D &quot;0.0.0+gitr${SRCPV}&quot;<br>
&gt; +PV =3D &quot;0.0.0+gitr&quot;<br>
&gt;=C2=A0 PR =3D &quot;r1.59&quot;<br>
&gt;<br>
&gt;=C2=A0 SRC_URI =3D &quot;git://<a href=3D"http://github.com/alban/dbus-=
daemon-proxy;branch=3Dmaster;protocol=3Dhttps" rel=3D"noreferrer" target=3D=
"_blank">github.com/alban/dbus-daemon-proxy;branch=3Dmaster;protocol=3Dhttp=
s</a> \<br>
&gt; diff --git a/meta-oe/recipes-core/glfw/<a href=3D"http://glfw_3.3.8.bb=
" rel=3D"noreferrer" target=3D"_blank">glfw_3.3.8.bb</a> b/meta-oe/recipes-=
core/glfw/<a href=3D"http://glfw_3.3.8.bb" rel=3D"noreferrer" target=3D"_bl=
ank">glfw_3.3.8.bb</a><br>
&gt; index ad7a3a7ed4..684355ef3e 100644<br>
&gt; --- a/meta-oe/recipes-core/glfw/<a href=3D"http://glfw_3.3.8.bb" rel=
=3D"noreferrer" target=3D"_blank">glfw_3.3.8.bb</a><br>
&gt; +++ b/meta-oe/recipes-core/glfw/<a href=3D"http://glfw_3.3.8.bb" rel=
=3D"noreferrer" target=3D"_blank">glfw_3.3.8.bb</a><br>
&gt; @@ -10,7 +10,7 @@ SECTION =3D &quot;lib&quot;<br>
&gt;<br>
&gt;=C2=A0 inherit pkgconfig cmake features_check<br>
&gt;<br>
&gt; -PV .=3D &quot;+git${SRCPV}&quot;<br>
&gt; +PV .=3D &quot;+git&quot;<br>
&gt;=C2=A0 SRCREV =3D &quot;7482de6071d21db77a7236155da44c172a7f6c9e&quot;<=
br>
&gt;=C2=A0 SRC_URI =3D &quot;git://<a href=3D"http://github.com/glfw/glfw.g=
it;branch=3D3.3-stable;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_blan=
k">github.com/glfw/glfw.git;branch=3D3.3-stable;protocol=3Dhttps</a>&quot;<=
br>
&gt;<br>
&gt; diff --git a/meta-oe/recipes-core/libnfc/<a href=3D"http://libnfc_git.=
bb" rel=3D"noreferrer" target=3D"_blank">libnfc_git.bb</a> b/meta-oe/recipe=
s-core/libnfc/<a href=3D"http://libnfc_git.bb" rel=3D"noreferrer" target=3D=
"_blank">libnfc_git.bb</a><br>
&gt; index 9733749628..a97a2841f7 100644<br>
&gt; --- a/meta-oe/recipes-core/libnfc/<a href=3D"http://libnfc_git.bb" rel=
=3D"noreferrer" target=3D"_blank">libnfc_git.bb</a><br>
&gt; +++ b/meta-oe/recipes-core/libnfc/<a href=3D"http://libnfc_git.bb" rel=
=3D"noreferrer" target=3D"_blank">libnfc_git.bb</a><br>
&gt; @@ -7,7 +7,7 @@ SECTION =3D &quot;libs&quot;<br>
&gt;<br>
&gt;=C2=A0 inherit autotools pkgconfig<br>
&gt;<br>
&gt; -PV =3D &quot;1.8.0+git${SRCPV}&quot;<br>
&gt; +PV =3D &quot;1.8.0+git&quot;<br>
&gt;<br>
&gt;=C2=A0 S =3D &quot;${WORKDIR}/git&quot;<br>
&gt;=C2=A0 SRCREV =3D &quot;f02ff51449240102c27a97173dc495e8e7789046&quot;<=
br>
&gt; diff --git a/meta-oe/recipes-core/mdbus2/<a href=3D"http://mdbus2_git.=
bb" rel=3D"noreferrer" target=3D"_blank">mdbus2_git.bb</a> b/meta-oe/recipe=
s-core/mdbus2/<a href=3D"http://mdbus2_git.bb" rel=3D"noreferrer" target=3D=
"_blank">mdbus2_git.bb</a><br>
&gt; index c6db78b4ab..a7ac358f27 100644<br>
&gt; --- a/meta-oe/recipes-core/mdbus2/<a href=3D"http://mdbus2_git.bb" rel=
=3D"noreferrer" target=3D"_blank">mdbus2_git.bb</a><br>
&gt; +++ b/meta-oe/recipes-core/mdbus2/<a href=3D"http://mdbus2_git.bb" rel=
=3D"noreferrer" target=3D"_blank">mdbus2_git.bb</a><br>
&gt; @@ -4,7 +4,7 @@ LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Debb5c5=
0ab7cab4baeffba14977030c07&quot;<br>
&gt;<br>
&gt;=C2=A0 DEPENDS =3D &quot;readline&quot;<br>
&gt;<br>
&gt; -PV =3D &quot;2.3.3+git${SRCPV}&quot;<br>
&gt; +PV =3D &quot;2.3.3+git&quot;<br>
&gt;<br>
&gt;=C2=A0 SRC_URI =3D &quot;git://<a href=3D"http://github.com/freesmartph=
one/mdbus.git;protocol=3Dhttps;branch=3Dmaster" rel=3D"noreferrer" target=
=3D"_blank">github.com/freesmartphone/mdbus.git;protocol=3Dhttps;branch=3Dm=
aster</a> \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Fix-argumen=
ts-in-GLib.DBusSignalCallback-for-Vala-0..patch \<br>
&gt; diff --git a/meta-oe/recipes-core/musl-rpmatch/<a href=3D"http://musl-=
rpmatch_git.bb" rel=3D"noreferrer" target=3D"_blank">musl-rpmatch_git.bb</a=
> b/meta-oe/recipes-core/musl-rpmatch/<a href=3D"http://musl-rpmatch_git.bb=
" rel=3D"noreferrer" target=3D"_blank">musl-rpmatch_git.bb</a><br>
&gt; index 163a74ebe3..0bb45b8eaf 100644<br>
&gt; --- a/meta-oe/recipes-core/musl-rpmatch/<a href=3D"http://musl-rpmatch=
_git.bb" rel=3D"noreferrer" target=3D"_blank">musl-rpmatch_git.bb</a><br>
&gt; +++ b/meta-oe/recipes-core/musl-rpmatch/<a href=3D"http://musl-rpmatch=
_git.bb" rel=3D"noreferrer" target=3D"_blank">musl-rpmatch_git.bb</a><br>
&gt; @@ -4,7 +4,7 @@ LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D81a81b=
f31abecc50c20862fc8a716329&quot;<br>
&gt;<br>
&gt;=C2=A0 SRC_URI =3D &quot;gitsm://<a href=3D"http://github.com/pullmoll/=
musl-rpmatch.git;protocol=3Dhttps;branch=3Dmaster" rel=3D"noreferrer" targe=
t=3D"_blank">github.com/pullmoll/musl-rpmatch.git;protocol=3Dhttps;branch=
=3Dmaster</a>&quot;<br>
&gt;<br>
&gt; -PV =3D &quot;1.0+git${SRCPV}&quot;<br>
&gt; +PV =3D &quot;1.0+git&quot;<br>
&gt;=C2=A0 SRCREV =3D &quot;46267b154987d3e1f25d3a75423faa62bb5ee342&quot;<=
br>
&gt;<br>
&gt;=C2=A0 inherit autotools<br>
&gt; diff --git a/meta-oe/recipes-core/opencl/<a href=3D"http://opencl-clhp=
p_git.bb" rel=3D"noreferrer" target=3D"_blank">opencl-clhpp_git.bb</a> b/me=
ta-oe/recipes-core/opencl/<a href=3D"http://opencl-clhpp_git.bb" rel=3D"nor=
eferrer" target=3D"_blank">opencl-clhpp_git.bb</a><br>
&gt; index 8a712602cc..7ae0362d37 100644<br>
&gt; --- a/meta-oe/recipes-core/opencl/<a href=3D"http://opencl-clhpp_git.b=
b" rel=3D"noreferrer" target=3D"_blank">opencl-clhpp_git.bb</a><br>
&gt; +++ b/meta-oe/recipes-core/opencl/<a href=3D"http://opencl-clhpp_git.b=
b" rel=3D"noreferrer" target=3D"_blank">opencl-clhpp_git.bb</a><br>
&gt; @@ -6,7 +6,7 @@ SRC_URI =3D &quot;git://<a href=3D"http://github.com/K=
hronosGroup/OpenCL-CLHPP.git;protocol=3Dhttps;branch=3D" rel=3D"noreferrer"=
 target=3D"_blank">github.com/KhronosGroup/OpenCL-CLHPP.git;protocol=3Dhttp=
s;branch=3D</a><br>
&gt;=C2=A0 LICENSE=C2=A0 =3D &quot;Apache-2.0&quot;<br>
&gt;=C2=A0 LIC_FILES_CHKSUM =3D &quot;file://LICENSE.txt;md5=3D3b83ef96387f=
14655fc854ddc3c6bd57&quot;<br>
&gt;<br>
&gt; -PV =3D &quot;2.0.16+git${SRCPV}&quot;<br>
&gt; +PV =3D &quot;2.0.16+git&quot;<br>
&gt;=C2=A0 SRCREV =3D &quot;1df82b9749739f2681081092ae163bb0f0d40f66&quot;<=
br>
&gt;<br>
&gt;=C2=A0 S =3D &quot;${WORKDIR}/git&quot;<br>
&gt; diff --git a/meta-oe/recipes-crypto/pkcs11-helper/<a href=3D"http://pk=
cs11-helper_1.30.0.bb" rel=3D"noreferrer" target=3D"_blank">pkcs11-helper_1=
.30.0.bb</a> b/meta-oe/recipes-crypto/pkcs11-helper/<a href=3D"http://pkcs1=
1-helper_1.30.0.bb" rel=3D"noreferrer" target=3D"_blank">pkcs11-helper_1.30=
.0.bb</a><br>
&gt; index df6ca75461..d3922cf79e 100644<br>
&gt; --- a/meta-oe/recipes-crypto/pkcs11-helper/<a href=3D"http://pkcs11-he=
lper_1.30.0.bb" rel=3D"noreferrer" target=3D"_blank">pkcs11-helper_1.30.0.b=
b</a><br>
&gt; +++ b/meta-oe/recipes-crypto/pkcs11-helper/<a href=3D"http://pkcs11-he=
lper_1.30.0.bb" rel=3D"noreferrer" target=3D"_blank">pkcs11-helper_1.30.0.b=
b</a><br>
&gt; @@ -20,7 +20,7 @@ SRC_URI =3D &quot;git://<a href=3D"http://github.com=
/OpenSC/$%7BBPN%7D.git;branch=3Dmaster;protocol=3Dhttps" rel=3D"noreferrer"=
 target=3D"_blank">github.com/OpenSC/${BPN}.git;branch=3Dmaster;protocol=3D=
https</a>&quot;<br>
&gt;=C2=A0 S =3D &quot;${WORKDIR}/git&quot;<br>
&gt;=C2=A0 # master<br>
&gt;=C2=A0 SRCREV =3D &quot;8bed16034f629a0361fa8ff89deed2b43dc45d8b&quot;<=
br>
&gt; -PV .=3D &quot;+1.30.0+git${SRCPV}&quot;<br>
&gt; +PV .=3D &quot;+1.30.0+git&quot;<br>
&gt;<br>
&gt;=C2=A0 UPSTREAM_CHECK_GITTAGREGEX =3D &quot;pkcs11-helper-(?P&lt;pver&g=
t;\d+(\.\d+)+)&quot;<br>
&gt;<br>
&gt; diff --git a/meta-oe/recipes-devtools/apitrace/<a href=3D"http://apitr=
ace_11.1.bb" rel=3D"noreferrer" target=3D"_blank">apitrace_11.1.bb</a> b/me=
ta-oe/recipes-devtools/apitrace/<a href=3D"http://apitrace_11.1.bb" rel=3D"=
noreferrer" target=3D"_blank">apitrace_11.1.bb</a><br>
&gt; index aed7977595..d872c4dbb5 100644<br>
&gt; --- a/meta-oe/recipes-devtools/apitrace/<a href=3D"http://apitrace_11.=
1.bb" rel=3D"noreferrer" target=3D"_blank">apitrace_11.1.bb</a><br>
&gt; +++ b/meta-oe/recipes-devtools/apitrace/<a href=3D"http://apitrace_11.=
1.bb" rel=3D"noreferrer" target=3D"_blank">apitrace_11.1.bb</a><br>
&gt; @@ -6,7 +6,7 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3Daeb969=
185a143c3c25130bc2c3ef9a50 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 file://thirdparty/snappy/COPYING;md5=3Df62f3080324a97b3159a7a7e61812=
d0c&quot;<br>
&gt;<br>
&gt;=C2=A0 SRCREV =3D &quot;9352fc02bba106fbbeef9e8452ef34643c0d0764&quot;<=
br>
&gt; -PV .=3D &quot;+11.1+git${SRCPV}&quot;<br>
&gt; +PV .=3D &quot;+11.1+git&quot;<br>
&gt;=C2=A0 SRC_URI =3D &quot;gitsm://<a href=3D"http://github.com/$%7BBPN%7=
D/$%7BBPN%7D.git;branch=3Dmaster;protocol=3Dhttps" rel=3D"noreferrer" targe=
t=3D"_blank">github.com/${BPN}/${BPN}.git;branch=3Dmaster;protocol=3Dhttps<=
/a> \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
&gt;<br>
&gt; diff --git a/meta-oe/recipes-devtools/concurrencykit/<a href=3D"http:/=
/concurrencykit_git.bb" rel=3D"noreferrer" target=3D"_blank">concurrencykit=
_git.bb</a> b/meta-oe/recipes-devtools/concurrencykit/<a href=3D"http://con=
currencykit_git.bb" rel=3D"noreferrer" target=3D"_blank">concurrencykit_git=
.bb</a><br>
&gt; index 277fac9f7c..47a3d88853 100644<br>
&gt; --- a/meta-oe/recipes-devtools/concurrencykit/<a href=3D"http://concur=
rencykit_git.bb" rel=3D"noreferrer" target=3D"_blank">concurrencykit_git.bb=
</a><br>
&gt; +++ b/meta-oe/recipes-devtools/concurrencykit/<a href=3D"http://concur=
rencykit_git.bb" rel=3D"noreferrer" target=3D"_blank">concurrencykit_git.bb=
</a><br>
&gt; @@ -7,7 +7,7 @@ LICENSE =3D &quot;BSD-2-Clause &amp; Apache-2.0&quot;<=
br>
&gt;=C2=A0 HOMEPAGE =3D &quot;<a href=3D"http://concurrencykit.org" rel=3D"=
noreferrer" target=3D"_blank">http://concurrencykit.org</a>&quot;<br>
&gt;=C2=A0 SECTION =3D &quot;base&quot;<br>
&gt;<br>
&gt; -PV =3D &quot;0.7.0+git${SRCPV}&quot;<br>
&gt; +PV =3D &quot;0.7.0+git&quot;<br>
&gt;=C2=A0 SRCREV =3D &quot;6e8e5bec2e2f8cef2072a68579cbb07ababf3331&quot;<=
br>
&gt;=C2=A0 LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3Da0b24c1a8f9ad516=
a297d055b0294231&quot;<br>
&gt;=C2=A0 SRC_URI =3D &quot;git://<a href=3D"http://github.com/concurrency=
kit/ck.git;branch=3Dmaster;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_=
blank">github.com/concurrencykit/ck.git;branch=3Dmaster;protocol=3Dhttps</a=
> \<br>
&gt; diff --git a/meta-oe/recipes-devtools/guider/<a href=3D"http://guider_=
3.9.8.bb" rel=3D"noreferrer" target=3D"_blank">guider_3.9.8.bb</a> b/meta-o=
e/recipes-devtools/guider/<a href=3D"http://guider_3.9.8.bb" rel=3D"norefer=
rer" target=3D"_blank">guider_3.9.8.bb</a><br>
&gt; index 15d43e9790..0d93297a07 100644<br>
&gt; --- a/meta-oe/recipes-devtools/guider/<a href=3D"http://guider_3.9.8.b=
b" rel=3D"noreferrer" target=3D"_blank">guider_3.9.8.bb</a><br>
&gt; +++ b/meta-oe/recipes-devtools/guider/<a href=3D"http://guider_3.9.8.b=
b" rel=3D"noreferrer" target=3D"_blank">guider_3.9.8.bb</a><br>
&gt; @@ -5,7 +5,7 @@ BUGTRACKER =3D &quot;<a href=3D"https://github.com/iip=
eace/guider/issues" rel=3D"noreferrer" target=3D"_blank">https://github.com=
/iipeace/guider/issues</a>&quot;<br>
&gt;=C2=A0 LICENSE =3D &quot;GPL-2.0-or-later&quot;<br>
&gt;=C2=A0 LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D2c1c00f9d3ed9e24=
fa69b932b7e7aff2&quot;<br>
&gt;<br>
&gt; -PV =3D &quot;3.9.8+git${SRCPV}&quot;<br>
&gt; +PV =3D &quot;3.9.8+git&quot;<br>
&gt;<br>
&gt;=C2=A0 SRC_URI =3D &quot;git://<a href=3D"http://github.com/iipeace/$%7=
BBPN%7D;branch=3Dmaster;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_bla=
nk">github.com/iipeace/${BPN};branch=3Dmaster;protocol=3Dhttps</a>&quot;<br=
>
&gt;=C2=A0 SRCREV =3D &quot;a502cd93b13235b7539557a91328de00b7c51bc3&quot;<=
br>
&gt; diff --git a/meta-oe/recipes-devtools/libubox/<a href=3D"http://libubo=
x_git.bb" rel=3D"noreferrer" target=3D"_blank">libubox_git.bb</a> b/meta-oe=
/recipes-devtools/libubox/<a href=3D"http://libubox_git.bb" rel=3D"noreferr=
er" target=3D"_blank">libubox_git.bb</a><br>
&gt; index b2898c9c7f..39e18cdafd 100644<br>
&gt; --- a/meta-oe/recipes-devtools/libubox/<a href=3D"http://libubox_git.b=
b" rel=3D"noreferrer" target=3D"_blank">libubox_git.bb</a><br>
&gt; +++ b/meta-oe/recipes-devtools/libubox/<a href=3D"http://libubox_git.b=
b" rel=3D"noreferrer" target=3D"_blank">libubox_git.bb</a><br>
&gt; @@ -20,7 +20,7 @@ SRC_URI =3D &quot;\<br>
&gt;=C2=A0 &quot;<br>
&gt;<br>
&gt;=C2=A0 SRCREV =3D &quot;07413cce72e19520af55dfcbc765484f5ab41dd9&quot;<=
br>
&gt; -PV =3D &quot;1.0.1+git${SRCPV}&quot;<br>
&gt; +PV =3D &quot;1.0.1+git&quot;<br>
&gt;<br>
&gt;=C2=A0 S =3D &quot;${WORKDIR}/git&quot;<br>
&gt;<br>
&gt; diff --git a/meta-oe/recipes-devtools/lshw/<a href=3D"http://lshw_02.2=
0.bb" rel=3D"noreferrer" target=3D"_blank">lshw_02.20.bb</a> b/meta-oe/reci=
pes-devtools/lshw/<a href=3D"http://lshw_02.20.bb" rel=3D"noreferrer" targe=
t=3D"_blank">lshw_02.20.bb</a><br>
&gt; index 70ae38caa2..0fb68d8684 100644<br>
&gt; --- a/meta-oe/recipes-devtools/lshw/<a href=3D"http://lshw_02.20.bb" r=
el=3D"noreferrer" target=3D"_blank">lshw_02.20.bb</a><br>
&gt; +++ b/meta-oe/recipes-devtools/lshw/<a href=3D"http://lshw_02.20.bb" r=
el=3D"noreferrer" target=3D"_blank">lshw_02.20.bb</a><br>
&gt; @@ -11,7 +11,7 @@ LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Db234=
ee4d69f5fce4486a80fdaf4a4263&quot;<br>
&gt;<br>
&gt;=C2=A0 COMPATIBLE_HOST =3D &quot;(i.86|x86_64|arm|aarch64|riscv64).*-li=
nux&quot;<br>
&gt;<br>
&gt; -PV .=3D &quot;+git${SRCPV}&quot;<br>
&gt; +PV .=3D &quot;+git&quot;<br>
&gt;=C2=A0 SRCREV =3D &quot;4c6497c8b0a67cd9fa9693e9101a7cafd3297e81&quot;<=
br>
&gt;=C2=A0 SRC_URI =3D &quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 git://<a href=3D"http://github.com/lyonel/lshw.git=
;protocol=3Dhttps;branch=3Dmaster" rel=3D"noreferrer" target=3D"_blank">git=
hub.com/lyonel/lshw.git;protocol=3Dhttps;branch=3Dmaster</a> \<br>
&gt; diff --git a/meta-oe/recipes-devtools/ltrace/<a href=3D"http://ltrace_=
git.bb" rel=3D"noreferrer" target=3D"_blank">ltrace_git.bb</a> b/meta-oe/re=
cipes-devtools/ltrace/<a href=3D"http://ltrace_git.bb" rel=3D"noreferrer" t=
arget=3D"_blank">ltrace_git.bb</a><br>
&gt; index d690dd4f02..63971970cf 100644<br>
&gt; --- a/meta-oe/recipes-devtools/ltrace/<a href=3D"http://ltrace_git.bb"=
 rel=3D"noreferrer" target=3D"_blank">ltrace_git.bb</a><br>
&gt; +++ b/meta-oe/recipes-devtools/ltrace/<a href=3D"http://ltrace_git.bb"=
 rel=3D"noreferrer" target=3D"_blank">ltrace_git.bb</a><br>
&gt; @@ -10,7 +10,7 @@ LICENSE =3D &quot;GPL-2.0-only&quot;<br>
&gt;=C2=A0 LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Deb723b61539feef0=
13de476e68b5c50a&quot;<br>
&gt;<br>
&gt;=C2=A0 PE =3D &quot;1&quot;<br>
&gt; -PV =3D &quot;7.91+git${SRCPV}&quot;<br>
&gt; +PV =3D &quot;7.91+git&quot;<br>
&gt;=C2=A0 SRCREV =3D &quot;c22d359433b333937ee3d803450dc41998115685&quot;<=
br>
&gt;<br>
&gt;=C2=A0 DEPENDS =3D &quot;elfutils&quot;<br>
&gt; diff --git a/meta-oe/recipes-devtools/nlohmann-fifo/<a href=3D"http://=
nlohmann-fifo_git.bb" rel=3D"noreferrer" target=3D"_blank">nlohmann-fifo_gi=
t.bb</a> b/meta-oe/recipes-devtools/nlohmann-fifo/<a href=3D"http://nlohman=
n-fifo_git.bb" rel=3D"noreferrer" target=3D"_blank">nlohmann-fifo_git.bb</a=
><br>
&gt; index b5d05d40e5..36e46021bb 100644<br>
&gt; --- a/meta-oe/recipes-devtools/nlohmann-fifo/<a href=3D"http://nlohman=
n-fifo_git.bb" rel=3D"noreferrer" target=3D"_blank">nlohmann-fifo_git.bb</a=
><br>
&gt; +++ b/meta-oe/recipes-devtools/nlohmann-fifo/<a href=3D"http://nlohman=
n-fifo_git.bb" rel=3D"noreferrer" target=3D"_blank">nlohmann-fifo_git.bb</a=
><br>
&gt; @@ -6,7 +6,7 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE.MIT;md5=3Db6=
7209a1e36b682a8226de19d265b1e0&quot;<br>
&gt;<br>
&gt;=C2=A0 SRC_URI =3D &quot;git://<a href=3D"http://github.com/nlohmann/fi=
fo_map.git;branch=3Dmaster;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_=
blank">github.com/nlohmann/fifo_map.git;branch=3Dmaster;protocol=3Dhttps</a=
>&quot;<br>
&gt;<br>
&gt; -PV =3D &quot;1.0.0+git${SRCPV}&quot;<br>
&gt; +PV =3D &quot;1.0.0+git&quot;<br>
&gt;<br>
&gt;=C2=A0 SRCREV =3D &quot;d732aaf9a315415ae8fd7eb11e3a4c1f80e42a48&quot;<=
br>
&gt;<br>
&gt; diff --git a/meta-oe/recipes-devtools/openocd/<a href=3D"http://openoc=
d_git.bb" rel=3D"noreferrer" target=3D"_blank">openocd_git.bb</a> b/meta-oe=
/recipes-devtools/openocd/<a href=3D"http://openocd_git.bb" rel=3D"noreferr=
er" target=3D"_blank">openocd_git.bb</a><br>
&gt; index 19ef987387..36cdb00f2b 100644<br>
&gt; --- a/meta-oe/recipes-devtools/openocd/<a href=3D"http://openocd_git.b=
b" rel=3D"noreferrer" target=3D"_blank">openocd_git.bb</a><br>
&gt; +++ b/meta-oe/recipes-devtools/openocd/<a href=3D"http://openocd_git.b=
b" rel=3D"noreferrer" target=3D"_blank">openocd_git.bb</a><br>
&gt; @@ -17,7 +17,7 @@ SRCREV_git2cl =3D &quot;8373c9f74993e218a08819cbcdba=
b3f3564bbeba&quot;<br>
&gt;=C2=A0 SRCREV_jimtcl =3D &quot;fcbb4499a6b46ef69e7a95da53e30796e20817f0=
&quot;<br>
&gt;=C2=A0 SRCREV_libjaylink =3D &quot;9aa7a5957c07bb6e862fc1a6d3153d109c74=
07e4&quot;<br>
&gt;<br>
&gt; -PV =3D &quot;0.12+gitr${SRCPV}&quot;<br>
&gt; +PV =3D &quot;0.12+gitr&quot;<br>
&gt;=C2=A0 S =3D &quot;${WORKDIR}/git&quot;<br>
&gt;<br>
&gt;=C2=A0 inherit pkgconfig autotools-brokensep gettext<br>
&gt; diff --git a/meta-oe/recipes-devtools/pmtools/<a href=3D"http://pmtool=
s_git.bb" rel=3D"noreferrer" target=3D"_blank">pmtools_git.bb</a> b/meta-oe=
/recipes-devtools/pmtools/<a href=3D"http://pmtools_git.bb" rel=3D"noreferr=
er" target=3D"_blank">pmtools_git.bb</a><br>
&gt; index 56d895a099..ad149de12c 100644<br>
&gt; --- a/meta-oe/recipes-devtools/pmtools/<a href=3D"http://pmtools_git.b=
b" rel=3D"noreferrer" target=3D"_blank">pmtools_git.bb</a><br>
&gt; +++ b/meta-oe/recipes-devtools/pmtools/<a href=3D"http://pmtools_git.b=
b" rel=3D"noreferrer" target=3D"_blank">pmtools_git.bb</a><br>
&gt; @@ -4,7 +4,7 @@ HOMEPAGE =3D &quot;<a href=3D"http://lesswatts.org/pro=
jects/acpi" rel=3D"noreferrer" target=3D"_blank">http://lesswatts.org/proje=
cts/acpi</a>&quot;<br>
&gt;=C2=A0 LICENSE =3D &quot;GPL-2.0-or-later&quot;<br>
&gt;=C2=A0 LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D0636e73ff0215e8d=
672dc4c32c317bb3&quot;<br>
&gt;<br>
&gt; -PV =3D &quot;20130209+git${SRCPV}&quot;<br>
&gt; +PV =3D &quot;20130209+git&quot;<br>
&gt;<br>
&gt;=C2=A0 SRC_URI =3D &quot;git://<a href=3D"http://github.com/anyc/pmtool=
s.git;branch=3Dmaster;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_blank=
">github.com/anyc/pmtools.git;branch=3Dmaster;protocol=3Dhttps</a> \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 file://pmtools-switch-to-dynamic-buffer-for-huge-A=
CPI-table.patch \<br>
&gt; diff --git a/meta-oe/recipes-devtools/rapidjson/<a href=3D"http://rapi=
djson_git.bb" rel=3D"noreferrer" target=3D"_blank">rapidjson_git.bb</a> b/m=
eta-oe/recipes-devtools/rapidjson/<a href=3D"http://rapidjson_git.bb" rel=
=3D"noreferrer" target=3D"_blank">rapidjson_git.bb</a><br>
&gt; index 65294fafad..8519479c4d 100644<br>
&gt; --- a/meta-oe/recipes-devtools/rapidjson/<a href=3D"http://rapidjson_g=
it.bb" rel=3D"noreferrer" target=3D"_blank">rapidjson_git.bb</a><br>
&gt; +++ b/meta-oe/recipes-devtools/rapidjson/<a href=3D"http://rapidjson_g=
it.bb" rel=3D"noreferrer" target=3D"_blank">rapidjson_git.bb</a><br>
&gt; @@ -8,7 +8,7 @@ SRC_URI =3D &quot;git://<a href=3D"http://github.com/m=
iloyip/rapidjson.git;branch=3Dmaster;protocol=3Dhttps" rel=3D"noreferrer" t=
arget=3D"_blank">github.com/miloyip/rapidjson.git;branch=3Dmaster;protocol=
=3Dhttps</a>&quot;<br>
&gt;<br>
&gt;=C2=A0 SRCREV =3D &quot;0ccdbf364c577803e2a751f5aededce935314313&quot;<=
br>
&gt;<br>
&gt; -PV =3D &quot;1.1.0+git${SRCPV}&quot;<br>
&gt; +PV =3D &quot;1.1.0+git&quot;<br>
&gt;<br>
&gt;=C2=A0 S =3D &quot;${WORKDIR}/git&quot;<br>
&gt;<br>
&gt; diff --git a/meta-oe/recipes-devtools/yasm/<a href=3D"http://yasm_git.=
bb" rel=3D"noreferrer" target=3D"_blank">yasm_git.bb</a> b/meta-oe/recipes-=
devtools/yasm/<a href=3D"http://yasm_git.bb" rel=3D"noreferrer" target=3D"_=
blank">yasm_git.bb</a><br>
&gt; index 26540b4295..079f805d6c 100644<br>
&gt; --- a/meta-oe/recipes-devtools/yasm/<a href=3D"http://yasm_git.bb" rel=
=3D"noreferrer" target=3D"_blank">yasm_git.bb</a><br>
&gt; +++ b/meta-oe/recipes-devtools/yasm/<a href=3D"http://yasm_git.bb" rel=
=3D"noreferrer" target=3D"_blank">yasm_git.bb</a><br>
&gt; @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Da12d89=
03508fb6bfd49d8d82c6170dd9&quot;<br>
&gt;=C2=A0 DEPENDS +=3D &quot;flex-native bison-native&quot;<br>
&gt;=C2=A0 PACKAGECONFIG[docs] =3D &quot;,,xmlto-native,&quot;<br>
&gt;<br>
&gt; -PV =3D &quot;1.3.0+git${SRCPV}&quot;<br>
&gt; +PV =3D &quot;1.3.0+git&quot;<br>
&gt;=C2=A0 # v1.3.0<br>
&gt;=C2=A0 SRCREV =3D &quot;ba463d3c26c0ece2e797b8d6381b161633b5971a&quot;<=
br>
&gt;=C2=A0 SRC_URI =3D &quot;git://<a href=3D"http://github.com/yasm/yasm.g=
it;branch=3Dmaster;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_blank">g=
ithub.com/yasm/yasm.git;branch=3Dmaster;protocol=3Dhttps</a> \<br>
&gt; diff --git a/meta-oe/recipes-extended/docopt.cpp/<a href=3D"http://doc=
opt.cpp_git.bb" rel=3D"noreferrer" target=3D"_blank">docopt.cpp_git.bb</a> =
b/meta-oe/recipes-extended/docopt.cpp/<a href=3D"http://docopt.cpp_git.bb" =
rel=3D"noreferrer" target=3D"_blank">docopt.cpp_git.bb</a><br>
&gt; index 28db39ac20..3d438871ed 100644<br>
&gt; --- a/meta-oe/recipes-extended/docopt.cpp/<a href=3D"http://docopt.cpp=
_git.bb" rel=3D"noreferrer" target=3D"_blank">docopt.cpp_git.bb</a><br>
&gt; +++ b/meta-oe/recipes-extended/docopt.cpp/<a href=3D"http://docopt.cpp=
_git.bb" rel=3D"noreferrer" target=3D"_blank">docopt.cpp_git.bb</a><br>
&gt; @@ -15,7 +15,7 @@ LIC_FILES_CHKSUM =3D &quot;\<br>
&gt;<br>
&gt;=C2=A0 DEPENDS =3D &quot;boost&quot;<br>
&gt;=C2=A0 SRCREV =3D &quot;42ebcec9dc2c99a1b3a4542787572045763ad196&quot;<=
br>
&gt; -PV =3D &quot;0.6.3+git${SRCPV}&quot;<br>
&gt; +PV =3D &quot;0.6.3+git&quot;<br>
&gt;<br>
&gt;=C2=A0 SRC_URI =3D &quot;\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 git://<a href=3D"http://github.com/docopt/docopt.c=
pp.git;protocol=3Dhttps;branch=3Dmaster" rel=3D"noreferrer" target=3D"_blan=
k">github.com/docopt/docopt.cpp.git;protocol=3Dhttps;branch=3Dmaster</a> \<=
br>
&gt; diff --git a/meta-oe/recipes-extended/figlet/<a href=3D"http://figlet_=
git.bb" rel=3D"noreferrer" target=3D"_blank">figlet_git.bb</a> b/meta-oe/re=
cipes-extended/figlet/<a href=3D"http://figlet_git.bb" rel=3D"noreferrer" t=
arget=3D"_blank">figlet_git.bb</a><br>
&gt; index 61b050aac6..9789ac16d4 100644<br>
&gt; --- a/meta-oe/recipes-extended/figlet/<a href=3D"http://figlet_git.bb"=
 rel=3D"noreferrer" target=3D"_blank">figlet_git.bb</a><br>
&gt; +++ b/meta-oe/recipes-extended/figlet/<a href=3D"http://figlet_git.bb"=
 rel=3D"noreferrer" target=3D"_blank">figlet_git.bb</a><br>
&gt; @@ -8,7 +8,7 @@ SRC_URI =3D &quot;git://<a href=3D"http://github.com/c=
matsuoka/figlet.git;branch=3Dmaster;protocol=3Dhttps" rel=3D"noreferrer" ta=
rget=3D"_blank">github.com/cmatsuoka/figlet.git;branch=3Dmaster;protocol=3D=
https</a> \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-build-add-a=
utotools-support-to-allow-easy-cross-comp.patch&quot;<br>
&gt;=C2=A0 SRCREV =3D &quot;5bbcd7383a8c3a531299b216b0c734e1495c6db3&quot;<=
br>
&gt;=C2=A0 S =3D &quot;${WORKDIR}/git&quot;<br>
&gt; -PV =3D &quot;2.2.5+git${SRCPV}&quot;<br>
&gt; +PV =3D &quot;2.2.5+git&quot;<br>
&gt;<br>
&gt;=C2=A0 inherit autotools<br>
&gt;<br>
&gt; diff --git a/meta-oe/recipes-extended/jpnevulator/<a href=3D"http://jp=
nevulator_git.bb" rel=3D"noreferrer" target=3D"_blank">jpnevulator_git.bb</=
a> b/meta-oe/recipes-extended/jpnevulator/<a href=3D"http://jpnevulator_git=
.bb" rel=3D"noreferrer" target=3D"_blank">jpnevulator_git.bb</a><br>
&gt; index 39d6459227..bfa0e79d8f 100644<br>
&gt; --- a/meta-oe/recipes-extended/jpnevulator/<a href=3D"http://jpnevulat=
or_git.bb" rel=3D"noreferrer" target=3D"_blank">jpnevulator_git.bb</a><br>
&gt; +++ b/meta-oe/recipes-extended/jpnevulator/<a href=3D"http://jpnevulat=
or_git.bb" rel=3D"noreferrer" target=3D"_blank">jpnevulator_git.bb</a><br>
&gt; @@ -2,7 +2,7 @@ SUMMARY =3D &quot;A handy serial sniffer&quot;<br>
&gt;=C2=A0 LICENSE =3D &quot;GPL-2.0-only&quot;<br>
&gt;=C2=A0 LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D892f569a555ba9c0=
7a568a7c0c4fa63a&quot;<br>
&gt;<br>
&gt; -PV =3D &quot;2.3.6+git${SRCPV}&quot;<br>
&gt; +PV =3D &quot;2.3.6+git&quot;<br>
&gt;<br>
&gt;=C2=A0 SRC_URI =3D &quot;git://<a href=3D"http://github.com/snarlistic/=
jpnevulator.git;protocol=3Dhttps;branch=3Dmaster" rel=3D"noreferrer" target=
=3D"_blank">github.com/snarlistic/jpnevulator.git;protocol=3Dhttps;branch=
=3Dmaster</a>&quot;<br>
&gt;=C2=A0 SRCREV =3D &quot;bc1d4f6587a4a4829b5d55e3ca7ad584da6de545&quot;<=
br>
&gt; diff --git a/meta-oe/recipes-extended/libbacktrace/<a href=3D"http://l=
ibbacktrace_git.bb" rel=3D"noreferrer" target=3D"_blank">libbacktrace_git.b=
b</a> b/meta-oe/recipes-extended/libbacktrace/<a href=3D"http://libbacktrac=
e_git.bb" rel=3D"noreferrer" target=3D"_blank">libbacktrace_git.bb</a><br>
&gt; index 6f2ead9a8d..d540737bc9 100644<br>
&gt; --- a/meta-oe/recipes-extended/libbacktrace/<a href=3D"http://libbackt=
race_git.bb" rel=3D"noreferrer" target=3D"_blank">libbacktrace_git.bb</a><b=
r>
&gt; +++ b/meta-oe/recipes-extended/libbacktrace/<a href=3D"http://libbackt=
race_git.bb" rel=3D"noreferrer" target=3D"_blank">libbacktrace_git.bb</a><b=
r>
&gt; @@ -10,7 +10,7 @@ DEPENDS +=3D &quot;libunwind&quot;<br>
&gt;<br>
&gt;=C2=A0 SRC_URI =3D &quot;git://<a href=3D"http://github.com/ianlancetay=
lor/libbacktrace;protocol=3Dhttps;branch=3Dmaster" rel=3D"noreferrer" targe=
t=3D"_blank">github.com/ianlancetaylor/libbacktrace;protocol=3Dhttps;branch=
=3Dmaster</a>&quot;<br>
&gt;<br>
&gt; -PV =3D &quot;1.0+git${SRCPV}&quot;<br>
&gt; +PV =3D &quot;1.0+git&quot;<br>
&gt;=C2=A0 SRCREV =3D &quot;9ae4f4ae4481b1e69d38ed810980d33103544613&quot;<=
br>
&gt;<br>
&gt;=C2=A0 S =3D &quot;${WORKDIR}/git&quot;<br>
&gt; diff --git a/meta-oe/recipes-extended/libimobiledevice/<a href=3D"http=
://libplist_git.bb" rel=3D"noreferrer" target=3D"_blank">libplist_git.bb</a=
> b/meta-oe/recipes-extended/libimobiledevice/<a href=3D"http://libplist_gi=
t.bb" rel=3D"noreferrer" target=3D"_blank">libplist_git.bb</a><br>
&gt; index 6fbc28394f..26dd821f96 100644<br>
&gt; --- a/meta-oe/recipes-extended/libimobiledevice/<a href=3D"http://libp=
list_git.bb" rel=3D"noreferrer" target=3D"_blank">libplist_git.bb</a><br>
&gt; +++ b/meta-oe/recipes-extended/libimobiledevice/<a href=3D"http://libp=
list_git.bb" rel=3D"noreferrer" target=3D"_blank">libplist_git.bb</a><br>
&gt; @@ -8,7 +8,7 @@ DEPENDS =3D &quot;libxml2 glib-2.0 swig python3&quot;<=
br>
&gt;<br>
&gt;=C2=A0 inherit autotools pkgconfig python3native python3targetconfig<br=
>
&gt;<br>
&gt; -PV =3D &quot;2.3.0+git${SRCPV}&quot;<br>
&gt; +PV =3D &quot;2.3.0+git&quot;<br>
&gt;<br>
&gt;=C2=A0 SRCREV =3D &quot;2cd858c679d25633077ca78b67182a9b77653816&quot;<=
br>
&gt;=C2=A0 SRC_URI =3D &quot;git://<a href=3D"http://github.com/libimobiled=
evice/libplist;protocol=3Dhttps;branch=3Dmaster" rel=3D"noreferrer" target=
=3D"_blank">github.com/libimobiledevice/libplist;protocol=3Dhttps;branch=3D=
master</a>&quot;<br>
&gt; diff --git a/meta-oe/recipes-extended/libimobiledevice/<a href=3D"http=
://libusbmuxd_git.bb" rel=3D"noreferrer" target=3D"_blank">libusbmuxd_git.b=
b</a> b/meta-oe/recipes-extended/libimobiledevice/<a href=3D"http://libusbm=
uxd_git.bb" rel=3D"noreferrer" target=3D"_blank">libusbmuxd_git.bb</a><br>
&gt; index 91a9b4af2c..b9f5c34094 100644<br>
&gt; --- a/meta-oe/recipes-extended/libimobiledevice/<a href=3D"http://libu=
sbmuxd_git.bb" rel=3D"noreferrer" target=3D"_blank">libusbmuxd_git.bb</a><b=
r>
&gt; +++ b/meta-oe/recipes-extended/libimobiledevice/<a href=3D"http://libu=
sbmuxd_git.bb" rel=3D"noreferrer" target=3D"_blank">libusbmuxd_git.bb</a><b=
r>
&gt; @@ -7,7 +7,7 @@ DEPENDS =3D &quot;udev libusb1 libplist libimobiledevi=
ce-glue&quot;<br>
&gt;=C2=A0 inherit autotools pkgconfig gitpkgv<br>
&gt;<br>
&gt;=C2=A0 PKGV =3D &quot;${GITPKGVTAG}&quot;<br>
&gt; -PV =3D &quot;2.0.2+git${SRCPV}&quot;<br>
&gt; +PV =3D &quot;2.0.2+git&quot;<br>
&gt;<br>
&gt;=C2=A0 SRCREV =3D &quot;36ffb7ab6e2a7e33bd1b56398a88895b7b8c615a&quot;<=
br>
&gt;=C2=A0 SRC_URI =3D &quot;git://<a href=3D"http://github.com/libimobiled=
evice/libusbmuxd;protocol=3Dhttps;branch=3Dmaster" rel=3D"noreferrer" targe=
t=3D"_blank">github.com/libimobiledevice/libusbmuxd;protocol=3Dhttps;branch=
=3Dmaster</a>&quot;<br>
&gt; diff --git a/meta-oe/recipes-extended/libuio/<a href=3D"http://libuio_=
0.2.1.bb" rel=3D"noreferrer" target=3D"_blank">libuio_0.2.1.bb</a> b/meta-o=
e/recipes-extended/libuio/<a href=3D"http://libuio_0.2.1.bb" rel=3D"norefer=
rer" target=3D"_blank">libuio_0.2.1.bb</a><br>
&gt; index 65bf9ba647..6e6c8cc226 100644<br>
&gt; --- a/meta-oe/recipes-extended/libuio/<a href=3D"http://libuio_0.2.1.b=
b" rel=3D"noreferrer" target=3D"_blank">libuio_0.2.1.bb</a><br>
&gt; +++ b/meta-oe/recipes-extended/libuio/<a href=3D"http://libuio_0.2.1.b=
b" rel=3D"noreferrer" target=3D"_blank">libuio_0.2.1.bb</a><br>
&gt; @@ -7,7 +7,7 @@ SRCREV =3D &quot;17d96e8f9a5bce7cee5e2222855ab46a246db=
a51&quot;<br>
&gt;<br>
&gt;=C2=A0 SRC_URI =3D &quot;git://<a href=3D"http://git.code.sf.net/p/libu=
io/code;branch=3Dmaster;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_bla=
nk">git.code.sf.net/p/libuio/code;branch=3Dmaster;protocol=3Dhttps</a>&quot=
;<br>
&gt;<br>
&gt; -PV .=3D &quot;+0.2.2+git${SRCPV}&quot;<br>
&gt; +PV .=3D &quot;+0.2.2+git&quot;<br>
&gt;<br>
&gt;=C2=A0 inherit autotools<br>
&gt;<br>
&gt; diff --git a/meta-oe/recipes-extended/md5deep/<a href=3D"http://md5dee=
p_git.bb" rel=3D"noreferrer" target=3D"_blank">md5deep_git.bb</a> b/meta-oe=
/recipes-extended/md5deep/<a href=3D"http://md5deep_git.bb" rel=3D"noreferr=
er" target=3D"_blank">md5deep_git.bb</a><br>
&gt; index b1a38cf6f2..5351a37db6 100644<br>
&gt; --- a/meta-oe/recipes-extended/md5deep/<a href=3D"http://md5deep_git.b=
b" rel=3D"noreferrer" target=3D"_blank">md5deep_git.bb</a><br>
&gt; +++ b/meta-oe/recipes-extended/md5deep/<a href=3D"http://md5deep_git.b=
b" rel=3D"noreferrer" target=3D"_blank">md5deep_git.bb</a><br>
&gt; @@ -4,7 +4,7 @@ HOMEPAGE =3D &quot;<a href=3D"http://md5deep.sourcefor=
ge.net" rel=3D"noreferrer" target=3D"_blank">http://md5deep.sourceforge.net=
</a>&quot;<br>
&gt;=C2=A0 LICENSE =3D &quot;GPL-2.0-only&quot;<br>
&gt;=C2=A0 LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D9190f660105b9a56=
cdb272309bfd5491&quot;<br>
&gt;<br>
&gt; -PV =3D &quot;4.4+git${SRCPV}&quot;<br>
&gt; +PV =3D &quot;4.4+git&quot;<br>
&gt;<br>
&gt;=C2=A0 SRCREV =3D &quot;877613493ff44807888ce1928129574be393cbb0&quot;<=
br>
&gt;<br>
&gt; diff --git a/meta-oe/recipes-extended/mraa/<a href=3D"http://mraa_git.=
bb" rel=3D"noreferrer" target=3D"_blank">mraa_git.bb</a> b/meta-oe/recipes-=
extended/mraa/<a href=3D"http://mraa_git.bb" rel=3D"noreferrer" target=3D"_=
blank">mraa_git.bb</a><br>
&gt; index 61f36d724d..37bd36432f 100644<br>
&gt; --- a/meta-oe/recipes-extended/mraa/<a href=3D"http://mraa_git.bb" rel=
=3D"noreferrer" target=3D"_blank">mraa_git.bb</a><br>
&gt; +++ b/meta-oe/recipes-extended/mraa/<a href=3D"http://mraa_git.bb" rel=
=3D"noreferrer" target=3D"_blank">mraa_git.bb</a><br>
&gt; @@ -6,7 +6,7 @@ LICENSE =3D &quot;MIT&quot;<br>
&gt;=C2=A0 LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D91e7de50a8d3cf01=
057f318d72460acd&quot;<br>
&gt;<br>
&gt;=C2=A0 SRCREV =3D &quot;3c288a09109969eef9c2da7d92d3c62f92a015cc&quot;<=
br>
&gt; -PV =3D &quot;2.2.0+git${SRCPV}&quot;<br>
&gt; +PV =3D &quot;2.2.0+git&quot;<br>
&gt;<br>
&gt;=C2=A0 SRC_URI =3D &quot;git://<a href=3D"http://github.com/eclipse/$%7=
BBPN%7D.git;protocol=3Dhttps;branch=3Dmaster" rel=3D"noreferrer" target=3D"=
_blank">github.com/eclipse/${BPN}.git;protocol=3Dhttps;branch=3Dmaster</a> =
\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-cmake-Use-a=
-regular-expression-to-match-x86-architec.patch \<br>
&gt; diff --git a/meta-oe/recipes-extended/p8platform/<a href=3D"http://p8p=
latform_git.bb" rel=3D"noreferrer" target=3D"_blank">p8platform_git.bb</a> =
b/meta-oe/recipes-extended/p8platform/<a href=3D"http://p8platform_git.bb" =
rel=3D"noreferrer" target=3D"_blank">p8platform_git.bb</a><br>
&gt; index bb9574feb2..dc7280f099 100644<br>
&gt; --- a/meta-oe/recipes-extended/p8platform/<a href=3D"http://p8platform=
_git.bb" rel=3D"noreferrer" target=3D"_blank">p8platform_git.bb</a><br>
&gt; +++ b/meta-oe/recipes-extended/p8platform/<a href=3D"http://p8platform=
_git.bb" rel=3D"noreferrer" target=3D"_blank">p8platform_git.bb</a><br>
&gt; @@ -4,7 +4,7 @@ HOMEPAGE =3D &quot;<a href=3D"http://libcec.pulse-eigh=
t.com/" rel=3D"noreferrer" target=3D"_blank">http://libcec.pulse-eight.com/=
</a>&quot;<br>
&gt;=C2=A0 LICENSE =3D &quot;GPL-2.0-or-later&quot;<br>
&gt;=C2=A0 LIC_FILES_CHKSUM =3D &quot;file://src/os.h;md5=3D752555fa94e8200=
5d45fd201fee5bd33&quot;<br>
&gt;<br>
&gt; -PV =3D &quot;2.1.0.1+git${SRCPV}&quot;<br>
&gt; +PV =3D &quot;2.1.0.1+git&quot;<br>
&gt;<br>
&gt;=C2=A0 SRC_URI =3D &quot;git://<a href=3D"http://github.com/Pulse-Eight=
/platform.git;branch=3Dmaster;protocol=3Dhttps" rel=3D"noreferrer" target=
=3D"_blank">github.com/Pulse-Eight/platform.git;branch=3Dmaster;protocol=3D=
https</a>&quot;<br>
&gt;=C2=A0 SRCREV =3D &quot;a7cd0d5780ed80a4e70480d1650749f29e8a1fb2&quot;<=
br>
&gt; diff --git a/meta-oe/recipes-extended/properties-cpp/<a href=3D"http:/=
/properties-cpp_git.bb" rel=3D"noreferrer" target=3D"_blank">properties-cpp=
_git.bb</a> b/meta-oe/recipes-extended/properties-cpp/<a href=3D"http://pro=
perties-cpp_git.bb" rel=3D"noreferrer" target=3D"_blank">properties-cpp_git=
.bb</a><br>
&gt; index 88a18aa137..25951c9de4 100644<br>
&gt; --- a/meta-oe/recipes-extended/properties-cpp/<a href=3D"http://proper=
ties-cpp_git.bb" rel=3D"noreferrer" target=3D"_blank">properties-cpp_git.bb=
</a><br>
&gt; +++ b/meta-oe/recipes-extended/properties-cpp/<a href=3D"http://proper=
ties-cpp_git.bb" rel=3D"noreferrer" target=3D"_blank">properties-cpp_git.bb=
</a><br>
&gt; @@ -6,7 +6,7 @@ SECTION =3D &quot;libs&quot;<br>
&gt;=C2=A0 LICENSE =3D &quot;LGPL-3.0-only&quot;<br>
&gt;=C2=A0 LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3De6a600fd5e1d9cbd=
e2d983680233ad02&quot;<br>
&gt;<br>
&gt; -PV =3D &quot;0.0.1+git${SRCPV}&quot;<br>
&gt; +PV =3D &quot;0.0.1+git&quot;<br>
&gt;<br>
&gt;=C2=A0 SRCREV =3D &quot;45863e849b39c4921d6553e6d27e267a96ac7d77&quot;<=
br>
&gt;=C2=A0 SRC_URI =3D &quot;git://<a href=3D"http://github.com/lib-cpp/$%7=
BBPN%7D.git;branch=3Dmaster;protocol=3Dhttps" rel=3D"noreferrer" target=3D"=
_blank">github.com/lib-cpp/${BPN}.git;branch=3Dmaster;protocol=3Dhttps</a>&=
quot;<br>
&gt; diff --git a/meta-oe/recipes-extended/qad/<a href=3D"http://qad_git.bb=
" rel=3D"noreferrer" target=3D"_blank">qad_git.bb</a> b/meta-oe/recipes-ext=
ended/qad/<a href=3D"http://qad_git.bb" rel=3D"noreferrer" target=3D"_blank=
">qad_git.bb</a><br>
&gt; index 056f28a0a4..0bc94121a7 100644<br>
&gt; --- a/meta-oe/recipes-extended/qad/<a href=3D"http://qad_git.bb" rel=
=3D"noreferrer" target=3D"_blank">qad_git.bb</a><br>
&gt; +++ b/meta-oe/recipes-extended/qad/<a href=3D"http://qad_git.bb" rel=
=3D"noreferrer" target=3D"_blank">qad_git.bb</a><br>
&gt; @@ -15,7 +15,7 @@ SRC_URI =3D &quot;git://<a href=3D"http://gitlab.com=
/CodethinkLabs/qad/qad;branch=3Dmain;protocol=3Dhttps" rel=3D"noreferrer" t=
arget=3D"_blank">gitlab.com/CodethinkLabs/qad/qad;branch=3Dmain;protocol=3D=
https</a> \<br>
&gt;=C2=A0 SRCREV =3D &quot;ae0c099c1fdc0ca6f5d631cea6b302937122b362&quot;<=
br>
&gt;<br>
&gt;=C2=A0 S =3D &quot;${WORKDIR}/git&quot;<br>
&gt; -PV =3D &quot;0.0+git${SRCPV}&quot;<br>
&gt; +PV =3D &quot;0.0+git&quot;<br>
&gt;<br>
&gt;=C2=A0 DEPENDS =3D &quot;cjson libmicrohttpd libdrm libpng&quot;<br>
&gt;<br>
&gt; diff --git a/meta-oe/recipes-extended/qcbor/<a href=3D"http://qcbor_gi=
t.bb" rel=3D"noreferrer" target=3D"_blank">qcbor_git.bb</a> b/meta-oe/recip=
es-extended/qcbor/<a href=3D"http://qcbor_git.bb" rel=3D"noreferrer" target=
=3D"_blank">qcbor_git.bb</a><br>
&gt; index 9c562d5a66..a87454fa95 100644<br>
&gt; --- a/meta-oe/recipes-extended/qcbor/<a href=3D"http://qcbor_git.bb" r=
el=3D"noreferrer" target=3D"_blank">qcbor_git.bb</a><br>
&gt; +++ b/meta-oe/recipes-extended/qcbor/<a href=3D"http://qcbor_git.bb" r=
el=3D"noreferrer" target=3D"_blank">qcbor_git.bb</a><br>
&gt; @@ -12,7 +12,7 @@ SRC_URI =3D &quot;git://<a href=3D"http://github.com=
/laurencelundblade/QCBOR;protocol=3Dhttps;branch=3Dmaster" rel=3D"noreferre=
r" target=3D"_blank">github.com/laurencelundblade/QCBOR;protocol=3Dhttps;br=
anch=3Dmaster</a><br>
&gt;<br>
&gt;=C2=A0 SRCREV =3D &quot;44754f738c6534a4304a83d4c6e97b3d3193d887&quot;<=
br>
&gt;<br>
&gt; -PV =3D &quot;1.2+git${SRCPV}&quot;<br>
&gt; +PV =3D &quot;1.2+git&quot;<br>
&gt;<br>
&gt;=C2=A0 S =3D &quot;${WORKDIR}/git&quot;<br>
&gt;<br>
&gt; diff --git a/meta-oe/recipes-extended/sanlock/<a href=3D"http://sanloc=
k_3.9.0.bb" rel=3D"noreferrer" target=3D"_blank">sanlock_3.9.0.bb</a> b/met=
a-oe/recipes-extended/sanlock/<a href=3D"http://sanlock_3.9.0.bb" rel=3D"no=
referrer" target=3D"_blank">sanlock_3.9.0.bb</a><br>
&gt; index fa1c6c7ecd..a5a3b43feb 100644<br>
&gt; --- a/meta-oe/recipes-extended/sanlock/<a href=3D"http://sanlock_3.9.0=
.bb" rel=3D"noreferrer" target=3D"_blank">sanlock_3.9.0.bb</a><br>
&gt; +++ b/meta-oe/recipes-extended/sanlock/<a href=3D"http://sanlock_3.9.0=
.bb" rel=3D"noreferrer" target=3D"_blank">sanlock_3.9.0.bb</a><br>
&gt; @@ -11,7 +11,7 @@ SECTION =3D &quot;utils&quot;<br>
&gt;=C2=A0 LICENSE =3D &quot;LGPL-2.0-or-later &amp; GPL-2.0-only &amp; GPL=
-2.0-or-later&quot;<br>
&gt;=C2=A0 LIC_FILES_CHKSUM =3D &quot;file://README.license;md5=3D60487bf0b=
f429d6b5aa72b6d37a0eb22&quot;<br>
&gt;<br>
&gt; -PV .=3D &quot;+git${SRCPV}&quot;<br>
&gt; +PV .=3D &quot;+git&quot;<br>
&gt;<br>
&gt;=C2=A0 SRC_URI =3D &quot;git://<a href=3D"http://pagure.io/sanlock.git;=
protocol=3Dhttp;branch=3Dmaster" rel=3D"noreferrer" target=3D"_blank">pagur=
e.io/sanlock.git;protocol=3Dhttp;branch=3Dmaster</a> \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-sanlock-Rep=
lace-cp-a-with-cp-R-no-dereference-preser.patch \<br>
&gt; diff --git a/meta-oe/recipes-extended/socketcan/<a href=3D"http://can-=
isotp_git.bb" rel=3D"noreferrer" target=3D"_blank">can-isotp_git.bb</a> b/m=
eta-oe/recipes-extended/socketcan/<a href=3D"http://can-isotp_git.bb" rel=
=3D"noreferrer" target=3D"_blank">can-isotp_git.bb</a><br>
&gt; index 993efab395..a60b55e7e7 100644<br>
&gt; --- a/meta-oe/recipes-extended/socketcan/<a href=3D"http://can-isotp_g=
it.bb" rel=3D"noreferrer" target=3D"_blank">can-isotp_git.bb</a><br>
&gt; +++ b/meta-oe/recipes-extended/socketcan/<a href=3D"http://can-isotp_g=
it.bb" rel=3D"noreferrer" target=3D"_blank">can-isotp_git.bb</a><br>
&gt; @@ -1,7 +1,7 @@<br>
&gt;=C2=A0 LICENSE =3D &quot;GPL-2.0-only&quot;<br>
&gt;=C2=A0 LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D72d977d697c3c058=
30fdff00a7448931&quot;<br>
&gt;=C2=A0 SRCREV =3D &quot;beb4650660179963a8ed5b5cbf2085cc1b34f608&quot;<=
br>
&gt; -PV =3D &quot;1.0+git${SRCPV}&quot;<br>
&gt; +PV =3D &quot;1.0+git&quot;<br>
&gt;<br>
&gt;=C2=A0 SRC_URI =3D &quot;git://<a href=3D"http://github.com/hartkopp/ca=
n-isotp.git;protocol=3Dhttps;branch=3Dmaster" rel=3D"noreferrer" target=3D"=
_blank">github.com/hartkopp/can-isotp.git;protocol=3Dhttps;branch=3Dmaster<=
/a>&quot;<br>
&gt;<br>
&gt; diff --git a/meta-oe/recipes-extended/tipcutils/<a href=3D"http://tipc=
utils_git.bb" rel=3D"noreferrer" target=3D"_blank">tipcutils_git.bb</a> b/m=
eta-oe/recipes-extended/tipcutils/<a href=3D"http://tipcutils_git.bb" rel=
=3D"noreferrer" target=3D"_blank">tipcutils_git.bb</a><br>
&gt; index fc64ec0fcb..596aa260e7 100644<br>
&gt; --- a/meta-oe/recipes-extended/tipcutils/<a href=3D"http://tipcutils_g=
it.bb" rel=3D"noreferrer" target=3D"_blank">tipcutils_git.bb</a><br>
&gt; +++ b/meta-oe/recipes-extended/tipcutils/<a href=3D"http://tipcutils_g=
it.bb" rel=3D"noreferrer" target=3D"_blank">tipcutils_git.bb</a><br>
&gt; @@ -9,7 +9,7 @@ SRC_URI =3D &quot;git://<a href=3D"http://git.code.sf.=
net/p/tipc/tipcutils;branch=3Dmaster" rel=3D"noreferrer" target=3D"_blank">=
git.code.sf.net/p/tipc/tipcutils;branch=3Dmaster</a> \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-test-ptts-S=
et-recv-buffer-size-too-max-to-receive-as.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt;=C2=A0 SRCREV =3D &quot;7ab2211b87414ba240b0b2e4af219c1057c9cf9a&quot;<=
br>
&gt; -PV =3D &quot;2.2.0+git${SRCPV}&quot;<br>
&gt; +PV =3D &quot;2.2.0+git&quot;<br>
&gt;<br>
&gt;=C2=A0 inherit autotools pkgconfig<br>
&gt;<br>
&gt; diff --git a/meta-oe/recipes-extended/triggerhappy/<a href=3D"http://t=
riggerhappy_git.bb" rel=3D"noreferrer" target=3D"_blank">triggerhappy_git.b=
b</a> b/meta-oe/recipes-extended/triggerhappy/<a href=3D"http://triggerhapp=
y_git.bb" rel=3D"noreferrer" target=3D"_blank">triggerhappy_git.bb</a><br>
&gt; index 3a3dd192be..0b14f9557a 100644<br>
&gt; --- a/meta-oe/recipes-extended/triggerhappy/<a href=3D"http://triggerh=
appy_git.bb" rel=3D"noreferrer" target=3D"_blank">triggerhappy_git.bb</a><b=
r>
&gt; +++ b/meta-oe/recipes-extended/triggerhappy/<a href=3D"http://triggerh=
appy_git.bb" rel=3D"noreferrer" target=3D"_blank">triggerhappy_git.bb</a><b=
r>
&gt; @@ -6,7 +6,7 @@ LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Dd32239=
bcb673463ab874e80d47fae504&quot;<br>
&gt;<br>
&gt;=C2=A0 # matches debian/0.5.0-1 tag<br>
&gt;=C2=A0 SRCREV =3D &quot;44a173195986d0d853316cb02a58785ded66c12b&quot;<=
br>
&gt; -PV =3D &quot;0.5.0+git${SRCPV}&quot;<br>
&gt; +PV =3D &quot;0.5.0+git&quot;<br>
&gt;=C2=A0 SRC_URI =3D &quot;git://<a href=3D"http://github.com/wertarbyte/=
$%7BBPN%7D.git;branch=3Ddebian;protocol=3Dhttps" rel=3D"noreferrer" target=
=3D"_blank">github.com/wertarbyte/${BPN}.git;branch=3Ddebian;protocol=3Dhtt=
ps</a>&quot;<br>
&gt;<br>
&gt;=C2=A0 S =3D &quot;${WORKDIR}/git&quot;<br>
&gt; diff --git a/meta-oe/recipes-extended/upm/<a href=3D"http://upm_git.bb=
" rel=3D"noreferrer" target=3D"_blank">upm_git.bb</a> b/meta-oe/recipes-ext=
ended/upm/<a href=3D"http://upm_git.bb" rel=3D"noreferrer" target=3D"_blank=
">upm_git.bb</a><br>
&gt; index a86f4a80d8..8468ff775d 100644<br>
&gt; --- a/meta-oe/recipes-extended/upm/<a href=3D"http://upm_git.bb" rel=
=3D"noreferrer" target=3D"_blank">upm_git.bb</a><br>
&gt; +++ b/meta-oe/recipes-extended/upm/<a href=3D"http://upm_git.bb" rel=
=3D"noreferrer" target=3D"_blank">upm_git.bb</a><br>
&gt; @@ -8,7 +8,7 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D66493d=
54e65bfc12c7983ff2e884f37f&quot;<br>
&gt;=C2=A0 DEPENDS =3D &quot;libjpeg-turbo mraa python3-setuptools-native&q=
uot;<br>
&gt;<br>
&gt;=C2=A0 SRCREV =3D &quot;5cf20df96c6b35c19d5b871ba4e319e96b4df72d&quot;<=
br>
&gt; -PV =3D &quot;2.0.0+git${SRCPV}&quot;<br>
&gt; +PV =3D &quot;2.0.0+git&quot;<br>
&gt;<br>
&gt;=C2=A0 SRC_URI =3D &quot;git://<a href=3D"http://github.com/eclipse/$%7=
BBPN%7D.git;protocol=3Dhttps;branch=3Dmaster" rel=3D"noreferrer" target=3D"=
_blank">github.com/eclipse/${BPN}.git;protocol=3Dhttps;branch=3Dmaster</a> =
\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-CMakeLists.=
txt-Use-SWIG_SUPPORT_FILES-to-find-the-li.patch \<br>
&gt; diff --git a/meta-oe/recipes-extended/zsync/<a href=3D"http://zsync-cu=
rl_git.bb" rel=3D"noreferrer" target=3D"_blank">zsync-curl_git.bb</a> b/met=
a-oe/recipes-extended/zsync/<a href=3D"http://zsync-curl_git.bb" rel=3D"nor=
eferrer" target=3D"_blank">zsync-curl_git.bb</a><br>
&gt; index 84593387d3..1bc4010f8a 100644<br>
&gt; --- a/meta-oe/recipes-extended/zsync/<a href=3D"http://zsync-curl_git.=
bb" rel=3D"noreferrer" target=3D"_blank">zsync-curl_git.bb</a><br>
&gt; +++ b/meta-oe/recipes-extended/zsync/<a href=3D"http://zsync-curl_git.=
bb" rel=3D"noreferrer" target=3D"_blank">zsync-curl_git.bb</a><br>
&gt; @@ -10,7 +10,7 @@ SRC_URI =3D &quot;git://<a href=3D"http://github.com=
/probonopd/zsync-curl;protocol=3Dhttps;branch=3Dmaster" rel=3D"noreferrer" =
target=3D"_blank">github.com/probonopd/zsync-curl;protocol=3Dhttps;branch=
=3Dmaster</a> \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://make.patch&quot;=
<br>
&gt;=C2=A0 SRCREV =3D &quot;00141c2806ccc4ddf2ff6263ee1612d19c0b713f&quot;<=
br>
&gt;<br>
&gt; -PV =3D &quot;0.6.2+git${SRCPV}&quot;<br>
&gt; +PV =3D &quot;0.6.2+git&quot;<br>
&gt;<br>
&gt;=C2=A0 inherit autotools<br>
&gt;<br>
&gt; diff --git a/meta-oe/recipes-graphics/aml/<a href=3D"http://aml_git.bb=
" rel=3D"noreferrer" target=3D"_blank">aml_git.bb</a> b/meta-oe/recipes-gra=
phics/aml/<a href=3D"http://aml_git.bb" rel=3D"noreferrer" target=3D"_blank=
">aml_git.bb</a><br>
&gt; index eed62adae0..2633e0d215 100644<br>
&gt; --- a/meta-oe/recipes-graphics/aml/<a href=3D"http://aml_git.bb" rel=
=3D"noreferrer" target=3D"_blank">aml_git.bb</a><br>
&gt; +++ b/meta-oe/recipes-graphics/aml/<a href=3D"http://aml_git.bb" rel=
=3D"noreferrer" target=3D"_blank">aml_git.bb</a><br>
&gt; @@ -8,7 +8,7 @@ SRC_URI =3D &quot;git://<a href=3D"http://github.com/a=
ny1/aml;branch=3Dmaster;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_bla=
nk">github.com/any1/aml;branch=3Dmaster;protocol=3Dhttps</a>&quot;<br>
&gt;<br>
&gt;=C2=A0 SRCREV =3D &quot;b83f3576ce4187d9285f06e9066ef43a691464d4&quot;<=
br>
&gt;<br>
&gt; -PV =3D &quot;0.3.0+git${SRCPV}&quot;<br>
&gt; +PV =3D &quot;0.3.0+git&quot;<br>
&gt;<br>
&gt;=C2=A0 S =3D &quot;${WORKDIR}/git&quot;<br>
&gt;<br>
&gt; diff --git a/meta-oe/recipes-graphics/fbida/<a href=3D"http://fbida_gi=
t.bb" rel=3D"noreferrer" target=3D"_blank">fbida_git.bb</a> b/meta-oe/recip=
es-graphics/fbida/<a href=3D"http://fbida_git.bb" rel=3D"noreferrer" target=
=3D"_blank">fbida_git.bb</a><br>
&gt; index 65c9041a3b..247a1fcbb2 100644<br>
&gt; --- a/meta-oe/recipes-graphics/fbida/<a href=3D"http://fbida_git.bb" r=
el=3D"noreferrer" target=3D"_blank">fbida_git.bb</a><br>
&gt; +++ b/meta-oe/recipes-graphics/fbida/<a href=3D"http://fbida_git.bb" r=
el=3D"noreferrer" target=3D"_blank">fbida_git.bb</a><br>
&gt; @@ -9,7 +9,7 @@ LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3De8feb7=
8a32950a909621bbb51f634b39&quot;<br>
&gt;<br>
&gt;=C2=A0 DEPENDS =3D &quot;virtual/libiconv jpeg fontconfig freetype libe=
xif libdrm pixman udev libinput cairo&quot;<br>
&gt;<br>
&gt; -PV =3D &quot;2.14+git${SRCPV}&quot;<br>
&gt; +PV =3D &quot;2.14+git&quot;<br>
&gt;=C2=A0 SRC_URI =3D &quot;git://<a href=3D"http://github.com/kraxel/fbid=
a;protocol=3Dhttps;branch=3Dmaster" rel=3D"noreferrer" target=3D"_blank">gi=
thub.com/kraxel/fbida;protocol=3Dhttps;branch=3Dmaster</a> \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://fix-preprocessor=
.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://support-jpeg-tur=
bo.patch \<br>
&gt; diff --git a/meta-oe/recipes-graphics/glm/<a href=3D"http://glm_0.9.9.=
8.bb" rel=3D"noreferrer" target=3D"_blank">glm_0.9.9.8.bb</a> b/meta-oe/rec=
ipes-graphics/glm/<a href=3D"http://glm_0.9.9.8.bb" rel=3D"noreferrer" targ=
et=3D"_blank">glm_0.9.9.8.bb</a><br>
&gt; index 3797314b47..dd520b245e 100644<br>
&gt; --- a/meta-oe/recipes-graphics/glm/<a href=3D"http://glm_0.9.9.8.bb" r=
el=3D"noreferrer" target=3D"_blank">glm_0.9.9.8.bb</a><br>
&gt; +++ b/meta-oe/recipes-graphics/glm/<a href=3D"http://glm_0.9.9.8.bb" r=
el=3D"noreferrer" target=3D"_blank">glm_0.9.9.8.bb</a><br>
&gt; @@ -18,7 +18,7 @@ SRC_URI =3D &quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 file://glmTargets.cmake \<br>
&gt;=C2=A0 &quot;<br>
&gt;=C2=A0 SRCREV =3D &quot;efec5db081e3aad807d0731e172ac597f6a39447&quot;<=
br>
&gt; -PV .=3D &quot;+0.9.9.9+git${SRCPV}&quot;<br>
&gt; +PV .=3D &quot;+0.9.9.9+git&quot;<br>
&gt;<br>
&gt;=C2=A0 S =3D &quot;${WORKDIR}/git&quot;<br>
&gt;<br>
&gt; diff --git a/meta-oe/recipes-graphics/openbox/<a href=3D"http://obconf=
_git.bb" rel=3D"noreferrer" target=3D"_blank">obconf_git.bb</a> b/meta-oe/r=
ecipes-graphics/openbox/<a href=3D"http://obconf_git.bb" rel=3D"noreferrer"=
 target=3D"_blank">obconf_git.bb</a><br>
&gt; index efffd962d4..1210af70ea 100644<br>
&gt; --- a/meta-oe/recipes-graphics/openbox/<a href=3D"http://obconf_git.bb=
" rel=3D"noreferrer" target=3D"_blank">obconf_git.bb</a><br>
&gt; +++ b/meta-oe/recipes-graphics/openbox/<a href=3D"http://obconf_git.bb=
" rel=3D"noreferrer" target=3D"_blank">obconf_git.bb</a><br>
&gt; @@ -8,7 +8,7 @@ DEPENDS =3D &quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 startup-notification \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 gtk+3 \<br>
&gt;=C2=A0 &quot;<br>
&gt; -PV =3D &quot;2.0.4+git${SRCPV}&quot;<br>
&gt; +PV =3D &quot;2.0.4+git&quot;<br>
&gt;<br>
&gt;=C2=A0 SRCREV =3D &quot;63ec47c5e295ad4f09d1df6d92afb7e10c3fec39&quot;<=
br>
&gt;=C2=A0 SRC_URI =3D &quot; \<br>
&gt; diff --git a/meta-oe/recipes-graphics/parallel-deqp-runner/<a href=3D"=
http://parallel-deqp-runner_git.bb" rel=3D"noreferrer" target=3D"_blank">pa=
rallel-deqp-runner_git.bb</a> b/meta-oe/recipes-graphics/parallel-deqp-runn=
er/<a href=3D"http://parallel-deqp-runner_git.bb" rel=3D"noreferrer" target=
=3D"_blank">parallel-deqp-runner_git.bb</a><br>
&gt; index eff6ad8f83..2ec89bc05b 100644<br>
&gt; --- a/meta-oe/recipes-graphics/parallel-deqp-runner/<a href=3D"http://=
parallel-deqp-runner_git.bb" rel=3D"noreferrer" target=3D"_blank">parallel-=
deqp-runner_git.bb</a><br>
&gt; +++ b/meta-oe/recipes-graphics/parallel-deqp-runner/<a href=3D"http://=
parallel-deqp-runner_git.bb" rel=3D"noreferrer" target=3D"_blank">parallel-=
deqp-runner_git.bb</a><br>
&gt; @@ -7,7 +7,7 @@ SRC_URI =3D &quot;git://<a href=3D"http://gitlab.freed=
esktop.org/mesa/parallel-deqp-runner.git;protocol=3Dh" rel=3D"noreferrer" t=
arget=3D"_blank">gitlab.freedesktop.org/mesa/parallel-deqp-runner.git;proto=
col=3Dh</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt;<br>
&gt;=C2=A0 # Modify these as desired<br>
&gt; -PV =3D &quot;2020.06.15+git${SRCPV}&quot;<br>
&gt; +PV =3D &quot;2020.06.15+git&quot;<br>
&gt;=C2=A0 SRCREV =3D &quot;e1642fb691d29b1462504b58916f7f514a963e80&quot;<=
br>
&gt;<br>
&gt;=C2=A0 S =3D &quot;${WORKDIR}/git&quot;<br>
&gt; diff --git a/meta-oe/recipes-graphics/ttf-fonts/<a href=3D"http://ttf-=
droid_git.bb" rel=3D"noreferrer" target=3D"_blank">ttf-droid_git.bb</a> b/m=
eta-oe/recipes-graphics/ttf-fonts/<a href=3D"http://ttf-droid_git.bb" rel=
=3D"noreferrer" target=3D"_blank">ttf-droid_git.bb</a><br>
&gt; index 7fa155a22f..119612cd73 100644<br>
&gt; --- a/meta-oe/recipes-graphics/ttf-fonts/<a href=3D"http://ttf-droid_g=
it.bb" rel=3D"noreferrer" target=3D"_blank">ttf-droid_git.bb</a><br>
&gt; +++ b/meta-oe/recipes-graphics/ttf-fonts/<a href=3D"http://ttf-droid_g=
it.bb" rel=3D"noreferrer" target=3D"_blank">ttf-droid_git.bb</a><br>
&gt; @@ -5,7 +5,7 @@ HOMEPAGE =3D &quot;<a href=3D"http://www.droidfonts.co=
m/" rel=3D"noreferrer" target=3D"_blank">http://www.droidfonts.com/</a>&quo=
t;<br>
&gt;=C2=A0 LICENSE =3D &quot;Apache-2.0&quot;<br>
&gt;=C2=A0 LIC_FILES_CHKSUM =3D &quot;file://README.txt;md5=3D83544262a86f1=
f1ec761e75897df92bc&quot;<br>
&gt;=C2=A0 SRCREV =3D &quot;21e6e2de1f0062f949fcc52d0b4559dfa3246e0e&quot;<=
br>
&gt; -PV =3D &quot;0.1+gitr${SRCPV}&quot;<br>
&gt; +PV =3D &quot;0.1+gitr&quot;<br>
&gt;=C2=A0 PR =3D &quot;r3&quot;<br>
&gt;<br>
&gt;=C2=A0 SRC_URI =3D &quot;git://<a href=3D"http://github.com/android/pla=
tform_frameworks_base.git;branch=3Dmaster;protocol=3Dhttps" rel=3D"noreferr=
er" target=3D"_blank">github.com/android/platform_frameworks_base.git;branc=
h=3Dmaster;protocol=3Dhttps</a>&quot;<br>
&gt; diff --git a/meta-oe/recipes-graphics/x11vnc/<a href=3D"http://x11vnc_=
0.9.16.bb" rel=3D"noreferrer" target=3D"_blank">x11vnc_0.9.16.bb</a> b/meta=
-oe/recipes-graphics/x11vnc/<a href=3D"http://x11vnc_0.9.16.bb" rel=3D"nore=
ferrer" target=3D"_blank">x11vnc_0.9.16.bb</a><br>
&gt; index 3633bbc26b..74f80e1844 100644<br>
&gt; --- a/meta-oe/recipes-graphics/x11vnc/<a href=3D"http://x11vnc_0.9.16.=
bb" rel=3D"noreferrer" target=3D"_blank">x11vnc_0.9.16.bb</a><br>
&gt; +++ b/meta-oe/recipes-graphics/x11vnc/<a href=3D"http://x11vnc_0.9.16.=
bb" rel=3D"noreferrer" target=3D"_blank">x11vnc_0.9.16.bb</a><br>
&gt; @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Db234ee=
4d69f5fce4486a80fdaf4a4263 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 file://src/x11vnc.h;endline=3D31;md5=3De871a2ad004776794b616822dcab6=
314&quot;<br>
&gt;<br>
&gt;=C2=A0 SRCREV =3D &quot;87cd0530f438372dda3c70bb491a6fd19f09acc2&quot;<=
br>
&gt; -PV .=3D &quot;+git${SRCPV}&quot;<br>
&gt; +PV .=3D &quot;+git&quot;<br>
&gt;<br>
&gt;=C2=A0 SRC_URI =3D &quot;git://<a href=3D"http://github.com/LibVNC/x11v=
nc;branch=3Dmaster;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_blank">g=
ithub.com/LibVNC/x11vnc;branch=3Dmaster;protocol=3Dhttps</a> \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://starting-fix.pat=
ch \<br>
&gt; diff --git a/meta-oe/recipes-multimedia/faad2/<a href=3D"http://faad2_=
2.11.1.bb" rel=3D"noreferrer" target=3D"_blank">faad2_2.11.1.bb</a> b/meta-=
oe/recipes-multimedia/faad2/<a href=3D"http://faad2_2.11.1.bb" rel=3D"noref=
errer" target=3D"_blank">faad2_2.11.1.bb</a><br>
&gt; index 76e8f72c4f..bec9b75ebd 100644<br>
&gt; --- a/meta-oe/recipes-multimedia/faad2/<a href=3D"http://faad2_2.11.1.=
bb" rel=3D"noreferrer" target=3D"_blank">faad2_2.11.1.bb</a><br>
&gt; +++ b/meta-oe/recipes-multimedia/faad2/<a href=3D"http://faad2_2.11.1.=
bb" rel=3D"noreferrer" target=3D"_blank">faad2_2.11.1.bb</a><br>
&gt; @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D381c8c=
be277a7bc1ee2ae6083a04c958&quot;<br>
&gt;<br>
&gt;=C2=A0 LICENSE_FLAGS =3D &quot;commercial&quot;<br>
&gt;<br>
&gt; -PV .=3D &quot;+git${SRCPV}&quot;<br>
&gt; +PV .=3D &quot;+git&quot;<br>
&gt;<br>
&gt;=C2=A0 SRC_URI =3D &quot;git://<a href=3D"http://github.com/knik0/faad2=
.git;branch=3Dmaster;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_blank"=
>github.com/knik0/faad2.git;branch=3Dmaster;protocol=3Dhttps</a>&quot;<br>
&gt;=C2=A0 SRCREV =3D &quot;216f00e8ddba6f2c64caf481a04f1ddd78b93e78&quot;<=
br>
&gt; diff --git a/meta-oe/recipes-multimedia/v4l2apps/<a href=3D"http://v4l=
-utils_1.26.1.bb" rel=3D"noreferrer" target=3D"_blank">v4l-utils_1.26.1.bb<=
/a> b/meta-oe/recipes-multimedia/v4l2apps/<a href=3D"http://v4l-utils_1.26.=
1.bb" rel=3D"noreferrer" target=3D"_blank">v4l-utils_1.26.1.bb</a><br>
&gt; index 594b51b439..52759ef18e 100644<br>
&gt; --- a/meta-oe/recipes-multimedia/v4l2apps/<a href=3D"http://v4l-utils_=
1.26.1.bb" rel=3D"noreferrer" target=3D"_blank">v4l-utils_1.26.1.bb</a><br>
&gt; +++ b/meta-oe/recipes-multimedia/v4l2apps/<a href=3D"http://v4l-utils_=
1.26.1.bb" rel=3D"noreferrer" target=3D"_blank">v4l-utils_1.26.1.bb</a><br>
&gt; @@ -32,7 +32,7 @@ SRC_URI =3D &quot;\<br>
&gt;<br>
&gt;=C2=A0 SRCREV =3D &quot;4aee01a027923cab1e40969f56f8ba58d3e6c0d1&quot;<=
br>
&gt;<br>
&gt; -PV .=3D &quot;+git${SRCPV}&quot;<br>
&gt; +PV .=3D &quot;+git&quot;<br>
&gt;<br>
&gt;=C2=A0 S =3D &quot;${WORKDIR}/git&quot;<br>
&gt;<br>
&gt; diff --git a/meta-oe/recipes-support/ace-cloud-editor/<a href=3D"http:=
//ace-cloud-editor_git.bb" rel=3D"noreferrer" target=3D"_blank">ace-cloud-e=
ditor_git.bb</a> b/meta-oe/recipes-support/ace-cloud-editor/<a href=3D"http=
://ace-cloud-editor_git.bb" rel=3D"noreferrer" target=3D"_blank">ace-cloud-=
editor_git.bb</a><br>
&gt; index 746d4182a9..6d64ab71bf 100644<br>
&gt; --- a/meta-oe/recipes-support/ace-cloud-editor/<a href=3D"http://ace-c=
loud-editor_git.bb" rel=3D"noreferrer" target=3D"_blank">ace-cloud-editor_g=
it.bb</a><br>
&gt; +++ b/meta-oe/recipes-support/ace-cloud-editor/<a href=3D"http://ace-c=
loud-editor_git.bb" rel=3D"noreferrer" target=3D"_blank">ace-cloud-editor_g=
it.bb</a><br>
&gt; @@ -6,7 +6,7 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D794d11=
c5219c59c9efa2487c2b4066b2&quot;<br>
&gt;<br>
&gt;=C2=A0 SRC_URI =3D &quot;git://<a href=3D"http://github.com/ajaxorg/ace=
-builds.git;protocol=3Dhttps;branch=3Dmaster" rel=3D"noreferrer" target=3D"=
_blank">github.com/ajaxorg/ace-builds.git;protocol=3Dhttps;branch=3Dmaster<=
/a>&quot;<br>
&gt;<br>
&gt; -PV =3D &quot;02.07.17+git${SRCPV}&quot;<br>
&gt; +PV =3D &quot;02.07.17+git&quot;<br>
&gt;=C2=A0 SRCREV =3D &quot;812e2c56aed246931a667f16c28b096e34597016&quot;<=
br>
&gt;<br>
&gt;=C2=A0 FILES:${PN} =3D &quot;${datadir}/ace-builds&quot;<br>
&gt; diff --git a/meta-oe/recipes-support/cli11/<a href=3D"http://cli11_2.3=
.2.bb" rel=3D"noreferrer" target=3D"_blank">cli11_2.3.2.bb</a> b/meta-oe/re=
cipes-support/cli11/<a href=3D"http://cli11_2.3.2.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">cli11_2.3.2.bb</a><br>
&gt; index 7c6b2547cb..ef3c951bbf 100644<br>
&gt; --- a/meta-oe/recipes-support/cli11/<a href=3D"http://cli11_2.3.2.bb" =
rel=3D"noreferrer" target=3D"_blank">cli11_2.3.2.bb</a><br>
&gt; +++ b/meta-oe/recipes-support/cli11/<a href=3D"http://cli11_2.3.2.bb" =
rel=3D"noreferrer" target=3D"_blank">cli11_2.3.2.bb</a><br>
&gt; @@ -4,7 +4,7 @@ HOMEPAGE =3D &quot;<a href=3D"https://github.com/CLIUt=
ils/CLI11" rel=3D"noreferrer" target=3D"_blank">https://github.com/CLIUtils=
/CLI11</a>&quot;<br>
&gt;=C2=A0 LICENSE =3D &quot;BSD-3-Clause&quot;<br>
&gt;=C2=A0 LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3Dafb20fe5f67e2107=
4b10b864d9563c11&quot;<br>
&gt;=C2=A0 SRCREV =3D &quot;291c58789c031208f08f4f261a858b5b7083e8e2&quot;<=
br>
&gt; -PV .=3D &quot;+git${SRCPV}&quot;<br>
&gt; +PV .=3D &quot;+git&quot;<br>
&gt;<br>
&gt;=C2=A0 SRC_URI +=3D &quot;gitsm://<a href=3D"http://github.com/CLIUtils=
/CLI11;branch=3Dmain;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_blank"=
>github.com/CLIUtils/CLI11;branch=3Dmain;protocol=3Dhttps</a> \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"https://git=
hub.com/philsquared/Catch/releases/download/v2.13.7/catch.hpp" rel=3D"noref=
errer" target=3D"_blank">https://github.com/philsquared/Catch/releases/down=
load/v2.13.7/catch.hpp</a> \<br>
&gt; diff --git a/meta-oe/recipes-support/edid-decode/<a href=3D"http://edi=
d-decode_git.bb" rel=3D"noreferrer" target=3D"_blank">edid-decode_git.bb</a=
> b/meta-oe/recipes-support/edid-decode/<a href=3D"http://edid-decode_git.b=
b" rel=3D"noreferrer" target=3D"_blank">edid-decode_git.bb</a><br>
&gt; index 48b52eefca..bb8c9de71d 100644<br>
&gt; --- a/meta-oe/recipes-support/edid-decode/<a href=3D"http://edid-decod=
e_git.bb" rel=3D"noreferrer" target=3D"_blank">edid-decode_git.bb</a><br>
&gt; +++ b/meta-oe/recipes-support/edid-decode/<a href=3D"http://edid-decod=
e_git.bb" rel=3D"noreferrer" target=3D"_blank">edid-decode_git.bb</a><br>
&gt; @@ -8,7 +8,7 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D2ef696=
d66c156139232201f223c22592&quot;<br>
&gt;<br>
&gt;=C2=A0 SRC_URI=3D &quot;git://<a href=3D"http://git.linuxtv.org/edid-de=
code.git;protocol=3Dhttps;branch=3Dmaster" rel=3D"noreferrer" target=3D"_bl=
ank">git.linuxtv.org/edid-decode.git;protocol=3Dhttps;branch=3Dmaster</a>&q=
uot;<br>
&gt;=C2=A0 SRCREV =3D &quot;5920bf2a756b2f748c49ff6a08b9f421026473c5&quot;<=
br>
&gt; -PV =3D &quot;0.0+git${SRCPV}&quot;<br>
&gt; +PV =3D &quot;0.0+git&quot;<br>
&gt;=C2=A0 S =3D &quot;${WORKDIR}/git&quot;<br>
&gt;<br>
&gt;=C2=A0 do_install() {<br>
&gt; diff --git a/meta-oe/recipes-support/evemu-tools/<a href=3D"http://eve=
mu-tools_git.bb" rel=3D"noreferrer" target=3D"_blank">evemu-tools_git.bb</a=
> b/meta-oe/recipes-support/evemu-tools/<a href=3D"http://evemu-tools_git.b=
b" rel=3D"noreferrer" target=3D"_blank">evemu-tools_git.bb</a><br>
&gt; index 4501b082de..b8cd1f620a 100644<br>
&gt; --- a/meta-oe/recipes-support/evemu-tools/<a href=3D"http://evemu-tool=
s_git.bb" rel=3D"noreferrer" target=3D"_blank">evemu-tools_git.bb</a><br>
&gt; +++ b/meta-oe/recipes-support/evemu-tools/<a href=3D"http://evemu-tool=
s_git.bb" rel=3D"noreferrer" target=3D"_blank">evemu-tools_git.bb</a><br>
&gt; @@ -11,7 +11,7 @@ SRCREV =3D &quot;86a5627dbeac8d9d9bc34326a758d6a477e=
876e4&quot;<br>
&gt;=C2=A0 SRC_URI =3D &quot;git://<a href=3D"http://git@gitlab.freedesktop=
.org/libevdev/evemu.git;protocol=3Dhttps;branch=3Dmaster" rel=3D"noreferrer=
" target=3D"_blank">git@gitlab.freedesktop.org/libevdev/evemu.git;protocol=
=3Dhttps;branch=3Dmaster</a>&quot;<br>
&gt;<br>
&gt;=C2=A0 S =3D &quot;${WORKDIR}/git&quot;<br>
&gt; -PV =3D &quot;gitr${SRCPV}&quot;<br>
&gt; +PV =3D &quot;gitr&quot;<br>
&gt;<br>
&gt;=C2=A0 inherit autotools pkgconfig<br>
&gt;<br>
&gt; diff --git a/meta-oe/recipes-support/function2/<a href=3D"http://funct=
ion2_4.2.4.bb" rel=3D"noreferrer" target=3D"_blank">function2_4.2.4.bb</a> =
b/meta-oe/recipes-support/function2/<a href=3D"http://function2_4.2.4.bb" r=
el=3D"noreferrer" target=3D"_blank">function2_4.2.4.bb</a><br>
&gt; index 2748b84f7c..98d05f6e25 100644<br>
&gt; --- a/meta-oe/recipes-support/function2/<a href=3D"http://function2_4.=
2.4.bb" rel=3D"noreferrer" target=3D"_blank">function2_4.2.4.bb</a><br>
&gt; +++ b/meta-oe/recipes-support/function2/<a href=3D"http://function2_4.=
2.4.bb" rel=3D"noreferrer" target=3D"_blank">function2_4.2.4.bb</a><br>
&gt; @@ -4,7 +4,7 @@ HOMEPAGE =3D &quot;<a href=3D"https://naios.github.io/=
function2" rel=3D"noreferrer" target=3D"_blank">https://naios.github.io/fun=
ction2</a>&quot;<br>
&gt;=C2=A0 LICENSE =3D &quot;BSL-1.0&quot;<br>
&gt;=C2=A0 LIC_FILES_CHKSUM =3D &quot;file://LICENSE.txt;md5=3De4224ccaecb1=
4d942c71d31bef20d78c&quot;<br>
&gt;=C2=A0 SRCREV =3D &quot;a354bd093d2b6e50c9325dbce84d20b4e77aabc6&quot;<=
br>
&gt; -PV .=3D &quot;+git${SRCPV}&quot;<br>
&gt; +PV .=3D &quot;+git&quot;<br>
&gt;<br>
&gt;=C2=A0 SRC_URI +=3D &quot;gitsm://<a href=3D"http://github.com/Naios/fu=
nction2;branch=3Dmaster;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_bla=
nk">github.com/Naios/function2;branch=3Dmaster;protocol=3Dhttps</a>&quot;<b=
r>
&gt;<br>
&gt; diff --git a/meta-oe/recipes-support/hunspell/<a href=3D"http://hunspe=
ll-dictionaries.bb" rel=3D"noreferrer" target=3D"_blank">hunspell-dictionar=
ies.bb</a> b/meta-oe/recipes-support/hunspell/<a href=3D"http://hunspell-di=
ctionaries.bb" rel=3D"noreferrer" target=3D"_blank">hunspell-dictionaries.b=
b</a><br>
&gt; index 047acf28db..0ec426afb9 100644<br>
&gt; --- a/meta-oe/recipes-support/hunspell/<a href=3D"http://hunspell-dict=
ionaries.bb" rel=3D"noreferrer" target=3D"_blank">hunspell-dictionaries.bb<=
/a><br>
&gt; +++ b/meta-oe/recipes-support/hunspell/<a href=3D"http://hunspell-dict=
ionaries.bb" rel=3D"noreferrer" target=3D"_blank">hunspell-dictionaries.bb<=
/a><br>
&gt; @@ -133,7 +133,7 @@ LIC_FILES_CHKSUM =3D &quot; \<br>
&gt;<br>
&gt;=C2=A0 RDEPENDS:${PN} =3D &quot;hunspell&quot;<br>
&gt;<br>
&gt; -PV =3D &quot;0.0.0+git${SRCPV}&quot;<br>
&gt; +PV =3D &quot;0.0.0+git&quot;<br>
&gt;=C2=A0 SRCREV =3D &quot;820a65e539e34a3a8c2a855d2450b84745c624ee&quot;<=
br>
&gt;=C2=A0 SRC_URI =3D &quot;git://<a href=3D"http://github.com/wooorm/dict=
ionaries.git;branch=3Dmaster;protocol=3Dhttps" rel=3D"noreferrer" target=3D=
"_blank">github.com/wooorm/dictionaries.git;branch=3Dmaster;protocol=3Dhttp=
s</a>&quot;<br>
&gt;<br>
&gt; diff --git a/meta-oe/recipes-support/idevicerestore/<a href=3D"http://=
idevicerestore_git.bb" rel=3D"noreferrer" target=3D"_blank">idevicerestore_=
git.bb</a> b/meta-oe/recipes-support/idevicerestore/<a href=3D"http://idevi=
cerestore_git.bb" rel=3D"noreferrer" target=3D"_blank">idevicerestore_git.b=
b</a><br>
&gt; index 3dbd8db63f..8218b08084 100644<br>
&gt; --- a/meta-oe/recipes-support/idevicerestore/<a href=3D"http://idevice=
restore_git.bb" rel=3D"noreferrer" target=3D"_blank">idevicerestore_git.bb<=
/a><br>
&gt; +++ b/meta-oe/recipes-support/idevicerestore/<a href=3D"http://idevice=
restore_git.bb" rel=3D"noreferrer" target=3D"_blank">idevicerestore_git.bb<=
/a><br>
&gt; @@ -8,7 +8,7 @@ HOMEPAGE =3D &quot;<a href=3D"http://www.libimobiledev=
ice.org/" rel=3D"noreferrer" target=3D"_blank">http://www.libimobiledevice.=
org/</a>&quot;<br>
&gt;<br>
&gt;=C2=A0 DEPENDS =3D &quot;libirecovery libimobiledevice libzip curl libi=
mobiledevice-glue openssl&quot;<br>
&gt;<br>
&gt; -PV =3D &quot;1.0.1+git${SRCPV}&quot;<br>
&gt; +PV =3D &quot;1.0.1+git&quot;<br>
&gt;<br>
&gt;=C2=A0 SRCREV =3D &quot;ecae6c6e8ca6b6bad080a1c73f10ffd0e67d75a7&quot;<=
br>
&gt;=C2=A0 SRC_URI =3D &quot;git://<a href=3D"http://github.com/libimobiled=
evice/idevicerestore;protocol=3Dhttps;branch=3Dmaster" rel=3D"noreferrer" t=
arget=3D"_blank">github.com/libimobiledevice/idevicerestore;protocol=3Dhttp=
s;branch=3Dmaster</a>&quot;<br>
&gt; diff --git a/meta-oe/recipes-support/iksemel/<a href=3D"http://iksemel=
_1.5.bb" rel=3D"noreferrer" target=3D"_blank">iksemel_1.5.bb</a> b/meta-oe/=
recipes-support/iksemel/<a href=3D"http://iksemel_1.5.bb" rel=3D"noreferrer=
" target=3D"_blank">iksemel_1.5.bb</a><br>
&gt; index e01c0897bb..017e7d26a6 100644<br>
&gt; --- a/meta-oe/recipes-support/iksemel/<a href=3D"http://iksemel_1.5.bb=
" rel=3D"noreferrer" target=3D"_blank">iksemel_1.5.bb</a><br>
&gt; +++ b/meta-oe/recipes-support/iksemel/<a href=3D"http://iksemel_1.5.bb=
" rel=3D"noreferrer" target=3D"_blank">iksemel_1.5.bb</a><br>
&gt; @@ -5,7 +5,7 @@ LICENSE =3D &quot;LGPL-2.1-only&quot;<br>
&gt;=C2=A0 LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Dd8045f3b8f929c1c=
b29a1e3fd737b499&quot;<br>
&gt;<br>
&gt;=C2=A0 SRCREV =3D &quot;978b733462e41efd5db72bc9974cb3b0d1d5f6fa&quot;<=
br>
&gt; -PV =3D &quot;1.5+git${SRCPV}&quot;<br>
&gt; +PV =3D &quot;1.5+git&quot;<br>
&gt;<br>
&gt;=C2=A0 SRC_URI =3D &quot;git://<a href=3D"http://github.com/meduketto/i=
ksemel.git;protocol=3Dhttps;branch=3Dmaster" rel=3D"noreferrer" target=3D"_=
blank">github.com/meduketto/iksemel.git;protocol=3Dhttps;branch=3Dmaster</a=
> \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://fix-configure-op=
tion-parsing.patch \<br>
&gt; diff --git a/meta-oe/recipes-support/iniparser/<a href=3D"http://inipa=
rser_4.1.bb" rel=3D"noreferrer" target=3D"_blank">iniparser_4.1.bb</a> b/me=
ta-oe/recipes-support/iniparser/<a href=3D"http://iniparser_4.1.bb" rel=3D"=
noreferrer" target=3D"_blank">iniparser_4.1.bb</a><br>
&gt; index 5e42cdcb06..c80668d279 100644<br>
&gt; --- a/meta-oe/recipes-support/iniparser/<a href=3D"http://iniparser_4.=
1.bb" rel=3D"noreferrer" target=3D"_blank">iniparser_4.1.bb</a><br>
&gt; +++ b/meta-oe/recipes-support/iniparser/<a href=3D"http://iniparser_4.=
1.bb" rel=3D"noreferrer" target=3D"_blank">iniparser_4.1.bb</a><br>
&gt; @@ -6,7 +6,7 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3De02baf=
71c76e0650e667d7da133379ac&quot;<br>
&gt;<br>
&gt;=C2=A0 DEPENDS =3D &quot;doxygen-native&quot;<br>
&gt;<br>
&gt; -PV .=3D &quot;+git${SRCPV}&quot;<br>
&gt; +PV .=3D &quot;+git&quot;<br>
&gt;<br>
&gt;=C2=A0 SRC_URI =3D &quot;git://<a href=3D"http://github.com/ndevilla/in=
iparser.git;protocol=3Dhttps;branch=3Dmaster" rel=3D"noreferrer" target=3D"=
_blank">github.com/ndevilla/iniparser.git;protocol=3Dhttps;branch=3Dmaster<=
/a> \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-iniparser.p=
c-Make-libpath-a-variable.patch \<br>
&gt; diff --git a/meta-oe/recipes-support/libb64/<a href=3D"http://libb64_2=
.0.0.1.bb" rel=3D"noreferrer" target=3D"_blank">libb64_2.0.0.1.bb</a> b/met=
a-oe/recipes-support/libb64/<a href=3D"http://libb64_2.0.0.1.bb" rel=3D"nor=
eferrer" target=3D"_blank">libb64_2.0.0.1.bb</a><br>
&gt; index 6a1e7b75e1..e0683b177b 100644<br>
&gt; --- a/meta-oe/recipes-support/libb64/<a href=3D"http://libb64_2.0.0.1.=
bb" rel=3D"noreferrer" target=3D"_blank">libb64_2.0.0.1.bb</a><br>
&gt; +++ b/meta-oe/recipes-support/libb64/<a href=3D"http://libb64_2.0.0.1.=
bb" rel=3D"noreferrer" target=3D"_blank">libb64_2.0.0.1.bb</a><br>
&gt; @@ -6,7 +6,7 @@ HOMEPAGE =3D &quot;<a href=3D"https://github.com/libb6=
4" rel=3D"noreferrer" target=3D"_blank">https://github.com/libb64</a>&quot;=
<br>
&gt;=C2=A0 LICENSE =3D &quot;PD&quot;<br>
&gt;=C2=A0 LIC_FILES_CHKSUM =3D &quot;file://LICENSE.md;md5=3D81296a564fa06=
21472714aae7c763d96&quot;<br>
&gt;<br>
&gt; -PV .=3D &quot;+2.0.0.2+git${SRCPV}&quot;<br>
&gt; +PV .=3D &quot;+2.0.0.2+git&quot;<br>
&gt;=C2=A0 SRCREV =3D &quot;ce864b17ea0e24a91e77c7dd3eb2d1ac4175b3f0&quot;<=
br>
&gt;<br>
&gt;=C2=A0 SRC_URI =3D &quot;git://<a href=3D"http://github.com/libb64/libb=
64;protocol=3Dhttps;branch=3Dmaster" rel=3D"noreferrer" target=3D"_blank">g=
ithub.com/libb64/libb64;protocol=3Dhttps;branch=3Dmaster</a> \<br>
&gt; diff --git a/meta-oe/recipes-support/libcereal/<a href=3D"http://libce=
real_1.3.2.bb" rel=3D"noreferrer" target=3D"_blank">libcereal_1.3.2.bb</a> =
b/meta-oe/recipes-support/libcereal/<a href=3D"http://libcereal_1.3.2.bb" r=
el=3D"noreferrer" target=3D"_blank">libcereal_1.3.2.bb</a><br>
&gt; index c5f26ecb4e..e100265f7d 100644<br>
&gt; --- a/meta-oe/recipes-support/libcereal/<a href=3D"http://libcereal_1.=
3.2.bb" rel=3D"noreferrer" target=3D"_blank">libcereal_1.3.2.bb</a><br>
&gt; +++ b/meta-oe/recipes-support/libcereal/<a href=3D"http://libcereal_1.=
3.2.bb" rel=3D"noreferrer" target=3D"_blank">libcereal_1.3.2.bb</a><br>
&gt; @@ -16,7 +16,7 @@ DEPENDS =3D &quot; ${@bb.utils.contains(&#39;DISTRO_=
FEATURES&#39;, &#39;ptest&#39;, &#39;boost&#39;, &#39;&#39;, d)} &quot;<br>
&gt;<br>
&gt;=C2=A0 PROVIDES +=3D &quot;${PN}-dev&quot;<br>
&gt;<br>
&gt; -PV .=3D &quot;+git${SRCPV}&quot;<br>
&gt; +PV .=3D &quot;+git&quot;<br>
&gt;=C2=A0 SRCREV =3D &quot;ebef1e929807629befafbb2918ea1a08c7194554&quot;<=
br>
&gt;=C2=A0 SRC_URI =3D &quot;git://<a href=3D"http://github.com/USCiLab/cer=
eal.git;branch=3Dmaster;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_bla=
nk">github.com/USCiLab/cereal.git;branch=3Dmaster;protocol=3Dhttps</a> \<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-sandbox-Do-=
not-use-int8_t-in-std-uniform_int_distrib.patch \<br>
&gt; diff --git a/meta-oe/recipes-support/libcyusbserial/<a href=3D"http://=
libcyusbserial_git.bb" rel=3D"noreferrer" target=3D"_blank">libcyusbserial_=
git.bb</a> b/meta-oe/recipes-support/libcyusbserial/<a href=3D"http://libcy=
usbserial_git.bb" rel=3D"noreferrer" target=3D"_blank">libcyusbserial_git.b=
b</a><br>
&gt; index a69194996b..dd7f457b10 100644<br>
&gt; --- a/meta-oe/recipes-support/libcyusbserial/<a href=3D"http://libcyus=
bserial_git.bb" rel=3D"noreferrer" target=3D"_blank">libcyusbserial_git.bb<=
/a><br>
&gt; +++ b/meta-oe/recipes-support/libcyusbserial/<a href=3D"http://libcyus=
bserial_git.bb" rel=3D"noreferrer" target=3D"_blank">libcyusbserial_git.bb<=
/a><br>
&gt; @@ -5,7 +5,7 @@ LICENSE =3D &quot;LGPL-2.1-only&quot;<br>
&gt;=C2=A0 LIC_FILES_CHKSUM =3D &quot;file://COPYING.LESSER.txt;md5=3D4fbd6=
5380cdd255951079008b364516c&quot;<br>
&gt;=C2=A0 DEPENDS =3D &quot;libusb udev&quot;<br>
&gt;<br>
&gt; -PV =3D &quot;1.0.0+git${SRCPV}&quot;<br>
&gt; +PV =3D &quot;1.0.0+git&quot;<br>
&gt;<br>
&gt;=C2=A0 SRCREV =3D &quot;655e2d544183d094f0e2d119c7e0c6206a0ddb3f&quot;<=
br>
&gt;=C2=A0 SRC_URI =3D &quot;git://<a href=3D"http://github.com/cyrozap/$%7=
BBPN%7D.git;branch=3Dmaster;protocol=3Dhttps" rel=3D"noreferrer" target=3D"=
_blank">github.com/cyrozap/${BPN}.git;branch=3Dmaster;protocol=3Dhttps</a> =
\<br>
&gt; diff --git a/meta-oe/recipes-support/libfann/<a href=3D"http://libfann=
_git.bb" rel=3D"noreferrer" target=3D"_blank">libfann_git.bb</a> b/meta-oe/=
recipes-support/libfann/<a href=3D"http://libfann_git.bb" rel=3D"noreferrer=
" target=3D"_blank">libfann_git.bb</a><br>
&gt; index 2f52a0f3bd..40f91ac43d 100644<br>
&gt; --- a/meta-oe/recipes-support/libfann/<a href=3D"http://libfann_git.bb=
" rel=3D"noreferrer" target=3D"_blank">libfann_git.bb</a><br>
&gt; +++ b/meta-oe/recipes-support/libfann/<a href=3D"http://libfann_git.bb=
" rel=3D"noreferrer" target=3D"_blank">libfann_git.bb</a><br>
&gt; @@ -12,7 +12,7 @@ SRCREV ?=3D &quot;7ec1fc7e5bd734f1d3c89b095e630e83c8=
6b9be1&quot;<br>
&gt;=C2=A0 SRC_URI =3D &quot;git://<a href=3D"http://github.com/libfann/fan=
n.git;branch=3Dmaster;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_blank=
">github.com/libfann/fann.git;branch=3Dmaster;protocol=3Dhttps</a> \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
&gt;<br>
&gt; -PV =3D &quot;2.2.0+git${SRCPV}&quot;<br>
&gt; +PV =3D &quot;2.2.0+git&quot;<br>
&gt;<br>
&gt;=C2=A0 S =3D &quot;${WORKDIR}/git&quot;<br>
&gt;<br>
&gt; diff --git a/meta-oe/recipes-support/libusbgx/<a href=3D"http://libusb=
gx_git.bb" rel=3D"noreferrer" target=3D"_blank">libusbgx_git.bb</a> b/meta-=
oe/recipes-support/libusbgx/<a href=3D"http://libusbgx_git.bb" rel=3D"noref=
errer" target=3D"_blank">libusbgx_git.bb</a><br>
&gt; index 7998b0c155..f8ebcc7767 100644<br>
&gt; --- a/meta-oe/recipes-support/libusbgx/<a href=3D"http://libusbgx_git.=
bb" rel=3D"noreferrer" target=3D"_blank">libusbgx_git.bb</a><br>
&gt; +++ b/meta-oe/recipes-support/libusbgx/<a href=3D"http://libusbgx_git.=
bb" rel=3D"noreferrer" target=3D"_blank">libusbgx_git.bb</a><br>
&gt; @@ -5,7 +5,7 @@ LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Db234ee=
4d69f5fce4486a80fdaf4a4263 \<br>
&gt;<br>
&gt;=C2=A0 inherit autotools pkgconfig systemd update-rc.d update-alternati=
ves<br>
&gt;<br>
&gt; -PV =3D &quot;0.2.0+git${SRCPV}&quot;<br>
&gt; +PV =3D &quot;0.2.0+git&quot;<br>
&gt;=C2=A0 SRCREV =3D &quot;721e3a1cbd7e2b6361bb439d3959e7403e4f0092&quot;<=
br>
&gt;=C2=A0 SRCBRANCH =3D &quot;master&quot;<br>
&gt;=C2=A0 SRC_URI =3D &quot; \<br>
&gt; diff --git a/meta-oe/recipes-support/lio-utils/<a href=3D"http://lio-u=
tils_4.1.bb" rel=3D"noreferrer" target=3D"_blank">lio-utils_4.1.bb</a> b/me=
ta-oe/recipes-support/lio-utils/<a href=3D"http://lio-utils_4.1.bb" rel=3D"=
noreferrer" target=3D"_blank">lio-utils_4.1.bb</a><br>
&gt; index 48be8dfa96..844e5acf90 100644<br>
&gt; --- a/meta-oe/recipes-support/lio-utils/<a href=3D"http://lio-utils_4.=
1.bb" rel=3D"noreferrer" target=3D"_blank">lio-utils_4.1.bb</a><br>
&gt; +++ b/meta-oe/recipes-support/lio-utils/<a href=3D"http://lio-utils_4.=
1.bb" rel=3D"noreferrer" target=3D"_blank">lio-utils_4.1.bb</a><br>
&gt; @@ -4,7 +4,7 @@ HOMEPAGE =3D &quot;<a href=3D"http://linux-iscsi.org/i=
ndex.php/Lio-utils" rel=3D"noreferrer" target=3D"_blank">http://linux-iscsi=
.org/index.php/Lio-utils</a>&quot;<br>
&gt;=C2=A0 LICENSE =3D &quot;GPL-2.0-only&quot;<br>
&gt;=C2=A0 LIC_FILES_CHKSUM =3D &quot;file://debian/copyright;md5=3Dc3ea231=
a32635cbb5debedf3e88aa3df&quot;<br>
&gt;<br>
&gt; -PV =3D &quot;4.1+git${SRCPV}&quot;<br>
&gt; +PV =3D &quot;4.1+git&quot;<br>
&gt;<br>
&gt;=C2=A0 SRC_URI =3D &quot;git://<a href=3D"http://github.com/Datera/lio-=
utils.git;branch=3Dmaster;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_b=
lank">github.com/Datera/lio-utils.git;branch=3Dmaster;protocol=3Dhttps</a> =
\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Makefiles-R=
espect-environment-variables-and-add-LDFL.patch \<br>
&gt; diff --git a/meta-oe/recipes-support/mcelog/<a href=3D"http://mce-test=
_git.bb" rel=3D"noreferrer" target=3D"_blank">mce-test_git.bb</a> b/meta-oe=
/recipes-support/mcelog/<a href=3D"http://mce-test_git.bb" rel=3D"noreferre=
r" target=3D"_blank">mce-test_git.bb</a><br>
&gt; index fd302db897..05e98e86ed 100644<br>
&gt; --- a/meta-oe/recipes-support/mcelog/<a href=3D"http://mce-test_git.bb=
" rel=3D"noreferrer" target=3D"_blank">mce-test_git.bb</a><br>
&gt; +++ b/meta-oe/recipes-support/mcelog/<a href=3D"http://mce-test_git.bb=
" rel=3D"noreferrer" target=3D"_blank">mce-test_git.bb</a><br>
&gt; @@ -15,7 +15,7 @@ SRC_URI =3D &quot;git://<a href=3D"http://git.kernel=
.org/pub/scm/utils/cpu/mce/mce-test.git;protocol=3Dgit" rel=3D"noreferrer" =
target=3D"_blank">git.kernel.org/pub/scm/utils/cpu/mce/mce-test.git;protoco=
l=3Dgit</a>;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-gcov_merge.=
py-scov_merge.py-switch-to-python3.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
&gt;=C2=A0 SRCREV =3D &quot;025014dedca39d2b8a57a82e52286e72e157d73a&quot;<=
br>
&gt; -PV =3D &quot;20222810+git${SRCPV}&quot;<br>
&gt; +PV =3D &quot;20222810+git&quot;<br>
&gt;<br>
&gt;=C2=A0 RDEPENDS:${PN} =3D &quot;mcelog mce-inject dialog bash&quot;<br>
&gt;<br>
&gt; diff --git a/meta-oe/recipes-support/ne10/<a href=3D"http://ne10_1.2.1=
.bb" rel=3D"noreferrer" target=3D"_blank">ne10_1.2.1.bb</a> b/meta-oe/recip=
es-support/ne10/<a href=3D"http://ne10_1.2.1.bb" rel=3D"noreferrer" target=
=3D"_blank">ne10_1.2.1.bb</a><br>
&gt; index 5193df3174..21ef9fdc3b 100644<br>
&gt; --- a/meta-oe/recipes-support/ne10/<a href=3D"http://ne10_1.2.1.bb" re=
l=3D"noreferrer" target=3D"_blank">ne10_1.2.1.bb</a><br>
&gt; +++ b/meta-oe/recipes-support/ne10/<a href=3D"http://ne10_1.2.1.bb" re=
l=3D"noreferrer" target=3D"_blank">ne10_1.2.1.bb</a><br>
&gt; @@ -11,7 +11,7 @@ SRC_URI =3D &quot;git://<a href=3D"http://github.com=
/projectNe10/Ne10.git;branch=3Dmaster;protocol=3Dhttps" rel=3D"noreferrer" =
target=3D"_blank">github.com/projectNe10/Ne10.git;branch=3Dmaster;protocol=
=3Dhttps</a> \<br>
&gt;=C2=A0 SRCREV =3D &quot;18c4c982a595dad069cd8df4932aefb1d257591f&quot;<=
br>
&gt;<br>
&gt;=C2=A0 S =3D &quot;${WORKDIR}/git&quot;<br>
&gt; -PV .=3D &quot;gitr+${SRCPV}&quot;<br>
&gt; +PV .=3D &quot;gitr+&quot;<br>
&gt;<br>
&gt;=C2=A0 inherit cmake<br>
&gt;<br>
&gt; diff --git a/meta-oe/recipes-support/picocom/<a href=3D"http://picocom=
_git.bb" rel=3D"noreferrer" target=3D"_blank">picocom_git.bb</a> b/meta-oe/=
recipes-support/picocom/<a href=3D"http://picocom_git.bb" rel=3D"noreferrer=
" target=3D"_blank">picocom_git.bb</a><br>
&gt; index 4ec256bb99..cc0d88faca 100644<br>
&gt; --- a/meta-oe/recipes-support/picocom/<a href=3D"http://picocom_git.bb=
" rel=3D"noreferrer" target=3D"_blank">picocom_git.bb</a><br>
&gt; +++ b/meta-oe/recipes-support/picocom/<a href=3D"http://picocom_git.bb=
" rel=3D"noreferrer" target=3D"_blank">picocom_git.bb</a><br>
&gt; @@ -5,7 +5,7 @@ HOMEPAGE =3D &quot;<a href=3D"https://gitlab.com/wsake=
rnel/picocom" rel=3D"noreferrer" target=3D"_blank">https://gitlab.com/wsake=
rnel/picocom</a>&quot;<br>
&gt;=C2=A0 LIC_FILES_CHKSUM =3D &quot;file://LICENSE.txt;md5=3D3000e4830620=
e310fe65c0eb69df9e8a&quot;<br>
&gt;<br>
&gt;=C2=A0 BASEPV =3D &quot;2023-04&quot;<br>
&gt; -PV =3D &quot;${BASEPV}+git${SRCPV}&quot;<br>
&gt; +PV =3D &quot;${BASEPV}+git&quot;<br>
&gt;<br>
&gt;=C2=A0 SRCREV =3D &quot;12537df0314767d5af35bddddbbca3694e6a0342&quot;<=
br>
&gt;<br>
&gt; diff --git a/meta-oe/recipes-support/pidgin/<a href=3D"http://icyque_g=
it.bb" rel=3D"noreferrer" target=3D"_blank">icyque_git.bb</a> b/meta-oe/rec=
ipes-support/pidgin/<a href=3D"http://icyque_git.bb" rel=3D"noreferrer" tar=
get=3D"_blank">icyque_git.bb</a><br>
&gt; index fe75415de2..76ed26e88e 100644<br>
&gt; --- a/meta-oe/recipes-support/pidgin/<a href=3D"http://icyque_git.bb" =
rel=3D"noreferrer" target=3D"_blank">icyque_git.bb</a><br>
&gt; +++ b/meta-oe/recipes-support/pidgin/<a href=3D"http://icyque_git.bb" =
rel=3D"noreferrer" target=3D"_blank">icyque_git.bb</a><br>
&gt; @@ -5,7 +5,7 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D1ebbd3=
e34237af26da5dc08a4e440464&quot;<br>
&gt;<br>
&gt;=C2=A0 DEPENDS =3D &quot;pidgin json-glib&quot;<br>
&gt;<br>
&gt; -PV =3D &quot;0.1+gitr${SRCPV}&quot;<br>
&gt; +PV =3D &quot;0.1+gitr&quot;<br>
&gt;<br>
&gt;=C2=A0 inherit pkgconfig<br>
&gt;<br>
&gt; diff --git a/meta-oe/recipes-support/pidgin/<a href=3D"http://purple-s=
kypeweb_git.bb" rel=3D"noreferrer" target=3D"_blank">purple-skypeweb_git.bb=
</a> b/meta-oe/recipes-support/pidgin/<a href=3D"http://purple-skypeweb_git=
.bb" rel=3D"noreferrer" target=3D"_blank">purple-skypeweb_git.bb</a><br>
&gt; index 96b97b6744..1981f1ee9c 100644<br>
&gt; --- a/meta-oe/recipes-support/pidgin/<a href=3D"http://purple-skypeweb=
_git.bb" rel=3D"noreferrer" target=3D"_blank">purple-skypeweb_git.bb</a><br=
>
&gt; +++ b/meta-oe/recipes-support/pidgin/<a href=3D"http://purple-skypeweb=
_git.bb" rel=3D"noreferrer" target=3D"_blank">purple-skypeweb_git.bb</a><br=
>
&gt; @@ -11,7 +11,7 @@ SRC_URI =3D &quot;git://<a href=3D"http://github.com=
/EionRobb/skype4pidgin;branch=3Dmaster;protocol=3Dhttps" rel=3D"noreferrer"=
 target=3D"_blank">github.com/EionRobb/skype4pidgin;branch=3Dmaster;protoco=
l=3Dhttps</a>&quot;<br>
&gt;=C2=A0 SRCREV =3D &quot;b226d1c457d73900ae89b8a7469247fbe33677a6&quot;<=
br>
&gt;<br>
&gt;=C2=A0 S =3D &quot;${WORKDIR}/git&quot;<br>
&gt; -PV =3D &quot;1.7+git${SRCPV}&quot;<br>
&gt; +PV =3D &quot;1.7+git&quot;<br>
&gt;<br>
&gt;=C2=A0 do_compile() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 oe_runmake -C skypeweb;<br>
&gt; diff --git a/meta-oe/recipes-support/portaudio/<a href=3D"http://porta=
udio-v19_19.7.0.bb" rel=3D"noreferrer" target=3D"_blank">portaudio-v19_19.7=
.0.bb</a> b/meta-oe/recipes-support/portaudio/<a href=3D"http://portaudio-v=
19_19.7.0.bb" rel=3D"noreferrer" target=3D"_blank">portaudio-v19_19.7.0.bb<=
/a><br>
&gt; index c49a2599ac..2bf4d0a449 100644<br>
&gt; --- a/meta-oe/recipes-support/portaudio/<a href=3D"http://portaudio-v1=
9_19.7.0.bb" rel=3D"noreferrer" target=3D"_blank">portaudio-v19_19.7.0.bb</=
a><br>
&gt; +++ b/meta-oe/recipes-support/portaudio/<a href=3D"http://portaudio-v1=
9_19.7.0.bb" rel=3D"noreferrer" target=3D"_blank">portaudio-v19_19.7.0.bb</=
a><br>
&gt; @@ -3,7 +3,7 @@ SECTION =3D &quot;libs/multimedia&quot;<br>
&gt;=C2=A0 LICENSE =3D &quot;MIT&quot;<br>
&gt;=C2=A0 LIC_FILES_CHKSUM =3D &quot;file://LICENSE.txt;md5=3D26107732c2ab=
637c5710446fcfaf02df&quot;<br>
&gt;<br>
&gt; -PV .=3D &quot;+git${SRCPV}&quot;<br>
&gt; +PV .=3D &quot;+git&quot;<br>
&gt;<br>
&gt;=C2=A0 SRC_URI =3D &quot;git://<a href=3D"http://github.com/PortAudio/p=
ortaudio.git;branch=3Dmaster;protocol=3Dhttps" rel=3D"noreferrer" target=3D=
"_blank">github.com/PortAudio/portaudio.git;branch=3Dmaster;protocol=3Dhttp=
s</a>&quot;<br>
&gt;=C2=A0 SRCREV =3D &quot;929e2e8f7af281c5eb4fa07758930d542ec43d97&quot;<=
br>
&gt; diff --git a/meta-oe/recipes-support/serial-utils/<a href=3D"http://pt=
y-forward-native.bb" rel=3D"noreferrer" target=3D"_blank">pty-forward-nativ=
e.bb</a> b/meta-oe/recipes-support/serial-utils/<a href=3D"http://pty-forwa=
rd-native.bb" rel=3D"noreferrer" target=3D"_blank">pty-forward-native.bb</a=
><br>
&gt; index 2fe61e6f59..41a93f3249 100644<br>
&gt; --- a/meta-oe/recipes-support/serial-utils/<a href=3D"http://pty-forwa=
rd-native.bb" rel=3D"noreferrer" target=3D"_blank">pty-forward-native.bb</a=
><br>
&gt; +++ b/meta-oe/recipes-support/serial-utils/<a href=3D"http://pty-forwa=
rd-native.bb" rel=3D"noreferrer" target=3D"_blank">pty-forward-native.bb</a=
><br>
&gt; @@ -3,7 +3,7 @@ LICENSE =3D &quot;GPL-2.0-only&quot;<br>
&gt;=C2=A0 LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Debb5c50ab7cab4ba=
effba14977030c07&quot;<br>
&gt;=C2=A0 SECTION =3D &quot;console/network&quot;<br>
&gt;=C2=A0 SRCREV =3D &quot;00dbec2636ae0385ad028587e20e446272ff97ec&quot;<=
br>
&gt; -PV =3D &quot;1.1+gitr${SRCPV}&quot;<br>
&gt; +PV =3D &quot;1.1+gitr&quot;<br>
&gt;<br>
&gt;=C2=A0 SRC_URI =3D &quot;git://<a href=3D"http://github.com/freesmartph=
one/cornucopia.git;protocol=3Dhttps;branch=3Dmaster" rel=3D"noreferrer" tar=
get=3D"_blank">github.com/freesmartphone/cornucopia.git;protocol=3Dhttps;br=
anch=3Dmaster</a>&quot;<br>
&gt;=C2=A0 S =3D &quot;${WORKDIR}/git/tools/serial_forward&quot;<br>
&gt; diff --git a/meta-oe/recipes-support/serial-utils/<a href=3D"http://se=
rial-forward_git.bb" rel=3D"noreferrer" target=3D"_blank">serial-forward_gi=
t.bb</a> b/meta-oe/recipes-support/serial-utils/<a href=3D"http://serial-fo=
rward_git.bb" rel=3D"noreferrer" target=3D"_blank">serial-forward_git.bb</a=
><br>
&gt; index 84bb25e4cd..751bdffead 100644<br>
&gt; --- a/meta-oe/recipes-support/serial-utils/<a href=3D"http://serial-fo=
rward_git.bb" rel=3D"noreferrer" target=3D"_blank">serial-forward_git.bb</a=
><br>
&gt; +++ b/meta-oe/recipes-support/serial-utils/<a href=3D"http://serial-fo=
rward_git.bb" rel=3D"noreferrer" target=3D"_blank">serial-forward_git.bb</a=
><br>
&gt; @@ -3,7 +3,7 @@ LICENSE =3D &quot;GPL-2.0-only&quot;<br>
&gt;=C2=A0 LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Debb5c50ab7cab4ba=
effba14977030c07&quot;<br>
&gt;=C2=A0 SECTION =3D &quot;console/devel&quot;<br>
&gt;=C2=A0 SRCREV =3D &quot;07c6fdede0870edc37a8d51d033b6e7e29aa7c91&quot;<=
br>
&gt; -PV =3D &quot;1.1+gitr${SRCPV}&quot;<br>
&gt; +PV =3D &quot;1.1+gitr&quot;<br>
&gt;<br>
&gt;=C2=A0 SRC_URI =3D &quot;git://<a href=3D"http://github.com/freesmartph=
one/cornucopia.git;branch=3Dmaster;protocol=3Dhttps" rel=3D"noreferrer" tar=
get=3D"_blank">github.com/freesmartphone/cornucopia.git;branch=3Dmaster;pro=
tocol=3Dhttps</a> \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-serial_forw=
ard-Disable-default-static-linking.patch;striplevel=3D3 \<br>
&gt; diff --git a/meta-oe/recipes-support/synergy/<a href=3D"http://synergy=
_git.bb" rel=3D"noreferrer" target=3D"_blank">synergy_git.bb</a> b/meta-oe/=
recipes-support/synergy/<a href=3D"http://synergy_git.bb" rel=3D"noreferrer=
" target=3D"_blank">synergy_git.bb</a><br>
&gt; index f2e7a91618..fb767942fe 100644<br>
&gt; --- a/meta-oe/recipes-support/synergy/<a href=3D"http://synergy_git.bb=
" rel=3D"noreferrer" target=3D"_blank">synergy_git.bb</a><br>
&gt; +++ b/meta-oe/recipes-support/synergy/<a href=3D"http://synergy_git.bb=
" rel=3D"noreferrer" target=3D"_blank">synergy_git.bb</a><br>
&gt; @@ -13,7 +13,7 @@ SRC_URI =3D &quot;git://<a href=3D"http://github.com=
/symless/synergy-core;protocol=3Dhttps;nobranch=3D1" rel=3D"noreferrer" tar=
get=3D"_blank">github.com/symless/synergy-core;protocol=3Dhttps;nobranch=3D=
1</a>&quot;<br>
&gt;<br>
&gt;=C2=A0 # Version 1.10.1-stable<br>
&gt;=C2=A0 SRCREV ?=3D &quot;1b4c076127687aceac931d269e898beaac1cad9f&quot;=
<br>
&gt; -PV =3D &quot;1.10.1+git${SRCPV}&quot;<br>
&gt; +PV =3D &quot;1.10.1+git&quot;<br>
&gt;<br>
&gt;=C2=A0 S =3D &quot;${WORKDIR}/git&quot;<br>
&gt;<br>
&gt; diff --git a/meta-oe/recipes-support/utouch/<a href=3D"http://utouch-e=
vemu_git.bb" rel=3D"noreferrer" target=3D"_blank">utouch-evemu_git.bb</a> b=
/meta-oe/recipes-support/utouch/<a href=3D"http://utouch-evemu_git.bb" rel=
=3D"noreferrer" target=3D"_blank">utouch-evemu_git.bb</a><br>
&gt; index a6d09f69e9..bd69dbb11c 100644<br>
&gt; --- a/meta-oe/recipes-support/utouch/<a href=3D"http://utouch-evemu_gi=
t.bb" rel=3D"noreferrer" target=3D"_blank">utouch-evemu_git.bb</a><br>
&gt; +++ b/meta-oe/recipes-support/utouch/<a href=3D"http://utouch-evemu_gi=
t.bb" rel=3D"noreferrer" target=3D"_blank">utouch-evemu_git.bb</a><br>
&gt; @@ -12,7 +12,7 @@ SRC_URI =3D &quot;git://<a href=3D"http://bitmath.or=
g/git/evemu.git;protocol=3Dhttp;branch=3Dmaster" rel=3D"noreferrer" target=
=3D"_blank">bitmath.org/git/evemu.git;protocol=3Dhttp;branch=3Dmaster</a> \=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt;=C2=A0 SRCREV =3D &quot;9752b50e922572e4cd214ac45ed95e4ee410fe24&quot;<=
br>
&gt;<br>
&gt; -PV =3D &quot;1.0.6+git${SRCPV}&quot;<br>
&gt; +PV =3D &quot;1.0.6+git&quot;<br>
&gt;<br>
&gt;=C2=A0 S =3D &quot;${WORKDIR}/git&quot;<br>
&gt;<br>
&gt; diff --git a/meta-oe/recipes-support/utouch/<a href=3D"http://utouch-f=
rame_git.bb" rel=3D"noreferrer" target=3D"_blank">utouch-frame_git.bb</a> b=
/meta-oe/recipes-support/utouch/<a href=3D"http://utouch-frame_git.bb" rel=
=3D"noreferrer" target=3D"_blank">utouch-frame_git.bb</a><br>
&gt; index 3b1cf60c27..ddd27a7e30 100644<br>
&gt; --- a/meta-oe/recipes-support/utouch/<a href=3D"http://utouch-frame_gi=
t.bb" rel=3D"noreferrer" target=3D"_blank">utouch-frame_git.bb</a><br>
&gt; +++ b/meta-oe/recipes-support/utouch/<a href=3D"http://utouch-frame_gi=
t.bb" rel=3D"noreferrer" target=3D"_blank">utouch-frame_git.bb</a><br>
&gt; @@ -16,6 +16,6 @@ SRC_URI =3D &quot;git://<a href=3D"http://bitmath.or=
g/git/frame.git;protocol=3Dhttp;branch=3Dmaster" rel=3D"noreferrer" target=
=3D"_blank">bitmath.org/git/frame.git;protocol=3Dhttp;branch=3Dmaster</a> \=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt;=C2=A0 SRCREV =3D &quot;95363d5a1f7394d71144bf3b408ef4e6db4350fc&quot;<=
br>
&gt;<br>
&gt; -PV =3D &quot;1.1.2+git${SRCPV}&quot;<br>
&gt; +PV =3D &quot;1.1.2+git&quot;<br>
&gt;<br>
&gt;=C2=A0 S =3D &quot;${WORKDIR}/git&quot;<br>
&gt; diff --git a/meta-oe/recipes-support/utouch/<a href=3D"http://utouch-m=
tview_git.bb" rel=3D"noreferrer" target=3D"_blank">utouch-mtview_git.bb</a>=
 b/meta-oe/recipes-support/utouch/<a href=3D"http://utouch-mtview_git.bb" r=
el=3D"noreferrer" target=3D"_blank">utouch-mtview_git.bb</a><br>
&gt; index e348e39bba..d964d7f263 100644<br>
&gt; --- a/meta-oe/recipes-support/utouch/<a href=3D"http://utouch-mtview_g=
it.bb" rel=3D"noreferrer" target=3D"_blank">utouch-mtview_git.bb</a><br>
&gt; +++ b/meta-oe/recipes-support/utouch/<a href=3D"http://utouch-mtview_g=
it.bb" rel=3D"noreferrer" target=3D"_blank">utouch-mtview_git.bb</a><br>
&gt; @@ -14,6 +14,6 @@ SRCREV =3D &quot;ad437c38dc111cf3990a03abf14efe1b5d8=
9604b&quot;<br>
&gt;<br>
&gt;=C2=A0 DEPENDS +=3D &quot;mtdev utouch-frame utouch-evemu libx11&quot;<=
br>
&gt;<br>
&gt; -PV =3D &quot;1.1.7+git${SRCPV}&quot;<br>
&gt; +PV =3D &quot;1.1.7+git&quot;<br>
&gt;<br>
&gt;=C2=A0 S =3D &quot;${WORKDIR}/git&quot;<br>
&gt; diff --git a/meta-oe/recipes-support/zbar/<a href=3D"http://zbar_git.b=
b" rel=3D"noreferrer" target=3D"_blank">zbar_git.bb</a> b/meta-oe/recipes-s=
upport/zbar/<a href=3D"http://zbar_git.bb" rel=3D"noreferrer" target=3D"_bl=
ank">zbar_git.bb</a><br>
&gt; index 3be1f27a6f..975779cd18 100644<br>
&gt; --- a/meta-oe/recipes-support/zbar/<a href=3D"http://zbar_git.bb" rel=
=3D"noreferrer" target=3D"_blank">zbar_git.bb</a><br>
&gt; +++ b/meta-oe/recipes-support/zbar/<a href=3D"http://zbar_git.bb" rel=
=3D"noreferrer" target=3D"_blank">zbar_git.bb</a><br>
&gt; @@ -16,7 +16,7 @@ SRC_URI =3D &quot;git://<a href=3D"http://github.com=
/mchehab/zbar.git;branch=3Dmaster;protocol=3Dhttps" rel=3D"noreferrer" targ=
et=3D"_blank">github.com/mchehab/zbar.git;branch=3Dmaster;protocol=3Dhttps<=
/a> \<br>
&gt;=C2=A0 SRCREV =3D &quot;89e7900d85dd54ef351a7ed582aec6a5a5d7fa37&quot;<=
br>
&gt;<br>
&gt;=C2=A0 S =3D &quot;${WORKDIR}/git&quot;<br>
&gt; -PV =3D &quot;0.23.1+git${SRCPV}&quot;<br>
&gt; +PV =3D &quot;0.23.1+git&quot;<br>
&gt;<br>
&gt;=C2=A0 DEPENDS +=3D &quot;xmlto-native&quot;<br>
&gt;<br>
&gt; diff --git a/meta-oe/recipes-test/cmocka/<a href=3D"http://cmocka_1.1.=
7.bb" rel=3D"noreferrer" target=3D"_blank">cmocka_1.1.7.bb</a> b/meta-oe/re=
cipes-test/cmocka/<a href=3D"http://cmocka_1.1.7.bb" rel=3D"noreferrer" tar=
get=3D"_blank">cmocka_1.1.7.bb</a><br>
&gt; index 7461fcc4d7..6c94e9e275 100644<br>
&gt; --- a/meta-oe/recipes-test/cmocka/<a href=3D"http://cmocka_1.1.7.bb" r=
el=3D"noreferrer" target=3D"_blank">cmocka_1.1.7.bb</a><br>
&gt; +++ b/meta-oe/recipes-test/cmocka/<a href=3D"http://cmocka_1.1.7.bb" r=
el=3D"noreferrer" target=3D"_blank">cmocka_1.1.7.bb</a><br>
&gt; @@ -7,7 +7,7 @@ LICENSE =3D &quot;Apache-2.0&quot;<br>
&gt;=C2=A0 LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D3b83ef96387f1465=
5fc854ddc3c6bd57&quot;<br>
&gt;<br>
&gt;=C2=A0 SRCREV =3D &quot;a01cc69ee9536f90e57c61a198f2d1944d3d4313&quot;<=
br>
&gt; -PV .=3D &quot;+git${SRCPV}&quot;<br>
&gt; +PV .=3D &quot;+git&quot;<br>
&gt;=C2=A0 SRC_URI =3D &quot;git://<a href=3D"http://git.cryptomilk.org/pro=
jects/cmocka.git;protocol=3Dhttps;branch=3Dstable-1.1" rel=3D"noreferrer" t=
arget=3D"_blank">git.cryptomilk.org/projects/cmocka.git;protocol=3Dhttps;br=
anch=3Dstable-1.1</a> \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-include-Che=
ck-for-previous-declaration-of-uintptr_t.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://run-ptest \<br>
&gt; diff --git a/meta-oe/recipes-test/linux-serial-test/<a href=3D"http://=
linux-serial-test_git.bb" rel=3D"noreferrer" target=3D"_blank">linux-serial=
-test_git.bb</a> b/meta-oe/recipes-test/linux-serial-test/<a href=3D"http:/=
/linux-serial-test_git.bb" rel=3D"noreferrer" target=3D"_blank">linux-seria=
l-test_git.bb</a><br>
&gt; index 7abdcb2523..e909676abc 100644<br>
&gt; --- a/meta-oe/recipes-test/linux-serial-test/<a href=3D"http://linux-s=
erial-test_git.bb" rel=3D"noreferrer" target=3D"_blank">linux-serial-test_g=
it.bb</a><br>
&gt; +++ b/meta-oe/recipes-test/linux-serial-test/<a href=3D"http://linux-s=
erial-test_git.bb" rel=3D"noreferrer" target=3D"_blank">linux-serial-test_g=
it.bb</a><br>
&gt; @@ -5,7 +5,7 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSES/MIT;md5=3D5=
44799d0b492f119fa04641d1b8868ed&quot;<br>
&gt;<br>
&gt;=C2=A0 SRC_URI =3D &quot;git://<a href=3D"http://github.com/cbrake/linu=
x-serial-test.git;protocol=3Dhttps;branch=3Dmaster" rel=3D"noreferrer" targ=
et=3D"_blank">github.com/cbrake/linux-serial-test.git;protocol=3Dhttps;bran=
ch=3Dmaster</a>&quot;<br>
&gt;<br>
&gt; -PV =3D &quot;0+git${SRCPV}&quot;<br>
&gt; +PV =3D &quot;0+git&quot;<br>
&gt;=C2=A0 SRCREV =3D &quot;2ee61484167eab846f7b7c565284d7c350d738d3&quot;<=
br>
&gt;<br>
&gt;=C2=A0 S =3D &quot;${WORKDIR}/git&quot;<br>
&gt; diff --git a/meta-python/recipes-devtools/gyp/<a href=3D"http://gyp_gi=
t.bb" rel=3D"noreferrer" target=3D"_blank">gyp_git.bb</a> b/meta-python/rec=
ipes-devtools/gyp/<a href=3D"http://gyp_git.bb" rel=3D"noreferrer" target=
=3D"_blank">gyp_git.bb</a><br>
&gt; index 0f94a4476d..6ac4228a8b 100644<br>
&gt; --- a/meta-python/recipes-devtools/gyp/<a href=3D"http://gyp_git.bb" r=
el=3D"noreferrer" target=3D"_blank">gyp_git.bb</a><br>
&gt; +++ b/meta-python/recipes-devtools/gyp/<a href=3D"http://gyp_git.bb" r=
el=3D"noreferrer" target=3D"_blank">gyp_git.bb</a><br>
&gt; @@ -9,7 +9,7 @@ SRC_URI =3D &quot;git://<a href=3D"http://chromium.goo=
glesource.com/external/gyp;protocol=3Dhttps;branch=3Dma" rel=3D"noreferrer"=
 target=3D"_blank">chromium.googlesource.com/external/gyp;protocol=3Dhttps;=
branch=3Dma</a><br>
&gt;=C2=A0 SRCREV =3D &quot;a03d7413becefc8d55c8aa3df58b55b9bd0e9052&quot;<=
br>
&gt;<br>
&gt;=C2=A0 S =3D &quot;${WORKDIR}/git&quot;<br>
&gt; -PV =3D &quot;0.1+git${SRCPV}&quot;<br>
&gt; +PV =3D &quot;0.1+git&quot;<br>
&gt;<br>
&gt;=C2=A0 inherit setuptools3<br>
&gt;<br>
&gt; diff --git a/meta-webserver/recipes-httpd/apache-mod/<a href=3D"http:/=
/apache-websocket_git.bb" rel=3D"noreferrer" target=3D"_blank">apache-webso=
cket_git.bb</a> b/meta-webserver/recipes-httpd/apache-mod/<a href=3D"http:/=
/apache-websocket_git.bb" rel=3D"noreferrer" target=3D"_blank">apache-webso=
cket_git.bb</a><br>
&gt; index 040788609e..4dbf595c19 100644<br>
&gt; --- a/meta-webserver/recipes-httpd/apache-mod/<a href=3D"http://apache=
-websocket_git.bb" rel=3D"noreferrer" target=3D"_blank">apache-websocket_gi=
t.bb</a><br>
&gt; +++ b/meta-webserver/recipes-httpd/apache-mod/<a href=3D"http://apache=
-websocket_git.bb" rel=3D"noreferrer" target=3D"_blank">apache-websocket_gi=
t.bb</a><br>
&gt; @@ -15,7 +15,7 @@ SRC_URI =3D &quot;git://<a href=3D"http://github.com=
/jchampio/apache-websocket.git;branch=3Dmaster;protocol" rel=3D"noreferrer"=
 target=3D"_blank">github.com/jchampio/apache-websocket.git;branch=3Dmaster=
;protocol</a><br>
&gt;<br>
&gt;=C2=A0 SRCREV =3D &quot;0ee34c77fc78ff08fd548706300b80a7bc7874e4&quot;<=
br>
&gt;<br>
&gt; -PV =3D &quot;0.1.2+git${SRCPV}&quot;<br>
&gt; +PV =3D &quot;0.1.2+git&quot;<br>
&gt;<br>
&gt;=C2=A0 S =3D &quot;${WORKDIR}/git&quot;<br>
&gt;<br>
&gt; diff --git a/meta-webserver/recipes-httpd/cherokee/<a href=3D"http://c=
herokee_git.bb" rel=3D"noreferrer" target=3D"_blank">cherokee_git.bb</a> b/=
meta-webserver/recipes-httpd/cherokee/<a href=3D"http://cherokee_git.bb" re=
l=3D"noreferrer" target=3D"_blank">cherokee_git.bb</a><br>
&gt; index 3dc4ca8bbb..7763a31881 100644<br>
&gt; --- a/meta-webserver/recipes-httpd/cherokee/<a href=3D"http://cherokee=
_git.bb" rel=3D"noreferrer" target=3D"_blank">cherokee_git.bb</a><br>
&gt; +++ b/meta-webserver/recipes-httpd/cherokee/<a href=3D"http://cherokee=
_git.bb" rel=3D"noreferrer" target=3D"_blank">cherokee_git.bb</a><br>
&gt; @@ -8,7 +8,7 @@ LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D94d55d=
512a9ba36caa9b7df079bae19f&quot;<br>
&gt;=C2=A0 DEPENDS =3D &quot;unzip-native libpcre openssl mysql5 ${@bb.util=
s.contains(&#39;DISTRO_FEATURES&#39;, &#39;pam&#39;, &#39;libpam&#39;, &#39=
;&#39;, d)}&quot;<br>
&gt;<br>
&gt;=C2=A0 SRCREV =3D &quot;9a75e65b876bcc376cb6b379dca1f7ce4a055c59&quot;<=
br>
&gt; -PV =3D &quot;1.2.104+git${SRCPV}&quot;<br>
&gt; +PV =3D &quot;1.2.104+git&quot;<br>
&gt;=C2=A0 SRC_URI =3D &quot;git://<a href=3D"http://github.com/cherokee/we=
bserver;branch=3Dmaster;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_bla=
nk">github.com/cherokee/webserver;branch=3Dmaster;protocol=3Dhttps</a> \<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://cherokee.init \<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://cherokee.service=
 \<br>
&gt; --<br>
&gt; 2.43.0<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#108628): <a href=3D"https://lists.openembedded.org=
/g/openembedded-devel/message/108628" rel=3D"noreferrer" target=3D"_blank">=
https://lists.openembedded.org/g/openembedded-devel/message/108628</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/10419730=
8/1997914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.=
org/mt/104197308/1997914</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openem=
bedded.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.o=
rg</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
devel/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedde=
d.org/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com"=
 target=3D"_blank">raj.khem@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</blockquote></div>

--000000000000490fc70610ba6049--

