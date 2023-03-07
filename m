Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1D85C61DA4
	for <webhook@archiver.kernel.org>; Tue,  7 Mar 2023 02:53:11 +0000 (UTC)
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.web10.6059.1678157581691596118
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Mar 2023 18:53:02 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.17, mailfrom: f_l_k@t-online.de)
Received: from fwd72.dcpf.telekom.de (fwd72.aul.t-online.de [10.223.144.98])
	by mailout02.t-online.de (Postfix) with SMTP id CF5AE141E6;
	Tue,  7 Mar 2023 03:52:59 +0100 (CET)
Received: from [192.168.178.83] ([79.219.228.81]) by fwd72.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pZNRg-4cDiBk0; Tue, 7 Mar 2023 03:52:56 +0100
Date: Tue, 07 Mar 2023 03:52:51 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-multimedia][PATCH 1/2] dav1d: add recipe
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Message-Id: <3OQ4RR.F8AMU7SIB9G4@t-online.de>
In-Reply-To: 
	<CAMKF1sognPcfw0+iNwjSmc2DBJHordHgZu0i8MZnnYzauqyfyg@mail.gmail.com>
References: <20230307020508.3897850-1-f_l_k@t-online.de>
	<CAMKF1sognPcfw0+iNwjSmc2DBJHordHgZu0i8MZnnYzauqyfyg@mail.gmail.com>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-zwx9JBvY1c+R2AUGSp8n"
X-TOI-EXPURGATEID: 150726::1678157576-82AE9D99-874A76EC/0/0 CLEAN NORMAL
X-TOI-MSGID: ec35d4f2-41de-4b44-bad1-e4117d0879ac
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Mar 2023 02:53:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101405

--=-zwx9JBvY1c+R2AUGSp8n
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Thanks

Am Mo, 6. M=C3=A4r 2023 um 18:43:02 -0800 schrieb Khem Raj=20
<raj.khem@gmail.com>:
> On Mon, Mar 6, 2023 at 6:05=E2=80=AFPM Markus Volk <f_l_k@t-online.de=20
> <mailto:f_l_k@t-online.de>> wrote:
>>=20
>>  Signed-off-by: Markus Volk <f_l_k@t-online.de=20
>> <mailto:f_l_k@t-online.de>>
>>  ---
>>   .../recipes-multimedia/dav1d/dav1d_1.1.0.bb   | 19=20
>> +++++++++++++++++++
>>   1 file changed, 19 insertions(+)
>>   create mode 100644=20
>> meta-multimedia/recipes-multimedia/dav1d/dav1d_1.1.0.bb
>>=20
>>  diff --git=20
>> a/meta-multimedia/recipes-multimedia/dav1d/dav1d_1.1.0.bb=20
>> b/meta-multimedia/recipes-multimedia/dav1d/dav1d_1.1.0.bb
>>  new file mode 100644
>>  index 000000000..eadc660c7
>>  --- /dev/null
>>  +++ b/meta-multimedia/recipes-multimedia/dav1d/dav1d_1.1.0.bb
>>  @@ -0,0 +1,19 @@
>>  +SUMMARY =3D "dav1d AV1 decoder"
>>  +DESCRIPTION =3D "Targeted to be small, portable and fast."
>>  +HOMEPAGE =3D "<https://code.videolan.org/videolan/dav1d>"
>>  +SECTION =3D "multimedia"
>>  +LICENSE =3D "BSD-2-Clause"
>>  +
>>  +LIC_FILES_CHKSUM =3D=20
>> "file://COPYING;md5=3Dc8055cfe7548dfdaa3a6dc45d8793669"=20
>> <file://copying;md5=3Dc8055cfe7548dfdaa3a6dc45d8793669/>
>>  +
>>  +SRC_URI =3D=20
>> "git://code.videolan.org/videolan/dav1d.git;protocol=3Dhttps;branch=3Dma=
ster"
>>  +PV =3D "1.1.0"
>=20
> this is redundant
>=20
>>  +SRCREV =3D "9593e625b75d498d1edea544da21ea764b98d507"
>>  +
>>  +S =3D "${WORKDIR}/git"
>>  +
>>  +DEPENDS:x86 =3D "nasm-native"
>>  +DEPENDS:x86-64 =3D "nasm-native"
>>  +
> use :append
>=20
>>  +inherit meson
>>  +
>>  --
>>  2.34.1
>>=20
>>=20
>>=20
>>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#101403):=20
> <https://lists.openembedded.org/g/openembedded-devel/message/101403>
> Mute This Topic: <https://lists.openembedded.org/mt/97441321/3618223>
> Group Owner: openembedded-devel+owner@lists.openembedded.org=20
> <mailto:openembedded-devel+owner@lists.openembedded.org>
> Unsubscribe:=20
> <https://lists.openembedded.org/g/openembedded-devel/unsub>=20
> [f_l_k@t-online.de <mailto:f_l_k@t-online.de>]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


--=-zwx9JBvY1c+R2AUGSp8n
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div id=3D"geary-body" dir=3D"auto"><div>Thanks</div></div><div id=3D"geary=
-quote" dir=3D"auto"><br>Am Mo, 6. M=C3=A4r 2023 um 18:43:02 -0800 schrieb =
Khem Raj &lt;raj.khem@gmail.com&gt;:<br><blockquote type=3D"cite"><div clas=
s=3D"plaintext" style=3D"white-space: break-spaces;">On Mon, Mar 6, 2023 at=
 6:05=E2=80=AFPM Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de">f_l_k=
@t-online.de</a>&gt; wrote:
<blockquote>
 Signed-off-by: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de">f_l_k@=
t-online.de</a>&gt;
 ---
  .../recipes-multimedia/dav1d/dav1d_1.1.0.bb   | 19 +++++++++++++++++++
  1 file changed, 19 insertions(+)
  create mode 100644 meta-multimedia/recipes-multimedia/dav1d/dav1d_1.1.0.b=
b

 diff --git a/meta-multimedia/recipes-multimedia/dav1d/dav1d_1.1.0.bb b/met=
a-multimedia/recipes-multimedia/dav1d/dav1d_1.1.0.bb
 new file mode 100644
 index 000000000..eadc660c7
 --- /dev/null
 +++ b/meta-multimedia/recipes-multimedia/dav1d/dav1d_1.1.0.bb
 @@ -0,0 +1,19 @@
 +SUMMARY =3D "dav1d AV1 decoder"
 +DESCRIPTION =3D "Targeted to be small, portable and fast."
 +HOMEPAGE =3D "<a href=3D"https://code.videolan.org/videolan/dav1d">https:=
//code.videolan.org/videolan/dav1d</a>"
 +SECTION =3D "multimedia"
 +LICENSE =3D "BSD-2-Clause"
 +
 +LIC_FILES_CHKSUM =3D "<a href=3D"file://COPYING;md5=3Dc8055cfe7548dfdaa3a=
6dc45d8793669" "=3D"">file://COPYING;md5=3Dc8055cfe7548dfdaa3a6dc45d8793669=
"</a>
 +
 +SRC_URI =3D "git://code.videolan.org/videolan/dav1d.git;protocol=3Dhttps;=
branch=3Dmaster"
 +PV =3D "1.1.0"
</blockquote>
this is redundant

<blockquote> +SRCREV =3D "9593e625b75d498d1edea544da21ea764b98d507"
 +
 +S =3D "${WORKDIR}/git"
 +
 +DEPENDS:x86 =3D "nasm-native"
 +DEPENDS:x86-64 =3D "nasm-native"
 +
</blockquote>use :append

<blockquote> +inherit meson
 +
 --
 2.34.1


=20

</blockquote></div><div class=3D"plaintext" style=3D"white-space: break-spa=
ces;">
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#101403): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/101403">https://lists.openembedded.org/g/openembed=
ded-devel/message/101403</a>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/97441321/3618=
223">https://lists.openembedded.org/mt/97441321/3618223</a>
Group Owner: <a href=3D"mailto:openembedded-devel+owner@lists.openembedded.=
org">openembedded-devel+owner@lists.openembedded.org</a>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub">https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a h=
ref=3D"mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</div></blockquote></div>
--=-zwx9JBvY1c+R2AUGSp8n--


