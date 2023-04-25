Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2381AC6FD18
	for <webhook@archiver.kernel.org>; Tue, 25 Apr 2023 15:22:49 +0000 (UTC)
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
 by mx.groups.io with SMTP id smtpd.web10.82631.1682436166237818223
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Apr 2023 08:22:46 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=PWWCpaBO;
 spf=pass (domain: gmail.com, ip: 209.85.161.54, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-546db536a6bso3155326eaf.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 25 Apr 2023 08:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682436165; x=1685028165;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/m6nqZFw/5+usU9LJPZiPHP2hTDsN/jwdFp1JfuhE/k=;
        b=PWWCpaBOTP+QLGE3/isA1qO6RFpd1Crh3HOrCsQS684/xaIbEw+hY7FcbGClBy26+X
         R0ZUdD8E+YbKlZaJR7MUKmjrx6zGXEUNqDGPNnKNRHzsULh+8igSdyJou+s437YNxrXv
         zzjqhUtHOE+reN6QDyHzhNKA3cK7ScU5WLGmxPqz7WYSW11aXr8/sz+BUIDpqNPHUYDl
         jkjjACJZPH8J/6tjXIyXPz5xGIXoXprsb32RwcYw+6sE4Sqr0JRezsSv3Cs0wKVFksq4
         2LB0vIN3Sz1o1OwuWKpJ771YgFBVSFtf08xZJCk6TuleG+SiAYxLMoUJdnYqwRiv2idR
         qhyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682436165; x=1685028165;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/m6nqZFw/5+usU9LJPZiPHP2hTDsN/jwdFp1JfuhE/k=;
        b=Oe+3UWwLqTnWs1aGM4fXNfaz4duphJ2H7XZKPkJY4qJYvLDsJIHDzrIIEQulW+xHfU
         Vp7EbmUBRUdwXlQBnf/FuMPJHdUBMF47hZlqlbVJCaWvYAfIj7yrxN/hESiJUUvjZPGU
         NX2o7u9MDzpcSy/ARmmPxvIpKtSaRQgW8zLPkJLSLBO4fXEaujFj0ANUZrkRUgt0K1dN
         wU8nIgE8KoweBtVzZW1XDn1jET40miafiPKByVjJee7Sb4UPiQznn4c7Cl0+Gt5BLuTR
         oiUVZA6eQJ4A2RLzki5ALVV2a7gxPXAGDfUe6bN5F+QhL87k1XNPj7yzI6a1FBEw+RIJ
         874Q==
X-Gm-Message-State: AAQBX9f6BdH/v+Ix0F/AGi62WccTqp41BR0hBnR+eCsx5rC7nZmJsakt
	9rihQwVHR/4xoxhwwebHQ1SMuklQIKhuFytTlVvptirKN+0=
X-Google-Smtp-Source: AKy350bn2qGjsF4kRjDsD+oRUWftnJBaFk+nurPbXBcYFPrwwfsuXI4tn6hoLI8p65in3DEpiyIC8oZvHsJrLctfwCg=
X-Received: by 2002:a4a:e0d1:0:b0:547:8545:acaf with SMTP id
 e17-20020a4ae0d1000000b005478545acafmr3594530oot.7.1682436165272; Tue, 25 Apr
 2023 08:22:45 -0700 (PDT)
MIME-Version: 1.0
References: <20230419133608.21415-1-valeria.petrov@spinetix.com>
 <ZR0P278MB0379D116A3DF0347A89767E0F1679@ZR0P278MB0379.CHEP278.PROD.OUTLOOK.COM>
 <GV0P278MB037292CCD7795E4475D80CCDF1679@GV0P278MB0372.CHEP278.PROD.OUTLOOK.COM>
 <GV0P278MB0372BC3906CEF8665DCB3796F1679@GV0P278MB0372.CHEP278.PROD.OUTLOOK.COM>
 <CAMKF1sp+uVAmX71kHp848ECD0HJU6eeOGnrFqP+=g7Ec29ZWcQ@mail.gmail.com> <ZR0P278MB037961755FD5E7A3AC9B3B0DF1649@ZR0P278MB0379.CHEP278.PROD.OUTLOOK.COM>
In-Reply-To: <ZR0P278MB037961755FD5E7A3AC9B3B0DF1649@ZR0P278MB0379.CHEP278.PROD.OUTLOOK.COM>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 25 Apr 2023 08:22:03 -0700
Message-ID: <CAMKF1spHFXPLwiQp1N1HTpn71Y_gSemFBYsBQPoUafoV0_xFdA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][master][mickledore][langdale][kirkstone][dunfell][PATCH]
 apache2: upgrade 2.4.56 -> 2.4.57
To: Valeria Petrov <Valeria.Petrov@spinetix.com>
Cc: "openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Apr 2023 15:22:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102189

Thanks, The patch still would not apply cleanly on master-next, I have
manually fixed the conflicts and staged it on master-next this time.
See
https://git.openembedded.org/meta-openembedded/commit/?h=3Dmaster-next&id=
=3D0b9305faa29f6e26871e7662391efbaae4ae92d9

I see that it is missing Signed-off-by from the submitter as well, so
in future keep that in mind. You can send a v3 with this. Or I can
also add your sign-off to existing patch if
you approve of it. Also read through below it is helpful in submission stuf=
f.

https://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded

On Tue, Apr 25, 2023 at 2:57=E2=80=AFAM Valeria Petrov
<Valeria.Petrov@spinetix.com> wrote:
>
> Hello Khem,
>
> Thank you for your response.
>
> Indeed, I verified the patch from my duplicate mail sent on 2023-04-24 an=
d I found the same problems.
>
> However, the correct version of the patch is the one I sent in my first m=
essage (on 2023-04-19) to the mailing list, which you can find at the follo=
wing link:
> https://patchwork.yoctoproject.org/project/oe/patch/20230419133608.21415-=
1-valeria.petrov@spinetix.com/
>
> Please disregard the two emails I sent on 2023-04-24, as they contain err=
ors. The correct version of the patch is the one I sent on 2023-04-19.
>
> Please let me know if you if you have the same problems with this one.
>
> Thank you for your understanding and apologies for any confusion caused.
>
> Best regards,
> Valeria
>
>
> -----Original Message-----
> From: Khem Raj <raj.khem@gmail.com>
> Sent: Monday, 24 April 2023 18:19
> To: Valeria Petrov <Valeria.Petrov@spinetix.com>
> Cc: openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] [meta-oe][master][mickledore][langdale][kirkstone][dunf=
ell][PATCH] apache2: upgrade 2.4.56 -> 2.4.57
>
> Hello Valeria
>
> Thanks for your contribution. I tried to apply this patch and it can not =
be applied. Perhaps your email agent is not set up correctly or something. =
Secondly, the Upstream-Status in the patch seems to be edited to point to s=
ome intermediate URL as well. Please try to address it and send a v2.
>
> Thanks
> -Khem
>
> On Mon, Apr 24, 2023 at 8:13=E2=80=AFAM Valeria Petrov via lists.openembe=
dded.org <valeria.petrov=3Dspinetix.com@lists.openembedded.org> wrote:
> >
> > Hello,
> >
> > Sorry for the for any inconvenience caused by my duplicate email.
> > Unfortunately, it appears that the email got stuck or did not go throug=
h due to technical issues, and I was not sure if you received it.
> >
> > Thank you for your understanding.
> >
> > Best regards,
> > Valeria
> >
> > -----Original Message-----
> > From: Valeria Petrov <Valeria.Petrov@spinetix.com>
> > Sent: Monday, 24 April 2023 16:30
> > To: openembedded-devel@lists.openembedded.org
> > Cc: Valeria Petrov <Valeria.Petrov@spinetix.com>
> > Subject:
> > [meta-oe][master][mickledore][langdale][kirkstone][dunfell][PATCH]
> > apache2: upgrade 2.4.56 -> 2.4.57
> >
> > Changelog:
> > Changes with Apache 2.4.57
> >
> >   *) mod_proxy: Check before forwarding that a nocanon path has not bee=
n
> >      rewritten with spaces during processing.  [Yann Ylavic]
> >
> >   *) mod_proxy: In case that AllowEncodedSlashes is set to NoDecode do =
not
> >      double encode encoded slashes in the URL sent by the reverse proxy=
 to the
> >      backend. [Ruediger Pluem]
> >
> >   *) mod_http2: fixed a crash during connection termination. See PR 665=
39.
> >      [Stefan Eissing]
> >
> >   *) mod_rewrite: Fix a 2.4.56 regression for substitutions ending
> >      in a question mark. PR66547. [Eric Covener]
> >
> >   *) mod_rewrite: Add "BCTLS" and "BNE" RewriteRule flags. Re-allow enc=
oded
> >      characters on redirections without the "NE" flag.
> >      [Yann Ylavic, Eric Covener]
> >
> >   *) mod_proxy: Fix double encoding of the uri-path of the request forw=
arded
> >      to the origin server, when using mapping=3Dencoded|servlet.  [Yann
> > Ylavic]
> >
> >   *) mod_mime: Do not match the extention against possible query string
> >      parameters in case ProxyPass was used with the nocanon option.
> >      [Ruediger Pluem]
> >
> > New patch:
> > 0011-modules-mappers-config9.m4-Add-server-directory-to-i.patch
> > Accepted in upstream, expected to be removed at next apache2 2.4.58 upd=
ate.
> > ---
> >  ...config9.m4-Add-server-directory-to-i.patch | 31
> > +++++++++++++++++++  .../{apache2_2.4.56.bb =3D> apache2_2.4.57.bb}  |
> > 3 +-
> >  2 files changed, 33 insertions(+), 1 deletion(-)  create mode 100644
> > meta-webserver/recipes-httpd/apache2/apache2/0011-modules-mappers-conf
> > ig9.m4-Add-server-directory-to-i.patch
> >  rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.56.bb =3D>
> > apache2_2.4.57.bb} (98%)
> >
> > diff --git
> > a/meta-webserver/recipes-httpd/apache2/apache2/0011-modules-mappers-co
> > nfig9.m4-Add-server-directory-to-i.patch
> > b/meta-webserver/recipes-httpd/apache2/apache2/0011-modules-mappers-co
> > nfig9.m4-Add-server-directory-to-i.patch
> > new file mode 100644
> > index 000000000..996eabf58
> > --- /dev/null
> > +++ b/meta-webserver/recipes-httpd/apache2/apache2/0011-modules-mapper
> > +++ s- config9.m4-Add-server-directory-to-i.patch
> > @@ -0,0 +1,31 @@
> > +From 5c9257fa34335ff83f7c01581cf953111072a457 Mon Sep 17 00:00:00
> > +2001
> > +From: Valeria Petrov <valeria.petrov@spinetix.com>
> > +Date: Tue, 18 Apr 2023 15:38:53 +0200
> > +Subject: [PATCH] * modules/mappers/config9.m4: Add 'server' directory
> > +to  include path if mod_rewrite is enabled.
> > +
> > +Upstream-Status: Accepted
> > +[https://eur02.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fs=
vn%2F&data=3D05%7C01%7Cvaleria.petrov%40spinetix.com%7C0f09fbe9c0374ced402d=
08db44dfaf43%7C5f4034faed2d4840a93facb1e9633b93%7C0%7C0%7C63817949973871006=
6%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1ha=
WwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3DrbE4pwjYo%2FhH%2BPR8QyrnSkYkyuRQI=
tudgM6VB5fs4EQ%3D&reserved=3D0.
> > +apache.org%2Fviewvc%3Fview%3Drevision%26revision%3D1909241&data=3D05%7=
C
> > +01
> > +%7Cvaleria.petrov%40spinetix.com%7Cdd425f6a28c44f7070f008db40db139b%7
> > +C5
> > +f4034faed2d4840a93facb1e9633b93%7C0%7C0%7C638175081881994084%7CUnknow
> > +n%
> > +7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJ
> > +XV
> > +CI6Mn0%3D%7C3000%7C%7C%7C&sdata=3DXR38OeEdzVwgIAn0s32t%2F%2BkxnRFiIv1l=
2
> > +ne
> > +51BIRcwA%3D&reserved=3D0]
> > +
> > +---
> > + modules/mappers/config9.m4 | 5 +++++
> > + 1 file changed, 5 insertions(+)
> > +
> > +diff --git a/modules/mappers/config9.m4 b/modules/mappers/config9.m4
> > +index 55a97ab993..7120b729b7 100644
> > +--- a/modules/mappers/config9.m4
> > ++++ b/modules/mappers/config9.m4
> > +@@ -14,6 +14,11 @@ APACHE_MODULE(userdir, mapping of requests to
> > +user-specific directories, , , mos  APACHE_MODULE(alias, mapping of
> > +requests to different filesystem parts, , , yes)
> > +APACHE_MODULE(rewrite, rule based URL manipulation, , , most)
> > +
> > ++if test "x$enable_rewrite" !=3D "xno"; then
> > ++    # mod_rewrite needs test_char.h
> > ++    APR_ADDTO(INCLUDES, [-I\$(top_builddir)/server]) fi
> > ++
> > + APR_ADDTO(INCLUDES, [-I\$(top_srcdir)/$modpath_current])
> > +
> > + APACHE_MODPATH_FINISH
> > +--
> > +2.25.1
> > +
> > diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.56.bb
> > b/meta-webserver/recipes-httpd/apache2/apache2_2.4.57.bb
> > similarity index 98%
> > rename from meta-webserver/recipes-httpd/apache2/apache2_2.4.56.bb
> > rename to meta-webserver/recipes-httpd/apache2/apache2_2.4.57.bb
> > index ed5690a4a..669d27756 100644
> > --- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.56.bb
> > +++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.57.bb
> > @@ -15,6 +15,7 @@ SRC_URI =3D "${APACHE_MIRROR}/httpd/httpd-${PV}.tar.b=
z2 \
> >             file://0007-apache2-allow-to-disable-selinux-support.patch =
\
> >             file://0008-Fix-perl-install-directory-to-usr-bin.patch \
> >
> > file://0009-support-apxs.in-force-destdir-to-be-empty-string.patch \
> > +
> > + file://0011-modules-mappers-config9.m4-Add-server-directory-to-i.pat
> > + ch
> > + \
> >            "
> >
> >  SRC_URI:append:class-target =3D " \
> > @@ -26,7 +27,7 @@ SRC_URI:append:class-target =3D " \
> >             "
> >
> >  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dbddeddfac80b2c9a882241d008b=
b41c3"
> > -SRC_URI[sha256sum] =3D "d8d45f1398ba84edd05bb33ca7593ac2989b17cb9c7a0c=
afe5442d41afdb2d7c"
> > +SRC_URI[sha256sum] =3D "dbccb84aee95e095edfbb81e5eb926ccd24e6ada55dcd8=
3caecb262e5cf94d2a"
> >
> >  S =3D "${WORKDIR}/httpd-${PV}"
> >
> > --
> > 2.25.1
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#102182):
> > https://eur02.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flis=
t
> > s.openembedded.org%2Fg%2Fopenembedded-devel%2Fmessage%2F102182&data=3D0=
5
> > %7C01%7Cvaleria.petrov%40spinetix.com%7C0f09fbe9c0374ced402d08db44dfaf
> > 43%7C5f4034faed2d4840a93facb1e9633b93%7C0%7C0%7C638179499738710066%7CU
> > nknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1ha
> > WwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3DQtSzHsPeMyIRfMR96OfzKmzVBOdZi=
%
> > 2F72qa33rO8qO%2FA%3D&reserved=3D0 Mute This Topic:
> > https://eur02.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flis=
t
> > s.openembedded.org%2Fmt%2F98471662%2F1997914&data=3D05%7C01%7Cvaleria.p=
e
> > trov%40spinetix.com%7C0f09fbe9c0374ced402d08db44dfaf43%7C5f4034faed2d4
> > 840a93facb1e9633b93%7C0%7C0%7C638179499738710066%7CUnknown%7CTWFpbGZsb
> > 3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%
> > 7C3000%7C%7C%7C&sdata=3DPv%2BW8M0XwqJpzrLpAJImeTOfX%2Fz7HUaFJptqjWVHn8U=
%
> > 3D&reserved=3D0 Group Owner:
> > openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe:
> > https://eur02.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flis=
t
> > s.openembedded.org%2Fg%2Fopenembedded-devel%2Funsub&data=3D05%7C01%7Cva=
l
> > eria.petrov%40spinetix.com%7C0f09fbe9c0374ced402d08db44dfaf43%7C5f4034
> > faed2d4840a93facb1e9633b93%7C0%7C0%7C638179499738710066%7CUnknown%7CTW
> > FpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6
> > Mn0%3D%7C3000%7C%7C%7C&sdata=3D1fmGiVvzssK9kBhj3Ax8Y7QcZhca0spDKlJJS92t=
b
> > GQ%3D&reserved=3D0 [raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >

