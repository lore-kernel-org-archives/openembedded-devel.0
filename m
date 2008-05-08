Received: from [194.106.48.114] (helo=tim.rpsys.net ident=0)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1Ju4Kg-0000Xf-15
	for openembedded-devel@openembedded.org; Thu, 08 May 2008 13:30:42 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m48BU1HA022978
	for <openembedded-devel@openembedded.org>;
	Thu, 8 May 2008 12:30:01 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 22933-01-2 for <openembedded-devel@openembedded.org>;
	Thu,  8 May 2008 12:29:52 +0100 (BST)
Received: from [192.168.1.3] (dax.rpnet.com [192.168.1.3])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m48BTThq022942
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Thu, 8 May 2008 12:29:30 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <200805081306.37230.zecke@selfish.org>
References: <200805080215.23729.zecke@selfish.org>
	<fvuj9i$nt9$1@ger.gmane.org>  <200805081306.37230.zecke@selfish.org>
Date: Thu, 08 May 2008 12:29:30 +0100
Message-Id: <1210246170.5006.34.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: Creating a pristine environment?
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10b4
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
X-List-Received-Date: Thu, 08 May 2008 11:30:44 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, 2008-05-08 at 13:06 +0200, Holger Freyther wrote:
> On Thursday 08 May 2008 12:05:38 Koen Kooi wrote:
> > Holger Freyther wrote:
> > > Hey,
> > >
> > > I have seen raster's environment breaking various buildsystems and we
> > > might want to really start having a clean environment before starting to
> > > build.
> > >
> > > the patch below should implement it. Should we do this in OE? I'm aware
> > > of the unexport inside OE but we really should do this the otherway
> > > around.
> >
> > While this is a good idea, your current implementation breaks:
> >
> > MACHINE=foo ANGSTROM_MODE=bar bitbake foo-bar-image
> 
> Well, that would make a case for keeping the unexport feature in OE. Or we 
> could move the unsetting to after having parsed the configuration. I will 
> give the 2nd idea a go...

I agree we should do something, I'm just not sure what. Personally I do
set things in the environment quite heavily and I'd prefer not to lose
that capability. Perhaps we clean by default but allow a user to
override and claim their starting environment is clean at their own
risk?

Cheers,

Richard



