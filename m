Received: from mail-il1-f170.google.com (mail-il1-f170.google.com [209.85.166.170])
 by mx.groups.io with SMTP id smtpd.web09.6045.1628679641953402086
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Aug 2021 04:00:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=EEWKVqFx;
 spf=pass (domain: gmail.com, ip: 209.85.166.170, mailfrom: jainsaloni0918@gmail.com)
Received: by mail-il1-f170.google.com with SMTP id h18so2353728ilc.5
        for <openembedded-devel@lists.openembedded.org>; Wed, 11 Aug 2021 04:00:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pgTF8Zf2y1R3S/vihf6iMGngL73aoTMo/oENbVqT2Zk=;
        b=EEWKVqFxkuyZQezQ+WHNIh2Tn3EzhU4l+49cWpxoAXW7bIT00veHiHWu4aK66G3ePw
         GtA5rQ7OeoqSYkmgh/3nifJVl5t2lLGpAfzx54UepR4UE+U5y3eaTZyNdTH7BahmBIcg
         YKb0G87ZG3kKFRgd5Aw1TEs9dQ2Gbin4c82IkcK1n++pJaf9r1a5vTdjUBP9oaEVjJg8
         IYrjPFrHaqFV9F55RusaOpM9BD92PSwAJsJMdGiK40WWmAljdsL5Ehf+6GtNdgtyVLuJ
         IGShtkIrHaUK3tV7fvFl7xIQ6Q8Jhv5eZQCgLpL5f8ahyIpcA7BSSzgmeqPNuc3HrhhF
         HV+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pgTF8Zf2y1R3S/vihf6iMGngL73aoTMo/oENbVqT2Zk=;
        b=mO/cy9agQo7Rkdxik5hJWZpXwXaVqPHxKv/i5FfsmuDCxBMXeG2+nYSbWi7tWuXxqi
         ZFgBkF/GwXnd+kUvn3kCkayhyxslFHdz7FOojCrW0BGIkXwX2yCPxZxTFbkSxxmLEoJH
         JNxh0hxG46kMIMATSq0W67ZEjRNe7k+pSdrULwTMpLgT+Ym1mp9Vn1H/CXCV+2slfb/K
         JumTcBspwR16kqkjpAf+uw8CHf4ULxQqFAlwkcTNLWxxBg4/U9Ea3xignTVHDZAPPmQc
         lkByiygsNbOT1vdrvSl/vsgQH61AAiLnEhtmdUp37efOoGvWW6rvELVoIGPgeszkCtWN
         XOkg==
X-Gm-Message-State: AOAM530oEmK3uSlKy+IK/BS6Fu+sTUC+HIagj3aXmwbI/B/obMvfjbIL
	WtSM8UldWP76xlDnOCQxb2yUboUX9LijgnjdDi/Cvnv9Opk=
X-Google-Smtp-Source: ABdhPJy9qF/V85jUopAIm6bWxKmYhZn2s3zzFbSIxydBgkOR/IYbBlVz4BNkuw+CwjcN2ff41iJtcIxKT2GkAZEtPlk=
X-Received: by 2002:a92:cda5:: with SMTP id g5mr142082ild.305.1628679641149;
 Wed, 11 Aug 2021 04:00:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210720081140.21159-1-jainsaloni0918@gmail.com> <YRNdfmGFBksc09v+@ltleri2>
In-Reply-To: <YRNdfmGFBksc09v+@ltleri2>
From: "Saloni Jain" <jainsaloni0918@gmail.com>
Date: Wed, 11 Aug 2021 07:00:29 -0400
Message-ID: <CABzA9utoPe-S02_6zotL68B9G3gfhndMmSNyzAR4iSc_WUfqiQ@mail.gmail.com>
Subject: Re: [oe] [meta-java][dunfell][PATCH] xerces-j: Whitelisted CVE-2018-2799
To: Richard Leitner - SKIDATA <Richard.Leitner@skidata.com>
Cc: "openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000076b50705c946874d"

--00000000000076b50705c946874d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

Thank you for your reply and appreciate the feedback.
I will fix the mentioned comments and send a v2 for the patch.

Regards,
Saloni Jain

On Wed, 11 Aug 2021 at 01:17, Richard Leitner - SKIDATA <
Richard.Leitner@skidata.com> wrote:

> Hi,
> thanks for the patch and sorry for the late reply.
> Unfortunately there are some problems with your patch.
>
> Your git author seems to be set up incorrectly. Please set it up
> correctly using the following commands before formatting the patch:
>
>         $ git config user.name "John Doe"
>         $ git config user.email johndoe@example.com
>
> On Tue, Jul 20, 2021 at 04:11:40AM -0400, Saloni Jain via
> lists.openembedded.org wrote:
> > Whitelisted below CVE:
> > CVE-2018-2799:
> > CVE only applies to some Oracle Java SE and Red Hat
> > Enterprise Linux versions which is already fixed with
> > updates and the issue is closed.
> > Link: https://access.redhat.com/security/cve/CVE-2018-2799
> > Link: https://bugzilla.redhat.com/show_bug.cgi?id=3D1567542
>
> Furthermore you are missing a Signed-Off-By line here. Please add it.
>
> > ---
> >  recipes-core/xerces-j/xerces-j_2.11.0.bb | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/recipes-core/xerces-j/xerces-j_2.11.0.bb
> b/recipes-core/xerces-j/xerces-j_2.11.0.bb
> > index 98ef32f..f2a4434 100644
> > --- a/recipes-core/xerces-j/xerces-j_2.11.0.bb
> > +++ b/recipes-core/xerces-j/xerces-j_2.11.0.bb
> > @@ -14,6 +14,12 @@ LIC_FILES_CHKSUM =3D " \
> >
> >  SRC_URI =3D "
> http://archive.apache.org/dist/xerces/j/Xerces-J-src.${PV}.tar.gz"
> >
> > +# CVE only applies to some Oracle Java SE and Red Hat Enterprise Linux
> versions.
> > +# Already fixed with updates and closed.
> > +# https://access.redhat.com/security/cve/CVE-2018-2799
> > +# https://bugzilla.redhat.com/show_bug.cgi?id=3D1567542
> > +CVE_CHECK_WHITELIST +=3D "CVE-2018-2799"
> > +
> >  S =3D "${WORKDIR}/xerces-2_11_0"
> >
> >  inherit java-library
> > --
> > 2.17.1
>
> Otherwise the patch seems fine to me. So I'm looking forward to receive
> a v2 from you =F0=9F=98=89
>
> regards;rl

--00000000000076b50705c946874d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello,</div><div><br></div><div>Thank you for=C2=A0yo=
ur reply and appreciate the feedback.</div><div>I will fix the mentioned co=
mments and send a v2 for the patch.</div><div><br></div><div>Regards,</div>=
<div>Saloni Jain<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"=
ltr" class=3D"gmail_attr">On Wed, 11 Aug 2021 at 01:17, Richard Leitner - S=
KIDATA &lt;<a href=3D"mailto:Richard.Leitner@skidata.com">Richard.Leitner@s=
kidata.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">Hi,<br>
thanks for the patch and sorry for the late reply.<br>
Unfortunately there are some problems with your patch.<br>
<br>
Your git author seems to be set up incorrectly. Please set it up<br>
correctly using the following commands before formatting the patch:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 $ git config <a href=3D"http://user.name" rel=
=3D"noreferrer" target=3D"_blank">user.name</a> &quot;John Doe&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 $ git config user.email <a href=3D"mailto:johnd=
oe@example.com" target=3D"_blank">johndoe@example.com</a><br>
<br>
On Tue, Jul 20, 2021 at 04:11:40AM -0400, Saloni Jain via <a href=3D"http:/=
/lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openemb=
edded.org</a> wrote:<br>
&gt; Whitelisted below CVE:<br>
&gt; CVE-2018-2799:<br>
&gt; CVE only applies to some Oracle Java SE and Red Hat<br>
&gt; Enterprise Linux versions which is already fixed with<br>
&gt; updates and the issue is closed.<br>
&gt; Link: <a href=3D"https://access.redhat.com/security/cve/CVE-2018-2799"=
 rel=3D"noreferrer" target=3D"_blank">https://access.redhat.com/security/cv=
e/CVE-2018-2799</a><br>
&gt; Link: <a href=3D"https://bugzilla.redhat.com/show_bug.cgi?id=3D1567542=
" rel=3D"noreferrer" target=3D"_blank">https://bugzilla.redhat.com/show_bug=
.cgi?id=3D1567542</a><br>
<br>
Furthermore you are missing a Signed-Off-By line here. Please add it.<br>
<br>
&gt; ---<br>
&gt;=C2=A0 recipes-core/xerces-j/<a href=3D"http://xerces-j_2.11.0.bb" rel=
=3D"noreferrer" target=3D"_blank">xerces-j_2.11.0.bb</a> | 6 ++++++<br>
&gt;=C2=A0 1 file changed, 6 insertions(+)<br>
&gt; <br>
&gt; diff --git a/recipes-core/xerces-j/<a href=3D"http://xerces-j_2.11.0.b=
b" rel=3D"noreferrer" target=3D"_blank">xerces-j_2.11.0.bb</a> b/recipes-co=
re/xerces-j/<a href=3D"http://xerces-j_2.11.0.bb" rel=3D"noreferrer" target=
=3D"_blank">xerces-j_2.11.0.bb</a><br>
&gt; index 98ef32f..f2a4434 100644<br>
&gt; --- a/recipes-core/xerces-j/<a href=3D"http://xerces-j_2.11.0.bb" rel=
=3D"noreferrer" target=3D"_blank">xerces-j_2.11.0.bb</a><br>
&gt; +++ b/recipes-core/xerces-j/<a href=3D"http://xerces-j_2.11.0.bb" rel=
=3D"noreferrer" target=3D"_blank">xerces-j_2.11.0.bb</a><br>
&gt; @@ -14,6 +14,12 @@ LIC_FILES_CHKSUM =3D &quot; \<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 SRC_URI =3D &quot;<a href=3D"http://archive.apache.org/dist/xerc=
es/j/Xerces-J-src.$%7BPV%7D.tar.gz" rel=3D"noreferrer" target=3D"_blank">ht=
tp://archive.apache.org/dist/xerces/j/Xerces-J-src.${PV}.tar.gz</a>&quot;<b=
r>
&gt;=C2=A0 <br>
&gt; +# CVE only applies to some Oracle Java SE and Red Hat Enterprise Linu=
x versions.<br>
&gt; +# Already fixed with updates and closed.<br>
&gt; +# <a href=3D"https://access.redhat.com/security/cve/CVE-2018-2799" re=
l=3D"noreferrer" target=3D"_blank">https://access.redhat.com/security/cve/C=
VE-2018-2799</a><br>
&gt; +# <a href=3D"https://bugzilla.redhat.com/show_bug.cgi?id=3D1567542" r=
el=3D"noreferrer" target=3D"_blank">https://bugzilla.redhat.com/show_bug.cg=
i?id=3D1567542</a><br>
&gt; +CVE_CHECK_WHITELIST +=3D &quot;CVE-2018-2799&quot;<br>
&gt; +<br>
&gt;=C2=A0 S =3D &quot;${WORKDIR}/xerces-2_11_0&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 inherit java-library<br>
&gt; -- <br>
&gt; 2.17.1<br>
<br>
Otherwise the patch seems fine to me. So I&#39;m looking forward to receive=
<br>
a v2 from you =F0=9F=98=89<br>
<br>
regards;rl</blockquote></div>

--00000000000076b50705c946874d--
