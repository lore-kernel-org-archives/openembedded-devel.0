Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93AB3C27C79
	for <webhook@archiver.kernel.org>; Thu, 20 Jun 2024 19:51:03 +0000 (UTC)
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
 by mx.groups.io with SMTP id smtpd.web11.56780.1718913054343733416
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 20 Jun 2024 12:50:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IkgeVpgX;
 spf=pass (domain: gmail.com, ip: 209.85.210.42, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-6f8edde24b3so793076a34.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 20 Jun 2024 12:50:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718913053; x=1719517853; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kO1kSp7l7Blh4Or30mC1X+QREccWpfoXCRXkC6CGhe8=;
        b=IkgeVpgXWJwPc2CJnEcH7wbZhnG5qu7uPIM0nOOcBJt4qENmEo1jC59OqtbBpVzABm
         6eojF750D8dfSE1eod440yzSSKyIiPB5pTbLgNad3aWqqrN0iTz35k++MhaDQchk99Rb
         FF+FX83dXoSaERtOK5VUueOI0xYWIC45sQhIWighVd7TfqmHgvFHor7/p3S63LZp3C1a
         TCi4lSIAbNR6abjIFwqUPzd58UzAo9a8tEqS2ZVvRcvVI2uL+YMw1nSdsdv8wBpVGzG9
         qGRqKwIuGBuLYy+Vrki/SRzcUiYDHb+3erIaSQxQ9X2S6SHPM8fpr5fomv6S0zIPYmy+
         JViw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718913053; x=1719517853;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kO1kSp7l7Blh4Or30mC1X+QREccWpfoXCRXkC6CGhe8=;
        b=X3qPtn+AXZo/N/dwCabdtru73CnfWKNgj+qtPTE1W1a295GEmH3ffxpcjaFxoe0XYF
         V3BYmC/9NL3/FUNGI7D6BtQFh8O+VLajWuy7jz9/+JrkEUKkKX85yTM1Pyp9vEQI3ecr
         kzqlFf8riSeqAZX6boaD2ToclwaWVugctAN2IrcqzOB9N5ehLcofhcJ5burWndSQMLrv
         aaoJT6Y2dd1g4nCBlqIhj3FBvhqqVcHaRTFd/ZjuMAvdpRlDD4JA68jqIKGejYNuFhCk
         wCxhu7mFesnOHiphogvOpf869ABTJe/5tdXsA47lKB3TonAW7pZ4Gw/+0SJ5/sfcUG/R
         uY/Q==
X-Gm-Message-State: AOJu0YxX7YL4sDSI/fbLy9prKSTux7G6YoTzrO6V32ANASP04Hf67oMb
	jzFNCsSE18EREUxa2Z41rnsAvlDsAufjX2LqzDJCBJ9eEEyJ3+aN2u1sDlecqboRmNyE9+cO656
	ZGP4Xt+xMJXcY3dd1z/n0HbuRVv4=
X-Google-Smtp-Source: AGHT+IG3ZmKm0DBy43z8Dc5N374DXMC9NdI1ztK81Kv2kCcReQbW09NBHlXv2dwLoyQNh+25cWex2VHAJY5UEwyrQKQ=
X-Received: by 2002:a05:6870:829e:b0:259:80dc:13e2 with SMTP id
 586e51a60fabf-25c948eaddfmr7162225fac.11.1718913053455; Thu, 20 Jun 2024
 12:50:53 -0700 (PDT)
MIME-Version: 1.0
References: <20240201072150.3751126-1-raj.khem@gmail.com> <2056.1718867175546392732@lists.openembedded.org>
In-Reply-To: <2056.1718867175546392732@lists.openembedded.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 20 Jun 2024 12:50:26 -0700
Message-ID: <CAMKF1srcoJfbLgX=C9bqMmRgkWNTo9OcFWOpqKCxeCgjUkUwiQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] bpftool: Add missing dep on elfutils-native
To: chen_heyun@163.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 20 Jun 2024 19:51:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110983

can you try changing it to

HOSTCC=3D"'${BUILD_CC} ${BUILD_CFLAGS}'"

On Thu, Jun 20, 2024 at 12:06=E2=80=AFAM chenheyun via lists.openembedded.o=
rg
<chen_heyun=3D163.com@lists.openembedded.org> wrote:
>
> hi=EF=BC=8C
>   this patch may be have some problem=E3=80=82
>   bitbake bpftool=EF=BC=9A
> chy@ubuntu:/home/sam/work/qemu-buildsystem/buildsystem3.0/build/qemuarm64=
/tmp/work-shared/qemuarm64/kernel-source/tools/bpf/bpftool$ make -C /home/s=
am/work/qemu-buildsystem/buildsystem3.0/buildsystem/source/kernel/linux-6.1=
.83/tools/lib/bpf OUTPUT=3D/home/sam/work/qemu-buildsystem/buildsystem3.0/b=
uild/qemuarm64/tmp/work/qemuarm64-poky-linux/bpftool/1.0-r0/bpftool-1.0/boo=
tstrap/libbpf/  DESTDIR=3D/home/sam/work/qemu-buildsystem/buildsystem3.0/bu=
ild/qemuarm64/tmp/work/qemuarm64-poky-linux/bpftool/1.0-r0/bpftool-1.0/boot=
strap/libbpf prefix=3D  ARCH=3D CROSS_COMPILE=3D CC=3Dgcc  -isystem/home/sa=
m/work/qemu-buildsystem/buildsystem3.0/build/qemuarm64/tmp/work/qemuarm64-p=
oky-linux/bpftool/1.0-r0/recipe-sysroot-native/usr/include -O2 -pipe LD=3Dl=
d AR=3Dar /home/sam/work/qemu-buildsystem/buildsystem3.0/build/qemuarm64/tm=
p/work/qemuarm64-poky-linux/bpftool/1.0-r0/bpftool-1.0/bootstrap/libbpf/lib=
bpf.a install_headers
> make: invalid option -- 'y'
> make: invalid option -- '/'
>
> i guss that=EF=BC=9A
> HOSTCC=3D"${BUILD_CC} ${BUILD_CFLAGS}"
> should be this=EF=BC=9A
> HOSTCC=3D"${BUILD_CC}
>
> because=EF=BC=8CHOSTCC is used in =EF=BC=9A
>
> $(LIBBPF_BOOTSTRAP): $(wildcard $(BPF_DIR)/*.[ch] $(BPF_DIR)/Makefile) | =
$(LIBBPF_BOOTSTRAP_OUTPUT)
>     echo chy____________1___$(BPF_DIR) _______________________
>     $(Q)$(MAKE) -C $(BPF_DIR) OUTPUT=3D$(LIBBPF_BOOTSTRAP_OUTPUT) \
>         DESTDIR=3D$(LIBBPF_BOOTSTRAP_DESTDIR:/=3D) prefix=3D \
>         ARCH=3D CROSS_COMPILE=3D CC=3D$(HOSTCC) LD=3D$(HOSTLD) AR=3D$(HOS=
TAR) $@ install_headers
>     echo chy____________2__________________________
>
> if HOSTCC=3D ${BUILD_CC} and  ${BUILD_CFLAGS}
> it will be err in step make -C =EF=BC=9A
>
> make -C /home/sam/work/qemu-buildsystem/buildsystem3.0/buildsystem/source=
/kernel/linux-6.1.83/tools/lib/bpf OUTPUT=3D/home/sam/work/qemu-buildsystem=
/buildsystem3.0/build/qemuarm64/tmp/work/qemuarm64-poky-linux/bpftool/1.0-r=
0/bpftool-1.0/bootstrap/libbpf/  DESTDIR=3D/home/sam/work/qemu-buildsystem/=
buildsystem3.0/build/qemuarm64/tmp/work/qemuarm64-poky-linux/bpftool/1.0-r0=
/bpftool-1.0/bootstrap/libbpf prefix=3D  ARCH=3D CROSS_COMPILE=3D CC=3Dgcc =
 -isystem/home/sam/work/qemu-buildsystem/buildsystem3.0/build/qemuarm64/tmp=
/work/qemuarm64-poky-linux/bpftool/1.0-r0/recipe-sysroot-native/usr/include=
 -O2 -pipe LD=3Dld AR=3Dar /home/sam/work/qemu-buildsystem/buildsystem3.0/b=
uild/qemuarm64/tmp/work/qemuarm64-poky-linux/bpftool/1.0-r0/bpftool-1.0/boo=
tstrap/libbpf/libbpf.a install_headers
>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#110971): https://lists.openembedded.org/g/openembedde=
d-devel/message/110971
> Mute This Topic: https://lists.openembedded.org/mt/104092706/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

