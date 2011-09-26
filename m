Received: from vms173019pub.verizon.net ([206.46.173.19])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1R8KSH-0001Cv-7M
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Sep 2011 01:19:21 +0200
Received: from gandalf.denix.org ([unknown] [71.191.138.237])
	by vms173019.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LS5005PNKIX75W0@vms173019.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Mon,
	26 Sep 2011 18:13:50 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 254A914AF64; Mon,
	26 Sep 2011 19:13:45 -0400 (EDT)
Date: Mon, 26 Sep 2011 19:13:45 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20110926231345.GC24402@denix.org>
References: <1316848094-30368-1-git-send-email-jdk@ti.com>
	<1316849170.4893.6.camel@mattotaupa>
	<CA+T6QPn7hEB+7z6MSZooXZBUEiJXS+ktfPKq569GcfugSF8eSw@mail.gmail.com>
MIME-version: 1.0
In-reply-to: <CA+T6QPn7hEB+7z6MSZooXZBUEiJXS+ktfPKq569GcfugSF8eSw@mail.gmail.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Re: [meta-oe] WIP: cloud9: created
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
X-List-Received-Date: Mon, 26 Sep 2011 23:19:21 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Mon, Sep 26, 2011 at 12:24:11PM -0400, Jason Kridner wrote:
> 
> >> +SRCREV = "08bae1d1cc2ba9f7f883a25afd07f0339a82fa8b"
> >> +S = "${WORKDIR}/git"
> >> +
> >> +do_configure_prepend () {
> >> + git submodule update --init --recursive
> >> +}
> >> +
> >> +do_compile () {
> >> +}
> >
> > Maybe add comments why the above overrides are needed.
> 
> Will do.  Note that oe-sytlize removes the line breaks between the do_
> functions.  Is that really desired?

Not sure about the lack of empty lines between do_ functions - probably an 
unintended behavior of oe-stylize...

But I believe empty do_ functions need to have a single ':' character, which 
is a NOP in shell, to prevent bitbake from discarding the function altogether, 
if I'm not mistaken for the proper reason.

-- 
Denys


