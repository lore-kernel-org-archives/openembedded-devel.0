Received: from [77.233.226.4] (helo=mail.doredevelopment.dk)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eha@dev.doredevelopment.dk>) id 1Q1xV9-0007AX-A1
	for openembedded-devel@lists.openembedded.org;
	Tue, 22 Mar 2011 10:03:43 +0100
Received: from localhost (localhost [127.0.0.1])
	by mail.doredevelopment.dk (Postfix) with ESMTP id E8C83EB7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Mar 2011 10:01:48 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at dev.doredevelopment.dk
Received: from mail.doredevelopment.dk ([127.0.0.1])
	by localhost (public.doredevelopment.dk [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id IrCJ8dNS4Ptr
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Mar 2011 10:01:44 +0100 (CET)
Received: from eha (unknown [192.168.18.101]) (Authenticated sender: eha)
	by mail.doredevelopment.dk (Postfix) with ESMTPA id 13EA9A6E
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Mar 2011 10:01:44 +0100 (CET)
Received: by eha (Postfix, from userid 1000)
	id 06C0DA7B3D; Tue, 22 Mar 2011 10:01:43 +0100 (CET)
From: Esben Haabendal <eha@dev.doredevelopment.dk>
To: openembedded-devel@lists.openembedded.org
References: <1299841477-23487-1-git-send-email-sledz@dresearch.de>
	<1300180117.2522.14.camel@eha>
	<1300360696.2132.14681.camel@phil-desktop>
	<1300373028.2468.8.camel@eha> <1300374439.9054.21.camel@phil-desktop>
	<1300384355.2175.13.camel@eha> <1300385153.9054.44.camel@phil-desktop>
	<1300391907.2175.23.camel@eha>
	<1300395614.3026.2.camel@lenovo.internal.reciva.com>
	<1300426143.8862.0.camel@eha> <1300443987.9054.64.camel@phil-desktop>
	<87ei6439rz.fsf@eha.doredevelopment.dk>
	<1300494744.30423.2239.camel@rex>
Date: Tue, 22 Mar 2011 10:01:43 +0100
In-Reply-To: <1300494744.30423.2239.camel@rex> (Richard Purdie's message of
	"Sat, 19 Mar 2011 00:32:24 +0000")
Message-ID: <87wrjrv894.fsf@eha.doredevelopment.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/23.1 (gnu/linux)
MIME-Version: 1.0
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
X-List-Received-Date: Tue, 22 Mar 2011 09:03:43 -0000
Content-Type: text/plain; charset=us-ascii

Richard Purdie <richard.purdie@linuxfoundation.org> writes:

> On Fri, 2011-03-18 at 13:14 +0100, Esben Haabendal wrote:
>> By doing it this way, I don't think we are getting much closer to the
>> second step (package-based build-time dependencies).  The OE-lite
>> implementation of per-recipe staging builds on top of package-based
>> build-time dependencies, so to do it the other way around, would imply
>> taking the sstate concept and extend it to do per-recipe sysroots.
>> After that, I believe you have exactly the same amount of development
>> left to get where OE-lite is in respect to package-based build-time
>> depencies and per-recipe staging.
>> 
>> As I see it, package-based build-time dependencies practically obsoletes
>> sstate. 
>
> This is where I think you misunderstand why sstate has been written and
> what its role is.

Please note my use of "practically", which should have been quoted or
something...

> Its a generic abstraction of taking the output from a task, saving it
> away somewhere and then being able to reuse a prebuilt version of it.

I know.  And this is clearly different to what package-based build-time
dependencies give.  Without sstate, you will not be able to reuse
prebuilt versions of any random task.  You can only reuse prebuilt
versions of packages (ie. do_package tasks).  In practice, I believe
that is sufficient for most needs.  But I don't see any showstoppers for
using something sstate together with package-based build-time
dependencies.  I am just saying that what I believes is the most
important value of sstate, more robus builds, is already provided the
package-based build-time dependencies.

> There is no dependency on a package manager, package format or special
> dependency formats. sstate simply looks for a prebuilt version (matching
> a checksum), uses it if present, otherwise builds from "scratch".
>
>> > I was thinking of situations like the Debian package autonamer, ie the
>> > thing that causes glibc-dev to come out named "libc6-dev.ipk" or similar
>> > depending on the soname of the library that was built.  It seems like
>> > this would be a bit awkward to deal with if your dependencies were
>> > specified purely in terms of output packages.
>> 
>> As OE-lite is not OE, we are currently not supporting such type of
>> package renaming.  Let's leave that to Debian guys to fight with ;-)
>
> What other features are you not supporting? Are you prepared to think
> about them or is that someone else's problem?

I am not sure what direction you are trying to push the discussion now.

I am not prepared to single-handedly (without a large $$$ sponsor) take
over complete responsibility for all of OE.

I am though prepared to think about them, and also prepared to work with
the OE community to find good solution to everybody else's problems.

I don't think it is totally fair to imply that I am being completely
ignorant to other people's problems.  I know we are ignoring a lot of OE
features in OE-lite, but that is the reason it is done as OE-lite and
not in OE.  I did not have time and manpower to implement what I needed
in the timeframes I had without ignoring those features.

I am though now approach you (OE community) trying to find out if we can
find a way to get some of the work done in OE-lite back to OE, just as
you have done several times with features developed in Poky going back
to OE.

Talking about that, with Poky being much more directly coupled with OE,
where will new features be developed in the future?  This discussion
seems to indicate that it is not going to be in OE as such.

/Esben


