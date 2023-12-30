Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5A15C46CD2
	for <webhook@archiver.kernel.org>; Sat, 30 Dec 2023 17:39:56 +0000 (UTC)
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
 by mx.groups.io with SMTP id smtpd.web11.188977.1703957987430480701
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Dec 2023 09:39:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GrYj/YWX;
 spf=pass (domain: gmail.com, ip: 209.85.160.45, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-1f055438492so5919208fac.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 30 Dec 2023 09:39:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703957986; x=1704562786; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DB/ahcwoDXTohEQOXwn/7sxaN68/DO3l7mis1wIJkM4=;
        b=GrYj/YWXdCh8MzsIkYeTX9TpcrrhRBe87PiA8s/kdWwNr17lagWHkYdeyvCrn+nii4
         1x9WhkPeBVVXIHHGuXUKGBkvhTWzA6f01qSD9Kph7W3p1Q08Ht6DStNfoFm+GP02BdrN
         0l6/lspsdgDnGavih0rGIfxBspM0O6H3K+tSMN5h+87OA9mb9aXeVVP+ca0JQLUtLGLM
         +cUzHXbUzUHvjUJFDb5CPDunwZNejlPjQVFiurzFVGoETsMtVJVBu0e/5WcWCE7ZikA7
         UpkjtGTFk15tXYUd76fKyU6hHAxVNwcZO/KnZeJ0ydoHgPRas73xEHU2+Q6J2tCHpzfp
         EQMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703957986; x=1704562786;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DB/ahcwoDXTohEQOXwn/7sxaN68/DO3l7mis1wIJkM4=;
        b=xFB0C0XH634IlCIoJic2lXAiKsy5UPRN6OtVcAkTrHyaWD0/MPsgGTFK4zBM6QkyfX
         /Ll0GwdP7Bs6DB6ciMHqLzu5tdbzOswsANW5chR58cev7Xdl9LbclsBtOBlDMkqa2a8c
         +hi/cM+YPpamJVz0F9NIevJXAO6dWdUkTVqNE+Ws8aTGtulrh+7hmwgQN6WqkbMJvUjz
         XFOVGDfTmhTkkXCvRFXD3OIwqiT7oEdy4O6DoDUbw6V1VBPnTjRtFPp6oDD2FutsHigz
         /JJHRTLKUCtt7gRml1Keb/1uYyXf+PlNEaBzm8IVRiCoI9syp/AtL4B/x3OjWw14r3fQ
         Vy2w==
X-Gm-Message-State: AOJu0YyGKW7MtREttCG26h9b0q6iokCA7HAxYO+l7Urc5M3hzlF4IRnr
	0PqxZVbzRsMziuRC/CD1fSU/Wu/O1dkuK98oAGTZNih3
X-Google-Smtp-Source: AGHT+IGU/NoxgUJqIg2rmXxrVLmYqJNDNgl1foHiOOUbHHSYqbl6mQkuTgOegcQlQsIlcgcAElZXbjwjqzIPm4QWG9o=
X-Received: by 2002:a05:6870:392b:b0:1fb:75b:1311 with SMTP id
 b43-20020a056870392b00b001fb075b1311mr16354595oap.99.1703957986508; Sat, 30
 Dec 2023 09:39:46 -0800 (PST)
MIME-Version: 1.0
References: <20231230171056.1297800-1-leon.anavi@konsulko.com>
In-Reply-To: <20231230171056.1297800-1-leon.anavi@konsulko.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 30 Dec 2023 09:39:35 -0800
Message-ID: <CAMKF1spd5J8EKq3ey9duGEMNTbRADQ0CeNe3Ws50SnUBUsA7qQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] ssd1306_git.bb: Add ssd1306_linux
To: Leon Anavi <leon.anavi@konsulko.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000007f83b5060dbda2f4"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 30 Dec 2023 17:39:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107911

--0000000000007f83b5060dbda2f4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 30, 2023 at 9:11=E2=80=AFAM Leon Anavi <leon.anavi@konsulko.com=
> wrote:

> Add ssd1306_linux, a simple OLED I2C SSD1306 Linux driver based on
> the i2c library libi2c from i2c-tools. Example usage for a
> compatible display with resolution 128x64 pixels:
>
> ssd1306_bin -n 1 -I 128x64
> ssd1306_bin -n 1 -c
> ssd1306_bin -n 1 -r 0
> ssd1306_bin -n 1 -x 1 -y 1
> ssd1306_bin -n 1 -l "Hello World"
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
> ---
>  .../ssd1306/0001-Use-include-filename.patch   | 49 +++++++++++++++++++
>  .../recipes-devtools/ssd1306/ssd1306_git.bb   | 25 ++++++++++
>  2 files changed, 74 insertions(+)
>  create mode 100644
> meta-oe/recipes-devtools/ssd1306/ssd1306/0001-Use-include-filename.patch
>  create mode 100644 meta-oe/recipes-devtools/ssd1306/ssd1306_git.bb
>
> diff --git
> a/meta-oe/recipes-devtools/ssd1306/ssd1306/0001-Use-include-filename.patc=
h
> b/meta-oe/recipes-devtools/ssd1306/ssd1306/0001-Use-include-filename.patc=
h
> new file mode 100644
> index 000000000..9ec682c7b
> --- /dev/null
> +++
> b/meta-oe/recipes-devtools/ssd1306/ssd1306/0001-Use-include-filename.patc=
h
> @@ -0,0 +1,49 @@
> +From cb32ebbb1efb3202808809861ec3cbd811c55bd2 Mon Sep 17 00:00:00 2001
> +From: Leon Anavi <leon.anavi@konsulko.com>
> +Date: Sat, 30 Dec 2023 13:23:31 +0000
> +Subject: [PATCH] Use include "filename"
> +
> +Use include "filename" to include programmer-defined header files
> +from the same directory as the file containing the directive.
> +
> +Upstream-Status: Pending


I think it=E2=80=99s a good patch to submit upstream perhaps do that as wel=
l while
you are at it

>
> +
> +Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
> +---
> + main.c    | 2 +-
> + ssd1306.c | 6 +++---
> + 2 files changed, 4 insertions(+), 4 deletions(-)
> +
> +diff --git a/main.c b/main.c
> +index c1ffc2f..18e2b84 100644
> +--- a/main.c
> ++++ b/main.c
> +@@ -6,7 +6,7 @@
> + #include <string.h>
> + #include <fcntl.h>
> + #include <sys/ioctl.h>
> +-#include <ssd1306.h>
> ++#include "ssd1306.h"
> +
> + void print_help()
> + {
> +diff --git a/ssd1306.c b/ssd1306.c
> +index a03674a..2e6ba97 100644
> +--- a/ssd1306.c
> ++++ b/ssd1306.c
> +@@ -8,9 +8,9 @@
> + #include <string.h>
> + #include <fcntl.h>
> + #include <sys/ioctl.h>
> +-#include <linux_i2c.h>
> +-#include <ssd1306.h>
> +-#include <font.h>
> ++#include "linux_i2c.h"
> ++#include "ssd1306.h"
> ++#include "font.h"
> +
> + const char init_oled_type_file[] =3D "/tmp/.ssd1306_oled_type";
> +
> +--
> +2.39.2
> +
> diff --git a/meta-oe/recipes-devtools/ssd1306/ssd1306_git.bb
> b/meta-oe/recipes-devtools/ssd1306/ssd1306_git.bb
> new file mode 100644
> index 000000000..5adfd3ed6
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/ssd1306/ssd1306_git.bb
> @@ -0,0 +1,25 @@
> +SUMMARY=3D"SSD1306 OLED I2C drive"
> +DESCRIPTION =3D "SSD1306 OLED I2C driver working in Linux"
> +HOMEPAGE =3D "https://github.com/armlabs/ssd1306_linux"
> +SECTION =3D "console/utils"
> +LICENSE =3D "MIT"
> +
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D7b694e603a996c3bfdc6093ed1f70=
c8f"
> +
> +SRC_URI =3D " \
> +    git://
> github.com/armlabs/ssd1306_linux.git;protocol=3Dhttps;branch=3Dmaster \
> +    file://0001-Use-include-filename.patch \
> +"
> +SRCREV =3D "7375f1088732d243f7167c9a17725f1a860da587"
> +
> +S =3D "${WORKDIR}/git"
> +
> +# coreutils provides fmt which is used in the Makefile
> +DEPENDS =3D "i2c-tools coreutils-native"
> +
> +EXTRA_OEMAKE =3D "CC=3D'${CC}' CFLAGS=3D'${CFLAGS}' LDFLAGS=3D'${LDFLAGS=
}'"
> +
> +do_install() {
> +    install -d ${D}${bindir}
> +    install -m 0755 ${B}/ssd1306_bin ${D}${bindir}
> +}
> --
> 2.39.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#107908):
> https://lists.openembedded.org/g/openembedded-devel/message/107908
> Mute This Topic: https://lists.openembedded.org/mt/103434392/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000007f83b5060dbda2f4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Sat, Dec 30, 2023 at 9:11=E2=80=AFAM Leon Anavi &lt;<a h=
ref=3D"mailto:leon.anavi@konsulko.com">leon.anavi@konsulko.com</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex">Add ssd1306_linux, a simple OLED=
 I2C SSD1306 Linux driver based on<br>
the i2c library libi2c from i2c-tools. Example usage for a<br>
compatible display with resolution 128x64 pixels:<br>
<br>
ssd1306_bin -n 1 -I 128x64<br>
ssd1306_bin -n 1 -c<br>
ssd1306_bin -n 1 -r 0<br>
ssd1306_bin -n 1 -x 1 -y 1<br>
ssd1306_bin -n 1 -l &quot;Hello World&quot;<br>
<br>
Signed-off-by: Leon Anavi &lt;<a href=3D"mailto:leon.anavi@konsulko.com" ta=
rget=3D"_blank">leon.anavi@konsulko.com</a>&gt;<br>
---<br>
=C2=A0.../ssd1306/0001-Use-include-filename.patch=C2=A0 =C2=A0| 49 ++++++++=
+++++++++++<br>
=C2=A0.../recipes-devtools/ssd1306/<a href=3D"http://ssd1306_git.bb" rel=3D=
"noreferrer" target=3D"_blank">ssd1306_git.bb</a>=C2=A0 =C2=A0| 25 ++++++++=
++<br>
=C2=A02 files changed, 74 insertions(+)<br>
=C2=A0create mode 100644 meta-oe/recipes-devtools/ssd1306/ssd1306/0001-Use-=
include-filename.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-devtools/ssd1306/<a href=3D"http:/=
/ssd1306_git.bb" rel=3D"noreferrer" target=3D"_blank">ssd1306_git.bb</a><br=
>
<br>
diff --git a/meta-oe/recipes-devtools/ssd1306/ssd1306/0001-Use-include-file=
name.patch b/meta-oe/recipes-devtools/ssd1306/ssd1306/0001-Use-include-file=
name.patch<br>
new file mode 100644<br>
index 000000000..9ec682c7b<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-devtools/ssd1306/ssd1306/0001-Use-include-filename.pa=
tch<br>
@@ -0,0 +1,49 @@<br>
+From cb32ebbb1efb3202808809861ec3cbd811c55bd2 Mon Sep 17 00:00:00 2001<br>
+From: Leon Anavi &lt;<a href=3D"mailto:leon.anavi@konsulko.com" target=3D"=
_blank">leon.anavi@konsulko.com</a>&gt;<br>
+Date: Sat, 30 Dec 2023 13:23:31 +0000<br>
+Subject: [PATCH] Use include &quot;filename&quot;<br>
+<br>
+Use include &quot;filename&quot; to include programmer-defined header file=
s<br>
+from the same directory as the file containing the directive.<br>
+<br>
+Upstream-Status: Pending</blockquote><div dir=3D"auto"><br></div><div dir=
=3D"auto">I think it=E2=80=99s a good patch to submit upstream perhaps do t=
hat as well while you are at it=C2=A0</div><blockquote class=3D"gmail_quote=
" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex" d=
ir=3D"auto"><br>
+<br>
+Signed-off-by: Leon Anavi &lt;<a href=3D"mailto:leon.anavi@konsulko.com" t=
arget=3D"_blank">leon.anavi@konsulko.com</a>&gt;<br>
+---<br>
+ main.c=C2=A0 =C2=A0 | 2 +-<br>
+ ssd1306.c | 6 +++---<br>
+ 2 files changed, 4 insertions(+), 4 deletions(-)<br>
+<br>
+diff --git a/main.c b/main.c<br>
+index c1ffc2f..18e2b84 100644<br>
+--- a/main.c<br>
++++ b/main.c<br>
+@@ -6,7 +6,7 @@<br>
+ #include &lt;string.h&gt;<br>
+ #include &lt;fcntl.h&gt;<br>
+ #include &lt;sys/ioctl.h&gt;<br>
+-#include &lt;ssd1306.h&gt;<br>
++#include &quot;ssd1306.h&quot;<br>
+ <br>
+ void print_help()<br>
+ {<br>
+diff --git a/ssd1306.c b/ssd1306.c<br>
+index a03674a..2e6ba97 100644<br>
+--- a/ssd1306.c<br>
++++ b/ssd1306.c<br>
+@@ -8,9 +8,9 @@<br>
+ #include &lt;string.h&gt;<br>
+ #include &lt;fcntl.h&gt;<br>
+ #include &lt;sys/ioctl.h&gt;<br>
+-#include &lt;linux_i2c.h&gt;<br>
+-#include &lt;ssd1306.h&gt;<br>
+-#include &lt;font.h&gt;<br>
++#include &quot;linux_i2c.h&quot;<br>
++#include &quot;ssd1306.h&quot;<br>
++#include &quot;font.h&quot;<br>
+ <br>
+ const char init_oled_type_file[] =3D &quot;/tmp/.ssd1306_oled_type&quot;;=
<br>
+ <br>
+-- <br>
+2.39.2<br>
+<br>
diff --git a/meta-oe/recipes-devtools/ssd1306/<a href=3D"http://ssd1306_git=
.bb" rel=3D"noreferrer" target=3D"_blank">ssd1306_git.bb</a> b/meta-oe/reci=
pes-devtools/ssd1306/<a href=3D"http://ssd1306_git.bb" rel=3D"noreferrer" t=
arget=3D"_blank">ssd1306_git.bb</a><br>
new file mode 100644<br>
index 000000000..5adfd3ed6<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-devtools/ssd1306/<a href=3D"http://ssd1306_git.bb" re=
l=3D"noreferrer" target=3D"_blank">ssd1306_git.bb</a><br>
@@ -0,0 +1,25 @@<br>
+SUMMARY=3D&quot;SSD1306 OLED I2C drive&quot;<br>
+DESCRIPTION =3D &quot;SSD1306 OLED I2C driver working in Linux&quot;<br>
+HOMEPAGE =3D &quot;<a href=3D"https://github.com/armlabs/ssd1306_linux" re=
l=3D"noreferrer" target=3D"_blank">https://github.com/armlabs/ssd1306_linux=
</a>&quot;<br>
+SECTION =3D &quot;console/utils&quot;<br>
+LICENSE =3D &quot;MIT&quot;<br>
+<br>
+LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D7b694e603a996c3bfdc6093ed1=
f70c8f&quot;<br>
+<br>
+SRC_URI =3D &quot; \<br>
+=C2=A0 =C2=A0 git://<a href=3D"http://github.com/armlabs/ssd1306_linux.git=
;protocol=3Dhttps;branch=3Dmaster" rel=3D"noreferrer" target=3D"_blank">git=
hub.com/armlabs/ssd1306_linux.git;protocol=3Dhttps;branch=3Dmaster</a> \<br=
>
+=C2=A0 =C2=A0 file://0001-Use-include-filename.patch \<br>
+&quot;<br>
+SRCREV =3D &quot;7375f1088732d243f7167c9a17725f1a860da587&quot;<br>
+<br>
+S =3D &quot;${WORKDIR}/git&quot;<br>
+<br>
+# coreutils provides fmt which is used in the Makefile<br>
+DEPENDS =3D &quot;i2c-tools coreutils-native&quot;<br>
+<br>
+EXTRA_OEMAKE =3D &quot;CC=3D&#39;${CC}&#39; CFLAGS=3D&#39;${CFLAGS}&#39; L=
DFLAGS=3D&#39;${LDFLAGS}&#39;&quot;<br>
+<br>
+do_install() {<br>
+=C2=A0 =C2=A0 install -d ${D}${bindir}<br>
+=C2=A0 =C2=A0 install -m 0755 ${B}/ssd1306_bin ${D}${bindir}<br>
+}<br>
-- <br>
2.39.2<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#107908): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/107908" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/107908</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/103434392/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/103434392/1997914</a><br>
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

--0000000000007f83b5060dbda2f4--

