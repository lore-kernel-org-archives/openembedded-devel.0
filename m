Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7908C7618E
	for <webhook@archiver.kernel.org>; Mon, 24 Apr 2023 16:19:32 +0000 (UTC)
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
 by mx.groups.io with SMTP id smtpd.web10.56289.1682353170471697916
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 24 Apr 2023 09:19:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=W2xcfjnu;
 spf=pass (domain: gmail.com, ip: 209.85.161.43, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-5422726207fso1374382eaf.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 24 Apr 2023 09:19:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682353170; x=1684945170;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jhVVCC3Kkc1eOGsgXaHPARhWwskl1cnS0G/Jk4aCpHc=;
        b=W2xcfjnujQT4NahpwD3D0dRNexScdTwPmaop6FWngKXho11DXivwOnw24018Kowy0r
         Ll9sfZLsStFR7XOROPN7BImuRfZ7jzokmz7JA5K9zkhBN/TN35zYOkCmyCmsLbjij5FB
         e98zxCoPFE9vNEvxhZeY+7Bidy6+d8xG8qzbANPvIh57xjboQGtk0vct8JQJb1due5Zy
         gmMZYCDIQ7MNL8U6SAoVD+Mv3qJMOvIOzbkY0ynzKp4sJoLNkOL9Ws0iJKTWbDCXB0E+
         0IezKhwokLHWSh5tK1Xr50c5FXc7BPDCPNjrjKj4ZqhblYkMMoHWDA7gwTKT5T4lSjlU
         VKCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682353170; x=1684945170;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jhVVCC3Kkc1eOGsgXaHPARhWwskl1cnS0G/Jk4aCpHc=;
        b=GYXot1id7RA9WmkHWoiuobQummZkOj9T6AsGhH+Qv3ukog+EETQvHQ1HDyRTdk3fCW
         Eh++WVMydVBTL++1r4IztDDo9nd/Yfqf0MTFK55omby5fC/PqAG3lvyQCQsYxSYPfMrg
         EkoN2n6LvKiKboCgkoqQska/4UzxerC0VXGoBVhAP4dauXcWqfYdted0tLpXAgrD43/B
         RS+kfcgueinljZfzEP4BnTfgVaImfjfDj5M0/dtd3zJt4+9+RtH02/u4W10cZNTeeeju
         mEQMYkxX/9HPH7PzaYSF9rWhFri4NLlZjw9A56v+g1iPhoOSPG6YiLHH/I4x3Q3cXxvK
         6WpA==
X-Gm-Message-State: AAQBX9fR4Si6OCAgClttNWnatFmrvr6pCyxZH10xuBK4wepuxZjHIPGG
	YfDHzmVhvvVSy47YU0DC1RgPaH3cos6B4T7llLuNOpjM
X-Google-Smtp-Source: AKy350ZO0oZ8Bf7OK86sZz4v07xUrY5UCj7tsWkwYTM4ZmAEs9VWTmVpFaWIWOGEGUCnC3PU9d/b0I60idMl7yIT9z0=
X-Received: by 2002:a4a:b988:0:b0:547:6105:e096 with SMTP id
 e8-20020a4ab988000000b005476105e096mr4785934oop.7.1682353168817; Mon, 24 Apr
 2023 09:19:28 -0700 (PDT)
MIME-Version: 1.0
References: <20230419133608.21415-1-valeria.petrov@spinetix.com>
 <ZR0P278MB0379D116A3DF0347A89767E0F1679@ZR0P278MB0379.CHEP278.PROD.OUTLOOK.COM>
 <GV0P278MB037292CCD7795E4475D80CCDF1679@GV0P278MB0372.CHEP278.PROD.OUTLOOK.COM>
 <GV0P278MB0372BC3906CEF8665DCB3796F1679@GV0P278MB0372.CHEP278.PROD.OUTLOOK.COM>
In-Reply-To: <GV0P278MB0372BC3906CEF8665DCB3796F1679@GV0P278MB0372.CHEP278.PROD.OUTLOOK.COM>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 24 Apr 2023 09:19:02 -0700
Message-ID: <CAMKF1sp+uVAmX71kHp848ECD0HJU6eeOGnrFqP+=g7Ec29ZWcQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][master][mickledore][langdale][kirkstone][dunfell][PATCH]
 apache2: upgrade 2.4.56 -> 2.4.57
To: valeria.petrov@spinetix.com
Cc: "openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 24 Apr 2023 16:19:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102183

Hello Valeria

Thanks for your contribution. I tried to apply this patch and it can
not be applied. Perhaps your email agent is not set up correctly or
something. Secondly, the Upstream-Status in the patch
seems to be edited to point to some intermediate URL as well. Please
try to address it and send a v2.

Thanks
-Khem

On Mon, Apr 24, 2023 at 8:13=E2=80=AFAM Valeria Petrov via
lists.openembedded.org
<valeria.petrov=3Dspinetix.com@lists.openembedded.org> wrote:
>
> Hello,
>
> Sorry for the for any inconvenience caused by my duplicate email.
> Unfortunately, it appears that the email got stuck or did not go through =
due to technical issues, and I was not sure if you received it.
>
> Thank you for your understanding.
>
> Best regards,
> Valeria
>
> -----Original Message-----
> From: Valeria Petrov <Valeria.Petrov@spinetix.com>
> Sent: Monday, 24 April 2023 16:30
> To: openembedded-devel@lists.openembedded.org
> Cc: Valeria Petrov <Valeria.Petrov@spinetix.com>
> Subject: [meta-oe][master][mickledore][langdale][kirkstone][dunfell][PATC=
H] apache2: upgrade 2.4.56 -> 2.4.57
>
> Changelog:
> Changes with Apache 2.4.57
>
>   *) mod_proxy: Check before forwarding that a nocanon path has not been
>      rewritten with spaces during processing.  [Yann Ylavic]
>
>   *) mod_proxy: In case that AllowEncodedSlashes is set to NoDecode do no=
t
>      double encode encoded slashes in the URL sent by the reverse proxy t=
o the
>      backend. [Ruediger Pluem]
>
>   *) mod_http2: fixed a crash during connection termination. See PR 66539=
.
>      [Stefan Eissing]
>
>   *) mod_rewrite: Fix a 2.4.56 regression for substitutions ending
>      in a question mark. PR66547. [Eric Covener]
>
>   *) mod_rewrite: Add "BCTLS" and "BNE" RewriteRule flags. Re-allow encod=
ed
>      characters on redirections without the "NE" flag.
>      [Yann Ylavic, Eric Covener]
>
>   *) mod_proxy: Fix double encoding of the uri-path of the request forwar=
ded
>      to the origin server, when using mapping=3Dencoded|servlet.  [Yann Y=
lavic]
>
>   *) mod_mime: Do not match the extention against possible query string
>      parameters in case ProxyPass was used with the nocanon option.
>      [Ruediger Pluem]
>
> New patch:
> 0011-modules-mappers-config9.m4-Add-server-directory-to-i.patch
> Accepted in upstream, expected to be removed at next apache2 2.4.58 updat=
e.
> ---
>  ...config9.m4-Add-server-directory-to-i.patch | 31 +++++++++++++++++++  =
.../{apache2_2.4.56.bb =3D> apache2_2.4.57.bb}  |  3 +-
>  2 files changed, 33 insertions(+), 1 deletion(-)  create mode 100644 met=
a-webserver/recipes-httpd/apache2/apache2/0011-modules-mappers-config9.m4-A=
dd-server-directory-to-i.patch
>  rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.56.bb =3D> apac=
he2_2.4.57.bb} (98%)
>
> diff --git a/meta-webserver/recipes-httpd/apache2/apache2/0011-modules-ma=
ppers-config9.m4-Add-server-directory-to-i.patch b/meta-webserver/recipes-h=
ttpd/apache2/apache2/0011-modules-mappers-config9.m4-Add-server-directory-t=
o-i.patch
> new file mode 100644
> index 000000000..996eabf58
> --- /dev/null
> +++ b/meta-webserver/recipes-httpd/apache2/apache2/0011-modules-mappers-
> +++ config9.m4-Add-server-directory-to-i.patch
> @@ -0,0 +1,31 @@
> +From 5c9257fa34335ff83f7c01581cf953111072a457 Mon Sep 17 00:00:00 2001
> +From: Valeria Petrov <valeria.petrov@spinetix.com>
> +Date: Tue, 18 Apr 2023 15:38:53 +0200
> +Subject: [PATCH] * modules/mappers/config9.m4: Add 'server' directory
> +to  include path if mod_rewrite is enabled.
> +
> +Upstream-Status: Accepted
> +[https://eur02.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fsvn=
%2F&data=3D05%7C01%7CValeria.Petrov%40spinetix.com%7C6df3342ffb304b51c12008=
db44d06545%7C5f4034faed2d4840a93facb1e9633b93%7C0%7C0%7C638179434059448775%=
7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWw=
iLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3DIcjd5JGgrEepxtMbJi13VCfQon2sI6LyM64=
Wm6C6%2Bl4%3D&reserved=3D0.
> +apache.org%2Fviewvc%3Fview%3Drevision%26revision%3D1909241&data=3D05%7C0=
1
> +%7Cvaleria.petrov%40spinetix.com%7Cdd425f6a28c44f7070f008db40db139b%7C5
> +f4034faed2d4840a93facb1e9633b93%7C0%7C0%7C638175081881994084%7CUnknown%
> +7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXV
> +CI6Mn0%3D%7C3000%7C%7C%7C&sdata=3DXR38OeEdzVwgIAn0s32t%2F%2BkxnRFiIv1l2n=
e
> +51BIRcwA%3D&reserved=3D0]
> +
> +---
> + modules/mappers/config9.m4 | 5 +++++
> + 1 file changed, 5 insertions(+)
> +
> +diff --git a/modules/mappers/config9.m4 b/modules/mappers/config9.m4
> +index 55a97ab993..7120b729b7 100644
> +--- a/modules/mappers/config9.m4
> ++++ b/modules/mappers/config9.m4
> +@@ -14,6 +14,11 @@ APACHE_MODULE(userdir, mapping of requests to
> +user-specific directories, , , mos  APACHE_MODULE(alias, mapping of
> +requests to different filesystem parts, , , yes) APACHE_MODULE(rewrite,
> +rule based URL manipulation, , , most)
> +
> ++if test "x$enable_rewrite" !=3D "xno"; then
> ++    # mod_rewrite needs test_char.h
> ++    APR_ADDTO(INCLUDES, [-I\$(top_builddir)/server]) fi
> ++
> + APR_ADDTO(INCLUDES, [-I\$(top_srcdir)/$modpath_current])
> +
> + APACHE_MODPATH_FINISH
> +--
> +2.25.1
> +
> diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.56.bb b/met=
a-webserver/recipes-httpd/apache2/apache2_2.4.57.bb
> similarity index 98%
> rename from meta-webserver/recipes-httpd/apache2/apache2_2.4.56.bb
> rename to meta-webserver/recipes-httpd/apache2/apache2_2.4.57.bb
> index ed5690a4a..669d27756 100644
> --- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.56.bb
> +++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.57.bb
> @@ -15,6 +15,7 @@ SRC_URI =3D "${APACHE_MIRROR}/httpd/httpd-${PV}.tar.bz2=
 \
>             file://0007-apache2-allow-to-disable-selinux-support.patch \
>             file://0008-Fix-perl-install-directory-to-usr-bin.patch \
>             file://0009-support-apxs.in-force-destdir-to-be-empty-string.=
patch \
> +
> + file://0011-modules-mappers-config9.m4-Add-server-directory-to-i.patch
> + \
>            "
>
>  SRC_URI:append:class-target =3D " \
> @@ -26,7 +27,7 @@ SRC_URI:append:class-target =3D " \
>             "
>
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dbddeddfac80b2c9a882241d008bb4=
1c3"
> -SRC_URI[sha256sum] =3D "d8d45f1398ba84edd05bb33ca7593ac2989b17cb9c7a0caf=
e5442d41afdb2d7c"
> +SRC_URI[sha256sum] =3D "dbccb84aee95e095edfbb81e5eb926ccd24e6ada55dcd83c=
aecb262e5cf94d2a"
>
>  S =3D "${WORKDIR}/httpd-${PV}"
>
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#102182): https://lists.openembedded.org/g/openembedde=
d-devel/message/102182
> Mute This Topic: https://lists.openembedded.org/mt/98471662/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

