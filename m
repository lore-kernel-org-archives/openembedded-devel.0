Return-Path: <tomasz.zyjewski@3mdeb.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFB7EC4332F
	for <webhook@archiver.kernel.org>; Mon,  5 Dec 2022 08:46:23 +0000 (UTC)
Subject: Re: [meta-python][PATCH V3 1/2] python3-binwalk: add recipe for version 2.3.3
To: openembedded-devel@lists.openembedded.org
From: "tomzy" <tomasz.zyjewski@3mdeb.com>
X-Originating-Location: Warsaw, Mazovia, PL (84.10.27.202)
X-Originating-Platform: Linux Firefox 107
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Mon, 05 Dec 2022 00:46:18 -0800
References: <CAMKF1spLpKLY9=4sTeesFJtarUm2hzQ34-VpQT=dXQwK6_VkKA@mail.gmail.com>
In-Reply-To: <CAMKF1spLpKLY9=4sTeesFJtarUm2hzQ34-VpQT=dXQwK6_VkKA@mail.gmail.com>
Message-ID: <9820.1670229978687823065@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="hik29u2y0QmWH9FJf1xA"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 05 Dec 2022 08:46:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99951

--hik29u2y0QmWH9FJf1xA
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 2, 2022 at 05:50 PM, Khem Raj wrote:

>=20
> On Thu, Dec 1, 2022 at 10:49 PM tomzy <tomasz.zyjewski@3mdeb.com> wrote:
>=20
>> On Thu, Dec 1, 2022 at 07:43 PM, Khem Raj wrote:
>>=20
>> Can you rebase these patches on top of master or master-next and
>> resend v3 please ?
>>=20
>> I can but isn't it already merged in master?
>>=20
>> https://git.openembedded.org/meta-openembedded/commit/?id=3D7ea0e04aaee1=
9f61e18bf998bb07f02e52d8146e
>>=20
>=20
> It is, thats why I am asking for an incremental patch on top of what is
> merged.

Hi, sorry I am not sure what you mean here. Did you want me to rebase the s=
econd change and resend as V3?

Something like this? https://lists.openembedded.org/g/openembedded-devel/me=
ssage/99950

>=20
>=20
>=20
>> On Thu, Dec 1, 2022 at 12:35 AM tomzy <tomasz.zyjewski@3mdeb.com> wrote:
>>=20
>> Install binwalk utility.
>>=20
>> Binwalk is a fast, easy to use tool for analyzing, reverse engineering,
>> and extracting firmware images.
>>=20
>> Signed-off-by: Tomasz =C5=BByjewski <tomasz.zyjewski@3mdeb.com>
>> ---
>> .../python/python3-binwalk_2.3.3.bb | 17 +++++++++++++++++
>> 1 file changed, 17 insertions(+)
>> create mode 100644
>> meta-python/recipes-devtools/python/python3-binwalk_2.3.3.bb
>>=20
>> diff --git a/meta-python/recipes-devtools/python/python3-binwalk_2.3.3.b=
b
>> b/meta-python/recipes-devtools/python/python3-binwalk_2.3.3.bb
>> new file mode 100644
>> index 000000000000..362efa275148
>> --- /dev/null
>> +++ b/meta-python/recipes-devtools/python/python3-binwalk_2.3.3.bb
>> @@ -0,0 +1,17 @@
>> +SUMMARY =3D "Firmware analysis tool"
>> +DESCRIPTION =3D "This package contains Python Binwalk tool. Binwalk is =
a
>> fast, \
>> +easy to use tool for analyzing, reverse engineering, and extracting
>> firmware \
>> +images."
>> +HOMEPAGE =3D " https://github.com/ReFirmLabs/binwalk"
>> +LICENSE =3D "MIT"
>> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D65bbee055d3ea3bfc475f07aecf4=
de64"
>> +
>> +SRC_URI =3D
>> "git://github.com/ReFirmLabs/binwalk;protocol=3Dhttps;branch=3Dmaster"
>> +
>> +SRCREV =3D "fa0c0bd59b8588814756942fe4cb5452e76c1dcd"
>> +
>> +S =3D "${WORKDIR}/git"
>> +
>> +inherit setuptools3
>> +
>> +RDEPENDS:${PN} +=3D "python3-core"
>> --
>> 2.25.1
>>=20
>>=20
>>=20
>=20
>

--hik29u2y0QmWH9FJf1xA
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 2, 2022 at 05:50 PM, Khem Raj wrote:<br />
<blockquote>On Thu, Dec 1, 2022 at 10:49 PM tomzy &lt;tomasz.zyjewski@3mdeb=
.com&gt; wrote:<br />
<blockquote>On Thu, Dec 1, 2022 at 07:43 PM, Khem Raj wrote:<br /><br />Can=
 you rebase these patches on top of master or master-next and<br />resend v=
3 please ?<br /><br />I can but isn't it already merged in master?<br /><br=
 /><a href=3D"https://git.openembedded.org/meta-openembedded/commit/?id=3D7=
ea0e04aaee19f61e18bf998bb07f02e52d8146e" target=3D"_blank" rel=3D"noopener"=
>https://git.openembedded.org/meta-openembedded/commit/?id=3D7ea0e04aaee19f=
61e18bf998bb07f02e52d8146e</a></blockquote>
It is, thats why I am asking for an incremental patch on top of what is mer=
ged.</blockquote>
<p>Hi, sorry I am not sure what you mean here. Did you want me to rebase th=
e second change and resend as V3?</p>
<p>Something like this? https://lists.openembedded.org/g/openembedded-devel=
/message/99950</p>
<blockquote><br />
<blockquote>On Thu, Dec 1, 2022 at 12:35 AM tomzy &lt;tomasz.zyjewski@3mdeb=
.com&gt; wrote:<br /><br />Install binwalk utility.<br /><br />Binwalk is a=
 fast, easy to use tool for analyzing, reverse engineering,<br />and extrac=
ting firmware images.<br /><br />Signed-off-by: Tomasz =C5=BByjewski &lt;to=
masz.zyjewski@3mdeb.com&gt;<br />---<br />.../python/python3-binwalk_2.3.3.=
bb | 17 +++++++++++++++++<br />1 file changed, 17 insertions(+)<br />create=
 mode 100644 meta-python/recipes-devtools/python/python3-binwalk_2.3.3.bb<b=
r /><br />diff --git a/meta-python/recipes-devtools/python/python3-binwalk_=
2.3.3.bb b/meta-python/recipes-devtools/python/python3-binwalk_2.3.3.bb<br =
/>new file mode 100644<br />index 000000000000..362efa275148<br />--- /dev/=
null<br />+++ b/meta-python/recipes-devtools/python/python3-binwalk_2.3.3.b=
b<br />@@ -0,0 +1,17 @@<br />+SUMMARY =3D "Firmware analysis tool"<br />+DE=
SCRIPTION =3D "This package contains Python Binwalk tool. Binwalk is a fast=
, \<br />+easy to use tool for analyzing, reverse engineering, and extracti=
ng firmware \<br />+images."<br />+HOMEPAGE =3D "<a href=3D"https://github.=
com/ReFirmLabs/binwalk&quot;" target=3D"_blank" rel=3D"noopener">https://gi=
thub.com/ReFirmLabs/binwalk"</a><br />+LICENSE =3D "MIT"<br />+LIC_FILES_CH=
KSUM =3D "file://LICENSE;md5=3D65bbee055d3ea3bfc475f07aecf4de64"<br />+<br =
/>+SRC_URI =3D "git://github.com/ReFirmLabs/binwalk;protocol=3Dhttps;branch=
=3Dmaster"<br />+<br />+SRCREV =3D "fa0c0bd59b8588814756942fe4cb5452e76c1dc=
d"<br />+<br />+S =3D "${WORKDIR}/git"<br />+<br />+inherit setuptools3<br =
/>+<br />+RDEPENDS:${PN} +=3D "python3-core"<br />--<br />2.25.1<br /><br /=
><br /></blockquote>
</blockquote>

--hik29u2y0QmWH9FJf1xA--

