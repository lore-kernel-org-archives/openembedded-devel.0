Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D878C4706F
	for <webhook@archiver.kernel.org>; Mon,  1 Jan 2024 07:53:23 +0000 (UTC)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
 by mx.groups.io with SMTP id smtpd.web10.1292.1704095599595798380
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 31 Dec 2023 23:53:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=op2IRJbC;
 spf=pass (domain: konsulko.com, ip: 209.85.222.172, mailfrom: leon.anavi@konsulko.com)
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-7815fc8dd17so261744885a.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 31 Dec 2023 23:53:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1704095598; x=1704700398; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=C0hxbvghlHSftfg7D8sGsHBQjRutKWUzYgaQ37eMzRU=;
        b=op2IRJbCyzyb6wf+2e6wltRXDfsB1NjpVVUn7M+x26CZ8Zoa92qR2Jw09eVtYrdlNI
         zyiWZ+FOqwt8MC8b+s3O03Dm0CimRqe0a1VNpWv95OnVAPwd8A4Q4sMD5ia0i972uBt7
         2lva7nNeNllP1dC01MLVM1QuU16kSliDqx7GQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704095598; x=1704700398;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C0hxbvghlHSftfg7D8sGsHBQjRutKWUzYgaQ37eMzRU=;
        b=qaF62YEDu8mLe9ntuzQiR83MrFDom02UVSfIxsSh9ZU9KkPQc1mYgC7xaSKB3x/A5P
         AbMyabspUCakkismGGTEjV7ZdTri5//7+8bP8l/k+hhceXDXKKQd1lpBKTZ7/vAUzWev
         Yn3jqIrlodSk4MRlY2wzt9UUOA+nR4goHP/r23ZtAksVFDASvAjwnd+rahS8FAs4OpWk
         CmExfU2mii5daUFbs4krqYeNmXULowVuz2WPLXZJqbwWIDnOrpKz4hmW9EYJGo+0NWe4
         3v1YkGFu7zHX5Dp4rDXaV7ks5n2Hils7vXduYYT3u0h3kR6lvdgCQZQD+YLMVdUVTsao
         AmHA==
X-Gm-Message-State: AOJu0YzQZtOYrJoOOTzWoJdFuohBL91adA3cz0PTNYhojzzDpGuxXJzT
	/tr5VEdlwo3LdyMqYpJg5M1RLPfcMrsxXK62sffwBHhTTH6N7Q==
X-Google-Smtp-Source: AGHT+IF6MdU+Jy37SfBiwqkkbr1nCdqYuHcEGpg9BdRQXyA9bHEmOu6KwT0hHk73uEzE90bmDVC2/W5WN3XcTAi5Jnw=
X-Received: by 2002:a0c:e6c8:0:b0:680:9cb:344e with SMTP id
 l8-20020a0ce6c8000000b0068009cb344emr11048439qvn.21.1704095598576; Sun, 31
 Dec 2023 23:53:18 -0800 (PST)
MIME-Version: 1.0
References: <20231230171056.1297800-1-leon.anavi@konsulko.com> <CAMKF1spd5J8EKq3ey9duGEMNTbRADQ0CeNe3Ws50SnUBUsA7qQ@mail.gmail.com>
In-Reply-To: <CAMKF1spd5J8EKq3ey9duGEMNTbRADQ0CeNe3Ws50SnUBUsA7qQ@mail.gmail.com>
From: Leon Anavi <leon.anavi@konsulko.com>
Date: Mon, 1 Jan 2024 09:53:08 +0200
Message-ID: <CALtQ3O2vwuXewMzFgh7++Ok6X4Jm2iPRMYom-Dg4N9K+Ptjj6g@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] ssd1306_git.bb: Add ssd1306_linux
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000d11e5c060dddaca9"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 Jan 2024 07:53:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107983

--000000000000d11e5c060dddaca9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Khem,

Happy New Year! Best wishes for 2024.

On Sat, Dec 30, 2023, 19:39 Khem Raj <raj.khem@gmail.com> wrote:

>
>
> On Sat, Dec 30, 2023 at 9:11=E2=80=AFAM Leon Anavi <leon.anavi@konsulko.c=
om>
> wrote:
>
>> Add ssd1306_linux, a simple OLED I2C SSD1306 Linux driver based on
>> the i2c library libi2c from i2c-tools. Example usage for a
>> compatible display with resolution 128x64 pixels:
>>
>> ssd1306_bin -n 1 -I 128x64
>> ssd1306_bin -n 1 -c
>> ssd1306_bin -n 1 -r 0
>> ssd1306_bin -n 1 -x 1 -y 1
>> ssd1306_bin -n 1 -l "Hello World"
>>
>> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
>> ---
>>  .../ssd1306/0001-Use-include-filename.patch   | 49 +++++++++++++++++++
>>  .../recipes-devtools/ssd1306/ssd1306_git.bb   | 25 ++++++++++
>>  2 files changed, 74 insertions(+)
>>  create mode 100644
>> meta-oe/recipes-devtools/ssd1306/ssd1306/0001-Use-include-filename.patch
>>  create mode 100644 meta-oe/recipes-devtools/ssd1306/ssd1306_git.bb
>>
>> diff --git
>> a/meta-oe/recipes-devtools/ssd1306/ssd1306/0001-Use-include-filename.pat=
ch
>> b/meta-oe/recipes-devtools/ssd1306/ssd1306/0001-Use-include-filename.pat=
ch
>> new file mode 100644
>> index 000000000..9ec682c7b
>> --- /dev/null
>> +++
>> b/meta-oe/recipes-devtools/ssd1306/ssd1306/0001-Use-include-filename.pat=
ch
>> @@ -0,0 +1,49 @@
>> +From cb32ebbb1efb3202808809861ec3cbd811c55bd2 Mon Sep 17 00:00:00 2001
>> +From: Leon Anavi <leon.anavi@konsulko.com>
>> +Date: Sat, 30 Dec 2023 13:23:31 +0000
>> +Subject: [PATCH] Use include "filename"
>> +
>> +Use include "filename" to include programmer-defined header files
>> +from the same directory as the file containing the directive.
>> +
>> +Upstream-Status: Pending
>
>
> I think it=E2=80=99s a good patch to submit upstream perhaps do that as w=
ell while
> you are at it
>

Yes, I have already opened a GitHub pull request to upstream this fix:
https://github.com/armlabs/ssd1306_linux/pull/4

Should I make any changes to the ssd1306 recipe to be accepted to meta-oe?

Best regards, Leon


>> +
>> +Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
>> +---
>> + main.c    | 2 +-
>> + ssd1306.c | 6 +++---
>> + 2 files changed, 4 insertions(+), 4 deletions(-)
>> +
>> +diff --git a/main.c b/main.c
>> +index c1ffc2f..18e2b84 100644
>> +--- a/main.c
>> ++++ b/main.c
>> +@@ -6,7 +6,7 @@
>> + #include <string.h>
>> + #include <fcntl.h>
>> + #include <sys/ioctl.h>
>> +-#include <ssd1306.h>
>> ++#include "ssd1306.h"
>> +
>> + void print_help()
>> + {
>> +diff --git a/ssd1306.c b/ssd1306.c
>> +index a03674a..2e6ba97 100644
>> +--- a/ssd1306.c
>> ++++ b/ssd1306.c
>> +@@ -8,9 +8,9 @@
>> + #include <string.h>
>> + #include <fcntl.h>
>> + #include <sys/ioctl.h>
>> +-#include <linux_i2c.h>
>> +-#include <ssd1306.h>
>> +-#include <font.h>
>> ++#include "linux_i2c.h"
>> ++#include "ssd1306.h"
>> ++#include "font.h"
>> +
>> + const char init_oled_type_file[] =3D "/tmp/.ssd1306_oled_type";
>> +
>> +--
>> +2.39.2
>> +
>> diff --git a/meta-oe/recipes-devtools/ssd1306/ssd1306_git.bb
>> b/meta-oe/recipes-devtools/ssd1306/ssd1306_git.bb
>> new file mode 100644
>> index 000000000..5adfd3ed6
>> --- /dev/null
>> +++ b/meta-oe/recipes-devtools/ssd1306/ssd1306_git.bb
>> @@ -0,0 +1,25 @@
>> +SUMMARY=3D"SSD1306 OLED I2C drive"
>> +DESCRIPTION =3D "SSD1306 OLED I2C driver working in Linux"
>> +HOMEPAGE =3D "https://github.com/armlabs/ssd1306_linux"
>> +SECTION =3D "console/utils"
>> +LICENSE =3D "MIT"
>> +
>> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D7b694e603a996c3bfdc6093ed1f7=
0c8f"
>> +
>> +SRC_URI =3D " \
>> +    git://
>> github.com/armlabs/ssd1306_linux.git;protocol=3Dhttps;branch=3Dmaster \
>> +    file://0001-Use-include-filename.patch \
>> +"
>> +SRCREV =3D "7375f1088732d243f7167c9a17725f1a860da587"
>> +
>> +S =3D "${WORKDIR}/git"
>> +
>> +# coreutils provides fmt which is used in the Makefile
>> +DEPENDS =3D "i2c-tools coreutils-native"
>> +
>> +EXTRA_OEMAKE =3D "CC=3D'${CC}' CFLAGS=3D'${CFLAGS}' LDFLAGS=3D'${LDFLAG=
S}'"
>> +
>> +do_install() {
>> +    install -d ${D}${bindir}
>> +    install -m 0755 ${B}/ssd1306_bin ${D}${bindir}
>> +}
>> --
>> 2.39.2
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#107908):
>> https://lists.openembedded.org/g/openembedded-devel/message/107908
>> Mute This Topic: https://lists.openembedded.org/mt/103434392/1997914
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
>> raj.khem@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>>

--000000000000d11e5c060dddaca9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hi Khem,<div dir=3D"auto"><br></div><div dir=3D"auto">Hap=
py=C2=A0New Year! Best wishes for 2024.</div><br><div class=3D"gmail_quote"=
 dir=3D"auto"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, Dec 30, 2023, 1=
9:39 Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank" r=
el=3D"noreferrer">raj.khem@gmail.com</a>&gt; wrote:<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;p=
adding-left:1ex"><div><br></div><div><br><div class=3D"gmail_quote"><div di=
r=3D"ltr" class=3D"gmail_attr">On Sat, Dec 30, 2023 at 9:11=E2=80=AFAM Leon=
 Anavi &lt;<a href=3D"mailto:leon.anavi@konsulko.com" rel=3D"noreferrer nor=
eferrer" target=3D"_blank">leon.anavi@konsulko.com</a>&gt; wrote:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">Add ssd1306_linux, a simple OLED I2C SSD1306=
 Linux driver based on<br>
the i2c library libi2c from i2c-tools. Example usage for a<br>
compatible display with resolution 128x64 pixels:<br>
<br>
ssd1306_bin -n 1 -I 128x64<br>
ssd1306_bin -n 1 -c<br>
ssd1306_bin -n 1 -r 0<br>
ssd1306_bin -n 1 -x 1 -y 1<br>
ssd1306_bin -n 1 -l &quot;Hello World&quot;<br>
<br>
Signed-off-by: Leon Anavi &lt;<a href=3D"mailto:leon.anavi@konsulko.com" re=
l=3D"noreferrer noreferrer" target=3D"_blank">leon.anavi@konsulko.com</a>&g=
t;<br>
---<br>
=C2=A0.../ssd1306/0001-Use-include-filename.patch=C2=A0 =C2=A0| 49 ++++++++=
+++++++++++<br>
=C2=A0.../recipes-devtools/ssd1306/<a href=3D"http://ssd1306_git.bb" rel=3D=
"noreferrer noreferrer noreferrer" target=3D"_blank">ssd1306_git.bb</a>=C2=
=A0 =C2=A0| 25 ++++++++++<br>
=C2=A02 files changed, 74 insertions(+)<br>
=C2=A0create mode 100644 meta-oe/recipes-devtools/ssd1306/ssd1306/0001-Use-=
include-filename.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-devtools/ssd1306/<a href=3D"http:/=
/ssd1306_git.bb" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank"=
>ssd1306_git.bb</a><br>
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
+From: Leon Anavi &lt;<a href=3D"mailto:leon.anavi@konsulko.com" rel=3D"nor=
eferrer noreferrer" target=3D"_blank">leon.anavi@konsulko.com</a>&gt;<br>
+Date: Sat, 30 Dec 2023 13:23:31 +0000<br>
+Subject: [PATCH] Use include &quot;filename&quot;<br>
+<br>
+Use include &quot;filename&quot; to include programmer-defined header file=
s<br>
+from the same directory as the file containing the directive.<br>
+<br>
+Upstream-Status: Pending</blockquote><div dir=3D"auto"><br></div><div dir=
=3D"auto">I think it=E2=80=99s a good patch to submit upstream perhaps do t=
hat as well while you are at it=C2=A0</div></div></div></blockquote></div><=
div dir=3D"auto"><br></div><div dir=3D"auto"><div dir=3D"auto">Yes, I have =
already opened a GitHub pull request to upstream this fix:</div><div dir=3D=
"auto"><a href=3D"https://github.com/armlabs/ssd1306_linux/pull/4">https://=
github.com/armlabs/ssd1306_linux/pull/4</a><br></div><div dir=3D"auto"><br>=
</div><div dir=3D"auto">Should I make any changes to the ssd1306 recipe to =
be accepted to meta-oe?</div><div dir=3D"auto"><br></div><div dir=3D"auto">=
Best regards, Leon</div></div><div dir=3D"auto"><br></div><div class=3D"gma=
il_quote" dir=3D"auto"><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div><div class=3D"gm=
ail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex" dir=3D"auto"><br>
+<br>
+Signed-off-by: Leon Anavi &lt;<a href=3D"mailto:leon.anavi@konsulko.com" r=
el=3D"noreferrer noreferrer" target=3D"_blank">leon.anavi@konsulko.com</a>&=
gt;<br>
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
.bb" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">ssd1306_git=
.bb</a> b/meta-oe/recipes-devtools/ssd1306/<a href=3D"http://ssd1306_git.bb=
" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">ssd1306_git.bb=
</a><br>
new file mode 100644<br>
index 000000000..5adfd3ed6<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-devtools/ssd1306/<a href=3D"http://ssd1306_git.bb" re=
l=3D"noreferrer noreferrer noreferrer" target=3D"_blank">ssd1306_git.bb</a>=
<br>
@@ -0,0 +1,25 @@<br>
+SUMMARY=3D&quot;SSD1306 OLED I2C drive&quot;<br>
+DESCRIPTION =3D &quot;SSD1306 OLED I2C driver working in Linux&quot;<br>
+HOMEPAGE =3D &quot;<a href=3D"https://github.com/armlabs/ssd1306_linux" re=
l=3D"noreferrer noreferrer noreferrer" target=3D"_blank">https://github.com=
/armlabs/ssd1306_linux</a>&quot;<br>
+SECTION =3D &quot;console/utils&quot;<br>
+LICENSE =3D &quot;MIT&quot;<br>
+<br>
+LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D7b694e603a996c3bfdc6093ed1=
f70c8f&quot;<br>
+<br>
+SRC_URI =3D &quot; \<br>
+=C2=A0 =C2=A0 git://<a href=3D"http://github.com/armlabs/ssd1306_linux.git=
;protocol=3Dhttps;branch=3Dmaster" rel=3D"noreferrer noreferrer noreferrer"=
 target=3D"_blank">github.com/armlabs/ssd1306_linux.git;protocol=3Dhttps;br=
anch=3Dmaster</a> \<br>
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
enembedded-devel/message/107908" rel=3D"noreferrer noreferrer noreferrer" t=
arget=3D"_blank">https://lists.openembedded.org/g/openembedded-devel/messag=
e/107908</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/103434392/199=
7914" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">https://li=
sts.openembedded.org/mt/103434392/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" rel=3D"noreferrer noreferrer" target=3D"_blank">openembedded-devel+o=
wner@lists.openembedded.org</a><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">https://=
lists.openembedded.org/g/openembedded-devel/unsub</a> [<a href=3D"mailto:ra=
j.khem@gmail.com" rel=3D"noreferrer noreferrer" target=3D"_blank">raj.khem@=
gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>
</blockquote></div></div>

--000000000000d11e5c060dddaca9--

