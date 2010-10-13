Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1P68mN-0003NH-8I
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 Oct 2010 23:22:33 +0200
Received: by wwe15 with SMTP id 15so6001762wwe.24
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Oct 2010 14:22:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=AHJ4RSLp3udiWAjdvPPDXgCQ4b7vrxNTKqpc8uD6UdU=;
	b=NF6kSbgP/1ARz5DcA/BwiL9e+2cpK0eupsaqjtVVhhkHByszVQ2qfNZqzM4wLNrbQ0
	LkpLoSIFL0S3yPWqUSlFhoiX8sfv89+1nFDzZUZW2cXWhuMKiXt/CBr73InnVd6aPoIX
	+yFpJcHXmbV2CHuJCt8V4xmZKqm06l8d0/Ozo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=Ta1tokAt7fanAImzXoFNkiSSCeLzCzf/JUN4Ldfx1hRxeqcnbHNyV+liE46vA+nRpb
	R0LRbqmddFFPio1uXNV6BZRXNHwz+FUqMXcQV40C6OZSMmMhggFx+ti6fJK9shImDa7N
	OhWmT2bioXCBKHGcGQFWYxDrfTPyeVxRCCxVI=
Received: by 10.216.236.149 with SMTP id w21mr1779468weq.65.1287004922775;
	Wed, 13 Oct 2010 14:22:02 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.0.142 with HTTP; Wed, 13 Oct 2010 14:21:42 -0700 (PDT)
In-Reply-To: <131E5DFBE7373E4C8D813795A6AA7F080310FFA839@dlee06.ent.ti.com>
References: <131E5DFBE7373E4C8D813795A6AA7F080310FFA839@dlee06.ent.ti.com>
From: Chris Larson <clarson@kergoth.com>
Date: Wed, 13 Oct 2010 14:21:42 -0700
X-Google-Sender-Auth: B7hXvZy1LvoQRAKnSJ9TKjxSXo0
Message-ID: <AANLkTik1nA1jC9f-Vvep2=8U9+VXAWBwPFaRaZC0f4Op@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.43
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Question about OVERRIDES precedence
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
X-List-Received-Date: Wed, 13 Oct 2010 21:22:33 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Oct 13, 2010 at 1:29 PM, Maupin, Chase <chase.maupin@ti.com> wrote:

> I have been looking into the OVERRIDES setting and it appears to me that
> the OVERRIDES are being handled in least specific to most specific order.
>  Meaning that if I have an override for a particular machine set that it has
> a lower priority than the override for a distro.
>
> My OVERRIDES variable is actually set to evaluate:
> #
> OVERRIDES=local:${MACHINE}:${DISTRO}:${TARGET_OS}:${TARGET_ARCH}:build-${BUILD_OS}:fail-fast:pn-${PN}:${FEED_ARCH}:${SOC_FAMILY}:libc-glibc${OVERRIDE_THUMB}${OVERRIDE_INTERWORK}
>
> Which translates in my build to:
>
> OVERRIDES="local:am37x-evm:angstrom:linux-gnueabi:arm:build-linux:fail-fast:pn-task-arago-toolchain-tisdk-multimedia-host:armv7a:omap3:libc-glibc:thumb-interwork"
>
> I would expect that if I set an override for am37x-evm that this MACHINE
> specific override should trump the DISTRO specific override or the
> SOC_FAMILY override.
>
> Likewise I would expect that the local override would have the highest
> precedence because I am trying to override something specifically for my
> local copy and that the "thumb-interwork" override would have the lowest
> precedence.
>
> Is my expectation incorrect?
>

Yes, your expectation is correct.  OVERRIDES is intended to essentially give
us a layering mechanism for the metadata, ensuring that the most specific
available information is always used.  So machine should always have higher
priority than target architecture, for example, and local is highest of all.

I assume in your testing you've found that this is not behaving the way it
should?

 If so then can we just reverse the list of overrides in the update_data
> method of <bitbake>/lib/bb/data.py, around line 500 in my version.  My
> bitbake is on version 1.10.  In the master this would be in the finalize
> function of the DataSmart class.
>

I think you're correct, yes, from a quick re-read of the code -- it seems to
be evaluating them from highest to lowest priority, so the latter may
override the former, unless I'm missing something.  This seems like it would
have been an obvious thing -- if overrides aren't working as intended, I'd
have expected it to have been caught before now :\  This code hasn't changed
since the original implementation, it seems -- see
d8b28d544cd7ba8e9c303e72f8ce2ed04ee71b3a.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

