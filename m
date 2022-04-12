Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15A97C38A2E
	for <webhook@archiver.kernel.org>; Tue, 12 Apr 2022 16:46:40 +0000 (UTC)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com
 [209.85.222.179])
 by mx.groups.io with SMTP id smtpd.web08.5947.1649728214666573789
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 Apr 2022 18:50:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=FmNVUef4;
 spf=pass (domain: gmail.com, ip: 209.85.222.179,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f179.google.com with SMTP id e10so11052755qka.6
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 Apr 2022 18:50:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KNc0MV1fG3s3uRBsDIOkd94CFyvGLZDt1LI2e3dgRWo=;
        b=FmNVUef4gvNeQQcOU/JQAGishynnnTzglLzO8kTEhZJ0Fsda6CWKg7YU1UBxhZqNtF
         mu19iypMgfbVAxjW5R1sQsCAChw0KbTn7YtIC2V4IovSJLPBlyFZIAgbjgEqfDXS3aC3
         Fe0q6gbNR1gazLkOM9+oxy0HScpofmxfMn1gNB/wqDz9kIz4INsy16fQuLYkBqoi+K5g
         w0wMVgMVHz6NQqMrtzFrAsKqQeRkpShw/YM/ad3eGJ+LFefnrW11xSMMVN+9VCnigBkC
         7BB2B0MdcIRcylZzUlkOfqDxtVp2Co4ZZRFQHYYRQC0XlHhSV7S2mBgTZtMRLFMGKbu+
         Uz0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KNc0MV1fG3s3uRBsDIOkd94CFyvGLZDt1LI2e3dgRWo=;
        b=nJNf+clkR/IwLH7q/wghkAvJE3jiDoFZAM8mM34vdOaGFX7N6kk2KwELdpAz7pCbsq
         4Ru5D1q3zOTfkNGh7aW/Z4+nQzuyqLUujXEAQShP/yaiZysf84yhp2fGP9nVDxRtPTSE
         fl8CHHS/yqbVrkDM+kmaT0Qq+6pL0McL4zckeMyL1pDfWV/41D6qm9Ilb04uEahPsPbB
         ltCk/6J8iJ6+BMDMA4aXBgIJSQHEeVcWvI4ZBNczZXcGOcD4DKX0m5jv0j2F3wqdiX3O
         JbyAiOv1YK5B2oRPWDiT5eH97ezVsPdC/EDHLl83WHyI1wPXZWC4fkfW8FNETmTHSVLO
         fzmA==
X-Gm-Message-State: AOAM531Pxf0Mt9dEPsEkMc+pVFqhil+oz61zyyFUrg11D/YyaW+nTJku
	BL8Z+2ayf6ffPCFFjaGAI3hcd4nU5eRIZEQCMjo=
X-Google-Smtp-Source: 
 ABdhPJwme/b0cgqXSfy8+NBHJd8wg7WZ2UzTFrTZC++E4QTBlwvM72dj1aXCumz3v1MlpnoPPqkcCYTkN/wf7bo1Olk=
X-Received: by 2002:a05:620a:4103:b0:67b:49f4:3ee4 with SMTP id
 j3-20020a05620a410300b0067b49f43ee4mr1671391qko.72.1649728213709; Mon, 11 Apr
 2022 18:50:13 -0700 (PDT)
MIME-Version: 1.0
References: <1649423791-29819-1-git-send-email-wangmy@fujitsu.com>
 <1649423791-29819-2-git-send-email-wangmy@fujitsu.com>
 <7080173b-b85f-b0d0-237e-54e7e37cd30f@gmail.com>
 <OSBPR01MB184564889C1BC259A145753EDCED9@OSBPR01MB1845.jpnprd01.prod.outlook.com>
In-Reply-To: 
 <OSBPR01MB184564889C1BC259A145753EDCED9@OSBPR01MB1845.jpnprd01.prod.outlook.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 11 Apr 2022 18:50:02 -0700
Message-ID: 
 <CAMKF1sqKEYfOPm2JCJFNrPhDKaFQsqiAv1CL8QzavEnR7-JYKg@mail.gmail.com>
Subject: Re: [oe] [meta-oe] [PATCH] byacc: upgrade 20211224 -> 20220128
To: "wangmy@fujitsu.com" <wangmy@fujitsu.com>
Cc: "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000027774105dc6b4845"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 12 Apr 2022 16:46:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96559

--00000000000027774105dc6b4845
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 11, 2022 at 6:07 PM wangmy@fujitsu.com <wangmy@fujitsu.com>
wrote:

> After checking, it is found that license is still Public-domain.
> Should we change file of LIC_FILES_CHKSUM to LICENSE?


Ok thanks


>
>   --
> Best Regards
> ---------------------------------------------------
> Wang Mingyu
> Development Dept.I
> Nanjing Fujitsu Nanda Software Tech. Co., Ltd.(FNST) No. 6 Wenzhu Road,
> Nanjing, 210012, China
> <https://www.google.com/maps/search/Wenzhu+Road,+Nanjing,+210012,+China?e=
ntry=3Dgmail&source=3Dg>
> TEL: +86+25-86630566-8568
> COINS: 79988548
> FAX: +86+25-83317685
> MAIL: wangmy@fujitsu.com
> http://www.fujitsu.com/cn/fnst/
>
> > -----Original Message-----
> > From: Khem Raj <raj.khem@gmail.com>
> > Sent: Monday, April 11, 2022 11:52 PM
> > To: Wang, Mingyu/=E7=8E=8B =E9=B8=A3=E7=91=9C <wangmy@fujitsu.com>;
> > openembedded-devel@lists.openembedded.org
> > Subject: Re: [oe] [meta-oe] [PATCH] byacc: upgrade 20211224 -> 20220128
> >
> >
> >
> > On 4/8/22 6:16 AM, wangmy wrote:
> > > All changes from 20211224 to 20220128 included in
> > > https://invisible-island.net/byacc/CHANGES.html
> > >
> > > License-Update:
> > > ----------------
> > > - Add Format, Upstream-Name, Upstream-Contact to byacc.
> > > - Add "Copyright:  2001-2021,2022 by Thomas E. Dickey" to all files o=
f
> > >    byacc.
> > > - Copyright of aclocal.m4 and package/debian/* updated to 2022.
> > > - Modify Licence to License.
> > > - Add "Copyright: 1992-2021 Free Software Foundation, Inc." and
> "License:
> > GPL-3"
> > >    to config.guess config.sub
> >
> > Is the overall license still 'PD' after all these changes? Can you chec=
k
> >
> > >
> > > Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> > > ---
> > >   .../byacc/{byacc_20211224.bb =3D> byacc_20220128.bb}            | 4
> > ++--
> > >   1 file changed, 2 insertions(+), 2 deletions(-)
> > >   rename meta-oe/recipes-extended/byacc/{byacc_20211224.bb =3D>
> > > byacc_20220128.bb} (65%)
> > >
> > > diff --git a/meta-oe/recipes-extended/byacc/byacc_20211224.bb
> > > b/meta-oe/recipes-extended/byacc/byacc_20220128.bb
> > > similarity index 65%
> > > rename from meta-oe/recipes-extended/byacc/byacc_20211224.bb
> > > rename to meta-oe/recipes-extended/byacc/byacc_20220128.bb
> > > index 85e5072716..8aa8767d37 100644
> > > --- a/meta-oe/recipes-extended/byacc/byacc_20211224.bb
> > > +++ b/meta-oe/recipes-extended/byacc/byacc_20220128.bb
> > > @@ -4,7 +4,7 @@
> > >   # Setting to PD as this is what the upstream has it as.
> > >
> > >   LICENSE =3D "PD"
> > > -LIC_FILES_CHKSUM =3D
> > "file://package/debian/copyright;md5=3De13dd32663e3159031608d536530a08
> > 0"
> > > +LIC_FILES_CHKSUM =3D
> > "file://package/debian/copyright;md5=3D62c37a10a2faf90235ee64280ad72737
> > "
> > >   require byacc.inc
> > >
> > > -SRC_URI[sha256sum] =3D
> > "7bc42867a095df2189618b64497016298818e88e513fca792cb5adc9a68ebfb8
> > "
> > > +SRC_URI[sha256sum] =3D
> > "42c1805cc529314e6a76326fe1b33e80c70862a44b01474da362e2f7db2d749
> > c"
> > >
> > >
> > >
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > Links: You receive all messages sent to this group.
> > > View/Reply Online (#96544):
> > > https://lists.openembedded.org/g/openembedded-devel/message/96544
> > > Mute This Topic: https://lists.openembedded.org/mt/90389513/1997914
> > > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > > Unsubscribe:
> > https://lists.openembedded.org/g/openembedded-devel/unsub
> > > [raj.khem@gmail.com]
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > >
>

--00000000000027774105dc6b4845
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Mon, Apr 11, 2022 at 6:07 PM <a href=3D"mailto:wangmy@fu=
jitsu.com">wangmy@fujitsu.com</a> &lt;<a href=3D"mailto:wangmy@fujitsu.com"=
>wangmy@fujitsu.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">=
After checking, it is found that license is still Public-domain. <br>
Should we change file of LIC_FILES_CHKSUM to LICENSE?</blockquote><div dir=
=3D"auto"><br></div><div dir=3D"auto">Ok thanks=C2=A0</div><div dir=3D"auto=
"><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex" dir=3D"auto"><br>
<br>
=C2=A0 --<br>
Best Regards<br>
---------------------------------------------------<br>
Wang Mingyu<br>
Development Dept.I<br>
Nanjing Fujitsu Nanda Software Tech. Co., Ltd.(FNST) No. 6 <a href=3D"https=
://www.google.com/maps/search/Wenzhu+Road,+Nanjing,+210012,+China?entry=3Dg=
mail&amp;source=3Dg">Wenzhu Road, Nanjing, 210012, China</a><br>
TEL: +86+25-86630566-8568<br>
COINS: 79988548<br>
FAX: +86+25-83317685<br>
MAIL: <a href=3D"mailto:wangmy@fujitsu.com" target=3D"_blank">wangmy@fujits=
u.com</a><br>
<a href=3D"http://www.fujitsu.com/cn/fnst/" rel=3D"noreferrer" target=3D"_b=
lank">http://www.fujitsu.com/cn/fnst/</a><br>
<br>
&gt; -----Original Message-----<br>
&gt; From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_bl=
ank">raj.khem@gmail.com</a>&gt;<br>
&gt; Sent: Monday, April 11, 2022 11:52 PM<br>
&gt; To: Wang, Mingyu/=E7=8E=8B =E9=B8=A3=E7=91=9C &lt;<a href=3D"mailto:wa=
ngmy@fujitsu.com" target=3D"_blank">wangmy@fujitsu.com</a>&gt;;<br>
&gt; <a href=3D"mailto:openembedded-devel@lists.openembedded.org" target=3D=
"_blank">openembedded-devel@lists.openembedded.org</a><br>
&gt; Subject: Re: [oe] [meta-oe] [PATCH] byacc: upgrade 20211224 -&gt; 2022=
0128<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; On 4/8/22 6:16 AM, wangmy wrote:<br>
&gt; &gt; All changes from 20211224 to 20220128 included in<br>
&gt; &gt; <a href=3D"https://invisible-island.net/byacc/CHANGES.html" rel=
=3D"noreferrer" target=3D"_blank">https://invisible-island.net/byacc/CHANGE=
S.html</a><br>
&gt; &gt;<br>
&gt; &gt; License-Update:<br>
&gt; &gt; ----------------<br>
&gt; &gt; - Add Format, Upstream-Name, Upstream-Contact to byacc.<br>
&gt; &gt; - Add &quot;Copyright:=C2=A0 2001-2021,2022 by Thomas E. Dickey&q=
uot; to all files of<br>
&gt; &gt;=C2=A0 =C2=A0 byacc.<br>
&gt; &gt; - Copyright of aclocal.m4 and package/debian/* updated to 2022.<b=
r>
&gt; &gt; - Modify Licence to License.<br>
&gt; &gt; - Add &quot;Copyright: 1992-2021 Free Software Foundation, Inc.&q=
uot; and &quot;License:<br>
&gt; GPL-3&quot;<br>
&gt; &gt;=C2=A0 =C2=A0 to config.guess config.sub<br>
&gt; <br>
&gt; Is the overall license still &#39;PD&#39; after all these changes? Can=
 you check<br>
&gt; <br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Wang Mingyu &lt;<a href=3D"mailto:wangmy@fujitsu.c=
om" target=3D"_blank">wangmy@fujitsu.com</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 =C2=A0.../byacc/{<a href=3D"http://byacc_20211224.bb" rel=
=3D"noreferrer" target=3D"_blank">byacc_20211224.bb</a> =3D&gt; <a href=3D"=
http://byacc_20220128.bb" rel=3D"noreferrer" target=3D"_blank">byacc_202201=
28.bb</a>}=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 4<br>
&gt; ++--<br>
&gt; &gt;=C2=A0 =C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
&gt; &gt;=C2=A0 =C2=A0rename meta-oe/recipes-extended/byacc/{<a href=3D"htt=
p://byacc_20211224.bb" rel=3D"noreferrer" target=3D"_blank">byacc_20211224.=
bb</a> =3D&gt;<br>
&gt; &gt; <a href=3D"http://byacc_20220128.bb" rel=3D"noreferrer" target=3D=
"_blank">byacc_20220128.bb</a>} (65%)<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/meta-oe/recipes-extended/byacc/<a href=3D"http://bya=
cc_20211224.bb" rel=3D"noreferrer" target=3D"_blank">byacc_20211224.bb</a><=
br>
&gt; &gt; b/meta-oe/recipes-extended/byacc/<a href=3D"http://byacc_20220128=
.bb" rel=3D"noreferrer" target=3D"_blank">byacc_20220128.bb</a><br>
&gt; &gt; similarity index 65%<br>
&gt; &gt; rename from meta-oe/recipes-extended/byacc/<a href=3D"http://byac=
c_20211224.bb" rel=3D"noreferrer" target=3D"_blank">byacc_20211224.bb</a><b=
r>
&gt; &gt; rename to meta-oe/recipes-extended/byacc/<a href=3D"http://byacc_=
20220128.bb" rel=3D"noreferrer" target=3D"_blank">byacc_20220128.bb</a><br>
&gt; &gt; index 85e5072716..8aa8767d37 100644<br>
&gt; &gt; --- a/meta-oe/recipes-extended/byacc/<a href=3D"http://byacc_2021=
1224.bb" rel=3D"noreferrer" target=3D"_blank">byacc_20211224.bb</a><br>
&gt; &gt; +++ b/meta-oe/recipes-extended/byacc/<a href=3D"http://byacc_2022=
0128.bb" rel=3D"noreferrer" target=3D"_blank">byacc_20220128.bb</a><br>
&gt; &gt; @@ -4,7 +4,7 @@<br>
&gt; &gt;=C2=A0 =C2=A0# Setting to PD as this is what the upstream has it a=
s.<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0LICENSE =3D &quot;PD&quot;<br>
&gt; &gt; -LIC_FILES_CHKSUM =3D<br>
&gt; &quot;file://package/debian/copyright;md5=3De13dd32663e3159031608d5365=
30a08<br>
&gt; 0&quot;<br>
&gt; &gt; +LIC_FILES_CHKSUM =3D<br>
&gt; &quot;file://package/debian/copyright;md5=3D62c37a10a2faf90235ee64280a=
d72737<br>
&gt; &quot;<br>
&gt; &gt;=C2=A0 =C2=A0require byacc.inc<br>
&gt; &gt;<br>
&gt; &gt; -SRC_URI[sha256sum] =3D<br>
&gt; &quot;7bc42867a095df2189618b64497016298818e88e513fca792cb5adc9a68ebfb8=
<br>
&gt; &quot;<br>
&gt; &gt; +SRC_URI[sha256sum] =3D<br>
&gt; &quot;42c1805cc529314e6a76326fe1b33e80c70862a44b01474da362e2f7db2d749<=
br>
&gt; c&quot;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; &gt; Links: You receive all messages sent to this group.<br>
&gt; &gt; View/Reply Online (#96544):<br>
&gt; &gt; <a href=3D"https://lists.openembedded.org/g/openembedded-devel/me=
ssage/96544" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedde=
d.org/g/openembedded-devel/message/96544</a><br>
&gt; &gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/903=
89513/1997914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembed=
ded.org/mt/90389513/1997914</a><br>
&gt; &gt; Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.o=
penembedded.org" target=3D"_blank">openembedded-devel+owner@lists.openembed=
ded.org</a><br>
&gt; &gt; Unsubscribe:<br>
&gt; <a href=3D"https://lists.openembedded.org/g/openembedded-devel/unsub" =
rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/g/opene=
mbedded-devel/unsub</a><br>
&gt; &gt; [<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem=
@gmail.com</a>]<br>
&gt; &gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; &gt;<br>
</blockquote></div></div>

--00000000000027774105dc6b4845--

