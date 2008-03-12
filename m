Received: from [80.68.93.111] (helo=cassiel.sirena.org.uk ident=Debian-exim)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <broonie@sirena.org.uk>)
	id 1JZYtp-000094-LT; Wed, 12 Mar 2008 22:54:18 +0100
Received: from broonie by cassiel.sirena.org.uk with local (Exim 4.63)
	(envelope-from <broonie@sirena.org.uk>)
	id 1JZYrn-0005l1-R0; Wed, 12 Mar 2008 21:52:07 +0000
Date: Wed, 12 Mar 2008 21:52:07 +0000
From: Mark Brown <broonie@sirena.org.uk>
To: openembedded-devel@lists.openembedded.org,
	openembedded-devel@openembedded.org
Message-ID: <20080312215207.GA21155@sirena.org.uk>
Mail-Followup-To: openembedded-devel@lists.openembedded.org,
	openembedded-devel@openembedded.org
References: <3908.1205354089@dls.net> <87myp31xgr.fsf@frontier.dottedmag.net>
	<bdb0025f0803121359j4bb1698eoef41106809923503@mail.gmail.com>
	<fr9heg$9us$1@ger.gmane.org>
MIME-Version: 1.0
In-Reply-To: <fr9heg$9us$1@ger.gmane.org>
X-Cookie: Think big.  Pollute the Mississippi.
User-Agent: Mutt/1.5.13 (2006-08-11)
X-SA-Exim-Connect-IP: 80.68.93.111
X-SA-Exim-Mail-From: broonie@sirena.org.uk
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Reconsidering the work flow and how the SCM system fits in
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
X-List-Received-Date: Wed, 12 Mar 2008 21:54:19 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 12, 2008 at 10:20:16PM +0100, Koen Kooi wrote:

> So either apache or sshd, which means you can't setup a 'server' quickly
> during e.g. a conference.

Yes, git has nothing matching the single commands of mtn or hg if you
need to set up a temporary server in a hurry.

If you're looking for something you can do instantly on your laptop or
similar then serving it over git:// might do the job but it requires
inetd and flipping a switch to enable unauthenticated access:

  http://www.kernel.org/pub/software/scm/git/docs/everyday.html#Repository%20Administration

If you're actually talking to the person you're trying to share with
(presumably if you don't have sensible net access) there's also the
option of using a SSH server on your laptop (possibly in conjunction
with git-shell) to give them read-only access.

You can also just copy the entire repo to a machine, though that's not
going to be the most efficient thing in the world.  There's also the
option of using git-send-email plus git-am if you can transmit over
mail, but that's not guaranteed either and not everyone's mail setup can
deal with large volumes of patches gracefully.

Like I say, none of these options quite match the server options of hg
or mtn.

-- 
"You grabbed my hand and we fell into it, like a daydream - or a fever."


