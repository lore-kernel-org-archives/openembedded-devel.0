Received: from [128.131.95.14] (helo=belief.htu.tuwien.ac.at)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <jin@mediatomb.cc>) id 1JRS6b-0006yY-5s
	for openembedded-devel@lists.openembedded.org;
	Tue, 19 Feb 2008 14:01:55 +0100
Received: by belief.htu.tuwien.ac.at (Postfix, from userid 10004)
	id 13A6483900; Tue, 19 Feb 2008 14:01:04 +0100 (CET)
Date: Tue, 19 Feb 2008 14:01:04 +0100
From: Sergey 'Jin' Bostandzhyan <jin@mediatomb.cc>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20080219130104.GC27792@deadlock.dhs.org>
References: <20080214155508.GA4163@deadlock.dhs.org>
	<47B4708B.6050008@student.utwente.nl>
MIME-Version: 1.0
In-Reply-To: <47B4708B.6050008@student.utwente.nl>
User-Agent: Mutt/1.5.15 (2007-04-06)
X-SA-Exim-Connect-IP: 128.131.95.14
X-SA-Exim-Mail-From: jin@mediatomb.cc
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@openembedded.org>
Subject: Re: building uClinux using OE
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 19 Feb 2008 13:01:55 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Thu, Feb 14, 2008 at 05:47:07PM +0100, Koen Kooi wrote:

[...]

> | What is missing?
> |
> | - applying elf2flt processing to produced binaries
> 
> That should happen automagically, we just need to stage some more
> binutils-cross headers for elf2flt to build

OK, I'll see that I get elf2flt to build, I'll surely have some questions
about the "automagically" part later on :)

> | - have a way of knowing that the particular build is done for the uClinux
> |   targets (maybe for some tweaks in .bb files if required or to apply
> patches
> |   only when necessary, allthough ifdef __uClinux__ defines could be used)
> |
> | - not sure what else?
> 
> Since you can't (practically) do shared libraries, all packaging (and
> probably staging) will be wrong, since you won't have libfoo.so.1, but
> something different.

OK, I'll keep that in mind.

> | I do not have any uClinux experience yet, and it seems to be quite
> difficult
> | to gather all the bits and pieces of information, so I'd appreciate
> comments
> | and suggestions, especially if you see that I am missing something.
> |
> | I'd also be interested in your thoughts on what would be the best way to
> | integrate it into OE.
> 
> I had a go at this a while ago, but I had to halt working on it since
> the uboot on the blackfin site refuses to load the uImage on the
> blackfin site, leaving me without a good testing target.
> I think forcing static linking would be the fastest way to get an image
> built, we can work on details (flat, shared-flat, fdpic, etc) after that.

How far did you come with the stuff you did back then? Did you merge anything
of it into OE and if yes, could you please point me to the things you did
so I can pick up from there?

Thanks,
Jin




