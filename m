Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F082BC44520
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 16:10:31 +0000 (UTC)
Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1127.1784563823392966863
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Jul 2026 09:10:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=YsNYkay8;
 spf=pass (domain: gmail.com, ip: 74.125.224.47, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-667f1390f58so7484798d50.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 20 Jul 2026 09:10:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784563822; cv=none;
        d=google.com; s=arc-20260327;
        b=TqwnK6lA+sKH4DsTyGxXHU4tpi/COxhO2L+b/6QOK+1skpwk6AN+DpkAdXWNjurwsf
         R614ClvsAsoSBvqoEplIxkEyKXbAMBdQPeM3jQdCE0qnnD/urGq7K5q344SXXWE1ED+M
         P4HrDQyh7lq/WPLSMi5obW/b86PEnEpB7vZCHYVyw0O6VbcUjZiQYoV69FXXXR1Vyryr
         l0fdowsuwnrcQvBO/LMlXzf8Euh/QddyVa6dqwlFUsn3qCIIfakTckwhbVESmv1qOMEz
         xUXg4jtUrUe9xb08hZhbtz19BtYCpSJf6ob/cAoA0k98Mckp8IIF+1CZ4PoahgRe5wru
         /BVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=tyvupXrZKuo1QgVyMLF8amrwjcjW6QUngm1VL91cAq0=;
        fh=TlRTNirvdGFngn9XZXZ2e7y2XhIk2EE7NaI4LL7rUEo=;
        b=pxyfIWNYkwOB5qZjnj2q9ofX5SHjKdx+Ftd/D0oO1nu+Wi1MdWoQGub1Iq6LbQbZf9
         jef2xqEighAEv2QjWFlTQpmW2GzkNh8ZPZyFlHdC9MNi8BEdDSr7U4JqaVhvAEgrbYmq
         CBN5gbRNn1b//UDQlwY48jPK0WYlYsrFjdIZLWEnRnshEaVJ6wsvP1M5cLsUWgQENPDD
         bVcvqHE/0vzfug+tK6m0NB9rVX7hIIyYRc/gqRy8H8sUsNOFRqwrLTRWV0CNjIXcJN62
         VSPqgGlG97UkquVAUbWD0Vxuv5rFKXHMRlnhMjZgflYn2K6EMSTanc++QDKMVO38cRez
         WYbw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784563822; x=1785168622; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tyvupXrZKuo1QgVyMLF8amrwjcjW6QUngm1VL91cAq0=;
        b=YsNYkay80vSxS+vVy9UY7+C3kDVRXJtpy8wmq9DY9pNpmZlMG21wZ9P1gRUYMQ9lc5
         gnfM9u5nX0kGExgGRTyCnapLoO59bRE4zpzo8Pbeky2yirbZPCHiK2VyYD5fJshvPSZu
         TDeJj7c4f1DX/ycTh2AiSPV2mUZOrWmCe129/BgSSIbS9OrGMYb8PyM9vkVrTHlIh+rU
         3bdTRMOLl3D+pwZemjSQCI7ZDysW+VLe1IG3NMg2ivrjOFO7hR/SwD7RDyd/iYduiE+W
         d6OoC5qYt+nwn+8pQkV7MN2sMktSsPvibYGon8GoMWlSsPpbu/HuMIzw5TyEVKC/oD24
         c3mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784563822; x=1785168622;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=tyvupXrZKuo1QgVyMLF8amrwjcjW6QUngm1VL91cAq0=;
        b=CEH96xHaHs87+SgsZmkxmatZnpDZ+V6VbB6zbDME6MVM+FSR7cmP78Q+bfUPU4E4ia
         7W9qUlOpdG4FgTRLCdZgeFtwuwaWDTka9yXVjFF2/UnUzWIyixQhyxulbtJsp/bIwgKN
         ShRr0JTdI6ZyFyGBeVV3/HCtyaAYtbdNOqSGmA5Ibfg3WO/vyYtOBnkIbF/vjgI/rA+c
         TjQAikyZvEUxI07/aNf3wVd76uQ2/cGHznz3L3rxlOHLM4nct3ijGzOF0wV2zxYwRjAN
         SZIfyYnkKAcB4o0QpeN0yxlJWFnwstyUOrNQLiIa5qrf/rH5FR0sEC1cgdthTNz623eV
         RetQ==
X-Gm-Message-State: AOJu0YzGAMB/09LaJhp1F1+aWdTaIhJtuJeOhKOAF+iPyXqzKrtCTQgz
	oc7TBqBCZwsA3BuQ17pQM+A6xyAU6kiAuojW9H4vW+oPU0BEZMbiWLVA1pGryF3AUA5jDUwf0Z5
	qaQ206ocMYHhMZiKEcQjkXcK4aXSgCvU=
X-Gm-Gg: AR+sD134RPdk59KY7VevUgExwiTwIBC1wpFhERcAWyxsOf5ZwZS8J1Ydu2ZnXmO/fQB
	NDB3TvpFimssPC/cwCaEcZGIKUwx1u/ut79Ms7AT5pBAaUiem3aHjjuyMh3bLQD1ivpFLgyrTYw
	aQMH31ExSH2u1TBjvd6UvFjbwwY+hLaHQ9f6XIeQZmUT265wMkV74VOeVLBw+yH7+juiT+PljG/
	1z9aB4ZWP4Eyr8Pl4b0gUzrDTNTVDtmkcBa9xkg27drHJ865Kj9lWKycHiG5I+YZaLA9Z1pV84D
	NYnfd1Zf/3Fkt6IdeM2dE1HLiSWF5q6deic/ejdBaI3ZpbjTQ+JG7hOGyIXSAh4boOS+BjSPbhf
	tJEttCimeEtTxaLcDXSTkCrT/H+lbVT3anAAkhvIjdnr2iIllyN/XRwK4pW6pGnBYAd2kLQ==
X-Received: by 2002:a05:690c:4c0b:b0:81c:f1f1:134 with SMTP id
 00721157ae682-81ef27eba7fmr49474677b3.39.1784563822328; Mon, 20 Jul 2026
 09:10:22 -0700 (PDT)
MIME-Version: 1.0
References: <20260720160226.6848-1-nguyenthaithuanalg@gmail.com>
In-Reply-To: <20260720160226.6848-1-nguyenthaithuanalg@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 20 Jul 2026 09:10:10 -0700
X-Gm-Features: AUfX_mzOkl_SxXjT-IOSYe0yEfD3Ew-tOzt8h0xcCTLuucvVFmvJ5uTKQgXoqxU
Message-ID: <CAMKF1spHwV9MZmibpVg=qt2V2QLw-MJUCp4uT+fjioj1yJcoNg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] libsimplelog: upgrade 1.0.8 -> 1.1.0
To: =?UTF-8?B?VGh14bqtbiBOZ3V54buFbi1UaMOhaQ==?= <nguyenthaithuanalg@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000b582bf06570d2401"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Jul 2026 16:10:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128281

--000000000000b582bf06570d2401
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Second patch in this series needs similar fix. Please rework that as well
and send v2

On Mon, Jul 20, 2026, 9:06=E2=80=AFAM Thu=E1=BA=ADn Nguy=E1=BB=85n-Th=C3=A1=
i via lists.openembedded.org
<nguyenthaithuanalg=3Dgmail.com@lists.openembedded.org> wrote:

> Add note to answer from meta-openembedded maintainer: Khem Raj
>
> And explain -D__LINUX__=3D1, -D_GNU_SOURCE=3D1 and musl (strictly POSIX)
>
> Signed-off-by: Thu=E1=BA=ADn Nguy=E1=BB=85n-Th=C3=A1i <nguyenthaithuanalg=
@gmail.com>
> ---
>  .../libsimplelog/libsimplelog_1.1.0.bb           | 16 +++++++++++++---
>  1 file changed, 13 insertions(+), 3 deletions(-)
>
> diff --git a/meta-oe/recipes-support/libsimplelog/libsimplelog_1.1.0.bb
> b/meta-oe/recipes-support/libsimplelog/libsimplelog_1.1.0.bb
> index 53c13d726b..7a385d537b 100644
> --- a/meta-oe/recipes-support/libsimplelog/libsimplelog_1.1.0.bb
> +++ b/meta-oe/recipes-support/libsimplelog/libsimplelog_1.1.0.bb
> @@ -3,17 +3,27 @@ SUMMARY =3D "simplelog-topc - Simple, STABLE, powerful =
of
> logging library in ANSI
>  DESCRIPTION =3D "Async and Fast C/C++ multi-thread logger with topics. N=
o
> external dependencies."
>  HOMEPAGE =3D "https://github.com/thuanalg/simplelog-topic"
>  LICENSE =3D "MIT"
> +#The checksum of "LIC_FILES_CHKSUM" changed b/c I did change from "2024"
> to "2024-2026"
> +#libsimplelog  is allways full "MIT license".
>  LIC_FILES_CHKSUM =3D
> "file://LICENSE.txt;md5=3D594fdc3cb85f0b684cf5d7b332a741be"
>
>  SRC_URI =3D "git://
> github.com/thuanalg/simplelog-topic.git;branch=3Dmain;protocol=3Dhttps;ta=
g=3Dv${PV}
> <http://github.com/thuanalg/simplelog-topic.git;branch=3Dmain;protocol=3D=
https;tag=3Dv$%7BPV%7D>
> "
>
>  SRCREV =3D "151e83902ca9755bcd285791d2f49de6fc30bfe6"
>
> -S =3D "${WORKDIR}/git"
> -
>  inherit cmake
>
> -# Specify any options you want to pass to cmake using EXTRA_OECMAKE:
>  EXTRA_OECMAKE +=3D "-DUNIX_LINUX=3D1 -D__LINUX__=3D1 -D_GNU_SOURCE=3D1"
>
> +# From v.1.0.8 -> v1.1.0
> +# Note for -D__LINUX__=3D1 -D_GNU_SOURCE=3D1
> +# If don't use these flags, v.1.1.0 works like v1.0.8, and well adapt
> with musl (strictly POSIX)
> +# If use 2 flags, they helps the source is more effective. Please test
> for 2 cases, you will see.
> +# Please check "p->r =3D sched_getcpu();" in "simplelog.c"
> +# You can use as below without any problem
> +# EXTRA_OECMAKE +=3D "-DUNIX_LINUX=3D1"
> +
> +# Drop 0001-allow-build-with-cmake-4.patch as it is now integrated
> upstream.
> +# Please see branch "main", commit
> "4827c4325063266f6d2a7e133a9d3a9050ff6a3c" by
> +# Author: Alper Ak <alperyasinak1@gmail.com>
>
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#128280):
> https://lists.openembedded.org/g/openembedded-devel/message/128280
> Mute This Topic: https://lists.openembedded.org/mt/120361632/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000b582bf06570d2401
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Second patch in this series needs similar fix. Please rew=
ork that as well and send v2=C2=A0</div><br><div class=3D"gmail_quote gmail=
_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jul 20, 202=
6, 9:06=E2=80=AFAM Thu=E1=BA=ADn Nguy=E1=BB=85n-Th=C3=A1i via <a href=3D"ht=
tp://lists.openembedded.org">lists.openembedded.org</a> &lt;nguyenthaithuan=
alg=3D<a href=3D"mailto:gmail.com@lists.openembedded.org">gmail.com@lists.o=
penembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">Add note to answer from meta-openembedded maintainer: Khem R=
aj<br>
<br>
And explain -D__LINUX__=3D1, -D_GNU_SOURCE=3D1 and musl (strictly POSIX)<br=
>
<br>
Signed-off-by: Thu=E1=BA=ADn Nguy=E1=BB=85n-Th=C3=A1i &lt;<a href=3D"mailto=
:nguyenthaithuanalg@gmail.com" target=3D"_blank" rel=3D"noreferrer">nguyent=
haithuanalg@gmail.com</a>&gt;<br>
---<br>
=C2=A0.../libsimplelog/<a href=3D"http://libsimplelog_1.1.0.bb" rel=3D"nore=
ferrer noreferrer" target=3D"_blank">libsimplelog_1.1.0.bb</a>=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 16 +++++++++++++---<br>
=C2=A01 file changed, 13 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/meta-oe/recipes-support/libsimplelog/<a href=3D"http://libsimp=
lelog_1.1.0.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">libsimplelo=
g_1.1.0.bb</a> b/meta-oe/recipes-support/libsimplelog/<a href=3D"http://lib=
simplelog_1.1.0.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">libsimp=
lelog_1.1.0.bb</a><br>
index 53c13d726b..7a385d537b 100644<br>
--- a/meta-oe/recipes-support/libsimplelog/<a href=3D"http://libsimplelog_1=
.1.0.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">libsimplelog_1.1.0=
.bb</a><br>
+++ b/meta-oe/recipes-support/libsimplelog/<a href=3D"http://libsimplelog_1=
.1.0.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">libsimplelog_1.1.0=
.bb</a><br>
@@ -3,17 +3,27 @@ SUMMARY =3D &quot;simplelog-topc - Simple, STABLE, powerf=
ul of logging library in ANSI<br>
=C2=A0DESCRIPTION =3D &quot;Async and Fast C/C++ multi-thread logger with t=
opics. No external dependencies.&quot;<br>
=C2=A0HOMEPAGE =3D &quot;<a href=3D"https://github.com/thuanalg/simplelog-t=
opic" rel=3D"noreferrer noreferrer" target=3D"_blank">https://github.com/th=
uanalg/simplelog-topic</a>&quot;<br>
=C2=A0LICENSE =3D &quot;MIT&quot;<br>
+#The checksum of &quot;LIC_FILES_CHKSUM&quot; changed b/c I did change fro=
m &quot;2024&quot; to &quot;2024-2026&quot;<br>
+#libsimplelog=C2=A0 is allways full &quot;MIT license&quot;.<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://LICENSE.txt;md5=3D594fdc3cb85f0b684=
cf5d7b332a741be&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://github.com/thuanalg/simplel=
og-topic.git;branch=3Dmain;protocol=3Dhttps;tag=3Dv$%7BPV%7D" rel=3D"norefe=
rrer noreferrer" target=3D"_blank">github.com/thuanalg/simplelog-topic.git;=
branch=3Dmain;protocol=3Dhttps;tag=3Dv${PV}</a>&quot;<br>
<br>
=C2=A0SRCREV =3D &quot;151e83902ca9755bcd285791d2f49de6fc30bfe6&quot;<br>
<br>
-S =3D &quot;${WORKDIR}/git&quot;<br>
-<br>
=C2=A0inherit cmake<br>
<br>
-# Specify any options you want to pass to cmake using EXTRA_OECMAKE:<br>
=C2=A0EXTRA_OECMAKE +=3D &quot;-DUNIX_LINUX=3D1 -D__LINUX__=3D1 -D_GNU_SOUR=
CE=3D1&quot;<br>
<br>
+# From v.1.0.8 -&gt; v1.1.0<br>
+# Note for -D__LINUX__=3D1 -D_GNU_SOURCE=3D1<br>
+# If don&#39;t use these flags, v.1.1.0 works like v1.0.8, and well adapt =
with musl (strictly POSIX)<br>
+# If use 2 flags, they helps the source is more effective. Please test for=
 2 cases, you will see.<br>
+# Please check &quot;p-&gt;r =3D sched_getcpu();&quot; in &quot;simplelog.=
c&quot;<br>
+# You can use as below without any problem<br>
+# EXTRA_OECMAKE +=3D &quot;-DUNIX_LINUX=3D1&quot;<br>
+<br>
+# Drop 0001-allow-build-with-cmake-4.patch as it is now integrated upstrea=
m. <br>
+# Please see branch &quot;main&quot;, commit &quot;4827c4325063266f6d2a7e1=
33a9d3a9050ff6a3c&quot; by <br>
+# Author: Alper Ak &lt;<a href=3D"mailto:alperyasinak1@gmail.com" target=
=3D"_blank" rel=3D"noreferrer">alperyasinak1@gmail.com</a>&gt;<br>
<br>
-- <br>
2.43.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#128280): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/128280" rel=3D"noreferrer noreferrer" target=3D"_b=
lank">https://lists.openembedded.org/g/openembedded-devel/message/128280</a=
><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/120361632/199=
7914" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.openemb=
edded.org/mt/120361632/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank" rel=3D"noreferrer">openembedded-devel+owner@lists.=
openembedded.org</a><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.opene=
mbedded.org/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmai=
l.com" target=3D"_blank" rel=3D"noreferrer">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000b582bf06570d2401--

