Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14265.1793374272315804761
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 30 Oct 2026 08:31:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=snG7qtrE;
 spf=pass (domain: gmail.com, ip: 209.85.128.169, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-8b09e07e149so7259197b3.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 30 Oct 2026 08:31:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793374271; cv=none;
        d=google.com; s=arc-20260327;
        b=p4Vt5opGOTqyVsQ9YzG/FfRij693ktbYhUFE63NXuVTwc5fxdAHdVU8bSvKzmV00UB
         KEkdxO/2AZC3L5SdyZk8nEhAkH9eXNzju+RtgzIjJ1dWI1+bcbgvuUB4Gzne1JAwzVUI
         IcDQAUQPRJk2+FjaQsW7yWfG5kaTmKPdwjjB9zyb8KJ38T9Lab6789xlxFPjIOXw4hmw
         9ipujMb4JYd8rBTeZrZKCqzjq/VmTx4xGCD6ETHKA8wo9Sj1MVFIIri/LKb1kL3RkYoT
         ++IQwWKV3FOMjxjAtPhMdMSBvVJ7kicbq+i+3l+KKdqkuDO376ObZZLMOwm6UcIZDvAv
         piwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=HE11MoTA9Chw4+ACSnuGYJnPPrd6py5k41LKV+zQBOc=;
        fh=2nN/GzVxUjERD0LNgf9vNaPM58ZIkCHYlMJQEwcNq0M=;
        b=Bz6+kfZIF5DznwKsdVmyykF+JCtE4HZjsyPNJfHX4tbhBkaMVp3ComzsqbJMjH6fso
         kTaHsE23uLvhvr71ipp3lNzjkVnMZE2Imbcy7nHt9Zxk550Jdzce2f5ZI7ZZvRBPHugr
         F7PZZT6yzbR7LzeC4Lj+KqBrLb5QRygIve5xOmQyQ4d6TyIN/rlLsaWojMvxD6XzRaXc
         4k9PDhSxz1CPHmRBwNh/97VVVW74iW/Sar7s76hJd8dHOOTxWx1Qd17l/+xF0pggux6h
         Ke+vWTzV5XOqEv5xiDn60HNth/7Cgtin59FIXIHLHEmDEID+K6mUDlDrdtyPe3VgBYLE
         WRSQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793374271; x=1793979071; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HE11MoTA9Chw4+ACSnuGYJnPPrd6py5k41LKV+zQBOc=;
        b=snG7qtrEQ6U9XhuZsM111tiK7s22HLpna0lRYU8EaAteqq1b0dszd2eEvbZakIRRwS
         TKkOh0EIgsgpEgaRsIDJDY7pamtCNEvfp1BFh3bjmUeEJQwaQUO22Xl0AW7dmi69cFar
         29A+Sa5ReVcdL9uLbOsDjZls50Bj0rkZK+jBMCFMqSqM3lYBNfsAelVzWmO3VWRY4q3C
         w/UdMS5QLrODxtTZ5JCHogo/5wBr8NJW0YTo2o6RVOQyUova5ZylnqsT2c0fHYaa9Llw
         GnKntJlg3o57usBV/61mXV8/l5ij3ANsb9usaPEU79lH1tiVPS01bZ03cSj6tfYwVagF
         Oh2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793374271; x=1793979071;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=HE11MoTA9Chw4+ACSnuGYJnPPrd6py5k41LKV+zQBOc=;
        b=S3moF1jHULebwdrf4GYmHPeDcsBR2L4lPS/MECvXesshNtPEtu/kj2Hy7lTXbz9wPu
         7AEAPmaBgZpqFvu6MZ5qHLVl1Y1ghocnzXoGQIRFku5+qipjo14T/bykxNsa2k2X6qwe
         zhL/U0c2lTJf4GNt1y5g1oEc94WVlYsOIQyFg1z5RMFzcaqQGoGbupeOigg1AdMIQyNP
         rGKwBf5ZsvtWG6MuWip977FMU48OJYvTBxg0XlEcayoQgML7buj4y+B15UTQ7T8t8q28
         cKtXcCXv1HwLuU6JAY1bWgr/oNBCOwf2NLaAmN1BrmHNEuSebCZjJ/FAX1RFFxN4DlvT
         BE5Q==
X-Gm-Message-State: AFq9FYIy/dR7IafWnYvbEmFMPFihQfCMy+FCrWX7Z/Ah5KnQgQG2M6Is
	txHfGpwv/KxjHdZTy3PTNaXInT/cod9Wy2U9ZjqTs41vjiGAU4E6kP62Z79CGz8b1EPK5yxmud2
	4A4D2OQIZeh/Q4/OOspxjRCnhAKhhoyw=
X-Gm-Gg: AYBFou2rCAqfxiO1NUrcjs45u65T3KCWCUpr1ZB1zcWHjhmywMvdvaWXL9wqlVGQQRE
	r2AVZ+q9uDQxibTKm6wu+KJqbJy9HexR+pOg+k0Vfmu8Ra/PkpYsk2gutlQfcZ0othCYEbO3naM
	76SsEUTBle7I16rjdxObSQU14UMsrlBCrWIbXY7r8hV64kbOrCY0D0YBMkpiOE+X1VoDa6EJYDk
	r7722i4mBMoVhimDBCtBvqZIDlFFe7bxHbcT7kPEUCoIQcCipxpTSX7FJdLYx14sabBREO7D4Or
	1AWoySZ6r67PPvJjDE8XUFpkJdFNS3HP+Z7Oec7r1eQTAAZ26SXq+QV4pUFlJPqIyQRlsKOsUD3
	g+qSki0TZkK7wRsTd3b2QfuNpjr32nS7Lopwml8QzS5NXPG5qcXxkcUODjvD93eJH66Ihp2NJAM
	8pf/v+EzgEXe+0TtDMBr3cmX3fF6SpsR7tczWNmzkiWSQWTaB+I0nGndxqaWlfrK1sFUra3DDkT
	hGmUkgx56D2tjCVZ/jBX1aU9wq4kMKew5NIP38tIElxOlGqDE5BH5d0ddh3i9T9RinIdhfCoE1M
	MpISNgjcPf1fxkmEnSFZ0N3O4z0UzZyAT0Wnn8sl4PTY9YVf/N9QM/LQFJQji5rIk2pJdCHDIZa
	56pztwQ4xq9ScduLDNTOH7w==
X-Received: by 2002:a05:690c:6e84:b0:8b0:dca9:8fc8 with SMTP id
 00721157ae682-8b2b67a3528mr14166817b3.92.1793374269944; Fri, 30 Oct 2026
 08:31:09 -0700 (PDT)
MIME-Version: 1.0
References: <20261030110309.1124614-1-leon.anavi@konsulko.com> <20261030110309.1124614-18-leon.anavi@konsulko.com>
In-Reply-To: <20261030110309.1124614-18-leon.anavi@konsulko.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 30 Oct 2026 08:30:42 -0700
X-Gm-Features: AclHuK838S9zp1vSjh0wTkhj56a8Yrwr0hNhoTDYM8uFEm9w9yxPk3Oa1b5JIRU
Message-ID: <CAMKF1spOVYFJMeqC=cFGZ23roDiHadVza9tEyeZSqK8j11fv2w@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH 18/25] python3-asciitree: Upgrade 0.3.3
 -> 1.0.0
To: leon.anavi@konsulko.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000004f3a3c065f107c6b"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 30 Oct 2026 15:31:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131709

--0000000000004f3a3c065f107c6b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

why did LIC_FILES_CHKSUM change ?
btw. you might want to let git find renames a bit harder adding M30% -C
--find-copies-harder options to
git format-patch might help.

On Fri, Oct 30, 2026 at 4:03=E2=80=AFAM Leon Anavi via openembedded-devel
<leon.anavi=3Dkonsulko.com@lists.openembedded.org> wrote:

> Upgrade to release 1.0.0:
>
> - Configurable layout spaces through BoxStyle.gfx["SPACE"], with an
>   ordinary-space fallback for existing palettes.
> - Declared the existing public API stable, without breaking changes
>   from 0.4.0.
>
> Fixes:
>
> WARNING: python3-asciitree-1.0.0-r0 do_check_backend: QA Issue:
> inherits setuptools3 but has pyproject.toml specifying backend
> setuptools.build_meta, use the correct class [pep517-backend]
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
> ---
>  .../recipes-devtools/python/python3-asciitree_0.3.3.bb   | 8 --------
>  .../recipes-devtools/python/python3-asciitree_1.0.0.bb   | 9 +++++++++
>  2 files changed, 9 insertions(+), 8 deletions(-)
>  delete mode 100644 meta-python/recipes-devtools/python/
> python3-asciitree_0.3.3.bb
>  create mode 100644 meta-python/recipes-devtools/python/
> python3-asciitree_1.0.0.bb
>
> diff --git a/meta-python/recipes-devtools/python/
> python3-asciitree_0.3.3.bb b/meta-python/recipes-devtools/python/
> python3-asciitree_0.3.3.bb
> deleted file mode 100644
> index a3185a9c66..0000000000
> --- a/meta-python/recipes-devtools/python/python3-asciitree_0.3.3.bb
> +++ /dev/null
> @@ -1,8 +0,0 @@
> -SUMMARY =3D "Draws ASCII trees."
> -HOMEPAGE =3D "https://github.com/mbr/asciitree"
> -LICENSE =3D "MIT"
> -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Da985ccb0df374f2a8cab75010bf8d=
b73"
> -
> -SRC_URI[sha256sum] =3D
> "4aa4b9b649f85e3fcb343363d97564aa1fb62e249677f2e18a96765145cc0f6e"
> -
> -inherit pypi setuptools3
> diff --git a/meta-python/recipes-devtools/python/
> python3-asciitree_1.0.0.bb b/meta-python/recipes-devtools/python/
> python3-asciitree_1.0.0.bb
> new file mode 100644
> index 0000000000..086fc07392
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-asciitree_1.0.0.bb
> @@ -0,0 +1,9 @@
> +SUMMARY =3D "ASCII trees"
> +DESCRIPTION =3D "Draws ASCII trees"
> +HOMEPAGE =3D "https://github.com/mbr/asciitree"
> +LICENSE =3D "MIT"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Da533ab417405f77f9a3d236d35cd7=
069"
> +
> +SRC_URI[sha256sum] =3D
> "0c396808c13cab27b60cbe402b99ef37fa681c6b59d337a008719efa201cdd07"
> +
> +inherit pypi python_setuptools_build_meta
> --
> 2.47.3
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#131700):
> https://lists.openembedded.org/g/openembedded-devel/message/131700
> Mute This Topic: https://lists.openembedded.org/mt/122008956/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000004f3a3c065f107c6b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">why did LIC_FILES_CHKSUM change ?<div>btw. you might want =
to let git find renames a bit harder adding=C2=A0M30% -C --find-copies-hard=
er options to</div><div>git format-patch might help.</div></div><br><div cl=
ass=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_a=
ttr">On Fri, Oct 30, 2026 at 4:03=E2=80=AFAM Leon Anavi via openembedded-de=
vel &lt;leon.anavi=3D<a href=3D"mailto:konsulko.com@lists.openembedded.org"=
>konsulko.com@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">Upgrade to release 1.0.0:<br>
<br>
- Configurable layout spaces through BoxStyle.gfx[&quot;SPACE&quot;], with =
an<br>
=C2=A0 ordinary-space fallback for existing palettes.<br>
- Declared the existing public API stable, without breaking changes<br>
=C2=A0 from 0.4.0.<br>
<br>
Fixes:<br>
<br>
WARNING: python3-asciitree-1.0.0-r0 do_check_backend: QA Issue:<br>
inherits setuptools3 but has pyproject.toml specifying backend<br>
setuptools.build_meta, use the correct class [pep517-backend]<br>
<br>
Signed-off-by: Leon Anavi &lt;<a href=3D"mailto:leon.anavi@konsulko.com" ta=
rget=3D"_blank">leon.anavi@konsulko.com</a>&gt;<br>
---<br>
=C2=A0.../recipes-devtools/python/<a href=3D"http://python3-asciitree_0.3.3=
.bb" rel=3D"noreferrer" target=3D"_blank">python3-asciitree_0.3.3.bb</a>=C2=
=A0 =C2=A0| 8 --------<br>
=C2=A0.../recipes-devtools/python/<a href=3D"http://python3-asciitree_1.0.0=
.bb" rel=3D"noreferrer" target=3D"_blank">python3-asciitree_1.0.0.bb</a>=C2=
=A0 =C2=A0| 9 +++++++++<br>
=C2=A02 files changed, 9 insertions(+), 8 deletions(-)<br>
=C2=A0delete mode 100644 meta-python/recipes-devtools/python/<a href=3D"htt=
p://python3-asciitree_0.3.3.bb" rel=3D"noreferrer" target=3D"_blank">python=
3-asciitree_0.3.3.bb</a><br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/<a href=3D"htt=
p://python3-asciitree_1.0.0.bb" rel=3D"noreferrer" target=3D"_blank">python=
3-asciitree_1.0.0.bb</a><br>
<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
asciitree_0.3.3.bb" rel=3D"noreferrer" target=3D"_blank">python3-asciitree_=
0.3.3.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://python=
3-asciitree_0.3.3.bb" rel=3D"noreferrer" target=3D"_blank">python3-asciitre=
e_0.3.3.bb</a><br>
deleted file mode 100644<br>
index a3185a9c66..0000000000<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-asciitr=
ee_0.3.3.bb" rel=3D"noreferrer" target=3D"_blank">python3-asciitree_0.3.3.b=
b</a><br>
+++ /dev/null<br>
@@ -1,8 +0,0 @@<br>
-SUMMARY =3D &quot;Draws ASCII trees.&quot;<br>
-HOMEPAGE =3D &quot;<a href=3D"https://github.com/mbr/asciitree" rel=3D"nor=
eferrer" target=3D"_blank">https://github.com/mbr/asciitree</a>&quot;<br>
-LICENSE =3D &quot;MIT&quot;<br>
-LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3Da985ccb0df374f2a8cab75010b=
f8db73&quot;<br>
-<br>
-SRC_URI[sha256sum] =3D &quot;4aa4b9b649f85e3fcb343363d97564aa1fb62e249677f=
2e18a96765145cc0f6e&quot;<br>
-<br>
-inherit pypi setuptools3<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
asciitree_1.0.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-asciitree_=
1.0.0.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://python=
3-asciitree_1.0.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-asciitre=
e_1.0.0.bb</a><br>
new file mode 100644<br>
index 0000000000..086fc07392<br>
--- /dev/null<br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-asciitr=
ee_1.0.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-asciitree_1.0.0.b=
b</a><br>
@@ -0,0 +1,9 @@<br>
+SUMMARY =3D &quot;ASCII trees&quot;<br>
+DESCRIPTION =3D &quot;Draws ASCII trees&quot;<br>
+HOMEPAGE =3D &quot;<a href=3D"https://github.com/mbr/asciitree" rel=3D"nor=
eferrer" target=3D"_blank">https://github.com/mbr/asciitree</a>&quot;<br>
+LICENSE =3D &quot;MIT&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3Da533ab417405f77f9a3d236d35=
cd7069&quot;<br>
+<br>
+SRC_URI[sha256sum] =3D &quot;0c396808c13cab27b60cbe402b99ef37fa681c6b59d33=
7a008719efa201cdd07&quot;<br>
+<br>
+inherit pypi python_setuptools_build_meta<br>
-- <br>
2.47.3<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#131700): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/131700" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/131700</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/122008956/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/122008956/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--0000000000004f3a3c065f107c6b--
