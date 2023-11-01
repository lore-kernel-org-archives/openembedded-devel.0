Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E945BC4332F
	for <webhook@archiver.kernel.org>; Wed,  1 Nov 2023 03:56:26 +0000 (UTC)
Received: from m43-12.mailgun.net (m43-12.mailgun.net [69.72.43.12])
 by mx.groups.io with SMTP id smtpd.web11.49637.1698810981311462972
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 31 Oct 2023 20:56:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@asterius.io header.s=mailo header.b=MIdjzDux;
 spf=pass (domain: asterius.io, ip: 69.72.43.12, mailfrom: bounce+4d9b4d.3a5685-openembedded-devel=lists.openembedded.org@asterius.io)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=asterius.io;
 q=dns/txt; s=mailo; t=1698810980; x=1698818180; h=Content-Type: Cc: To: To:
 Subject: Subject: Message-ID: Date: From: From: In-Reply-To: References:
 MIME-Version: Sender: Sender;
 bh=3FO00kMeAiLuW1Diz0bQQ/ItuZ2+EA6MAVYY9XEhgzo=;
 b=MIdjzDuxv/IpH2kKpUHMg5kE8svnOUvLRL1hDPAR2hwon9gq2EwFcgebzC7Z45HB/3nMqyWiDCwMLK/GZ5VB4q7Qaua6szCG2ShPHaTMDe8aZRjMLxFaQoiMwqRchnDqIXnUa8hQO+lZmVfztS5HIijgeDmCNWzB8wEW6+bzbk8=
X-Mailgun-Sending-Ip: 69.72.43.12
X-Mailgun-Sid: WyIzN2NkMyIsIm9wZW5lbWJlZGRlZC1kZXZlbEBsaXN0cy5vcGVuZW1iZWRkZWQub3JnIiwiM2E1Njg1Il0=
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45]) by
 8e6b9d8bf5b2 with SMTP id 6541cc64c0b64ec560f18383 (version=TLS1.3,
 cipher=TLS_AES_128_GCM_SHA256); Wed, 01 Nov 2023 03:56:20 GMT
Sender: derek@asterius.io
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-9d216597f64so548176466b.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 31 Oct 2023 20:56:20 -0700 (PDT)
X-Gm-Message-State: AOJu0YynQwf/KCmrZP7GEzvulckk0NiJfCoARt3nrOcEZZKx3lJvH7sb
	mPbsplZ3zF7FTayRhy3Au6ryhr/yndv8/DBGhH0=
X-Google-Smtp-Source: AGHT+IEoiIpti5qO/4qOU4Y4fLiWcMhOua0xWdIaXQJTA3n8JCGs5Z25A3IPHx6dYD0zcXINkJXxYLnsKewHkJL0AMA=
X-Received: by 2002:a17:906:db0d:b0:9d3:ccd1:a922 with SMTP id
 xj13-20020a170906db0d00b009d3ccd1a922mr862964ejb.58.1698810979584; Tue, 31
 Oct 2023 20:56:19 -0700 (PDT)
MIME-Version: 1.0
References: <20230929213521.2140103-1-derek@asterius.io> <9963595d-863c-bf40-4b6e-65310524e932@windriver.com>
 <CAMKF1sqBa2zX4eLgAssL0OoWgW+zkmmShzqRig7rXy_igit9bg@mail.gmail.com>
In-Reply-To: <CAMKF1sqBa2zX4eLgAssL0OoWgW+zkmmShzqRig7rXy_igit9bg@mail.gmail.com>
From: Derek Straka <derek@asterius.io>
Date: Tue, 31 Oct 2023 22:56:08 -0500
X-Gmail-Original-Message-ID: <CADNbA1pGVinKu+K3=-p=6091wz1=VCb3rqSMon62V6NwUjkZhA@mail.gmail.com>
Message-ID: <CADNbA1pGVinKu+K3=-p=6091wz1=VCb3rqSMon62V6NwUjkZhA@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH] python3-nacl: Add recipe for the latest
 release of PyNaCl
To: Khem Raj <raj.khem@gmail.com>
Cc: Kai <kai.kang@windriver.com>, openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000fa92d106090f4031"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 01 Nov 2023 03:56:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105812

--000000000000fa92d106090f4031
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Works for me.  I'd personally prefer to keep it in meta-python since I'd
rather not create a meta-virtualization dependency for my personal project,
but I can be persuaded if it creates more work for others.

On Tue, Oct 31, 2023 at 10:49=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrot=
e:

> On Tue, Oct 31, 2023 at 7:32=E2=80=AFPM Kai <kai.kang@windriver.com> wrot=
e:
> >
> > On 9/30/23 05:35, Derek Straka wrote:
> > > Signed-off-by: Derek Straka <derek@asterius.io>
> > > ---
> > >   .../python/python3-nacl_1.5.0.bb              | 25
> +++++++++++++++++++
> > >   1 file changed, 25 insertions(+)
> > >   create mode 100644 meta-python/recipes-devtools/python/
> python3-nacl_1.5.0.bb
> > >
> > > diff --git a/meta-python/recipes-devtools/python/python3-nacl_1.5.0.b=
b
> b/meta-python/recipes-devtools/python/python3-nacl_1.5.0.bb
> > > new file mode 100644
> > > index 000000000..7d5292745
> > > --- /dev/null
> > > +++ b/meta-python/recipes-devtools/python/python3-nacl_1.5.0.bb
> > > @@ -0,0 +1,25 @@
> > > +SUMMARY =3D "Python binding to the Networking and Cryptography (NaCl=
)
> library"
> > > +HOMEPAGE =3D "https://github.com/pyca/pynacl"
> > > +LICENSE =3D "Apache-2.0"
> > > +LIC_FILES_CHKSUM =3D
> "file://LICENSE;md5=3D8cc789b082b3d97e1ccc5261f8594d3f"
> > > +
> > > +PYPI_PACKAGE =3D "PyNaCl"
> >
> > It is exactly the same recipe with name python3-nacl_1.5.0.bb in the
> > same directory. And I suggest to
> > remove one of them and let the other one rprovides it if needed.
>
> this seems fine to me. Please send a patch to remove old recipe and
> add PROVIDES to new one
>
> >
> > Regards,
> > Kai
> >
> >
> > > +
> > > +inherit pypi setuptools3
> > > +
> > > +SRC_URI[sha256sum] =3D
> "8ac7448f09ab85811607bdd21ec2464495ac8b7c66d146bf545b0f08fb9220ba"
> > > +
> > > +DEPENDS +=3D "\
> > > +    libsodium \
> > > +    python3-cffi-native \
> > > +    python3-pip-native \
> > > +"
> > > +
> > > +RDEPENDS:${PN}:class-target +=3D " \
> > > +    python3-cffi \
> > > +    python3-pycparser \
> > > +"
> > > +
> > > +export SODIUM_INSTALL =3D "system"
> > > +
> > > +BBCLASSEXTEND =3D "native"
> > > \ No newline at end of file
> > >
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > Links: You receive all messages sent to this group.
> > > View/Reply Online (#105272):
> https://lists.openembedded.org/g/openembedded-devel/message/105272
> > > Mute This Topic: https://lists.openembedded.org/mt/101667089/3616933
> > > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsu=
b
> [kai.kang@eng.windriver.com]
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > >
> >
> > --
> > Kai Kang
> > Wind River Linux
> >
>

--000000000000fa92d106090f4031
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Works for me.=C2=A0 I&#39;d personally prefer to keep it i=
n meta-python since I&#39;d rather not create a meta-virtualization=C2=A0de=
pendency for my=C2=A0personal=C2=A0project, but I can be persuaded if it cr=
eates more work for=C2=A0others.</div><br><div class=3D"gmail_quote"><div d=
ir=3D"ltr" class=3D"gmail_attr">On Tue, Oct 31, 2023 at 10:49=E2=80=AFPM Kh=
em Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Tue, =
Oct 31, 2023 at 7:32=E2=80=AFPM Kai &lt;<a href=3D"mailto:kai.kang@windrive=
r.com" target=3D"_blank">kai.kang@windriver.com</a>&gt; wrote:<br>
&gt;<br>
&gt; On 9/30/23 05:35, Derek Straka wrote:<br>
&gt; &gt; Signed-off-by: Derek Straka &lt;<a href=3D"mailto:derek@asterius.=
io" target=3D"_blank">derek@asterius.io</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 =C2=A0.../python/<a href=3D"http://python3-nacl_1.5.0.bb" r=
el=3D"noreferrer" target=3D"_blank">python3-nacl_1.5.0.bb</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 25 +++++++++++++++++++<br>
&gt; &gt;=C2=A0 =C2=A01 file changed, 25 insertions(+)<br>
&gt; &gt;=C2=A0 =C2=A0create mode 100644 meta-python/recipes-devtools/pytho=
n/<a href=3D"http://python3-nacl_1.5.0.bb" rel=3D"noreferrer" target=3D"_bl=
ank">python3-nacl_1.5.0.bb</a><br>
&gt; &gt;<br>
&gt; &gt; diff --git a/meta-python/recipes-devtools/python/<a href=3D"http:=
//python3-nacl_1.5.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-nacl_=
1.5.0.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://python=
3-nacl_1.5.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-nacl_1.5.0.bb=
</a><br>
&gt; &gt; new file mode 100644<br>
&gt; &gt; index 000000000..7d5292745<br>
&gt; &gt; --- /dev/null<br>
&gt; &gt; +++ b/meta-python/recipes-devtools/python/<a href=3D"http://pytho=
n3-nacl_1.5.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-nacl_1.5.0.b=
b</a><br>
&gt; &gt; @@ -0,0 +1,25 @@<br>
&gt; &gt; +SUMMARY =3D &quot;Python binding to the Networking and Cryptogra=
phy (NaCl) library&quot;<br>
&gt; &gt; +HOMEPAGE =3D &quot;<a href=3D"https://github.com/pyca/pynacl" re=
l=3D"noreferrer" target=3D"_blank">https://github.com/pyca/pynacl</a>&quot;=
<br>
&gt; &gt; +LICENSE =3D &quot;Apache-2.0&quot;<br>
&gt; &gt; +LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D8cc789b082b3d97e=
1ccc5261f8594d3f&quot;<br>
&gt; &gt; +<br>
&gt; &gt; +PYPI_PACKAGE =3D &quot;PyNaCl&quot;<br>
&gt;<br>
&gt; It is exactly the same recipe with name <a href=3D"http://python3-nacl=
_1.5.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-nacl_1.5.0.bb</a> i=
n the<br>
&gt; same directory. And I suggest to<br>
&gt; remove one of them and let the other one rprovides it if needed.<br>
<br>
this seems fine to me. Please send a patch to remove old recipe and<br>
add PROVIDES to new one<br>
<br>
&gt;<br>
&gt; Regards,<br>
&gt; Kai<br>
&gt;<br>
&gt;<br>
&gt; &gt; +<br>
&gt; &gt; +inherit pypi setuptools3<br>
&gt; &gt; +<br>
&gt; &gt; +SRC_URI[sha256sum] =3D &quot;8ac7448f09ab85811607bdd21ec2464495a=
c8b7c66d146bf545b0f08fb9220ba&quot;<br>
&gt; &gt; +<br>
&gt; &gt; +DEPENDS +=3D &quot;\<br>
&gt; &gt; +=C2=A0 =C2=A0 libsodium \<br>
&gt; &gt; +=C2=A0 =C2=A0 python3-cffi-native \<br>
&gt; &gt; +=C2=A0 =C2=A0 python3-pip-native \<br>
&gt; &gt; +&quot;<br>
&gt; &gt; +<br>
&gt; &gt; +RDEPENDS:${PN}:class-target +=3D &quot; \<br>
&gt; &gt; +=C2=A0 =C2=A0 python3-cffi \<br>
&gt; &gt; +=C2=A0 =C2=A0 python3-pycparser \<br>
&gt; &gt; +&quot;<br>
&gt; &gt; +<br>
&gt; &gt; +export SODIUM_INSTALL =3D &quot;system&quot;<br>
&gt; &gt; +<br>
&gt; &gt; +BBCLASSEXTEND =3D &quot;native&quot;<br>
&gt; &gt; \ No newline at end of file<br>
&gt; &gt;<br>
&gt; &gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; &gt; Links: You receive all messages sent to this group.<br>
&gt; &gt; View/Reply Online (#105272): <a href=3D"https://lists.openembedde=
d.org/g/openembedded-devel/message/105272" rel=3D"noreferrer" target=3D"_bl=
ank">https://lists.openembedded.org/g/openembedded-devel/message/105272</a>=
<br>
&gt; &gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/101=
667089/3616933" rel=3D"noreferrer" target=3D"_blank">https://lists.openembe=
dded.org/mt/101667089/3616933</a><br>
&gt; &gt; Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.o=
penembedded.org" target=3D"_blank">openembedded-devel+owner@lists.openembed=
ded.org</a><br>
&gt; &gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembe=
dded-devel/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openem=
bedded.org/g/openembedded-devel/unsub</a> [<a href=3D"mailto:kai.kang@eng.w=
indriver.com" target=3D"_blank">kai.kang@eng.windriver.com</a>]<br>
&gt; &gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; &gt;<br>
&gt;<br>
&gt; --<br>
&gt; Kai Kang<br>
&gt; Wind River Linux<br>
&gt;<br>
</blockquote></div>

--000000000000fa92d106090f4031--

