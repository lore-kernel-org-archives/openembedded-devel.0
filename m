Received: from [74.125.44.152] (helo=yx-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1KMPpw-0007Rx-5v
	for openembedded-devel@lists.openembedded.org;
	Fri, 25 Jul 2008 18:08:08 +0200
Received: by yx-out-1718.google.com with SMTP id 4so557929yxp.42
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Jul 2008 09:06:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:cc:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=EHuGupYnxumECcskTTe/bSna3Y/dEjFyBjWYmrKBweA=;
	b=T0JWsOwSr+OqAzCrcL6i9SF7ckN15YQKWbCMHNh6Q1MxUjeZhCt+wDw2f9HV1lCAWN
	QIXJqGuUeDEtkZFH5wyuym3TXPGSTaA5/b9kvKJFGJ5YObO5BWwB28t9cwwD9DoRXuRH
	6eMg1VY7cfdhPDh3MU2SrQh8k3QQPf90hV9GI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=IivXpZ+9WieB6oOjC8CLMOM0nkMPR43zTvOCdSbiDXzgE0V/Q9008DNAtwfrSpdg0n
	2vJqm4XIQ9uuy6+uItX5oyg4IDHO93eeXGMENrvwThNy/UjfB9vche3ei5O/ES9lovqq
	SqkpRfBZZag9zT25AdBGzpc5xYbZ+PLno30Zs=
Received: by 10.142.47.13 with SMTP id u13mr599080wfu.170.1217002006794;
	Fri, 25 Jul 2008 09:06:46 -0700 (PDT)
Received: from localhost ( [71.146.27.134])
	by mx.google.com with ESMTPS id 27sm13012209wff.3.2008.07.25.09.06.46
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 25 Jul 2008 09:06:46 -0700 (PDT)
Date: Fri, 25 Jul 2008 09:06:45 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20080725160645.GB9454@gmail.com>
References: <1216087105.10214.7.camel@isis> <487DACFF.5010504@gmail.com>
	<c384c5ea0807161343s2085dda5ua5f526967583e293@mail.gmail.com>
	<20080720014112.GA13759@oberlord>
	<20080723090416.GB24264@gmail.com>
	<1216890646.6103.5.camel@dax.rpnet.com>
	<1216915506.6103.40.camel@dax.rpnet.com>
	<g6a9vs$hok$1@ger.gmane.org> <20080725073304.GA10944@gmail.com>
	<20080725100127.GA4554@rhein.zuhause.netz>
MIME-Version: 1.0
In-Reply-To: <20080725100127.GA4554@rhein.zuhause.netz>
User-Agent: Mutt/1.5.17+20080114 (2008-01-14)
Cc: openembedded-devel@openembedded.org
Subject: Re: [RFC]: Toolchain build sequence alteration.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Fri, 25 Jul 2008 16:08:08 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (25/07/08 12:01), Henning Heinold wrote:
> On Fri, Jul 25, 2008 at 12:33:04AM -0700, Khem Raj wrote:
> > On (24/07/08 18:18), Koen Kooi wrote:
> > 
> > Thank you Koen and RP for testing it out and ACK'ing. I have committed
> > the big patch. Let me know of any fallouts and I will try to fix them.
> > 
> > Happy hacking.
> 
> Hi,
> 
> I find the first strange think when using angstroem and uclibc with
> armoabi. TARGET_OS is configured at
> 
> include/distro/angstrom-uclibc.conf
> 
> with
> TARGET_OS_UC =
> "linux${@['-uclibc','-uclibcgnueabi'][bb.data.getVar('TARGET_ARCH',d,1)
> in ['arm', 'armeb'] and bb.data.getVar('MACHINE',d) not in
> ['collie','h3600', 'h3800', 'simpad', 'htcwallaby']]}"
> 
> and
> 
> TARGET_OS ?= "${@['${TARGET_OS_UC}',
> 'uclinux-uclibc'][bb.data.getVar('TARGET_ARCH',d)  in ['bfin']]}"
> 
> For some reason it dont set TARGET_OS and therefor the sanity checker
> bails out.
> 
> For now I swtiched back to TARGET_OS = ..., as before and I am able to
> build packages again.

You can add this to your local.conf file. if you make it hard assignment
you wont be able to override it in local.conf for the architectures not
mentioned in this conditional.

Thanks

-Khem

> 
> Bye,
> 
> Henning
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


