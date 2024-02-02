Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 122A8C47258
	for <webhook@archiver.kernel.org>; Fri,  2 Feb 2024 04:46:16 +0000 (UTC)
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
 by mx.groups.io with SMTP id smtpd.web11.16272.1706849167819455232
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 01 Feb 2024 20:46:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aFraeQnE;
 spf=pass (domain: gmail.com, ip: 209.85.160.45, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-218dcbd1584so1096870fac.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 01 Feb 2024 20:46:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706849167; x=1707453967; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tHANF/6brG2nPUgsVXyumP2HzqWlhzgmZQwR/e1YIDM=;
        b=aFraeQnE8VstVLonQj+FDAgUaVYysPrSia729FteDgrHquix8aWs4WVLb7sD7QcbX0
         tGPfEQ26L8YTRKifjDcfXkHVQBtzl4D2HzWT0X1t1gsGmQB0na+OF+wx3+4VYYB8EcQU
         HFob3XnzOD+LKq7PtH1mhTrCz92NvluvWM5LrVndApI1bv3W3I5O5r/xxrRjoeYysEcb
         UMAwLeVU8bt95xv5FstiuThqNqh4gx/FLGPEh/VHPlh5Ug4ynKXOR9212sRNY5jB7RIK
         /S8Pbdl2B9i0Bpa8Nhc3lDaT2QCOwyXvPuIMDw55TlAJ2djjmWhadDt1EnZnN80J38tx
         VA/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706849167; x=1707453967;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tHANF/6brG2nPUgsVXyumP2HzqWlhzgmZQwR/e1YIDM=;
        b=VXJ9aKdy5bbzOghY/9gZ/OSRyjT8WhpFf9ZQrbXQVrAMm2eR817wDJHQQJvwLc0PdG
         X7WspjoI3ACpr3TGrMBbWIhzKMqnNHZ8UrR7OBzOxKgbVRYd1mlcHMeAJ3MgbvFB9hHF
         rnKKYac7TyqiJgmswBnvFxFllY5zip3aQv8oxGc6b0zkcZdIISK6mOdGahhFTLmOt/Vd
         T9ZY/AaWN091itbGnTJ8p/QM2N8Ka+PC9KLnDnkETRE8o58jmtiYWeYHUoTn+c7yzNLh
         trV9coM4VCt64/UkZYlASM0q28Xq9ng18WwPDFCfeS27cqkSbtLUgLLvGGHvPDkZia22
         aXHw==
X-Gm-Message-State: AOJu0YxKkqlnpgIfPPEHddza6/kXyb8WiPXgAJTsHM2TlltqEt7qPuKS
	m+4H9WApw+6uYvx5DbskOtZOoh5R3l88dWeoeFPYC8bVQlKqwteT/c4/GjB3FTibHTWyW10L2wE
	1LR8Tj6syE2WQauE1f1gZiTFWdM5c0fHNXbM=
X-Google-Smtp-Source: AGHT+IFf0XKIB8DY3UrZwlk95Uo/CqZe8Cm3xhzZjV3PgdNLXbByJa9fYJyGIWm7oodTOKq6F8NOxamrCslfVjuRUk8=
X-Received: by 2002:a05:6870:6394:b0:218:5023:793c with SMTP id
 t20-20020a056870639400b002185023793cmr6810716oap.25.1706849166997; Thu, 01
 Feb 2024 20:46:06 -0800 (PST)
MIME-Version: 1.0
References: <20240202020149.2950813-1-chi.xu@windriver.com>
In-Reply-To: <20240202020149.2950813-1-chi.xu@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 1 Feb 2024 20:45:41 -0800
Message-ID: <CAMKF1soSDvn5vL3q2hvsf1Zq7agssHVOpyd9VG-8ux__skfcig@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] Update oe selftest case syzkaller.py
To: Chi Xu <chi.xu@eng.windriver.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 02 Feb 2024 04:46:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108524

On Thu, Feb 1, 2024 at 6:01=E2=80=AFPM Chi Xu <chi.xu@eng.windriver.com> wr=
ote:
>
> 1. Will meet following error when run test again.
> [FATAL] bad config syzkaller param: can't find /root/poky/build-st/tmp/wo=
rk/core2-64-poky-linux/syzkaller/git/package/usr/bin/linux_amd64/syz-fuzzer

Can this be provided by some sort of native recipe and then a DEPENDS
created to pull this in when
building syzkaller

> This is because oe-selftest will add "SSTATE_DIR" to local.conf,
> bitbake will not build syzkaller again, then test case can not
> find syz-fuzzer under work dirertory.
> Fix this isseu with adding SSTATE_SKIP_CREATION:pn-syzkaller =3D "1"
> to configure file.
>
> 2. Image name has been changed from core-image-minimal-qemux86-64.ext4
> to core-image-minimal-qemux86-64.rootfs.ext4, so update the defination
> of self.rootfs.
>
> Signed-off-by: Xu, Chi <chi.xu@windriver.com>
> ---
>  meta-oe/lib/oeqa/selftest/cases/syzkaller.py | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/meta-oe/lib/oeqa/selftest/cases/syzkaller.py b/meta-oe/lib/o=
eqa/selftest/cases/syzkaller.py
> index 64fc864bf..2c35ba230 100644
> --- a/meta-oe/lib/oeqa/selftest/cases/syzkaller.py
> +++ b/meta-oe/lib/oeqa/selftest/cases/syzkaller.py
> @@ -65,6 +65,7 @@ KERNEL_EXTRA_FEATURES +=3D " \
>      cfg/debug/syzkaller/debug-syzkaller.scc \
>  "
>  IMAGE_INSTALL:append =3D " syzkaller"
> +SSTATE_SKIP_CREATION:pn-syzkaller =3D "1"
>  """
>  % (self.machine, self.fstype))
>
> @@ -110,7 +111,7 @@ SYZ_QEMU_CPUS=3D"2"'    # number of cpus used by each=
 qemu VM
>
>          self.syz_cfg =3D os.path.join(self.syz_workdir, 'syzkaller.cfg')
>          self.kernel =3D os.path.join(self.deploy_dir_image, 'bzImage')
> -        self.rootfs =3D os.path.join(self.deploy_dir_image, '%s-%s.%s' %=
 (self.image, self.machine, self.fstype))
> +        self.rootfs =3D os.path.join(self.deploy_dir_image, '%s-%s.rootf=
s.%s' % (self.image, self.machine, self.fstype))
>
>          self.syz_native_sysroot =3D get_bb_var('RECIPE_SYSROOT_NATIVE', =
'syzkaller-native')
>
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#108522): https://lists.openembedded.org/g/openembedde=
d-devel/message/108522
> Mute This Topic: https://lists.openembedded.org/mt/104111739/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

