Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web09.8672.1618988171025843624
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Apr 2021 23:56:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Jzh2M7/3;
 spf=pass (domain: gmail.com, ip: 209.85.208.45, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f45.google.com with SMTP id e7so47908857edu.10
        for <openembedded-devel@lists.openembedded.org>; Tue, 20 Apr 2021 23:56:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CNIXOhNbO4E/HWKCNXo8ZBPS1Pmr2zGCIKhg/+a6ImI=;
        b=Jzh2M7/3ko2PYsityLrLF1kCfkYqg4UXcco9vZoDDN0YJNy2tIrHHmbMkFOgaUs+Fu
         +Ixu8+qu1XFwfB2+Zk0a27CcnYvMwNOrThJLNDbDJ9C91Z2W+AWB+pETcU/HIhb9xnC2
         2KQ6O7umjY6J1blCcK/M+dJ1IrhI9YkYsGOIXXRbz+UFJV19pMwClhb1fNBUsk2JVyyR
         aAk3Fg2eA2msoSA+73JFd1VmE5imokcbMlBGMmMWDBIHb4XxlHoZBT365JwofrYfLfea
         dvNMRZHAPjTgZfHI9cTHKa3twJ9SHxmxbCoW+W/96dTJcz/5ENUTlxkWs71mqX99gsfA
         O8kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CNIXOhNbO4E/HWKCNXo8ZBPS1Pmr2zGCIKhg/+a6ImI=;
        b=fCDBY9+TLX8qYnZHU7awqvH4XX8hVeWrFJUQIUl2bABwE2qkHT3bf2rdjo1pVfzKav
         R1Fwja2ZYObovk/M88/4aTxEtMDvQ1mEWsncTlPq2NMkloDmH0Zo1M6L+gAmfTc6Nn3g
         JebbdFp4K8xNzs1dlGPuWvteO2xM6wXTOdfS2Bv0aZvGgGIt/C6/K0WFN6UGgSKWOQlN
         dHfuuPOSsvhxHEy/Qeqm4rQO89qCH4o0IBgugcJEvFAC/6J9LC8q7RqrYVkQxG39ed0Z
         /NqCzlB37ASqzlHCse1J8+MBN8tRyRiXqxBIijrImRZgKVu/mFLprxOLgtEquASzo64H
         AvFQ==
X-Gm-Message-State: AOAM532Tef6S3e1fV3P4avKgPdL/3yFEAt5adMjm1dqWVaZ2uRkWGoLy
	zPuyhvFkU0MB6/XLTfTAy3TvIgq2lrzjP0LTHQo=
X-Google-Smtp-Source: ABdhPJzhxKpF4InALA/MdbZ6qHBiesMWE5gR5MseSCfT99E/BdPF7/vDaycOnHltXc1Y+uJ6s08oIFPZguF6Q59Vvy4=
X-Received: by 2002:aa7:db14:: with SMTP id t20mr35773556eds.311.1618988169390;
 Tue, 20 Apr 2021 23:56:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210417181938.3824401-1-raj.khem@gmail.com> <20210417181938.3824401-2-raj.khem@gmail.com>
In-Reply-To: <20210417181938.3824401-2-raj.khem@gmail.com>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Wed, 21 Apr 2021 08:55:57 +0200
Message-ID: <CA+chaQf-dXgCrU4G0PajzkCWqvfxhpZe8YDvq8kPJnq9ui7Zdg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH v2 2/3] nodejs: Fix build with icu-69
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000bb6b4505c0760ebe"

--000000000000bb6b4505c0760ebe
Content-Type: text/plain; charset="UTF-8"

all 3
Acked-by: Martin Jansa <Martin.Jansa@gmail.com>

On Sat, Apr 17, 2021 at 8:19 PM Khem Raj <raj.khem@gmail.com> wrote:

> backport relevant v8 patch to fix the build issue
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> v2: Rebased
>
>  ...all-new-ListFormatter-createInstance.patch | 93 +++++++++++++++++++
>  .../recipes-devtools/nodejs/nodejs_14.16.1.bb |  1 +
>  2 files changed, 94 insertions(+)
>  create mode 100644
> meta-oe/recipes-devtools/nodejs/nodejs/v8-call-new-ListFormatter-createInstance.patch
>
> diff --git
> a/meta-oe/recipes-devtools/nodejs/nodejs/v8-call-new-ListFormatter-createInstance.patch
> b/meta-oe/recipes-devtools/nodejs/nodejs/v8-call-new-ListFormatter-createInstance.patch
> new file mode 100644
> index 0000000000..806360084c
> --- /dev/null
> +++
> b/meta-oe/recipes-devtools/nodejs/nodejs/v8-call-new-ListFormatter-createInstance.patch
> @@ -0,0 +1,93 @@
> +From 035c305ce7761f51328b45f1bd83e26aef267c9d Mon Sep 17 00:00:00 2001
> +From: Frank Tang <ftang@chromium.org>
> +Date: Thu, 15 Oct 2020 22:44:27 -0700
> +Subject: [PATCH] [Intl] call new ListFormatter::createInstance
> +
> +The one we currently using is now marked as internal and to be removed
> +for 68. Migrating to the style which already avaiable in ICU 67-1.
> +
> +Upstream-Status: Backport
> +Bug: v8:11031
> +Change-Id: I668382a2e1b8602ddca02bf231c5008a6c92bf2d
> +Reviewed-on: https://chromium-review.googlesource.com/c/v8/v8/+/2477751
> +Reviewed-by
> <https://chromium-review.googlesource.com/c/v8/v8/+/2477751+Reviewed-by>:
> Jakob Kummerow <jkummerow@chromium.org>
> +Commit-Queue: Frank Tang <ftang@chromium.org>
> +Cr-Commit-Position: refs/heads/master@{#70638}
> +---
> + deps/v8/src/objects/js-list-format.cc | 55
> ++++++++++++-----------------------
> + 1 file changed, 18 insertions(+), 37 deletions(-)
> +
> +--- a/deps/v8/src/objects/js-list-format.cc
> ++++ b/deps/v8/src/objects/js-list-format.cc
> +@@ -29,46 +29,27 @@ namespace v8 {
> + namespace internal {
> +
> + namespace {
> +-const char* kStandard = "standard";
> +-const char* kOr = "or";
> +-const char* kUnit = "unit";
> +-const char* kStandardShort = "standard-short";
> +-const char* kOrShort = "or-short";
> +-const char* kUnitShort = "unit-short";
> +-const char* kStandardNarrow = "standard-narrow";
> +-const char* kOrNarrow = "or-narrow";
> +-const char* kUnitNarrow = "unit-narrow";
> +
> +-const char* GetIcuStyleString(JSListFormat::Style style,
> +-                              JSListFormat::Type type) {
> ++UListFormatterWidth GetIcuWidth(JSListFormat::Style style) {
> ++  switch (style) {
> ++    case JSListFormat::Style::LONG:
> ++      return ULISTFMT_WIDTH_WIDE;
> ++    case JSListFormat::Style::SHORT:
> ++      return ULISTFMT_WIDTH_SHORT;
> ++    case JSListFormat::Style::NARROW:
> ++      return ULISTFMT_WIDTH_NARROW;
> ++  }
> ++  UNREACHABLE();
> ++}
> ++
> ++UListFormatterType GetIcuType(JSListFormat::Type type) {
> +   switch (type) {
> +     case JSListFormat::Type::CONJUNCTION:
> +-      switch (style) {
> +-        case JSListFormat::Style::LONG:
> +-          return kStandard;
> +-        case JSListFormat::Style::SHORT:
> +-          return kStandardShort;
> +-        case JSListFormat::Style::NARROW:
> +-          return kStandardNarrow;
> +-      }
> ++      return ULISTFMT_TYPE_AND;
> +     case JSListFormat::Type::DISJUNCTION:
> +-      switch (style) {
> +-        case JSListFormat::Style::LONG:
> +-          return kOr;
> +-        case JSListFormat::Style::SHORT:
> +-          return kOrShort;
> +-        case JSListFormat::Style::NARROW:
> +-          return kOrNarrow;
> +-      }
> ++      return ULISTFMT_TYPE_OR;
> +     case JSListFormat::Type::UNIT:
> +-      switch (style) {
> +-        case JSListFormat::Style::LONG:
> +-          return kUnit;
> +-        case JSListFormat::Style::SHORT:
> +-          return kUnitShort;
> +-        case JSListFormat::Style::NARROW:
> +-          return kUnitNarrow;
> +-      }
> ++      return ULISTFMT_TYPE_UNITS;
> +   }
> +   UNREACHABLE();
> + }
> +@@ -143,7 +124,7 @@ MaybeHandle<JSListFormat> JSListFormat::
> +   icu::Locale icu_locale = r.icu_locale;
> +   UErrorCode status = U_ZERO_ERROR;
> +   icu::ListFormatter* formatter = icu::ListFormatter::createInstance(
> +-      icu_locale, GetIcuStyleString(style_enum, type_enum), status);
> ++      icu_locale, GetIcuType(type_enum), GetIcuWidth(style_enum),
> status);
> +   if (U_FAILURE(status) || formatter == nullptr) {
> +     delete formatter;
> +     THROW_NEW_ERROR(isolate, NewRangeError(MessageTemplate::kIcuError),
> diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_14.16.1.bb
> b/meta-oe/recipes-devtools/nodejs/nodejs_14.16.1.bb
> index b24a6d6567..32bdd713b5 100644
> --- a/meta-oe/recipes-devtools/nodejs/nodejs_14.16.1.bb
> +++ b/meta-oe/recipes-devtools/nodejs/nodejs_14.16.1.bb
> @@ -21,6 +21,7 @@ SRC_URI = "
> http://nodejs.org/dist/v${PV}/node-v${PV}.tar.xz \
>             file://0004-v8-don-t-override-ARM-CFLAGS.patch \
>             file://big-endian.patch \
>             file://mips-warnings.patch \
> +           file://v8-call-new-ListFormatter-createInstance.patch \
>             "
>  SRC_URI_append_class-target = " \
>             file://0002-Using-native-binaries.patch \
> --
> 2.31.1
>
>
> 
>
>

--000000000000bb6b4505c0760ebe
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">all 3<div>Acked-by:=C2=A0Martin Jansa &lt;<a href=3D"mailt=
o:Martin.Jansa@gmail.com">Martin.Jansa@gmail.com</a>&gt;</div></div><br><di=
v class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, Apr 1=
7, 2021 at 8:19 PM Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.k=
hem@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">backport relevant v8 patch to fix the build issue<br>
<br>
Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
---<br>
v2: Rebased<br>
<br>
=C2=A0...all-new-ListFormatter-createInstance.patch | 93 +++++++++++++++++=
++<br>
=C2=A0.../recipes-devtools/nodejs/<a href=3D"http://nodejs_14.16.1.bb" rel=
=
=3D"noreferrer" target=3D"_blank">nodejs_14.16.1.bb</a> |=C2=A0 1 +<br>
=C2=A02 files changed, 94 insertions(+)<br>
=C2=A0create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/v8-call-ne=
w-ListFormatter-createInstance.patch<br>
<br>
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/v8-call-new-ListFormat=
ter-createInstance.patch b/meta-oe/recipes-devtools/nodejs/nodejs/v8-call-n=
ew-ListFormatter-createInstance.patch<br>
new file mode 100644<br>
index 0000000000..806360084c<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-devtools/nodejs/nodejs/v8-call-new-ListFormatter-cre=
ateInstance.patch<br>
@@ -0,0 +1,93 @@<br>
+From 035c305ce7761f51328b45f1bd83e26aef267c9d Mon Sep 17 00:00:00 2001<br=
>
+From: Frank Tang &lt;<a href=3D"mailto:ftang@chromium.org" target=3D"_bla=
nk">ftang@chromium.org</a>&gt;<br>
+Date: Thu, 15 Oct 2020 22:44:27 -0700<br>
+Subject: [PATCH] [Intl] call new ListFormatter::createInstance<br>
+<br>
+The one we currently using is now marked as internal and to be removed<br=
>
+for 68. Migrating to the style which already avaiable in ICU 67-1.<br>
+<br>
+Upstream-Status: Backport<br>
+Bug: v8:11031<br>
+Change-Id: I668382a2e1b8602ddca02bf231c5008a6c92bf2d<br>
+Reviewed-on: <a href=3D"https://chromium-review.googlesource.com/c/v8/v8/=
+/2477751+Reviewed-by" rel=3D"noreferrer" target=3D"_blank">https://chromiu=
m-review.googlesource.com/c/v8/v8/+/2477751<br>
+Reviewed-by</a>: Jakob Kummerow &lt;<a href=3D"mailto:jkummerow@chromium.=
org" target=3D"_blank">jkummerow@chromium.org</a>&gt;<br>
+Commit-Queue: Frank Tang &lt;<a href=3D"mailto:ftang@chromium.org" target=
=
=3D"_blank">ftang@chromium.org</a>&gt;<br>
+Cr-Commit-Position: refs/heads/master@{#70638}<br>
+---<br>
+ deps/v8/src/objects/js-list-format.cc | 55 ++++++++++++-----------------=
------<br>
+ 1 file changed, 18 insertions(+), 37 deletions(-)<br>
+<br>
+--- a/deps/v8/src/objects/js-list-format.cc<br>
++++ b/deps/v8/src/objects/js-list-format.cc<br>
+@@ -29,46 +29,27 @@ namespace v8 {<br>
+ namespace internal {<br>
+ <br>
+ namespace {<br>
+-const char* kStandard =3D &quot;standard&quot;;<br>
+-const char* kOr =3D &quot;or&quot;;<br>
+-const char* kUnit =3D &quot;unit&quot;;<br>
+-const char* kStandardShort =3D &quot;standard-short&quot;;<br>
+-const char* kOrShort =3D &quot;or-short&quot;;<br>
+-const char* kUnitShort =3D &quot;unit-short&quot;;<br>
+-const char* kStandardNarrow =3D &quot;standard-narrow&quot;;<br>
+-const char* kOrNarrow =3D &quot;or-narrow&quot;;<br>
+-const char* kUnitNarrow =3D &quot;unit-narrow&quot;;<br>
+ <br>
+-const char* GetIcuStyleString(JSListFormat::Style style,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 JSListFormat::Type type) {<br>
++UListFormatterWidth GetIcuWidth(JSListFormat::Style style) {<br>
++=C2=A0 switch (style) {<br>
++=C2=A0 =C2=A0 case JSListFormat::Style::LONG:<br>
++=C2=A0 =C2=A0 =C2=A0 return ULISTFMT_WIDTH_WIDE;<br>
++=C2=A0 =C2=A0 case JSListFormat::Style::SHORT:<br>
++=C2=A0 =C2=A0 =C2=A0 return ULISTFMT_WIDTH_SHORT;<br>
++=C2=A0 =C2=A0 case JSListFormat::Style::NARROW:<br>
++=C2=A0 =C2=A0 =C2=A0 return ULISTFMT_WIDTH_NARROW;<br>
++=C2=A0 }<br>
++=C2=A0 UNREACHABLE();<br>
++}<br>
++<br>
++UListFormatterType GetIcuType(JSListFormat::Type type) {<br>
+=C2=A0 =C2=A0switch (type) {<br>
+=C2=A0 =C2=A0 =C2=A0case JSListFormat::Type::CONJUNCTION:<br>
+-=C2=A0 =C2=A0 =C2=A0 switch (style) {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 case JSListFormat::Style::LONG:<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return kStandard;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 case JSListFormat::Style::SHORT:<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return kStandardShort;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 case JSListFormat::Style::NARROW:<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return kStandardNarrow;<br>
+-=C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 return ULISTFMT_TYPE_AND;<br>
+=C2=A0 =C2=A0 =C2=A0case JSListFormat::Type::DISJUNCTION:<br>
+-=C2=A0 =C2=A0 =C2=A0 switch (style) {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 case JSListFormat::Style::LONG:<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return kOr;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 case JSListFormat::Style::SHORT:<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return kOrShort;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 case JSListFormat::Style::NARROW:<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return kOrNarrow;<br>
+-=C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 return ULISTFMT_TYPE_OR;<br>
+=C2=A0 =C2=A0 =C2=A0case JSListFormat::Type::UNIT:<br>
+-=C2=A0 =C2=A0 =C2=A0 switch (style) {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 case JSListFormat::Style::LONG:<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return kUnit;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 case JSListFormat::Style::SHORT:<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return kUnitShort;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 case JSListFormat::Style::NARROW:<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return kUnitNarrow;<br>
+-=C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 return ULISTFMT_TYPE_UNITS;<br>
+=C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0UNREACHABLE();<br>
+ }<br>
+@@ -143,7 +124,7 @@ MaybeHandle&lt;JSListFormat&gt; JSListFormat::<br>
+=C2=A0 =C2=A0icu::Locale icu_locale =3D r.icu_locale;<br>
+=C2=A0 =C2=A0UErrorCode status =3D U_ZERO_ERROR;<br>
+=C2=A0 =C2=A0icu::ListFormatter* formatter =3D icu::ListFormatter::create=
Instance(<br>
+-=C2=A0 =C2=A0 =C2=A0 icu_locale, GetIcuStyleString(style_enum, type_enum=
), status);<br>
++=C2=A0 =C2=A0 =C2=A0 icu_locale, GetIcuType(type_enum), GetIcuWidth(styl=
e_enum), status);<br>
+=C2=A0 =C2=A0if (U_FAILURE(status) || formatter =3D=3D nullptr) {<br>
+=C2=A0 =C2=A0 =C2=A0delete formatter;<br>
+=C2=A0 =C2=A0 =C2=A0THROW_NEW_ERROR(isolate, NewRangeError(MessageTemplat=
e::kIcuError),<br>
diff --git a/meta-oe/recipes-devtools/nodejs/<a href=3D"http://nodejs_14.1=
6.1.bb" rel=3D"noreferrer" target=3D"_blank">nodejs_14.16.1.bb</a> b/meta-o=
e/recipes-devtools/nodejs/<a href=3D"http://nodejs_14.16.1.bb" rel=3D"noref=
errer" target=3D"_blank">nodejs_14.16.1.bb</a><br>
index b24a6d6567..32bdd713b5 100644<br>
--- a/meta-oe/recipes-devtools/nodejs/<a href=3D"http://nodejs_14.16.1.bb"=
 rel=3D"noreferrer" target=3D"_blank">nodejs_14.16.1.bb</a><br>
+++ b/meta-oe/recipes-devtools/nodejs/<a href=3D"http://nodejs_14.16.1.bb"=
 rel=3D"noreferrer" target=3D"_blank">nodejs_14.16.1.bb</a><br>
@@ -21,6 +21,7 @@ SRC_URI =3D &quot;<a href=3D"http://nodejs.org/dist/v$%7=
BPV%7D/node-v$%7BPV%7D.tar.xz" rel=3D"noreferrer" target=3D"_blank">http://=
nodejs.org/dist/v${PV}/node-v${PV}.tar.xz</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0004-v8-don-t-override-AR=
M-CFLAGS.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://big-endian.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://mips-warnings.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://v8-call-new-ListFormatter=
-createInstance.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
=C2=A0SRC_URI_append_class-target =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0002-Using-native-binarie=
s.patch \<br>
-- <br>
2.31.1<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--000000000000bb6b4505c0760ebe--
