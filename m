Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 701FDC2BD09
	for <webhook@archiver.kernel.org>; Mon,  1 Jul 2024 14:58:56 +0000 (UTC)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
 by mx.groups.io with SMTP id smtpd.web11.22280.1719845930932225152
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Jul 2024 07:58:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UshdBv88;
 spf=pass (domain: gmail.com, ip: 209.85.128.180, mailfrom: ticotimo@gmail.com)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-64b3655297aso26241107b3.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 01 Jul 2024 07:58:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719845930; x=1720450730; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GJTh8DOQsvpOJgyWpWAjJ0T2poeHHPXniwkG9AbZNPs=;
        b=UshdBv88IEMJi1Dg7RvoLEcuDsxfyAqKbzgZXOZuVFYdg0re+Zd3hyGsx6tqpGzO3c
         jKShTGIzyFX6egjiC6+zjdeBk1SGJbqVkLeyUnFlrTitw6SZ7uZzIpMB2adle8yvTGE5
         2REZet+TqWBfSV5F222nO+brZIkEerN+oZWKrvcfUE5MfuI+qaGvJGtjyySaSfoDOyac
         Pj7jtGRKzkinXJHvo+RCJOsnRQUZSuXmr4R7TSgukv9kJHN6/k5LDEWkXF/tdlHu6Asd
         QCzRVDz5jfhZqiya0maZMBiHbNhF2WtLLZH5J2hKwh/Ix/a78Sz6P6zK+i+dwVGA++iW
         8cbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719845930; x=1720450730;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GJTh8DOQsvpOJgyWpWAjJ0T2poeHHPXniwkG9AbZNPs=;
        b=YRRNk8520pWmnmIuvZh60pIfbAa+8V2hGeiKDSfAVwJXKZm6Fng3M4KGF2JTIQG7t9
         6OFsvBQc/4n3NpPyLpgI2Dp2mm6vPEBQtmb9vAOe6FeJcCw3PyKzi3B0FfnXSo+JRJ+X
         CEYxEnJa0gGosuk7ONI3BrJGF8tgqqSIloH6r+EpeAwTN+ZLTfIEI4nbpKQl+pyOnQDt
         RDgUBr6ImSl0ZV75N+DgvcGWbxAa05JORWP+wTvTug7PBBtpJbJWJPcbyaA2zibFHcHo
         s+mChY36f7t/ekI9HnoTGjRzCK+ADPN6vPTNux+2a1lUA+NLtiNqFKgAxjDqF23F2pC+
         3wcw==
X-Gm-Message-State: AOJu0Yz4F5365xYQh4vrLh93Hqz//GduFHiJYONEAYF4XdtwgIi/mtgB
	UQ8iRGHTMZp0JEeSucRo5EQm3JurPSA+dpKFdWmi85gpL7/wW2oYNmKv51G5+smTD+uLENSh872
	2FoWDbcjdXrOs/Y37+Wr9MlDmrD4=
X-Google-Smtp-Source: AGHT+IF30boKzBlR4uEvWw25mI+oVVkmJy2SvL+8F0wd4Or4yBfJHSM3NzmkPwTfref38kAS86adnWOkQ1b3X6G6exQ=
X-Received: by 2002:a81:4408:0:b0:631:43e1:6b99 with SMTP id
 00721157ae682-64c7258bc39mr66567327b3.12.1719845929933; Mon, 01 Jul 2024
 07:58:49 -0700 (PDT)
MIME-Version: 1.0
References: <1719816242-11839-1-git-send-email-wangmy@fujitsu.com> <1719816242-11839-9-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1719816242-11839-9-git-send-email-wangmy@fujitsu.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Mon, 1 Jul 2024 07:58:38 -0700
Message-ID: <CANx9H-C61wKK=hrBDk9xpS8xe8=yFDDGnNKVF4=MCutfKpjKgQ@mail.gmail.com>
Subject: Re: [oe] [meta-python] [PATCH 09/25] python3-alembic: upgrade 1.13.1
 -> 1.13.2
To: wangmy@fujitsu.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000b8e434061c30d5ad"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 Jul 2024 14:58:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111201

--000000000000b8e434061c30d5ad
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This project has a proper project.toml and should inherit
pythin_setuptools_build_meta instead of setuptools3 per
https://github.com/sqlalchemy/alembic/blob/c57a5b7b4d88296bbfc73c1dd770a912=
2bc1002e/pyproject.toml#L2


On Sun, Jun 30, 2024 at 11:44=E2=80=AFPM wangmy via lists.openembedded.org =
<wangmy=3D
fujitsu.com@lists.openembedded.org> wrote:

> From: Wang Mingyu <wangmy@fujitsu.com>
>
> Lisence-Update: Copyright year updated to 1.13.2
>
> Changelog:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> - Improve computed column compare function to support multi-line
> expressions.
> - Fixed bug in alembic command stdout where long messages were not proper=
ly
>   wrapping at the terminal width.
> - Fixed internal issue where Alembic would call connection.execute()
> sending
>   an empty tuple to indicate "no params". In SQLAlchemy 2.1 this case wil=
l
> be
>   deprecated as "empty sequence" is ambiguous as to its intent.
> - Fixes to support pytest 8.1 for the test suite.
> - Fixed the detection of serial column in autogenerate with tables not
> under
>   default schema on PostgreSQL
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  .../{python3-alembic_1.13.1.bb =3D> python3-alembic_1.13.2.bb}  | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-python/recipes-devtools/python/{python3-alembic_1.13.1.bb =
=3D>
> python3-alembic_1.13.2.bb} (64%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-alembic_1.13.1.b=
b
> b/meta-python/recipes-devtools/python/python3-alembic_1.13.2.bb
> similarity index 64%
> rename from meta-python/recipes-devtools/python/python3-alembic_1.13.1.bb
> rename to meta-python/recipes-devtools/python/python3-alembic_1.13.2.bb
> index c4853c443..6f8fb8c33 100644
> --- a/meta-python/recipes-devtools/python/python3-alembic_1.13.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-alembic_1.13.2.bb
> @@ -1,10 +1,10 @@
>  DESCRIPTION =3D "A database migration tool for SQLAlchemy"
>  LICENSE =3D "MIT"
> -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3De3023b042cb6002cb398344b51c67=
093"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D00f8f5c8aab58c3e1cd61525a6675=
174"
>
>  inherit pypi setuptools3
>
> -SRC_URI[sha256sum] =3D
> "4932c8558bf68f2ee92b9bbcb8218671c627064d5b08939437af6d77dc05e595"
> +SRC_URI[sha256sum] =3D
> "1ff0ae32975f4fd96028c39ed9bb3c867fe3af956bd7bb37343b54c9fe7445ef"
>
>  PYPI_PACKAGE =3D "alembic"
>
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#111177):
> https://lists.openembedded.org/g/openembedded-devel/message/111177
> Mute This Topic: https://lists.openembedded.org/mt/106973567/924729
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> ticotimo@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000b8e434061c30d5ad
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">This project has a proper project.toml and should inherit=
 pythin_setuptools_build_meta instead of setuptools3 per</div><div dir=3D"a=
uto"><div><a href=3D"https://github.com/sqlalchemy/alembic/blob/c57a5b7b4d8=
8296bbfc73c1dd770a9122bc1002e/pyproject.toml#L2">https://github.com/sqlalch=
emy/alembic/blob/c57a5b7b4d88296bbfc73c1dd770a9122bc1002e/pyproject.toml#L2=
</a></div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" cl=
ass=3D"gmail_attr">On Sun, Jun 30, 2024 at 11:44=E2=80=AFPM wangmy via <a h=
ref=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt;wangmy=
=3D<a href=3D"mailto:fujitsu.com@lists.openembedded.org">fujitsu.com@lists.=
openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:s=
olid;padding-left:1ex;border-left-color:rgb(204,204,204)">From: Wang Mingyu=
 &lt;<a href=3D"mailto:wangmy@fujitsu.com" target=3D"_blank">wangmy@fujitsu=
.com</a>&gt;<br>
<br>
Lisence-Update: Copyright year updated to 1.13.2<br>
<br>
Changelog:<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
- Improve computed column compare function to support multi-line expression=
s.<br>
- Fixed bug in alembic command stdout where long messages were not properly=
<br>
=C2=A0 wrapping at the terminal width.<br>
- Fixed internal issue where Alembic would call connection.execute() sendin=
g<br>
=C2=A0 an empty tuple to indicate &quot;no params&quot;. In SQLAlchemy 2.1 =
this case will be<br>
=C2=A0 deprecated as &quot;empty sequence&quot; is ambiguous as to its inte=
nt.<br>
- Fixes to support pytest 8.1 for the test suite.<br>
- Fixed the detection of serial column in autogenerate with tables not unde=
r<br>
=C2=A0 default schema on PostgreSQL<br>
<br>
Signed-off-by: Wang Mingyu &lt;<a href=3D"mailto:wangmy@fujitsu.com" target=
=3D"_blank">wangmy@fujitsu.com</a>&gt;<br>
---<br>
=C2=A0.../{<a href=3D"http://python3-alembic_1.13.1.bb" rel=3D"noreferrer" =
target=3D"_blank">python3-alembic_1.13.1.bb</a> =3D&gt; <a href=3D"http://p=
ython3-alembic_1.13.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-alem=
bic_1.13.2.bb</a>}=C2=A0 | 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
=C2=A0rename meta-python/recipes-devtools/python/{<a href=3D"http://python3=
-alembic_1.13.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-alembic_1.=
13.1.bb</a> =3D&gt; <a href=3D"http://python3-alembic_1.13.2.bb" rel=3D"nor=
eferrer" target=3D"_blank">python3-alembic_1.13.2.bb</a>} (64%)<br>
<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
alembic_1.13.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-alembic_1.1=
3.1.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
alembic_1.13.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-alembic_1.1=
3.2.bb</a><br>
similarity index 64%<br>
rename from meta-python/recipes-devtools/python/<a href=3D"http://python3-a=
lembic_1.13.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-alembic_1.13=
.1.bb</a><br>
rename to meta-python/recipes-devtools/python/<a href=3D"http://python3-ale=
mbic_1.13.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-alembic_1.13.2=
.bb</a><br>
index c4853c443..6f8fb8c33 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-alembic=
_1.13.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-alembic_1.13.1.bb<=
/a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-alembic=
_1.13.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-alembic_1.13.2.bb<=
/a><br>
@@ -1,10 +1,10 @@<br>
=C2=A0DESCRIPTION =3D &quot;A database migration tool for SQLAlchemy&quot;<=
br>
=C2=A0LICENSE =3D &quot;MIT&quot;<br>
-LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3De3023b042cb6002cb398344b51=
c67093&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D00f8f5c8aab58c3e1cd61525a6=
675174&quot;<br>
<br>
=C2=A0inherit pypi setuptools3<br>
<br>
-SRC_URI[sha256sum] =3D &quot;4932c8558bf68f2ee92b9bbcb8218671c627064d5b089=
39437af6d77dc05e595&quot;<br>
+SRC_URI[sha256sum] =3D &quot;1ff0ae32975f4fd96028c39ed9bb3c867fe3af956bd7b=
b37343b54c9fe7445ef&quot;<br>
<br>
=C2=A0PYPI_PACKAGE =3D &quot;alembic&quot;<br>
<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#111177): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/111177" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/111177</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/106973567/924=
729" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/106973567/924729</a><br>
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

--000000000000b8e434061c30d5ad--

