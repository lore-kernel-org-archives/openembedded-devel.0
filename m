Received: from sirius.lasnet.de ([78.47.116.19])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <stefan@datenfreihafen.org>) id 1OGYCH-0002Gr-ON
	for openembedded-devel@lists.openembedded.org;
	Mon, 24 May 2010 16:00:03 +0200
Received: from p5b034c45.dip.t-dialin.net ([91.3.76.69] helo=excalibur)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS-1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.63 #1)
	id 1OGY8J-0004U8-Gd by authid <stefan@sostec.de> with cram_md5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 May 2010 15:55:58 +0200
Received: from stefan by excalibur with local (Exim 4.71)
	(envelope-from <stefan@excalibur.local>) id 1OGY8I-0005Vw-DB
	for openembedded-devel@lists.openembedded.org;
	Mon, 24 May 2010 15:55:54 +0200
Date: Mon, 24 May 2010 15:55:54 +0200
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100524135551.GB9685@excalibur.local>
References: <1273758399-23601-1-git-send-email-aalonso00@gmail.com>
	<1273758399-23601-2-git-send-email-aalonso00@gmail.com>
	<1273758399-23601-3-git-send-email-aalonso00@gmail.com>
	<20100514122113.GH3507@excalibur.local>
	<AANLkTikMtgHDODuAzt-efsFrMyEOUsv6mnrK-14x5LxA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <AANLkTikMtgHDODuAzt-efsFrMyEOUsv6mnrK-14x5LxA@mail.gmail.com>
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
Subject: Re: [PATCH 3/5 v2] linux-xilinx-ml507: update kernel version
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
X-List-Received-Date: Mon, 24 May 2010 14:00:03 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello.

On Wed, 2010-05-19 at 09:53, Adrian Alonso wrote:
> 
> I have been looking on how to reorder the patch,
> but I'm still a git newbie :( and I don't quite well
> understand how to regenerate my patch sets with
> modifying the git log history, what I'm been doing
> is to create a new branch fix my patchs and resend
> them, thats clearly wrong.

No, thats good. What I normally do when I prepare a change that will contain
more then 2 patches is that I'm creating a branch for this. If I found a bug
later or people point them out to me in a review I will rework the patches in
this branch and resend.

For the rework process you have a lot tools in git's toolbox, but I agree that
they are are not the easiest ones. Still once I understood them I never want to
miss them again. :)

> Can you remove the patchs send on 2010-04-27 and
> from the second patch set remove patch 3 and 4;
> and use the path attached to make git bisec happy.

I'm build testing this combination right now. One question that is still open is
about the USE_VT in your first patch. Why did you comment it out? Something like
this should be mentioned in the changelog.

regards
Stefan Schmidt


