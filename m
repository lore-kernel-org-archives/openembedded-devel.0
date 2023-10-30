Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 192E7C4332F
	for <webhook@archiver.kernel.org>; Mon, 30 Oct 2023 16:18:23 +0000 (UTC)
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
 by mx.groups.io with SMTP id smtpd.web11.153594.1698682700784113794
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 Oct 2023 09:18:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DJbWN/wV;
 spf=pass (domain: gmail.com, ip: 209.85.160.53, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-1ead2e6fab7so3168020fac.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 30 Oct 2023 09:18:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698682700; x=1699287500; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=B5CDqwWSBVev9FwNaKXzH72B2slslproASUBYxRSopg=;
        b=DJbWN/wV/lRW8LlUCNrHchQe0WcLO+Rp8Gk51eKROTo4/TqO0n8L2fc3OM+5Qto/Ad
         ZiKtbI7PkeYO0OCQI5IkI3Vpdz6z5rj22ewI8YcWYFFlSzWu9n39Ne9E0kObXFkn5fT7
         /X7FtkavANCdKIvBiLLZXZrLIaUB1DXrJViLL2wQCUgb8gfcl+egsi2erlboxdZjB8mE
         aWjIMo/uJo1xp7PqAk5kepJ3UmJOWMjPX5Fh19UAB/sjdr/zPdPdyfJ8hQjOPsGMQVKu
         7uq9K9v2CKBKy932JB6hH1FReNx/0zc4TQ1y0MdcTTUIoI243SensF2RXHdJr8CS9KJP
         +X+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698682700; x=1699287500;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B5CDqwWSBVev9FwNaKXzH72B2slslproASUBYxRSopg=;
        b=pvW7eTKAi8uoGCxMQXVJxdBSBvPFxlCF5OXYbTDQNJUtRhLnXuuuJo8QUHpflJ750w
         A/78r8flUL9YtXkxNb6v3eYBsjCJeEV6Y8FKtsEaFnxOddeHlSNa3VD8y4WQXomXQxG0
         R7DVwIbjroWW79zvluWANqZeNV7MCpWWw8Y2E6wIunvz+CGJ05oAbDTWsDGLL7kUqNZm
         IubG2cTPd5/T5Z8i1FOLDQ91N45qCiJmysEEKEkUo8J7F0V8QATiH7bbbtLSBOQGiMW3
         7ZPhnZbswgjjZqm66DOjQD3BHWlUTUjoaqrKdaIV/Zp/YDJZ+9OgZ0iP4gJ3ZNFpZtsR
         0PkQ==
X-Gm-Message-State: AOJu0YxYSdMZso0XbaaTSkxQaVSohV9ziUhZGZsb6uaI0c1ADyTGa2bh
	bTfQcWXsvb7Mw73+LENBbfA2gz6K5KvZPNXpOXBwRe77
X-Google-Smtp-Source: AGHT+IHf2dph8k27hJJ2LFQdpLa3/xvskhC5Q/PTmJm95ypPytJ/lEMhb0jjbYiCTwYA/ywcHaPdoc46uZZKoSck+VQ=
X-Received: by 2002:a05:6870:5b83:b0:1ea:809c:3eb with SMTP id
 em3-20020a0568705b8300b001ea809c03ebmr13144699oab.44.1698682700001; Mon, 30
 Oct 2023 09:18:20 -0700 (PDT)
MIME-Version: 1.0
References: <20231027194914.78513-1-peron.clem@gmail.com> <DB5PR02MB102132E9626696DE2B38664C1EFDCA@DB5PR02MB10213.eurprd02.prod.outlook.com>
 <17923E3423A27A6E.20486@lists.openembedded.org> <CAJiuCccyyG4kDkYmEqxanwn=8u-pfrsPb0-nEHSRkRfU2NCG5w@mail.gmail.com>
In-Reply-To: <CAJiuCccyyG4kDkYmEqxanwn=8u-pfrsPb0-nEHSRkRfU2NCG5w@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 30 Oct 2023 09:18:08 -0700
Message-ID: <CAMKF1sp=p8UPKsitTyQe7nR3C0YyYOXMRSP5fjAa8C5yBAU21A@mail.gmail.com>
Subject: Re: [oe] [PATCH v2] connectivity: add pcapplusplus recipe
To: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, 
	"openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000eb7e380608f16287"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 30 Oct 2023 16:18:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105796

--000000000000eb7e380608f16287
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Please send the delta as a new patch the v2 is merged

On Mon, Oct 30, 2023 at 6:27 AM Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.c=
om> wrote:

> Hi Peter,
>
> +Khem
>
> On Sat, 28 Oct 2023 at 12:20, Cl=C3=A9ment P=C3=A9ron via lists.openembed=
ded.org
> <peron.clem=3Dgmail.com@lists.openembedded.org> wrote:
> >
> > Hi Peter,
> >
> > On Fri, 27 Oct 2023 at 22:40, Peter Kjellerstedt
> > <peter.kjellerstedt@axis.com> wrote:
> > >
> > > > -----Original Message-----
> > > > From: openembedded-devel@lists.openembedded.org <
> openembedded-devel@lists.openembedded.org> On Behalf Of Cl=C3=A9ment P=C3=
=A9ron
> > > > Sent: den 27 oktober 2023 21:49
> > > > To: openembedded-devel@lists.openembedded.org
> > > > Cc: Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.com>
> > > > Subject: [oe] [PATCH v2] connectivity: add pcapplusplus recipe
> > >
> > > A more standard subject would be something like:
> > >
> > > pcapplusplus: Add recipe
>
> Is it ok, if I send a v3 changing the subject and enabling the shared
> option by default.
>
> But leaving the other packageconfig available.
>
> Does that seem good to you?
>
>
> > >
> > > >
> > > > Add PcapPlusPlus 23.09 recipe.
> > > >
> > > > Signed-off-by: Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.com>
> > > > ---
> > > >  .../pcapplusplus/pcapplusplus_23.09.bb        | 21
> +++++++++++++++++++
> > > >  1 file changed, 21 insertions(+)
> > > >  create mode 100644 meta-oe/recipes-connectivity/pcapplusplus/
> pcapplusplus_23.09.bb
> > > >
> > > > diff --git a/meta-oe/recipes-
> > > > connectivity/pcapplusplus/pcapplusplus_23.09.bb
> b/meta-oe/recipes-connectivity/pcapplusplus/pcapplusplus_23.09.bb
> > > > new file mode 100644
> > > > index 000000000..39c6942c8
> > > > --- /dev/null
> > > > +++ b/meta-oe/recipes-connectivity/pcapplusplus/
> pcapplusplus_23.09.bb
> > > > @@ -0,0 +1,21 @@
> > > > +SUMMARY =3D "A multiplatform C++ library for capturing, parsing an=
d
> crafting of network packets"
> > > > +HOMEPAGE =3D "https://pcapplusplus.github.io/"
> > > > +BUGTRACKER =3D "https://github.com/seladb/PcapPlusPlus/issues"
> > > > +SECTION =3D "libs/network"
> > > > +LICENSE =3D "Unlicense"
> > > > +LIC_FILES_CHKSUM =3D
> "file://LICENSE;md5=3D911690f51af322440237a253d695d19f"
> > > > +
> > > > +DEPENDS =3D "libpcap"
> > > > +
> > > > +SRC_URI =3D "git://
> github.com/seladb/PcapPlusPlus.git;protocol=3Dhttps;branch=3Dmaster"
> > > > +SRCREV =3D "4cf8ed44f9dd145f874dc1dd747dfefcfcab75be"
> > > > +
> > > > +S =3D "${WORKDIR}/git"
> > > > +
> > > > +inherit cmake
> > > > +
> > > > +PACKAGECONFIG ??=3D ""
> > > > +PACKAGECONFIG[examples] =3D
> "-DPCAPPP_BUILD_EXAMPLES=3DON,-DPCAPPP_BUILD_EXAMPLES=3DOFF"
> > > > +PACKAGECONFIG[shared] =3D
> "-DBUILD_SHARED_LIBS=3DON,-DBUILD_SHARED_LIBS=3DOFF"
> > >
> > > Did you really mean to not enable the "shared" PACAKEGCONFIG,
> > > and thus only build static libraries? That seems very odd.
> >
> > Thanks for your feedback, indeed in my application I only use a small
> > part of Pcap++ and don't want to have all the Pcap++ shared library.
> >
> > Also the shared library is not the default behavior on PcapPP repo as
> > they are some issues with Windows DLL.
> >
> > >
> > > > +PACKAGECONFIG[tests] =3D
> "-DPCAPPP_BUILD_TESTS=3DON,-DPCAPPP_BUILD_TESTS=3DOFF"
> > > > +PACKAGECONFIG[zstd] =3D
> "-DLIGHT_PCAPNG_ZSTD=3DON,-DLIGHT_PCAPNG_ZSTD=3DOFF,zstd"
> > >
> > > Since it is unlikely that anyone wants to enable the examples and
> > > only build statically, I would suggest replacing the first two
> > > PACKAGECONFIGs above with:
> >
> > Examples may be bad naming. It's more like "Tools" which binaries like
> > Arping, DnsSpoofing, HttpAnalyzer, etc...
> >
> > Then inside these Examples there are trivial ones that are called
> "Tutorials"
> > which the configuration is not configurable here.
> >
> > >
> > > EXTRA_OECMAKE +=3D "-DBUILD_SHARED_LIBS=3DON -DPCAPPP_BUILD_EXAMPLES=
=3DOFF"
> > >
> > > And unless you plan on adding ptest support, you may as well remove t=
he
> > > tests PACKAGECONFIG too, and make that:
> > >
> > > EXTRA_OECMAKE +=3D "-DBUILD_SHARED_LIBS=3DON -DPCAPPP_BUILD_EXAMPLES=
=3DOFF
> -DPCAPPP_BUILD_TESTS=3DOFF"
> > >
> > > And if either of those three matches the upstream defaults,
> > > you can of course remove it altogether.
> >
> > So you prefer to have everything defined with EXTRA_OECMAKE.
> >
> > Why not let the user have this configurable through packageconfig if
> > it's possible and doesn't cost?
> >
> > Thanks
> > Clement
> >
> > >
> > > > --
> > > > 2.39.3 (Apple Git-145)
> > >
> > > //Peter
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#105785):
> https://lists.openembedded.org/g/openembedded-devel/message/105785
> > Mute This Topic: https://lists.openembedded.org/mt/102228837/4240582
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[
> peron.clem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>

--000000000000eb7e380608f16287
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Please send the delta as a new patch the v2 is merged=C2=
=A0</div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmai=
l_attr">On Mon, Oct 30, 2023 at 6:27 AM Cl=C3=A9ment P=C3=A9ron &lt;<a href=
=3D"mailto:peron.clem@gmail.com">peron.clem@gmail.com</a>&gt; wrote:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left=
:1px #ccc solid;padding-left:1ex">Hi Peter,<br>
<br>
+Khem<br>
<br>
On Sat, 28 Oct 2023 at 12:20, Cl=C3=A9ment P=C3=A9ron via <a href=3D"http:/=
/lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openemb=
edded.org</a><br>
&lt;peron.clem=3D<a href=3D"mailto:gmail.com@lists.openembedded.org" target=
=3D"_blank">gmail.com@lists.openembedded.org</a>&gt; wrote:<br>
&gt;<br>
&gt; Hi Peter,<br>
&gt;<br>
&gt; On Fri, 27 Oct 2023 at 22:40, Peter Kjellerstedt<br>
&gt; &lt;<a href=3D"mailto:peter.kjellerstedt@axis.com" target=3D"_blank">p=
eter.kjellerstedt@axis.com</a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; &gt; -----Original Message-----<br>
&gt; &gt; &gt; From: <a href=3D"mailto:openembedded-devel@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel@lists.openembedded.org</a> &lt;=
<a href=3D"mailto:openembedded-devel@lists.openembedded.org" target=3D"_bla=
nk">openembedded-devel@lists.openembedded.org</a>&gt; On Behalf Of Cl=C3=A9=
ment P=C3=A9ron<br>
&gt; &gt; &gt; Sent: den 27 oktober 2023 21:49<br>
&gt; &gt; &gt; To: <a href=3D"mailto:openembedded-devel@lists.openembedded.=
org" target=3D"_blank">openembedded-devel@lists.openembedded.org</a><br>
&gt; &gt; &gt; Cc: Cl=C3=A9ment P=C3=A9ron &lt;<a href=3D"mailto:peron.clem=
@gmail.com" target=3D"_blank">peron.clem@gmail.com</a>&gt;<br>
&gt; &gt; &gt; Subject: [oe] [PATCH v2] connectivity: add pcapplusplus reci=
pe<br>
&gt; &gt;<br>
&gt; &gt; A more standard subject would be something like:<br>
&gt; &gt;<br>
&gt; &gt; pcapplusplus: Add recipe<br>
<br>
Is it ok, if I send a v3 changing the subject and enabling the shared<br>
option by default.<br>
<br>
But leaving the other packageconfig available.<br>
<br>
Does that seem good to you?<br>
<br>
<br>
&gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Add PcapPlusPlus 23.09 recipe.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Signed-off-by: Cl=C3=A9ment P=C3=A9ron &lt;<a href=3D"mailto=
:peron.clem@gmail.com" target=3D"_blank">peron.clem@gmail.com</a>&gt;<br>
&gt; &gt; &gt; ---<br>
&gt; &gt; &gt;=C2=A0 .../pcapplusplus/<a href=3D"http://pcapplusplus_23.09.=
bb" rel=3D"noreferrer" target=3D"_blank">pcapplusplus_23.09.bb</a>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 | 21 +++++++++++++++++++<br>
&gt; &gt; &gt;=C2=A0 1 file changed, 21 insertions(+)<br>
&gt; &gt; &gt;=C2=A0 create mode 100644 meta-oe/recipes-connectivity/pcappl=
usplus/<a href=3D"http://pcapplusplus_23.09.bb" rel=3D"noreferrer" target=
=3D"_blank">pcapplusplus_23.09.bb</a><br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; diff --git a/meta-oe/recipes-<br>
&gt; &gt; &gt; connectivity/pcapplusplus/<a href=3D"http://pcapplusplus_23.=
09.bb" rel=3D"noreferrer" target=3D"_blank">pcapplusplus_23.09.bb</a> b/met=
a-oe/recipes-connectivity/pcapplusplus/<a href=3D"http://pcapplusplus_23.09=
.bb" rel=3D"noreferrer" target=3D"_blank">pcapplusplus_23.09.bb</a><br>
&gt; &gt; &gt; new file mode 100644<br>
&gt; &gt; &gt; index 000000000..39c6942c8<br>
&gt; &gt; &gt; --- /dev/null<br>
&gt; &gt; &gt; +++ b/meta-oe/recipes-connectivity/pcapplusplus/<a href=3D"h=
ttp://pcapplusplus_23.09.bb" rel=3D"noreferrer" target=3D"_blank">pcapplusp=
lus_23.09.bb</a><br>
&gt; &gt; &gt; @@ -0,0 +1,21 @@<br>
&gt; &gt; &gt; +SUMMARY =3D &quot;A multiplatform C++ library for capturing=
, parsing and crafting of network packets&quot;<br>
&gt; &gt; &gt; +HOMEPAGE =3D &quot;<a href=3D"https://pcapplusplus.github.i=
o/" rel=3D"noreferrer" target=3D"_blank">https://pcapplusplus.github.io/</a=
>&quot;<br>
&gt; &gt; &gt; +BUGTRACKER =3D &quot;<a href=3D"https://github.com/seladb/P=
capPlusPlus/issues" rel=3D"noreferrer" target=3D"_blank">https://github.com=
/seladb/PcapPlusPlus/issues</a>&quot;<br>
&gt; &gt; &gt; +SECTION =3D &quot;libs/network&quot;<br>
&gt; &gt; &gt; +LICENSE =3D &quot;Unlicense&quot;<br>
&gt; &gt; &gt; +LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D911690f51af=
322440237a253d695d19f&quot;<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +DEPENDS =3D &quot;libpcap&quot;<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +SRC_URI =3D &quot;git://<a href=3D"http://github.com/seladb=
/PcapPlusPlus.git;protocol=3Dhttps;branch=3Dmaster" rel=3D"noreferrer" targ=
et=3D"_blank">github.com/seladb/PcapPlusPlus.git;protocol=3Dhttps;branch=3D=
master</a>&quot;<br>
&gt; &gt; &gt; +SRCREV =3D &quot;4cf8ed44f9dd145f874dc1dd747dfefcfcab75be&q=
uot;<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +S =3D &quot;${WORKDIR}/git&quot;<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +inherit cmake<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +PACKAGECONFIG ??=3D &quot;&quot;<br>
&gt; &gt; &gt; +PACKAGECONFIG[examples] =3D &quot;-DPCAPPP_BUILD_EXAMPLES=
=3DON,-DPCAPPP_BUILD_EXAMPLES=3DOFF&quot;<br>
&gt; &gt; &gt; +PACKAGECONFIG[shared] =3D &quot;-DBUILD_SHARED_LIBS=3DON,-D=
BUILD_SHARED_LIBS=3DOFF&quot;<br>
&gt; &gt;<br>
&gt; &gt; Did you really mean to not enable the &quot;shared&quot; PACAKEGC=
ONFIG,<br>
&gt; &gt; and thus only build static libraries? That seems very odd.<br>
&gt;<br>
&gt; Thanks for your feedback, indeed in my application I only use a small<=
br>
&gt; part of Pcap++ and don&#39;t want to have all the Pcap++ shared librar=
y.<br>
&gt;<br>
&gt; Also the shared library is not the default behavior on PcapPP repo as<=
br>
&gt; they are some issues with Windows DLL.<br>
&gt;<br>
&gt; &gt;<br>
&gt; &gt; &gt; +PACKAGECONFIG[tests] =3D &quot;-DPCAPPP_BUILD_TESTS=3DON,-D=
PCAPPP_BUILD_TESTS=3DOFF&quot;<br>
&gt; &gt; &gt; +PACKAGECONFIG[zstd] =3D &quot;-DLIGHT_PCAPNG_ZSTD=3DON,-DLI=
GHT_PCAPNG_ZSTD=3DOFF,zstd&quot;<br>
&gt; &gt;<br>
&gt; &gt; Since it is unlikely that anyone wants to enable the examples and=
<br>
&gt; &gt; only build statically, I would suggest replacing the first two<br=
>
&gt; &gt; PACKAGECONFIGs above with:<br>
&gt;<br>
&gt; Examples may be bad naming. It&#39;s more like &quot;Tools&quot; which=
 binaries like<br>
&gt; Arping, DnsSpoofing, HttpAnalyzer, etc...<br>
&gt;<br>
&gt; Then inside these Examples there are trivial ones that are called &quo=
t;Tutorials&quot;<br>
&gt; which the configuration is not configurable here.<br>
&gt;<br>
&gt; &gt;<br>
&gt; &gt; EXTRA_OECMAKE +=3D &quot;-DBUILD_SHARED_LIBS=3DON -DPCAPPP_BUILD_=
EXAMPLES=3DOFF&quot;<br>
&gt; &gt;<br>
&gt; &gt; And unless you plan on adding ptest support, you may as well remo=
ve the<br>
&gt; &gt; tests PACKAGECONFIG too, and make that:<br>
&gt; &gt;<br>
&gt; &gt; EXTRA_OECMAKE +=3D &quot;-DBUILD_SHARED_LIBS=3DON -DPCAPPP_BUILD_=
EXAMPLES=3DOFF -DPCAPPP_BUILD_TESTS=3DOFF&quot;<br>
&gt; &gt;<br>
&gt; &gt; And if either of those three matches the upstream defaults,<br>
&gt; &gt; you can of course remove it altogether.<br>
&gt;<br>
&gt; So you prefer to have everything defined with EXTRA_OECMAKE.<br>
&gt;<br>
&gt; Why not let the user have this configurable through packageconfig if<b=
r>
&gt; it&#39;s possible and doesn&#39;t cost?<br>
&gt;<br>
&gt; Thanks<br>
&gt; Clement<br>
&gt;<br>
&gt; &gt;<br>
&gt; &gt; &gt; --<br>
&gt; &gt; &gt; 2.39.3 (Apple Git-145)<br>
&gt; &gt;<br>
&gt; &gt; //Peter<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#105785): <a href=3D"https://lists.openembedded.org=
/g/openembedded-devel/message/105785" rel=3D"noreferrer" target=3D"_blank">=
https://lists.openembedded.org/g/openembedded-devel/message/105785</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/10222883=
7/4240582" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.=
org/mt/102228837/4240582</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openem=
bedded.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.o=
rg</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
devel/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedde=
d.org/g/openembedded-devel/unsub</a> [<a href=3D"mailto:peron.clem@gmail.co=
m" target=3D"_blank">peron.clem@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</blockquote></div></div>

--000000000000eb7e380608f16287--

