Return-Path: <workjagadeesh@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78E15C32793
	for <webhook@archiver.kernel.org>; Wed, 24 Aug 2022 02:09:19 +0000 (UTC)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com
 [209.85.128.173])
 by mx.groups.io with SMTP id smtpd.web10.6463.1661306952462537979
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Aug 2022 19:09:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Dd6xiooU;
 spf=pass (domain: gmail.com, ip: 209.85.128.173,
 mailfrom: workjagadeesh@gmail.com)
Received: by mail-yw1-f173.google.com with SMTP id
 00721157ae682-333a4a5d495so425185987b3.10
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Aug 2022 19:09:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=Z+VdRxul7I6kZHYAZA9zl7xwpDU42nNV12aeh5xlIxE=;
        b=Dd6xiooUaigD9BHFeQjVdvdljqn0j9bIhXMWIUto3bKxiBIuodR6VibXXIi+BTT7yb
         wS50FTTuo8HuwNn8+QI4+347r6PGWktrB2+rpacPCGDqtcqNh8rNLJQqJeIf0yI4nuiL
         WWIe7jMO/QU8iS+GmFLydcGvAG3LrkSEClklam6gfTdhrK6RSjUzFu4+UyssyKlEvOVr
         2NRHrIyg8Baw44YvhtxUbs6yQpxevip8uteo5IqElqW7rQfBpQ3UUipsUljAUySYtvJ+
         LAspv19GDCfwdJZ+1FNoogmq1D9FCshLTe2ddFSlO0azxuSqq7jYUXdCn7hCK+7aOieE
         cvFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=Z+VdRxul7I6kZHYAZA9zl7xwpDU42nNV12aeh5xlIxE=;
        b=IW4ERl9ATYbleNf2/UCU2axMVs1K9ljvoMMokJUW+ue/sfyvEyfrtT3pXgQEgfxPgl
         1rK4HFa1MORAsZx5/h8nQTAvYUMMBWT+vL8vEIepfF9n1rBaT/1SzhtrnrUyms6dp5IU
         VTQa6Tq98UVhYiv/BiUDhU72L6UmAcG6cMIPnsIObQ7tPjLEhmvLAubpP492x4U2RJ6q
         6+p8a6VCKRQd/ZEsu9oZWf7+jwUqHwFftmeYeUB+WBMSAJ+bMaFW18WDZHMNU51/smTO
         oRI6p07iYLDAva5BR+6b5y5JiHA9aNu5WZ7L+cZ6ZxYfN4MDZMUwYOd3oKAE7IRAFvxC
         TU7w==
X-Gm-Message-State: ACgBeo1xshf0Lmu0H2vp01Br9/usREyc4JxO2xoe2pQKnLcywVRAJiPK
	6XRLJV8uck0dhDqjIQH5T2fSg3hdB8C442Kqluk=
X-Google-Smtp-Source: 
 AA6agR5BMEZUFNPz4EBSm5sEBkGO1K+gqALO9KedYByvKqAlGviYG5mNSSogRq/OkwQFxkyv6aBaYyQCkHRKkfFVSq8=
X-Received: by 2002:a05:6902:10c5:b0:671:7158:cf2c with SMTP id
 w5-20020a05690210c500b006717158cf2cmr28572980ybu.314.1661306951646; Tue, 23
 Aug 2022 19:09:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220823172602.212-1-workjagadeesh@gmail.com>
 <20220823172602.212-2-workjagadeesh@gmail.com>
 <CAMKF1soKDpxbLY9DgHRkiAHGey_oL29Fb242byujb3WZt3sAcg@mail.gmail.com>
In-Reply-To: 
 <CAMKF1soKDpxbLY9DgHRkiAHGey_oL29Fb242byujb3WZt3sAcg@mail.gmail.com>
From: Jagadeesh Krishnanjanappa <workjagadeesh@gmail.com>
Date: Wed, 24 Aug 2022 07:39:01 +0530
Message-ID: 
 <CAM682A0EgY6gEWkW9gqEJVP_uFAzYbeOMEHMpB5zsdEc=EMs_A@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH 2/3] python3-django: make 3.2.x as
 default version
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000b7418b05e6f32a41"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Aug 2022 02:09:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98413

--000000000000b7418b05e6f32a41
Content-Type: text/plain; charset="UTF-8"

On Tue, Aug 23, 2022 at 11:53 PM Khem Raj <raj.khem@gmail.com> wrote:

> On Tue, Aug 23, 2022 at 10:26 AM Jagadeesh Krishnanjanappa
> <workjagadeesh@gmail.com> wrote:
> >
> > According to https://www.djangoproject.com/download/ python3-django
> > 3.2.x has LTS support upto 2024, hence make it as default version
> > to build.
>
> It seems 2.2 LTS went EOL  on April 11, 2022, can you also send a
> patch to remove those recipes while you are here.
>
> Sure. I was planning to send the patch to remove the recipe after these
patches are merged as it should not break the build. Now the patches
are merged and the remove patch is also sent.

Thanks,
Jagadeesh


> > Also, add runtime dependency on python3-asgiref as the "django-admin"
> > script needs asgiref module.
> >
> > More info: https://bugzilla.yoctoproject.org/show_bug.cgi?id=14888
> >
> > Signed-off-by: Jagadeesh Krishnanjanappa <workjagadeesh@gmail.com>
> > ---
> >  .../recipes-devtools/python/python3-django_3.2.12.bb        | 6 +-----
> >  1 file changed, 1 insertion(+), 5 deletions(-)
> >
> > diff --git a/meta-python/recipes-devtools/python/
> python3-django_3.2.12.bb b/meta-python/recipes-devtools/python/
> python3-django_3.2.12.bb
> > index adbc498bd..17d402d65 100644
> > --- a/meta-python/recipes-devtools/python/python3-django_3.2.12.bb
> > +++ b/meta-python/recipes-devtools/python/python3-django_3.2.12.bb
> > @@ -5,9 +5,5 @@ SRC_URI[sha256sum] =
> "9772e6935703e59e993960832d66a614cf0233a1c5123bc6224ecc6ad6
> >
> >  RDEPENDS:${PN} += "\
> >      ${PYTHON_PN}-sqlparse \
> > +    ${PYTHON_PN}-asgiref \
> >  "
> > -
> > -# Set DEFAULT_PREFERENCE so that the LTS version of django is built by
> > -# default. To build the 3.x branch,
> > -# PREFERRED_VERSION_python3-django = "3.2.2" can be added to local.conf
> > -DEFAULT_PREFERENCE = "-1"
> > --
> > 2.17.1
> >
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#98398):
> https://lists.openembedded.org/g/openembedded-devel/message/98398
> > Mute This Topic: https://lists.openembedded.org/mt/93209460/1997914
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >
>

--000000000000b7418b05e6f32a41
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Aug 23, 2022 at 11:53 PM Khem=
 Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Tue, Au=
g 23, 2022 at 10:26 AM Jagadeesh Krishnanjanappa<br>
&lt;<a href=3D"mailto:workjagadeesh@gmail.com" target=3D"_blank">workjagade=
esh@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; According to <a href=3D"https://www.djangoproject.com/download/" rel=
=3D"noreferrer" target=3D"_blank">https://www.djangoproject.com/download/</=
a> python3-django<br>
&gt; 3.2.x has LTS support upto 2024, hence make it as default version<br>
&gt; to build.<br>
<br>
It seems 2.2 LTS went EOL=C2=A0 on April 11, 2022, can you also send a<br>
patch to remove those recipes while you are here.<br>
<br></blockquote><div>Sure. I was planning to send the patch to remove the =
recipe after these</div><div>patches are merged as it should not break the =
build. Now the patches</div><div>are merged and the remove patch is also se=
nt.</div><div><br></div><div>Thanks,</div><div>Jagadeesh</div><div>=C2=A0</=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; Also, add runtime dependency on python3-asgiref as the &quot;django-ad=
min&quot;<br>
&gt; script needs asgiref module.<br>
&gt;<br>
&gt; More info: <a href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?i=
d=3D14888" rel=3D"noreferrer" target=3D"_blank">https://bugzilla.yoctoproje=
ct.org/show_bug.cgi?id=3D14888</a><br>
&gt;<br>
&gt; Signed-off-by: Jagadeesh Krishnanjanappa &lt;<a href=3D"mailto:workjag=
adeesh@gmail.com" target=3D"_blank">workjagadeesh@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../recipes-devtools/python/<a href=3D"http://python3-django_3.2=
.12.bb" rel=3D"noreferrer" target=3D"_blank">python3-django_3.2.12.bb</a>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 6 +-----<br>
&gt;=C2=A0 1 file changed, 1 insertion(+), 5 deletions(-)<br>
&gt;<br>
&gt; diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://pyt=
hon3-django_3.2.12.bb" rel=3D"noreferrer" target=3D"_blank">python3-django_=
3.2.12.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://pytho=
n3-django_3.2.12.bb" rel=3D"noreferrer" target=3D"_blank">python3-django_3.=
2.12.bb</a><br>
&gt; index adbc498bd..17d402d65 100644<br>
&gt; --- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-dj=
ango_3.2.12.bb" rel=3D"noreferrer" target=3D"_blank">python3-django_3.2.12.=
bb</a><br>
&gt; +++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-dj=
ango_3.2.12.bb" rel=3D"noreferrer" target=3D"_blank">python3-django_3.2.12.=
bb</a><br>
&gt; @@ -5,9 +5,5 @@ SRC_URI[sha256sum] =3D &quot;9772e6935703e59e993960832=
d66a614cf0233a1c5123bc6224ecc6ad6<br>
&gt;<br>
&gt;=C2=A0 RDEPENDS:${PN} +=3D &quot;\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ${PYTHON_PN}-sqlparse \<br>
&gt; +=C2=A0 =C2=A0 ${PYTHON_PN}-asgiref \<br>
&gt;=C2=A0 &quot;<br>
&gt; -<br>
&gt; -# Set DEFAULT_PREFERENCE so that the LTS version of django is built b=
y<br>
&gt; -# default. To build the 3.x branch,<br>
&gt; -# PREFERRED_VERSION_python3-django =3D &quot;3.2.2&quot; can be added=
 to local.conf<br>
&gt; -DEFAULT_PREFERENCE =3D &quot;-1&quot;<br>
&gt; --<br>
&gt; 2.17.1<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#98398): <a href=3D"https://lists.openembedded.org/=
g/openembedded-devel/message/98398" rel=3D"noreferrer" target=3D"_blank">ht=
tps://lists.openembedded.org/g/openembedded-devel/message/98398</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/93209460=
/1997914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.o=
rg/mt/93209460/1997914</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openem=
bedded.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.o=
rg</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
devel/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedde=
d.org/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com"=
 target=3D"_blank">raj.khem@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</blockquote></div></div>

--000000000000b7418b05e6f32a41--

