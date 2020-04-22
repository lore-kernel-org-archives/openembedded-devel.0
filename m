Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
 by mx.groups.io with SMTP id smtpd.web11.1024.1587585650890500277
 for <Openembedded-devel@lists.openembedded.org>;
 Wed, 22 Apr 2020 13:00:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@izotope.com header.s=google header.b=GA5ULVvM;
 spf=permerror, err=parse error for token &{10 18 _spf.google.com}: limit exceeded (domain: izotope.com, ip: 209.85.128.66, mailfrom: mcampbell@izotope.com)
Received: by mail-wm1-f66.google.com with SMTP id x25so3889000wmc.0
        for <Openembedded-devel@lists.openembedded.org>; Wed, 22 Apr 2020 13:00:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=izotope.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6jWq1XvO5NcZYUz6XfWss7z/KUKyK8uuGFnHqkzbnh8=;
        b=GA5ULVvMPewpdRMLbIBG4GsSqzoJz4fwF9Zs8WBEomwLjThLOafDD79WdIAolP3jFA
         umbblJ/R9KQSsrg4MPww/IoZlcU8FCc+Bv4vUJz8rQtuFgZGpxuDNYQ5jiGz2845nE9W
         0VcACvVbFMh4HMt278CL7PF1sJcjapgXLUCKU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6jWq1XvO5NcZYUz6XfWss7z/KUKyK8uuGFnHqkzbnh8=;
        b=b2DzUN//sa1xmq1m98TxHJCbf3jYhWWssQN0feCWHkb9k2m3LNuaqWfMpwCfu9GiYI
         xjYQdsisAL3LMFqrfu6uIEOuE/zYLU0LamB9vGuDJreXZGY/1YIZnc9iBEjcGT9x5CsR
         4SocE8IzJlOYpqAg8NQ/A75JBjgUo89HaXkASX1pyaj2qw3SbNv13dMKQO4bY+BKgh4F
         xqx0Lvb+aL+6q15B0snOeKjbAdaMrcX0+0BOfSXJjztknFxEaQqau0K/0ra6wcSPdpBm
         OTQW+8HlSVk4FwN1HJFKoBiMwHFuth3s7XbTS+JBG3O1NefxTtTDRq3s5pkE3Ark9D70
         YWyQ==
X-Gm-Message-State: AGi0PuYn4nhqK0nG59z3E9NZ83lAdmQGQWWWCOn8J77EBtIgp8Li4rVH
	PJWmx0n7JcI41nvw0jF+Oa2V3T5pXov5m+FFIYSqxA==
X-Google-Smtp-Source: APiQypIHenKA4XJ2P5Lb+PIbDRvHti4R3Z6M73jurwJXFXt8EC7t6t2Aqvlqdy1axWm/pS5Oiuafs62PywxM6oIWSFY=
X-Received: by 2002:a1c:b684:: with SMTP id g126mr113320wmf.163.1587585649243;
 Wed, 22 Apr 2020 13:00:49 -0700 (PDT)
MIME-Version: 1.0
References: <CAMDowVWHvQB2HwanmKkvtrpDPG4ghzqkjHZckDuqX-LtLUC3oQ@mail.gmail.com>
 <d13de68f-554a-1681-fc05-55b22e1516b3@gmail.com>
In-Reply-To: <d13de68f-554a-1681-fc05-55b22e1516b3@gmail.com>
From: "Matt Campbell" <Mcampbell@izotope.com>
Date: Wed, 22 Apr 2020 16:00:38 -0400
Message-ID: <CAMDowVXOSR2ox6MmJT=n629-sMYt32_E51Lea6xiq1Nw4YS8iw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] sdbus-c++-tools: add nativesdk
To: Khem Raj <raj.khem@gmail.com>
Cc: Openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000ac9e4f05a3e69686"

--000000000000ac9e4f05a3e69686
Content-Type: text/plain; charset="UTF-8"

Sorry, this was my first time submitting a patch, looks like the gmail
webclient is messing things up. I'll re-submit as a v2.

On Wed, Apr 22, 2020 at 3:14 PM Khem Raj <raj.khem@gmail.com> wrote:

> This seems to be badly formatted patch. Neither patchwork nor my email
> reader can download a proper mbox for it. Please use git format-patch
> to generate it and resend.
>
> On 4/22/20 11:21 AM, Matt Campbell wrote:
> >
> > Signed-off-by: Matthew Campbell <mcampbell@izotope.com
> > <mailto:mcampbell@izotope.com>>
> > ---
> >   ...bus-c++-tools-native_0.8.1.bb <http://tools-native_0.8.1.bb> =>
> > sdbus-c++-tools_0.8.1.bb <http://tools_0.8.1.bb>} | 4 +++-
> >   1 file changed, 3 insertions(+), 1 deletion(-)
> >   rename meta-oe/recipes-core/sdbus-c++/{sdbus-c++-tools-native_0.8.1.bb
> > <http://tools-native_0.8.1.bb> => sdbus-c++-tools_0.8.1.bb
> > <http://tools_0.8.1.bb>} (89%)
> >
> > diff --git
> > a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-tools-native_0.8.1.bb
> > <http://tools-native_0.8.1.bb>
> > b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-tools_0.8.1.bb
> > <http://tools_0.8.1.bb>
> > similarity index 89%
> > rename from
> > meta-oe/recipes-core/sdbus-c++/sdbus-c++-tools-native_0.8.1.bb
> > <http://tools-native_0.8.1.bb>
> > rename to meta-oe/recipes-core/sdbus-c++/sdbus-c++-tools_0.8.1.bb
> > <http://tools_0.8.1.bb>
> > index e18b9903d..9eaec0f2a 100644
> > --- a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-tools-native_0.8.1.bb
> > <http://tools-native_0.8.1.bb>
> > +++ b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-tools_0.8.1.bb
> > <http://tools_0.8.1.bb>
> > @@ -4,7 +4,7 @@ DESCRIPTION = "Native interface code generator for
> > development with sdbus-c++"
> >   LICENSE = "LGPLv2.1"
> >   LIC_FILES_CHKSUM =
> > "file://${S}/COPYING;md5=1803fa9c2c3ce8cb06b4861d75310742"
> >
> > -inherit cmake native
> > +inherit cmake
> >
> >   DEPENDS += "expat"
> >
> > @@ -12,3 +12,5 @@ SRCREV = "3a4f343fb924650e7639660efa5f143961162044"
> >   SRC_URI =
> > "git://
> github.com/Kistler-Group/sdbus-cpp.git;protocol=https;branch=master;subpath=tools
> > <
> http://github.com/Kistler-Group/sdbus-cpp.git;protocol=https;branch=master;subpath=tools
> >"
> >
> >   S = "${WORKDIR}/tools"
> > +
> > +BBCLASSEXTEND = "native nativesdk"
> > --
> > 2.20.1
> >
> >
> > 
> >
>


-- 
Matthew Campbell
Senior Embedded Systems Engineer
mcampbell@izotope.com

iZotope, Inc.
www.izotope.com

--000000000000ac9e4f05a3e69686
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Sorry, this was my first time submitting a patch, looks li=
ke the gmail webclient is messing=C2=A0things up. I&#39;ll re-submit as a v=
2.</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr=
">On Wed, Apr 22, 2020 at 3:14 PM Khem Raj &lt;<a href=3D"mailto:raj.khem@g=
mail.com">raj.khem@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">This seems to be badly formatted patch. Neither=
 patchwork nor my email <br>
reader can download a proper mbox for it. Please use git format-patch<br>
to generate it and resend.<br>
<br>
On 4/22/20 11:21 AM, Matt Campbell wrote:<br>
&gt; <br>
&gt; Signed-off-by: Matthew Campbell &lt;<a href=3D"mailto:mcampbell@izoto=
pe.com" target=3D"_blank">mcampbell@izotope.com</a> <br>
&gt; &lt;mailto:<a href=3D"mailto:mcampbell@izotope.com" target=3D"_blank"=
>mcampbell@izotope.com</a>&gt;&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0...bus-c++-<a href=3D"http://tools-native_0.8.1.bb" rel=
=3D"noreferrer" target=3D"_blank">tools-native_0.8.1.bb</a> &lt;<a href=3D=
"http://tools-native_0.8.1.bb" rel=3D"noreferrer" target=3D"_blank">http://=
tools-native_0.8.1.bb</a>&gt; =3D&gt; <br>
&gt; sdbus-c++-<a href=3D"http://tools_0.8.1.bb" rel=3D"noreferrer" target=
=
=3D"_blank">tools_0.8.1.bb</a> &lt;<a href=3D"http://tools_0.8.1.bb" rel=
=3D"noreferrer" target=3D"_blank">http://tools_0.8.1.bb</a>&gt;} | 4 +++-<=
br>
&gt;=C2=A0 =C2=A01 file changed, 3 insertions(+), 1 deletion(-)<br>
&gt;=C2=A0 =C2=A0rename meta-oe/recipes-core/sdbus-c++/{sdbus-c++-<a href=
=3D"http://tools-native_0.8.1.bb" rel=3D"noreferrer" target=3D"_blank">too=
ls-native_0.8.1.bb</a> <br>
&gt; &lt;<a href=3D"http://tools-native_0.8.1.bb" rel=3D"noreferrer" targe=
t=3D"_blank">http://tools-native_0.8.1.bb</a>&gt; =3D&gt; sdbus-c++-<a href=
=
=3D"http://tools_0.8.1.bb" rel=3D"noreferrer" target=3D"_blank">tools_0.8.=
1.bb</a> <br>
&gt; &lt;<a href=3D"http://tools_0.8.1.bb" rel=3D"noreferrer" target=3D"_b=
lank">http://tools_0.8.1.bb</a>&gt;} (89%)<br>
&gt; <br>
&gt; diff --git <br>
&gt; a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-<a href=3D"http://tools-na=
tive_0.8.1.bb" rel=3D"noreferrer" target=3D"_blank">tools-native_0.8.1.bb</=
a> <br>
&gt; &lt;<a href=3D"http://tools-native_0.8.1.bb" rel=3D"noreferrer" targe=
t=3D"_blank">http://tools-native_0.8.1.bb</a>&gt; <br>
&gt; b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-<a href=3D"http://tools_0.=
8.1.bb" rel=3D"noreferrer" target=3D"_blank">tools_0.8.1.bb</a> <br>
&gt; &lt;<a href=3D"http://tools_0.8.1.bb" rel=3D"noreferrer" target=3D"_b=
lank">http://tools_0.8.1.bb</a>&gt;<br>
&gt; similarity index 89%<br>
&gt; rename from <br>
&gt; meta-oe/recipes-core/sdbus-c++/sdbus-c++-<a href=3D"http://tools-nati=
ve_0.8.1.bb" rel=3D"noreferrer" target=3D"_blank">tools-native_0.8.1.bb</a>=
 <br>
&gt; &lt;<a href=3D"http://tools-native_0.8.1.bb" rel=3D"noreferrer" targe=
t=3D"_blank">http://tools-native_0.8.1.bb</a>&gt;<br>
&gt; rename to meta-oe/recipes-core/sdbus-c++/sdbus-c++-<a href=3D"http://=
tools_0.8.1.bb" rel=3D"noreferrer" target=3D"_blank">tools_0.8.1.bb</a> <br=
>
&gt; &lt;<a href=3D"http://tools_0.8.1.bb" rel=3D"noreferrer" target=3D"_b=
lank">http://tools_0.8.1.bb</a>&gt;<br>
&gt; index e18b9903d..9eaec0f2a 100644<br>
&gt; --- a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-<a href=3D"http://tool=
s-native_0.8.1.bb" rel=3D"noreferrer" target=3D"_blank">tools-native_0.8.1.=
bb</a> <br>
&gt; &lt;<a href=3D"http://tools-native_0.8.1.bb" rel=3D"noreferrer" targe=
t=3D"_blank">http://tools-native_0.8.1.bb</a>&gt;<br>
&gt; +++ b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-<a href=3D"http://tool=
s_0.8.1.bb" rel=3D"noreferrer" target=3D"_blank">tools_0.8.1.bb</a> <br>
&gt; &lt;<a href=3D"http://tools_0.8.1.bb" rel=3D"noreferrer" target=3D"_b=
lank">http://tools_0.8.1.bb</a>&gt;<br>
&gt; @@ -4,7 +4,7 @@ DESCRIPTION =3D &quot;Native interface code generator=
 for <br>
&gt; development with sdbus-c++&quot;<br>
&gt;=C2=A0 =C2=A0LICENSE =3D &quot;LGPLv2.1&quot;<br>
&gt;=C2=A0 =C2=A0LIC_FILES_CHKSUM =3D <br>
&gt; &quot;file://${S}/COPYING;md5=3D1803fa9c2c3ce8cb06b4861d75310742&quot=
;<br>
&gt; <br>
&gt; -inherit cmake native<br>
&gt; +inherit cmake<br>
&gt; <br>
&gt;=C2=A0 =C2=A0DEPENDS +=3D &quot;expat&quot;<br>
&gt; <br>
&gt; @@ -12,3 +12,5 @@ SRCREV =3D &quot;3a4f343fb924650e7639660efa5f143961=
162044&quot;<br>
&gt;=C2=A0 =C2=A0SRC_URI =3D <br>
&gt; &quot;git://<a href=3D"http://github.com/Kistler-Group/sdbus-cpp.git;=
protocol=3Dhttps;branch=3Dmaster;subpath=3Dtools" rel=3D"noreferrer" target=
=
=3D"_blank">github.com/Kistler-Group/sdbus-cpp.git;protocol=3Dhttps;branch=
=
=3Dmaster;subpath=3Dtools</a> <br>
&gt; &lt;<a href=3D"http://github.com/Kistler-Group/sdbus-cpp.git;protocol=
=
=3Dhttps;branch=3Dmaster;subpath=3Dtools" rel=3D"noreferrer" target=3D"_bl=
ank">http://github.com/Kistler-Group/sdbus-cpp.git;protocol=3Dhttps;branch=
=3Dmaster;subpath=3Dtools</a>&gt;&quot;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0S =3D &quot;${WORKDIR}/tools&quot;<br>
&gt; +<br>
&gt; +BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
&gt; --<br>
&gt; 2.20.1<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr=
" class=3D"gmail_signature"><div dir=3D"ltr">Matthew Campbell<div>Senior Em=
bedded Systems Engineer</div><div><a href=3D"mailto:mcampbell@izotope.com" =
target=3D"_blank">mcampbell@izotope.com</a></div><div><br></div><div>iZotop=
e, Inc.</div><div><a href=3D"http://www.izotope.com" target=3D"_blank">www.=
izotope.com</a></div></div></div>

--000000000000ac9e4f05a3e69686--
