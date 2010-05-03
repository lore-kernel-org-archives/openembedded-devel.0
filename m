Received: from fg-out-1718.google.com ([72.14.220.156])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1O8vEp-0007KA-O1
	for openembedded-devel@lists.openembedded.org;
	Mon, 03 May 2010 14:59:08 +0200
Received: by fg-out-1718.google.com with SMTP id e12so608651fga.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 May 2010 05:55:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=teABkvaCmHcy3pCoxhPLF8PeG0QEpqXbsS+o+n+Bb5M=;
	b=s/14yR5ZyaiDZLfFI4+waeLBia83riK0q2faST024Xd+ooTR2VP+vOEKSeBlk4FCre
	U7sC1V0XCZQVRL9gzv8fpApx+QZJIyewBVelA+nAl5E9Ki6tPbrVVnRj0fGrmkog7LSI
	pmtxgb6F3cMR60DmhHfGFDRsPSW9v7YhQA0h0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=TQ08Q3Ujq6TTQ2cIgY0D09Xk3wEcvPb66I5r2huhVzijEbwEUThVWzlDKXRaO/OGuR
	29Fos1BIeFQlVMbu2uktkrZBKMirBLYoVUJ+08WWY7ODhb8sW+58GwG7l8rLJVfglUdf
	o6zesURV+hi12aZjplaQStUe58CeX65Ag6Ysw=
MIME-Version: 1.0
Received: by 10.239.179.131 with SMTP id d3mr129094hbg.54.1272891324073; Mon, 
	03 May 2010 05:55:24 -0700 (PDT)
Received: by 10.239.192.77 with HTTP; Mon, 3 May 2010 05:55:23 -0700 (PDT)
In-Reply-To: <1272879651-27000-1-git-send-email-Martin.Jansa@gmail.com>
References: <1272879651-27000-1-git-send-email-Martin.Jansa@gmail.com>
Date: Mon, 3 May 2010 14:55:23 +0200
Message-ID: <z2kd1b08f941005030555u1595622tc9705a8655881487@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 72.14.220.156
X-SA-Exim-Mail-From: andrea.adami@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] klibc: cleanup all version
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 03 May 2010 12:59:09 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, May 3, 2010 at 11:40 AM, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> * reuse as much .inc as possible
> * use INC_PR
> * added klibc-utils.inc with common do_install_append for installing all =
utils
> =A0added PACKAGES + FILES variables for them (union for all klibc version=
s)
> * added klibc-utils-static.inc with common part of all klibc-utils-static=
 recipes
> =A0and including klibc-utils.inc in the end with prepared variables to in=
stall
> =A0static versions
> * modprobe was installed in base_bindir for shared and base_sbindir for s=
tatic, unified
> =A0to base_sbindir
> * I've prepared 1.5.18, but needs more love as few patches doesn't apply =
and I would like to
> =A0convert all to new staging (don't know how to install to cross with na=
tive install).
> =A0And please comment about Kbuild/all_headers staging and include/asm li=
nk.
>
> * 1.5.14 tested with slugos/nslu2le linux-ixp4xx-2.6.27.8+svnr1089-r2
> * 1.5.15+1.5.16 tested with angstrom/spitz linux-2.6.34-rc6+git% (with wo=
rk-arround see bellow)
>
> * all version:
> =A0with newer kernel version where is no include/asm, which is
> =A0replaced with include/asm-generic + ie arch/arm/include/asm/
> =A0we can stage asm -> ../arch/arm/include/asm/ link, or fix klibc
> =A0autotools to use arch inludes correctly
>
> * 1.5.15+1.5.16:
> =A0#still needs Kbuild files and all headers (ie include/drm, include/mtd=
 were missing)
> =A0#work-arround by hand (just to show what needs to be solved):
> =A0cd ${STAGING}/spitz-angstrom-linux-gnueabi/kernel/
> =A0mv include indlude-orig
> =A0cp -ra ${WORKDIR}/spitz-angstrom-linux-gnueabi/linux-2.6.34-rc6+gitr0+=
be1066bbcd443a65df312fdecea7e4959adedb45-r0/git/include/ .
> =A0cd include
> =A0ln -s ../arch/arm/include/asm/ .
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---

Acked-by: Andrea Adami <andrea.adami@gmail.com>


