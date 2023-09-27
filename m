Return-Path: <samuli.piippo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9122E80A8A
	for <webhook@archiver.kernel.org>; Wed, 27 Sep 2023 05:20:15 +0000 (UTC)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
 by mx.groups.io with SMTP id smtpd.web10.11127.1695792011901501711
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Sep 2023 22:20:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GaStJfNb;
 spf=pass (domain: gmail.com, ip: 209.85.217.53, mailfrom: samuli.piippo@gmail.com)
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-452863742f3so4741047137.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 26 Sep 2023 22:20:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695792011; x=1696396811; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=B8+LZ7UMHcQl6RgIb6IHhdhk16NCLkaBaBhMtBZWcYc=;
        b=GaStJfNbrSo7rl142U0JlX/WGsJNocGK2GuUF3OBOythLGOJYZbDno68cO6yMbI9SM
         wJK4TmhOHWSGocF7s9AcDTavVOSkml61erqWW0ko15peeMuB17zSidMAWR0m3UqdvXMh
         ddvvhlBmLN2SRQK29Eotv5692mWY9HFjmaBic6vuRF2kqYVBTrE6Qe32f/zayhQOlFKE
         e2Pbolkr/dtv0hdKQZPAjbjsAkUKaUTp1tFSJvBbyxv7PaqsKQoHTupTlR1suds2PuvN
         MudQt0JQ+VrNfmAMIHG+zzlwb8HRDs2iXI78NcIT+SDVj02/bf/UxK5oIuQkQem6CxEp
         65fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695792011; x=1696396811;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B8+LZ7UMHcQl6RgIb6IHhdhk16NCLkaBaBhMtBZWcYc=;
        b=QLjDrBdnIRdLI+T7S/3qOhvUGbu0ZwMZRKKUiV48hNB0OFlTbN5We0lMLZVnw32xXx
         4rnO4A/25A282lcuzw34alWZojRSJ34P7TN71N4R/wYDbfu1+m8y2KMRAEeiUkNBGspq
         AO+F+c/i++hwU7C78At2TAOY/1nx1vfwT+UMlPLeGoGtrW0wg21+NWFdh06x2c+UAok5
         /Y9VKVhq55wVdZzPfvkznbk2B+OLsB4qaRI6cEw/V/tsXREqd6X/GrKLTw1hPwRmgKn+
         NkkRUks4VvCHJVxQekO4ByCJU9gXEDHKZCy72qIYkBMs1ANfPjmZG5hTSYW0LSsO8en2
         v7HQ==
X-Gm-Message-State: AOJu0YyqGx2r/5rp/y1hA6CZs2mjmVnzzk90X1/R+TduY3iwaeQ4kuGH
	7Z/FwVz7CLTvpUMG1yOlnHSeZEMCTop+yxQJ01c=
X-Google-Smtp-Source: AGHT+IF9F1LSKWlioyJ2cp+tZ3RWA9wqn+37Saoz45os1imxr+S/mIV5/XAAjI3KThBuk8g85eX8CacgAIJ7WLlLw+I=
X-Received: by 2002:a05:6102:414:b0:44d:6256:ac8b with SMTP id
 d20-20020a056102041400b0044d6256ac8bmr1064292vsq.4.1695792010783; Tue, 26 Sep
 2023 22:20:10 -0700 (PDT)
MIME-Version: 1.0
References: <1788A95F04E8B4F0.25618@lists.openembedded.org>
In-Reply-To: <1788A95F04E8B4F0.25618@lists.openembedded.org>
From: Samuli Piippo <samuli.piippo@gmail.com>
Date: Wed, 27 Sep 2023 08:19:58 +0300
Message-ID: <CABXoSoW=xU3fvq6EcaMxopw8e3FhEOLmYG59O1Fiyu8DKcT6Zg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] protobuf: stage protoc binary to sysroot
To: samuli.piippo@gmail.com
Cc: openembedded-devel@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>
Content-Type: multipart/alternative; boundary="0000000000006a7042060650587f"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Sep 2023 05:20:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105165

--0000000000006a7042060650587f
Content-Type: text/plain; charset="UTF-8"

Re-applying this patch as it got removed in
https://patchwork.yoctoproject.org/project/oe/patch/20230904161230.377450-1-ross.burton@arm.com/

On Wed, 27 Sept 2023 at 08:11, Samuli Piippo via lists.openembedded.org
<samuli.piippo=gmail.com@lists.openembedded.org> wrote:

> From: Samuli Piippo <samuli.piippo@gmail.com>
>
> If protoc is enabled for the build, recipes using protobuf will
> fail when protoc is not available in the recipe sysroot:
>
> |   The imported target "protobuf::protoc" references the file
> |
> |
> ".../recipe-sysroot/usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-pokysdk-linux/usr/bin/protoc-3.21.5.0"
> |
> |   but this file does not exist.  Possible reasons include:
> |
> |   * The file was deleted, renamed, or moved to another location.
> |
> |   * An install or uninstall procedure did not complete successfully.
> |
> |   * The installation package was faulty and contained
> |
> |
> ".../recipe-sysroot/usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-pokysdk-linux/usr/lib/cmake/protobuf/protobuf-targets.cmake"
> |
> |   but not all the files it references.
>
> Use SYSROOT_DIRS to stage the binary to sysroot so it's always
> available for other recipes.
>
> Signed-off-by: Samuli Piippo <samuli.piippo@qt.io>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta-oe/recipes-devtools/protobuf/protobuf_3.21.12.bb | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_3.21.12.bb
> b/meta-oe/recipes-devtools/protobuf/protobuf_3.21.12.bb
> index d95e1c20f..06b21a0d6 100644
> --- a/meta-oe/recipes-devtools/protobuf/protobuf_3.21.12.bb
> +++ b/meta-oe/recipes-devtools/protobuf/protobuf_3.21.12.bb
> @@ -92,6 +92,9 @@ PACKAGE_BEFORE_PN = "${PN}-compiler ${PN}-lite"
>  FILES:${PN}-compiler = "${bindir} ${libdir}/libprotoc${SOLIBS}"
>  FILES:${PN}-lite = "${libdir}/libprotobuf-lite${SOLIBS}"
>
> +# CMake requires binaries to exist in sysroot, even if they have wrong
> architecture.
> +SYSROOT_DIRS += "${bindir}"
> +
>  RDEPENDS:${PN}-compiler = "${PN}"
>  RDEPENDS:${PN}-dev += "${PN}-compiler"
>  RDEPENDS:${PN}-ptest = "bash ${@bb.utils.contains('PACKAGECONFIG',
> 'python', 'python3-protobuf', '', d)}"
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#105163):
> https://lists.openembedded.org/g/openembedded-devel/message/105163
> Mute This Topic: https://lists.openembedded.org/mt/101612304/3617605
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> samuli.piippo@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--0000000000006a7042060650587f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Re-applying this patch as it got removed in <a href=3D"htt=
ps://patchwork.yoctoproject.org/project/oe/patch/20230904161230.377450-1-ro=
ss.burton@arm.com/">https://patchwork.yoctoproject.org/project/oe/patch/202=
30904161230.377450-1-ross.burton@arm.com/</a></div><br><div class=3D"gmail_=
quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, 27 Sept 2023 at 08:11,=
 Samuli Piippo via <a href=3D"http://lists.openembedded.org">lists.openembe=
dded.org</a> &lt;samuli.piippo=3D<a href=3D"mailto:gmail.com@lists.openembe=
dded.org">gmail.com@lists.openembedded.org</a>&gt; wrote:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">From: Samuli Piippo &lt;<a href=
=3D"mailto:samuli.piippo@gmail.com" target=3D"_blank">samuli.piippo@gmail.c=
om</a>&gt;<br>
<br>
If protoc is enabled for the build, recipes using protobuf will<br>
fail when protoc is not available in the recipe sysroot:<br>
<br>
|=C2=A0 =C2=A0The imported target &quot;protobuf::protoc&quot; references t=
he file<br>
|<br>
|=C2=A0 =C2=A0 =C2=A0 &quot;.../recipe-sysroot/usr/local/oe-sdk-hardcoded-b=
uildpath/sysroots/x86_64-pokysdk-linux/usr/bin/protoc-3.21.5.0&quot;<br>
|<br>
|=C2=A0 =C2=A0but this file does not exist.=C2=A0 Possible reasons include:=
<br>
|<br>
|=C2=A0 =C2=A0* The file was deleted, renamed, or moved to another location=
.<br>
|<br>
|=C2=A0 =C2=A0* An install or uninstall procedure did not complete successf=
ully.<br>
|<br>
|=C2=A0 =C2=A0* The installation package was faulty and contained<br>
|<br>
|=C2=A0 =C2=A0 =C2=A0 &quot;.../recipe-sysroot/usr/local/oe-sdk-hardcoded-b=
uildpath/sysroots/x86_64-pokysdk-linux/usr/lib/cmake/protobuf/protobuf-targ=
ets.cmake&quot;<br>
|<br>
|=C2=A0 =C2=A0but not all the files it references.<br>
<br>
Use SYSROOT_DIRS to stage the binary to sysroot so it&#39;s always<br>
available for other recipes.<br>
<br>
Signed-off-by: Samuli Piippo &lt;<a href=3D"mailto:samuli.piippo@qt.io" tar=
get=3D"_blank">samuli.piippo@qt.io</a>&gt;<br>
Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D=
"_blank">raj.khem@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta-oe/recipes-devtools/protobuf/<a href=3D"http://protobuf_3.21.12.=
bb" rel=3D"noreferrer" target=3D"_blank">protobuf_3.21.12.bb</a> | 3 +++<br=
>
=C2=A01 file changed, 3 insertions(+)<br>
<br>
diff --git a/meta-oe/recipes-devtools/protobuf/<a href=3D"http://protobuf_3=
.21.12.bb" rel=3D"noreferrer" target=3D"_blank">protobuf_3.21.12.bb</a> b/m=
eta-oe/recipes-devtools/protobuf/<a href=3D"http://protobuf_3.21.12.bb" rel=
=3D"noreferrer" target=3D"_blank">protobuf_3.21.12.bb</a><br>
index d95e1c20f..06b21a0d6 100644<br>
--- a/meta-oe/recipes-devtools/protobuf/<a href=3D"http://protobuf_3.21.12.=
bb" rel=3D"noreferrer" target=3D"_blank">protobuf_3.21.12.bb</a><br>
+++ b/meta-oe/recipes-devtools/protobuf/<a href=3D"http://protobuf_3.21.12.=
bb" rel=3D"noreferrer" target=3D"_blank">protobuf_3.21.12.bb</a><br>
@@ -92,6 +92,9 @@ PACKAGE_BEFORE_PN =3D &quot;${PN}-compiler ${PN}-lite&quo=
t;<br>
=C2=A0FILES:${PN}-compiler =3D &quot;${bindir} ${libdir}/libprotoc${SOLIBS}=
&quot;<br>
=C2=A0FILES:${PN}-lite =3D &quot;${libdir}/libprotobuf-lite${SOLIBS}&quot;<=
br>
<br>
+# CMake requires binaries to exist in sysroot, even if they have wrong arc=
hitecture.<br>
+SYSROOT_DIRS +=3D &quot;${bindir}&quot;<br>
+<br>
=C2=A0RDEPENDS:${PN}-compiler =3D &quot;${PN}&quot;<br>
=C2=A0RDEPENDS:${PN}-dev +=3D &quot;${PN}-compiler&quot;<br>
=C2=A0RDEPENDS:${PN}-ptest =3D &quot;bash ${@bb.utils.contains(&#39;PACKAGE=
CONFIG&#39;, &#39;python&#39;, &#39;python3-protobuf&#39;, &#39;&#39;, d)}&=
quot;<br>
-- <br>
2.25.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#105163): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/105163" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/105163</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/101612304/361=
7605" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/101612304/3617605</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:samuli.piippo@gmail.com"=
 target=3D"_blank">samuli.piippo@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--0000000000006a7042060650587f--

