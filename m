Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web11.657.1598378347902321278
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Aug 2020 10:59:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=U8ZYQxAN;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id d26so7648007ejr.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 25 Aug 2020 10:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ylKJHM4xg3S83J3mpaix0iXPHzIR0CRzBT+AAykTeug=;
        b=U8ZYQxANww9t0kORKoFfC6t3E/NEHu9PqLG/YzXnSP3asVcanh6uonrs9PdfS1Imzt
         b/X064bXwfvFwE3iZgtK7dhK001ZYpMHUNwAtcy4/meC67Bgyr009UsvmZLr+T/I7MyS
         RKJI3Kg83jaqVUZ0sSS2R/hYGCPQurAMB3wxgCDl+rMTGv0xXnEO3MpNQWd1uIz767HE
         QeZ5pCIBJoa1PMQG6+qfeO+gynL5jtUh67cj5zYCatVpbdEGODiztra5VdfPWaj4ZILN
         SPdGD8NXpjUevFAWNBI0eGYVUJXmpQcWxsfv/0z85mwXfxG/0IrcCf7LXEz+1BlCV1oh
         TjFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ylKJHM4xg3S83J3mpaix0iXPHzIR0CRzBT+AAykTeug=;
        b=l02rZcouLdGUqyLbzwD52qhTwVuOMTDJLIY0HCSBLRlXrPp48Jp+mC9ztawMWpAg6f
         j6qMA0jDjOeobahNEKIAmU4Lu+z67XJd74urrCXAV3IRoDYEBDBPTkKnOV0r39E48z65
         dY3yRqgoLyPLWgp4hxUcKpK0K0NRAxeOH+hW5OzaDum78sdnD7ZmR/1ByYdai0YxHaMJ
         YbYocXGe8y1jvf5SCOt2XqxlECwu3pdaNBnEVzWzAKeSWRbSd1xuNUS7H5qcTuQ2ZIti
         l3XwlTByXfqaysj9y7k+0uXlqHSH1iDtdlKIDHSPbKhLr4fDSZjAQyIFRmAD+1BiIOzz
         JXpA==
X-Gm-Message-State: AOAM533R8cQ8wpCQev3cHucKIuC5UcMR0aQRRxMvTXhAcOA81eOiO1ZD
	DkZfkgM+kw5vGgqLhGxP7zRBu49HJzdqdU2/bQc=
X-Google-Smtp-Source: ABdhPJxdQVh2WEY1CCJefx4Sgvx9O7lqaJwI2LWdZJqEEPX2DYLElD3evdkpkn89hy69ek6wtFSHw6OQ1OLLx9UnD7k=
X-Received: by 2002:a17:906:656:: with SMTP id t22mr2948205ejb.392.1598378346218;
 Tue, 25 Aug 2020 10:59:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200825154524.188696-1-diego.rondini@kynetics.com>
 <CA+chaQdtuKCqc31WB1s=-K29kv-4G2fh9g87PpBzBywxE6djRQ@mail.gmail.com> <CAMfw5YowytuBeL3hr_82NEwrCTJjSqvJO8N-8dFVvYCH6cDHiw@mail.gmail.com>
In-Reply-To: <CAMfw5YowytuBeL3hr_82NEwrCTJjSqvJO8N-8dFVvYCH6cDHiw@mail.gmail.com>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Tue, 25 Aug 2020 19:58:55 +0200
Message-ID: <CA+chaQf0ZC1pts6MtZzsu+bfxzppnzjaBY=ENq3sQbazpgosVw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] libeigen: update SRC_URI to download from gitlab
To: Diego Rondini <diego.rondini@kynetics.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000008b08c905adb775cc"

--0000000000008b08c905adb775cc
Content-Type: text/plain; charset="UTF-8"

OK, I've overlooked that it's from gitlab, but are you sure that gitlab
archives aren't re-generated from time to time like the github archives are?

Or are you sure that https://gitlab.com/libeigen/eigen/-/releases are
developer uploaded archives? It looks like gitlab creates them
automatically:
https://docs.gitlab.com/ee/user/project/releases/
like github does with tag archives.

On Tue, Aug 25, 2020 at 6:36 PM Diego Rondini <diego.rondini@kynetics.com>
wrote:

> Hi Martin,
>
> On Tue, Aug 25, 2020 at 5:57 PM Martin Jansa <martin.jansa@gmail.com>
> wrote:
> >
> > Doesn't this trigger src-uri-bad QA warning? It would be better to use
> git fetcher.
>
> No warning because this is from git*lab*.
>
> Also, this the URL of an official release tarball taken from:
> https://gitlab.com/libeigen/eigen/-/releases
>
> See also first comment here:
> https://patchwork.openembedded.org/patch/161360/
>
> Regards,
> Diego Rondini
>
>
> >
> > On Tue, Aug 25, 2020 at 5:45 PM Diego <diego.rondini@kynetics.com>
> wrote:
> >>
> >> Bitbucket is no longer the official home of eigen, which has moved to
> >> gitlab. Update SRC_URI to download releases from gitlab, fixing:
> >> WARNING: libeigen-3.3.7-r0 do_fetch: Failed to fetch URL
> >>
> https://bitbucket.org/eigen/eigen/get/3.3.7.tar.bz2;downloadfilename=libeigen-3.3.7.tar.bz2
> ,
> >> attempting MIRRORS if available
> >>
> >> Signed-off-by: Diego Rondini <diego.rondini@kynetics.com>
> >> ---
> >>  meta-oe/recipes-support/libeigen/libeigen_3.3.7.bb | 8 ++++----
> >>  1 file changed, 4 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/meta-oe/recipes-support/libeigen/libeigen_3.3.7.bb
> b/meta-oe/recipes-support/libeigen/libeigen_3.3.7.bb
> >> index f638848d1..9c3d962f4 100644
> >> --- a/meta-oe/recipes-support/libeigen/libeigen_3.3.7.bb
> >> +++ b/meta-oe/recipes-support/libeigen/libeigen_3.3.7.bb
> >> @@ -4,11 +4,11 @@ HOMEPAGE = "http://eigen.tuxfamily.org/"
> >>  LICENSE = "MPL-2.0"
> >>  LIC_FILES_CHKSUM =
> "file://COPYING.MPL2;md5=815ca599c9df247a0c7f619bab123dad"
> >>
> >> -SRC_URI = "
> https://bitbucket.org/eigen/eigen/get/${PV}.tar.bz2;downloadfilename=${BP}.tar.bz2
> "
> >> -SRC_URI[md5sum] = "05b1f7511c93980c385ebe11bd3c93fa"
> >> -SRC_URI[sha256sum] =
> "9f13cf90dedbe3e52a19f43000d71fdf72e986beb9a5436dddcd61ff9d77a3ce"
> >> +SRC_URI = "
> https://gitlab.com/libeigen/eigen/-/archive/${PV}/eigen-${PV}.tar.bz2"
> >> +SRC_URI[md5sum] = "b9e98a200d2455f06db9c661c5610496"
> >> +SRC_URI[sha256sum] =
> "685adf14bd8e9c015b78097c1dc22f2f01343756f196acdc76a678e1ae352e11"
> >>
> >> -S = "${WORKDIR}/eigen-eigen-323c052e1731"
> >> +S = "${WORKDIR}/eigen-${PV}"
> >>
> >>  inherit cmake
> >>
> >> --
> >> 2.26.2
> >>
> >> 
>

--0000000000008b08c905adb775cc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">OK, I&#39;ve overlooked that it&#39;s from gitlab, but are=
 you sure that gitlab archives aren&#39;t re-generated from time to time li=
ke the github archives are?<div><br></div><div>Or are you sure that=C2=A0<a=
 href=3D"https://gitlab.com/libeigen/eigen/-/releases">https://gitlab.com/l=
ibeigen/eigen/-/releases</a>=C2=A0are developer uploaded archives? It looks=
 like gitlab creates them automatically:</div><div><a href=3D"https://docs.=
gitlab.com/ee/user/project/releases/">https://docs.gitlab.com/ee/user/proje=
ct/releases/</a><br></div><div>like github does with tag archives.</div></d=
iv><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On =
Tue, Aug 25, 2020 at 6:36 PM Diego Rondini &lt;<a href=3D"mailto:diego.rond=
ini@kynetics.com">diego.rondini@kynetics.com</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">Hi Martin,<br>
<br>
On Tue, Aug 25, 2020 at 5:57 PM Martin Jansa &lt;<a href=3D"mailto:martin.=
jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a>&gt; wrote:<br=
>
&gt;<br>
&gt; Doesn&#39;t this trigger src-uri-bad QA warning? It would be better t=
o use git fetcher.<br>
<br>
No warning because this is from git*lab*.<br>
<br>
Also, this the URL of an official release tarball taken from:<br>
<a href=3D"https://gitlab.com/libeigen/eigen/-/releases" rel=3D"noreferrer=
" target=3D"_blank">https://gitlab.com/libeigen/eigen/-/releases</a><br>
<br>
See also first comment here:<br>
<a href=3D"https://patchwork.openembedded.org/patch/161360/" rel=3D"norefe=
rrer" target=3D"_blank">https://patchwork.openembedded.org/patch/161360/</a=
><br>
<br>
Regards,<br>
Diego Rondini<br>
<br>
<br>
&gt;<br>
&gt; On Tue, Aug 25, 2020 at 5:45 PM Diego &lt;<a href=3D"mailto:diego.ron=
dini@kynetics.com" target=3D"_blank">diego.rondini@kynetics.com</a>&gt; wro=
te:<br>
&gt;&gt;<br>
&gt;&gt; Bitbucket is no longer the official home of eigen, which has move=
d to<br>
&gt;&gt; gitlab. Update SRC_URI to download releases from gitlab, fixing:<=
br>
&gt;&gt; WARNING: libeigen-3.3.7-r0 do_fetch: Failed to fetch URL<br>
&gt;&gt; <a href=3D"https://bitbucket.org/eigen/eigen/get/3.3.7.tar.bz2;do=
wnloadfilename=3Dlibeigen-3.3.7.tar.bz2" rel=3D"noreferrer" target=3D"_blan=
k">https://bitbucket.org/eigen/eigen/get/3.3.7.tar.bz2;downloadfilename=3Dl=
ibeigen-3.3.7.tar.bz2</a>,<br>
&gt;&gt; attempting MIRRORS if available<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Diego Rondini &lt;<a href=3D"mailto:diego.rondini@=
kynetics.com" target=3D"_blank">diego.rondini@kynetics.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 meta-oe/recipes-support/libeigen/<a href=3D"http://libeigen=
_3.3.7.bb" rel=3D"noreferrer" target=3D"_blank">libeigen_3.3.7.bb</a> | 8 +=
+++----<br>
&gt;&gt;=C2=A0 1 file changed, 4 insertions(+), 4 deletions(-)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/meta-oe/recipes-support/libeigen/<a href=3D"http://l=
ibeigen_3.3.7.bb" rel=3D"noreferrer" target=3D"_blank">libeigen_3.3.7.bb</a=
> b/meta-oe/recipes-support/libeigen/<a href=3D"http://libeigen_3.3.7.bb" r=
el=3D"noreferrer" target=3D"_blank">libeigen_3.3.7.bb</a><br>
&gt;&gt; index f638848d1..9c3d962f4 100644<br>
&gt;&gt; --- a/meta-oe/recipes-support/libeigen/<a href=3D"http://libeigen=
_3.3.7.bb" rel=3D"noreferrer" target=3D"_blank">libeigen_3.3.7.bb</a><br>
&gt;&gt; +++ b/meta-oe/recipes-support/libeigen/<a href=3D"http://libeigen=
_3.3.7.bb" rel=3D"noreferrer" target=3D"_blank">libeigen_3.3.7.bb</a><br>
&gt;&gt; @@ -4,11 +4,11 @@ HOMEPAGE =3D &quot;<a href=3D"http://eigen.tuxf=
amily.org/" rel=3D"noreferrer" target=3D"_blank">http://eigen.tuxfamily.org=
/</a>&quot;<br>
&gt;&gt;=C2=A0 LICENSE =3D &quot;MPL-2.0&quot;<br>
&gt;&gt;=C2=A0 LIC_FILES_CHKSUM =3D &quot;file://COPYING.MPL2;md5=3D815ca5=
99c9df247a0c7f619bab123dad&quot;<br>
&gt;&gt;<br>
&gt;&gt; -SRC_URI =3D &quot;<a href=3D"https://bitbucket.org/eigen/eigen/g=
et/$%7BPV%7D.tar.bz2;downloadfilename=3D$%7BBP%7D.tar.bz2" rel=3D"noreferre=
r" target=3D"_blank">https://bitbucket.org/eigen/eigen/get/${PV}.tar.bz2;do=
wnloadfilename=3D${BP}.tar.bz2</a>&quot;<br>
&gt;&gt; -SRC_URI[md5sum] =3D &quot;05b1f7511c93980c385ebe11bd3c93fa&quot;=
<br>
&gt;&gt; -SRC_URI[sha256sum] =3D &quot;9f13cf90dedbe3e52a19f43000d71fdf72e=
986beb9a5436dddcd61ff9d77a3ce&quot;<br>
&gt;&gt; +SRC_URI =3D &quot;<a href=3D"https://gitlab.com/libeigen/eigen/-=
/archive/$%7BPV%7D/eigen-$%7BPV%7D.tar.bz2" rel=3D"noreferrer" target=3D"_b=
lank">https://gitlab.com/libeigen/eigen/-/archive/${PV}/eigen-${PV}.tar.bz2=
</a>&quot;<br>
&gt;&gt; +SRC_URI[md5sum] =3D &quot;b9e98a200d2455f06db9c661c5610496&quot;=
<br>
&gt;&gt; +SRC_URI[sha256sum] =3D &quot;685adf14bd8e9c015b78097c1dc22f2f013=
43756f196acdc76a678e1ae352e11&quot;<br>
&gt;&gt;<br>
&gt;&gt; -S =3D &quot;${WORKDIR}/eigen-eigen-323c052e1731&quot;<br>
&gt;&gt; +S =3D &quot;${WORKDIR}/eigen-${PV}&quot;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 inherit cmake<br>
&gt;&gt;<br>
&gt;&gt; --<br>
&gt;&gt; 2.26.2<br>
&gt;&gt;<br>
&gt;&gt; <br>
</blockquote></div>

--0000000000008b08c905adb775cc--
