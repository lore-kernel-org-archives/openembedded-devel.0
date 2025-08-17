Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50B4CCA0EDC
	for <webhook@archiver.kernel.org>; Sun, 17 Aug 2025 21:30:53 +0000 (UTC)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
 by mx.groups.io with SMTP id smtpd.web10.61545.1755466243963826630
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 Aug 2025 14:30:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UqBhNKdj;
 spf=pass (domain: gmail.com, ip: 209.85.219.175, mailfrom: raj.khem@gmail.com)
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-e931cad1fd8so3612946276.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 17 Aug 2025 14:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755466243; x=1756071043; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zCiHOMBvjgBaH9/v57VYJNoE9qRBDoKD6frk6aJA/7c=;
        b=UqBhNKdjEqBQ6eOiNCxuHpQO4fekNVDorD+t4y8zlC5esUQo+Vrk9yDm4c/7u4qrJb
         FxmAMPzMFdDtS7VJQ9VMzwLVSxL6CnIF4pJvSXfyTSeDQVz7tKwTAZ7WR8LwHJ7Y5jNY
         3xOPYKH3K8/ac1Qmn47fEtkO+n23Rrwac1s4sQ1IXCRLOKYk3ZVu6C8LBYX3jCMZWHSF
         E8AXrCqRoW97xi2cyNm5FGrFU8eXjtSaWNzYf/nHFA7XTsJ8OtNcWLhy0qT4HmPO15LI
         Ls2xIFU91Ll/6sYtK3n1R78iVrWzkB376Hsqsb1YPWjeC7QVz6RJ0EWnWFdICVSfqvYH
         rjbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755466243; x=1756071043;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zCiHOMBvjgBaH9/v57VYJNoE9qRBDoKD6frk6aJA/7c=;
        b=V3ZMzoC6RBs84HKBZLIBdDigU4NNOoGkuSvkhxGfhyUVo794dsKkd+Cgx7pg8eoxZY
         RdWdg4GY+Uznh0oJ6E5tPETZyLzfEpKjxZqMxTQym0yRX51TZzNWKez4eiFMSSCO8nah
         NL/CAAcAH9eE3YWv/irlyC0upxs/Co9GnmxXr5QklXZULeeZwexlC0OeNC3YPu827D/H
         mT269BQwK7jhzc8nhuHeghxuTylcPmp5kqlgiUbjEqiWiHp+7nwqj0eYcQqWD69PjZ8a
         wzr7lLn+U9754/39/5RH2+KdU/77jEH7v2oFiBFDyzQjTCaNZag/xjVbOKuERmGeElhH
         JgaQ==
X-Gm-Message-State: AOJu0YwQAzdfBM6FZVDY9Q9EKFp89aVGXGgJq/rRRFXac8MfUDdFPz3x
	lmspQg51liV/pP0u4fjLnetPKHJTmd6Ie912R7i+wnFUmHNJPoS3eOMgrYIHijE7hVyaFnAcZi1
	tIJu4RIXqKstrsxmJRQA/5V9WXX9MyRg=
X-Gm-Gg: ASbGncsVEfaX5mGUYrpS7E3z4XjiilW/x3VVBNsWISe0Wzc6MbH1Nxz8NBY0VyoWI1g
	FpzM9XmYQjiUMJCTfS9UESGhu53OGyyTXN18OkG7Jd8/tUZaA1IhrQY99G+7ckSZevsieWhwGIN
	DBFN22fDwdZsf0kraCiSf706IK5bnMauXshTEjAoPHOwhh3oVyhwrYHxStHuYyXr6gU1KR/Qw7t
	7/zOg1jMBpE0+xHbKPggK0tniHCxjRYT1MTFgdY
X-Google-Smtp-Source: AGHT+IF76xkkEgRnGhNlVX/FhEE+QyBffUnTLCLXrJOjCxoV6jCd8KYx2kskHNACKrwkbhnDfRyhNzYuHV+Aakkou4c=
X-Received: by 2002:a05:6902:110c:b0:e93:3acf:2642 with SMTP id
 3f1490d57ef6-e933acf288bmr8793435276.45.1755466242936; Sun, 17 Aug 2025
 14:30:42 -0700 (PDT)
MIME-Version: 1.0
References: <185C8340ADC0E6D9.8958@lists.openembedded.org> <185C83615B3CBF8D.30607@lists.openembedded.org>
 <e7f38aaa-b4bc-4aa9-a5a7-3ea30994bb8a@gmail.com>
In-Reply-To: <e7f38aaa-b4bc-4aa9-a5a7-3ea30994bb8a@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 17 Aug 2025 14:30:31 -0700
X-Gm-Features: Ac12FXyxVUDCQo3D16JBTVPjVXWI9DrHkmqgoO-0ST_Ch8F5fmNHGX7IsLy2ssA
Message-ID: <CAMKF1so=E=_ckSGydVbG_WOh9a=pOdCJLfUMJiFDGR6CPJF7eg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] gitpkgv.bbclass: inspect repository in UNPACKDIR
To: skandigraun@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000d355c6063c9655f2"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 17 Aug 2025 21:30:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118989

--000000000000d355c6063c9655f2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 17, 2025 at 10:35=E2=80=AFAM Gyorgy Sarvari via lists.openembed=
ded.org
<skandigraun=3Dgmail.com@lists.openembedded.org> wrote:

> On 8/17/25 11:20, Gyorgy Sarvari via lists.openembedded.org wrote:
> > In my testing it looks okay, but if someone else could test/review it
> > also to see if it makes sense, it would be useful.
>
> A short off-list exchange with WXbet made me look a bit more, and there
> is a gotcha.
>
> Looking at older releases, BB_GIT_SHALLOW used to have effect on mirror
> tarball fetching and generation only, not on fetching from git.
>
> But now there is actual shallow cloning, which changes the behavior of
> this class beyond the folder issue: it's not possible to determine the
> real number of commits, so the versions generated by this class won't be
> very sortable.
>
> Should there be maybe a bb.warn/fatal error if shallow clone is enabled?
> Or just a comment in the class? Or just drop this change, and keep it as
> it is?
>
> Does anyone have any preference/suggestion?
>

I think we should also look at if this class still is valuable a warning is
perhaps better here

>
> >
> > On 8/17/25 11:17, Gyorgy Sarvari via lists.openembedded.org wrote:
> >> When BB_GIT_SHALLOW =3D "1" is used, the unpacked gir repository doesn=
't
> >> exist in the download folder, and the class isn't able to instect the
> >> details of the repository.
> >>
> >> Instead inspect the repository it the UNPACKDIR.
> >>
> >> Reported-by: WXbet <WXbet@proton.me>
> >> Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> >> ---
> >>  meta-oe/classes/gitpkgv.bbclass | 17 ++++++++++++-----
> >>  1 file changed, 12 insertions(+), 5 deletions(-)
> >>
> >> diff --git a/meta-oe/classes/gitpkgv.bbclass
> b/meta-oe/classes/gitpkgv.bbclass
> >> index eb4b1eae9a..1afe9c53d8 100644
> >> --- a/meta-oe/classes/gitpkgv.bbclass
> >> +++ b/meta-oe/classes/gitpkgv.bbclass
> >> @@ -59,6 +59,9 @@ def get_git_pkgv(d, use_tags):
> >>      from shlex import quote
> >>
> >>      src_uri =3D d.getVar('SRC_URI').split()
> >> +    unpackdir =3D d.getVar('UNPACKDIR')
> >> +    def_destsuffix =3D (d.getVar("BB_GIT_DEFAULT_DESTSUFFIX") or "git=
")
> + "/"
> >> +
> >>      fetcher =3D bb.fetch2.Fetch(src_uri, d)
> >>      ud =3D fetcher.ud
> >>
> >> @@ -78,20 +81,24 @@ def get_git_pkgv(d, use_tags):
> >>      found =3D False
> >>      for url in ud.values():
> >>          if url.type =3D=3D 'git' or url.type =3D=3D 'gitsm':
> >> -            if not os.path.exists(url.localpath):
> >> +            destsuffix =3D url.parm.get("destsuffix", def_destsuffix)
> >> +            subdir =3D url.parm.get('subdir', '')
> >> +            destdir =3D os.path.join(unpackdir, destsuffix, subdir)
> >> +
> >> +            if not os.path.exists(destdir):
> >>                  return None
> >>
> >>              found =3D True
> >>
> >> -            vars =3D { 'repodir' : quote(url.localpath),
> >> +            vars =3D { 'repodir' : quote(destdir),
> >>                       'rev' : quote(url.revision) }
> >>
> >>              rev =3D bb.fetch2.get_srcrev(d).split('+')[1]
> >> -            rev_file =3D os.path.join(url.localpath, "oe-gitpkgv_" +
> url.revision)
> >> +            rev_file =3D os.path.join(destdir, "oe-gitpkgv_" +
> url.revision)
> >>
> >>              if not os.path.exists(rev_file) or
> os.path.getsize(rev_file)=3D=3D0:
> >>                  commits =3D bb.fetch2.runfetchcmd(
> >> -                    "git --git-dir=3D%(repodir)s rev-list %(rev)s --
> 2>/dev/null | wc -l"
> >> +                    "git -C %(repodir)s rev-list %(rev)s --
> 2>/dev/null | wc -l"
> >>                      % vars, d, quiet=3DTrue).strip().lstrip('0')
> >>
> >>                  if commits !=3D "":
> >> @@ -107,7 +114,7 @@ def get_git_pkgv(d, use_tags):
> >>              if use_tags:
> >>                  try:
> >>                      output =3D bb.fetch2.runfetchcmd(
> >> -                        "git --git-dir=3D%(repodir)s describe %(rev)s
> --tags --exact-match 2>/dev/null"
> >> +                        "git -C %(repodir)s describe %(rev)s --tags
> --exact-match 2>/dev/null"
> >>                          % vars, d, quiet=3DTrue).strip()
> >>                      ver =3D gitpkgv_drop_tag_prefix(d, output)
> >>                  except Exception:
> >>
> >>
> >>
> >
> >
> >
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#118983):
> https://lists.openembedded.org/g/openembedded-devel/message/118983
> Mute This Topic: https://lists.openembedded.org/mt/114745266/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000d355c6063c9655f2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote gmail_quote_container"><d=
iv dir=3D"ltr" class=3D"gmail_attr">On Sun, Aug 17, 2025 at 10:35=E2=80=AFA=
M Gyorgy Sarvari via <a href=3D"http://lists.openembedded.org">lists.openem=
bedded.org</a> &lt;skandigraun=3D<a href=3D"mailto:gmail.com@lists.openembe=
dded.org">gmail.com@lists.openembedded.org</a>&gt; wrote:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc s=
olid;padding-left:1ex">On 8/17/25 11:20, Gyorgy Sarvari via <a href=3D"http=
://lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.opene=
mbedded.org</a> wrote:<br>
&gt; In my testing it looks okay, but if someone else could test/review it<=
br>
&gt; also to see if it makes sense, it would be useful.<br>
<br>
A short off-list exchange with WXbet made me look a bit more, and there<br>
is a gotcha.<br>
<br>
Looking at older releases, BB_GIT_SHALLOW used to have effect on mirror<br>
tarball fetching and generation only, not on fetching from git.<br>
<br>
But now there is actual shallow cloning, which changes the behavior of<br>
this class beyond the folder issue: it&#39;s not possible to determine the<=
br>
real number of commits, so the versions generated by this class won&#39;t b=
e<br>
very sortable.<br>
<br>
Should there be maybe a bb.warn/fatal error if shallow clone is enabled?<br=
>
Or just a comment in the class? Or just drop this change, and keep it as<br=
>
it is?<br>
<br>
Does anyone have any preference/suggestion?<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">I think we shoul=
d also look at if this class still is valuable a warning is perhaps better =
here=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8e=
x;border-left:1px #ccc solid;padding-left:1ex"><br>
&gt;<br>
&gt; On 8/17/25 11:17, Gyorgy Sarvari via <a href=3D"http://lists.openembed=
ded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org</a> wr=
ote:<br>
&gt;&gt; When BB_GIT_SHALLOW =3D &quot;1&quot; is used, the unpacked gir re=
pository doesn&#39;t<br>
&gt;&gt; exist in the download folder, and the class isn&#39;t able to inst=
ect the<br>
&gt;&gt; details of the repository.<br>
&gt;&gt;<br>
&gt;&gt; Instead inspect the repository it the UNPACKDIR.<br>
&gt;&gt;<br>
&gt;&gt; Reported-by: WXbet &lt;<a href=3D"mailto:WXbet@proton.me" target=
=3D"_blank">WXbet@proton.me</a>&gt;<br>
&gt;&gt; Signed-off-by: Gyorgy Sarvari &lt;<a href=3D"mailto:skandigraun@gm=
ail.com" target=3D"_blank">skandigraun@gmail.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 meta-oe/classes/gitpkgv.bbclass | 17 ++++++++++++-----<br>
&gt;&gt;=C2=A0 1 file changed, 12 insertions(+), 5 deletions(-)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/meta-oe/classes/gitpkgv.bbclass b/meta-oe/classes/git=
pkgv.bbclass<br>
&gt;&gt; index eb4b1eae9a..1afe9c53d8 100644<br>
&gt;&gt; --- a/meta-oe/classes/gitpkgv.bbclass<br>
&gt;&gt; +++ b/meta-oe/classes/gitpkgv.bbclass<br>
&gt;&gt; @@ -59,6 +59,9 @@ def get_git_pkgv(d, use_tags):<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 from shlex import quote<br>
&gt;&gt;=C2=A0 <br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 src_uri =3D d.getVar(&#39;SRC_URI&#39;).split(=
)<br>
&gt;&gt; +=C2=A0 =C2=A0 unpackdir =3D d.getVar(&#39;UNPACKDIR&#39;)<br>
&gt;&gt; +=C2=A0 =C2=A0 def_destsuffix =3D (d.getVar(&quot;BB_GIT_DEFAULT_D=
ESTSUFFIX&quot;) or &quot;git&quot;) + &quot;/&quot;<br>
&gt;&gt; +<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 fetcher =3D bb.fetch2.Fetch(src_uri, d)<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 ud =3D fetcher.ud<br>
&gt;&gt;=C2=A0 <br>
&gt;&gt; @@ -78,20 +81,24 @@ def get_git_pkgv(d, use_tags):<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 found =3D False<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 for url in ud.values():<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if url.type =3D=3D &#39;git&#39;=
 or url.type =3D=3D &#39;gitsm&#39;:<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if not os.path.exists(u=
rl.localpath):<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 destsuffix =3D url.parm=
.get(&quot;destsuffix&quot;, def_destsuffix)<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 subdir =3D url.parm.get=
(&#39;subdir&#39;, &#39;&#39;)<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 destdir =3D os.path.joi=
n(unpackdir, destsuffix, subdir)<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if not os.path.exists(d=
estdir):<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 retu=
rn None<br>
&gt;&gt;=C2=A0 <br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 found =3D True<br>
&gt;&gt;=C2=A0 <br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vars =3D { &#39;repodir=
&#39; : quote(url.localpath),<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vars =3D { &#39;repodir=
&#39; : quote(destdir),<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&#39;rev&#39; : quote(url.revision) }<br>
&gt;&gt;=C2=A0 <br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rev =3D bb.fetch2.=
get_srcrev(d).split(&#39;+&#39;)[1]<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rev_file =3D os.path.jo=
in(url.localpath, &quot;oe-gitpkgv_&quot; + url.revision)<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rev_file =3D os.path.jo=
in(destdir, &quot;oe-gitpkgv_&quot; + url.revision)<br>
&gt;&gt;=C2=A0 <br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if not os.path.exi=
sts(rev_file) or os.path.getsize(rev_file)=3D=3D0:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 comm=
its =3D bb.fetch2.runfetchcmd(<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &quot;git --git-dir=3D%(repodir)s rev-list %(rev)s -- 2&gt;/dev/null=
 | wc -l&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &quot;git -C %(repodir)s rev-list %(rev)s -- 2&gt;/dev/null | wc -l&=
quot;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 % vars, d, quiet=3DTrue).strip().lstrip(&#39;0&#39;)<br>
&gt;&gt;=C2=A0 <br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if c=
ommits !=3D &quot;&quot;:<br>
&gt;&gt; @@ -107,7 +114,7 @@ def get_git_pkgv(d, use_tags):<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if use_tags:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 try:=
<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 output =3D bb.fetch2.runfetchcmd(<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 &quot;git --git-dir=3D%(repodir)s describe %(rev)s --t=
ags --exact-match 2&gt;/dev/null&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 &quot;git -C %(repodir)s describe %(rev)s --tags --exa=
ct-match 2&gt;/dev/null&quot;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 % vars, d, quiet=3DTrue).strip()<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 ver =3D gitpkgv_drop_tag_prefix(d, output)<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exce=
pt Exception:<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;<br>
&gt; <br>
&gt;<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#118983): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/118983" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/118983</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/114745266/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/114745266/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000d355c6063c9655f2--

