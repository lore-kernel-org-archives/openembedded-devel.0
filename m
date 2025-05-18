Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F205FC3ABD8
	for <webhook@archiver.kernel.org>; Sun, 18 May 2025 20:36:27 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web11.37165.1747600577711754531
 for <Openembedded-devel@lists.openembedded.org>;
 Sun, 18 May 2025 13:36:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=LCvve4dT;
 spf=pass (domain: smile.fr, ip: 209.85.128.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-442d146a1aaso34490955e9.1
        for <Openembedded-devel@lists.openembedded.org>; Sun, 18 May 2025 13:36:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1747600576; x=1748205376; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cQE0xCzBNWF7mC4a+sMScQCZdA/0hfx1yb2NpnlXGBE=;
        b=LCvve4dTallhduAOAo7uKdcmSyRWqrym4/10WVy6j0SIwmNpR0ydJxoSjt0ANm3MXJ
         yRqYWGk89kXyUBvWrVDIevztFON3L5DoKFEY2rTntIR43XPekZMWr35xCVWBXHbXlsYl
         12/4aDCMvqcLMfoxzvWseG+FbAGdCfI5JlEsg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747600576; x=1748205376;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cQE0xCzBNWF7mC4a+sMScQCZdA/0hfx1yb2NpnlXGBE=;
        b=iC9jFypnrl8gAyrUlzifaZ8NMF/kYk981a5+bYvlAbo9OTq99xcnDEiA71e/PDWBIC
         riSDzR5C4Wzz4qiUq5rPEzkc6wtOxCun0zJl6P3oAp5LNKyvOOzKkwp5+vaNWu4VZSlK
         DzvyOZbQMIQWhmB3+7af7G1hM4zxj3NNC4ljfwka6FAX9Nj40R4o6EqiBjdcsiBiyoMA
         5NKTxUQjQXSnoyKIKsLA8JvNMLDHax7/u/xghlfDO3pYZdH7xfftl0sgbn8JQs0qk4Bq
         h/4m3B9rK3Ro3LCYKEWnAvhfif5fNcT2NnbSKTS02pgMx2aKMZdtRUqT1iQWbbc4MJr1
         JnGg==
X-Gm-Message-State: AOJu0YzNfCCTtCPgx8EJw7Xc/t05PjoqWNnTwjQlo1bsNRaevtelq8MU
	I22tvMwjSwl9ACay+nv3aAy8lCCYnOgf7mBdEk/8xtHoOdXBBnQ3I0K/Omw1YjjYgWZA8vyB0LL
	FjeLeJ+EZgDsx5HrLSEcvpKNW+raCjPltp4Pt87SqYA==
X-Gm-Gg: ASbGnctJecrEAkUOBpDPDEzZI5eWblXaIu3uVBdK4viWk6Ip9616Xg5JqqzzyPq1xe4
	HYTiwFkz4vvg8QCb7n1HyPpxpez/OmJ+e2jyhMtT5WM/2x1YFUHbMAbsvpzEhZ4ZF1xHKEfcnNN
	jzDRAmLg1sXHm+Dla1jxkIhodkG9mDXc6TfWySUI/aB7z06d51xtEgGRkVNLxg6Cg8Hnmc22JbE
	U5VRw==
X-Google-Smtp-Source: AGHT+IFnO4tS9oHTS7+4cb9wWm50pWZXS8fYZCIJBG1sIwtKkD/zqc/JWrmYRtqU9rUjcAZPk/LAHtsiCcnT5FMgHq4=
X-Received: by 2002:a05:600c:4753:b0:43d:683:8cb2 with SMTP id
 5b1f17b1804b1-442fefef18amr77587335e9.14.1747600575920; Sun, 18 May 2025
 13:36:15 -0700 (PDT)
MIME-Version: 1.0
References: <20250518192835.229015-1-dimitris@siganos.org> <20250518192835.229015-2-dimitris@siganos.org>
In-Reply-To: <20250518192835.229015-2-dimitris@siganos.org>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Sun, 18 May 2025 22:35:49 +0200
X-Gm-Features: AX0GCFsnljdtuAlNOPl3q2NsnK5L8HUBS7LLnlBWu3SuxAVfIpj0m-uaqakLgS8
Message-ID: <CAMSfU+5gCDDrw0ksTueG6DrQDqhWMMhwYZda1rRjev+J=tbqog@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] bvi: add new package
To: dimitris@siganos.org
Cc: Openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000089913906356ef71a"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 18 May 2025 20:36:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117463

--00000000000089913906356ef71a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

Le dim. 18 mai 2025 =C3=A0 21:29, Dimitrios Siganos via lists.openembedded.=
org
<dimitris=3Dsiganos.org@lists.openembedded.org> a =C3=A9crit :

> bvi is a visual editor for binary files
>
> Signed-off-by: Dimitrios Siganos <dimitris@siganos.org>
> ---
>  meta-oe/recipes-support/bvi/bvi_1.4.2.bb | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
>  create mode 100644 meta-oe/recipes-support/bvi/bvi_1.4.2.bb
>
> diff --git a/meta-oe/recipes-support/bvi/bvi_1.4.2.bb
> b/meta-oe/recipes-support/bvi/bvi_1.4.2.bb
> new file mode 100644
> index 0000000000..e6da1efd41
> --- /dev/null
> +++ b/meta-oe/recipes-support/bvi/bvi_1.4.2.bb
> @@ -0,0 +1,21 @@
> +SUMMARY =3D "Binary VI editor"
> +DESCRIPTION =3D "bvi is a visual editor for binary files."
> +HOMEPAGE =3D "https://sourceforge.net/projects/bvi"
> +SECTION =3D "console/utils"
> +LICENSE =3D "GPL-3.0-only"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Da36207309d382da27cd66fdaae922=
e3c"
> +
> +SRC_URI =3D "${SOURCEFORGE_MIRROR}/bvi/bvi-${PV}.src.tar.gz"
> +SRC_URI[sha256sum] =3D
> "4bba16c2b496963a9b939336c0abcc8d488664492080ae43a86da18cf4ce94f2"
> +
> +DEPENDS +=3D "ncurses"
> +
> +inherit pkgconfig autotools
> +
> +# build inside the source tree, bvi does not support out of tree buildin=
g
> +B =3D "${S}"


FYI, there is the autotools-brokensep class just for that.

Also, that does not build on my system on master. Looks related to the
gcc-15 incompatibilities mentioned here:
https://sourceforge.net/p/bvi/bugs/16/
My logs: https://pastebin.com/SH6uNHDi

Finally, the last activity of the author was 2 years ago :
https://sourceforge.net/p/bvi/activity/?page=3D0&limit=3D100#67ba1727be8108=
c555c9b214
It does not look maintained anymore :( (gcc15 ticket was 3 months ago, no
activity)

Regards,


> +
> +EXTRA_OECONF +=3D "\
> +    --build=3D${BUILD_SYS} \
> +    --host=3D${TARGET_SYS} \
> +"
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#117462):
> https://lists.openembedded.org/g/openembedded-devel/message/117462
> Mute This Topic: https://lists.openembedded.org/mt/113180865/4316185
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> yoann.congal@smile.fr]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Yoann Congal
Smile ECS

--00000000000089913906356ef71a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div>Hello,</div><br></div><div class=3D"=
gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Le=
=C2=A0dim. 18 mai 2025 =C3=A0=C2=A021:29, Dimitrios Siganos via <a href=3D"=
http://lists.openembedded.org">lists.openembedded.org</a> &lt;dimitris=3D<a=
 href=3D"mailto:siganos.org@lists.openembedded.org">siganos.org@lists.opene=
mbedded.org</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">bvi is a visual editor for binary files<br>
<br>
Signed-off-by: Dimitrios Siganos &lt;<a href=3D"mailto:dimitris@siganos.org=
" target=3D"_blank">dimitris@siganos.org</a>&gt;<br>
---<br>
=C2=A0meta-oe/recipes-support/bvi/<a href=3D"http://bvi_1.4.2.bb" rel=3D"no=
referrer" target=3D"_blank">bvi_1.4.2.bb</a> | 21 +++++++++++++++++++++<br>
=C2=A01 file changed, 21 insertions(+)<br>
=C2=A0create mode 100644 meta-oe/recipes-support/bvi/<a href=3D"http://bvi_=
1.4.2.bb" rel=3D"noreferrer" target=3D"_blank">bvi_1.4.2.bb</a><br>
<br>
diff --git a/meta-oe/recipes-support/bvi/<a href=3D"http://bvi_1.4.2.bb" re=
l=3D"noreferrer" target=3D"_blank">bvi_1.4.2.bb</a> b/meta-oe/recipes-suppo=
rt/bvi/<a href=3D"http://bvi_1.4.2.bb" rel=3D"noreferrer" target=3D"_blank"=
>bvi_1.4.2.bb</a><br>
new file mode 100644<br>
index 0000000000..e6da1efd41<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-support/bvi/<a href=3D"http://bvi_1.4.2.bb" rel=3D"no=
referrer" target=3D"_blank">bvi_1.4.2.bb</a><br>
@@ -0,0 +1,21 @@<br>
+SUMMARY =3D &quot;Binary VI editor&quot;<br>
+DESCRIPTION =3D &quot;bvi is a visual editor for binary files.&quot;<br>
+HOMEPAGE =3D &quot;<a href=3D"https://sourceforge.net/projects/bvi" rel=3D=
"noreferrer" target=3D"_blank">https://sourceforge.net/projects/bvi</a>&quo=
t;<br>
+SECTION =3D &quot;console/utils&quot;<br>
+LICENSE =3D &quot;GPL-3.0-only&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Da36207309d382da27cd66fdaae=
922e3c&quot;<br>
+<br>
+SRC_URI =3D &quot;${SOURCEFORGE_MIRROR}/bvi/bvi-${PV}.src.tar.gz&quot;<br>
+SRC_URI[sha256sum] =3D &quot;4bba16c2b496963a9b939336c0abcc8d488664492080a=
e43a86da18cf4ce94f2&quot;<br>
+<br>
+DEPENDS +=3D &quot;ncurses&quot;<br>
+<br>
+inherit pkgconfig autotools<br>
+<br>
+# build inside the source tree, bvi does not support out of tree building<=
br>
+B =3D &quot;${S}&quot;</blockquote><div><br></div><div>FYI, there is the a=
utotools-brokensep class just for that.</div><div><br></div><div>Also, that=
 does not build on my system on master. Looks related to the gcc-15 incompa=
tibilities mentioned here: <a href=3D"https://sourceforge.net/p/bvi/bugs/16=
/">https://sourceforge.net/p/bvi/bugs/16/</a></div><div>My logs: <a href=3D=
"https://pastebin.com/SH6uNHDi">https://pastebin.com/SH6uNHDi</a></div><div=
><br></div><div>Finally, the last activity of the author was 2 years ago : =
<a href=3D"https://sourceforge.net/p/bvi/activity/?page=3D0&amp;limit=3D100=
#67ba1727be8108c555c9b214">https://sourceforge.net/p/bvi/activity/?page=3D0=
&amp;limit=3D100#67ba1727be8108c555c9b214</a></div><div>It does not look ma=
intained anymore :( (gcc15 ticket was 3 months ago, no activity)</div><div>=
<br></div><div>Regards,</div><div>=C2=A0</div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">
+<br>
+EXTRA_OECONF +=3D &quot;\<br>
+=C2=A0 =C2=A0 --build=3D${BUILD_SYS} \<br>
+=C2=A0 =C2=A0 --host=3D${TARGET_SYS} \<br>
+&quot;<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#117462): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/117462" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/117462</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/113180865/431=
6185" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/113180865/4316185</a><br>
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

--00000000000089913906356ef71a--

