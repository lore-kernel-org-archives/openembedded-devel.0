Received: from [93.97.175.187] (helo=dan.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1MCVa1-0001JI-HQ
	for openembedded-devel@openembedded.org; Fri, 05 Jun 2009 11:19:17 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	n5599xs5005829 for <openembedded-devel@openembedded.org>;
	Fri, 5 Jun 2009 10:09:59 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id G+W1StUiDghK for <openembedded-devel@openembedded.org>;
	Fri,  5 Jun 2009 10:09:59 +0100 (BST)
Received: from [192.168.1.3] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	n5599pm4005793
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-devel@openembedded.org>;
	Fri, 5 Jun 2009 10:09:55 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <20090605020138.GB3406@denix.org>
References: <loom.20090604T211010-224@post.gmane.org>
	<20090605020138.GB3406@denix.org>
Date: Fri, 05 Jun 2009 10:08:53 +0100
Message-Id: <1244192933.5971.12.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Subject: Re: development process
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
X-List-Received-Date: Fri, 05 Jun 2009 09:19:17 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, 2009-06-04 at 22:01 -0400, Denys Dmytriyenko wrote:
> On Thu, Jun 04, 2009 at 09:35:36PM +0000, Michael Sundius wrote:
> > I have two issues with open embedded that I'm wondering if there is already a
> > solution for, or rather, am I totally missing the boat on how things work:
> > 
> > 1) regarding toolchains:
> > my understanding is that if you don't want to go through the exercise of
> > building gcc and glibc everytime you create a distribution, then you should use
> > the meta-toolchain.bb recipe to create a installable (tools) distribution and
> > then others can install the resultant on their own machine and use the
> > external-toolchain.bb recipe to integrate it w/ OE, populating the staging area
> > and creating the appropriate packages and what not. (part a: is this correct?)
> 
> That is pretty much correct.
> 
> > what if the boss says you gotta use the xyz toolchain from blowco inc (that
> > while complete, was not built w/ OE in mind and does not work w/ the
> > external-toolchain.bb recipe). I'm sure someone asked this question before, but
> 
> Yep, I went through this before. You may check http://arago-project.org if you 
> are interested, where I have it set up to use pre-built CodeSourcery Lite 
> toolchain.

Most toolchains can be made to work with OE. Poky has recipes for
external CSL coolchains for example:

http://git.pokylinux.org/cgit.cgi/poky/tree/meta/packages/meta/external-csl-toolchain_2008q3-72.bb

> > is the only recourse to package up the libraries (ala write a recipe) yourself
> 
> I had to package the necessary libraries and provide them as a tarball.
> 
> > and put them in to oe? is there an example recipe in the openembedded tree that
> > does this already? does someone have an example that they could share?, is there
> 
> My process of packaging the libraries is still very hacky and the recipe to do 
> it automatically is buggy and not finished...
> 
> If you do it yourself before I find some time to finish mine, please share. :)

See above. That packages up the needed bits for the CSL toolchain and
should be adaptable to other situations.

> > a doc explaining what needs to go where? (or of course am I just off base on my
> > question). could someone please educate me on best way to proceed (ie. the path
> > or least resistance).
> > 
> > 2) in a more general sense. 
> > as with most embedded systems, a developer working on a single component rarely
> > cares (or knows) about how to build/configure the rest of the systems. it should
> > just work. further when I have a task to fix a bug in said version of my small
> > little corner of the world I don't want to wait hours for the rest of the
> > software to be built before I can test my fix. is there a way to indicate my
> > PREFERRED_PROVIDER for a package/recipe (or even better all by default) is a
> > package feed? again maybe this is done on a regular basis or maybe its a special
> > thing, but I really didn't see any documentation/examples for it. It seems the
> > only reference to a package feed is to allow for easy installation of a system
> > that is already up and running... 
> 
> There was a "freeze" patch few weeks ago from Chris, which generates 
> versions.txt with necessary PREFERRED_VERSION lines for all the packages 
> built. That file can then be included to lock the versions down. I tried this 
> and it worked for me for the most part.
> 
> Later on Koen merged in a different "lockdown" implementation. For that you'd 
> need to inherit lockdown class. I haven't tried this one yet though.

What is really being requested here is packaged-staging.
Packaged-staging will build packages which can reconstruct the key OE
build directories. What it doesn't yet support is autodownloading of the
staging packages from a remote server but that shouldn't be hard to add.

There is a ton of documentation about packaged staging out there so I'd
suggest finding and reading it before reinventing the wheel.

Cheers,

Richard




