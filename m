Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1ObJp4-0001gN-GX
	for openembedded-devel@lists.openembedded.org;
	Tue, 20 Jul 2010 22:53:55 +0200
Received: by bwz10 with SMTP id 10so3469735bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Jul 2010 13:53:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=zVkj6IsSML6vlXchvpLOWNr+jsiG6Pq3B0FoN9B1ANU=;
	b=OIEtvKv66+ikOnQI7s/umfQORcL2RsDM/1JaULrkxL0F3vdJvAylI2I7ntwZJUob7+
	i223LlGbqWR5KAwNN7TM/NqmNoLowadKjbNBwhsXCDuoU2RX+rMYG5Ecku4SXSOdNYKT
	ZipzRutDLbs+Ux7J0+ecJ1h81scILoJWSWpUo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=VN6gFZIXRGLbCyz0oPybMF4jvHCvbBp5KJhfWzGy7fG5oSEZrnT1Uyjq1tsJDYVd9N
	gsXfpry0RKhegLKSHLTEOhTGW6Vn9wAVIlPYYLvDj5kuesbZv6LYjM2x2nOxwVQ7Cwr8
	T9lf6yPFqDx/cWfuHhHFrqtBvfLTRpxeJgGwE=
MIME-Version: 1.0
Received: by 10.204.46.23 with SMTP id h23mr5568248bkf.75.1279659226315; Tue, 
	20 Jul 2010 13:53:46 -0700 (PDT)
Received: by 10.204.60.208 with HTTP; Tue, 20 Jul 2010 13:53:46 -0700 (PDT)
In-Reply-To: <i24qu7$qc6$2@dough.gmane.org>
References: <201007201654.41292.schnitzeltony@gmx.de>
	<i24ku9$5b7$1@dough.gmane.org>
	<201007201944.05812.schnitzeltony@gmx.de>
	<i24qu7$qc6$2@dough.gmane.org>
Date: Tue, 20 Jul 2010 22:53:46 +0200
Message-ID: <AANLkTinhpRrgv_cs5BojuTJFjMmhX-b-ZApiMf6KGNNK@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH] omap3/powervr-drivers: Cleanups & fixes
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
X-List-Received-Date: Tue, 20 Jul 2010 20:53:55 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/7/20 Koen Kooi <k.kooi@student.utwente.nl>

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 20-07-10 19:44, Andreas Mueller wrote:
>
> >> It's not missing, it's present in all omap3 kernels in .dev that are
> >> supported. This incarnation of the test wasn't accepted upstream, but
> >> it's easy enough to patch in.
> > All the guys sitting on the gumstix tree like me are missing it. The
> latest driver is simply diabled with a commit msg. like 'does not build for
> kernel > 2.6.32'
>
> And there's your problem, you're using some unsupported crazy vendor
> branch. If you build from .dev, you'll get a perfectly working 2.6.32
> kernel with support for cpufreq, cpuidle, latest sgx drivers, dsp
> support, etc. I use it on all my overos daily.
>
> I see zero gain in uglifying the current recipe to support crazy vendor
> branches that will never get merged. Time is better spent on getting
> those vender changes upstream first.
>

Ehm. What about the other omap kernel recipes.
There are 38 (!) of them in 15 different flavours that have omap in the
name:

linux-amsdelta-2.6 (recipe is called linux-amsdelta-2.6_2.6.16-omap2.bb)
linux-h6300-omap1
linux-omap
linux-omap-2.6
linux-omap-archos
linux-omap-multi-psp
linux-omap-pm
linux-omap-psp
linux-omap-zoomsync
linux-omap1
linux-omap2
linux-omapandroid
linux-omapzoom
linux-palm-omap1
linux-tornado-omap2

(and yeah, I know some are omap1 and some are omap2, but still I feel this
is an unwarranted diversity that could benefit from unification).

Apart from that there is linux-davinci with 5 recipes and linux-igep2 with a
recipe.

Seems to me this has grown out of control.

Frans


-----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
>
> iD8DBQFMRe8HMkyGM64RGpERAgyQAJoD6BrNE/GXQTBnRqOnTuNgIPwOwQCfcwgW
> 3HgBIj7R8MngEviSwoK5IV4=
> =Afz0
> -----END PGP SIGNATURE-----
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

