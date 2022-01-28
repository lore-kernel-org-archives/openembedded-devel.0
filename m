Return-Path: <limon.anibal@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFB51C433F5
	for <webhook@archiver.kernel.org>; Fri, 28 Jan 2022 02:29:58 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
 [209.85.208.174])
 by mx.groups.io with SMTP id smtpd.web12.2033.1643336997377275238
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 Jan 2022 18:29:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=FqtlEVyF;
 spf=pass (domain: gmail.com, ip: 209.85.208.174,
 mailfrom: limon.anibal@gmail.com)
Received: by mail-lj1-f174.google.com with SMTP id z20so7000276ljo.6
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 Jan 2022 18:29:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8dn+33x6SlK6ENqsvERPZMsNpjLDBFRdupSZ6MdRbqw=;
        b=FqtlEVyFRSGIFGXl9aRFOJdVReabnyNSdapTb21nSJxtjob4mYYdUxnrTZuwAff6Fi
         Wpsr/CSYodsNZA5Y0gLk1dKl9u1IWotVEx8xQ6FwCPRMVEUrneVAqx14mpmiZVh47NlP
         nIynnLD1cacehhxlFduB+pZcIzXAXlVAuWKdNI44jZS830FAmkbJSJvU/adk+d0bJv4T
         +9kGbstzi3cU0tofJSJ4hEcJS9c4J+4T3qxsZiCxlS3hCMkAk8YsbDCRkv7cwO6Urt9G
         VQDPnSkZqurpwS5qhIlk3r3pwhhjNX4XXIAcbk4fT2GV5lhy5LE7WtOf7avJnJe8UKq0
         tSbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8dn+33x6SlK6ENqsvERPZMsNpjLDBFRdupSZ6MdRbqw=;
        b=C10U4FLUpvbfz/ErBoEE4YhXpgffdV0MKwa3aOXPXwB2BfG1TbkLrxzdA7CvgqbpP2
         /qadVJVauzuFgXNuv2acMeuvIx3f1sSRtM9Vl3SIVaWIKHzOPldsvcDnKZ5snyxItd8o
         Fe7i6hGxsuwZOLFfNxavfM5ttWasiq8OiBCnJz4sgu2pI2I9s9TykEnEk7X8OHIjCbiw
         cZUz7hfAUGQY+p4z83NC/yPl4lvNjwQBZw3GnA0cc3FuZl5rnFU7ZxanjJZcn+OIxZSn
         OWp/4+oU4xhhhBTyRpXD+5R4LgYOgL9dakoph2XbUFLfUps7oXOQ6nennoh7Kb/62uSZ
         bCog==
X-Gm-Message-State: AOAM532Ri9hVOOqEfpFtv/gY1ra2hFAn1mdOMuAl7r3ca3nfxZleJ1aS
	Sw6vZzZOFf6tGX7NmnqCnR0xzs1KE5hxgggFy8g=
X-Google-Smtp-Source: 
 ABdhPJwSMCOS5aP6P7nW7okKYRAqWYcB41qm4G0xhbZKsAoTBK2Kzd2Y59yNVLJD1OTDQawtLCFTqIACv2v0Rhr1yyw=
X-Received: by 2002:a2e:9dc2:: with SMTP id x2mr4467835ljj.202.1643336995568;
 Thu, 27 Jan 2022 18:29:55 -0800 (PST)
MIME-Version: 1.0
References: <20220128013536.2809159-1-limon.anibal@gmail.com>
 <CAMKF1sog0kc5MYaZzJ161L+g4JgFBUKjg0D4UNKNJQZKznU2Wg@mail.gmail.com>
In-Reply-To: 
 <CAMKF1sog0kc5MYaZzJ161L+g4JgFBUKjg0D4UNKNJQZKznU2Wg@mail.gmail.com>
From: =?UTF-8?Q?Anibal_Lim=C3=B3n?= <limon.anibal@gmail.com>
Date: Thu, 27 Jan 2022 20:29:44 -0600
Message-ID: 
 <CAPS-YPAzCpUkB3SP-CQ+-c9HLgxvrr7Juv3Y1ZDOL6kWkHTvRQ@mail.gmail.com>
Subject: Re: [oe] [meta-openembedded][PATCH 1/2] meta-oe/recipes-devtools: Add
 python3-apt bindings
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	=?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal@rzerosystems.com>
Content-Type: multipart/alternative; boundary="000000000000de00ca05d69b3599"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 28 Jan 2022 02:29:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95138

--000000000000de00ca05d69b3599
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 27, 2022 at 8:27 PM Khem Raj <raj.khem@gmail.com> wrote:

> On Thu, Jan 27, 2022 at 5:35 PM An?bal Lim?n <limon.anibal@gmail.com>
> wrote:
> >
> > Signed-off-by: An=C3=ADbal Lim=C3=B3n <limon.anibal@gmail.com>
> > Signed-off-by: An=C3=ADbal Lim=C3=B3n <anibal@rzerosystems.com>
> > ---
> >  .../python/python3-apt_2.3.0.bb                 | 17 +++++++++++++++++
> >  1 file changed, 17 insertions(+)
> >  create mode 100644 meta-oe/recipes-devtools/python/python3-apt_2.3.0.b=
b
> >
> > diff --git a/meta-oe/recipes-devtools/python/python3-apt_2.3.0.bb
> b/meta-oe/recipes-devtools/python/python3-apt_2.3.0.bb
> > new file mode 100644
> > index 000000000..4e7138b33
> > --- /dev/null
> > +++ b/meta-oe/recipes-devtools/python/python3-apt_2.3.0.bb
> > @@ -0,0 +1,17 @@
> > +SUMMARY =3D "Python-apt is a wrapper to use features of apt from pytho=
n."
> > +LICENSE =3D "GPLv2 & Permissive"
>
> Permissive is not a standard SPDX license. So please explain it better.
>

Yep, this is a topic, comes from debian/copyright file in the repo, next,

https://salsa.debian.org/apt-team/python-apt/-/blob/main/debian/copyright#L=
10

Any idea how to handle this?.

Regards,
Anibal


>
> > +LIC_FILES_CHKSUM =3D
> "file://COPYING.GPL;md5=3D0636e73ff0215e8d672dc4c32c317bb3 \
> > +
> file://debian/copyright;md5=3D4ed7b6862ca422678b17e7d4ed592285"
> > +
> > +SRC_URI =3D "git://
> salsa.debian.org/apt-team/python-apt.git;protocol=3Dhttps;branch=3Dmain"
> > +
> > +SRCREV =3D "6145b6484d220685edfd922d364afbf065127efe"
> > +
> > +S =3D "${WORKDIR}/git"
> > +
> > +inherit setuptools3
> > +
> > +DEPENDS +=3D "apt"
> > +RDEPENDS:${PN} +=3D "apt python3-core"
> > +
> > +FILES:${PN} =3D "/usr/lib /usr/share/python-apt"
> > --
> > 2.34.1
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#95133):
> https://lists.openembedded.org/g/openembedded-devel/message/95133
> > Mute This Topic: https://lists.openembedded.org/mt/88736517/1997914
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[
> raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>

--000000000000de00ca05d69b3599
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jan 27, 2022 at 8:27 PM Khem =
Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Thu, Jan=
 27, 2022 at 5:35 PM An?bal Lim?n &lt;<a href=3D"mailto:limon.anibal@gmail.=
com" target=3D"_blank">limon.anibal@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Signed-off-by: An=C3=ADbal Lim=C3=B3n &lt;<a href=3D"mailto:limon.anib=
al@gmail.com" target=3D"_blank">limon.anibal@gmail.com</a>&gt;<br>
&gt; Signed-off-by: An=C3=ADbal Lim=C3=B3n &lt;<a href=3D"mailto:anibal@rze=
rosystems.com" target=3D"_blank">anibal@rzerosystems.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../python/<a href=3D"http://python3-apt_2.3.0.bb" rel=3D"norefe=
rrer" target=3D"_blank">python3-apt_2.3.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 17 +++++++++++++++++<br>
&gt;=C2=A0 1 file changed, 17 insertions(+)<br>
&gt;=C2=A0 create mode 100644 meta-oe/recipes-devtools/python/<a href=3D"ht=
tp://python3-apt_2.3.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-apt=
_2.3.0.bb</a><br>
&gt;<br>
&gt; diff --git a/meta-oe/recipes-devtools/python/<a href=3D"http://python3=
-apt_2.3.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-apt_2.3.0.bb</a=
> b/meta-oe/recipes-devtools/python/<a href=3D"http://python3-apt_2.3.0.bb"=
 rel=3D"noreferrer" target=3D"_blank">python3-apt_2.3.0.bb</a><br>
&gt; new file mode 100644<br>
&gt; index 000000000..4e7138b33<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-oe/recipes-devtools/python/<a href=3D"http://python3-apt_2.=
3.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-apt_2.3.0.bb</a><br>
&gt; @@ -0,0 +1,17 @@<br>
&gt; +SUMMARY =3D &quot;Python-apt is a wrapper to use features of apt from=
 python.&quot;<br>
&gt; +LICENSE =3D &quot;GPLv2 &amp; Permissive&quot;<br>
<br>
Permissive is not a standard SPDX license. So please explain it better.<br>=
</blockquote><div><br></div><div>Yep, this is a topic, comes from debian/co=
pyright file in the repo, next,</div><div><br></div><div><a href=3D"https:/=
/salsa.debian.org/apt-team/python-apt/-/blob/main/debian/copyright#L10">htt=
ps://salsa.debian.org/apt-team/python-apt/-/blob/main/debian/copyright#L10<=
/a><br></div><div><br></div><div>Any idea how to handle this?.</div><div><b=
r></div><div>Regards,</div><div>Anibal</div><div>=C2=A0</div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">
<br>
&gt; +LIC_FILES_CHKSUM =3D &quot;file://COPYING.GPL;md5=3D0636e73ff0215e8d6=
72dc4c32c317bb3 \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 file://debian/copyright;md5=3D4ed7b6862ca422678b17e7d4ed592285&quot;<br>
&gt; +<br>
&gt; +SRC_URI =3D &quot;git://<a href=3D"http://salsa.debian.org/apt-team/p=
ython-apt.git;protocol=3Dhttps;branch=3Dmain" rel=3D"noreferrer" target=3D"=
_blank">salsa.debian.org/apt-team/python-apt.git;protocol=3Dhttps;branch=3D=
main</a>&quot;<br>
&gt; +<br>
&gt; +SRCREV =3D &quot;6145b6484d220685edfd922d364afbf065127efe&quot;<br>
&gt; +<br>
&gt; +S =3D &quot;${WORKDIR}/git&quot;<br>
&gt; +<br>
&gt; +inherit setuptools3<br>
&gt; +<br>
&gt; +DEPENDS +=3D &quot;apt&quot;<br>
&gt; +RDEPENDS:${PN} +=3D &quot;apt python3-core&quot;<br>
&gt; +<br>
&gt; +FILES:${PN} =3D &quot;/usr/lib /usr/share/python-apt&quot;<br>
&gt; --<br>
&gt; 2.34.1<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#95133): <a href=3D"https://lists.openembedded.org/=
g/openembedded-devel/message/95133" rel=3D"noreferrer" target=3D"_blank">ht=
tps://lists.openembedded.org/g/openembedded-devel/message/95133</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/88736517=
/1997914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.o=
rg/mt/88736517/1997914</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openem=
bedded.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.o=
rg</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
devel/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedde=
d.org/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com"=
 target=3D"_blank">raj.khem@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</blockquote></div></div>

--000000000000de00ca05d69b3599--

