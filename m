Return-Path: <bindudaniel1996@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73687C77B61
	for <webhook@archiver.kernel.org>; Thu, 13 Apr 2023 07:03:01 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web10.6591.1681369377019141432
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Apr 2023 00:02:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=FWV/ph9k;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: bindudaniel1996@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1a667067275so3631945ad.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Apr 2023 00:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681369376; x=1683961376;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9DJMKOyHAXPQA0LT1gvCahgKkdAQfvXR8sXF3zN0VvE=;
        b=FWV/ph9kNNY95x1PJRq1W6+sW7xUy04rGZffPdsViGoXFkAoA71qE7NOb9kkOUBLVM
         0t752aO0LxnczHkHuqWck+2LP2Jvat4gpVDfWeEsRXeKFLJtGcli8lJGX5Bjcm5/eta5
         0OBAU+yT4/NIufeJzV1ZijmsEvTLUNSOcKhKWnAhVXQQyh0/z7IpUQzGhCLTAGSWsLTB
         F++C2rUOTf/SpJj8QDR19R1/0tGvsw6Gy5mb1a37qnykItrhJmDRa8W8oeC2EcloMZYR
         vRJYzF7JZfrk2IW1jEXIy3vbcrCwICfdijXiIPAHywldELB5BmbIweT0XZtwB4QT/U/P
         R/ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681369376; x=1683961376;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9DJMKOyHAXPQA0LT1gvCahgKkdAQfvXR8sXF3zN0VvE=;
        b=jkYTWglncwx9J3dNI4rEGViIzZOAwdLYVmtnU5CA0W/X/9NHJVA4erCFzg5QFqzvhb
         DveTkmHAa/5FFf+UXiuSTQ7Raq15PAHHMiviaz1iInxjQ1oHDi0G2Qaww2gIvdC7RrUZ
         s319DsAgJVX0KNXeia4T3rDUOyGvMIk7sHfRi1CKeYCQeaEOIRC3LGmsWPdjj3Xuv7kD
         vl2VEg3xfOw6u2lnqMA7K0wZvBuPpLzYmv15RbfPta4UcAp2dfq0Q8TgBtdT5kiN049R
         AgNnekKmfyRoqp+N1+a6PHqmvfLJko5rtE/9whmEDF2F+Mj9vJFGyYK0kTdW21Xlscud
         +A/Q==
X-Gm-Message-State: AAQBX9eWrxEiBu8oEzI887giMfy7d3BRVD7VsS7ru0Axqll80r/8UikP
	tVSs6TJz2/EBtJSzN6ZBL9OGWqjaOhlbLjjxyao=
X-Google-Smtp-Source: AKy350YnTYNyubsc5GFEiPFf8+lEHy7upRRYeWw3XCz5IkEgLF76uVqi0nx23FmTiDRQDnLJ+hDr3huzDPc8Uhi1eSs=
X-Received: by 2002:a05:6a00:2e09:b0:633:4fea:3d06 with SMTP id
 fc9-20020a056a002e0900b006334fea3d06mr737048pfb.1.1681369376015; Thu, 13 Apr
 2023 00:02:56 -0700 (PDT)
MIME-Version: 1.0
References: <20230407043845.1314587-1-bindudaniel1996@gmail.com> <1377940a-ba4f-f8a4-2032-7179c72ccb71@gmail.com>
In-Reply-To: <1377940a-ba4f-f8a4-2032-7179c72ccb71@gmail.com>
From: BINDU <bindudaniel1996@gmail.com>
Date: Thu, 13 Apr 2023 12:32:45 +0530
Message-ID: <CAFGCuZW+x0DQf6NJ_OzRPyLuaw+uqvLNuwhN_MvT=v9ogZ4uEg@mail.gmail.com>
Subject: Re: [oe][meta-oe][kirkstone][PATCH] flatbuffers: adapt for
 cross-compilation environments
To: akuster808 <akuster808@gmail.com>
Cc: openembedded-devel@lists.openembedded.org, 
	Bhabu Bindu <bhabu.bindu@kpit.com>, Ivan Stepic <Ivan.Stepic@bmw.de>
Content-Type: multipart/alternative; boundary="00000000000064c80105f93250e5"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Apr 2023 07:03:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102074

--00000000000064c80105f93250e5
Content-Type: text/plain; charset="UTF-8"

Hello @akuster808@gmail.com <akuster808@gmail.com> ,

This is fixed in a different way in master, so this doesn't need to be be
done for master.



On Fri, 7 Apr, 2023, 5:15 pm akuster808, <akuster808@gmail.com> wrote:

>
>
> On 4/7/23 12:38 AM, BINDU wrote:
> > Flatbuffers contains a library and a schema compiler. The package
> > contains cmake files to discover the libraries and the compiler tool.
> > Currently, all of these cmake files are installed into the target
> > sysroot. However, the compiler utility isn't installed into the sysroot
> > (as it is not runnable on the build machine).
> >
> > When an application that depends on flatbuffers gets built, it uses
> > flatbuffers' exported cmake targets to configure the project. One of the
> > exported targets is FlatcTarget.cmake which expects to see flatc binary
> > in /usr/bin of the sysroot. Since binaries for target don't end up in
> > target sysroot, cmake configuration fails.
> >
> > This patch addresses this problem of flatbuffers' build infrastructure
> > in cross-compiling environments. By removing FlatcTarget.cmake for
> > target builds from the sysroot we essentially skip this step of
> > flatbuffers' configuration.
>
> Does this need to be done in Master as well?
>
> -armin
> >
> > Signed-off-by: Ivan Stepic <Ivan.Stepic@bmw.de>
> > Signed-off-by: Bhabu Bindu <bindudaniel1996@gmail.com>
> > ---
> >   meta-oe/recipes-devtools/flatbuffers/flatbuffers_2.0.0.bb | 7 ++++++-
> >   1 file changed, 6 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta-oe/recipes-devtools/flatbuffers/flatbuffers_2.0.0.bb
> b/meta-oe/recipes-devtools/flatbuffers/flatbuffers_2.0.0.bb
> > index bf74f1229..44478ea0b 100644
> > --- a/meta-oe/recipes-devtools/flatbuffers/flatbuffers_2.0.0.bb
> > +++ b/meta-oe/recipes-devtools/flatbuffers/flatbuffers_2.0.0.bb
> > @@ -25,12 +25,17 @@ BUILD_CXXFLAGS += "-fPIC"
> >   # BUILD_TYPE=Release is required, otherwise flatc is not installed
> >   EXTRA_OECMAKE += "\
> >       -DCMAKE_BUILD_TYPE=Release \
> > -    -DFLATBUFFERS_BUILD_TESTS=OFF \
> > +    -DFLATBUFFERS_BUILD_TESTS=OFF \
> >       -DFLATBUFFERS_BUILD_SHAREDLIB=ON \
> >   "
> >
> >   inherit cmake
> >
> > +rm_flatc_cmaketarget_for_target() {
> > +    rm -f
> "${SYSROOT_DESTDIR}/${libdir}/cmake/flatbuffers/FlatcTargets.cmake"
> > +}
> > +SYSROOT_PREPROCESS_FUNCS:class-target +=
> "rm_flatc_cmaketarget_for_target"
> > +
> >   do_install:append() {
> >       install -d ${D}${PYTHON_SITEPACKAGES_DIR}
> >       cp -rf ${S}/python/flatbuffers ${D}${PYTHON_SITEPACKAGES_DIR}
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#101976):
> https://lists.openembedded.org/g/openembedded-devel/message/101976
> > Mute This Topic: https://lists.openembedded.org/mt/98119685/3616698
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> akuster808@gmail.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >
>
>

--00000000000064c80105f93250e5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hello <span class=3D"gmail_chip gmail_plusreply" dir=3D"a=
uto"><a href=3D"mailto:akuster808@gmail.com" style=3D"color:#15c;text-decor=
ation:underline">@akuster808@gmail.com</a></span><span>=C2=A0,=C2=A0</span>=
<div dir=3D"auto"><span><br></span></div><div dir=3D"auto"><span>This is fi=
xed in a different way in master, so this doesn&#39;t need to be be done fo=
r master.=C2=A0</span></div><div dir=3D"auto"><span><br></span></div><div d=
ir=3D"auto"><span><br></span></div></div><br><div class=3D"gmail_quote"><di=
v dir=3D"ltr" class=3D"gmail_attr">On Fri, 7 Apr, 2023, 5:15 pm akuster808,=
 &lt;<a href=3D"mailto:akuster808@gmail.com">akuster808@gmail.com</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex=
;border-left:1px #ccc solid;padding-left:1ex"><br>
<br>
On 4/7/23 12:38 AM, BINDU wrote:<br>
&gt; Flatbuffers contains a library and a schema compiler. The package<br>
&gt; contains cmake files to discover the libraries and the compiler tool.<=
br>
&gt; Currently, all of these cmake files are installed into the target<br>
&gt; sysroot. However, the compiler utility isn&#39;t installed into the sy=
sroot<br>
&gt; (as it is not runnable on the build machine).<br>
&gt;<br>
&gt; When an application that depends on flatbuffers gets built, it uses<br=
>
&gt; flatbuffers&#39; exported cmake targets to configure the project. One =
of the<br>
&gt; exported targets is FlatcTarget.cmake which expects to see flatc binar=
y<br>
&gt; in /usr/bin of the sysroot. Since binaries for target don&#39;t end up=
 in<br>
&gt; target sysroot, cmake configuration fails.<br>
&gt;<br>
&gt; This patch addresses this problem of flatbuffers&#39; build infrastruc=
ture<br>
&gt; in cross-compiling environments. By removing FlatcTarget.cmake for<br>
&gt; target builds from the sysroot we essentially skip this step of<br>
&gt; flatbuffers&#39; configuration.<br>
<br>
Does this need to be done in Master as well?<br>
<br>
-armin<br>
&gt;<br>
&gt; Signed-off-by: Ivan Stepic &lt;<a href=3D"mailto:Ivan.Stepic@bmw.de" t=
arget=3D"_blank" rel=3D"noreferrer">Ivan.Stepic@bmw.de</a>&gt;<br>
&gt; Signed-off-by: Bhabu Bindu &lt;<a href=3D"mailto:bindudaniel1996@gmail=
.com" target=3D"_blank" rel=3D"noreferrer">bindudaniel1996@gmail.com</a>&gt=
;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0meta-oe/recipes-devtools/flatbuffers/<a href=3D"http://fla=
tbuffers_2.0.0.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">flatbuff=
ers_2.0.0.bb</a> | 7 ++++++-<br>
&gt;=C2=A0 =C2=A01 file changed, 6 insertions(+), 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/meta-oe/recipes-devtools/flatbuffers/<a href=3D"http://fl=
atbuffers_2.0.0.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">flatbuf=
fers_2.0.0.bb</a> b/meta-oe/recipes-devtools/flatbuffers/<a href=3D"http://=
flatbuffers_2.0.0.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">flatb=
uffers_2.0.0.bb</a><br>
&gt; index bf74f1229..44478ea0b 100644<br>
&gt; --- a/meta-oe/recipes-devtools/flatbuffers/<a href=3D"http://flatbuffe=
rs_2.0.0.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">flatbuffers_2.=
0.0.bb</a><br>
&gt; +++ b/meta-oe/recipes-devtools/flatbuffers/<a href=3D"http://flatbuffe=
rs_2.0.0.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">flatbuffers_2.=
0.0.bb</a><br>
&gt; @@ -25,12 +25,17 @@ BUILD_CXXFLAGS +=3D &quot;-fPIC&quot;<br>
&gt;=C2=A0 =C2=A0# BUILD_TYPE=3DRelease is required, otherwise flatc is not=
 installed<br>
&gt;=C2=A0 =C2=A0EXTRA_OECMAKE +=3D &quot;\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0-DCMAKE_BUILD_TYPE=3DRelease \<br>
&gt; -=C2=A0 =C2=A0 -DFLATBUFFERS_BUILD_TESTS=3DOFF \<br>
&gt; +=C2=A0 =C2=A0 -DFLATBUFFERS_BUILD_TESTS=3DOFF \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0-DFLATBUFFERS_BUILD_SHAREDLIB=3DON \<br>
&gt;=C2=A0 =C2=A0&quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0inherit cmake<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +rm_flatc_cmaketarget_for_target() {<br>
&gt; +=C2=A0 =C2=A0 rm -f &quot;${SYSROOT_DESTDIR}/${libdir}/cmake/flatbuff=
ers/FlatcTargets.cmake&quot;<br>
&gt; +}<br>
&gt; +SYSROOT_PREPROCESS_FUNCS:class-target +=3D &quot;rm_flatc_cmaketarget=
_for_target&quot;<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0do_install:append() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}${PYTHON_SITEPACKAGES_DIR}<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0cp -rf ${S}/python/flatbuffers ${D}${PYTHON_=
SITEPACKAGES_DIR}<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#101976): <a href=3D"https://lists.openembedded.org=
/g/openembedded-devel/message/101976" rel=3D"noreferrer noreferrer" target=
=3D"_blank">https://lists.openembedded.org/g/openembedded-devel/message/101=
976</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/98119685=
/3616698" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.ope=
nembedded.org/mt/98119685/3616698</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openem=
bedded.org" target=3D"_blank" rel=3D"noreferrer">openembedded-devel+owner@l=
ists.openembedded.org</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
devel/unsub" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.=
openembedded.org/g/openembedded-devel/unsub</a> [<a href=3D"mailto:akuster8=
08@gmail.com" target=3D"_blank" rel=3D"noreferrer">akuster808@gmail.com</a>=
]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
<br>
</blockquote></div>

--00000000000064c80105f93250e5--

