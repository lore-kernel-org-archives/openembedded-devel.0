Received: from mail-fx0-f226.google.com ([209.85.220.226])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <lamiaposta71@gmail.com>) id 1NgKKr-0000Rk-Dy
	for openembedded-devel@lists.openembedded.org;
	Sat, 13 Feb 2010 16:55:12 +0100
Received: by fxm26 with SMTP id 26so3475331fxm.13
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 13 Feb 2010 07:52:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=xGrxmA0farEF8xA/AdWMMiq4ubAR7Oe66wIcIEbRo3A=;
	b=Pj0IWkEjY+Rk8kO79j6qLSzKySMvyVcTfeWkzQQFz38il2XdPut1jowKgQGZbjglQf
	O9IWtHtZN698F7ibVVYaKRrVBej3DQ29aH90BOyMaFuliz9Qan7L8LSEUW7KntyHJ8V7
	SkBJXdc+a3ltfFf/CSJBLWOArI/XS5NxCCQks=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=Z44qVXqqwX4lSIvbrUt+Xssb7UJR47Xwa00rbE0crsedBfgwIMrNsympF3VvkS8e/f
	dkHKatJU+5/IZEDUEIh6TDMyMele6bI91PqaOMiHgORP+XfIbi4wxlVaFOl+Y77dRHHe
	qeKlmjy3Ojyb4gSLvGFEDxDPvmzd0/TI5N37s=
MIME-Version: 1.0
Received: by 10.223.100.150 with SMTP id y22mr2895464fan.99.1266076352067; 
	Sat, 13 Feb 2010 07:52:32 -0800 (PST)
In-Reply-To: <ac9c93b11002130725h19c5ee93t867da2d889811a9f@mail.gmail.com>
References: <ac9c93b11002130655p454b5931od630b58e995772a1@mail.gmail.com>
	<ade1bdc1002130717v2573bd35m165c6c887ca408e3@mail.gmail.com>
	<ac9c93b11002130725h19c5ee93t867da2d889811a9f@mail.gmail.com>
Date: Sat, 13 Feb 2010 16:52:31 +0100
Message-ID: <ade1bdc1002130752j4e773410s2ace075b90fbb206@mail.gmail.com>
From: Raffaele Recalcati <lamiaposta71@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.220.226
X-SA-Exim-Mail-From: lamiaposta71@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: {RFC} rootfs directory path
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
X-List-Received-Date: Sat, 13 Feb 2010 15:55:12 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi Frans,

> That is also where it eventually ends up for me, but the image is
> constructed in ${TMPDIR}/rootfs/console-image (without the work subdir
> inbetween as I accidently wrote before).
> That is where the clash is happening (especially if you keep rootfs,
> but also if you don't and start parallel builds for different systems)

${TMPDIR}/rootfs/${DISTRO}-${MACHINE}/console-image

seems to isolate the building of rootfs in order to allow parallel builds.

But isn't a similar problem in the compilation?

For example,
if you are building two tmp/work/armv5te-angstrom-linux-gnueabi
systems you'll have a disaster because the same package will be
re-written by the last build.

But I guess you are building different (different architecture) systems.

My small knowledge is improving a little bit.
Bye

>
> Frans.
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



-- 
www.opensurf.it


