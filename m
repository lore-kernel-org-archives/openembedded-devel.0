Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A014C433EF
	for <webhook@archiver.kernel.org>; Fri, 29 Oct 2021 10:12:15 +0000 (UTC)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com
 [209.85.219.179])
 by mx.groups.io with SMTP id smtpd.web10.3503.1635502333933715006
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 Oct 2021 03:12:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=b6GivDdB;
 spf=pass (domain: gmail.com, ip: 209.85.219.179,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-yb1-f179.google.com with SMTP id q74so17061957ybq.11
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 Oct 2021 03:12:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=s1hnAiBrmDsNWbCqcZnUtRjFpJ7NtyXi83e79udTi9o=;
        b=b6GivDdBLYnsK8ymoOS4ZrJ81lPvioplBFic1tWnfrIMbgWoK6nN7bZVP9sBrBdm8H
         eHiSa1kw+t1nBm4f3VfM//QsEdwekl9ZIHLWEnw0VDIOjcIWOoYhFdqpczK8+6kElXmD
         e6nD8YcTcuHHQ8sySeHKAPggNa8PpI1RBZDIL0cpGVAMGd6BIclzMd29shFQ32KVXnOF
         fJ/lG9azPY7H8otFfu6rE1tbLznIvNBQyl6i1fBZbFm1scFt2Db7ynViULP9ULJVNzNj
         Wef1tlHFogLPK6rELuGamOfF/u5ii/WVDrup7kVa+WeKi5rdta/OEwI7RSxauwyNqlNr
         31Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=s1hnAiBrmDsNWbCqcZnUtRjFpJ7NtyXi83e79udTi9o=;
        b=uCEUr+P3RAgLi6TX5h542zuRNStYl5cA3C9AtE9h4z4nnKei7ewUd4Jr10iUvL4HVM
         zgCDyYg82zsjYQhEhFO7pUr0nN6LJG3Ksp0/MOb8sKxi3BO6zvdI9WOvjSWbAwI4UYCJ
         Y8Sk3kAepX22QpdrJp3D50w2AJeENrQx4SRYS30NyMhJbenTbtPrKyhJ/ij/kPasZwcR
         fodwKTWG6INJr9rliNPlJCqcyHqrEYuelzTq7ArzJfKKAhult6sUJ3AOsWgECc4FYVVH
         Dh9h4VoBvwrXiDCOBEhXOU2pT/8GS8Fpis76zAcRs29H/FQmIp70v8JeIkRDXelg7DZz
         +3pw==
X-Gm-Message-State: AOAM531cC7veoOppT3Oe1+BSvVLiF48Jb0o/G6hEp7fNSc/SAeMhDISB
	+9Ql7jUajpSVhAp9oMwv4vUgCYYo6KDROnM9yBE=
X-Google-Smtp-Source: 
 ABdhPJwrDVWtR7aPuIchMOMGefcsboad81+tmavDK92tjW3MUK2x9hEzv4pBB/TZ9gs4nMsOHdREx/oWDBaMIgG65oY=
X-Received: by 2002:a5b:846:: with SMTP id v6mr10232474ybq.457.1635502333013;
 Fri, 29 Oct 2021 03:12:13 -0700 (PDT)
MIME-Version: 1.0
References: <1635528651-24541-1-git-send-email-zangrc.fnst@fujitsu.com>
In-Reply-To: <1635528651-24541-1-git-send-email-zangrc.fnst@fujitsu.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Fri, 29 Oct 2021 11:12:03 +0100
Message-ID: 
 <CANPvuRkfXGKOfjAjt3OXD+eZiZLarD6RV+1vizw9kP_FZmPeHg@mail.gmail.com>
Subject: Re: [oe] [meta-python] [PATCH v2] python3-smpplib: upgrade 2.1.0 ->
 2.2.0
To: zangrc <zangrc.fnst@fujitsu.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000096b46405cf7b0f05"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 29 Oct 2021 10:12:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93650

--00000000000096b46405cf7b0f05
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Probably this patch are changing the encoding of the recipe file.

Jose

zangrc <zangrc.fnst@fujitsu.com> escreveu no dia sexta, 29/10/2021 =C3=A0(s=
)
06:31:

> License-Update: README.md is modified as follows
> - client =3D smpplib.client.Client('example.com', SOMEPORTNUMBER)
> + client =3D smpplib.client.Client('example.com', SOMEPORTNUMBER,
> allow_unknown_opt_params=3DTrue)
>
> Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
> ---
>  .../python/python3-smpplib_2.1.0.bb           | 24 ---------------
>  .../python/python3-smpplib_2.2.0.bb           | 30 +++++++++++++++++++
>  2 files changed, 30 insertions(+), 24 deletions(-)
>  delete mode 100644 meta-python/recipes-devtools/python/
> python3-smpplib_2.1.0.bb
>  create mode 100644 meta-python/recipes-devtools/python/
> python3-smpplib_2.2.0.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-smpplib_2.1.0.bb
> b/meta-python/recipes-devtools/python/python3-smpplib_2.1.0.bb
> deleted file mode 100644
> index 56d8f9eea..000000000
> --- a/meta-python/recipes-devtools/python/python3-smpplib_2.1.0.bb
> +++ /dev/null
> @@ -1,24 +0,0 @@
> -SUMMARY =3D "SMPP library for python"
> -SECTION =3D "devel/python"
> -LICENSE =3D "GPLv3.0"
> -LIC_FILES_CHKSUM =3D "file://README.md;md5=3D56a03d0ce7e492d4b9487b8aae9=
57efe"
> -
> -PYPI_PACKAGE =3D "smpplib"
> -SRC_URI[sha256sum] =3D
> "df4139a279b35fbb42a58f2a254a9c6daf362b04a7f94e208dc120e0b8a3fd4b"
> -
> -inherit pypi setuptools3 ptest
> -
> -SRC_URI +=3D " \
> -        file://run-ptest \
> -"
> -
> -RDEPENDS:${PN}-ptest +=3D " \
> -        ${PYTHON_PN}-pytest \
> -        ${PYTHON_PN}-unittest \
> -"
> -
> -do_install_ptest() {
> -        install -d ${D}${PTEST_PATH}/tests
> -        cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
> -       sed -i 's/mock/unittest.mock/g' ${D}${PTEST_PATH}/tests/*
> -}
> diff --git a/meta-python/recipes-devtools/python/python3-smpplib_2.2.0.bb
> b/meta-python/recipes-devtools/python/python3-smpplib_2.2.0.bb
> new file mode 100644
> index 000000000..00a493914
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-smpplib_2.2.0.bb
> @@ -0,0 +1,30 @@
> +SUMMARY =3D "SMPP library for python"
> +SECTION =3D "devel/python"
> +LICENSE =3D "GPLv3.0"
> +LIC_FILES_CHKSUM =3D "file://README.md;md5=3D8b4e2ac8cf248f7b991784f88b6=
30852"
> +
> +PYPI_PACKAGE =3D "smpplib"
> +SRC_URI[sha256sum] =3D
> "3d513178a35573f66faac4ef2127c4bd73307ddb463d145b17b013cf709d9ddd"
> +
> +inherit pypi setuptools3 ptest
> +
> +SRC_URI +=3D " \
> +        file://run-ptest \
> +"
> +
> +RDEPENDS:${PN} +=3D " \
> +        ${PYTHON_PN}-logging \
> +        ${PYTHON_PN}-six \
> +"
> +
> +RDEPENDS:${PN}-ptest +=3D " \
> +        ${PYTHON_PN}-pytest \
> +        ${PYTHON_PN}-unittest \
> +        ${PYTHON_PN}-profile \
> +        ${PYTHON_PN}-mock \
> +"
> +
> +do_install_ptest() {
> +        install -d ${D}${PTEST_PATH}/tests
> +        cp -rf ${S}/smpplib/tests/* ${D}${PTEST_PATH}/tests/
> +}
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#93643):
> https://lists.openembedded.org/g/openembedded-devel/message/93643
> Mute This Topic: https://lists.openembedded.org/mt/86670703/5052612
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--00000000000096b46405cf7b0f05
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi,</div><div><br></div>Probably this patch are chang=
ing the encoding of the recipe file.<div><br></div><div>Jose</div></div><br=
><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">zangrc &l=
t;<a href=3D"mailto:zangrc.fnst@fujitsu.com">zangrc.fnst@fujitsu.com</a>&gt=
; escreveu no dia sexta, 29/10/2021 =C3=A0(s) 06:31:<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">License-Update: README.md is modified =
as follows<br>
- client =3D smpplib.client.Client(&#39;<a href=3D"http://example.com" rel=
=3D"noreferrer" target=3D"_blank">example.com</a>&#39;, SOMEPORTNUMBER)<br>
+ client =3D smpplib.client.Client(&#39;<a href=3D"http://example.com" rel=
=3D"noreferrer" target=3D"_blank">example.com</a>&#39;, SOMEPORTNUMBER, all=
ow_unknown_opt_params=3DTrue)<br>
<br>
Signed-off-by: Zang Ruochen &lt;<a href=3D"mailto:zangrc.fnst@fujitsu.com" =
target=3D"_blank">zangrc.fnst@fujitsu.com</a>&gt;<br>
---<br>
=C2=A0.../python/<a href=3D"http://python3-smpplib_2.1.0.bb" rel=3D"norefer=
rer" target=3D"_blank">python3-smpplib_2.1.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 24 ---------------<br>
=C2=A0.../python/<a href=3D"http://python3-smpplib_2.2.0.bb" rel=3D"norefer=
rer" target=3D"_blank">python3-smpplib_2.2.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 30 +++++++++++++++++++<br>
=C2=A02 files changed, 30 insertions(+), 24 deletions(-)<br>
=C2=A0delete mode 100644 meta-python/recipes-devtools/python/<a href=3D"htt=
p://python3-smpplib_2.1.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-=
smpplib_2.1.0.bb</a><br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/<a href=3D"htt=
p://python3-smpplib_2.2.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-=
smpplib_2.2.0.bb</a><br>
<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
smpplib_2.1.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-smpplib_2.1.=
0.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://python3-sm=
pplib_2.1.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-smpplib_2.1.0.=
bb</a><br>
deleted file mode 100644<br>
index 56d8f9eea..000000000<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-smpplib=
_2.1.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-smpplib_2.1.0.bb</a=
><br>
+++ /dev/null<br>
@@ -1,24 +0,0 @@<br>
-SUMMARY =3D &quot;SMPP library for python&quot;<br>
-SECTION =3D &quot;devel/python&quot;<br>
-LICENSE =3D &quot;GPLv3.0&quot;<br>
-LIC_FILES_CHKSUM =3D &quot;file://README.md;md5=3D56a03d0ce7e492d4b9487b8a=
ae957efe&quot;<br>
-<br>
-PYPI_PACKAGE =3D &quot;smpplib&quot;<br>
-SRC_URI[sha256sum] =3D &quot;df4139a279b35fbb42a58f2a254a9c6daf362b04a7f94=
e208dc120e0b8a3fd4b&quot;<br>
-<br>
-inherit pypi setuptools3 ptest<br>
-<br>
-SRC_URI +=3D &quot; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 file://run-ptest \<br>
-&quot;<br>
-<br>
-RDEPENDS:${PN}-ptest +=3D &quot; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 ${PYTHON_PN}-pytest \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 ${PYTHON_PN}-unittest \<br>
-&quot;<br>
-<br>
-do_install_ptest() {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -d ${D}${PTEST_PATH}/tests<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i &#39;s/mock/unittest.mock/g&#39; ${D}${P=
TEST_PATH}/tests/*<br>
-}<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
smpplib_2.2.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-smpplib_2.2.=
0.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://python3-sm=
pplib_2.2.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-smpplib_2.2.0.=
bb</a><br>
new file mode 100644<br>
index 000000000..00a493914<br>
--- /dev/null<br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-smpplib=
_2.2.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-smpplib_2.2.0.bb</a=
><br>
@@ -0,0 +1,30 @@<br>
+SUMMARY =3D &quot;SMPP library for python&quot;<br>
+SECTION =3D &quot;devel/python&quot;<br>
+LICENSE =3D &quot;GPLv3.0&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://README.md;md5=3D8b4e2ac8cf248f7b991784f8=
8b630852&quot;<br>
+<br>
+PYPI_PACKAGE =3D &quot;smpplib&quot;<br>
+SRC_URI[sha256sum] =3D &quot;3d513178a35573f66faac4ef2127c4bd73307ddb463d1=
45b17b013cf709d9ddd&quot;<br>
+<br>
+inherit pypi setuptools3 ptest<br>
+<br>
+SRC_URI +=3D &quot; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 file://run-ptest \<br>
+&quot;<br>
+<br>
+RDEPENDS:${PN} +=3D &quot; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ${PYTHON_PN}-logging \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ${PYTHON_PN}-six \<br>
+&quot;<br>
+<br>
+RDEPENDS:${PN}-ptest +=3D &quot; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ${PYTHON_PN}-pytest \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ${PYTHON_PN}-unittest \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ${PYTHON_PN}-profile \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ${PYTHON_PN}-mock \<br>
+&quot;<br>
+<br>
+do_install_ptest() {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -d ${D}${PTEST_PATH}/tests<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 cp -rf ${S}/smpplib/tests/* ${D}${PTEST_PATH}/=
tests/<br>
+}<br>
-- <br>
2.25.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#93643): <a href=3D"https://lists.openembedded.org/g/ope=
nembedded-devel/message/93643" rel=3D"noreferrer" target=3D"_blank">https:/=
/lists.openembedded.org/g/openembedded-devel/message/93643</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/86670703/5052=
612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/86670703/5052612</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:quaresma.jose@gmail.com"=
 target=3D"_blank">quaresma.jose@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9=
 Quaresma</div></div></div>

--00000000000096b46405cf7b0f05--

