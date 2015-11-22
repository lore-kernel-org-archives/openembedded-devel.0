Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id 8E4FB60110
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 22 Nov 2015 17:44:37 +0000 (UTC)
Received: by wmec201 with SMTP id c201so78583396wme.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 22 Nov 2015 09:44:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=dominion-thruhere-net.20150623.gappssmtp.com; s=20150623;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=G+ebfHpC2xnKtWbMOmoJpZDuqisFb/Vb9zqUA4RBX5I=;
	b=Jg+NN9UfnnRbaZAD6fFyqYhWaCmskj6mpe4wmIspKsDdFb3xQjSVqgCYSJ+pTeNM73
	mm2vkJ8tloeuimpPNZFA9DWVhY2GROOtYupNjyZ+mAOrUknHg3rD0oZBnQiwXfUPwU4a
	omvATt3blmDEpw340JMRYUo5NvpD06oxYzip9Zseq6jzHVAJRVgAHReBLYlSXBTfJmcs
	cPNUWWkxQK6lPud4DfFweoEo28AZpTakV+s7XdqreKAYsNPmwHLZr9YUcrTkQ3n+j1EN
	9SJjk8N7JB0AMy+ExHlYqirKQGpJy1aB0ji4AKbeuYOjS9BawOdOIwzIW5zPyC9WGhts
	/ygw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=G+ebfHpC2xnKtWbMOmoJpZDuqisFb/Vb9zqUA4RBX5I=;
	b=dZ85LrFzGpo1uEEaI2MtU7CDa8LxNc0pkaotmFpna8Xsz7e6PX9WoR5/4PZ2KRlFpD
	JunOd++C1Cf53Cpo6TMhzRLI0+tvEYd0pkkpyG6Z9JhNBaNo5V868j5PGO1n1LkhkiCi
	bjIZtG4q8ZbYlhN4zoD6qcC+noG9fkaJdEH9pMupUwXDcsG38/O4u185lGzV8H+bsttR
	0WH8xikvvh2KIMjD/lWqLwSxj8Mm6XOen6l+eA/Ip0xso2NLeWKMa+EAd7cl2MBz+WPq
	0y8vS4WxOH98kHW6E29APWLl7NWYM6gYE6qNVkDkuE/50LbN8uJ2VSwG1VFod/OYMGtZ
	8Y0w==
X-Gm-Message-State: ALoCoQmMq0+6UxDjqnpKAtiN7fVdKw/GbVS+w+5mgCGq/z6TRPU4JMkJzOd5Ug/RrfQXB3/tq/FP
X-Received: by 10.28.91.83 with SMTP id p80mr15128825wmb.87.1448214277864;
	Sun, 22 Nov 2015 09:44:37 -0800 (PST)
Received: from ?IPv6:2001:610:612::f44f:d1d8:9860:f439?
	([2001:610:612:0:f44f:d1d8:9860:f439])
	by smtp.gmail.com with ESMTPSA id uz5sm9548268wjc.8.2015.11.22.09.44.35
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 22 Nov 2015 09:44:36 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1448207110-17855-1-git-send-email-fathi.boudra@linaro.org>
Date: Sun, 22 Nov 2015 18:44:33 +0100
Message-Id: <2FB29B02-396E-4D5B-902C-B70BF73162C0@dominion.thruhere.net>
References: <1448207110-17855-1-git-send-email-fathi.boudra@linaro.org>
To: Fathi Boudra <fathi.boudra@linaro.org>
X-Mailer: Apple Mail (2.3112)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] libsoc: upgrade from version 0.6 to 0.7
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
X-List-Received-Date: Sun, 22 Nov 2015 17:44:39 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


> Op 22 nov. 2015, om 16:45 heeft Fathi Boudra <fathi.boudra@linaro.org> =
het volgende geschreven:
>=20
> * update SRCREV
> * add --with-board-configs to configure
> * run oe-stylize to sanitize the recipe

OE-stylize tends to remove the blank lines that are supposed to be =
there, so...

>=20
> Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
> ---
> .../recipes-support/libsoc/{libsoc_0.6.bb =3D> libsoc_0.7.bb}    | 10 =
+++++-----
> 1 file changed, 5 insertions(+), 5 deletions(-)
> rename meta-oe/recipes-support/libsoc/{libsoc_0.6.bb =3D> =
libsoc_0.7.bb} (85%)
>=20
> diff --git a/meta-oe/recipes-support/libsoc/libsoc_0.6.bb =
b/meta-oe/recipes-support/libsoc/libsoc_0.7.bb
> similarity index 85%
> rename from meta-oe/recipes-support/libsoc/libsoc_0.6.bb
> rename to meta-oe/recipes-support/libsoc/libsoc_0.7.bb
> index 79c171a..1a7f4a7 100644
> --- a/meta-oe/recipes-support/libsoc/libsoc_0.6.bb
> +++ b/meta-oe/recipes-support/libsoc/libsoc_0.7.bb
> @@ -1,17 +1,17 @@
> SUMMARY =3D "Library for interfacing with common SoC peripherals"
> DESCRIPTION =3D "libsoc is a C library to interface with common =
peripherals (gpio, i2c, spi, pwm) \
>                found in SoC (System on Chips) through generic Linux =
Kernel interfaces."
> -
> HOMEPAGE =3D "https://github.com/jackmitch/libsoc=E2=80=9D
> -

=E2=80=A6 the 2 above need to stay in

> LICENSE =3D "LGPLv2.1"
> LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3De0bfebea12a718922225ba987b2126a5=E2=80=9D

add one here

> +SRCREV =3D =E2=80=9C4d5c5af71e225cc4e792d2166da3f3e432b08735"
>=20

and drop this one so SRC* lines are together

> -inherit autotools
> -
> -SRCREV =3D "3643cf161a4b37bfbdfd05437166c4a29ac3ed8d"
> SRC_URI =3D "git://github.com/jackmitch/libsoc.git"
>=20
> S =3D "${WORKDIR}/git"
>=20
> +inherit autotools
> +
> +EXTRA_OECONF =3D "--with-board-configs"
> +
> RDEPENDS_${PN} =3D "libgcc"
> --=20
> 2.6.2
>=20
>=20


