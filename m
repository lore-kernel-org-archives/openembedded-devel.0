Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA4C2CD4F59
	for <webhook@archiver.kernel.org>; Thu,  5 Sep 2024 06:27:05 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web11.3236.1725517616014584409
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Sep 2024 23:26:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=oAXTgHlU;
 spf=pass (domain: smile.fr, ip: 209.85.221.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-374c84dcc90so209273f8f.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 04 Sep 2024 23:26:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1725517614; x=1726122414; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4m229hm64nXH5FH2pJYYxrJDzv09W537n6DwS0/O09E=;
        b=oAXTgHlU6kJACma+yaGpXe7zqCq1dDjXr50ZyA+qQp2Ntr09RW6whjLgh5AfrYnnoG
         XaWO0YQUxiofVvmbBwSDo0Z3CbcHJnxBlgrUFfYMHe1+4QcvcqTc7TU6j54AnPztfQRW
         pI2bflnoWgrFDTRUKxMN8grqnz83ZWbmDZKqs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725517614; x=1726122414;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4m229hm64nXH5FH2pJYYxrJDzv09W537n6DwS0/O09E=;
        b=aT9eQJe4MOEHdvf8ooKjDQXI+4kC1q6KIIjXLEcuO845ZFwV+ptpqYHll9SPEO4JjZ
         Jjb1nz3ocQOyvhZ28kFNUfyoYlbvEGj+IecL4lDT+toMBVk53Yb/t9SGj5nW5nvhnsdO
         BbZiyOoxRy/PIk7KuTlar05xhx0nDpQebYXWxZUaIBcTc8Xab6qVJmdV4QDoirDT5VUy
         YkSg1ChsWSzxOt5X+cj30IqXR7hMkj8SnJQ5icDoHzu5Je7mcIaLizfELnGC/WimfukM
         Efk8SgGiuEmVHuycBCqlNNUpI82sQkQrS8/CfNL3tC+6guRXjjua5jJwP23/azUpPKoN
         Pdgw==
X-Gm-Message-State: AOJu0YwbsjMMCFjsqJEo7KxQIH7Dd7Nf0qvqW6qOFjZbuOhfN/teH26i
	GEM7MygTa5YEjMi9X/gda5kr1KVC1cTJ7cHTdHMNIGBNEN91SnVQZIWo8HTiA/JMkzol5rqeajG
	/uoKxpYJIh3RxKVdHDzxtpZyiNaMSS8vbz2DP7Q==
X-Google-Smtp-Source: AGHT+IG0I/HWivcj2LqnAuL1fQi/thTgeLPi5GJuARBDl07/wEWkA/rCafIeKi4Ni5ZjctINE5cQIm1lyNn7Mk3Nka4=
X-Received: by 2002:adf:f0ce:0:b0:374:b685:676 with SMTP id
 ffacd0b85a97d-3776f92922cmr3290490f8f.27.1725517613762; Wed, 04 Sep 2024
 23:26:53 -0700 (PDT)
MIME-Version: 1.0
References: <20240904225341.2699885-1-yoann.congal@smile.fr> <DB5PR02MB102135BF13B71C080CFABD5E1EF9C2@DB5PR02MB10213.eurprd02.prod.outlook.com>
In-Reply-To: <DB5PR02MB102135BF13B71C080CFABD5E1EF9C2@DB5PR02MB10213.eurprd02.prod.outlook.com>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Thu, 5 Sep 2024 08:26:39 +0200
Message-ID: <CAMSfU+7xyUK-0JQ2d66vy406HpcS_Q0QdecYYqcFttXoMNK=2Q@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 1/2] polkit: Switch PAM files to common-*
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000006c1d300621596065"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 05 Sep 2024 06:27:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112097

--0000000000006c1d300621596065
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeu. 5 sept. 2024 =C3=A0 01:07, Peter Kjellerstedt <
peter.kjellerstedt@axis.com> a =C3=A9crit :

> > -----Original Message-----
> > From: openembedded-devel@lists.openembedded.org <
> openembedded-devel@lists.openembedded.org> On Behalf Of Yoann Congal via
> lists.openembedded.org
> > Sent: den 5 september 2024 00:54
> > To: openembedded-devel@lists.openembedded.org
> > Cc: Yoann Congal <yoann.congal@smile.fr>
> > Subject: [oe] [meta-oe][PATCH 1/2] polkit: Switch PAM files to common-*
> >
> > From: Yoann Congal <yoann.congal@smile.fr>
> >
> > Add a new OS option to polkit meson: "openembedded" and use this to
> > set PAM include to common-* which matches OE-Core libpam.
> >
> > This also may fix a non-reproducibility since polkit meson system tried
> > to detect the host (compiling) OS and changed PAM config from the
> > detected value.
> >
> > Fixes: https://github.com/openembedded/meta-openembedded/issues/860
> >
> > Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
> > ---
> >  ...pport-openembedded-OS-for-PAM-config.patch | 48 +++++++++++++++++++
> >  meta-oe/recipes-extended/polkit/polkit_125.bb |  8 +++-
> >  2 files changed, 55 insertions(+), 1 deletion(-)
> >  create mode 100644
> meta-oe/recipes-extended/polkit/files/meson-build-Support-openembedded-OS=
-for-PAM-config.patch
> >
> > diff --git
> a/meta-oe/recipes-extended/polkit/files/meson-build-Support-openembedded-=
OS-for-PAM-config.patch
> b/meta-oe/recipes-extended/polkit/files/meson-build-Support-openembedded-=
OS-for-PAM-config.patch
> > new file mode 100644
> > index 0000000000..e0ee8a309a
> > --- /dev/null
> > +++
> b/meta-oe/recipes-extended/polkit/files/meson-build-Support-openembedded-=
OS-for-PAM-config.patch
> > @@ -0,0 +1,48 @@
> > +From 7c89b88f0f81ad220d08d69d212c14c6eeefb647 Mon Sep 17 00:00:00 2001
> > +From: Yoann Congal <yoann.congal@smile.fr>
> > +Date: Tue, 3 Sep 2024 12:17:42 +0200
> > +Subject: [PATCH] meson.build: Support "openembedded" OS for PAM config
> > +
> > +In Openembedded, same as Suse/Solaris: PAM files are common-*:
> > +* PAM_FILE_INCLUDE_AUTH: common-auth
> > +* PAM_FILE_INCLUDE_ACCOUNT: common-account
> > +* PAM_FILE_INCLUDE_PASSWORD: common-password
> > +* PAM_FILE_INCLUDE_SESSION: common-session
> > +See OE-Core libpam recipe.
> > +
> > +NB: This is also the same config as Debian but its not mentioned in th=
e
> > +code.
> > +
> > +Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
> > +Upstream-Status: Inappropriate [oe specific]
> > +---
> > + meson.build       | 2 +-
> > + meson_options.txt | 2 +-
> > + 2 files changed, 2 insertions(+), 2 deletions(-)
> > +
> > +diff --git a/meson.build b/meson.build
> > +index 302c189..a55f2d6 100644
> > +--- a/meson.build
> > ++++ b/meson.build
> > +@@ -311,7 +311,7 @@ endif
> > +
> > + pam_include =3D get_option('pam_include')
> > + if pam_include =3D=3D ''
> > +-  if ['suse', 'solaris'].contains(os_type)
> > ++  if ['suse', 'solaris', 'openembedded'].contains(os_type)
> > +     pam_conf =3D {
> > +       'PAM_FILE_INCLUDE_AUTH': 'common-auth',
> > +       'PAM_FILE_INCLUDE_ACCOUNT': 'common-account',
> > +diff --git a/meson_options.txt b/meson_options.txt
> > +index c2e4a6c..14d7a50 100644
> > +--- a/meson_options.txt
> > ++++ b/meson_options.txt
> > +@@ -6,7 +6,7 @@ option('polkitd_user', type: 'string', value: 'polkitd=
',
> > description: 'User for
> > + option('polkitd_uid', type: 'string', value: '-', description: 'Fixed
> UID for user running polkitd (polkitd)')
> > +
> > + option('authfw', type: 'combo', choices: ['pam', 'shadow', 'bsdauth']=
,
> value: 'pam', description: 'Authentication framework (pam/shadow)')
> > +-option('os_type', type: 'combo', choices: ['redhat', 'suse', 'gentoo'=
,
> 'pardus', 'solaris', 'netbsd', 'lfs', ''], value: '', description:
> 'distribution or OS')
> > ++option('os_type', type: 'combo', choices: ['redhat', 'suse', 'gentoo'=
,
> 'pardus', 'solaris', 'netbsd', 'lfs', 'openembedded', ''], value: '',
> description: 'distribution or OS')
> > +
> > + option('pam_include', type: 'string', value: '', description: 'pam
> file to include')
> > + option('pam_module_dir', type: 'string', value: '', description:
> 'directory to install PAM security module')
> > diff --git a/meta-oe/recipes-extended/polkit/polkit_125.bb
> b/meta-oe/recipes-extended/polkit/polkit_125.bb
> > index fe1ee467c3..2405ed6034 100644
> > --- a/meta-oe/recipes-extended/polkit/polkit_125.bb
> > +++ b/meta-oe/recipes-extended/polkit/polkit_125.bb
> > @@ -5,7 +5,9 @@ LICENSE =3D "LGPL-2.0-or-later"
> >  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D155db86cdbafa7532b41f390409=
283eb"
> >  BUGTRACKER =3D "https://github.com/polkit-org/polkit/issues"
> >
> > -SRC_URI =3D "git://
> github.com/polkit-org/polkit.git;protocol=3Dhttps;branch=3Dmain"
> > +SRC_URI =3D "git://
> github.com/polkit-org/polkit.git;protocol=3Dhttps;branch=3Dmain \
> > +
>  file://meson-build-Support-openembedded-OS-for-PAM-config.patch \
> > +           "
> >
> >  S =3D "${WORKDIR}/git"
> >  SRCREV =3D "112752c12da812a163dac67d7f675b60de8f7d7b"
> > @@ -16,6 +18,10 @@ inherit meson pkgconfig useradd systemd gettext
> gobject-introspection features_c
> >
> >  REQUIRED_DISTRO_FEATURES =3D "polkit"
> >
> > +# Prevent meson.build to try to autodetect host OS (which could lead t=
o
> > +# non-reproducibility)
> > +EXTRA_OEMESON =3D "-Dos_type=3Dopenembedded"
>
> Why do you need the patch? Can't you just set:
>
> EXTRA_OEMESON =3D "-Dos_type=3Dsuse"
>
> and be done with it?
>

I wondered about using this but
- the suze can change in the future and without the patch there won't be
any warning
- it felt weird (I'll admit this is not a strong argument... ;) )

I'll send a v2 without the patch and "-Dos_type=3Dsuse" so Khem may choose
the one he prefers.

Thanks!

>
> > +
> >  PACKAGECONFIG =3D " \
> >       ${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)} \
> >       ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd',
> 'consolekit', d)} \
>
> //Peter
>
>

--0000000000006c1d300621596065
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D=
"gmail_attr">Le jeu. 5 sept. 2024 =C3=A0 01:07, Peter Kjellerstedt &lt;<a h=
ref=3D"mailto:peter.kjellerstedt@axis.com">peter.kjellerstedt@axis.com</a>&=
gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">&gt; -----Original Message-----<br>
&gt; From: <a href=3D"mailto:openembedded-devel@lists.openembedded.org" tar=
get=3D"_blank" rel=3D"noreferrer">openembedded-devel@lists.openembedded.org=
</a> &lt;<a href=3D"mailto:openembedded-devel@lists.openembedded.org" targe=
t=3D"_blank" rel=3D"noreferrer">openembedded-devel@lists.openembedded.org</=
a>&gt; On Behalf Of Yoann Congal via <a href=3D"http://lists.openembedded.o=
rg" rel=3D"noreferrer noreferrer" target=3D"_blank">lists.openembedded.org<=
/a><br>
&gt; Sent: den 5 september 2024 00:54<br>
&gt; To: <a href=3D"mailto:openembedded-devel@lists.openembedded.org" targe=
t=3D"_blank" rel=3D"noreferrer">openembedded-devel@lists.openembedded.org</=
a><br>
&gt; Cc: Yoann Congal &lt;<a href=3D"mailto:yoann.congal@smile.fr" target=
=3D"_blank" rel=3D"noreferrer">yoann.congal@smile.fr</a>&gt;<br>
&gt; Subject: [oe] [meta-oe][PATCH 1/2] polkit: Switch PAM files to common-=
*<br>
&gt; <br>
&gt; From: Yoann Congal &lt;<a href=3D"mailto:yoann.congal@smile.fr" target=
=3D"_blank" rel=3D"noreferrer">yoann.congal@smile.fr</a>&gt;<br>
&gt; <br>
&gt; Add a new OS option to polkit meson: &quot;openembedded&quot; and use =
this to<br>
&gt; set PAM include to common-* which matches OE-Core libpam.<br>
&gt; <br>
&gt; This also may fix a non-reproducibility since polkit meson system trie=
d<br>
&gt; to detect the host (compiling) OS and changed PAM config from the<br>
&gt; detected value.<br>
&gt; <br>
&gt; Fixes: <a href=3D"https://github.com/openembedded/meta-openembedded/is=
sues/860" rel=3D"noreferrer noreferrer" target=3D"_blank">https://github.co=
m/openembedded/meta-openembedded/issues/860</a><br>
&gt; <br>
&gt; Signed-off-by: Yoann Congal &lt;<a href=3D"mailto:yoann.congal@smile.f=
r" target=3D"_blank" rel=3D"noreferrer">yoann.congal@smile.fr</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 ...pport-openembedded-OS-for-PAM-config.patch | 48 +++++++++++++=
++++++<br>
&gt;=C2=A0 meta-oe/recipes-extended/polkit/<a href=3D"http://polkit_125.bb"=
 rel=3D"noreferrer noreferrer" target=3D"_blank">polkit_125.bb</a> |=C2=A0 =
8 +++-<br>
&gt;=C2=A0 2 files changed, 55 insertions(+), 1 deletion(-)<br>
&gt;=C2=A0 create mode 100644 meta-oe/recipes-extended/polkit/files/meson-b=
uild-Support-openembedded-OS-for-PAM-config.patch<br>
&gt; <br>
&gt; diff --git a/meta-oe/recipes-extended/polkit/files/meson-build-Support=
-openembedded-OS-for-PAM-config.patch b/meta-oe/recipes-extended/polkit/fil=
es/meson-build-Support-openembedded-OS-for-PAM-config.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..e0ee8a309a<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-oe/recipes-extended/polkit/files/meson-build-Support-openem=
bedded-OS-for-PAM-config.patch<br>
&gt; @@ -0,0 +1,48 @@<br>
&gt; +From 7c89b88f0f81ad220d08d69d212c14c6eeefb647 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Yoann Congal &lt;<a href=3D"mailto:yoann.congal@smile.fr" targe=
t=3D"_blank" rel=3D"noreferrer">yoann.congal@smile.fr</a>&gt;<br>
&gt; +Date: Tue, 3 Sep 2024 12:17:42 +0200<br>
&gt; +Subject: [PATCH] meson.build: Support &quot;openembedded&quot; OS for=
 PAM config<br>
&gt; +<br>
&gt; +In Openembedded, same as Suse/Solaris: PAM files are common-*:<br>
&gt; +* PAM_FILE_INCLUDE_AUTH: common-auth<br>
&gt; +* PAM_FILE_INCLUDE_ACCOUNT: common-account<br>
&gt; +* PAM_FILE_INCLUDE_PASSWORD: common-password<br>
&gt; +* PAM_FILE_INCLUDE_SESSION: common-session<br>
&gt; +See OE-Core libpam recipe.<br>
&gt; +<br>
&gt; +NB: This is also the same config as Debian but its not mentioned in t=
he<br>
&gt; +code.<br>
&gt; +<br>
&gt; +Signed-off-by: Yoann Congal &lt;<a href=3D"mailto:yoann.congal@smile.=
fr" target=3D"_blank" rel=3D"noreferrer">yoann.congal@smile.fr</a>&gt;<br>
&gt; +Upstream-Status: Inappropriate [oe specific]<br>
&gt; +---<br>
&gt; + meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
&gt; + meson_options.txt | 2 +-<br>
&gt; + 2 files changed, 2 insertions(+), 2 deletions(-)<br>
&gt; +<br>
&gt; +diff --git a/meson.build b/meson.build<br>
&gt; +index 302c189..a55f2d6 100644<br>
&gt; +--- a/meson.build<br>
&gt; ++++ b/meson.build<br>
&gt; +@@ -311,7 +311,7 @@ endif<br>
&gt; +<br>
&gt; + pam_include =3D get_option(&#39;pam_include&#39;)<br>
&gt; + if pam_include =3D=3D &#39;&#39;<br>
&gt; +-=C2=A0 if [&#39;suse&#39;, &#39;solaris&#39;].contains(os_type)<br>
&gt; ++=C2=A0 if [&#39;suse&#39;, &#39;solaris&#39;, &#39;openembedded&#39;=
].contains(os_type)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0pam_conf =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;PAM_FILE_INCLUDE_AUTH&#39;: &#39;comm=
on-auth&#39;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;PAM_FILE_INCLUDE_ACCOUNT&#39;: &#39;c=
ommon-account&#39;,<br>
&gt; +diff --git a/meson_options.txt b/meson_options.txt<br>
&gt; +index c2e4a6c..14d7a50 100644<br>
&gt; +--- a/meson_options.txt<br>
&gt; ++++ b/meson_options.txt<br>
&gt; +@@ -6,7 +6,7 @@ option(&#39;polkitd_user&#39;, type: &#39;string&#39;=
, value: &#39;polkitd&#39;,<br>
&gt; description: &#39;User for<br>
&gt; + option(&#39;polkitd_uid&#39;, type: &#39;string&#39;, value: &#39;-&=
#39;, description: &#39;Fixed UID for user running polkitd (polkitd)&#39;)<=
br>
&gt; +<br>
&gt; + option(&#39;authfw&#39;, type: &#39;combo&#39;, choices: [&#39;pam&#=
39;, &#39;shadow&#39;, &#39;bsdauth&#39;], value: &#39;pam&#39;, descriptio=
n: &#39;Authentication framework (pam/shadow)&#39;)<br>
&gt; +-option(&#39;os_type&#39;, type: &#39;combo&#39;, choices: [&#39;redh=
at&#39;, &#39;suse&#39;, &#39;gentoo&#39;, &#39;pardus&#39;, &#39;solaris&#=
39;, &#39;netbsd&#39;, &#39;lfs&#39;, &#39;&#39;], value: &#39;&#39;, descr=
iption: &#39;distribution or OS&#39;)<br>
&gt; ++option(&#39;os_type&#39;, type: &#39;combo&#39;, choices: [&#39;redh=
at&#39;, &#39;suse&#39;, &#39;gentoo&#39;, &#39;pardus&#39;, &#39;solaris&#=
39;, &#39;netbsd&#39;, &#39;lfs&#39;, &#39;openembedded&#39;, &#39;&#39;], =
value: &#39;&#39;, description: &#39;distribution or OS&#39;)<br>
&gt; +<br>
&gt; + option(&#39;pam_include&#39;, type: &#39;string&#39;, value: &#39;&#=
39;, description: &#39;pam file to include&#39;)<br>
&gt; + option(&#39;pam_module_dir&#39;, type: &#39;string&#39;, value: &#39=
;&#39;, description: &#39;directory to install PAM security module&#39;)<br=
>
&gt; diff --git a/meta-oe/recipes-extended/polkit/<a href=3D"http://polkit_=
125.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">polkit_125.bb</a> b=
/meta-oe/recipes-extended/polkit/<a href=3D"http://polkit_125.bb" rel=3D"no=
referrer noreferrer" target=3D"_blank">polkit_125.bb</a><br>
&gt; index fe1ee467c3..2405ed6034 100644<br>
&gt; --- a/meta-oe/recipes-extended/polkit/<a href=3D"http://polkit_125.bb"=
 rel=3D"noreferrer noreferrer" target=3D"_blank">polkit_125.bb</a><br>
&gt; +++ b/meta-oe/recipes-extended/polkit/<a href=3D"http://polkit_125.bb"=
 rel=3D"noreferrer noreferrer" target=3D"_blank">polkit_125.bb</a><br>
&gt; @@ -5,7 +5,9 @@ LICENSE =3D &quot;LGPL-2.0-or-later&quot;<br>
&gt;=C2=A0 LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D155db86cdbafa753=
2b41f390409283eb&quot;<br>
&gt;=C2=A0 BUGTRACKER =3D &quot;<a href=3D"https://github.com/polkit-org/po=
lkit/issues" rel=3D"noreferrer noreferrer" target=3D"_blank">https://github=
.com/polkit-org/polkit/issues</a>&quot;<br>
&gt; <br>
&gt; -SRC_URI =3D &quot;git://<a href=3D"http://github.com/polkit-org/polki=
t.git;protocol=3Dhttps;branch=3Dmain" rel=3D"noreferrer noreferrer" target=
=3D"_blank">github.com/polkit-org/polkit.git;protocol=3Dhttps;branch=3Dmain=
</a>&quot;<br>
&gt; +SRC_URI =3D &quot;git://<a href=3D"http://github.com/polkit-org/polki=
t.git;protocol=3Dhttps;branch=3Dmain" rel=3D"noreferrer noreferrer" target=
=3D"_blank">github.com/polkit-org/polkit.git;protocol=3Dhttps;branch=3Dmain=
</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://meson-build-Support-o=
penembedded-OS-for-PAM-config.patch \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt; <br>
&gt;=C2=A0 S =3D &quot;${WORKDIR}/git&quot;<br>
&gt;=C2=A0 SRCREV =3D &quot;112752c12da812a163dac67d7f675b60de8f7d7b&quot;<=
br>
&gt; @@ -16,6 +18,10 @@ inherit meson pkgconfig useradd systemd gettext gob=
ject-introspection features_c<br>
&gt; <br>
&gt;=C2=A0 REQUIRED_DISTRO_FEATURES =3D &quot;polkit&quot;<br>
&gt; <br>
&gt; +# Prevent meson.build to try to autodetect host OS (which could lead =
to<br>
&gt; +# non-reproducibility)<br>
&gt; +EXTRA_OEMESON =3D &quot;-Dos_type=3Dopenembedded&quot;<br>
<br>
Why do you need the patch? Can&#39;t you just set:<br>
<br>
EXTRA_OEMESON =3D &quot;-Dos_type=3Dsuse&quot;<br>
<br>
and be done with it?<br></blockquote></div></div><div dir=3D"auto"><br></di=
v><div dir=3D"auto">I wondered about using this but</div><div dir=3D"auto">=
- the suze can change in the future and without the patch there won&#39;t b=
e any warning</div><div dir=3D"auto">- it felt weird (I&#39;ll admit this i=
s not a strong argument... ;) )</div><div dir=3D"auto"><br></div><div dir=
=3D"auto">I&#39;ll send a v2 without the patch and &quot;-Dos_type=3Dsuse&q=
uot; so Khem may choose the one he prefers.</div><div dir=3D"auto"><br></di=
v><div dir=3D"auto">Thanks!</div><div dir=3D"auto"><div class=3D"gmail_quot=
e"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
&gt; +<br>
&gt;=C2=A0 PACKAGECONFIG =3D &quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0${@bb.utils.filter(&#39;DISTRO_FEATURES&#39;=
, &#39;pam&#39;, d)} \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0${@bb.utils.contains(&#39;DISTRO_FEATURES&#3=
9;, &#39;systemd&#39;, &#39;systemd&#39;, &#39;consolekit&#39;, d)} \<br>
<br>
//Peter<br>
<br>
</blockquote></div></div></div>

--0000000000006c1d300621596065--

