Received: from [209.85.218.171] (helo=mail-bw0-f171.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Ljr30-0000iy-Fi
	for openembedded-devel@lists.openembedded.org;
	Wed, 18 Mar 2009 09:23:15 +0100
Received: by bwz19 with SMTP id 19so560693bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Mar 2009 01:21:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=CJGgxvQLqm836Za78PZWpPRM/lkLNVjWsmZsq1Wxu6Q=;
	b=c8vVI/jiR45a0sfsU7+UbSXjgaDZ+bKjZjkr6n8yilavTqwnhNQM7bzhxtlo0JIP6y
	pxtSqB+ubgrAM2233nRMBWaRYYnhTlNIwbre/+okgILIcMqcp8areO9VLO3eL0xP41DF
	Afi0r0eQdssFJd8JYFxKka0F4LpUAy91ery5M=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=Cb2gj6UoxP9DFR3afSlOl61tnMWVI65xJQa2R61PA4w7o4sgHC1BFRuILohNYCGX/U
	Td4B3Um6IDENqoXJEsj23Im07K1zpUtrTFhnXArt4HBQ4qcfSqHzjgOwCjdBZsqcAquD
	bJ57a42x4ndrWjT4kdDT+1BUIAGS+jaFvagBA=
MIME-Version: 1.0
Received: by 10.223.108.15 with SMTP id d15mr760083fap.62.1237364513595; Wed, 
	18 Mar 2009 01:21:53 -0700 (PDT)
In-Reply-To: <20090318001624.GB20384@denix.org>
References: <1237328436.20770.57.camel@homestead>
	<d1b08f940903171633l7c66f604rfa6375bd95b2c3bf@mail.gmail.com>
	<20090318001624.GB20384@denix.org>
Date: Wed, 18 Mar 2009 09:21:53 +0100
Message-ID: <ac9c93b10903180121l3454a2adqbaac9590659daf76@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.218.171
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-1.2 required=5.0 tests=AWL,BAYES_50,RDNS_NONE,
	SPF_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Cleaning tmp folder
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
X-List-Received-Date: Wed, 18 Mar 2009 08:23:23 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

A crude temp solution could be to just remove the stamps of all
non-native, non-cross packages.

Also if you only want to reclaim space I guess it is ok to remove the
work subdir (or at least in my case (beagleboard) the work/arm* dir)
If this is not right I guess someone will correct me :-)

Btw: it would also be nice to have a command to purge the tmp dir, so
if X build for r0 is there and X build for r1 is there the r0 version
is nuked. Never got to writing something for that though :-)

Frans.


