Return-Path: <Anders.Montonen@iki.fi>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65AA1C36010
	for <webhook@archiver.kernel.org>; Fri,  4 Apr 2025 22:58:58 +0000 (UTC)
Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.24])
 by mx.groups.io with SMTP id smtpd.web10.702.1743807529273404766
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 04 Apr 2025 15:58:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kapsi.fi header.s=20161220 header.b=1tGieyMF;
 spf=pass (domain: kapsi.fi, ip: 91.232.154.24, mailfrom: antime@kapsi.fi)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
	s=20161220; h=To:References:Message-Id:Content-Transfer-Encoding:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Content-Type:Sender:Reply-To:Content-ID
	:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
	Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe
	:List-Post:List-Owner:List-Archive;
	bh=RlVEKC3gj4yvOaGZTfyudalIagR6TII/3DZy98fk1ls=; b=1tGieyMFWiLMrKyCA56MY9P6sj
	Fe3I7r/eNG3AH86K6ilpcPhxYOpC7uxsFVrT9B0yYTTY7cfWSOLcbG2idNZvgVzrdlCWeXxRlRej1
	mcV+PQQ9d9jQ1qDrURfOUBebrpN7P06/XoXSjMXTEh22YUMp3TzrXV49Iic+IO2mE5iRYRTRqBZyr
	ZOn7VPTokG8FD19ugdMEs4bxbKlHR7D5vQTm8L6YbLjzFW30beS47CXRlqwS35HUbjwOSk/1DDYnx
	UZhvtYPpjsSYHGLjCs8iBZN1OEg9b/vfQ4hAFsUsw2GsfXqeX6G43dhV13dslvqIS2ZJeuHM8SZez
	5cbiCnHA==;
Received: from 87-92-53-190.bb.dnainternet.fi ([87.92.53.190] helo=[192.168.1.137])
	by mail.kapsi.fi with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <Anders.Montonen@iki.fi>)
	id 1u0pzp-0068ye-1P;
	Sat, 05 Apr 2025 01:58:45 +0300
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.21\))
Subject: Re: [oe] [PATCH v2] nano: update from 8.3 -> 8.4
From: Anders Montonen <Anders.Montonen@iki.fi>
In-Reply-To: <20250404003320.1703471-1-Randy.MacLeod@windriver.com>
Date: Sat, 5 Apr 2025 01:58:44 +0300
Cc: openembedded-devel@lists.openembedded.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <FC376EA8-6664-4B03-8334-5E852F65545C@iki.fi>
References: <20250404003320.1703471-1-Randy.MacLeod@windriver.com>
To: randy.macleod@windriver.com
X-Mailer: Apple Mail (2.3445.104.21)
X-SA-Exim-Connect-IP: 87.92.53.190
X-SA-Exim-Mail-From: Anders.Montonen@iki.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 04 Apr 2025 22:58:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116594

Hi,

> On 4 Apr 2025, at 3:33, Randy MacLeod via lists.openembedded.org =
<randy.macleod=3Dwindriver.com@lists.openembedded.org> wrote:
>=20
> From: Randy MacLeod <Randy.MacLeod@windriver.com>
>=20
> Release notes:
>   https://lists.gnu.org/archive/html/info-gnu/2025-04/msg00001.html
>=20
> The license file checksum changed because upstream added the line:
>   SPDX-License-Identifier: BSD-3-Clause
> Add OECONF to avoid build-time checks for strcase[str|cmp], both of
> which have been in glibc and musl for > 10 years so it's sensible to
> default to yes.
>=20
> Adjust the patches using devtool and manually munge the =
Upstream-Status-es.
>=20
> Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
> =E2=80=94

The commit message doesn=E2=80=99t fully match the contents, there=E2=80=99=
s no license file changes nor updated patches.

Regards,
Anders

> .../recipes-support/nano/{nano_8.3.bb =3D> nano_8.4.bb}    | 9 =
++++++++-
> 1 file changed, 8 insertions(+), 1 deletion(-)
> rename meta-oe/recipes-support/nano/{nano_8.3.bb =3D> nano_8.4.bb} =
(75%)
>=20
> diff --git a/meta-oe/recipes-support/nano/nano_8.3.bb =
b/meta-oe/recipes-support/nano/nano_8.4.bb
> similarity index 75%
> rename from meta-oe/recipes-support/nano/nano_8.3.bb
> rename to meta-oe/recipes-support/nano/nano_8.4.bb
> index d1af89ef8d..1aae49d3b6 100644
> --- a/meta-oe/recipes-support/nano/nano_8.3.bb
> +++ b/meta-oe/recipes-support/nano/nano_8.4.bb
> @@ -13,10 +13,17 @@ RDEPENDS:${PN} =3D "ncurses-terminfo-base"
> PV_MAJOR =3D "${@d.getVar('PV').split('.')[0]}"
>=20
> SRC_URI =3D =
"https://nano-editor.org/dist/v${PV_MAJOR}/nano-${PV}.tar.xz"
> -SRC_URI[sha256sum] =3D =
"551b717b2e28f7e90f749323686a1b5bbbd84cfa1390604d854a3ca3778f111e"
> +SRC_URI[sha256sum] =3D =
"5ad29222bbd55624d87ea677928b3106a743114d6c6f9b41f36c97be2a8e628d"
>=20
> UPSTREAM_CHECK_URI =3D "https://ftp.gnu.org/gnu/nano"
>=20
> inherit autotools gettext pkgconfig
>=20
> +EXTRA_OECONF =3D " \
> +    ac_cv_func_strcasestr=3Dyes \
> +    gl_cv_func_strcasecmp_works=3Dyes \
> +    ac_cv_func_strcasecmp=3Dyes \
> +"
> +
> +
> PACKAGECONFIG[tiny] =3D "--enable-tiny,"
> --=20
> 2.34.1
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#116553): =
https://lists.openembedded.org/g/openembedded-devel/message/116553
> Mute This Topic: https://lists.openembedded.org/mt/112076927/3618057
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[Anders.Montonen@iki.fi]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


