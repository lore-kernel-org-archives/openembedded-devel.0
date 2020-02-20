Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193])
	by mail.openembedded.org (Postfix) with ESMTP id DF0DC615FB
	for <Openembedded-devel@lists.openembedded.org>;
	Thu, 20 Feb 2020 16:10:32 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id v25so3230706qto.7
	for <Openembedded-devel@lists.openembedded.org>;
	Thu, 20 Feb 2020 08:10:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=IjdbffLHi6c7soY/NLl6AcPwYZOYFkaG8cttihz/F+g=;
	b=Vm7GM+u0rrcDN9YaRF1nsCBC39IWP3iqsA8EHFNu+DX3ju2FLLbCcYLFwUmSSjLXQM
	s5BpGiv0ZXcS3qSUxd2FJJPjCNm42Ok31hrhkCAhVr2rHKTE9qSKpSvN8i7kKFLK/N3T
	Jczw1FMCjCZ4psMGwDpWAsoOcsX54Zi6XNDqCWy2dpC/giuEV/Gk8TW/pKep9D6xRIBz
	F0GcZSLdhEQ8KcKlEa6700z0V0RXr3p4y4yTAJdDOS+rlbcpAQ/1YivtKksBrAW1Xgf9
	TPk+Q/0A0Qd5SCRayrOrSHA4Hgizlk/AbogrT6KV8fC3E0qgeOY8TfMSc2L+KwM+netv
	py5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=IjdbffLHi6c7soY/NLl6AcPwYZOYFkaG8cttihz/F+g=;
	b=uMQkoWtkMBMWvoSJf/NDyS8n4lno3h6tURqtmr3n2NFf65Pg5yb/mizvllbUGnXIox
	cwJZWqB+PeeRI7UlzWw0dhk9To1m8nYAJX3v9wala9Io2vOKjAdNYqMnvORtt1mRLl0l
	xdf0IYerm9OE6q6iJvlZMx4RfYNvK2T2Rv6fd1gGQjDbVOnp743+rnOn8+Pdvzusrket
	CCi4RDHsUhWCSp4wauwcpmq5NT3ogYk3dVmSc/3W5kAWz/Q0Lkq2NYwgN7wb0PRedoFC
	DVlpQ7S0MHgqx0xk6OXf0HoDgU8x8mRI6FOcXUq06+EbcRa0yPz2vk6hiw1/XmpK5O/8
	Axuw==
X-Gm-Message-State: APjAAAVW2de/HMcLN4kiVAFMMg8529r08A33VnmR47jAxG0Ha1ItS2AJ
	IOdYm7JOqtCkgjA0TziZw5Z0vi7Bm9oYYf/YBiQ=
X-Google-Smtp-Source: APXvYqyg/DKMeg9YVURhKgv3MhT4buZ1zVCYjnk0N6lmToX3aUwDbpYR3EQGkCMwLgvY/nph/bmm93a5fTqZylzjCng=
X-Received: by 2002:ac8:4e3c:: with SMTP id d28mr27278394qtw.190.1582215033474;
	Thu, 20 Feb 2020 08:10:33 -0800 (PST)
MIME-Version: 1.0
References: <CAMKF1squjefU4rg3Rzn6Xn85mLkRHwWr5jha3YU18Z3rT3J-2g@mail.gmail.com>
	<20200220144848.msiyguq2bsmqokxc@jama>
In-Reply-To: <20200220144848.msiyguq2bsmqokxc@jama>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 20 Feb 2020 08:10:07 -0800
Message-ID: <CAMKF1soyjLNA0foqFHrS=+V-anOKDPWb2BM8_PvOk=SFDk_VmQ@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembeded-devel <Openembedded-devel@lists.openembedded.org>
Subject: Re: S variable for svn fetcher Was: State of OE world - 2020-02-18
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
X-List-Received-Date: Thu, 20 Feb 2020 16:10:33 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Feb 20, 2020 at 6:48 AM Martin Jansa <martin.jansa@gmail.com> wrote:
>
> On Wed, Feb 19, 2020 at 09:29:58AM -0800, Khem Raj wrote:
> > http://www.openembedded.org/wiki/Bitbake_World_Status
> >
> > == Failed tasks /media/ra_build_share/buildlogs/oe/world/dunfell/2020-02-18 ==
> >
> > INFO: jenkins-job.sh-1.8.46 Complete log available at
> > /media/ra_build_share/buildlogs/oe/world/dunfell//media/ra_build_share/buildlogs/oe/world/dunfell/log.report.20200219_150007.log
> >
> > === common (0) ===
> >
> > === common-x86 (0) ===
> >
> > === qemuarm (0) ===
> >
> > === qemuarm64 (0) ===
> >
> > === qemux86 (0) ===
> >
> > === qemux86_64 (0) ===
>
> Looks great! Thanks
>
> I was running some world builds recently as well and was surprised that
> there are a few failing recipes in meta-oe:
>   s3c24xx-gpio
>   s3c64xx-gpio
>   wmiconfig
>   usbpath
> which are all using svn fetcher.
>
> Any idea why these aren't shown in our build? I was able to reproduce
> this on thud as well as latest master build:
>

perhaps it might be due to the fact that yoe distro uses yocto and oe
source mirrors for tarballs

>   /OE/build/oe-core/meta-openembedded/meta-oe/recipes-support/usbpath/usbpath_svn.bb:do_patch
>   /OE/build/oe-core/meta-openembedded/meta-oe/recipes-support/samsung-soc-utils/s3c64xx-gpio_svn.bb:do_compile
>   /OE/build/oe-core/meta-openembedded/meta-oe/recipes-support/samsung-soc-utils/s3c24xx-gpio_svn.bb:do_compile
>   /OE/build/oe-core/meta-openembedded/meta-oe/recipes-support/samsung-soc-utils/s3c64xx-gpio_svn.bb:do_populate_lic
>   /OE/build/oe-core/meta-openembedded/meta-oe/recipes-support/samsung-soc-utils/s3c24xx-gpio_svn.bb:do_populate_lic
>   /OE/build/oe-core/meta-openembedded/meta-oe/recipes-support/wmiconfig/wmiconfig_svn.bb:do_patch
>
> they have all the same root cause and that is that the
> S variable points to directory where the sources used to be, but now
> they are checked out somewhere else, e.g. s3c24xx-gpio:
>
> LIC_FILES_CHKSUM = "file://gpio.c;endline=12;md5=cfb91c686857b2e60852b4925d90a3e1"
>
> SRC_URI = "svn://svn.openmoko.org/trunk/src/target;module=gpio;protocol=http"
>
> S = "${WORKDIR}/gpio"
>
> And now S looks like this:
> $ ls /OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/s3c24xx-gpio/1.0+svnr4949-r2/gpio/
> branches  trunk
>
> While before I believe it was checking out just this directory (as ${WORKDIR}/gpio):
> $ ls /OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/s3c24xx-gpio/1.0+svnr4949-r2/gpio/trunk/src/target/gpio/
> gpio.c  gpio-glamo.c  gpio-s3c6410.c  Makefile  README
>
> Anyone still actively using svn fetcher for something?
>
> I'll check with even older bitbake to see when it changed, but it's
> still surprising that you wouldn't be seeing it with latest bitbake
> in world builds.
>
> Cheers,

