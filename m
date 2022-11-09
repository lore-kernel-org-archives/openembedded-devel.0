Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E81EC4332F
	for <webhook@archiver.kernel.org>; Wed,  9 Nov 2022 17:58:49 +0000 (UTC)
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by mx.groups.io with SMTP id smtpd.web09.360.1668016721141435977
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Nov 2022 09:58:41 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.22, mailfrom: f_l_k@t-online.de)
Received: from fwd80.dcpf.telekom.de (fwd80.aul.t-online.de [10.223.144.106])
	by mailout12.t-online.de (Postfix) with SMTP id 0436F20E5B;
	Wed,  9 Nov 2022 18:57:39 +0100 (CET)
Received: from [192.168.178.128] ([84.163.39.174]) by fwd80.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1ospKU-4RdsXo0; Wed, 9 Nov 2022 18:57:38 +0100
Date: Wed, 09 Nov 2022 18:57:32 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-oe][PATCH] hwdata: allow to build native and nativesdk
To: Ross Burton <Ross.Burton@arm.com>
Cc: openembedded-devel@lists.openembedded.org
Message-Id: <WVD3LR.DM4P4WUIIJ2L1@t-online.de>
In-Reply-To: <6DDF75A0-A98E-4E64-A718-87232BE33CDD@arm.com>
References: <20221109093534.2718027-1-f_l_k@t-online.de>
	<D7B0F690-42BF-4D57-9A34-FB8650CBB7C7@arm.com>
	<1725ECAD7BE80329.32043@lists.openembedded.org>
	<C123LR.D2SJ40BPAVYN@t-online.de>
	<9CE090EB-662D-4CCB-B3EC-D103E13575FA@arm.com>
	<JI83LR.6DI8KX778AKI@t-online.de>
	<6DDF75A0-A98E-4E64-A718-87232BE33CDD@arm.com>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-I2bMiffNH67wAj3s/8TT"
X-TOI-EXPURGATEID: 150726::1668016658-AB7F81D1-AD3E5DBF/0/0 CLEAN NORMAL
X-TOI-MSGID: f123a766-a10d-458a-a004-119036dcf52e
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 09 Nov 2022 17:58:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99504

--=-I2bMiffNH67wAj3s/8TT
Content-Type: text/plain; charset=iso-8859-13; format=flowed
Content-Transfer-Encoding: quoted-printable

Got it. You suggest fixing hwdata .pc file first.
I didn't know about the pc_sysrootdir variable, thanks for pointing it=20
out.

With this gehangen wlroots is built when 'native: true' is removed.
Would this be good enough to send upstream ,or should i create a patch=20
for the hwdata recipe?

diff --git a/hwdata.pc.in b/hwdata.pc.in
index 8dd73b6..c5791d3 100644
--- a/hwdata.pc.in
+++ b/hwdata.pc.in
@@ -1,6 +1,6 @@
 prefix=3D@prefix@
 datadir=3D@datadir@
-pkgdatadir=3D@pkgdatadir@
+pkgdatadir=3D${pc_sysrootdir}@pkgdatadir@

 Name: @NAME@


Am Mi, 9. Nov 2022 um 16:43:40 +0000 schrieb Ross Burton=20
<Ross.Burton@arm.com>:
>=20
>=20
>>  On 9 Nov 2022, at 16:01, Markus Volk via lists.openembedded.org=20
>> <f_l_k=3Dt-online.de@lists.openembedded.org=20
>> <mailto:f_l_k=3Dt-online.de@lists.openembedded.org>> wrote:
>>=20
>>  At least they have a point for correctness by calling it=20
>> build-dependency instead of runtime-dependency.
>>=20
>>  I take your point that this difference shouldn't matter because=20
>> hwdata is allarch, but simply removing 'native: true'
>>  does not fix the problem. hwdata will then be found, but the=20
>> correct value will not be read here:
>>  hwdata_dir =3D hwdata.get_variable(pkgconfig: 'pkgdatadir')
>>=20
>>=20
>>  | Run-time dependency hwdata found: YES 0.364
>>  |
>>  | ../git/backend/drm/meson.build:4:1: ERROR: File=20
>> /usr/share/hwdata/pnp.ids does not exist.
>=20
> The problem here is that you're using a target path on the host,=20
> pkgconfig just treats variables are literal strings and doesn=FFt do=20
> any sysroot processing on them.
>=20
> wayland-protocols does the right thing and puts the sysroot in the=20
> pkgdatadir:
>=20
> <https://gitlab.freedesktop.org/wayland/wayland-protocols/-/blob/main/way=
land-protocols.pc.in>
>=20
> wlroots should do this too.
>=20
> Ross


--=-I2bMiffNH67wAj3s/8TT
Content-Type: text/html; charset=iso-8859-13
Content-Transfer-Encoding: quoted-printable

<div id=3D"geary-body" dir=3D"auto"><div>Got it. You suggest fixing hwdata =
.pc file first.</div><div><div>I didn't know about the pc_sysrootdir variab=
le, thanks for pointing it out.</div><div><br></div><div>With this gehangen=
 wlroots is built when 'native: true' is removed.</div></div><div>Would thi=
s be good enough to send upstream ,or should i create a patch for the hwdat=
a recipe?</div><div><br></div><div><div>diff --git a/hwdata.pc.in b/hwdata.=
pc.in</div><div>index 8dd73b6..c5791d3 100644</div><div>--- a/hwdata.pc.in<=
/div><div>+++ b/hwdata.pc.in</div><div>@@ -1,6 +1,6 @@</div><div>&nbsp;pref=
ix=3D@prefix@</div><div>&nbsp;datadir=3D@datadir@</div><div>-pkgdatadir=3D@=
pkgdatadir@</div><div>+pkgdatadir=3D${pc_sysrootdir}@pkgdatadir@</div><div>=
&nbsp;</div><div>&nbsp;Name: @NAME@</div><div><br></div></div></div><div id=
=3D"geary-quote" dir=3D"auto"><br>Am Mi, 9. Nov 2022 um 16:43:40 +0000 schr=
ieb Ross Burton &lt;Ross.Burton@arm.com&gt;:<br><blockquote type=3D"cite"><=
div class=3D"plaintext" style=3D"white-space: break-spaces;">

<blockquote> On 9 Nov 2022, at 16:01, Markus Volk via lists.openembedded.or=
g &lt;<a href=3D"mailto:f_l_k=3Dt-online.de@lists.openembedded.org">f_l_k=
=3Dt-online.de@lists.openembedded.org</a>&gt; wrote:
=20
 At least they have a point for correctness by calling it build-dependency =
instead of runtime-dependency.
=20
 I take your point that this difference shouldn't matter because hwdata is =
allarch, but simply removing 'native: true'
 does not fix the problem. hwdata will then be found, but the correct value=
 will not be read here:=20
 hwdata_dir =3D hwdata.get_variable(pkgconfig: 'pkgdatadir')
=20
=20
 | Run-time dependency hwdata found: YES 0.364
 |=20
 | ../git/backend/drm/meson.build:4:1: ERROR: File /usr/share/hwdata/pnp.id=
s does not exist.
</blockquote>
The problem here is that you're using a target path on the host, pkgconfig =
just treats variables are literal strings and doesn=FFt do any sysroot proc=
essing on them.

wayland-protocols does the right thing and puts the sysroot in the pkgdatad=
ir:

<a href=3D"https://gitlab.freedesktop.org/wayland/wayland-protocols/-/blob/=
main/wayland-protocols.pc.in">https://gitlab.freedesktop.org/wayland/waylan=
d-protocols/-/blob/main/wayland-protocols.pc.in</a>

wlroots should do this too.

Ross</div></blockquote></div>
--=-I2bMiffNH67wAj3s/8TT--


