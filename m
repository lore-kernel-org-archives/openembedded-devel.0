Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5044C83000
	for <webhook@archiver.kernel.org>; Sat, 28 Jun 2025 16:59:54 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web10.1807.1751129985979873585
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 28 Jun 2025 09:59:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=IYPU2xLC;
 spf=pass (domain: smile.fr, ip: 209.85.221.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3a57ae5cb17so449350f8f.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 28 Jun 2025 09:59:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1751129984; x=1751734784; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=L1Iw3CIlNcLJOIjAKAVWcYVwhtbcwpw5pCneqStSM0I=;
        b=IYPU2xLC8+Ze4TCqJ4kOjNANSYCxr2a4JuyUAzd/7GHqohIGZGVNvL3Yboe9lFTopM
         CqnuMkk6+sMkTFx1Iyi0yRyNZFCyU82vJ0M2lhpkpw2rYP1r5JSJWD2hwgxDpNQT9UxT
         ApSXXm7vn9Kim3ae5NuL0GH2QpLzwG7dm3qyc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751129984; x=1751734784;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L1Iw3CIlNcLJOIjAKAVWcYVwhtbcwpw5pCneqStSM0I=;
        b=w59g/w5KYdH/yvWwHyGH6yzmX2j2xKp35ODI3vLn+LQUoFayTEdroJIUNbTnLx8YSa
         0YrTF8TcfPYyAe+d70fFTh9TK/S09iZu1NJdXHRBkmE86UT7OgvljW0o4bCC9gYSK0Q/
         Yu/g0SP75Ls+P6imgmh8vlhGWe71MfvBzzdSq7hGiVV0h0CfidFbzny4sNpEAYhw0idw
         qYZBJHXcGzYsqnL8aJSeOlCnt9up6Qg9vR94BGscz0sJNAYJiBcYNOAMnkVQCDTdMp7v
         KHbpPL9VvuUTo+PQJjtGlel/arUrkc2ubwOUwJC7i47jhEfV+ftnj98muL398JFK4YJg
         RbKw==
X-Gm-Message-State: AOJu0Ywrl8RKR+8uTrE6IISp5/s1AVWly5IxTArhfWq1BNOkiIzF2kHF
	rUSXv598UNkAco76GA3gRE5LuRwkX//asoNffEqTp4Vaqqx28dsHWmGYoWYvZVOSsWXbujGqkOy
	qu+ic9I419hyl5sk6dZaDfUUbQ0piXdFLc5EONrf4gw==
X-Gm-Gg: ASbGnct6RPcGiSIKMdzFoTULg1EdmLSADspwgwkZYUWinzAI3R2vW7NszxMuo7nRXcH
	4vrKjd8VkpSuZBWFSAy/ztiTwUKaWLnLcsdMFq2gr5QvJfZsD4j+XkOaALYlgUlsxuPW0ghBgln
	zteb2TkXaoGdNEJeRjRo3KQKNNIkIU6eo8Q0hsM1b5Cd943mAKNE8/9Cj975i4PWHmEaBxreihy
	kER59NfGOokNOw=
X-Google-Smtp-Source: AGHT+IHdcMI3s5T5UVktRD3cATiQNm9QxJzHv6n87naWCN7mAWkgESRQMicXbd/UyDb99szTRnzbV1lvNXTZpnh9dp4=
X-Received: by 2002:a05:6000:65b:b0:3a5:2208:41e3 with SMTP id
 ffacd0b85a97d-3a8f445406fmr6441702f8f.4.1751129984268; Sat, 28 Jun 2025
 09:59:44 -0700 (PDT)
MIME-Version: 1.0
References: <20250628163727.859462-1-martin.jansa@gmail.com> <20250628163727.859462-2-martin.jansa@gmail.com>
In-Reply-To: <20250628163727.859462-2-martin.jansa@gmail.com>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Sat, 28 Jun 2025 18:59:18 +0200
X-Gm-Features: Ac12FXzg_jZmDkrIcAy8skMmNnQVPRWvrF8Fo4Tz7XSAapJM9JJyNUIPy3H9LoI
Message-ID: <CAMSfU+41qa3tVDfhFK2oDhiTOatd2z7JyfXHNknuL_b1W_Ynrg@mail.gmail.com>
Subject: Re: [meta-oe][walnascar][PATCH 2/2] python3-evdev: Fix buildpaths
 errors and reproducibility
To: martin.jansa@gmail.com
Cc: openembedded-devel@lists.openembedded.org, 
	Armin Kuster <akuster808@gmail.com>, Khem Raj <raj.khem@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000ab10950638a4b8d0"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 28 Jun 2025 16:59:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118162

--000000000000ab10950638a4b8d0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le sam. 28 juin 2025 =C3=A0 18:37, <martin.jansa@gmail.com> a =C3=A9crit :

> From: Yoann Congal <yoann.congal@smile.fr>
>
> Add a submitted patch to support the reproducible generation of
> intermediate file ecodes.c, then, use it to fix the buildpaths errors.
>
> Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  ...ibility-option-for-building-ecodes.c.patch | 116 ++++++++++++++++++
>  .../python/python3-evdev_1.9.1.bb             |   5 +-
>  2 files changed, 119 insertions(+), 2 deletions(-)
>  create mode 100644
> meta-python/recipes-devtools/python/python3-evdev/0001-Add-a-reproducibil=
ity-option-for-building-ecodes.c.patch
>
> diff --git
> a/meta-python/recipes-devtools/python/python3-evdev/0001-Add-a-reproducib=
ility-option-for-building-ecodes.c.patch
> b/meta-python/recipes-devtools/python/python3-evdev/0001-Add-a-reproducib=
ility-option-for-building-ecodes.c.patch
> new file mode 100644
> index 0000000000..e730519884
> --- /dev/null
> +++
> b/meta-python/recipes-devtools/python/python3-evdev/0001-Add-a-reproducib=
ility-option-for-building-ecodes.c.patch
> @@ -0,0 +1,116 @@
> +From d05c1c9dd298cb95d7feccbddb5caa043a319a01 Mon Sep 17 00:00:00 2001
> +From: Yoann Congal <yoann.congal@smile.fr>
> +Date: Sun, 13 Apr 2025 00:52:13 +0200
> +Subject: [PATCH] Add a reproducibility option for building ecodes.c
> +
> +ecodes.c currently contains the kernel info of the build machine and the
> +full path of the input*.h headers: This is not reproducible as output
> +can change even is headers content do not. Downstream distributions
> +might package ecodes.c and get non-reproducible output.
> +
> +To fix this: introduce a --reproducible option in the build:
> +- in setup.py build_ecodes command
> +- in underlying genecodes_c.py
> +
> +Note: These options are disabled by default so no change is expected in
> +current builds.
> +
> +Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
> +Upstream-Status: Submitted [
> https://github.com/gvalkov/python-evdev/pull/242]
>

For what it's worth, this is now a backport :
https://github.com/gvalkov/python-evdev/commit/6b4e8ef0ee505d9c3d46b1787eac=
339d8bd0b934
Never sent the update on master since it was release as part of v1.9.2.

Regards,

+---
> + setup.py                 | 13 ++++++++++---
> + src/evdev/genecodes_c.py | 17 +++++++++++------
> + 2 files changed, 21 insertions(+), 9 deletions(-)
> +
> +diff --git a/setup.py b/setup.py
> +index 6b721d7..3371199 100755
> +--- a/setup.py
> ++++ b/setup.py
> +@@ -14,7 +14,7 @@ curdir =3D Path(__file__).resolve().parent
> + ecodes_c_path =3D curdir / "src/evdev/ecodes.c"
> +
> +
> +-def create_ecodes(headers=3DNone):
> ++def create_ecodes(headers=3DNone, reproducibility=3DFalse):
> +     if not headers:
> +         include_paths =3D set()
> +         cpath =3D os.environ.get("CPATH", "").strip()
> +@@ -65,7 +65,10 @@ def create_ecodes(headers=3DNone):
> +
> +     print("writing %s (using %s)" % (ecodes_c_path, " ".join(headers)))
> +     with ecodes_c_path.open("w") as fh:
> +-        cmd =3D [sys.executable, "src/evdev/genecodes_c.py", "--ecodes"=
,
> *headers]
> ++        cmd =3D [sys.executable, "src/evdev/genecodes_c.py"]
> ++        if reproducibility:
> ++            cmd.append("--reproducibility")
> ++        cmd.extend(["--ecodes", *headers])
> +         run(cmd, check=3DTrue, stdout=3Dfh)
> +
> +
> +@@ -74,17 +77,21 @@ class build_ecodes(Command):
> +
> +     user_options =3D [
> +         ("evdev-headers=3D", None, "colon-separated paths to input
> subsystem headers"),
> ++        ("reproducibility", None, "hide host details (host/paths) to
> create a reproducible output"),
> +     ]
> +
> +     def initialize_options(self):
> +         self.evdev_headers =3D None
> ++        self.reproducibility =3D False
> +
> +     def finalize_options(self):
> +         if self.evdev_headers:
> +             self.evdev_headers =3D self.evdev_headers.split(":")
> ++        if self.reproducibility is None:
> ++            self.reproducibility =3D False
> +
> +     def run(self):
> +-        create_ecodes(self.evdev_headers)
> ++        create_ecodes(self.evdev_headers,
> reproducibility=3Dself.reproducibility)
> +
> +
> + class build_ext(_build_ext.build_ext):
> +diff --git a/src/evdev/genecodes_c.py b/src/evdev/genecodes_c.py
> +index 5c2d946..24cad27 100644
> +--- a/src/evdev/genecodes_c.py
> ++++ b/src/evdev/genecodes_c.py
> +@@ -15,22 +15,27 @@ headers =3D [
> +     "/usr/include/linux/uinput.h",
> + ]
> +
> +-opts, args =3D getopt.getopt(sys.argv[1:], "", ["ecodes", "stubs"])
> ++opts, args =3D getopt.getopt(sys.argv[1:], "", ["ecodes", "stubs",
> "reproducibility"])
> + if not opts:
> +-    print("usage: genecodes.py [--ecodes|--stubs] <headers>")
> ++    print("usage: genecodes.py [--ecodes|--stubs] [--reproducibility]
> <headers>")
> +     exit(2)
> +
> + if args:
> +     headers =3D args
> +
> ++reproducibility =3D ("--reproducibility", "") in opts
> ++
> +
> + #
> -------------------------------------------------------------------------=
----
> + macro_regex =3D
> r"#define\s+((?:KEY|ABS|REL|SW|MSC|LED|BTN|REP|SND|ID|EV|BUS|SYN|FF|UI_FF=
|INPUT_PROP)_\w+)"
> + macro_regex =3D re.compile(macro_regex)
> +
> +-# Uname without hostname.
> +-uname =3D list(os.uname())
> +-uname =3D " ".join((uname[0], *uname[2:]))
> ++if reproducibility:
> ++    uname =3D "hidden for reproducibility"
> ++else:
> ++    # Uname without hostname.
> ++    uname =3D list(os.uname())
> ++    uname =3D " ".join((uname[0], *uname[2:]))
> +
> +
> + #
> -------------------------------------------------------------------------=
----
> +@@ -138,5 +143,5 @@ elif ("--stubs", "") in opts:
> +     template =3D template_stubs
> +
> + body =3D os.linesep.join(body)
> +-text =3D template % (uname, headers, body)
> ++text =3D template % (uname, headers if not reproducibility else ["hidde=
n
> for reproducibility"], body)
> + print(text.strip())
> diff --git a/meta-python/recipes-devtools/python/python3-evdev_1.9.1.bb
> b/meta-python/recipes-devtools/python/python3-evdev_1.9.1.bb
> index b8930c97d5..af88770c59 100644
> --- a/meta-python/recipes-devtools/python/python3-evdev_1.9.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-evdev_1.9.1.bb
> @@ -3,6 +3,7 @@ HOMEPAGE =3D "https://github.com/gvalkov/python-evdev"
>  LICENSE =3D "BSD-3-Clause"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dd7bd1cc4c71b706c7e2d4053aef50=
f2a"
>
> +SRC_URI +=3D
> "file://0001-Add-a-reproducibility-option-for-building-ecodes.c.patch"
>  SRC_URI[sha256sum] =3D
> "dc640a064cb1c9fe1f8b970dc2039945a2a275d7b7ee62284bf427238abe45ee"
>
>  inherit pypi python_setuptools_build_meta
> @@ -12,7 +13,8 @@ do_compile:prepend() {
>  }
>
>  PEP517_BUILD_OPTS =3D "--config-setting=3D--build-option=3D'build_ecodes=
 \
> -    --evdev-headers
> ${STAGING_DIR_TARGET}/usr/include/linux/input.h:${STAGING_DIR_TARGET}/usr=
/include/linux/input-event-codes.h'"
> +    --evdev-headers
> ${STAGING_DIR_TARGET}/usr/include/linux/input.h:${STAGING_DIR_TARGET}/usr=
/include/linux/input-event-codes.h
> \
> +    --reproducibility'"
>
>  RDEPENDS:${PN} +=3D "\
>      python3-ctypes \
> @@ -21,4 +23,3 @@ RDEPENDS:${PN} +=3D "\
>      python3-shell \
>      python3-stringold \
>      "
> -INSANE_SKIP:${PN}-src =3D "buildpaths"
>


--=20
Yoann Congal
Smile ECS

--000000000000ab10950638a4b8d0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi,</div><br><div class=3D"gmail_quote gmail_quote_co=
ntainer"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0sam. 28 juin 2025 =
=C3=A0=C2=A018:37, &lt;<a href=3D"mailto:martin.jansa@gmail.com">martin.jan=
sa@gmail.com</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">From: Yoann Congal &lt;<a href=3D"mailto:yoann.con=
gal@smile.fr" target=3D"_blank">yoann.congal@smile.fr</a>&gt;<br>
<br>
Add a submitted patch to support the reproducible generation of<br>
intermediate file ecodes.c, then, use it to fix the buildpaths errors.<br>
<br>
Signed-off-by: Yoann Congal &lt;<a href=3D"mailto:yoann.congal@smile.fr" ta=
rget=3D"_blank">yoann.congal@smile.fr</a>&gt;<br>
Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D=
"_blank">raj.khem@gmail.com</a>&gt;<br>
---<br>
=C2=A0...ibility-option-for-building-ecodes.c.patch | 116 +++++++++++++++++=
+<br>
=C2=A0.../python/<a href=3D"http://python3-evdev_1.9.1.bb" rel=3D"noreferre=
r" target=3D"_blank">python3-evdev_1.9.1.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A05 +-<br>
=C2=A02 files changed, 119 insertions(+), 2 deletions(-)<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-evdev/=
0001-Add-a-reproducibility-option-for-building-ecodes.c.patch<br>
<br>
diff --git a/meta-python/recipes-devtools/python/python3-evdev/0001-Add-a-r=
eproducibility-option-for-building-ecodes.c.patch b/meta-python/recipes-dev=
tools/python/python3-evdev/0001-Add-a-reproducibility-option-for-building-e=
codes.c.patch<br>
new file mode 100644<br>
index 0000000000..e730519884<br>
--- /dev/null<br>
+++ b/meta-python/recipes-devtools/python/python3-evdev/0001-Add-a-reproduc=
ibility-option-for-building-ecodes.c.patch<br>
@@ -0,0 +1,116 @@<br>
+From d05c1c9dd298cb95d7feccbddb5caa043a319a01 Mon Sep 17 00:00:00 2001<br>
+From: Yoann Congal &lt;<a href=3D"mailto:yoann.congal@smile.fr" target=3D"=
_blank">yoann.congal@smile.fr</a>&gt;<br>
+Date: Sun, 13 Apr 2025 00:52:13 +0200<br>
+Subject: [PATCH] Add a reproducibility option for building ecodes.c<br>
+<br>
+ecodes.c currently contains the kernel info of the build machine and the<b=
r>
+full path of the input*.h headers: This is not reproducible as output<br>
+can change even is headers content do not. Downstream distributions<br>
+might package ecodes.c and get non-reproducible output.<br>
+<br>
+To fix this: introduce a --reproducible option in the build:<br>
+- in setup.py build_ecodes command<br>
+- in underlying genecodes_c.py<br>
+<br>
+Note: These options are disabled by default so no change is expected in<br=
>
+current builds.<br>
+<br>
+Signed-off-by: Yoann Congal &lt;<a href=3D"mailto:yoann.congal@smile.fr" t=
arget=3D"_blank">yoann.congal@smile.fr</a>&gt;<br>
+Upstream-Status: Submitted [<a href=3D"https://github.com/gvalkov/python-e=
vdev/pull/242" rel=3D"noreferrer" target=3D"_blank">https://github.com/gval=
kov/python-evdev/pull/242</a>]<br></blockquote><div><br></div><div>For what=
 it&#39;s worth, this is now a backport :=C2=A0<a href=3D"https://github.co=
m/gvalkov/python-evdev/commit/6b4e8ef0ee505d9c3d46b1787eac339d8bd0b934">htt=
ps://github.com/gvalkov/python-evdev/commit/6b4e8ef0ee505d9c3d46b1787eac339=
d8bd0b934</a></div><div>Never sent the update on master since it was releas=
e as part of v1.9.2.</div><div><br></div><div>Regards,=C2=A0</div><div><br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">
+---<br>
+ setup.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 1=
3 ++++++++++---<br>
+ src/evdev/genecodes_c.py | 17 +++++++++++------<br>
+ 2 files changed, 21 insertions(+), 9 deletions(-)<br>
+<br>
+diff --git a/setup.py b/setup.py<br>
+index 6b721d7..3371199 100755<br>
+--- a/setup.py<br>
++++ b/setup.py<br>
+@@ -14,7 +14,7 @@ curdir =3D Path(__file__).resolve().parent<br>
+ ecodes_c_path =3D curdir / &quot;src/evdev/ecodes.c&quot;<br>
+ <br>
+ <br>
+-def create_ecodes(headers=3DNone):<br>
++def create_ecodes(headers=3DNone, reproducibility=3DFalse):<br>
+=C2=A0 =C2=A0 =C2=A0if not headers:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0include_paths =3D set()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cpath =3D os.environ.get(&quot;CPATH&quo=
t;, &quot;&quot;).strip()<br>
+@@ -65,7 +65,10 @@ def create_ecodes(headers=3DNone):<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0print(&quot;writing %s (using %s)&quot; % (ecodes_c_pa=
th, &quot; &quot;.join(headers)))<br>
+=C2=A0 =C2=A0 =C2=A0with ecodes_c_path.open(&quot;w&quot;) as fh:<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 cmd =3D [sys.executable, &quot;src/evdev/gene=
codes_c.py&quot;, &quot;--ecodes&quot;, *headers]<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 cmd =3D [sys.executable, &quot;src/evdev/gene=
codes_c.py&quot;]<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if reproducibility:<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cmd.append(&quot;--reproducibil=
ity&quot;)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 cmd.extend([&quot;--ecodes&quot;, *headers])<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0run(cmd, check=3DTrue, stdout=3Dfh)<br>
+ <br>
+ <br>
+@@ -74,17 +77,21 @@ class build_ecodes(Command):<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0user_options =3D [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(&quot;evdev-headers=3D&quot;, None, &qu=
ot;colon-separated paths to input subsystem headers&quot;),<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 (&quot;reproducibility&quot;, None, &quot;hid=
e host details (host/paths) to create a reproducible output&quot;),<br>
+=C2=A0 =C2=A0 =C2=A0]<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0def initialize_options(self):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.evdev_headers =3D None<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.reproducibility =3D False<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0def finalize_options(self):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if self.evdev_headers:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.evdev_headers =3D sel=
f.evdev_headers.split(&quot;:&quot;)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if self.reproducibility is None:<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.reproducibility =3D False<=
br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0def run(self):<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 create_ecodes(self.evdev_headers)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 create_ecodes(self.evdev_headers, reproducibi=
lity=3Dself.reproducibility)<br>
+ <br>
+ <br>
+ class build_ext(_build_ext.build_ext):<br>
+diff --git a/src/evdev/genecodes_c.py b/src/evdev/genecodes_c.py<br>
+index 5c2d946..24cad27 100644<br>
+--- a/src/evdev/genecodes_c.py<br>
++++ b/src/evdev/genecodes_c.py<br>
+@@ -15,22 +15,27 @@ headers =3D [<br>
+=C2=A0 =C2=A0 =C2=A0&quot;/usr/include/linux/uinput.h&quot;,<br>
+ ]<br>
+ <br>
+-opts, args =3D getopt.getopt(sys.argv[1:], &quot;&quot;, [&quot;ecodes&qu=
ot;, &quot;stubs&quot;])<br>
++opts, args =3D getopt.getopt(sys.argv[1:], &quot;&quot;, [&quot;ecodes&qu=
ot;, &quot;stubs&quot;, &quot;reproducibility&quot;])<br>
+ if not opts:<br>
+-=C2=A0 =C2=A0 print(&quot;usage: genecodes.py [--ecodes|--stubs] &lt;head=
ers&gt;&quot;)<br>
++=C2=A0 =C2=A0 print(&quot;usage: genecodes.py [--ecodes|--stubs] [--repro=
ducibility] &lt;headers&gt;&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0exit(2)<br>
+ <br>
+ if args:<br>
+=C2=A0 =C2=A0 =C2=A0headers =3D args<br>
+ <br>
++reproducibility =3D (&quot;--reproducibility&quot;, &quot;&quot;) in opts=
<br>
++<br>
+ <br>
+ # -----------------------------------------------------------------------=
------<br>
+ macro_regex =3D r&quot;#define\s+((?:KEY|ABS|REL|SW|MSC|LED|BTN|REP|SND|I=
D|EV|BUS|SYN|FF|UI_FF|INPUT_PROP)_\w+)&quot;<br>
+ macro_regex =3D re.compile(macro_regex)<br>
+ <br>
+-# Uname without hostname.<br>
+-uname =3D list(os.uname())<br>
+-uname =3D &quot; &quot;.join((uname[0], *uname[2:]))<br>
++if reproducibility:<br>
++=C2=A0 =C2=A0 uname =3D &quot;hidden for reproducibility&quot;<br>
++else:<br>
++=C2=A0 =C2=A0 # Uname without hostname.<br>
++=C2=A0 =C2=A0 uname =3D list(os.uname())<br>
++=C2=A0 =C2=A0 uname =3D &quot; &quot;.join((uname[0], *uname[2:]))<br>
+ <br>
+ <br>
+ # -----------------------------------------------------------------------=
------<br>
+@@ -138,5 +143,5 @@ elif (&quot;--stubs&quot;, &quot;&quot;) in opts:<br>
+=C2=A0 =C2=A0 =C2=A0template =3D template_stubs<br>
+ <br>
+ body =3D os.linesep.join(body)<br>
+-text =3D template % (uname, headers, body)<br>
++text =3D template % (uname, headers if not reproducibility else [&quot;hi=
dden for reproducibility&quot;], body)<br>
+ print(text.strip())<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
evdev_1.9.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-evdev_1.9.1.bb=
</a> b/meta-python/recipes-devtools/python/<a href=3D"http://python3-evdev_=
1.9.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-evdev_1.9.1.bb</a><b=
r>
index b8930c97d5..af88770c59 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-evdev_1=
.9.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-evdev_1.9.1.bb</a><br=
>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-evdev_1=
.9.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-evdev_1.9.1.bb</a><br=
>
@@ -3,6 +3,7 @@ HOMEPAGE =3D &quot;<a href=3D"https://github.com/gvalkov/py=
thon-evdev" rel=3D"noreferrer" target=3D"_blank">https://github.com/gvalkov=
/python-evdev</a>&quot;<br>
=C2=A0LICENSE =3D &quot;BSD-3-Clause&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3Dd7bd1cc4c71b706c7e2d4=
053aef50f2a&quot;<br>
<br>
+SRC_URI +=3D &quot;file://0001-Add-a-reproducibility-option-for-building-e=
codes.c.patch&quot;<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;dc640a064cb1c9fe1f8b970dc2039945a2a275d7=
b7ee62284bf427238abe45ee&quot;<br>
<br>
=C2=A0inherit pypi python_setuptools_build_meta<br>
@@ -12,7 +13,8 @@ do_compile:prepend() {<br>
=C2=A0}<br>
<br>
=C2=A0PEP517_BUILD_OPTS =3D &quot;--config-setting=3D--build-option=3D&#39;=
build_ecodes \<br>
-=C2=A0 =C2=A0 --evdev-headers ${STAGING_DIR_TARGET}/usr/include/linux/inpu=
t.h:${STAGING_DIR_TARGET}/usr/include/linux/input-event-codes.h&#39;&quot;<=
br>
+=C2=A0 =C2=A0 --evdev-headers ${STAGING_DIR_TARGET}/usr/include/linux/inpu=
t.h:${STAGING_DIR_TARGET}/usr/include/linux/input-event-codes.h \<br>
+=C2=A0 =C2=A0 --reproducibility&#39;&quot;<br>
<br>
=C2=A0RDEPENDS:${PN} +=3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0python3-ctypes \<br>
@@ -21,4 +23,3 @@ RDEPENDS:${PN} +=3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0python3-shell \<br>
=C2=A0 =C2=A0 =C2=A0python3-stringold \<br>
=C2=A0 =C2=A0 =C2=A0&quot;<br>
-INSANE_SKIP:${PN}-src =3D &quot;buildpaths&quot;<br>
</blockquote></div><div><br clear=3D"all"></div><br><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr"><font face=3D"Raleway, regular">Yoann Congal</font><div><fon=
t face=3D"Raleway, regular">Smile ECS</font></div></div></div></div>

--000000000000ab10950638a4b8d0--

