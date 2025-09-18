Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 918ABCA1013
	for <webhook@archiver.kernel.org>; Thu, 18 Sep 2025 18:42:25 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web11.23442.1758220942686319428
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Sep 2025 11:42:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=2WP61Rbe;
 spf=pass (domain: smile.fr, ip: 209.85.221.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3ee1221ceaaso521786f8f.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 18 Sep 2025 11:42:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1758220941; x=1758825741; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=H5euHvaxYu6/0GEdMRaQXen25l+DWRJYhqsEfZBb9JQ=;
        b=2WP61Rbej78Z6m1t6rFyOl0xPAClN6djlAfkouRqRwnJTdqlY2NmHb9ctIqqtnpDZC
         t/w50NtkXo1fQTnntzPdz3OAoSjJzVOkZyUyYEPAnb+N4nYGkM13YvCZxFjIJ477tq3l
         xysExh8+rT5mfc7cqIDD8nqOZnWJHfn5zFfyk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758220941; x=1758825741;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H5euHvaxYu6/0GEdMRaQXen25l+DWRJYhqsEfZBb9JQ=;
        b=Z6ELcvRasfJF+Cz+Pc8ViIBZENfZNLoge7cs/l54ItuDCCTBZh/gIIatRUlpOPkqew
         YAyqvPtMhAHAxt18pq19R1sc9t/3fo8LVz+Gxw307nc6VM5VqLZg2I2irwTjjioJM7Kb
         4H5vBZtdJ7Z26n28b50WMgDPB6YhRUiQioQLvcBUU1OPPK+us/Ao5vhs/z6Jem71UOZR
         YA5wHUl6WeIh3fIGsnK8CHP+f7zJ/XXe/voRJR+eBVsJd6mdd5YxszSJy2eHEuWnvmY7
         /2fGhuOyo44uvCHbZh237HwwkBh+wEP3uM8JvjqAETSGAIJf5Yp+2+L1q49a3yagKOgQ
         lcsA==
X-Gm-Message-State: AOJu0Yx/7WlzNdKLrGDVsupHMxYhhSXaT+AzerQJfqcvaG9hv8EGfGMo
	2OsFp1SF6Pdfft2aOVRIB9RMrXKrcvSMfZihBpZa217Djtjr95px+tiy+yBfTySCRHGi7LSSPN/
	kaMgPiXobWK9/3Ij3rTMa9a7gjGq/KyZMqRXa8lGI+w==
X-Gm-Gg: ASbGncsd00IOE1Ih+PErXIbuxJJ5j8CGP1aiGEH5VzXG8lMqq/H2rp4D8TlPWC1SK0s
	HGvPrYu+w+5IHzcPrRCwoxjJCxycabLBWBuX0AZNy2Iy2WD3YxUwo4YyvKA4/PcNRUS4JmAtg7Z
	JSSJ4214+wbNT5ParODYoctj8gqrmfTpYsPeyB5eKBFF0DV+t1Pe1zS3TUtz5aGKw/YYOLTWfsL
	E41eCxSdRwCYwewjmomYbdHjYdqz8SmaZ+AGcPVziMBAXeKwx9r9R0dHW5F
X-Google-Smtp-Source: AGHT+IETILtojZSDP06JifDMftUH3ghho+lePhkHy4fi12BwwHY1bKToPQSuo+lE/QtVWZibLFGqGNPS7RhVJPyw6B4=
X-Received: by 2002:a5d:5d03:0:b0:3c8:d236:26bd with SMTP id
 ffacd0b85a97d-3ee7bad1241mr297489f8f.11.1758220940830; Thu, 18 Sep 2025
 11:42:20 -0700 (PDT)
MIME-Version: 1.0
References: <20250918102642.487522-1-zboszor@gmail.com> <CAMSfU+6F0GngYjP=07gUWFo4Tvf=hk=rG6CgAnV16BrK8UuBEg@mail.gmail.com>
 <CAMSfU+6tnHY2yyjTRJ9Y+jjCQE8=f-g+V2N_22TK1vBTYZp5GA@mail.gmail.com> <f7ce8c19-fb1e-4a4f-80eb-c41c79aef706@gmail.com>
In-Reply-To: <f7ce8c19-fb1e-4a4f-80eb-c41c79aef706@gmail.com>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Thu, 18 Sep 2025 20:41:54 +0200
X-Gm-Features: AS18NWAyV6pqXdNgAgOm-TSXfwJ3c5rzLt6HIK3LDsX0Z6aivV6aYTtUq6lLIzU
Message-ID: <CAMSfU+5b8ARRgzOtbzP+-VpL2U1eHtngOJVUDnU+Oxq-_AvzOA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] gutenprint: 5.3.5
To: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
Cc: openembedded-devel@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>
Content-Type: multipart/alternative; boundary="0000000000009d81f9063f17b67b"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Sep 2025 18:42:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119581

--0000000000009d81f9063f17b67b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeu. 18 sept. 2025 =C3=A0 20:22, B=C3=B6sz=C3=B6rm=C3=A9nyi Zolt=C3=A1n =
<zboszor@gmail.com> a
=C3=A9crit :

> 2025. 09. 18. 19:42 keltez=C3=A9ssel, Yoann Congal =C3=ADrta:
> >
> >
> > Le jeu. 18 sept. 2025 =C3=A0 16:16, Yoann Congal <yoann.congal@smile.fr=
> a
> =C3=A9crit :
> >
> >     Hello,
> >
> >     Le jeu. 18 sept. 2025 =C3=A0 12:26, Zoltan Boszormenyi via
> lists.openembedded.org
> >     <http://lists.openembedded.org> <zboszor=3D
> gmail.com@lists.openembedded.org> a =C3=A9crit :
> >
> >         This fixes an installation error:
> >
> >         | make[5]: Entering directory
> >         '.../tmp/work/corei7-64-oe-linux/gutenprint/5.3.4/build/src/cup=
s'
> >         | chmod 700
> >
>  .../tmp/work/corei7-64-oe-linux/gutenprint/5.3.4/image/usr/libexec/cups/=
backend/backend_gutenprint
> >         | chmod: cannot access
> >
>  '.../tmp/work/corei7-64-oe-linux/gutenprint/5.3.4/image/usr/libexec/cups=
/backend/backend_gutenprint':
> >         No such file or directory
> >
> >
> >     What makes you say that the 5.3.4->5.3.5 upgrade fix this bug?
> >
>
> I got the error with 5.3.4 and it has gone away with 5.3.5.
> I admit that I only tried the build once. I will retry tomorrow.
>

This error is a rare intermittent failure. You will most likely not see it
but that does not mean it's fixed (sadly).

Did the 5.3.4 version on which you saw the problem had my patch?


> >     The above error is the one I fixed with the patch
> >     "0001-cups-fix-a-build-race-condition-around-empty-directo.patch"
> and this patch has
> >     not been merged upstream nor the code I touched changed. I did not
> see anything
> >     related by quickly reading the NEWS.
> >     I'd be happy to see this fixed upstream but I'd rather have upstrea=
m
> confirmation
> >     that they saw/fixed it (a commit, a changelog, ...).
> >     If that is fixed upstream, then we can drop my patch.
> >
> >
> > To be clear, I'm not against upgrading. I just don't think the commit
> message is correct
> > (but could be convinced otherwise).
> >
> >     Thanks!
> >
> >         Signed-off-by: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@=
gmail.com>
> >         ---
> >          .../gutenprint/{gutenprint_5.3.4.bb <http://gutenprint_5.3.4.b=
b>
> =3D>
> >         gutenprint_5.3.5.bb <http://gutenprint_5.3.5.bb>}    | 2 +-
> >          1 file changed, 1 insertion(+), 1 deletion(-)
> >          rename meta-oe/recipes-printing/gutenprint/{gutenprint_5.3.4.b=
b
> >         <http://gutenprint_5.3.4.bb> =3D> gutenprint_5.3.5.bb
> >         <http://gutenprint_5.3.5.bb>} (96%)
> >
> >         diff --git a/meta-oe/recipes-printing/gutenprint/
> gutenprint_5.3.4.bb
> >         <http://gutenprint_5.3.4.bb>
> >         b/meta-oe/recipes-printing/gutenprint/gutenprint_5.3.5.bb
> >         <http://gutenprint_5.3.5.bb>
> >         similarity index 96%
> >         rename from meta-oe/recipes-printing/gutenprint/
> gutenprint_5.3.4.bb
> >         <http://gutenprint_5.3.4.bb>
> >         rename to meta-oe/recipes-printing/gutenprint/
> gutenprint_5.3.5.bb
> >         <http://gutenprint_5.3.5.bb>
> >         index f90a123293..82953b798c 100644
> >         --- a/meta-oe/recipes-printing/gutenprint/gutenprint_5.3.4.bb
> >         <http://gutenprint_5.3.4.bb>
> >         +++ b/meta-oe/recipes-printing/gutenprint/gutenprint_5.3.5.bb
> >         <http://gutenprint_5.3.5.bb>
> >         @@ -17,7 +17,7 @@ LIC_FILES_CHKSUM =3D
> >         "file://COPYING;md5=3D59530bdf33659b29e73d4adb9f9f6552"
> >          SRC_URI =3D "
> https://downloads.sourceforge.net/gimp-print/${BP}.tar.xz
> >         <https://downloads.sourceforge.net/gimp-print/$%7BBP%7D.tar.xz>
> \
> >
>  file://0001-cups-fix-a-build-race-condition-around-empty-directo.patch \
> >                     "
> >         -SRC_URI[sha256sum] =3D
> >
>  "db44a701d2b8e6a8931c83cec06c91226be266d23e5c189d20a39dd175f2023b"
> >         +SRC_URI[sha256sum] =3D
> >
>  "f5a9f47de28530b1ae2069cfbc647a9a641baeeabe809bb0ef2b3ec5b9668d70"
> >
> >          inherit autotools gettext pkgconfig
> >
> >         --
> >         2.51.0
> >
> >
> >         -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >         Links: You receive all messages sent to this group.
> >         View/Reply Online (#119552):
> >
> https://lists.openembedded.org/g/openembedded-devel/message/119552
> >         Mute This Topic:
> https://lists.openembedded.org/mt/115307539/4316185
> >         Group Owner: openembedded-devel+owner@lists.openembedded.org
> >         <mailto:openembedded-devel%2Bowner@lists.openembedded.org>
> >         Unsubscribe:
> https://lists.openembedded.org/g/openembedded-devel/unsub
> >         [yoann.congal@smile.fr]
> >         -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
> >
> >
> >     --
> >     Yoann Congal
> >     Smile ECS
> >
> >
> >
> > --
> > Yoann Congal
> > Smile ECS
>
>

--=20
Yoann Congal
Smile ECS

--0000000000009d81f9063f17b67b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0jeu. 18=
 sept. 2025 =C3=A0=C2=A020:22, B=C3=B6sz=C3=B6rm=C3=A9nyi Zolt=C3=A1n &lt;<=
a href=3D"mailto:zboszor@gmail.com">zboszor@gmail.com</a>&gt; a =C3=A9crit=
=C2=A0:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">2025. 09=
. 18. 19:42 keltez=C3=A9ssel, Yoann Congal =C3=ADrta:<br>
&gt;<br>
&gt;<br>
&gt; Le=C2=A0jeu. 18 sept. 2025 =C3=A0=C2=A016:16, Yoann Congal &lt;<a href=
=3D"mailto:yoann.congal@smile.fr" target=3D"_blank">yoann.congal@smile.fr</=
a>&gt; a =C3=A9crit=C2=A0:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Hello,<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Le=C2=A0jeu. 18 sept. 2025 =C3=A0=C2=A012:26, Zolta=
n Boszormenyi via <a href=3D"http://lists.openembedded.org" rel=3D"noreferr=
er" target=3D"_blank">lists.openembedded.org</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://lists.openembedded.org" rel=
=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org</a>&gt; &lt=
;zboszor=3D<a href=3D"mailto:gmail.com@lists.openembedded.org" target=3D"_b=
lank">gmail.com@lists.openembedded.org</a>&gt; a =C3=A9crit=C2=A0:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0This fixes an installation error:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| make[5]: Entering directory<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;.../tmp/work/corei7-64-oe-linux/=
gutenprint/5.3.4/build/src/cups&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| chmod 700<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.../tmp/work/corei7-64-oe-linux/guten=
print/5.3.4/image/usr/libexec/cups/backend/backend_gutenprint<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| chmod: cannot access<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;.../tmp/work/corei7-64-oe-linux/=
gutenprint/5.3.4/image/usr/libexec/cups/backend/backend_gutenprint&#39;:<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0No such file or directory<br>
&gt;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0What makes you say that the 5.3.4-&gt;5.3.5 upgrade=
 fix this bug?<br>
&gt;<br>
<br>
I got the error with 5.3.4 and it has gone away with 5.3.5.<br>
I admit that I only tried the build once. I will retry tomorrow.<br></block=
quote><div><br></div><div>This error is a rare intermittent failure. You wi=
ll most likely not see it but that does not mean it&#39;s fixed (sadly).</d=
iv><div><br></div><div>Did the 5.3.4 version on which you saw the problem h=
ad my patch?</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
&gt;=C2=A0 =C2=A0 =C2=A0The above error is the one I fixed with the patch<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;0001-cups-fix-a-build-race-condition-around-e=
mpty-directo.patch&quot; and this patch has<br>
&gt;=C2=A0 =C2=A0 =C2=A0not been merged upstream nor the code I touched cha=
nged. I did not see anything<br>
&gt;=C2=A0 =C2=A0 =C2=A0related by quickly reading the NEWS.<br>
&gt;=C2=A0 =C2=A0 =C2=A0I&#39;d be happy to see this fixed upstream but I&#=
39;d rather have upstream confirmation<br>
&gt;=C2=A0 =C2=A0 =C2=A0that they saw/fixed it (a commit, a changelog, ...)=
.<br>
&gt;=C2=A0 =C2=A0 =C2=A0If that is fixed upstream, then we can drop my patc=
h.<br>
&gt;<br>
&gt;<br>
&gt; To be clear, I&#39;m not against upgrading. I just don&#39;t think the=
 commit message is correct <br>
&gt; (but could be convinced otherwise).<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Thanks!<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Signed-off-by: Zolt=C3=A1n B=C3=B6sz=
=C3=B6rm=C3=A9nyi &lt;<a href=3D"mailto:zboszor@gmail.com" target=3D"_blank=
">zboszor@gmail.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0---<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0.../gutenprint/{<a href=3D"http=
://gutenprint_5.3.4.bb" rel=3D"noreferrer" target=3D"_blank">gutenprint_5.3=
.4.bb</a> &lt;<a href=3D"http://gutenprint_5.3.4.bb" rel=3D"noreferrer" tar=
get=3D"_blank">http://gutenprint_5.3.4.bb</a>&gt; =3D&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://gutenprint_5.3.5.bb=
" rel=3D"noreferrer" target=3D"_blank">gutenprint_5.3.5.bb</a> &lt;<a href=
=3D"http://gutenprint_5.3.5.bb" rel=3D"noreferrer" target=3D"_blank">http:/=
/gutenprint_5.3.5.bb</a>&gt;} =C2=A0 =C2=A0| 2 +-<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A01 file changed, 1 insertion(+),=
 1 deletion(-)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0rename meta-oe/recipes-printing=
/gutenprint/{<a href=3D"http://gutenprint_5.3.4.bb" rel=3D"noreferrer" targ=
et=3D"_blank">gutenprint_5.3.4.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://gutenprint_5.3.=
4.bb" rel=3D"noreferrer" target=3D"_blank">http://gutenprint_5.3.4.bb</a>&g=
t; =3D&gt; <a href=3D"http://gutenprint_5.3.5.bb" rel=3D"noreferrer" target=
=3D"_blank">gutenprint_5.3.5.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://gutenprint_5.3.=
5.bb" rel=3D"noreferrer" target=3D"_blank">http://gutenprint_5.3.5.bb</a>&g=
t;} (96%)<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0diff --git a/meta-oe/recipes-printing=
/gutenprint/<a href=3D"http://gutenprint_5.3.4.bb" rel=3D"noreferrer" targe=
t=3D"_blank">gutenprint_5.3.4.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://gutenprint_5.3.=
4.bb" rel=3D"noreferrer" target=3D"_blank">http://gutenprint_5.3.4.bb</a>&g=
t;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0b/meta-oe/recipes-printing/gutenprint=
/<a href=3D"http://gutenprint_5.3.5.bb" rel=3D"noreferrer" target=3D"_blank=
">gutenprint_5.3.5.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://gutenprint_5.3.=
5.bb" rel=3D"noreferrer" target=3D"_blank">http://gutenprint_5.3.5.bb</a>&g=
t;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0similarity index 96%<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rename from meta-oe/recipes-printing/=
gutenprint/<a href=3D"http://gutenprint_5.3.4.bb" rel=3D"noreferrer" target=
=3D"_blank">gutenprint_5.3.4.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://gutenprint_5.3.=
4.bb" rel=3D"noreferrer" target=3D"_blank">http://gutenprint_5.3.4.bb</a>&g=
t;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rename to meta-oe/recipes-printing/gu=
tenprint/<a href=3D"http://gutenprint_5.3.5.bb" rel=3D"noreferrer" target=
=3D"_blank">gutenprint_5.3.5.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://gutenprint_5.3.=
5.bb" rel=3D"noreferrer" target=3D"_blank">http://gutenprint_5.3.5.bb</a>&g=
t;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0index f90a123293..82953b798c 100644<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--- a/meta-oe/recipes-printing/gutenp=
rint/<a href=3D"http://gutenprint_5.3.4.bb" rel=3D"noreferrer" target=3D"_b=
lank">gutenprint_5.3.4.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://gutenprint_5.3.=
4.bb" rel=3D"noreferrer" target=3D"_blank">http://gutenprint_5.3.4.bb</a>&g=
t;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+++ b/meta-oe/recipes-printing/gutenp=
rint/<a href=3D"http://gutenprint_5.3.5.bb" rel=3D"noreferrer" target=3D"_b=
lank">gutenprint_5.3.5.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://gutenprint_5.3.=
5.bb" rel=3D"noreferrer" target=3D"_blank">http://gutenprint_5.3.5.bb</a>&g=
t;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0@@ -17,7 +17,7 @@ LIC_FILES_CHKSUM =
=3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;file://COPYING;md5=3D59530bdf33=
659b29e73d4adb9f9f6552&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0SRC_URI =3D &quot;<a href=3D"ht=
tps://downloads.sourceforge.net/gimp-print/$%7BBP%7D.tar.xz" rel=3D"norefer=
rer" target=3D"_blank">https://downloads.sourceforge.net/gimp-print/${BP}.t=
ar.xz</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://downloads.sour=
ceforge.net/gimp-print/$%7BBP%7D.tar.xz" rel=3D"noreferrer" target=3D"_blan=
k">https://downloads.sourceforge.net/gimp-print/$%7BBP%7D.tar.xz</a>&gt; \<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-cups-fix-a-build-race-con=
dition-around-empty-directo.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-SRC_URI[sha256sum] =3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;db44a701d2b8e6a8931c83cec06c912=
26be266d23e5c189d20a39dd175f2023b&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+SRC_URI[sha256sum] =3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;f5a9f47de28530b1ae2069cfbc647a9=
a641baeeabe809bb0ef2b3ec5b9668d70&quot;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0inherit autotools gettext pkgco=
nfig<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-- <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A02.51.0<br>
&gt;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=
=3D-=3D-<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Links: You receive all messages sent =
to this group.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0View/Reply Online (#119552):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"https://lists.openembedded=
.org/g/openembedded-devel/message/119552" rel=3D"noreferrer" target=3D"_bla=
nk">https://lists.openembedded.org/g/openembedded-devel/message/119552</a><=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Mute This Topic: <a href=3D"https://l=
ists.openembedded.org/mt/115307539/4316185" rel=3D"noreferrer" target=3D"_b=
lank">https://lists.openembedded.org/mt/115307539/4316185</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Group Owner: <a href=3D"mailto:openem=
bedded-devel%2Bowner@lists.openembedded.org" target=3D"_blank">openembedded=
-devel+owner@lists.openembedded.org</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:openembe=
dded-devel%252Bowner@lists.openembedded.org" target=3D"_blank">openembedded=
-devel%2Bowner@lists.openembedded.org</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Unsubscribe: <a href=3D"https://lists=
.openembedded.org/g/openembedded-devel/unsub" rel=3D"noreferrer" target=3D"=
_blank">https://lists.openembedded.org/g/openembedded-devel/unsub</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[<a href=3D"mailto:yoann.congal@smile=
.fr" target=3D"_blank">yoann.congal@smile.fr</a>]<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=
=3D-=3D-<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0-- <br>
&gt;=C2=A0 =C2=A0 =C2=A0Yoann Congal<br>
&gt;=C2=A0 =C2=A0 =C2=A0Smile ECS<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; -- <br>
&gt; Yoann Congal<br>
&gt; Smile ECS<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><br><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr"><font face=3D"Raleway, regular">Yoann Congal</font><div><fon=
t face=3D"Raleway, regular">Smile ECS</font></div></div></div></div>

--0000000000009d81f9063f17b67b--

