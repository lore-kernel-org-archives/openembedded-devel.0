Received: from [66.111.4.25] (helo=out1.smtp.messagingengine.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <rod@whitby.id.au>) id 1IuGR2-0004Nw-SV
	for openembedded-devel@lists.openembedded.org;
	Tue, 20 Nov 2007 00:53:48 +0100
Received: from compute1.internal (compute1.internal [10.202.2.41])
	by out1.messagingengine.com (Postfix) with ESMTP id 425F74CBBB
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Nov 2007 18:51:43 -0500 (EST)
Received: from heartbeat1.messagingengine.com ([10.202.2.160])
	by compute1.internal (MEProxy); Mon, 19 Nov 2007 18:51:43 -0500
X-Sasl-enc: 4bRxOZRGBKEOHx1EinSzp0c9QAPApTIsqG1NxBMUNYGD 1195516302
Received: from [192.168.76.11] (secure.astc-design.com [203.122.250.137])
	by mail.messagingengine.com (Postfix) with ESMTP id 5EEC624F
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Nov 2007 18:51:42 -0500 (EST)
Message-ID: <4742217C.9060506@whitby.id.au>
Date: Tue, 20 Nov 2007 10:21:24 +1030
From: Rod Whitby <rod@whitby.id.au>
User-Agent: Thunderbird 2.0.0.9 (Windows/20071031)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <20071119120819.GA17788@lenovo>
	<47419EA0.4030308@student.utwente.nl>
In-Reply-To: <47419EA0.4030308@student.utwente.nl>
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
X-List-Received-Date: Mon, 19 Nov 2007 23:53:49 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Koen Kooi wrote:
> David Farning schreef:
>> $make setup
> 
> nice
> 
>> $make build-package-vim
> 
> $deity just killed a few hundred kittens.
> 
> At OEDEM we decided that we won't tolerate kindergarten-like,
> hand-holding wrappers around bitbake. Typing 'bitbake vim' isn't rocket
> science. To paraphrase Mickey: "If typing 'bitbake <foo>' is too hard,
> you shouldn't be using OE".

The challenge I put to yourself and a couple of other people from the OM
core team in IRC a couple of weeks or months ago still stands:

Show how you can use bitbake such that you can cd into a build area, and
type a *single* bitbake command to do a build, then cd into a different
build area (with a different distro and machine) and type a *single*
bitbake command to do a build there.  No other commands are allowed.

At the moment, you need to set many environment variables before bitbake
can do it's job, and you need to reset them when you move into a
different area to do a different build.  That's the reason why there are
makefile wrappers around simple bitbake commands.

If we can fix the underlying problem (needing to type more than one
command to build an image with bitbake), then I will fully support a
move to get rid of all bitbake wrappers from all the Makefiles that I
manage.

Instead of just saying that you won't tolerate something, how about
understanding *why* that something is done, and then work together to
improve the existing tools so that something no longer needs to be done
cause the tools already cover that use case.

-- Rod



