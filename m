Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2408DCEE339
	for <webhook@archiver.kernel.org>; Tue, 18 Nov 2025 16:20:10 +0000 (UTC)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.963.1763482805738825955
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Nov 2025 08:20:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VUqcQKEf;
 spf=pass (domain: gmail.com, ip: 209.85.128.173, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-787ff3f462bso65569607b3.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 08:20:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763482805; x=1764087605; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4jJzOOlw361L2nXMcfEpyatlXAClDwDdTJh0AV76Pz4=;
        b=VUqcQKEfV+NI0xwvzR6/I14ooAzAGz18VYQguZBnDJ49HO3QLoW68QTBgzmkKw/lxd
         16C0CFVmEwn01gVv9faPK0KS/nT0N6isA3KixeY6hxn1X5Cdl7oZFy1J6TApKU6YLauA
         ZlwzPiF/REO8PWtidfT01ipB6UbytHvC9mBZIKkaIRPEoCVRdtRO6tUIoiMglf0/DojU
         R71pmAJc8mtAosaOvcqutGyLfEPxXanVMC17WA4I9SJOuquRu5CNDg5073K6LMotXpd0
         x1YrMV7zSxdS1Cz9Ed8OjjVE70o4DimngWVs7f9WPKZRu8VAmcPPYojOJv1K4yQq9SJj
         g9RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763482805; x=1764087605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4jJzOOlw361L2nXMcfEpyatlXAClDwDdTJh0AV76Pz4=;
        b=DWQa2EQbbmZoIdWnqC3QRpj/BS355Lu+HLyBY+y8xnAwv2HSLGFQ2f2WSG0y97iAqf
         aXQNxAy1fIsVPOxTnCbmklUYGwyMcTGfMojXu76ShftiQBopzd/oneCCJie5ghx1rF4G
         iobAqZ1SjQfWde7YJ+O1YMvvvYKFpY6ImmZn9DV3vYBd7Z4w35zC5dw2ucuRYOB2O/Ot
         +NCrHJBVR/ecejPME0HUJhIC7BClKn+pD/KRYiD2Ik1ZeI0NAow+WXwwJk/H5zOt0EL5
         oy1JKGYAKmr6bA306zmZHNqOU8yta1YCKf0NHgXXC/WATSbTxiroJDcBS09iESlQLF64
         zlzQ==
X-Gm-Message-State: AOJu0YxeDM32h+WWGCXbwyS0KRqrFNyNsl4imkIOf0fS+eOPGWa1sx1D
	mRIFsFWqGUXciWAamnwsZDHUUK16wpv7TuA2fRFvrDGtKPenYF31HrREue7CKVmI5SgXd4VJsoH
	coPibBGpCTbhDzxVttORK/4HfrcKEyew=
X-Gm-Gg: ASbGncv9igjv2kqkuFSD8jiBl1/Kg+WGZVbMWRY/9LGIBjmmNIEKn9cwA/pwG+q2mca
	1XRlzDndtLyaaRuGbojBDS9nuEvOc9t1PseUbnl5GoaXTUzw/YZXa5Si/ED8ToN4P6MfbLEvB7r
	bd0fQQYeyIVzBgDkhRhDRLeL1rsDwsrSOLj0iumUCoEUHAOAIrGNwQu5kGViPC1QQ8kzJRj6oni
	f7bPbHGBGL8lYg0ZhCQWynKHT/unGSuJJAL8Rt/KkD189wzAfrI9i/aYI4sSnWlkh4zA1bBhd23
	n0HplFiE8lTHnY76VLwozS8M73ROx20+P1qBqsdvdBI6raNwZ5oCpn2/SiUjnl1N68XD2OSQ29w
	cWjCK2aDI+hfbUtUfINLOTg==
X-Google-Smtp-Source: AGHT+IHJBCNqKhBXSW60sPcAbkyCAXTZNHLSj+XbTSCGokFx4vCieDAXmJIXToJkxtMtal/Y5OErqpBO19yQbZ7w6mc=
X-Received: by 2002:a05:690e:169b:b0:63f:b49c:6116 with SMTP id
 956f58d0204a3-642ebb8e184mr35693d50.23.1763482804716; Tue, 18 Nov 2025
 08:20:04 -0800 (PST)
MIME-Version: 1.0
References: <20251118025448.952479-1-ankur.tyagi85@gmail.com> <20251118025448.952479-2-ankur.tyagi85@gmail.com>
In-Reply-To: <20251118025448.952479-2-ankur.tyagi85@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 18 Nov 2025 08:19:38 -0800
X-Gm-Features: AWmQ_bl_2u0A6Np5gSuey_YaDfBnx8v01l8pKBErVj-M6aUoNy4ctPDEWDlXHmw
Message-ID: <CAMKF1sqEFDtRnmHU=97FUDxvHV_x1zSCGb_cvV9Xohs0cEkmzQ@mail.gmail.com>
Subject: Re: [oe][meta-oe][PATCH v2 2/2] smarty: upgrade 5.4.5 -> 5.4.6
To: ankur.tyagi85@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000002488a30643e0d628"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 16:20:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121863

--0000000000002488a30643e0d628
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

some builds are failing

https://errors.yoctoproject.org/Errors/Details/888473/

On Mon, Nov 17, 2025 at 6:55=E2=80=AFPM Ankur Tyagi via lists.openembedded.=
org
<ankur.tyagi85=3Dgmail.com@lists.openembedded.org> wrote:

> From: Ankur Tyagi <ankur.tyagi85@gmail.com>
>
> Changelog:
> https://github.com/smarty-php/smarty/blob/v5.6.0/CHANGELOG.md
>
> Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> ---
> changes in v2:
> - CVE_PRODUCT change in a separate patch
> ---
>  .../recipes-support/smarty/{smarty_5.4.5.bb =3D> smarty_5.4.6.bb} | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-oe/recipes-support/smarty/{smarty_5.4.5.bb =3D> smarty_5.4.6=
.bb}
> (95%)
>
> diff --git a/meta-oe/recipes-support/smarty/smarty_5.4.5.bb
> b/meta-oe/recipes-support/smarty/smarty_5.4.6.bb
> similarity index 95%
> rename from meta-oe/recipes-support/smarty/smarty_5.4.5.bb
> rename to meta-oe/recipes-support/smarty/smarty_5.4.6.bb
> index 7f99b9b5d7..88afc55c15 100644
> --- a/meta-oe/recipes-support/smarty/smarty_5.4.5.bb
> +++ b/meta-oe/recipes-support/smarty/smarty_5.4.6.bb
> @@ -12,7 +12,7 @@ LIC_FILES_CHKSUM =3D
> "file://LICENSE;md5=3D2c0f216b2120ffc367e20f2b56df51b3"
>
>  SRC_URI =3D "git://
> github.com/smarty-php/smarty.git;protocol=3Dhttps;branch=3Dmaster;tag=3Dv=
${PV}
> <http://github.com/smarty-php/smarty.git;protocol=3Dhttps;branch=3Dmaster=
;tag=3Dv$%7BPV%7D>
> "
>
> -SRCREV =3D "e26f82d02c4d18fc82094c28fbc65f711e39ed5d"
> +SRCREV =3D "1fc41e385da8a27a87bec5914392ab662a7bb8ec"
>
>
>  INHIBIT_DEFAULT_DEPS =3D "1"
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#121803):
> https://lists.openembedded.org/g/openembedded-devel/message/121803
> Mute This Topic: https://lists.openembedded.org/mt/116350977/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000002488a30643e0d628
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">some builds are failing<div><br></div><div><a href=3D"http=
s://errors.yoctoproject.org/Errors/Details/888473/">https://errors.yoctopro=
ject.org/Errors/Details/888473/</a></div></div><br><div class=3D"gmail_quot=
e gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Nov =
17, 2025 at 6:55=E2=80=AFPM Ankur Tyagi via <a href=3D"http://lists.openemb=
edded.org">lists.openembedded.org</a> &lt;ankur.tyagi85=3D<a href=3D"mailto=
:gmail.com@lists.openembedded.org">gmail.com@lists.openembedded.org</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: An=
kur Tyagi &lt;<a href=3D"mailto:ankur.tyagi85@gmail.com" target=3D"_blank">=
ankur.tyagi85@gmail.com</a>&gt;<br>
<br>
Changelog:<br>
<a href=3D"https://github.com/smarty-php/smarty/blob/v5.6.0/CHANGELOG.md" r=
el=3D"noreferrer" target=3D"_blank">https://github.com/smarty-php/smarty/bl=
ob/v5.6.0/CHANGELOG.md</a><br>
<br>
Signed-off-by: Ankur Tyagi &lt;<a href=3D"mailto:ankur.tyagi85@gmail.com" t=
arget=3D"_blank">ankur.tyagi85@gmail.com</a>&gt;<br>
---<br>
changes in v2:<br>
- CVE_PRODUCT change in a separate patch<br>
---<br>
=C2=A0.../recipes-support/smarty/{<a href=3D"http://smarty_5.4.5.bb" rel=3D=
"noreferrer" target=3D"_blank">smarty_5.4.5.bb</a> =3D&gt; <a href=3D"http:=
//smarty_5.4.6.bb" rel=3D"noreferrer" target=3D"_blank">smarty_5.4.6.bb</a>=
} | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
=C2=A0rename meta-oe/recipes-support/smarty/{<a href=3D"http://smarty_5.4.5=
.bb" rel=3D"noreferrer" target=3D"_blank">smarty_5.4.5.bb</a> =3D&gt; <a hr=
ef=3D"http://smarty_5.4.6.bb" rel=3D"noreferrer" target=3D"_blank">smarty_5=
.4.6.bb</a>} (95%)<br>
<br>
diff --git a/meta-oe/recipes-support/smarty/<a href=3D"http://smarty_5.4.5.=
bb" rel=3D"noreferrer" target=3D"_blank">smarty_5.4.5.bb</a> b/meta-oe/reci=
pes-support/smarty/<a href=3D"http://smarty_5.4.6.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">smarty_5.4.6.bb</a><br>
similarity index 95%<br>
rename from meta-oe/recipes-support/smarty/<a href=3D"http://smarty_5.4.5.b=
b" rel=3D"noreferrer" target=3D"_blank">smarty_5.4.5.bb</a><br>
rename to meta-oe/recipes-support/smarty/<a href=3D"http://smarty_5.4.6.bb"=
 rel=3D"noreferrer" target=3D"_blank">smarty_5.4.6.bb</a><br>
index 7f99b9b5d7..88afc55c15 100644<br>
--- a/meta-oe/recipes-support/smarty/<a href=3D"http://smarty_5.4.5.bb" rel=
=3D"noreferrer" target=3D"_blank">smarty_5.4.5.bb</a><br>
+++ b/meta-oe/recipes-support/smarty/<a href=3D"http://smarty_5.4.6.bb" rel=
=3D"noreferrer" target=3D"_blank">smarty_5.4.6.bb</a><br>
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D2c0f216b2=
120ffc367e20f2b56df51b3&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://github.com/smarty-php/smart=
y.git;protocol=3Dhttps;branch=3Dmaster;tag=3Dv$%7BPV%7D" rel=3D"noreferrer"=
 target=3D"_blank">github.com/smarty-php/smarty.git;protocol=3Dhttps;branch=
=3Dmaster;tag=3Dv${PV}</a>&quot;<br>
<br>
-SRCREV =3D &quot;e26f82d02c4d18fc82094c28fbc65f711e39ed5d&quot;<br>
+SRCREV =3D &quot;1fc41e385da8a27a87bec5914392ab662a7bb8ec&quot;<br>
<br>
<br>
=C2=A0INHIBIT_DEFAULT_DEPS =3D &quot;1&quot;<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#121803): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/121803" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/121803</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/116350977/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/116350977/1997914</a><br>
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

--0000000000002488a30643e0d628--

