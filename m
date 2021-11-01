Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AE95C433EF
	for <webhook@archiver.kernel.org>; Mon,  1 Nov 2021 16:47:37 +0000 (UTC)
Received: from mail-il1-f176.google.com (mail-il1-f176.google.com
 [209.85.166.176])
 by mx.groups.io with SMTP id smtpd.web08.47249.1635785256803037999
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Nov 2021 09:47:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=fbYfvnSy;
 spf=pass (domain: gmail.com, ip: 209.85.166.176,
 mailfrom: alex.kiernan@gmail.com)
Received: by mail-il1-f176.google.com with SMTP id i12so12909521ila.12
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Nov 2021 09:47:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=f5Br/o3dXVuh4dDl8iH0nbYVkcODI+TDRgbO2LxuvvY=;
        b=fbYfvnSyS2iKjRakVBhLQcUC0HfvBVxDbt2bkFuiZIPe0qk3Oh9za4XUDNICVIotUm
         vs4rS74JXRCX7Ou90XvP05wgfu7jVXLZ8R5mFS/WANxpH0opXSD/4KPTTwA1TlxJVkoZ
         FrxEMInwoKDdZ/AtLwyyCAgE3uJRbusNc5P6G73P5PJyNMxjjW8tgdxotOUWPArsUItM
         1BcGNaM8M9/d1Epw8otUQtKopgkLHNjSsTTVFbwf1SccpYJV7IutisECNsUUxc5veL22
         r8iz8ni3Xy03HmmEHu++bHDBxZ8drktfDiigb5j9KNDtdYOQ15W4aVxFQiHi9PHIZMa/
         Qvvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=f5Br/o3dXVuh4dDl8iH0nbYVkcODI+TDRgbO2LxuvvY=;
        b=ibPNJ8yRlJBERWHhZsRRyg7eidR8giqYqGrNpiFk+vlMX5XvvlJx7yQ2/NMd5QMU7L
         3r6CiZUIj2/hGmZVTa692BhpuTmFteK9mu4NVP7rOHiDYijWLsoX/OBgKByfhfiHGd+P
         oTi9qbYULDbBdi5fGarnkJ4voBmt6zlGjNsfWr/oeCVJ29tXjYJNd9r9s8dryf9ZA/dT
         91L1J/cGm2m250Ykj75DDM5Rpi6NNp417gCdh8wQihNbhECrwdsTvyFFqyGI8K8C/UTB
         yRE5AZjYwbsH/qIZ8T1FxvBwgifYsS0g1ptO9Q8mRh+psz9bst1CGRdUiBOvs3hKQhl1
         f7Uw==
X-Gm-Message-State: AOAM533bXokxFJmvDcuUdY8Wx12EUho0RkmCC2qhVQcwXxYmd+eHtnoJ
	MCe3X4MDRPUW+hkuRX2I0TXUfmW0I5cgOw+cnmB3qUmZabE=
X-Google-Smtp-Source: 
 ABdhPJzeAZ8aFQRlpjyMJgbmGReLpo38tIMpjqI4CEC5gucV5ulNb5uqXiWLREJ/txjovE/JPh+Sce15uB68oLNQrXk=
X-Received: by 2002:a05:6e02:174d:: with SMTP id
 y13mr20891435ill.251.1635785255524;
 Mon, 01 Nov 2021 09:47:35 -0700 (PDT)
MIME-Version: 1.0
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Mon, 1 Nov 2021 16:47:24 +0000
Message-ID: 
 <CAO5Uq5RHsGws0ki_C-sC9zZHu3xWtxjZf4-Fu5JEa_MEavu2qQ@mail.gmail.com>
Subject: pseudo dying with path mismatch
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 Nov 2021 16:47:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93748

I've seen this twice now, same recipe both times, so I assume it's
something its doing which is upsetting pseudo. I suspect both times I
swapped to/from systemd/init as INIT_MANAGER (w/o clearing down
anything):

ERROR: mdns-1310.40.42-r0 do_install:
ExecutionError('/home/alexk/poky/build/tmp/work/cortexa57-poky-linux/mdns/1310.40.42-r0/temp/run.do_install.9540',
134, None, None)
ERROR: Logfile of failure stored in:
/home/alexk/poky/build/tmp/work/cortexa57-poky-linux/mdns/1310.40.42-r0/temp/log.do_install.9540
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are
['virtual:native:/home/alexk/poky/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot',
'/home/alexk/poky/meta/recipes-devtools/gcc/gcc-runtime_11.2.bb:do_populate_sysroot',
'/home/alexk/poky/meta/recipes-devtools/quilt/quilt-native_0.66.bb:do_populate_sysroot',
'/home/alexk/poky/meta/recipes-core/glibc/glibc_2.34.bb:do_populate_sysroot',
'/home/alexk/poky/meta/recipes-devtools/gcc/gcc-cross_11.2.bb:do_populate_sysroot',
'virtual:native:/home/alexk/poky/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['pseudo-native',
'gcc-runtime', 'quilt-native', 'glibc', 'gcc-cross-aarch64',
'patch-native', 'libgcc', 'linux-libc-headers', 'gmp-native',
'gnu-config-native', 'mpfr-native', 'texinfo-dummy-native',
'xz-native', 'flex-native', 'libmpc-native', 'binutils-cross-aarch64',
'libtool-native', 'zlib-native', 'attr-native',
'gettext-minimal-native', 'm4-native']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_install
| abort()ing pseudo client by server request. See
https://wiki.yoctoproject.org/wiki/Pseudo_Abort for more details on
this.
| Check logfile:
/home/alexk/poky/build/tmp/work/cortexa57-poky-linux/mdns/1310.40.42-r0/pseudo//pseudo.log
| Aborted
| WARNING: exit code 134 from a shell command.
ERROR: Task (/home/alexk/poky/meta-openembedded/meta-networking/recipes-protocols/mdns/mdns_1310.40.42.bb:do_install)
failed with exit code '1'
Pseudo log:
Setup complete, sending SIGUSR1 to pid 9541.
path mismatch [3 links]: ino 2824102 db
'/home/alexk/poky/build/tmp/work/cortexa57-poky-linux/mdns/1310.40.42-r0/package/usr/src/debug/mdns/1310.40.42-r0/mDNSResponder-1310.40.42/mDNSShared/dns_sd.h'
req '/home/alexk/poky/build/tmp/work/cortexa57-poky-linux/mdns/1310.40.42-r0/mDNSResponder-1310.40.42/mDNSShared/dns_sd.h'.

Nothing exotic in the build, just oe-core and meta-openembedded in the
layers and both at the head of master.

Any pointers on what I should dig to help debug, or is it if you
change INIT_MANAGER you need to delete tmp.

-- 
Alex Kiernan

