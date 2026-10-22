Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16422.1792646164420957539
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Oct 2026 22:16:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=kPmZFEVK;
 spf=pass (domain: gmail.com, ip: 209.85.128.182, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-8ac8a2ac52bso5729067b3.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 22:16:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792646163; cv=none;
        d=google.com; s=arc-20260327;
        b=jDDSPQH47qYQjRclYAV4WugKhgmcq9/uGGdh7H1fHXUmoxUWufHcTUe1WtFLoR+6rY
         ClRSWINEPrzkKZexGMfLm7lbt8MeFgS/A6eu34xHn9N3C+D6RJmQj+jg6F1m5DRSxS+P
         bcE9V8NnC3YyAkj7UuLLlEPkdDRkiSGIMQPh6lqphIiE7zh++Q7j1ICrYUK5BAixlvDs
         qEGARf/hNseEsx0BKt0jqExBt8sJihTxy8ykBK40Bq6LHPdtcbGu+McpgfAX/oFMN2G1
         1whm1vhpJv0/jkB0fcUtkoT1KM02a2WgiyWJAAxsWVEtQ+NajpOVlX6RHU//e+VBiBVg
         qjHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=mb2F89prmK18LD+z9712CkbRe6rjhSvt+MpPkA/Fmeo=;
        fh=zDV/DJKlvtgdBhH596m+CAdizR6eZ4xdrOYuUQ4WjP4=;
        b=L9MMEq16pdBMnKP9k66PRIHmHBjyv2wJvXfVouDdYsZMt3noFvs7AMJU3bH8Fp9z11
         s3yHql5w52suMnHRVT8immFvGDZPmysNbMu29Ggek4mMVa8/NTUzYa/MSwGgxAb9Dbbo
         CqPaCYBSkqz4NW6xGlhjw+tAsqjUshSQnNSKxDrX+FKCLfZgTlY+u4er/uac6uZ0K0Pu
         SU2U1/zm/IKigeOL2hX1EjQhm3ClBJUGyEBKcBWl0z4uY9y2e6w/f1Y+dKwGPiVWJxu7
         41p20mT0xhySn1mKeNQHqhmVuHXKI+ahdwkAZog+Kso3Lk5o598D/tL1ZTprM26bI5yl
         tywA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792646163; x=1793250963; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mb2F89prmK18LD+z9712CkbRe6rjhSvt+MpPkA/Fmeo=;
        b=kPmZFEVK3B+S9qw7IpWDG1Zxlu3ZiH2oiVox0PLGsAwO0LMfERZEILmtCVKwkoZ8Pb
         00P3oMC3CM7tZBCy8f7WuTtniqA2uqDPWSRxr+e+GIVGEZLOWCmdjA0I2XAora3ybaNc
         ePfACl3WbC7ovbSrbVCdUh3/zimJHFlATZ+qT6Hvl3IU4ilr7q15QbuhgtikFaHds9mQ
         YuRosy+3Wv9G01E4pziUOFetSGJiM8r6ADuctnKKBlv+pESySLYPLagLPyA93XLZfl2c
         JA+LizWTgC1NL/ZxHBiy+kZ+C8lKYHU3/Mh90oJGr7jz8RxQ2EUC9LVBynzFUZSV/5yo
         rCow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792646163; x=1793250963;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=mb2F89prmK18LD+z9712CkbRe6rjhSvt+MpPkA/Fmeo=;
        b=C4/xuHLyGGhiDFbrdPU5sOps+4rHw6mM2j6pnxMggypb/e/oMMqrbZmDFOEezXIMvn
         B1g4Q1389QdEjHlE1Uy479bfly3qiGVT8sFKq1KJgx+aay3FMp6HhGipgokZJHAVp/fI
         3C+WYde6mtr+TpkPahYLkV4uJqeNIqQNAHiYH5d23ZUWbqnk2NYRUVA2w4YrtkbWc72x
         TqHWqaC726sTfL/mw1aKbFawtqvHMe0jqY1OwG5B/VF7L1IO/AkwD3TEl6V1GusjyWrx
         T234z2cOYXP/R16C0ErQUVclTyyMMFz9MTysbb+2L4iE1zdUsNqzZ0FKwBanTZuYxub/
         K7JA==
X-Gm-Message-State: AFq9FYJZc6snDeYaEiLVZ1P4lFD2UOitNqLuPddq3BgwpL1cZU1CUpxb
	+UEbddZODPw4TdcxKazXcXfln2C0m4sivDKXUiWz/8Qft3Gr8v/lD4vRaYwaO9gA2F3JX3BYjLc
	DT7Iotdug/rNtncl5gNY6B2tlv9NXuDo=
X-Gm-Gg: AYBFou05imTUYCqqWhnK41EwSXb92ueaea7GmDl5Qye5+76U1cBxDooDzNp+VkS547J
	8tRVKkqGYXxatmPSfPbqpxDjrjpT5naWbuH1uCVdkL3Yuzjy/RWRcioEbD+b2XkUwuEA2A3gUo2
	yrOHndzqlllJCXdIwWI4mXSXN+JmMvR6D4LQThAxUNgL4AGYKUAGl2OdgoSNhpp0L2zb4ij1h2i
	Za40g76MsRePzmgmHmK3Twkc50XEYdqe0GPS6Z7a8ckh3hzaWVIuWaoevbz1fvMq8RYe5wV5yNR
	PrKEPK0eT9f0wVdTzZyVvojtX8zON6AmNuhcqUpcmzNpwtXcxBCYZBWYDGCIEYCCOh3R2F6B9hF
	2/bMV0BYpX89xTOIrIubka9+azW0Fv7xxUNlxS6OyndoojA6RpVIKpjEankZIGlOJZHuvpf9jAz
	PF8KAj5PN1tt1vz+asX51RHCXGHlMdZH86bJf6PqI/+W4g2W9w8qGLxv6ThHFkJVl2a/K52rboC
	d0rIFZuSMwNbk0nrRWhKEwDKRby7D8XBlFBwVcuE3EXvRkRYRBACkwZtmev9sjl5t4Tr7QcQaoE
	DOwu0v1FBlYvxpWcfNkwz5ePbb5+vU+R85DbViRcvU/oBudmuX6rlVF1FtlfyTBh
X-Received: by 2002:a05:690c:a089:20b0:8b1:46a1:28c7 with SMTP id
 00721157ae682-8b146a1301fmr6212207b3.12.1792646163373; Wed, 21 Oct 2026
 22:16:03 -0700 (PDT)
MIME-Version: 1.0
References: <20261022041850.97712-1-schonm@gmail.com>
In-Reply-To: <20261022041850.97712-1-schonm@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 21 Oct 2026 22:15:36 -0700
X-Gm-Features: AclHuK9Hw-Gy9LHn8pkGnGiQCP98bw5oiM0l1bDYDztZiX8-e8kQJpxPYfDfmLM
Message-ID: <CAMKF1sq2zo4SsMhWaUo=wv=iX0pWnO2H0vf5=m8nm8pPHa0eew@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] brotli: upgrade 1.2.0 -> 1.2.1
To: schonm@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000c6a0dc065e66f51e"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 22 Oct 2026 05:16:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131307

--000000000000c6a0dc065e66f51e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 21, 2026 at 9:19=E2=80=AFPM J. S. via lists.openembedded.org <s=
chonm=3D
gmail.com@lists.openembedded.org> wrote:

> This is a security release
>
> CVE-2026-111497: out-of-bounds write permits remote code execution
>
> Changelog: https://github.com/google/brotli/releases/tag/v1.2.1
>
> Signed-off-by: Jason Schonberg <schonm@gmail.com>
> ---
>  .../brotli/{brotli_1.2.0.bb =3D> brotli_1.2.1.bb}               | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-oe/recipes-extended/brotli/{brotli_1.2.0.bb =3D>
> brotli_1.2.1.bb} (83%)
>
> diff --git a/meta-oe/recipes-extended/brotli/brotli_1.2.0.bb
> b/meta-oe/recipes-extended/brotli/brotli_1.2.1.bb
> similarity index 83%
> rename from meta-oe/recipes-extended/brotli/brotli_1.2.0.bb
> rename to meta-oe/recipes-extended/brotli/brotli_1.2.1.bb
> index 84495a3236..2db266c2fe 100644
> --- a/meta-oe/recipes-extended/brotli/brotli_1.2.0.bb
> +++ b/meta-oe/recipes-extended/brotli/brotli_1.2.1.bb
> @@ -6,8 +6,8 @@ BUGTRACKER =3D "https://github.com/google/brotli/issues"
>  LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D
> "file://${S}/LICENSE;md5=3D941ee9cd1609382f946352712a319b4b"
>
> -SRC_URI =3D "git://
> github.com/google/brotli.git;branch=3Dmaster;protocol=3Dhttps"
> -SRCREV =3D "028fb5a23661f123017c060daa546b55cf4bde29"
> +SRC_URI =3D "git://github.com/google/brotli.git;branch=3Dv1.2;protocol=
=3Dhttps"
>

while you are here, please add tag=3Dv${PV} as well to SRC_URI and change
branch assignment to use variable e.g.

branch=3D${@oe.utils.trim_version('${PV}')}


> +SRCREV =3D "db24a98aed38a16de78cc05ca15cdd8dc2a0d92d"
>
>
>  inherit cmake lib_package
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#131306):
> https://lists.openembedded.org/g/openembedded-devel/message/131306
> Mute This Topic: https://lists.openembedded.org/mt/121879299/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000c6a0dc065e66f51e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Oct 21,=
 2026 at 9:19=E2=80=AFPM J. S. via <a href=3D"http://lists.openembedded.org=
">lists.openembedded.org</a> &lt;schonm=3D<a href=3D"mailto:gmail.com@lists=
.openembedded.org">gmail.com@lists.openembedded.org</a>&gt; wrote:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">This is a security relea=
se<br>
<br>
CVE-2026-111497: out-of-bounds write permits remote code execution<br>
<br>
Changelog: <a href=3D"https://github.com/google/brotli/releases/tag/v1.2.1"=
 rel=3D"noreferrer" target=3D"_blank">https://github.com/google/brotli/rele=
ases/tag/v1.2.1</a><br>
<br>
Signed-off-by: Jason Schonberg &lt;<a href=3D"mailto:schonm@gmail.com" targ=
et=3D"_blank">schonm@gmail.com</a>&gt;<br>
---<br>
=C2=A0.../brotli/{<a href=3D"http://brotli_1.2.0.bb" rel=3D"noreferrer" tar=
get=3D"_blank">brotli_1.2.0.bb</a> =3D&gt; <a href=3D"http://brotli_1.2.1.b=
b" rel=3D"noreferrer" target=3D"_blank">brotli_1.2.1.bb</a>}=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
=C2=A0rename meta-oe/recipes-extended/brotli/{<a href=3D"http://brotli_1.2.=
0.bb" rel=3D"noreferrer" target=3D"_blank">brotli_1.2.0.bb</a> =3D&gt; <a h=
ref=3D"http://brotli_1.2.1.bb" rel=3D"noreferrer" target=3D"_blank">brotli_=
1.2.1.bb</a>} (83%)<br>
<br>
diff --git a/meta-oe/recipes-extended/brotli/<a href=3D"http://brotli_1.2.0=
.bb" rel=3D"noreferrer" target=3D"_blank">brotli_1.2.0.bb</a> b/meta-oe/rec=
ipes-extended/brotli/<a href=3D"http://brotli_1.2.1.bb" rel=3D"noreferrer" =
target=3D"_blank">brotli_1.2.1.bb</a><br>
similarity index 83%<br>
rename from meta-oe/recipes-extended/brotli/<a href=3D"http://brotli_1.2.0.=
bb" rel=3D"noreferrer" target=3D"_blank">brotli_1.2.0.bb</a><br>
rename to meta-oe/recipes-extended/brotli/<a href=3D"http://brotli_1.2.1.bb=
" rel=3D"noreferrer" target=3D"_blank">brotli_1.2.1.bb</a><br>
index 84495a3236..2db266c2fe 100644<br>
--- a/meta-oe/recipes-extended/brotli/<a href=3D"http://brotli_1.2.0.bb" re=
l=3D"noreferrer" target=3D"_blank">brotli_1.2.0.bb</a><br>
+++ b/meta-oe/recipes-extended/brotli/<a href=3D"http://brotli_1.2.1.bb" re=
l=3D"noreferrer" target=3D"_blank">brotli_1.2.1.bb</a><br>
@@ -6,8 +6,8 @@ BUGTRACKER =3D &quot;<a href=3D"https://github.com/google/b=
rotli/issues" rel=3D"noreferrer" target=3D"_blank">https://github.com/googl=
e/brotli/issues</a>&quot;<br>
=C2=A0LICENSE =3D &quot;MIT&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://${S}/LICENSE;md5=3D941ee9cd1609382f=
946352712a319b4b&quot;<br>
<br>
-SRC_URI =3D &quot;git://<a href=3D"http://github.com/google/brotli.git;bra=
nch=3Dmaster;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_blank">github.=
com/google/brotli.git;branch=3Dmaster;protocol=3Dhttps</a>&quot;<br>
-SRCREV =3D &quot;028fb5a23661f123017c060daa546b55cf4bde29&quot;<br>
+SRC_URI =3D &quot;git://<a href=3D"http://github.com/google/brotli.git;bra=
nch=3Dv1.2;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_blank">github.co=
m/google/brotli.git;branch=3Dv1.2;protocol=3Dhttps</a>&quot;<br></blockquot=
e><div><br></div><div>while you are here, please add tag=3Dv${PV} as well t=
o SRC_URI and change</div><div>branch assignment to use variable e.g.</div>=
<div><br></div><div>branch=3D${@oe.utils.trim_version(&#39;${PV}&#39;)}</di=
v><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
+SRCREV =3D &quot;db24a98aed38a16de78cc05ca15cdd8dc2a0d92d&quot;<br>
<br>
<br>
=C2=A0inherit cmake lib_package<br>
-- <br>
2.43.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#131306): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/131306" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/131306</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/121879299/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/121879299/1997914</a><br>
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

--000000000000c6a0dc065e66f51e--
