Received: from sirius.lasnet.de ([78.47.116.19])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <stefan@datenfreihafen.org>) id 1P381i-0004eW-36
	for openembedded-devel@lists.openembedded.org;
	Tue, 05 Oct 2010 15:57:54 +0200
Received: from guest190.ibr.cs.tu-bs.de ([134.169.35.190] helo=excalibur.local)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS-1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.63 #1)
	id 1P381O-0003gj-R2 by authid <stefan@sostec.de> with cram_md5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 Oct 2010 15:57:37 +0200
Received: from stefan by excalibur.local with local (Exim 4.72)
	(envelope-from <stefan@excalibur.local>) id 1P381N-0005X2-7B
	for openembedded-devel@lists.openembedded.org;
	Tue, 05 Oct 2010 15:57:33 +0200
Date: Tue, 5 Oct 2010 15:57:32 +0200
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101005135732.GE3517@excalibur.local>
References: <AANLkTikzKs+3U0JfEbQxg5dLVuMF51To2qTn55YLOmjg@mail.gmail.com>
	<20101005123257.GD3517@excalibur.local>
	<i8f965$scu$1@dough.gmane.org>
MIME-Version: 1.0
In-Reply-To: <i8f965$scu$1@dough.gmane.org>
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
Subject: Re: testing 2010-10-04
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
X-List-Received-Date: Tue, 05 Oct 2010 13:57:54 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello.

On Tue, 2010-10-05 at 15:28, Koen Kooi wrote:
> On 05-10-10 14:32, Stefan Schmidt wrote:
> > Hello.
> > 
> > On Mon, 2010-10-04 at 14:05, Cliff Brake wrote:
> >> Testing run from last week:
> >> http://cgit.openembedded.org/cgit.cgi/openembedded/tag/?id=testing_2010-09-27
> >>
> >> testing-next is updated and ready for clean builds:
> >> http://wiki.openembedded.net/index.php/Testing
> > 
> > Openjdk-6 build fails on cacao:
> > http://tinderbox.openembedded.net/public/logs/task/8408323.txt
> 
> Openjdk fails in a lot of ways. Building it is a lottery. When changing
> nothing (host system and OE) I can do 2 builds from scratch and have one
> building openjdk and the other will fail. Or hang in icedtea compilation
> taking 0% cpu.

It was the first fail for all testing-next builds that have been done until now.

I agree that building it is not as stable as I would like it, but it is also not
as bad as described. The only problem i have been run into for a long time is a
segfault of the host javavm when bringing up other packages. Restarting the
build always gaves me a working image.

> So openjdk is not a good measure of passing judgement over a branch.

It failed in 1 out of 7 testing cycles for now. Not that bad imho. Surely it
gives no idea of the overall usability of a certain branch, but thats why we
have more images and distros to cover up more areas.

regards
Stefan Schmidt


