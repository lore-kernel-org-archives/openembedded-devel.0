Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1Kms7f-0006yV-1I
	for openembedded-devel@openembedded.org; Mon, 06 Oct 2008 17:35:52 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m96F3YZO008888
	for <openembedded-devel@openembedded.org>;
	Mon, 6 Oct 2008 16:03:34 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 08569-07 for <openembedded-devel@openembedded.org>;
	Mon,  6 Oct 2008 16:03:28 +0100 (BST)
Received: from [192.168.1.3] (dax.rpnet.com [192.168.1.3])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m96F3Qqe008875
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Mon, 6 Oct 2008 16:03:26 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <gcd5mc$5hl$1@ger.gmane.org>
References: <gcd5mc$5hl$1@ger.gmane.org>
Date: Mon, 06 Oct 2008 16:03:28 +0100
Message-Id: <1223305408.5235.39.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [RFC] granular library packaging
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
X-List-Received-Date: Mon, 06 Oct 2008 15:35:52 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, 2008-10-06 at 16:00 +0200, Koen Kooi wrote:
> I had a chat with Richard about it and we agreed that this needs some 
> more thought, especially wrt depencies and granular packaging. My 
> motivation for splitting things is to make using gdb less space-heavy 
> due to pulling in a huge -dbg package that depends on extra, unneeded 
> libs. As I pointed out above, that is sadly the case here since do_strip 
> runs too late.

There are various subtle problems with having multiple -dev and -dbg
packages. There are assumptions made in parts of the code that of foo
has bar as a build time dependency, foo-dev should RDEPEND on bar-dev.
If we split into multiple -dev packages, foo-dev needs to RDEPEND on all
the *-dev packages provided by bar-dev which gets a little more
complicated (think about trying to implement that when the list of -dev
packages is dynamic ;-).

For debugging or profiling, usually when you install foo-dbg you want
symbols for every library that package might use and the dependencies of
those libraries to ensure you get a meaningful stacktrace.

From what Koen's described he wants individual libs so he only has to
install one lib and not the dependencies. In that case I'd suggesting
telling the package manager to ignore the dependencies instead of trying
to neuter the package dependencies which are actually useful. If we go
with multiple libs, the depchain -dev and -dbg code will then have to
catch up with the change somehow and we'll be back to square one.

In machines where you're going to extensively use -dev and -dbg packages
you usually have enough space to install dependencies so my reasoning
has always been this isn't as much of a problem as the general grangular
packaging. Having tried to implement multiple -dev and -dbg in depchains
I'm very nervous of that idea (I think the code may now partially handle
it but there were problems, I don't recall exactly what offhand).

Cheers,

Richard








