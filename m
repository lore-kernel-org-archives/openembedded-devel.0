Return-Path: <t.f.g.geelen@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E087C61DD3
	for <webhook@archiver.kernel.org>; Mon, 31 Aug 2026 18:22:58 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2913.1788200561510929107
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 31 Aug 2026 11:22:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=G/e19fge;
 spf=pass (domain: gmail.com, ip: 209.85.167.48, mailfrom: t.f.g.geelen@gmail.com)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5aeb98460c6so5154637e87.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 31 Aug 2026 11:22:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788200559; cv=none;
        d=google.com; s=arc-20260327;
        b=QN6Ndp3y9pZcWbGgLYGCGNSKRjMi8Qn84nLFk+4ubG/QOIFJla7qX2scqzcaCJErKe
         Cn13sad2pZSKSs56P+jusQCFfkpJ9I+qUCkcV5ouW9PBqbm+tGIKjeeAI/S1zAIwuhpv
         o5yWenjXMprPCg5cxENu6VuKLeXFR1//lcduxJIfMgxHqeXxIVo1l75OWM2NlGCevDLj
         KBT2VMMCf2dKKEND7ADatvSGxnIOasv6WL9py6eo2HwumuDi5FULNbjPe9QhAx1nhMeh
         X/Ges16JSGC+P+8aUJ6D2se8FO8xN15cO0HPZAvMJL2wn4SBs8K7DalrEs03yCcdsB9z
         1DnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=dWAJ2HLiP5mFOv8WCEyYm6gMYda/gbEkPPOGMjE5rCk=;
        fh=/G9LtZRVl8X+Csq14YFzyBXsXqUgofB7Lh+iKkccCvQ=;
        b=qcp9YwcXAAYTDnNk6rSNQdT2WYnMJBfFbOqR/w6bjHiTSslKNIiQ47RF69e0YVFIBH
         BI5fqW6ZeHd2Zlsh+TZRYh37XvkgEB7tLwn1Skgba4jrYOJLuhhpovkHvgjln788TbJD
         Cm5oSm3PzDslL9tnIPn9A9IVDx1BsLVyngeFjNZRD0IcyLU0qskOyk4ayvb2lG5oX8jC
         znmQYNnUEVNUewRmthdkg/X3HNs/58cQprjWK+Tk+WsTAfkQMbJHKCGq1+y3GI3v3MJF
         AwKNo6ntr4smA/WionwDbOb1X6UGjQbwYZvCSFCJUF0/0vsWLzJMmK9frOM/bygVWTRt
         4taw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788200559; x=1788805359; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dWAJ2HLiP5mFOv8WCEyYm6gMYda/gbEkPPOGMjE5rCk=;
        b=G/e19fgeIvgBDld2n5ecVF4n9aFV1TqE9teRoL0fx7WvAZ9axQBlaQ2YrlNIw8QFU1
         nzGvBEhZNBnF0/VMdlQuYRu05fwEcUk/bRN4sjIBKazXizJsFruAmvX6nSQ6PmZNLX38
         bnH+mN1t/WHnwEY6oEc+HEvcGFNY21aggz75mejyPJQCy9Hrdd8RMBe3SmpcKn7J4au6
         E8i3IG1cCVh1QtwOxzk2xZ+C3Cyo5QqQADoT381gcy5JnFpPP4YapJ+bwTAYYBIOnk94
         9qeJuv959W/VOiVTJ6OqLJeG7nk1U26I19HE0a1V9Yfw9nn2rSstXaw5jAPHlu2pZTO/
         43ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788200559; x=1788805359;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dWAJ2HLiP5mFOv8WCEyYm6gMYda/gbEkPPOGMjE5rCk=;
        b=bOQ5fTea2lU5WrygbPvzy0+g80MhMsODYJfJ6ShDMtdKLF22mkQdmBYx68B4aM6a9F
         AsT1EIc0LiR875EMFklTX5kd1hlQHNDGd5LFdYL6HHSVgHJeHRtv4JoVyK991NVJmaS9
         LewTFm1xND2n0+yvnIz92uXeoYwbDHL9lF1nwoZqnXdN+k+PcxLjmePBdNCA8mtjuGoQ
         pGmcTjYcRHlGKtLPJbjAl8ZZxZ/Czi3bGTwBJ2SBSJRschqJg2I+IWSZZ5oz6m9EGk/O
         ik3oqn7YCxHKiho+3/Hu57t7ruhnKbzw0WjOvlvqo1I0JUPvxriUxl6eCFOcpsPMvRr7
         R2Dw==
X-Forwarded-Encrypted: i=1; AKwUvBwabhReu2O6gYNL047JjIy3wRYcWtXzbHpXHy0mhaYFB7qixcFUV7U68fUv1aq+Qiz9crE1thyLRRoc2mbVLK9vINI=@lists.openembedded.org
X-Gm-Message-State: AFuF++mQd995lrFiSeJY8/x7Ajmp+9965i5W++Sd11KznUcPbbIbl+i0
	7mGsyu+0l9R0NRb63+V/xcatCedFsThpNMuggTUF9/5G2QQc4cjy5gdiPKlIMTi1muOO+jpau3q
	FUKVPorexDhITNfQ2p7cuiy5ZSGuOmEI=
X-Gm-Gg: AYBFou1YHHL+Y0/sHTh+8lxYZy7h4N+CnRb2DL7bwor6pYEdR+WZw0Zl6FynZ9Xdc3X
	fHZjSgquyLbpabXEmGF9Fu7AkZYocDD1Y5rj4QvltfVf3JP9hSPhQKBnrPszbimetrvYrC8RneQ
	ysQR1zLYVFMD4CFGq1nNcKtbZgSmbGrHMZViBwF4q9PZKamfhE1m6qL75x6Y8X5RNZA+DB3Mr6t
	YQqSvpJakGpFL0FBB25lTNVJ4M7A6m5a8k02fbUwYT5c08Cg1TVbzSsvTYe1WS8VPiRrehPmx6r
	AQEcPP4zQNXthVZzzlBTIR7GV9ETJpt2gCuGi6edM71g0XIXwf0YTqzApfmi5cV5sAKA8DIAqtg
	=
X-Received: by 2002:a05:6512:4010:b0:5ae:ba8f:f9fa with SMTP id
 2adb3069b0e04-5b5e6afab81mr8878391e87.18.1788200558873; Mon, 31 Aug 2026
 11:22:38 -0700 (PDT)
MIME-Version: 1.0
References: <CABF_=yheHCLAo=jCHROfC6k99652Kg73tZBJie1woRcgA8ccFw@mail.gmail.com>
 <CABF_=yird-Xz_nEWtVbgeve0WC2FH_Bq8Nu39kx2-DveyaHZZA@mail.gmail.com>
 <CAMKF1spidgd5zZgf98evVWEHgPeMXTg99tc6F7pojOhnuZZVLw@mail.gmail.com> <CABF_=yi3d7PaBu+ps1yHFx42PtPKMJRhziJJJ25HDmr1uA2YxQ@mail.gmail.com>
In-Reply-To: <CABF_=yi3d7PaBu+ps1yHFx42PtPKMJRhziJJJ25HDmr1uA2YxQ@mail.gmail.com>
From: Tom Geelen <t.f.g.geelen@gmail.com>
Date: Mon, 31 Aug 2026 20:22:27 +0200
X-Gm-Features: AcwNN1XN7PzNUPhxi99zaT0m_wJDMBAzcUlg7MG7RYGr_dIL28idB6o25lc04WM
Message-ID: <CAJo0Az5CQSaDoWnYo2t8p93JxrV_+UsuAGf-J7Mw2AOH0aP24g@mail.gmail.com>
Subject: Re: [oe] When can a recipe scattered around be ready to promote to meta-openembedded?
To: jan vermaete <jan.vermaete@gmail.com>
Cc: Khem Raj <raj.khem@gmail.com>, openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000019524c065a5be3e9"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 31 Aug 2026 18:22:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129615

--00000000000019524c065a5be3e9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Nope go ahead. Personally I am all in favor of having the same recipe not
exist in multiple layers.

Kind regards,

Tom

Op ma 31 aug 2026, 20:20 schreef jan vermaete <jan.vermaete@gmail.com>:

> Tom,
>
> Would you mind if I bring your version of python3-construct of
> meta-homeassistant to meta-python?
> And update to the latest release?
>
> br
>
> On Sun, Aug 30, 2026 at 8:31=E2=80=AFPM Khem Raj via lists.openembedded.o=
rg
> <raj.khem=3Dgmail.com@lists.openembedded.org> wrote:
> >
> > Being in multiple layers is a good argument to bring it into common
> layers along with that it should be a maintained package upstream. I woul=
d
> also suggest to add ptests when bringing in and update to latest version.
> Once merged, notify the respective layers about the move as they might ne=
ed
> to adjust for future releases. Ensure that it does not create additional
> layer dependency for the target layer where it is being proposed for.
> >
> > On Sun, Aug 30, 2026 at 11:22=E2=80=AFAM Jan Vermaete via lists.openemb=
edded.org
> <jan.vermaete=3Dgmail.com@lists.openembedded.org> wrote:
> >>
> >> Let me redo, without sending it too fast :-(
> >>
> >> For example the recipe python3-construct
> >> (
> https://layers.openembedded.org/layerindex/branch/master/recipes/?q=3Dpyt=
hon3-construct
> )
> >> exist in 5 different layers.
> >>
> >> Although it didn't had a release in the near past
> >> (https://pypi.org/project/construct/), those 5 layers kind of prove
> >> it's a useful thing to have.
> >>
> >> So, when and how to promote this to meta-python?
> >>
> >> On Sun, Aug 30, 2026 at 8:19=E2=80=AFPM jan vermaete <jan.vermaete@gma=
il.com>
> wrote:
> >> >
> >> > For example the recipe python3-construct
> >> > (
> https://layers.openembedded.org/layerindex/branch/master/recipes/?q=3Dpyt=
hon3-construct
> )
> >> > exist in 5 different layers
> >> >
> >> >
> >> > openembedded-devel@lists.openembedded.org
> >> >
> >> > --
> >> > Jan Vermaete
> >> > =E2=80=9CSuccess is a self-correcting phenomenom.=E2=80=9D -- Gary H=
amel
> >>
> >>
> >>
> >> --
> >> Jan Vermaete
> >> =E2=80=9CSuccess is a self-correcting phenomenom.=E2=80=9D -- Gary Ham=
el
> >>
> >>
> >>
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#129599):
> https://lists.openembedded.org/g/openembedded-devel/message/129599
> > Mute This Topic: https://lists.openembedded.org/mt/121002496/2167232
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[
> jan.vermaete@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>
>
> --
> Jan Vermaete
> =E2=80=9CSuccess is a self-correcting phenomenom.=E2=80=9D -- Gary Hamel
>

--00000000000019524c065a5be3e9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hi,<div dir=3D"auto"><br></div><div dir=3D"auto">Nope go =
ahead. Personally I am all in favor of having the same recipe not exist in =
multiple layers.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Kind re=
gards,</div><div dir=3D"auto"><br></div><div dir=3D"auto">Tom</div></div><b=
r><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=
=3D"gmail_attr">Op ma 31 aug 2026, 20:20 schreef jan vermaete &lt;<a href=
=3D"mailto:jan.vermaete@gmail.com">jan.vermaete@gmail.com</a>&gt;:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1=
px #ccc solid;padding-left:1ex">Tom,<br>
<br>
Would you mind if I bring your version of python3-construct of<br>
meta-homeassistant to meta-python?<br>
And update to the latest release?<br>
<br>
br<br>
<br>
On Sun, Aug 30, 2026 at 8:31=E2=80=AFPM Khem Raj via <a href=3D"http://list=
s.openembedded.org" rel=3D"noreferrer noreferrer" target=3D"_blank">lists.o=
penembedded.org</a><br>
&lt;raj.khem=3D<a href=3D"mailto:gmail.com@lists.openembedded.org" target=
=3D"_blank" rel=3D"noreferrer">gmail.com@lists.openembedded.org</a>&gt; wro=
te:<br>
&gt;<br>
&gt; Being in multiple layers is a good argument to bring it into common la=
yers along with that it should be a maintained package upstream. I would al=
so suggest to add ptests when bringing in and update to latest version. Onc=
e merged, notify the respective layers about the move as they might need to=
 adjust for future releases. Ensure that it does not create additional laye=
r dependency for the target layer where it is being proposed for.<br>
&gt;<br>
&gt; On Sun, Aug 30, 2026 at 11:22=E2=80=AFAM Jan Vermaete via <a href=3D"h=
ttp://lists.openembedded.org" rel=3D"noreferrer noreferrer" target=3D"_blan=
k">lists.openembedded.org</a> &lt;jan.vermaete=3D<a href=3D"mailto:gmail.co=
m@lists.openembedded.org" target=3D"_blank" rel=3D"noreferrer">gmail.com@li=
sts.openembedded.org</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; Let me redo, without sending it too fast :-(<br>
&gt;&gt;<br>
&gt;&gt; For example the recipe python3-construct<br>
&gt;&gt; (<a href=3D"https://layers.openembedded.org/layerindex/branch/mast=
er/recipes/?q=3Dpython3-construct" rel=3D"noreferrer noreferrer" target=3D"=
_blank">https://layers.openembedded.org/layerindex/branch/master/recipes/?q=
=3Dpython3-construct</a>)<br>
&gt;&gt; exist in 5 different layers.<br>
&gt;&gt;<br>
&gt;&gt; Although it didn&#39;t had a release in the near past<br>
&gt;&gt; (<a href=3D"https://pypi.org/project/construct/" rel=3D"noreferrer=
 noreferrer" target=3D"_blank">https://pypi.org/project/construct/</a>), th=
ose 5 layers kind of prove<br>
&gt;&gt; it&#39;s a useful thing to have.<br>
&gt;&gt;<br>
&gt;&gt; So, when and how to promote this to meta-python?<br>
&gt;&gt;<br>
&gt;&gt; On Sun, Aug 30, 2026 at 8:19=E2=80=AFPM jan vermaete &lt;<a href=
=3D"mailto:jan.vermaete@gmail.com" target=3D"_blank" rel=3D"noreferrer">jan=
.vermaete@gmail.com</a>&gt; wrote:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; For example the recipe python3-construct<br>
&gt;&gt; &gt; (<a href=3D"https://layers.openembedded.org/layerindex/branch=
/master/recipes/?q=3Dpython3-construct" rel=3D"noreferrer noreferrer" targe=
t=3D"_blank">https://layers.openembedded.org/layerindex/branch/master/recip=
es/?q=3Dpython3-construct</a>)<br>
&gt;&gt; &gt; exist in 5 different layers<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; <a href=3D"mailto:openembedded-devel@lists.openembedded.org" =
target=3D"_blank" rel=3D"noreferrer">openembedded-devel@lists.openembedded.=
org</a><br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; --<br>
&gt;&gt; &gt; Jan Vermaete<br>
&gt;&gt; &gt; =E2=80=9CSuccess is a self-correcting phenomenom.=E2=80=9D --=
 Gary Hamel<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; --<br>
&gt;&gt; Jan Vermaete<br>
&gt;&gt; =E2=80=9CSuccess is a self-correcting phenomenom.=E2=80=9D -- Gary=
 Hamel<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#129599): <a href=3D"https://lists.openembedded.org=
/g/openembedded-devel/message/129599" rel=3D"noreferrer noreferrer" target=
=3D"_blank">https://lists.openembedded.org/g/openembedded-devel/message/129=
599</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/12100249=
6/2167232" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.op=
enembedded.org/mt/121002496/2167232</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openem=
bedded.org" target=3D"_blank" rel=3D"noreferrer">openembedded-devel+owner@l=
ists.openembedded.org</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
devel/unsub" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.=
openembedded.org/g/openembedded-devel/unsub</a> [<a href=3D"mailto:jan.verm=
aete@gmail.com" target=3D"_blank" rel=3D"noreferrer">jan.vermaete@gmail.com=
</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
<br>
<br>
-- <br>
Jan Vermaete<br>
=E2=80=9CSuccess is a self-correcting phenomenom.=E2=80=9D -- Gary Hamel<br=
>
</blockquote></div>

--00000000000019524c065a5be3e9--

