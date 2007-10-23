Received: from [216.145.234.92] (helo=demolition.dls.net)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <mwester@dls.net>) id 1IkA0O-0005TW-3d
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Oct 2007 05:00:32 +0200
Received: by demolition.dls.net (Postfix, from userid 67)
	id 3704F5D; Mon, 22 Oct 2007 21:33:33 -0500 (CDT)
From: <mwester@dls.net>
To: openembedded-devel@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Date: Mon, 22 Oct 2007 21:33:33 -0500
X-SentFrom: 12.27.45.5
X-SentAddr: 4675c051ba9e8885d6e5a82457605098ccf0a84b
User-Agent: DLS.net Webmail
References: <4510693243.20071017152524@vanille-media.de>
	<471729ED.9080208@student.utwente.nl>
	<1192708743.6158.25.camel@localhost.localdomain>
	<471C8BF4.1050206@student.utwente.nl>
	<1193063767.6088.54.camel@localhost.localdomain>
	<471CC31D.2010401@student.utwente.nl>
	<1193077473.6088.68.camel@localhost.localdomain>
	<20071022220255.497852be@cimmeria>
In-Reply-To: <20071022220255.497852be@cimmeria>
Message-Id: <20071023023333.3704F5D@demolition.dls.net>
Subject: Re: Cleaning up SDK/Toolchain
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
X-List-Received-Date: Tue, 23 Oct 2007 03:00:33 -0000
Content-Type: text/plain; charset=us-ascii; format=flowed

> > > That would be a better approach. Graeme, do you still want to have a
> > > shot at implementing a unionfs based approach?
> > 
> > Hmm. Does that need root privs?
> > 
> Not what I was thinking, which was to do a union via LD_PRELOAD
> basically redirecting open and its friends. I once saw a program that
> did this trick tomorrow I shall try and dig it out, and try and give
> it a few simple tests.
> 
> Graeme

Please, please don't tell me that you're thinking of doing something like fakeroot?!  (It still doesn't work reliably, and nobody has ever figured it out -- see the Debian bug reports for some interesting history on this thing's problems).

The huge, giant hole with LD_PRELOAD is that it only works if everyone plays nice and uses the same mechanism.  Since we can't predict how the staging directory might be used, it's pretty hard to ensure that we've caught all the corner cases.  And it's a devilishly difficult problem to solve.

Mike (mwester)


