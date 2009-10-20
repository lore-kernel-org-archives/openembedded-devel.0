Received: from [209.85.221.176] (helo=mail-qy0-f176.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1N0IeB-0001Ed-IK
	for openembedded-devel@lists.openembedded.org;
	Tue, 20 Oct 2009 19:37:26 +0200
Received: by qyk6 with SMTP id 6so2337355qyk.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Oct 2009 10:36:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=YyCouN65h7yZt/QGnVZZu2QQfnWLLQfrWTCaeppV4PU=;
	b=vQrt322UdMc5Xy+qDTPtNV4/MaXzgaTCvLwjGOmhoDW0RV9y9BxpuKHMZ0g90iTBi1
	waD5dK+tt1f7aL+zlGkMOLN4uC8QMW5kyjqaizHIPRrf9HC3ZYoWtUMbYp8+NcbP9mZK
	t4oJfSeyV6ju0KgIHcQhmnvODEkMKaiDERm+c=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=Rd4jjG4KmbofIajw7L/HxZ6d6iGfVHb629f9ukfOut64Yg7mTR0fJ/YJIMchdveo60
	FlMPYo7JEvU56A6n9w4P8wBv6mhiA2ZhA2FWqlaWSam0iS9mm1335nUYHH8s5X0mK5ed
	zSFrpbDCsvlw6BlzrRCW/cvYhj5JeCD6PeHzs=
MIME-Version: 1.0
Received: by 10.229.93.4 with SMTP id t4mr946133qcm.93.1256060182841; Tue, 20 
	Oct 2009 10:36:22 -0700 (PDT)
In-Reply-To: <fd72b8f50910021949j32df480fofc70806bed0cba65@mail.gmail.com>
References: <fd72b8f50910020640i431e0b2cpae3b9816dd7e6184@mail.gmail.com>
	<fd72b8f50910021949j32df480fofc70806bed0cba65@mail.gmail.com>
Date: Tue, 20 Oct 2009 10:36:22 -0700
Message-ID: <19c1b8a90910201036g142492dci2983acbbb4365427@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.221.176
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: 2.7.2 libxml2, libxml2-native not available
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
X-List-Received-Date: Tue, 20 Oct 2009 17:37:26 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Oct 2, 2009 at 7:49 PM, mail mail <mail@april1985.com> wrote:
> Hi,
> I'm new to OE and I'm building console-image of openmoko from the latest git
> source. There are some NOTEs here:
>
> NOTE: Handling BitBake files: / (7315/7315) [100 %]
> NOTE: Parsing finished. 0 cached, 7027 parsed, 288 skipped, 0 masked.
> NOTE: Resolving any missing task queue dependencies
> NOTE: multiple providers are available for virtual/libusb0 (libusb,
> libusb-compat);
> NOTE: consider defining PREFERRED_PROVIDER_virtual/libusb0
> NOTE: preferred version 2.7.2 of libxml2 not available (for item libxml2)
> NOTE: preferred version 2.7.2 of libxml2 not available (for item libxml2)
> NOTE: preferred version 2.7.2 of libxml2-native not available (for item
> libxml2-native)
> NOTE: preferred version 2.7.2 of libxml2-native not available (for item
> libxml2-native)
> NOTE: Preparing runqueue
>
> The building process goes smoothly, but are there any problems about these
> unavailable packages?

recipe for this version does not exist but because it is demanded by
the distro thru preferred-om-2008-versions.inc
bitbake tries to look for this version and finds no corresponding
recipe. I think you can bump up the version in
preferred-om-2008-versions.inc to 2.7.3

> Thanks!
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


