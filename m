Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77C46C43458
	for <webhook@archiver.kernel.org>; Fri, 26 Jun 2026 14:08:47 +0000 (UTC)
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.36194.1782482917829092299
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Jun 2026 07:08:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=f_l_k@t-online.de header.s=20260216 header.b=MDseEhsv;
 spf=pass (domain: t-online.de, ip: 194.25.134.82, mailfrom: f_l_k@t-online.de)
Received: from fwd71.aul.t-online.de (fwd71.aul.t-online.de [10.223.144.97])
	by mailout05.t-online.de (Postfix) with SMTP id B2DDF4B8;
	Fri, 26 Jun 2026 16:08:35 +0200 (CEST)
Received: from [192.168.178.63] ([79.219.237.60]) by fwd71.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1wd7EP-34xunw0; Fri, 26 Jun 2026 16:08:33 +0200
Date: Fri, 26 Jun 2026 16:08:28 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-multimedia][PATCH 2/2] packagegroup-meta-multimedia:
 add libdvdread to RDEPENDS
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Message-Id: <4MS8HT.AOOYBUNON62K2@t-online.de>
In-Reply-To: <CAMKF1sp3_iZ-NaFJ3qrdEFiOAwqXw+WDCZPtmiF1_4vfP-iRDA@mail.gmail.com>
References: <20260624133044.1093352-1-f_l_k@t-online.de>
	<20260624133044.1093352-2-f_l_k@t-online.de>
	<CAMKF1sp3_iZ-NaFJ3qrdEFiOAwqXw+WDCZPtmiF1_4vfP-iRDA@mail.gmail.com>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-5WjXHwONJlHCIdNMoqm6"
X-TOI-EXPURGATEID: 150726::1782482913-097F9A37-D8D9F270/0/0 CLEAN NORMAL
X-TOI-MSGID: d0eac70a-5ce2-461a-9c53-61443a2fda39
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1782482915; i=f_l_k@t-online.de;
	bh=tA2Bt1oOqz/u2GYL4g1hCa/Sc5/FbC4F9NabVcK7M5c=;
	h=Date:From:Subject:To:Cc:In-Reply-To:References;
	b=MDseEhsvr41Y09uS/y7lT/Imkqpqxd/FBcHrc2Z1DWoL1BgfhxYYsW2japPH9Nok3
	 Uv6lVoSnG6PFNQmlHVHwuh9omKk7FkSCgBIJkM0du+8lBGtmn/O4QEDo71p0Z2y8Vo
	 xXLkgkC4jwrVjM0x22UWd2gRXFf9IumsPC0zegW0WLQP7IOKhVzc8/p16LT8kZ0oI6
	 iWYOn4wf+wXd5BSqX1mpOMUR1GeVTNXRs9uB9PuRg5piYiWazuED3df5ZC/B0uJSoJ
	 1ksmGyGRzmjUSFCKTQSVIpE79RNAjtZahxhyi4hRQARuRPXkBoLWu9bjLKrvbdzAFV
	 Nlm5o6C29bbxw==
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 26 Jun 2026 14:08:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127795

--=-5WjXHwONJlHCIdNMoqm6
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

I have added PACKAGE_ARCH =3D "${MACHINE_ARCH}" from=20
packagegroup-meta-oe. Hopefully this setting will fix the error

Am Fr, 26. Jun 2026 um 00:08:52 -07:00:00 schrieb Khem Raj=20
<raj.khem@gmail.com>:
> This results in
>=20
> ERROR: packagegroup-meta-multimedia-1.0-r0 do_package_write_ipk: An=20
> allarch packagegroup shouldn't depend on packages which are=20
> dynamically renamed (libdvdread to libdvdread8)
>=20
> On Wed, Jun 24, 2026 at 6:31=E2=80=AFAM Markus Volk via=20
> lists.openembedded.org <http://lists.openembedded.org/>=20
> <f_l_k=3Dt-online.de@lists.openembedded.org=20
> <mailto:t-online.de@lists.openembedded.org>> wrote:
>> libdvdread has recently been moved to meta-multimedia and the=20
>> 'libdvdred' runtime
>>  dependency was removed from packagegroup-meta-oe
>>  Add the runtime dependency to packagegroup-meta-multimedia so that=20
>> is included in
>>  world builds again.
>>=20
>>  Signed-off-by: Markus Volk <f_l_k@t-online.de=20
>> <mailto:f_l_k@t-online.de>>
>>  ---
>>   .../packagegroups/packagegroup-meta-multimedia.bb=20
>> <http://packagegroup-meta-multimedia.bb/>                | 1 +
>>   1 file changed, 1 insertion(+)
>>=20
>>  diff --git=20
>> a/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-mul=
timedia.bb=20
>> <http://packagegroup-meta-multimedia.bb/>=20
>> b/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-mul=
timedia.bb=20
>> <http://packagegroup-meta-multimedia.bb/>
>>  index 4da9de3ff9..4e4f58f14a 100644
>>  ---=20
>> a/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-mul=
timedia.bb=20
>> <http://packagegroup-meta-multimedia.bb/>
>>  +++=20
>> b/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-mul=
timedia.bb=20
>> <http://packagegroup-meta-multimedia.bb/>
>>  @@ -43,6 +43,7 @@ RDEPENDS:packagegroup-meta-multimedia =3D "\
>>       pipewire \
>>       ${@bb.utils.contains("LICENSE_FLAGS_ACCEPTED", "commercial",=20
>> bb.utils.contains("DISTRO_FEATURES", "x11", "projucer", "", d), "",=20
>> d)} \
>>       libcamera \
>>  +    libdvdread \
>>       vorbis-tools \
>>       libopenmpt \
>>       mimic \
>>  --
>>  2.54.0
>>=20
>>=20
>>  -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>  Links: You receive all messages sent to this group.
>>  View/Reply Online (#127715):=20
>> <https://lists.openembedded.org/g/openembedded-devel/message/127715>
>>  Mute This Topic:=20
>> <https://lists.openembedded.org/mt/119956631/1997914>
>>  Group Owner: openembedded-devel+owner@lists.openembedded.org=20
>> <mailto:openembedded-devel%2Bowner@lists.openembedded.org>
>>  Unsubscribe:=20
>> <https://lists.openembedded.org/g/openembedded-devel/unsub>=20
>> [raj.khem@gmail.com <mailto:raj.khem@gmail.com>]
>>  -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>=20


--=-5WjXHwONJlHCIdNMoqm6
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div id=3D"geary-body" dir=3D"auto"><div>I have added&nbsp;<span style=3D"w=
hite-space: break-spaces;">PACKAGE_ARCH =3D "${MACHINE_ARCH}" from packageg=
roup-meta-oe. Hopefully this setting will fix the error</span></div></div><=
div id=3D"geary-quote" dir=3D"auto"><br>Am Fr, 26. Jun 2026 um 00:08:52 -07=
:00:00 schrieb Khem Raj &lt;raj.khem@gmail.com&gt;:<br><blockquote type=3D"=
cite"><div dir=3D"ltr">This results in<div><br></div><div>ERROR: packagegro=
up-meta-multimedia-1.0-r0 do_package_write_ipk: An allarch packagegroup sho=
uldn't depend on packages which are dynamically renamed (libdvdread to libd=
vdread8)<br></div></div><br><div class=3D"gmail_quote gmail_quote_container=
"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jun 24, 2026 at 6:31=E2=80=
=AFAM Markus Volk via <a href=3D"http://lists.openembedded.org">lists.opene=
mbedded.org</a> &lt;f_l_k=3D<a href=3D"mailto:t-online.de@lists.openembedde=
d.org">t-online.de@lists.openembedded.org</a>&gt; wrote:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">libdvdread has recently been moved=
 to meta-multimedia and the 'libdvdred' runtime<br>
dependency was removed from packagegroup-meta-oe<br>
Add the runtime dependency to packagegroup-meta-multimedia so that is inclu=
ded in<br>
world builds again.<br>
<br>
Signed-off-by: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de" target=
=3D"_blank">f_l_k@t-online.de</a>&gt;<br>
---<br>
&nbsp;.../packagegroups/<a href=3D"http://packagegroup-meta-multimedia.bb" =
rel=3D"noreferrer" target=3D"_blank">packagegroup-meta-multimedia.bb</a>&nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; | 1 +<br>
&nbsp;1 file changed, 1 insertion(+)<br>
<br>
diff --git a/meta-multimedia/recipes-multimedia/packagegroups/<a href=3D"ht=
tp://packagegroup-meta-multimedia.bb" rel=3D"noreferrer" target=3D"_blank">=
packagegroup-meta-multimedia.bb</a> b/meta-multimedia/recipes-multimedia/pa=
ckagegroups/<a href=3D"http://packagegroup-meta-multimedia.bb" rel=3D"noref=
errer" target=3D"_blank">packagegroup-meta-multimedia.bb</a><br>
index 4da9de3ff9..4e4f58f14a 100644<br>
--- a/meta-multimedia/recipes-multimedia/packagegroups/<a href=3D"http://pa=
ckagegroup-meta-multimedia.bb" rel=3D"noreferrer" target=3D"_blank">package=
group-meta-multimedia.bb</a><br>
+++ b/meta-multimedia/recipes-multimedia/packagegroups/<a href=3D"http://pa=
ckagegroup-meta-multimedia.bb" rel=3D"noreferrer" target=3D"_blank">package=
group-meta-multimedia.bb</a><br>
@@ -43,6 +43,7 @@ RDEPENDS:packagegroup-meta-multimedia =3D "\<br>
&nbsp; &nbsp; &nbsp;pipewire \<br>
&nbsp; &nbsp; &nbsp;${@bb.utils.contains("LICENSE_FLAGS_ACCEPTED", "commerc=
ial", bb.utils.contains("DISTRO_FEATURES", "x11", "projucer", "", d), "", d=
)} \<br>
&nbsp; &nbsp; &nbsp;libcamera \<br>
+&nbsp; &nbsp; libdvdread \<br>
&nbsp; &nbsp; &nbsp;vorbis-tools \<br>
&nbsp; &nbsp; &nbsp;libopenmpt \<br>
&nbsp; &nbsp; &nbsp;mimic \<br>
-- <br>
2.54.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#127715): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/127715" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/127715</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/119956631/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/119956631/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>
</blockquote></div>
--=-5WjXHwONJlHCIdNMoqm6--


