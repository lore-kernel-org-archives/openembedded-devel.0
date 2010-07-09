Received: from sirius.lasnet.de ([78.47.116.19])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <stefan@datenfreihafen.org>) id 1OXKSG-0004XA-0W
	for openembedded-devel@lists.openembedded.org;
	Fri, 09 Jul 2010 22:45:54 +0200
Received: from p5b034b21.dip.t-dialin.net ([91.3.75.33] helo=excalibur.local)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS-1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.63 #1)
	id 1OXKNV-0002Jm-Qd by authid <stefan@sostec.de> with cram_md5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 09 Jul 2010 22:41:00 +0200
Received: from stefan by excalibur.local with local (Exim 4.72)
	(envelope-from <stefan@excalibur.local>) id 1OXKNU-0005ug-4q
	for openembedded-devel@lists.openembedded.org;
	Fri, 09 Jul 2010 22:40:56 +0200
Date: Fri, 9 Jul 2010 22:40:55 +0200
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100709204055.GA12163@excalibur.local>
MIME-Version: 1.0
X-Mailer: Mutt http://www.mutt.org/
X-KeyID: 0xDDF51665
X-Website: http://www.datenfreihafen.org/
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 78.47.116.19
X-SA-Exim-Mail-From: stefan@datenfreihafen.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [RFC] New stable branch (and maybe a new process?)
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
X-List-Received-Date: Fri, 09 Jul 2010 20:45:54 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello.

I want to gather some feedback what people are feeling about a new stable
branch. It feels like the right time to do it soon. We have so many big changes
in that are not likely to get into stable/2009 like:

- New staging
- BBCLASSEXTEND
- Checksums in recipes
- Faster BitBake
- Enhanced java support with openjdk/icedtea
- And many I forgot...

With the latest fixes for the file:// problem the build feels stable at last for
me. I have not been involved with the latest stable branch so this is really
only a RFC from my side. Please let me know if you see big issues for such a
move.

Open questions:
---------------
- Do we feel comfortable with doing a new branch now?
- What version of bitbake we would like to have for this?
- What boards/images/distros will be supported in stable/2010?

I my be biased here regarding my work for BugLabs, but I feel me diverged that
much from stable/2009 that it gets problematic to get changes in and syncing
them with .dev. As well the overall build experience on .dev is pretty good the
last weeks. The file:// problems aside.

Another idea we just discussed on IRC was to have a model somehow related to
what debian is using. An ongoing flow of patches from .dev to a testing branch.
Perhaps automated with buildbot to move into testing when some certain builds
have passed with this commit. And also an _ongoing_ stream well tested patches
from testing into stable which eventually makes a time-based release every X
months form this ond move on.

That all needs to be filled with more details, but it could be a start. Let me
know what you think.

regards
Stefan Schmidt


