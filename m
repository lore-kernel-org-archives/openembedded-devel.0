Received: from sirius.lasnet.de ([78.47.116.19])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <stefan@datenfreihafen.org>) id 1PuU6x-0005GT-4G
	for openembedded-devel@lists.openembedded.org;
	Tue, 01 Mar 2011 19:15:51 +0100
Received: from p5b03766e.dip.t-dialin.net ([91.3.118.110] helo=excalibur.local)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.69 #1)
	id 1PuU5Z-0001Xx-5B by authid <stefan@sostec.de> with cram_md5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Mar 2011 19:14:27 +0100
Received: from stefan by excalibur.local with local (Exim 4.74)
	(envelope-from <stefan@excalibur.local>) id 1PuU5X-000156-TX
	for openembedded-devel@lists.openembedded.org;
	Tue, 01 Mar 2011 19:14:24 +0100
Date: Tue, 1 Mar 2011 19:14:23 +0100
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110301181423.GA3435@excalibur.local>
References: <20110301103704.GC6918@excalibur.local>
	<20110301115120.GA26991@rhein.zuhause.netz>
	<20110301121610.GA9665@excalibur.local>
MIME-Version: 1.0
In-Reply-To: <20110301121610.GA9665@excalibur.local>
X-Mailer: Mutt http://www.mutt.org/
X-KeyID: 0xDDF51665
X-Website: http://www.datenfreihafen.org/
User-Agent: Mutt/1.5.20 (2009-06-14)
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on sirius.lasnet.de
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=5.0 tests=ALL_TRUSTED,AWL,BAYES_00
	autolearn=ham version=3.2.5
Subject: Re: Recent problems with host library leakage into the build
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
X-List-Received-Date: Tue, 01 Mar 2011 18:15:51 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello.

On Tue, 2011-03-01 at 13:16, Stefan Schmidt wrote:
> > 
> > seems I fixed it only for the newer 1.8.5 release.
> > Problem is with cacao which is configured from the icedtea Makefile.
> > It's needing autoreconf and  --with-libtool-sysroot
> > 
> > Have a look at the cacao-libtoolize.patch
> 
> Thanks a lot. Will do after lunch.

I decided for going with the newer release as it does fix some security issues
as well. I just pushed a patch which updates the default version in
angstrom-jalimo and openjdk-6 builds fine again.

If somebody really wants to go with the old version, I see no reason, it would
need to get a libtool fix like henning did for the new version. But I would
prefer to remove it as it is a version with known security problems.

regards
Stefan Schmidt


