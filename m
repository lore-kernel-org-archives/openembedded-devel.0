Received: from sirius.lasnet.de ([78.47.116.19])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <stefan@datenfreihafen.org>) id 1NvYyF-00068u-0W
	for openembedded-devel@lists.openembedded.org;
	Sat, 27 Mar 2010 17:34:47 +0100
Received: from p5b035482.dip.t-dialin.net ([91.3.84.130] helo=excalibur)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS-1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.63 #1)
	id 1NvYv8-0002os-Hw by authid <stefan@sostec.de> with cram_md5
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Mar 2010 17:31:37 +0100
Received: from stefan by excalibur with local (Exim 4.71)
	(envelope-from <stefan@excalibur.local>) id 1NvYv7-000513-AU
	for openembedded-devel@lists.openembedded.org;
	Sat, 27 Mar 2010 17:31:33 +0100
Date: Sat, 27 Mar 2010 17:31:33 +0100
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100327163133.GI21542@excalibur.local>
References: <20100310225420.19981.qmail@mx1.pimp.lart.info>
MIME-Version: 1.0
In-Reply-To: <20100310225420.19981.qmail@mx1.pimp.lart.info>
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
Subject: Re: [PATCH] putty: Update ancient recipe to use recent gtk2-based svn
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
X-List-Received-Date: Sat, 27 Mar 2010 16:34:47 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello.

On Sun, 2010-03-07 at 19:06, Bernd Wachter wrote:
> ---
>  recipes/putty/putty/configure.patch |   11 ++++++++
>  recipes/putty/putty/lib.pro         |   43 ---------------------------------
>  recipes/putty/putty/plink.pro       |   10 -------
>  recipes/putty/putty/pscp.pro        |   10 -------
>  recipes/putty/putty/psftp.pro       |   10 -------
>  recipes/putty/putty_svn.bb          |   45 +++++++++-------------------------
>  6 files changed, 23 insertions(+), 106 deletions(-)
>  create mode 100644 recipes/putty/putty/configure.patch
>  delete mode 100644 recipes/putty/putty/lib.pro
>  delete mode 100644 recipes/putty/putty/plink.pro
>  delete mode 100644 recipes/putty/putty/pscp.pro
>  delete mode 100644 recipes/putty/putty/psftp.pro

I was looking into applying this patch, but was biten by this requirement:

> --- a/recipes/putty/putty_svn.bb
> +++ b/recipes/putty/putty_svn.bb
> @@ -1,44 +1,23 @@
> +# requires halibut to be installed on the host system

We don't like to depend on packages installed on the host system if we can avoid
it. Could you provide a recipe for halibut-native so it can all be build within
OE?

regards
Stefan Schmidt


