Return-Path: <kamalgmbh32@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0B25E74AD5
	for <webhook@archiver.kernel.org>; Tue,  3 Dec 2024 20:54:56 +0000 (UTC)
Subject: Need Support: how to install Multilib in yocto: I am enabling  Multilib ,lib32-gcc, lib32g++ and lib32fotran
To: openembedded-devel@lists.openembedded.org
From: "Kamal GMBH" <kamalgmbh32@gmail.com>
X-Originating-Location: Plano, Texas, US (161.69.80.128)
X-Originating-Platform: Windows Chrome 131
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 03 Dec 2024 12:54:56 -0800
Message-ID: <rtPJ.1733259296056727661.h2CI@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="5HlQ8r2wMIS1E6TZj2g7"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 03 Dec 2024 20:54:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114187

--5HlQ8r2wMIS1E6TZj2g7
Content-Type: text/plain; charset="utf-8"
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
*require conf/multilib.conf=C2=A0 =3D> newly added*
local.conf file:
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
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>
<div style=3D"color: #222222; font-family: Arial, Helvetica, sans-serif; fo=
nt-size: small; font-style: normal; font-variant-ligatures: normal; font-va=
riant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; t=
ext-align: start; text-indent: 0px; text-transform: none; widows: 2; word-s=
pacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; backgroun=
d-color: #ffffff; text-decoration-thickness: initial; text-decoration-style=
: initial; text-decoration-color: initial;"><strong>local.conf file:</stron=
g></div>
<div style=3D"color: #222222; font-family: Arial, Helvetica, sans-serif; fo=
nt-size: small; font-style: normal; font-variant-ligatures: normal; font-va=
riant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; t=
ext-align: start; text-indent: 0px; text-transform: none; widows: 2; word-s=
pacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; backgroun=
d-color: #ffffff; text-decoration-thickness: initial; text-decoration-style=
: initial; text-decoration-color: initial;"><br /><strong>DISTRO_FEATURES:a=
ppend =3D " multilib"</strong></div>
<div style=3D"color: #222222; font-family: Arial, Helvetica, sans-serif; fo=
nt-size: small; font-style: normal; font-variant-ligatures: normal; font-va=
riant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; t=
ext-align: start; text-indent: 0px; text-transform: none; widows: 2; word-s=
pacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; backgroun=
d-color: #ffffff; text-decoration-thickness: initial; text-decoration-style=
: initial; text-decoration-color: initial;"><strong># Enable multilib suppo=
rt</strong><br /><strong>MULTILIBS =3D "multilib:lib32"</strong><br /><stro=
ng>DEFAULTTUNE_virtclass-<wbr />multilib-lib32 =3D "x86"</strong></div>
<div style=3D"color: #222222; font-family: Arial, Helvetica, sans-serif; fo=
nt-size: small; font-style: normal; font-variant-ligatures: normal; font-va=
riant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; t=
ext-align: start; text-indent: 0px; text-transform: none; widows: 2; word-s=
pacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; backgroun=
d-color: #ffffff; text-decoration-thickness: initial; text-decoration-style=
: initial; text-decoration-color: initial;"><strong># Include lib32 version=
s of GCC, G++, and Fortran</strong><br /><strong>IMAGE_INSTALL:append =3D "=
 lib32-libgcc lib32-gcc-runtime lib32-libstdc++ lib32-gfortran"</strong></d=
iv>
<div style=3D"color: #222222; font-family: Arial, Helvetica, sans-serif; fo=
nt-size: small; font-style: normal; font-variant-ligatures: normal; font-va=
riant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; t=
ext-align: start; text-indent: 0px; text-transform: none; widows: 2; word-s=
pacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; backgroun=
d-color: #ffffff; text-decoration-thickness: initial; text-decoration-style=
: initial; text-decoration-color: initial;">&nbsp;</div>
<div style=3D"color: #222222; font-family: Arial, Helvetica, sans-serif; fo=
nt-size: small; font-style: normal; font-variant-ligatures: normal; font-va=
riant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; t=
ext-align: start; text-indent: 0px; text-transform: none; widows: 2; word-s=
pacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; backgroun=
d-color: #ffffff; text-decoration-thickness: initial; text-decoration-style=
: initial; text-decoration-color: initial;">umesha@yocto-server-2:/media/<w=
br />nvme1/umesha/kamal-poky/poky/<wbr />build$<span>&nbsp;</span><strong>b=
itbake-layers show-recipes | grep libgcc</strong><br />libgcc:<br />libgcc-=
initial:</div>
<div style=3D"color: #222222; font-family: Arial, Helvetica, sans-serif; fo=
nt-size: small; font-style: normal; font-variant-ligatures: normal; font-va=
riant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; t=
ext-align: start; text-indent: 0px; text-transform: none; widows: 2; word-s=
pacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; backgroun=
d-color: #ffffff; text-decoration-thickness: initial; text-decoration-style=
: initial; text-decoration-color: initial;"><br />umesha@yocto-server-2:/me=
dia/<wbr />nvme1/umesha/kamal-poky/poky/<wbr />build$&nbsp;</div>
<div style=3D"color: #222222; font-family: Arial, Helvetica, sans-serif; fo=
nt-size: small; font-style: normal; font-variant-ligatures: normal; font-va=
riant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; t=
ext-align: start; text-indent: 0px; text-transform: none; widows: 2; word-s=
pacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; backgroun=
d-color: #ffffff; text-decoration-thickness: initial; text-decoration-style=
: initial; text-decoration-color: initial;"><strong>Here lib32-gcc details =
is not showing ..</strong></div>
<div style=3D"color: #222222; font-family: Arial, Helvetica, sans-serif; fo=
nt-size: small; font-style: normal; font-variant-ligatures: normal; font-va=
riant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; t=
ext-align: start; text-indent: 0px; text-transform: none; widows: 2; word-s=
pacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; backgroun=
d-color: #ffffff; text-decoration-thickness: initial; text-decoration-style=
: initial; text-decoration-color: initial;">=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<wbr />=3D<br /=
><strong>another try:</strong></div>
<div style=3D"color: #222222; font-family: Arial, Helvetica, sans-serif; fo=
nt-size: small; font-style: normal; font-variant-ligatures: normal; font-va=
riant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; t=
ext-align: start; text-indent: 0px; text-transform: none; widows: 2; word-s=
pacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; backgroun=
d-color: #ffffff; text-decoration-thickness: initial; text-decoration-style=
: initial; text-decoration-color: initial;"><strong>require conf/multilib.c=
onf&nbsp; =3D&gt; newly added&nbsp;</strong><br />local.conf file:<br />DIS=
TRO_FEATURES:append =3D " multilib"</div>
<div style=3D"color: #222222; font-family: Arial, Helvetica, sans-serif; fo=
nt-size: small; font-style: normal; font-variant-ligatures: normal; font-va=
riant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; t=
ext-align: start; text-indent: 0px; text-transform: none; widows: 2; word-s=
pacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; backgroun=
d-color: #ffffff; text-decoration-thickness: initial; text-decoration-style=
: initial; text-decoration-color: initial;"># Enable multilib support<br />=
MULTILIBS =3D "multilib:lib32"<br />DEFAULTTUNE_virtclass-<wbr />multilib-l=
ib32 =3D "x86"</div>
<div style=3D"color: #222222; font-family: Arial, Helvetica, sans-serif; fo=
nt-size: small; font-style: normal; font-variant-ligatures: normal; font-va=
riant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; t=
ext-align: start; text-indent: 0px; text-transform: none; widows: 2; word-s=
pacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; backgroun=
d-color: #ffffff; text-decoration-thickness: initial; text-decoration-style=
: initial; text-decoration-color: initial;"># Include lib32 versions of GCC=
, G++, and Fortran<br />IMAGE_INSTALL:append =3D " lib32-libgcc lib32-gcc-r=
untime lib32-libstdc++ lib32-gfortran"</div>
<div style=3D"color: #222222; font-family: Arial, Helvetica, sans-serif; fo=
nt-size: small; font-style: normal; font-variant-ligatures: normal; font-va=
riant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; t=
ext-align: start; text-indent: 0px; text-transform: none; widows: 2; word-s=
pacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; backgroun=
d-color: #ffffff; text-decoration-thickness: initial; text-decoration-style=
: initial; text-decoration-color: initial;"><br />umesha@yocto-server-2:/me=
dia/<wbr />nvme1/umesha/kamal-poky/poky/<wbr />build$<span>&nbsp;</span><st=
rong>bitbake-layers show-recipes | grep libgcc</strong><br />ERROR: &nbsp;O=
E-core's config sanity checker detected a potential misconfiguration.<br />=
&nbsp; &nbsp; Either fix the cause of this error or at your own risk disabl=
e the checker (see sanity.conf).<br />&nbsp; &nbsp; Following is the list o=
f potential problems / advisories:</div>
<div style=3D"color: #222222; font-family: Arial, Helvetica, sans-serif; fo=
nt-size: small; font-style: normal; font-variant-ligatures: normal; font-va=
riant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; t=
ext-align: start; text-indent: 0px; text-transform: none; widows: 2; word-s=
pacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; backgroun=
d-color: #ffffff; text-decoration-thickness: initial; text-decoration-style=
: initial; text-decoration-color: initial;">&nbsp; &nbsp; Toolchain tunings=
 invalid:<br />No tuning found for lib32 multilib.</div>
<div style=3D"color: #222222; font-family: Arial, Helvetica, sans-serif; fo=
nt-size: small; font-style: normal; font-variant-ligatures: normal; font-va=
riant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; t=
ext-align: start; text-indent: 0px; text-transform: none; widows: 2; word-s=
pacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; backgroun=
d-color: #ffffff; text-decoration-thickness: initial; text-decoration-style=
: initial; text-decoration-color: initial;">Traceback (most recent call las=
t):<br />&nbsp; File "/media/nvme1/umesha/kamal-<wbr />poky/poky/bitbake/bi=
n/bitbake-<wbr />layers", line 95, in &lt;module&gt;<br />&nbsp; &nbsp; ret=
 =3D main()<br />&nbsp; File "/media/nvme1/umesha/kamal-<wbr />poky/poky/bi=
tbake/bin/bitbake-<wbr />layers", line 85, in main<br />&nbsp; &nbsp; tinfo=
il.parse_recipes()<br />&nbsp; File "/media/nvme1/umesha/kamal-<wbr />poky/=
poky/bitbake/lib/bb/<wbr />tinfoil.py", line 448, in parse_recipes<br />&nb=
sp; &nbsp; self.run_actions(config_<wbr />params)<br />&nbsp; File "/media/=
nvme1/umesha/kamal-<wbr />poky/poky/bitbake/lib/bb/<wbr />tinfoil.py", line=
 431, in run_actions<br />&nbsp; &nbsp; raise TinfoilUIException(ret)<br />=
bb.tinfoil.TinfoilUIException: 1<br />umesha@yocto-server-2:/media/<wbr />n=
vme1/umesha/kamal-poky/poky/<wbr />build$&nbsp;<br />umesha@yocto-server-2:=
/media/<wbr />nvme1/umesha/kamal-poky/poky/<wbr />build$&nbsp;</div>
<div style=3D"color: #222222; font-family: Arial, Helvetica, sans-serif; fo=
nt-size: small; font-style: normal; font-variant-ligatures: normal; font-va=
riant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; t=
ext-align: start; text-indent: 0px; text-transform: none; widows: 2; word-s=
pacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; backgroun=
d-color: #ffffff; text-decoration-thickness: initial; text-decoration-style=
: initial; text-decoration-color: initial;">&nbsp;</div>
<div style=3D"color: #222222; font-family: Arial, Helvetica, sans-serif; fo=
nt-size: small; font-style: normal; font-variant-ligatures: normal; font-va=
riant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; t=
ext-align: start; text-indent: 0px; text-transform: none; widows: 2; word-s=
pacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; backgroun=
d-color: #ffffff; text-decoration-thickness: initial; text-decoration-style=
: initial; text-decoration-color: initial;">Thank you in Advance!!</div>
</div>

--5HlQ8r2wMIS1E6TZj2g7--

