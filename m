Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 155C5F33A90
	for <webhook@archiver.kernel.org>; Thu,  5 Mar 2026 15:25:45 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.46820.1772724339215225581
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Mar 2026 07:25:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=n5SlGlg+;
 spf=pass (domain: konsulko.com, ip: 209.85.218.44, mailfrom: tim.orling@konsulko.com)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b934f8ec6acso964202766b.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 05 Mar 2026 07:25:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772724337; cv=none;
        d=google.com; s=arc-20240605;
        b=P9Q04tF/Mv/dLTfNIjJsXP0hEJRxCrWkHUq+QEpry96ev9y25ZLgPLLBm9wm5kATQX
         he4s2kjDRbbyx7m6i9tO4kgA5RQicZKZekmsNnQwq8+fepcoIrxOY4jI+a0+Oa+rHqLe
         EaC6E3vQvwSYChVMW5yE5gUuaD1XVXpVgtSTbkQ5fmlGbu81fL3w2RMbQmcgfAmzl7Lj
         t2RQhpByBctDM9qs47vu1N5AYSEVvuwgA0nsWixNxdn3xvtaJ/JrncPRbAgX/GAvVrbR
         WT5ORV6axTxNwFYMpguFnHLwGBVCzE5a2+NHh/6v1tyDHpB6mZQrbLjDYQrCMp6mDl3K
         QTpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=YYn3ePQyh5JpTYWYFbm+B3tBa5lNZeOrTs8DbEeES8w=;
        fh=3zQyEOHLwbK+Nli0MPPeu/fUDoaWDZsDusV17bzitvM=;
        b=bmVFQ3h/2E6bBU5gSE+f14A0MLDZQFzwranbbk5z0Qgh3fS1wxc9JmEDAZAS/zJXAI
         L0uolVMM4RvWXpNkGATGjUsnSnwfYA8AjBVKRiaIyua3V6T+fJf2l8L9VkzC2QcW+Q62
         e58mk9L+tsCQs58hlAWyk+fLu1MvlOAx1Wgb+ld5lg47ntRorQ1J9fU3qk4w8dOZMaPu
         mPtjW4OvRkXKb+uQwoqyvxxiErf5M3gychnu7BVkf1kE9L0szHro1rVTD3e5i/VZdg+M
         xNHABNKZDalcSJpeAX1OJMLf/7P++k72DUiMi4i9PKdMPoMgHUHiow2sBLVAQ9qar2Sw
         blsQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1772724337; x=1773329137; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YYn3ePQyh5JpTYWYFbm+B3tBa5lNZeOrTs8DbEeES8w=;
        b=n5SlGlg+a07xYCDkugRf+E8/4xifeYuTTSI1MW81eBaYLd3Xh25TwNZMwO1RWuuYBm
         tll3OCDwF4panRMWIyfrF9jnDM7pzc0GCTnROrjwgl17BxAoxBWZIazp/ObnAQXYL5T0
         1PodeYIcxtGWoWwQGWX7ZoUEHiOn95Uq6IBpI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772724337; x=1773329137;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YYn3ePQyh5JpTYWYFbm+B3tBa5lNZeOrTs8DbEeES8w=;
        b=g+LTqcsDjb61jfVCnG43DKp6tP1Dv5BqB7mLAJR+J09Sdu3Wk5/67dYBAniYW+CpHb
         xW6ShHH2pgfQdS5/6DEXP5mEmO2wRJ+uZiqqdD5wXQGq0ttb9u0aqD8KDJLITc1/4azJ
         meDSeLqe3sbWfeeql6mA6apZ8vjKmvx/ulW0nZFzV7aejK+KhCXkXdE40qh2UQIuWKlq
         9woG1nmOgwJvzQeZU8D4JR5WsPX1Ua7QXIHAr6AvyxKzv1zKvWakiNwuZPMg8JQRE5UQ
         92XBhQgKXRrnR47c1eRRAdeT3zF/nG+77bpNv2PGJSEOo0JuIzb486vK2lh20gQeUHRj
         PDGA==
X-Forwarded-Encrypted: i=1; AJvYcCVqf19ylgnI3WQ6+k2ei9gehQ2QXDm5o1uKZtG7+RJyPKEI9oBuSjWuzhMcznN8bFnVlRFOxF6iK9AmELrUkIZsfqU=@lists.openembedded.org
X-Gm-Message-State: AOJu0YyNnJZDauVQyezHPxW4Jcm45xPyGdWH3d5UhJaopxYAoJqqT9gE
	O/+N/NvJXb3dhk4HqbDl4nnSNORoynA47ZtPNT7gVIjuJq9Yd9wkc63gS8cx7QOTo2raX3I6dDJ
	DEkvHfITqEgCHdq8WsEIBipW9o7HDmKe/AASht2LPKQ==
X-Gm-Gg: ATEYQzwchzbMwLf4e59fjAJX0euzpRBIpnAM38AkwO6Djz45reK5WLLJbfvtJzmJjmk
	2esACptpP16+VwU0oMkepxSaFicolkOGGppZwPbp7TQ+f5ERGZIIzsn9wZmXhlbYogwOnbY22SZ
	0Rz1rDKGF3MbWOmCCce5HnF3rJ1OilpT9hr2QU250ptYsvGLNJaiJdtrNOECTa4X8X3fjsYAznD
	BX0JdogqBtHm8edHvpfPjLczn79mm++WnXAcGrFbbKJNKFuHD4DPByuf5pmYY07XQMAVm4rVA1n
	KiyadJqOTue3dH2KNg==
X-Received: by 2002:a17:907:25c9:b0:b8e:d04e:e506 with SMTP id
 a640c23a62f3a-b93f15afc56mr379758866b.57.1772724337262; Thu, 05 Mar 2026
 07:25:37 -0800 (PST)
MIME-Version: 1.0
References: <20260305035459.3561243-1-douglas.royds@taitcommunications.com> <d7ee961b-61c5-49a7-b474-bfa79e482c1a@gmail.com>
In-Reply-To: <d7ee961b-61c5-49a7-b474-bfa79e482c1a@gmail.com>
From: Tim Orling <tim.orling@konsulko.com>
Date: Thu, 5 Mar 2026 07:25:25 -0800
X-Gm-Features: AaiRm50U2gpUdueX5LpsdkSLiJsLjDDxRQTM9e8juWxURKpDjcgcVarUCfrQ8Zc
Message-ID: <CAOyo-85eZuSc+pgiJ1kOjazTZ-bNR3dUZub4sueie2f+hftRnA@mail.gmail.com>
Subject: Re: [oe] [meta-java][PATCH] java-library.bbclass: resolve
 do_deletebinaries race condition
To: Gyorgy Sarvari <skandigraun@gmail.com>
Cc: douglas.royds@taitcommunications.com, 
	openembedded-devel@lists.openembedded.org, 
	Stanley Stanton <stanley.stanton@taitcommunications.com>
Content-Type: multipart/alternative; boundary="00000000000068530d064c488c30"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 05 Mar 2026 15:25:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124884

--00000000000068530d064c488c30
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 5, 2026 at 3:15=E2=80=AFAM Gyorgy Sarvari <skandigraun@gmail.co=
m> wrote:

> - patches for meta-java should go to yocto-patches ML
> (yocto-patches@lists.yoctoproject.org), though now I see that this info
> isn't updated in all places
> - AFAIK meta-java is still in deep sleep due to bitrot, and accepts no
> patches due to this, until someone makes the layer build at least
>
> The state of things has not changed:
https://www.linkedin.com/pulse/state-meta-java-tim-orling-tcrqc/
https://lists.yoctoproject.org/g/yocto-patches/message/986

My guess is anybody actually using the layer is on the 'kirkstone' release,
as meta-java has been increasingly more and more broken since then.

in any case, cc'd Tim, the last maintainer that I know of.
>
> On 3/5/26 04:54, Douglas Royds via lists.openembedded.org wrote:
> > From: Stanley Stanton <stanley.stanton@taitcommunications.com>
> >
> > The do_deletebinaries task is attempting to delete directories created
> > and destroyed by other bitbake classes such as sstate.bbclass and
> > create-spdx-2.2.bbclass. If these classes remove their directories
> > before do_deletebinaries has a chance to delete them, but after they ar=
e
> > found, the following types of errors occur:
> >
> > Log data follows:
> > | DEBUG: Executing shell function do_deletebinaries
> > | find:
> =E2=80=98/build/tmp/work/x86_64-linux/junit-native/3.8.2/sstate-build-cre=
ate_spdx=E2=80=99:
> No such file or directory
> > | WARNING: exit code 1 from a shell command.
> >
> > Rewrite do_deletebinaries such that it is explicitly not looking throug=
h
> > directories that are managed by other bitbake classes, to avoid this
> > race condition.
> >
> > Suggested-by:  Douglas Royds <douglas.royds@taitcommunications.com>
> > Signed-off-by: Stanley Stanton <stanley.stanton@taitcommunications.com>
> > ---
> >  classes/java-library.bbclass | 7 +++----
> >  1 file changed, 3 insertions(+), 4 deletions(-)
> >
> > diff --git a/classes/java-library.bbclass b/classes/java-library.bbclas=
s
> > index 67541d2..033d6d4 100644
> > --- a/classes/java-library.bbclass
> > +++ b/classes/java-library.bbclass
> > @@ -55,10 +55,9 @@ ALTJARFILENAMES =3D "${BPN}.jar"
> >  # Java "source" distributions often contain precompiled things
> >  # we want to delete first.
> >  do_deletebinaries() {
> > -  find ${WORKDIR} ! -path "${RECIPE_SYSROOT}/*" ! -path
> "${RECIPE_SYSROOT_NATIVE}/*" \
> > -                  -name "*.jar" -exec rm {} \;
> > -  find ${WORKDIR} ! -path "${RECIPE_SYSROOT}/*" ! -path
> "${RECIPE_SYSROOT_NATIVE}/*" \
> > -                  -name "*.class" -exec rm {} \;
> > +  dirs_to_search=3D"$(find ${WORKDIR}/* -maxdepth 0 -type d | grep -Ev
> "recipe-sysroot|sstate|spdx")"
> > +  find $dirs_to_search -name "*.jar" -exec rm {} \;
> > +  find $dirs_to_search -name "*.class" -exec rm {} \;
> >  }
> >
> >  addtask deletebinaries after do_unpack before do_patch
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#124864):
> https://lists.openembedded.org/g/openembedded-devel/message/124864
> > Mute This Topic: https://lists.openembedded.org/mt/118149274/6084445
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[
> skandigraun@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>
>

--00000000000068530d064c488c30
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Mar 5, =
2026 at 3:15=E2=80=AFAM Gyorgy Sarvari &lt;<a href=3D"mailto:skandigraun@gm=
ail.com">skandigraun@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">- patches for meta-java should go to yocto-pa=
tches ML<br>
(<a href=3D"mailto:yocto-patches@lists.yoctoproject.org" target=3D"_blank">=
yocto-patches@lists.yoctoproject.org</a>), though now I see that this info<=
br>
isn&#39;t updated in all places<br>
- AFAIK meta-java is still in deep sleep due to bitrot, and accepts no<br>
patches due to this, until someone makes the layer build at least<br>
<br></blockquote><div>The state of things has not changed:<br><a href=3D"ht=
tps://www.linkedin.com/pulse/state-meta-java-tim-orling-tcrqc/">https://www=
.linkedin.com/pulse/state-meta-java-tim-orling-tcrqc/</a></div><div><a href=
=3D"https://lists.yoctoproject.org/g/yocto-patches/message/986">https://lis=
ts.yoctoproject.org/g/yocto-patches/message/986</a></div><div>=C2=A0</div><=
div>My guess is anybody actually using the layer is on the &#39;kirkstone&#=
39; release,</div><div>as meta-java has been increasingly more and more bro=
ken since then.</div><div><br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
in any case, cc&#39;d Tim, the last maintainer that I know of.<br>
<br>
On 3/5/26 04:54, Douglas Royds via <a href=3D"http://lists.openembedded.org=
" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org</a> wrote:<br=
>
&gt; From: Stanley Stanton &lt;<a href=3D"mailto:stanley.stanton@taitcommun=
ications.com" target=3D"_blank">stanley.stanton@taitcommunications.com</a>&=
gt;<br>
&gt;<br>
&gt; The do_deletebinaries task is attempting to delete directories created=
<br>
&gt; and destroyed by other bitbake classes such as sstate.bbclass and<br>
&gt; create-spdx-2.2.bbclass. If these classes remove their directories<br>
&gt; before do_deletebinaries has a chance to delete them, but after they a=
re<br>
&gt; found, the following types of errors occur:<br>
&gt;<br>
&gt; Log data follows:<br>
&gt; | DEBUG: Executing shell function do_deletebinaries<br>
&gt; | find: =E2=80=98/build/tmp/work/x86_64-linux/junit-native/3.8.2/sstat=
e-build-create_spdx=E2=80=99: No such file or directory<br>
&gt; | WARNING: exit code 1 from a shell command.<br>
&gt;<br>
&gt; Rewrite do_deletebinaries such that it is explicitly not looking throu=
gh<br>
&gt; directories that are managed by other bitbake classes, to avoid this<b=
r>
&gt; race condition.<br>
&gt;<br>
&gt; Suggested-by:=C2=A0 Douglas Royds &lt;<a href=3D"mailto:douglas.royds@=
taitcommunications.com" target=3D"_blank">douglas.royds@taitcommunications.=
com</a>&gt;<br>
&gt; Signed-off-by: Stanley Stanton &lt;<a href=3D"mailto:stanley.stanton@t=
aitcommunications.com" target=3D"_blank">stanley.stanton@taitcommunications=
.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 classes/java-library.bbclass | 7 +++----<br>
&gt;=C2=A0 1 file changed, 3 insertions(+), 4 deletions(-)<br>
&gt;<br>
&gt; diff --git a/classes/java-library.bbclass b/classes/java-library.bbcla=
ss<br>
&gt; index 67541d2..033d6d4 100644<br>
&gt; --- a/classes/java-library.bbclass<br>
&gt; +++ b/classes/java-library.bbclass<br>
&gt; @@ -55,10 +55,9 @@ ALTJARFILENAMES =3D &quot;${BPN}.jar&quot;<br>
&gt;=C2=A0 # Java &quot;source&quot; distributions often contain precompile=
d things<br>
&gt;=C2=A0 # we want to delete first.<br>
&gt;=C2=A0 do_deletebinaries() {<br>
&gt; -=C2=A0 find ${WORKDIR} ! -path &quot;${RECIPE_SYSROOT}/*&quot; ! -pat=
h &quot;${RECIPE_SYSROOT_NATIVE}/*&quot; \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -name =
&quot;*.jar&quot; -exec rm {} \;<br>
&gt; -=C2=A0 find ${WORKDIR} ! -path &quot;${RECIPE_SYSROOT}/*&quot; ! -pat=
h &quot;${RECIPE_SYSROOT_NATIVE}/*&quot; \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -name =
&quot;*.class&quot; -exec rm {} \;<br>
&gt; +=C2=A0 dirs_to_search=3D&quot;$(find ${WORKDIR}/* -maxdepth 0 -type d=
 | grep -Ev &quot;recipe-sysroot|sstate|spdx&quot;)&quot;<br>
&gt; +=C2=A0 find $dirs_to_search -name &quot;*.jar&quot; -exec rm {} \;<br=
>
&gt; +=C2=A0 find $dirs_to_search -name &quot;*.class&quot; -exec rm {} \;<=
br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 addtask deletebinaries after do_unpack before do_patch<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#124864): <a href=3D"https://lists.openembedded.org=
/g/openembedded-devel/message/124864" rel=3D"noreferrer" target=3D"_blank">=
https://lists.openembedded.org/g/openembedded-devel/message/124864</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/11814927=
4/6084445" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.=
org/mt/118149274/6084445</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openem=
bedded.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.o=
rg</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
devel/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedde=
d.org/g/openembedded-devel/unsub</a> [<a href=3D"mailto:skandigraun@gmail.c=
om" target=3D"_blank">skandigraun@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
<br>
</blockquote></div></div>

--00000000000068530d064c488c30--

