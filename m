Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 654ECD72A18
	for <webhook@archiver.kernel.org>; Fri, 29 Nov 2024 20:59:37 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web10.122665.1732913343490278071
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 Nov 2024 12:49:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DgEEorpB;
 spf=pass (domain: gmail.com, ip: 209.85.167.41, mailfrom: kamalgmbh32@gmail.com)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-53de84e4005so2743156e87.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 29 Nov 2024 12:49:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732913341; x=1733518141; darn=lists.openembedded.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=GddIitGtHPPYdaFjfi0ySN/Np33wKR/6grkB1qHo2Mo=;
        b=DgEEorpBoBZzpaVFetnZFngbo5UxgGr5eTGHEv4wE3ulziHlwePKJLORczz/aY5FHr
         Cjj4ptNX0rIEN3rG64l9QPiz/7Vqsuf2KJwnkbsXZb8rlbSLIPN9/tZD3aEFI3kEXg/y
         IszKjcqOld9EtbtQeF/HycP/pJdJmiVdOlaPpTeD0pT+b3kz5x4FQzcLOWd4TW3rV27y
         vE5RdJ7a84sMRoIoDxGVyhresvAtOWUYHdn1GxdwpCUDbJDo7jN3cJ/fuRfKHzBGHZmh
         BrDAqkXjGVrR6nq3ffBdtgtPoqa0u1pUxKOmz7+nqeM+oXw4V1Ho0KkDiWd6dsE3AaYB
         S+Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732913341; x=1733518141;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GddIitGtHPPYdaFjfi0ySN/Np33wKR/6grkB1qHo2Mo=;
        b=cxrr0QeBPGSmxnpXqDYJaaYGqUi1NmdmFAvMDeQxUzkt8JmuZz3UMIX0h0Sg8oHyHS
         LIDRfNalefQZQD8XlvHp3sv6nYX5V5zCisH6A0wXvUIIcqmmCJttKsHWFZBTm7LddCYj
         qXIoVcm2y1ifqoUh0gDKE4xtO411YjKNdB381X0bmmTjpK1l4EeNVT3H3oohIDYjhTqx
         TnPlfs5tEliZvwkaneARlHwh8pyfxd6X0vNjmgwm6BkzKJ4C6IBPSCYlwb6/y7t2XEC1
         W/Al/yrfDgPF2tPhWiVH4j291vGY68reZj5sXDRlstia+oQXT08vaaLFrYrueE3bP9rO
         NpmA==
X-Gm-Message-State: AOJu0YxKAgZ6l4ZO4Ntq08UPgdXeFtmgJzC8l/Es54IptbANuNrqwLZY
	LBj2s6Ufhq0xw2yB9s978X+fid/FKWE8RChCKAKlxAZVeXJReGJ6w3lB8PVdr+Guk52PSnnXQQ9
	FWj/nfvJiC+Nefy8ewkv7VL9HYHYkiUMuPAA=
X-Gm-Gg: ASbGncvKq6HWFKJIiAQIL/20Wwr82KhLxPMitTxHjFkR/7eqAEuZ91dYftf5nYdolKX
	pxcCghkHqUlBoy6IrE6gxWi+XMuAANoU=
X-Google-Smtp-Source: AGHT+IG/R9nMNiKJA/SDwZWAA676GPR2Uf2E30qgxTJx87jumS6ewEk6RY703zvSzMTdVmzeSqptS5EjUMome5+kHFo=
X-Received: by 2002:a05:6512:3c9c:b0:53d:e544:3fda with SMTP id
 2adb3069b0e04-53df0114865mr9294315e87.55.1732913340775; Fri, 29 Nov 2024
 12:49:00 -0800 (PST)
MIME-Version: 1.0
From: "Kamal GMBH" <kamalgmbh32@gmail.com>
Date: Sat, 30 Nov 2024 02:18:49 +0530
Message-ID: <CA+u1R=TOVRC6wTSzFtBXo=aPUW-PGoRBpica4536zL=CeT7ZgA@mail.gmail.com>
Subject: Multilib support Need for x86 board!
To: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000001a8958062813546e"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 29 Nov 2024 20:59:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114121

--0000000000001a8958062813546e
Content-Type: text/plain; charset="UTF-8"

I have an x86-based board, and I am trying to enable lib32-gcc,
lib32-gfortran, and multilib support.

I followed the guidelines provided in the multilib example configuration.
https://git.openembedded.org/openembedded-core/tree/meta-skeleton/conf/multilib-example.conf?h=scarthgap


In my *local.conf*, I added the following configuration:






*MACHINE = "Creter"require conf/multilib.confMULTILIBS =
"multilib:lib32"DEFAULTTUNE:virtclass-multilib-lib32 =
"x86"IMAGE_INSTALL:append = " lib32-gcc lib32-gfortran"*

However, I am encountering the following error during the build process:

*Build error:*

ERROR: glibc-2.39+git-r0 do_package:
ExecutionError('/media/nvme1/umesha/kamal-scarthgap/poky-amd-scarthgap/build-weston-crater-scarthgap/tmp-glibc/work/zen2-oe-linux/glibc/2.39+git/temp/run.stash_locale_package_cleanup.4120757',
1, None, None)
ERROR: Logfile of failure stored in:
/media/nvme1/umesha/kamal-scarthgap/poky-amd-scarthgap/build-weston-crater-scarthgap/tmp-glibc/work/zen2-oe-linux/glibc/2.39+git/temp/log.do_package.4120757
| rmdir: failed to remove
'/media/nvme1/umesha/kamal-scarthgap/poky-amd-scarthgap/build-weston-crater-scarthgap/tmp-glibc/work/zen2-oe-linux/glibc/2.39+git/package/usr/lib':
Directory not empty
| WARNING: exit code 1 from a shell command.

My Expectations:
Additionally, I noticed that the lib32 folder is not being generated under
the root filesystem:


umesha@yocto-server-2:/media/nvme1/umesha/kamal-scarthgap/poky-amd-scarthgap/build-weston-crater-scarthgap/tmp-glibc/work/crater-oe-linux/xen-image/1.0/rootfs/usr$
ls
bin  games  include  lib  libexec  sbin  share  src  x86_64-oe-linux
Do I need to make any specific changes on the kernel side to enable
multilib support? If so, could you please guide me on what needs to be
configured?

Thank you in advance for your assistance!


Regards,
Kamal

--0000000000001a8958062813546e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I have an x86-based board, and I am trying to enable lib32=
-gcc, lib32-gfortran, and multilib support.<br><br>I followed the guideline=
s provided in the multilib example configuration.<br><a href=3D"https://git=
.openembedded.org/openembedded-core/tree/meta-skeleton/conf/multilib-exampl=
e.conf?h=3Dscarthgap">https://git.openembedded.org/openembedded-core/tree/m=
eta-skeleton/conf/multilib-example.conf?h=3Dscarthgap</a><br><br><br>In my =
<b>local.conf</b>, I added the following configuration:<br><br><br><b>MACHI=
NE =3D &quot;Creter&quot;<br>require conf/multilib.conf<br>MULTILIBS =3D &q=
uot;multilib:lib32&quot;<br>DEFAULTTUNE:virtclass-multilib-lib32 =3D &quot;=
x86&quot;<br>IMAGE_INSTALL:append =3D &quot; lib32-gcc lib32-gfortran&quot;=
</b><div><b><br></b>However, I am encountering the following error during t=
he build process:<br><br><b>Build error:</b><br><br>ERROR: glibc-2.39+git-r=
0 do_package: ExecutionError(&#39;/media/nvme1/umesha/kamal-scarthgap/poky-=
amd-scarthgap/build-weston-crater-scarthgap/tmp-glibc/work/zen2-oe-linux/gl=
ibc/2.39+git/temp/run.stash_locale_package_cleanup.4120757&#39;, 1, None, N=
one)<br>ERROR: Logfile of failure stored in: /media/nvme1/umesha/kamal-scar=
thgap/poky-amd-scarthgap/build-weston-crater-scarthgap/tmp-glibc/work/zen2-=
oe-linux/glibc/2.39+git/temp/log.do_package.4120757<br>| rmdir: failed to r=
emove &#39;/media/nvme1/umesha/kamal-scarthgap/poky-amd-scarthgap/build-wes=
ton-crater-scarthgap/tmp-glibc/work/zen2-oe-linux/glibc/2.39+git/package/us=
r/lib&#39;: Directory not empty<br>| WARNING: exit code 1 from a shell comm=
and.</div><div><br></div><div>My Expectations:<br>Additionally, I noticed t=
hat the lib32 folder is not being generated under the root filesystem:<br><=
br><br>umesha@yocto-server-2:/media/nvme1/umesha/kamal-scarthgap/poky-amd-s=
carthgap/build-weston-crater-scarthgap/tmp-glibc/work/crater-oe-linux/xen-i=
mage/1.0/rootfs/usr$ ls<br>bin =C2=A0games =C2=A0include =C2=A0lib =C2=A0li=
bexec =C2=A0sbin =C2=A0share =C2=A0src =C2=A0x86_64-oe-linux<br>Do I need t=
o make any specific changes on the kernel side to enable multilib support? =
If so, could you please guide me on what needs to be configured?<br><br>Tha=
nk you in advance for your assistance!<br></div><div><br></div><div><br></d=
iv><div>Regards,</div><div>Kamal</div><div><br></div></div>

--0000000000001a8958062813546e--

