Received: from mail-px0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PD0G1-0008LT-2p
	for openembedded-devel@lists.openembedded.org;
	Mon, 01 Nov 2010 20:41:29 +0100
Received: by pxi2 with SMTP id 2so641614pxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Nov 2010 12:40:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=uVAdxNCGIdyBHi+X7LbKcl6jQBZyu8PI6bmPqw416C0=;
	b=NAuJpdbTrXl4ejdSnvE6VMX+ujcsCfRp1Rwa/mSjr1r6tbjV2vjZjtdQD/QJhqiXFZ
	b29KMm+X3RN571eV87iC5/qW79etQVIJHcliNRTeBfyGFF9LUPSMxIlHru9at9pmN/mx
	Acf/CsVgDQS7kSpeOHbGZjmIel1Te6GP612oE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=fRrdNzsT/JMbVZ388uLohTApZ8tSoANmmut4o40R9DUxVUcZ1w01lb/9i9tvYL6E1b
	F34Ngj3li7tGvbKvnqilVUeoOJKWQpN23dMgjoSDgg2ez0eKR8fNXC+yXIDN0WKVmKPQ
	ggtdfIqMUIzqdQ5Bx0WAvQxLDL2O3a+OUYU4Q=
Received: by 10.142.199.19 with SMTP id w19mr4838976wff.390.1288640438509;
	Mon, 01 Nov 2010 12:40:38 -0700 (PDT)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id x18sm9386798wfa.11.2010.11.01.12.40.37
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 01 Nov 2010 12:40:37 -0700 (PDT)
Date: Mon, 1 Nov 2010 12:40:50 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101101194050.GC11482@gmail.com>
References: <AANLkTi=gi8pk_McpA58rvcOHdq-0Xpz+NyF2doWPO00B@mail.gmail.com>
	<AANLkTinCa9E0F3FOm6TXg6NLc48pSgmijeUfqgmhtRuw@mail.gmail.com>
	<AANLkTimE05gQ2pSmkYouZMW1=rAg=-5S_sGu0nTgjpzh@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <AANLkTimE05gQ2pSmkYouZMW1=rAg=-5S_sGu0nTgjpzh@mail.gmail.com>
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
X-List-Received-Date: Mon, 01 Nov 2010 19:41:29 -0000
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

I am not hopeful if that will help then.
let me see if I can reproduce it
> 
> 
> Thanks,
> Zach
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


