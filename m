Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59B29CAC592
	for <webhook@archiver.kernel.org>; Fri, 19 Sep 2025 12:59:57 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web10.16088.1758286781786540066
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 19 Sep 2025 05:59:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=xdJFgWvf;
 spf=pass (domain: smile.fr, ip: 209.85.221.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3ee64bc6b90so559180f8f.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 19 Sep 2025 05:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1758286780; x=1758891580; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=S6LDMoCXEMhMYlu37gdT91tSZWpiqkYXWp+jbcHBl2g=;
        b=xdJFgWvfCf3kemjYrGRA6C1OBHvA6SaXFnT+kDewkfgxq9IO6mtmaSQZL+L5gfE9o+
         Tn1BT3m/NCatYAT3A2Uirc7Kv7ePwJR3M6Q27V0sBRay7XHJ/F6hIBOeRtZBptobVMX9
         KhtVResl8lvH82lAU/mdzOermjpevfyvoHmNI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758286780; x=1758891580;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S6LDMoCXEMhMYlu37gdT91tSZWpiqkYXWp+jbcHBl2g=;
        b=D5CNy/wiyY9hMADM827S78Zsw1DM2ZuaAGvoWfRbAspJsMNd0+WDFGAqVPXztOcmko
         JZsaftCB4nrs2K9wJFbk1fn4Eg57ixcTzEsfjkZyF2OH0FOUane/kauML7Z1oDdFS7v2
         x+BavAGRB6n7e/JdmBnEZz9oFFUr8UuatZ92Jf+fPtJvUKxbCrSfdwavavkhCa0CpU34
         PFH8DU6GbHgQF0rcJBAyXe3Z4eNmQz+dVpVri8+G0n/4Q6GPFytsin0+N1ediZDAyUWC
         lQBBsMjGoZ8XXp6E32LFjuoYEQ873fuKxdAA3L/yOf2OirlJzIORPTRxaKa/Wt4L2Xya
         M5OQ==
X-Gm-Message-State: AOJu0Yw7jNo3Fq/GdsdAIPq4zCVcLHBUmbsb4rbCQX3fY098n0Yzkiyr
	1Akg0z99SjMDMtJsCUNK7XwELdnVZdyy11fg1BP/G3zwVINy37oYtts1ESfBX57P9v9JPhTFDV6
	AAdjeLFixqTl1nxAKFclnESZ4Fez0v7CbnP2HI0TeYQ==
X-Gm-Gg: ASbGnct2KPYYnB8Sb4tBoVQM5D8r8xTg1R+8uz+guFaG7haZNAmpxuMdTyoiJNwcNo7
	YSv+iQGE+HwlJFqasdxm3pLXAG64gpg/5BZTytZDMV5rhC1mmOGkzs1enMnN6nIUxP9AyyluzJs
	xWRFWfMIaOAU9A429/yFwQK2DE8Y5M9gE+Qs778oNfJevwAoe37Af442rcBlnbaqclSNN+F/ZCz
	5R32sIV2ZeHIKkgos9OaRo8DeRYIZUX51iwXEwYnw==
X-Google-Smtp-Source: AGHT+IGM3QhHn9TphYNHswKGQIJvCR36hY+n+6HG+AvMaVmloN0g86yMNz9mO6Q1rGbtcF7sfoRjjnBM0cBbe1Fot/E=
X-Received: by 2002:a05:6000:2506:b0:3e6:116a:8fdf with SMTP id
 ffacd0b85a97d-3ee7c55292amr2117169f8f.13.1758286779938; Fri, 19 Sep 2025
 05:59:39 -0700 (PDT)
MIME-Version: 1.0
References: <20250918102642.487522-1-zboszor@gmail.com> <CAMSfU+6F0GngYjP=07gUWFo4Tvf=hk=rG6CgAnV16BrK8UuBEg@mail.gmail.com>
 <CAMSfU+6tnHY2yyjTRJ9Y+jjCQE8=f-g+V2N_22TK1vBTYZp5GA@mail.gmail.com>
 <f7ce8c19-fb1e-4a4f-80eb-c41c79aef706@gmail.com> <CAMSfU+5b8ARRgzOtbzP+-VpL2U1eHtngOJVUDnU+Oxq-_AvzOA@mail.gmail.com>
 <18669759DF68E69D.23626@lists.openembedded.org> <a72619e7-2fc5-404b-9d28-2b52caa90cc6@gmail.com>
In-Reply-To: <a72619e7-2fc5-404b-9d28-2b52caa90cc6@gmail.com>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Fri, 19 Sep 2025 14:59:12 +0200
X-Gm-Features: AS18NWAkP1ZIWdFMj6x9ZmjOdAATeejR3ocS5dOEMxu8TbEt10ORW-1X0-OV9gs
Message-ID: <CAMSfU+7ZYk2gOrS4EyASgmSsZ8yv2Jk_sNs4dJ39EtOg-6O23g@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] gutenprint: 5.3.5
To: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
Cc: openembedded-devel@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000eea0ed063f270ab0"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 19 Sep 2025 12:59:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119596

--000000000000eea0ed063f270ab0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le ven. 19 sept. 2025 =C3=A0 08:09, B=C3=B6sz=C3=B6rm=C3=A9nyi Zolt=C3=A1n =
<zboszor@gmail.com> a
=C3=A9crit :

> 2025. 09. 19. 7:18 keltez=C3=A9ssel, Zoltan Boszormenyi via
> lists.openembedded.org =C3=ADrta:
> > 2025. 09. 18. 20:41 keltez=C3=A9ssel, Yoann Congal =C3=ADrta:
> >>
> >>
> >> Le jeu. 18 sept. 2025 =C3=A0 20:22, B=C3=B6sz=C3=B6rm=C3=A9nyi Zolt=C3=
=A1n <zboszor@gmail.com>
> a =C3=A9crit :
> >>
> >>     2025. 09. 18. 19:42 keltez=C3=A9ssel, Yoann Congal =C3=ADrta:
> >>     >
> >>     >
> >>     > Le jeu. 18 sept. 2025 =C3=A0 16:16, Yoann Congal <
> yoann.congal@smile.fr> a =C3=A9crit :
> >>     >
> >>     >     Hello,
> >>     >
> >>     >     Le jeu. 18 sept. 2025 =C3=A0 12:26, Zoltan Boszormenyi via
> lists.openembedded.org
> >>     <http://lists.openembedded.org>
> >>     >     <http://lists.openembedded.org> <zboszor=3D
> gmail.com@lists.openembedded.org> a
> >>     =C3=A9crit :
> >>     >
> >>     >         This fixes an installation error:
> >>     >
> >>     >         | make[5]: Entering directory
> >>     >  '.../tmp/work/corei7-64-oe-linux/gutenprint/5.3.4/build/src/cup=
s'
> >>     >         | chmod 700
> >>     >
> >>
>  .../tmp/work/corei7-64-oe-linux/gutenprint/5.3.4/image/usr/libexec/cups/=
backend/backend_gutenprint
> >>     >         | chmod: cannot access
> >>     >
> >>
>  '.../tmp/work/corei7-64-oe-linux/gutenprint/5.3.4/image/usr/libexec/cups=
/backend/backend_gutenprint':
> >>     >         No such file or directory
> >>     >
> >>     >
> >>     >     What makes you say that the 5.3.4->5.3.5 upgrade fix this bu=
g?
> >>     >
> >>
> >>     I got the error with 5.3.4 and it has gone away with 5.3.5.
> >>     I admit that I only tried the build once. I will retry tomorrow.
> >>
> >>
> >> This error is a rare intermittent failure. You will most likely not se=
e
> it but that
> >> does not mean it's fixed (sadly).
>
> How about adding PARALLEL_MAKEINST =3D "" to disable parallelism during
> do_install?
>

That would hide the race-condition bug instead of fixing it but that would
be fine with me.


> > You are right. After "repo sync", I can't reproduce the
> > build problem anymore, with neither 5.3.4 nor 5.3.5.
> > I haven't noted the layers' commits before, so I can't go back.
> >
> > I tried this sequence a couple of times for both versions
> > this morning and neither version failed:
> >
> > bitbake -c clean gutenprint-native gutenprint && \
> > bitbake -c cleansstate gutenprint-native gutenprint && \
> > bitbake -c install gutenprint
> >
> > FWIW, the CPU has 16 cores, 32 threads and a HDD stores the build.
> >
> >> Did the 5.3.4 version on which you saw the problem had my patch?
> >
> > Yes.
>

Groumph, I really believed my patch fixed that :-/


> >
> >>     >     The above error is the one I fixed with the patch
> >>     >
>  "0001-cups-fix-a-build-race-condition-around-empty-directo.patch" and th=
is
> patch
> >> has
> >>     >     not been merged upstream nor the code I touched changed. I
> did not see anything
> >>     >     related by quickly reading the NEWS.
> >>     >     I'd be happy to see this fixed upstream but I'd rather have
> upstream
> >> confirmation
> >>     >     that they saw/fixed it (a commit, a changelog, ...).
> >>     >     If that is fixed upstream, then we can drop my patch.
> >>     >
> >>     >
> >>     > To be clear, I'm not against upgrading. I just don't think the
> commit message is
> >>     correct
> >>     > (but could be convinced otherwise).
> >>     >
> >>     >     Thanks!
> >>     >
> >>     >         Signed-off-by: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <z=
boszor@gmail.com>
> >>     >         ---
> >>     >          .../gutenprint/{gutenprint_5.3.4.bb <
> http://gutenprint_5.3.4.bb>
> >>     <http://gutenprint_5.3.4.bb> =3D>
> >>     > gutenprint_5.3.5.bb <http://gutenprint_5.3.5.bb> <
> http://gutenprint_5.3.5.bb>}
> >>      | 2 +-
> >>     >          1 file changed, 1 insertion(+), 1 deletion(-)
> >>     >          rename meta-oe/recipes-printing/gutenprint/{
> gutenprint_5.3.4.bb
> >>     <http://gutenprint_5.3.4.bb>
> >>     >         <http://gutenprint_5.3.4.bb> =3D> gutenprint_5.3.5.bb
> >>     <http://gutenprint_5.3.5.bb>
> >>     >         <http://gutenprint_5.3.5.bb>} (96%)
> >>     >
> >>     >         diff --git a/meta-oe/recipes-printing/gutenprint/
> gutenprint_5.3.4.bb
> >>     <http://gutenprint_5.3.4.bb>
> >>     >         <http://gutenprint_5.3.4.bb>
> >>     >  b/meta-oe/recipes-printing/gutenprint/gutenprint_5.3.5.bb
> >>     <http://gutenprint_5.3.5.bb>
> >>     >         <http://gutenprint_5.3.5.bb>
> >>     >         similarity index 96%
> >>     >         rename from meta-oe/recipes-printing/gutenprint/
> gutenprint_5.3.4.bb
> >>     <http://gutenprint_5.3.4.bb>
> >>     >         <http://gutenprint_5.3.4.bb>
> >>     >         rename to meta-oe/recipes-printing/gutenprint/
> gutenprint_5.3.5.bb
> >>     <http://gutenprint_5.3.5.bb>
> >>     >         <http://gutenprint_5.3.5.bb>
> >>     >         index f90a123293..82953b798c 100644
> >>     >         --- a/meta-oe/recipes-printing/gutenprint/
> gutenprint_5.3.4.bb
> >>     <http://gutenprint_5.3.4.bb>
> >>     >         <http://gutenprint_5.3.4.bb>
> >>     >         +++ b/meta-oe/recipes-printing/gutenprint/
> gutenprint_5.3.5.bb
> >>     <http://gutenprint_5.3.5.bb>
> >>     >         <http://gutenprint_5.3.5.bb>
> >>     >         @@ -17,7 +17,7 @@ LIC_FILES_CHKSUM =3D
> >>     >  "file://COPYING;md5=3D59530bdf33659b29e73d4adb9f9f6552"
> >>     >          SRC_URI =3D "
> https://downloads.sourceforge.net/gimp-print/${BP}.tar.xz
> >> <https://downloads.sourceforge.net/gimp-print/$%7BBP%7D.tar.xz>
> >>     >  <https://downloads.sourceforge.net/gimp-print/$%7BBP%7D.tar.xz>
> \
> >>     >
>  file://0001-cups-fix-a-build-race-condition-around-empty-directo.patch \
> >>     >                     "
> >>     >         -SRC_URI[sha256sum] =3D
> >>     >
>  "db44a701d2b8e6a8931c83cec06c91226be266d23e5c189d20a39dd175f2023b"
> >>     >         +SRC_URI[sha256sum] =3D
> >>     >
>  "f5a9f47de28530b1ae2069cfbc647a9a641baeeabe809bb0ef2b3ec5b9668d70"
> >>     >
> >>     >          inherit autotools gettext pkgconfig
> >>     >
> >>     >         --
> >>     >         2.51.0
> >>     >
> >>     >
> >>     >
> >>     >
> >>     >
> >>     >
> >>     >     --
> >>     >     Yoann Congal
> >>     >     Smile ECS
> >>     >
> >>     >
> >>     >
> >>     > --
> >>     > Yoann Congal
> >>     > Smile ECS
> >>
> >>
> >>
> >> --
> >> Yoann Congal
> >> Smile ECS
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#119589):
> https://lists.openembedded.org/g/openembedded-devel/message/119589
> > Mute This Topic: https://lists.openembedded.org/mt/115307539/3617728
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[
> zboszor@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>
>

--=20
Yoann Congal
Smile ECS

--000000000000eea0ed063f270ab0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0ven. 19=
 sept. 2025 =C3=A0=C2=A008:09, B=C3=B6sz=C3=B6rm=C3=A9nyi Zolt=C3=A1n &lt;<=
a href=3D"mailto:zboszor@gmail.com">zboszor@gmail.com</a>&gt; a =C3=A9crit=
=C2=A0:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">2025. 09=
. 19. 7:18 keltez=C3=A9ssel, Zoltan Boszormenyi via <a href=3D"http://lists=
.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.=
org</a> =C3=ADrta:<br>
&gt; 2025. 09. 18. 20:41 keltez=C3=A9ssel, Yoann Congal =C3=ADrta:<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; Le=C2=A0jeu. 18 sept. 2025 =C3=A0=C2=A020:22, B=C3=B6sz=C3=B6rm=C3=
=A9nyi Zolt=C3=A1n &lt;<a href=3D"mailto:zboszor@gmail.com" target=3D"_blan=
k">zboszor@gmail.com</a>&gt; a =C3=A9crit=C2=A0:<br>
&gt;&gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 2025. 09. 18. 19:42 keltez=C3=A9ssel, Yoann Con=
gal =C3=ADrta:<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 &gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 &gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 &gt; Le=C2=A0jeu. 18 sept. 2025 =C3=A0=C2=A016:=
16, Yoann Congal &lt;<a href=3D"mailto:yoann.congal@smile.fr" target=3D"_bl=
ank">yoann.congal@smile.fr</a>&gt; a =C3=A9crit=C2=A0:<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 &gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0Hello,<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 &gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0Le=C2=A0jeu. 18 sept. 2=
025 =C3=A0=C2=A012:26, Zoltan Boszormenyi via <a href=3D"http://lists.opene=
mbedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org</a=
><br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 &lt;<a href=3D"http://lists.openembedded.org" r=
el=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org</a>&gt;<b=
r>
&gt;&gt; =C2=A0=C2=A0=C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://l=
ists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">http://lists.op=
enembedded.org</a>&gt; &lt;zboszor=3D<a href=3D"mailto:gmail.com@lists.open=
embedded.org" target=3D"_blank">gmail.com@lists.openembedded.org</a>&gt; a<=
br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 =C3=A9crit=C2=A0:<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 &gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0This fixe=
s an installation error:<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 &gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| make[5]=
: Entering directory<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 &gt; =C2=A0&#39;.../tmp/work/corei7-64-oe-linux=
/gutenprint/5.3.4/build/src/cups&#39;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| chmod 7=
00<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 &gt;<br>
&gt;&gt; =C2=A0.../tmp/work/corei7-64-oe-linux/gutenprint/5.3.4/image/usr/l=
ibexec/cups/backend/backend_gutenprint<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| chmod: =
cannot access<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 &gt;<br>
&gt;&gt; =C2=A0&#39;.../tmp/work/corei7-64-oe-linux/gutenprint/5.3.4/image/=
usr/libexec/cups/backend/backend_gutenprint&#39;:<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0No such f=
ile or directory<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 &gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 &gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0What makes you say that=
 the 5.3.4-&gt;5.3.5 upgrade fix this bug?<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 &gt;<br>
&gt;&gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 I got the error with 5.3.4 and it has gone away=
 with 5.3.5.<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 I admit that I only tried the build once. I wil=
l retry tomorrow.<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; This error is a rare intermittent failure. You will most likely no=
t see it but that <br>
&gt;&gt; does not mean it&#39;s fixed (sadly).<br>
<br>
How about adding PARALLEL_MAKEINST =3D &quot;&quot; to disable parallelism =
during do_install?<br></blockquote><div><br></div><div>That would hide the =
race-condition bug instead of fixing it but that would be fine with me.=C2=
=A0</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>
&gt; You are right. After &quot;repo sync&quot;, I can&#39;t reproduce the<=
br>
&gt; build problem anymore, with neither 5.3.4 nor 5.3.5.<br>
&gt; I haven&#39;t noted the layers&#39; commits before, so I can&#39;t go =
back.<br>
&gt;<br>
&gt; I tried this sequence a couple of times for both versions<br>
&gt; this morning and neither version failed:<br>
&gt;<br>
&gt; bitbake -c clean gutenprint-native gutenprint &amp;&amp; \<br>
&gt; bitbake -c cleansstate gutenprint-native gutenprint &amp;&amp; \<br>
&gt; bitbake -c install gutenprint<br>
&gt;<br>
&gt; FWIW, the CPU has 16 cores, 32 threads and a HDD stores the build.<br>
&gt;<br>
&gt;&gt; Did the 5.3.4 version on which you saw the problem had my patch?<b=
r>
&gt;<br>
&gt; Yes.<br></blockquote><div><br></div><div>Groumph, I really believed=C2=
=A0my patch fixed that :-/</div><div>=C2=A0</div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">
&gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0The above error is the =
one I fixed with the patch<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 &gt; =C2=A0&quot;0001-cups-fix-a-build-race-con=
dition-around-empty-directo.patch&quot; and this patch <br>
&gt;&gt; has<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0not been merged upstrea=
m nor the code I touched changed. I did not see anything<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0related by quickly read=
ing the NEWS.<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0I&#39;d be happy to see=
 this fixed upstream but I&#39;d rather have upstream <br>
&gt;&gt; confirmation<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0that they saw/fixed it =
(a commit, a changelog, ...).<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0If that is fixed upstre=
am, then we can drop my patch.<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 &gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 &gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 &gt; To be clear, I&#39;m not against upgrading=
. I just don&#39;t think the commit message is<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 correct<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 &gt; (but could be convinced otherwise).<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 &gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0Thanks!<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 &gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Signed-of=
f-by: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi &lt;<a href=3D"mailto:zboszor@=
gmail.com" target=3D"_blank">zboszor@gmail.com</a>&gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0---<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0...=
/gutenprint/{<a href=3D"http://gutenprint_5.3.4.bb" rel=3D"noreferrer" targ=
et=3D"_blank">gutenprint_5.3.4.bb</a> &lt;<a href=3D"http://gutenprint_5.3.=
4.bb" rel=3D"noreferrer" target=3D"_blank">http://gutenprint_5.3.4.bb</a>&g=
t;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 &lt;<a href=3D"http://gutenprint_5.3.4.bb" rel=
=3D"noreferrer" target=3D"_blank">http://gutenprint_5.3.4.bb</a>&gt; =3D&gt=
;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 &gt; <a href=3D"http://gutenprint_5.3.5.bb" rel=
=3D"noreferrer" target=3D"_blank">gutenprint_5.3.5.bb</a> &lt;<a href=3D"ht=
tp://gutenprint_5.3.5.bb" rel=3D"noreferrer" target=3D"_blank">http://guten=
print_5.3.5.bb</a>&gt; &lt;<a href=3D"http://gutenprint_5.3.5.bb" rel=3D"no=
referrer" target=3D"_blank">http://gutenprint_5.3.5.bb</a>&gt;}<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 =C2=A0| 2 +-<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A01 f=
ile changed, 1 insertion(+), 1 deletion(-)<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0ren=
ame meta-oe/recipes-printing/gutenprint/{<a href=3D"http://gutenprint_5.3.4=
.bb" rel=3D"noreferrer" target=3D"_blank">gutenprint_5.3.4.bb</a><br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 &lt;<a href=3D"http://gutenprint_5.3.4.bb" rel=
=3D"noreferrer" target=3D"_blank">http://gutenprint_5.3.4.bb</a>&gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a hr=
ef=3D"http://gutenprint_5.3.4.bb" rel=3D"noreferrer" target=3D"_blank">http=
://gutenprint_5.3.4.bb</a>&gt; =3D&gt; <a href=3D"http://gutenprint_5.3.5.b=
b" rel=3D"noreferrer" target=3D"_blank">gutenprint_5.3.5.bb</a><br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 &lt;<a href=3D"http://gutenprint_5.3.5.bb" rel=
=3D"noreferrer" target=3D"_blank">http://gutenprint_5.3.5.bb</a>&gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a hr=
ef=3D"http://gutenprint_5.3.5.bb" rel=3D"noreferrer" target=3D"_blank">http=
://gutenprint_5.3.5.bb</a>&gt;} (96%)<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 &gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0diff --gi=
t a/meta-oe/recipes-printing/gutenprint/<a href=3D"http://gutenprint_5.3.4.=
bb" rel=3D"noreferrer" target=3D"_blank">gutenprint_5.3.4.bb</a><br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 &lt;<a href=3D"http://gutenprint_5.3.4.bb" rel=
=3D"noreferrer" target=3D"_blank">http://gutenprint_5.3.4.bb</a>&gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a hr=
ef=3D"http://gutenprint_5.3.4.bb" rel=3D"noreferrer" target=3D"_blank">http=
://gutenprint_5.3.4.bb</a>&gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 &gt; =C2=A0b/meta-oe/recipes-printing/gutenprin=
t/<a href=3D"http://gutenprint_5.3.5.bb" rel=3D"noreferrer" target=3D"_blan=
k">gutenprint_5.3.5.bb</a><br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 &lt;<a href=3D"http://gutenprint_5.3.5.bb" rel=
=3D"noreferrer" target=3D"_blank">http://gutenprint_5.3.5.bb</a>&gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a hr=
ef=3D"http://gutenprint_5.3.5.bb" rel=3D"noreferrer" target=3D"_blank">http=
://gutenprint_5.3.5.bb</a>&gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0similarit=
y index 96%<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rename fr=
om meta-oe/recipes-printing/gutenprint/<a href=3D"http://gutenprint_5.3.4.b=
b" rel=3D"noreferrer" target=3D"_blank">gutenprint_5.3.4.bb</a><br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 &lt;<a href=3D"http://gutenprint_5.3.4.bb" rel=
=3D"noreferrer" target=3D"_blank">http://gutenprint_5.3.4.bb</a>&gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a hr=
ef=3D"http://gutenprint_5.3.4.bb" rel=3D"noreferrer" target=3D"_blank">http=
://gutenprint_5.3.4.bb</a>&gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rename to=
 meta-oe/recipes-printing/gutenprint/<a href=3D"http://gutenprint_5.3.5.bb"=
 rel=3D"noreferrer" target=3D"_blank">gutenprint_5.3.5.bb</a><br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 &lt;<a href=3D"http://gutenprint_5.3.5.bb" rel=
=3D"noreferrer" target=3D"_blank">http://gutenprint_5.3.5.bb</a>&gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a hr=
ef=3D"http://gutenprint_5.3.5.bb" rel=3D"noreferrer" target=3D"_blank">http=
://gutenprint_5.3.5.bb</a>&gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0index f90=
a123293..82953b798c 100644<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--- a/met=
a-oe/recipes-printing/gutenprint/<a href=3D"http://gutenprint_5.3.4.bb" rel=
=3D"noreferrer" target=3D"_blank">gutenprint_5.3.4.bb</a><br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 &lt;<a href=3D"http://gutenprint_5.3.4.bb" rel=
=3D"noreferrer" target=3D"_blank">http://gutenprint_5.3.4.bb</a>&gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a hr=
ef=3D"http://gutenprint_5.3.4.bb" rel=3D"noreferrer" target=3D"_blank">http=
://gutenprint_5.3.4.bb</a>&gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+++ b/met=
a-oe/recipes-printing/gutenprint/<a href=3D"http://gutenprint_5.3.5.bb" rel=
=3D"noreferrer" target=3D"_blank">gutenprint_5.3.5.bb</a><br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 &lt;<a href=3D"http://gutenprint_5.3.5.bb" rel=
=3D"noreferrer" target=3D"_blank">http://gutenprint_5.3.5.bb</a>&gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a hr=
ef=3D"http://gutenprint_5.3.5.bb" rel=3D"noreferrer" target=3D"_blank">http=
://gutenprint_5.3.5.bb</a>&gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0@@ -17,7 =
+17,7 @@ LIC_FILES_CHKSUM =3D<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 &gt; =C2=A0&quot;file://COPYING;md5=3D59530bdf3=
3659b29e73d4adb9f9f6552&quot;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0SRC=
_URI =3D &quot;<a href=3D"https://downloads.sourceforge.net/gimp-print/$%7B=
BP%7D.tar.xz" rel=3D"noreferrer" target=3D"_blank">https://downloads.source=
forge.net/gimp-print/${BP}.tar.xz</a><br>
&gt;&gt; &lt;<a href=3D"https://downloads.sourceforge.net/gimp-print/$%7BBP=
%7D.tar.xz" rel=3D"noreferrer" target=3D"_blank">https://downloads.sourcefo=
rge.net/gimp-print/$%7BBP%7D.tar.xz</a>&gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 &gt; =C2=A0&lt;<a href=3D"https://downloads.sou=
rceforge.net/gimp-print/$%7BBP%7D.tar.xz" rel=3D"noreferrer" target=3D"_bla=
nk">https://downloads.sourceforge.net/gimp-print/$%7BBP%7D.tar.xz</a>&gt; \=
<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 &gt; =C2=A0file://0001-cups-fix-a-build-race-co=
ndition-around-empty-directo.patch \<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-SRC_URI[=
sha256sum] =3D<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 &gt; =C2=A0&quot;db44a701d2b8e6a8931c83cec06c91=
226be266d23e5c189d20a39dd175f2023b&quot;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+SRC_URI[=
sha256sum] =3D<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 &gt; =C2=A0&quot;f5a9f47de28530b1ae2069cfbc647a=
9a641baeeabe809bb0ef2b3ec5b9668d70&quot;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 &gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0inh=
erit autotools gettext pkgconfig<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 &gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A02.51.0<br=
>
&gt;&gt; =C2=A0=C2=A0=C2=A0 &gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 &gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 &gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 &gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 &gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 &gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0--<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0Yoann Congal<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0Smile ECS<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 &gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 &gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 &gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 &gt; --<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 &gt; Yoann Congal<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 &gt; Smile ECS<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; -- <br>
&gt;&gt; Yoann Congal<br>
&gt;&gt; Smile ECS<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#119589): <a href=3D"https://lists.openembedded.org=
/g/openembedded-devel/message/119589" rel=3D"noreferrer" target=3D"_blank">=
https://lists.openembedded.org/g/openembedded-devel/message/119589</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/11530753=
9/3617728" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.=
org/mt/115307539/3617728</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openem=
bedded.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.o=
rg</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
devel/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedde=
d.org/g/openembedded-devel/unsub</a> [<a href=3D"mailto:zboszor@gmail.com" =
target=3D"_blank">zboszor@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><br><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr"><font face=3D"Raleway, regular">Yoann Congal</font><div><fon=
t face=3D"Raleway, regular">Smile ECS</font></div></div></div></div>

--000000000000eea0ed063f270ab0--

