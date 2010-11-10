Received: from sirius.lasnet.de ([78.47.116.19])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <stefan@datenfreihafen.org>) id 1PGCx7-00046C-Tk
	for openembedded-devel@lists.openembedded.org;
	Wed, 10 Nov 2010 16:51:16 +0100
Received: from p5b036ce6.dip.t-dialin.net ([91.3.108.230] helo=excalibur.local)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS-1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.63 #1)
	id 1PGCw9-0000Yr-RP by authid <stefan@sostec.de> with cram_md5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Nov 2010 16:50:17 +0100
Received: from stefan by excalibur.local with local (Exim 4.72)
	(envelope-from <stefan@excalibur.local>) id 1PGCw8-0005NB-7N
	for openembedded-devel@lists.openembedded.org;
	Wed, 10 Nov 2010 16:50:12 +0100
Date: Wed, 10 Nov 2010 16:50:11 +0100
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101110155011.GA29405@excalibur.local>
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
Subject: First release three weeks ahead. Tasks you can help with.
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
X-List-Received-Date: Wed, 10 Nov 2010 15:51:16 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello.

December the 1th is our first release due. It will be the first in a, hopefully
long, row.

As it is the first release it will not be perfect, but we should try to make it
a stable base anyway. Some steps that I think should help are listed below:

- Stop pushing maybe problematic changes in the last 2 weeks. That gives you one
  week from now to get this in and fixed. So what is problematic? Changes to
  bbclass files, the toolchain, core system services and changes that may
  introduce runtime breakage should be avoided. There might be more.
  If in doubt sent the patch to the ml and ask others what they think.

- If you care about a specific machine, set of recipes or images start testing
  them now in our testing-next branch. The plan was to base the release tag on
  the testing-next branch. Or at least have it as fallback if master is broken.

  The testing matrix in the wiki will be used in the release tag in the same way
  it is used right now with the tested tag. Make sure the stuff you care is
  listed there as working to show other they could use it in this release.

- Try to take some hours in the last two weeks to get into bug fixing mode for
  some moments and help OE forward to the release. check the ML for problem
  reports and patches. Test, apply and mark them in patchwork as applied.

I think that are the minimal steps we need to get a release out of the door.
More will come when learning from the first releases.

Anyone willing to take the release mainatainer hat for this release? My time is
rather occupied with other things the next weeks. :/
It would be only for this release. Afterwards we can discuss if this should be a
fixed position or newly assigned for any release. Such a person should keep the
people motivated to fix some bugs, monitor the commit log for potential problems
and discuss them and finally make the release tag in the meta data.

Any takers?

regards
Stefan Schmidt


