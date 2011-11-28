Received: from sirius.lasnet.de ([78.47.116.19])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <stefan@datenfreihafen.org>) id 1RUvxJ-0008W6-OP
	for openembedded-devel@lists.openembedded.org;
	Mon, 28 Nov 2011 08:48:49 +0100
Received: from [2001:638:602:1183:f2de:f1ff:fe62:28f7]
	(helo=novatech.datenfreihafen.org) by sirius.lasnet.de with esmtpsa 
	(Cipher TLS1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.69 #1)
	id 1RUvqq-0005En-Na by authid <stefan@sostec.de> with srv_auth_cram_md5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Nov 2011 08:42:13 +0100
Received: from stefan by novatech.datenfreihafen.org with local (Exim 4.77)
	(envelope-from <stefan@novatech.datenfreihafen.org>)
	id 1RUvrN-0003eX-3A for openembedded-devel@lists.openembedded.org;
	Mon, 28 Nov 2011 08:42:41 +0100
Date: Mon, 28 Nov 2011 08:42:41 +0100
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20111128074240.GA18674@novatech.datenfreihafen.org>
References: <4ED2D6D2.1020308@hopgarden.net>
MIME-Version: 1.0
In-Reply-To: <4ED2D6D2.1020308@hopgarden.net>
X-Mailer: Mutt http://www.mutt.org/
X-KeyID: 0xDDF51665
X-Website: http://www.datenfreihafen.org/
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on sirius.lasnet.de
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,NO_RELAYS
	autolearn=ham version=3.2.5
Subject: Re: New user build problem
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
X-List-Received-Date: Mon, 28 Nov 2011 07:48:49 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello.

On Mon, 2011-11-28 at 00:33, Reuben Wells wrote:
> 
> I had built most of the packages and then hit a problem and tried to
> start again. I removed all files and then ran:
> 
> git clone git://git.angstrom-distribution.org/setup-scripts
> MACHINE=beagleboard ./oebb.sh config beagleboard
> MACHINE=beagleboard ./oebb.sh update
> MACHINE=beagleboard ./oebb.sh bitbake virtual/kernel
> 
> Now I can't get past the "Parsing recipes", my cooker.log file just has:
> 
> NOTE: angstrom DOES NOT support libiconv because the eglibc provided
> iconv library is used
> NOTE: angstrom DOES NOT support libiconv because the eglibc provided
> iconv library is used
> ERROR: Could not include required file linux-2.6.39.inc
> ERROR: Command execution failed: Exited with 1
> 
> I've since tried refreshing a number of times with no luck.
> 
> I'm not sure where the reference to "linux-2.6.39.inc" is coming
> from. I can't find any references to it.

Its a problem introduced with a commit on meta-handheld. Taking out
the meta-handheld line in conf/bblayers.conf can work as a temporary
workaround.

regards
Stefan Schmidt


