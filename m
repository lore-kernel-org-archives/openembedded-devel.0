Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PRLaV-0008Fl-W4
	for openembedded-devel@lists.openembedded.org;
	Sat, 11 Dec 2010 10:17:56 +0100
Received: by pwi8 with SMTP id 8so876262pwi.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 Dec 2010 01:16:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=rcEGXL4MjBvqL/Dl5Lgr0BNM0URyY3BncLUVFb824Ws=;
	b=jLGP3a4letVrSvyFibABgUGKW8EvzxXB2G/kSJk5xxEEXjeg+HvQe8UaSHAfGlMroa
	WFywaHAmmLISksbb6Oqd9paRmnP30Up0K/yoPfAEqG7SBIj2H+SmnfbtGhBF98SZLcb6
	H7ZQgKOBlYW/Z6FKMfv5HBomInvJJPqfr4KS0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=UeLD5aIU9vnk7APDPilQjRT6ZRkVSaEUJRgo7BlXKbI2fORdRC+cOw1XoZQcF2z0YP
	86PpK+pypXQ7sXd1lfsG89olBgAC4KD5gPZJzNiNuuvUtbYSivOtRfbbteNLtsVWBojm
	xPHUSGNlAF0oyBt3U7Dj35WNXe1xeltLFVgVs=
Received: by 10.142.136.6 with SMTP id j6mr1247156wfd.422.1292058981529;
	Sat, 11 Dec 2010 01:16:21 -0800 (PST)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id q13sm5314321wfc.5.2010.12.11.01.16.20
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 11 Dec 2010 01:16:20 -0800 (PST)
Date: Sat, 11 Dec 2010 01:16:20 -0800
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101211091620.GC8894@gmail.com>
References: <1290773874.28296.34.camel@mattotaupa>
	<1290774034.28296.37.camel@mattotaupa>
	<1290821557.3795.11.camel@mattotaupa>
	<1290822011.3795.13.camel@mattotaupa>
	<icqlp1$p90$2@dough.gmane.org>
MIME-Version: 1.0
In-Reply-To: <icqlp1$p90$2@dough.gmane.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.160.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 4/4] xbmc: add `zip-native` to `DEPENDS` and increase `PR`
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
X-List-Received-Date: Sat, 11 Dec 2010 09:17:57 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (27/11/10 11:16), Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> On 27-11-10 02:40, Paul Menzel wrote:
> 
> > I am not sure what the best way of submitting this series would be. Probably squashing everything in one patch or bump the `PR` in every patch.
> 
> Squashing :)

squashed and applied

> 
> I'll also talk to Tobias to see if we can pull in an updated version
> from e.g. trunk.
> 
> regards,
> 
> Koen
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
> 
> iD8DBQFM8NpgMkyGM64RGpERAt+RAJsHe1WFE0zwA4pdGeEYsJRTdk+GwgCePU+a
> 5Q3XQ4E7wAMGeiE1hg/RQpg=
> =+A3b
> -----END PGP SIGNATURE-----
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


