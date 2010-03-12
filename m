Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1NqB19-0001OY-Ml
	for openembedded-devel@lists.openembedded.org;
	Fri, 12 Mar 2010 20:59:36 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id o2CJuT3I027578;
	Fri, 12 Mar 2010 19:56:29 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 27325-05; Fri, 12 Mar 2010 19:56:25 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id o2CJu8Ll027572
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 12 Mar 2010 19:56:15 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: Martyn Welch <martyn.welch@ge.com>
In-Reply-To: <4B9A02C9.3030205@ge.com>
References: <20100310103133.14548.62608.stgit@ES-J7S4D2J.amer.consind.ge.com>
	<1268341295.1625.7.camel@rex>  <4B9A02C9.3030205@ge.com>
Date: Fri, 12 Mar 2010 11:56:05 -0800
Message-ID: <1268423765.1625.18.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-Virus-Scanned: amavisd-new at rpsys.net
X-SA-Exim-Connect-IP: 93.97.173.237
X-SA-Exim-Mail-From: rpurdie@rpsys.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=AWL,BAYES_00,RDNS_DYNAMIC,
	TVD_RCVD_IP autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] Allow spectrum fw to build behind a proxy
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
X-List-Received-Date: Fri, 12 Mar 2010 19:59:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2010-03-12 at 09:00 +0000, Martyn Welch wrote:
> Richard Purdie wrote:
> > How about the recipe in Poky for this
> > (meta/packages/orinoco/spectrum-fw.bb)? I think all these problems were
> > addressed there.
> >   
> I tried exactly that first, wget keeps trying to download:
> 
> "ftp://symstore.longisland.com/Symstore/services_download/wirless_prod/MC"
> 
> not:
> 
> "ftp://symstore.longisland.com/Symstore/services_download/wirless_prod/MC&DriverOnlyInstallers.zip"
> 
> Has Bitbake been patched up in poky to handle "&" differently?

Ah, I remember this now. It is not a bitbake bug put a base.bbclass bug
as something somewhere has incorrect quoting. Its been fixed in Poky but
probably should be pushed into OE too. If you find the commit where I
last touched the spectrum-fw driver you'll find the core class change
too I suspect. It'd be good to get synced up on that.

Cheers,

Richard




