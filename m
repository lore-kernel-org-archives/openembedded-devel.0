Return-Path: <andrea.ricchi@amarulasolutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF97AF3380D
	for <webhook@archiver.kernel.org>; Tue, 17 Mar 2026 08:09:38 +0000 (UTC)
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.71203.1773734976977439745
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Mar 2026 01:09:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amarulasolutions.com header.s=google header.b=p4ZXGW4m;
 spf=pass (domain: amarulasolutions.com, ip: 209.85.217.45, mailfrom: andrea.ricchi@amarulasolutions.com)
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-5fff77ff6ddso990342137.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 17 Mar 2026 01:09:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773734976; cv=none;
        d=google.com; s=arc-20240605;
        b=Keky3ezEikMKOzJNMX/4R+keh2naBMgiXFcFc9VJG4nXHwsU5f/gbmTU2p+Tm3oNQk
         L/0P79EGiEUGxTJU+IVVyqVq29orx1IFywWWTHWYVi84SRzI+2XYJW743+8pPrA8MPiQ
         +7uTBoQ4KXXIDLWottSLzZz8mo+qHvzDIU5/QhDt/qM3YzDoOvsE94Y+AtaS0td5wUzH
         xt8MUW25crng8Wnkyi+PjlDXkCJJ5G+HJcBJ3s+f4oqkAQMMsmKf5rMRO4PyAjR8lTpZ
         wKpvFDSUWyzTxBt42Qg1eWMwdhKHKcwE7hbGFv6M9mMI25fLgjzH5O/ktrwALAY997RO
         n+qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=LesaJ+FA+1QKLNNl5r6TYC0xElPUczrGZA1rh5rwIdE=;
        fh=i0UEVGX6XKvJAmzXVKuwop3O/ShkJNeDIU5NtFbZzgQ=;
        b=AaBgyVByoOawmp7dfEE8Oyj2DWP2g+uLNDtKxYNSFMvaKt602JD+9LrelSQLyPGnz3
         7e0mTzBN9uiNakCAgb6tquduillBHlu2z6BF+Npmcgw10vZFntX1SNI1JF/Nib/kdIt4
         hfyhHcwFjWlBGyTNfo1fgxQy8gai67Rt87nqjeX/ljUCkWWCahCqaq/Wi9NaUT22PriS
         N5VBAbUkM8BcSF1LWpYvJLaJqDIVmg9n0+kvvsSICzEBvi15MCnccmpR475oF1omiXkP
         z/VKPQyVKJ1pc9Ns6ofuCFaPQ87RizfDOlaQR33Sx+wuKr0VvV6XThrp/wQJd63Zvqmy
         yhFQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1773734976; x=1774339776; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LesaJ+FA+1QKLNNl5r6TYC0xElPUczrGZA1rh5rwIdE=;
        b=p4ZXGW4mJhuAiX8+GIRzMhdjrg20btaC7gpaFE65EQuFFVhaWkPOwXcPs4PzhMheXD
         cmAr5twTV+DL5NmahT9kH0GJzizZWWgthEbtLVTwtrqmWf67jdan4x6KbAskMcBuM6PO
         ctPpyYDSGQyCE8iWnOamywD0H8vmKdzxsLnD0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773734976; x=1774339776;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LesaJ+FA+1QKLNNl5r6TYC0xElPUczrGZA1rh5rwIdE=;
        b=oGk1Bjp5D30stCP8CfL78dywD5BbVlFpSvZPvnlwc5bAyW7uaMxDOdhZJz+6iTea7c
         V1Xt7a1/Yy3y2ed4lqJbBaEk2oBm2/lNnAZlWWH8gNCNsddz7sgpXYjmXFiODeZwtM9X
         g6z3ieihj+B9vztT1S3IPNuAdN53sPSo5cCI+rYkvs6ZJlnbfM3frLSokOBHV6rBs+UR
         1EfML1pbVCPp1QhtiGM1yf2dP/tmoLKQm7uWnFrF5epedbwhVzQOsThiP4UxFfALFhMw
         b0sGv/A/tX/Hd18W+IJ51XFPej+q5suM4hz+kA9KpBDznkezziRQMiWYoLqzsVwxLhsp
         2edA==
X-Gm-Message-State: AOJu0YxTNrylENtrY695tfrOCmYMPNnJ2M0FVHXPE+oQqB36/ZdmC0Wh
	jY/f73WlTXhdQ1I+UoDCkGuMOnaCCBvAr2Aty3IJmG5HVfaS6uKutMd8QUlAvIOShzhKDZJH0+3
	0HVA63rw0dm+Cb1g2JoJhL2lv4ZfUJK+naL2aNW9ltg==
X-Gm-Gg: ATEYQzzvbDKbpsOt4LTru4VOZBCtyTk3S9lXW8oKykxqvdPahRtcco9gNe6hBClrVT/
	rV0P3zqnA0LkHWSaI6AqK33XTevE9In9lAfLO5LZUi6mdzUzx9rsfNvEUYYbYjo7zoBn/hL8hKx
	t1YWRpt1hiUlmNaxKDOkep+sPz/T2bpxbz7Dyk4TQA6rmJztXO3rQN/by+xAyuTarpByyYsySxN
	zqBEz3yoF8/HE0wCTWJIWMdXNGXNHUmoK+4kV859h3QlvmAhAgcyBWaitADwjqzFH2M/JBlTRAb
	i2Ccn+t93myKKJthZzbJrJVAYZ6Rgi5oFFr/lzU/qY/xyv7XRsOCNd8WY54rOHdCJ3uA
X-Received: by 2002:a05:6102:508d:b0:5fc:2b19:f7d9 with SMTP id
 ada2fe7eead31-6020e60e50fmr5525826137.29.1773734975789; Tue, 17 Mar 2026
 01:09:35 -0700 (PDT)
MIME-Version: 1.0
References: <20260305140340.81357-1-andrea.ricchi@amarulasolutions.com> <CA+s=J=y8DqYm75Qh3q_H7fM0KUTL2uVctiYMkCe5nH2hqriKyw@mail.gmail.com>
In-Reply-To: <CA+s=J=y8DqYm75Qh3q_H7fM0KUTL2uVctiYMkCe5nH2hqriKyw@mail.gmail.com>
From: Andrea Ricchi <andrea.ricchi@amarulasolutions.com>
Date: Tue, 17 Mar 2026 09:09:25 +0100
X-Gm-Features: AaiRm50pIIP4TS0j4UXStB7L7qXfHy-Oi0RDJ3OcJSDOepn5MoVUXsdPiTWHRnM
Message-ID: <CABNF3=aq-SV8=e2xRiGDcfRvzz2LcMUd0X3UseUpfcTjSBg5Eg@mail.gmail.com>
Subject: Re: [oe] [meta-oe,scarthgap v1 1/1] meta-oe: libcppconnman: add recipe
To: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000286ea0064d33dba9"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Mar 2026 08:09:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125305

--000000000000286ea0064d33dba9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Yes, my bad, I already sent the patch for the master branch:
https://patchwork.yoctoproject.org/project/oe/patch/20260305083021.18145-1-=
andrea.ricchi@amarulasolutions.com/

I'll archive the scarthgap one.

Thanks

On Tue, Mar 17, 2026 at 4:00=E2=80=AFAM Anuj Mittal <anuj.mittal@oss.qualco=
mm.com>
wrote:

> Hi,
>
> On Thu, Mar 5, 2026 at 10:03=E2=80=AFPM Andrea Ricchi via
> lists.openembedded.org
> <andrea.ricchi=3Damarulasolutions.com@lists.openembedded.org> wrote:
> >
> > libcppconnman is a C++ library to control ConnMan via D-Bus. It exposes
> > simple aync methods to perform all the controls that ConnMan allow via
> > D-Bus.
>
> You've tagged this patch for scarthgap but new recipes/features are
> not taken for LTS branches. Did you mean to send it for master branch?
>
> >
> > Signed-off-by: Andrea Ricchi <andrea.ricchi@amarulasolutions.com>
> > ---
> >  .../libcppconnman/libcppconnman_git.bb          | 17 +++++++++++++++++
> >  1 file changed, 17 insertions(+)
> >  create mode 100644 meta-oe/recipes-connectivity/libcppconnman/
> libcppconnman_git.bb
> >
> > diff --git a/meta-oe/recipes-connectivity/libcppconnman/
> libcppconnman_git.bb b/meta-oe/recipes-connectivity/libcppconnman/
> libcppconnman_git.bb
> > new file mode 100644
> > index 0000000000..daa32a8d48
> > --- /dev/null
> > +++ b/meta-oe/recipes-connectivity/libcppconnman/libcppconnman_git.bb
> > @@ -0,0 +1,17 @@
> > +SUMMARY =3D "Amarula libcppconnman library"
> > +LICENSE =3D "LGPL-2.1-or-later"
> > +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Da87a7059d580c45495c1218f53e=
3610d"
> > +
> > +SECTION =3D "libs"
> > +
> > +SRC_URI =3D "git://
> github.com/amarula/libcppconnman.git;protocol=3Dhttps;branch=3Dmain"
> > +SRCREV =3D "d89262c2cd7336da8ba9eb06228d422847fe4b20"
> > +
> > +inherit cmake pkgconfig
> > +
> > +DEPENDS +=3D "glib-2.0"
> > +
> > +EXTRA_OECMAKE +=3D "-DBUILD_SHARED_LIBS=3DON -DBUILD_CONNMAN=3DON"
> > +
> > +# LICENSE file
> > +FILES:${PN} +=3D "${datadir}/Amarula"
> > --
> > 2.43.0
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#124874):
> https://lists.openembedded.org/g/openembedded-devel/message/124874
> > Mute This Topic: https://lists.openembedded.org/mt/118151892/3616702
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[
> anuj.mittal@oss.qualcomm.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>

--000000000000286ea0064d33dba9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi,=C2=A0</div><div><br></div><div>Yes, my bad, I alr=
eady sent the patch for the master branch:=C2=A0<a href=3D"https://patchwor=
k.yoctoproject.org/project/oe/patch/20260305083021.18145-1-andrea.ricchi@am=
arulasolutions.com/">https://patchwork.yoctoproject.org/project/oe/patch/20=
260305083021.18145-1-andrea.ricchi@amarulasolutions.com/</a></div><div><br>=
</div><div>I&#39;ll archive the=C2=A0scarthgap one.<br><br>Thanks</div></di=
v><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" cla=
ss=3D"gmail_attr">On Tue, Mar 17, 2026 at 4:00=E2=80=AFAM Anuj Mittal &lt;<=
a href=3D"mailto:anuj.mittal@oss.qualcomm.com">anuj.mittal@oss.qualcomm.com=
</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
Hi,<br>
<br>
On Thu, Mar 5, 2026 at 10:03=E2=80=AFPM Andrea Ricchi via<br>
<a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_bla=
nk">lists.openembedded.org</a><br>
&lt;andrea.ricchi=3D<a href=3D"mailto:amarulasolutions.com@lists.openembedd=
ed.org" target=3D"_blank">amarulasolutions.com@lists.openembedded.org</a>&g=
t; wrote:<br>
&gt;<br>
&gt; libcppconnman is a C++ library to control ConnMan via D-Bus. It expose=
s<br>
&gt; simple aync methods to perform all the controls that ConnMan allow via=
<br>
&gt; D-Bus.<br>
<br>
You&#39;ve tagged this patch for scarthgap but new recipes/features are<br>
not taken for LTS branches. Did you mean to send it for master branch?<br>
<br>
&gt;<br>
&gt; Signed-off-by: Andrea Ricchi &lt;<a href=3D"mailto:andrea.ricchi@amaru=
lasolutions.com" target=3D"_blank">andrea.ricchi@amarulasolutions.com</a>&g=
t;<br>
&gt; ---<br>
&gt;=C2=A0 .../libcppconnman/<a href=3D"http://libcppconnman_git.bb" rel=3D=
"noreferrer" target=3D"_blank">libcppconnman_git.bb</a>=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 | 17 +++++++++++++++++<br>
&gt;=C2=A0 1 file changed, 17 insertions(+)<br>
&gt;=C2=A0 create mode 100644 meta-oe/recipes-connectivity/libcppconnman/<a=
 href=3D"http://libcppconnman_git.bb" rel=3D"noreferrer" target=3D"_blank">=
libcppconnman_git.bb</a><br>
&gt;<br>
&gt; diff --git a/meta-oe/recipes-connectivity/libcppconnman/<a href=3D"htt=
p://libcppconnman_git.bb" rel=3D"noreferrer" target=3D"_blank">libcppconnma=
n_git.bb</a> b/meta-oe/recipes-connectivity/libcppconnman/<a href=3D"http:/=
/libcppconnman_git.bb" rel=3D"noreferrer" target=3D"_blank">libcppconnman_g=
it.bb</a><br>
&gt; new file mode 100644<br>
&gt; index 0000000000..daa32a8d48<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-oe/recipes-connectivity/libcppconnman/<a href=3D"http://lib=
cppconnman_git.bb" rel=3D"noreferrer" target=3D"_blank">libcppconnman_git.b=
b</a><br>
&gt; @@ -0,0 +1,17 @@<br>
&gt; +SUMMARY =3D &quot;Amarula libcppconnman library&quot;<br>
&gt; +LICENSE =3D &quot;LGPL-2.1-or-later&quot;<br>
&gt; +LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3Da87a7059d580c45495c12=
18f53e3610d&quot;<br>
&gt; +<br>
&gt; +SECTION =3D &quot;libs&quot;<br>
&gt; +<br>
&gt; +SRC_URI =3D &quot;git://<a href=3D"http://github.com/amarula/libcppco=
nnman.git;protocol=3Dhttps;branch=3Dmain" rel=3D"noreferrer" target=3D"_bla=
nk">github.com/amarula/libcppconnman.git;protocol=3Dhttps;branch=3Dmain</a>=
&quot;<br>
&gt; +SRCREV =3D &quot;d89262c2cd7336da8ba9eb06228d422847fe4b20&quot;<br>
&gt; +<br>
&gt; +inherit cmake pkgconfig<br>
&gt; +<br>
&gt; +DEPENDS +=3D &quot;glib-2.0&quot;<br>
&gt; +<br>
&gt; +EXTRA_OECMAKE +=3D &quot;-DBUILD_SHARED_LIBS=3DON -DBUILD_CONNMAN=3DO=
N&quot;<br>
&gt; +<br>
&gt; +# LICENSE file<br>
&gt; +FILES:${PN} +=3D &quot;${datadir}/Amarula&quot;<br>
&gt; --<br>
&gt; 2.43.0<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#124874): <a href=3D"https://lists.openembedded.org=
/g/openembedded-devel/message/124874" rel=3D"noreferrer" target=3D"_blank">=
https://lists.openembedded.org/g/openembedded-devel/message/124874</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/11815189=
2/3616702" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.=
org/mt/118151892/3616702</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openem=
bedded.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.o=
rg</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
devel/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedde=
d.org/g/openembedded-devel/unsub</a> [<a href=3D"mailto:anuj.mittal@oss.qua=
lcomm.com" target=3D"_blank">anuj.mittal@oss.qualcomm.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</blockquote></div>

--000000000000286ea0064d33dba9--

