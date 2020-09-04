Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
 by mx.groups.io with SMTP id smtpd.web12.7185.1599257701800382371
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 04 Sep 2020 15:15:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=MZYhsz1I;
 spf=pass (domain: gmail.com, ip: 209.85.221.68, mailfrom: costamagna.gianfranco@gmail.com)
Received: by mail-wr1-f68.google.com with SMTP id m6so8839961wrn.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 04 Sep 2020 15:15:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jKTKh+4uWyWSSInIYUmUM9TuE3Lu+S6Miimqm+0KQLA=;
        b=MZYhsz1ISgkOPgYhjxywoTqH5bp6es43aCAdx/lebeoyLV4GjjsHIVfTanawbLN1D4
         4dmjdf28s1Ws14WRFW9cTfUxPghnTEaJ4rE9iv1aMTExnrrpy54VBF4C7TKDFtSkkGcU
         ZITg6qvPL/zs2dyGRPDHZs1IDtp1djVhXvwRGGPM0Lg4rGbI+3UifjWYnGOEO24elIvh
         IOF6FeOvsCbnNuLij/nVALvSmptDqDpnqVM6f4/ykFUQCVov7QPRvEKrTkc7BNxuw6LP
         xYOnXEJzrMxdLZ8GgWvF2p9SxtIxU7A9J8nvUmly99D5PyYJwHQ6jZjIJHxB1d+pBfDK
         MEMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jKTKh+4uWyWSSInIYUmUM9TuE3Lu+S6Miimqm+0KQLA=;
        b=qjnqZMEdjKReyu7BNalbq8c4YAsFvbayW4l5q3fwEq+q6Vst+XJNQ6MoRGMjFuUwPW
         I8v07pvkhp/OF27iWtpC9/a1STrZ/Q5ldwXAx2dq8ltVQYsG+5QzkUhe/PqLlxAQ0RQO
         sJyFyOjkzX+nKqAOQmZGysPho0NiYQ3y31rrHua6L3alz/ikljXrccJvzoI868rg+RsO
         NnwdAtCTW3g1oTuhGyjokpkCrM1eb8en6g4++VTXORQNVuHu0yUGHrPB62YPsiGTMtES
         cD/izE8GVtewg8XhPRzR7Rg0aAV+lcxK8sORbfmS1hgn+EbvREv7KYwUktlTqR2UPPUD
         rTsg==
X-Gm-Message-State: AOAM533TcFseD1PYoIHBwvINbANyfmSs2Py+XAVduBq51yMg7N94xTsX
	hS4PbqPTa9ngPP1ttuCLVkHL1WE0+VWdoFhMxUQ=
X-Google-Smtp-Source: ABdhPJxdBMREfA9BDCjWALVj438Siw8jY4uQCB7cusd+04T/lVL2+Wz6Taz0t98/POOKFRifMUF++/OVjwhryUINSkI=
X-Received: by 2002:a05:6000:124d:: with SMTP id j13mr10156459wrx.182.1599257700002;
 Fri, 04 Sep 2020 15:15:00 -0700 (PDT)
MIME-Version: 1.0
References: <20200902080332.6083-1-costamagnagianfranco@yahoo.it> <CAMKF1sr=Aq0qt4h=YaNxmimHFRZGQTEx9PMyMx8vHLww2oOVqQ@mail.gmail.com>
In-Reply-To: <CAMKF1sr=Aq0qt4h=YaNxmimHFRZGQTEx9PMyMx8vHLww2oOVqQ@mail.gmail.com>
From: "Gianfranco" <costamagna.gianfranco@gmail.com>
Date: Sat, 5 Sep 2020 00:14:47 +0200
Message-ID: <CAATN8PWRdEgxCeKBueYwu+WYyBrdQcDynA2TvkQ2aHyDEaRGoQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] brotli: update to 1.0.9
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>, 
	Gianfranco Costamagna <costamagnagianfranco@yahoo.it>, 
	Gianfranco Costamagna <locutusofborg@debian.org>
Content-Type: multipart/alternative; boundary="0000000000001cf0c605ae84331c"

--0000000000001cf0c605ae84331c
Content-Type: text/plain; charset="UTF-8"

fixed and reuploaded thanks!

G.

Il giorno gio 3 set 2020 alle ore 16:52 Khem Raj <raj.khem@gmail.com> ha
scritto:

> I am seeing cpprest failure and it seems to be related to this
>
> https://errors.yoctoproject.org/Errors/Details/498414/
>
> Fails with
>
> arm-yoe-linux-gnueabi-g++: error: unrecognized command-line option '-R'
> arm-yoe-linux-gnueabi-g++: error: unrecognized command-line option '-R'
>
> somewhere in log I see.
>
> -R/usr/lib  -lbrotlidec  -R/usr/lib  -lbrotlienc
>
> On Wed, Sep 2, 2020 at 1:03 AM Gianfranco
> <costamagna.gianfranco@gmail.com> wrote:
> >
> > Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
> > Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
> > ---
> >  .../brotli/{brotli_1.0.7.bb => brotli_1.0.9.bb}               | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >  rename meta-oe/recipes-extended/brotli/{brotli_1.0.7.bb =>
> brotli_1.0.9.bb} (91%)
> >
> > diff --git a/meta-oe/recipes-extended/brotli/brotli_1.0.7.bb
> b/meta-oe/recipes-extended/brotli/brotli_1.0.9.bb
> > similarity index 91%
> > rename from meta-oe/recipes-extended/brotli/brotli_1.0.7.bb
> > rename to meta-oe/recipes-extended/brotli/brotli_1.0.9.bb
> > index 32f855844..642e18f4a 100644
> > --- a/meta-oe/recipes-extended/brotli/brotli_1.0.7.bb
> > +++ b/meta-oe/recipes-extended/brotli/brotli_1.0.9.bb
> > @@ -7,8 +7,8 @@ LICENSE = "MIT"
> >  LIC_FILES_CHKSUM =
> "file://${S}/LICENSE;md5=941ee9cd1609382f946352712a319b4b"
> >
> >  SRC_URI = "git://github.com/google/brotli.git"
> > -# tag 1.0.7
> > -SRCREV= "d6d98957ca8ccb1ef45922e978bb10efca0ea541"
> > +# tag 1.0.9
> > +SRCREV= "e61745a6b7add50d380cfd7d3883dd6c62fc2c71"
> >  S = "${WORKDIR}/git"
> >
> >  inherit cmake lib_package
> > --
> > 2.17.1
> >
> > 
>

--0000000000001cf0c605ae84331c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>fixed and reuploaded thanks!</div><div><br></div><div=
>G.<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D=
"gmail_attr">Il giorno gio 3 set 2020 alle ore 16:52 Khem Raj &lt;<a href=
=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; ha scritto:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">I am seeing cpprest =
failure and it seems to be related to this<br>
<br>
<a href=3D"https://errors.yoctoproject.org/Errors/Details/498414/" rel=3D"=
noreferrer" target=3D"_blank">https://errors.yoctoproject.org/Errors/Detail=
s/498414/</a><br>
<br>
Fails with<br>
<br>
arm-yoe-linux-gnueabi-g++: error: unrecognized command-line option &#39;-R=
&#39;<br>
arm-yoe-linux-gnueabi-g++: error: unrecognized command-line option &#39;-R=
&#39;<br>
<br>
somewhere in log I see.<br>
<br>
-R/usr/lib=C2=A0 -lbrotlidec=C2=A0 -R/usr/lib=C2=A0 -lbrotlienc<br>
<br>
On Wed, Sep 2, 2020 at 1:03 AM Gianfranco<br>
&lt;<a href=3D"mailto:costamagna.gianfranco@gmail.com" target=3D"_blank">c=
ostamagna.gianfranco@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Signed-off-by: Gianfranco Costamagna &lt;<a href=3D"mailto:costamagna=
gianfranco@yahoo.it" target=3D"_blank">costamagnagianfranco@yahoo.it</a>&gt=
;<br>
&gt; Signed-off-by: Gianfranco Costamagna &lt;<a href=3D"mailto:locutusofb=
org@debian.org" target=3D"_blank">locutusofborg@debian.org</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../brotli/{<a href=3D"http://brotli_1.0.7.bb" rel=3D"noreferre=
r" target=3D"_blank">brotli_1.0.7.bb</a> =3D&gt; <a href=3D"http://brotli_1=
.0.9.bb" rel=3D"noreferrer" target=3D"_blank">brotli_1.0.9.bb</a>}=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 4 ++--<br>
&gt;=C2=A0 1 file changed, 2 insertions(+), 2 deletions(-)<br>
&gt;=C2=A0 rename meta-oe/recipes-extended/brotli/{<a href=3D"http://brotl=
i_1.0.7.bb" rel=3D"noreferrer" target=3D"_blank">brotli_1.0.7.bb</a> =3D&gt=
; <a href=3D"http://brotli_1.0.9.bb" rel=3D"noreferrer" target=3D"_blank">b=
rotli_1.0.9.bb</a>} (91%)<br>
&gt;<br>
&gt; diff --git a/meta-oe/recipes-extended/brotli/<a href=3D"http://brotli=
_1.0.7.bb" rel=3D"noreferrer" target=3D"_blank">brotli_1.0.7.bb</a> b/meta-=
oe/recipes-extended/brotli/<a href=3D"http://brotli_1.0.9.bb" rel=3D"norefe=
rrer" target=3D"_blank">brotli_1.0.9.bb</a><br>
&gt; similarity index 91%<br>
&gt; rename from meta-oe/recipes-extended/brotli/<a href=3D"http://brotli_=
1.0.7.bb" rel=3D"noreferrer" target=3D"_blank">brotli_1.0.7.bb</a><br>
&gt; rename to meta-oe/recipes-extended/brotli/<a href=3D"http://brotli_1.=
0.9.bb" rel=3D"noreferrer" target=3D"_blank">brotli_1.0.9.bb</a><br>
&gt; index 32f855844..642e18f4a 100644<br>
&gt; --- a/meta-oe/recipes-extended/brotli/<a href=3D"http://brotli_1.0.7.=
bb" rel=3D"noreferrer" target=3D"_blank">brotli_1.0.7.bb</a><br>
&gt; +++ b/meta-oe/recipes-extended/brotli/<a href=3D"http://brotli_1.0.9.=
bb" rel=3D"noreferrer" target=3D"_blank">brotli_1.0.9.bb</a><br>
&gt; @@ -7,8 +7,8 @@ LICENSE =3D &quot;MIT&quot;<br>
&gt;=C2=A0 LIC_FILES_CHKSUM =3D &quot;file://${S}/LICENSE;md5=3D941ee9cd16=
09382f946352712a319b4b&quot;<br>
&gt;<br>
&gt;=C2=A0 SRC_URI =3D &quot;git://<a href=3D"http://github.com/google/bro=
tli.git" rel=3D"noreferrer" target=3D"_blank">github.com/google/brotli.git<=
/a>&quot;<br>
&gt; -# tag 1.0.7<br>
&gt; -SRCREV=3D &quot;d6d98957ca8ccb1ef45922e978bb10efca0ea541&quot;<br>
&gt; +# tag 1.0.9<br>
&gt; +SRCREV=3D &quot;e61745a6b7add50d380cfd7d3883dd6c62fc2c71&quot;<br>
&gt;=C2=A0 S =3D &quot;${WORKDIR}/git&quot;<br>
&gt;<br>
&gt;=C2=A0 inherit cmake lib_package<br>
&gt; --<br>
&gt; 2.17.1<br>
&gt;<br>
&gt; <br>
</blockquote></div>

--0000000000001cf0c605ae84331c--
