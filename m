Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BA71CAC592
	for <webhook@archiver.kernel.org>; Fri, 19 Sep 2025 10:08:26 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web10.12890.1758276503650794241
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 19 Sep 2025 03:08:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=xwOHUhwM;
 spf=pass (domain: smile.fr, ip: 209.85.221.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3ef166e625aso473281f8f.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 19 Sep 2025 03:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1758276502; x=1758881302; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cwMHLgSNHvIqhdBLQJsedxjlC9Q+TTZPsJmNO3cKYOM=;
        b=xwOHUhwMDs1yY03qtM+gCq3L5A5cmURaadiu9OT81/Zp21N+7KKv2goA1WhLkk+KHz
         1T+GcYMKbPmLyXo/7G24wt6QUywPwJIMnfTXTzLu+eLfz9FcPmU5b1OqJQEFi3NMpiAG
         263KN2J+gdQAmELSJbVtP0SoMKKoa/lZlo0fg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758276502; x=1758881302;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cwMHLgSNHvIqhdBLQJsedxjlC9Q+TTZPsJmNO3cKYOM=;
        b=Hh3/h4ibP8xLD5ceETV114LwNe8YjBQ4CuJ9j6TXaNeChlBq9SxlmzrQFBkC9F1Ifq
         A1fHGp+4EqyEUuQdBODo8VXDZzCEQ6BzHOHr5sicBk7tyzf06tTzifLmjPMiYt9Kw4L4
         RQ0v7S4h9PLfTdckdrpLK8oUjLLIUM3DMwom26Jj0KI3NOK6qap8/Xy0eS2aZK7gKgKm
         YoC0h2VSYaCj58EmhsOzM+uAczjKCnyGgz+oZgqcHraqa/ZN3uNkKcNZCskryOhhp263
         LcDRHO4pSYzXmAtXYC1mU7jB90PMJsR8FWz+NO1mfbD0LYqL4TaoGfN5kEc3ddP+Ngot
         flXg==
X-Gm-Message-State: AOJu0YxRRkTxHf09XD0sM4gd9CYhoZckpgP5OhC6OPyzBwDWZ8GrSmZy
	qsH99gbHdFneSvbgceGdIc8rxA8tJxkt6msOWKePgc8VZpChtZA+YVazV+TtjfIQK13YNLHghXH
	ASiT6q5YPmqW+l2KILowEbjIeYHutVPARKiyoilTmV8MTH9ISOWBDkAI=
X-Gm-Gg: ASbGncv1+Bdgkhi73QDUF6e2BvWw6DZ8jhkYc6BTyv8np7Aq2TZPd7Neg+VOe/SzxFV
	Nu+qHiYe7E6UB8cz/ZGcDqHPxHGOixIWF5PP3ERWZFcxKEa57bg1LnIl1KmBLw59vSFf5W39DH/
	VtLa4rLJKRsWrQLB8LtQAGUPnwoNmSZv4lbma8HbqFTFMFl0mPsSRJMMAIsWhJSqAiNVteIuGx6
	+kgJ8Fci2x1dBX3+jVKSdCpNopuVQ2SHQd47riLFg==
X-Google-Smtp-Source: AGHT+IE3kx6X43UVdSvkwXlgvDOmz/Hnlkxa3TPh9Z+esaG+/wBFnyyOYxCQaHexeVgKsYwstp3ebWnqLcriFXlnkO4=
X-Received: by 2002:a05:6000:603:b0:3e9:9282:cfdf with SMTP id
 ffacd0b85a97d-3ee8426629dmr1698056f8f.41.1758276501776; Fri, 19 Sep 2025
 03:08:21 -0700 (PDT)
MIME-Version: 1.0
References: <20250919033335.2338952-1-yi.zhao@windriver.com>
In-Reply-To: <20250919033335.2338952-1-yi.zhao@windriver.com>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Fri, 19 Sep 2025 12:07:55 +0200
X-Gm-Features: AS18NWDcFwv0yd6s981QcghjlQYJHsc61QBblSIJRCU-KNdfg6fXS0KBBBeKsPo
Message-ID: <CAMSfU+4JtSBwBx4NrcM2Nvj14HCvdYOpwHQ=w=52b0OeVSpXNw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] minifi-cpp: fix reproducibility issue
To: yi.zhao@eng.windriver.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000004e4493063f24a690"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 19 Sep 2025 10:08:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119591

--0000000000004e4493063f24a690
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

Le ven. 19 sept. 2025 =C3=A0 05:34, Yi Zhao via lists.openembedded.org <yi.=
zhao=3D
eng.windriver.com@lists.openembedded.org> a =C3=A9crit :

> Minifi-cpp will add a build identifier to the binary. If not specified,
> a random build identifier will be generated for each build. This breaks
> reproducibility. Set BUILD_IDENTIFIER to ${PV} to ensure the identifier
> remains constant across builds.
>
> Additionally, set BUILD_DATE to SOURCE_DATE_EPOCH to use reproducible
> timestamp.
>
> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> ---
>  ...sh-set-BUILD_DATE-to-SOURCE_DATE_EPO.patch | 34 +++++++++++++++++++
>  .../minifi-cpp/minifi-cpp_0.99.1.bb           |  2 ++
>  2 files changed, 36 insertions(+)
>  create mode 100644
> meta-oe/recipes-extended/minifi-cpp/files/0001-generateVersion.sh-set-BUI=
LD_DATE-to-SOURCE_DATE_EPO.patch
>
> diff --git
> a/meta-oe/recipes-extended/minifi-cpp/files/0001-generateVersion.sh-set-B=
UILD_DATE-to-SOURCE_DATE_EPO.patch
> b/meta-oe/recipes-extended/minifi-cpp/files/0001-generateVersion.sh-set-B=
UILD_DATE-to-SOURCE_DATE_EPO.patch
> new file mode 100644
> index 0000000000..a61873e21a
> --- /dev/null
> +++
> b/meta-oe/recipes-extended/minifi-cpp/files/0001-generateVersion.sh-set-B=
UILD_DATE-to-SOURCE_DATE_EPO.patch
> @@ -0,0 +1,34 @@
> +From ee9722731b3f9cfc3d8e338ab09bc0ad409a6941 Mon Sep 17 00:00:00 2001
> +From: Yi Zhao <yi.zhao@windriver.com>
> +Date: Thu, 18 Sep 2025 14:43:11 +0000
> +Subject: [PATCH] generateVersion.sh: set BUILD_DATE to SOURCE_DATE_EPOCH
> +
> +Use SOURCE_DATE_EPOCH to set BUILD_DATE to improve reproducibility.
> +
> +Upstream-Status: Inappropriate [embedded specific]
>

IMHO, this patch is appropriate for upstream. Reproducibility is a
desirable property even outside of OE.
Can you try sending it upstream?
You can reference https://reproducible-builds.org/docs/source-date-epoch/

Thanks!


> +
> +Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> +---
> + generateVersion.sh | 6 +++++-
> + 1 file changed, 5 insertions(+), 1 deletion(-)
> +
> +diff --git a/generateVersion.sh b/generateVersion.sh
> +index 0b50a16..96cc3ae 100755
> +--- a/generateVersion.sh
> ++++ b/generateVersion.sh
> +@@ -25,7 +25,11 @@ flags=3D$6
> + extensions=3D$7
> + buildident=3D$8
> +
> +-date=3D$(date +%s)
> ++if [ -n "${SOURCE_DATE_EPOCH}" ]; then
> ++  date=3D$(date -u -d "@${SOURCE_DATE_EPOCH}" +%s)
> ++else
> ++  date=3D$(date +%s)
> ++fi
> +
> + if [ -d "${src_dir}"/.git ]; then
> +   buildrev=3D$(git -C "${src_dir}" log -1 --pretty=3Dformat:"%H")
> +--
> +2.48.1
> +
> diff --git a/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.99.1.bb
> b/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.99.1.bb
> index 0d9a503793..f4d206c154 100644
> --- a/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.99.1.bb
> +++ b/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.99.1.bb
> @@ -28,6 +28,7 @@ SRC_URI =3D "git://
> github.com/apache/nifi-minifi-cpp.git;protocol=3Dhttps;branch=3Dmai
>
> file://0007-libsodium-aarch64-set-compiler-attributes-after-including-arm=
_.patch
> \
>
> file://0008-MINIFICPP-2553-CMP0065-OLD-removed-in-cmake-4.0-remo.patch \
>
> file://0001-Add-missing-include-for-malloc-free.patch;patchdir=3Dthirdpar=
ty/fmt-src
> \
> +
>  file://0001-generateVersion.sh-set-BUILD_DATE-to-SOURCE_DATE_EPO.patch \
>             file://systemd-volatile.conf \
>             file://sysvinit-volatile.conf \
>            "
> @@ -114,6 +115,7 @@ EXTRA_OECMAKE =3D " \
>                   -DFETCHCONTENT_SOURCE_DIR_FMT=3D${S}/thirdparty/fmt-src=
 \
>
> -DFETCHCONTENT_SOURCE_DIR_SPDLOG=3D${S}/thirdparty/spdlog-src \
>                   ${@bb.utils.contains('DISTRO_FEATURES', 'systemd',
> '-DENABLE_SYSTEMD=3DON', '-DENABLE_SYSTEMD=3DOFF', d)} \
> +                 -DBUILD_IDENTIFIER=3D${PV} \
>                  "
>
>  PACKAGECONFIG ??=3D "libarchive expression-language"
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#119585):
> https://lists.openembedded.org/g/openembedded-devel/message/119585
> Mute This Topic: https://lists.openembedded.org/mt/115322768/4316185
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> yoann.congal@smile.fr]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Yoann Congal
Smile ECS

--0000000000004e4493063f24a690
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello,</div><br><div class=3D"gmail_quote gmail_quote=
_container"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0ven. 19 sept. 202=
5 =C3=A0=C2=A005:34, Yi Zhao via <a href=3D"http://lists.openembedded.org">=
lists.openembedded.org</a> &lt;yi.zhao=3D<a href=3D"mailto:eng.windriver.co=
m@lists.openembedded.org">eng.windriver.com@lists.openembedded.org</a>&gt; =
a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">Minifi-cpp will add a build identifier to the binary. If not specified,=
<br>
a random build identifier will be generated for each build. This breaks<br>
reproducibility. Set BUILD_IDENTIFIER to ${PV} to ensure the identifier<br>
remains constant across builds.<br>
<br>
Additionally, set BUILD_DATE to SOURCE_DATE_EPOCH to use reproducible<br>
timestamp.<br>
<br>
Signed-off-by: Yi Zhao &lt;<a href=3D"mailto:yi.zhao@windriver.com" target=
=3D"_blank">yi.zhao@windriver.com</a>&gt;<br>
---<br>
=C2=A0...sh-set-BUILD_DATE-to-SOURCE_DATE_EPO.patch | 34 ++++++++++++++++++=
+<br>
=C2=A0.../minifi-cpp/<a href=3D"http://minifi-cpp_0.99.1.bb" rel=3D"norefer=
rer" target=3D"_blank">minifi-cpp_0.99.1.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 2 ++<br>
=C2=A02 files changed, 36 insertions(+)<br>
=C2=A0create mode 100644 meta-oe/recipes-extended/minifi-cpp/files/0001-gen=
erateVersion.sh-set-BUILD_DATE-to-SOURCE_DATE_EPO.patch<br>
<br>
diff --git a/meta-oe/recipes-extended/minifi-cpp/files/0001-generateVersion=
.sh-set-BUILD_DATE-to-SOURCE_DATE_EPO.patch b/meta-oe/recipes-extended/mini=
fi-cpp/files/0001-generateVersion.sh-set-BUILD_DATE-to-SOURCE_DATE_EPO.patc=
h<br>
new file mode 100644<br>
index 0000000000..a61873e21a<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-extended/minifi-cpp/files/0001-generateVersion.sh-set=
-BUILD_DATE-to-SOURCE_DATE_EPO.patch<br>
@@ -0,0 +1,34 @@<br>
+From ee9722731b3f9cfc3d8e338ab09bc0ad409a6941 Mon Sep 17 00:00:00 2001<br>
+From: Yi Zhao &lt;<a href=3D"mailto:yi.zhao@windriver.com" target=3D"_blan=
k">yi.zhao@windriver.com</a>&gt;<br>
+Date: Thu, 18 Sep 2025 14:43:11 +0000<br>
+Subject: [PATCH] generateVersion.sh: set BUILD_DATE to SOURCE_DATE_EPOCH<b=
r>
+<br>
+Use SOURCE_DATE_EPOCH to set BUILD_DATE to improve reproducibility.<br>
+<br>
+Upstream-Status: Inappropriate [embedded specific]<br></blockquote><div><b=
r></div><div>IMHO, this patch is appropriate for upstream. Reproducibility =
is a desirable property even outside of OE.</div><div>Can you try sending i=
t upstream?</div><div>You can reference <a href=3D"https://reproducible-bui=
lds.org/docs/source-date-epoch/">https://reproducible-builds.org/docs/sourc=
e-date-epoch/</a></div><div><br></div><div>Thanks!</div><div>=C2=A0</div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">
+<br>
+Signed-off-by: Yi Zhao &lt;<a href=3D"mailto:yi.zhao@windriver.com" target=
=3D"_blank">yi.zhao@windriver.com</a>&gt;<br>
+---<br>
+ generateVersion.sh | 6 +++++-<br>
+ 1 file changed, 5 insertions(+), 1 deletion(-)<br>
+<br>
+diff --git a/generateVersion.sh b/generateVersion.sh<br>
+index 0b50a16..96cc3ae 100755<br>
+--- a/generateVersion.sh<br>
++++ b/generateVersion.sh<br>
+@@ -25,7 +25,11 @@ flags=3D$6<br>
+ extensions=3D$7<br>
+ buildident=3D$8<br>
+ <br>
+-date=3D$(date +%s)<br>
++if [ -n &quot;${SOURCE_DATE_EPOCH}&quot; ]; then<br>
++=C2=A0 date=3D$(date -u -d &quot;@${SOURCE_DATE_EPOCH}&quot; +%s)<br>
++else<br>
++=C2=A0 date=3D$(date +%s)<br>
++fi<br>
+ <br>
+ if [ -d &quot;${src_dir}&quot;/.git ]; then<br>
+=C2=A0 =C2=A0buildrev=3D$(git -C &quot;${src_dir}&quot; log -1 --pretty=3D=
format:&quot;%H&quot;)<br>
+-- <br>
+2.48.1<br>
+<br>
diff --git a/meta-oe/recipes-extended/minifi-cpp/<a href=3D"http://minifi-c=
pp_0.99.1.bb" rel=3D"noreferrer" target=3D"_blank">minifi-cpp_0.99.1.bb</a>=
 b/meta-oe/recipes-extended/minifi-cpp/<a href=3D"http://minifi-cpp_0.99.1.=
bb" rel=3D"noreferrer" target=3D"_blank">minifi-cpp_0.99.1.bb</a><br>
index 0d9a503793..f4d206c154 100644<br>
--- a/meta-oe/recipes-extended/minifi-cpp/<a href=3D"http://minifi-cpp_0.99=
.1.bb" rel=3D"noreferrer" target=3D"_blank">minifi-cpp_0.99.1.bb</a><br>
+++ b/meta-oe/recipes-extended/minifi-cpp/<a href=3D"http://minifi-cpp_0.99=
.1.bb" rel=3D"noreferrer" target=3D"_blank">minifi-cpp_0.99.1.bb</a><br>
@@ -28,6 +28,7 @@ SRC_URI =3D &quot;git://<a href=3D"http://github.com/apac=
he/nifi-minifi-cpp.git;protocol=3Dhttps;branch=3Dmai" rel=3D"noreferrer" ta=
rget=3D"_blank">github.com/apache/nifi-minifi-cpp.git;protocol=3Dhttps;bran=
ch=3Dmai</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0007-libsodium-aarch64-set=
-compiler-attributes-after-including-arm_.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0008-MINIFICPP-2553-CMP006=
5-OLD-removed-in-cmake-4.0-remo.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Add-missing-include-f=
or-malloc-free.patch;patchdir=3Dthirdparty/fmt-src \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-generateVersion.sh-se=
t-BUILD_DATE-to-SOURCE_DATE_EPO.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://systemd-volatile.conf \<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://sysvinit-volatile.conf \<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
@@ -114,6 +115,7 @@ EXTRA_OECMAKE =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -DFETCHCONTE=
NT_SOURCE_DIR_FMT=3D${S}/thirdparty/fmt-src \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -DFETCHCONTE=
NT_SOURCE_DIR_SPDLOG=3D${S}/thirdparty/spdlog-src \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${@bb.utils.=
contains(&#39;DISTRO_FEATURES&#39;, &#39;systemd&#39;, &#39;-DENABLE_SYSTEM=
D=3DON&#39;, &#39;-DENABLE_SYSTEMD=3DOFF&#39;, d)} \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-DBUILD_IDEN=
TIFIER=3D${PV} \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
=C2=A0PACKAGECONFIG ??=3D &quot;libarchive expression-language&quot;<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#119585): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/119585" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/119585</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/115322768/431=
6185" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/115322768/4316185</a><br>
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

--0000000000004e4493063f24a690--

