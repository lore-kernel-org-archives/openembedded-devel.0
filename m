Received: from [93.97.175.187] (helo=dan.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1N4ySq-0006ZV-VM
	for openembedded-devel@openembedded.org; Mon, 02 Nov 2009 16:05:04 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	nA2F0vQj001154
	for <openembedded-devel@openembedded.org>; Mon, 2 Nov 2009 15:00:57 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id R6rI7khVXbJP for <openembedded-devel@openembedded.org>;
	Mon,  2 Nov 2009 15:00:57 +0000 (GMT)
Received: from [192.168.1.3] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	nA2F0rC0001139
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-devel@openembedded.org>; Mon, 2 Nov 2009 15:00:55 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <hcmqcv$5n4$1@ger.gmane.org>
References: <1257169407.11338.71.camel@dax.rpnet.com>
	<hcmqcv$5n4$1@ger.gmane.org>
Date: Mon, 02 Nov 2009 15:00:10 +0000
Message-Id: <1257174010.11338.81.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
X-SA-Exim-Connect-IP: 93.97.175.187
X-SA-Exim-Mail-From: rpurdie@rpsys.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Staging - time to end the current mess?
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
X-List-Received-Date: Mon, 02 Nov 2009 15:05:04 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, 2009-11-02 at 15:29 +0100, Koen Kooi wrote:
> On 02-11-09 14:43, Richard Purdie wrote:
> > At OEDEM two years ago I proposed radically altering the way staging
> > worked. For those that don't remember the bad old days, the staging
> > directory layout didn't match that of the target file system meaning
> > every recipe needed a custom do_stage and things were a mess.
> >
> > We changed the layout allowing the use of the gcc/binutils sysroot
> > options and also started widespread use of autotools_stage_all and I'd
> > say things look much improved compared to how they were.
> >
> > Anyone who has looked at the packaged-staging code will probably agree
> > there is still a way to go though - its horrendously complicated. We
> > also do a lot of duplication. I'd like to propose a new simple way of
> > doing things. We'd have the following work flow:
> >
> >
> > [...]
> > do_compile - up to here all as usual
> > do_install - Everything installs into a DESTDIR (including -native)
> > do_package - Takes a copy of the DESTDIR, applies any .la/.pc mangling
> >               then splits into packages as usual
> > do_populate_staging - Takes a copy of the DESTDIR, mangles, installs
> >               into staging and creates staging packages from this
> >
> > Firstly, does any disagree with this approach or can we all agree its a
> > nice objective?
> 
> Can we make the mangling a seperate tasks? I tend to do the mangling in 
> do_compile_append to be able to do builds *on* the target as well.

I just published my WIP tree:

http://cgit.openembedded.net/cgit.cgi/openembedded/log/?h=rpurdie/work-in-progress

and specifically:

http://cgit.openembedded.net/cgit.cgi/openembedded/commit/?h=rpurdie/work-in-progress&id=1d69a38be629a70faf65dd9f2e9db12164071bfd

which means we'd start declaring "mangling" functions in their own
right. Does that work for you?

Where we run these is then up to the core metadata so we can attach them
to stage/install/compile as makes sense. I want to declare some
conventions of the directories these operate on so we can make the
functions "relocatable" by changing the input variables.

> And
> 
> * 'make install' doesn't actually work properly for lots of packages 
> (you know, the ones with handcrafted makefiles)
> 
> But we can solve that by putting the custom do_stage() methods for those 
> in do_install(), right?

Those packages will already have a custom do_install in some directory
so we can just use them as is.

Cheers,

Richard



