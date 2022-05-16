Return-Path: <nicolas.dechesne@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D966C433EF
	for <webhook@archiver.kernel.org>; Mon, 16 May 2022 17:45:39 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
 [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web10.676.1652723137696429844
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 May 2022 10:45:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=dCkVF0nn;
 spf=pass (domain: linaro.org, ip: 209.85.208.47,
 mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-ed1-f47.google.com with SMTP id fd25so6733538edb.3
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 May 2022 10:45:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cfoAs4AVdeMt7YHZIsvl+l+ixLNBDCi0YUKu/5lrdUQ=;
        b=dCkVF0nn2TErbtoCJoF9wE+4iGd07zo/G4KCyC39Qui99hMyZUQ18k02eSYJYQGZUL
         wsOdtA+Zh3ZxjQEHT4ENC2vUspG5PbcAsDcStkG4YFcvn9WGjaUFXg7LeDs+rso4EdF5
         ZvI38Q7gimddcJFhhOcDG+jQf9+HZmie6kuDAqQ18GCaW9U7Kxv3tGY1mOPM0W8709rA
         bP+nVX1ADtuVNAKov70kyzwHPnU2q6CDieD2gFk+KDEqxMlssn5I+Wv1Jw6G530Es9tQ
         gXJdGMAvoHCQ5qlZOzUTdmkL/99CRKBM+Fze97yhKdALQCtIRdg7cEUGn9qtXpxduahT
         KpKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cfoAs4AVdeMt7YHZIsvl+l+ixLNBDCi0YUKu/5lrdUQ=;
        b=VCbqCibdvEkKmXdNmwp2jt+K+7xpnTxCj3j3J+uVyiBB+fjnOevk8wZ6jAK7azZSOq
         MGhH7EWsowv1x4ZH3X+LybAmqjlkieuQQcjGQBBMoOuiIlYYAGw1iYwdwWszd9D5XovU
         I4Pjf0D7ZDZfgAsW6BOZUE27RzMGl3FFmFUKDlJRc4Ftx30C4hfWzcdsnWrvdSJtUj+3
         Vi0T3SNQH2xl0SAMPi67x5U5LNELhWyMipNmvhKj3b9uAkMwMzANFY/NEcIU+K6rcuYI
         Z1gnJYmZxUh2ywH59WoErtqBFJY5RPhUWTGSzRWNocS4NtgykqIHkV37Gi/V5tNCW3zY
         UstQ==
X-Gm-Message-State: AOAM533zV7J6UKXqMrVT/IqbiJkwoIikcsDt1U0OIrKZwGJcYxoD3/LC
	4zSrM/48h/B6/+t2w49SpdPO6EbIEXT1d1FNYp/FtQ==
X-Google-Smtp-Source: 
 ABdhPJz2fGKvcFCkVlLhOqVfHjB9Y7mYpGeyLHGnr7GQzJ4aecWMUZUsDYDDy1U4EaxNnJ/+Hf8Qssr251HBhH9bBKE=
X-Received: by 2002:aa7:da08:0:b0:425:af3c:196a with SMTP id
 r8-20020aa7da08000000b00425af3c196amr14507785eds.69.1652723136063; Mon, 16
 May 2022 10:45:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220510092824.2033312-1-nicolas.dechesne@linaro.org>
 <796b97a3-27d8-7c87-19fb-0ad96540028b@pr.hu>
 <a9997892-f4e1-cfcd-1a68-df3312d9a1d7@gmail.com>
In-Reply-To: <a9997892-f4e1-cfcd-1a68-df3312d9a1d7@gmail.com>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Mon, 16 May 2022 19:45:25 +0200
Message-ID: 
 <CAP71WjxRyDy4kOVydX7rfLxrw63jKOp+DEg1KF+VegrogOCX=g@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] imlib2: update SRC_URI
To: Khem Raj <raj.khem@gmail.com>
Cc: zboszor@pr.hu, openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000006ffdc105df2497f0"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 16 May 2022 17:45:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97140

--0000000000006ffdc105df2497f0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 16, 2022 at 6:09 PM Khem Raj <raj.khem@gmail.com> wrote:

>
>
> On 5/16/22 8:28 AM, Zoltan Boszormenyi via lists.openembedded.org wrote:
> > 2022. 05. 10. 11:28 keltez=C3=A9ssel, Nicolas Dechesne =C3=ADrta:
> >> The upstream repo location has changed, it's now
> >> https://git.enlightenment.org/old/legacy-imlib2
> >
> > This hits every branch in meta-openembedded, not only master.
> >
>
> A different patch fixing same thing is already in master.
>

This is the merged patch, e.g.
62becef1091d (imlib2: update SRC_URI)

Not sure what you meant. And yes, it's needed in all branches. Do you
want/need a patch for this, or can you backport/apply directly?

>
> >>
> >> It's not clear when or why it happened, but the the commit hash we use
> >> in SRCREV exists in the 'new' location, so let's at least update the
> >> SRC_URI for now, and fix this warning:
> >>
> >> WARNING: imlib2-1.7.1-r0 do_fetch: Failed to fetch URL
> >> git://
> git.enlightenment.org/legacy/imlib2.git;protocol=3Dhttps;branch=3Dmaster,
> >> attempting MIRRORS if available
> >>
> >> Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
> >> ---
> >>   meta-oe/recipes-graphics/imlib2/imlib2_git.bb | 2 +-
> >>   1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/meta-oe/recipes-graphics/imlib2/imlib2_git.bb
> >> b/meta-oe/recipes-graphics/imlib2/imlib2_git.bb
> >> index 56d41cd39..869f8123d 100644
> >> --- a/meta-oe/recipes-graphics/imlib2/imlib2_git.bb
> >> +++ b/meta-oe/recipes-graphics/imlib2/imlib2_git.bb
> >> @@ -14,7 +14,7 @@ inherit autotools pkgconfig lib_package
> >>   AUTO_LIBNAME_PKGS =3D ""
> >> -SRC_URI =3D
> >> "git://
> git.enlightenment.org/legacy/${BPN}.git;protocol=3Dhttps;branch=3Dmaster
> <http://git.enlightenment.org/legacy/$%7BBPN%7D.git;protocol=3Dhttps;bran=
ch=3Dmaster>"
>
> >>
> >> +SRC_URI =3D
> >> "git://
> git.enlightenment.org/old/legacy-${BPN}.git;protocol=3Dhttps;branch=3Dmas=
ter
> <http://git.enlightenment.org/old/legacy-$%7BBPN%7D.git;protocol=3Dhttps;=
branch=3Dmaster>"
>
> >>
> >>   S =3D "${WORKDIR}/git"
> >>   PACKAGECONFIG ??=3D "jpeg png zlib
> >> ${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}"
> >>
> >>
> >>
> >>
> >>
> >
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#97134):
> https://lists.openembedded.org/g/openembedded-devel/message/97134
> > Mute This Topic: https://lists.openembedded.org/mt/91008939/1997914
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[
> raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>

--0000000000006ffdc105df2497f0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, May 16, 2022 at 6:09 PM Khem =
Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gm=
ail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex"><br>
<br>
On 5/16/22 8:28 AM, Zoltan Boszormenyi via <a href=3D"http://lists.openembe=
dded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org</a> w=
rote:<br>
&gt; 2022. 05. 10. 11:28 keltez=C3=A9ssel, Nicolas Dechesne =C3=ADrta:<br>
&gt;&gt; The upstream repo location has changed, it&#39;s now<br>
&gt;&gt; <a href=3D"https://git.enlightenment.org/old/legacy-imlib2" rel=3D=
"noreferrer" target=3D"_blank">https://git.enlightenment.org/old/legacy-iml=
ib2</a><br>
&gt; <br>
&gt; This hits every branch in meta-openembedded, not only master.<br>
&gt; <br>
<br>
A different patch fixing same thing is already in master.<br></blockquote><=
div><br></div><div class=3D"gmail_quote">This is the merged patch, e.g.=C2=
=A0</div>62becef1091d (imlib2: update SRC_URI)<br><div>=C2=A0</div><div>Not=
 sure what you meant. And yes, it&#39;s needed in all branches. Do you want=
/need a patch for=C2=A0this, or can you backport/apply directly?</div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt;&gt;<br>
&gt;&gt; It&#39;s not clear when or why it happened, but the the commit has=
h we use<br>
&gt;&gt; in SRCREV exists in the &#39;new&#39; location, so let&#39;s at le=
ast update the<br>
&gt;&gt; SRC_URI for now, and fix this warning:<br>
&gt;&gt;<br>
&gt;&gt; WARNING: imlib2-1.7.1-r0 do_fetch: Failed to fetch URL <br>
&gt;&gt; git://<a href=3D"http://git.enlightenment.org/legacy/imlib2.git;pr=
otocol=3Dhttps;branch=3Dmaster" rel=3D"noreferrer" target=3D"_blank">git.en=
lightenment.org/legacy/imlib2.git;protocol=3Dhttps;branch=3Dmaster</a>, <br=
>
&gt;&gt; attempting MIRRORS if available<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Nicolas Dechesne &lt;<a href=3D"mailto:nicolas.dech=
esne@linaro.org" target=3D"_blank">nicolas.dechesne@linaro.org</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt; =C2=A0 meta-oe/recipes-graphics/imlib2/<a href=3D"http://imlib2_gi=
t.bb" rel=3D"noreferrer" target=3D"_blank">imlib2_git.bb</a> | 2 +-<br>
&gt;&gt; =C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/meta-oe/recipes-graphics/imlib2/<a href=3D"http://iml=
ib2_git.bb" rel=3D"noreferrer" target=3D"_blank">imlib2_git.bb</a> <br>
&gt;&gt; b/meta-oe/recipes-graphics/imlib2/<a href=3D"http://imlib2_git.bb"=
 rel=3D"noreferrer" target=3D"_blank">imlib2_git.bb</a><br>
&gt;&gt; index 56d41cd39..869f8123d 100644<br>
&gt;&gt; --- a/meta-oe/recipes-graphics/imlib2/<a href=3D"http://imlib2_git=
.bb" rel=3D"noreferrer" target=3D"_blank">imlib2_git.bb</a><br>
&gt;&gt; +++ b/meta-oe/recipes-graphics/imlib2/<a href=3D"http://imlib2_git=
.bb" rel=3D"noreferrer" target=3D"_blank">imlib2_git.bb</a><br>
&gt;&gt; @@ -14,7 +14,7 @@ inherit autotools pkgconfig lib_package<br>
&gt;&gt; =C2=A0 AUTO_LIBNAME_PKGS =3D &quot;&quot;<br>
&gt;&gt; -SRC_URI =3D <br>
&gt;&gt; &quot;git://<a href=3D"http://git.enlightenment.org/legacy/$%7BBPN=
%7D.git;protocol=3Dhttps;branch=3Dmaster" rel=3D"noreferrer" target=3D"_bla=
nk">git.enlightenment.org/legacy/${BPN}.git;protocol=3Dhttps;branch=3Dmaste=
r</a>&quot; <br>
&gt;&gt;<br>
&gt;&gt; +SRC_URI =3D <br>
&gt;&gt; &quot;git://<a href=3D"http://git.enlightenment.org/old/legacy-$%7=
BBPN%7D.git;protocol=3Dhttps;branch=3Dmaster" rel=3D"noreferrer" target=3D"=
_blank">git.enlightenment.org/old/legacy-${BPN}.git;protocol=3Dhttps;branch=
=3Dmaster</a>&quot; <br>
&gt;&gt;<br>
&gt;&gt; =C2=A0 S =3D &quot;${WORKDIR}/git&quot;<br>
&gt;&gt; =C2=A0 PACKAGECONFIG ??=3D &quot;jpeg png zlib <br>
&gt;&gt; ${@bb.utils.filter(&#39;DISTRO_FEATURES&#39;, &#39;x11&#39;, d)}&q=
uot;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#97134): <a href=3D"https://lists.openembedded.org/=
g/openembedded-devel/message/97134" rel=3D"noreferrer" target=3D"_blank">ht=
tps://lists.openembedded.org/g/openembedded-devel/message/97134</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/91008939=
/1997914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.o=
rg/mt/91008939/1997914</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openem=
bedded.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.o=
rg</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
devel/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedde=
d.org/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com"=
 target=3D"_blank">raj.khem@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; <br>
</blockquote></div></div>

--0000000000006ffdc105df2497f0--

