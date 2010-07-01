Received: from sirius.lasnet.de ([78.47.116.19])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <stefan@datenfreihafen.org>) id 1OUHUg-0007qZ-M8
	for openembedded-devel@lists.openembedded.org;
	Thu, 01 Jul 2010 12:59:47 +0200
Received: from p5b032f87.dip.t-dialin.net ([91.3.47.135] helo=excalibur.local)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS-1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.63 #1)
	id 1OUHQ5-0003lB-8n by authid <stefan@sostec.de> with cram_md5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Jul 2010 12:55:04 +0200
Received: from stefan by excalibur.local with local (Exim 4.72)
	(envelope-from <stefan@excalibur.local>) id 1OUHQ4-00052J-B9
	for openembedded-devel@lists.openembedded.org;
	Thu, 01 Jul 2010 12:55:00 +0200
Date: Thu, 1 Jul 2010 12:55:00 +0200
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100701105500.GA12260@excalibur.local>
References: <i0hp61$n03$1@dough.gmane.org>
MIME-Version: 1.0
In-Reply-To: <i0hp61$n03$1@dough.gmane.org>
X-Mailer: Mutt http://www.mutt.org/
X-KeyID: 0xDDF51665
X-Website: http://www.datenfreihafen.org/
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 78.47.116.19
X-SA-Exim-Mail-From: stefan@datenfreihafen.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: java staging problem
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
X-List-Received-Date: Thu, 01 Jul 2010 10:59:47 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello.

On Thu, 2010-07-01 at 12:03, Koen Kooi wrote:
> 
> I'm attempting to build openjdk using the jalimo overlay and I found a
> problem with the staging dirs:
> 
> /OE/angstrom-dev/sysroots/java <- contains a few jars e.g. xalan2.jar
> /OE/angstrom-dev/sysroot/x86_64-linux/usr/share/java <- contains other
> jars, e.g. serializer.jar
> 
> The openjdk configure tells the buildsystem that both xalan2.jar and
> serializer.jar are in /OE/angstrom-dev/sysroots/java when only
> xalan2.jar is.
> 
> I vaguely remember the buglabs people talking about that and their
> local.conf mangles some JAVA vars.

That is what we have in our local.conf:

# Stage JAR files not into ARCH related dirs
STAGING_DIR_JAVA = "${STAGING_DIR}/java"
STAGING_DATADIR_JAVA ?= ${STAGING_DIR_JAVA}

Full local.conf can be found here:
http://svn.buglabs.net/svn/!source/11343/bug/trunk/com.buglabs.build.oe/build/conf/local.conf

> How should we solve this in OE properly?

That is a good question. So far I have mostly avoided the java building and left
the honor to tarrent.

Our build setup is a bit fragile right now as javac segfault sometimes during
building and we don't know why. Another out of memory bug should be fixed by
Henning again.

Right now I would be happy to have a reliable build and then work towards
getting it mor sane and bring it into OE. Thats blocking me a bit here from
further upstream work, but we will get behind it.

regards
Stefan Schmidt


