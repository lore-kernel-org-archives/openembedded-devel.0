Received: from [80.68.93.111] (helo=cassiel.sirena.org.uk ident=Debian-exim)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <broonie@sirena.org.uk>) id 1JesL0-000568-71
	for openembedded-devel@lists.openembedded.org;
	Thu, 27 Mar 2008 14:40:14 +0100
Received: from broonie by cassiel.sirena.org.uk with local (Exim 4.63)
	(envelope-from <broonie@sirena.org.uk>) id 1JesKy-0008M6-PD
	for openembedded-devel@lists.openembedded.org;
	Thu, 27 Mar 2008 13:40:13 +0000
Date: Thu, 27 Mar 2008 13:40:12 +0000
From: Mark Brown <broonie@sirena.org.uk>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20080327134009.GA20399@sirena.org.uk>
Mail-Followup-To: openembedded-devel@lists.openembedded.org
References: <47EAEB1D.9060004@xora.org.uk>
	<200803270150.46085.mickey@vanille-media.de>
	<47EAF1E0.8090401@xora.org.uk>
	<200803270311.47461.zecke@selfish.org>
MIME-Version: 1.0
In-Reply-To: <200803270311.47461.zecke@selfish.org>
X-Cookie: You're using a keyboard!  How quaint!
User-Agent: Mutt/1.5.13 (2006-08-11)
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Mail-From: broonie@sirena.org.uk
X-SA-Exim-Scanned: No (on cassiel.sirena.org.uk);
	SAEximRunCond expanded to false
Subject: Re: SCM scorecards
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
X-List-Received-Date: Thu, 27 Mar 2008 13:40:14 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 27, 2008 at 03:11:47AM +0100, Holger Freyther wrote:
> On Thursday 27 March 2008 02:01:20 Graeme Gregory wrote:

> > The methods of syncing two git trees seem to be hacks or alter
> > data. master becomes origin/master for example.

> repo.or.cz supports a mirror mode so it can't be too hard. My approach would 
> consist out of two shell commands:

That's a read-only mirror with one master server where writes happen.
What monotone supports is having multiple masters - users can push
changes to any of the servers and have the servers sort things out.
You'd also have to jump through a small hoop to make all the branches
visible on the child - by default it will not create local branches for
all remote branches, it will represent the remote branches as
remote/branch tags (where remote is the name of the remote, origin by
default).

-- 
"You grabbed my hand and we fell into it, like a daydream - or a fever."


