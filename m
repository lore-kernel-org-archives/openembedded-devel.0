Received: from [194.106.48.114] (helo=tim.rpsys.net ident=0)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1Klg2L-0004vw-5K
	for openembedded-devel@openembedded.org; Fri, 03 Oct 2008 10:29:21 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m938P5wJ032089
	for <openembedded-devel@openembedded.org>;
	Fri, 3 Oct 2008 09:25:05 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 31902-07 for <openembedded-devel@openembedded.org>;
	Fri,  3 Oct 2008 09:24:57 +0100 (BST)
Received: from [192.168.1.3] (dax.rpnet.com [192.168.1.3])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m938Oqhe032081
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Fri, 3 Oct 2008 09:24:53 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <gc4h9f$abi$1@ger.gmane.org>
References: <gc35ba$voi$1@ger.gmane.org>
	<1222986336.5190.33.camel@dax.rpnet.com> <gc4h9f$abi$1@ger.gmane.org>
Date: Fri, 03 Oct 2008 09:24:52 +0100
Message-Id: <1223022292.5243.0.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: Heads up: staging changes are going to land
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
X-List-Received-Date: Fri, 03 Oct 2008 08:29:21 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, 2008-10-03 at 09:23 +0200, Koen Kooi wrote:
> On 03-10-2008 00:25, Richard Purdie wrote:
> 
> > @@ -404,7 +414,7 @@ FULL_OPTIMIZATION = "-fexpensive-optimiz
> >   ##################################################################
> >
> >   FULL_OPTIMIZATION = "-fexpensive-optimizations -fomit-frame-pointer -frename-registers -O2"
> > -DEBUG_OPTIMIZATION = "-O -g"
> > +DEBUG_OPTIMIZATION = "-O -fno-omit-frame-pointer -g"
> >
> >
> > I think OE changed this for a reason and Poky never merged that change?
> > Maybe I don't remember right though?
> 
> mtn log leads it back to my bitkeeper import from 3 years ago, svn says 
> revision 1152 changed it in poky: 
> http://svn.o-hand.com/view/poky?rev=1152&view=rev
> So I suspect it's indeed about getting usefull profiling out of ARM 
> binaries :)

It is needed to get decent profiling on ARM, yes. Feel free to merge
that one then :)

Cheers,

Richard



