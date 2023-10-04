Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCF31E7C4D7
	for <webhook@archiver.kernel.org>; Wed,  4 Oct 2023 15:51:24 +0000 (UTC)
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
 by mx.groups.io with SMTP id smtpd.web11.22118.1696434680857167685
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Oct 2023 08:51:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ByevuuIT;
 spf=pass (domain: gmail.com, ip: 209.85.160.53, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-1dcbd8a56d6so1488759fac.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 04 Oct 2023 08:51:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696434680; x=1697039480; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=InRkwMoEVSirSulSGgO8u5PZnpJ2871+AbR+itF6DCQ=;
        b=ByevuuIT20vRHeUl/9v/+BKhqVl8VqzU2rI5L6789X4L7pIDlQCYcwJxG6PdJ0lMj1
         pEbjKnlQZ634Lpl+RS4+NGPd6/a2dm4qWYXG+4MQOLVVRAx3wZ8m8K52nONjVnzLfS0S
         rZgi+fXwrGnBGFiCBIXMiXCTILfCYxKcpxw4S3yNojxd4z2RXBvmObSr4CDXofw17tCP
         HYIm+PK+UfqKsl9aPqLKVzg5oPeAWBcPDDP+NR6pO9hDrbFS7aG43UoiwqyKlh3hfmpX
         iHzNmyTyZZe712GohFlt1xFqZUgNjymsQTT4jrJ3F/60SkrWvqr2ufEmhMK1Epuz+WNZ
         cHaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696434680; x=1697039480;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=InRkwMoEVSirSulSGgO8u5PZnpJ2871+AbR+itF6DCQ=;
        b=lzC64NtS7Wfmy3C6bUrrKKHkTvRcIr742rT4d2av5B8FEfmopQO66tPFAftug3PiTn
         d0/971o1RLCwdOqnx7/OWwUflDsD61dSGgfp9xUBJMK/GuSjmW3EeWDEhG8+hkdRXuHO
         hl7sQbzlVC0cgUuzHuXFrr9nRzgBTXdn6SF+//f6HxSoUsozaOf54U4m/vKV+lF1BWe2
         0PqNwgPdUFh0kk/00BEZ012karzLMjiJAcPV+TYX6oBZOm87/Jb0afO8vp5Hu8QMFPQK
         GeOYV2Tj27r6owzWPL+2ffSO1cT+feS5nRO/6N4lJaHTAReUIDoO0iqY8Atf5qwWE9rR
         Yr6Q==
X-Gm-Message-State: AOJu0YybG4LM+GZ52HKW1QdXllhdeiysPyaZ54/cI/rQPxQZFimN4jxL
	ywPULVa7l+zXjst6zeDULEncEALh1r5arIQrJZo=
X-Google-Smtp-Source: AGHT+IE0AabyUlmg7g2GOE4ondamnvdzjGxiSkGZFi5N+i8Y0xesZ00NAoQXTC3qMEZMwUOOdAeMRfKD8lsbuc3vzzc=
X-Received: by 2002:a05:6870:b604:b0:187:e563:77b9 with SMTP id
 cm4-20020a056870b60400b00187e56377b9mr2886479oab.45.1696434679833; Wed, 04
 Oct 2023 08:51:19 -0700 (PDT)
MIME-Version: 1.0
References: <20231004065728.4283-1-pavel@zhukoff.net>
In-Reply-To: <20231004065728.4283-1-pavel@zhukoff.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 4 Oct 2023 08:51:08 -0700
Message-ID: <CAMKF1squqBoDcuEdRY_MS=uJfyc7bVtK15pLrh8VunKo4YvvDw@mail.gmail.com>
Subject: Re: [oe] [PATCH 1/3] dummy-sdk-package.inc: Filter packages which are
 marked for installation
To: Pavel Zhukov <pavel@zhukoff.net>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000079ea4b0606e5fa9e"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 04 Oct 2023 15:51:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105336

--00000000000079ea4b0606e5fa9e
Content-Type: text/plain; charset="UTF-8"

Wrong mailing list core layer patches go to oe-core mailing list not
oe-devel

On Wed, Oct 4, 2023 at 8:07 AM Pavel Zhukov <pavel@zhukoff.net> wrote:

> From: Pavel Zhukov <pavel@zhukoff.net>
>
> if packages is provided by dummysdk and in the same time marked for
> installation with IMAGE_INSTALL it causes conflict in apt because virtual
> providers are
> not taken into account if package is asked to be installed explicitly.
> Filter such packages from provides/conflicts to workaround this problem.
> This workaround brakes RPM usecase because of file conlicts with
> DUMMYPROVIDES, use DUMMYPROVIDES_PACKAGES_MULTILIB instead (which
> doesn't include file based conflicts).
> While this is needed for the case of package_deb only adding it for all
> package managers to not complicate the code.
>
> Fixes: [Yocto #13338] [Yocto #14066]
>
> Fixes:
> The following information may help to resolve the situation:
>
> The following packages have unmet dependencies:
>  target-sdk-provides-dummy : Conflicts: bash
> E: Unable to correct problems, you have held broken packages.
>
> Signed-off-by: Pavel Zhukov <pavel@zhukoff.net>
> ---
>  meta/recipes-core/meta/dummy-sdk-package.inc | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-core/meta/dummy-sdk-package.inc
> b/meta/recipes-core/meta/dummy-sdk-package.inc
> index bd26e39ad3..6ccafbf8bc 100644
> --- a/meta/recipes-core/meta/dummy-sdk-package.inc
> +++ b/meta/recipes-core/meta/dummy-sdk-package.inc
> @@ -19,13 +19,14 @@ PR[vardeps] += "DUMMYPROVIDES"
>  PR[vardeps] += "DUMMYPROVIDES_PACKAGES"
>
>  DUMMYPROVIDES_PACKAGES ??= ""
> -DUMMYPROVIDES_PACKAGES_MULTILIB = "${@' '.join([multilib_pkg_extend(d,
> pkg) for pkg in d.getVar('DUMMYPROVIDES_PACKAGES').split()])}"
> +DUMMYPROVIDES_PACKAGES_FILTERED = "${@' '.join([pkg for pkg in
> d.getVar('DUMMYPROVIDES_PACKAGES').split() if d.getVar('IMAGE_INSTALL') is
> not None and pkg not in d.getVar('IMAGE_INSTALL').split()])}"
> +DUMMYPROVIDES_PACKAGES_MULTILIB = "${@' '.join([multilib_pkg_extend(d,
> pkg) for pkg in d.getVar('DUMMYPROVIDES_PACKAGES_FILTERED').split()])}"
>  DUMMYPROVIDES += "${DUMMYPROVIDES_PACKAGES_MULTILIB}"
>
>  python populate_packages:prepend() {
>      p = d.getVar("PN")
>      d.appendVar("RPROVIDES:%s" % p, "${DUMMYPROVIDES}")
> -    d.appendVar("RCONFLICTS:%s" % p, "${DUMMYPROVIDES}")
> +    d.appendVar("RCONFLICTS:%s" % p, "${DUMMYPROVIDES_PACKAGES_MULTILIB}")
>      d.appendVar("RREPLACES:%s" % p, "${DUMMYPROVIDES_PACKAGES_MULTILIB}")
>  }
>
> --
> 2.41.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#105332):
> https://lists.openembedded.org/g/openembedded-devel/message/105332
> Mute This Topic: https://lists.openembedded.org/mt/101757079/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--00000000000079ea4b0606e5fa9e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Wrong mailing list core layer patches go to oe-core maili=
ng list not oe-devel=C2=A0</div><div><br><div class=3D"gmail_quote"><div di=
r=3D"ltr" class=3D"gmail_attr">On Wed, Oct 4, 2023 at 8:07 AM Pavel Zhukov =
&lt;<a href=3D"mailto:pavel@zhukoff.net">pavel@zhukoff.net</a>&gt; wrote:<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border=
-left:1px #ccc solid;padding-left:1ex">From: Pavel Zhukov &lt;<a href=3D"ma=
ilto:pavel@zhukoff.net" target=3D"_blank">pavel@zhukoff.net</a>&gt;<br>
<br>
if packages is provided by dummysdk and in the same time marked for<br>
installation with IMAGE_INSTALL it causes conflict in apt because virtual p=
roviders are<br>
not taken into account if package is asked to be installed explicitly.<br>
Filter such packages from provides/conflicts to workaround this problem.<br=
>
This workaround brakes RPM usecase because of file conlicts with<br>
DUMMYPROVIDES, use DUMMYPROVIDES_PACKAGES_MULTILIB instead (which<br>
doesn&#39;t include file based conflicts).<br>
While this is needed for the case of package_deb only adding it for all<br>
package managers to not complicate the code.<br>
<br>
Fixes: [Yocto #13338] [Yocto #14066]<br>
<br>
Fixes:<br>
The following information may help to resolve the situation:<br>
<br>
The following packages have unmet dependencies:<br>
=C2=A0target-sdk-provides-dummy : Conflicts: bash<br>
E: Unable to correct problems, you have held broken packages.<br>
<br>
Signed-off-by: Pavel Zhukov &lt;<a href=3D"mailto:pavel@zhukoff.net" target=
=3D"_blank">pavel@zhukoff.net</a>&gt;<br>
---<br>
=C2=A0meta/recipes-core/meta/dummy-sdk-package.inc | 5 +++--<br>
=C2=A01 file changed, 3 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/meta/recipes-core/meta/dummy-sdk-package.inc b/meta/recipes-co=
re/meta/dummy-sdk-package.inc<br>
index bd26e39ad3..6ccafbf8bc 100644<br>
--- a/meta/recipes-core/meta/dummy-sdk-package.inc<br>
+++ b/meta/recipes-core/meta/dummy-sdk-package.inc<br>
@@ -19,13 +19,14 @@ PR[vardeps] +=3D &quot;DUMMYPROVIDES&quot;<br>
=C2=A0PR[vardeps] +=3D &quot;DUMMYPROVIDES_PACKAGES&quot;<br>
<br>
=C2=A0DUMMYPROVIDES_PACKAGES ??=3D &quot;&quot;<br>
-DUMMYPROVIDES_PACKAGES_MULTILIB =3D &quot;${@&#39; &#39;.join([multilib_pk=
g_extend(d, pkg) for pkg in d.getVar(&#39;DUMMYPROVIDES_PACKAGES&#39;).spli=
t()])}&quot;<br>
+DUMMYPROVIDES_PACKAGES_FILTERED =3D &quot;${@&#39; &#39;.join([pkg for pkg=
 in d.getVar(&#39;DUMMYPROVIDES_PACKAGES&#39;).split() if d.getVar(&#39;IMA=
GE_INSTALL&#39;) is not None and pkg not in d.getVar(&#39;IMAGE_INSTALL&#39=
;).split()])}&quot;<br>
+DUMMYPROVIDES_PACKAGES_MULTILIB =3D &quot;${@&#39; &#39;.join([multilib_pk=
g_extend(d, pkg) for pkg in d.getVar(&#39;DUMMYPROVIDES_PACKAGES_FILTERED&#=
39;).split()])}&quot;<br>
=C2=A0DUMMYPROVIDES +=3D &quot;${DUMMYPROVIDES_PACKAGES_MULTILIB}&quot;<br>
<br>
=C2=A0python populate_packages:prepend() {<br>
=C2=A0 =C2=A0 =C2=A0p =3D d.getVar(&quot;PN&quot;)<br>
=C2=A0 =C2=A0 =C2=A0d.appendVar(&quot;RPROVIDES:%s&quot; % p, &quot;${DUMMY=
PROVIDES}&quot;)<br>
-=C2=A0 =C2=A0 d.appendVar(&quot;RCONFLICTS:%s&quot; % p, &quot;${DUMMYPROV=
IDES}&quot;)<br>
+=C2=A0 =C2=A0 d.appendVar(&quot;RCONFLICTS:%s&quot; % p, &quot;${DUMMYPROV=
IDES_PACKAGES_MULTILIB}&quot;)<br>
=C2=A0 =C2=A0 =C2=A0d.appendVar(&quot;RREPLACES:%s&quot; % p, &quot;${DUMMY=
PROVIDES_PACKAGES_MULTILIB}&quot;)<br>
=C2=A0}<br>
<br>
-- <br>
2.41.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#105332): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/105332" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/105332</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/101757079/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/101757079/1997914</a><br>
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

--00000000000079ea4b0606e5fa9e--

