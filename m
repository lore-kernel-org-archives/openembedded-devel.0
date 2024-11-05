Return-Path: <tomek.zyje@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7551ED111A4
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 07:40:47 +0000 (UTC)
Subject: run-postinsts problem with do_create_spdx task
To: openembedded-devel@lists.openembedded.org
From: tomek.zyje@gmail.com
X-Originating-Location: Gdynia, Pomerania, PL (77.254.40.155)
X-Originating-Platform: Linux Chrome 129
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Mon, 04 Nov 2024 23:40:39 -0800
Message-ID: <nQmS.1730792439393657412.qbqI@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="sWcDTTX3PHOA57BqV6Ao"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 07:40:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113414

--sWcDTTX3PHOA57BqV6Ao
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

I have a problem with building run-postinsts when changing the machine
configuration for a build. I think I saw similar topics to this but to be
honest it is hard to debug for me and maybe someone will be able to help.
It can be reproduced by building run-postinsts when using `poky` as a distr=
o and
`ls1028ardb` [1] as a machine and then just changing the machine to
`am57xx-evm` [2]. Then the following error shows up

```
ERROR: run-postinsts-1.0-r0 do_create_spdx: Cannot find any SPDX file for r=
ecipe initscripts, False sstate:initscripts:aarch64-poky-linux:1.0:r0:aarch=
64:12: sstate:initscripts::1.0:r0::12:
ERROR: Logfile of failure stored in: /home/ubuntu/meta-proj/build/tmp/work/=
all-poky-linux/run-postinsts/1.0/temp/log.do_create_spdx.14761
ERROR: Task (/home/ubuntu/meta-proj/build/../poky/meta/recipes-devtools/run=
-postinsts/run-postinsts_1.0.bb:do_create_spdx) failed with exit code '1'
```

Why the run-postinsts do_create_spdx package depends on initscripts recipe
anyhow? I could go past this error by removing `allarch` from inherit direc=
tive
set in `run-postinsts` [3] recipe but it does not seems to be good solution=
 for
this problem as this recipe clearly produce allarchs artifacts. How to debu=
g
this?

[1] https://github.com/Freescale/meta-freescale/blob/scarthgap/conf/machine=
/ls1028ardb.conf
[2] https://git.yoctoproject.org/meta-ti/tree/meta-ti-bsp/conf/machine/am57=
xx-evm.conf
[3] https://git.yoctoproject.org/poky/plain/meta/recipes-devtools/run-posti=
nsts/run-postinsts_1.0.bb

Regards
Tomasz =C5=BByjewski

--sWcDTTX3PHOA57BqV6Ao
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>I have a problem with building run-postinsts when changing the machine=
<br />configuration for a build. I think I saw similar topics to this but t=
o be<br />honest it is hard to debug for me and maybe someone will be able =
to help.<br />It can be reproduced by building run-postinsts when using `po=
ky` as a distro and<br />`ls1028ardb` [1] as a machine and then just changi=
ng the machine to<br />`am57xx-evm` [2]. Then the following error shows up<=
/div>
<div><br />```<br />ERROR: run-postinsts-1.0-r0 do_create_spdx: Cannot find=
 any SPDX file for recipe initscripts, False sstate:initscripts:aarch64-pok=
y-linux:1.0:r0:aarch64:12: sstate:initscripts::1.0:r0::12:<br />ERROR: Logf=
ile of failure stored in: /home/ubuntu/meta-proj/build/tmp/work/all-poky-li=
nux/run-postinsts/1.0/temp/log.do_create_spdx.14761<br />ERROR: Task (/home=
/ubuntu/meta-proj/build/../poky/meta/recipes-devtools/run-postinsts/run-pos=
tinsts_1.0.bb:do_create_spdx) failed with exit code '1'<br />```</div>
<div><br />Why the run-postinsts do_create_spdx package depends on initscri=
pts recipe<br />anyhow? I could go past this error by removing `allarch` fr=
om inherit directive<br />set in `run-postinsts` [3] recipe but it does not=
 seems to be good solution for<br />this problem as this recipe clearly pro=
duce allarchs artifacts. How to debug<br />this?</div>
<div><br />[1] https://github.com/Freescale/meta-freescale/blob/scarthgap/c=
onf/machine/ls1028ardb.conf<br />[2] https://git.yoctoproject.org/meta-ti/t=
ree/meta-ti-bsp/conf/machine/am57xx-evm.conf<br />[3] <a href=3D"https://gi=
t.yoctoproject.org/poky/plain/meta/recipes-devtools/run-postinsts/run-posti=
nsts_1.0.bb" target=3D"_blank" rel=3D"noopener">https://git.yoctoproject.or=
g/poky/plain/meta/recipes-devtools/run-postinsts/run-postinsts_1.0.bb</a></=
div>
<div>&nbsp;</div>
<div>Regards<br />Tomasz =C5=BByjewski</div>

--sWcDTTX3PHOA57BqV6Ao--

