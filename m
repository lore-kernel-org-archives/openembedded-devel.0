Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FB03E6B24A
	for <webhook@archiver.kernel.org>; Fri,  1 Nov 2024 12:01:55 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.web11.35880.1730462510587141254
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 01 Nov 2024 05:01:50 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd83.aul.t-online.de (fwd83.aul.t-online.de [10.223.144.109])
	by mailout03.t-online.de (Postfix) with SMTP id 983F8A82;
	Fri,  1 Nov 2024 13:01:46 +0100 (CET)
Received: from [192.168.178.67] ([84.154.160.37]) by fwd83.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1t6qLZ-1T05Ts0; Fri, 1 Nov 2024 13:01:45 +0100
Date: Fri, 01 Nov 2024 13:03:49 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-oe][PATCH v3] snapper: add recipe
To: Martin Jansa <martin.jansa@gmail.com>
Cc: raj.khem@gmail.com, openembedded-devel@lists.openembedded.org
Message-Id: <DIT9MS.I2UFW3U29ROC@t-online.de>
In-Reply-To: <1803C5E0EFB35EE5.1077@lists.openembedded.org>
References: <20241020150843.1068181-1-raj.khem@gmail.com>
	<CA+chaQcWf6gCEJbQX16zR=B3PUmaR78WCVorvrP4JvQsJAPDPw@mail.gmail.com>
	<JOE8MS.4DEF6FX7L6873@t-online.de>
	<18039C488E2C1344.6352@lists.openembedded.org>
	<CA+chaQevEQ2=G0Z0QG5FvZ4pSh0F7p-vOG69g1m95vQYPk364A@mail.gmail.com>
	<1803C5E0EFB35EE5.1077@lists.openembedded.org>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-N2j8SgYeLRs0ZvmFWPra"
X-TOI-EXPURGATEID: 150726::1730462505-767FA5DD-D4886E89/0/0 CLEAN NORMAL
X-TOI-MSGID: 15f21e4f-5119-4058-8567-4d2b6438f7a9
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 01 Nov 2024 12:01:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113381

--=-N2j8SgYeLRs0ZvmFWPra
Content-Type: text/plain; charset=iso-8859-13; format=flowed
Content-Transfer-Encoding: quoted-printable

I have now set up a multilib build environment to see exactly how that=20
works. If I haven't forgotten anything, it was easier than I thought. I=20
added the following to local.conf:

require conf/multilib.conf
MULTILIBS =3D =E2=80=9Cmultilib:lib32=E2=80=9D
DEFAULTTUNE:virtclass-multilib-lib32 =3D =E2=80=9Cx86=E2=80=9D
IMAGE_INSTALL:append =3D =E2=80=9C lib32-glibc lib32-libgcc lib32-libstdc++=
=20
snapper lib32-snapper=E2=80=9D

Then set FILES:${PN} like this:
FILES:${PN} +=3D =E2=80=9C${nonarch_libdir} ${systemd_system_unitdir}=20
${datadir}=E2=80=9D

And I was able to build core-image-minimal with both snapper and=20
lib32-snapper installed without facing any conflicts in do_rootfs



On Fri, Nov 1 2024 at 07:59:35 AM +01:00:00, Markus Volk=20
<f_l_k@t-online.de> wrote:
> On Thu, Oct 31 2024 at 11:45:59 PM +01:00:00, Martin Jansa=20
> <martin.jansa@gmail.com> wrote:
>> Not sure if this was worth it :).
>=20
> An easy way to hack this might also be something like this ?
>=20
> # Did this just for testing purpose
> export nonarch_libdir =3D "/usr/lib32"
>=20
> do_install:append() {
>  if [ ! "${libdir}" =3D "${nonarch_libdir}" ]; then mkdir=20
> ${D}${nonarch_libdir};mv ${D}${libdir}/snapper=20
> ${D}${nonarch_libdir}/snapper; fi
> }
>=20
>=20
> FILES:${PN} +=3D "${nonarch_libdir}/snapper ${libdir}/pam_snapper=20
> ${systemd_system_unitdir} ${libdir}/security ${datadir}"
>=20
> Since I'm not building multilib, I just did an export for=20
> nonarch_libdir to have a difference here for testing. Kind of seemed=20
> to work.
> The 'mkdir' command is probably  only needed in my testcase, because=20
> if building multilib the ${D}${nonarch_libdir} directory is=20
> presumably already present
>=20
> Not pretty but eventually less maintainance than a patch


--=-N2j8SgYeLRs0ZvmFWPra
Content-Type: text/html; charset=iso-8859-13
Content-Transfer-Encoding: quoted-printable

<div id=3D"geary-body" dir=3D"auto"><div><div>I have now set up a multilib =
build environment to see exactly how that works. If I haven't forgotten any=
thing, it was easier than I thought. I added the following to local.conf:</=
div><div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</div><div>require conf=
/multilib.conf</div><div>MULTILIBS =3D =E2=80=9Cmultilib:lib32=E2=80=9D</di=
v><div>DEFAULTTUNE:virtclass-multilib-lib32 =3D =E2=80=9Cx86=E2=80=9D</div>=
<div>IMAGE_INSTALL:append =3D =E2=80=9C lib32-glibc lib32-libgcc lib32-libs=
tdc++ snapper lib32-snapper=E2=80=9D</div><div><br></div><div>Then set FILE=
S:${PN} like this:</div><div>FILES:${PN} +=3D =E2=80=9C${nonarch_libdir} ${=
systemd_system_unitdir} ${datadir}=E2=80=9D</div><div><br></div><div>And I =
was able to build core-image-minimal with both snapper and lib32-snapper in=
stalled without facing any conflicts in do_rootfs</div></div><div><br></div=
><div><br></div></div><div id=3D"geary-quote" dir=3D"auto"><br>On Fri, Nov =
1 2024 at 07:59:35 AM +01:00:00, Markus Volk &lt;f_l_k@t-online.de&gt; wrot=
e:<br><blockquote type=3D"cite"><div id=3D"geary-body" dir=3D"auto">On Thu,=
 Oct 31 2024 at 11:45:59 PM +01:00:00, Martin Jansa &lt;martin.jansa@gmail.=
com&gt; wrote:<br><blockquote type=3D"cite"><div class=3D"plaintext" style=
=3D"white-space: break-spaces;">Not sure if this was worth it :).</div></bl=
ockquote><div><br></div><div>An easy way to hack this might also be somethi=
ng like this ?</div><div><br></div><div># Did this just for testing purpose=
</div><div>export nonarch_libdir =3D "/usr/lib32"</div><div><br></div><div>=
do_install:append() {</div><div>&nbsp;if [ ! "${libdir}" =3D "${nonarch_lib=
dir}" ]; then mkdir ${D}${nonarch_libdir};mv ${D}${libdir}/snapper ${D}${no=
narch_libdir}/snapper; fi</div><div>}</div><div><br></div><div><br></div><d=
iv>FILES:${PN} +=3D "${nonarch_libdir}/snapper ${libdir}/pam_snapper ${syst=
emd_system_unitdir} ${libdir}/security ${datadir}"</div><div><br></div><div=
><div>Since I'm not building multilib, I just did an export for nonarch_lib=
dir to have a difference here for testing. Kind of seemed to work.</div><di=
v>The 'mkdir' command is probably &nbsp;only needed in my testcase, because=
 if building multilib the ${D}${nonarch_libdir} directory is presumably alr=
eady present</div></div><div><br></div><div>Not pretty but eventually less =
maintainance than a patch</div></div>
</blockquote></div>
--=-N2j8SgYeLRs0ZvmFWPra--


