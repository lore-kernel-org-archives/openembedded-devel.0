Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CE77C43458
	for <webhook@archiver.kernel.org>; Sat,  4 Jul 2026 06:58:37 +0000 (UTC)
Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.108636.1783148311804265417
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Jul 2026 23:58:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=LPWmQFN3;
 spf=pass (domain: gmail.com, ip: 74.125.224.43, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-6662551100bso1823679d50.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 03 Jul 2026 23:58:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783148311; cv=none;
        d=google.com; s=arc-20260327;
        b=X7C0urEiB2blG87BE4bFZlaNqoghNfPAZberPTkSAYfLcoKWTkSPv436Mwkzdl3xKH
         N/vAdMCM7N/8AZZxiNVJJIXASBQyuJzw/OywdAemyV2DTgyatDyCFarxzyEH89kbPr2M
         U8jl931YW3R1rsuWxm9E7mZZ6fvh+ChmHt3wgqWhxGFF9+Ahi/W/0Ak9QLd6GT1u4Pss
         QxbuRIQzMzK91BF16vINpOcPP/cG7XdVuUXQgsslWyCk14eA3+AJ85ghVpXeAF9v39AS
         mfPuekJhtk3frbvjmLvaNRV9/0NhpOcTQhpUUWuzEMnl9ZbSNynaPPYm3DxbBNFxtgYo
         6JpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=0QI5kQJ4JaTsGbklwrH2VJJ3qCxErOXfuJhPGFOm3Zo=;
        fh=tvH0fRzsTzWp7W9pVcVBj/Hg9HcaDtV/l9F/msdGtu4=;
        b=VSncSjgUukWA9lQnsoaU53dtYDAjM44jYx9lzX22y2BKAGkno0rCW6c5oc1k0fUEYA
         oeOheEPwpR+dKwSnNAAgP0vvF9TAcFza2Y2z2zXOGmidh0Mj+WPDwaYveV1v7RYkj0Ou
         A1mSWy7I2b8PiCIkKrdCHZ219WQBW07WcBCqcr18Ma+6dCuv4XTX+jh/OFbmswywj5Af
         jbasl7zi4bcAZZRmgSjGB4WWIflC98JUGppqvxFIGcZ+1fvfqZvY5aCuw1y48ZHsymzH
         W+3A28qcyqOH7wIg0quEY8TZJ8ZQAlwVtBbSVksg/EW1tQ65Q1LIA7b4G7l79AQCuIIs
         /JlQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783148311; x=1783753111; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0QI5kQJ4JaTsGbklwrH2VJJ3qCxErOXfuJhPGFOm3Zo=;
        b=LPWmQFN3WZ1zdxQbKUNtrJKyc3P7WVnYWOZT2IZyFiiwS+dnyjfUvQQlPXrNebIfvY
         Zcg6wUTMkYH4MqGcUp7LMQpZotkzuqFGzb+ZBzGe60q58VzzDuDkQpQc0jK3SjQFhnin
         BL9qQgP919guXvyoDlzBLr3JeVznWOfDYeAkHkJ/XWylSKAw3eC11Sh1BggwEYLJ8Y2j
         AhCHTGJp2Q2T4hWOtWoIi9Oe3N/obaAqZO+gH5UajhjzsiAdN9s0PDj2bo/WTkLQM4XU
         +uOjB+tSYPVhDMvTLvyNfU4Mr6h3G7Oo0RoXmEoHCLwg7E/8ZvKpV/L3hOrdhCyAT1RN
         kPGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783148311; x=1783753111;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0QI5kQJ4JaTsGbklwrH2VJJ3qCxErOXfuJhPGFOm3Zo=;
        b=sSXcUyrMvC2PHWfOaEc3mD5vD8Pp4Gcv+vSEBxZWippC5Y0Jsr4+8nYBGI81Gm9NsH
         Xgvu5SkZ3x5BVvPSuE7GX3NXMV+FMOj3YSQxZvOE8+CjHJf0KWuBK208iu/rUjbtjTdF
         K4irlfIp+NSTNRpdHKYj7yXOr7FvErr5xHNoDCBDn1KChImTKI+apmNeRAHtyOqgfUty
         zPcZrJuKfYWjBpXS17wrgONG0muC76UW7sxnk0LGAfdswOA3fGYJnPJiqpDJDKsC8Y5D
         vSqHDZDfGFB+YjpQF8rDQ541DnNnXbWF5BqnfyZFEAxyz2ZAsqFPfbKOvYmO6zkvp3d0
         L9Ag==
X-Gm-Message-State: AOJu0YzqFmQcOTj6I/Tb8JiI9cUc/3H+eLjK0AGEPDaMgbhkhPQevLgP
	0JcPRn8R4+h6aXLFVhsu0NticgYAGjOCDK1RlkBNjKJWOun/Ml+eUGErR8eRh3yEEWGqfTyl1Xn
	oDk3g08kkta4h01SAiawBffXwnNvX140OAB0EsvrQGw==
X-Gm-Gg: AfdE7clULWsiSoADW4vSDGDLRcQwyO8dY70xmUh05hBL8BaAyvq0ON7tVxOz7SaoJWt
	4st6pkJsei0qQl3+simKy8WRbC5jCwVPjcXCtEvyrtAaA7M3utKF7SvlsirNxwOxKecVw/xfM/j
	VPtGHWOiOPs8MFfywmE5XHXjpNXh/0dUP9PFkKBPoGVUgVeiAFLmdkFONuk6XuFflu94S6+TQPt
	jZGrAnxGxbX79jEuIIoqLZk1tyTt4HolG6exQEFRNJEqy41ekc29FuOiEVUI6flbTcR3fTCB5xv
	d8yhJrMfkEqnwFvqVVo/ZGvr1PAGW4W9CVLdHBXV4zhn+QCTkQNZ1dl05HCBYSF+6uNkIBy7Xtg
	snuJ6G7ARriU/O2UVpr/AS2JJoa88Wqsetg6dks07DdfJc2mcOrGF1RvZDgXCF4F7kEnUig==
X-Received: by 2002:a05:690e:454d:10b0:666:515c:5234 with SMTP id
 956f58d0204a3-66652ee7080mr1413769d50.50.1783148310578; Fri, 03 Jul 2026
 23:58:30 -0700 (PDT)
MIME-Version: 1.0
References: <20260704053656.648316-1-mail@michael-fitzmayer.de>
In-Reply-To: <20260704053656.648316-1-mail@michael-fitzmayer.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 3 Jul 2026 23:58:04 -0700
X-Gm-Features: AVVi8CdzvbAB-g8wbBoaLvZ50qi2lTNqABnsZMU3y9eKcv1PHx8PoI820oZOngU
Message-ID: <CAMKF1sr-o4FHMJrCZ4MWtTR8RC1qvLBoq7k-gvqD=7bYZW4XQA@mail.gmail.com>
Subject: Re: [oe] [PATCH] canopenterm: update to version 2.03
To: mail@michael-fitzmayer.de
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000a248d20655c39163"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Jul 2026 06:58:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128019

--000000000000a248d20655c39163
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 3, 2026 at 10:37=E2=80=AFPM Michael Fitzmayer via lists.openemb=
edded.org
<mail=3Dmichael-fitzmayer.de@lists.openembedded.org> wrote:

> - Added new script to interface CiA 305: Layer setting services (LSS)
> - New API function to set baud rate: can_set_baudrate()
> - Remove usage of white text-color
> - License-Update: update year in copyright
>

This looks ok.


>
> Signed-off-by: Michael Fitzmayer <mail@michael-fitzmayer.de>
> ---
>  .../{canopenterm_2.02.bb =3D> canopenterm_2.03.bb}          | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
>  rename meta-oe/recipes-extended/canopenterm/{canopenterm_2.02.bb =3D>
> canopenterm_2.03.bb} (84%)
>
> diff --git a/meta-oe/recipes-extended/canopenterm/canopenterm_2.02.bb
> b/meta-oe/recipes-extended/canopenterm/canopenterm_2.03.bb
> similarity index 84%
> rename from meta-oe/recipes-extended/canopenterm/canopenterm_2.02.bb
> rename to meta-oe/recipes-extended/canopenterm/canopenterm_2.03.bb
> index 0e8a7a1c8a..0ee94bb052 100644
> --- a/meta-oe/recipes-extended/canopenterm/canopenterm_2.02.bb
> +++ b/meta-oe/recipes-extended/canopenterm/canopenterm_2.03.bb
> @@ -11,14 +11,12 @@ HOMEPAGE =3D "https://canopenterm.de"
>  BUGTRACKER =3D "https://github.com/CANopenTerm/CANopenTerm/issues"
>
>  LICENSE =3D "MIT"
> -LIC_FILES_CHKSUM =3D
> "file://LICENSE.md;md5=3Dbd2edc721b4a0289efe949bdbe7dda79"
> +LIC_FILES_CHKSUM =3D
> "file://LICENSE.md;md5=3D8977ecf3af54da2a5271158cc969bd45"
>
>  DEPENDS =3D "canvenient cjson isocline libinih libsdl3 lua pocketpy"
>
> -PV .=3D "+git"
> -
> -SRC_URI =3D "git://
> github.com/CANopenTerm/CANopenTerm.git;protocol=3Dhttps;branch=3Dmain"
> -SRCREV  =3D "7a9466029a6e88345e65e794ff1779f778c9358a"
> +SRC_URI =3D "git://
> github.com/CANopenTerm/CANopenTerm.git;protocol=3Dhttps;branch=3Dmain;tag=
=3Dv${PV}
> <http://github.com/CANopenTerm/CANopenTerm.git;protocol=3Dhttps;branch=3D=
main;tag=3Dv$%7BPV%7D>
> "
> +SRCREV  =3D "63ccae8262f5e796ffca0c8a44fdf7ff0bd28571"
>
>
>
this version dropped the hunk against do_install. Is this intentional ?


>  inherit cmake ptest
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#128018):
> https://lists.openembedded.org/g/openembedded-devel/message/128018
> Mute This Topic: https://lists.openembedded.org/mt/120110277/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000a248d20655c39163
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jul 3, =
2026 at 10:37=E2=80=AFPM Michael Fitzmayer via <a href=3D"http://lists.open=
embedded.org">lists.openembedded.org</a> &lt;mail=3D<a href=3D"mailto:micha=
el-fitzmayer.de@lists.openembedded.org">michael-fitzmayer.de@lists.openembe=
dded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">- Added new script to interface CiA 305: Layer setting services (LS=
S)<br>
- New API function to set baud rate: can_set_baudrate()<br>
- Remove usage of white text-color<br>
- License-Update: update year in copyright<br></blockquote><div><br></div><=
div>This looks ok.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">
<br>
Signed-off-by: Michael Fitzmayer &lt;<a href=3D"mailto:mail@michael-fitzmay=
er.de" target=3D"_blank">mail@michael-fitzmayer.de</a>&gt;<br>
---<br>
=C2=A0.../{<a href=3D"http://canopenterm_2.02.bb" rel=3D"noreferrer" target=
=3D"_blank">canopenterm_2.02.bb</a> =3D&gt; <a href=3D"http://canopenterm_2=
.03.bb" rel=3D"noreferrer" target=3D"_blank">canopenterm_2.03.bb</a>}=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 8 +++-----<br>
=C2=A01 file changed, 3 insertions(+), 5 deletions(-)<br>
=C2=A0rename meta-oe/recipes-extended/canopenterm/{<a href=3D"http://canope=
nterm_2.02.bb" rel=3D"noreferrer" target=3D"_blank">canopenterm_2.02.bb</a>=
 =3D&gt; <a href=3D"http://canopenterm_2.03.bb" rel=3D"noreferrer" target=
=3D"_blank">canopenterm_2.03.bb</a>} (84%)<br>
<br>
diff --git a/meta-oe/recipes-extended/canopenterm/<a href=3D"http://canopen=
term_2.02.bb" rel=3D"noreferrer" target=3D"_blank">canopenterm_2.02.bb</a> =
b/meta-oe/recipes-extended/canopenterm/<a href=3D"http://canopenterm_2.03.b=
b" rel=3D"noreferrer" target=3D"_blank">canopenterm_2.03.bb</a><br>
similarity index 84%<br>
rename from meta-oe/recipes-extended/canopenterm/<a href=3D"http://canopent=
erm_2.02.bb" rel=3D"noreferrer" target=3D"_blank">canopenterm_2.02.bb</a><b=
r>
rename to meta-oe/recipes-extended/canopenterm/<a href=3D"http://canopenter=
m_2.03.bb" rel=3D"noreferrer" target=3D"_blank">canopenterm_2.03.bb</a><br>
index 0e8a7a1c8a..0ee94bb052 100644<br>
--- a/meta-oe/recipes-extended/canopenterm/<a href=3D"http://canopenterm_2.=
02.bb" rel=3D"noreferrer" target=3D"_blank">canopenterm_2.02.bb</a><br>
+++ b/meta-oe/recipes-extended/canopenterm/<a href=3D"http://canopenterm_2.=
03.bb" rel=3D"noreferrer" target=3D"_blank">canopenterm_2.03.bb</a><br>
@@ -11,14 +11,12 @@ HOMEPAGE =3D &quot;<a href=3D"https://canopenterm.de" r=
el=3D"noreferrer" target=3D"_blank">https://canopenterm.de</a>&quot;<br>
=C2=A0BUGTRACKER =3D &quot;<a href=3D"https://github.com/CANopenTerm/CANope=
nTerm/issues" rel=3D"noreferrer" target=3D"_blank">https://github.com/CANop=
enTerm/CANopenTerm/issues</a>&quot;<br>
<br>
=C2=A0LICENSE =3D &quot;MIT&quot;<br>
-LIC_FILES_CHKSUM =3D &quot;file://LICENSE.md;md5=3Dbd2edc721b4a0289efe949b=
dbe7dda79&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://LICENSE.md;md5=3D8977ecf3af54da2a5271158=
cc969bd45&quot;<br>
<br>
=C2=A0DEPENDS =3D &quot;canvenient cjson isocline libinih libsdl3 lua pocke=
tpy&quot;<br>
<br>
-PV .=3D &quot;+git&quot;<br>
-<br>
-SRC_URI =3D &quot;git://<a href=3D"http://github.com/CANopenTerm/CANopenTe=
rm.git;protocol=3Dhttps;branch=3Dmain" rel=3D"noreferrer" target=3D"_blank"=
>github.com/CANopenTerm/CANopenTerm.git;protocol=3Dhttps;branch=3Dmain</a>&=
quot;<br>
-SRCREV=C2=A0 =3D &quot;7a9466029a6e88345e65e794ff1779f778c9358a&quot;<br>
+SRC_URI =3D &quot;git://<a href=3D"http://github.com/CANopenTerm/CANopenTe=
rm.git;protocol=3Dhttps;branch=3Dmain;tag=3Dv$%7BPV%7D" rel=3D"noreferrer" =
target=3D"_blank">github.com/CANopenTerm/CANopenTerm.git;protocol=3Dhttps;b=
ranch=3Dmain;tag=3Dv${PV}</a>&quot;<br>
+SRCREV=C2=A0 =3D &quot;63ccae8262f5e796ffca0c8a44fdf7ff0bd28571&quot;<br>
<br>
<br></blockquote><div><br></div><div>this version dropped the hunk against =
do_install. Is this intentional ?</div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
=C2=A0inherit cmake ptest<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#128018): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/128018" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/128018</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/120110277/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/120110277/1997914</a><br>
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

--000000000000a248d20655c39163--

