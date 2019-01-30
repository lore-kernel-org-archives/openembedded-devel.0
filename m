Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com
	[209.85.222.178])
	by mail.openembedded.org (Postfix) with ESMTP id 1B2E37C243
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Jan 2019 15:57:41 +0000 (UTC)
Received: by mail-qk1-f178.google.com with SMTP id y78so13930163qka.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Jan 2019 07:57:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=OjA7oAv+/2YxTyyb7SuJRlFx7kQ0uI3ynymREXJGtCQ=;
	b=V1ntpwA11lPERIhV5d0goQPK0TmZ4pXSruOKcZwpWR62zvNRVCV7P05VGZ2cwRGrbh
	I+ibYg7MeibVxIsB9bRWycDDEtesYlqGkR9D90faiUAeaxi7Jv3h63uOstZUyWRDihGP
	pwCQL6As1U58nC8fYsCOTqPGLIHhRRcZjYJZ2KQfhLyRy9MBAJjvx5enrd+JSlgzrPzW
	JeByT04YVp8FFcZQSsMsSTwiLhs1wBoIBTFO3Kt6kQo0sMJIp0o+BsA4rXp4EKhW6/Sh
	Hkz5kT24A5qbZHUZa/dsNb0WLqH+52261cfatNDTRCauVNiUX/3kYITvFycKVxshFhVl
	nGLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=OjA7oAv+/2YxTyyb7SuJRlFx7kQ0uI3ynymREXJGtCQ=;
	b=sR9Y5RyNHEyezKvcc+2tId9ocQqeVkALPX6U0ev3eVyWPLLYtUb9jeCy/LN1GrMk9s
	nObt7C4KcUM86HX3T9DtwCxIFLOCk8Usqg6jYq1gq4wMPp6UhzWd5p+lKMBiFVB1AnTh
	45cFh5cUELPxp6JcgjWTVjXZ/Gb2laLtqhUgMahH49LJQvgCuQ0nxGyhYyKl8FjTP588
	BKJRqKa/6yLhTtynBvoVjuP3roOx856nJXCP+Su9RuJYR8ZlftLFa8ns/0koEzpo6KWV
	dzJ2rBR69Pa4mzggXHhiMnaJW4TExPfXAxULuOhcafU/+S8/8HCQsWBWf5jzSjM1r2Lb
	lIHw==
X-Gm-Message-State: AJcUukfsih8xjt70O/kdVm6oWCdHhVbqHAcHIi5wkDzQjy2DY/zWoG5K
	Gk5zGMIz6XShBbxv1l4/XtD/HeBWUB8wxlwsyc0=
X-Google-Smtp-Source: ALg8bN4sOCmsvF4z/zgxgUU7saq6UqfgqEw4dp6QA+g3Pdw4G6EuDaAwg4tY5gtkgeUGL1euDqGqPelF1DVb3YYaJDg=
X-Received: by 2002:ae9:dc43:: with SMTP id q64mr27607221qkf.223.1548863862252;
	Wed, 30 Jan 2019 07:57:42 -0800 (PST)
MIME-Version: 1.0
References: <20190129001328.15320-1-maxime.roussinbelanger@gmail.com>
In-Reply-To: <20190129001328.15320-1-maxime.roussinbelanger@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 30 Jan 2019 07:57:16 -0800
Message-ID: <CAMKF1srpfKCKbaaHed7OKLDeM=R=CEbG5mWpbgSFR+Ye24UXMQ@mail.gmail.com>
To: =?UTF-8?Q?Maxime_Roussin=2DB=C3=A9langer?=
	<maxime.roussinbelanger@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] libeigen: update from 3.3.5 -> 3.3.7
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 30 Jan 2019 15:57:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Maxime

I am seeing fetch failures on one of build machines

http://errors.yoctoproject.org/Errors/Details/220286/

Can you try a build after doing -ccleanall ?

bitbake -ccleanall libeigen
bitbake libeigen

On Mon, Jan 28, 2019 at 4:15 PM Maxime Roussin-B=C3=A9langer
<maxime.roussinbelanger@gmail.com> wrote:
>
> Signed-off-by: Maxime Roussin-B=C3=A9langer <maxime.roussinbelanger@gmail=
.com>
> ---
>  .../libeigen/{libeigen_3.3.5.bb =3D> libeigen_3.3.7.bb}       | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>  rename meta-oe/recipes-support/libeigen/{libeigen_3.3.5.bb =3D> libeigen=
_3.3.7.bb} (79%)
>
> diff --git a/meta-oe/recipes-support/libeigen/libeigen_3.3.5.bb b/meta-oe=
/recipes-support/libeigen/libeigen_3.3.7.bb
> similarity index 79%
> rename from meta-oe/recipes-support/libeigen/libeigen_3.3.5.bb
> rename to meta-oe/recipes-support/libeigen/libeigen_3.3.7.bb
> index 7078e50bb0..3be04478b0 100644
> --- a/meta-oe/recipes-support/libeigen/libeigen_3.3.5.bb
> +++ b/meta-oe/recipes-support/libeigen/libeigen_3.3.7.bb
> @@ -5,10 +5,10 @@ LICENSE =3D "MPL-2.0"
>  LIC_FILES_CHKSUM =3D "file://COPYING.MPL2;md5=3D815ca599c9df247a0c7f619b=
ab123dad"
>
>  SRC_URI =3D "http://bitbucket.org/eigen/eigen/get/${PV}.tar.bz2;download=
filename=3D${BP}.tar.bz2"
> -SRC_URI[md5sum] =3D "e83549a79d1b721da0f8899ab34edf95"
> -SRC_URI[sha256sum] =3D "7352bff3ea299e4c7d7fbe31c504f8eb9149d7e685dec5a1=
2fbaa26379f603e2"
> +SRC_URI[md5sum] =3D "05b1f7511c93980c385ebe11bd3c93fa"
> +SRC_URI[sha256sum] =3D "9f13cf90dedbe3e52a19f43000d71fdf72e986beb9a5436d=
ddcd61ff9d77a3ce"
>
> -S =3D "${WORKDIR}/eigen-eigen-b3f3d4950030"
> +S =3D "${WORKDIR}/eigen-eigen-323c052e1731"
>
>  inherit cmake
>
> --
> 2.20.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

