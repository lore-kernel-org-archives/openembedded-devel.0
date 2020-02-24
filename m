Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com
	[209.85.160.174])
	by mail.openembedded.org (Postfix) with ESMTP id 4C7056109F
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Feb 2020 22:57:55 +0000 (UTC)
Received: by mail-qt1-f174.google.com with SMTP id j23so7748430qtr.11
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Feb 2020 14:57:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=BApO/GZRu31zie7oIywwnpt9e0l0Zi59mwLbDZlQKBs=;
	b=AweyfCLDkSOKvmp2Ns5NgzTmdPEU2ET5em+/93PXyXeNIhg4Rlc/ha1g5RS5NG3Qko
	vzmxMW5DXUNyBtfbGQ4GHATDrsog9R9F19dRk0ypxqdrkkHpBk8LswIvMWYErkVX7R5e
	C8zuGUd3W+K0zBFpmAAK13Kl/vJqYQwmz3lqNd0oQhUwAtl2sT4Jj7JUdGtMAh1AdChV
	svTWUWaUnJ21VXx7tjWZ67sI+MR3FsAtMhlf4A8VuTyvOal1C+gQB/fnXkr7lnYYzUlG
	E9p0E2nlPV3BbWeAeom00BseDQQgCKZar/77B01NTHSCZDFBo6m83K/wazYV6wWOY87T
	3rcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=BApO/GZRu31zie7oIywwnpt9e0l0Zi59mwLbDZlQKBs=;
	b=fiAsAFR5MeVJ0NC0aaa1WCWRFeGCF014mhlRnYRXssaCFmzKu2UzGGoBzs/HrjtAix
	Hf1gNjhX3rbwvh7ZP1MqoRBIEuTkdxZJdwR5A00pNQtT7FoatmxBQq8cdMA83orW6XpM
	WaaobBb2TrXRMHasIGCxspUnzzwnw27V+LHyIXbW+MkFGj2Nso2V/mgbR7+wMLizVAGM
	Z88JZ5q/ZPmANbRfAslkZGsu7ULyDiXwGQWVt6rz0T0PmS0JLYYoy0JRosimTTjxuRPL
	fy5ViFNcmyvB8WT9kXfoRtta6ATbnTaBM2gD+1ROH6KfSUq4cPFboXvvO50hEf4VJ+Of
	Q91Q==
X-Gm-Message-State: APjAAAXt+HanQmr0DCPW8Z/OnF/9ZkAKa6m+hWxCeH8vLEi60A/Muphp
	uaFLoEu1LUT1/ozRzWDegRj11TTrQ102X2cYfd4uxbh6
X-Google-Smtp-Source: APXvYqy+9VSESiPmB88cUajLOwBYWSfDGWgSwg63tgXrSvYgmXrkDf3LPd9apuNeKT3RIJgwdSVAiK/w1aJIUFjCbeo=
X-Received: by 2002:aed:29a4:: with SMTP id o33mr10643557qtd.316.1582585075880;
	Mon, 24 Feb 2020 14:57:55 -0800 (PST)
MIME-Version: 1.0
References: <20200224192340.13855-1-matt.ranostay@konsulko.com>
In-Reply-To: <20200224192340.13855-1-matt.ranostay@konsulko.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 24 Feb 2020 14:57:45 -0800
Message-ID: <CAMKF1so_Nd40FHv=3D0zxGojM=J2XaCnDBz-O+wbaibowhqvZw@mail.gmail.com>
To: Matt Ranostay <matt.ranostay@konsulko.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] ttf-noto-emoji: add recipe
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
X-List-Received-Date: Mon, 24 Feb 2020 22:57:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 24, 2020 at 11:24 AM Matt Ranostay <matt.ranostay@konsulko.com>
wrote:

> Add both B/W and color emojis fonts from the noto-emoji project.
>
> Important note for the color emojis to render the pixmap PACKAGECONFIG
> option needs to be set in freetype package.
>
> Signed-off-by: Matt Ranostay <matt.ranostay@konsulko.com>
> ---
>  .../ttf-fonts/ttf-noto-emoji_20190815.bb      | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>  create mode 100644 meta-oe/recipes-graphics/ttf-fonts/
> ttf-noto-emoji_20190815.bb
>
> diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-noto-emoji_20190815.b=
b
> b/meta-oe/recipes-graphics/ttf-fonts/ttf-noto-emoji_20190815.bb
> new file mode 100644
> index 000000000..e35e08ae1
> --- /dev/null
> +++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-noto-emoji_20190815.bb
> @@ -0,0 +1,19 @@
> +require ttf.inc
> +
> +SUMMARY =3D "Google noto emoji font pack"
> +HOMEPAGE =3D "https://github.com/googlefonts/noto-emoji"
> +LICENSE =3D "OFL-1.1"
> +LIC_FILES_CHKSUM =3D
> "file://${S}/fonts/LICENSE;md5=3D55719faa0112708e946b820b24b14097"


Do we need S here ?

>
> +
> +SRC_URI =3D "git://
> github.com/googlefonts/noto-emoji;protocol=3Dhttps;branch=3Dmaster"


Drop branch here master is default

>
> +SRCREV =3D "833a43d03246a9325e748a2d783006454d76ff66"
> +
> +PACKAGES =3D "${PN}-color ${PN}-regular"
> +FONT_PACKAGES =3D "${PN}-color ${PN}-regular"
> +
> +S =3D "${WORKDIR}/git"
> +
> +FILES_${PN}-color =3D "${datadir}/fonts/truetype/NotoColorEmoji.ttf"
> +FILES_${PN}-regular =3D "${datadir}/fonts/truetype/NotoEmoji-Regular.ttf=
"
> +
> +do_compile[noexec] =3D "1=E2=80=9D


I wonder how f this should simply use deltask here

>
> --
> 2.20.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

