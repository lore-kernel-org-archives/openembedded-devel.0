Received: from [209.85.219.209] (helo=mail-ew0-f209.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <nicola.mfb@gmail.com>) id 1N6Nvb-0005jI-72
	for openembedded-devel@lists.openembedded.org;
	Fri, 06 Nov 2009 13:28:34 +0100
Received: by ewy5 with SMTP id 5so927284ewy.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 Nov 2009 04:27:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:cc:content-type;
	bh=S1t0kkNuuPcxRJa/xVXLhdPRk9wcdutb1jtnOSyZbas=;
	b=bTHUh4zKMow+L7EBbduFhhi0gQebt8LNrtHHUUUS5bjOhk6+vnKl82zBxkfREnjJLy
	2Ir9wbY17EgMe3nq7MohajBY61InVltFSbOZTA/AjQDGGYac5BCtrd2D4SRwr5KuvxVB
	tXgWClyVKKHRx8ILz0+FNvpFs+DBY3iHoNTVs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	b=GvreW1nvr/XeOM6AeEhb4ePrpU7wBeL04WFSDa34buoK8pV1lwdx/Ki/Y27Uijbkw0
	x3eLTn14M8hSqBIjHucALhVLYzJBuMyajAol8ZLeuuC0EXioH/laSi/tPchC6/e3fQNG
	P3MQ7FMa0mYuBIUFEAY+TCGBnkPaN3eYtO/RM=
MIME-Version: 1.0
Received: by 10.213.24.22 with SMTP id t22mr4050867ebb.27.1257510050966; Fri, 
	06 Nov 2009 04:20:50 -0800 (PST)
In-Reply-To: <792ba59f0911050343y1b31dab1l54b774e1da1d6df5@mail.gmail.com>
References: <4AEFEDD5.2080106@SSpaeth.de>
	<359c5480911031448j5c083c75w1578f6f50a2aa5fa@mail.gmail.com>
	<20091103230007.GB3295@jama> <1257391610.16913.4276.camel@shrek>
	<359c5480911042351t7b2326b0kd7cf0b5ff080904f@mail.gmail.com>
	<792ba59f0911050343y1b31dab1l54b774e1da1d6df5@mail.gmail.com>
Date: Fri, 6 Nov 2009 13:20:50 +0100
Message-ID: <359c5480911060420j3238011dw39e64bf395b399bb@mail.gmail.com>
From: Nicola Mfb <nicola.mfb@gmail.com>
To: shr-devel@lists.shr-project.org, openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.219.209
X-SA-Exim-Mail-From: nicola.mfb@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: Maksim 'max_posedon' Melnikau <maxposedon@gmail.com>,
	Martin Jansa <martin.jansa@gmail.com>
Subject: Re: [Shr-Devel] New shr/image results
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
X-List-Received-Date: Fri, 06 Nov 2009 12:28:34 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Nov 5, 2009 at 12:43 PM, Maksim 'max_posedon' Melnikau
<maxposedon@gmail.com> wrote:
> On 11/5/09, Nicola Mfb <nicola.mfb@gmail.com> wrote:
[...]
>> However on the new image I got a strange error parsing xml files with
>> qt libraries, it always gives me an error on line 1, character 1, the
[...]
> For me it was fixed by using -O2 instead of -Os, -Os ALWAYS reproduce
> exactly this error. -O2 - never for me. So, try change your compile
> flags to less agressive (qt-compile flags).
>
> Maksim
>

Thanks! It fixed the problem! it seems qt runs fine with eglibc and thumb.
To build qt with -O2 i changed my local.conf adding:

FULL_OPTIMIZATION_pn-qt4-x11-free = "-fexpensive-optimizations
-fomit-frame-pointer -frename-registers -O2"

To fix that upstream I do not know where it should be placed as it
should affect all distro using gcc 4.4.x?

Best regards

    Nicola


