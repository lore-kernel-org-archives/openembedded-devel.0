Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5ED1FC433EF
	for <webhook@archiver.kernel.org>; Fri, 14 Jan 2022 13:25:29 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web10.6859.1642166727332353846
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Jan 2022 05:25:28 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@axis.com
 header.s=axis-central1 header.b=HUqD5tXX;
 spf=pass (domain: axis.com, ip: 195.60.68.18,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1642166727;
  x=1673702727;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=ZwYZDFdHh5g9sipD8jWyzjX8uAXLg/0MziAVAkM7dQg=;
  b=HUqD5tXXWTWWVI86ujl1qid/KslCBvIxtYz0JUmy4tl4xqnxJfvTHIB8
   uM/Ij7PItMNHoh53grANebFy4M3HOzYz4DFBxMJQf8RKNJJXGJtbZsQqn
   tTIjfnRlr1yldT/5wqPiNCUdvju268XmhKTvoUvqLXzrb5lUswyZWYymL
   VXUhhteyfP2N8XlyOvzjFQrrYcUrEmxHKQaNqNrgFIOIQQZgyOaqfe0rP
   a1fYwtF738VrKuTkhiLZ24Dxf0V3xTM85InCo/K23af0G/sbiW0yuJO+L
   yrpyq/R6cATocHH49F8RcmJNtairGc4/4HSMMHnjEiu9TtroEOpKLN1O5
   g==;
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Nisha Parrakat <nishaparrakat@gmail.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>, "raj.khem@gmail.com"
	<raj.khem@gmail.com>
Subject: RE: [oe] [meta-oe][dunfell][PATCH 1/2] nodejs_12.21.0.bb: only handle
 npm if configured
Thread-Topic: [oe] [meta-oe][dunfell][PATCH 1/2] nodejs_12.21.0.bb: only
 handle npm if configured
Thread-Index: AQHYCFVq9xVw69repk2ii+LaAWfqCKxigxtw
Date: Fri, 14 Jan 2022 13:25:24 +0000
Message-ID: <9e70a83ae7094421baad114700d6df43@axis.com>
References: <20220113081301.26006-1-nishaparrakat@gmail.com>
In-Reply-To: <20220113081301.26006-1-nishaparrakat@gmail.com>
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
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Jan 2022 13:25:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94833

> -----Original Message-----
> From: openembedded-devel@lists.openembedded.org <openembedded-devel@lists=
.openembedded.org> On Behalf Of Nisha Parrakat
> Sent: den 13 januari 2022 09:13
> To: openembedded-devel@lists.openembedded.org; raj.khem@gmail.com
> Cc: nishaparrakat@gmail.com
> Subject: [oe] [meta-oe][dunfell][PATCH 1/2] nodejs_12.21.0.bb: only handl=
e npm if configured
>=20
> npm-cli.js should be symlinked only when the file is present
> the file may not be available if the configure option is --without-npm
>=20
> Signed-off-by: Nisha Parrakat <nishaparrakat@gmail.com>
> ---
>  meta-oe/recipes-devtools/nodejs/nodejs_12.21.0.bb | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_12.21.0.bb b/meta-oe/=
recipes-devtools/nodejs/nodejs_12.21.0.bb
> index b9e382177..22191a157 100644
> --- a/meta-oe/recipes-devtools/nodejs/nodejs_12.21.0.bb
> +++ b/meta-oe/recipes-devtools/nodejs/nodejs_12.21.0.bb
> @@ -133,7 +133,9 @@ do_install_append_class-native() {
>      # /usr/bin/npm is symlink to /usr/lib/node_modules/npm/bin/npm-cli.j=
s
>      # use sed on npm-cli.js because otherwise symlink is replaced with n=
ormal file and
>      # npm-cli.js continues to use old shebang
> -    sed "1s^.*^#\!/usr/bin/env node^g" -i ${D}${exec_prefix}/lib/node_mo=
dules/npm/bin/npm-cli.js
> +    if [[ -f "${D}${exec_prefix}/lib/node_modules/npm/bin/npm-cli.js" ]]=
; then
> +        sed "1s^.*^#\!/usr/bin/env node^g" -i ${D}${exec_prefix}/lib/nod=
e_modules/npm/bin/npm-cli.js
> +    fi
>=20
>      # Install the native binaries to provide it within sysroot for the t=
arget compilation
>      install -d ${D}${bindir}
> @@ -147,7 +149,9 @@ do_install_append_class-native() {
>  }
>=20
>  do_install_append_class-target() {
> -    sed "1s^.*^#\!${bindir}/env node^g" -i ${D}${exec_prefix}/lib/node_m=
odules/npm/bin/npm-cli.js
> +    if [[ -f "${D}${exec_prefix}/lib/node_modules/npm/bin/npm-cli.js" ]]=
; then
> +        sed "1s^.*^#\!${bindir}/env node^g" -i ${D}${exec_prefix}/lib/no=
de_modules/npm/bin/npm-cli.js
> +    fi
>  }
>=20
>  PACKAGES =3D+ "${PN}-npm"
> --
> 2.17.1

This patch should not be applied because it a) contains bashisms and b)=20
it is better to just remove the workaround as it is no longer needed (see=20
the patches I just sent for master).

//Peter


