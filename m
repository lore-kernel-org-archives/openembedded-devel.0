Received: from sirius.lasnet.de ([78.47.116.19])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <stefan@datenfreihafen.org>) id 1Ob6zY-00068k-0Y
	for openembedded-devel@lists.openembedded.org;
	Tue, 20 Jul 2010 09:11:52 +0200
Received: from guest185.ibr.cs.tu-bs.de ([134.169.35.185] helo=excalibur.local)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS-1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.63 #1)
	id 1Ob6zO-00026S-3W by authid <stefan@sostec.de> with cram_md5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Jul 2010 09:11:44 +0200
Received: from stefan by excalibur.local with local (Exim 4.72)
	(envelope-from <stefan@excalibur.local>) id 1Ob6zN-0005qh-KH
	for openembedded-devel@lists.openembedded.org;
	Tue, 20 Jul 2010 09:11:41 +0200
Date: Tue, 20 Jul 2010 09:11:41 +0200
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100720071141.GF1512@excalibur.local>
References: <AANLkTimlxdwUxIog99H_Er_QL-tzZ5Ntd9kTyT8BcG-Y@mail.gmail.com>
	<20100720065108.GC1512@excalibur.local>
	<AANLkTikm8U6XCOc_dOqWPDQiQZf-4SYPb1FMT6oQGgil@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <AANLkTikm8U6XCOc_dOqWPDQiQZf-4SYPb1FMT6oQGgil@mail.gmail.com>
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
Subject: Re: GPSBABLE -- fixed recipe
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
X-List-Received-Date: Tue, 20 Jul 2010 07:11:52 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello.

On Mon, 2010-07-19 at 23:59, J. L.  wrote:
> On Mon, Jul 19, 2010 at 11:51 PM, Stefan Schmidt
> <stefan@datenfreihafen.org> wrote:
> >
> > This workflow looks like more work in the beginning but it pays off for you and
> > us within the first two patches. :)
> 
> I am a VERY new beginner in all of this and would love to learn how to
> do it all properly as I have found a few recipes that I want to build
> but have issues. I will figure out how to do what your saying properly
> and send in the patch.

Good to see you are motivated. :)

> Do I need to put my recipe back to the original in OE first before
> making the patch? If this is way off you can just tell me to search on
> google. Thanks for taking the time to let me know though I appreciate
> it.

Normally you would change the recipe directly in the git checkout. That is
within the folder you have created with git clone ...

You would change the recipe to match the new checksums and the run "git diff" to
see what changes you have in your local repository. If all looks good a "git
commit" would make a local commit of your changes which you then could prepare a
patch from and then it here.

The man pages for the different steps are available with "git help $COMMAND" and
there are some good tutorials out there for git questsions. But the command
given above should bring you through the first submission.

regards
Stefan Schmidt


