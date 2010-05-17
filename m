Received: from mail-ww0-f47.google.com ([74.125.82.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OE60s-0007Pe-FH
	for openembedded-devel@lists.openembedded.org;
	Mon, 17 May 2010 21:30:09 +0200
Received: by wwb28 with SMTP id 28so306591wwb.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 May 2010 12:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	bh=nBdBKwTga3pgN5ZXt7sUhD+Clrg87F5hu9LsSyff3gA=;
	b=Z/2vWqG3mCbQZ7TU/iTaMfEc1mZh86kg/MNRRzm3CQWnr/Kl4+CgBnd2VVtF9BaHKl
	1h7q+yeV1LNlxrwzdkEEtdHEKHpc/Bweac7MnlcUfiSZKDdMIkszTUAJTi/9otlykGbG
	A0teRN17sS9Cy9fuEUDu3F7rzr4bbeANRTMwY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	b=uQqfAGB84qIYA1hIsZkdXke+J/JF/ZfhPglrVcFpGW2sqmHKx9sHP1owwGoim5s0Sz
	gE0hZCNwv06bUYuHnHpYx+fpg8TJdWBe4C1w7+jZmEPpVwQ5H2JxPN9ochotIgpx/k39
	jbMIWSq4EHCfFbsVNmJPxd6fqjEnBkAPVkuzI=
Received: by 10.216.161.14 with SMTP id v14mr3269789wek.179.1274124365481;
	Mon, 17 May 2010 12:26:05 -0700 (PDT)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id p37sm16265000gvf.13.2010.05.17.12.26.02
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 17 May 2010 12:26:03 -0700 (PDT)
Date: Mon, 17 May 2010 12:26:31 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100517192631.GC7932@gmail.com>
References: <1273877583-31604-1-git-send-email-eric@eukrea.com>
	<hsp64i$r3s$2@dough.gmane.org> <4BF1969E.3020408@eukrea.com>
MIME-Version: 1.0
In-Reply-To: <4BF1969E.3020408@eukrea.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 74.125.82.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] cross.bbclass: fix build of meta-toolchain
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
X-List-Received-Date: Mon, 17 May 2010 19:30:10 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On (17/05/10 21:18), Eric Bénard wrote:
> Hi,
> 
> Le 16/05/2010 18:22, Koen Kooi a écrit :
> >-----BEGIN PGP SIGNED MESSAGE-----
> >Hash: SHA1
> >
> >I can confirm that 'meta-toolchain' builds against with this
> >(angstrom/beagleboard), but I don't know what the effect of this is on
> >cross recipes.
> 
> Who could confirm that this change may not introduce any unwanted
> behaviour ?

I have build a console-image so far ok with this change in. I did 
not notice any difference.
So you have my ack

Acked-by: Khem Raj <raj.khem@gmail.com>

> 
> Thanks,
> Eric
> >
> >On 15-05-10 00:53, Eric Benard wrote:
> >>- without this bitbake meta-toolchain fails because it doesn't find who
> >>  provides gdb-cross-sdk
> >>- found thanks to a hint from Phil Blundell on IRC
> >>- tested with Angstrom/ARMv5te
> >>
> >>Signed-off-by: Eric Benard<eric@eukrea.com>
> >>---
> >>  classes/cross.bbclass |    2 --
> >>  1 files changed, 0 insertions(+), 2 deletions(-)
> >>
> >>diff --git a/classes/cross.bbclass b/classes/cross.bbclass
> >>index 69f6511..5c2d5be 100644
> >>--- a/classes/cross.bbclass
> >>+++ b/classes/cross.bbclass
> >>@@ -17,8 +17,6 @@ PACKAGE_ARCH = "${OLD_PACKAGE_ARCH}"
> >>  OLD_BASE_PACKAGE_ARCH := "${BASE_PACKAGE_ARCH}"
> >>  BASE_PACKAGE_ARCH = "${OLD_BASE_PACKAGE_ARCH}"
> >>
> >>-PACKAGES = ""
> >>-
> >>  HOST_ARCH = "${BUILD_ARCH}"
> >>  HOST_VENDOR = "${BUILD_VENDOR}"
> >>  HOST_OS = "${BUILD_OS}"
> >
> >-----BEGIN PGP SIGNATURE-----
> >Version: GnuPG v1.4.5 (Darwin)
> >
> >iD8DBQFL8BvSMkyGM64RGpERApFQAJ40WH4OOiFb0PZVfy/8gbQG4tFn4ACdFiHQ
> >9sEaKXsbeiDyzv/P/7+fQ4A=
> >=14NR
> >-----END PGP SIGNATURE-----
> >
> >
> >_______________________________________________
> >Openembedded-devel mailing list
> >Openembedded-devel@lists.openembedded.org
> >http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> >
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


