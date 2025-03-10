Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5C6EC28B2E
	for <webhook@archiver.kernel.org>; Mon, 10 Mar 2025 08:07:55 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web10.32634.1741594068988630448
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Mar 2025 01:07:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=cRVaFFXI;
 spf=pass (domain: mvista.com, ip: 209.85.208.42, mailfrom: vanusuri@mvista.com)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5e5e8274a74so3842519a12.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 10 Mar 2025 01:07:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1741594067; x=1742198867; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yot0697lQ68IS+Ab2on66NtEdXkGxyKthZeSd64Iac4=;
        b=cRVaFFXIQ++9g+t8eQp/syuElMhR85yPMmGHxOsvcbhZSwfSGmzd4IUE39Ct1eCWPU
         eIezkBHrc61SQ/mq9FWWn51MrU523+tK/ILXdPGQ5r1vGPfWXOtvpe1ach/ogxONeVRG
         Krf2SzYSv8zl2WNyrBIo0g39c1ff1Euq1YEB8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741594067; x=1742198867;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yot0697lQ68IS+Ab2on66NtEdXkGxyKthZeSd64Iac4=;
        b=slH+NGQtEpEDKltgvfX4sGMYqjMRTNvoBO3aLZ2ZJsBlK6mZy7OhR06eMnra3Bin8b
         sKIPoVLaZk6vh9y4HwBsAUc+ZAf41mDrLq/cHu8HRucvGEMumogukuu8Ad9+FOkJq25e
         jUjRpbYQ2HxN2+zPIVwqBCX2EskDZXqISyB0+dGNvvuQdAXDebd+AoyPH2Ap57bjS5jF
         45P8F15Z/2hsD/zaO742N/0rGKQKeFUIdntYlhCrpf+88mpjxkBGnsYH7i12ANsxyr29
         XeZKThjeYGMnH06ZbVCbekUQ5IYRc9ahJR02btP4znNJnb+wd6Exdtk1lb5AY6d8ZTlg
         yyVg==
X-Gm-Message-State: AOJu0YyTj3hwR+7WnIulIJMpGAweoQWUt9STqHOjtQwF2LNwQw48DTjB
	+EuFmzwIUCGyN7PJHd5h7jRRazzTCssbveKhkNwkBtqaCwi7Hi69d8yf/QiPSDWJ8sRyIEQGA29
	A5411HQdypXvYdn4YJ9HuB+RgFnu/WIKKVHKDLw==
X-Gm-Gg: ASbGncsGVvU7EzyUkdhFdXV1RvlO/Hvjjc2ly7p78YqxcsmYJ97S5i4jtU+2C6wBh8R
	XFJMu/CtK2RKpdllcswp4imoBEhRxP2pymSrb3nNS6TYqf2AeZv4xE2F24a/TY9rILX2s7DBIns
	e9PyVnJfICDmUDMmcRwzKt7MDD72g=
X-Google-Smtp-Source: AGHT+IETC1c/lLO7JGgtKwNTAJwpRH49srELyDN8p//NNMdGH550Dt+SUQ4yUU9wsL30sKXl3IvKy7T4nMS8WAbZnz4=
X-Received: by 2002:a05:6402:13d4:b0:5e5:b4c3:8e28 with SMTP id
 4fb4d7f45d1cf-5e5e24b87b2mr33342068a12.27.1741594066364; Mon, 10 Mar 2025
 01:07:46 -0700 (PDT)
MIME-Version: 1.0
References: <182B61F2D38D80E5.13955@lists.openembedded.org>
In-Reply-To: <182B61F2D38D80E5.13955@lists.openembedded.org>
From: Vijay Anusuri <vanusuri@mvista.com>
Date: Mon, 10 Mar 2025 13:37:34 +0530
X-Gm-Features: AQ5f1JqOMYOABHl65HJCf3RX0MUYasMiM7DD6HcZi9PHKJVd_wm37GRNBZIXl-E
Message-ID: <CANQUz1_=pE3B9NC=rm05FYtLUCGbJd64qkcSg_GUon8sgH6tsA@mail.gmail.com>
Subject: Re: [oe] [OE-core][scarthgap][PATCH] postgresql: upgrade 16.5 -> 16.8
To: vanusuri@mvista.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000ab4a84062ff877aa"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Mar 2025 08:07:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115821

--000000000000ab4a84062ff877aa
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Team,

I will v2 patch with the correct subject line.

Thanks & Regards,
Vijay


On Mon, Mar 10, 2025 at 1:26=E2=80=AFPM Vijay Anusuri via lists.openembedde=
d.org
<vanusuri=3Dmvista.com@lists.openembedded.org> wrote:

> From: Vijay Anusuri <vanusuri@mvista.com>
>
> License-Update: Update license year to 2025
>
> Includes fix for CVE-2025-1094
>
> Changelog:
> https://www.postgresql.org/docs/release/16.8/
>
> Refreshed 0003-configure.ac-bypass-autoconf-2.69-version-check.patch for
> 16.8
>
> Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> ---
>  ...0003-configure.ac-bypass-autoconf-2.69-version-check.patch | 2 +-
>  .../postgresql/{postgresql_16.5.bb =3D> postgresql_16.8.bb}     | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
>  rename meta-oe/recipes-dbs/postgresql/{postgresql_16.5.bb =3D>
> postgresql_16.8.bb} (75%)
>
> diff --git
> a/meta-oe/recipes-dbs/postgresql/files/0003-configure.ac-bypass-autoconf-=
2.69-version-check.patch
> b/meta-oe/recipes-dbs/postgresql/files/0003-configure.ac-bypass-autoconf-=
2.69-version-check.patch
> index 0388bc1b40..9584cfcb16 100644
> ---
> a/meta-oe/recipes-dbs/postgresql/files/0003-configure.ac-bypass-autoconf-=
2.69-version-check.patch
> +++
> b/meta-oe/recipes-dbs/postgresql/files/0003-configure.ac-bypass-autoconf-=
2.69-version-check.patch
> @@ -18,7 +18,7 @@ index df61ab4..b795f8c 100644
>  +++ b/configure.ac
>  @@ -19,10 +19,6 @@ m4_pattern_forbid(^PGAC_)dnl to catch undefined macro=
s
>
> - AC_INIT([PostgreSQL], [16.5], [pgsql-bugs@lists.postgresql.org], [], [
> https://www.postgresql.org/])
> + AC_INIT([PostgreSQL], [16.8], [pgsql-bugs@lists.postgresql.org], [], [
> https://www.postgresql.org/])
>
>  -m4_if(m4_defn([m4_PACKAGE_VERSION]), [2.69], [], [m4_fatal([Autoconf
> version 2.69 is required.
>  -Untested combinations of 'autoconf' and PostgreSQL versions are not
> diff --git a/meta-oe/recipes-dbs/postgresql/postgresql_16.5.bb
> b/meta-oe/recipes-dbs/postgresql/postgresql_16.8.bb
> similarity index 75%
> rename from meta-oe/recipes-dbs/postgresql/postgresql_16.5.bb
> rename to meta-oe/recipes-dbs/postgresql/postgresql_16.8.bb
> index 76498375b7..918ad13e63 100644
> --- a/meta-oe/recipes-dbs/postgresql/postgresql_16.5.bb
> +++ b/meta-oe/recipes-dbs/postgresql/postgresql_16.8.bb
> @@ -1,6 +1,6 @@
>  require postgresql.inc
>
> -LIC_FILES_CHKSUM =3D "file://COPYRIGHT;md5=3D89afbb2d7716371015101c2b2cb=
4297a"
> +LIC_FILES_CHKSUM =3D "file://COPYRIGHT;md5=3Dd5dd73e90ee1a572679460ee672=
33fcc"
>
>  SRC_URI +=3D "\
>     file://not-check-libperl.patch \
> @@ -11,6 +11,6 @@ SRC_URI +=3D "\
>     file://0005-postgresql-fix-ptest-failure-of-sysviews.patch \
>  "
>
> -SRC_URI[sha256sum] =3D
> "a6cbbb7037f98cb8afa7d3970b7c48040cf02b115e39253a0c037a8bb8e778f0"
> +SRC_URI[sha256sum] =3D
> "9468083a56ce0ee7d294601b74dad3dd9fc69d87aff61f0a9fb63c813ff7efd8"
>
>  CVE_STATUS[CVE-2017-8806] =3D "not-applicable-config: Ddoesn't apply to =
out
> configuration of postgresql so we can safely ignore it."
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#115820):
> https://lists.openembedded.org/g/openembedded-devel/message/115820
> Mute This Topic: https://lists.openembedded.org/mt/111614998/7301997
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> vanusuri@mvista.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000ab4a84062ff877aa
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div>Hi Team,<br><br></div>I will v2 patch with the c=
orrect subject line.<br><br></div><div>Thanks &amp; Regards,</div><div>Vija=
y</div><div><br></div></div><br><div class=3D"gmail_quote gmail_quote_conta=
iner"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Mar 10, 2025 at 1:26=E2=
=80=AFPM Vijay Anusuri via <a href=3D"http://lists.openembedded.org">lists.=
openembedded.org</a> &lt;vanusuri=3D<a href=3D"mailto:mvista.com@lists.open=
embedded.org">mvista.com@lists.openembedded.org</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">From: Vijay Anusuri &lt;<a h=
ref=3D"mailto:vanusuri@mvista.com" target=3D"_blank">vanusuri@mvista.com</a=
>&gt;<br>
<br>
License-Update: Update license year to 2025<br>
<br>
Includes fix for CVE-2025-1094<br>
<br>
Changelog:<br>
<a href=3D"https://www.postgresql.org/docs/release/16.8/" rel=3D"noreferrer=
" target=3D"_blank">https://www.postgresql.org/docs/release/16.8/</a><br>
<br>
Refreshed 0003-configure.ac-bypass-autoconf-2.69-version-check.patch for<br=
>
16.8<br>
<br>
Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.com" tar=
get=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
---<br>
=C2=A0...0003-configure.ac-bypass-autoconf-2.69-version-check.patch | 2 +-<=
br>
=C2=A0.../postgresql/{<a href=3D"http://postgresql_16.5.bb" rel=3D"noreferr=
er" target=3D"_blank">postgresql_16.5.bb</a> =3D&gt; <a href=3D"http://post=
gresql_16.8.bb" rel=3D"noreferrer" target=3D"_blank">postgresql_16.8.bb</a>=
}=C2=A0 =C2=A0 =C2=A0| 4 ++--<br>
=C2=A02 files changed, 3 insertions(+), 3 deletions(-)<br>
=C2=A0rename meta-oe/recipes-dbs/postgresql/{<a href=3D"http://postgresql_1=
6.5.bb" rel=3D"noreferrer" target=3D"_blank">postgresql_16.5.bb</a> =3D&gt;=
 <a href=3D"http://postgresql_16.8.bb" rel=3D"noreferrer" target=3D"_blank"=
>postgresql_16.8.bb</a>} (75%)<br>
<br>
diff --git a/meta-oe/recipes-dbs/postgresql/files/0003-configure.ac-bypass-=
autoconf-2.69-version-check.patch b/meta-oe/recipes-dbs/postgresql/files/00=
03-configure.ac-bypass-autoconf-2.69-version-check.patch<br>
index 0388bc1b40..9584cfcb16 100644<br>
--- a/meta-oe/recipes-dbs/postgresql/files/0003-configure.ac-bypass-autocon=
f-2.69-version-check.patch<br>
+++ b/meta-oe/recipes-dbs/postgresql/files/0003-configure.ac-bypass-autocon=
f-2.69-version-check.patch<br>
@@ -18,7 +18,7 @@ index df61ab4..b795f8c 100644<br>
=C2=A0+++ b/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_b=
lank">configure.ac</a><br>
=C2=A0@@ -19,10 +19,6 @@ m4_pattern_forbid(^PGAC_)dnl to catch undefined ma=
cros<br>
<br>
- AC_INIT([PostgreSQL], [16.5], [<a href=3D"mailto:pgsql-bugs@lists.postgre=
sql.org" target=3D"_blank">pgsql-bugs@lists.postgresql.org</a>], [], [<a hr=
ef=3D"https://www.postgresql.org/" rel=3D"noreferrer" target=3D"_blank">htt=
ps://www.postgresql.org/</a>])<br>
+ AC_INIT([PostgreSQL], [16.8], [<a href=3D"mailto:pgsql-bugs@lists.postgre=
sql.org" target=3D"_blank">pgsql-bugs@lists.postgresql.org</a>], [], [<a hr=
ef=3D"https://www.postgresql.org/" rel=3D"noreferrer" target=3D"_blank">htt=
ps://www.postgresql.org/</a>])<br>
<br>
=C2=A0-m4_if(m4_defn([m4_PACKAGE_VERSION]), [2.69], [], [m4_fatal([Autoconf=
 version 2.69 is required.<br>
=C2=A0-Untested combinations of &#39;autoconf&#39; and PostgreSQL versions =
are not<br>
diff --git a/meta-oe/recipes-dbs/postgresql/<a href=3D"http://postgresql_16=
.5.bb" rel=3D"noreferrer" target=3D"_blank">postgresql_16.5.bb</a> b/meta-o=
e/recipes-dbs/postgresql/<a href=3D"http://postgresql_16.8.bb" rel=3D"noref=
errer" target=3D"_blank">postgresql_16.8.bb</a><br>
similarity index 75%<br>
rename from meta-oe/recipes-dbs/postgresql/<a href=3D"http://postgresql_16.=
5.bb" rel=3D"noreferrer" target=3D"_blank">postgresql_16.5.bb</a><br>
rename to meta-oe/recipes-dbs/postgresql/<a href=3D"http://postgresql_16.8.=
bb" rel=3D"noreferrer" target=3D"_blank">postgresql_16.8.bb</a><br>
index 76498375b7..918ad13e63 100644<br>
--- a/meta-oe/recipes-dbs/postgresql/<a href=3D"http://postgresql_16.5.bb" =
rel=3D"noreferrer" target=3D"_blank">postgresql_16.5.bb</a><br>
+++ b/meta-oe/recipes-dbs/postgresql/<a href=3D"http://postgresql_16.8.bb" =
rel=3D"noreferrer" target=3D"_blank">postgresql_16.8.bb</a><br>
@@ -1,6 +1,6 @@<br>
=C2=A0require postgresql.inc<br>
<br>
-LIC_FILES_CHKSUM =3D &quot;file://COPYRIGHT;md5=3D89afbb2d7716371015101c2b=
2cb4297a&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://COPYRIGHT;md5=3Dd5dd73e90ee1a572679460ee=
67233fcc&quot;<br>
<br>
=C2=A0SRC_URI +=3D &quot;\<br>
=C2=A0 =C2=A0 file://not-check-libperl.patch \<br>
@@ -11,6 +11,6 @@ SRC_URI +=3D &quot;\<br>
=C2=A0 =C2=A0 file://0005-postgresql-fix-ptest-failure-of-sysviews.patch \<=
br>
=C2=A0&quot;<br>
<br>
-SRC_URI[sha256sum] =3D &quot;a6cbbb7037f98cb8afa7d3970b7c48040cf02b115e392=
53a0c037a8bb8e778f0&quot;<br>
+SRC_URI[sha256sum] =3D &quot;9468083a56ce0ee7d294601b74dad3dd9fc69d87aff61=
f0a9fb63c813ff7efd8&quot;<br>
<br>
=C2=A0CVE_STATUS[CVE-2017-8806] =3D &quot;not-applicable-config: Ddoesn&#39=
;t apply to out configuration of postgresql so we can safely ignore it.&quo=
t;<br>
-- <br>
2.25.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#115820): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/115820" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/115820</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/111614998/730=
1997" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/111614998/7301997</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:vanusuri@mvista.com" tar=
get=3D"_blank">vanusuri@mvista.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000ab4a84062ff877aa--

