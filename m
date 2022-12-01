Return-Path: <tomasz.zyjewski@3mdeb.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83699C43217
	for <webhook@archiver.kernel.org>; Thu,  1 Dec 2022 08:37:50 +0000 (UTC)
Subject: Re: [meta-python][PATCH 2/2] python3-uefi-firmware: add recipe for version 1.9
To: openembedded-devel@lists.openembedded.org
From: "tomzy" <tomasz.zyjewski@3mdeb.com>
X-Originating-Location: Warsaw, Mazovia, PL (84.10.27.202)
X-Originating-Platform: Linux Firefox 107
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 01 Dec 2022 00:37:40 -0800
References: <61866268-84e1-7ad5-5992-f78281e1bb3a@gmail.com>
In-Reply-To: <61866268-84e1-7ad5-5992-f78281e1bb3a@gmail.com>
Message-ID: <13060.1669883860311865393@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="CD643M5BN7ZCleM5crsT"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 01 Dec 2022 08:37:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99884

--CD643M5BN7ZCleM5crsT
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 30, 2022 at 09:08 PM, Khem Raj wrote:

>=20
> On 11/29/22 11:29 PM, tomzy wrote:
>=20
>> On Fri, Nov 25, 2022 at 3:44 AM tomzy <tomasz.zyjewski@...
>> <mailto:tomasz.zyjewski@...>> wrote:
>>=20
>> Install uefi-firmware-parser tool
>>=20
>> Signed-off-by: Tomasz =C5=BByjewski <tomasz.zyjewski@...
>> <mailto:tomasz.zyjewski@...>>
>> ---
>> .../python/python3-uefi-firmware_1.9.bb
>> < http://python3-uefi-firmware_1.9.bb >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 17 +++++++++++++++++
>> 1 file changed, 17 insertions(+)
>> create mode 100644
>> meta-python/recipes-devtools/python/python3-uefi-firmware_1.9.bb
>> < http://python3-uefi-firmware_1.9.bb >
>>=20
>> diff --git
>> a/meta-python/recipes-devtools/python/python3-uefi-firmware_1.9.bb
>> < http://python3-uefi-firmware_1.9.bb >
>> b/meta-python/recipes-devtools/python/python3-uefi-firmware_1.9.bb
>> < http://python3-uefi-firmware_1.9.bb >
>> new file mode 100644
>> index 000000000000..ba3124b36e60
>> --- /dev/null
>> +++
>> b/meta-python/recipes-devtools/python/python3-uefi-firmware_1.9.bb
>> < http://python3-uefi-firmware_1.9.bb >
>> @@ -0,0 +1,17 @@
>> +SUMMARY =3D "Various data structures and parsing tools for UEFI
>> firmware."
>> +DESCRIPTION =3D "This package contains Python UEFI firmware parser
>> tool. The \
>> +UEFI firmware parser is a simple module and set of scripts for
>> parsing, \
>> +extracting, and recreating UEFI firmware volumes. This includes
>> parsing \
>> +modules for BIOS, OptionROM, Intel ME and other formats too."
>> +HOMEPAGE =3D " https://github.com/theopolis/uefi-firmware-parser
>> < https://github.com/theopolis/uefi-firmware-parser>"
>> +AUTHOR =3D "Teddy Reed <teddy@... <mailto:teddy@...>>"
>> +LICENSE =3D "BSD-2-Clause & BSD-3-Clause"
>> +LIC_FILES_CHKSUM =3D
>> "file://setup.py;md5=3D90fa5bae1547550f1c1993f651eda955"
>> +
>> +SRC_URI =3D
>> " https://files.pythonhosted.org/packages/7e/b4/a4ec646d24a1aad709fdb83d=
e6e5eddd6cb24faec02f3a94a3af3b0aba28/uefi_firmware-
>> ${PV}.tar.gz < https://files.pythonhosted.org/packages/7e/b4/a4ec646d24a=
1aad709fdb83de6e5eddd6cb24faec02f3a94a3af3b0aba28/uefi_firmware-
>> $%7BPV%7D.tar.gz>"
>>=20
>> If you=E2=80=99re fetching from =C2=A0pythonhosted, you could very likel=
y
>> simplify the recipe by inheriting pypi bbclass
>>=20
>> +SRC_URI[md5sum] =3D "ee5011b4d0bcb0eb7c06295e0107894f"
>>=20
>> These days, we only really use the sha256sum
>> +SRC_URI[sha256sum] =3D
>> "234119dd92780c67cce3b664e86119c41d0b2af188d7f372b69789b32c5d5cd0" +
>> +S =3D "${WORKDIR}/uefi_firmware-${PV}" + +inherit setuptools3 -- 2.25.1
>>=20
>>=20
>> Used git fetcher here, I just send PATCH V2, not sure if it visible on
>> mailing list.
>=20
> Its not. Where did you send it ?

I must had something wrong with my email settings. Now it is sent. Just pus=
hed V3 because of typo in subject-prefix.

uefi-firmware: https://lists.openembedded.org/g/openembedded-devel/message/=
99883

binwalk: https://lists.openembedded.org/g/openembedded-devel/message/99882

--CD643M5BN7ZCleM5crsT
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 30, 2022 at 09:08 PM, Khem Raj wrote:<br />
<blockquote>On 11/29/22 11:29 PM, tomzy wrote:<br />
<blockquote>On Fri, Nov 25, 2022 at 3:44 AM tomzy &lt;tomasz.zyjewski@...<b=
r />&lt;mailto:tomasz.zyjewski@...&gt;&gt; wrote:<br /><br />Install uefi-f=
irmware-parser tool<br /><br />Signed-off-by: Tomasz =C5=BByjewski &lt;toma=
sz.zyjewski@...<br />&lt;mailto:tomasz.zyjewski@...&gt;&gt;<br />---<br />&=
nbsp;.../python/python3-uefi-firmware_1.9.bb<br />&lt;<a href=3D"http://pyt=
hon3-uefi-firmware_1.9.bb" target=3D"_blank" rel=3D"noopener">http://python=
3-uefi-firmware_1.9.bb</a>&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;| 17 ++++++=
+++++++++++<br />&nbsp;1 file changed, 17 insertions(+)<br />&nbsp;create m=
ode 100644<br />meta-python/recipes-devtools/python/python3-uefi-firmware_1=
.9.bb<br />&lt;<a href=3D"http://python3-uefi-firmware_1.9.bb" target=3D"_b=
lank" rel=3D"noopener">http://python3-uefi-firmware_1.9.bb</a>&gt;<br /><br=
 />diff --git<br />a/meta-python/recipes-devtools/python/python3-uefi-firmw=
are_1.9.bb<br />&lt;<a href=3D"http://python3-uefi-firmware_1.9.bb" target=
=3D"_blank" rel=3D"noopener">http://python3-uefi-firmware_1.9.bb</a>&gt;<br=
 />b/meta-python/recipes-devtools/python/python3-uefi-firmware_1.9.bb<br />=
&lt;<a href=3D"http://python3-uefi-firmware_1.9.bb" target=3D"_blank" rel=
=3D"noopener">http://python3-uefi-firmware_1.9.bb</a>&gt;<br />new file mod=
e 100644<br />index 000000000000..ba3124b36e60<br />--- /dev/null<br />+++<=
br />b/meta-python/recipes-devtools/python/python3-uefi-firmware_1.9.bb<br =
/>&lt;<a href=3D"http://python3-uefi-firmware_1.9.bb" target=3D"_blank" rel=
=3D"noopener">http://python3-uefi-firmware_1.9.bb</a>&gt;<br />@@ -0,0 +1,1=
7 @@<br />+SUMMARY =3D "Various data structures and parsing tools for UEFI<=
br />firmware."<br />+DESCRIPTION =3D "This package contains Python UEFI fi=
rmware parser<br />tool. The \<br />+UEFI firmware parser is a simple modul=
e and set of scripts for<br />parsing, \<br />+extracting, and recreating U=
EFI firmware volumes. This includes<br />parsing \<br />+modules for BIOS, =
OptionROM, Intel ME and other formats too."<br />+HOMEPAGE =3D "<a href=3D"=
https://github.com/theopolis/uefi-firmware-parser" target=3D"_blank" rel=3D=
"noopener">https://github.com/theopolis/uefi-firmware-parser</a><br />&lt;<=
a href=3D"https://github.com/theopolis/uefi-firmware-parser&gt;&quot;" targ=
et=3D"_blank" rel=3D"noopener">https://github.com/theopolis/uefi-firmware-p=
arser&gt;"</a><br />+AUTHOR =3D "Teddy Reed &lt;teddy@... &lt;mailto:teddy@=
...&gt;&gt;"<br />+LICENSE =3D "BSD-2-Clause &amp; BSD-3-Clause"<br />+LIC_=
FILES_CHKSUM =3D<br />"file://setup.py;md5=3D90fa5bae1547550f1c1993f651eda9=
55"<br />+<br />+SRC_URI =3D<br />"<a href=3D"https://files.pythonhosted.or=
g/packages/7e/b4/a4ec646d24a1aad709fdb83de6e5eddd6cb24faec02f3a94a3af3b0aba=
28/uefi_firmware-" target=3D"_blank" rel=3D"noopener">https://files.pythonh=
osted.org/packages/7e/b4/a4ec646d24a1aad709fdb83de6e5eddd6cb24faec02f3a94a3=
af3b0aba28/uefi_firmware-</a>${PV}.tar.gz &lt;<a href=3D"https://files.pyth=
onhosted.org/packages/7e/b4/a4ec646d24a1aad709fdb83de6e5eddd6cb24faec02f3a9=
4a3af3b0aba28/uefi_firmware-" target=3D"_blank" rel=3D"noopener">https://fi=
les.pythonhosted.org/packages/7e/b4/a4ec646d24a1aad709fdb83de6e5eddd6cb24fa=
ec02f3a94a3af3b0aba28/uefi_firmware-</a>$%7BPV%7D.tar.gz&gt;"<br /><br />If=
 you&rsquo;re fetching from &nbsp;pythonhosted, you could very likely<br />=
simplify the recipe by inheriting pypi bbclass<br /><br />+SRC_URI[md5sum] =
=3D "ee5011b4d0bcb0eb7c06295e0107894f"<br /><br />These days, we only reall=
y use the sha256sum<br />+SRC_URI[sha256sum] =3D<br />"234119dd92780c67cce3=
b664e86119c41d0b2af188d7f372b69789b32c5d5cd0" +<br />+S =3D "${WORKDIR}/uef=
i_firmware-${PV}" + +inherit setuptools3 -- 2.25.1<br /><br /><br />Used gi=
t fetcher here, I just send PATCH V2, not sure if it visible on <br />maili=
ng list.</blockquote>
Its not. Where did you send it ?</blockquote>
<p>I must had something wrong with my email settings. Now it is sent. Just =
pushed V3 because of typo in subject-prefix.</p>
<p>uefi-firmware: <a href=3D"https://lists.openembedded.org/g/openembedded-=
devel/message/99883" target=3D"_blank" rel=3D"noopener">https://lists.opene=
mbedded.org/g/openembedded-devel/message/99883</a></p>
<p>binwalk: https://lists.openembedded.org/g/openembedded-devel/message/998=
82</p>

--CD643M5BN7ZCleM5crsT--

