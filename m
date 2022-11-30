Return-Path: <tomasz.zyjewski@3mdeb.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EF0AC433FE
	for <webhook@archiver.kernel.org>; Wed, 30 Nov 2022 07:29:22 +0000 (UTC)
Subject: Re: [meta-python][PATCH 2/2] python3-uefi-firmware: add recipe for version 1.9
To: openembedded-devel@lists.openembedded.org
From: "tomzy" <tomasz.zyjewski@3mdeb.com>
X-Originating-Location: Warsaw, Mazovia, PL (84.10.27.202)
X-Originating-Platform: Linux Firefox 107
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 29 Nov 2022 23:29:18 -0800
References: <CANx9H-CFJ0KnQtNtejmpishDMxVdWaucGt05GYB+oHaADChdjA@mail.gmail.com>
In-Reply-To: <CANx9H-CFJ0KnQtNtejmpishDMxVdWaucGt05GYB+oHaADChdjA@mail.gmail.com>
Message-ID: <13060.1669793358146498707@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="1LbIFoaUZCrlEPW8Dypg"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 30 Nov 2022 07:29:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99869

--1LbIFoaUZCrlEPW8Dypg
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

>=20
> On Fri, Nov 25, 2022 at 3:44 AM tomzy < tomasz.zyjewski@... > wrote:
>=20

>=20
> Install uefi-firmware-parser tool
>=20
> Signed-off-by: Tomasz =C5=BByjewski < tomasz.zyjewski@... >
> ---
> .../python/ python3-uefi-firmware_1.9.bb (
> http://python3-uefi-firmware_1.9.bb ) | 17 +++++++++++++++++
> 1 file changed, 17 insertions(+)
> create mode 100644 meta-python/recipes-devtools/python/ python3-uefi-firm=
ware_1.9.bb
> ( http://python3-uefi-firmware_1.9.bb )
>=20
> diff --git a/meta-python/recipes-devtools/python/ python3-uefi-firmware_1=
.9.bb
> ( http://python3-uefi-firmware_1.9.bb ) b/meta-python/recipes-devtools/py=
thon/
> python3-uefi-firmware_1.9.bb ( http://python3-uefi-firmware_1.9.bb )
> new file mode 100644
> index 000000000000..ba3124b36e60
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/ python3-uefi-firmware_1.9.bb (
> http://python3-uefi-firmware_1.9.bb )
> @@ -0,0 +1,17 @@
> +SUMMARY =3D "Various data structures and parsing tools for UEFI firmware=
."
> +DESCRIPTION =3D "This package contains Python UEFI firmware parser tool.
> The \
> +UEFI firmware parser is a simple module and set of scripts for parsing, =
\
>=20
> +extracting, and recreating UEFI firmware volumes. This includes parsing =
\
>=20
> +modules for BIOS, OptionROM, Intel ME and other formats too."
> +HOMEPAGE =3D " https://github.com/theopolis/uefi-firmware-parser "
> +AUTHOR =3D "Teddy Reed < teddy@... >"
> +LICENSE =3D "BSD-2-Clause & BSD-3-Clause"
> +LIC_FILES_CHKSUM =3D "file://setup.py;md5=3D90fa5bae1547550f1c1993f651ed=
a955"
>=20
> +
> +SRC_URI =3D " https://files.pythonhosted.org/packages/7e/b4/a4ec646d24a1=
aad709fdb83de6e5eddd6cb24faec02f3a94a3af3b0aba28/uefi_firmware-${PV}.tar.gz
> (
> https://files.pythonhosted.org/packages/7e/b4/a4ec646d24a1aad709fdb83de6e=
5eddd6cb24faec02f3a94a3af3b0aba28/uefi_firmware-$%7BPV%7D.tar.gz
> ) "

>=20
>=20
> If you=E2=80=99re fetching from =C2=A0pythonhosted, you could very likely=
 simplify the
> recipe by inheriting pypi bbclass
>=20
>=20

>=20
> +SRC_URI[md5sum] =3D "ee5011b4d0bcb0eb7c06295e0107894f"

>=20
>=20
> These days, we only really use the sha256sum
> +SRC_URI[sha256sum] =3D
> "234119dd92780c67cce3b664e86119c41d0b2af188d7f372b69789b32c5d5cd0" + +S =
=3D
> "${WORKDIR}/uefi_firmware-${PV}" + +inherit setuptools3 -- 2.25.1

Used git fetcher here, I just send PATCH V2, not sure if it visible on mail=
ing list.

--1LbIFoaUZCrlEPW8Dypg
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<blockquote>
<div class=3D"gmail_attr" dir=3D"ltr">On Fri, Nov 25, 2022 at 3:44 AM tomzy=
 &lt;<a href=3D"mailto:tomasz.zyjewski@..." target=3D"_blank" rel=3D"nofoll=
ow noopener">tomasz.zyjewski@...</a>&gt; wrote:</div>
</blockquote>
<blockquote class=3D"gmail_quote">Install uefi-firmware-parser tool<br /><b=
r />Signed-off-by: Tomasz =C5=BByjewski &lt;<a href=3D"mailto:tomasz.zyjews=
ki@..." target=3D"_blank" rel=3D"nofollow noopener">tomasz.zyjewski@...</a>=
&gt;<br />---<br />&nbsp;.../python/<a href=3D"http://python3-uefi-firmware=
_1.9.bb" target=3D"_blank" rel=3D"nofollow noopener">python3-uefi-firmware_=
1.9.bb</a>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;| 17 +++++++++++++++++<br />&nb=
sp;1 file changed, 17 insertions(+)<br />&nbsp;create mode 100644 meta-pyth=
on/recipes-devtools/python/<a href=3D"http://python3-uefi-firmware_1.9.bb" =
target=3D"_blank" rel=3D"nofollow noopener">python3-uefi-firmware_1.9.bb</a=
><br /><br />diff --git a/meta-python/recipes-devtools/python/<a href=3D"ht=
tp://python3-uefi-firmware_1.9.bb" target=3D"_blank" rel=3D"nofollow noopen=
er">python3-uefi-firmware_1.9.bb</a> b/meta-python/recipes-devtools/python/=
<a href=3D"http://python3-uefi-firmware_1.9.bb" target=3D"_blank" rel=3D"no=
follow noopener">python3-uefi-firmware_1.9.bb</a><br />new file mode 100644=
<br />index 000000000000..ba3124b36e60<br />--- /dev/null<br />+++ b/meta-p=
ython/recipes-devtools/python/<a href=3D"http://python3-uefi-firmware_1.9.b=
b" target=3D"_blank" rel=3D"nofollow noopener">python3-uefi-firmware_1.9.bb=
</a><br />@@ -0,0 +1,17 @@<br />+SUMMARY =3D "Various data structures and p=
arsing tools for UEFI firmware."<br />+DESCRIPTION =3D "This package contai=
ns Python UEFI firmware parser tool. The \<br />+UEFI firmware parser is a =
simple module and set of scripts for parsing, \<br />+extracting, and recre=
ating UEFI firmware volumes. This includes parsing \<br />+modules for BIOS=
, OptionROM, Intel ME and other formats too."<br />+HOMEPAGE =3D "<a href=
=3D"https://github.com/theopolis/uefi-firmware-parser" target=3D"_blank" re=
l=3D"nofollow noopener">https://github.com/theopolis/uefi-firmware-parser</=
a>"<br />+AUTHOR =3D "Teddy Reed &lt;<a href=3D"mailto:teddy@..." target=3D=
"_blank" rel=3D"nofollow noopener">teddy@...</a>&gt;"<br />+LICENSE =3D "BS=
D-2-Clause &amp; BSD-3-Clause"<br />+LIC_FILES_CHKSUM =3D "file://setup.py;=
md5=3D90fa5bae1547550f1c1993f651eda955"<br />+<br />+SRC_URI =3D "<a href=
=3D"https://files.pythonhosted.org/packages/7e/b4/a4ec646d24a1aad709fdb83de=
6e5eddd6cb24faec02f3a94a3af3b0aba28/uefi_firmware-$%7BPV%7D.tar.gz" target=
=3D"_blank" rel=3D"nofollow noopener">https://files.pythonhosted.org/packag=
es/7e/b4/a4ec646d24a1aad709fdb83de6e5eddd6cb24faec02f3a94a3af3b0aba28/uefi_=
firmware-${PV}.tar.gz</a>"</blockquote>
<blockquote>
<div>&nbsp;</div>
<div>If you&rsquo;re fetching from &nbsp;pythonhosted, you could very likel=
y simplify the recipe by inheriting pypi bbclass</div>
<div>&nbsp;</div>
</blockquote>
<blockquote class=3D"gmail_quote">+SRC_URI[md5sum] =3D "ee5011b4d0bcb0eb7c0=
6295e0107894f"</blockquote>
<blockquote>
<div>&nbsp;</div>
<div>These days, we only really use the sha256sum</div>
+SRC_URI[sha256sum] =3D "234119dd92780c67cce3b664e86119c41d0b2af188d7f372b6=
9789b32c5d5cd0" + +S =3D "${WORKDIR}/uefi_firmware-${PV}" + +inherit setupt=
ools3 -- 2.25.1</blockquote>
<br />Used git fetcher here, I just send PATCH V2, not sure if it visible o=
n mailing list.

--1LbIFoaUZCrlEPW8Dypg--

