Received: from sirius.lasnet.de ([78.47.116.19])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <stefan@datenfreihafen.org>) id 1NvUjp-0005vL-4L
	for openembedded-devel@lists.openembedded.org;
	Sat, 27 Mar 2010 13:03:37 +0100
Received: from p5b035482.dip.t-dialin.net ([91.3.84.130] helo=excalibur)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS-1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.63 #1)
	id 1NvUgh-0004Yy-LG by authid <stefan@sostec.de> with cram_md5
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Mar 2010 13:00:27 +0100
Received: from stefan by excalibur with local (Exim 4.71)
	(envelope-from <stefan@excalibur.local>) id 1NvUgg-0000Hk-MS
	for openembedded-devel@lists.openembedded.org;
	Sat, 27 Mar 2010 13:00:22 +0100
Date: Sat, 27 Mar 2010 13:00:22 +0100
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100327120022.GD21542@excalibur.local>
References: <4AF1C9D3.2020604@cam.ac.uk>
MIME-Version: 1.0
In-Reply-To: <4AF1C9D3.2020604@cam.ac.uk>
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
Subject: Re: [PATCH] Chrony time synchronization (chronyc and chronyd)
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
X-List-Received-Date: Sat, 27 Mar 2010 12:03:38 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello.

On Wed, 2009-11-04 at 18:37, Jonathan Cameron wrote:
> 
> Signed-off-by: Jonathan Cameron <jic23@cam.ac.uk>
> ---
> Unfortunately this package uses a hand rolled set of build scripts.
> The maintainers are happy to add fixes to any problems but are not
> keen on moving over to autotools. I don't get the impression many
> people cross compile this one! That is a shame because it is very
> useful with wireless sensor nodes.
> 
> There are a few nasty tests in the configure script that may well
> cause problems in cross compiles when the host is not also linux based.
> 
> I will work on getting these fixed at source, but it may take a while
> hence submission of this recipe in the meantime.
> 
> The reason this is the git version is recent patches to ensure
> that the LDPATH variable was not ignored in linking.
> 
> This recipe includes some convenient scripts and blank config
> files needed to get it up and running easily.

Applied and pushed. I have rewritten the subject line to be more like what we
expect in OE. If you have progress on having a saner upstream build system we
would appreciate if we could make this recipe a bit cleaner. Thanks.

regards
Stefan Schmidt


