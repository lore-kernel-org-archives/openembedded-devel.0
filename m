Received: from [66.111.4.25] (helo=out1.smtp.messagingengine.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <rod@whitby.id.au>) id 1IuQyk-00019N-8C
	for openembedded-devel@lists.openembedded.org;
	Tue, 20 Nov 2007 12:09:18 +0100
Received: from compute2.internal (compute2.internal [10.202.2.42])
	by out1.messagingengine.com (Postfix) with ESMTP id DE5024CCF8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Nov 2007 06:07:09 -0500 (EST)
Received: from heartbeat1.messagingengine.com ([10.202.2.160])
	by compute2.internal (MEProxy); Tue, 20 Nov 2007 06:07:09 -0500
X-Sasl-enc: KLH5XTbMnRCEpz9MjKozFqs1a/tWQ49DZBHRzeGGruUh 1195556829
Received: from [192.168.18.13] (CPE-121-209-18-182.sa.bigpond.net.au
	[121.209.18.182])
	by mail.messagingengine.com (Postfix) with ESMTP id 179D4F8AD
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Nov 2007 06:07:08 -0500 (EST)
Message-ID: <4742BFCA.9000205@whitby.id.au>
Date: Tue, 20 Nov 2007 21:36:50 +1030
From: Rod Whitby <rod@whitby.id.au>
User-Agent: Thunderbird 2.0.0.9 (Windows/20071031)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <20071119120819.GA17788@lenovo>	<47419EA0.4030308@student.utwente.nl>
	<4742217C.9060506@whitby.id.au>
	<1195551550.6337.15.camel@localhost.localdomain>
In-Reply-To: <1195551550.6337.15.camel@localhost.localdomain>
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
X-List-Received-Date: Tue, 20 Nov 2007 11:09:18 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Richard Purdie wrote:
> Would you agree that bitbake itself isn't painful to use? "bitbake xyz"
> is just as simple as "make image" (or whatever)?

Yes, with the comment that the make command takes notice of a standard
directory structure, and does the right thing based on that, echoing
every lower-level command that it executes, as opposed to bitbake, the
operation of which depends upon whichever set of environment variables
the user happened to remember to source latest (or in most cases I've
seen, forget to source and therefore get confused when bitbake complains
about not being able to do anything).

> See my previous mail about how Poky handles this: "source script;
> bitbake xyz". I realise this isn't the one stop shop you describe but I
> think the fact bitbake is exposed to the user is a really positive move
> and well worth the slight extra learning curve. The script being sourced
> can even hint at the commands to run...

Um, the makefile *prints* *out* the exact bitbake commands that are
being run.  If it's so simple, then one would assume that people would
learn from that and start typing the commands themselves ...

> If the makefile worked like that, exposing the user to bitbake instead
> of hiding it, most of the opposition to the makefile would be removed.

Market forces prevail - if we improve the OE documentation and user
tutorials and ease of use, then people won't need the makefiles.  The
makefiles are an option they are mandatory - if the other options become
easier to use then  people will use them.  If the other options do not
become easier to use, then one might put forward a position that the
easiest to use option *should* prevail.

The OE documentation and wiki has the commanding position in teaching
new people how to access and use OE.  Note that *nowhere* in the OE wiki
or documentation are the makefiles mentioned.  If that commanding
position cannot be turned into a scenario where people run bitbake
directly rather than a Makefile, then one must question why that is not
the case, rather than just disparaging the Makefile and leaving the
users out in the cold.

-- Rod


