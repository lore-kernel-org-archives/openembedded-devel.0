Return-Path: <brgl@bgdev.pl>
Received: from mail-it0-f66.google.com (mail-it0-f66.google.com
	[209.85.214.66])
	by mail.openembedded.org (Postfix) with ESMTP id 40FB8760A7
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Jun 2018 07:47:23 +0000 (UTC)
Received: by mail-it0-f66.google.com with SMTP id y127-v6so15460837itd.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Jun 2018 00:47:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=IUgfnqaS3N04fM5Q14uHrz8C42/mEybGmGZ3mhB1pgk=;
	b=dSS1sTfmSPlkeoQV00OcmZu11CWBxx94JIRZ49zI4CK+t0NeZovgzeOn+QlRiuSB6s
	pDm7HZdm7e57gDpdKE1O4jY3pFRfAsmh1uB5oFRI+9uUvclwGORl8elAMTkqPYd2TfrW
	LW+Q7GE6XGgJ8c9QwLl8pjbmsyPZ+Il++0CtOYRFWa5PJ0Gk8opymOALje2LrH2PUsEr
	2iWu3ixo5a8mGZuyco22brf301m/EJAHUn72WTbNWopTbmWFWhrlWckmInCE+7FPO/X3
	BvRobxzj+TpFjsTeIKHr8jMmtIrGGzWXBAYrf2ZkbBMISw0scZw6wHIuB1FzDYqcchgv
	UQSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=IUgfnqaS3N04fM5Q14uHrz8C42/mEybGmGZ3mhB1pgk=;
	b=JYc5L2/0NPPoYwvXW92E6VIX4hvT9JY1+ig9jiu7fTVPbt76EM5hagPUsvENw47AaK
	eUL9l/oQXijIldojeLrJCli0CwQKZbbURcWVNFc8ZYXtKPDRtlukHk65lI8qyOXIhaSO
	2LNzuw/JwXr9WdIUONODNHxyDHet9KfEImZiuEPJcH//hH3Noc5+44xtmOCtVVyFqqpS
	XA8WlX4+qDeYkKWVjTcxLI92IhJiwReKtD9QPVwTUzSHWwDlAoBmDm+x3SOLsFabDyhq
	QVilgpeG6m0u5RFaEqIS47387xBv+EXU15akKj16U1AJnwVcWtMVDhY28+zXhn4Dl4Bz
	GbRQ==
X-Gm-Message-State: APt69E0eUoIxAd/BFEavlR/EX7HCmdh3MD0XAG0BTJxPsixDzmN01wi7
	qBtqbOo7UNlnbZK9I8ZJsmbUQq56p+G7AzWrurBBJcyB
X-Google-Smtp-Source: ADUXVKKQ/vTncrv7iXOmAGYfu5TkQyP52R2DRodRvpX6A8tFEF1gSLho0KrYcfye58y28PEh+K5YgPDShGnWnGQ4aFU=
X-Received: by 2002:a24:8385:: with SMTP id
	d127-v6mr1496110ite.58.1528271244161; 
	Wed, 06 Jun 2018 00:47:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a6b:b597:0:0:0:0:0 with HTTP;
	Wed, 6 Jun 2018 00:47:23 -0700 (PDT)
In-Reply-To: <20180523182331.23083-2-mnhu@prevas.dk>
References: <20180523182331.23083-1-mnhu@prevas.dk>
	<20180523182331.23083-2-mnhu@prevas.dk>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 6 Jun 2018 09:47:23 +0200
Message-ID: <CAMRc=Mdr1c+wSYo6uVQRrnoZEvbP5kkirgp3T3c3kHX3AiTRQg@mail.gmail.com>
To: =?UTF-8?Q?Martin_Hundeb=C3=B8ll?= <mnhu@prevas.dk>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 2/2] libgpiod: add packageconfig for python bindings
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
X-List-Received-Date: Wed, 06 Jun 2018 07:47:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

2018-05-23 20:23 GMT+02:00 Martin Hundeb=C3=B8ll <mnhu@prevas.dk>:
> Signed-off-by: Martin Hundeb=C3=B8ll <mnhu@prevas.dk>
> ---
>  meta-oe/recipes-support/libgpiod/libgpiod_1.1.bb | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_1.1.bb b/meta-oe/r=
ecipes-support/libgpiod/libgpiod_1.1.bb
> index c2e11ad38..1bda8bc3a 100644
> --- a/meta-oe/recipes-support/libgpiod/libgpiod_1.1.bb
> +++ b/meta-oe/recipes-support/libgpiod/libgpiod_1.1.bb
> @@ -4,3 +4,11 @@ DEPENDS +=3D "autoconf-archive-native"
>
>  SRC_URI[md5sum] =3D "80237a047a9d653a14c5d71e5ce9d641"
>  SRC_URI[sha256sum] =3D "9758466468a7ef3f5e30c182c1303abef6241e665cda4d82=
a64328a7474838c1"
> +
> +PACKAGECONFIG[python3] =3D "--enable-bindings-python,--disable-bindings-=
python,python3,python3-core"
> +inherit ${@bb.utils.contains('PACKAGECONFIG', 'python3', 'python3native'=
, '', d)}
> +
> +PACKAGES =3D+ "${PN}-python"
> +FILES_${PN}-python =3D "${PYTHON_SITEPACKAGES_DIR}"
> +RRECOMMENDS_PYTHON =3D "${@bb.utils.contains('PACKAGECONFIG', 'python3',=
 '${PN}-python', '',d)}"
> +RRECOMMENDS_${PN} +=3D "${RRECOMMENDS_PYTHON}"
> --
> 2.17.0
>

Thanks! Could you maybe do the same for C++ bindings?

Bart

