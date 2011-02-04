Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <a.tqvist@gmail.com>) id 1PlNdV-00005e-8B
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Feb 2011 16:31:49 +0100
Received: by iwn8 with SMTP id 8so2287309iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Feb 2011 07:30:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=7C/OFFaHxJvU+V6HXxiHeq3QOSAZF/PwSMp0wWq1pIU=;
	b=GlgPn6EPkR6OUDBA0zsvRJdJmpvC4OE5E6QW8DrYE4WVD/cdFgAurP0jr2cmSajYDQ
	Q8ewhy4xaXYWsVDwbSZXwfdVTtjKF1j9qMX5UT8D97lZM7nGzA3327Lpiocp5QHe1GYr
	9B3d4ISLc8UNa1ZIgdNGzu0E11B9R0OCe2WWo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=SaRdyuHtmfqHh1ois2B8diKOj26p+9gI7YIqGJDjaZvg6vc2AKPqPZBgwP5XgQZ+OJ
	JVcuI24LS8e5igsaA36lvyhjKy9UEZo9NFLTUAhMqeXlxA/aR/Y5Da13lpB7IpNNEKii
	qVlRRV2E82j8KyGjiybz4RIVewrwbbkHoahbM=
MIME-Version: 1.0
Received: by 10.231.34.9 with SMTP id j9mr13109206ibd.137.1296833450981; Fri,
	04 Feb 2011 07:30:50 -0800 (PST)
Received: by 10.231.30.135 with HTTP; Fri, 4 Feb 2011 07:30:50 -0800 (PST)
In-Reply-To: <4D4C1986.8090908@dresearch.de>
References: <AANLkTi=QkexH5odXt9-6a9SFe=hhyv=tsiBXOhHt-u9p@mail.gmail.com>
	<4D4C1986.8090908@dresearch.de>
Date: Fri, 4 Feb 2011 16:30:50 +0100
Message-ID: <AANLkTinhcwSCDH5__hXdxOx0G0oipvYFawqBmVWLHjLg@mail.gmail.com>
From: =?ISO-8859-1?Q?Anders_T=F6rnqvist?= <a.tqvist@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: testing branch 2011-02-03
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
X-List-Received-Date: Fri, 04 Feb 2011 15:31:49 -0000
Content-Type: text/plain; charset=ISO-8859-1

oestats is not working clean for the moment. I have ran some builds today
that all have been successful but the oestats server have onlu recorded a
few build tasks in the beginning of the build and therefore stays in status
"Started".

/Anders

2011/2/4 Steffen Sledz <sledz@dresearch.de>

> On 02/04/2011 02:08 PM, Cliff Brake wrote:
> > master has been merged to testing-next and is ready for clean builds.
>
> My first try with the new branch and minimal-image failed configuring
> libtool-native-2.2.6b-r28.1 with a perl version mismatch error (see attached
> log). :(
>
> Build Configuration:
> BB_VERSION        = "1.10.2"
> METADATA_BRANCH   = "testing-next"
> METADATA_REVISION = "f06b04c"
> TARGET_ARCH       = "arm"
> TARGET_OS         = "linux-gnueabi"
> MACHINE           = "hipox"
> DISTRO            = "angstrom"
> DISTRO_VERSION    = "2010.7-test-20110204"
> TARGET_FPU        = "soft"
>
> openSUSE 11.3 32-bit
>
> Steffen
>
> PS: Unfortunately oe-stats did not mentioned the problem and stayed in
> status "Started".
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>

