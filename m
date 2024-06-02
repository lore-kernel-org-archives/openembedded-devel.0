Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBE5DC25B74
	for <webhook@archiver.kernel.org>; Sun,  2 Jun 2024 20:20:11 +0000 (UTC)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
 by mx.groups.io with SMTP id smtpd.web11.67318.1717359606104104938
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 02 Jun 2024 13:20:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=neL2ZC3l;
 spf=pass (domain: gmail.com, ip: 209.85.219.181, mailfrom: ticotimo@gmail.com)
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-df771b6cc9cso3594672276.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 02 Jun 2024 13:20:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717359605; x=1717964405; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1yRuXLfiNtTO1c1jipqxeo1n67xvm4sCQIjZ90nnJXc=;
        b=neL2ZC3lSCEMl0IMLhk94nI4UicZCK6AMdPBQd5a6P0hlt+BQb00yiwTIzjEnoQ1v7
         h++WNGWwpQSxxxoDfZ3ZHht8Wjvch3J6c44n+KO7P/E0rPPDbjP69Fq+Jm07hWcEV7NU
         VyV/wt1yF6hI00kj4WkOe0hVc29amymOFVHOgjvDLWn6mxDDOEehLCdlmw/MGwP04rOb
         zWA3qtUYuM952Q43ImaTwfamT0foR3Ok8ohQI107G+wi76Lxrgd7vp+J2HQ1xLTeD2yo
         EUIp2Kg5sD6srtfIZWcFoLYIDkQKnMnFZ+aJKQZsT2k1wW6GL2gwbU8Or258CWVZ/9ZL
         4jEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717359605; x=1717964405;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1yRuXLfiNtTO1c1jipqxeo1n67xvm4sCQIjZ90nnJXc=;
        b=eIJc4HvI14CzBJo7xNttiRryB8JfLjhx9S1OkUp5kiPPiqPd2cH/hHVoAXVKcpvnpA
         CB2kdfKsp/IyVdPOdtZpYnx2MIrGVfvR/N6FxODL45xfduHS5dNXCjas0u3C0D78Jgat
         NG0m+hCu3tSUthXm4UaangnWdGyskfsdFhJhEm8s0FRn2koi60kaug8Ca9YFiz1McYQV
         xOQFylFs6DeKL4Nh+SvNoGW/3tNxDcaYuCQM2hUm03q9eBFQZLglXbCX1Oryox1Ix5Qn
         tKymvQT0P7D8FBKO3odWCLvQIF34enNQR2Qtxm76GHBydtPa3yV9yuE7Turs2ZmJ8MKC
         PwPQ==
X-Gm-Message-State: AOJu0YwCizB2mJbU6LzyU7WN/PhnsdNfxkIk0nD+vpWQsKK331w0tJFG
	JTYeurvEyIpxZupSU+MT04N/FulGQLT8NH79jNLMrGKGbFbxUrguKPoQEyrGni6QxmNSF01WFre
	B3cDFSESVYm38EBzS7XtHPRxsAR+xLg==
X-Google-Smtp-Source: AGHT+IGDu4o00wJzcykdUiu03rVok7as/Zz9c+kgJ9yZ0i8KGbvcJvjaNYUBnp24mpgbQiEdq2iPXDCqNd+jeoA+vG8=
X-Received: by 2002:a25:e905:0:b0:df4:d889:a086 with SMTP id
 3f1490d57ef6-dfa73c15865mr7453873276.32.1717359605131; Sun, 02 Jun 2024
 13:20:05 -0700 (PDT)
MIME-Version: 1.0
References: <20240602123659.254606-1-jan.vermaete@gmail.com>
In-Reply-To: <20240602123659.254606-1-jan.vermaete@gmail.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Sun, 2 Jun 2024 13:19:54 -0700
Message-ID: <CANx9H-A7OWRwHhUDaejRy1kqqcH4feTMxDK7Ki2OQ0Gnx6xWog@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH] python3-typer: add new recipe
To: jan.vermaete@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000003730800619edf1b9"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 02 Jun 2024 20:20:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110663

--0000000000003730800619edf1b9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Can you look into adding ptest? We need to not keep adding that technical
debt when adding new recipes.


On Sun, Jun 2, 2024 at 5:39=E2=80=AFAM Jan Vermaete via lists.openembedded.=
org
<jan.vermaete=3Dgmail.com@lists.openembedded.org> wrote:

> Signed-off-by: Jan Vermaete <jan.vermaete@gmail.com>
> ---
>  .../python/python3-typer_0.12.3.bb            | 23 +++++++++++++++++++
>  1 file changed, 23 insertions(+)
>  create mode 100644 meta-python/recipes-devtools/python/
> python3-typer_0.12.3.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-typer_0.12.3.bb
> b/meta-python/recipes-devtools/python/python3-typer_0.12.3.bb
> new file mode 100644
> index 000000000..a4b45f367
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-typer_0.12.3.bb
> @@ -0,0 +1,23 @@
> +SUMMARY =3D "Typer, build great CLIs. Easy to code. Based on Python type
> hints."
> +DESCRIPTION =3D "\
> +    Typer is a library for building CLI applications that users will lov=
e
> using and developers will love creating. Based on Python type hints. \
> +    It's also a command line tool to run scripts, automatically
> converting them to CLI applications. \
> +"
> +HOMEPAGE =3D "https://github.com/tiangolo/typer"
> +LICENSE =3D "MIT"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D173d405eb704b1499218013178722=
617"
> +
> +SRC_URI[sha256sum] =3D
> "49e73131481d804288ef62598d97a1ceef3058905aa536a1134f90891ba35482"
> +
> +inherit pypi python_setuptools_build_meta
> +
> +DEPENDS +=3D "\
> +        python3-pdm-backend-native \
> +        python3-pdm-native \
> +"
> +
> +PYPI_PACKAGE =3D "typer"
> +
> +RDEPENDS:${PN} +=3D "\
> +    python3-click \
> +"
> --
> 2.39.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#110661):
> https://lists.openembedded.org/g/openembedded-devel/message/110661
> Mute This Topic: https://lists.openembedded.org/mt/106442651/924729
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> ticotimo@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000003730800619edf1b9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Can you look into adding ptest? We need to not keep addin=
g that technical debt when adding new recipes.</div><div dir=3D"auto"><br><=
/div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_at=
tr">On Sun, Jun 2, 2024 at 5:39=E2=80=AFAM Jan Vermaete via <a href=3D"http=
://lists.openembedded.org">lists.openembedded.org</a> &lt;jan.vermaete=3D<a=
 href=3D"mailto:gmail.com@lists.openembedded.org">gmail.com@lists.openembed=
ded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;padd=
ing-left:1ex;border-left-color:rgb(204,204,204)">Signed-off-by: Jan Vermaet=
e &lt;<a href=3D"mailto:jan.vermaete@gmail.com" target=3D"_blank">jan.verma=
ete@gmail.com</a>&gt;<br>
---<br>
=C2=A0.../python/<a href=3D"http://python3-typer_0.12.3.bb" rel=3D"noreferr=
er" target=3D"_blank">python3-typer_0.12.3.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | 23 +++++++++++++++++++<br>
=C2=A01 file changed, 23 insertions(+)<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/<a href=3D"htt=
p://python3-typer_0.12.3.bb" rel=3D"noreferrer" target=3D"_blank">python3-t=
yper_0.12.3.bb</a><br>
<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
typer_0.12.3.bb" rel=3D"noreferrer" target=3D"_blank">python3-typer_0.12.3.=
bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://python3-type=
r_0.12.3.bb" rel=3D"noreferrer" target=3D"_blank">python3-typer_0.12.3.bb</=
a><br>
new file mode 100644<br>
index 000000000..a4b45f367<br>
--- /dev/null<br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-typer_0=
.12.3.bb" rel=3D"noreferrer" target=3D"_blank">python3-typer_0.12.3.bb</a><=
br>
@@ -0,0 +1,23 @@<br>
+SUMMARY =3D &quot;Typer, build great CLIs. Easy to code. Based on Python t=
ype hints.&quot;<br>
+DESCRIPTION =3D &quot;\<br>
+=C2=A0 =C2=A0 Typer is a library for building CLI applications that users =
will love using and developers will love creating. Based on Python type hin=
ts. \<br>
+=C2=A0 =C2=A0 It&#39;s also a command line tool to run scripts, automatica=
lly converting them to CLI applications. \<br>
+&quot;<br>
+HOMEPAGE =3D &quot;<a href=3D"https://github.com/tiangolo/typer" rel=3D"no=
referrer" target=3D"_blank">https://github.com/tiangolo/typer</a>&quot;<br>
+LICENSE =3D &quot;MIT&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D173d405eb704b1499218013178=
722617&quot;<br>
+<br>
+SRC_URI[sha256sum] =3D &quot;49e73131481d804288ef62598d97a1ceef3058905aa53=
6a1134f90891ba35482&quot;<br>
+<br>
+inherit pypi python_setuptools_build_meta<br>
+<br>
+DEPENDS +=3D &quot;\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 python3-pdm-backend-native \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 python3-pdm-native \<br>
+&quot;<br>
+<br>
+PYPI_PACKAGE =3D &quot;typer&quot;<br>
+<br>
+RDEPENDS:${PN} +=3D &quot;\<br>
+=C2=A0 =C2=A0 python3-click \<br>
+&quot;<br>
-- <br>
2.39.2<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#110661): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/110661" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/110661</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/106442651/924=
729" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/106442651/924729</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:ticotimo@gmail.com" targ=
et=3D"_blank">ticotimo@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--0000000000003730800619edf1b9--

