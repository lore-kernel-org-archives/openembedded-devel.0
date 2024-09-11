Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B799EE498D
	for <webhook@archiver.kernel.org>; Wed, 11 Sep 2024 10:19:33 +0000 (UTC)
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
 by mx.groups.io with SMTP id smtpd.web10.15847.1726035906971732008
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Sep 2024 23:25:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aWL+Nj44;
 spf=pass (domain: gmail.com, ip: 209.85.161.48, mailfrom: tolvupostur@gmail.com)
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-5dcd8403656so757196eaf.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 10 Sep 2024 23:25:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726035906; x=1726640706; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=18WCKQtSf++WkWrEMcabR3JWMcj+1PZbNvgJVtLtoi8=;
        b=aWL+Nj444ZUV50kAJS6C57f7JKY1nueF7mtlZaSUqKsGh2snHiBt0sfk9M8eAXrNP9
         vEv3FGOacIrYpzGAdsmzx+qiQDIhpCLyfzKeOiGJ70GiJqMH92rXWw39POMpf+9H4EuP
         Ma04rdM6b/HiD7V4JpQ75rD4BJlivJvvuX+7bwiTgeU/SE1923Agq5EASRsF+LPpt3BQ
         9sg8mwrmrwJDK8D4tpzfftL9uComkARKgCpSg0516WYOrQXOpSWW69ESojP+0rPQIKCL
         d9FiSoiWJwASvJGWB68BZrvEKNCZn8eexWap1VRJM6n96Pu7qIN04Wqvar8Z3qv0jFHX
         +4OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726035906; x=1726640706;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=18WCKQtSf++WkWrEMcabR3JWMcj+1PZbNvgJVtLtoi8=;
        b=Bo6vPY57ZYb8CH7pMjj8Z7orHBW1yFLQRO/tTzdEN5tFp21+ytqk4f5A4Ydtkev+g1
         PYFtUH0OaNHU+t7h/TwNqujGxOGhDr156cUBnbIztSXcqAqDSblG1wpgCZohRHC0W3JF
         CVSa43eK7GYl0+ICgHUIta1wfMnrWQpdkDkgdaW+yKPfLoGrG3h1RokSE2tuosOlUOyu
         76SxLvBd7fjj1lHI0rTRsq4OVP9JH6aMzcVcdiEZp9MFuj9epoY3nasGGEyO+qqGDfUI
         Kdi5rZwA3pRauVCZAgqidbovHOpiQEVf+wqerY8Zv+Ww7zGRNfLafYq1sZ9/V5tGN6n1
         x37w==
X-Gm-Message-State: AOJu0YxhceiDPejzcDmiYcHBaY3fGPEz6RXNde47B17YPX5rXOV1tbUB
	pf6GoNBUVBxQeSj9+hWd69gQs9dR09888J0vZFyYu0t2I99vTzcI9hY8S5QrASOg40Ti31Z1VyH
	xxocDFtR4PJ2TBa6nesWlMLzbIvg=
X-Google-Smtp-Source: AGHT+IEZlvJdOehynXSsaGGOx6mTEEsWWbKKNTPvnRlGpayOTYgM4EfmqrJ9RZ43JwvqsT5lb8+m904A1/z54rn6KgU=
X-Received: by 2002:a05:6870:538d:b0:277:e35a:d2d5 with SMTP id
 586e51a60fabf-27c1b8518a3mr1099431fac.47.1726035905829; Tue, 10 Sep 2024
 23:25:05 -0700 (PDT)
MIME-Version: 1.0
References: <20240910125239.21286-1-tolvupostur@gmail.com> <CABhNV217uTWQBD-1x2pPFLOvPjpR_uj-+_D2c=NwnKir70O0rw@mail.gmail.com>
 <CAMKF1spqy1v=WBvHpHxQUNXpoK9LHWvqbLSc6RVp7un6sBVPHA@mail.gmail.com>
In-Reply-To: <CAMKF1spqy1v=WBvHpHxQUNXpoK9LHWvqbLSc6RVp7un6sBVPHA@mail.gmail.com>
From: "Einar Gunnarsson" <tolvupostur@gmail.com>
Date: Wed, 11 Sep 2024 08:24:54 +0200
Message-ID: <CABhNV22khgFh5Hu1ZDdvCQTCe-Xtz1Ci0jWFO8O-J9mrYK4TtA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] v4l-utils: Install media ctrl pkgconfig files
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000000963de0621d20d5a"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 11 Sep 2024 10:19:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112241

--0000000000000963de0621d20d5a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Khem



On Tue, 10 Sept 2024 at 16:35, Khem Raj <raj.khem@gmail.com> wrote:

>
>
> On Tue, Sep 10, 2024 at 6:47=E2=80=AFAM Einar Gunnarsson via
> lists.openembedded.org <tolvupostur=3Dgmail.com@lists.openembedded.org>
> wrote:
>
>> Hi all
>>
>> I'm not sure if this one should be a separate patch file or simply added
>> to
>> file://0001-media-ctl-Install-media-ctl-header-and-library-files.patch
>>
>
> Perhaps it could be squashed into that but it worries me that it was
> denied upstream. What was the reason ? Is there a better way to do this?
> That upstream will prefer
>

As stated in the linked commit
"The libraries APIs are not deemed to be stable yet, don't install the
libraries."
https://github.com/gjasny/v4l-utils/commit/0911dce53b08b0df3066be2c75f67e8a=
314d8729

Since we're ignoring that and installing the libraries anyway, we might as
well do it properly.


>
>> I was not able to use the libraries without the pkgconfig files, but thi=
s
>> makes CMake
>> integration easy.
>> Best regards
>> Einar Jon
>>
>> On Tue, 10 Sept 2024 at 14:52, Einar Jon Gunnarsson <
>> tolvupostur@gmail.com> wrote:
>>
>>> Commit 5f453c3401e20eb5489fac4d3b54a5bf96d019ab installs
>>> libraries but without the pkgconfig files, making them harder to link
>>> to. This adds pkgconfig files for these libraries
>>>
>>> Signed-off-by: Einar Jon Gunnarsson <tolvupostur@gmail.com>
>>> ---
>>>  ...l-Install-media-ctl-pkg-config-files.patch | 49 +++++++++++++++++++
>>>  .../v4l2apps/v4l-utils_1.26.1.bb              |  1 +
>>>  2 files changed, 50 insertions(+)
>>>  create mode 100644
>>> meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0002-media-ctl-Install-me=
dia-ctl-pkg-config-files.patch
>>>
>>> diff --git
>>> a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0002-media-ctl-Install-=
media-ctl-pkg-config-files.patch
>>> b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0002-media-ctl-Install-=
media-ctl-pkg-config-files.patch
>>> new file mode 100644
>>> index 000000000..8a009ae80
>>> --- /dev/null
>>> +++
>>> b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0002-media-ctl-Install-=
media-ctl-pkg-config-files.patch
>>> @@ -0,0 +1,49 @@
>>> +From a422ddf7f8805d34ff1fbb46d335993c9cd05ead Mon Sep 17 00:00:00 2001
>>> +From: Einar Jon Gunnarsson <tolvupostur@gmail.com>
>>> +Date: Fri, 10 May 2024 11:56:17 +0200
>>> +Subject: [PATCH] media-ctl: Install media-ctl pkg-config files
>>> +
>>> +libv4l2subdev/libmediactl can not be used in projects without the
>>> +pkg-config files. This adds them as well.
>>> +
>>> +Upstream-Status: Denied
>>> +
>>> +This is an add-on to the previous patch:
>>> +0001-media-ctl-Install-media-ctl-header-and-library-files.patch
>>> +so same restrictions apply.
>>> +
>>> +Signed-off-by: Einar Jon Gunnarsson <tolvupostur@gmail.com>
>>> +---
>>> + utils/media-ctl/meson.build | 12 ++++++++++++
>>> + 1 file changed, 12 insertions(+)
>>> +
>>> +diff --git a/utils/media-ctl/meson.build b/utils/media-ctl/meson.build
>>> +index 40669b4c..6feba1af 100644
>>> +--- a/utils/media-ctl/meson.build
>>> ++++ b/utils/media-ctl/meson.build
>>> +@@ -38,6 +38,12 @@ libv4l2subdev =3D library('v4l2subdev',
>>> +
>>> + dep_libv4l2subdev =3D declare_dependency(link_with : libv4l2subdev)
>>> +
>>> ++pkg.generate(
>>> ++      libv4l2subdev,
>>> ++      name : 'libv4l2subdev',
>>> ++      version : meson.project_version(),
>>> ++      description : 'v4l2 subdev library')
>>> ++
>>> + media_ctl_sources =3D files(
>>> +     'media-ctl.c',
>>> +     'options.c',
>>> +@@ -55,3 +61,9 @@ media_ctl =3D executable('media-ctl',
>>> +                        dependencies : media_ctl_deps,
>>> +                        install : true,
>>> +                        include_directories : v4l2_utils_incdir)
>>> ++
>>> ++pkg.generate(
>>> ++     libmediactl,
>>> ++     name : 'libmediactl',
>>> ++     version : meson.project_version(),
>>> ++     description : 'v4l2 mediactl library')
>>> +--
>>> +2.43.5
>>> +
>>> diff --git a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.26.1.bb
>>> b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.26.1.bb
>>> index eb38d9713..8ab96760a 100644
>>> --- a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.26.1.bb
>>> +++ b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.26.1.bb
>>> @@ -29,6 +29,7 @@ SRC_URI =3D "\
>>>      git://
>>> git.linuxtv.org/v4l-utils.git;protocol=3Dhttps;branch=3Dstable-1.26 \
>>>
>>>  file://0001-keytable-meson-Restrict-the-installation-of-50-rc_ke.patch=
 \
>>>
>>>  file://0001-media-ctl-Install-media-ctl-header-and-library-files.patch=
 \
>>> +    file://0002-media-ctl-Install-media-ctl-pkg-config-files.patch \
>>>  "
>>>
>>>  SRCREV =3D "4aee01a027923cab1e40969f56f8ba58d3e6c0d1"
>>> --
>>> 2.43.5
>>>
>>>
>>
>> --
>> Regards
>> Einar J=C3=B3n
>> +31 610 957234
>>
>>=20
>>
>>

--=20
Regards
Einar J=C3=B3n

--0000000000000963de0621d20d5a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hello Khem<br><br><br></div><br><div clas=
s=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, 10 Sept 202=
4 at 16:35, Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_b=
lank">raj.khem@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex"><div><br></div><div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Sep 10, 2024 at 6:47=E2=80=AF=
AM Einar Gunnarsson via <a href=3D"http://lists.openembedded.org" target=3D=
"_blank">lists.openembedded.org</a> &lt;tolvupostur=3D<a href=3D"mailto:gma=
il.com@lists.openembedded.org" target=3D"_blank">gmail.com@lists.openembedd=
ed.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex"><div dir=3D"ltr"><div dir=3D"ltr">Hi all<br><div><div><br>I&#39;m not=
 sure if this one should be a separate patch file or simply added to=C2=A0 =
<br>file://0001-media-ctl-Install-media-ctl-header-and-library-files.patch

<br></div></div></div></div></blockquote><div dir=3D"auto"><br></div><div d=
ir=3D"auto">Perhaps it could be squashed into that but it worries me that i=
t was denied upstream. What was the reason ? Is there a better way=C2=A0to =
do this?</div><div dir=3D"auto">That upstream will prefer</div></div></div>=
</blockquote><div><br></div><div>As stated in the linked commit<br>
<div>&quot;The libraries APIs are not deemed to be stable yet, don&#39;t in=
stall the libraries.&quot;</div>

<a href=3D"https://github.com/gjasny/v4l-utils/commit/0911dce53b08b0df3066b=
e2c75f67e8a314d8729" target=3D"_blank">https://github.com/gjasny/v4l-utils/=
commit/0911dce53b08b0df3066be2c75f67e8a314d8729</a></div><div><br></div><di=
v>Since we&#39;re ignoring that and installing the libraries anyway, we mig=
ht as well do it properly.</div><div>=C2=A0</div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex"><div><div class=3D"gmail_quote"><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><div><di=
v><br></div><div>I was not able to use the libraries without the pkgconfig =
files, but this makes CMake <br>integration easy.<br></div><div></div></div=
></div><div>Best regards<br></div><div>Einar Jon<br></div></div><div dir=3D=
"ltr"><div><br></div><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"g=
mail_attr">On Tue, 10 Sept 2024 at 14:52, Einar Jon Gunnarsson &lt;<a href=
=3D"mailto:tolvupostur@gmail.com" target=3D"_blank">tolvupostur@gmail.com</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Co=
mmit 5f453c3401e20eb5489fac4d3b54a5bf96d019ab installs<br>
libraries but without the pkgconfig files, making them harder to link<br>
to. This adds pkgconfig files for these libraries<br>
<br>
Signed-off-by: Einar Jon Gunnarsson &lt;<a href=3D"mailto:tolvupostur@gmail=
.com" target=3D"_blank">tolvupostur@gmail.com</a>&gt;<br>
---<br>
=C2=A0...l-Install-media-ctl-pkg-config-files.patch | 49 ++++++++++++++++++=
+<br>
=C2=A0.../v4l2apps/<a href=3D"http://v4l-utils_1.26.1.bb" rel=3D"noreferrer=
" target=3D"_blank">v4l-utils_1.26.1.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 1 +<br>
=C2=A02 files changed, 50 insertions(+)<br>
=C2=A0create mode 100644 meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0002=
-media-ctl-Install-media-ctl-pkg-config-files.patch<br>
<br>
diff --git a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0002-media-ctl-I=
nstall-media-ctl-pkg-config-files.patch b/meta-oe/recipes-multimedia/v4l2ap=
ps/v4l-utils/0002-media-ctl-Install-media-ctl-pkg-config-files.patch<br>
new file mode 100644<br>
index 000000000..8a009ae80<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0002-media-ctl-Install-=
media-ctl-pkg-config-files.patch<br>
@@ -0,0 +1,49 @@<br>
+From a422ddf7f8805d34ff1fbb46d335993c9cd05ead Mon Sep 17 00:00:00 2001<br>
+From: Einar Jon Gunnarsson &lt;<a href=3D"mailto:tolvupostur@gmail.com" ta=
rget=3D"_blank">tolvupostur@gmail.com</a>&gt;<br>
+Date: Fri, 10 May 2024 11:56:17 +0200<br>
+Subject: [PATCH] media-ctl: Install media-ctl pkg-config files<br>
+<br>
+libv4l2subdev/libmediactl can not be used in projects without the<br>
+pkg-config files. This adds them as well.<br>
+<br>
+Upstream-Status: Denied<br>
+<br>
+This is an add-on to the previous patch:<br>
+0001-media-ctl-Install-media-ctl-header-and-library-files.patch<br>
+so same restrictions apply.<br>
+<br>
+Signed-off-by: Einar Jon Gunnarsson &lt;<a href=3D"mailto:tolvupostur@gmai=
l.com" target=3D"_blank">tolvupostur@gmail.com</a>&gt;<br>
+---<br>
+ utils/media-ctl/meson.build | 12 ++++++++++++<br>
+ 1 file changed, 12 insertions(+)<br>
+<br>
+diff --git a/utils/media-ctl/meson.build b/utils/media-ctl/meson.build<br>
+index 40669b4c..6feba1af 100644<br>
+--- a/utils/media-ctl/meson.build<br>
++++ b/utils/media-ctl/meson.build<br>
+@@ -38,6 +38,12 @@ libv4l2subdev =3D library(&#39;v4l2subdev&#39;,<br>
+ <br>
+ dep_libv4l2subdev =3D declare_dependency(link_with : libv4l2subdev)<br>
+ <br>
++pkg.generate(<br>
++=C2=A0 =C2=A0 =C2=A0 libv4l2subdev,<br>
++=C2=A0 =C2=A0 =C2=A0 name : &#39;libv4l2subdev&#39;,<br>
++=C2=A0 =C2=A0 =C2=A0 version : meson.project_version(),<br>
++=C2=A0 =C2=A0 =C2=A0 description : &#39;v4l2 subdev library&#39;)<br>
++<br>
+ media_ctl_sources =3D files(<br>
+=C2=A0 =C2=A0 =C2=A0&#39;media-ctl.c&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0&#39;options.c&#39;,<br>
+@@ -55,3 +61,9 @@ media_ctl =3D executable(&#39;media-ctl&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 dependencies : media_ctl_deps,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 install : true,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 include_directories : v4l2_utils_incdir)<br>
++<br>
++pkg.generate(<br>
++=C2=A0 =C2=A0 =C2=A0libmediactl,<br>
++=C2=A0 =C2=A0 =C2=A0name : &#39;libmediactl&#39;,<br>
++=C2=A0 =C2=A0 =C2=A0version : meson.project_version(),<br>
++=C2=A0 =C2=A0 =C2=A0description : &#39;v4l2 mediactl library&#39;)<br>
+-- <br>
+2.43.5<br>
+<br>
diff --git a/meta-oe/recipes-multimedia/v4l2apps/<a href=3D"http://v4l-util=
s_1.26.1.bb" rel=3D"noreferrer" target=3D"_blank">v4l-utils_1.26.1.bb</a> b=
/meta-oe/recipes-multimedia/v4l2apps/<a href=3D"http://v4l-utils_1.26.1.bb"=
 rel=3D"noreferrer" target=3D"_blank">v4l-utils_1.26.1.bb</a><br>
index eb38d9713..8ab96760a 100644<br>
--- a/meta-oe/recipes-multimedia/v4l2apps/<a href=3D"http://v4l-utils_1.26.=
1.bb" rel=3D"noreferrer" target=3D"_blank">v4l-utils_1.26.1.bb</a><br>
+++ b/meta-oe/recipes-multimedia/v4l2apps/<a href=3D"http://v4l-utils_1.26.=
1.bb" rel=3D"noreferrer" target=3D"_blank">v4l-utils_1.26.1.bb</a><br>
@@ -29,6 +29,7 @@ SRC_URI =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0git://<a href=3D"http://git.linuxtv.org/v4l-utils.git;p=
rotocol=3Dhttps;branch=3Dstable-1.26" rel=3D"noreferrer" target=3D"_blank">=
git.linuxtv.org/v4l-utils.git;protocol=3Dhttps;branch=3Dstable-1.26</a> \<b=
r>
=C2=A0 =C2=A0 =C2=A0file://0001-keytable-meson-Restrict-the-installation-of=
-50-rc_ke.patch \<br>
=C2=A0 =C2=A0 =C2=A0file://0001-media-ctl-Install-media-ctl-header-and-libr=
ary-files.patch \<br>
+=C2=A0 =C2=A0 file://0002-media-ctl-Install-media-ctl-pkg-config-files.pat=
ch \<br>
=C2=A0&quot;<br>
<br>
=C2=A0SRCREV =3D &quot;4aee01a027923cab1e40969f56f8ba58d3e6c0d1&quot;<br>
-- <br>
2.43.5<br>
<br>
</blockquote></div><br clear=3D"all"><br></div><div dir=3D"ltr"><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">Regards<br>Einar J=C3=B3n<br>+31 610 957234</div></div>
<br>
<br>
<br>
</blockquote></div></div>
</blockquote></div><br clear=3D"all"><br><span class=3D"gmail_signature_pre=
fix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"l=
tr">Regards<br>Einar J=C3=B3n<br></div></div></div>

--0000000000000963de0621d20d5a--

