Received: from [66.111.4.25] (helo=out1.smtp.messagingengine.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <rod@whitby.id.au>) id 1IuaUQ-0007Rt-SG
	for openembedded-devel@lists.openembedded.org;
	Tue, 20 Nov 2007 22:18:39 +0100
Received: from compute2.internal (compute2.internal [10.202.2.42])
	by out1.messagingengine.com (Postfix) with ESMTP id 097844CBDD
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Nov 2007 16:16:28 -0500 (EST)
Received: from heartbeat2.messagingengine.com ([10.202.2.161])
	by compute2.internal (MEProxy); Tue, 20 Nov 2007 16:16:28 -0500
X-Sasl-enc: 2rlXUGsS52EjC84XhPpKwMYlkwZoOs5jkQFvmKnoKCtG 1195593385
Received: from [192.168.18.13] (CPE-121-209-18-182.sa.bigpond.net.au
	[121.209.18.182])
	by mail.messagingengine.com (Postfix) with ESMTP id 66B6417A9E
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Nov 2007 16:16:25 -0500 (EST)
Message-ID: <47434E97.9020406@whitby.id.au>
Date: Wed, 21 Nov 2007 07:46:07 +1030
From: Rod Whitby <rod@whitby.id.au>
User-Agent: Thunderbird 2.0.0.9 (Windows/20071031)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <20071119120819.GA17788@lenovo>	<47419EA0.4030308@student.utwente.nl>
	<4742217C.9060506@whitby.id.au>
	<74d0deb30711200112x17ad31fej4b25840a74e05abb@mail.gmail.com>
In-Reply-To: <74d0deb30711200112x17ad31fej4b25840a74e05abb@mail.gmail.com>
Subject: Re: Getting Started -Makefile
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
X-List-Received-Date: Tue, 20 Nov 2007 21:18:39 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

pHilipp Zabel wrote:
> So why not provide a simple shell wrapper instead of setup-env and the
> Makefile's build-package-% part? That way, at least people would learn
> the correct bitbake syntax from the beginning.
> 
> $ cat ~/bin/bitbake
> #!/bin/sh
> export OEDIR=${OEDIR:-$PWD}
> export BBPATH=${BBPATH:-$OEDIR/build:$OEDIR/openembedded}
> /usr/local/bin/bitbake $*
>
>> If we can fix the underlying problem (needing to type more than one
>> command to build an image with bitbake), then I will fully support a
>> move to get rid of all bitbake wrappers from all the Makefiles that I
>> manage.
> 
> The question is how to fix this problem correctly.
> One possibility would be that bitbake, if BBPATH is unset, issues a
> warning and scans the file system (starting from the $PWD) for a
> certain file (local.conf) in which BBPATH would be specified.

Finally, someone who wants to help solve the problem, rather than just
dump on other development practices.  Thank you Philipp.

I personally feel that there should be a standard directory structure
mandated by OE (instead of just leaving it up to each developer to
choose how they want to set up OE this week), so that default behaviour
like the above can be added, and so that new users can be assisted
without needing to guess at what their directory structure and default
values are.

Part of the rationale for the Makefile setup is that you then have a
large group of developers who are all doing things *exactly* the same
way, with the same directory structure and same default contents of
configuration files.  That is a powerful way to assist new users and
make sure that problems in the build setup are found quickly, and that
solutions to those problems can be distributed just as quickly.

-- Rod


