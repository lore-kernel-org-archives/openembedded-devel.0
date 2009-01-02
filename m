Received: from [93.97.173.237] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1LIYfA-0004bb-K3
	for openembedded-devel@openembedded.org; Fri, 02 Jan 2009 02:17:20 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id n021Bd6e020941
	for <openembedded-devel@openembedded.org>; Fri, 2 Jan 2009 01:11:39 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 20729-04 for <openembedded-devel@openembedded.org>;
	Fri,  2 Jan 2009 01:11:32 +0000 (GMT)
Received: from [192.168.1.3] (dax.rpnet.com [192.168.1.3])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id n021BV55020935
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@openembedded.org>; Fri, 2 Jan 2009 01:11:31 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <20090101220229.GH7040@smtp.west.cox.net>
References: <1230827114.5320.42.camel@dax.rpnet.com>
	<20090101182526.GF7040@smtp.west.cox.net>
	<1230840687.5320.56.camel@dax.rpnet.com>
	<20090101220229.GH7040@smtp.west.cox.net>
Date: Fri, 02 Jan 2009 01:11:53 +0000
Message-Id: <1230858713.10424.4.camel@dax.rpnet.com>
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
X-List-Received-Date: Fri, 02 Jan 2009 01:17:20 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit


On Thu, 2009-01-01 at 15:02 -0700, Tom Rini wrote: 
> On Thu, Jan 01, 2009 at 08:11:27PM +0000, Richard Purdie wrote:
> I know for quilt specifically anything you can compile in as a path you
> can override in quiltrc, and you can pass-in --quiltrc, so... next? :)

I'll have to remember that :)

> But yes, I too wouldn't mind having a few less -sdk packages in my own
> stuff too.
> 
> > I've been wondering how much the canadian SDK code will benefit from
> > this and perhaps you can give some input on that?
> 
> Off the top of my head, it depends on if we want to allow one env to
> make both a Linux and a Windows SDK.  The foo-canadian-sdk packages can
> fit very easily into any reuse scheme (the gcc ones look like all of the
> others now).  I was thinking there's no reason really (esp if we build
> gcc correctly for relcation, which we don't now) that any 'target gcc
> for sdk' recipe couldn't build for any one Linux or Windows target, but
> not both.  For my needs, I want both Linux and Windows SDKs kicked out
> from one bitbake invokation.

Ideally I want to be able to generate a Linux 32 bit toolchain, a Linux
64 bit toolchain and a windows one. If I can do that using canadian-sdk,
the current -sdk stuff can be removed.

I'm not sure the one bitbake invocation is going to work though or is
desirable.

I just had a look through the trini/canadian-sdk branch and there are
bits I like and bits I dislike. I'll try and provide some feedback in
due course with a view to getting the less controversial bits merged. I
have some tweaks in poky to do with dynamic library extension handling
for example (from playing with darwin targets) where it would pay us to
find a common solution.

More fundamentally I'm actually very nervous about something here which
is very difficult to put into words but I'll try. To do this, I'd like
to take a step back and think about how this should work. Our "normal"
OE usage has HOST == TARGET where the value is determined by MACHINE.
With the introduction of Canadian where BUILD != HOST != TARGET we
obviously need one more input. 

Correct me if I'm wrong but your approach seems to assume MACHINE is the
TARGET value? If so we may be missing an opportunity.

Lets for a second make the decision that MACHINE is actually the HOST
value. This makes sense in that everything we usually build is to run on
the HOST. From here we only need to add gcc-canadian recipe which builds
a compiler that runs on HOST but targets a different TARGET to normal to
have our BUILD != HOST != TARGET.

This does reverse the logic that the current sdk class we use however
since MACHINE is now the machine we want to run the compiler on, not the
machine we want to compile for. It should be simple enough to add some
MACHINEs and version setups which correspond to a Linux 32 bit system, a
Linux 64 bit system and a windows system though. Assuming the choice of
TARGET for gcc-canadian is controlled by a variable like SDKTARGET, to
run the builds I'd want, I'd run:

MACHINE=i686-generic   SDKTARGET=armv5te-generic bitbake gcc-canadian
MACHINE=x86-64-generic SDKTARGET=armv5te-generic bitbake gcc-canadian
MACHINE=winxp-generic  SDKTARGET=armv5te-generic bitbake gcc-canadian


By contrast, the scheme you are aiming for (as I understand it) would
be:

MACHINE=armv5te-generic SDKARCH=i686-generic   bitbake gcc-canadian
MACHINE=armv5te-generic SDKARCH=x86-64-generic bitbake gcc-canadian
MACHINE=armv5te-generic SDKARCH=winxp-generic  bitbake gcc-canadian

Can you see the point I'm making here? If not I'll try again tomorrow
after some sleep! :)

Also note why I don't see this being possible to combine into one
bitbake command, much the same way you can't build 10 machines with one
bitbake command.

Cheers,

Richard

-- 
Richard Purdie
Intel Open Source Technology Centre



