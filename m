Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BDAEC4332F
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 20:24:17 +0000 (UTC)
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
 by mx.groups.io with SMTP id smtpd.web11.17476.1699129455777764124
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Nov 2023 13:24:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RJJVn88q;
 spf=pass (domain: gmail.com, ip: 209.85.161.51, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-586a516755aso2058025eaf.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 04 Nov 2023 13:24:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699129455; x=1699734255; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DwUBL167He6ep4SR/XCFJqBVk53Jaq1YDUQBJgdb7qA=;
        b=RJJVn88qY0pb9Ne14UEsNL9lG/fYz0rW1paspbkbloQZQ0lSdImQwIYiPjGTF3kQU8
         BDB3GyULKzWg+FCdVrdDpEjiqUf71NUuSbuN5RYHsKSdAbgplKVoXLrm/5NIjwUyoGbI
         SQRxMB2IWqeyBpD9RadkLhTj38m/H0j5N+knRbgWJQIWXQmFroIqsH9ZOecxZXQgLuze
         UrRGezSkxGc71mngzRq7aC8rCI0LPUwoSFPMto7VXeT8G1P8ZgCDgGBDYqhrcNasDuBF
         Rd92SLYN1X6F/iYx9eNjtFL+74F4cgk1N1aKB9WFx8qrTV/FJQkjXmMGRcRwUgq4LECo
         9lIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699129455; x=1699734255;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DwUBL167He6ep4SR/XCFJqBVk53Jaq1YDUQBJgdb7qA=;
        b=fvEwZg0EvKspR5MzGhajoPxBp9FGOFEOwodOydbEe5k5zxdu9e9dMbpXhE7L9WaU2U
         YRdp+LONR5Q3WJju9FMXp8i3r1Xem1I5bfMHzxGqyGrPG6hsK19ImjpBTOLVy5jytTQp
         DPDCmwFmwOgL7QJiGqZPpAceQE58KtJryL1uvNDO8bfqVMH2iP8cE1dI1HzUBchCw1Wi
         nScc3k04mzFRVcnF5MHOvRqIKpf6/Jw8aenybYanjoLxqDTi4Q1TcFNAyb46nZtVRVzi
         9ayemsJZZS13AvOUQgv1hGnLuVzeFdWQhhY4VgsQn0Xx+4iV3DbFQhkf/0TFOTqqaXKo
         3tcA==
X-Gm-Message-State: AOJu0YyrIwv3mYEqZfoCkY92baLsloK3naWStbrjbvmVuSsUbSjT4ksY
	UFyc3dcpzgr0vwSnu2RfqsJYlZ/G6CWAKVuBVsZa5snqv0s=
X-Google-Smtp-Source: AGHT+IEVuLQbw2Biir8xCjbKgIyFjvfNFu7ZH9wErUpzRUFfkL+KCx7hdJnjroS5S+RR7NhfrFMz7oONGk6AghJ+jus=
X-Received: by 2002:a05:6870:1216:b0:1ea:3c8e:4673 with SMTP id
 22-20020a056870121600b001ea3c8e4673mr3768802oan.8.1699129454847; Sat, 04 Nov
 2023 13:24:14 -0700 (PDT)
MIME-Version: 1.0
References: <0101018b96bf15ca-12434bb6-db65-40ee-ac31-50374281f91b-000000@us-west-2.amazonses.com>
In-Reply-To: <0101018b96bf15ca-12434bb6-db65-40ee-ac31-50374281f91b-000000@us-west-2.amazonses.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 4 Nov 2023 13:23:48 -0700
Message-ID: <CAMKF1sr2fMn_3w8EmbQ3CsM2WKekxkJNj4W3iwKspNZvOAZuGg@mail.gmail.com>
Subject: Re: [oe] [AUH] Upgrade status meta-oe: 2023-11-03
To: Auto Upgrade Helper <auh@yoctoproject.org>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Nov 2023 20:24:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106378

FWIW, I have picked the meta-oe lot which was reported succeeding. I
found one ptest error in xmlsec1 which I sent a patch for. I will take
all the successful AUH patches
for all layers under meta-openembedded one by one. Please review any
recipe upgrade of interest to you and all feedback is welcome.

On Fri, Nov 3, 2023 at 12:58=E2=80=AFPM Auto Upgrade Helper
<auh@yoctoproject.org> wrote:
>
> AUH finished upgrade batch the result patches/logs can be found at:
> https://autobuilder.yocto.io/pub/auh/20231103111813, next are the statist=
ics:
>
> Recipe upgrade statistics:
>
>     * Succeeded: 42
>         abseil-cpp, 20230802.1, Forced maintainer for AUH
>         broadcom-bt-firmware, 12.0.1.1105., Forced maintainer for AUH
>         c-ares, 1.21.0, Forced maintainer for AUH
>         cairomm-1.16, 1.18.0, Forced maintainer for AUH
>         ccid, 1.5.4, Forced maintainer for AUH
>         cjson, 1.7.16, Forced maintainer for AUH
>         ctags, 6.0.20231029.0, Forced maintainer for AUH
>         feh, 3.10.1, Forced maintainer for AUH
>         fio, 2022, Forced maintainer for AUH
>         gcab, 1.6, Forced maintainer for AUH
>         geos, 3.12.0beta2, Forced maintainer for AUH
>         glibmm-2.68, 2.78.0, Forced maintainer for AUH
>         googlebenchmark, 1.8.3, Forced maintainer for AUH
>         hwdata, 0.375, Forced maintainer for AUH
>         jack, 2, Forced maintainer for AUH
>         lastlog2, 1.2.0, Forced maintainer for AUH
>         libbpf, 1.2.2, Forced maintainer for AUH
>         libfastjson, 1.2304.0, Forced maintainer for AUH
>         libmbim, 1.31.1, Forced maintainer for AUH
>         libosinfo, 1.11.0, Forced maintainer for AUH
>         libraw, 0.21.1, Forced maintainer for AUH
>         libsodium, 1.0.19, Forced maintainer for AUH
>         libtorrent, 1, Forced maintainer for AUH
>         lsscsi, 030, Forced maintainer for AUH
>         mcelog, 196, Forced maintainer for AUH
>         mksh, R59c, Forced maintainer for AUH
>         modemmanager, 1.23.1, Forced maintainer for AUH
>         mstpd, 0.05, Forced maintainer for AUH
>         neatvnc, 0.7.0, Forced maintainer for AUH
>         opencl-headers, 2023.04.17, Forced maintainer for AUH
>         pahole, 1.25, Forced maintainer for AUH
>         pmdk, 2.0.0, Forced maintainer for AUH
>         sdbus-c++, 1.4.0, Forced maintainer for AUH
>         ser2net, 4.5.0, Forced maintainer for AUH
>         smarty, 4.3.4, Forced maintainer for AUH
>         thingsboard-gateway, 3.4.2, Forced maintainer for AUH
>         toybox, 0.8.10, Forced maintainer for AUH
>         uftrace, 0.14, Forced maintainer for AUH
>         webkitgtk3, 2.42.1, Forced maintainer for AUH
>         wtmpdb, 0.9.3, Forced maintainer for AUH
>         xmlsec1, 1.3.2, Forced maintainer for AUH
>         xterm, 388, Forced maintainer for AUH
>     * Failed (devtool error): 131
>         android-tools, 341027030, Forced maintainer for AUH
>         avro-c, 1.11.3, Forced maintainer for AUH
>         beep, 1.4.12, Forced maintainer for AUH
>         boinc-client, 20120110, Forced maintainer for AUH
>         brotli, 1.1.0, Forced maintainer for AUH
>         byacc, 20230521, Forced maintainer for AUH
>         capnproto, 1.0.1, Forced maintainer for AUH
>         catch2, 3.4.0, Forced maintainer for AUH
>         clinfo, 20170207, Forced maintainer for AUH
>         cmpi-bindings, 1.0.4, Forced maintainer for AUH
>         cpp-netlib, 505122, Forced maintainer for AUH
>         cpuid, 20230614-1, Forced maintainer for AUH
>         crash, 8.0.3, Forced maintainer for AUH
>         crucible, 2023.11.02, Forced maintainer for AUH
>         ctapi-common, 23.8, Forced maintainer for AUH
>         debootstrap, 1.0.133, Forced maintainer for AUH
>         dmalloc, 5.6.5, Forced maintainer for AUH
>         dool, 1.3.0, Forced maintainer for AUH
>         etcd, 3.5.7-new-commits-available, Forced maintainer for AUH
>         flashrom, 1.3.0, Forced maintainer for AUH
>         fluentbit, 2.1.10, Forced maintainer for AUH
>         font-adobe-100dpi, 1.0.4, Forced maintainer for AUH
>         font-adobe-utopia-100dpi, 1.0.5, Forced maintainer for AUH
>         font-bh-100dpi, 1.0.4, Forced maintainer for AUH
>         font-bh-lucidatypewriter-100dpi, 1.0.4, Forced maintainer for AUH
>         font-bitstream-100dpi, 1.0.4, Forced maintainer for AUH
>         font-cursor-misc, 1.0.4, Forced maintainer for AUH
>         font-misc-misc, 1.1.3, Forced maintainer for AUH
>         ftgl, 5, Forced maintainer for AUH
>         fwts, V23.09.00, Forced maintainer for AUH
>         fwupd-efi, 1.4, Forced maintainer for AUH
>         geany, 2.0, Forced maintainer for AUH
>         geany-plugins, 2.0, Forced maintainer for AUH
>         glade, 3.40.0, Forced maintainer for AUH
>         glm, 214, Forced maintainer for AUH
>         gnulib, 20030524., Forced maintainer for AUH
>         gnuplot, 5.4.10, Forced maintainer for AUH
>         gosu, 1.17, Forced maintainer for AUH
>         gperftools, 2.13, Forced maintainer for AUH
>         gphoto2, 2.5.31, Forced maintainer for AUH
>         grpc, 1.59.2, Forced maintainer for AUH
>         gsoap, 2.8.131, Forced maintainer for AUH
>         gtkmm3, 4.13.1, Forced maintainer for AUH
>         heaptrack, 1.5.0, Forced maintainer for AUH
>         indent, 2.2.13, Forced maintainer for AUH
>         influxdb, 2.7.3, Forced maintainer for AUH
>         inotify-tools, 4.23.9.0, Forced maintainer for AUH
>         ipmitool, 10., Forced maintainer for AUH
>         jasper, 20221103, Forced maintainer for AUH
>         kpatch, 0.9.9, Forced maintainer for AUH
>         krb5, 1.21.2, Forced maintainer for AUH
>         libdevmapper, 2.03.22, Forced maintainer for AUH
>         libharu, 2.4.4, Forced maintainer for AUH
>         liblightmodbus, 3.0, Forced maintainer for AUH
>         libpeas, 2.0.0, Forced maintainer for AUH
>         libperfetto, 38.0, Forced maintainer for AUH
>         librdkafka, 64, Forced maintainer for AUH
>         libsdl-image, 1.2.12-1, Forced maintainer for AUH
>         libsdl-mixer, 1.2.12-1, Forced maintainer for AUH
>         libsdl-net, 1.2.8-1, Forced maintainer for AUH
>         libsdl-ttf, 2.0.11-1, Forced maintainer for AUH
>         libsdl2-image, 2.6.3, Forced maintainer for AUH
>         libsdl2-mixer, 2.6.3, Forced maintainer for AUH
>         libsdl2-net, 2.2.0, Forced maintainer for AUH
>         libsombok3, 2011.5, Forced maintainer for AUH
>         libspatialite, 5.1.0-RC1, Forced maintainer for AUH
>         libteam, 1.32, Forced maintainer for AUH
>         libvncserver, 11, Forced maintainer for AUH
>         libxaw, 1.0.15, Forced maintainer for AUH
>         libyui, 43018, Forced maintainer for AUH
>         libyui-ncurses, 43018, Forced maintainer for AUH
>         luaposix, 36.2.1, Forced maintainer for AUH
>         lvm2, 2.03.22, Forced maintainer for AUH
>         mime-support, 3.66, Forced maintainer for AUH
>         minifi-cpp, 0.15.0, Forced maintainer for AUH
>         minio, 2023, Forced maintainer for AUH
>         mm-common, 1.0.5, Forced maintainer for AUH
>         mongodb, 7.1.0, Forced maintainer for AUH
>         mpv, 0.36.0, Forced maintainer for AUH
>         msgpack-c, 6.1.0, Forced maintainer for AUH
>         multipath-tools, 0.9.6, Forced maintainer for AUH
>         ndctl, v78, Forced maintainer for AUH
>         netplan, 0.107, Forced maintainer for AUH
>         nmap, 7.94-1, Forced maintainer for AUH
>         opencv, 4.8.1, Forced maintainer for AUH
>         opengl-es-cts, 4.6.3.3, Forced maintainer for AUH
>         perfetto, 38.0, Forced maintainer for AUH
>         php, 8.2.12, Forced maintainer for AUH
>         pm-graph, 5.11, Forced maintainer for AUH
>         poco, 1.12.5, Forced maintainer for AUH
>         poke, 3.3, Forced maintainer for AUH
>         poppler, 23.11.0, Forced maintainer for AUH
>         portaudio-v19, 190600.20161030, Forced maintainer for AUH
>         postgresql, 16.0, Forced maintainer for AUH
>         protobuf, 25.0, Forced maintainer for AUH
>         rocksdb, 8.6.7, Forced maintainer for AUH
>         sdbus-c++-libsystemd, 254.5, Forced maintainer for AUH
>         sdbus-c++-tools, 1.4.0, Forced maintainer for AUH
>         serial-forward, 0710, Forced maintainer for AUH
>         sessreg, 1.1.3, Forced maintainer for AUH
>         snappy, 1.1.10, Forced maintainer for AUH
>         squashfs-tools-ng, 1.2.0, Forced maintainer for AUH
>         synergy, 4.2.0, Forced maintainer for AUH
>         sysdig, 20171003, Forced maintainer for AUH
>         tbb, 2021.10.0, Forced maintainer for AUH
>         thin-provisioning-tools, 1.0.7, Forced maintainer for AUH
>         tigervnc, 1.13.1, Forced maintainer for AUH
>         tipcutils, 3.0.4, Forced maintainer for AUH
>         tomoyo-tools, 2.6.1-20210910, Forced maintainer for AUH
>         ttf-droid, 341027030, Forced maintainer for AUH
>         ttf-liberation-sans-narrow, 2.00.1, Forced maintainer for AUH
>         ttf-lklug, 20090803, Forced maintainer for AUH
>         ttf-tlwg, 0.7.3, Forced maintainer for AUH
>         v4l-utils, 4, Forced maintainer for AUH
>         vboxguestdrivers, 7.0.12a, Forced maintainer for AUH
>         vte9, 0.74.1, Forced maintainer for AUH
>         vulkan-cts, 4.6.3.3, Forced maintainer for AUH
>         wxwidgets, 2006.08.10, Forced maintainer for AUH
>         xbitmaps, 1.1.3, Forced maintainer for AUH
>         xcursorgen, 1.0.8, Forced maintainer for AUH
>         xf86-input-void, 1.4.2, Forced maintainer for AUH
>         xf86-video-mga, 2.0.1, Forced maintainer for AUH
>         xgamma, 1.0.7, Forced maintainer for AUH
>         xkbevd, 1.1.5, Forced maintainer for AUH
>         xlsatoms, 1.1.4, Forced maintainer for AUH
>         xlsclients, 1.1.5, Forced maintainer for AUH
>         xsetroot, 1.1.3, Forced maintainer for AUH
>         xstdcmap, 1.0.5, Forced maintainer for AUH
>         zabbix, 6.4.8, Forced maintainer for AUH
>         zbar, 1.3.1, Forced maintainer for AUH
>         zsh, 5.9, Forced maintainer for AUH
>     * Failed(do_compile): 34
>         atkmm, 2.36.2, Forced maintainer for AUH
>         botan, 3.2.0, Forced maintainer for AUH
>         breakpad, 2023.01.27, Forced maintainer for AUH
>         cairomm, 1.18.0, Forced maintainer for AUH
>         concurrencykit, 0.7.1, Forced maintainer for AUH
>         faad2, 2.10.1, Forced maintainer for AUH
>         glibmm, 2.78.0, Forced maintainer for AUH
>         gpsd, 3.25, Forced maintainer for AUH
>         gst-editing-services, 1.22.6, Forced maintainer for AUH
>         gtkmm, 4.13.1, Forced maintainer for AUH
>         hddtemp, 15, Forced maintainer for AUH
>         imlib2, 1.12.1, Forced maintainer for AUH
>         libdbd-mysql-perl, 5.002, Forced maintainer for AUH
>         libgusb, 0.4.7, Forced maintainer for AUH
>         libreport, 2.17.11, Forced maintainer for AUH
>         links-x11, 2.29, Forced maintainer for AUH
>         mercurial, 6.5rc0, Forced maintainer for AUH
>         nodejs, 21.1.0, Forced maintainer for AUH
>         opencl-clhpp, 2023.04.17, Forced maintainer for AUH
>         opencl-icd-loader, 2023.04.17, Forced maintainer for AUH
>         openldap, 2.6.6, Forced maintainer for AUH
>         openocd, 0.12.0, Forced maintainer for AUH
>         p8platform, 8, Forced maintainer for AUH
>         pangomm, 2.50.1, Forced maintainer for AUH
>         pcsc-tools, 1.7.0, Forced maintainer for AUH
>         proj, 9.3.0RC2, Forced maintainer for AUH
>         renderdoc, 1.29, Forced maintainer for AUH
>         safec, 31082020, Forced maintainer for AUH
>         sqlite-orm, 1.8.2, Forced maintainer for AUH
>         telepathy-glib, 0.99.11, Forced maintainer for AUH
>         transmission, 4.0.4, Forced maintainer for AUH
>         wavpack, 5.6.0, Forced maintainer for AUH
>         yad, 13.0, Forced maintainer for AUH
>         zile, 2.6.2, Forced maintainer for AUH
>     * Failed(other errors): 4
>         lapack, 3.12, Forced maintainer for AUH
>         octave, 8.3.0, Forced maintainer for AUH
>         redis, 7.2.3, Forced maintainer for AUH
>         suitesparse, 7.3.0, Forced maintainer for AUH
>
>     TOTAL: attempted=3D211 succeeded=3D42(19.91%) failed=3D169(80.09%)
>
> Recipe upgrade statistics per Maintainer:
>
>     Forced maintainer for AUH: attempted=3D211 succeeded=3D42(19.91%) fai=
led=3D169(80.09%)
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#106051): https://lists.openembedded.org/g/openembedde=
d-devel/message/106051
> Mute This Topic: https://lists.openembedded.org/mt/102372149/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

