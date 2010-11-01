Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PD0M5-00008Q-6Q
	for openembedded-devel@lists.openembedded.org;
	Mon, 01 Nov 2010 20:47:45 +0100
Received: by vws17 with SMTP id 17so4178912vws.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Nov 2010 12:46:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=M5mKhbgM+yHDPSiaHAgAAEudRdqTxl5iGwBhhy9W6Tc=;
	b=gMMyOUAV80rN6qB20lkHJelYQaq4mFfLM0CfAf0/oVdGANHcj1gLENMsm8UdO1rxrA
	/fFnCLqtF7AwIAqz/+58DxQRSH0ckzGf4dQ0a/E2i4UJLwq9LaEQiXef4KagPCJp1sQ2
	BxGtKb+DZ8gbbE1WXXNf7C+HYgzPEpkKugB2A=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=g1117pxJDa0LhHm+nouCHdWNTRYD4Ry6n8xLumJ8W88N7uqiAXl23TWMRMPJMRjNAo
	dCFHeHzy4PFXbASPP7aUsXjrROhcAqvlO6RwXcTM65Rh9WNl/2su071RE+noqbYq2gVj
	WSCQCiY9/vMBymYxQWLpvFUsHoQiCspAY6ELI=
Received: by 10.224.191.7 with SMTP id dk7mr8355376qab.54.1288640815251;
	Mon, 01 Nov 2010 12:46:55 -0700 (PDT)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id mz11sm5332168qcb.39.2010.11.01.12.46.53
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 01 Nov 2010 12:46:54 -0700 (PDT)
Date: Mon, 1 Nov 2010 12:47:03 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101101194703.GA12018@gmail.com>
References: <AANLkTi=gi8pk_McpA58rvcOHdq-0Xpz+NyF2doWPO00B@mail.gmail.com>
	<AANLkTinCa9E0F3FOm6TXg6NLc48pSgmijeUfqgmhtRuw@mail.gmail.com>
	<AANLkTimE05gQ2pSmkYouZMW1=rAg=-5S_sGu0nTgjpzh@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <AANLkTimE05gQ2pSmkYouZMW1=rAg=-5S_sGu0nTgjpzh@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.212.47
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
X-List-Received-Date: Mon, 01 Nov 2010 19:47:45 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (01/11/10 14:19), Zach Frey wrote:
> On Mon, Nov 1, 2010 at 1:35 PM, Khem Raj <raj.khem@gmail.com> wrote:
> 
> > On Mon, Nov 1, 2010 at 10:03 AM, Zach Frey <zach@znfrey.com> wrote:
> > > Hi everyone,
> > >
> > > I'm trying to build angstrom-gnome-image with latest for omapzoom2 (on
> > > Ubuntu 8.04) and I'm getting the following error:
> >
> > Are you using angstrom-2010 ? in that case you might want to
> > regenerate configure
> > as well as libtool scripts.
> >
> >
> Actually, I'm using
> 
> DISTRO = "angstrom-2008.1"
> 
> Should I try "angstrom-2010.x" ?

Well it built fine for me on minimal distro with libtool 2.4 and
machine=efikamx
you could try using angstrom-2010 and see if that helps as it also uses
libtool 2.4

other guess ...there could be build host difference as I am using ubuntu 10.10

> 
> 
> Thanks,
> Zach
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


