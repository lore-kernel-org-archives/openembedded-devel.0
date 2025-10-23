Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97E8FCCD1BE
	for <webhook@archiver.kernel.org>; Thu, 23 Oct 2025 15:30:53 +0000 (UTC)
Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
 by mx.groups.io with SMTP id smtpd.web11.24703.1761233446671835982
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Oct 2025 08:30:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mLFiWow7;
 spf=pass (domain: gmail.com, ip: 74.125.224.53, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-63e0dd765a0so970633d50.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 23 Oct 2025 08:30:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761233446; x=1761838246; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5C51XSlEP1/yODb5WJRVLd7sH7q6DS0b2Kao2APojO8=;
        b=mLFiWow7gkyOby7I2qQLbhgqR1KtlLAk9mZoLGy0kfS64S+7cqHmYrA8zGinqhaIm7
         MxpVlJimWH0DWjRGxX2t0qYQACsZh8o7LvA9BG9SrswTATNlk1G557uNDwywMjtU0TIg
         47z1jBKTWP7D9c0nM8q6Fdbwfn40aZZAaCWu2IfHGYMastV+t0v98C/Ls+Vx7WKsl4Q0
         sMfoTaaBDMapvF6+FDFyNylZBi+2nhL71M/ulk80nU7Nxe3uTFB/sJlae6HX9LaeWdnC
         pOjWw2bbsuxNf9/zEmR0fVofmYNdP5DoO3CcMCgr1QaW/6onG4h/84C+5vnerfwlewIn
         kaBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761233446; x=1761838246;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5C51XSlEP1/yODb5WJRVLd7sH7q6DS0b2Kao2APojO8=;
        b=NwC1X8GQE95YngqDsPJzx/9ViuVfKQE9EyMHW+2Izkfc8Nvy411wDNv83X74/vdPsv
         WKunt6/WjwOh2+OaT1ffo2UURFdc9TCnpDDqlGQMNbVTIxvzshQobCGfVs/J2GUGscex
         NjMXO/HEGj3U67NaGlDHtpwNo66fks4VofJDufv9d77xqbmIOOqpMGYjjyttbU9XdpZu
         SaemY2HJJiDxLRMJdF9eobtOgiDL5SltoCT3wlJu1/EgbDlJtvPFNxpGIXkB6KgoesAK
         gsYvpvQTDtLHYcgkX7FgzzrN3NSmG4Aoet2SXHAInt5l1BOdsygZT7k6uw5Zq3So1zSz
         RhyA==
X-Gm-Message-State: AOJu0Ywr8r7252GTMjqeKqwRQbDYDid3FsOH54EShg2WA06lOckigH58
	W9COusGMgOl/vyYu1S51ydL7pB9EvxfghisNvP/qspZVGbMN1VqlkrhOsPOYdbPeLhMh2mTfVsU
	/eREV/DZWZbm8oGTSN6epHWtohEzXYAA=
X-Gm-Gg: ASbGncu3qNgr9ItindkRfbkx9EtDDI3Ac/BSOM6A2verj5qV2fptrWRDvJI7xZBv7yH
	nF6ravJ8mRI4SHm6m4d0a0jOFlCLeUEEExZkf0WfGBUcXaFLqkDgQD4qMn4nZUhkmMwKm5TLshR
	avsNJJHmsK3d4UdGrkBE6MG/Nm622c7qdEX9METtDIeZdrlPo3fLGNj5dLSMlLHB9h3kqKUniY8
	M2ADdFmHg21CBPo5UXyGtosWPQ0RxN+GvL7Cupg+Q+o27/OQiSDhY3NHjd6gzR0FosLlWaITW/s
	Omw1upRl10bWFEYpZTwm8LxvE1TrQpTYJLlKUwxJE19WshwIhgWpejlPg5oVI5+bTSeU4sGNLhK
	FGSDDwO4/OrYgcnbCLDvAFToa6w==
X-Google-Smtp-Source: AGHT+IFO7iDgidXPIYL4NLBX6DdgjtV6v2inbJ7vbWHMZnnDgeS1kouQJebbhgEL+j5gNhMLFstnhNe8UT+c97IrbXo=
X-Received: by 2002:a05:690c:25c6:b0:780:fdbb:5265 with SMTP id
 00721157ae682-7836d1c62b1mr383899957b3.19.1761233445706; Thu, 23 Oct 2025
 08:30:45 -0700 (PDT)
MIME-Version: 1.0
References: <20251023105231.688693-1-virendra.thakur@kpit.com>
In-Reply-To: <20251023105231.688693-1-virendra.thakur@kpit.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 23 Oct 2025 08:30:34 -0700
X-Gm-Features: AS18NWDIO7rljtCPQX4-F_oaG1ZEjT4VaCOJ7CYIbU1Es_wTmuKqky9kUC4f9EM
Message-ID: <CAMKF1spRb_7=zb7BiKQ42VCLeNDKxN0aRiWO8uvYwXJAme5amw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][scarthgap][PATCH] inotify-tools: add ptest support
 for inotify-tools
To: thakur.virendra1810@gmail.com
Cc: openembedded-devel@lists.openembedded.org, 
	Nikhil R <nikhil.r@bmwtechworks.in>
Content-Type: multipart/alternative; boundary="000000000000e5eafd0641d51de3"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 23 Oct 2025 15:30:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120937

--000000000000e5eafd0641d51de3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This should be in master as well and then back ported to release branches
please submit it against master first after making sure it works there

On Thu, Oct 23, 2025 at 3:52=E2=80=AFAM virendra thakur via lists.openembed=
ded.org
<thakur.virendra1810=3Dgmail.com@lists.openembedded.org> wrote:

> Add ptest support for inotify-tools by introducing a run-ptest script.
> The ptest verifies the correct functioning of inotify event handling
> and related utilities.
>
> Test coverage includes:
>  - File creation, modification, and deletion event monitoring
>  - Event handling and command-line option parsing
>  - Basic consistency and behavior of inotify event queues
>
> The ptest completes in under 20 seconds
>
> Signed-off-by: Nikhil R <nikhil.r@bmwtechworks.in>
> Signed-off-by: Virendra Thakur <virendra.thakur@kpit.com>
> ---
>  .../inotify-tools/inotify-tools/run-ptest     | 21 +++++++++++++++++++
>  .../inotify-tools/inotify-tools_3.22.6.0.bb   | 16 +++++++++++++-
>  2 files changed, 36 insertions(+), 1 deletion(-)
>  create mode 100644
> meta-oe/recipes-support/inotify-tools/inotify-tools/run-ptest
>
> diff --git a/meta-oe/recipes-support/inotify-tools/inotify-tools/run-ptes=
t
> b/meta-oe/recipes-support/inotify-tools/inotify-tools/run-ptest
> new file mode 100644
> index 0000000000..f3b23d86f0
> --- /dev/null
> +++ b/meta-oe/recipes-support/inotify-tools/inotify-tools/run-ptest
> @@ -0,0 +1,21 @@
> +#!/bin/sh
> +# run-ptest for inotify-tools
> +
> +set -e
> +
> +# Run the test binary and capture output
> +output=3D$(./test)
> +
> +# Print the output for logging
> +echo "$output"
> +
> +# Extract the summary line
> +summary=3D$(echo "$output" | tail -n 1)
> +
> +# Check if any tests failed
> +if echo "$summary" | grep -q "0 failed"; then
> +    exit 0
> +else
> +    echo "Some tests failed!"
> +    exit 1
> +fi
> diff --git a/meta-oe/recipes-support/inotify-tools/
> inotify-tools_3.22.6.0.bb b/meta-oe/recipes-support/inotify-tools/
> inotify-tools_3.22.6.0.bb
> index 8a0ae17ad7..3629ce45b2 100644
> --- a/meta-oe/recipes-support/inotify-tools/inotify-tools_3.22.6.0.bb
> +++ b/meta-oe/recipes-support/inotify-tools/inotify-tools_3.22.6.0.bb
> @@ -10,11 +10,12 @@ SRC_URI =3D "git://
> github.com/${BPN}/${BPN};branch=3Dmaster;protocol=3Dhttps
> <http://github.com/$%7BBPN%7D/$%7BBPN%7D;branch=3Dmaster;protocol=3Dhttps=
> \
>
> file://0002-libinotifytools-Bridge-differences-between-musl-glib.patch \
>
> file://0002-configure-Add-AC_SYS_LARGEFILE-autoconf-macro.patch \
>             file://0003-replace-stat64-lstat64-with-stat-lstat.patch \
> +           file://run-ptest \
>             "
>
>  S =3D "${WORKDIR}/git"
>
> -inherit autotools
> +inherit autotools ptest
>
>  EXTRA_OECONF =3D "--disable-doxygen"
>
> @@ -25,3 +26,16 @@ CFLAGS +=3D "-Wno-error"
>  PACKAGES =3D+ "libinotifytools"
>
>  FILES:libinotifytools =3D "${libdir}/lib*.so.*"
> +
> +do_compile_ptest() {
> +        cd libinotifytools/src
> +        oe_runmake
> +        oe_runmake test
> +}
> +
> +do_install_ptest() {
> +    install -d ${D}${PTEST_PATH}
> +    cp -r ${B}/libinotifytools/src/.libs/test ${D}${PTEST_PATH}/
> +}
> +
> +FILES:${PN}-ptest +=3D "${PTEST_PATH}"
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#120932):
> https://lists.openembedded.org/g/openembedded-devel/message/120932
> Mute This Topic: https://lists.openembedded.org/mt/115908396/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000e5eafd0641d51de3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">This should be in master as well and then back ported to =
release branches please submit it against master first after making sure it=
 works there=C2=A0</div><div><br><div class=3D"gmail_quote gmail_quote_cont=
ainer"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Oct 23, 2025 at 3:52=
=E2=80=AFAM virendra thakur via <a href=3D"http://lists.openembedded.org">l=
ists.openembedded.org</a> &lt;thakur.virendra1810=3D<a href=3D"mailto:gmail=
.com@lists.openembedded.org">gmail.com@lists.openembedded.org</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex">Add ptest support for inotify-too=
ls by introducing a run-ptest script.<br>
The ptest verifies the correct functioning of inotify event handling<br>
and related utilities.<br>
<br>
Test coverage includes:<br>
=C2=A0- File creation, modification, and deletion event monitoring<br>
=C2=A0- Event handling and command-line option parsing<br>
=C2=A0- Basic consistency and behavior of inotify event queues<br>
<br>
The ptest completes in under 20 seconds<br>
<br>
Signed-off-by: Nikhil R &lt;<a href=3D"mailto:nikhil.r@bmwtechworks.in" tar=
get=3D"_blank">nikhil.r@bmwtechworks.in</a>&gt;<br>
Signed-off-by: Virendra Thakur &lt;<a href=3D"mailto:virendra.thakur@kpit.c=
om" target=3D"_blank">virendra.thakur@kpit.com</a>&gt;<br>
---<br>
=C2=A0.../inotify-tools/inotify-tools/run-ptest=C2=A0 =C2=A0 =C2=A0| 21 +++=
++++++++++++++++<br>
=C2=A0.../inotify-tools/<a href=3D"http://inotify-tools_3.22.6.0.bb" rel=3D=
"noreferrer" target=3D"_blank">inotify-tools_3.22.6.0.bb</a>=C2=A0 =C2=A0| =
16 +++++++++++++-<br>
=C2=A02 files changed, 36 insertions(+), 1 deletion(-)<br>
=C2=A0create mode 100644 meta-oe/recipes-support/inotify-tools/inotify-tool=
s/run-ptest<br>
<br>
diff --git a/meta-oe/recipes-support/inotify-tools/inotify-tools/run-ptest =
b/meta-oe/recipes-support/inotify-tools/inotify-tools/run-ptest<br>
new file mode 100644<br>
index 0000000000..f3b23d86f0<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-support/inotify-tools/inotify-tools/run-ptest<br>
@@ -0,0 +1,21 @@<br>
+#!/bin/sh<br>
+# run-ptest for inotify-tools<br>
+<br>
+set -e<br>
+<br>
+# Run the test binary and capture output<br>
+output=3D$(./test)<br>
+<br>
+# Print the output for logging<br>
+echo &quot;$output&quot;<br>
+<br>
+# Extract the summary line<br>
+summary=3D$(echo &quot;$output&quot; | tail -n 1)<br>
+<br>
+# Check if any tests failed<br>
+if echo &quot;$summary&quot; | grep -q &quot;0 failed&quot;; then<br>
+=C2=A0 =C2=A0 exit 0<br>
+else<br>
+=C2=A0 =C2=A0 echo &quot;Some tests failed!&quot;<br>
+=C2=A0 =C2=A0 exit 1<br>
+fi<br>
diff --git a/meta-oe/recipes-support/inotify-tools/<a href=3D"http://inotif=
y-tools_3.22.6.0.bb" rel=3D"noreferrer" target=3D"_blank">inotify-tools_3.2=
2.6.0.bb</a> b/meta-oe/recipes-support/inotify-tools/<a href=3D"http://inot=
ify-tools_3.22.6.0.bb" rel=3D"noreferrer" target=3D"_blank">inotify-tools_3=
.22.6.0.bb</a><br>
index 8a0ae17ad7..3629ce45b2 100644<br>
--- a/meta-oe/recipes-support/inotify-tools/<a href=3D"http://inotify-tools=
_3.22.6.0.bb" rel=3D"noreferrer" target=3D"_blank">inotify-tools_3.22.6.0.b=
b</a><br>
+++ b/meta-oe/recipes-support/inotify-tools/<a href=3D"http://inotify-tools=
_3.22.6.0.bb" rel=3D"noreferrer" target=3D"_blank">inotify-tools_3.22.6.0.b=
b</a><br>
@@ -10,11 +10,12 @@ SRC_URI =3D &quot;git://<a href=3D"http://github.com/$%=
7BBPN%7D/$%7BBPN%7D;branch=3Dmaster;protocol=3Dhttps" rel=3D"noreferrer" ta=
rget=3D"_blank">github.com/${BPN}/${BPN};branch=3Dmaster;protocol=3Dhttps</=
a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0002-libinotifytools-Bridg=
e-differences-between-musl-glib.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0002-configure-Add-AC_SYS_=
LARGEFILE-autoconf-macro.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0003-replace-stat64-lstat6=
4-with-stat-lstat.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://run-ptest \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
=C2=A0S =3D &quot;${WORKDIR}/git&quot;<br>
<br>
-inherit autotools<br>
+inherit autotools ptest<br>
<br>
=C2=A0EXTRA_OECONF =3D &quot;--disable-doxygen&quot;<br>
<br>
@@ -25,3 +26,16 @@ CFLAGS +=3D &quot;-Wno-error&quot;<br>
=C2=A0PACKAGES =3D+ &quot;libinotifytools&quot;<br>
<br>
=C2=A0FILES:libinotifytools =3D &quot;${libdir}/lib*.so.*&quot;<br>
+<br>
+do_compile_ptest() {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 cd libinotifytools/src<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 oe_runmake<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 oe_runmake test<br>
+}<br>
+<br>
+do_install_ptest() {<br>
+=C2=A0 =C2=A0 install -d ${D}${PTEST_PATH}<br>
+=C2=A0 =C2=A0 cp -r ${B}/libinotifytools/src/.libs/test ${D}${PTEST_PATH}/=
<br>
+}<br>
+<br>
+FILES:${PN}-ptest +=3D &quot;${PTEST_PATH}&quot;<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#120932): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/120932" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/120932</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/115908396/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/115908396/1997914</a><br>
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

--000000000000e5eafd0641d51de3--

