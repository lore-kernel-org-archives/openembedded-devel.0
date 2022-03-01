Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A73D9C433F5
	for <webhook@archiver.kernel.org>; Tue,  1 Mar 2022 00:50:16 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web09.3036.1646095815208311691
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Feb 2022 16:50:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=dDBVVZYX;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: ticotimo@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id r13so28284329ejd.5
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Feb 2022 16:50:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=0zWffukDGUlTltxklSyGvBDyVBzn2oZy75x84NMoB6M=;
        b=dDBVVZYXlD2ZccqERQHxS7iTfvZf7WO7cwDlNnWtXlN2+IfcQxo1m/L46Yiygb+fEj
         Ph9kTOofSW+021udbyYrfpC80BYDHVPUzvwwZ5pYHl4neY/Xjmuan2pPpk70hnUSmJLd
         9w7OrkneBzh5lMfZLbOQzHc0P2GIdpKFOEEzES1Znj5nnEe0Lgq2G1Zo/bEh6HiPWZ8s
         jA5oyVhwOJS/kqDdy4rYzEJoNua0nI4YalE7Lf9318BqXU1BOf4Xhno1fvGHtLyImZ7n
         IKDn4zx2xQz+jo7SxMWXngtdF/a0HL7gIyYSfPD+BAWI7wJapGeGwzHWfACt/MSEiqVN
         u12g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=0zWffukDGUlTltxklSyGvBDyVBzn2oZy75x84NMoB6M=;
        b=zn+J3ckF7hpM2guM/ynGHn5ZzDYHaKwTBroHHUPsAdOLCDrrl+K7XbfQzyy/6TlyM/
         mePtoQXye/MOrWO9rky0aUsYvUZJkf7hR3AF1C8deFONvGMOUvdRVhZ6t68D/2UvWHe2
         7Fn3QsV8FAgAWtFj5AX6h3r5R/elHkTwgceHC/kN9WLDxEBPaOAKLVFUCgdpoeFUnHvV
         6Vu+pPfwifBHJhI8evuByDxcNUTVeflKbnrOs/6II4FoY6o7piV0Qea/zdFVREYGfGlS
         hdiADszCAojzRF3wN7xGPUoyULpdnWKmKEVJfJHpYQDH1oC79VBtaWKU/vOtOl4X1H1T
         gWvQ==
X-Gm-Message-State: AOAM533yrxE9nJYvhMrjL488SoYt8r8OZODGSI6yZhQoREC37dzlNuoY
	CfWjgXLUmdcs6uQ+WL2aDiq6KFwKkVdKNdJ68G8=
X-Google-Smtp-Source: 
 ABdhPJyl4/Lf6vWhF8gGS0yDSQzAzxlhalPRKuVOkNOkEZ2Gi0Ua94hOuGQfd0B57Df2jnA+mpHBhGegyzQ3Wtb+1pE=
X-Received: by 2002:a17:906:3e4b:b0:6cf:7f02:9332 with SMTP id
 t11-20020a1709063e4b00b006cf7f029332mr17060644eji.404.1646095813252; Mon, 28
 Feb 2022 16:50:13 -0800 (PST)
MIME-Version: 1.0
References: <20220228222206.25716-1-jsbronder@cold-front.org>
 <CAMKF1sppTUJmQQ0QgfE0j3i7ZqRAATPLA+2o3sKy1_Cd_3d51g@mail.gmail.com>
 <CAMKF1sq5Z5Vwx60Kym1wV8uN5taFeZ0dOxZ4EW4eY_6bkzCasQ@mail.gmail.com>
 <Yh1TyAUZz6bCAIba@ravine.members.linode.com>
In-Reply-To: <Yh1TyAUZz6bCAIba@ravine.members.linode.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Mon, 28 Feb 2022 16:50:02 -0800
Message-ID: 
 <CANx9H-Ba16h+X4p_thHhzSMeCy3feC+Hvj+Y7XHDB6pAE83uzw@mail.gmail.com>
Subject: Re: [oe] python3-configobj: drop recipe
To: Justin Bronder <jsbronder@cold-front.org>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000003719aa05d91d8c79"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 01 Mar 2022 00:50:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95613

--0000000000003719aa05d91d8c79
Content-Type: text/plain; charset="UTF-8"

On Mon, Feb 28, 2022 at 2:59 PM Justin Bronder <jsbronder@cold-front.org>
wrote:

> On 28/02/22 14:38 -0800, Khem Raj wrote:
> > oh well Tim already fixed it, I would suggest you use master-next for
> > this work since it has latest collaborations from everyone.
> >
> >
> https://patchwork.yoctoproject.org/project/oe/patch/20220227234254.1089695-1-tim.orling@konsulko.com/
>
> Ah, will do.  I was just searching subject lines for patches posted to
> this list
> and missed the typo in the subject line ;)


Ugh. Fly fast and typos happen.


>
> >
> > On Mon, Feb 28, 2022 at 2:32 PM Khem Raj <raj.khem@gmail.com> wrote:
> > >
> > > Thanks for looking into this, Armin added this recipe in 2020, I would
> > > like to hear from him as well on what this recipe's future plans are.
> > >
> > > On Mon, Feb 28, 2022 at 2:22 PM Justin Bronder <
> jsbronder@cold-front.org> wrote:
> > > >
> > > > The last official release, 5.0.6 is from 2014 and does not build with
> > > > bdist_wheel.  The upstream repository does appear active but it's
> > > > unclear if anyone has the ability/motivation to tag a new release or
> > > > upload it to PyPI.  If you depend upon this recipe, please work with
> > > > upstream to tag a PEP-517 compliant release.
> > > >
> > > > https://github.com/DiffSK/configobj/issues/160
> > > > https://github.com/DiffSK/configobj/issues/197
> > > > https://github.com/DiffSK/configobj/issues/204
> > > >
> > > > Signed-off-by: Justin Bronder <jsbronder@cold-front.org>
> > > > ---
> > > >  .../packagegroups/packagegroup-meta-python.bb            | 1 -
> > > >  .../recipes-devtools/python/python3-configobj_5.0.6.bb   | 9
> ---------
> > > >  2 files changed, 10 deletions(-)
> > > >  delete mode 100644 meta-python/recipes-devtools/python/
> python3-configobj_5.0.6.bb
> > > >
> > > > diff --git a/meta-python/recipes-core/packagegroups/
> packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/
> packagegroup-meta-python.bb
> > > > index dbfa991ebe..6b10913657 100644
> > > > --- a/meta-python/recipes-core/packagegroups/
> packagegroup-meta-python.bb
> > > > +++ b/meta-python/recipes-core/packagegroups/
> packagegroup-meta-python.bb
> > > > @@ -81,7 +81,6 @@ RDEPENDS:packagegroup-meta-python3 = "\
> > > >      python3-colorlog \
> > > >      python3-colorzero \
> > > >      python3-configargparse \
> > > > -    python3-configobj \
> > > >      python3-configparser \
> > > >      python3-configshell-fb \
> > > >      python3-constantly \
> > > > diff --git a/meta-python/recipes-devtools/python/
> python3-configobj_5.0.6.bb b/meta-python/recipes-devtools/python/
> python3-configobj_5.0.6.bb
> > > > deleted file mode 100644
> > > > index 1b85368105..0000000000
> > > > --- a/meta-python/recipes-devtools/python/python3-configobj_5.0.6.bb
> > > > +++ /dev/null
> > > > @@ -1,9 +0,0 @@
> > > > -SUMMARY = "Config file reading, writing and validation."
> > > > -SECTION = "devel/python"
> > > > -LICENSE = "BSD-3-Clause"
> > > > -LIC_FILES_CHKSUM =
> "file://configobj.py;md5=a7c3968dd866dfd23e91e125b669ab21"
> > > > -
> > > > -PYPI_PACKAGE = "configobj"
> > > > -SRC_URI[sha256sum] =
> "a2f5650770e1c87fb335af19a9b7eb73fc05ccf22144eb68db7d00cd2bcb0902"
> > > > -
> > > > -inherit pypi setuptools3
> > > > --
> > > > 2.35.1
> > > >
> > > >
> > > >
> > > >
>
> --
> Justin Bronder
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#95608):
> https://lists.openembedded.org/g/openembedded-devel/message/95608
> Mute This Topic: https://lists.openembedded.org/mt/89463815/924729
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> ticotimo@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--0000000000003719aa05d91d8c79
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Mon, Feb 28, 2022 at 2:59 PM Justin Bronder &lt;<a href=
=3D"mailto:jsbronder@cold-front.org">jsbronder@cold-front.org</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex">On 28/02/22 14:38 -0800, Khem Raj=
 wrote:<br>
&gt; oh well Tim already fixed it, I would suggest you use master-next for<=
br>
&gt; this work since it has latest collaborations from everyone.<br>
&gt; <br>
&gt; <a href=3D"https://patchwork.yoctoproject.org/project/oe/patch/2022022=
7234254.1089695-1-tim.orling@konsulko.com/" rel=3D"noreferrer" target=3D"_b=
lank">https://patchwork.yoctoproject.org/project/oe/patch/20220227234254.10=
89695-1-tim.orling@konsulko.com/</a><br>
<br>
Ah, will do.=C2=A0 I was just searching subject lines for patches posted to=
 this list<br>
and missed the typo in the subject line ;)</blockquote><div dir=3D"auto"><b=
r></div><div dir=3D"auto">Ugh. Fly fast and typos happen.</div><div dir=3D"=
auto"><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8e=
x;border-left:1px #ccc solid;padding-left:1ex" dir=3D"auto"><br>
<br>
&gt; <br>
&gt; On Mon, Feb 28, 2022 at 2:32 PM Khem Raj &lt;<a href=3D"mailto:raj.khe=
m@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; Thanks for looking into this, Armin added this recipe in 2020, I =
would<br>
&gt; &gt; like to hear from him as well on what this recipe&#39;s future pl=
ans are.<br>
&gt; &gt;<br>
&gt; &gt; On Mon, Feb 28, 2022 at 2:22 PM Justin Bronder &lt;<a href=3D"mai=
lto:jsbronder@cold-front.org" target=3D"_blank">jsbronder@cold-front.org</a=
>&gt; wrote:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; The last official release, 5.0.6 is from 2014 and does not b=
uild with<br>
&gt; &gt; &gt; bdist_wheel.=C2=A0 The upstream repository does appear activ=
e but it&#39;s<br>
&gt; &gt; &gt; unclear if anyone has the ability/motivation to tag a new re=
lease or<br>
&gt; &gt; &gt; upload it to PyPI.=C2=A0 If you depend upon this recipe, ple=
ase work with<br>
&gt; &gt; &gt; upstream to tag a PEP-517 compliant release.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; <a href=3D"https://github.com/DiffSK/configobj/issues/160" r=
el=3D"noreferrer" target=3D"_blank">https://github.com/DiffSK/configobj/iss=
ues/160</a><br>
&gt; &gt; &gt; <a href=3D"https://github.com/DiffSK/configobj/issues/197" r=
el=3D"noreferrer" target=3D"_blank">https://github.com/DiffSK/configobj/iss=
ues/197</a><br>
&gt; &gt; &gt; <a href=3D"https://github.com/DiffSK/configobj/issues/204" r=
el=3D"noreferrer" target=3D"_blank">https://github.com/DiffSK/configobj/iss=
ues/204</a><br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Signed-off-by: Justin Bronder &lt;<a href=3D"mailto:jsbronde=
r@cold-front.org" target=3D"_blank">jsbronder@cold-front.org</a>&gt;<br>
&gt; &gt; &gt; ---<br>
&gt; &gt; &gt;=C2=A0 .../packagegroups/<a href=3D"http://packagegroup-meta-=
python.bb" rel=3D"noreferrer" target=3D"_blank">packagegroup-meta-python.bb=
</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 -<br>
&gt; &gt; &gt;=C2=A0 .../recipes-devtools/python/<a href=3D"http://python3-=
configobj_5.0.6.bb" rel=3D"noreferrer" target=3D"_blank">python3-configobj_=
5.0.6.bb</a>=C2=A0 =C2=A0| 9 ---------<br>
&gt; &gt; &gt;=C2=A0 2 files changed, 10 deletions(-)<br>
&gt; &gt; &gt;=C2=A0 delete mode 100644 meta-python/recipes-devtools/python=
/<a href=3D"http://python3-configobj_5.0.6.bb" rel=3D"noreferrer" target=3D=
"_blank">python3-configobj_5.0.6.bb</a><br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; diff --git a/meta-python/recipes-core/packagegroups/<a href=
=3D"http://packagegroup-meta-python.bb" rel=3D"noreferrer" target=3D"_blank=
">packagegroup-meta-python.bb</a> b/meta-python/recipes-core/packagegroups/=
<a href=3D"http://packagegroup-meta-python.bb" rel=3D"noreferrer" target=3D=
"_blank">packagegroup-meta-python.bb</a><br>
&gt; &gt; &gt; index dbfa991ebe..6b10913657 100644<br>
&gt; &gt; &gt; --- a/meta-python/recipes-core/packagegroups/<a href=3D"http=
://packagegroup-meta-python.bb" rel=3D"noreferrer" target=3D"_blank">packag=
egroup-meta-python.bb</a><br>
&gt; &gt; &gt; +++ b/meta-python/recipes-core/packagegroups/<a href=3D"http=
://packagegroup-meta-python.bb" rel=3D"noreferrer" target=3D"_blank">packag=
egroup-meta-python.bb</a><br>
&gt; &gt; &gt; @@ -81,7 +81,6 @@ RDEPENDS:packagegroup-meta-python3 =3D &qu=
ot;\<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 python3-colorlog \<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 python3-colorzero \<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 python3-configargparse \<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 python3-configobj \<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 python3-configparser \<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 python3-configshell-fb \<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 python3-constantly \<br>
&gt; &gt; &gt; diff --git a/meta-python/recipes-devtools/python/<a href=3D"=
http://python3-configobj_5.0.6.bb" rel=3D"noreferrer" target=3D"_blank">pyt=
hon3-configobj_5.0.6.bb</a> b/meta-python/recipes-devtools/python/<a href=
=3D"http://python3-configobj_5.0.6.bb" rel=3D"noreferrer" target=3D"_blank"=
>python3-configobj_5.0.6.bb</a><br>
&gt; &gt; &gt; deleted file mode 100644<br>
&gt; &gt; &gt; index 1b85368105..0000000000<br>
&gt; &gt; &gt; --- a/meta-python/recipes-devtools/python/<a href=3D"http://=
python3-configobj_5.0.6.bb" rel=3D"noreferrer" target=3D"_blank">python3-co=
nfigobj_5.0.6.bb</a><br>
&gt; &gt; &gt; +++ /dev/null<br>
&gt; &gt; &gt; @@ -1,9 +0,0 @@<br>
&gt; &gt; &gt; -SUMMARY =3D &quot;Config file reading, writing and validati=
on.&quot;<br>
&gt; &gt; &gt; -SECTION =3D &quot;devel/python&quot;<br>
&gt; &gt; &gt; -LICENSE =3D &quot;BSD-3-Clause&quot;<br>
&gt; &gt; &gt; -LIC_FILES_CHKSUM =3D &quot;file://configobj.py;md5=3Da7c396=
8dd866dfd23e91e125b669ab21&quot;<br>
&gt; &gt; &gt; -<br>
&gt; &gt; &gt; -PYPI_PACKAGE =3D &quot;configobj&quot;<br>
&gt; &gt; &gt; -SRC_URI[sha256sum] =3D &quot;a2f5650770e1c87fb335af19a9b7eb=
73fc05ccf22144eb68db7d00cd2bcb0902&quot;<br>
&gt; &gt; &gt; -<br>
&gt; &gt; &gt; -inherit pypi setuptools3<br>
&gt; &gt; &gt; --<br>
&gt; &gt; &gt; 2.35.1<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt;<br>
<br>
-- <br>
Justin Bronder<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#95608): <a href=3D"https://lists.openembedded.org/g/ope=
nembedded-devel/message/95608" rel=3D"noreferrer" target=3D"_blank">https:/=
/lists.openembedded.org/g/openembedded-devel/message/95608</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/89463815/9247=
29" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt/=
89463815/924729</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:ticotimo@gmail.com" targ=
et=3D"_blank">ticotimo@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--0000000000003719aa05d91d8c79--

