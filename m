Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9ADBFEB64DE
	for <webhook@archiver.kernel.org>; Tue, 10 Sep 2024 14:36:05 +0000 (UTC)
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
 by mx.groups.io with SMTP id smtpd.web10.25196.1725978960218119270
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Sep 2024 07:36:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=H7v/rNOT;
 spf=pass (domain: gmail.com, ip: 209.85.161.50, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-5e19b1656ddso3025818eaf.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 10 Sep 2024 07:36:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725978959; x=1726583759; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Q9cfHa9Un/IPIzW6Iea1AYv9qywrWK3Rm5qUzDrvjbM=;
        b=H7v/rNOTspJ2w7tLKyduCsJNEUI1lJQsElPWQ2NxvheaM2ME487pBJAYlLA/q9jSHr
         KS+5c9L+7JBfAQwY4PnsE508z3FH3p4UMzaaFjoiMrdQH3csZlPhL2w2fvmWrARB+BQz
         CkTLSkjLQeVD2NP2tkbteeqBx4k3S2EY0TwlaT9gSy4IF3PhGdJLq3K7o+1K5ic1KLYO
         b9NxKeW4rPJgp012EvMeq2txGQzelA/O+RKTAMhfFw74QT4w/J39AgmhAQiB6YKw9GPT
         EaieUUrvNe7ORFpqtF6J4r6bOGBeXKnHJzdcL8LoQ8xxQt0kXebVTMlDiNr8u8fLMxXm
         DuMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725978959; x=1726583759;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q9cfHa9Un/IPIzW6Iea1AYv9qywrWK3Rm5qUzDrvjbM=;
        b=d1qHOXGwl+nZdCt4SIirBXrJVKyTUzMUufslEZmctV+auN2WRSzoCcJSRKPQPkgvYL
         holGJO/1g1Oaj9bQjt4dl6VOoPFhCQpaferUe5htw6vhABrI5FgMMDLVfSuRzdqK4EYk
         VWAN06jnik3ybLwGLHHP5Vbjz4HPNDzQoHeF2To69m/ZCpd42tVK1lwvtUe75LlHMW0t
         aoo/HTQ8t/Z8hTLLBryAWWTtoEAEwyCmBgAaRlR/s7+Cs5hBrWaiGSXAvIIAQs79KHsr
         sngpVVBQVY53ZavO71eARRGsPwNzE2GJ2FQe0s1G+2lfOz1AeXnYkJzSkExudP2FN+qC
         Fn1w==
X-Gm-Message-State: AOJu0YwVdnA8bQcT6r7j3vBYbtCVw0vKarXyfMVvZiL4idkntEe3Yt5l
	+hC8q8nt29FPYUjeOOkRGTMSanack1UdNrAxXojG2vM3k1HbLrpUY41tJcf8A0taMt3OB23oyHb
	nUYw289nUtyTB3BI3pfU86Q5EsAH53mNt
X-Google-Smtp-Source: AGHT+IGUK23Jck9+7u7kvaF5Afl6lbAGmwlTBS2WUAOvKNQc73V+fFW7cdJoWt48JO7nVRwvj72J5WSerL3hu6P7J4I=
X-Received: by 2002:a05:6820:16a5:b0:5e1:efda:3991 with SMTP id
 006d021491bc7-5e1efda3bb2mr478919eaf.0.1725978959391; Tue, 10 Sep 2024
 07:35:59 -0700 (PDT)
MIME-Version: 1.0
References: <20240910125239.21286-1-tolvupostur@gmail.com> <CABhNV217uTWQBD-1x2pPFLOvPjpR_uj-+_D2c=NwnKir70O0rw@mail.gmail.com>
In-Reply-To: <CABhNV217uTWQBD-1x2pPFLOvPjpR_uj-+_D2c=NwnKir70O0rw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 10 Sep 2024 07:35:48 -0700
Message-ID: <CAMKF1spqy1v=WBvHpHxQUNXpoK9LHWvqbLSc6RVp7un6sBVPHA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] v4l-utils: Install media ctrl pkgconfig files
To: tolvupostur@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000c3b34e0621c4ca55"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Sep 2024 14:36:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112232

--000000000000c3b34e0621c4ca55
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 10, 2024 at 6:47=E2=80=AFAM Einar Gunnarsson via lists.openembe=
dded.org
<tolvupostur=3Dgmail.com@lists.openembedded.org> wrote:

> Hi all
>
> I'm not sure if this one should be a separate patch file or simply added
> to
> file://0001-media-ctl-Install-media-ctl-header-and-library-files.patch
>

Perhaps it could be squashed into that but it worries me that it was denied
upstream. What was the reason ? Is there a better way to do this?
That upstream will prefer

>
> I was not able to use the libraries without the pkgconfig files, but this
> makes CMake
> integration easy.
> Best regards
> Einar Jon
>
> On Tue, 10 Sept 2024 at 14:52, Einar Jon Gunnarsson <tolvupostur@gmail.co=
m>
> wrote:
>
>> Commit 5f453c3401e20eb5489fac4d3b54a5bf96d019ab installs
>> libraries but without the pkgconfig files, making them harder to link
>> to. This adds pkgconfig files for these libraries
>>
>> Signed-off-by: Einar Jon Gunnarsson <tolvupostur@gmail.com>
>> ---
>>  ...l-Install-media-ctl-pkg-config-files.patch | 49 +++++++++++++++++++
>>  .../v4l2apps/v4l-utils_1.26.1.bb              |  1 +
>>  2 files changed, 50 insertions(+)
>>  create mode 100644
>> meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0002-media-ctl-Install-med=
ia-ctl-pkg-config-files.patch
>>
>> diff --git
>> a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0002-media-ctl-Install-m=
edia-ctl-pkg-config-files.patch
>> b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0002-media-ctl-Install-m=
edia-ctl-pkg-config-files.patch
>> new file mode 100644
>> index 000000000..8a009ae80
>> --- /dev/null
>> +++
>> b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0002-media-ctl-Install-m=
edia-ctl-pkg-config-files.patch
>> @@ -0,0 +1,49 @@
>> +From a422ddf7f8805d34ff1fbb46d335993c9cd05ead Mon Sep 17 00:00:00 2001
>> +From: Einar Jon Gunnarsson <tolvupostur@gmail.com>
>> +Date: Fri, 10 May 2024 11:56:17 +0200
>> +Subject: [PATCH] media-ctl: Install media-ctl pkg-config files
>> +
>> +libv4l2subdev/libmediactl can not be used in projects without the
>> +pkg-config files. This adds them as well.
>> +
>> +Upstream-Status: Denied
>> +
>> +This is an add-on to the previous patch:
>> +0001-media-ctl-Install-media-ctl-header-and-library-files.patch
>> +so same restrictions apply.
>> +
>> +Signed-off-by: Einar Jon Gunnarsson <tolvupostur@gmail.com>
>> +---
>> + utils/media-ctl/meson.build | 12 ++++++++++++
>> + 1 file changed, 12 insertions(+)
>> +
>> +diff --git a/utils/media-ctl/meson.build b/utils/media-ctl/meson.build
>> +index 40669b4c..6feba1af 100644
>> +--- a/utils/media-ctl/meson.build
>> ++++ b/utils/media-ctl/meson.build
>> +@@ -38,6 +38,12 @@ libv4l2subdev =3D library('v4l2subdev',
>> +
>> + dep_libv4l2subdev =3D declare_dependency(link_with : libv4l2subdev)
>> +
>> ++pkg.generate(
>> ++      libv4l2subdev,
>> ++      name : 'libv4l2subdev',
>> ++      version : meson.project_version(),
>> ++      description : 'v4l2 subdev library')
>> ++
>> + media_ctl_sources =3D files(
>> +     'media-ctl.c',
>> +     'options.c',
>> +@@ -55,3 +61,9 @@ media_ctl =3D executable('media-ctl',
>> +                        dependencies : media_ctl_deps,
>> +                        install : true,
>> +                        include_directories : v4l2_utils_incdir)
>> ++
>> ++pkg.generate(
>> ++     libmediactl,
>> ++     name : 'libmediactl',
>> ++     version : meson.project_version(),
>> ++     description : 'v4l2 mediactl library')
>> +--
>> +2.43.5
>> +
>> diff --git a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.26.1.bb
>> b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.26.1.bb
>> index eb38d9713..8ab96760a 100644
>> --- a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.26.1.bb
>> +++ b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.26.1.bb
>> @@ -29,6 +29,7 @@ SRC_URI =3D "\
>>      git://
>> git.linuxtv.org/v4l-utils.git;protocol=3Dhttps;branch=3Dstable-1.26 \
>>
>>  file://0001-keytable-meson-Restrict-the-installation-of-50-rc_ke.patch =
\
>>
>>  file://0001-media-ctl-Install-media-ctl-header-and-library-files.patch =
\
>> +    file://0002-media-ctl-Install-media-ctl-pkg-config-files.patch \
>>  "
>>
>>  SRCREV =3D "4aee01a027923cab1e40969f56f8ba58d3e6c0d1"
>> --
>> 2.43.5
>>
>>
>
> --
> Regards
> Einar J=C3=B3n
> +31 610 957234
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#112231):
> https://lists.openembedded.org/g/openembedded-devel/message/112231
> Mute This Topic: https://lists.openembedded.org/mt/108374820/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000c3b34e0621c4ca55
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Tue, Sep 10, 2024 at 6:47=E2=80=AFAM Einar Gunnarsson vi=
a <a href=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt;=
tolvupostur=3D<a href=3D"mailto:gmail.com@lists.openembedded.org">gmail.com=
@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1=
ex"><div dir=3D"ltr"><div dir=3D"ltr">Hi all<br><div><div><br>I&#39;m not s=
ure if this one should be a separate patch file or simply added to=C2=A0 <b=
r>file://0001-media-ctl-Install-media-ctl-header-and-library-files.patch

<br></div></div></div></div></blockquote><div dir=3D"auto"><br></div><div d=
ir=3D"auto">Perhaps it could be squashed into that but it worries me that i=
t was denied upstream. What was the reason ? Is there a better way=C2=A0to =
do this?</div><div dir=3D"auto">That upstream will prefer</div><blockquote =
class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid=
;padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><div><div><br></div><d=
iv>I was not able to use the libraries without the pkgconfig files, but thi=
s makes CMake <br>integration easy.<br></div><div></div></div></div><div>Be=
st regards<br></div><div>Einar Jon<br></div></div><div dir=3D"ltr"><div><br=
></div><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On =
Tue, 10 Sept 2024 at 14:52, Einar Jon Gunnarsson &lt;<a href=3D"mailto:tolv=
upostur@gmail.com" target=3D"_blank">tolvupostur@gmail.com</a>&gt; wrote:<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">Commit 5f453c3401=
e20eb5489fac4d3b54a5bf96d019ab installs<br>
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
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#112231): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/112231" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/112231</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/108374820/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/108374820/1997914</a><br>
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

--000000000000c3b34e0621c4ca55--

