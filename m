Subject: Re: [meta-oe][PATCH v2] minifi: Add recipe for c++ version
To: openembedded-devel@lists.openembedded.org
From: "wonjong.lee" <wonjong.lee@windriver.com>
X-Originating-Location: KR (61.107.31.52)
X-Originating-Platform: Windows Chrome 84
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 30 Jul 2020 04:24:19 -0700
References: <fe9266ec-3367-c805-a892-0c8eb905b78e@gmail.com>
In-Reply-To: <fe9266ec-3367-c805-a892-0c8eb905b78e@gmail.com>
Message-ID: <19585.1596108259119805059@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="NEBU7pihUOn3JCisTy8M"

--NEBU7pihUOn3JCisTy8M
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

I fixed build issues for mips and ppc machine.
But there is runtime issue on mips and ppc machine.
The nifi cannot receive data from the minifi, when the minifi is running a=
t mips or ppc, and the nifi is running at x86.
So I'd like to block build for both machines and post a patch like below.
Would it be okay?

COMPATIBLE_MACHINE_mips =3D "(!.*mips).*"
COMPATIBLE_MACHINE_mips64 =3D "(!.*mips64).*"
COMPATIBLE_MACHINE_powerpc =3D "(!.*ppc).*"

--NEBU7pihUOn3JCisTy8M
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

I fixed build issues for mips and ppc machine.<br />But there is runtime is=
sue on mips and ppc machine.<br />The nifi cannot receive data from the min=
ifi, when the minifi is running at mips or ppc, and the nifi is running at =
x86.<br />So I'd like to block build for both machines and post a patch lik=
e below.<br />Would it be okay?<br /><br />
<div>COMPATIBLE_MACHINE_mips =3D "(!.*mips).*"</div>
<div>COMPATIBLE_MACHINE_mips64 =3D "(!.*mips64).*"</div>
<div>COMPATIBLE_MACHINE_powerpc =3D "(!.*ppc).*"</div>

--NEBU7pihUOn3JCisTy8M--
