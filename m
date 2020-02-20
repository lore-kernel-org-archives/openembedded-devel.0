Return-Path: <trini@konsulko.com>
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com
	[209.85.219.175])
	by mail.openembedded.org (Postfix) with ESMTP id 410FA615F4
	for <Openembedded-devel@lists.openembedded.org>;
	Thu, 20 Feb 2020 14:57:52 +0000 (UTC)
Received: by mail-yb1-f175.google.com with SMTP id w190so2262813ybc.0
	for <Openembedded-devel@lists.openembedded.org>;
	Thu, 20 Feb 2020 06:57:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=3UryQUmI0frjQjcQRuctw1/srW0YWQw/2Oph9CoMAu0=;
	b=ij8pc3PF1zwijnHZD5Gqc3EE0xUZUgn1dI8+pi4oUvjIvc0heOKP70Jq5YGmBPhQae
	FPRkdnDuvSpR6ZdJ3GXt0NFJUfpvfJB15zo/9BI+GO/iBNmoDw6sPqKyEgz2gOhbE0ZQ
	dqCvNe7//nc857CRye9rz2+idQh1dvCcBbN4w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=3UryQUmI0frjQjcQRuctw1/srW0YWQw/2Oph9CoMAu0=;
	b=GPayKeIv1lF4S0K8PlNs+bGeBPxgVSV+tAHOIhyLSL3KPUZBSRXCObJguUstbLr4Ug
	dHKS6haQEGqKNp3t53RFqGAU1hOVg5DduEOxTRE5OsmzZ5zmQ25VdwZsa6Dqlg0h2r0u
	3NIBqjyKBSmOt1z8UQ2Y6wrSs+aHk0hPNYIjG0KUFtnHR0m1VuEdKgxKGzXmDkWx2uzw
	4beJXeaiYcmH+zni4opmKgB0lS1Ae5vyHuRyAuZJL0GphgYw+h7FuZUY+dpyoNHjyVHz
	sshUiomX8hOYALl0iAf9wQbpuFyHzMp8Kb3mDORXNmBWp9E3L6tuGinyBLeCyAdQyuHA
	cGGg==
X-Gm-Message-State: APjAAAWiBEvlUf0a2sb2YkTAIe2YchTIwgwzfxUAeibfDC8sEpXrjoPe
	gGOZV/Pr6zh2KkfclVVP9OwHgw==
X-Google-Smtp-Source: APXvYqzhX+UhL7MgslZfd1PIUpGUuKV0N6wExZ1+kRvL8u7js5AcLprjg5XuUS8dgGHqeTOEC7+33w==
X-Received: by 2002:a5b:b8f:: with SMTP id l15mr27509481ybq.24.1582210672924; 
	Thu, 20 Feb 2020 06:57:52 -0800 (PST)
Received: from bill-the-cat
	(2606-a000-1401-86dd-6c01-6afd-f1ef-1b8c.inf6.spectrum.com.
	[2606:a000:1401:86dd:6c01:6afd:f1ef:1b8c])
	by smtp.gmail.com with ESMTPSA id
	a12sm1482157ywa.95.2020.02.20.06.57.52
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 20 Feb 2020 06:57:52 -0800 (PST)
Date: Thu, 20 Feb 2020 09:57:50 -0500
From: Tom Rini <trini@konsulko.com>
To: Martin Jansa <martin.jansa@gmail.com>
Message-ID: <20200220145750.GB18302@bill-the-cat>
References: <CAMKF1squjefU4rg3Rzn6Xn85mLkRHwWr5jha3YU18Z3rT3J-2g@mail.gmail.com>
	<20200220144848.msiyguq2bsmqokxc@jama>
MIME-Version: 1.0
In-Reply-To: <20200220144848.msiyguq2bsmqokxc@jama>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
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
X-List-Received-Date: Thu, 20 Feb 2020 14:57:52 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Feb 20, 2020 at 03:48:48PM +0100, Martin Jansa wrote:
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

Chiming in as this caught my eye.  I've run in to this perhaps with
'warrior' as well recently for a customer.  I assumed it was just that
it had been so long since I had used SVN I had just mis-remembered how
S needed to be set.  I also as a tangent noticed that AUTOREV for svn
seems broken as it doesn't ensure we have subversion-native in the
sysroot ('svn command not found' is the relevant part of the failure).

-- 
Tom

