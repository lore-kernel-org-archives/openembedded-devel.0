Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CB8D10F3DFE
	for <webhook@archiver.kernel.org>; Mon, 30 Mar 2026 14:27:21 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.52818.1774880739383227770
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 Mar 2026 07:25:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qbee.io header.s=google header.b=GmV2ElHb;
 spf=pass (domain: qbee.io, ip: 209.85.218.44, mailfrom: piotr@qbee.io)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b9961e4f71bso688395166b.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 30 Mar 2026 07:25:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774880738; cv=none;
        d=google.com; s=arc-20240605;
        b=OkJSzyTlmAIlyqsUxl8UCFNB1eIFE9i2Q11bwjxyiUjPj2/3zJssJg3jRR2uIgcJcE
         7Us9csVLOU/d1m2nWUM7lvm0+YJ47bTjPsgqxViFsjrvxQhWq+haek1bzqRcb2A/D0Nk
         KOOUhHSIPbWQF4aqSgWwwiiJKwnzIWQk3ubB2ivRYuKBkltQ/IZEMldW7/u6oveXHpCh
         zO1uxiNgdptWF9dB+0Z99qiKx+d5Tkk9Ejpxp3lg8IEL///GUheer1wWkur4udgDTZe/
         Bw6rqeDiZqbYRswGgxOigKQBmgJkogywx1EO8rbiclJ8NaUBuFgrKBJblHE/rpudZ1NY
         Wjew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=OG5HHCudd4dGxJroj9RmEn511XR9fS86usCysTaX5NQ=;
        fh=/Zfoi4o9G9NEfOtGJ0LSUrfiVhZcuLLzOVZQmzCL8qM=;
        b=jKWzIyIveZbjAejMRJD20K9Eq7QiP5cXeGOMpPCaA9Up9u3vlY964at1Qf5aZcSGNG
         q01ZEQ+IbkBp0q+L0MNGkLaa5HqHyD9ZHGZ4djrgQsFDOw/GIlG+xNKF6o4ZFdjjWZan
         ZFMqgRSrHbxUbWCzOU4k7bXlBiDb3vKayQcDWS4VXg6TtZqhxR3SL/Hf2iK39VDnA14S
         B8aTnEMKdb7BJ+yd4M288ZaTItoGwrAdu+SU970iDSbfRdaYkfpAqes207gWQ+ycepXc
         IjoU2Ark/M/WRy9faYmGbT0LjYwu2Ha0QwivT009qywpOmWcsW2+TqAJLIQTWxtWCpPB
         bgVA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=qbee.io; s=google; t=1774880738; x=1775485538; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OG5HHCudd4dGxJroj9RmEn511XR9fS86usCysTaX5NQ=;
        b=GmV2ElHbOIUBWmuUcZtPj7Rt+5+vpjbjXmrTmBwivgDYTwkPxAqK+JA04xRpNdjqjt
         3rL7UFuBLGPzniwB4QFkjesNCQjcjSCKNIDJuonhP949vRlU+gKTP8tF3S2AsLIw5gD3
         /aOkWWpIF9+CiCVHQ7mM587eIBN+kbVw4m6ro=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774880738; x=1775485538;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OG5HHCudd4dGxJroj9RmEn511XR9fS86usCysTaX5NQ=;
        b=lrxvgGyFsIsQuoX/vZySqyoUv7p6nriLBACwtnksq+cBaessNhFS98r6M4c2Wv+Y+7
         HmZLyDc80dl3Kfm60/Y6t+uUKNd656eINbbkSZX12059Dp1SsFQLsJyxcUZKSJCi6GnP
         SDtizVzemN0/n2mTaxA+if510TrmICiF+Id8JhpOTW1c/W1x/MntPOUWPzX8ZrnxCMDE
         jvhq675j3z8L+dDarEzCHAeS2x356t+8cJRsh0+pBtYl6LftueT9BIf1A7gGjkOmORav
         wQT5dwQHSNMRZm795+08th6KGSYPpQs2Bz2aFQ9XmI1YYyzPuxUw1t8ciEEmA13Zyfov
         V28g==
X-Gm-Message-State: AOJu0Yyy56mCtFj/UgSefonRBfjWomxPBOWlgwNzLe1mxJp8UH7HmTvP
	V18lkxgsKe2oyQ6x0ARi7yyL8iL7VMXnyaOpJeVDblncB7TjT4b1kP/Qi3Z5zsWKR3QG/isqw9k
	CgIasYh1H3N5nA4rcL/MlacbYGqNpdB36DavrXiPmwA==
X-Gm-Gg: ATEYQzwTzj/FWxoXt1awrOhDCVqa6WIz5+9nC0RzLVshlNIyYWbiE3aM91vDaiHG0fp
	hi93StkLAz8Z6rsIZxpkcMq/6MwkQ5b8a4iaA8sVPRtNHjnKMdprL31XNEeGRbhCahvShEeoYda
	U9el/Xn4o2qw3Frsrock+SaKlpPaFPqCruCJbfC5HDxELnz5xaZJJ13bNH1EnMQAo+1Wi7Ja1bK
	4oc2VjOBZ5o01pBV7kQAO/3H54rYDqDlBCBukGs1+ap4TzlE0FpMDetTJrVgpHbUkXdhGxDEfXS
	9CBUEw==
X-Received: by 2002:a17:907:c0e:b0:b9b:5164:9057 with SMTP id
 a640c23a62f3a-b9b51649318mr701195566b.3.1774880737410; Mon, 30 Mar 2026
 07:25:37 -0700 (PDT)
MIME-Version: 1.0
References: <20260330135112.27161-1-piotr@qbee.io> <c996e121-f1c2-4b6e-b739-1c6a708d839a@gmail.com>
In-Reply-To: <c996e121-f1c2-4b6e-b739-1c6a708d839a@gmail.com>
From: =?UTF-8?B?UGlvdHIgQnVsacWEc2tp?= <piotr@qbee.io>
Date: Mon, 30 Mar 2026 16:25:26 +0200
X-Gm-Features: AQROBzA6oyvgaHwHuqXHoppsRgLZNbVEzqPE1jl3AevD83TXpWJt7nB8YYKdQsA
Message-ID: <CAGjhzsKayhZLhnHgPbTRdT35KtYseUTE+iR=Zcm_aEvJeSmmoA@mail.gmail.com>
Subject: Re: [oe] [layerindexlib] Prevent loading unnecessary resources from layerindex-web
To: Gyorgy Sarvari <skandigraun@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000df5159064e3e9f99"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 30 Mar 2026 14:27:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125868

--000000000000df5159064e3e9f99
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sorry, that was supposed to go to bitbake-devel@lists.openembedded.org


On Mon, Mar 30, 2026 at 4:24=E2=80=AFPM Gyorgy Sarvari <skandigraun@gmail.c=
om>
wrote:

> I think probably you meant to send this to yocto-patches@ ML?
>
>
> On 3/30/26 15:51, Piotr Buli=C5=84ski via lists.openembedded.org wrote:
> > When I was using `bitbake-layers layerindex-fetch ...` I noticed it
> being quite
> > slow. Upon further investigation, I found that the call to
> `load_layerindex()`
> > inside layerindexlib was called with the deafult `load` argument.
> >
> > The deafault was set to ['layerDependencies', 'recipes', 'machines',
> 'distros']
> > where the `layerindex-fetch` effectively requires only
> ['layerDependencies'].
> >
> > So whenever a `layerindex-fetch` is used, we pull for example 'recipes'=
,
> which
> > is about 18-20MB in size - it takes time to produce that response by th=
e
> > layerindex-web and ship over the internet, just to be discarded.
> >
> > This change addresses the issue by setting a "sane" default (empty
> `load` list)
> > and sets a correct, explicit `load` list whenever it's needed (e.g.
> toaster)
> > by the caller.
> >
> > Lastly, there seems to be an error when the cooker index is loaded in t=
he
> > process with the `load=3D'layerDependencies'`, that's incorrect, as the
> > implementation expects also a list, so that's corrected as well.
> >
> > Signed-off-by: Piotr Buli=C5=84ski <piotr@qbee.io>
> > ---
> >  lib/bblayers/layerindex.py                       | 4 ++--
> >  lib/layerindexlib/__init__.py                    | 6 +++---
> >  lib/toaster/orm/management/commands/lsupdates.py | 3 ++-
> >  3 files changed, 7 insertions(+), 6 deletions(-)
> >
> > diff --git a/lib/bblayers/layerindex.py b/lib/bblayers/layerindex.py
> > index 308a5532d..2ba1103a3 100644
> > --- a/lib/bblayers/layerindex.py
> > +++ b/lib/bblayers/layerindex.py
> > @@ -116,7 +116,7 @@ class LayerIndexPlugin(ActionPlugin):
> >
> >          # Load the cooker DB
> >          cookerIndex =3D layerindexlib.LayerIndex(self.tinfoil.config_d=
ata)
> > -        cookerIndex.load_layerindex('cooker://',
> load=3D'layerDependencies')
> > +        cookerIndex.load_layerindex('cooker://',
> load=3D['layerDependencies'])
> >
> >          # Fast path, check if we already have what has been requested!
> >          (dependencies, invalidnames) =3D
> cookerIndex.find_dependencies(names=3Dargs.layername, ignores=3Dignore_la=
yers)
> > @@ -137,7 +137,7 @@ class LayerIndexPlugin(ActionPlugin):
> >
> >              for remoteurl in _construct_url(apiurl, branches):
> >                  logger.plain("Loading %s..." % remoteurl)
> > -                remoteIndex.load_layerindex(remoteurl)
> > +                remoteIndex.load_layerindex(remoteurl,
> load=3D['layerDependencies'])
> >
> >              if remoteIndex.is_empty():
> >                  logger.error("Remote layer index %s is empty for
> branches %s" % (apiurl, branches))
> > diff --git a/lib/layerindexlib/__init__.py
> b/lib/layerindexlib/__init__.py
> > index c3265ddaa..e693e5c11 100644
> > --- a/lib/layerindexlib/__init__.py
> > +++ b/lib/layerindexlib/__init__.py
> > @@ -174,15 +174,15 @@ class LayerIndex():
> >          return res
> >
> >
> > -    def load_layerindex(self, indexURI, load=3D['layerDependencies',
> 'recipes', 'machines', 'distros'], reload=3DFalse):
> > +    def load_layerindex(self, indexURI, load=3D[], reload=3DFalse):
> >          '''Load the layerindex.
> >
> >             indexURI - An index to load.  (Use multiple calls to load
> multiple indexes)
> >
> >             reload - If reload is True, then any previously loaded
> indexes will be forgotten.
> >
> > -           load - List of elements to load.  Default loads all items.
> > -                  Note: plugs may ignore this.
> > +           load - List of elements to load. By default, an empty list
> is used to keep things lean.
> > +                  Callers need to specify a minimal set of elements to
> load, such as ['layerDependencies'] for dependency resolution.
> >
> >  The format of the indexURI:
> >
> > diff --git a/lib/toaster/orm/management/commands/lsupdates.py
> b/lib/toaster/orm/management/commands/lsupdates.py
> > index 0ee00aa15..153b26f60 100644
> > --- a/lib/toaster/orm/management/commands/lsupdates.py
> > +++ b/lib/toaster/orm/management/commands/lsupdates.py
> > @@ -105,7 +105,8 @@ class Command(BaseCommand):
> >              url_branches =3D ";branch=3D%s" % ','.join(allowed_branch_=
names)
> >          else:
> >              url_branches =3D ""
> > -        layerindex.load_layerindex("%s%s" % (self.apiurl, url_branches=
))
> > +        layerindex.load_layerindex("%s%s" % (self.apiurl, url_branches=
),
> > +                                   load=3D['layerDependencies',
> 'recipes', 'machines', 'distros'])
> >
> >          http_progress.stop()
> >
> >
> >
> >
> >=20
> >
>
>

--000000000000df5159064e3e9f99
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Sorry, that was supposed=C2=A0to go to=C2=A0<span style=3D=
"font-family:&quot;Google Sans&quot;,Roboto,RobotoDraft,Helvetica,Arial,san=
s-serif;font-size:14px"><a href=3D"mailto:bitbake-devel@lists.openembedded.=
org">bitbake-devel@lists.openembedded.org</a></span><div><span style=3D"fon=
t-family:&quot;Google Sans&quot;,Roboto,RobotoDraft,Helvetica,Arial,sans-se=
rif;font-size:14px"><br></span></div></div><br><div class=3D"gmail_quote gm=
ail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Mar 30, =
2026 at 4:24=E2=80=AFPM Gyorgy Sarvari &lt;<a href=3D"mailto:skandigraun@gm=
ail.com">skandigraun@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;borde=
r-left-style:solid;border-left-color:rgb(204,204,204);padding-left:1ex">I t=
hink probably you meant to send this to yocto-patches@ ML?<br>
<br>
<br>
On 3/30/26 15:51, Piotr Buli=C5=84ski via <a href=3D"http://lists.openembed=
ded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org</a> wr=
ote:<br>
&gt; When I was using `bitbake-layers layerindex-fetch ...` I noticed it be=
ing quite<br>
&gt; slow. Upon further investigation, I found that the call to `load_layer=
index()`<br>
&gt; inside layerindexlib was called with the deafult `load` argument.<br>
&gt; <br>
&gt; The deafault was set to [&#39;layerDependencies&#39;, &#39;recipes&#39=
;, &#39;machines&#39;, &#39;distros&#39;]<br>
&gt; where the `layerindex-fetch` effectively requires only [&#39;layerDepe=
ndencies&#39;].<br>
&gt; <br>
&gt; So whenever a `layerindex-fetch` is used, we pull for example &#39;rec=
ipes&#39;, which<br>
&gt; is about 18-20MB in size - it takes time to produce that response by t=
he<br>
&gt; layerindex-web and ship over the internet, just to be discarded.<br>
&gt; <br>
&gt; This change addresses the issue by setting a &quot;sane&quot; default =
(empty `load` list)<br>
&gt; and sets a correct, explicit `load` list whenever it&#39;s needed (e.g=
. toaster)<br>
&gt; by the caller.<br>
&gt; <br>
&gt; Lastly, there seems to be an error when the cooker index is loaded in =
the<br>
&gt; process with the `load=3D&#39;layerDependencies&#39;`, that&#39;s inco=
rrect, as the<br>
&gt; implementation expects also a list, so that&#39;s corrected as well.<b=
r>
&gt; <br>
&gt; Signed-off-by: Piotr Buli=C5=84ski &lt;<a href=3D"mailto:piotr@qbee.io=
" target=3D"_blank">piotr@qbee.io</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 lib/bblayers/layerindex.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 4 ++--<br>
&gt;=C2=A0 lib/layerindexlib/__init__.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 6 +++---<br>
&gt;=C2=A0 lib/toaster/orm/management/commands/lsupdates.py | 3 ++-<br>
&gt;=C2=A0 3 files changed, 7 insertions(+), 6 deletions(-)<br>
&gt; <br>
&gt; diff --git a/lib/bblayers/layerindex.py b/lib/bblayers/layerindex.py<b=
r>
&gt; index 308a5532d..2ba1103a3 100644<br>
&gt; --- a/lib/bblayers/layerindex.py<br>
&gt; +++ b/lib/bblayers/layerindex.py<br>
&gt; @@ -116,7 +116,7 @@ class LayerIndexPlugin(ActionPlugin):<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Load the cooker DB<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cookerIndex =3D layerindexlib.LayerI=
ndex(self.tinfoil.config_data)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 cookerIndex.load_layerindex(&#39;cooker:/=
/&#39;, load=3D&#39;layerDependencies&#39;)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 cookerIndex.load_layerindex(&#39;cooker:/=
/&#39;, load=3D[&#39;layerDependencies&#39;])<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Fast path, check if we already hav=
e what has been requested!<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (dependencies, invalidnames) =3D coo=
kerIndex.find_dependencies(names=3Dargs.layername, ignores=3Dignore_layers)=
<br>
&gt; @@ -137,7 +137,7 @@ class LayerIndexPlugin(ActionPlugin):<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for remoteurl in _cons=
truct_url(apiurl, branches):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 logger.p=
lain(&quot;Loading %s...&quot; % remoteurl)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 remoteIndex.l=
oad_layerindex(remoteurl)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 remoteIndex.l=
oad_layerindex(remoteurl, load=3D[&#39;layerDependencies&#39;])<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if remoteIndex.is_empt=
y():<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 logger.e=
rror(&quot;Remote layer index %s is empty for branches %s&quot; % (apiurl, =
branches))<br>
&gt; diff --git a/lib/layerindexlib/__init__.py b/lib/layerindexlib/__init_=
_.py<br>
&gt; index c3265ddaa..e693e5c11 100644<br>
&gt; --- a/lib/layerindexlib/__init__.py<br>
&gt; +++ b/lib/layerindexlib/__init__.py<br>
&gt; @@ -174,15 +174,15 @@ class LayerIndex():<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return res<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 def load_layerindex(self, indexURI, load=3D[&#39;layerD=
ependencies&#39;, &#39;recipes&#39;, &#39;machines&#39;, &#39;distros&#39;]=
, reload=3DFalse):<br>
&gt; +=C2=A0 =C2=A0 def load_layerindex(self, indexURI, load=3D[], reload=
=3DFalse):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;&#39;&#39;Load the layerindex.<=
br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0indexURI - An index to =
load.=C2=A0 (Use multiple calls to load multiple indexes)<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reload - If reload is T=
rue, then any previously loaded indexes will be forgotten.<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0load - List of elements to l=
oad.=C2=A0 Default loads all items.<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Note: =
plugs may ignore this.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0load - List of elements to l=
oad. By default, an empty list is used to keep things lean.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Caller=
s need to specify a minimal set of elements to load, such as [&#39;layerDep=
endencies&#39;] for dependency resolution.<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 The format of the indexURI:<br>
&gt;=C2=A0 <br>
&gt; diff --git a/lib/toaster/orm/management/commands/lsupdates.py b/lib/to=
aster/orm/management/commands/lsupdates.py<br>
&gt; index 0ee00aa15..153b26f60 100644<br>
&gt; --- a/lib/toaster/orm/management/commands/lsupdates.py<br>
&gt; +++ b/lib/toaster/orm/management/commands/lsupdates.py<br>
&gt; @@ -105,7 +105,8 @@ class Command(BaseCommand):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 url_branches =3D &quot=
;;branch=3D%s&quot; % &#39;,&#39;.join(allowed_branch_names)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 url_branches =3D &quot=
;&quot;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 layerindex.load_layerindex(&quot;%s%s&quo=
t; % (self.apiurl, url_branches))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 layerindex.load_layerindex(&quot;%s%s&quo=
t; % (self.apiurl, url_branches),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0load=3D[&#39;layerD=
ependencies&#39;, &#39;recipes&#39;, &#39;machines&#39;, &#39;distros&#39;]=
)<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 http_progress.stop()<br>
&gt;=C2=A0 <br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
<br>
</blockquote></div>

--000000000000df5159064e3e9f99--

