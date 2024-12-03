Return-Path: <kamalgmbh32@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0862E74AD6
	for <webhook@archiver.kernel.org>; Tue,  3 Dec 2024 20:56:46 +0000 (UTC)
Subject: Need Support: how to install Multilib in yocto: I am enabling Multilib ,lib32-gcc, lib32g++ and lib32fotran
To: openembedded-devel@lists.openembedded.org
From: "Kamal GMBH" <kamalgmbh32@gmail.com>
X-Originating-Location: Plano, Texas, US (161.69.80.128)
X-Originating-Platform: Windows Chrome 131
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 03 Dec 2024 12:56:36 -0800
Message-ID: <rtPJ.1733259296056727661.h2CI@lists.openembedded.org>
X-Old-Date: Tue, 03 Dec 2024 12:54:56 -0800
Content-Type: multipart/alternative; boundary="5HlQ8r2wMIS1E6TZj2g7"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 03 Dec 2024 20:56:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114187
Message-ID: <20241203205636.JBKL6lBm35UC0deFy16qb9Rhrt7LabaakTUUK-Ze-J4@z>

--5HlQ8r2wMIS1E6TZj2g7
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

*local.conf file:*

*DISTRO_FEATURES:append =3D " multilib"*
*# Enable multilib support*
*MULTILIBS =3D "multilib:lib32"*
*DEFAULTTUNE_virtclass- multilib-lib32 =3D "x86"*
*# Include lib32 versions of GCC, G++, and Fortran*
*IMAGE_INSTALL:append =3D " lib32-libgcc lib32-gcc-runtime lib32-libstdc++ =
lib32-gfortran"*

umesha@yocto-server-2:/media/ nvme1/umesha/kamal-poky/poky/ build$ *bitbake=
-layers show-recipes | grep libgcc*
libgcc:
libgcc-initial:

umesha@yocto-server-2:/media/ nvme1/umesha/kamal-poky/poky/ build$
*Here lib32-gcc details is not showing ..*
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D =3D
*another try:*
local.conf file:
*require conf/multilib.conf=C2=A0 =3D> newly added*
DISTRO_FEATURES:append =3D " multilib"
# Enable multilib support
MULTILIBS =3D "multilib:lib32"
DEFAULTTUNE_virtclass- multilib-lib32 =3D "x86"
# Include lib32 versions of GCC, G++, and Fortran
IMAGE_INSTALL:append =3D " lib32-libgcc lib32-gcc-runtime lib32-libstdc++ l=
ib32-gfortran"

umesha@yocto-server-2:/media/ nvme1/umesha/kamal-poky/poky/ build$ *bitbake=
-layers show-recipes | grep libgcc*
ERROR: =C2=A0OE-core's config sanity checker detected a potential misconfig=
uration.
Either fix the cause of this error or at your own risk disable the checker =
(see sanity.conf).
Following is the list of potential problems / advisories:
Toolchain tunings invalid:
No tuning found for lib32 multilib.
Traceback (most recent call last):
File "/media/nvme1/umesha/kamal- poky/poky/bitbake/bin/bitbake- layers", li=
ne 95, in <module>
ret =3D main()
File "/media/nvme1/umesha/kamal- poky/poky/bitbake/bin/bitbake- layers", li=
ne 85, in main
tinfoil.parse_recipes()
File "/media/nvme1/umesha/kamal- poky/poky/bitbake/lib/bb/ tinfoil.py", lin=
e 448, in parse_recipes
self.run_actions(config_ params)
File "/media/nvme1/umesha/kamal- poky/poky/bitbake/lib/bb/ tinfoil.py", lin=
e 431, in run_actions
raise TinfoilUIException(ret)
bb.tinfoil.TinfoilUIException: 1
umesha@yocto-server-2:/media/ nvme1/umesha/kamal-poky/poky/ build$
umesha@yocto-server-2:/media/ nvme1/umesha/kamal-poky/poky/ build$

Thank you in Advance!!

--5HlQ8r2wMIS1E6TZj2g7
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div>
<div style=3D"color: #222222; font-family: Arial, Helvetica, sans-serif; fo=
nt-style: normal; font-weight: 400; letter-spacing: normal; text-align: sta=
rt; text-transform: none; word-spacing: 0px; background-color: #ffffff;"><s=
trong>local.conf file:</strong></div>
<div style=3D"color: #222222; font-family: Arial, Helvetica, sans-serif; fo=
nt-style: normal; font-weight: 400; letter-spacing: normal; text-align: sta=
rt; text-transform: none; word-spacing: 0px; background-color: #ffffff;"><b=
r /><strong>DISTRO_FEATURES:append =3D " multilib"</strong></div>
<div style=3D"color: #222222; font-family: Arial, Helvetica, sans-serif; fo=
nt-style: normal; font-weight: 400; letter-spacing: normal; text-align: sta=
rt; text-transform: none; word-spacing: 0px; background-color: #ffffff;"><s=
trong># Enable multilib support</strong><br /><strong>MULTILIBS =3D "multil=
ib:lib32"</strong><br /><strong>DEFAULTTUNE_virtclass-<wbr />multilib-lib32=
 =3D "x86"</strong></div>
<div style=3D"color: #222222; font-family: Arial, Helvetica, sans-serif; fo=
nt-style: normal; font-weight: 400; letter-spacing: normal; text-align: sta=
rt; text-transform: none; word-spacing: 0px; background-color: #ffffff;"><s=
trong># Include lib32 versions of GCC, G++, and Fortran</strong><br /><stro=
ng>IMAGE_INSTALL:append =3D " lib32-libgcc lib32-gcc-runtime lib32-libstdc+=
+ lib32-gfortran"</strong></div>
<div style=3D"color: #222222; font-family: Arial, Helvetica, sans-serif; fo=
nt-style: normal; font-weight: 400; letter-spacing: normal; text-align: sta=
rt; text-transform: none; word-spacing: 0px; background-color: #ffffff;">&n=
bsp;</div>
<div style=3D"color: #222222; font-family: Arial, Helvetica, sans-serif; fo=
nt-style: normal; font-weight: 400; letter-spacing: normal; text-align: sta=
rt; text-transform: none; word-spacing: 0px; background-color: #ffffff;">um=
esha@yocto-server-2:/media/<wbr />nvme1/umesha/kamal-poky/poky/<wbr />build=
$<span>&nbsp;</span><strong>bitbake-layers show-recipes | grep libgcc</stro=
ng><br />libgcc:<br />libgcc-initial:</div>
<div style=3D"color: #222222; font-family: Arial, Helvetica, sans-serif; fo=
nt-style: normal; font-weight: 400; letter-spacing: normal; text-align: sta=
rt; text-transform: none; word-spacing: 0px; background-color: #ffffff;"><b=
r />umesha@yocto-server-2:/media/<wbr />nvme1/umesha/kamal-poky/poky/<wbr /=
>build$&nbsp;</div>
<div style=3D"color: #222222; font-family: Arial, Helvetica, sans-serif; fo=
nt-style: normal; font-weight: 400; letter-spacing: normal; text-align: sta=
rt; text-transform: none; word-spacing: 0px; background-color: #ffffff;"><s=
trong>Here lib32-gcc details is not showing ..</strong></div>
<div style=3D"color: #222222; font-family: Arial, Helvetica, sans-serif; fo=
nt-style: normal; font-weight: 400; letter-spacing: normal; text-align: sta=
rt; text-transform: none; word-spacing: 0px; background-color: #ffffff;">=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D<wbr />=3D<br /><strong>another try:</strong></div>
<div style=3D"color: #222222; font-family: Arial, Helvetica, sans-serif; fo=
nt-style: normal; font-weight: 400; letter-spacing: normal; text-align: sta=
rt; text-transform: none; word-spacing: 0px; background-color: #ffffff;">lo=
cal.conf file:</div>
<div style=3D"color: #222222; font-family: Arial, Helvetica, sans-serif; fo=
nt-style: normal; font-weight: 400; letter-spacing: normal; text-align: sta=
rt; text-transform: none; word-spacing: 0px; background-color: #ffffff;"><s=
trong>require conf/multilib.conf&nbsp; =3D&gt; newly added&nbsp;</strong><b=
r />DISTRO_FEATURES:append =3D " multilib"</div>
<div style=3D"color: #222222; font-family: Arial, Helvetica, sans-serif; fo=
nt-style: normal; font-weight: 400; letter-spacing: normal; text-align: sta=
rt; text-transform: none; word-spacing: 0px; background-color: #ffffff;"># =
Enable multilib support<br />MULTILIBS =3D "multilib:lib32"<br />DEFAULTTUN=
E_virtclass-<wbr />multilib-lib32 =3D "x86"</div>
<div style=3D"color: #222222; font-family: Arial, Helvetica, sans-serif; fo=
nt-style: normal; font-weight: 400; letter-spacing: normal; text-align: sta=
rt; text-transform: none; word-spacing: 0px; background-color: #ffffff;"># =
Include lib32 versions of GCC, G++, and Fortran<br />IMAGE_INSTALL:append =
=3D " lib32-libgcc lib32-gcc-runtime lib32-libstdc++ lib32-gfortran"</div>
<div style=3D"color: #222222; font-family: Arial, Helvetica, sans-serif; fo=
nt-style: normal; font-weight: 400; letter-spacing: normal; text-align: sta=
rt; text-transform: none; word-spacing: 0px; background-color: #ffffff;"><b=
r />umesha@yocto-server-2:/media/<wbr />nvme1/umesha/kamal-poky/poky/<wbr /=
>build$<span>&nbsp;</span><strong>bitbake-layers show-recipes | grep libgcc=
</strong><br />ERROR: &nbsp;OE-core's config sanity checker detected a pote=
ntial misconfiguration.<br />&nbsp; &nbsp; Either fix the cause of this err=
or or at your own risk disable the checker (see sanity.conf).<br />&nbsp; &=
nbsp; Following is the list of potential problems / advisories:</div>
<div style=3D"color: #222222; font-family: Arial, Helvetica, sans-serif; fo=
nt-style: normal; font-weight: 400; letter-spacing: normal; text-align: sta=
rt; text-transform: none; word-spacing: 0px; background-color: #ffffff;">&n=
bsp; &nbsp; Toolchain tunings invalid:<br />No tuning found for lib32 multi=
lib.</div>
<div style=3D"color: #222222; font-family: Arial, Helvetica, sans-serif; fo=
nt-style: normal; font-weight: 400; letter-spacing: normal; text-align: sta=
rt; text-transform: none; word-spacing: 0px; background-color: #ffffff;">Tr=
aceback (most recent call last):<br />&nbsp; File "/media/nvme1/umesha/kama=
l-<wbr />poky/poky/bitbake/bin/bitbake-<wbr />layers", line 95, in &lt;modu=
le&gt;<br />&nbsp; &nbsp; ret =3D main()<br />&nbsp; File "/media/nvme1/ume=
sha/kamal-<wbr />poky/poky/bitbake/bin/bitbake-<wbr />layers", line 85, in =
main<br />&nbsp; &nbsp; tinfoil.parse_recipes()<br />&nbsp; File "/media/nv=
me1/umesha/kamal-<wbr />poky/poky/bitbake/lib/bb/<wbr />tinfoil.py", line 4=
48, in parse_recipes<br />&nbsp; &nbsp; self.run_actions(config_<wbr />para=
ms)<br />&nbsp; File "/media/nvme1/umesha/kamal-<wbr />poky/poky/bitbake/li=
b/bb/<wbr />tinfoil.py", line 431, in run_actions<br />&nbsp; &nbsp; raise =
TinfoilUIException(ret)<br />bb.tinfoil.TinfoilUIException: 1<br />umesha@y=
octo-server-2:/media/<wbr />nvme1/umesha/kamal-poky/poky/<wbr />build$&nbsp=
;<br />umesha@yocto-server-2:/media/<wbr />nvme1/umesha/kamal-poky/poky/<wb=
r />build$&nbsp;</div>
<div style=3D"color: #222222; font-family: Arial, Helvetica, sans-serif; fo=
nt-style: normal; font-weight: 400; letter-spacing: normal; text-align: sta=
rt; text-transform: none; word-spacing: 0px; background-color: #ffffff;">&n=
bsp;</div>
<div style=3D"color: #222222; font-family: Arial, Helvetica, sans-serif; fo=
nt-style: normal; font-weight: 400; letter-spacing: normal; text-align: sta=
rt; text-transform: none; word-spacing: 0px; background-color: #ffffff;">Th=
ank you in Advance!!</div>
</div>

--5HlQ8r2wMIS1E6TZj2g7--

