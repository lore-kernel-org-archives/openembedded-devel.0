Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 7E4A561330
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Feb 2020 18:54:30 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id s10so3158179wmh.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Feb 2020 10:54:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=M7JtoAD83e1rzHrpZ2EX4oK9GXnI7fUA30YuvdvMvk8=;
	b=WQu/Q8PkHGKR4UbKudgYvlHZmGytPU9kZbzCmfnSnIqk8ztiODG7jQQIO1Le7q7RG5
	wFEzMrRhPRUWM2M8FyoS6cKpd0/821IBIuG1dn6D2FUeoQvYPQNOa3JDBXcBU/Que0CI
	3X0vvDdC0jSfS9qGi53mBpS5+63Sy1V1W+AA/iIKw7/vKiiLeDEu+TgD1zxZuHKUumIq
	8DiFx+VdsSH7U8vP3Pgcf+35UeA9m3cpgpwMBjkboUhktZrp2BPURYtr/7QyyYA9QChc
	7MjQx/mb/LagZ5W01u+Uz4NWDNiW/Eey3cEwD+rhfXKqJqILC96tpWuOiM+JPvmeH9x8
	MjWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=M7JtoAD83e1rzHrpZ2EX4oK9GXnI7fUA30YuvdvMvk8=;
	b=tkWVuHFqM5sGRyWy3J7BvLjS0rezd4MsR3gLqMcUR+nZzy1OhHBwpC8plGJ6ZKqtzs
	2eEikfU0p2rDx8CCoWm2IgkjJ2QTGzFNFUNBNQyBzA5Dc5t+tgW9e/EXtax6bf33m5Zc
	A9rxcifMupKmdDogsh5w6o90O5AAW3thYg+30wOQiIy/zFb0xBFQMwT4QI3WKDwPR2gk
	50u5g+ixyTRutkPEmGRq2Dneue1mDIH73qDadZHNJ+QiIVMDrBMsTfP7ZOhEijYlq3vp
	175pYb3Pgl5BJIii1FfZXJ5L78hBrzxoMK5GxjGwhzOCWXsrqpDLn5Fmhl8Cbj02CJEt
	Wnyw==
X-Gm-Message-State: APjAAAVQ2AkObr7+tqegL38gimlZJQPnXWHJ7XxOkXilfIibG/jD7I6U
	yYfshgJhoazQ+3ax/y6YtjA=
X-Google-Smtp-Source: APXvYqxX1xxICCvrqQ/5VnrjDhgF4vzE6rxVR/kRr24ROrqiBafu07KGdPB2XiScX/u9AjRkwsNM/A==
X-Received: by 2002:a05:600c:20f:: with SMTP id
	15mr5805906wmi.128.1582224871158; 
	Thu, 20 Feb 2020 10:54:31 -0800 (PST)
Received: from localhost ([109.238.218.228])
	by smtp.gmail.com with ESMTPSA id s15sm577822wrp.4.2020.02.20.10.54.29
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 20 Feb 2020 10:54:30 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 20 Feb 2020 19:54:29 +0100
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20200220185429.i5z5vmp7ehq5n3mu@jama>
References: <20200220175235.367-1-Martin.Jansa@gmail.com>
	<20200220175235.367-2-Martin.Jansa@gmail.com>
	<af60d8a0-618c-7b85-034a-c0118d1cec0b@gmail.com>
MIME-Version: 1.0
In-Reply-To: <af60d8a0-618c-7b85-034a-c0118d1cec0b@gmail.com>
User-Agent: NeoMutt/20180716
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH 2/2] s3c24xx-gpio, s3c64xx-gpio, sjf2410-linux-native, usbpath, wmiconfig: remove old recipes
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
X-List-Received-Date: Thu, 20 Feb 2020 18:54:30 -0000
X-Groupsio-MsgNum: 82941
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="2ebfhx6iotiixby7"
Content-Disposition: inline

--2ebfhx6iotiixby7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 20, 2020 at 10:19:24AM -0800, Khem Raj wrote:
>=20
>=20
> On 2/20/20 9:52 AM, Martin Jansa wrote:
> > * I don't   expect anyone nowadays actually using these recipes which I=
've
> >    imported from meta-smartphone in 2011.
> >=20
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >   .../packagegroups/packagegroup-meta-oe.bb     |   8 +-
> >   .../0001-ppt.c-Do-not-include-sys-io.h.patch  |  28 -
> >   .../samsung-soc-utils/s3c24xx-gpio_git.bb     |  21 -
> >   .../samsung-soc-utils/s3c64xx-gpio_git.bb     |  21 -
> >   .../sjf2410-linux-native_git.bb               |  39 --
> >   .../usbpath/usbpath/configure.patch           |  11 -
> >   .../recipes-support/usbpath/usbpath_git.bb    |  21 -
> >   ...0001-makefile-Pass-CFLAGS-to-compile.patch |  26 -
> >   ...02-fix-err-API-to-have-format-string.patch | 656 ------------------
> >   .../wmiconfig/wmiconfig_git.bb                |  24 -
> >   10 files changed, 4 insertions(+), 851 deletions(-)
> >   delete mode 100644 meta-oe/recipes-support/samsung-soc-utils/files/00=
01-ppt.c-Do-not-include-sys-io.h.patch
> >   delete mode 100644 meta-oe/recipes-support/samsung-soc-utils/s3c24xx-=
gpio_git.bb
> >   delete mode 100644 meta-oe/recipes-support/samsung-soc-utils/s3c64xx-=
gpio_git.bb
> >   delete mode 100644 meta-oe/recipes-support/samsung-soc-utils/sjf2410-=
linux-native_git.bb
> >   delete mode 100644 meta-oe/recipes-support/usbpath/usbpath/configure.=
patch
> >   delete mode 100644 meta-oe/recipes-support/usbpath/usbpath_git.bb
> >   delete mode 100644 meta-oe/recipes-support/wmiconfig/wmiconfig/0001-m=
akefile-Pass-CFLAGS-to-compile.patch
> >   delete mode 100644 meta-oe/recipes-support/wmiconfig/wmiconfig/0002-f=
ix-err-API-to-have-format-string.patch
> >   delete mode 100644 meta-oe/recipes-support/wmiconfig/wmiconfig_git.bb
> >=20
>=20
> I had to manually apply is on master-next, please check master-next if all
> is fine or else send a rebase on top of master-next

Looks the same as what I have locally, thanks.

--2ebfhx6iotiixby7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCXk7V5AAKCRA3VSO3ZXaA
HKghAJ9RgqbH8EkWu3oeS+wV4/pKBcDlwACfZRAW/fgQw8P+toldzkWpBtdJa6k=
=srs1
-----END PGP SIGNATURE-----

--2ebfhx6iotiixby7--
