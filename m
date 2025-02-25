Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FF65C021B8
	for <webhook@archiver.kernel.org>; Tue, 25 Feb 2025 18:14:59 +0000 (UTC)
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by mx.groups.io with SMTP id smtpd.web10.15995.1740507290929970836
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Feb 2025 10:14:51 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.84, mailfrom: f_l_k@t-online.de)
Received: from fwd80.aul.t-online.de (fwd80.aul.t-online.de [10.223.144.106])
	by mailout09.t-online.de (Postfix) with SMTP id 7DE0F7F6E;
	Tue, 25 Feb 2025 19:14:48 +0100 (CET)
Received: from [192.168.178.20] ([84.163.41.232]) by fwd80.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1tmzSC-0BLP6W0; Tue, 25 Feb 2025 19:14:48 +0100
Date: Tue, 25 Feb 2025 19:15:29 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [RFC][meta-gnome][PATCH 4/7] gnome-software_: update 47.2 ->
 48.beta
To: raj.khem@gmail.com
Cc: "Khem Raj via lists.openembedded.org"
	<raj.khem=gmail.com@lists.openembedded.org>,
	openembedded-devel@lists.openembedded.org
Message-Id: <T149SS.QTMO47WSVCIR1@t-online.de>
In-Reply-To: <CAMKF1spA7v-Bv-HcyPcS2TLJg5TDEfs6Bbqsk-rVchuXAif52w@mail.gmail.com>
References: <20250225134937.2085793-1-f_l_k@t-online.de>
	<20250225134937.2085793-4-f_l_k@t-online.de>
	<CAMKF1spA7v-Bv-HcyPcS2TLJg5TDEfs6Bbqsk-rVchuXAif52w@mail.gmail.com>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-LOvXuRyrtNXkWA1ty+rd"
X-TOI-EXPURGATEID: 150726::1740507288-457F9963-CBEAC03D/0/0 CLEAN NORMAL
X-TOI-MSGID: cf7c5ca1-4964-4d1e-9ebc-a0662fccd783
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Feb 2025 18:14:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115595

--=-LOvXuRyrtNXkWA1ty+rd
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

I think so. This patchset would also require another set of patches for=20
oe-core.
I sent both marked as RFC in case someone wants to try them. Alexander=20
Kanavin stated that this will not make it in time for the release.
I only built the beta to see what needed to be updated for gnome 48. It=20
is already running quite well

On Tue, Feb 25 2025 at 09:15:00 -08:00:00, Khem Raj via=20
lists.openembedded.org <raj.khem=3Dgmail.com@lists.openembedded.org>=20
wrote:
> Should we wait for final 48 release ?
>=20
> On Tue, Feb 25, 2025 at 5:49=E2=80=AFAM Markus Volk via=20
> lists.openembedded.org <http://lists.openembedded.org/>=20
> <f_l_k=3Dt-online.de@lists.openembedded.org=20
> <mailto:t-online.de@lists.openembedded.org>> wrote:
>> Version 48~beta
>>  ~~~~~~~~~~~~~~~
>>  Released: 2025-01-31
>>  This is an unstable release with the following changes:
>>   * Support installing flatpaks via a flatpak+https: link
>>   * Fix notifying about outdated updates when in power saver mode or=20
>> offline
>>   * Prioritise verified apps in source list
>>  This release also updates translations:
>>   * Bulgarian (twlvnn kraftwerk)
>>   * Czech (Daniel Rusek)
>>   * Russian (Artur S0)
>>   * Slovenian (Martin)
>>  Version 48~alpha3
>>  ~~~~~~~~~~~~~~~~~
>>  Released: 2025-01-14
>>  This is an unstable release with the following changes:
>>   * Fix downloads of firmware updates
>>   * Fix the release process
>>  This release also updates translations:
>>   * Belarusian (Vasil Pupkin)
>>   * Slovenian (Martin)
>>  Version 48~alpha2
>>  ~~~~~~~~~~~~~~~~~
>>  Released: 2025-01-04
>>  This is an unstable release with the following changes:
>>   * Fix the release process
>>  Version 48~alpha
>>  ~~~~~~~~~~~~~~~~
>>  Released: 2025-01-04
>>  This is an unstable release with the following changes:
>>   * Include dependencies in estimated download size
>>   * Improve performance when loading updates
>>   * Fix interface freeze when upvoting/downvoting reviews
>>   * Various minor interface improvements for keyboard navigation and=20
>> small screens
>>   * Fix crash when uninstalling snaps
>>   * Add experimental systemd-sysupdate plugin
>>   * Warn about microphone permissions if an app has PipeWire access
>>  This release also updates translations:
>>   * Belarusian (Vasil Pupkin)
>>   * Catalan (Jordi Mas i Hernandez, Jordi Mas)
>>   * Dutch (Nathan Follens)
>>   * French (Vincent Chatelain)
>>   * Friulian (Fabio Tomat)
>>   * German (J=C3=BCrgen Benvenuti)
>>   * Hebrew (Yaron Shahrabani)
>>   * Kabyle (Athmane MOKRAOUI)
>>   * Latvian (R=C5=ABdolfs Mazurs)
>>   * Portuguese (Hugo Carvalho)
>>   * Portuguese (Brazil) (Rafael Fontenelle)
>>   * Russian (Artur S0)
>>   * Serbian (=D0=9C=D0=B0=D1=80=D0=BA=D0=BE =D0=9A=D0=BE=D1=81=D1=82=D0=
=B8=D1=9B, =D0=9C=D0=B8=D0=BB=D0=BE=D1=88 =D0=9F=D0=BE=D0=BF=D0=BE=D0=B2=D0=
=B8=D1=9B)
>>   * Slovak (Jose Riha)
>>   * Slovenian (Martin)
>>   * Thai (Aefgh Threenine)
>>   * Turkish (Sabri =C3=9Cnal)
>>   * Ukrainian (Yuri Chornoivan)
>>=20
>>  Signed-off-by: Markus Volk <f_l_k@t-online.de=20
>> <mailto:f_l_k@t-online.de>>
>>  ---
>>   .../{gnome-software_47.2.bb <http://gnome-software_47.2.bb/> =3D>=20
>> gnome-software_48.beta.bb <http://gnome-software_48.beta.bb/>}     |=20
>> 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>   rename=20
>> meta-gnome/recipes-gnome/gnome-software/{gnome-software_47.2.bb=20
>> <http://gnome-software_47.2.bb/> =3D> gnome-software_48.beta.bb=20
>> <http://gnome-software_48.beta.bb/>} (90%)
>>=20
>>  diff --git=20
>> a/meta-gnome/recipes-gnome/gnome-software/gnome-software_47.2.bb=20
>> <http://gnome-software_47.2.bb/>=20
>> b/meta-gnome/recipes-gnome/gnome-software/gnome-software_48.beta.bb=20
>> <http://gnome-software_48.beta.bb/>
>>  similarity index 90%
>>  rename from=20
>> meta-gnome/recipes-gnome/gnome-software/gnome-software_47.2.bb=20
>> <http://gnome-software_47.2.bb/>
>>  rename to=20
>> meta-gnome/recipes-gnome/gnome-software/gnome-software_48.beta.bb=20
>> <http://gnome-software_48.beta.bb/>
>>  index 31b13accf8..1b48708595 100644
>>  ---=20
>> a/meta-gnome/recipes-gnome/gnome-software/gnome-software_47.2.bb=20
>> <http://gnome-software_47.2.bb/>
>>  +++=20
>> b/meta-gnome/recipes-gnome/gnome-software/gnome-software_48.beta.bb=20
>> <http://gnome-software_48.beta.bb/>
>>  @@ -26,9 +26,9 @@ DEPENDS +=3D " \
>>=20
>>   RDEPENDS:${PN} =3D "iso-codes"
>>=20
>>  -EXTRA_OEMESON +=3D "-Dtests=3Dfalse -Dsoup2=3Dfalse"
>>  +EXTRA_OEMESON +=3D "-Dtests=3Dfalse"
>>=20
>>  -SRC_URI[archive.sha256sum] =3D=20
>> "112338f8a98e7e5125de3f57229873534215b77eeef37d3fd4262f02151c7cea"
>>  +SRC_URI[archive.sha256sum] =3D=20
>> "798c48912788b3ff700fd483fe805f3e0f0912cf2e46b7f7334c8a9c6f883296"
>>=20
>>   PACKAGECONFIG ?=3D "flatpak"
>>   PACKAGECONFIG[flatpak] =3D "-Dflatpak=3Dtrue,-Dflatpak=3Dfalse,flatpak=
=20
>> ostree"
>>  --
>>  2.48.1
>>=20
>>=20
>>=20
>>=20


--=-LOvXuRyrtNXkWA1ty+rd
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div id=3D"geary-body" dir=3D"auto"><div>I think so. This patchset would al=
so require another set of patches for oe-core.</div><div>I sent both marked=
 as RFC in case someone wants to try them.&nbsp;Alexander Kanavin stated th=
at this will not make it in time for the release.</div><div>I only built th=
e beta to see what needed to be updated for gnome 48. It is already running=
 quite well</div></div><div id=3D"geary-quote" dir=3D"auto"><br>On Tue, Feb=
 25 2025 at 09:15:00 -08:00:00, Khem Raj via lists.openembedded.org &lt;raj=
.khem=3Dgmail.com@lists.openembedded.org&gt; wrote:<br><blockquote type=3D"=
cite"><div dir=3D"auto">Should we wait for final 48 release ?&nbsp;</div><d=
iv><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" cl=
ass=3D"gmail_attr">On Tue, Feb 25, 2025 at 5:49=E2=80=AFAM Markus Volk via =
<a href=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt;f_=
l_k=3D<a href=3D"mailto:t-online.de@lists.openembedded.org">t-online.de@lis=
ts.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">=
Version 48~beta<br>
~~~~~~~~~~~~~~~<br>
Released: 2025-01-31<br>
This is an unstable release with the following changes:<br>
&nbsp;* Support installing flatpaks via a flatpak+https: link<br>
&nbsp;* Fix notifying about outdated updates when in power saver mode or of=
fline<br>
&nbsp;* Prioritise verified apps in source list<br>
This release also updates translations:<br>
&nbsp;* Bulgarian (twlvnn kraftwerk)<br>
&nbsp;* Czech (Daniel Rusek)<br>
&nbsp;* Russian (Artur S0)<br>
&nbsp;* Slovenian (Martin)<br>
Version 48~alpha3<br>
~~~~~~~~~~~~~~~~~<br>
Released: 2025-01-14<br>
This is an unstable release with the following changes:<br>
&nbsp;* Fix downloads of firmware updates<br>
&nbsp;* Fix the release process<br>
This release also updates translations:<br>
&nbsp;* Belarusian (Vasil Pupkin)<br>
&nbsp;* Slovenian (Martin)<br>
Version 48~alpha2<br>
~~~~~~~~~~~~~~~~~<br>
Released: 2025-01-04<br>
This is an unstable release with the following changes:<br>
&nbsp;* Fix the release process<br>
Version 48~alpha<br>
~~~~~~~~~~~~~~~~<br>
Released: 2025-01-04<br>
This is an unstable release with the following changes:<br>
&nbsp;* Include dependencies in estimated download size<br>
&nbsp;* Improve performance when loading updates<br>
&nbsp;* Fix interface freeze when upvoting/downvoting reviews<br>
&nbsp;* Various minor interface improvements for keyboard navigation and sm=
all screens<br>
&nbsp;* Fix crash when uninstalling snaps<br>
&nbsp;* Add experimental systemd-sysupdate plugin<br>
&nbsp;* Warn about microphone permissions if an app has PipeWire access<br>
This release also updates translations:<br>
&nbsp;* Belarusian (Vasil Pupkin)<br>
&nbsp;* Catalan (Jordi Mas i Hernandez, Jordi Mas)<br>
&nbsp;* Dutch (Nathan Follens)<br>
&nbsp;* French (Vincent Chatelain)<br>
&nbsp;* Friulian (Fabio Tomat)<br>
&nbsp;* German (J=C3=BCrgen Benvenuti)<br>
&nbsp;* Hebrew (Yaron Shahrabani)<br>
&nbsp;* Kabyle (Athmane MOKRAOUI)<br>
&nbsp;* Latvian (R=C5=ABdolfs Mazurs)<br>
&nbsp;* Portuguese (Hugo Carvalho)<br>
&nbsp;* Portuguese (Brazil) (Rafael Fontenelle)<br>
&nbsp;* Russian (Artur S0)<br>
&nbsp;* Serbian (=D0=9C=D0=B0=D1=80=D0=BA=D0=BE =D0=9A=D0=BE=D1=81=D1=82=D0=
=B8=D1=9B, =D0=9C=D0=B8=D0=BB=D0=BE=D1=88 =D0=9F=D0=BE=D0=BF=D0=BE=D0=B2=D0=
=B8=D1=9B)<br>
&nbsp;* Slovak (Jose Riha)<br>
&nbsp;* Slovenian (Martin)<br>
&nbsp;* Thai (Aefgh Threenine)<br>
&nbsp;* Turkish (Sabri =C3=9Cnal)<br>
&nbsp;* Ukrainian (Yuri Chornoivan)<br>
<br>
Signed-off-by: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de" target=
=3D"_blank">f_l_k@t-online.de</a>&gt;<br>
---<br>
&nbsp;.../{<a href=3D"http://gnome-software_47.2.bb" rel=3D"noreferrer" tar=
get=3D"_blank">gnome-software_47.2.bb</a> =3D&gt; <a href=3D"http://gnome-s=
oftware_48.beta.bb" rel=3D"noreferrer" target=3D"_blank">gnome-software_48.=
beta.bb</a>}&nbsp; &nbsp; &nbsp;| 4 ++--<br>
&nbsp;1 file changed, 2 insertions(+), 2 deletions(-)<br>
&nbsp;rename meta-gnome/recipes-gnome/gnome-software/{<a href=3D"http://gno=
me-software_47.2.bb" rel=3D"noreferrer" target=3D"_blank">gnome-software_47=
.2.bb</a> =3D&gt; <a href=3D"http://gnome-software_48.beta.bb" rel=3D"noref=
errer" target=3D"_blank">gnome-software_48.beta.bb</a>} (90%)<br>
<br>
diff --git a/meta-gnome/recipes-gnome/gnome-software/<a href=3D"http://gnom=
e-software_47.2.bb" rel=3D"noreferrer" target=3D"_blank">gnome-software_47.=
2.bb</a> b/meta-gnome/recipes-gnome/gnome-software/<a href=3D"http://gnome-=
software_48.beta.bb" rel=3D"noreferrer" target=3D"_blank">gnome-software_48=
.beta.bb</a><br>
similarity index 90%<br>
rename from meta-gnome/recipes-gnome/gnome-software/<a href=3D"http://gnome=
-software_47.2.bb" rel=3D"noreferrer" target=3D"_blank">gnome-software_47.2=
.bb</a><br>
rename to meta-gnome/recipes-gnome/gnome-software/<a href=3D"http://gnome-s=
oftware_48.beta.bb" rel=3D"noreferrer" target=3D"_blank">gnome-software_48.=
beta.bb</a><br>
index 31b13accf8..1b48708595 100644<br>
--- a/meta-gnome/recipes-gnome/gnome-software/<a href=3D"http://gnome-softw=
are_47.2.bb" rel=3D"noreferrer" target=3D"_blank">gnome-software_47.2.bb</a=
><br>
+++ b/meta-gnome/recipes-gnome/gnome-software/<a href=3D"http://gnome-softw=
are_48.beta.bb" rel=3D"noreferrer" target=3D"_blank">gnome-software_48.beta=
.bb</a><br>
@@ -26,9 +26,9 @@ DEPENDS +=3D " \<br>
<br>
&nbsp;RDEPENDS:${PN} =3D "iso-codes"<br>
<br>
-EXTRA_OEMESON +=3D "-Dtests=3Dfalse -Dsoup2=3Dfalse"<br>
+EXTRA_OEMESON +=3D "-Dtests=3Dfalse"<br>
<br>
-SRC_URI[archive.sha256sum] =3D "112338f8a98e7e5125de3f57229873534215b77eee=
f37d3fd4262f02151c7cea"<br>
+SRC_URI[archive.sha256sum] =3D "798c48912788b3ff700fd483fe805f3e0f0912cf2e=
46b7f7334c8a9c6f883296"<br>
<br>
&nbsp;PACKAGECONFIG ?=3D "flatpak"<br>
&nbsp;PACKAGECONFIG[flatpak] =3D "-Dflatpak=3Dtrue,-Dflatpak=3Dfalse,flatpa=
k ostree"<br>
-- <br>
2.48.1<br>
<br>
<br>
<br>
<br>
</blockquote></div></div>
</blockquote></div>
--=-LOvXuRyrtNXkWA1ty+rd--


