Received: from mail-px0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PD0WQ-0000dL-KF
	for openembedded-devel@lists.openembedded.org;
	Mon, 01 Nov 2010 20:58:27 +0100
Received: by pxi2 with SMTP id 2so645317pxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Nov 2010 12:57:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=vwJw9BApOYkh4LxpbKGCOu1AOO4LS94vmIe5/hQHYqM=;
	b=A55qDE3yGG+6EuyKH4acYs6HEzxl7TUdZuLB/k9F5WzkLU81/NrtkPXv5wLaN5icQ0
	NsdX13/B2KBQZg7IM34DarPskf4Zupn8zX02VOrA3gNmPhCD8fJSXvtHg1cqkdVSjC8L
	9WSoiqjukzskHhYZA/5862Z/ioh56KJyXnxhs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=Tbqi5RnI284NyiYH4gAIM+nl+u9lHakeyTG78hkpumGAEEmQx8idU1Ad8Y0jVOpDDC
	uADYvcqEPE83twmmhexI6z8VuanesG96ohRjmGsBBPaScw1VYYSa0P4yEofhfDrbImft
	SzwDmXPlaRiVnQ4Aekvoy92hLLnQPe609k+NY=
Received: by 10.142.166.13 with SMTP id o13mr4750044wfe.253.1288641456861;
	Mon, 01 Nov 2010 12:57:36 -0700 (PDT)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id w14sm9414431wfd.6.2010.11.01.12.57.35
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 01 Nov 2010 12:57:36 -0700 (PDT)
Date: Mon, 1 Nov 2010 12:57:48 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101101195748.GB12018@gmail.com>
References: <AANLkTi=gi8pk_McpA58rvcOHdq-0Xpz+NyF2doWPO00B@mail.gmail.com>
	<AANLkTinCa9E0F3FOm6TXg6NLc48pSgmijeUfqgmhtRuw@mail.gmail.com>
	<AANLkTimE05gQ2pSmkYouZMW1=rAg=-5S_sGu0nTgjpzh@mail.gmail.com>
	<20101101194703.GA12018@gmail.com>
	<AANLkTi=TyPX5L5oUHYehsuvqr9FGSCaD_nj1Z8+P=8F_@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <AANLkTi=TyPX5L5oUHYehsuvqr9FGSCaD_nj1Z8+P=8F_@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.212.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Trouble compiling system-tools-backends
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
X-List-Received-Date: Mon, 01 Nov 2010 19:58:27 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (01/11/10 15:54), Zach Frey wrote:
> On Mon, Nov 1, 2010 at 3:47 PM, Khem Raj <raj.khem@gmail.com> wrote:
> 
> >
> > Well it built fine for me on minimal distro with libtool 2.4 and
> > machine=efikamx
> > you could try using angstrom-2010 and see if that helps as it also uses
> > libtool 2.4
> >
> 
> OK, thanks -- I'll report if angstrom-2010 works for me or not.
> 
> 
> > other guess ...there could be build host difference as I am using ubuntu
> > 10.10
> >
> 
> Is Ubuntu 8.04 "supported", or is it old enough that I ought to expect
> problems?

I think till the new LTS 10.04 release it was used by quite a few people
but now few of them might have switched to 10.04 LTS but it should
certainly be usable as build host IMO
> 
> 
> Thanks,
> Zach
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


