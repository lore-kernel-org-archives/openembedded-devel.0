Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC80AC4332F
	for <webhook@archiver.kernel.org>; Tue, 29 Nov 2022 04:01:54 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web10.140524.1669694503773713255
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Nov 2022 20:01:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=hlLP8H2y;
 spf=pass (domain: axis.com, ip: 195.60.68.18, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1669694504;
  x=1701230504;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=rBZKW1/z9vjmQ7LKtdQhBa7MlCzGvv6hIIB+yoJ7wHg=;
  b=hlLP8H2y7AXjVz2u42Z05KIuHZlRMlbiJCF6XJM8WIDIDJTlWhMIbq4I
   j3EvClap2C+ZRib9oowWHq0K+16u22JAeSwjJZpHjU7zSVCU59lJw3TQY
   U4/77UDvOgMGPRGhaUFHKukdIJWgFJvn119ghYw+Q+flowWsqNeeiU4gz
   bNBZ+skI36MpsglCasbquWPcORK7XX6LxU+/BGfBqpt/IYiSPjy98JsSz
   dXtQ0DgtG1o8GzwMJCrmQsoTWNhWs94DEy9UgPTN0IkeY4ug8qKHLAOoM
   J8bz3Dwxa2L4m7c6T54Y86XoQjihpUiXVG9ML+W8bq3l04MKthLg+jBF4
   g==;
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "Khem Raj (raj.khem@gmail.com)" <raj.khem@gmail.com>, wangmy
	<wangmy@fujitsu.com>, "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [oe] [meta-networking] [PATCH] lldpd: upgrade 1.0.15 -> 1.0.16
Thread-Topic: [oe] [meta-networking] [PATCH] lldpd: upgrade 1.0.15 -> 1.0.16
Thread-Index: AQHZAvAgc54odzM3YEiuKasZgfYKzK5VPoug
Date: Tue, 29 Nov 2022 04:01:40 +0000
Message-ID: <d5ab3ee61fc546038cc5bdc0157da56f@axis.com>
References: <1669615786-13094-1-git-send-email-wangmy@fujitsu.com>
 <1669615786-13094-3-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1669615786-13094-3-git-send-email-wangmy@fujitsu.com>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.0.5.60]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 29 Nov 2022 04:01:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99834

> -----Original Message-----
> From: openembedded-devel@lists.openembedded.org <openembedded-devel@lists=
.openembedded.org> On Behalf Of wangmy
> Sent: den 28 november 2022 07:10
> To: openembedded-devel@lists.openembedded.org
> Cc: Wang Mingyu <wangmy@fujitsu.com>
> Subject: [oe] [meta-networking] [PATCH] lldpd: upgrade 1.0.15 -> 1.0.16
>=20
> From: Wang Mingyu <wangmy@fujitsu.com>
>=20
> Fix:
> =3D=3D=3D=3D=3D=3D
>     Do not use 00:00:00:00:00:00 as chassis ID.
>     Do not busy loop when an interface with a neighbor disappears.
>=20
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  .../recipes-daemons/lldpd/{lldpd_1.0.15.bb =3D> lldpd_1.0.16.bb}  | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-networking/recipes-daemons/lldpd/{lldpd_1.0.15.bb =3D> lldpd=
_1.0.16.bb} (96%)
>=20
> diff --git a/meta-networking/recipes-daemons/lldpd/lldpd_1.0.15.bb b/meta=
-networking/recipes-daemons/lldpd/lldpd_1.0.16.bb
> similarity index 96%
> rename from meta-networking/recipes-daemons/lldpd/lldpd_1.0.15.bb
> rename to meta-networking/recipes-daemons/lldpd/lldpd_1.0.16.bb
> index c7237d74b..45425561f 100644
> --- a/meta-networking/recipes-daemons/lldpd/lldpd_1.0.15.bb
> +++ b/meta-networking/recipes-daemons/lldpd/lldpd_1.0.16.bb
> @@ -12,7 +12,7 @@ SRC_URI =3D "\
>      file://run-ptest \
>      "
>=20
> -SRC_URI[sha256sum] =3D "f7fe3a130be98a19c491479ef60f36b8ee41a9e6bc4d7f2c=
41033f63956a3126"
> +SRC_URI[sha256sum] =3D "e3b391650c7ba67cea2fe84d67fdb4d7fc8aa1ec5cf86eb8=
bb984711df8465a9"

This was for some reason integrated without the checksum update.=20
However, a subsequent commit changed the SRC_URI (from media.luffy.cx=20
to github.com), which caused a change to the checksum as I now get:

ERROR: lldpd-1.0.16-r0 do_fetch: Fetcher failure for URL:=20
'https://github.com/lldpd/lldpd/releases/download/1.0.16/lldpd-1.0.16.tar.g=
z'.=20
Checksum mismatch! File: '.../downloads/lldpd-1.0.16.tar.gz.tmp' has sha256=
=20
checksum '7753c6e31e938923185f4e10c4ab328929729e22ee4a9687d08881fb82c092ee'=
=20
when 'f7fe3a130be98a19c491479ef60f36b8ee41a9e6bc4d7f2c41033f63956a3126' was=
=20
expected

I.e., the checksums for the 1.0.16 tarball on media.luffy.cx does not match=
=20
the checksum of the same tar ball on github.com. And comparing the contents=
=20
of the two identically named tarballs reveals that the one from=20
media.luffy.cx has been generated with newer version of autoconf and=20
automake.

I also wonder if the change of SRC_URI, which was triggered by the AB not=20
being able to fetch the tarball, was really due to the checksum not having=
=20
been updated when the recipe version was stepped.

Based on the above, my recommendation is to revert commit e154914718 (i.e.,=
=20
the SRC_URI update), and then update the checksum as per the originally=20
supplied patch from Wang Mingyu:

SRC_URI[sha256sum] =3D "e3b391650c7ba67cea2fe84d67fdb4d7fc8aa1ec5cf86eb8bb9=
84711df8465a9"

I will send two patches to do this.

>=20
>  inherit autotools update-rc.d useradd systemd pkgconfig bash-completion =
github-releases ptest
>=20
> --
> 2.25.1

//Peter


