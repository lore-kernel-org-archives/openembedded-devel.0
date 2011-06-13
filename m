Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <george.huntingtoniii@gmail.com>) id 1QW7ue-0005Dg-MF
	for openembedded-devel@lists.openembedded.org;
	Mon, 13 Jun 2011 16:14:44 +0200
Received: by yxe1 with SMTP id 1so1045862yxe.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Jun 2011 07:11:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=s0ZO1wzwgzGrrzeA851Gdb2End15mKLOEIoKJtjZV1g=;
	b=qOAyAqo9o8GPi9unaT0n60969XmfnT9xCcq0VfhhirUlZEVa77Fwh62Oj0l1dZLlux
	JWTXg0zD1MT6feg7qJKZ6BLhW/UOtSZXmuP7aVgV1Ovt0VA94uqpPjWF/WAtQ48nGWUA
	Ro5lwBEmDQ3T7tOWD4wLf0jcdwRBxsiNdpjnI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=dKDNqNswDCOteNGCBq7vPCze2Eh7uQX0GtNnKaX3DZIJDDFx4BrCjaIhIqYTcC4lFz
	bNftD/m5FPeJhCRM8WOLpKW91RM37iVFUJ2jpizyeCJJF+i6SGW+eirUwEO0R3qU69uX
	22yPWxjZRWELKTcsu0Fx1Y9DGF7wc/jr7ylks=
MIME-Version: 1.0
Received: by 10.236.184.197 with SMTP id s45mr6973801yhm.335.1307974279723;
	Mon, 13 Jun 2011 07:11:19 -0700 (PDT)
Received: by 10.236.107.165 with HTTP; Mon, 13 Jun 2011 07:11:19 -0700 (PDT)
In-Reply-To: <4DF29E37.9020204@mentor.com>
References: <1307713686-30844-1-git-send-email-gchiii@mtiemail.com>
	<4DF29E37.9020204@mentor.com>
Date: Mon, 13 Jun 2011 10:11:19 -0400
Message-ID: <BANLkTik+vDEFKeV3U+CdF5Qg3xx2ApzTvQ@mail.gmail.com>
From: "George C. Huntington, III" <george.huntingtoniii@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [2011.03-maintenance] fakeroot: Move from not fetchable 1.14.5 to 1.15.1
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
X-List-Received-Date: Mon, 13 Jun 2011 14:14:45 -0000
Content-Type: text/plain; charset=UTF-8

I've tried to find the fakeroot_1.14.5.orig.tar.bz2, does anyone have this
mirrored?


On Fri, Jun 10, 2011 at 6:44 PM, Tom Rini <tom_rini@mentor.com> wrote:

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 06/10/2011 06:48 AM, George C. Huntington III wrote:
> > From: Florian Boor <florian.boor@kernelconcepts.de>
> >
> > Fakeroot 1.14.5 was not fetchable any more. Updating to 1.15.1.
> >
> > Test environment:
> >     BB_VERSION        = "1.10.2"
> >     METADATA_BRANCH   = "org.openembedded.dev"
> >     TARGET_ARCH       = "arm"
> >     TARGET_OS         = "linux-gnueabi"
> >     MACHINE           = "mainstone"
> >     DISTRO            = "minimal"
> >     DISTRO_VERSION    = "dev-snapshot-20110504"
> >     TARGET_FPU        = "soft"
> >
> > Signed-off-by: Florian Boor <florian.boor@kernelconcepts.de>
>
> For 2011.03-maintenance I'm going to NAK this.  A mirror setup is
> required as we aren't trying to keep up to date with the tzdata/tzcode
> mess and these are available via the angstrom mirror (and if needed
> could be put on the regular OE mirror).  Thanks for your interest in the
> stable branch, all the same!
>
> - --
> Tom Rini
> Mentor Graphics Corporation
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.10 (GNU/Linux)
> Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/
>
> iQEcBAEBAgAGBQJN8p4uAAoJEI4NMjfc3nJxBFQH/3V2UzwjerwjMX2fWcRfAyBC
> Gbm0uVhc81JmO1csGyXkVsm8iNURI0sNvq+bvOJ/ZKOgaFcITuTjWPhhM5rUYPC/
> bt2X8w6s996FISA0BewfTg3c+znf3ybfH+s5aecEyT81FpbiBeKnhiQ+suQHagOR
> f9Ev/DsWGko5PQYRXQNxcHXouw+tT+JSt6+0jSr2qZD1vEr8GC5iuwpjIAuC32ja
> 0mKvNBhrk5mE1RTC7LozRIqJQbGl3GqDnyvm5I4AUGRsR9r5M6M5D2+6sAGv1JJH
> aamhmSXND5NfJgmrETQNXL5AAhDCfxy958s4SPRGmf+StAn8Sr15pqEaigJoGkY=
> =mMob
> -----END PGP SIGNATURE-----
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

