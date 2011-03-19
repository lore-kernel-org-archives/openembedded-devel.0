Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Q0k7n-00066J-Ec for openembedded-devel@lists.openembedded.org;
	Sat, 19 Mar 2011 01:34:35 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p2J0WoXV015346
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 Mar 2011 00:32:50 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 15243-02 for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 Mar 2011 00:32:46 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p2J0WfAG015340
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 Mar 2011 00:32:41 GMT
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <87ei6439rz.fsf@eha.doredevelopment.dk>
References: <1299841477-23487-1-git-send-email-sledz@dresearch.de>
	<1300180117.2522.14.camel@eha>
	<1300360696.2132.14681.camel@phil-desktop>
	<1300373028.2468.8.camel@eha> <1300374439.9054.21.camel@phil-desktop>
	<1300384355.2175.13.camel@eha> <1300385153.9054.44.camel@phil-desktop>
	<1300391907.2175.23.camel@eha>
	<1300395614.3026.2.camel@lenovo.internal.reciva.com>
	<1300426143.8862.0.camel@eha> <1300443987.9054.64.camel@phil-desktop>
	<87ei6439rz.fsf@eha.doredevelopment.dk>
Date: Sat, 19 Mar 2011 00:32:24 +0000
Message-ID: <1300494744.30423.2239.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: Eliminating dependency race-conditions
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
X-List-Received-Date: Sat, 19 Mar 2011 00:34:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-03-18 at 13:14 +0100, Esben Haabendal wrote:
> By doing it this way, I don't think we are getting much closer to the
> second step (package-based build-time dependencies).  The OE-lite
> implementation of per-recipe staging builds on top of package-based
> build-time dependencies, so to do it the other way around, would imply
> taking the sstate concept and extend it to do per-recipe sysroots.
> After that, I believe you have exactly the same amount of development
> left to get where OE-lite is in respect to package-based build-time
> depencies and per-recipe staging.
> 
> As I see it, package-based build-time dependencies practically obsoletes
> sstate. 

This is where I think you misunderstand why sstate has been written and
what its role is.

Its a generic abstraction of taking the output from a task, saving it
away somewhere and then being able to reuse a prebuilt version of it.
There is no dependency on a package manager, package format or special
dependency formats. sstate simply looks for a prebuilt version (matching
a checksum), uses it if present, otherwise builds from "scratch".

> > I was thinking of situations like the Debian package autonamer, ie the
> > thing that causes glibc-dev to come out named "libc6-dev.ipk" or similar
> > depending on the soname of the library that was built.  It seems like
> > this would be a bit awkward to deal with if your dependencies were
> > specified purely in terms of output packages.
> 
> As OE-lite is not OE, we are currently not supporting such type of
> package renaming.  Let's leave that to Debian guys to fight with ;-)

What other features are you not supporting? Are you prepared to think
about them or is that someone else's problem?

Cheers,

Richard



