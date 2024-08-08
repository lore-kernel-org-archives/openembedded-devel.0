Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 537FDC52D7B
	for <webhook@archiver.kernel.org>; Thu,  8 Aug 2024 16:41:39 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web11.64715.1723135297125308281
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Aug 2024 09:41:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=itfdR1JP;
 spf=pass (domain: gmail.com, ip: 209.85.167.49, mailfrom: ticotimo@gmail.com)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-52ed741fe46so1277882e87.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Aug 2024 09:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723135295; x=1723740095; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sayAlRyjcQYLsvZI7gWSXg4upyZ1WaIsB1zqm3unYGM=;
        b=itfdR1JP8VP1K67R0iucz7cFIlSLP9fOzFwrQys79AYekd9+5VBd/JQN2OUjNPjNRR
         SUktV1qjYn+FSzuoGU/2UO+0bqDZcq37Cz589UwivqDO5oRhMkv7Ri/hY39BVzU50g3N
         Ko79YD3YOX5KxDfjlyMVc4aPV6qG/b1Uh9hdqTuq39jtl+TDHqyi2Ws7BmhCtk0gV9QE
         xLI+oqWqELOn2/y8k5jH+IaUxY6dgZASZ7pk2WOhT8VP+98oK7TecqJIF1hbBjx/JxGT
         SPl9G5wbUUwQsKkZbDIAJEaRf8KPq68HQny1gQ3NlodBDmZrHHyIrgb9h4gtQiX/JUFK
         /arw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723135295; x=1723740095;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sayAlRyjcQYLsvZI7gWSXg4upyZ1WaIsB1zqm3unYGM=;
        b=WWxbQG1X2+Ttsxl6CYln8Gjvwu+irsUhK4Ny+s4WZMoAOenWGF72fbs96IRoAda6Hd
         awc4rD+tLKJw5wktIRqtLisresHQZe6OwI/hIgAIkvMIXmYxjkpT/B8UB24aSZF7FMe+
         2T7sY9Y04gC2cc45uoHwYSgOxSI7kIsV5Y4keROC8alKwzWsefMOT2DjoLeTeR3neRAh
         nLqQXI5VIcOHsvtTc3z5VfMm6bxFX2ApKlhv0QI/Nb/qaPWhFUmhFjeDIAkdAvVRYmxM
         m2qXcufR5Gjtct8tXtEA6ADg6EW51AEKiY2iiosMEmt6T8OSKxlCIPHEo0a+Q91uC5Ie
         IILQ==
X-Gm-Message-State: AOJu0YwsLz6VCghWRqUqDxWmBp8aFG7OJlka0/AMmlDRof3HkQ+w//FV
	yOVKKwF1Rmj4AtLZ39iw2M5r70kM9XtDKbHARDoNQVVw2LxeQ7AMi5zcz2Taq6JRc7atyYAi570
	QrB78a6HJOZgL8+9DqBDkW1Il0jckxg==
X-Google-Smtp-Source: AGHT+IHEGu7RqeoH3AZkMH8tdh3EUNtVELkL8JVa3coZ6mTs/RDbrmp23i8DPnKLRRJs9gw3vORScqM+PaD7UNn6aUc=
X-Received: by 2002:a05:651c:549:b0:2ef:2f37:345b with SMTP id
 38308e7fff4ca-2f19de756e2mr19275581fa.30.1723135294523; Thu, 08 Aug 2024
 09:41:34 -0700 (PDT)
MIME-Version: 1.0
References: <20240808084458.1316-1-debrabander@gmail.com>
In-Reply-To: <20240808084458.1316-1-debrabander@gmail.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Thu, 8 Aug 2024 09:41:21 -0700
Message-ID: <CANx9H-Adn4QG4SdCkPz+jYUn+9so6=MaaD2xkxpR_KyPGTMnLA@mail.gmail.com>
Subject: Re: [oe] [meta-python][master][PATCH] python3-pydantic-core: fix
 TMPDIR path reference
To: debrabander@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000214ef6061f2eb3af"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 08 Aug 2024 16:41:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111675

--000000000000214ef6061f2eb3af
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I just included this in a new series to upgrade python3-pydantic-core and
python3-pydantic. I'd prefer we take that series instead, so I can stop
churning on this.

However, this patch should be backported to scarthgap. I will work on that
series next.

On Thu, Aug 8, 2024 at 1:45=E2=80=AFAM Frank de Brabander via lists.openemb=
edded.org
<debrabander=3Dgmail.com@lists.openembedded.org> wrote:

> Backport a new upstream fix to remove the TMPDIR
> reference from the rust code.
>
> Signed-off-by: Frank de Brabander <debrabander@gmail.com>
> ---
>  ...Dont-embed-RUSTFLAGS-in-final-binary.patch | 47 +++++++++++++++++++
>  .../python/python3-pydantic-core_2.18.4.bb    |  4 +-
>  2 files changed, 49 insertions(+), 2 deletions(-)
>  create mode 100644
> meta-python/recipes-devtools/python/python3-pydantic-core/0002-Dont-embed=
-RUSTFLAGS-in-final-binary.patch
>
> diff --git
> a/meta-python/recipes-devtools/python/python3-pydantic-core/0002-Dont-emb=
ed-RUSTFLAGS-in-final-binary.patch
> b/meta-python/recipes-devtools/python/python3-pydantic-core/0002-Dont-emb=
ed-RUSTFLAGS-in-final-binary.patch
> new file mode 100644
> index 000000000..1c195e294
> --- /dev/null
> +++
> b/meta-python/recipes-devtools/python/python3-pydantic-core/0002-Dont-emb=
ed-RUSTFLAGS-in-final-binary.patch
> @@ -0,0 +1,47 @@
> +From b3282b301096253a11b1f887f915d0a2a2183597 Mon Sep 17 00:00:00 2001
> +From: Frank de Brabander <debrabander@gmail.com>
> +Date: Thu, 8 Aug 2024 08:04:48 +0200
> +Subject: [PATCH] Dont embed RUSTFLAGS in final binary
> +
> +Upstream-Status: Backport [
> https://github.com/pydantic/pydantic-core/commit/e07c41b3bad75948201a2201=
387225694c2fb501
> ]
> +---
> + build.rs   | 9 +++++++++
> + src/lib.rs | 5 ++++-
> + 2 files changed, 13 insertions(+), 1 deletion(-)
> +
> +diff --git a/build.rs b/build.rs
> +index 7f59e1f..7fe6490 100644
> +--- a/build.rs
> ++++ b/build.rs
> +@@ -35,6 +35,15 @@ fn main() {
> +     if let Some(true) =3D
> version_check::supports_feature("coverage_attribute") {
> +         println!("cargo:rustc-cfg=3Dhas_coverage_attribute");
> +     }
> ++
> ++    if std::env::var("RUSTFLAGS")
> ++        .unwrap_or_default()
> ++        .contains("-Cprofile-use=3D")
> ++    {
> ++        println!("cargo:rustc-cfg=3Dspecified_profile_use");
> ++    }
> ++    println!("cargo:rustc-check-cfg=3Dcfg(specified_profile_use)");
> ++
> +     generate_self_schema();
> +     println!("cargo:rustc-env=3DPROFILE=3D{}",
> std::env::var("PROFILE").unwrap());
> + }
> +diff --git a/src/lib.rs b/src/lib.rs
> +index d55e836..206a7a1 100644
> +--- a/src/lib.rs
> ++++ b/src/lib.rs
> +@@ -111,7 +111,10 @@ pub fn build_info() -> String {
> +     format!(
> +         "profile=3D{} pgo=3D{}",
> +         env!("PROFILE"),
> +-
> option_env!("RUSTFLAGS").unwrap_or("").contains("-Cprofile-use=3D"),
> ++        // We use a `cfg!` here not `env!`/`option_env!` as those would
> ++        // embed `RUSTFLAGS` into the generated binary which causes
> problems
> ++        // with reproducable builds.
> ++        cfg!(specified_profile_use),
> +     )
> + }
> +
> diff --git a/meta-python/recipes-devtools/python/
> python3-pydantic-core_2.18.4.bb b/meta-python/recipes-devtools/python/
> python3-pydantic-core_2.18.4.bb
> index eb5599199..0ab1873a0 100644
> --- a/meta-python/recipes-devtools/python/python3-pydantic-core_2.18.4.bb
> +++ b/meta-python/recipes-devtools/python/python3-pydantic-core_2.18.4.bb
> @@ -8,7 +8,8 @@ HOMEPAGE =3D "https://github.com/pydantic/pydantic-core"
>  LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dab599c188b4a314d2856b3a55030c=
75c"
>
> -SRC_URI +=3D
> "file://0001-Set-rust-version-from-1.76-to-1.75-in-Cargo.toml.patch"
> +SRC_URI +=3D
> "file://0001-Set-rust-version-from-1.76-to-1.75-in-Cargo.toml.patch \
> +            file://0002-Dont-embed-RUSTFLAGS-in-final-binary.patch"
>  SRC_URI[sha256sum] =3D
> "ec3beeada09ff865c344ff3bc2f427f5e6c26401cc6113d77e372c3fdac73864"
>
>  DEPENDS =3D "python3-maturin-native python3-typing-extensions"
> @@ -25,7 +26,6 @@ RDEPENDS:${PN} +=3D " \
>  "
>
>  INSANE_SKIP:${PN} =3D "already-stripped"
> -INSANE_SKIP:${PN} +=3D "buildpaths"
>
>  inherit ptest
>  SRC_URI +=3D "file://run-ptest"
> --
> 2.39.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#111648):
> https://lists.openembedded.org/g/openembedded-devel/message/111648
> Mute This Topic: https://lists.openembedded.org/mt/107786340/924729
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> ticotimo@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000214ef6061f2eb3af
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I just included this in a new series to upgrade python3-py=
dantic-core=C2=A0and python3-pydantic. I&#39;d prefer we take that series i=
nstead, so I can stop churning on this.<br><br>However, this patch should b=
e backported to scarthgap. I will work on that series next.</div><br><div c=
lass=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Aug 8, 2=
024 at 1:45=E2=80=AFAM Frank de Brabander via <a href=3D"http://lists.opene=
mbedded.org">lists.openembedded.org</a> &lt;debrabander=3D<a href=3D"mailto=
:gmail.com@lists.openembedded.org">gmail.com@lists.openembedded.org</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Backport=
 a new upstream fix to remove the TMPDIR<br>
reference from the rust code.<br>
<br>
Signed-off-by: Frank de Brabander &lt;<a href=3D"mailto:debrabander@gmail.c=
om" target=3D"_blank">debrabander@gmail.com</a>&gt;<br>
---<br>
=C2=A0...Dont-embed-RUSTFLAGS-in-final-binary.patch | 47 ++++++++++++++++++=
+<br>
=C2=A0.../python/<a href=3D"http://python3-pydantic-core_2.18.4.bb" rel=3D"=
noreferrer" target=3D"_blank">python3-pydantic-core_2.18.4.bb</a>=C2=A0 =C2=
=A0 |=C2=A0 4 +-<br>
=C2=A02 files changed, 49 insertions(+), 2 deletions(-)<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-pydant=
ic-core/0002-Dont-embed-RUSTFLAGS-in-final-binary.patch<br>
<br>
diff --git a/meta-python/recipes-devtools/python/python3-pydantic-core/0002=
-Dont-embed-RUSTFLAGS-in-final-binary.patch b/meta-python/recipes-devtools/=
python/python3-pydantic-core/0002-Dont-embed-RUSTFLAGS-in-final-binary.patc=
h<br>
new file mode 100644<br>
index 000000000..1c195e294<br>
--- /dev/null<br>
+++ b/meta-python/recipes-devtools/python/python3-pydantic-core/0002-Dont-e=
mbed-RUSTFLAGS-in-final-binary.patch<br>
@@ -0,0 +1,47 @@<br>
+From b3282b301096253a11b1f887f915d0a2a2183597 Mon Sep 17 00:00:00 2001<br>
+From: Frank de Brabander &lt;<a href=3D"mailto:debrabander@gmail.com" targ=
et=3D"_blank">debrabander@gmail.com</a>&gt;<br>
+Date: Thu, 8 Aug 2024 08:04:48 +0200<br>
+Subject: [PATCH] Dont embed RUSTFLAGS in final binary<br>
+<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/pydantic/pydantic=
-core/commit/e07c41b3bad75948201a2201387225694c2fb501" rel=3D"noreferrer" t=
arget=3D"_blank">https://github.com/pydantic/pydantic-core/commit/e07c41b3b=
ad75948201a2201387225694c2fb501</a>]<br>
+---<br>
+ <a href=3D"http://build.rs" rel=3D"noreferrer" target=3D"_blank">build.rs=
</a>=C2=A0 =C2=A0| 9 +++++++++<br>
+ src/<a href=3D"http://lib.rs" rel=3D"noreferrer" target=3D"_blank">lib.rs=
</a> | 5 ++++-<br>
+ 2 files changed, 13 insertions(+), 1 deletion(-)<br>
+<br>
+diff --git a/<a href=3D"http://build.rs" rel=3D"noreferrer" target=3D"_bla=
nk">build.rs</a> b/<a href=3D"http://build.rs" rel=3D"noreferrer" target=3D=
"_blank">build.rs</a><br>
+index 7f59e1f..7fe6490 100644<br>
+--- a/<a href=3D"http://build.rs" rel=3D"noreferrer" target=3D"_blank">bui=
ld.rs</a><br>
++++ b/<a href=3D"http://build.rs" rel=3D"noreferrer" target=3D"_blank">bui=
ld.rs</a><br>
+@@ -35,6 +35,15 @@ fn main() {<br>
+=C2=A0 =C2=A0 =C2=A0if let Some(true) =3D version_check::supports_feature(=
&quot;coverage_attribute&quot;) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0println!(&quot;cargo:rustc-cfg=3Dhas_cov=
erage_attribute&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
++<br>
++=C2=A0 =C2=A0 if std::env::var(&quot;RUSTFLAGS&quot;)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 .unwrap_or_default()<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 .contains(&quot;-Cprofile-use=3D&quot;)<br>
++=C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 println!(&quot;cargo:rustc-cfg=3Dspecified_pr=
ofile_use&quot;);<br>
++=C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 println!(&quot;cargo:rustc-check-cfg=3Dcfg(specified_profil=
e_use)&quot;);<br>
++<br>
+=C2=A0 =C2=A0 =C2=A0generate_self_schema();<br>
+=C2=A0 =C2=A0 =C2=A0println!(&quot;cargo:rustc-env=3DPROFILE=3D{}&quot;, s=
td::env::var(&quot;PROFILE&quot;).unwrap());<br>
+ }<br>
+diff --git a/src/<a href=3D"http://lib.rs" rel=3D"noreferrer" target=3D"_b=
lank">lib.rs</a> b/src/<a href=3D"http://lib.rs" rel=3D"noreferrer" target=
=3D"_blank">lib.rs</a><br>
+index d55e836..206a7a1 100644<br>
+--- a/src/<a href=3D"http://lib.rs" rel=3D"noreferrer" target=3D"_blank">l=
ib.rs</a><br>
++++ b/src/<a href=3D"http://lib.rs" rel=3D"noreferrer" target=3D"_blank">l=
ib.rs</a><br>
+@@ -111,7 +111,10 @@ pub fn build_info() -&gt; String {<br>
+=C2=A0 =C2=A0 =C2=A0format!(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;profile=3D{} pgo=3D{}&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0env!(&quot;PROFILE&quot;),<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 option_env!(&quot;RUSTFLAGS&quot;).unwrap_or(=
&quot;&quot;).contains(&quot;-Cprofile-use=3D&quot;),<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 // We use a `cfg!` here not `env!`/`option_en=
v!` as those would<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 // embed `RUSTFLAGS` into the generated binar=
y which causes problems<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 // with reproducable builds.<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 cfg!(specified_profile_use),<br>
+=C2=A0 =C2=A0 =C2=A0)<br>
+ }<br>
+ <br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
pydantic-core_2.18.4.bb" rel=3D"noreferrer" target=3D"_blank">python3-pydan=
tic-core_2.18.4.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"htt=
p://python3-pydantic-core_2.18.4.bb" rel=3D"noreferrer" target=3D"_blank">p=
ython3-pydantic-core_2.18.4.bb</a><br>
index eb5599199..0ab1873a0 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-pydanti=
c-core_2.18.4.bb" rel=3D"noreferrer" target=3D"_blank">python3-pydantic-cor=
e_2.18.4.bb</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-pydanti=
c-core_2.18.4.bb" rel=3D"noreferrer" target=3D"_blank">python3-pydantic-cor=
e_2.18.4.bb</a><br>
@@ -8,7 +8,8 @@ HOMEPAGE =3D &quot;<a href=3D"https://github.com/pydantic/p=
ydantic-core" rel=3D"noreferrer" target=3D"_blank">https://github.com/pydan=
tic/pydantic-core</a>&quot;<br>
=C2=A0LICENSE =3D &quot;MIT&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3Dab599c188b4a314d2856b=
3a55030c75c&quot;<br>
<br>
-SRC_URI +=3D &quot;file://0001-Set-rust-version-from-1.76-to-1.75-in-Cargo=
.toml.patch&quot;<br>
+SRC_URI +=3D &quot;file://0001-Set-rust-version-from-1.76-to-1.75-in-Cargo=
.toml.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0002-Dont-embed-RUSTFLAGS=
-in-final-binary.patch&quot;<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;ec3beeada09ff865c344ff3bc2f427f5e6c26401=
cc6113d77e372c3fdac73864&quot;<br>
<br>
=C2=A0DEPENDS =3D &quot;python3-maturin-native python3-typing-extensions&qu=
ot;<br>
@@ -25,7 +26,6 @@ RDEPENDS:${PN} +=3D &quot; \<br>
=C2=A0&quot;<br>
<br>
=C2=A0INSANE_SKIP:${PN} =3D &quot;already-stripped&quot;<br>
-INSANE_SKIP:${PN} +=3D &quot;buildpaths&quot;<br>
<br>
=C2=A0inherit ptest<br>
=C2=A0SRC_URI +=3D &quot;file://run-ptest&quot;<br>
-- <br>
2.39.2<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#111648): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/111648" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/111648</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/107786340/924=
729" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/107786340/924729</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:ticotimo@gmail.com" targ=
et=3D"_blank">ticotimo@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000214ef6061f2eb3af--

