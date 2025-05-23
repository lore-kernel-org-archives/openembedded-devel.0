Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93A3FC54ED0
	for <webhook@archiver.kernel.org>; Fri, 23 May 2025 08:47:58 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web10.43756.1747990067710565471
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 May 2025 01:47:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=mCVI0umn;
 spf=pass (domain: smile.fr, ip: 209.85.221.51, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3a3673e12c4so4044144f8f.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 23 May 2025 01:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1747990066; x=1748594866; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=E9/EdkOwhdLC2uEEbX1uDKMKXLCx1NIYnikMYN/Adjk=;
        b=mCVI0umnw35V4OrTb7LNVdHEbeS4STyKZOvcMJ0FZMWjOihmNeASZgkCiugGcSlIwP
         gpFTdCvdopq+FTeJNQPMLKDwr9hBtqQ5dvwzJXDtaGYJkZVt8dV/3idtR3giOtajiZiZ
         CXKRwJXrLuyuSGFSlQK6gYEGtKYwipqlDYyN4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747990066; x=1748594866;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E9/EdkOwhdLC2uEEbX1uDKMKXLCx1NIYnikMYN/Adjk=;
        b=j6k/SBeMsqR1Pk11XXwdaDfQYil7gjqAOWl/mBzT0BkbZvV+iuwFObizGhcp67xCFd
         /2Owf6ChfV0cSLAzdYwKeZJlZ3LQX/xzZCX6VVm2eygXzbr8salfTqkty70MCNYYT1eF
         hfr2VrXyl2bnfLD4cePZnjM40VPhbKzNP3NNFCWPHFVifS1Sswcdc0JzxKIMafbtFF6i
         cLzk1A6LIcupnzejHChnDkPMLuc/uRIbT0UIvqhOgU5myGm7WnrdVDUOgUaRm+Et2FPV
         Mm08SfY6DyyAgfjYrAGR737+eo1V3kFsClzYq93K2tsbNzF/hnSJd6kUwXKqCFXdeVB9
         0I/w==
X-Gm-Message-State: AOJu0YydOlydpqT16AzfwAksWwalKZ1w6jxFX677HdB43eHKd8Zf+Mvd
	/rXjzByeZBNWOA4nwUMXXmjPzFjhZ1CxyXHKigtXtvwLR/5Bz8gNq+3n9dCvW9WqiqUmQItcn0S
	crCfBStVkSQZ1OmqT/1phgn5mkV3p27W1ddlTFrSICA==
X-Gm-Gg: ASbGncsVNfx3dhqPxiAHJljyegrrx88ablS/37yDsNCojjHDOO6e9l/3nSxl2uwQ0EX
	qdxSpyrjCmiD1mEuTvLo9ksWhMN6kfmA811LMcKIqINRtAtkw9fK6QXn5P5Vp63cPakKKEXTlXr
	FUh38Fgk7WzQ5UROzmUpHLPMqlyBpOpUKLo6eZtNSb9AHm5AWOC4QAtZM6vgjj9Qf1LhA=
X-Google-Smtp-Source: AGHT+IFKxgKQybg4u0STcITPTGl6FCyW8zAbMFt979RuybDjEN7YsiSbiM7POxZP3/m4fidEgMmt//FXiP9dp7cqHWQ=
X-Received: by 2002:a05:6000:420a:b0:3a3:7152:c67c with SMTP id
 ffacd0b85a97d-3a37152c80fmr16646450f8f.54.1747990065940; Fri, 23 May 2025
 01:47:45 -0700 (PDT)
MIME-Version: 1.0
References: <20250523083021.7368-1-kelefa.sane@smile.fr>
In-Reply-To: <20250523083021.7368-1-kelefa.sane@smile.fr>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Fri, 23 May 2025 10:47:20 +0200
X-Gm-Features: AX0GCFsS1t6j6K9I7MfmdmEITwKhEX-cSLarHV4fAsSiYDWp0vYHrza7pEu2ln8
Message-ID: <CAMSfU+5fdtWo8awS+nYCm5ZrhFweqZm+ECsq-7VwG6LmP9i8eg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] crash: fix reproducibility
To: kelefa.sane@smile.fr
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000f3a8340635c9a6e5"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 23 May 2025 08:47:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117606

--000000000000f3a8340635c9a6e5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le ven. 23 mai 2025 =C3=A0 10:30, kelefa.sane via lists.openembedded.org
<kelefa.sane=3Dsmile.fr@lists.openembedded.org> a =C3=A9crit :

> From: K=C3=A9l=C3=A9fa San=C3=A9 <kelefa.sane@smile.fr>
>
> Fix reproducibility issue by retrieving the compiler version from the CC
> env variable, which define the compiler used in the build and not from
> the native gcc compiler install in the host machine.
>
> Signed-off-by: K=C3=A9l=C3=A9fa San=C3=A9 <kelefa.sane@smile.fr>
>

Reviewed-by: Yoann Congal <yoann.congal@smile.fr>

---
>  meta-oe/conf/include/non-repro-meta-oe.inc    |  3 --
>  meta-oe/recipes-kernel/crash/crash.inc        |  1 +
>  ...e-CC-env-var-to-get-compiler-version.patch | 48 +++++++++++++++++++
>  3 files changed, 49 insertions(+), 3 deletions(-)
>  create mode 100644
> meta-oe/recipes-kernel/crash/crash/0001-Use-CC-env-var-to-get-compiler-ve=
rsion.patch
>
> diff --git a/meta-oe/conf/include/non-repro-meta-oe.inc
> b/meta-oe/conf/include/non-repro-meta-oe.inc
> index 894d7f330a..ae4fb1d194 100755
> --- a/meta-oe/conf/include/non-repro-meta-oe.inc
> +++ b/meta-oe/conf/include/non-repro-meta-oe.inc
> @@ -7,9 +7,6 @@ KNOWN_NON_REPRO_META_OE =3D " \
>      asio-ptest \
>      asio-src \
>      cpuid-doc \
> -    crash \
> -    crash-dbg \
> -    crash-src \
>      dhrystone \
>      dhrystone-dbg \
>      dhrystone-dev \
> diff --git a/meta-oe/recipes-kernel/crash/crash.inc
> b/meta-oe/recipes-kernel/crash/crash.inc
> index aef77be1a0..45fc9cd1fd 100644
> --- a/meta-oe/recipes-kernel/crash/crash.inc
> +++ b/meta-oe/recipes-kernel/crash/crash.inc
> @@ -27,6 +27,7 @@ SRC_URI =3D "git://
> github.com/crash-utility/${BPN}.git;branch=3Dmaster;protocol=3Dhttp
> <http://github.com/crash-utility/$%7BBPN%7D.git;branch=3Dmaster;protocol=
=3Dhttp>
>             file://0003-Fix-build-failure-in-readline-lib.patch \
>
> file://0004-tools.c-do-not-use-keywords-nullptr-as-a-variable-in.patch \
>             file://0005-Fix-build-failure-on-32bit-machine-i686.patch \
> +           file://0001-Use-CC-env-var-to-get-compiler-version.patch \
>             "
>  SRCREV =3D "f13853cef53f5c5463a51021edbc81977e2b1405"
>
> diff --git
> a/meta-oe/recipes-kernel/crash/crash/0001-Use-CC-env-var-to-get-compiler-=
version.patch
> b/meta-oe/recipes-kernel/crash/crash/0001-Use-CC-env-var-to-get-compiler-=
version.patch
> new file mode 100644
> index 0000000000..d51008886e
> --- /dev/null
> +++
> b/meta-oe/recipes-kernel/crash/crash/0001-Use-CC-env-var-to-get-compiler-=
version.patch
> @@ -0,0 +1,48 @@
> +From 31b789d1b21ed26315d08798d6044450e3545ddf Mon Sep 17 00:00:00 2001
> +From: =3D?UTF-8?q?K=3DC3=3DA9l=3DC3=3DA9fa=3D20San=3DC3=3DA9?=3D <kelefa=
.sane@smile.fr>
> +Date: Fri, 16 May 2025 16:18:28 +0200
> +Subject: [PATCH] Use CC env var to get compiler version
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +The source file build_data.c generated at compilation time define a
> +variable compiler_version which is obtained by calling "gcc --version"
> +cmd. This call retrieve the native gcc compiler install on host build
> +machine but not necessarily the compiler use to build the project (ex:
> +cross compilation).
> +
> +The CC env variable commonly used in Makefile project define the
> +compiler to use at build, so this is the appropriate way to retrieve the
> +compiler version, when the CC env var is define.
> +
> +Upstream-Status: Submitted [
> https://lists.crash-utility.osci.io/archives/list/devel@lists.crash-utili=
ty.osci.io/thread/MIPWYZGF3EIC47FVNNYK77FI4ZJ3FHON/
> ]
> +
> +Signed-off-by: K=C3=A9l=C3=A9fa San=C3=A9 <kelefa.sane@smile.fr>
> +---
> + configure.c | 12 +++++++++++-
> + 1 file changed, 11 insertions(+), 1 deletion(-)
> +
> +diff --git a/configure.c b/configure.c
> +index 4668c9a..a20e174 100644
> +--- a/configure.c
> ++++ b/configure.c
> +@@ -1362,7 +1362,17 @@ make_build_data(char *target)
> +
> +         fp1 =3D popen("date", "r");
> +         fp2 =3D popen("id", "r");
> +-      fp3 =3D popen("gcc --version", "r");
> ++
> ++      const char *cc_env =3D getenv("CC");
> ++      if(NULL =3D=3D cc_env) {
> ++              fp3 =3D popen("gcc --version", "r");
> ++      }
> ++      else {
> ++              char compiler_version_cmd[512];
> ++
> ++              snprintf(compiler_version_cmd,
> sizeof(compiler_version_cmd)-1, "%s --version", cc_env);
> ++              fp3 =3D popen(compiler_version_cmd, "r");
> ++      }
> +
> +       if ((fp4 =3D fopen("build_data.c", "w")) =3D=3D NULL) {
> +               perror("build_data.c");
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#117605):
> https://lists.openembedded.org/g/openembedded-devel/message/117605
> Mute This Topic: https://lists.openembedded.org/mt/113261963/4316185
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> yoann.congal@smile.fr]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Yoann Congal
Smile ECS

--000000000000f3a8340635c9a6e5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0ven. 23=
 mai 2025 =C3=A0=C2=A010:30, kelefa.sane via <a href=3D"http://lists.openem=
bedded.org">lists.openembedded.org</a> &lt;kelefa.sane=3D<a href=3D"mailto:=
smile.fr@lists.openembedded.org">smile.fr@lists.openembedded.org</a>&gt; a =
=C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">From: K=C3=A9l=C3=A9fa San=C3=A9 &lt;<a href=3D"mailto:kelefa.sane@smile.=
fr" target=3D"_blank">kelefa.sane@smile.fr</a>&gt;<br>
<br>
Fix reproducibility issue by retrieving the compiler version from the CC<br=
>
env variable, which define the compiler used in the build and not from<br>
the native gcc compiler install in the host machine.<br>
<br>
Signed-off-by: K=C3=A9l=C3=A9fa San=C3=A9 &lt;<a href=3D"mailto:kelefa.sane=
@smile.fr" target=3D"_blank">kelefa.sane@smile.fr</a>&gt;<br></blockquote><=
div>=C2=A0</div><div>Reviewed-by: Yoann Congal &lt;<a href=3D"mailto:yoann.=
congal@smile.fr">yoann.congal@smile.fr</a>&gt;</div><div><br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0meta-oe/conf/include/non-repro-meta-oe.inc=C2=A0 =C2=A0 |=C2=A0 3 --<=
br>
=C2=A0meta-oe/recipes-kernel/crash/crash.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 1 +<br>
=C2=A0...e-CC-env-var-to-get-compiler-version.patch | 48 ++++++++++++++++++=
+<br>
=C2=A03 files changed, 49 insertions(+), 3 deletions(-)<br>
=C2=A0create mode 100644 meta-oe/recipes-kernel/crash/crash/0001-Use-CC-env=
-var-to-get-compiler-version.patch<br>
<br>
diff --git a/meta-oe/conf/include/non-repro-meta-oe.inc b/meta-oe/conf/incl=
ude/non-repro-meta-oe.inc<br>
index 894d7f330a..ae4fb1d194 100755<br>
--- a/meta-oe/conf/include/non-repro-meta-oe.inc<br>
+++ b/meta-oe/conf/include/non-repro-meta-oe.inc<br>
@@ -7,9 +7,6 @@ KNOWN_NON_REPRO_META_OE =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0asio-ptest \<br>
=C2=A0 =C2=A0 =C2=A0asio-src \<br>
=C2=A0 =C2=A0 =C2=A0cpuid-doc \<br>
-=C2=A0 =C2=A0 crash \<br>
-=C2=A0 =C2=A0 crash-dbg \<br>
-=C2=A0 =C2=A0 crash-src \<br>
=C2=A0 =C2=A0 =C2=A0dhrystone \<br>
=C2=A0 =C2=A0 =C2=A0dhrystone-dbg \<br>
=C2=A0 =C2=A0 =C2=A0dhrystone-dev \<br>
diff --git a/meta-oe/recipes-kernel/crash/crash.inc b/meta-oe/recipes-kerne=
l/crash/crash.inc<br>
index aef77be1a0..45fc9cd1fd 100644<br>
--- a/meta-oe/recipes-kernel/crash/crash.inc<br>
+++ b/meta-oe/recipes-kernel/crash/crash.inc<br>
@@ -27,6 +27,7 @@ SRC_URI =3D &quot;git://<a href=3D"http://github.com/cras=
h-utility/$%7BBPN%7D.git;branch=3Dmaster;protocol=3Dhttp" rel=3D"noreferrer=
" target=3D"_blank">github.com/crash-utility/${BPN}.git;branch=3Dmaster;pro=
tocol=3Dhttp</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0003-Fix-build-failure-in-=
readline-lib.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0004-tools.c-do-not-use-ke=
ywords-nullptr-as-a-variable-in.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0005-Fix-build-failure-on-=
32bit-machine-i686.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Use-CC-env-var-to-get=
-compiler-version.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
=C2=A0SRCREV =3D &quot;f13853cef53f5c5463a51021edbc81977e2b1405&quot;<br>
<br>
diff --git a/meta-oe/recipes-kernel/crash/crash/0001-Use-CC-env-var-to-get-=
compiler-version.patch b/meta-oe/recipes-kernel/crash/crash/0001-Use-CC-env=
-var-to-get-compiler-version.patch<br>
new file mode 100644<br>
index 0000000000..d51008886e<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-kernel/crash/crash/0001-Use-CC-env-var-to-get-compile=
r-version.patch<br>
@@ -0,0 +1,48 @@<br>
+From 31b789d1b21ed26315d08798d6044450e3545ddf Mon Sep 17 00:00:00 2001<br>
+From: =3D?UTF-8?q?K=3DC3=3DA9l=3DC3=3DA9fa=3D20San=3DC3=3DA9?=3D &lt;<a hr=
ef=3D"mailto:kelefa.sane@smile.fr" target=3D"_blank">kelefa.sane@smile.fr</=
a>&gt;<br>
+Date: Fri, 16 May 2025 16:18:28 +0200<br>
+Subject: [PATCH] Use CC env var to get compiler version<br>
+MIME-Version: 1.0<br>
+Content-Type: text/plain; charset=3DUTF-8<br>
+Content-Transfer-Encoding: 8bit<br>
+<br>
+The source file build_data.c generated at compilation time define a<br>
+variable compiler_version which is obtained by calling &quot;gcc --version=
&quot;<br>
+cmd. This call retrieve the native gcc compiler install on host build<br>
+machine but not necessarily the compiler use to build the project (ex:<br>
+cross compilation).<br>
+<br>
+The CC env variable commonly used in Makefile project define the<br>
+compiler to use at build, so this is the appropriate way to retrieve the<b=
r>
+compiler version, when the CC env var is define.<br>
+<br>
+Upstream-Status: Submitted [<a href=3D"https://lists.crash-utility.osci.io=
/archives/list/devel@lists.crash-utility.osci.io/thread/MIPWYZGF3EIC47FVNNY=
K77FI4ZJ3FHON/" rel=3D"noreferrer" target=3D"_blank">https://lists.crash-ut=
ility.osci.io/archives/list/devel@lists.crash-utility.osci.io/thread/MIPWYZ=
GF3EIC47FVNNYK77FI4ZJ3FHON/</a>]<br>
+<br>
+Signed-off-by: K=C3=A9l=C3=A9fa San=C3=A9 &lt;<a href=3D"mailto:kelefa.san=
e@smile.fr" target=3D"_blank">kelefa.sane@smile.fr</a>&gt;<br>
+---<br>
+ configure.c | 12 +++++++++++-<br>
+ 1 file changed, 11 insertions(+), 1 deletion(-)<br>
+<br>
+diff --git a/configure.c b/configure.c<br>
+index 4668c9a..a20e174 100644<br>
+--- a/configure.c<br>
++++ b/configure.c<br>
+@@ -1362,7 +1362,17 @@ make_build_data(char *target)<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fp1 =3D popen(&quot;date&quot;, &quot;r&=
quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fp2 =3D popen(&quot;id&quot;, &quot;r&qu=
ot;);<br>
+-=C2=A0 =C2=A0 =C2=A0 fp3 =3D popen(&quot;gcc --version&quot;, &quot;r&quo=
t;);<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 const char *cc_env =3D getenv(&quot;CC&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 if(NULL =3D=3D cc_env) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fp3 =3D popen(&quot;gcc =
--version&quot;, &quot;r&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 else {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 char compiler_version_cm=
d[512];<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 snprintf(compiler_versio=
n_cmd, sizeof(compiler_version_cmd)-1, &quot;%s --version&quot;, cc_env);<b=
r>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fp3 =3D popen(compiler_v=
ersion_cmd, &quot;r&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if ((fp4 =3D fopen(&quot;build_data.c&quot;, &q=
uot;w&quot;)) =3D=3D NULL) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0perror(&quot;build_=
data.c&quot;);<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#117605): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/117605" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/117605</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/113261963/431=
6185" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/113261963/4316185</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:yoann.congal@smile.fr" t=
arget=3D"_blank">yoann.congal@smile.fr</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><br><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr"><font face=3D"Raleway, regular">Yoann Congal</font><div><fon=
t face=3D"Raleway, regular">Smile ECS</font></div></div></div></div>

--000000000000f3a8340635c9a6e5--

