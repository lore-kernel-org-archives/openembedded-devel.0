Received: from [93.97.173.237] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1LITyN-0006C1-RP
	for openembedded-devel@openembedded.org; Thu, 01 Jan 2009 21:16:52 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id n01KBBHa018812
	for <openembedded-devel@openembedded.org>; Thu, 1 Jan 2009 20:11:11 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 18610-04 for <openembedded-devel@openembedded.org>;
	Thu,  1 Jan 2009 20:11:07 +0000 (GMT)
Received: from [192.168.1.3] (dax.rpnet.com [192.168.1.3])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id n01KB7gp018806
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@openembedded.org>; Thu, 1 Jan 2009 20:11:07 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <20090101182526.GF7040@smtp.west.cox.net>
References: <1230827114.5320.42.camel@dax.rpnet.com>
	<20090101182526.GF7040@smtp.west.cox.net>
Date: Thu, 01 Jan 2009 20:11:27 +0000
Message-Id: <1230840687.5320.56.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: RFC: "Virtual" native and sdk recipes
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
X-List-Received-Date: Thu, 01 Jan 2009 20:16:52 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit


On Thu, 2009-01-01 at 11:25 -0700, Tom Rini wrote:
> On Thu, Jan 01, 2009 at 04:25:14PM +0000, Richard Purdie wrote:
> 
> > Its nice to try something a bit different occasionally. For a long time
> > the mechanical repetitive nature of -native and -sdk recipes has
> > bothered me and people have talked about getting rid of them since
> > forever. I've had ideas floating around on how to address this for a
> > while and I now have a proper proposal and better still a proof of
> > concept.
> 
> I'll read the whole thing again later, but in working on the canadian
> SDK stuff (*poke*) I've been thinking why don't we just build the "SDK"
> packages for building our own stuff?  gcc/etc are relocatible if we
> build them right...

Even if gcc is relocatable, some software (quilt springs to mind) has to
be built using the paths it will be installed to. I'll happily support
any effort to make as much as possible support relocation but at the
very least we'll continue having -native packages and its them this is
primarily aimed at. I wouldn't want to miss the opportunity to kill off
many of the -sdk packages in poky at the same time though!

I've been wondering how much the canadian SDK code will benefit from
this and perhaps you can give some input on that?

Cheers,

Richard




