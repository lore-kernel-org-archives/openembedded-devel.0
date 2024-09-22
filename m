Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86681CF9C5B
	for <webhook@archiver.kernel.org>; Sun, 22 Sep 2024 01:29:52 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.web11.7698.1726968579890542931
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 21 Sep 2024 18:29:40 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd75.aul.t-online.de (fwd75.aul.t-online.de [10.223.144.101])
	by mailout10.t-online.de (Postfix) with SMTP id ED58731914;
	Sun, 22 Sep 2024 03:29:37 +0200 (CEST)
Received: from [192.168.178.67] ([84.163.41.228]) by fwd75.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1ssBPt-1zbl320; Sun, 22 Sep 2024 03:29:37 +0200
Date: Sun, 22 Sep 2024 03:31:26 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-gnome][PATCH 07/23] gnome-console: update 45.0 -> 47.0
To: Khem Raj <raj.khem@gmail.com>
Cc: f_l_k@t-online.de, openembedded-devel@lists.openembedded.org
Message-Id: <EKX6KS.J5ERQSYQNQ6M1@t-online.de>
In-Reply-To: <CAMKF1srp2H2bx7J9wBpmm5Teo6SFFXXz4N3vc_0Hp=Q3qhF+iA@mail.gmail.com>
References: <20240920150822.1131707-1-f_l_k@t-online.de>
	<20240920150822.1131707-7-f_l_k@t-online.de>
	<CAMKF1srp2H2bx7J9wBpmm5Teo6SFFXXz4N3vc_0Hp=Q3qhF+iA@mail.gmail.com>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-adRD8hGvDbHmUXGpiGP6"
X-TOI-EXPURGATEID: 150726::1726968577-78FF745E-E5B67107/0/0 CLEAN NORMAL
X-TOI-MSGID: 99c1d726-613a-4c63-9b82-13c2bdc86387
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 22 Sep 2024 01:29:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112444

--=-adRD8hGvDbHmUXGpiGP6
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

yes, vte 0.77 is required. I have that recipe in my image layer ...=20
updating vte in oe-core is tricky. Thats why it did not fail for me

On Sat, Sep 21 2024 at 08:33:43 PM -04:00:00, Khem Raj=20
<raj.khem@gmail.com> wrote:
> this fails - <https://errors.yoctoproject.org/Errors/Details/806058/>
> I think it needs vte 0.78.0+ I am testing a local patch for upgrade, I
> appreciate your work
> in keeping Gnome upto date in OE ecosystem. I would suggest to build
> packagegroup-gnome-apps and packagegroup-gnome-desktop
> which might be able to give lot of build failures from meta-gnome=20
> recipes.
>=20
> On Fri, Sep 20, 2024 at 11:08=E2=80=AFAM Markus Volk via
> lists.openembedded.org <f_l_k=3Dt-online.de@lists.openembedded.org=20
> <mailto:f_l_k=3Dt-online.de@lists.openembedded.org>>
> wrote:
>>=20
>>  Version 47.0
>>  ~~~~~~~~~~~~
>>=20
>>  A edge case in drag-and-drop has been resolved, and Aleksandr=20
>> Melman fixed a
>>  string that hadn't been marked for translation.
>>=20
>>  Updated Translations
>>   * Belarusian  (Vasil Pupkin)
>>   * British English  (Andi Chandler)
>>   * Bulgarian  (Alexander Shopov)
>>   * Catalan  (Jordi Mas i Hernandez)
>>   * Chinese (China)  (Luming Zh)
>>   * Czech  (Daniel Rusek)
>>   * Danish  (Ask Hjorth Larsen)
>>   * Galician  (Fran Dieguez)
>>   * Georgian  (Ekaterine Papava)
>>   * Greek  (Efstathios Iosifidis)
>>   * Hebrew  (Yaron Shahrabani)
>>   * Hungarian  (Bal=C3=A1zs =C3=9Ar)
>>   * Indonesian  (Andika Triwidada)
>>   * Lithuanian  (Aurimas =C4=8Cernius)
>>   * Norwegian Bokm=C3=A5l  (Brage Fuglseth)
>>   * Persian  (Danial Behzadi)
>>   * Polish  (Piotr Dr=C4=85g)
>>   * Portuguese  (Hugo Carvalho)
>>   * Russian  (Artur S0)
>>   * Slovak  (Jose Riha)
>>   * Slovenian  (Martin)
>>   * Spanish  (Daniel Mustieles)
>>   * Swedish  (Anders Jonsson)
>>   * Ukrainian  (Yuri Chornoivan)
>>=20
>>  Version 47.rc
>>  ~~~~~~~~~~~~~~~
>>=20
>>  Thanks to feedback from beta users, a couple small improvements=20
>> were made.
>>=20
>>  Updated Translations
>>   * Basque  (Asier Sarasua Garmendia)
>>   * Belarusian  (Vasil Pupkin)
>>   * Brazilian Portuguese  (Juliano de Souza Camargo)
>>   * Bulgarian  (Alexander Shopov)
>>   * Catalan  (poc senderi)
>>   * Chinese (China)  (Luming Zh)
>>   * Czech  (Daniel Rusek)
>>   * Finnish  (Jiri Gr=C3=B6nroos)
>>   * Georgian  (Ekaterine Papava)
>>   * German  (J=C3=BCrgen Benvenuti)
>>   * Hindi  (Scrambled 777)
>>   * Hungarian  (Bal=C3=A1zs =C3=9Ar)
>>   * Kazakh  (Baurzhan Muftakhidinov)
>>   * Korean  (DaeHyun Sung)
>>   * Norwegian Bokm=C3=A5l  (Brage Fuglseth)
>>   * Occitan  (Quentin PAG=C3=88S)
>>   * Persian  (Danial Behzadi)
>>   * Portuguese  (Hugo Carvalho)
>>   * Romanian  (Daniel =C8=98erb=C4=83nescu, Florentina Mu=C8=99at)
>>   * Russian  (Artur S0)
>>   * Turkish  (Emin Tufan =C3=87etin, Sabri =C3=9Cnal)
>>   * Ukrainian  (Yuri Chornoivan)
>>=20
>>  Version 47.beta
>>  ~~~~~~~~~~~~~~~
>>=20
>>  The preferences dialogue has been expanded to include scrollback=20
>> size, and
>>  there has been behind the scenes work fixing some pesky issues and=20
>> setting
>>  up future improvements.
>>=20
>>  Thanks to work elsewhere in the stack, we now have restored screen=20
>> reader
>>  support. This has taken far too long, and there is more work do be=20
>> done, but
>>  hopefully this is a significant step forward.
>>=20
>>  Additionally Alice reworked our styles to take advantage of=20
>> improvements in
>>  Gtk, whilst Chris helped us keep current with developments in=20
>> Adwaita, and
>>  Ball=C3=B3 Gy=C3=B6rgy provided some fixes.
>>=20
>>  Updated Translations
>>   * Brazilian Portuguese  (Juliano de Souza Camargo)
>>   * Greek  (Efstathios Iosifidis)
>>   * Hebrew  (Yosef Or Boczko)
>>   * Hindi  (Guntupalli Karunakar, Scrambled 777)
>>   * Kabyle  (Rachida SACI)
>>   * Nepali  (Pawan Chitrakar)
>>   * Occitan  (Quentin PAG=C3=88S)
>>   * Portuguese  (Hugo Carvalho)
>>   * Romanian  (Daniel =C8=98erb=C4=83nescu)
>>   * Serbian  (Du=C5=A1an Simi=C4=87)
>>   * Serbian (Latin)  (=D0=9C=D0=B8=D0=BB=D0=BE=D1=88 =D0=9F=D0=BE=D0=BF=
=D0=BE=D0=B2=D0=B8=D1=9B)
>>   * Slovak  (Matej Mrenica)
>>   * Slovenian  (Martin)
>>   * Turkish  (Sabri =C3=9Cnal)
>>=20
>>  Signed-off-by: Markus Volk <f_l_k@t-online.de=20
>> <mailto:f_l_k@t-online.de>>
>>  ---
>>   .../{gnome-console_45.0.bb =3D> gnome-console_47.0.bb}            |=20
>> 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>   rename=20
>> meta-gnome/recipes-gnome/gnome-console/{gnome-console_45.0.bb =3D>=20
>> gnome-console_47.0.bb} (85%)
>>=20
>>  diff --git=20
>> a/meta-gnome/recipes-gnome/gnome-console/gnome-console_45.0.bb=20
>> b/meta-gnome/recipes-gnome/gnome-console/gnome-console_47.0.bb
>>  similarity index 85%
>>  rename from=20
>> meta-gnome/recipes-gnome/gnome-console/gnome-console_45.0.bb
>>  rename to=20
>> meta-gnome/recipes-gnome/gnome-console/gnome-console_47.0.bb
>>  index d03b5fe04..922b0576e 100644
>>  --- a/meta-gnome/recipes-gnome/gnome-console/gnome-console_45.0.bb
>>  +++ b/meta-gnome/recipes-gnome/gnome-console/gnome-console_47.0.bb
>>  @@ -18,7 +18,7 @@ DEPENDS =3D " \
>>       vte \
>>   "
>>=20
>>  -SRC_URI[archive.sha256sum] =3D=20
>> "e7462128d2df2324a1d748062c40429cd0504af09e407067b33f3a9d0c59c8e1"
>>  +SRC_URI[archive.sha256sum] =3D=20
>> "487ec0de0a24f12ef6f778e4aee98d744a9dcc921c9e7df98b2d9f410b00ef52"
>>=20
>>   PACKAGECONFIG ?=3D ""
>>   PACKAGECONFIG[tests] =3D "-Dtests=3Dtrue,-Dtests=3Dfalse"
>>  --
>>  2.46.0
>>=20
>>=20
>>  -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>  Links: You receive all messages sent to this group.
>>  View/Reply Online (#112412):=20
>> <https://lists.openembedded.org/g/openembedded-devel/message/112412>
>>  Mute This Topic:=20
>> <https://lists.openembedded.org/mt/108560567/1997914>
>>  Group Owner: openembedded-devel+owner@lists.openembedded.org=20
>> <mailto:openembedded-devel+owner@lists.openembedded.org>
>>  Unsubscribe:=20
>> <https://lists.openembedded.org/g/openembedded-devel/unsub>=20
>> [raj.khem@gmail.com <mailto:raj.khem@gmail.com>]
>>  -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>=20


--=-adRD8hGvDbHmUXGpiGP6
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div id=3D"geary-body" dir=3D"auto"><div>yes, vte 0.77 is required. I have =
that recipe in my image layer ... updating vte in oe-core is tricky. Thats =
why it did not fail for me</div></div><div id=3D"geary-quote" dir=3D"auto">=
<br>On Sat, Sep 21 2024 at 08:33:43 PM -04:00:00, Khem Raj &lt;raj.khem@gma=
il.com&gt; wrote:<br><blockquote type=3D"cite"><div class=3D"plaintext" sty=
le=3D"white-space: break-spaces;">this fails - <a href=3D"https://errors.yo=
ctoproject.org/Errors/Details/806058/">https://errors.yoctoproject.org/Erro=
rs/Details/806058/</a>
I think it needs vte 0.78.0+ I am testing a local patch for upgrade, I
appreciate your work
in keeping Gnome upto date in OE ecosystem. I would suggest to build
packagegroup-gnome-apps and packagegroup-gnome-desktop
which might be able to give lot of build failures from meta-gnome recipes.

On Fri, Sep 20, 2024 at 11:08=E2=80=AFAM Markus Volk via
lists.openembedded.org &lt;<a href=3D"mailto:f_l_k=3Dt-online.de@lists.open=
embedded.org">f_l_k=3Dt-online.de@lists.openembedded.org</a>&gt;
wrote:
<blockquote>
 Version 47.0
 ~~~~~~~~~~~~

 A edge case in drag-and-drop has been resolved, and Aleksandr Melman fixed=
 a
 string that hadn't been marked for translation.

 Updated Translations
  * Belarusian  (Vasil Pupkin)
  * British English  (Andi Chandler)
  * Bulgarian  (Alexander Shopov)
  * Catalan  (Jordi Mas i Hernandez)
  * Chinese (China)  (Luming Zh)
  * Czech  (Daniel Rusek)
  * Danish  (Ask Hjorth Larsen)
  * Galician  (Fran Dieguez)
  * Georgian  (Ekaterine Papava)
  * Greek  (Efstathios Iosifidis)
  * Hebrew  (Yaron Shahrabani)
  * Hungarian  (Bal=C3=A1zs =C3=9Ar)
  * Indonesian  (Andika Triwidada)
  * Lithuanian  (Aurimas =C4=8Cernius)
  * Norwegian Bokm=C3=A5l  (Brage Fuglseth)
  * Persian  (Danial Behzadi)
  * Polish  (Piotr Dr=C4=85g)
  * Portuguese  (Hugo Carvalho)
  * Russian  (Artur S0)
  * Slovak  (Jose Riha)
  * Slovenian  (Martin)
  * Spanish  (Daniel Mustieles)
  * Swedish  (Anders Jonsson)
  * Ukrainian  (Yuri Chornoivan)

 Version 47.rc
 ~~~~~~~~~~~~~~~

 Thanks to feedback from beta users, a couple small improvements were made.

 Updated Translations
  * Basque  (Asier Sarasua Garmendia)
  * Belarusian  (Vasil Pupkin)
  * Brazilian Portuguese  (Juliano de Souza Camargo)
  * Bulgarian  (Alexander Shopov)
  * Catalan  (poc senderi)
  * Chinese (China)  (Luming Zh)
  * Czech  (Daniel Rusek)
  * Finnish  (Jiri Gr=C3=B6nroos)
  * Georgian  (Ekaterine Papava)
  * German  (J=C3=BCrgen Benvenuti)
  * Hindi  (Scrambled 777)
  * Hungarian  (Bal=C3=A1zs =C3=9Ar)
  * Kazakh  (Baurzhan Muftakhidinov)
  * Korean  (DaeHyun Sung)
  * Norwegian Bokm=C3=A5l  (Brage Fuglseth)
  * Occitan  (Quentin PAG=C3=88S)
  * Persian  (Danial Behzadi)
  * Portuguese  (Hugo Carvalho)
  * Romanian  (Daniel =C8=98erb=C4=83nescu, Florentina Mu=C8=99at)
  * Russian  (Artur S0)
  * Turkish  (Emin Tufan =C3=87etin, Sabri =C3=9Cnal)
  * Ukrainian  (Yuri Chornoivan)

 Version 47.beta
 ~~~~~~~~~~~~~~~

 The preferences dialogue has been expanded to include scrollback size, and
 there has been behind the scenes work fixing some pesky issues and setting
 up future improvements.

 Thanks to work elsewhere in the stack, we now have restored screen reader
 support. This has taken far too long, and there is more work do be done, b=
ut
 hopefully this is a significant step forward.

 Additionally Alice reworked our styles to take advantage of improvements i=
n
 Gtk, whilst Chris helped us keep current with developments in Adwaita, and
 Ball=C3=B3 Gy=C3=B6rgy provided some fixes.

 Updated Translations
  * Brazilian Portuguese  (Juliano de Souza Camargo)
  * Greek  (Efstathios Iosifidis)
  * Hebrew  (Yosef Or Boczko)
  * Hindi  (Guntupalli Karunakar, Scrambled 777)
  * Kabyle  (Rachida SACI)
  * Nepali  (Pawan Chitrakar)
  * Occitan  (Quentin PAG=C3=88S)
  * Portuguese  (Hugo Carvalho)
  * Romanian  (Daniel =C8=98erb=C4=83nescu)
  * Serbian  (Du=C5=A1an Simi=C4=87)
  * Serbian (Latin)  (=D0=9C=D0=B8=D0=BB=D0=BE=D1=88 =D0=9F=D0=BE=D0=BF=D0=
=BE=D0=B2=D0=B8=D1=9B)
  * Slovak  (Matej Mrenica)
  * Slovenian  (Martin)
  * Turkish  (Sabri =C3=9Cnal)

 Signed-off-by: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de">f_l_k@=
t-online.de</a>&gt;
 ---
  .../{gnome-console_45.0.bb =3D&gt; gnome-console_47.0.bb}            | 2 =
+-
  1 file changed, 1 insertion(+), 1 deletion(-)
  rename meta-gnome/recipes-gnome/gnome-console/{gnome-console_45.0.bb =3D&=
gt; gnome-console_47.0.bb} (85%)

 diff --git a/meta-gnome/recipes-gnome/gnome-console/gnome-console_45.0.bb =
b/meta-gnome/recipes-gnome/gnome-console/gnome-console_47.0.bb
 similarity index 85%
 rename from meta-gnome/recipes-gnome/gnome-console/gnome-console_45.0.bb
 rename to meta-gnome/recipes-gnome/gnome-console/gnome-console_47.0.bb
 index d03b5fe04..922b0576e 100644
 --- a/meta-gnome/recipes-gnome/gnome-console/gnome-console_45.0.bb
 +++ b/meta-gnome/recipes-gnome/gnome-console/gnome-console_47.0.bb
 @@ -18,7 +18,7 @@ DEPENDS =3D " \
      vte \
  "

 -SRC_URI[archive.sha256sum] =3D "e7462128d2df2324a1d748062c40429cd0504af09=
e407067b33f3a9d0c59c8e1"
 +SRC_URI[archive.sha256sum] =3D "487ec0de0a24f12ef6f778e4aee98d744a9dcc921=
c9e7df98b2d9f410b00ef52"

  PACKAGECONFIG ?=3D ""
  PACKAGECONFIG[tests] =3D "-Dtests=3Dtrue,-Dtests=3Dfalse"
 --
 2.46.0


 -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
 Links: You receive all messages sent to this group.
 View/Reply Online (#112412): <a href=3D"https://lists.openembedded.org/g/o=
penembedded-devel/message/112412">https://lists.openembedded.org/g/openembe=
dded-devel/message/112412</a>
 Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/108560567/19=
97914">https://lists.openembedded.org/mt/108560567/1997914</a>
 Group Owner: <a href=3D"mailto:openembedded-devel+owner@lists.openembedded=
.org">openembedded-devel+owner@lists.openembedded.org</a>
 Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-deve=
l/unsub">https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a =
href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>]
 -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</blockquote></div></blockquote></div>
--=-adRD8hGvDbHmUXGpiGP6--


