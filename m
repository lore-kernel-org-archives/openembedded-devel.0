Return-Path: <jermain.horsman@nedap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CF18CDB465
	for <webhook@archiver.kernel.org>; Thu, 19 Oct 2023 09:34:59 +0000 (UTC)
Subject: Re: [meta-java][master][PATCH] meta-java: Adapt LICENSE as SPDX identifiers
To: openembedded-devel@lists.openembedded.org
From: "Jermain Horsman" <jermain.horsman@nedap.com>
X-Originating-Location: Groenlo, Gelderland, NL (149.3.168.10)
X-Originating-Platform: Windows Firefox 118
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 19 Oct 2023 02:34:54 -0700
References: <20231018104335.478441-1-akash.hadke27@gmail.com>
In-Reply-To: <20231018104335.478441-1-akash.hadke27@gmail.com>
Message-ID: <6763.1697708094189515372@lists.openembedded.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 19 Oct 2023 09:34:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105597

On Wed, Oct 18, 2023 at 12:44 PM, akash hadke wrote:

> diff --git a/recipes-core/cacao/cacao_git.bb b/recipes-core/cacao/cacao_g=
it.bb
> index fef7f34..80129b1 100644
> --- a/recipes-core/cacao/cacao_git.bb
> +++ b/recipes-core/cacao/cacao_git.bb
> @@ -1,6 +1,6 @@
>  SUMMARY =3D "CacaoVM for use as OpenEmbedded's Java VM"
>  HOMEPAGE =3D "http://www.cacaojvm.org/"
> -LICENSE  =3D "GPL-2.0"
> +LICENSE  =3D "GPL-2.0-only"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D59530bdf33659b29e73d4adb9f9f6=
552"
>  SECTION  =3D "interpreters"
> =20

You might want to double check the source,=20
a quick look at e.g. https://bitbucket.org/cacaovm/cacao/src/master/COPYING=
:

    This program is free software; you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation; either version 2 of the License, or
    (at your option) any later version.

shows this should be 'GPL-2.0-or-later' instead.

