Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFEF2C3ABA3
	for <webhook@archiver.kernel.org>; Thu,  1 May 2025 20:55:22 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web11.5070.1746132913135814736
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 01 May 2025 13:55:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=q0qhTvBv;
 spf=pass (domain: smile.fr, ip: 209.85.128.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43cf628cb14so17239175e9.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 01 May 2025 13:55:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1746132911; x=1746737711; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nb5aKhE5ExTR0Ixl/cmXFc8mT8JuEhPTAO7pz0XHsBE=;
        b=q0qhTvBvuY4Qsv5jntsmjZ/dDkbZS1QYSXlXPx+BcDG9H6aB0NibQkJtWPgBa6FpDY
         tb5XQd8r7zMp7OzO01QTUTSsIGiVUsCtO9d77yitQqzoXSSyMKNG8JGD33kmSRVfocej
         bPCtvFa2riFZOQzICOcS073xf33od/4pruN7c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746132911; x=1746737711;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nb5aKhE5ExTR0Ixl/cmXFc8mT8JuEhPTAO7pz0XHsBE=;
        b=CrEYrhRBGPGa4OgEVFrm8FpLpGnSy9kocAwEZ5WoidjfnMfzkJyGia9MVXlf2ebb/q
         ljliwfyGqMpFPCQNvaXj3bA1dj+ICvY4obmr378YXJcawCwq44iiTqz8N4pk+ImF3SmA
         8dxfxfuikL4GD4zxsqaJYVdclSKveIwQptL6X3YtMug5BC+Z1T/YByrnZwHi5LXzEe8s
         WsELKpbgZkmPyxz9x2K5c7hGZ5U2FVeLF1UjypM8bKjZhY/ap57dlczBbCYzzQqjmt5y
         Y1n7kXxlfPoPLn1SPkLP8SI8CKgdaijUuWp19vb9PERnboKiyGqgdZv5OPw4v6zMx8ov
         ZcEA==
X-Gm-Message-State: AOJu0Yz7K8iS5ZKRhNs5EJtXy/V0ECKi4buKfIMGGOBkkkgfh0VkKqVS
	A45Bj/ltL9D5EynJK898PHRCu2DsHeDT9pmSi4BLw1m5G8eyPG2M0yenXS3nvECpjbKbtqlbH5B
	qZwRIpHzqjJ1VZZVhxt/uHVsIk8nc2RyxHJf2/g==
X-Gm-Gg: ASbGncvkXRKrg2EMU9g9cXE4S07EiNB5/g7lG88Dd1Xal5CiX1hUysjmmaqbmb/1X1N
	be5JT88sMWEjimUS92i01aAEWOW6qX87JikgEGO23FaJFyHVrlD8QI7vMpBQfQzKojyS35lpXRL
	TI/NLu1h91TZMqX2val6Swy9ZufTklyRcoJY7LjLtPVVldMwuBruYRwJSi
X-Google-Smtp-Source: AGHT+IHy6vbMX+vqgk4fDjUDf7ypwFJdybDaOEYMhSf82i7QFGJ+Nr+EZVmmXXWESCU1gUwY9ESBFMTk7UCVD98UwH4=
X-Received: by 2002:a05:600c:1986:b0:43b:4829:8067 with SMTP id
 5b1f17b1804b1-441b72b9595mr28346595e9.6.1746132911403; Thu, 01 May 2025
 13:55:11 -0700 (PDT)
MIME-Version: 1.0
References: <20250430220401.4149372-1-yoann.congal@smile.fr> <CAMKF1sp1ExCvH_vOMkSNKwFa-gVCk4WqWUXDkDFqOyV19NU_qw@mail.gmail.com>
In-Reply-To: <CAMKF1sp1ExCvH_vOMkSNKwFa-gVCk4WqWUXDkDFqOyV19NU_qw@mail.gmail.com>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Thu, 1 May 2025 22:54:44 +0200
X-Gm-Features: ATxdqUE7IpFHvouW-eOt8k-Pdw34u8zZPRpKgg0JJ55gr2k34Cvv3HZmwFEO0zg
Message-ID: <CAMSfU+5oN3WdHvVt25tThtzbgjU1faPJ0_T3hZ0dVvnvgQRNDA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 1/4] reproducibility: mark ipmiutil as known non-reproducible
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000ea47310634193f3a"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 01 May 2025 20:55:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117274

--000000000000ea47310634193f3a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeu. 1 mai 2025 =C3=A0 02:46, Khem Raj <raj.khem@gmail.com> a =C3=A9crit=
 :

> On Wed, Apr 30, 2025 at 3:04=E2=80=AFPM Yoann Congal via
> lists.openembedded.org <yoann.congal=3Dsmile.fr@lists.openembedded.org>
> wrote:
> >
> > From: Yoann Congal <yoann.congal@smile.fr>
> >
> > ipmiutil packages are not reproducilble.
> >
> > Relevant logs:
> > -
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/87/builds/42/ste=
ps/32/logs/stdio
> > -
> https://valkyrie.yocto.io/pub/repro-fail-openembedded/meta-oe/oe-reproduc=
ible-20250426-pazz3nt5/packages/diff-html/#reproducibleA-tmp---reproducible=
A-tmp-deploy---reproducibleA-tmp-deploy-deb---reproducibleA-tmp-deploy-deb-=
core-------reproducibleA-tmp-deploy-deb-core-----ipmiutil-dbg_-.-.--r-_amd-=
-.deb
> >
>
> these links are temporary and they might disappear in some time. I am
> not sure about the Yocto AB build retention policy. It will be good to
> add relevant info in the commit itself along with links.
>

I sent a v2 with a quick analysis section with relevant diffs.

As for the retention policy: As far as I know there is none.
But, also, no log/diffoscope has been removed since I started doing this
(1.5y). So, I've decided the links were "safe enough" to put here.


> > Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
> > ---
> >  meta-oe/conf/include/non-repro-meta-oe.inc | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/meta-oe/conf/include/non-repro-meta-oe.inc
> b/meta-oe/conf/include/non-repro-meta-oe.inc
> > index ba08749412..b926b45b0a 100755
> > --- a/meta-oe/conf/include/non-repro-meta-oe.inc
> > +++ b/meta-oe/conf/include/non-repro-meta-oe.inc
> > @@ -46,6 +46,9 @@ KNOWN_NON_REPRO_META_OE =3D " \
> >      hplip-src \
> >      iotop \
> >      iotop-dbg \
> > +    ipmiutil \
> > +    ipmiutil-dbg \
> > +    ipmiutil-dev \
> >      jpnevulator-doc \
> >      jsonrpc-dev \
> >      kpatch-build \
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#117262):
> https://lists.openembedded.org/g/openembedded-devel/message/117262
> > Mute This Topic: https://lists.openembedded.org/mt/112550095/1997914
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[
> raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>


--=20
Yoann Congal
Smile ECS

--000000000000ea47310634193f3a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0jeu. 1 =
mai 2025 =C3=A0=C2=A002:46, Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.c=
om">raj.khem@gmail.com</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">On Wed, Apr 30, 2025 at 3:04=E2=80=AFPM =
Yoann Congal via<br>
<a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_bla=
nk">lists.openembedded.org</a> &lt;yoann.congal=3D<a href=3D"mailto:smile.f=
r@lists.openembedded.org" target=3D"_blank">smile.fr@lists.openembedded.org=
</a>&gt;<br>
wrote:<br>
&gt;<br>
&gt; From: Yoann Congal &lt;<a href=3D"mailto:yoann.congal@smile.fr" target=
=3D"_blank">yoann.congal@smile.fr</a>&gt;<br>
&gt;<br>
&gt; ipmiutil packages are not reproducilble.<br>
&gt;<br>
&gt; Relevant logs:<br>
&gt; - <a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/=
87/builds/42/steps/32/logs/stdio" rel=3D"noreferrer" target=3D"_blank">http=
s://autobuilder.yoctoproject.org/valkyrie/#/builders/87/builds/42/steps/32/=
logs/stdio</a><br>
&gt; - <a href=3D"https://valkyrie.yocto.io/pub/repro-fail-openembedded/met=
a-oe/oe-reproducible-20250426-pazz3nt5/packages/diff-html/#reproducibleA-tm=
p---reproducibleA-tmp-deploy---reproducibleA-tmp-deploy-deb---reproducibleA=
-tmp-deploy-deb-core-------reproducibleA-tmp-deploy-deb-core-----ipmiutil-d=
bg_-.-.--r-_amd--.deb" rel=3D"noreferrer" target=3D"_blank">https://valkyri=
e.yocto.io/pub/repro-fail-openembedded/meta-oe/oe-reproducible-20250426-paz=
z3nt5/packages/diff-html/#reproducibleA-tmp---reproducibleA-tmp-deploy---re=
producibleA-tmp-deploy-deb---reproducibleA-tmp-deploy-deb-core-------reprod=
ucibleA-tmp-deploy-deb-core-----ipmiutil-dbg_-.-.--r-_amd--.deb</a><br>
&gt;<br>
<br>
these links are temporary and they might disappear in some time. I am<br>
not sure about the Yocto AB build retention policy. It will be good to<br>
add relevant info in the commit itself along with links.<br></blockquote><d=
iv><br></div><div>I sent a v2 with a quick analysis section with relevant d=
iffs.</div><div><br></div><div>As for the retention policy: As far as I kno=
w there is none.</div><div>But, also, no log/diffoscope has been removed si=
nce I started doing this (1.5y). So, I&#39;ve decided the links were &quot;=
safe enough&quot; to put here.</div><div>=C2=A0</div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">
&gt; Signed-off-by: Yoann Congal &lt;<a href=3D"mailto:yoann.congal@smile.f=
r" target=3D"_blank">yoann.congal@smile.fr</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta-oe/conf/include/non-repro-meta-oe.inc | 3 +++<br>
&gt;=C2=A0 1 file changed, 3 insertions(+)<br>
&gt;<br>
&gt; diff --git a/meta-oe/conf/include/non-repro-meta-oe.inc b/meta-oe/conf=
/include/non-repro-meta-oe.inc<br>
&gt; index ba08749412..b926b45b0a 100755<br>
&gt; --- a/meta-oe/conf/include/non-repro-meta-oe.inc<br>
&gt; +++ b/meta-oe/conf/include/non-repro-meta-oe.inc<br>
&gt; @@ -46,6 +46,9 @@ KNOWN_NON_REPRO_META_OE =3D &quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 hplip-src \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 iotop \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 iotop-dbg \<br>
&gt; +=C2=A0 =C2=A0 ipmiutil \<br>
&gt; +=C2=A0 =C2=A0 ipmiutil-dbg \<br>
&gt; +=C2=A0 =C2=A0 ipmiutil-dev \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 jpnevulator-doc \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 jsonrpc-dev \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 kpatch-build \<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#117262): <a href=3D"https://lists.openembedded.org=
/g/openembedded-devel/message/117262" rel=3D"noreferrer" target=3D"_blank">=
https://lists.openembedded.org/g/openembedded-devel/message/117262</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/11255009=
5/1997914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.=
org/mt/112550095/1997914</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openem=
bedded.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.o=
rg</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
devel/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedde=
d.org/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com"=
 target=3D"_blank">raj.khem@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</blockquote></div><div><br clear=3D"all"></div><br><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr"><font face=3D"Raleway, regular">Yoann Congal</font><div><fon=
t face=3D"Raleway, regular">Smile ECS</font></div></div></div></div>

--000000000000ea47310634193f3a--

