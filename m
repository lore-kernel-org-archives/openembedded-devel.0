Return-Path: <schnitzeltony@gmail.com>
Received: from mail-yb0-f178.google.com (mail-yb0-f178.google.com
	[209.85.213.178])
	by mail.openembedded.org (Postfix) with ESMTP id 4E41E6006E
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Nov 2017 10:44:25 +0000 (UTC)
Received: by mail-yb0-f178.google.com with SMTP id g2so4589719ybb.7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Nov 2017 02:44:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=MYxK4y3t0CAq9CQWvKf1VxTgJXbaVB5DXJ71DbgR42g=;
	b=kaynHNFzOt4z2VfuCdJ3a+8pFIcWGMfYxziXI8R+dqNws+BZh5FaL1/h78gAvWpv10
	UBMVdIGq1ZKUWFH4u60004WIdMb4MKdipt88hCWhO9g2ulMBT/fRFbg6yYYQEZJDS/hN
	5oZT6ygsE7iMKZpVMAXUz8Neoee8wVCip3vAl6cFrR5MIILOzVeB2GS/pz2NcIa5Hf2M
	ICq+Xds5Vbh9ctnvTge7jAnVzRX8evwh8dStEwjBIJbHpNBmArfS/KVqgNfe7T5SLi4Q
	aVdmM+U8sNN2U8Iei7HF4QzgEVAcqTxMX9t0PXZNvcAIJ1v/o4LgG7YVinzMelXMUf30
	WV7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=MYxK4y3t0CAq9CQWvKf1VxTgJXbaVB5DXJ71DbgR42g=;
	b=jXiavB0O8d8tvDR1DlA32BDpW78COg1HIPGLHVST4KADUBHY8aky9bLoGpgh8tp4YN
	smzQWUpHm5d/SaqiN7o28pguuxLKTjv+naB3q6K2TXh7NGe4KWfKcxGDQ8ntvlrryj8F
	Y05YFKLNesaARFPQqy64kVdXZU5AY2Q/EBa6su8U/QPBENyeZbRj1LYacdoJ/yu2yjaK
	6y+BnPP7YpjzR12ZnB0Drpt+6/NLPlSBT6gaQ+Ar92AN9r7OUDWZ3BtRKL1A4yUIGbNb
	bZuMWy8UuNjm2j/w1UjZ7aU9nxuHQOOHgm/TkJSVQkCVjrBiDvMRxUJO66hFwMue7rIS
	9iGQ==
X-Gm-Message-State: AJaThX7k/hOtKhSLO/0U27JLKQp1gCcLxEEjm39xI1uv73wvNjbc+4KX
	w8KP20OgtCm8TPTA9yDH5+d8/eAZKt4YsF85VWw=
X-Google-Smtp-Source: AGs4zMbdhpy2iPlQtBXGTkrsa96BpDmkpI76B32sVlLddTZOFGTLciPi/ecYZXs1pSJojZbXQJpH0NxVZ46pZYaj7+I=
X-Received: by 10.37.124.193 with SMTP id x184mr15200853ybc.219.1511520267195; 
	Fri, 24 Nov 2017 02:44:27 -0800 (PST)
MIME-Version: 1.0
Received: by 10.37.98.21 with HTTP; Fri, 24 Nov 2017 02:44:26 -0800 (PST)
In-Reply-To: <CAGTXB5kXiViW1w+eQ-qnefXp0kq7GktZoE6A3W1T=+oUVSC8Xw@mail.gmail.com>
References: <1511443538-32104-1-git-send-email-vladan.jovanovic@gmail.com>
	<CAJTo0LYXU4mMY3pm6r7cZhRQ3=erY=j5+nkO-Bfnr0cLfx6vOg@mail.gmail.com>
	<CAGTXB5kXiViW1w+eQ-qnefXp0kq7GktZoE6A3W1T=+oUVSC8Xw@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Fri, 24 Nov 2017 11:44:26 +0100
Message-ID: <CALbNGRT5c7AwsZdJe69xfz+2Ha7H7UEa0+gQPvNq3-gLbsSboQ@mail.gmail.com>
To: Vladan Jovanovic <vladan.jovanovic@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] Fix PACKAGES assignment for fftw
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
X-List-Received-Date: Fri, 24 Nov 2017 10:44:26 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Nov 24, 2017 at 11:24 AM, Vladan Jovanovic <
vladan.jovanovic@gmail.com> wrote:

> On Thu, Nov 23, 2017 at 4:43 PM, Burton, Ross <ross.burton@intel.com>
> wrote:
>
> > You should explain why its the wrong operator, as =+ is as valid as +=
> is.
> >
> >
> I got build errors as shown below when trying to build fftw. Went away when
> I changed the operator...
>
> Vladan
>
> ERROR: core-image-minimal-1.0-r0 do_rootfs: fftw not found in the feeds
> (imx7dsabresd cortexa7t2hf-neon-mx7d cortexa7hf-neon-mx7d cortexa7hf-neon
> cortexa7hf-vfp armv7vehf-neon armv7vehf-vfp armv7ahf-vfp armv6hf-vfp
> armv5ehf-vfp armv5hf-vfp noarch any all) in
> /home/vladan/fsl-release-bsp-4.9.11_1.0.0_ga/build-mx7d-
> x11/tmp/deploy/rpm.
> ERROR: core-image-minimal-1.0-r0 do_rootfs: This is often caused by an
> empty package declared in a recipe's PACKAGES variable. (Empty packages are
> not constructed unless ALLOW_EMPTY_<pkg> = '1' is used.)
> ERROR: core-image-minimal-1.0-r0 do_rootfs: Function failed: do_rootfs
> ERROR: Logfile of failure stored in:
> /home/vladan/fsl-release-bsp-4.9.11_1.0.0_ga/build-mx7d-
> x11/tmp/work/imx7dsabresd-poky-linux-gnueabi/core-image-
> minimal/1.0-r0/temp/log.do_rootfs.29692
> ERROR: Task
> (/home/vladan/fsl-release-bsp-4.9.11_1.0.0_ga/sources/poky/
> meta/recipes-core/images/core-image-minimal.bb:do_rootfs)
> failed with exit code '1'
>

fftw builds three different and independent packages
libfftw/libfftwl/libfftwf. Package fftw itself is empty and that is OK
(which version should be preferred?). So an ALLOW_EMPTY_${PN} in fftw would
not solve but wipe away that something in your image wants to install fftw
which does not make sense.

Usually it is not necessary to add fftw packages to your images: the
correct libraries are included into the image by link dependencies.

So I suggest you check where the package fftw is inserted in your image and
remove that.

Hope that helps

Andreas

