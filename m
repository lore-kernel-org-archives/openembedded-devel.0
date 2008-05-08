Received: from [80.68.93.111] (helo=cassiel.sirena.org.uk ident=Debian-exim)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <broonie@sirena.org.uk>)
	id 1Ju5bm-0007L7-Mz; Thu, 08 May 2008 14:52:26 +0200
Received: from broonie by cassiel.sirena.org.uk with local (Exim 4.63)
	(envelope-from <broonie@sirena.org.uk>)
	id 1Ju5b7-00007T-JI; Thu, 08 May 2008 13:51:45 +0100
Date: Thu, 8 May 2008 13:51:45 +0100
From: Mark Brown <broonie@sirena.org.uk>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20080508125144.GB23041@sirena.org.uk>
Mail-Followup-To: openembedded-devel@lists.openembedded.org,
	openembedded-devel@openembedded.org
References: <200805080215.23729.zecke@selfish.org> <fvuj9i$nt9$1@ger.gmane.org>
	<200805081306.37230.zecke@selfish.org>
	<1210246170.5006.34.camel@dax.rpnet.com>
MIME-Version: 1.0
In-Reply-To: <1210246170.5006.34.camel@dax.rpnet.com>
X-Cookie: He who hesitates is sometimes saved.
User-Agent: Mutt/1.5.13 (2006-08-11)
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Mail-From: broonie@sirena.org.uk
X-SA-Exim-Scanned: No (on cassiel.sirena.org.uk);
	SAEximRunCond expanded to false
Cc: openembedded-devel@openembedded.org
Subject: Re: Creating a pristine environment?
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10b4
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
X-List-Received-Date: Thu, 08 May 2008 12:52:29 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 08, 2008 at 12:29:30PM +0100, Richard Purdie wrote:

> that capability. Perhaps we clean by default but allow a user to
> override and claim their starting environment is clean at their own
> risk?

That's roughly how SCons handles a similar feature - it defaults to
cleaning the environment but makes the original environment availiable
to the build system so it can either be referred to or imported
wholesale as desired.

-- 
"You grabbed my hand and we fell into it, like a daydream - or a fever."


