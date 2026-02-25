Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F07A3F4BB9A
	for <webhook@archiver.kernel.org>; Wed, 25 Feb 2026 10:50:11 +0000 (UTC)
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.42750.1772016605063397735
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Feb 2026 02:50:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BF9r4RhH;
 spf=pass (domain: gmail.com, ip: 209.85.210.47, mailfrom: schonm@gmail.com)
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-7d195166b2cso4958965a34.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Feb 2026 02:50:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772016604; cv=none;
        d=google.com; s=arc-20240605;
        b=cuoa9AjVSi4FDuPTkmTT/a4Sf89YZpQmdbmDoEg7L24bcqk28IJ92uMZaI6dPq0yHK
         t/0H0Z8782DalomJ9p8I+J9JqD15hL61c/y9ERUU7TFbYHpKw0KCOU/qwFzqV0i38AuC
         yTUbLFgw+EMTTaXVmojrOxMJem8XvPGvoy3kA96j29fXbkPIN5HxLmz9bx4LFmp9oqKe
         PORNctxlCYHupBNcXNZHW2llpmG9YoGgk8Alp4Op+mX1sULTXw6EwlU7PdogwbRDpmm5
         6awwZ+wcaBT7Brban9uggdYRTVYP5pm36/veY2F/6fmdrL0Sib1edKfRYYVIKlEUzEt1
         3NZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cEpXR/654f5OdCQPdggI51X/YzWZa1DPGXMSzpHAnWE=;
        fh=i0UEVGX6XKvJAmzXVKuwop3O/ShkJNeDIU5NtFbZzgQ=;
        b=hWgEsPRBlp3jXHGMR9QmLDUfJ93S8+DZcECEwTR+bCPlfk+2lcIni2M4oXy04Rv413
         XGnmgRjwUQiqeTrexEzX6tmuimXTT0HGHFEkzPU0x9M3LUp0+IfBE0b3QedehF8vkrOd
         50dD85JDHrSUOVPu/bbCgC9sbBcaVmEymROb4rPbZvaqhy+V2QmwphzCZ1hgTS+YLkIF
         b2gfrXAJK+130qBOaTokjDtB+xMgV0EBPksW7fCJlPEf3+fpSsO9ygw4SRUnutX6Ekj5
         ukEzNgyQfTcwcy3WExCgRfpmlBRujbBydZu7cXqYEs4alyCiUbJwYytTAEk409IQsC2a
         WTdA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772016604; x=1772621404; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cEpXR/654f5OdCQPdggI51X/YzWZa1DPGXMSzpHAnWE=;
        b=BF9r4RhHYS0YXsypTXosW+riyAT3x+Xk1fED4EbOgnz9FfquEcaQ65F37yIAsixGq0
         rRNFYHJd+rmIiiUg/c5ubeuiDUxZTMeyHhebpjk3ObOORsjDb9ifRkgs0kSmCeevRJIb
         dVBhNECaKeNaoicP6sd6LpECUlIKAFXic5zwYTJxBy+87BZKtI/9ulRMZvZz0N1IMm2c
         B79Bp6QSZ0+JN8s3g0HHLiL+Tyr04BQpo89AUasA8tRqLCdNXU34XjYBFsCO2v3roINA
         U2E+6if02xaXm52fGEyXPzlG3d3XDSQeCgt7lA5b0NBuCe8R2GRWkuU08ngnJFy0bRvC
         UZqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772016604; x=1772621404;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cEpXR/654f5OdCQPdggI51X/YzWZa1DPGXMSzpHAnWE=;
        b=FPuE6RY6dV2Pjw+B09DNp57L2QrpwTJo3qpSpTAPNnqdn/Oi/VSOROGVRj91lJGhjQ
         qZnmZZit6+Zt54tXx6jSnQIe0w9wXqH4Bb6vsFzx+IuNV6bpJxaAESa1YZBXgAt2JO2w
         w1VBQJpnLy7aLnxsrY6hJoqjbKnlhTNvIZJYaN7C4LgHfmv2jhClQnn/y8+WkO6H3bVC
         c9/D4N6tPzVUOxwy8rnZ5/oyasZOF63wlwZlaE4e7NuHeTpVXz7u6XqeDPVIOt4I4uh2
         tDW6WuPnvPfLlDtq4L8C9Wu66jR8Wa6+MgXzbjg82mY0ozJrMvBJKlpi0QWlxblqYukj
         Hqpg==
X-Gm-Message-State: AOJu0Yx2DzmmCR6k5SxcAyy8qVJTTUkMFrRw1cPwoi7C8GxvIpPOv52r
	RrQwJVMcZlObyPMaL1aIb5kvGALQLoXntTLSYJngcvURWZPSHy56+sBolF+HleXWfrXga6aPYMw
	6wF5E6xUlpp4qfZmoukkQEbOlLmV8qEQ=
X-Gm-Gg: ATEYQzxyaGP4GivY2A0GjYzbin3n7pkHcQ+Q4UpHoyg3m7lQeQeGx0MqUImsmiqbjOQ
	w5wN2ouJ/ZcXCOq/lqnDkT5V58ofMJmxVIMwbvTNP3pAn0kVrCqZs7hd8W07zhyLJ2ZByP+DgN9
	uDiZ4RzPZGHxbbUa9SLzaYP2C0uiiG0pVjdIiZId/Oz+jzYuvmL7++M7jZXwdtBtAjSvXc6bKP/
	V8EArCSROdndXU3KwGjqosFSUSRNw1zVt479AJsT6uEv0CfREVWppHqRtN11ZZQSRXk6NhXpeKj
	smiAZEiZW0H385aOuEpNE+EDDbesxyI+q3XUr/9QgULy7lXpSKN2QcpTXFPuiVYGyHitWuYFpdi
	y/fbDL6iBaO3NqbYCZIy9xu8=
X-Received: by 2002:a05:6830:40ca:b0:7cf:cc2c:1d9f with SMTP id
 46e09a7af769-7d52bf52e93mr7917482a34.32.1772016603700; Wed, 25 Feb 2026
 02:50:03 -0800 (PST)
MIME-Version: 1.0
References: <20260221041340.1212324-1-schonm@gmail.com> <CA+s=J=y+KdF9+FT8hnrZqT4Kv=+fzcu=rdGqGOtjEiuCApqTHA@mail.gmail.com>
In-Reply-To: <CA+s=J=y+KdF9+FT8hnrZqT4Kv=+fzcu=rdGqGOtjEiuCApqTHA@mail.gmail.com>
From: "J. S." <schonm@gmail.com>
Date: Wed, 25 Feb 2026 05:49:52 -0500
X-Gm-Features: AaiRm534xEifnKJkVAWI5S5rmj6h-E8bAqv02YeFbx66cMaLWVX2uB65ljWWmR4
Message-ID: <CABTo8gCb1Y38a-UzO8Lr8yA7ZTe2v4RVGDnmWhpbnTW5UkLfDA@mail.gmail.com>
Subject: Re: [oe] [meta-perl][scarthgap][PATCH] In meta-perl, drop the
 SRC_URI[md5sum] where a SRC_URI[sha256sum] is already available.
To: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 25 Feb 2026 10:50:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124647

If you feel that the patch is inappropriate for a stable branch, it
can be dropped.  Thanks for taking the time to review it.

Jason.

On Wed, Feb 25, 2026 at 12:02=E2=80=AFAM Anuj Mittal
<anuj.mittal@oss.qualcomm.com> wrote:
>
> While this is functionally correct, why should this be done for a
> stable branch? Is there a problem that is being fixed?
>
> Thanks,
>
> Anuj
>
> On Sat, Feb 21, 2026 at 12:13=E2=80=AFPM J. S. via lists.openembedded.org
> <schonm=3Dgmail.com@lists.openembedded.org> wrote:
> >
> > This patch was generated from master
> >
> > git cherry-pick cb4a67ad2c66e6df997e3c07308819ce657229ac~..94b51dc5761b=
03fa66d6f56295c7cad55e154c15
> >
> > That showed 46 patches which were then squashed with
> >
> > git reset --soft HEAD~46
> > git commit -s
> >
> > This set is changing files only in meta-perl
> >
> > Signed-off-by: Jason Schonberg <schonm@gmail.com>
> > ---
> >  meta-perl/recipes-extended/mime-construct/mime-construct_1.11.bb | 1 -
> >  meta-perl/recipes-perl/adduser/adduser_3.118.bb                  | 1 -
> >  .../recipes-perl/libalgorithm/libalgorithm-diff-perl_1.15.bb     | 1 -
> >  meta-perl/recipes-perl/libauthen/libauthen-radius-perl_0.22.bb   | 1 -
> >  meta-perl/recipes-perl/libauthen/libauthen-sasl-perl_2.16.bb     | 1 -
> >  meta-perl/recipes-perl/libcapture/libcapture-tiny-perl_0.48.bb   | 1 -
> >  .../recipes-perl/libconfig/libconfig-autoconf-perl_0.319.bb      | 1 -
> >  meta-perl/recipes-perl/libdata/libdata-hexdump-perl_0.02.bb      | 1 -
> >  .../libdevel/libdevel-globaldestruction-perl_0.14.bb             | 1 -
> >  meta-perl/recipes-perl/libdigest/libdigest-hmac-perl_1.03.bb     | 1 -
> >  meta-perl/recipes-perl/libdigest/libdigest-sha1-perl_2.13.bb     | 1 -
> >  meta-perl/recipes-perl/libenv/libenv-perl_1.04.bb                | 1 -
> >  meta-perl/recipes-perl/liberror/liberror-perl_0.17029.bb         | 1 -
> >  .../recipes-perl/libextutils/libextutils-config-perl_0.008.bb    | 1 -
> >  .../libextutils/libextutils-installpaths-perl_0.012.bb           | 1 -
> >  .../recipes-perl/libextutils/libextutils-parsexs-perl_3.35.bb    | 1 -
> >  meta-perl/recipes-perl/libfile/libfile-slurp-perl_9999.19.bb     | 1 -
> >  meta-perl/recipes-perl/libhtml/libhtml-parser-perl_3.72.bb       | 1 -
> >  meta-perl/recipes-perl/libhtml/libhtml-tagset-perl_3.20.bb       | 1 -
> >  meta-perl/recipes-perl/libhtml/libhtml-tree-perl_5.03.bb         | 1 -
> >  meta-perl/recipes-perl/libimport/libimport-into-perl_1.002004.bb | 1 -
> >  meta-perl/recipes-perl/libio/libio-stringy-perl_2.111.bb         | 1 -
> >  meta-perl/recipes-perl/libipc/libipc-signal-perl_1.00.bb         | 1 -
> >  meta-perl/recipes-perl/liblocale/liblocale-gettext-perl_1.07.bb  | 1 -
> >  meta-perl/recipes-perl/libmodule/libmodule-pluggable-perl_5.2.bb | 1 -
> >  meta-perl/recipes-perl/libmodule/libmodule-runtime-perl_0.016.bb | 1 -
> >  meta-perl/recipes-perl/libnet/libnet-dns-sec-perl_1.10.bb        | 1 -
> >  meta-perl/recipes-perl/libnet/libnet-ldap-perl_0.68.bb           | 1 -
> >  meta-perl/recipes-perl/libnet/libnet-libidn-perl_0.12.bb         | 1 -
> >  meta-perl/recipes-perl/libnet/libnet-ssleay-perl_1.85.bb         | 1 -
> >  meta-perl/recipes-perl/libnet/libnet-telnet-perl_3.05.bb         | 1 -
> >  meta-perl/recipes-perl/libproc/libproc-waitstat-perl_1.00.bb     | 1 -
> >  meta-perl/recipes-perl/librole/librole-tiny-perl_2.002004.bb     | 1 -
> >  meta-perl/recipes-perl/libstatgrab/libunix-statgrab_0.112.bb     | 1 -
> >  .../recipes-perl/libstrictures/libstrictures-perl_2.000006.bb    | 1 -
> >  .../libsub/libsub-exporter-progressive-perl_0.001013.bb          | 1 -
> >  meta-perl/recipes-perl/libsub/libsub-uplevel-perl_0.2800.bb      | 1 -
> >  meta-perl/recipes-perl/libterm/libterm-readkey-perl_2.38.bb      | 1 -
> >  meta-perl/recipes-perl/libtest/libtest-nowarnings-perl_1.04.bb   | 1 -
> >  meta-perl/recipes-perl/libtext/libtext-charwidth-perl_0.04.bb    | 1 -
> >  meta-perl/recipes-perl/libtext/libtext-diff-perl_1.41.bb         | 1 -
> >  meta-perl/recipes-perl/libtext/libtext-iconv-perl_1.7.bb         | 1 -
> >  meta-perl/recipes-perl/libtext/libtext-wrapi18n-perl_0.06.bb     | 1 -
> >  .../libunicode/libunicode-linebreak-perl_2019.001.bb             | 1 -
> >  .../recipes-perl/libxml/libxml-filter-buffertext-perl_1.01.bb    | 1 -
> >  meta-perl/recipes-perl/libxml/libxml-sax-writer-perl_0.57.bb     | 1 -
> >  46 files changed, 46 deletions(-)
> >
> > diff --git a/meta-perl/recipes-extended/mime-construct/mime-construct_1=
.11.bb b/meta-perl/recipes-extended/mime-construct/mime-construct_1.11.bb
> > index a5d28265d7..9da2b1adf9 100644
> > --- a/meta-perl/recipes-extended/mime-construct/mime-construct_1.11.bb
> > +++ b/meta-perl/recipes-extended/mime-construct/mime-construct_1.11.bb
> > @@ -12,7 +12,6 @@ SRC_URI =3D "${CPAN_MIRROR}/authors/id/R/RO/ROSCH/mim=
e-construct-${PV}.tar.gz \
> >      file://fix-mime-construct-help-return-value.patch \
> >  "
> >
> > -SRC_URI[md5sum] =3D "73834ea780fbea81b89dbd9b2fb54f58"
> >  SRC_URI[sha256sum] =3D "4cd7bb61b51d41192d1498c1051aa6a4ccd75aeb09b71d=
2ec706a7084a4a9303"
> >
> >  inherit cpan
> > diff --git a/meta-perl/recipes-perl/adduser/adduser_3.118.bb b/meta-per=
l/recipes-perl/adduser/adduser_3.118.bb
> > index 3ac2211aa6..431b41a2dd 100644
> > --- a/meta-perl/recipes-perl/adduser/adduser_3.118.bb
> > +++ b/meta-perl/recipes-perl/adduser/adduser_3.118.bb
> > @@ -11,7 +11,6 @@ SRC_URI =3D "https://launchpad.net/debian/+archive/pr=
imary/+sourcefiles/adduser/${
> >             file://0001-adduser-set-default-shell-with-sbin-nologin.pat=
ch \
> >  "
> >
> > -SRC_URI[md5sum] =3D "44ba2475ebdaafc9613236bdda321c97"
> >  SRC_URI[sha256sum] =3D "3e9eea661c9aac6b2c791bfcc1de3a9c6a422d45c8f3d3=
8ed417737ed3166ffc"
> >
> >  S =3D "${WORKDIR}/${BPN}"
> > diff --git a/meta-perl/recipes-perl/libalgorithm/libalgorithm-diff-perl=
_1.15.bb b/meta-perl/recipes-perl/libalgorithm/libalgorithm-diff-perl_1.15.=
bb
> > index d87df0974b..1fc6048c6d 100644
> > --- a/meta-perl/recipes-perl/libalgorithm/libalgorithm-diff-perl_1.15.b=
b
> > +++ b/meta-perl/recipes-perl/libalgorithm/libalgorithm-diff-perl_1.15.b=
b
> > @@ -13,7 +13,6 @@ LICENSE =3D "Artistic-1.0 | GPL-1.0-or-later"
> >  LIC_FILES_CHKSUM =3D "file://lib/Algorithm/Diff.pm;beginline=3D406;end=
line=3D409;md5=3Dd393b8ad3b8994b9d0ae9299b8a8a1ee"
> >
> >  SRC_URI =3D "${CPAN_MIRROR}/authors/id/N/NE/NEDKONZ/Algorithm-Diff-${P=
V}.tar.gz"
> > -SRC_URI[md5sum] =3D "457cd497a0411a88b47d3741eb176071"
> >  SRC_URI[sha256sum] =3D "aa848b75ad3ecc32d31e8651909551e851cceef74a3282=
2c7a3cb35c259f5190"
> >
> >  S =3D "${WORKDIR}/Algorithm-Diff-${PV}"
> > diff --git a/meta-perl/recipes-perl/libauthen/libauthen-radius-perl_0.2=
2.bb b/meta-perl/recipes-perl/libauthen/libauthen-radius-perl_0.22.bb
> > index ee7c4d7502..4a7b576a2c 100644
> > --- a/meta-perl/recipes-perl/libauthen/libauthen-radius-perl_0.22.bb
> > +++ b/meta-perl/recipes-perl/libauthen/libauthen-radius-perl_0.22.bb
> > @@ -16,7 +16,6 @@ SRC_URI =3D "http://search.cpan.org/CPAN/authors/id/M=
/MA/MANOWAR/RadiusPerl-${PV}.
> >             file://test.pl-adjust-for-ptest.patch \
> >             file://run-ptest \
> >  "
> > -SRC_URI[md5sum] =3D "d1fe2d6ecf7ea99299e4e3a8f945aad8"
> >  SRC_URI[sha256sum] =3D "3b276506986ccaa4949d92b13ce053a0017ad11562a991=
cc753364923fe81ca7"
> >
> >  S =3D "${WORKDIR}/Authen-Radius-${PV}"
> > diff --git a/meta-perl/recipes-perl/libauthen/libauthen-sasl-perl_2.16.=
bb b/meta-perl/recipes-perl/libauthen/libauthen-sasl-perl_2.16.bb
> > index a9eec69502..531bc61cfb 100644
> > --- a/meta-perl/recipes-perl/libauthen/libauthen-sasl-perl_2.16.bb
> > +++ b/meta-perl/recipes-perl/libauthen/libauthen-sasl-perl_2.16.bb
> > @@ -14,7 +14,6 @@ RDEPENDS:${PN} =3D "libdigest-hmac-perl"
> >  SRC_URI =3D "http://www.cpan.org/authors/id/G/GB/GBARR/Authen-SASL-${P=
V}.tar.gz \
> >             file://run-ptest \
> >            "
> > -SRC_URI[md5sum] =3D "7c03a689d4c689e5a9e2f18a1c586b2f"
> >  SRC_URI[sha256sum] =3D "6614fa7518f094f853741b63c73f3627168c5d3aca89b1=
d02b1016dc32854e09"
> >
> >  S =3D "${WORKDIR}/Authen-SASL-${PV}"
> > diff --git a/meta-perl/recipes-perl/libcapture/libcapture-tiny-perl_0.4=
8.bb b/meta-perl/recipes-perl/libcapture/libcapture-tiny-perl_0.48.bb
> > index a51d327a31..43d6b03f40 100644
> > --- a/meta-perl/recipes-perl/libcapture/libcapture-tiny-perl_0.48.bb
> > +++ b/meta-perl/recipes-perl/libcapture/libcapture-tiny-perl_0.48.bb
> > @@ -15,7 +15,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D37a4918a30=
ace24395020e5b8c03b83f"
> >
> >  SRCNAME =3D "Capture-Tiny"
> >  SRC_URI =3D "${CPAN_MIRROR}/authors/id/D/DA/DAGOLDEN/${SRCNAME}-${PV}.=
tar.gz"
> > -SRC_URI[md5sum] =3D "f5d24083ad270f8326dd659dd83eeb54"
> >  SRC_URI[sha256sum] =3D "6c23113e87bad393308c90a207013e505f659274736638=
d8c79bac9c67cc3e19"
> >
> >  S =3D "${WORKDIR}/${SRCNAME}-${PV}"
> > diff --git a/meta-perl/recipes-perl/libconfig/libconfig-autoconf-perl_0=
.319.bb b/meta-perl/recipes-perl/libconfig/libconfig-autoconf-perl_0.319.bb
> > index 5c3701f16b..f4c1e5673a 100644
> > --- a/meta-perl/recipes-perl/libconfig/libconfig-autoconf-perl_0.319.bb
> > +++ b/meta-perl/recipes-perl/libconfig/libconfig-autoconf-perl_0.319.bb
> > @@ -16,7 +16,6 @@ file://${COMMON_LICENSE_DIR}/GPL-1.0-or-later;md5=3D3=
0c0b8a5048cc2f4be5ff15ef0d8cf
> >
> >  SRC_URI =3D "${CPAN_MIRROR}/authors/id/R/RE/REHSACK/Config-AutoConf-${=
PV}.tar.gz"
> >
> > -SRC_URI[md5sum] =3D "eeeab8cc93eef7dd2e2c343ecdf247b7"
> >  SRC_URI[sha256sum] =3D "304f66cc2653264c0fe127d21669e86d3d18cd72f2574d=
8f5131beec31a0a33e"
> >  RDEPENDS:${PN} +=3D "libcapture-tiny-perl"
> >  RDEPENDS:${PN} +=3D "perl-module-base"
> > diff --git a/meta-perl/recipes-perl/libdata/libdata-hexdump-perl_0.02.b=
b b/meta-perl/recipes-perl/libdata/libdata-hexdump-perl_0.02.bb
> > index 4493a7e5e5..66369df641 100644
> > --- a/meta-perl/recipes-perl/libdata/libdata-hexdump-perl_0.02.bb
> > +++ b/meta-perl/recipes-perl/libdata/libdata-hexdump-perl_0.02.bb
> > @@ -18,7 +18,6 @@ DEPENDS =3D "perl"
> >  SRC_URI =3D "http://search.cpan.org/CPAN/authors/id/F/FT/FTASSIN/Data-=
HexDump-${PV}.tar.gz \
> >             file://run-ptest \
> >  "
> > -SRC_URI[md5sum] =3D "467b7183d1062ab4a502b50c34e7d67f"
> >  SRC_URI[sha256sum] =3D "1a9d843e7f667c1c6f77c67af5d77e7462ff23b41937cb=
17454d03535cd9be70"
> >
> >  S =3D "${WORKDIR}/Data-HexDump-${PV}"
> > diff --git a/meta-perl/recipes-perl/libdevel/libdevel-globaldestruction=
-perl_0.14.bb b/meta-perl/recipes-perl/libdevel/libdevel-globaldestruction-=
perl_0.14.bb
> > index 1dcecd0dcf..e8450c7ac8 100644
> > --- a/meta-perl/recipes-perl/libdevel/libdevel-globaldestruction-perl_0=
.14.bb
> > +++ b/meta-perl/recipes-perl/libdevel/libdevel-globaldestruction-perl_0=
.14.bb
> > @@ -10,7 +10,6 @@ LICENSE =3D "Artistic-1.0 | GPL-1.0-or-later"
> >  LIC_FILES_CHKSUM =3D "file://README;beginline=3D53;endline=3D55;md5=3D=
935dadb9423774f53548e5cd5055d41a"
> >
> >  SRC_URI =3D "${CPAN_MIRROR}/authors/id/H/HA/HAARG/Devel-GlobalDestruct=
ion-${PV}.tar.gz"
> > -SRC_URI[md5sum] =3D "24221ba322cf2dc46a1fc99b53e2380b"
> >  SRC_URI[sha256sum] =3D "34b8a5f29991311468fe6913cadaba75fd5d2b0b3ee3bb=
41fe5b53efab9154ab"
> >
> >  S =3D "${WORKDIR}/Devel-GlobalDestruction-${PV}"
> > diff --git a/meta-perl/recipes-perl/libdigest/libdigest-hmac-perl_1.03.=
bb b/meta-perl/recipes-perl/libdigest/libdigest-hmac-perl_1.03.bb
> > index 43b7f4d5a9..41b4e78c5c 100644
> > --- a/meta-perl/recipes-perl/libdigest/libdigest-hmac-perl_1.03.bb
> > +++ b/meta-perl/recipes-perl/libdigest/libdigest-hmac-perl_1.03.bb
> > @@ -11,7 +11,6 @@ RDEPENDS:${PN} =3D "libdigest-sha1-perl perl-module-e=
xtutils-makemaker perl-module
> >  SRC_URI =3D "http://search.cpan.org/CPAN/authors/id/G/GA/GAAS/Digest-H=
MAC-${PV}.tar.gz \
> >             file://run-ptest \
> >            "
> > -SRC_URI[md5sum] =3D "e6a5d6f552da16eacb5157ea4369ff9d"
> >  SRC_URI[sha256sum] =3D "3bc72c6d3ff144d73aefb90e9a78d33612d58cf1cd1631=
ecfb8985ba96da4a59"
> >
> >  S =3D "${WORKDIR}/Digest-HMAC-${PV}"
> > diff --git a/meta-perl/recipes-perl/libdigest/libdigest-sha1-perl_2.13.=
bb b/meta-perl/recipes-perl/libdigest/libdigest-sha1-perl_2.13.bb
> > index df89c9bcdb..4aa37243a7 100644
> > --- a/meta-perl/recipes-perl/libdigest/libdigest-sha1-perl_2.13.bb
> > +++ b/meta-perl/recipes-perl/libdigest/libdigest-sha1-perl_2.13.bb
> > @@ -9,7 +9,6 @@ LIC_FILES_CHKSUM =3D "file://README;beginline=3D10;endl=
ine=3D14;md5=3Dff5867ebb4bc1103a7
> >  SRC_URI =3D "http://search.cpan.org/CPAN/authors/id/G/GA/GAAS/Digest-S=
HA1-${PV}.tar.gz \
> >             file://run-ptest \
> >            "
> > -SRC_URI[md5sum] =3D "bd22388f268434f2b24f64e28bf1aa35"
> >  SRC_URI[sha256sum] =3D "68c1dac2187421f0eb7abf71452a06f190181b8fc4b28e=
dedf5b90296fb943cc"
> >
> >  S =3D "${WORKDIR}/Digest-SHA1-${PV}"
> > diff --git a/meta-perl/recipes-perl/libenv/libenv-perl_1.04.bb b/meta-p=
erl/recipes-perl/libenv/libenv-perl_1.04.bb
> > index 79fff9d520..fd34c6d123 100644
> > --- a/meta-perl/recipes-perl/libenv/libenv-perl_1.04.bb
> > +++ b/meta-perl/recipes-perl/libenv/libenv-perl_1.04.bb
> > @@ -11,7 +11,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D76c1cbf18d=
b56b3340d91cb947943bd3"
> >
> >  SRC_URI =3D "http://search.cpan.org/CPAN/authors/id/F/FL/FLORA/Env-${P=
V}.tar.gz"
> >
> > -SRC_URI[md5sum] =3D "fdba5c0690e66972c96fee112cf5f25c"
> >  SRC_URI[sha256sum] =3D "d94a3d412df246afdc31a2199cbd8ae915167a3f4684f7=
b7014ce1200251ebb0"
> >
> >  S =3D "${WORKDIR}/Env-${PV}"
> > diff --git a/meta-perl/recipes-perl/liberror/liberror-perl_0.17029.bb b=
/meta-perl/recipes-perl/liberror/liberror-perl_0.17029.bb
> > index e54bb11ccd..15e0ef85c0 100644
> > --- a/meta-perl/recipes-perl/liberror/liberror-perl_0.17029.bb
> > +++ b/meta-perl/recipes-perl/liberror/liberror-perl_0.17029.bb
> > @@ -33,7 +33,6 @@ RDEPENDS:${PN}-ptest +=3D " \
> >
> >  SRC_URI =3D "http://cpan.metacpan.org/authors/id/S/SH/SHLOMIF/Error-${=
PV}.tar.gz"
> >
> > -SRC_URI[md5sum] =3D "6732b1c6207e4a9a3e2987c88368039a"
> >  SRC_URI[sha256sum] =3D "1a23f7913032aed6d4b68321373a3899ca66590f472739=
1a091ec19c95bf7adc"
> >
> >  S =3D "${WORKDIR}/Error-${PV}"
> > diff --git a/meta-perl/recipes-perl/libextutils/libextutils-config-perl=
_0.008.bb b/meta-perl/recipes-perl/libextutils/libextutils-config-perl_0.00=
8.bb
> > index a58d96582e..0f43c537c0 100644
> > --- a/meta-perl/recipes-perl/libextutils/libextutils-config-perl_0.008.=
bb
> > +++ b/meta-perl/recipes-perl/libextutils/libextutils-config-perl_0.008.=
bb
> > @@ -8,7 +8,6 @@ LICENSE =3D "Artistic-1.0 | GPL-1.0-or-later"
> >  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D1932ab4d8b84c25fd7967aa1808=
8e57e"
> >
> >  SRC_URI =3D "${CPAN_MIRROR}/authors/id/L/LE/LEONT/ExtUtils-Config-${PV=
}.tar.gz"
> > -SRC_URI[md5sum] =3D "565a7b09c7cac5907a25bbe2c959a717"
> >  SRC_URI[sha256sum] =3D "ae5104f634650dce8a79b7ed13fb59d67a39c213a6776c=
fdaa3ee749e62f1a8c"
> >
> >  S =3D "${WORKDIR}/ExtUtils-Config-${PV}"
> > diff --git a/meta-perl/recipes-perl/libextutils/libextutils-installpath=
s-perl_0.012.bb b/meta-perl/recipes-perl/libextutils/libextutils-installpat=
hs-perl_0.012.bb
> > index 07dab4e161..f4db4ccff6 100644
> > --- a/meta-perl/recipes-perl/libextutils/libextutils-installpaths-perl_=
0.012.bb
> > +++ b/meta-perl/recipes-perl/libextutils/libextutils-installpaths-perl_=
0.012.bb
> > @@ -9,7 +9,6 @@ LICENSE =3D "Artistic-1.0 | GPL-1.0-or-later"
> >  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Db6fa54d873ce6bcf4809ea88bdf=
97769"
> >
> >  SRC_URI =3D "${CPAN_MIRROR}/authors/id/L/LE/LEONT/ExtUtils-InstallPath=
s-${PV}.tar.gz"
> > -SRC_URI[md5sum] =3D "9a8d66aab1ffec98ea260faf03ac612b"
> >  SRC_URI[sha256sum] =3D "84735e3037bab1fdffa3c2508567ad412a785c91599db3=
c12593a50a1dd434ed"
> >
> >  S =3D "${WORKDIR}/ExtUtils-InstallPaths-${PV}"
> > diff --git a/meta-perl/recipes-perl/libextutils/libextutils-parsexs-per=
l_3.35.bb b/meta-perl/recipes-perl/libextutils/libextutils-parsexs-perl_3.3=
5.bb
> > index 43b5b60ef6..56617fcdac 100644
> > --- a/meta-perl/recipes-perl/libextutils/libextutils-parsexs-perl_3.35.=
bb
> > +++ b/meta-perl/recipes-perl/libextutils/libextutils-parsexs-perl_3.35.=
bb
> > @@ -14,7 +14,6 @@ LIC_FILES_CHKSUM =3D "file://README;beginline=3D120;e=
ndline=3D129;md5=3Deb858f0e3b1b0bee
> >
> >  SRCNAME =3D "ExtUtils-ParseXS"
> >  SRC_URI =3D "${CPAN_MIRROR}/authors/id/S/SM/SMUELLER/${SRCNAME}-${PV}.=
tar.gz"
> > -SRC_URI[md5sum] =3D "2ae41036d85e98e1369645724962dd16"
> >  SRC_URI[sha256sum] =3D "41def0511278a2a8ba9afa25ccab45b0453f75e7fd774e=
8644b5f9a57cc4ee1c"
> >
> >  S =3D "${WORKDIR}/${SRCNAME}-${PV}"
> > diff --git a/meta-perl/recipes-perl/libfile/libfile-slurp-perl_9999.19.=
bb b/meta-perl/recipes-perl/libfile/libfile-slurp-perl_9999.19.bb
> > index 1012ae952e..3f138baa41 100644
> > --- a/meta-perl/recipes-perl/libfile/libfile-slurp-perl_9999.19.bb
> > +++ b/meta-perl/recipes-perl/libfile/libfile-slurp-perl_9999.19.bb
> > @@ -13,7 +13,6 @@ S =3D "${WORKDIR}/File-Slurp-${PV}"
> >
> >  inherit cpan
> >
> > -SRC_URI[md5sum] =3D "7d584cd15c4f8b9547765eff8c4ef078"
> >  SRC_URI[sha256sum] =3D "ce29ebe995097ebd6e9bc03284714cdfa0c46dc94f6b14=
a56980747ea3253643"
> >
> >  BBCLASSEXTEND=3D"native"
> > diff --git a/meta-perl/recipes-perl/libhtml/libhtml-parser-perl_3.72.bb=
 b/meta-perl/recipes-perl/libhtml/libhtml-parser-perl_3.72.bb
> > index 216d7c4136..4dbcc107bc 100644
> > --- a/meta-perl/recipes-perl/libhtml/libhtml-parser-perl_3.72.bb
> > +++ b/meta-perl/recipes-perl/libhtml/libhtml-parser-perl_3.72.bb
> > @@ -9,7 +9,6 @@ DEPENDS +=3D "perl"
> >
> >  SRC_URI =3D "http://search.cpan.org/CPAN/authors/id/G/GA/GAAS/HTML-Par=
ser-${PV}.tar.gz"
> >
> > -SRC_URI[md5sum] =3D "eb7505e5f626913350df9dd4a03d54a8"
> >  SRC_URI[sha256sum] =3D "ec28c7e1d9e67c45eca197077f7cdc41ead1bb4c538c7f=
02a3296a4bb92f608b"
> >
> >  S =3D "${WORKDIR}/HTML-Parser-${PV}"
> > diff --git a/meta-perl/recipes-perl/libhtml/libhtml-tagset-perl_3.20.bb=
 b/meta-perl/recipes-perl/libhtml/libhtml-tagset-perl_3.20.bb
> > index c871b97c39..a0ce7c0b2e 100644
> > --- a/meta-perl/recipes-perl/libhtml/libhtml-tagset-perl_3.20.bb
> > +++ b/meta-perl/recipes-perl/libhtml/libhtml-tagset-perl_3.20.bb
> > @@ -8,7 +8,6 @@ LICENSE =3D "Artistic-1.0 | GPL-1.0-or-later"
> >  LIC_FILES_CHKSUM =3D "file://README;beginline=3D62;endline=3D66;md5=3D=
aa91eed6adfe182d2af676954f06a7c9"
> >
> >  SRC_URI =3D "${CPAN_MIRROR}/authors/id/P/PE/PETDANCE/HTML-Tagset-${PV}=
.tar.gz"
> > -SRC_URI[md5sum] =3D "d2bfa18fe1904df7f683e96611e87437"
> >  SRC_URI[sha256sum] =3D "adb17dac9e36cd011f5243881c9739417fd102fce760f8=
de4e9be4c7131108e2"
> >
> >  S =3D "${WORKDIR}/HTML-Tagset-${PV}"
> > diff --git a/meta-perl/recipes-perl/libhtml/libhtml-tree-perl_5.03.bb b=
/meta-perl/recipes-perl/libhtml/libhtml-tree-perl_5.03.bb
> > index 227fa83fc0..b9099fc576 100644
> > --- a/meta-perl/recipes-perl/libhtml/libhtml-tree-perl_5.03.bb
> > +++ b/meta-perl/recipes-perl/libhtml/libhtml-tree-perl_5.03.bb
> > @@ -14,7 +14,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D3eb57a8958=
cae73cb65e7d0c26339242"
> >  SRC_URI =3D "${CPAN_MIRROR}/authors/id/C/CJ/CJM/HTML-Tree-${PV}.tar.gz=
 \
> >             file://bin-htmltree-fix-shebang.patch \
> >  "
> > -SRC_URI[md5sum] =3D "d9271d60b872ed6fbe68b2d0fe8c450e"
> >  SRC_URI[sha256sum] =3D "7d6d73fca622aa74855a8b088faa39454a0f91b7af83c9=
ec0387f01eefc2148f"
> >
> >  S =3D "${WORKDIR}/HTML-Tree-${PV}"
> > diff --git a/meta-perl/recipes-perl/libimport/libimport-into-perl_1.002=
004.bb b/meta-perl/recipes-perl/libimport/libimport-into-perl_1.002004.bb
> > index e88d60d13a..690bbe92eb 100644
> > --- a/meta-perl/recipes-perl/libimport/libimport-into-perl_1.002004.bb
> > +++ b/meta-perl/recipes-perl/libimport/libimport-into-perl_1.002004.bb
> > @@ -17,7 +17,6 @@ LICENSE =3D "Artistic-1.0 | GPL-1.0-or-later"
> >  LIC_FILES_CHKSUM =3D "file://README;beginline=3D209;endline=3D223;md5=
=3D3cf363f1e405dea6db2c6cd0ef23680c"
> >
> >  SRC_URI =3D "${CPAN_MIRROR}/authors/id/E/ET/ETHER/Import-Into-${PV}.ta=
r.gz"
> > -SRC_URI[md5sum] =3D "70f2f3b08a5b706ee382a8448c346cb1"
> >  SRC_URI[sha256sum] =3D "decb259bc2ff015fe3dac85e4a287d4128e9b0506a0b2c=
5fa7244836a68b1084"
> >
> >  S =3D "${WORKDIR}/Import-Into-${PV}"
> > diff --git a/meta-perl/recipes-perl/libio/libio-stringy-perl_2.111.bb b=
/meta-perl/recipes-perl/libio/libio-stringy-perl_2.111.bb
> > index b745939234..5c5ccf7db2 100644
> > --- a/meta-perl/recipes-perl/libio/libio-stringy-perl_2.111.bb
> > +++ b/meta-perl/recipes-perl/libio/libio-stringy-perl_2.111.bb
> > @@ -10,7 +10,6 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D01406e4ff2=
e60d88d42ef1caebdd0011"
> >
> >
> >  SRC_URI =3D "${CPAN_MIRROR}/authors/id/D/DS/DSKOLL/IO-stringy-${PV}.ta=
r.gz"
> > -SRC_URI[md5sum] =3D "e91acf0a800b190d13585a47de775bdd"
> >  SRC_URI[sha256sum] =3D "8c67fd6608c3c4e74f7324f1404a856c331dbf48d9deda=
6aaa8296ea41bf199d"
> >
> >  S =3D "${WORKDIR}/IO-stringy-${PV}"
> > diff --git a/meta-perl/recipes-perl/libipc/libipc-signal-perl_1.00.bb b=
/meta-perl/recipes-perl/libipc/libipc-signal-perl_1.00.bb
> > index 203db7b10c..6172933f13 100644
> > --- a/meta-perl/recipes-perl/libipc/libipc-signal-perl_1.00.bb
> > +++ b/meta-perl/recipes-perl/libipc/libipc-signal-perl_1.00.bb
> > @@ -12,7 +12,6 @@ S =3D "${WORKDIR}/IPC-Signal-${PV}"
> >
> >  SRC_URI =3D "http://search.cpan.org/CPAN/authors/id/R/RO/ROSCH/IPC-Sig=
nal-${PV}.tar.gz"
> >
> > -SRC_URI[md5sum] =3D "4cebf17fdf1785eaf8c151bf2e8c360a"
> >  SRC_URI[sha256sum] =3D "7c21f9c8c2d0c0f0f0f46e77de7c3d879dd562668ddf05=
25875c38cef2076fd0"
> >
> >  inherit cpan
> > diff --git a/meta-perl/recipes-perl/liblocale/liblocale-gettext-perl_1.=
07.bb b/meta-perl/recipes-perl/liblocale/liblocale-gettext-perl_1.07.bb
> > index 1e4b563532..654fd2eedd 100644
> > --- a/meta-perl/recipes-perl/liblocale/liblocale-gettext-perl_1.07.bb
> > +++ b/meta-perl/recipes-perl/liblocale/liblocale-gettext-perl_1.07.bb
> > @@ -11,7 +11,6 @@ LIC_FILES_CHKSUM =3D "file://README;md5=3Dd028249c2d0=
8dca6ca6c5bb43b56d926"
> >
> >  SRC_URI =3D "${CPAN_MIRROR}/authors/id/P/PV/PVANDRY/Locale-gettext-${P=
V}.tar.gz"
> >
> > -SRC_URI[md5sum] =3D "bc652758af65c24500f1d06a77415019"
> >  SRC_URI[sha256sum] =3D "909d47954697e7c04218f972915b787bd1244d75e3bd01=
620bc167d5bbc49c15"
> >
> >  S =3D "${WORKDIR}/Locale-gettext-${PV}"
> > diff --git a/meta-perl/recipes-perl/libmodule/libmodule-pluggable-perl_=
5.2.bb b/meta-perl/recipes-perl/libmodule/libmodule-pluggable-perl_5.2.bb
> > index 538fa30d3f..fac74ba97e 100644
> > --- a/meta-perl/recipes-perl/libmodule/libmodule-pluggable-perl_5.2.bb
> > +++ b/meta-perl/recipes-perl/libmodule/libmodule-pluggable-perl_5.2.bb
> > @@ -17,7 +17,6 @@ LIC_FILES_CHKSUM =3D "file://README;beginline=3D322;e=
ndline=3D325;md5=3D086450ce010f6fda
> >
> >  SRCNAME =3D "Module-Pluggable"
> >  SRC_URI =3D "${CPAN_MIRROR}/authors/id/S/SI/SIMONW/${SRCNAME}-${PV}.ta=
r.gz"
> > -SRC_URI[md5sum] =3D "87ce2971662efd0b69a81bb4dc9ea76c"
> >  SRC_URI[sha256sum] =3D "b3f2ad45e4fd10b3fb90d912d78d8b795ab295480db56d=
c64e86b9fa75c5a6df"
> >
> >
> > diff --git a/meta-perl/recipes-perl/libmodule/libmodule-runtime-perl_0.=
016.bb b/meta-perl/recipes-perl/libmodule/libmodule-runtime-perl_0.016.bb
> > index 205df68029..9c4370e965 100644
> > --- a/meta-perl/recipes-perl/libmodule/libmodule-runtime-perl_0.016.bb
> > +++ b/meta-perl/recipes-perl/libmodule/libmodule-runtime-perl_0.016.bb
> > @@ -21,7 +21,6 @@ LIC_FILES_CHKSUM =3D "file://README;beginline=3D36;en=
dline=3D44;md5=3D9416434672a57853d6
> >
> >  SRCNAME =3D "Module-Runtime"
> >  SRC_URI =3D "${CPAN_MIRROR}/authors/id/Z/ZE/ZEFRAM/${SRCNAME}-${PV}.ta=
r.gz"
> > -SRC_URI[md5sum] =3D "d3d47222fa2e3dfcb4526f6cc8437b20"
> >  SRC_URI[sha256sum] =3D "68302ec646833547d410be28e09676db75006f4aa58a11=
f3bdb44ffe99f0f024"
> >
> >  UPSTREAM_CHECK_REGEX =3D "Module\-Runtime\-(?P<pver>(\d+\.\d+)).tar"
> > diff --git a/meta-perl/recipes-perl/libnet/libnet-dns-sec-perl_1.10.bb =
b/meta-perl/recipes-perl/libnet/libnet-dns-sec-perl_1.10.bb
> > index fe7bb3326e..37b5d61f7a 100644
> > --- a/meta-perl/recipes-perl/libnet/libnet-dns-sec-perl_1.10.bb
> > +++ b/meta-perl/recipes-perl/libnet/libnet-dns-sec-perl_1.10.bb
> > @@ -6,7 +6,6 @@ LICENSE =3D "MIT"
> >  LIC_FILES_CHKSUM =3D "file://README;beginline=3D165;endline=3D192;md5=
=3D6ef523fa09e8c272675839e21de16bde"
> >
> >  SRC_URI =3D "https://cpan.metacpan.org/authors/id/W/WI/WILLEM/Net-DNS-=
SEC-${PV}.tar.gz"
> > -SRC_URI[md5sum] =3D "ffa55a9898192c9d4c623cb1357eba9b"
> >  SRC_URI[sha256sum] =3D "37a47d4def72d7338f3cc7cd807ec19bd9e2ae638ae656=
fa536cf0314801989e"
> >
> >  DEPENDS +=3D "openssl"
> > diff --git a/meta-perl/recipes-perl/libnet/libnet-ldap-perl_0.68.bb b/m=
eta-perl/recipes-perl/libnet/libnet-ldap-perl_0.68.bb
> > index a77381dce8..a7793200a5 100644
> > --- a/meta-perl/recipes-perl/libnet/libnet-ldap-perl_0.68.bb
> > +++ b/meta-perl/recipes-perl/libnet/libnet-ldap-perl_0.68.bb
> > @@ -11,7 +11,6 @@ LIC_FILES_CHKSUM =3D "file://README;beginline=3D3;end=
line=3D5;md5=3D4d6588c2fa0d38ae162f
> >
> >  SRC_URI =3D "${CPAN_MIRROR}/authors/id/M/MA/MARSCHAP/perl-ldap-${PV}.t=
ar.gz"
> >
> > -SRC_URI[md5sum] =3D "d091ed00302f0276069bca9df9478744"
> >  SRC_URI[sha256sum] =3D "e2f389fe3e7a9e4b61488692919ad723b98f3b479b5288=
f610daa8c27995b351"
> >
> >  S =3D "${WORKDIR}/perl-ldap-${PV}"
> > diff --git a/meta-perl/recipes-perl/libnet/libnet-libidn-perl_0.12.bb b=
/meta-perl/recipes-perl/libnet/libnet-libidn-perl_0.12.bb
> > index 4c4faab4db..a22b63809c 100644
> > --- a/meta-perl/recipes-perl/libnet/libnet-libidn-perl_0.12.bb
> > +++ b/meta-perl/recipes-perl/libnet/libnet-libidn-perl_0.12.bb
> > @@ -13,7 +13,6 @@ DEPENDS +=3D "libidn"
> >  RDEPENDS:${PN}:append:libc-glibc =3D " glibc-gconvs"
> >
> >  SRC_URI =3D "http://search.cpan.org/CPAN/authors/id/T/TH/THOR/Net-LibI=
DN-${PV}.tar.gz"
> > -SRC_URI[md5sum] =3D "c3e4de2065009d67bcb1df0afb473e12"
> >  SRC_URI[sha256sum] =3D "2f8acc9442b3866ec7dc63cd449fc693ae3e930d5d3e5e=
9430fbb6f393bdbb17"
> >
> >  SRC_URI +=3D "file://libidn-wr-cross-compile.patch"
> > diff --git a/meta-perl/recipes-perl/libnet/libnet-ssleay-perl_1.85.bb b=
/meta-perl/recipes-perl/libnet/libnet-ssleay-perl_1.85.bb
> > index 5d0eccd84a..a91bb6cbe1 100644
> > --- a/meta-perl/recipes-perl/libnet/libnet-ssleay-perl_1.85.bb
> > +++ b/meta-perl/recipes-perl/libnet/libnet-ssleay-perl_1.85.bb
> > @@ -27,7 +27,6 @@ SRC_URI =3D "http://search.cpan.org/CPAN/authors/id/M=
/MI/MIKEM/Net-SSLeay-${PV}.ta
> >             file://no-exec-on-configure.patch \
> >             file://run-ptest \
> >            "
> > -SRC_URI[md5sum] =3D "d602bdce4e0531c6efc276e3e429ca69"
> >  SRC_URI[sha256sum] =3D "9d8188b9fb1cae3bd791979c20554925d5e94a138d0041=
4f1a6814549927b0c8"
> >
> >  S =3D "${WORKDIR}/Net-SSLeay-${PV}"
> > diff --git a/meta-perl/recipes-perl/libnet/libnet-telnet-perl_3.05.bb b=
/meta-perl/recipes-perl/libnet/libnet-telnet-perl_3.05.bb
> > index d1365f269c..d90b47d218 100644
> > --- a/meta-perl/recipes-perl/libnet/libnet-telnet-perl_3.05.bb
> > +++ b/meta-perl/recipes-perl/libnet/libnet-telnet-perl_3.05.bb
> > @@ -15,7 +15,6 @@ LICENSE =3D "Artistic-1.0 | GPL-1.0-or-later"
> >  LIC_FILES_CHKSUM =3D "file://README;beginline=3D4;endline=3D7;md5=3De9=
4ab3b72335e3cdadd6c1ff736dd714"
> >
> >  SRC_URI =3D "http://search.cpan.org/CPAN/authors/id/J/JR/JROGERS/Net-T=
elnet-${PV}.tar.gz"
> > -SRC_URI[md5sum] =3D "c8573c57a2d9469f038c40ac284b1e5f"
> >  SRC_URI[sha256sum] =3D "677f68ba2cd2a824fae323fa82e183bf7e3d03c3c499c9=
1d923bd6283796a743"
> >
> >  S =3D "${WORKDIR}/Net-Telnet-${PV}"
> > diff --git a/meta-perl/recipes-perl/libproc/libproc-waitstat-perl_1.00.=
bb b/meta-perl/recipes-perl/libproc/libproc-waitstat-perl_1.00.bb
> > index 643a704a1d..5e4c71b704 100644
> > --- a/meta-perl/recipes-perl/libproc/libproc-waitstat-perl_1.00.bb
> > +++ b/meta-perl/recipes-perl/libproc/libproc-waitstat-perl_1.00.bb
> > @@ -14,7 +14,6 @@ S =3D "${WORKDIR}/Proc-WaitStat-${PV}"
> >
> >  SRC_URI =3D "http://search.cpan.org/CPAN/authors/id/R/RO/ROSCH/Proc-Wa=
itStat-${PV}.tar.gz"
> >
> > -SRC_URI[md5sum] =3D "b911bd579b6b142391b21de1efa30c95"
> >  SRC_URI[sha256sum] =3D "d07563f5e787909d16e7390241e877f49ab739b1de9d0e=
2ea1a41bd0bf4474bc"
> >
> >  inherit cpan
> > diff --git a/meta-perl/recipes-perl/librole/librole-tiny-perl_2.002004.=
bb b/meta-perl/recipes-perl/librole/librole-tiny-perl_2.002004.bb
> > index c5efc15358..8ccd269e6d 100644
> > --- a/meta-perl/recipes-perl/librole/librole-tiny-perl_2.002004.bb
> > +++ b/meta-perl/recipes-perl/librole/librole-tiny-perl_2.002004.bb
> > @@ -9,7 +9,6 @@ LICENSE =3D "Artistic-1.0 | GPL-1.0-or-later"
> >  LIC_FILES_CHKSUM =3D "file://README;beginline=3D197;endline=3D234;md5=
=3D26df7e7c20551fb1906e2286624f0b71"
> >
> >  SRC_URI =3D "${CPAN_MIRROR}/authors/id/H/HA/HAARG/Role-Tiny-${PV}.tar.=
gz"
> > -SRC_URI[md5sum] =3D "9ee45591befa3d0b1094ac75d282b6ba"
> >  SRC_URI[sha256sum] =3D "d7bdee9e138a4f83aa52d0a981625644bda87ff16642df=
a845dcb44d9a242b45"
> >
> >  S =3D "${WORKDIR}/Role-Tiny-${PV}"
> > diff --git a/meta-perl/recipes-perl/libstatgrab/libunix-statgrab_0.112.=
bb b/meta-perl/recipes-perl/libstatgrab/libunix-statgrab_0.112.bb
> > index cf290d9908..6b1c4e8c0f 100644
> > --- a/meta-perl/recipes-perl/libstatgrab/libunix-statgrab_0.112.bb
> > +++ b/meta-perl/recipes-perl/libstatgrab/libunix-statgrab_0.112.bb
> > @@ -28,7 +28,6 @@ LIC_FILES_CHKSUM =3D "file://${COMMON_LICENSE_DIR}/Ar=
tistic-1.0;md5=3Dcda03bbdc3c195
> >      file://${COMMON_LICENSE_DIR}/LGPL-2.1-or-later;md5=3D2a4f4fd2128ea=
2f65047ee63fbca9f68 \
> >  "
> >
> > -SRC_URI[md5sum] =3D "a6bc06b3f7749f7d77a2b1bd13402821"
> >  SRC_URI[sha256sum] =3D "16a29f7acaeec081bf0e7303ba5ee24fda1d21a1104669=
b837745f3ea61d6afa"
> >
> >  S =3D "${WORKDIR}/Unix-Statgrab-${PV}"
> > diff --git a/meta-perl/recipes-perl/libstrictures/libstrictures-perl_2.=
000006.bb b/meta-perl/recipes-perl/libstrictures/libstrictures-perl_2.00000=
6.bb
> > index 80c21b2b14..5a779a6733 100644
> > --- a/meta-perl/recipes-perl/libstrictures/libstrictures-perl_2.000006.=
bb
> > +++ b/meta-perl/recipes-perl/libstrictures/libstrictures-perl_2.000006.=
bb
> > @@ -29,7 +29,6 @@ LICENSE =3D "Artistic-1.0 | GPL-1.0-or-later"
> >  LIC_FILES_CHKSUM =3D "file://README;beginline=3D246;endline=3D262;md5=
=3D43be558cf4f19823cdd6af22135cf5f8"
> >
> >  SRC_URI =3D "${CPAN_MIRROR}/authors/id/H/HA/HAARG/strictures-${PV}.tar=
.gz"
> > -SRC_URI[md5sum] =3D "35c14fd25320f32ff40e977feae95d0d"
> >  SRC_URI[sha256sum] =3D "09d57974a6d1b2380c802870fed471108f51170da81458=
e2751859f2714f8d57"
> >
> >  S =3D "${WORKDIR}/strictures-${PV}"
> > diff --git a/meta-perl/recipes-perl/libsub/libsub-exporter-progressive-=
perl_0.001013.bb b/meta-perl/recipes-perl/libsub/libsub-exporter-progressiv=
e-perl_0.001013.bb
> > index d51ab21715..10f0fa2044 100644
> > --- a/meta-perl/recipes-perl/libsub/libsub-exporter-progressive-perl_0.=
001013.bb
> > +++ b/meta-perl/recipes-perl/libsub/libsub-exporter-progressive-perl_0.=
001013.bb
> > @@ -14,7 +14,6 @@ LICENSE =3D "Artistic-1.0 | GPL-1.0-or-later"
> >  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D003fa970662359a43ac2c296110=
8b0f1"
> >
> >  SRC_URI =3D "${CPAN_MIRROR}/authors/id/F/FR/FREW/Sub-Exporter-Progress=
ive-${PV}.tar.gz"
> > -SRC_URI[md5sum] =3D "72cf6acdd2a0a8b105821a4db98e4ebe"
> >  SRC_URI[sha256sum] =3D "d535b7954d64da1ac1305b1fadf98202769e3599376854=
b2ced90c382beac056"
> >
> >  S =3D "${WORKDIR}/Sub-Exporter-Progressive-${PV}"
> > diff --git a/meta-perl/recipes-perl/libsub/libsub-uplevel-perl_0.2800.b=
b b/meta-perl/recipes-perl/libsub/libsub-uplevel-perl_0.2800.bb
> > index 3a0de9757b..1981ae4a94 100644
> > --- a/meta-perl/recipes-perl/libsub/libsub-uplevel-perl_0.2800.bb
> > +++ b/meta-perl/recipes-perl/libsub/libsub-uplevel-perl_0.2800.bb
> > @@ -17,7 +17,6 @@ CPAN_AUTHOR =3D "DAGOLDEN"
> >
> >  SRC_URI =3D "${CPAN_MIRROR}/authors/id/D/DA/${CPAN_AUTHOR}/${CPAN_PACK=
AGE}-${PV}.tar.gz"
> >
> > -SRC_URI[md5sum] =3D "6c6a174861fd160e8d5871a86df00baf"
> >  SRC_URI[sha256sum] =3D "b4f3f63b80f680a421332d8851ddbe5a8e72fcaa74d5d1=
d98f3c8cc4a3ece293"
> >
> >  S =3D "${WORKDIR}/${CPAN_PACKAGE}-${PV}"
> > diff --git a/meta-perl/recipes-perl/libterm/libterm-readkey-perl_2.38.b=
b b/meta-perl/recipes-perl/libterm/libterm-readkey-perl_2.38.bb
> > index f4ce3131de..831ea1a8f6 100644
> > --- a/meta-perl/recipes-perl/libterm/libterm-readkey-perl_2.38.bb
> > +++ b/meta-perl/recipes-perl/libterm/libterm-readkey-perl_2.38.bb
> > @@ -14,7 +14,6 @@ LIC_FILES_CHKSUM =3D "file://README;md5=3Dc275db663c8=
489a5709ebb22b185add5"
> >
> >  SRC_URI =3D "${CPAN_MIRROR}/authors/id/J/JS/JSTOWE/TermReadKey-${PV}.t=
ar.gz"
> >
> > -SRC_URI[md5sum] =3D "b2b4aab7a0e6bddb7ac3b21ba637482c"
> >  SRC_URI[sha256sum] =3D "5a645878dc570ac33661581fbb090ff24ebce17d43ea53=
fd22e105a856a47290"
> >
> >  S =3D "${WORKDIR}/TermReadKey-${PV}"
> > diff --git a/meta-perl/recipes-perl/libtest/libtest-nowarnings-perl_1.0=
4.bb b/meta-perl/recipes-perl/libtest/libtest-nowarnings-perl_1.04.bb
> > index d74a347293..aea0e7e0f2 100644
> > --- a/meta-perl/recipes-perl/libtest/libtest-nowarnings-perl_1.04.bb
> > +++ b/meta-perl/recipes-perl/libtest/libtest-nowarnings-perl_1.04.bb
> > @@ -25,7 +25,6 @@ CPAN_AUTHOR =3D "ADAMK"
> >
> >  SRC_URI =3D "${CPAN_MIRROR}/authors/id/A/AD/${CPAN_AUTHOR}/${CPAN_PACK=
AGE}-${PV}.tar.gz"
> >
> > -SRC_URI[md5sum] =3D "682ed043f7d3e38f3dfd8745fd21c49a"
> >  SRC_URI[sha256sum] =3D "638a57658cb119af1fe5b15e73d47c2544dcfef84af0c6=
b1b2e97f08202b686c"
> >
> >  RDEPENDS:${PN} +=3D "perl-module-test-builder perl-module-test-more pe=
rl-module-test-tester"
> > diff --git a/meta-perl/recipes-perl/libtext/libtext-charwidth-perl_0.04=
.bb b/meta-perl/recipes-perl/libtext/libtext-charwidth-perl_0.04.bb
> > index 29118129ad..e9a2bd474b 100644
> > --- a/meta-perl/recipes-perl/libtext/libtext-charwidth-perl_0.04.bb
> > +++ b/meta-perl/recipes-perl/libtext/libtext-charwidth-perl_0.04.bb
> > @@ -17,7 +17,6 @@ LIC_FILES_CHKSUM =3D "file://README;md5=3Dd8d54c8c500=
cbdd57a4c15911d9d96db"
> >
> >  SRC_URI =3D "${CPAN_MIRROR}/authors/id/K/KU/KUBOTA/Text-CharWidth-${PV=
}.tar.gz"
> >
> > -SRC_URI[md5sum] =3D "37a723df0580c0758c0ee67b37336c15"
> >  SRC_URI[sha256sum] =3D "abded5f4fdd9338e89fd2f1d8271c44989dae5bf50aece=
41b6179d8e230704f8"
> >
> >  S =3D "${WORKDIR}/Text-CharWidth-${PV}"
> > diff --git a/meta-perl/recipes-perl/libtext/libtext-diff-perl_1.41.bb b=
/meta-perl/recipes-perl/libtext/libtext-diff-perl_1.41.bb
> > index 9dfadde8e5..2e89b759bf 100644
> > --- a/meta-perl/recipes-perl/libtext/libtext-diff-perl_1.41.bb
> > +++ b/meta-perl/recipes-perl/libtext/libtext-diff-perl_1.41.bb
> > @@ -14,7 +14,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D385c556538=
86acac3821999a3ccd17b3"
> >  SRC_URI =3D "${CPAN_MIRROR}/authors/id/O/OV/OVID/Text-Diff-${PV}.tar.g=
z \
> >             file://run-ptest \
> >            "
> > -SRC_URI[md5sum] =3D "30d56e6dd5551ca16b8e16cc7299dc21"
> >  SRC_URI[sha256sum] =3D "a67f50a48e313c1680cc662109ce5f913ea71454db355d=
0cf4db87ac89d2d2fa"
> >
> >  S =3D "${WORKDIR}/Text-Diff-${PV}"
> > diff --git a/meta-perl/recipes-perl/libtext/libtext-iconv-perl_1.7.bb b=
/meta-perl/recipes-perl/libtext/libtext-iconv-perl_1.7.bb
> > index 1e8405cab9..88125845b1 100644
> > --- a/meta-perl/recipes-perl/libtext/libtext-iconv-perl_1.7.bb
> > +++ b/meta-perl/recipes-perl/libtext/libtext-iconv-perl_1.7.bb
> > @@ -14,7 +14,6 @@ RRECOMMENDS:${PN}:append:libc-glibc =3D " glibc-gconv=
s"
> >
> >  SRC_URI =3D "http://search.cpan.org/CPAN/authors/id/M/MP/MPIOTR/Text-I=
conv-${PV}.tar.gz"
> >
> > -SRC_URI[md5sum] =3D "81b26e069eaebb084e91ea3c009b67ae"
> >  SRC_URI[sha256sum] =3D "5b80b7d5e709d34393bcba88971864a17b44a5bf0f9e4b=
cee383d029e7d2d5c3"
> >
> >  S =3D "${WORKDIR}/Text-Iconv-${PV}"
> > diff --git a/meta-perl/recipes-perl/libtext/libtext-wrapi18n-perl_0.06.=
bb b/meta-perl/recipes-perl/libtext/libtext-wrapi18n-perl_0.06.bb
> > index 017e951d3a..0949dbb7a0 100644
> > --- a/meta-perl/recipes-perl/libtext/libtext-wrapi18n-perl_0.06.bb
> > +++ b/meta-perl/recipes-perl/libtext/libtext-wrapi18n-perl_0.06.bb
> > @@ -18,7 +18,6 @@ LIC_FILES_CHKSUM =3D "file://README;md5=3D080862e1e40=
cdcddef4393e137285858"
> >
> >  SRC_URI =3D "${CPAN_MIRROR}/authors/id/K/KU/KUBOTA/Text-WrapI18N-${PV}=
.tar.gz"
> >
> > -SRC_URI[md5sum] =3D "0799c16a00926e6c18d400c2e2861d5f"
> >  SRC_URI[sha256sum] =3D "4bd29a17f0c2c792d12c1005b3c276f2ab0fae39c00859=
ae1741d7941846a488"
> >
> >  S =3D "${WORKDIR}/Text-WrapI18N-${PV}"
> > diff --git a/meta-perl/recipes-perl/libunicode/libunicode-linebreak-per=
l_2019.001.bb b/meta-perl/recipes-perl/libunicode/libunicode-linebreak-perl=
_2019.001.bb
> > index a7a998c358..ae922d9dda 100644
> > --- a/meta-perl/recipes-perl/libunicode/libunicode-linebreak-perl_2019.=
001.bb
> > +++ b/meta-perl/recipes-perl/libunicode/libunicode-linebreak-perl_2019.=
001.bb
> > @@ -12,7 +12,6 @@ LIC_FILES_CHKSUM =3D "file://README;beginline=3D5;end=
line=3D9;md5=3Db5e8b1099b86b86fbc31
> >
> >  SRC_URI =3D "${CPAN_MIRROR}/authors/id/N/NE/NEZUMI/Unicode-LineBreak-$=
{PV}.tar.gz"
> >
> > -SRC_URI[md5sum] =3D "003d6da7a13700e069afed9238c864b9"
> >  SRC_URI[sha256sum] =3D "486762e4cacddcc77b13989f979a029f84630b8175e7fe=
f17989e157d4b6318a"
> >
> >  S =3D "${WORKDIR}/Unicode-LineBreak-${PV}"
> > diff --git a/meta-perl/recipes-perl/libxml/libxml-filter-buffertext-per=
l_1.01.bb b/meta-perl/recipes-perl/libxml/libxml-filter-buffertext-perl_1.0=
1.bb
> > index 7962d22c9d..2261dafbb0 100644
> > --- a/meta-perl/recipes-perl/libxml/libxml-filter-buffertext-perl_1.01.=
bb
> > +++ b/meta-perl/recipes-perl/libxml/libxml-filter-buffertext-perl_1.01.=
bb
> > @@ -13,7 +13,6 @@ DEPENDS +=3D "libxml-sax-perl-native"
> >  RDEPENDS:${PN} +=3D "libxml-sax-perl"
> >
> >  SRC_URI =3D "http://search.cpan.org/CPAN/authors/id/R/RB/RBERJON/XML-F=
ilter-BufferText-${PV}.tar.gz"
> > -SRC_URI[md5sum] =3D "2992c0387632583b966ab9c965b25512"
> >  SRC_URI[sha256sum] =3D "8fd2126d3beec554df852919f4739e689202cbba6a1750=
6e9b66ea165841a75c"
> >
> >  LIC_FILES_CHKSUM =3D "file://BufferText.pm;beginline=3D88;endline=3D90=
;md5=3D497aa6d79cc84c3d769a2a0016bee928"
> > diff --git a/meta-perl/recipes-perl/libxml/libxml-sax-writer-perl_0.57.=
bb b/meta-perl/recipes-perl/libxml/libxml-sax-writer-perl_0.57.bb
> > index 487a5c22cd..c3dee2bcbb 100644
> > --- a/meta-perl/recipes-perl/libxml/libxml-sax-writer-perl_0.57.bb
> > +++ b/meta-perl/recipes-perl/libxml/libxml-sax-writer-perl_0.57.bb
> > @@ -13,7 +13,6 @@ DEPENDS +=3D "libxml-filter-buffertext-perl-native"
> >  RDEPENDS:${PN} +=3D "libxml-filter-buffertext-perl"
> >
> >  SRC_URI =3D "http://search.cpan.org/CPAN/authors/id/P/PE/PERIGRIN/XML-=
SAX-Writer-${PV}.tar.gz"
> > -SRC_URI[md5sum] =3D "3e3023c648e3003c04de2fb04435f8bd"
> >  SRC_URI[sha256sum] =3D "3d61d07ef43b0126f5b4de4f415a256fa859fa88dc4fda=
baad70b7be7c682cf0"
> >
> >  LIC_FILES_CHKSUM =3D "file://README;beginline=3D45;endline=3D46;md5=3D=
d41d8cd98f00b204e9800998ecf8427e"
> > --
> > 2.43.0
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#124528): https://lists.openembedded.org/g/openembed=
ded-devel/message/124528
> > Mute This Topic: https://lists.openembedded.org/mt/117922197/3616702
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[anuj.mittal@oss.qualcomm.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >

