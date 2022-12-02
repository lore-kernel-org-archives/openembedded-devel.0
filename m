Return-Path: <tomasz.zyjewski@3mdeb.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 060D7C4332F
	for <webhook@archiver.kernel.org>; Fri,  2 Dec 2022 06:49:00 +0000 (UTC)
Subject: Re: [meta-python][PATCH V3 1/2] python3-binwalk: add recipe for version 2.3.3
To: openembedded-devel@lists.openembedded.org
From: "tomzy" <tomasz.zyjewski@3mdeb.com>
X-Originating-Location: Warsaw, Mazovia, PL (84.10.27.202)
X-Originating-Platform: Linux Firefox 107
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 01 Dec 2022 22:48:58 -0800
References: <CAMKF1srPUdH=DigZ_4c-jFYjAcfzJEw2jTMMdQVfKkYvSSgxwA@mail.gmail.com>
In-Reply-To: <CAMKF1srPUdH=DigZ_4c-jFYjAcfzJEw2jTMMdQVfKkYvSSgxwA@mail.gmail.com>
Message-ID: <4965.1669963738713807357@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="tsSwgghseLp45SAgnvbB"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 02 Dec 2022 06:49:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99908

--tsSwgghseLp45SAgnvbB
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 1, 2022 at 07:43 PM, Khem Raj wrote:

>=20
> Can you rebase these patches on top of master or master-next and
> resend v3 please ?

I can but isn't it already merged in master?

https://git.openembedded.org/meta-openembedded/commit/?id=3D7ea0e04aaee19f6=
1e18bf998bb07f02e52d8146e

>=20
> On Thu, Dec 1, 2022 at 12:35 AM tomzy <tomasz.zyjewski@3mdeb.com> wrote:
>=20
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
>=20
>

--tsSwgghseLp45SAgnvbB
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 1, 2022 at 07:43 PM, Khem Raj wrote:<br />
<blockquote>Can you rebase these patches on top of master or master-next an=
d<br />resend v3 please ?</blockquote>
<p>I can but isn't it already merged in master?</p>
<p>https://git.openembedded.org/meta-openembedded/commit/?id=3D7ea0e04aaee1=
9f61e18bf998bb07f02e52d8146e</p>
<blockquote>On Thu, Dec 1, 2022 at 12:35 AM tomzy &lt;tomasz.zyjewski@3mdeb=
.com&gt; wrote:<br />
<blockquote>Install binwalk utility.<br /><br />Binwalk is a fast, easy to =
use tool for analyzing, reverse engineering,<br />and extracting firmware i=
mages.<br /><br />Signed-off-by: Tomasz =C5=BByjewski &lt;tomasz.zyjewski@3=
mdeb.com&gt;<br />---<br />.../python/python3-binwalk_2.3.3.bb | 17 +++++++=
++++++++++<br />1 file changed, 17 insertions(+)<br />create mode 100644 me=
ta-python/recipes-devtools/python/python3-binwalk_2.3.3.bb<br /><br />diff =
--git a/meta-python/recipes-devtools/python/python3-binwalk_2.3.3.bb b/meta=
-python/recipes-devtools/python/python3-binwalk_2.3.3.bb<br />new file mode=
 100644<br />index 000000000000..362efa275148<br />--- /dev/null<br />+++ b=
/meta-python/recipes-devtools/python/python3-binwalk_2.3.3.bb<br />@@ -0,0 =
+1,17 @@<br />+SUMMARY =3D "Firmware analysis tool"<br />+DESCRIPTION =3D "=
This package contains Python Binwalk tool. Binwalk is a fast, \<br />+easy =
to use tool for analyzing, reverse engineering, and extracting firmware \<b=
r />+images."<br />+HOMEPAGE =3D "<a href=3D"https://github.com/ReFirmLabs/=
binwalk&quot;" target=3D"_blank" rel=3D"noopener">https://github.com/ReFirm=
Labs/binwalk"</a><br />+LICENSE =3D "MIT"<br />+LIC_FILES_CHKSUM =3D "file:=
//LICENSE;md5=3D65bbee055d3ea3bfc475f07aecf4de64"<br />+<br />+SRC_URI =3D =
"git://github.com/ReFirmLabs/binwalk;protocol=3Dhttps;branch=3Dmaster"<br /=
>+<br />+SRCREV =3D "fa0c0bd59b8588814756942fe4cb5452e76c1dcd"<br />+<br />=
+S =3D "${WORKDIR}/git"<br />+<br />+inherit setuptools3<br />+<br />+RDEPE=
NDS:${PN} +=3D "python3-core"<br />--<br />2.25.1<br /><br /></blockquote>
</blockquote>

--tsSwgghseLp45SAgnvbB--

