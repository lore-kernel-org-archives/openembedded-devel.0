Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OX94A-0007UM-Ps
	for openembedded-devel@lists.openembedded.org;
	Fri, 09 Jul 2010 10:36:16 +0200
Received: by gxk1 with SMTP id 1so1132507gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 09 Jul 2010 01:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=T0SIkKHqexHi9rcewxI3SNT0aE54rgdgzWKVIFBTnnk=;
	b=AT7VhqVkahXY42GaYNaaLS9AeDLnsy1zeFkVNJuuu08g8xDkeD41ySFuW66DLHSlCt
	wvXXg98tsZBmX1OetL5BKRULrteJRsLjTWub1yoZA5Mr5eixZObLZRgWTq6/4dGWxELt
	Y+P2UUAwK+rf4V02vjXnDo0ACszAFRKsyV9ok=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=MSra4jN2sy5F6xeRfWxnNUBCEVnCyJdR3VRmsoqJOqGWBd8eWCvdrYTjESvoAyok/Q
	x29sDh5FCzZYNpq/99NCT31Okuc2xZ6bBR/hokbAfdNBOg5VeQ7Y4fILCzsRtI8Wjq8P
	ovybeuGJ28F2k/OdQebkq3KrzKrnlccf++qz4=
Received: by 10.90.118.19 with SMTP id q19mr7580441agc.88.1278622844519; Thu, 
	08 Jul 2010 14:00:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.14.131 with HTTP; Thu, 8 Jul 2010 14:00:23 -0700 (PDT)
In-Reply-To: <4C356475.2060208@gmail.com>
References: <4C356475.2060208@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 8 Jul 2010 14:00:23 -0700
Message-ID: <AANLkTim3hKvwaPwTkTOTi1j9Umn01fFR-qPnGS6Ep8rR@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] Badness with -ibad, a replacement for 	zecke-no-host-includes.patch.
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
X-List-Received-Date: Fri, 09 Jul 2010 08:36:16 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Jul 7, 2010 at 10:39 PM, Graham Gower <graham.gower@gmail.com> wrote:
> This patch introduces a new command line parameter to gcc (at
> Zecke's suggestion), -ibad, which may be used to specify
> blacklisted include prefixes. E.g.
>
> grg@eye7:/tmp$ ~/oe2/tmp/cross/mipsel/bin/mipsel-angstrom-linux-gcc -c test.c -ibad /usr/include -I /usr/include
> CROSS COMPILE Badness: /usr/include in INCLUDEPATH: /usr/include
>
> This makes it much easier to add new blacklisted include paths,
> with a trivial edit to bitbake.conf. No additional paths have
> been added yet, but my motivation for this was to add
> /usr/X11R6/include and /usr/X11/include.
>
> Please note that the bitbake.conf change will break builds with
> versions of gcc that do not accept this -ibad parameter. I have
> tested that the ibad patch applies to each of the gcc versions
> in this patch, but only done functional tests for gcc-4.3.3 and
> gcc-.4.1.
>
> The following gcc versions may need attention:
> 3.3.3
> 3.3.4
> svn
> csl-arm-2007q3
> csl-arm-2008q1
> csl-arm-2008q3
>

csl already has a similar feature and its turned on by default but IIRC
its only a warning which can be turned off by -Wno-poison-system-directories
I am interested in patching svn others not so much in above lis

> 3.3.x will require a completely reworked ibad patch. The others
> should be compatible with one of the three ibad patches
> included below.
>
> -Graham
>


