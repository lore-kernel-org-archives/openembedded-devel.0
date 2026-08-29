Return-Path: <rob.woolleywr@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F91DC61DD6
	for <webhook@archiver.kernel.org>; Sat, 29 Aug 2026 20:19:38 +0000 (UTC)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3572.1788034775561451230
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 29 Aug 2026 13:19:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=rqAmlnW0;
 spf=pass (domain: gmail.com, ip: 209.85.128.180, mailfrom: rob.woolleywr@gmail.com)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-85aeb506b78so29952657b3.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 29 Aug 2026 13:19:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788034774; cv=none;
        d=google.com; s=arc-20260327;
        b=qW6DYxwUAwQsN5mYLb7gwKcwjnckKmbkqbMwPfRDyPIRdzUS3HrpmahIl6IvWfAS19
         ccK3YkRiVzmu3IPeq/FX7QvmbRRf3COYxEJBvw9DED5LHOEhQnwGa+bzuHkEwzt59QEa
         JlFYbue70q6pfXNrUNF3PA1NYQEpP3tLX0FBJ0TWzYA1y9I4S3N3dlXbELcn6twXcbp0
         Op9BWR6whVkuR4olScRGnyVFL43pEMlEa/lvZtxV5o4svFlQYJZq1qFzCl+GKXvyUIUY
         hchU4IZP9UzkHgVjzcs3EPSnGzXjReqtGorlXxN83CKQXobwygwflpYQJzWCsuXNhCqx
         qQbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=FjqfuFURLMly3HuyeL3x9pvVPp+UZee463gu2QqUeiM=;
        fh=xcS4RZANSVRjGVd48CS40Xdh8DYR9xQ2gUwMOj5xU+I=;
        b=C+FRAp8PibdV6zq6u35nOYh1LLrQjer3ia+FBl52/y6p2kItLXg9vzdlmNSfjTOT/w
         ns+9qIONKJghM8COeMQAg4oS9MYdqa+EnE99C9jXDkqzCTjmJQUrLbDu9GdmvCijYJg0
         ZQZkLyFLhu0zuLqUxox/exZ+Fe18PUjNIe9/kSIxL7QitJ6LJfiIqBr2CfPQeuzLnpxD
         Mj4mMXukq6BGHFoDFgAj1ASl3pp301EsRpZxfJ0FxtnCmW4eTl97NFl4pIUJOTTM6M5A
         LRvCEuZz+ZEmolRhGrpu+rg1mfq7RRp+BBVvBIGJUcd6XuU5M05jc3cM8itstWc4u0tq
         xlhA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788034774; x=1788639574; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FjqfuFURLMly3HuyeL3x9pvVPp+UZee463gu2QqUeiM=;
        b=rqAmlnW045c6Bxxw6j9LT614ovnF1zk3cpcUYgBerYDij2i46HfMANLayTXF5epsyL
         LGatkYFOQuH5BXZc0bvVu5QKNTr4oWH2AXGvjKArWHjHfHuZui2QLD8Ftk0nYsqWWZrC
         cm0Y16uSl1uILkT6wgghrhFIa/Wqy3603fTv9Ny5y/ww76T5uRbxHnT1KXc0n+9Skq1T
         7+eqPTK5FJ8EPhkbOM6UUtw9HCH/YmpcbXTXLesUNcEcaPqyxylCD1ODRVMlHI1ILMbn
         GnUJLvfXgBONlI74KcLGfomw447cl+j7NDe6Hp2QR2exgsX+uTyPB/Rfny1hlp+Mw8Yf
         0opQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788034774; x=1788639574;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FjqfuFURLMly3HuyeL3x9pvVPp+UZee463gu2QqUeiM=;
        b=CaUr6L/qbYZ4dpJBSvfw9NWTQVs0JP9i3niYmNENOXGUn3ODth2BHeZWt75pUHw2E6
         F47NRhFEm0DlzAcPTCf/MUDDLSB32u8GiooYKv7sW1gwD4bMq1xtCl2aNg/1IYMMlUEn
         /+XPWojHUmdSzJ1d0t1jrOylWVjo1mJeTaxUg4foYuCatzvR51x+wlscB8ntO4igv2ev
         qFNZ1mLB/+y1eaAdZ9QHOMIR1gfpgLIBWSq83/WpSJaU4xofUDXNT7O1dsxBrVrvBRiG
         2ltsqT3CeEZ6Z5/T0D50Ef/mE4Q2PkENrqkSstQB5pcGYZvwLnGzerQzvphe2pL6WCAm
         zQDQ==
X-Gm-Message-State: AFuF++nsQ1HKELBhJuU2KEYlyfhxwR2KWiT4jIq/y43rEbyIdBKKnDo3
	6+PRqWroQiowFKvicLETY6m7lknuPEYXJNg3CbmAJKtoFC1lJK+e5DFoW58ZIhT//O7hQ4pkhSl
	2YZ/TpMF1NzRFCjiA5TuNAQOJbW080Tjv6nd2
X-Gm-Gg: AYBFou1m8m/jEO7IZXIgUBVXZZs1Tg7hV9x6lXKJnJ359swDoga6t27mh7MwrYOF1NN
	/83c65aC8zpsEgDTSl9AALJ3SyjNi6zNl6E5ToYLuoFGK1zZSeKFUTF/6GESG36iz9g1/ynzqpe
	TmC6XLftJ++SKBsb/Xkecpq9Kjmp7dPyUMxd0+I8cgWlDajuGyT0+5aOwjkmCPNF2HYB9w/iIqx
	q0gNHAcE2KpRf8qzUeEf9InQ8KPSFaEw5hi3DLgcBJ5L3ISGyBUDQwSQdr5zjh1c0FJf28/wpZj
	7r1SxAGK9Q5HxsE5hFLP8UktI62fA1MJk06ijucH98pQ3RqrZS0z95Tj1pAcS7Tj7hL7h3+hQAj
	IwQ==
X-Received: by 2002:a05:690c:650a:b0:81d:edf2:dad8 with SMTP id
 00721157ae682-85d6a3d71cbmr63451067b3.22.1788034774495; Sat, 29 Aug 2026
 13:19:34 -0700 (PDT)
MIME-Version: 1.0
References: <20260827122023.76593-1-jaipaul.cheernam@est.tech>
In-Reply-To: <20260827122023.76593-1-jaipaul.cheernam@est.tech>
From: Rob Woolley <rob.woolleywr@gmail.com>
Date: Sat, 29 Aug 2026 16:19:23 -0400
X-Gm-Features: AcwNN1VUeBj4g9mXkA3udkym8kZubAPSjv6dk-nW3cSSPZzAdipQ3malUHm3Ue0
Message-ID: <CAGAhMBwE0G_1v=v50bCvtUPc_9NVzCs_o1wxOKD9f2zNK1FaJw@mail.gmail.com>
Subject: Re: [oe] [PATCH] doxygen: upgrade 1.17.0 -> 1.18.0
To: jaipaul.cheernam@est.tech
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000947868065a354987"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 29 Aug 2026 20:19:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129580

--000000000000947868065a354987
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for updating Doxygen.  I ran into a QA buildpath error.  I fixed it
with this:

diff --git a/meta-oe/recipes-devtools/doxygen/doxygen_1.18.0.bb
b/meta-oe/recipes-devtools/doxygen/doxygen_1.18.0.bb
index 0ee18042e3..93e1a0e6f7 100644
--- a/meta-oe/recipes-devtools/doxygen/doxygen_1.18.0.bb
+++ b/meta-oe/recipes-devtools/doxygen/doxygen_1.18.0.bb
@@ -30,6 +30,10 @@ do_install:append() {
     sed -i -e 's;^#ifndef.*GENERATED_SRC_CE_PARSE_HPP_INCLUDED$;#ifndef
GENERATED_SRC_CE_PARSE_HPP_INCLUDED;g' ${B}/generated_src/ce_parse.hpp
     sed -i -e 's;^# define.*GENERATED_SRC_CE_PARSE_HPP_INCLUDED$;# define
GENERATED_SRC_CE_PARSE_HPP_INCLUDED;g' ${B}/generated_src/ce_parse.hpp
     sed -i -e 's;^#endif.*GENERATED_SRC_CE_PARSE_HPP_INCLUDED.*$;#endif;g'
${B}/generated_src/ce_parse.hpp
+
+    sed -i -e 's;${S};;g' ${B}/generated_src/configvalues.h
+    sed -i -e 's;${S};;g' ${B}/generated_src/configvalues.cpp
+    sed -i -e 's;${S};;g' ${B}/generated_src/configoptions.cpp
 }

 BBCLASSEXTEND =3D "native nativesdk"

Did you see this QA buildpath failure when you built the recipe?

Regards,
Rob


On Thu, Aug 27, 2026 at 8:20=E2=80=AFAM Jaipaul Cheernam via lists.openembe=
dded.org
<jaipaul.cheernam=3Dest.tech@lists.openembedded.org> wrote:

> Release info: https://www.doxygen.nl/manual/changelog.html#log_1_18_0
>
> Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
> ---
>  .../doxygen/{doxygen_1.17.0.bb =3D> doxygen_1.18.0.bb}            | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-oe/recipes-devtools/doxygen/{doxygen_1.17.0.bb =3D>
> doxygen_1.18.0.bb} (96%)
>
> diff --git a/meta-oe/recipes-devtools/doxygen/doxygen_1.17.0.bb
> b/meta-oe/recipes-devtools/doxygen/doxygen_1.18.0.bb
> similarity index 96%
> rename from meta-oe/recipes-devtools/doxygen/doxygen_1.17.0.bb
> rename to meta-oe/recipes-devtools/doxygen/doxygen_1.18.0.bb
> index 70537fab15..0ee18042e3 100644
> --- a/meta-oe/recipes-devtools/doxygen/doxygen_1.17.0.bb
> +++ b/meta-oe/recipes-devtools/doxygen/doxygen_1.18.0.bb
> @@ -10,7 +10,7 @@ SRC_URI =3D "\
>      git://github.com/doxygen/doxygen.git;branch=3Dmaster;protocol=3Dhttp=
s \
>  "
>
> -SRCREV =3D "65a43c0aba45cc23b3ca11b6b5334d4eea931726"
> +SRCREV =3D "8e760943e5d9581a444cf327f43a0b4d20d29482"
>
>
>  UPSTREAM_CHECK_GITTAGREGEX =3D "Release_(?P<pver>\d+(\_\d+)+)"
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#129533):
> https://lists.openembedded.org/g/openembedded-devel/message/129533
> Mute This Topic: https://lists.openembedded.org/mt/120954979/556952
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> rob.woolleywr@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000947868065a354987
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks for updating Doxygen.=C2=A0 I ran into a QA buildpa=
th error.=C2=A0 I fixed it with this:<br><br>diff --git a/meta-oe/recipes-d=
evtools/doxygen/<a href=3D"http://doxygen_1.18.0.bb">doxygen_1.18.0.bb</a> =
b/meta-oe/recipes-devtools/doxygen/<a href=3D"http://doxygen_1.18.0.bb">dox=
ygen_1.18.0.bb</a><br>index 0ee18042e3..93e1a0e6f7 100644<br>--- a/meta-oe/=
recipes-devtools/doxygen/<a href=3D"http://doxygen_1.18.0.bb">doxygen_1.18.=
0.bb</a><br>+++ b/meta-oe/recipes-devtools/doxygen/<a href=3D"http://doxyge=
n_1.18.0.bb">doxygen_1.18.0.bb</a><br>@@ -30,6 +30,10 @@ do_install:append(=
) {<br>=C2=A0 =C2=A0 =C2=A0sed -i -e &#39;s;^#ifndef.*GENERATED_SRC_CE_PARS=
E_HPP_INCLUDED$;#ifndef GENERATED_SRC_CE_PARSE_HPP_INCLUDED;g&#39; ${B}/gen=
erated_src/ce_parse.hpp<br>=C2=A0 =C2=A0 =C2=A0sed -i -e &#39;s;^# define.*=
GENERATED_SRC_CE_PARSE_HPP_INCLUDED$;# define GENERATED_SRC_CE_PARSE_HPP_IN=
CLUDED;g&#39; ${B}/generated_src/ce_parse.hpp<br>=C2=A0 =C2=A0 =C2=A0sed -i=
 -e &#39;s;^#endif.*GENERATED_SRC_CE_PARSE_HPP_INCLUDED.*$;#endif;g&#39; ${=
B}/generated_src/ce_parse.hpp<br>+<br>+ =C2=A0 =C2=A0sed -i -e &#39;s;${S};=
;g&#39; ${B}/generated_src/configvalues.h<br>+ =C2=A0 =C2=A0sed -i -e &#39;=
s;${S};;g&#39; ${B}/generated_src/configvalues.cpp<br>+ =C2=A0 =C2=A0sed -i=
 -e &#39;s;${S};;g&#39; ${B}/generated_src/configoptions.cpp<br>=C2=A0}<br>=
<br>=C2=A0BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br><br>Did you see=
 this QA buildpath failure when you built the recipe?<br><br>Regards,<br>Ro=
b<br><br></div><br><div class=3D"gmail_quote gmail_quote_container"><div di=
r=3D"ltr" class=3D"gmail_attr">On Thu, Aug 27, 2026 at 8:20=E2=80=AFAM Jaip=
aul Cheernam via <a href=3D"http://lists.openembedded.org">lists.openembedd=
ed.org</a> &lt;jaipaul.cheernam=3D<a href=3D"mailto:est.tech@lists.openembe=
dded.org">est.tech@lists.openembedded.org</a>&gt; wrote:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">Release info: <a href=3D"https://w=
ww.doxygen.nl/manual/changelog.html#log_1_18_0" rel=3D"noreferrer" target=
=3D"_blank">https://www.doxygen.nl/manual/changelog.html#log_1_18_0</a><br>
<br>
Signed-off-by: Jaipaul Cheernam &lt;jaipaul.cheernam@est.tech&gt;<br>
---<br>
=C2=A0.../doxygen/{<a href=3D"http://doxygen_1.17.0.bb" rel=3D"noreferrer" =
target=3D"_blank">doxygen_1.17.0.bb</a> =3D&gt; <a href=3D"http://doxygen_1=
.18.0.bb" rel=3D"noreferrer" target=3D"_blank">doxygen_1.18.0.bb</a>}=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
=C2=A0rename meta-oe/recipes-devtools/doxygen/{<a href=3D"http://doxygen_1.=
17.0.bb" rel=3D"noreferrer" target=3D"_blank">doxygen_1.17.0.bb</a> =3D&gt;=
 <a href=3D"http://doxygen_1.18.0.bb" rel=3D"noreferrer" target=3D"_blank">=
doxygen_1.18.0.bb</a>} (96%)<br>
<br>
diff --git a/meta-oe/recipes-devtools/doxygen/<a href=3D"http://doxygen_1.1=
7.0.bb" rel=3D"noreferrer" target=3D"_blank">doxygen_1.17.0.bb</a> b/meta-o=
e/recipes-devtools/doxygen/<a href=3D"http://doxygen_1.18.0.bb" rel=3D"nore=
ferrer" target=3D"_blank">doxygen_1.18.0.bb</a><br>
similarity index 96%<br>
rename from meta-oe/recipes-devtools/doxygen/<a href=3D"http://doxygen_1.17=
.0.bb" rel=3D"noreferrer" target=3D"_blank">doxygen_1.17.0.bb</a><br>
rename to meta-oe/recipes-devtools/doxygen/<a href=3D"http://doxygen_1.18.0=
.bb" rel=3D"noreferrer" target=3D"_blank">doxygen_1.18.0.bb</a><br>
index 70537fab15..0ee18042e3 100644<br>
--- a/meta-oe/recipes-devtools/doxygen/<a href=3D"http://doxygen_1.17.0.bb"=
 rel=3D"noreferrer" target=3D"_blank">doxygen_1.17.0.bb</a><br>
+++ b/meta-oe/recipes-devtools/doxygen/<a href=3D"http://doxygen_1.18.0.bb"=
 rel=3D"noreferrer" target=3D"_blank">doxygen_1.18.0.bb</a><br>
@@ -10,7 +10,7 @@ SRC_URI =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0git://<a href=3D"http://github.com/doxygen/doxygen.git;=
branch=3Dmaster;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_blank">gith=
ub.com/doxygen/doxygen.git;branch=3Dmaster;protocol=3Dhttps</a> \<br>
=C2=A0&quot;<br>
<br>
-SRCREV =3D &quot;65a43c0aba45cc23b3ca11b6b5334d4eea931726&quot;<br>
+SRCREV =3D &quot;8e760943e5d9581a444cf327f43a0b4d20d29482&quot;<br>
<br>
<br>
=C2=A0UPSTREAM_CHECK_GITTAGREGEX =3D &quot;Release_(?P&lt;pver&gt;\d+(\_\d+=
)+)&quot;<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#129533): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/129533" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/129533</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/120954979/556=
952" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/120954979/556952</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:rob.woolleywr@gmail.com"=
 target=3D"_blank">rob.woolleywr@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000947868065a354987--

