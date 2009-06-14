Received: from [78.47.116.19] (helo=sirius.lasnet.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <stefan@datenfreihafen.org>) id 1MFndS-0007j4-Rx
	for openembedded-devel@lists.openembedded.org;
	Sun, 14 Jun 2009 13:12:26 +0200
Received: from p5b037781.dip.t-dialin.net ([91.3.119.129] helo=dodger)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS-1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.63 #1)
	id 1MFnTT-0002ZH-Nj by authid <stefan@sostec.de> with cram_md5
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 14 Jun 2009 13:02:19 +0200
Received: from stefan by dodger with local (Exim 4.69)
	(envelope-from <stefan@dodger.lab.datenfreihafen.org>)
	id 1MFnU4-0001TF-Il for openembedded-devel@lists.openembedded.org;
	Sun, 14 Jun 2009 13:02:44 +0200
Date: Sun, 14 Jun 2009 13:02:44 +0200
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090614110244.GA5302@dodger.lab.datenfreihafen.org>
References: <64d5b90a0906132251l51316419nb38733dfc1e49004@mail.gmail.com>
	<1244967611.29153.21.camel@lenovo.internal.reciva.com>
MIME-Version: 1.0
In-Reply-To: <1244967611.29153.21.camel@lenovo.internal.reciva.com>
X-Mailer: Mutt http://www.mutt.org/
X-KeyID: 0xDDF51665
X-Website: http://www.datenfreihafen.org/
User-Agent: Mutt/1.5.19 (2009-01-05)
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on sirius.lasnet.de
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=ALL_TRUSTED,AWL,BAYES_00
	autolearn=ham version=3.2.3
Subject: Re: OpenSSL recipe : files not being shipped in any package
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
X-List-Received-Date: Sun, 14 Jun 2009 11:12:27 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello.

On Sun, 2009-06-14 at 09:20, Phil Blundell wrote:
> On Sun, 2009-06-14 at 11:21 +0530, Kirtika Ruchandani wrote:
> > NOTE: package openssl-0.9.8j-r2: task do_package: started
> > NOTE: the following files were installed but not shipped in any package:
> > NOTE:   /usr/lib/ssl/openssl.cnf
> > NOTE:   /usr/lib/ssl/misc/CA.sh
> > NOTE:   /usr/lib/ssl/misc/CA.pl
> > NOTE: package openssl-0.9.8j-r2: task do_package: completed
> > 
> > Are these files deliberately excluded ?
> 
> No, it's probably a bug.  Want to send a patch?

The CA scripts you only need to setup new CA certificates. Please put them in a
separate package or is anybody seeing a cuse case for them on the device?

regards
Stefan Schmidt


