Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.web09.20104.1626646316932032109
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 18 Jul 2021 15:11:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=bE6N6oZZ;
 spf=pass (domain: gmail.com, ip: 209.85.219.51, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f51.google.com with SMTP id ck17so7422170qvb.9
        for <openembedded-devel@lists.openembedded.org>; Sun, 18 Jul 2021 15:11:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YNS/YLtgT0LlvAm/xYctiIK2nCCBQgKZdBQ3iPetFJo=;
        b=bE6N6oZZ+6OC2AysWIsAg7TcQCN2wAaRXm11neFTTsmiN7iFxMqcL2QmlYZRD/8ogj
         cNxyPMou51IaB2JVcLzOlYWOLFvJDp8HKYe6fMA0HetnnXlt5yPy3MV5Kt2MRzSnYgww
         0qlgEZCUNmOiqjrmIDbJ5p8B9ZHif8h2znecpwEVaLdOsyAumVbXrp/nt0IviI0CrMdM
         nKscZ1Wxqhe9Nz8R+VTbosLCpoRO+/oZYfj82b+S1h9bCkhR4yajmMnQjkUqAPmOg6cc
         DoNYpvBKLsjOQgSbZn2q+MhLrBnDvPoxHAFUtP7lKATFy3SXu3F8VW6nwRHouc2upuMs
         EU+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YNS/YLtgT0LlvAm/xYctiIK2nCCBQgKZdBQ3iPetFJo=;
        b=IXTmRtXSSVueYIBGIce+eIQ5ith7KUFLMHmxvEFnFVZ2Q0DpggsZrKdkEWcxLYetPz
         /k+8nfE99kwtnoE2VeTx+nG/nI518KLLTvZS+s6Wg7shf9eVdLYBngtZPAV6s6fBBtKv
         I1a1LBPxe7EQADwLs6mAO+FoSE2qnoBXi7m7/yRh0tMvr3NVUNAmcsuytAbIBWpjm9oa
         j8icKyNmnTamoyTg/9sM/zUeLs9Vy7w8wVwcBw4RLi4QBZcht80dzgnP3ri5ZpXFM0aW
         IabqY12OiFLsnwHYYIm82YDJAj4D7HwU+eSLu+nim+GT9DvEYjmw6sw5BWc0chdSjzNi
         oFag==
X-Gm-Message-State: AOAM533zhH6HrT4mTwJ9ytOoItRLjQqLWlE+jYAmhwJR8ByyGezhdUXc
	YAHO20BcydVSMSHr6Ws6msp6JYEicyXUDz53TVY=
X-Google-Smtp-Source: ABdhPJyf1Qr5RXGBM36OeQj2qjqz2CPMcny23iqLvsnYRrNDvHAzlSW2UEDZCjWdlEn3yhMG7qqC54gfyNZRcSsS4fs=
X-Received: by 2002:a0c:9ada:: with SMTP id k26mr21651603qvf.16.1626646316045;
 Sun, 18 Jul 2021 15:11:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210717160823.12894-1-raj.khem@gmail.com> <fa4050d6-8972-0d7f-4653-dc4567d8e509@gmail.com>
In-Reply-To: <fa4050d6-8972-0d7f-4653-dc4567d8e509@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Sun, 18 Jul 2021 15:11:45 -0700
Message-ID: <CAMKF1srzE-hfiwnCNS7yPA+2XfS7yJeRf+6oYynAPcZc15CEFw@mail.gmail.com>
Subject: Re: [oe] [PATCH] layers: Fix git send-email instructions in README
To: akuster808 <akuster808@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000d7d77505c76d1b5b"

--000000000000d7d77505c76d1b5b
Content-Type: text/plain; charset="UTF-8"

On Sun, Jul 18, 2021 at 10:46 AM akuster808 <akuster808@gmail.com> wrote:

>
>
> On 7/17/21 9:08 AM, Khem Raj wrote:
> > This ensures that cut-n-paste of this command from README will work
>
> with backport ?


I think for backport we need to add branch in subject line so it does not
change status quo you still have to edit the patch header

>
>
> -armin
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  meta-filesystems/README     | 3 +--
> >  meta-initramfs/README       | 2 +-
> >  meta-multimedia/README      | 4 ++--
> >  meta-networking/MAINTAINERS | 2 +-
> >  meta-perl/README            | 3 +--
> >  meta-python/README          | 5 ++---
> >  meta-xfce/README            | 2 +-
> >  7 files changed, 9 insertions(+), 12 deletions(-)
> >
> > diff --git a/meta-filesystems/README b/meta-filesystems/README
> > index edcf8bfeef..78a4429ce2 100644
> > --- a/meta-filesystems/README
> > +++ b/meta-filesystems/README
> > @@ -30,7 +30,7 @@ When sending single patches, please use something like:
> >
> >     git send-email -1 -M \
> >          --to openembedded-devel@lists.openembedded.org \
> > -        --subject-prefix=meta-filesystems][PATCH
> > +        --subject-prefix='meta-filesystems][PATCH'
> >
> >
> >  Table of Contents
> > @@ -99,4 +99,3 @@ II. Misc
> >
> >    --- xfsprogs ---
> >    It provides XFS filesystem utilities.
> > -
> > diff --git a/meta-initramfs/README b/meta-initramfs/README
> > index 79244d43f0..a8f17ba859 100644
> > --- a/meta-initramfs/README
> > +++ b/meta-initramfs/README
> > @@ -23,7 +23,7 @@ Send patches / pull requests to
> openembedded-devel@lists.openembedded.org
> >  with '[meta-initramfs]' in the subject.
> >
> >  When sending single patches, please using something like:
> > -'git send-email -M -1 --to openembedded-devel@lists.openembedded.org
> --subject-prefix=meta-initramfs][PATCH'
> > +git send-email -M -1 --to openembedded-devel@lists.openembedded.org
> --subject-prefix='meta-initramfs][PATCH'
> >
> >  Interm layer maintainer: Khem Raj <raj.khem@gmail.com>
> >
> > diff --git a/meta-multimedia/README b/meta-multimedia/README
> > index b4c2455a11..9c649ff87c 100644
> > --- a/meta-multimedia/README
> > +++ b/meta-multimedia/README
> > @@ -9,10 +9,10 @@ layers: meta-oe
> >  branch: master
> >  revision: HEAD
> >
> > -Send pull requests to openembedded-devel@lists.openembedded.org with
> '[meta-multimedia]' in the subject'
> > +Send pull requests to openembedded-devel@lists.openembedded.org with
> '[meta-multimedia]' in the subject
> >
> >  When sending single patches, please use something like:
> > -'git send-email -M -1 --to openembedded-devel@lists.openembedded.org
> --subject-prefix=meta-multimedia][PATCH
> > +git send-email -M -1 --to openembedded-devel@lists.openembedded.org
> --subject-prefix='meta-multimedia][PATCH'
> >
> >  You are encouraged to fork the mirror on github
> https://github.com/openembedded/meta-openembedded to share your patches,
> this is preferred for patch sets consisting of more than one patch. Other
> services like GitLab, repo.or.cz or self hosted setups are of course
> accepted as well, 'git fetch <remote>' works the same on all of them. We
> recommend github because it is free, easy to use, has been proven to be
> reliable and has a really good web GUI.
> >
> > diff --git a/meta-networking/MAINTAINERS b/meta-networking/MAINTAINERS
> > index 5c4c4ce052..77e90668c4 100644
> > --- a/meta-networking/MAINTAINERS
> > +++ b/meta-networking/MAINTAINERS
> > @@ -8,7 +8,7 @@ When sending single patches, please use something like:
> >
> >     git send-email -1 -M \
> >          --to openembedded-devel@lists.openembedded.org \
> > -        --subject-prefix=meta-networking][PATCH
> > +        --subject-prefix='meta-networking][PATCH'
> >
> >  You may also contact the maintainers directly.
> >
> > diff --git a/meta-perl/README b/meta-perl/README
> > index 67f291079f..2419ae2281 100644
> > --- a/meta-perl/README
> > +++ b/meta-perl/README
> > @@ -78,7 +78,7 @@ Send patches / pull requests to
> openembedded-devel@lists.openembedded.org with
> >  '[meta-perl]' in the subject.
> >
> >  When sending single patches, please using something like:
> > -'git send-email -M -1 --to openembedded-devel@lists.openembedded.org
> --subject-prefix=meta-perl][PATCH'
> > +git send-email -M -1 --to openembedded-devel@lists.openembedded.org
> --subject-prefix='meta-perl][PATCH'
> >
> >  Layer maintainers:
> >      Hongxu Jia <hongxu.jia@windriver.com>
> > @@ -90,4 +90,3 @@ License
> >  All metadata is MIT licensed unless otherwise stated. Source code
> included
> >  in tree for individual recipes is under the LICENSE stated in each
> recipe
> >  (.bb file) unless otherwise stated.
> > -
> > diff --git a/meta-python/README b/meta-python/README
> > index ca0a290d9f..df6abe0e2e 100644
> > --- a/meta-python/README
> > +++ b/meta-python/README
> > @@ -37,8 +37,8 @@ before posting.
> >  Send pull requests to openembedded-devel@lists.openembedded.org with
> >  '[meta-python]' in the subject.
> >
> > -When sending single patches, please use something like:
> > -'git send-email -M -1 --to=openembedded-devel@lists.openembedded.org
> --subject-prefix=meta-python][PATCH'
> > +When sending single patches, please use something like:
> > +git send-email -M -1 --to=openembedded-devel@lists.openembedded.org
> --subject-prefix='meta-python][PATCH'
> >
> >  Maintenance
> >  -------------------------
> > @@ -47,4 +47,3 @@ Layer Maintainers:
> >          Tim "moto-timo" Orling <TicoTimo@gmail.com>
> >          Derek Straka <derek@asterius.io>
> >          Trevor Gamblin <trevor.gamblin@windriver.com>
> > -
> > diff --git a/meta-xfce/README b/meta-xfce/README
> > index 70ad47a2d1..bbf4b2edf2 100644
> > --- a/meta-xfce/README
> > +++ b/meta-xfce/README
> > @@ -17,6 +17,6 @@ BBMASK = "meta-xfce/recipes-multimedia"
> >  Send pull requests to openembedded-devel@lists.openembedded.org with
> '[meta-xfce]' in the subject'
> >
> >  When sending single patches, please using something like:
> > -'git send-email -M -1 --to openembedded-devel@lists.openembedded.org
> --subject-prefix=meta-xfce][PATCH'
> > +git send-email -M -1 --to openembedded-devel@lists.openembedded.org
> --subject-prefix='meta-xfce][PATCH'
> >
> >  Layer maintainer: Kai Kang <kai.kang@windriver.com>
> >
> > 
> >
>
>

--000000000000d7d77505c76d1b5b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Sun, Jul 18, 2021 at 10:46 AM akuster808 &lt;<a href=3D=
"mailto:akuster808@gmail.com">akuster808@gmail.com</a>&gt; wrote:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><br>
<br>
On 7/17/21 9:08 AM, Khem Raj wrote:<br>
&gt; This ensures that cut-n-paste of this command from README will work<b=
r>
<br>
with backport ?</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">=
I think for backport we need to add branch in subject line so it does not c=
hange status quo you still have to edit the patch header=C2=A0</div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc =
solid;padding-left:1ex" dir=3D"auto"><br>
<br>
-armin<br>
&gt;<br>
&gt; Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" tar=
get=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta-filesystems/README=C2=A0 =C2=A0 =C2=A0| 3 +--<br>
&gt;=C2=A0 meta-initramfs/README=C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
&gt;=C2=A0 meta-multimedia/README=C2=A0 =C2=A0 =C2=A0 | 4 ++--<br>
&gt;=C2=A0 meta-networking/MAINTAINERS | 2 +-<br>
&gt;=C2=A0 meta-perl/README=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 3 +=
--<br>
&gt;=C2=A0 meta-python/README=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 5 ++---<=
br>
&gt;=C2=A0 meta-xfce/README=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +=
-<br>
&gt;=C2=A0 7 files changed, 9 insertions(+), 12 deletions(-)<br>
&gt;<br>
&gt; diff --git a/meta-filesystems/README b/meta-filesystems/README<br>
&gt; index edcf8bfeef..78a4429ce2 100644<br>
&gt; --- a/meta-filesystems/README<br>
&gt; +++ b/meta-filesystems/README<br>
&gt; @@ -30,7 +30,7 @@ When sending single patches, please use something l=
ike:<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0git send-email -1 -M \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --to <a href=3D"mailto:openembedded=
-devel@lists.openembedded.org" target=3D"_blank">openembedded-devel@lists.o=
penembedded.org</a> \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 --subject-prefix=3Dmeta-filesystems][PAT=
CH<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 --subject-prefix=3D&#39;meta-filesystems=
][PATCH&#39;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 <br>
&gt;=C2=A0 Table of Contents<br>
&gt; @@ -99,4 +99,3 @@ II. Misc<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 --- xfsprogs ---<br>
&gt;=C2=A0 =C2=A0 It provides XFS filesystem utilities.<br>
&gt; -<br>
&gt; diff --git a/meta-initramfs/README b/meta-initramfs/README<br>
&gt; index 79244d43f0..a8f17ba859 100644<br>
&gt; --- a/meta-initramfs/README<br>
&gt; +++ b/meta-initramfs/README<br>
&gt; @@ -23,7 +23,7 @@ Send patches / pull requests to <a href=3D"mailto:o=
penembedded-devel@lists.openembedded.org" target=3D"_blank">openembedded-de=
vel@lists.openembedded.org</a><br>
&gt;=C2=A0 with &#39;[meta-initramfs]&#39; in the subject.<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 When sending single patches, please using something like:<br>
&gt; -&#39;git send-email -M -1 --to <a href=3D"mailto:openembedded-devel@=
lists.openembedded.org" target=3D"_blank">openembedded-devel@lists.openembe=
dded.org</a> --subject-prefix=3Dmeta-initramfs][PATCH&#39;<br>
&gt; +git send-email -M -1 --to <a href=3D"mailto:openembedded-devel@lists=
.openembedded.org" target=3D"_blank">openembedded-devel@lists.openembedded.=
org</a> --subject-prefix=3D&#39;meta-initramfs][PATCH&#39;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 Interm layer maintainer: Khem Raj &lt;<a href=3D"mailto:raj.khe=
m@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt;=C2=A0 <br>
&gt; diff --git a/meta-multimedia/README b/meta-multimedia/README<br>
&gt; index b4c2455a11..9c649ff87c 100644<br>
&gt; --- a/meta-multimedia/README<br>
&gt; +++ b/meta-multimedia/README<br>
&gt; @@ -9,10 +9,10 @@ layers: meta-oe<br>
&gt;=C2=A0 branch: master<br>
&gt;=C2=A0 revision: HEAD<br>
&gt;=C2=A0 <br>
&gt; -Send pull requests to <a href=3D"mailto:openembedded-devel@lists.ope=
nembedded.org" target=3D"_blank">openembedded-devel@lists.openembedded.org<=
/a> with &#39;[meta-multimedia]&#39; in the subject&#39;<br>
&gt; +Send pull requests to <a href=3D"mailto:openembedded-devel@lists.ope=
nembedded.org" target=3D"_blank">openembedded-devel@lists.openembedded.org<=
/a> with &#39;[meta-multimedia]&#39; in the subject<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 When sending single patches, please use something like:<br>
&gt; -&#39;git send-email -M -1 --to <a href=3D"mailto:openembedded-devel@=
lists.openembedded.org" target=3D"_blank">openembedded-devel@lists.openembe=
dded.org</a> --subject-prefix=3Dmeta-multimedia][PATCH<br>
&gt; +git send-email -M -1 --to <a href=3D"mailto:openembedded-devel@lists=
.openembedded.org" target=3D"_blank">openembedded-devel@lists.openembedded.=
org</a> --subject-prefix=3D&#39;meta-multimedia][PATCH&#39;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 You are encouraged to fork the mirror on github <a href=3D"http=
s://github.com/openembedded/meta-openembedded" rel=3D"noreferrer" target=3D=
"_blank">https://github.com/openembedded/meta-openembedded</a> to share you=
r patches, this is preferred for patch sets consisting of more than one pat=
ch. Other services like GitLab, <a href=3D"http://repo.or.cz" rel=3D"norefe=
rrer" target=3D"_blank">repo.or.cz</a> or self hosted setups are of course =
accepted as well, &#39;git fetch &lt;remote&gt;&#39; works the same on all =
of them. We recommend github because it is free, easy to use, has been prov=
en to be reliable and has a really good web GUI.<br>
&gt;=C2=A0 <br>
&gt; diff --git a/meta-networking/MAINTAINERS b/meta-networking/MAINTAINER=
S<br>
&gt; index 5c4c4ce052..77e90668c4 100644<br>
&gt; --- a/meta-networking/MAINTAINERS<br>
&gt; +++ b/meta-networking/MAINTAINERS<br>
&gt; @@ -8,7 +8,7 @@ When sending single patches, please use something lik=
e:<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0git send-email -1 -M \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --to <a href=3D"mailto:openembedded=
-devel@lists.openembedded.org" target=3D"_blank">openembedded-devel@lists.o=
penembedded.org</a> \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 --subject-prefix=3Dmeta-networking][PATC=
H<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 --subject-prefix=3D&#39;meta-networking]=
[PATCH&#39;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 You may also contact the maintainers directly.<br>
&gt;=C2=A0 <br>
&gt; diff --git a/meta-perl/README b/meta-perl/README<br>
&gt; index 67f291079f..2419ae2281 100644<br>
&gt; --- a/meta-perl/README<br>
&gt; +++ b/meta-perl/README<br>
&gt; @@ -78,7 +78,7 @@ Send patches / pull requests to <a href=3D"mailto:o=
penembedded-devel@lists.openembedded.org" target=3D"_blank">openembedded-de=
vel@lists.openembedded.org</a> with<br>
&gt;=C2=A0 &#39;[meta-perl]&#39; in the subject.<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 When sending single patches, please using something like:<br>
&gt; -&#39;git send-email -M -1 --to <a href=3D"mailto:openembedded-devel@=
lists.openembedded.org" target=3D"_blank">openembedded-devel@lists.openembe=
dded.org</a> --subject-prefix=3Dmeta-perl][PATCH&#39;<br>
&gt; +git send-email -M -1 --to <a href=3D"mailto:openembedded-devel@lists=
.openembedded.org" target=3D"_blank">openembedded-devel@lists.openembedded.=
org</a> --subject-prefix=3D&#39;meta-perl][PATCH&#39;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 Layer maintainers:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Hongxu Jia &lt;<a href=3D"mailto:hongxu.jia@windr=
iver.com" target=3D"_blank">hongxu.jia@windriver.com</a>&gt;<br>
&gt; @@ -90,4 +90,3 @@ License<br>
&gt;=C2=A0 All metadata is MIT licensed unless otherwise stated. Source co=
de included<br>
&gt;=C2=A0 in tree for individual recipes is under the LICENSE stated in e=
ach recipe<br>
&gt;=C2=A0 (.bb file) unless otherwise stated.<br>
&gt; -<br>
&gt; diff --git a/meta-python/README b/meta-python/README<br>
&gt; index ca0a290d9f..df6abe0e2e 100644<br>
&gt; --- a/meta-python/README<br>
&gt; +++ b/meta-python/README<br>
&gt; @@ -37,8 +37,8 @@ before posting.<br>
&gt;=C2=A0 Send pull requests to <a href=3D"mailto:openembedded-devel@list=
s.openembedded.org" target=3D"_blank">openembedded-devel@lists.openembedded=
.org</a> with<br>
&gt;=C2=A0 &#39;[meta-python]&#39; in the subject.<br>
&gt;=C2=A0 <br>
&gt; -When sending single patches, please use something like: <br>
&gt; -&#39;git send-email -M -1 --to=3D<a href=3D"mailto:openembedded-deve=
l@lists.openembedded.org" target=3D"_blank">openembedded-devel@lists.openem=
bedded.org</a> --subject-prefix=3Dmeta-python][PATCH&#39;<br>
&gt; +When sending single patches, please use something like:<br>
&gt; +git send-email -M -1 --to=3D<a href=3D"mailto:openembedded-devel@lis=
ts.openembedded.org" target=3D"_blank">openembedded-devel@lists.openembedde=
d.org</a> --subject-prefix=3D&#39;meta-python][PATCH&#39;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 Maintenance<br>
&gt;=C2=A0 -------------------------<br>
&gt; @@ -47,4 +47,3 @@ Layer Maintainers:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Tim &quot;moto-timo&quot; Orling &l=
t;<a href=3D"mailto:TicoTimo@gmail.com" target=3D"_blank">TicoTimo@gmail.co=
m</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Derek Straka &lt;<a href=3D"mailto:=
derek@asterius.io" target=3D"_blank">derek@asterius.io</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Trevor Gamblin &lt;<a href=3D"mailt=
o:trevor.gamblin@windriver.com" target=3D"_blank">trevor.gamblin@windriver.=
com</a>&gt;<br>
&gt; -<br>
&gt; diff --git a/meta-xfce/README b/meta-xfce/README<br>
&gt; index 70ad47a2d1..bbf4b2edf2 100644<br>
&gt; --- a/meta-xfce/README<br>
&gt; +++ b/meta-xfce/README<br>
&gt; @@ -17,6 +17,6 @@ BBMASK =3D &quot;meta-xfce/recipes-multimedia&quot;=
<br>
&gt;=C2=A0 Send pull requests to <a href=3D"mailto:openembedded-devel@list=
s.openembedded.org" target=3D"_blank">openembedded-devel@lists.openembedded=
.org</a> with &#39;[meta-xfce]&#39; in the subject&#39;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 When sending single patches, please using something like:<br>
&gt; -&#39;git send-email -M -1 --to <a href=3D"mailto:openembedded-devel@=
lists.openembedded.org" target=3D"_blank">openembedded-devel@lists.openembe=
dded.org</a> --subject-prefix=3Dmeta-xfce][PATCH&#39;<br>
&gt; +git send-email -M -1 --to <a href=3D"mailto:openembedded-devel@lists=
.openembedded.org" target=3D"_blank">openembedded-devel@lists.openembedded.=
org</a> --subject-prefix=3D&#39;meta-xfce][PATCH&#39;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 Layer maintainer: Kai Kang &lt;<a href=3D"mailto:kai.kang@windr=
iver.com" target=3D"_blank">kai.kang@windriver.com</a>&gt;<br>
&gt;<br>
&gt; <br>
&gt;<br>
<br>
</blockquote></div></div>

--000000000000d7d77505c76d1b5b--
