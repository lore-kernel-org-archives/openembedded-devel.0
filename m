Received: from [71.6.201.124] (helo=easi.embeddedalley.com)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <trini@embeddedalley.com>) id 1MquMs-0006Rs-Ah
	for openembedded-devel@openembedded.org; Thu, 24 Sep 2009 21:52:45 +0200
Received: (qmail 25554 invoked from network); 24 Sep 2009 19:52:04 -0000
Received: from easi.embeddedalley.com (HELO localhost) (easi@71.6.201.124)
	by easi.embeddedalley.com with SMTP; 24 Sep 2009 12:52:04 -0700
Date: Thu, 24 Sep 2009 12:52:03 -0700
From: Tom Rini <trini@embeddedalley.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090924195203.GH9726@smtp.west.cox.net>
References: <1253226007.1495.264.camel@conroy-linux>
MIME-Version: 1.0
In-Reply-To: <1253226007.1495.264.camel@conroy-linux>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
X-SA-Exim-Connect-IP: 71.6.201.124
X-SA-Exim-Mail-From: trini@embeddedalley.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: interest in binary packaging?
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
X-List-Received-Date: Thu, 24 Sep 2009 19:52:45 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 17, 2009 at 06:20:07PM -0400, Chris Conroy wrote:

> I've developed a rather simplistic method for managing "binary" packages
> within OE in order to satisfy certain licensing requirements. I am not
> sure whether other users would have an interest in such a system, but
> I'll go ahead and pitch what I have working so far to see if there is
> any interest in improving it further or merging upstream.

Yes, there is interest.  The only issue I see off the top of my head is
that this doesn't work for deb / rpm / tar, when it could.  The way I've
solved this before is to have the binary version just be a tarball of
the do_install() from the source version,  Then -dbg/-dev/whatever gets
split up normally and other output formats work fine too.

-- 
Tom Rini


