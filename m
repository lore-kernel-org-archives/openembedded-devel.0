Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 604C8C25B7E
	for <webhook@archiver.kernel.org>; Wed, 29 May 2024 06:40:15 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web10.7601.1716964805618589726
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 May 2024 23:40:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=uL3ZhLPb;
 spf=pass (domain: smile.fr, ip: 209.85.221.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-354dfe54738so1108996f8f.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 23:40:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1716964804; x=1717569604; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wtRSr0Q23f/7T5HbdquKSDCd1h0e61HOPO8WgnFTnwM=;
        b=uL3ZhLPbR6ZQ1K4561+m6Mw1pyg54NL5IPIrhZel446ZxNU0Iu4td/0Em/+R5wolZp
         gEWFIxZys6DU1ewddNPSd8fd9/OEL/PznCkKmoYlH+Kw1jTi+guJvlrx0J2vK0CyzcC5
         +dGMAVN1XSOTgusWVIhA29OcZH3apHQZa6Iy8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716964804; x=1717569604;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wtRSr0Q23f/7T5HbdquKSDCd1h0e61HOPO8WgnFTnwM=;
        b=m9TyjkyizFo4TiQwU95rOYzaNDVIDRG5cIiIiTDxnZuC5j/hW+4WuDsUbhvCBd6GCC
         451HD9KbvTTUH1DeFmIN33i0sHTT9epc9ptS3dSE+nDXTOobeWiwWsLuPcxZS3RsOcv8
         ZapKipilkEvPEGmA0viKfdV28ATKwfvduOonJusnxD5m884wLFYGKkRDHx2vVMLDAsJt
         mbBD7nyz/CKNQBtuEo3VDmVRcqK8E4GkG+CN27XAEmHpKpY6KNLhb9hkWM+g+qS+bybt
         hK9zxnaiCXe05oFn4thoF8/0jrfadQIvjtBWks2JazmsSUoVnNoWy7GFOdRE9sTYTKVk
         3T0A==
X-Gm-Message-State: AOJu0Yy1e6xSHm/7Qx2fvsRI5fx+hxv1UXZP6hcmZ7pUHcIdzztbLe8j
	oc2xVxOQ6t0GYVrJi08TiAE0jgGtITyR2SY97r8kye3asujOheyWX6//buTFTU351Cl9n+vLOLE
	iel3AuLJgPcJnioGc1oDQti4AsCs5tCqVfa50dg==
X-Google-Smtp-Source: AGHT+IHav29rOtCNoKgDKnlTaFQxclHvlKjI024g1P/j0jt5WOf+GmpYSTQQUYiaeXqUTsReyXXo+6XaQxPnK92dE8s=
X-Received: by 2002:a5d:4f8b:0:b0:355:2c1:cbba with SMTP id
 ffacd0b85a97d-3552217f5c2mr10384785f8f.16.1716964803624; Tue, 28 May 2024
 23:40:03 -0700 (PDT)
MIME-Version: 1.0
References: <20240527073320.3472465-1-yoann.congal@smile.fr> <a1886836-9892-ff55-4df6-7b658cd6c452@windriver.com>
In-Reply-To: <a1886836-9892-ff55-4df6-7b658cd6c452@windriver.com>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Wed, 29 May 2024 08:39:37 +0200
Message-ID: <CAMSfU+4jcTw=5c_ZQq9szYAXX723OkSu9WnBWtMhgWiJC81-KQ@mail.gmail.com>
Subject: Re: [oe] [meta-multimedia][PATCH] sample-content: Set UNPACKDIR to S
 to avoid a QA warning
To: Qi.Chen@windriver.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000365acf0619920503"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 May 2024 06:40:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110605

--000000000000365acf0619920503
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le lun. 27 mai 2024 =C3=A0 09:58, Chen Qi via lists.openembedded.org <Qi.Ch=
en=3D
windriver.com@lists.openembedded.org> a =C3=A9crit :

> I think you need to do the opposite, setting S using UNPACKDIR.
>

Thanks for your review. I've asked this question at the weekly technical
meeting.
The answer was to try to be consistent to handle S/UNPACKDIR. So, I've sent
a v2 to align the patch to what OE-Core does :
https://lists.openembedded.org/g/openembedded-devel/topic/meta_multimedia_p=
atch_v2/106353038

I've also sent a doc patch to (try to) clarify :
https://lists.yoctoproject.org/g/docs/topic/master_next_patch/106353882

Regards,

>
> Regards,
> Qi
>
>
> On 5/27/24 15:33, Yoann Congal via lists.openembedded.org wrote:
> > Since recent UNPACKDIR work, default S directory is not created anymore=
.
> > By setting UNPACKDIR to S, S in indirectly created in do_unpack.
> >
> > Fixes these warnings:
> >    WARNING: bigbuckbunny-480p-1.0-r0 do_unpack: bigbuckbunny-480p: the
> directory ${WORKDIR}/${BP}
> (.../tmp/work/all-poky-linux/bigbuckbunny-480p/1.0/bigbuckbunny-480p-1.0)
> pointed to by the S variable doesn't exist - please set S within the reci=
pe
> to point to where the source has been unpacked to
> >    WARNING: bigbuckbunny-720p-1.0-r0 do_unpack: bigbuckbunny-720p: the
> directory ${WORKDIR}/${BP}
> (.../tmp/work/all-poky-linux/bigbuckbunny-720p/1.0/bigbuckbunny-720p-1.0)
> pointed to by the S variable doesn't exist - please set S within the reci=
pe
> to point to where the source has been unpacked to
> >    WARNING: bigbuckbunny-1080p-1.0-r0 do_unpack: bigbuckbunny-1080p: th=
e
> directory ${WORKDIR}/${BP}
> (.../tmp/work/all-poky-linux/bigbuckbunny-1080p/1.0/bigbuckbunny-1080p-1.=
0)
> pointed to by the S variable doesn't exist - please set S within the reci=
pe
> to point to where the source has been unpacked to
> >    WARNING: tearsofsteel-1080p-1.0-r0 do_unpack: tearsofsteel-1080p: th=
e
> directory ${WORKDIR}/${BP}
> (.../tmp/work/all-poky-linux/tearsofsteel-1080p/1.0/tearsofsteel-1080p-1.=
0)
> pointed to by the S variable doesn't exist - please set S within the reci=
pe
> to point to where the source has been unpacked to
> >
> > Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
> > Reviewed-by: Alexandre Truong <alexandre.truong@smile.fr>
> > ---
> >   .../recipes-multimedia/sample-content/bigbuckbunny-1080p.bb     | 2 +=
+
> >   .../recipes-multimedia/sample-content/bigbuckbunny-480p.bb      | 2 +=
+
> >   .../recipes-multimedia/sample-content/bigbuckbunny-720p.bb      | 2 +=
+
> >   .../recipes-multimedia/sample-content/tearsofsteel-1080p.bb     | 2 +=
+
> >   4 files changed, 8 insertions(+)
> >
> > diff --git a/meta-multimedia/recipes-multimedia/sample-content/
> bigbuckbunny-1080p.bb b/meta-multimedia/recipes-multimedia/sample-content=
/
> bigbuckbunny-1080p.bb
> > index e5a8f085b..83ad136b4 100644
> > --- a/meta-multimedia/recipes-multimedia/sample-content/
> bigbuckbunny-1080p.bb
> > +++ b/meta-multimedia/recipes-multimedia/sample-content/
> bigbuckbunny-1080p.bb
> > @@ -9,6 +9,8 @@ SRC_URI[sha256sum] =3D
> "69fe2cfe7154a6e752688e3a0d7d6b07b1605bbaf75b56f6470dc7b4c2
> >
> >   inherit allarch
> >
> > +UNPACKDIR =3D "${S}"
> > +
> >   do_install() {
> >       install -d ${D}${datadir}/movies
> >       install -m 0644 ${UNPACKDIR}/big_buck_bunny_1080p_surround.avi
> ${D}${datadir}/movies/
> > diff --git a/meta-multimedia/recipes-multimedia/sample-content/
> bigbuckbunny-480p.bb b/meta-multimedia/recipes-multimedia/sample-content/
> bigbuckbunny-480p.bb
> > index 37e519790..b054948e6 100644
> > --- a/meta-multimedia/recipes-multimedia/sample-content/
> bigbuckbunny-480p.bb
> > +++ b/meta-multimedia/recipes-multimedia/sample-content/
> bigbuckbunny-480p.bb
> > @@ -9,6 +9,8 @@ SRC_URI[sha256sum] =3D
> "40d1cf5bc8e1b0e55dac7bb2e3fbc2aea05b6679444864781299b24db0
> >
> >   inherit allarch
> >
> > +UNPACKDIR =3D "${S}"
> > +
> >   do_install() {
> >       install -d ${D}${datadir}/movies
> >       install -m 0644 ${UNPACKDIR}/big_buck_bunny_480p_surround-fix.avi
> ${D}${datadir}/movies/
> > diff --git a/meta-multimedia/recipes-multimedia/sample-content/
> bigbuckbunny-720p.bb b/meta-multimedia/recipes-multimedia/sample-content/
> bigbuckbunny-720p.bb
> > index 2b233d3e1..4b80d110a 100644
> > --- a/meta-multimedia/recipes-multimedia/sample-content/
> bigbuckbunny-720p.bb
> > +++ b/meta-multimedia/recipes-multimedia/sample-content/
> bigbuckbunny-720p.bb
> > @@ -9,6 +9,8 @@ SRC_URI[sha256sum] =3D
> "b957d6e6212638441b52d3b620af157cc8d40c2a0342669294854a06ed
> >
> >   inherit allarch
> >
> > +UNPACKDIR =3D "${S}"
> > +
> >   do_install() {
> >       install -d ${D}${datadir}/movies
> >       install -m 0644 ${UNPACKDIR}/big_buck_bunny_720p_surround.avi
> ${D}${datadir}/movies/
> > diff --git a/meta-multimedia/recipes-multimedia/sample-content/
> tearsofsteel-1080p.bb b/meta-multimedia/recipes-multimedia/sample-content=
/
> tearsofsteel-1080p.bb
> > index 34753fdb1..02b3c3048 100644
> > --- a/meta-multimedia/recipes-multimedia/sample-content/
> tearsofsteel-1080p.bb
> > +++ b/meta-multimedia/recipes-multimedia/sample-content/
> tearsofsteel-1080p.bb
> > @@ -8,6 +8,8 @@ SRC_URI[sha256sum] =3D
> "bd2b5bc6c16d4085034f47ef7e4b3938afe86b4eec4ac3cf2685367d3b
> >
> >   inherit allarch
> >
> > +UNPACKDIR =3D "${S}"
> > +
> >   do_install() {
> >       install -d ${D}${datadir}/movies
> >       install -m 0644 ${UNPACKDIR}/ToS-4k-1920.mov ${D}${datadir}/movie=
s/
> >
> >
> >
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#110534):
> https://lists.openembedded.org/g/openembedded-devel/message/110534
> Mute This Topic: https://lists.openembedded.org/mt/106326666/4316185
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> yoann.congal@smile.fr]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Yoann Congal
Smile ECS - Tech expert

--000000000000365acf0619920503
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi,<br></div><div dir=3D"ltr"><br></div><div dir=3D"l=
tr">Le=C2=A0lun. 27 mai 2024 =C3=A0=C2=A009:58, Chen Qi via <a href=3D"http=
://lists.openembedded.org">lists.openembedded.org</a> &lt;Qi.Chen=3D<a href=
=3D"mailto:windriver.com@lists.openembedded.org">windriver.com@lists.openem=
bedded.org</a>&gt; a =C3=A9crit=C2=A0:</div><div class=3D"gmail_quote"><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">I think you need to do the op=
posite, setting S using UNPACKDIR.<br></blockquote><div><br></div><div>Than=
ks for your review. I&#39;ve asked this question at the weekly technical me=
eting.</div><div>The answer was to try to be consistent to handle S/UNPACKD=
IR. So, I&#39;ve sent a v2 to align the patch to what OE-Core does : <a hre=
f=3D"https://lists.openembedded.org/g/openembedded-devel/topic/meta_multime=
dia_patch_v2/106353038">https://lists.openembedded.org/g/openembedded-devel=
/topic/meta_multimedia_patch_v2/106353038</a></div><div><br></div><div>I&#3=
9;ve also sent a doc patch to (try to) clarify : <a href=3D"https://lists.y=
octoproject.org/g/docs/topic/master_next_patch/106353882">https://lists.yoc=
toproject.org/g/docs/topic/master_next_patch/106353882</a></div><div>=C2=A0=
</div><div>Regards,<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">
<br>
Regards,<br>
Qi<br>
<br>
<br>
On 5/27/24 15:33, Yoann Congal via <a href=3D"http://lists.openembedded.org=
" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org</a> wrote:<br=
>
&gt; Since recent UNPACKDIR work, default S directory is not created anymor=
e.<br>
&gt; By setting UNPACKDIR to S, S in indirectly created in do_unpack.<br>
&gt;<br>
&gt; Fixes these warnings:<br>
&gt;=C2=A0 =C2=A0 WARNING: bigbuckbunny-480p-1.0-r0 do_unpack: bigbuckbunny=
-480p: the directory ${WORKDIR}/${BP} (.../tmp/work/all-poky-linux/bigbuckb=
unny-480p/1.0/bigbuckbunny-480p-1.0) pointed to by the S variable doesn&#39=
;t exist - please set S within the recipe to point to where the source has =
been unpacked to<br>
&gt;=C2=A0 =C2=A0 WARNING: bigbuckbunny-720p-1.0-r0 do_unpack: bigbuckbunny=
-720p: the directory ${WORKDIR}/${BP} (.../tmp/work/all-poky-linux/bigbuckb=
unny-720p/1.0/bigbuckbunny-720p-1.0) pointed to by the S variable doesn&#39=
;t exist - please set S within the recipe to point to where the source has =
been unpacked to<br>
&gt;=C2=A0 =C2=A0 WARNING: bigbuckbunny-1080p-1.0-r0 do_unpack: bigbuckbunn=
y-1080p: the directory ${WORKDIR}/${BP} (.../tmp/work/all-poky-linux/bigbuc=
kbunny-1080p/1.0/bigbuckbunny-1080p-1.0) pointed to by the S variable doesn=
&#39;t exist - please set S within the recipe to point to where the source =
has been unpacked to<br>
&gt;=C2=A0 =C2=A0 WARNING: tearsofsteel-1080p-1.0-r0 do_unpack: tearsofstee=
l-1080p: the directory ${WORKDIR}/${BP} (.../tmp/work/all-poky-linux/tearso=
fsteel-1080p/1.0/tearsofsteel-1080p-1.0) pointed to by the S variable doesn=
&#39;t exist - please set S within the recipe to point to where the source =
has been unpacked to<br>
&gt;<br>
&gt; Signed-off-by: Yoann Congal &lt;<a href=3D"mailto:yoann.congal@smile.f=
r" target=3D"_blank">yoann.congal@smile.fr</a>&gt;<br>
&gt; Reviewed-by: Alexandre Truong &lt;<a href=3D"mailto:alexandre.truong@s=
mile.fr" target=3D"_blank">alexandre.truong@smile.fr</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0.../recipes-multimedia/sample-content/<a href=3D"http://bi=
gbuckbunny-1080p.bb" rel=3D"noreferrer" target=3D"_blank">bigbuckbunny-1080=
p.bb</a>=C2=A0 =C2=A0 =C2=A0| 2 ++<br>
&gt;=C2=A0 =C2=A0.../recipes-multimedia/sample-content/<a href=3D"http://bi=
gbuckbunny-480p.bb" rel=3D"noreferrer" target=3D"_blank">bigbuckbunny-480p.=
bb</a>=C2=A0 =C2=A0 =C2=A0 | 2 ++<br>
&gt;=C2=A0 =C2=A0.../recipes-multimedia/sample-content/<a href=3D"http://bi=
gbuckbunny-720p.bb" rel=3D"noreferrer" target=3D"_blank">bigbuckbunny-720p.=
bb</a>=C2=A0 =C2=A0 =C2=A0 | 2 ++<br>
&gt;=C2=A0 =C2=A0.../recipes-multimedia/sample-content/<a href=3D"http://te=
arsofsteel-1080p.bb" rel=3D"noreferrer" target=3D"_blank">tearsofsteel-1080=
p.bb</a>=C2=A0 =C2=A0 =C2=A0| 2 ++<br>
&gt;=C2=A0 =C2=A04 files changed, 8 insertions(+)<br>
&gt;<br>
&gt; diff --git a/meta-multimedia/recipes-multimedia/sample-content/<a href=
=3D"http://bigbuckbunny-1080p.bb" rel=3D"noreferrer" target=3D"_blank">bigb=
uckbunny-1080p.bb</a> b/meta-multimedia/recipes-multimedia/sample-content/<=
a href=3D"http://bigbuckbunny-1080p.bb" rel=3D"noreferrer" target=3D"_blank=
">bigbuckbunny-1080p.bb</a><br>
&gt; index e5a8f085b..83ad136b4 100644<br>
&gt; --- a/meta-multimedia/recipes-multimedia/sample-content/<a href=3D"htt=
p://bigbuckbunny-1080p.bb" rel=3D"noreferrer" target=3D"_blank">bigbuckbunn=
y-1080p.bb</a><br>
&gt; +++ b/meta-multimedia/recipes-multimedia/sample-content/<a href=3D"htt=
p://bigbuckbunny-1080p.bb" rel=3D"noreferrer" target=3D"_blank">bigbuckbunn=
y-1080p.bb</a><br>
&gt; @@ -9,6 +9,8 @@ SRC_URI[sha256sum] =3D &quot;69fe2cfe7154a6e752688e3a0=
d7d6b07b1605bbaf75b56f6470dc7b4c2<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0inherit allarch<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +UNPACKDIR =3D &quot;${S}&quot;<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0do_install() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}${datadir}/movies<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 0644 ${UNPACKDIR}/big_buck_bunny_=
1080p_surround.avi ${D}${datadir}/movies/<br>
&gt; diff --git a/meta-multimedia/recipes-multimedia/sample-content/<a href=
=3D"http://bigbuckbunny-480p.bb" rel=3D"noreferrer" target=3D"_blank">bigbu=
ckbunny-480p.bb</a> b/meta-multimedia/recipes-multimedia/sample-content/<a =
href=3D"http://bigbuckbunny-480p.bb" rel=3D"noreferrer" target=3D"_blank">b=
igbuckbunny-480p.bb</a><br>
&gt; index 37e519790..b054948e6 100644<br>
&gt; --- a/meta-multimedia/recipes-multimedia/sample-content/<a href=3D"htt=
p://bigbuckbunny-480p.bb" rel=3D"noreferrer" target=3D"_blank">bigbuckbunny=
-480p.bb</a><br>
&gt; +++ b/meta-multimedia/recipes-multimedia/sample-content/<a href=3D"htt=
p://bigbuckbunny-480p.bb" rel=3D"noreferrer" target=3D"_blank">bigbuckbunny=
-480p.bb</a><br>
&gt; @@ -9,6 +9,8 @@ SRC_URI[sha256sum] =3D &quot;40d1cf5bc8e1b0e55dac7bb2e=
3fbc2aea05b6679444864781299b24db0<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0inherit allarch<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +UNPACKDIR =3D &quot;${S}&quot;<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0do_install() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}${datadir}/movies<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 0644 ${UNPACKDIR}/big_buck_bunny_=
480p_surround-fix.avi ${D}${datadir}/movies/<br>
&gt; diff --git a/meta-multimedia/recipes-multimedia/sample-content/<a href=
=3D"http://bigbuckbunny-720p.bb" rel=3D"noreferrer" target=3D"_blank">bigbu=
ckbunny-720p.bb</a> b/meta-multimedia/recipes-multimedia/sample-content/<a =
href=3D"http://bigbuckbunny-720p.bb" rel=3D"noreferrer" target=3D"_blank">b=
igbuckbunny-720p.bb</a><br>
&gt; index 2b233d3e1..4b80d110a 100644<br>
&gt; --- a/meta-multimedia/recipes-multimedia/sample-content/<a href=3D"htt=
p://bigbuckbunny-720p.bb" rel=3D"noreferrer" target=3D"_blank">bigbuckbunny=
-720p.bb</a><br>
&gt; +++ b/meta-multimedia/recipes-multimedia/sample-content/<a href=3D"htt=
p://bigbuckbunny-720p.bb" rel=3D"noreferrer" target=3D"_blank">bigbuckbunny=
-720p.bb</a><br>
&gt; @@ -9,6 +9,8 @@ SRC_URI[sha256sum] =3D &quot;b957d6e6212638441b52d3b62=
0af157cc8d40c2a0342669294854a06ed<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0inherit allarch<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +UNPACKDIR =3D &quot;${S}&quot;<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0do_install() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}${datadir}/movies<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 0644 ${UNPACKDIR}/big_buck_bunny_=
720p_surround.avi ${D}${datadir}/movies/<br>
&gt; diff --git a/meta-multimedia/recipes-multimedia/sample-content/<a href=
=3D"http://tearsofsteel-1080p.bb" rel=3D"noreferrer" target=3D"_blank">tear=
sofsteel-1080p.bb</a> b/meta-multimedia/recipes-multimedia/sample-content/<=
a href=3D"http://tearsofsteel-1080p.bb" rel=3D"noreferrer" target=3D"_blank=
">tearsofsteel-1080p.bb</a><br>
&gt; index 34753fdb1..02b3c3048 100644<br>
&gt; --- a/meta-multimedia/recipes-multimedia/sample-content/<a href=3D"htt=
p://tearsofsteel-1080p.bb" rel=3D"noreferrer" target=3D"_blank">tearsofstee=
l-1080p.bb</a><br>
&gt; +++ b/meta-multimedia/recipes-multimedia/sample-content/<a href=3D"htt=
p://tearsofsteel-1080p.bb" rel=3D"noreferrer" target=3D"_blank">tearsofstee=
l-1080p.bb</a><br>
&gt; @@ -8,6 +8,8 @@ SRC_URI[sha256sum] =3D &quot;bd2b5bc6c16d4085034f47ef7=
e4b3938afe86b4eec4ac3cf2685367d3b<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0inherit allarch<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +UNPACKDIR =3D &quot;${S}&quot;<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0do_install() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}${datadir}/movies<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 0644 ${UNPACKDIR}/ToS-4k-1920.mov=
 ${D}${datadir}/movies/<br>
&gt;<br>
&gt; <br>
&gt;<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#110534): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/110534" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/110534</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/106326666/431=
6185" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/106326666/4316185</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:yoann.congal@smile.fr" t=
arget=3D"_blank">yoann.congal@smile.fr</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><br><span class=3D"gmail_signature_pre=
fix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"l=
tr"><font face=3D"Raleway, regular">Yoann Congal</font><div><font face=3D"R=
aleway, regular">Smile ECS - Tech expert<br></font></div></div></div></div>

--000000000000365acf0619920503--

