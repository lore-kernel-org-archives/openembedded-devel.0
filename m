Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by mail.openembedded.org (Postfix) with ESMTP id 19F0A79C4F
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Oct 2018 12:47:50 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id i15-v6so1033341qtr.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Oct 2018 05:47:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=i5A8t+nvZG9m6H/JvImTLu7IcmbUeRbxMIIInJDOUPs=;
	b=ZxjuTkyLPsVPdkB8MItVYm1FwAcxCisP8GxckE2FXjXIP3axMJpSl1VutBgGjWInuV
	QPJbZ4RqHRo/50LMjZNmCuogrVpzWuUFNiuUmRPP+jZ27B6CQ67W9T+QFjuySGTnPSi2
	dWYMKeAeay3/uGv0zwcT2v676dD6jKZIn3f+AlNwqa1ozBwvL5JosL2wRjYS6Dj4KIlY
	nWVvdzjkfUP7LKYj4SbW3QEk9PfV+QQ8YLVjdM/0OxeHXMbs/KFll0ww2+wsuuKkS2NG
	ZnYot2l/aBqPSB/L4szccLkz1L8QyOkh7bh691UDkYaz/r1JnW4gYuKXU/J2rclrt4j7
	wwxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=i5A8t+nvZG9m6H/JvImTLu7IcmbUeRbxMIIInJDOUPs=;
	b=a93uFpcxi8RRM/5YmLXCWZ8nkkDUsVSH0uvtPCDlF8yNW2hKLr655LNatguW6GQWPg
	NSAeqEeHaesvIUhe0ATxksZwY6yQV/wlKIkqAd3YlvaImShUmFq/FEEKPENzM7EG1XZ2
	UlerseVWc/Cszo/8LYVQmlKuNAPb5+cP6YXBOTO2LEY9Hx+d8PB7koi6fQ2hTFRu5N5z
	8xozmO+yttPsHNh2a9h32CC0Mz9S19o+nPE0QWltAOR0O79iRN8urRv8ngrQ8wcC0ekf
	oK7S1zBntyFjW3jHIfqgceeHZ8BtGCMUlLJxKLm8Twve6SvM6ZAHmTaW2+5Nw+obRX2U
	c5fg==
X-Gm-Message-State: AGRZ1gI4sx5m9/vXvefJtKdrfJF4feXXxq3PNJj4kDGTmSIVWhHo72g7
	nFaVdmAsqzv3WuWq0su78L11kHImLi+t41K+wHLztTvBW5c=
X-Google-Smtp-Source: AJdET5ddad65hHtzHVmVoe4g9eB55LNaWchSDdR9MKSeeK72Ehpg6iEGGL/P/SW7mtHdsgO+vadugv+UHiEhICIJAVQ=
X-Received: by 2002:ac8:16e4:: with SMTP id
	y33-v6mr3056739qtk.253.1540558071613; 
	Fri, 26 Oct 2018 05:47:51 -0700 (PDT)
MIME-Version: 1.0
References: <20181026104857.32142-1-schnitzeltony@gmail.com>
	<20181026104857.32142-3-schnitzeltony@gmail.com>
In-Reply-To: <20181026104857.32142-3-schnitzeltony@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 26 Oct 2018 13:47:25 +0100
Message-ID: <CAMKF1srLRF6KCLRycLHHTzAC8nAbF-QGtxMHxBUSwdFO--qYtQ@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 3/8] catfish: initial add 1.4.6
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
X-List-Received-Date: Fri, 26 Oct 2018 12:47:51 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 26, 2018 at 11:49 AM Andreas M=C3=BCller <schnitzeltony@gmail.c=
om> wrote:
>
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> ---
>  meta-xfce/recipes-apps/catfish/catfish_1.4.6.bb | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>  create mode 100644 meta-xfce/recipes-apps/catfish/catfish_1.4.6.bb
>
> diff --git a/meta-xfce/recipes-apps/catfish/catfish_1.4.6.bb b/meta-xfce/=
recipes-apps/catfish/catfish_1.4.6.bb
> new file mode 100644
> index 000000000..229f882d0
> --- /dev/null
> +++ b/meta-xfce/recipes-apps/catfish/catfish_1.4.6.bb
> @@ -0,0 +1,17 @@
> +SUMMARY =3D "Catfish is a handy file searching tool for linux and unix"
> +SECTION =3D "x11/application"
> +LICENSE =3D "GPLv2"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4325afd396febcb659c36b4953313=
5d4"
> +
> +inherit xfce-app distutils3 gtk-icon-cache
> +
> +DEPENDS +=3D "python3-distutils-extra-native"
> +
> +B =3D "${S}"

perhaps, inheriting autotools-brokensep is aligned here.

> +
> +SRC_URI[md5sum] =3D "879197c9400be2a80d51abf494bfffb6"
> +SRC_URI[sha256sum] =3D "e1caee14c5268ac781434701c0eb26eddfced2c0f1ae0665=
49583ed05f99adbf"
> +
> +FILES_${PN} +=3D "${datadir}/metainfo"
> +
> +RDEPENDS_${PN} +=3D "python3-pygobject"
> --
> 2.14.5
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

