Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAF07C433EF
	for <webhook@archiver.kernel.org>; Fri, 22 Oct 2021 04:31:12 +0000 (UTC)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com
 [209.85.222.179])
 by mx.groups.io with SMTP id smtpd.web09.3996.1634877071837283570
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Oct 2021 21:31:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ETcIDVuF;
 spf=pass (domain: gmail.com, ip: 209.85.222.179,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f179.google.com with SMTP id h20so3411690qko.13
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Oct 2021 21:31:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sc7GLGXKWVTC+q5WhXMYDlWrpcnQEsXkz6mJVcu1Zes=;
        b=ETcIDVuFavARcE5LlslfqkJTKgFuk9P+fPQJ8xXw+8zw4mEKUkCeGnYhZN+09w7OcE
         xqj2cmUc5UkFJAqTYKoJH314qPeczexz916+lM+/CKbpP8TX63hiG1DyTDJtGRhiHs9F
         xbndQQYuXQ/zB9eONF8Lf3X3WvRJ2Ep0azwc/cHbire+CkWVVabvGuJuLG2H+G5GnnqX
         Uqgk/UJar0X2NdYW9mSR2hZKYlYwv9aYwlVXaNu/D2KXzyRepUq9ePlJnfFk49BLfvBt
         zbRnee3sO4rdX10brdI8RCjjL4dZ355xoZUG509Ol6G8Kh+1UB1OpDb1Jnq7TRx/J75N
         G2yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sc7GLGXKWVTC+q5WhXMYDlWrpcnQEsXkz6mJVcu1Zes=;
        b=Vlyx9HIHp+6T+Q2XFQVt7Bnlhr2FQ9r/5BVqc7be5fTiJYpWZPX534NOfiIuLakLVO
         JAs5M0cARNSBRfA4ACzbj5MD10HldRL4FrOu/cZ0O0V/h3pk4ctx8fCPWivGi95kg15N
         0qgj8JhvD+iQH/wENoGbyep1JSHw+vxut4fpVNEtkTNioUEuwaiemam1hTWyvbId5DCX
         GB25a5a7tovPWSgk0CVSvgMbAICXgOX46WLynIXxbIhWGt4t5sq+BVa9Pd4lSgEJPQd6
         Bgiau0TDpO/HuBzNa1SxeD86y+drNu8PjoiNmdO266cRv7uv4+qRRSQ35FVRZstzfgJ8
         zthA==
X-Gm-Message-State: AOAM530/y1kgL6kOJR8gLi5Rw+Fcg0F9FoUvzRl06ZFSNPxGAi89pEkf
	AfWRh+icgX1fgatTSagm7v6GV3bRrpprpGWONQA=
X-Google-Smtp-Source: 
 ABdhPJweSqztB07wH7+eAcjLXHMwVwcHza8UHtI3wdRdYQg8vD2dJvvY2YlwkVvNLlRlwin5pWBOVXAPTqwPFVw2bQc=
X-Received: by 2002:ae9:de07:: with SMTP id s7mr8027265qkf.47.1634877070905;
 Thu, 21 Oct 2021 21:31:10 -0700 (PDT)
MIME-Version: 1.0
References: <20211019045923.51357-1-Qi.Chen@windriver.com>
 <b73a6500-6db3-57ec-2ccb-4616a719d276@gmail.com>
 <4d0ea54a-fb51-982d-2936-027fe91c4d9d@windriver.com>
 <CO6PR11MB56020D2F23E77A747EEAC365EDBF9@CO6PR11MB5602.namprd11.prod.outlook.com>
 <CO6PR11MB5602FBC27E267729CA21A55AED809@CO6PR11MB5602.namprd11.prod.outlook.com>
In-Reply-To: 
 <CO6PR11MB5602FBC27E267729CA21A55AED809@CO6PR11MB5602.namprd11.prod.outlook.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 21 Oct 2021 21:31:00 -0700
Message-ID: 
 <CAMKF1sq3V_HVeo+31bYpSzCUjTF4+d5LGUvXEcz+bDiBnL6OQQ@mail.gmail.com>
Subject: Re: [oe][meta-filesystem][hardknott][PATCH] ntfs-3g-ntfsprogs:
 upgrade to 2021.8.22
To: Chen Qi <Qi.Chen@windriver.com>
Cc: Armin Kuster <akuster808@gmail.com>, "MacLeod,
 Randy" <Randy.MacLeod@windriver.com>,
	"openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000010165005cee97b28"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 22 Oct 2021 04:31:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93529

--00000000000010165005cee97b28
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Stable merges takes time it=E2=80=99s already staged see

https://git.openembedded.org/meta-openembedded-contrib/log/?h=3Dstable/hard=
knott-nut


On Thu, Oct 21, 2021 at 7:05 PM Chen Qi <Qi.Chen@windriver.com> wrote:

> Hi Armin & Randy,
>
> Could this patch be merged into hardknott?
> Or should I send out V2 with detailed change log?
>
> Regards,
> Qi
> ------------------------------
> *From:* Chen, Qi <Qi.Chen@windriver.com>
> *Sent:* Thursday, October 21, 2021 10:10
> *To:* MacLeod, Randy <Randy.MacLeod@windriver.com>; Armin Kuster <
> akuster808@gmail.com>; openembedded-devel@lists.openembedded.org <
> openembedded-devel@lists.openembedded.org>
>
> *Subject:* Re: [oe][meta-filesystem][hardknott][PATCH] ntfs-3g-ntfsprogs:
> upgrade to 2021.8.22
>
> Hi Randy,
>
>
>    1. It's used by anaconda. I searched OE, and didn't find any other
>    place.
>
>
>    1. I don't think it's worth the effort to identify and fix them one by
>    one.
>
> Regards,
> Qi
> ------------------------------
> *From:* MacLeod, Randy <Randy.MacLeod@windriver.com>
> *Sent:* Thursday, October 21, 2021 1:06
> *To:* Armin Kuster <akuster808@gmail.com>; Chen, Qi <Qi.Chen@windriver.co=
m>;
> openembedded-devel@lists.openembedded.org <
> openembedded-devel@lists.openembedded.org>
> *Subject:* Re: [oe][meta-filesystem][hardknott][PATCH] ntfs-3g-ntfsprogs:
> upgrade to 2021.8.22
>
> On 2021-10-19 11:09 a.m., Armin Kuster wrote:
> >
> >
> > On 10/18/21 9:59 PM, Chen Qi wrote:
> >> This upgrade revolves a bunch of CVEs. See more details in:
> >>
> https://github.com/tuxera/ntfs-3g/security/advisories/GHSA-q759-8j5v-q5jp=
.
> > Seems reasonable to me.
> >
> > -armin
>
> I"m tempted to agree but I don't know enough about how ntfs-36 is
> used. I think we need more information and a more detailed commit
> log explaining why we think that the uprev is okay.
>
> Qi,
> Does it provide a library and header files that developers use?
>
> Debian has a patch that we could make use of:
>     https://security-tracker.debian.org/tracker/CVE-2021-35266
>
> $ apt-get source ntfs-3g
>
> $ fd security.patch
>
> ntfs-3g-2017.3.23AR.3/debian/patches/aug2021-security.patch
>
>
> $ diffstat `fd aug`
>
>   include/ntfs-3g/attrib.h |    1
>
>   include/ntfs-3g/index.h  |    4 +
>
>   include/ntfs-3g/volume.h |    5 ++
>
>   libntfs-3g/acls.c        |    4 +
>
>   libntfs-3g/attrib.c      |  332
>
> +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++=
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-=
-----
>
>   libntfs-3g/bootsect.c    |    8 +++
>
>   libntfs-3g/compress.c    |   22 +++++++++-
>
>   libntfs-3g/dir.c         |  109
> +++++++++++++++++++-------------------------------
>
>   libntfs-3g/index.c       |  183
>
> +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++--------=
-----------
>
>   libntfs-3g/inode.c       |   24 ++++++-----
>
>   libntfs-3g/lcnalloc.c    |   15 ++++--
>
>   libntfs-3g/mft.c         |   70 +++++++++++++++++++++++++++++++-
>
>   libntfs-3g/volume.c      |   81 ++++++++++++++++++++++++++++---------
>
>   ntfsprogs/ntfscp.c       |    3 -
>
>   ntfsprogs/ntfsfix.c      |   17 ++++++-
>
>   src/lowntfs-3g.c         |  384
>
> +++++++++++++++++++++++++++++++++++++++++--------------------------------=
---------------------------------------------------------------------------=
------------------------------
>
>   src/ntfs-3g.c            |   23 ++++++----
>
>   17 files changed, 818 insertions(+), 467 deletions(-)
>
>
> compared to the diff of the uprev:
>
> $ git diff 2017.3.23..2021.8.22 | diffstat | tail -1
>
>   69 files changed, 3220 insertions(+), 705 deletions(-)
>
>
>
> ../Randy
>
> >>
> >> These CVEs cannot be reolved one by one. Upgrading the package
> >> is the only reasonable way.
> >>
> >> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> >> ---
> >>   ...-ntfsprogs_2017.3.23.bb =3D> ntfs-3g-ntfsprogs_2021.8.22.bb} | 4
> ++--
> >>   1 file changed, 2 insertions(+), 2 deletions(-)
> >>   rename meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/{
> ntfs-3g-ntfsprogs_2017.3.23.bb =3D> ntfs-3g-ntfsprogs_2021.8.22.bb} (92%)
> >>
> >> diff --git a/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/
> ntfs-3g-ntfsprogs_2017.3.23.bb
> b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/
> ntfs-3g-ntfsprogs_2021.8.22.bb
> >> similarity index 92%
> >> rename from meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/
> ntfs-3g-ntfsprogs_2017.3.23.bb
> >> rename to meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/
> ntfs-3g-ntfsprogs_2021.8.22.bb
> >> index 6f5cb6cee..19b2d6ca2 100644
> >> --- a/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/
> ntfs-3g-ntfsprogs_2017.3.23.bb
> >> +++ b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/
> ntfs-3g-ntfsprogs_2021.8.22.bb
> >> @@ -10,8 +10,8 @@ SRC_URI =3D "
> http://tuxera.com/opensource/ntfs-3g_ntfsprogs-${PV}.tgz \
> >>
> file://0001-libntfs-3g-Makefile.am-fix-install-failed-while-host.patch \
> >>   "
> >>   S =3D "${WORKDIR}/ntfs-3g_ntfsprogs-${PV}"
> >> -SRC_URI[md5sum] =3D "d97474ae1954f772c6d2fa386a6f462c"
> >> -SRC_URI[sha256sum] =3D
> "3e5a021d7b761261836dcb305370af299793eedbded731df3d6943802e1262d5"
> >> +SRC_URI[md5sum] =3D "90da343e78877d388eb34cefae6799ae"
> >> +SRC_URI[sha256sum] =3D
> "55b883aa05d94b2ec746ef3966cb41e66bed6db99f22ddd41d1b8b94bb202efb"
> >>
> >>   UPSTREAM_CHECK_URI =3D "
> https://www.tuxera.com/community/open-source-ntfs-3g/"
> >>   UPSTREAM_CHECK_REGEX =3D "ntfs-3g_ntfsprogs-(?P<pver>\d+(\.\d+)+)\.t=
gz"
> >>
> >>
> >>
> >
> >
> >
> >
> >
>
>
> --
> # Randy MacLeod
> # Wind River Linux
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#93524):
> https://lists.openembedded.org/g/openembedded-devel/message/93524
> Mute This Topic: https://lists.openembedded.org/mt/86433129/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000010165005cee97b28
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Stable merges takes time it=E2=80=99s already staged see=
=C2=A0</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div><a href=3D"h=
ttps://git.openembedded.org/meta-openembedded-contrib/log/?h=3Dstable/hardk=
nott-nut">https://git.openembedded.org/meta-openembedded-contrib/log/?h=3Ds=
table/hardknott-nut</a></div><br></div><div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Oct 21, 2021 at 7:05 PM Chen =
Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com">Qi.Chen@windriver.com</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left-width:1px;border-left-style:solid;padding-left:1ex;=
border-left-color:rgb(204,204,204)">




<div dir=3D"ltr">
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
Hi Armin &amp; Randy,</div>
<div><br>
</div>
<div>Could this patch be merged into hardknott?</div>
<div>Or should I send out V2 with detailed change log?</div>
<div><br>
</div>
<div>Regards,</div>
<div>Qi<br>
</div>
<div id=3D"m_5439778302784622376appendonsend"></div>
<hr style=3D"display:inline-block;width:98%">
<div id=3D"m_5439778302784622376divRplyFwdMsg" dir=3D"ltr"><font face=3D"Ca=
libri, sans-serif" style=3D"font-size:11pt;font-family:Calibri,sans-serif;c=
olor:rgb(0,0,0)"><b style=3D"font-family:Calibri,sans-serif">From:</b> Chen=
, Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com" target=3D"_blank" style=
=3D"font-family:Calibri,sans-serif">Qi.Chen@windriver.com</a>&gt;<br>
<b style=3D"font-family:Calibri,sans-serif">Sent:</b> Thursday, October 21,=
 2021 10:10<br>
<b style=3D"font-family:Calibri,sans-serif">To:</b> MacLeod, Randy &lt;<a h=
ref=3D"mailto:Randy.MacLeod@windriver.com" target=3D"_blank" style=3D"font-=
family:Calibri,sans-serif">Randy.MacLeod@windriver.com</a>&gt;; Armin Kuste=
r &lt;<a href=3D"mailto:akuster808@gmail.com" target=3D"_blank" style=3D"fo=
nt-family:Calibri,sans-serif">akuster808@gmail.com</a>&gt;; <a href=3D"mail=
to:openembedded-devel@lists.openembedded.org" target=3D"_blank" style=3D"fo=
nt-family:Calibri,sans-serif">openembedded-devel@lists.openembedded.org</a>=
 &lt;<a href=3D"mailto:openembedded-devel@lists.openembedded.org" target=3D=
"_blank" style=3D"font-family:Calibri,sans-serif">openembedded-devel@lists.=
openembedded.org</a>&gt;</font></div></div><div dir=3D"ltr"><div id=3D"m_54=
39778302784622376divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-ser=
if" style=3D"font-size:11pt;font-family:Calibri,sans-serif;color:rgb(0,0,0)=
"><br>
<b style=3D"font-family:Calibri,sans-serif">Subject:</b> Re: [oe][meta-file=
system][hardknott][PATCH] ntfs-3g-ntfsprogs: upgrade to 2021.8.22</font></d=
iv></div><div dir=3D"ltr"><div id=3D"m_5439778302784622376divRplyFwdMsg" di=
r=3D"ltr"><font face=3D"Calibri, sans-serif" style=3D"font-size:11pt;font-f=
amily:Calibri,sans-serif;color:rgb(0,0,0)"></font>
<div>=C2=A0</div>
</div></div><div dir=3D"ltr">

<div dir=3D"ltr">
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
Hi Randy,</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
<ol style=3D"font-family:Calibri,Arial,Helvetica,sans-serif">
<li style=3D"font-family:Calibri,Arial,Helvetica,sans-serif"><span style=3D=
"font-family:Calibri,Arial,Helvetica,sans-serif">It&#39;s used by anaconda.=
 I searched OE, and didn&#39;t find any other place.</span></li></ol>
</div>
<ol start=3D"2">
<li style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt;=
color:rgb(0,0,0)">
I don&#39;t think it&#39;s worth the effort to identify and fix them one by=
 one.</li></ol>
<div>Regards,</div>
<div>Qi</div>
<div id=3D"m_5439778302784622376x_appendonsend"></div>
<hr style=3D"display:inline-block;width:98%">
<div id=3D"m_5439778302784622376x_divRplyFwdMsg" dir=3D"ltr"><font face=3D"=
Calibri, sans-serif" style=3D"font-size:11pt;font-family:Calibri,sans-serif=
;color:rgb(0,0,0)"><b style=3D"font-family:Calibri,sans-serif">From:</b> Ma=
cLeod, Randy &lt;<a href=3D"mailto:Randy.MacLeod@windriver.com" target=3D"_=
blank" style=3D"font-family:Calibri,sans-serif">Randy.MacLeod@windriver.com=
</a>&gt;<br>
<b style=3D"font-family:Calibri,sans-serif">Sent:</b> Thursday, October 21,=
 2021 1:06<br>
<b style=3D"font-family:Calibri,sans-serif">To:</b> Armin Kuster &lt;<a hre=
f=3D"mailto:akuster808@gmail.com" target=3D"_blank" style=3D"font-family:Ca=
libri,sans-serif">akuster808@gmail.com</a>&gt;; Chen, Qi &lt;<a href=3D"mai=
lto:Qi.Chen@windriver.com" target=3D"_blank" style=3D"font-family:Calibri,s=
ans-serif">Qi.Chen@windriver.com</a>&gt;; <a href=3D"mailto:openembedded-de=
vel@lists.openembedded.org" target=3D"_blank" style=3D"font-family:Calibri,=
sans-serif">openembedded-devel@lists.openembedded.org</a> &lt;<a href=3D"ma=
ilto:openembedded-devel@lists.openembedded.org" target=3D"_blank" style=3D"=
font-family:Calibri,sans-serif">openembedded-devel@lists.openembedded.org</=
a>&gt;<br>
<b style=3D"font-family:Calibri,sans-serif">Subject:</b> Re: [oe][meta-file=
system][hardknott][PATCH] ntfs-3g-ntfsprogs: upgrade to 2021.8.22</font>
<div>=C2=A0</div>
</div>
<div><font size=3D"2" style=3D"color:rgb(0,0,0)"><span style=3D"font-size:1=
1pt">
<div>On 2021-10-19 11:09 a.m., Armin Kuster wrote:<br>
&gt; <br>
&gt; <br>
&gt; On 10/18/21 9:59 PM, Chen Qi wrote:<br>
&gt;&gt; This upgrade revolves a bunch of CVEs. See more details in:<br>
&gt;&gt; <a href=3D"https://github.com/tuxera/ntfs-3g/security/advisories/G=
HSA-q759-8j5v-q5jp" target=3D"_blank">
https://github.com/tuxera/ntfs-3g/security/advisories/GHSA-q759-8j5v-q5jp</=
a>.<br>
&gt; Seems reasonable to me.<br>
&gt; <br>
&gt; -armin<br>
<br>
I&quot;m tempted to agree but I don&#39;t know enough about how ntfs-36 is<=
br>
used. I think we need more information and a more detailed commit<br>
log explaining why we think that the uprev is okay.<br>
<br>
Qi,<br>
Does it provide a library and header files that developers use?<br>
<br>
Debian has a patch that we could make use of:<br>
=C2=A0=C2=A0=C2=A0 <a href=3D"https://security-tracker.debian.org/tracker/C=
VE-2021-35266" target=3D"_blank">https://security-tracker.debian.org/tracke=
r/CVE-2021-35266</a><br>
<br>
$ apt-get source ntfs-3g<br>
<br>
$ fd security.patch<br>
<br>
ntfs-3g-2017.3.23AR.3/debian/patches/aug2021-security.patch<br>
<br>
<br>
$ diffstat `fd aug`<br>
<br>
=C2=A0 include/ntfs-3g/attrib.h |=C2=A0=C2=A0=C2=A0 1<br>
<br>
=C2=A0 include/ntfs-3g/index.h=C2=A0 |=C2=A0=C2=A0=C2=A0 4 +<br>
<br>
=C2=A0 include/ntfs-3g/volume.h |=C2=A0=C2=A0=C2=A0 5 ++<br>
<br>
=C2=A0 libntfs-3g/acls.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=
=C2=A0=C2=A0 4 +<br>
<br>
=C2=A0 libntfs-3g/attrib.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 332 <br>
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++=
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++---=
---<br>
<br>
=C2=A0 libntfs-3g/bootsect.c=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0 8 +++<br=
>
<br>
=C2=A0 libntfs-3g/compress.c=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 22 +++++++++-<=
br>
<br>
=C2=A0 libntfs-3g/dir.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0 109 <br>
+++++++++++++++++++-------------------------------<br>
<br>
=C2=A0 libntfs-3g/index.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 183 <=
br>
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++----------=
---------<br>
<br>
=C2=A0 libntfs-3g/inode.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=
 24 ++++++-----<br>
<br>
=C2=A0 libntfs-3g/lcnalloc.c=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 15 ++++--<br>
<br>
=C2=A0 libntfs-3g/mft.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0=C2=A0 70 +++++++++++++++++++++++++++++++-<br>
<br>
=C2=A0 libntfs-3g/volume.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 81 +=
+++++++++++++++++++++++++++---------<br>
<br>
=C2=A0 ntfsprogs/ntfscp.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=
=C2=A0 3 -<br>
<br>
=C2=A0 ntfsprogs/ntfsfix.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 17 +=
+++++-<br>
<br>
=C2=A0 src/lowntfs-3g.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0 384 <br>
+++++++++++++++++++++++++++++++++++++++++----------------------------------=
---------------------------------------------------------------------------=
----------------------------<br>
<br>
=C2=A0 src/ntfs-3g.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0=C2=A0 23 ++++++----<br>
<br>
=C2=A0 17 files changed, 818 insertions(+), 467 deletions(-)<br>
<br>
<br>
compared to the diff of the uprev:<br>
<br>
$ git diff 2017.3.23..2021.8.22 | diffstat | tail -1<br>
<br>
=C2=A0 69 files changed, 3220 insertions(+), 705 deletions(-)<br>
<br>
<br>
<br>
../Randy<br>
<br>
&gt;&gt;<br>
&gt;&gt; These CVEs cannot be reolved one by one. Upgrading the package<br>
&gt;&gt; is the only reasonable way.<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com=
" target=3D"_blank">Qi.Chen@windriver.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0=C2=A0 ...-<a href=3D"http://ntfsprogs_2017.3.23.bb" target=
=3D"_blank">ntfsprogs_2017.3.23.bb</a> =3D&gt; <a href=3D"http://ntfs-3g-nt=
fsprogs_2021.8.22.bb" target=3D"_blank">ntfs-3g-ntfsprogs_2021.8.22.bb</a>}=
 | 4 ++--<br>
&gt;&gt;=C2=A0=C2=A0 1 file changed, 2 insertions(+), 2 deletions(-)<br>
&gt;&gt;=C2=A0=C2=A0 rename meta-filesystems/recipes-filesystems/ntfs-3g-nt=
fsprogs/{<a href=3D"http://ntfs-3g-ntfsprogs_2017.3.23.bb" target=3D"_blank=
">ntfs-3g-ntfsprogs_2017.3.23.bb</a> =3D&gt; <a href=3D"http://ntfs-3g-ntfs=
progs_2021.8.22.bb" target=3D"_blank">ntfs-3g-ntfsprogs_2021.8.22.bb</a>} (=
92%)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprog=
s/<a href=3D"http://ntfs-3g-ntfsprogs_2017.3.23.bb" target=3D"_blank">ntfs-=
3g-ntfsprogs_2017.3.23.bb</a> b/meta-filesystems/recipes-filesystems/ntfs-3=
g-ntfsprogs/<a href=3D"http://ntfs-3g-ntfsprogs_2021.8.22.bb" target=3D"_bl=
ank">ntfs-3g-ntfsprogs_2021.8.22.bb</a><br>
&gt;&gt; similarity index 92%<br>
&gt;&gt; rename from meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs=
/<a href=3D"http://ntfs-3g-ntfsprogs_2017.3.23.bb" target=3D"_blank">ntfs-3=
g-ntfsprogs_2017.3.23.bb</a><br>
&gt;&gt; rename to meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/<=
a href=3D"http://ntfs-3g-ntfsprogs_2021.8.22.bb" target=3D"_blank">ntfs-3g-=
ntfsprogs_2021.8.22.bb</a><br>
&gt;&gt; index 6f5cb6cee..19b2d6ca2 100644<br>
&gt;&gt; --- a/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/<a hr=
ef=3D"http://ntfs-3g-ntfsprogs_2017.3.23.bb" target=3D"_blank">ntfs-3g-ntfs=
progs_2017.3.23.bb</a><br>
&gt;&gt; +++ b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/<a hr=
ef=3D"http://ntfs-3g-ntfsprogs_2021.8.22.bb" target=3D"_blank">ntfs-3g-ntfs=
progs_2021.8.22.bb</a><br>
&gt;&gt; @@ -10,8 +10,8 @@ SRC_URI =3D &quot;<a></a><a href=3D"http://tuxer=
a.com/opensource/ntfs-3g_ntfsprogs-$%7BPV%7D.tgz" target=3D"_blank">http://=
tuxera.com/opensource/ntfs-3g_ntfsprogs-${PV}.tgz</a> \<br>
&gt;&gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 <a>
file://0001-libntfs-3g-Makefile.am-fix-install-failed-while-host.patch</a> =
\<br>
&gt;&gt;=C2=A0=C2=A0 &quot;<br>
&gt;&gt;=C2=A0=C2=A0 S =3D &quot;${WORKDIR}/ntfs-3g_ntfsprogs-${PV}&quot;<b=
r>
&gt;&gt; -SRC_URI[md5sum] =3D &quot;d97474ae1954f772c6d2fa386a6f462c&quot;<=
br>
&gt;&gt; -SRC_URI[sha256sum] =3D &quot;3e5a021d7b761261836dcb305370af299793=
eedbded731df3d6943802e1262d5&quot;<br>
&gt;&gt; +SRC_URI[md5sum] =3D &quot;90da343e78877d388eb34cefae6799ae&quot;<=
br>
&gt;&gt; +SRC_URI[sha256sum] =3D &quot;55b883aa05d94b2ec746ef3966cb41e66bed=
6db99f22ddd41d1b8b94bb202efb&quot;<br>
&gt;&gt;=C2=A0=C2=A0 <br>
&gt;&gt;=C2=A0=C2=A0 UPSTREAM_CHECK_URI =3D &quot;<a href=3D"https://www.tu=
xera.com/community/open-source-ntfs-3g/" target=3D"_blank">https://www.tuxe=
ra.com/community/open-source-ntfs-3g/</a>&quot;<br>
&gt;&gt;=C2=A0=C2=A0 UPSTREAM_CHECK_REGEX =3D &quot;ntfs-3g_ntfsprogs-(?P&l=
t;pver&gt;\d+(\.\d+)+)\.tgz&quot;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
<br>
<br>
-- <br>
# Randy MacLeod<br>
# Wind River Linux<br>
<br>
</div>
</span></font></div>
</div>
</div><div dir=3D"ltr"></div>

<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#93524): <a href=3D"https://lists.openembedded.org/g/ope=
nembedded-devel/message/93524" rel=3D"noreferrer" target=3D"_blank">https:/=
/lists.openembedded.org/g/openembedded-devel/message/93524</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/86433129/1997=
914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/86433129/1997914</a><br>
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

--00000000000010165005cee97b28--

