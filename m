Return-Path: <nathan@nathanrossi.com>
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
	[209.85.160.195])
	by mail.openembedded.org (Postfix) with ESMTP id B8F536D156
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Nov 2018 06:04:33 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id k12so14257589qtf.7
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 24 Nov 2018 22:04:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=eM8QYlMSsKR1wHgOkp9NvdKh6NsIgOTjBpm0spOsBz0=;
	b=isZjWjlOKuDQIBV4rUSoJ/y35i19YW3zfjDlvJfWvcB0x/ckiqkFmN17hvgYuMg9XN
	GQRjJ7kbROE39bvICN/UNCkx7aIWE+yRD1exYb21R6BzZPkG/zaNUFypVms9mt6/czm5
	s+0L2u7zPF7vQ8dSAq4cLYqhYYIXDzCzdglCYgsEHWjqGuTqKIAooCQdNkOhhrqhmWk6
	nMHVIt93CmV2mfHqv7kLbL3kUgTriS0qj0TkpoZrqMZ/BYENTutChbFamz+NJT2reu9F
	7OhYwpkI5YWBjOWMIpxiXLg7aD2uY60dQpqlUropc1mzevL1qBkht6fH5Orxs795OQY9
	uldA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=eM8QYlMSsKR1wHgOkp9NvdKh6NsIgOTjBpm0spOsBz0=;
	b=UN6cYHRgsg+AtQG5O029sEPNXVa+G/Hk15i3f9w5PDOZ73DljCs9FnnC7LDRFQYSbm
	rIFQZ0uDYd/pxd/Wcis2Rm+6s/4P3k8pvU/9EcyysN2yIQJWeaNr8BiipKH5/V8vsgcn
	kxNdBnLTgeC+DzUNhYg3W2VSxc0Yx43hwLw9PGQLeTApU3neLJp0PdJqdA5xhWlmKoFh
	F7g76KeTWhLyWykyqsN1Fuz9IIrGfjPE38/dRzFn/PKEkaaeFGRxFcrzKQnYyIzvvAFP
	+xtJvwnc9HQFLE5944Mpzzl3GiqHpNkNTKmF6fxorp+syLWmhhhUlpvPG4JIiAM5QPWB
	2gtg==
X-Gm-Message-State: AGRZ1gLShtItvI59LHkE13ds0wwf0uDrIYupAxuCl3SxXy6Ke1to4nnX
	OiKkiMqfLoo5zCO/N0NCwXQFfmqyuUV3NdsQwJRXxA==
X-Google-Smtp-Source: AJdET5e8hFa19HHFirFw29COSHaRTPT0hg1aXT5+yznYBriB3DCbX+veTTVk9DytA6akooUgRtAEukzzU2IR2yA/2A0=
X-Received: by 2002:ac8:7250:: with SMTP id l16mr20682973qtp.348.1543125874646;
	Sat, 24 Nov 2018 22:04:34 -0800 (PST)
MIME-Version: 1.0
References: <20181123153941.10186-1-brgl@bgdev.pl>
In-Reply-To: <20181123153941.10186-1-brgl@bgdev.pl>
From: Nathan Rossi <nathan@nathanrossi.com>
Date: Sun, 25 Nov 2018 16:04:23 +1000
Message-ID: <CA+aJhH0KL7nzmkGUgUyD-h-ghf6u65uqeGOVavjV=u1fW6QQvg@mail.gmail.com>
To: brgl@bgdev.pl
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH 0/6] sigrok: set of new packages
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
X-List-Received-Date: Sun, 25 Nov 2018 06:04:33 -0000
Content-Type: text/plain; charset="UTF-8"

On Sat, 24 Nov 2018 at 01:39, Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> This series adds recipes for libsigrok and accompanying libraries and
> tools. The eventual goal is to add pulseview - the graphical interface
> for sigrok - to meta-qt5-extra.
>
> First two patches add external packages used by libsigrok. The third
> patch adds a recipe for native doxygen, which is needed to generate
> libsigrok C++ bindings which will in turn be necessary to build
> pulseview.
>
> Last three patches add recipes for the sigrok suite including the
> command-line utility - sigrok-cli.
>
> Bartosz Golaszewski (6):
>   libzip: new package
>   libserialport: new package
>   doxygen: new native package
>   libsigrok: new package
>   libsigrokdecode: new package
>   sigrok-cli: new package

Anything against marking all the recipes (excluding doxygen) with
BBCLASSEXTEND = "native nativesdk"?

Also any plans to include recipes for any of the firmware data
packages that sigrok provides? (e.g. sigrok-firmware-fx2lafw)

Thanks,
Nathan

>
>  .../doxygen/doxygen-native_1.8.14.bb          | 15 ++++++++
>  .../0001-build-don-t-look-for-Iconv.patch     | 36 +++++++++++++++++++
>  .../libserialport/libserialport_0.1.1.bb      | 12 +++++++
>  .../recipes-extended/libzip/libzip_1.5.1.bb   | 18 ++++++++++
>  .../sigrok/libsigrok_0.5.1.bb                 | 23 ++++++++++++
>  .../sigrok/libsigrokdecode_0.5.2.bb           | 14 ++++++++
>  .../sigrok/sigrok-cli_0.7.0.bb                | 18 ++++++++++
>  7 files changed, 136 insertions(+)
>  create mode 100644 meta-oe/recipes-devtools/doxygen/doxygen-native_1.8.14.bb
>  create mode 100644 meta-oe/recipes-devtools/doxygen/doxygen/0001-build-don-t-look-for-Iconv.patch
>  create mode 100644 meta-oe/recipes-extended/libserialport/libserialport_0.1.1.bb
>  create mode 100644 meta-oe/recipes-extended/libzip/libzip_1.5.1.bb
>  create mode 100644 meta-oe/recipes-extended/sigrok/libsigrok_0.5.1.bb
>  create mode 100644 meta-oe/recipes-extended/sigrok/libsigrokdecode_0.5.2.bb
>  create mode 100644 meta-oe/recipes-extended/sigrok/sigrok-cli_0.7.0.bb
>
> --
> 2.19.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

