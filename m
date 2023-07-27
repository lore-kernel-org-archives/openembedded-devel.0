Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92064C001E0
	for <webhook@archiver.kernel.org>; Thu, 27 Jul 2023 17:06:21 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web11.13056.1690477572213701244
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 Jul 2023 10:06:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=jJ3WOJZM;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-31757edd9edso1276729f8f.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 27 Jul 2023 10:06:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690477570; x=1691082370;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rVE87Q01a8MKvF9w+JbAsmsStOo1mhtsiUxMlmF/n6c=;
        b=jJ3WOJZMPt2wWAryWPUPt3W2rsqo8bM0DC6iEoNr3hW8zCMVMQlaO319oG+Ts9Rs4P
         uaJdsCJFZTryioWBiRQL4u6e4UJeyvRhOZ/EfN3Cq/6Dgk7lElWiV5TfpG6HD9MLhbKB
         KVtvap/1Ka0TgPxgDjn0KxQHMSnsA25xs8dm/Vk7KqdlB8wNgHtHewD9pTcswOwae/xp
         /4rjkkK+0Dkop4qMR0z/FOc2IXlY0KlH+pIj6kydjRrOtsHBqit3TvIs2vsm/lOlXgKU
         6xzSO5MMd7Jybz76ZzALu9A0FR0IsO8Lex1qw+Hm+IQcu5ofwSh9LvCznT4lcM9UFQg1
         YRTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690477570; x=1691082370;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rVE87Q01a8MKvF9w+JbAsmsStOo1mhtsiUxMlmF/n6c=;
        b=ArT8EF7e0OFtdxYJgVEROn+7oTLTJw3blX8ytmGlnzdvN6pJqj6trYYhRqDOkAZPrD
         JvRKRpe/BsiAeID57MVsHwIYKmtRWeuCyP/j6+yVyAHQ1t+NJzS0EjwtFLGB/AjZv8K9
         H4jql1fZ6aG5z6bTz9ZkIsZmyPRkUfCCHDLcm/fbYSXGrHw8FLtV4B2RAtdVGG8zPk4F
         1mYz0R4qN8bk9wPNqPUPUiLp/0zW1QIAaDganwHgdGs1AqwsrPC3635F4sJTUzt8+ABG
         Bmn12/+PCHHK/0+4CMCUUSF3P3X5K0tHVyk4nEI+++kpbDcwkEzFOg1RztwHQ+6X+9mD
         YgZw==
X-Gm-Message-State: ABy/qLYIgxgkFQ4AQrp9wbGKy9Jdh4po5/pKJjKMbAnT5QZe2RWxW0AS
	DL2h9nCGBjXOayJCstg4/+lCvViQf9O7jmujgjQ=
X-Google-Smtp-Source: APBJJlG2qAOC1bUxEWvZcOtOOaD2uJR+8/pRrqIoLVHlkAu1YZjW3nSCMlUeQRjpXggYT7GDIbm3yXtMKjo2awrWWr4=
X-Received: by 2002:a5d:6e42:0:b0:317:71bb:7ccd with SMTP id
 j2-20020a5d6e42000000b0031771bb7ccdmr2172694wrz.52.1690477570353; Thu, 27 Jul
 2023 10:06:10 -0700 (PDT)
MIME-Version: 1.0
References: <MADEUP.177107BEF2CB09F0.32196@lists.openembedded.org>
In-Reply-To: <MADEUP.177107BEF2CB09F0.32196@lists.openembedded.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 27 Jul 2023 19:05:59 +0200
Message-ID: <CA+chaQeWcuya-FwohPB8g5Q_ZGx7-C_s7f_1z06e2LXeZWgUGw@mail.gmail.com>
Subject: Re: [oe] [AUH] python3-kivy: upgrading to 2.2.1 SUCCEEDED
To: auh@moto-timo.dev
Cc: openembedded-devel@lists.openembedded.org, 
	Brynn Rogers <tonkabot@gmail.com>
Content-Type: multipart/alternative; boundary="00000000000014f14306017afb90"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 27 Jul 2023 17:06:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104056

--00000000000014f14306017afb90
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

I'm not interested in kivy but I've noticed the extra '.' in filename since=
:
http://git.openembedded.org/meta-openembedded/commit/meta-python/recipes-de=
vtools/python/python3-kivy_2.1.0..bb?id=3D6fbe7f748706229f43a2e06b08b6e1e72=
9942314
if someone cares about kivy...

+Brynn who for some reason thinks I'm interested in kivy

Cheers,

On Wed, Jul 12, 2023 at 7:31=E2=80=AFAM <auh@moto-timo.dev> wrote:

> Hello,
>
> this email is a notification from the Auto Upgrade Helper
> that the automatic attempt to upgrade the recipe *python3-kivy* to *2.2.1=
*
> has Succeeded.
>
> Next steps:
>     - apply the patch: git am 0001-python3-kivy-upgrade-2.1.0.-2.2.1.patc=
h
>     - check the changes to upstream patches and summarize them in the
> commit message,
>     - compile an image that contains the package
>     - perform some basic sanity tests
>     - amend the patch and sign it off: git commit -s --reset-author --ame=
nd
>     - send it to the appropriate mailing list
>
> Alternatively, if you believe the recipe should not be upgraded at this
> time,
> you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
> automatic upgrades would no longer be attempted.
>
> Please review the attached files for further information and build/update
> failures.
> Any problem please file a bug at
> https://bugzilla.yoctoproject.org/enter_bug.cgi?product=3DAutomated%20Upd=
ate%20Handler
>
> Regards,
> The Upgrade Helper
>
> -- >8 --
> From 6a233fbd35c80ea5d4a482e62508bfd6eae1326c Mon Sep 17 00:00:00 2001
> From: Upgrade Helper <auh@moto-timo.dev>
> Date: Tue, 11 Jul 2023 19:53:27 -0500
> Subject: [PATCH] python3-kivy: upgrade 2.1.0. -> 2.2.1
>
> ---
>  .../0001-add-support-for-glesv2.patch         | 19 ++++++++---
>  ...3-kivy_2.1.0..bb =3D> python3-kivy_2.2.1.bb} | 32 ++++++++++++++-----
>  2 files changed, 39 insertions(+), 12 deletions(-)
>  rename meta-python/recipes-devtools/python/{python3-kivy_2.1.0..bb =3D>
> python3-kivy_2.2.1.bb} (65%)
>
> diff --git
> a/meta-python/recipes-devtools/python/python3-kivy/0001-add-support-for-g=
lesv2.patch
> b/meta-python/recipes-devtools/python/python3-kivy/0001-add-support-for-g=
lesv2.patch
> index 0abc6c5c7..13c3e56a0 100644
> ---
> a/meta-python/recipes-devtools/python/python3-kivy/0001-add-support-for-g=
lesv2.patch
> +++
> b/meta-python/recipes-devtools/python/python3-kivy/0001-add-support-for-g=
lesv2.patch
> @@ -1,8 +1,19 @@
> +From 9f9c659d9157afca5055eb6835ec763fa971d648 Mon Sep 17 00:00:00 2001
> +From: William Huang <whuang8933@gmail.com>
> +Date: Thu, 2 Sep 2021 07:25:07 -0400
> +Subject: [PATCH] recipes-devtools: python: add support for Kivy
> +
>  Upstream-Status: Pending
>
> +---
> + setup.py | 16 +++++++++++++---
> + 1 file changed, 13 insertions(+), 3 deletions(-)
> +
> +diff --git a/setup.py b/setup.py
> +index 35e34afdd..0ba3aca72 100644
>  --- a/setup.py
>  +++ b/setup.py
> -@@ -695,7 +695,18 @@ def determine_gl_flags():
> +@@ -730,7 +730,18 @@ def determine_gl_flags():
>           c_options['use_x11'] =3D True
>           c_options['use_egl'] =3D True
>       else:
> @@ -22,7 +33,7 @@ Upstream-Status: Pending
>       return flags, base_flags
>
>
> -@@ -723,14 +734,13 @@ def determine_sdl2():
> +@@ -774,14 +785,13 @@ def determine_sdl2():
>               sdl_inc =3D join(include, 'SDL2')
>               if isdir(sdl_inc):
>                   sdl2_paths.append(sdl_inc)
> @@ -36,5 +47,5 @@ Upstream-Status: Pending
>  -        ['/usr/local/lib/'])
>  +        [''])
>
> -     if sdl2_flags:
> -         flags =3D merge(flags, sdl2_flags)
> +     if kivy_sdl2_path:
> +         # If we have a custom path, we need to add the rpath to the
> linker
> diff --git a/meta-python/recipes-devtools/python/python3-kivy_2.1.0..bb
> b/meta-python/recipes-devtools/python/python3-kivy_2.2.1.bb
> similarity index 65%
> rename from meta-python/recipes-devtools/python/python3-kivy_2.1.0..bb
> rename to meta-python/recipes-devtools/python/python3-kivy_2.2.1.bb
> index ca1fc5f96..de546cef3 100644
> --- a/meta-python/recipes-devtools/python/python3-kivy_2.1.0..bb
> +++ b/meta-python/recipes-devtools/python/python3-kivy_2.2.1.bb
> @@ -1,24 +1,40 @@
> +# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool
> upgrade'.
> +# The following is the difference between the old and the new license
> text.
> +# Please update the LICENSE value if needed, and summarize the changes i=
n
> +# the commit message via 'License-Update:' tag.
> +# (example: 'License-Update: copyright years updated.')
> +#
> +# The changes:
> +#
> +# --- LICENSE
> +# +++ LICENSE
> +# @@ -1,4 +1,4 @@
> +# -Copyright (c) 2010-2022 Kivy Team and other contributors
> +# +Copyright (c) 2010-2023 Kivy Team and other contributors
> +#
> +#  Permission is hereby granted, free of charge, to any person obtaining
> a copy
> +#  of this software and associated documentation files (the "Software"),
> to deal
> +#
> +#
> +
>  SUMMARY =3D "Open source Python library for rapid development of
> applications \
>      that make use of innovative user interfaces, such as multi-touch
> apps."
>  HOMEPAGE =3D "https://kivy.org/"
>  LICENSE =3D "MIT"
> -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D22e7b4dd8140eec57fd7edfd9fa23=
dfc"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Ded5cd0f2cfda42852c332e3b88c85=
fea"
>
>  inherit setuptools3 pkgconfig features_check
>  PIP_INSTALL_PACKAGE =3D "Kivy"
>
> -SRC_URI =3D "\
> -    git://github.com/kivy/kivy.git;protocol=3Dhttps;branch=3Dmaster \
> -"
> +SRC_URI =3D "git://github.com/kivy/kivy.git;protocol=3Dhttps;branch=3Dst=
able \
> +           file://0001-add-support-for-glesv2.patch \
> +           "
>
>  # Kivy's setup files only look for GLES libraries for Android, iOS, RPi,
>  # and mali-based OS's. We need to patch the setup file to tell Kivy setu=
p
>  # that our machine has GLES libaries installed as well
>  # Also, if using SDL2 as backend, SDL2 needs to be configured wth gles
> -SRC_URI +=3D " \
> -    file://0001-add-support-for-glesv2.patch \
> -"
> -SRCREV =3D "960b95dc666753f59eff1b449124490fbec10184"
> +SRCREV =3D "344768bfefd2e8f5302cc9dfb8ca41991ce6f7e7"
>
>  S =3D "${WORKDIR}/git"
>
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#103775):
> https://lists.openembedded.org/g/openembedded-devel/message/103775
> Mute This Topic: https://lists.openembedded.org/mt/100094671/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> Martin.Jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000014f14306017afb90
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>I&#39;m not interested in kivy but =
I&#39;ve noticed the extra &#39;.&#39; in filename since:</div><div><a href=
=3D"http://git.openembedded.org/meta-openembedded/commit/meta-python/recipe=
s-devtools/python/python3-kivy_2.1.0..bb?id=3D6fbe7f748706229f43a2e06b08b6e=
1e729942314">http://git.openembedded.org/meta-openembedded/commit/meta-pyth=
on/recipes-devtools/python/python3-kivy_2.1.0..bb?id=3D6fbe7f748706229f43a2=
e06b08b6e1e729942314</a><br></div><div>if someone cares about kivy...</div>=
<div><br></div><div>+Brynn who for some reason thinks I&#39;m interested in=
 kivy<br></div><div><br></div><div>Cheers,</div></div><br><div class=3D"gma=
il_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jul 12, 2023 at 7:3=
1=E2=80=AFAM &lt;<a href=3D"mailto:auh@moto-timo.dev">auh@moto-timo.dev</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hell=
o,<br>
<br>
this email is a notification from the Auto Upgrade Helper<br>
that the automatic attempt to upgrade the recipe *python3-kivy* to *2.2.1* =
has Succeeded.<br>
<br>
Next steps:<br>
=C2=A0 =C2=A0 - apply the patch: git am 0001-python3-kivy-upgrade-2.1.0.-2.=
2.1.patch<br>
=C2=A0 =C2=A0 - check the changes to upstream patches and summarize them in=
 the commit message,<br>
=C2=A0 =C2=A0 - compile an image that contains the package<br>
=C2=A0 =C2=A0 - perform some basic sanity tests<br>
=C2=A0 =C2=A0 - amend the patch and sign it off: git commit -s --reset-auth=
or --amend<br>
=C2=A0 =C2=A0 - send it to the appropriate mailing list<br>
<br>
Alternatively, if you believe the recipe should not be upgraded at this tim=
e,<br>
you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that<br>
automatic upgrades would no longer be attempted.<br>
<br>
Please review the attached files for further information and build/update f=
ailures.<br>
Any problem please file a bug at <a href=3D"https://bugzilla.yoctoproject.o=
rg/enter_bug.cgi?product=3DAutomated%20Update%20Handler" rel=3D"noreferrer"=
 target=3D"_blank">https://bugzilla.yoctoproject.org/enter_bug.cgi?product=
=3DAutomated%20Update%20Handler</a><br>
<br>
Regards,<br>
The Upgrade Helper<br>
<br>
-- &gt;8 --<br>
From 6a233fbd35c80ea5d4a482e62508bfd6eae1326c Mon Sep 17 00:00:00 2001<br>
From: Upgrade Helper &lt;<a href=3D"mailto:auh@moto-timo.dev" target=3D"_bl=
ank">auh@moto-timo.dev</a>&gt;<br>
Date: Tue, 11 Jul 2023 19:53:27 -0500<br>
Subject: [PATCH] python3-kivy: upgrade 2.1.0. -&gt; 2.2.1<br>
<br>
---<br>
=C2=A0.../0001-add-support-for-glesv2.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 19 ++++++++---<br>
=C2=A0...3-kivy_2.1.0..bb =3D&gt; <a href=3D"http://python3-kivy_2.2.1.bb" =
rel=3D"noreferrer" target=3D"_blank">python3-kivy_2.2.1.bb</a>} | 32 ++++++=
++++++++-----<br>
=C2=A02 files changed, 39 insertions(+), 12 deletions(-)<br>
=C2=A0rename meta-python/recipes-devtools/python/{python3-kivy_2.1.0..bb =
=3D&gt; <a href=3D"http://python3-kivy_2.2.1.bb" rel=3D"noreferrer" target=
=3D"_blank">python3-kivy_2.2.1.bb</a>} (65%)<br>
<br>
diff --git a/meta-python/recipes-devtools/python/python3-kivy/0001-add-supp=
ort-for-glesv2.patch b/meta-python/recipes-devtools/python/python3-kivy/000=
1-add-support-for-glesv2.patch<br>
index 0abc6c5c7..13c3e56a0 100644<br>
--- a/meta-python/recipes-devtools/python/python3-kivy/0001-add-support-for=
-glesv2.patch<br>
+++ b/meta-python/recipes-devtools/python/python3-kivy/0001-add-support-for=
-glesv2.patch<br>
@@ -1,8 +1,19 @@<br>
+From 9f9c659d9157afca5055eb6835ec763fa971d648 Mon Sep 17 00:00:00 2001<br>
+From: William Huang &lt;<a href=3D"mailto:whuang8933@gmail.com" target=3D"=
_blank">whuang8933@gmail.com</a>&gt;<br>
+Date: Thu, 2 Sep 2021 07:25:07 -0400<br>
+Subject: [PATCH] recipes-devtools: python: add support for Kivy<br>
+<br>
=C2=A0Upstream-Status: Pending<br>
<br>
+---<br>
+ setup.py | 16 +++++++++++++---<br>
+ 1 file changed, 13 insertions(+), 3 deletions(-)<br>
+<br>
+diff --git a/setup.py b/setup.py<br>
+index 35e34afdd..0ba3aca72 100644<br>
=C2=A0--- a/setup.py<br>
=C2=A0+++ b/setup.py<br>
-@@ -695,7 +695,18 @@ def determine_gl_flags():<br>
+@@ -730,7 +730,18 @@ def determine_gl_flags():<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 c_options[&#39;use_x11&#39;] =3D True<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 c_options[&#39;use_egl&#39;] =3D True<br=
>
=C2=A0 =C2=A0 =C2=A0 else:<br>
@@ -22,7 +33,7 @@ Upstream-Status: Pending<br>
=C2=A0 =C2=A0 =C2=A0 return flags, base_flags<br>
<br>
<br>
-@@ -723,14 +734,13 @@ def determine_sdl2():<br>
+@@ -774,14 +785,13 @@ def determine_sdl2():<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sdl_inc =3D join(include, =
&#39;SDL2&#39;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if isdir(sdl_inc):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sdl2_paths.a=
ppend(sdl_inc)<br>
@@ -36,5 +47,5 @@ Upstream-Status: Pending<br>
=C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 [&#39;/usr/local/lib/&#39;])<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 [&#39;&#39;])<br>
<br>
-=C2=A0 =C2=A0 =C2=A0if sdl2_flags:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0flags =3D merge(flags, sdl2_flags)<br>
+=C2=A0 =C2=A0 =C2=A0if kivy_sdl2_path:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# If we have a custom path, we need to a=
dd the rpath to the linker<br>
diff --git a/meta-python/recipes-devtools/python/python3-kivy_2.1.0..bb b/m=
eta-python/recipes-devtools/python/<a href=3D"http://python3-kivy_2.2.1.bb"=
 rel=3D"noreferrer" target=3D"_blank">python3-kivy_2.2.1.bb</a><br>
similarity index 65%<br>
rename from meta-python/recipes-devtools/python/python3-kivy_2.1.0..bb<br>
rename to meta-python/recipes-devtools/python/<a href=3D"http://python3-kiv=
y_2.2.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-kivy_2.2.1.bb</a><=
br>
index ca1fc5f96..de546cef3 100644<br>
--- a/meta-python/recipes-devtools/python/python3-kivy_2.1.0..bb<br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-kivy_2.=
2.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-kivy_2.2.1.bb</a><br>
@@ -1,24 +1,40 @@<br>
+# FIXME: the LIC_FILES_CHKSUM values have been updated by &#39;devtool upg=
rade&#39;.<br>
+# The following is the difference between the old and the new license text=
.<br>
+# Please update the LICENSE value if needed, and summarize the changes in<=
br>
+# the commit message via &#39;License-Update:&#39; tag.<br>
+# (example: &#39;License-Update: copyright years updated.&#39;)<br>
+#<br>
+# The changes:<br>
+#<br>
+# --- LICENSE<br>
+# +++ LICENSE<br>
+# @@ -1,4 +1,4 @@<br>
+# -Copyright (c) 2010-2022 Kivy Team and other contributors<br>
+# +Copyright (c) 2010-2023 Kivy Team and other contributors<br>
+#=C2=A0 <br>
+#=C2=A0 Permission is hereby granted, free of charge, to any person obtain=
ing a copy<br>
+#=C2=A0 of this software and associated documentation files (the &quot;Sof=
tware&quot;), to deal<br>
+# <br>
+#<br>
+<br>
=C2=A0SUMMARY =3D &quot;Open source Python library for rapid development of=
 applications \<br>
=C2=A0 =C2=A0 =C2=A0that make use of innovative user interfaces, such as mu=
lti-touch apps.&quot;<br>
=C2=A0HOMEPAGE =3D &quot;<a href=3D"https://kivy.org/" rel=3D"noreferrer" t=
arget=3D"_blank">https://kivy.org/</a>&quot;<br>
=C2=A0LICENSE =3D &quot;MIT&quot;<br>
-LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D22e7b4dd8140eec57fd7edfd9f=
a23dfc&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3Ded5cd0f2cfda42852c332e3b88=
c85fea&quot;<br>
<br>
=C2=A0inherit setuptools3 pkgconfig features_check<br>
=C2=A0PIP_INSTALL_PACKAGE =3D &quot;Kivy&quot;<br>
<br>
-SRC_URI =3D &quot;\<br>
-=C2=A0 =C2=A0 git://<a href=3D"http://github.com/kivy/kivy.git;protocol=3D=
https;branch=3Dmaster" rel=3D"noreferrer" target=3D"_blank">github.com/kivy=
/kivy.git;protocol=3Dhttps;branch=3Dmaster</a> \<br>
-&quot;<br>
+SRC_URI =3D &quot;git://<a href=3D"http://github.com/kivy/kivy.git;protoco=
l=3Dhttps;branch=3Dstable" rel=3D"noreferrer" target=3D"_blank">github.com/=
kivy/kivy.git;protocol=3Dhttps;branch=3Dstable</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-add-support-for-glesv=
2.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
=C2=A0# Kivy&#39;s setup files only look for GLES libraries for Android, iO=
S, RPi,<br>
=C2=A0# and mali-based OS&#39;s. We need to patch the setup file to tell Ki=
vy setup<br>
=C2=A0# that our machine has GLES libaries installed as well<br>
=C2=A0# Also, if using SDL2 as backend, SDL2 needs to be configured wth gle=
s<br>
-SRC_URI +=3D &quot; \<br>
-=C2=A0 =C2=A0 file://0001-add-support-for-glesv2.patch \<br>
-&quot;<br>
-SRCREV =3D &quot;960b95dc666753f59eff1b449124490fbec10184&quot;<br>
+SRCREV =3D &quot;344768bfefd2e8f5302cc9dfb8ca41991ce6f7e7&quot;<br>
<br>
=C2=A0S =3D &quot;${WORKDIR}/git&quot;<br>
<br>
-- <br>
2.25.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#103775): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/103775" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/103775</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/100094671/361=
7156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/100094671/3617156</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:Martin.Jansa@gmail.com" =
target=3D"_blank">Martin.Jansa@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--00000000000014f14306017afb90--

