Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8142E74AD9
	for <webhook@archiver.kernel.org>; Tue,  3 Dec 2024 21:00:36 +0000 (UTC)
Subject: Need Support: how to install Multilib in yocto: I am enabling Multilib ,lib32-gcc, lib32g++ and lib32fotran
To: openembedded-devel@lists.openembedded.org
From: "Kamal GMBH" <kamalgmbh32@gmail.com>
X-Originating-Location: Plano, Texas, US (161.69.80.128)
X-Originating-Platform: Windows Chrome 131
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 03 Dec 2024 11:11:08 -0800
Message-ID: <LwAH.1733253068499658345.Q0Od@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="7ovFJxCSt08p1uRbiNpP"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 03 Dec 2024 21:00:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114188

--7ovFJxCSt08p1uRbiNpP
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

*local.conf* file:

*DISTRO_FEATURES:append =3D " multilib"*
*# Enable multilib support*
*MULTILIBS =3D "multilib:lib32"*
*DEFAULTTUNE_virtclass-multilib-lib32 =3D "x86"*
*# Include lib32 versions of GCC, G++, and Fortran*
*IMAGE_INSTALL:append =3D " lib32-libgcc lib32-gcc-runtime lib32-libstdc++ =
lib32-gfortran"*

umesha@yocto-server-2:/media/nvme1/umesha/kamal-poky/poky/build$ *bitbake-l=
ayers show-recipes | grep libgcc*
libgcc:
libgcc-initial:

umesha@yocto-server-2:/media/nvme1/umesha/kamal-poky/poky/build$
*Here lib32-gcc details is not showing ..*
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
ANother try: includeing
local.conf file:
*require conf/multilib.conf=C2=A0 =C2=A0 =3D>newly added*
DISTRO_FEATURES:append =3D " multilib"
# Enable multilib support
MULTILIBS =3D "multilib:lib32"
DEFAULTTUNE_virtclass-multilib-lib32 =3D "x86"
# Include lib32 versions of GCC, G++, and Fortran
IMAGE_INSTALL:append =3D " lib32-libgcc lib32-gcc-runtime lib32-libstdc++ l=
ib32-gfortran"

umesha@yocto-server-2:/media/nvme1/umesha/kamal-poky/poky/build$ *bitbake-l=
ayers show-recipes | grep libgcc*
ERROR: =C2=A0OE-core's config sanity checker detected a potential misconfig=
uration.
Either fix the cause of this error or at your own risk disable the checker =
(see sanity.conf).
Following is the list of potential problems / advisories:
Toolchain tunings invalid:
No tuning found for lib32 multilib.
Traceback (most recent call last):
File "/media/nvme1/umesha/kamal-poky/poky/bitbake/bin/bitbake-layers", line=
 95, in <module>
ret =3D main()
File "/media/nvme1/umesha/kamal-poky/poky/bitbake/bin/bitbake-layers", line=
 85, in main
tinfoil.parse_recipes()
File "/media/nvme1/umesha/kamal-poky/poky/bitbake/lib/bb/tinfoil.py", line =
448, in parse_recipes
self.run_actions(config_params)
File "/media/nvme1/umesha/kamal-poky/poky/bitbake/lib/bb/tinfoil.py", line =
431, in run_actions
raise TinfoilUIException(ret)
bb.tinfoil.TinfoilUIException: 1
umesha@yocto-server-2:/media/nvme1/umesha/kamal-poky/poky/build$
umesha@yocto-server-2:/media/nvme1/umesha/kamal-poky/poky/build$

Thanks in advance!

--7ovFJxCSt08p1uRbiNpP
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div><strong>local.conf </strong>file:</div>
<div><br /><strong>DISTRO_FEATURES:append =3D " multilib"</strong></div>
<div><strong># Enable multilib support</strong><br /><strong>MULTILIBS =3D =
"multilib:lib32"</strong><br /><strong>DEFAULTTUNE_virtclass-multilib-lib32=
 =3D "x86"</strong></div>
<div><strong># Include lib32 versions of GCC, G++, and Fortran</strong><br =
/><strong>IMAGE_INSTALL:append =3D " lib32-libgcc lib32-gcc-runtime lib32-l=
ibstdc++ lib32-gfortran"</strong></div>
<div>&nbsp;</div>
<div>umesha@yocto-server-2:/media/nvme1/umesha/kamal-poky/poky/build$ <stro=
ng>bitbake-layers show-recipes | grep libgcc</strong><br />libgcc:<br />lib=
gcc-initial:</div>
<div><br />umesha@yocto-server-2:/media/nvme1/umesha/kamal-poky/poky/build$=
&nbsp;</div>
<div><strong>Here lib32-gcc details is not showing ..</strong></div>
<div>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D</div>
<div>ANother try: includeing&nbsp;<br />local.conf file:</div>
<div><strong>require conf/multilib.conf&nbsp; &nbsp; =3D&gt;newly added&nbs=
p;</strong><br />DISTRO_FEATURES:append =3D " multilib"</div>
<div># Enable multilib support<br />MULTILIBS =3D "multilib:lib32"<br />DEF=
AULTTUNE_virtclass-multilib-lib32 =3D "x86"</div>
<div># Include lib32 versions of GCC, G++, and Fortran<br />IMAGE_INSTALL:a=
ppend =3D " lib32-libgcc lib32-gcc-runtime lib32-libstdc++ lib32-gfortran"<=
/div>
<div><br /><br /></div>
<div>umesha@yocto-server-2:/media/nvme1/umesha/kamal-poky/poky/build$<stron=
g> bitbake-layers show-recipes | grep libgcc</strong><br />ERROR: &nbsp;OE-=
core's config sanity checker detected a potential misconfiguration.<br />&n=
bsp; &nbsp; Either fix the cause of this error or at your own risk disable =
the checker (see sanity.conf).<br />&nbsp; &nbsp; Following is the list of =
potential problems / advisories:</div>
<div>&nbsp; &nbsp; Toolchain tunings invalid:<br />No tuning found for lib3=
2 multilib.</div>
<div>Traceback (most recent call last):<br />&nbsp; File "/media/nvme1/umes=
ha/kamal-poky/poky/bitbake/bin/bitbake-layers", line 95, in &lt;module&gt;<=
br />&nbsp; &nbsp; ret =3D main()<br />&nbsp; File "/media/nvme1/umesha/kam=
al-poky/poky/bitbake/bin/bitbake-layers", line 85, in main<br />&nbsp; &nbs=
p; tinfoil.parse_recipes()<br />&nbsp; File "/media/nvme1/umesha/kamal-poky=
/poky/bitbake/lib/bb/tinfoil.py", line 448, in parse_recipes<br />&nbsp; &n=
bsp; self.run_actions(config_params)<br />&nbsp; File "/media/nvme1/umesha/=
kamal-poky/poky/bitbake/lib/bb/tinfoil.py", line 431, in run_actions<br />&=
nbsp; &nbsp; raise TinfoilUIException(ret)<br />bb.tinfoil.TinfoilUIExcepti=
on: 1<br />umesha@yocto-server-2:/media/nvme1/umesha/kamal-poky/poky/build$=
&nbsp;<br />umesha@yocto-server-2:/media/nvme1/umesha/kamal-poky/poky/build=
$&nbsp;</div>
<div>&nbsp;</div>
<div>Thanks in advance!&nbsp;</div>
<div>&nbsp;</div>

--7ovFJxCSt08p1uRbiNpP--

