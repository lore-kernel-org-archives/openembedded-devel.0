Received: from sirius.lasnet.de ([78.47.116.19])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <stefan@datenfreihafen.org>) id 1PEjtL-0006cp-MQ
	for openembedded-devel@lists.openembedded.org;
	Sat, 06 Nov 2010 15:37:15 +0100
Received: from p5b036781.dip.t-dialin.net ([91.3.103.129] helo=excalibur.local)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS-1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.63 #1)
	id 1PEjsT-0005Bp-Bz by authid <stefan@sostec.de> with cram_md5
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 06 Nov 2010 15:36:23 +0100
Received: from stefan by excalibur.local with local (Exim 4.72)
	(envelope-from <stefan@excalibur.local>) id 1PEjsS-0000MN-2Q
	for openembedded-devel@lists.openembedded.org;
	Sat, 06 Nov 2010 15:36:20 +0100
Date: Sat, 6 Nov 2010 15:36:19 +0100
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101106143619.GK6691@excalibur.local>
References: <y>
 <4cc228f0.1d8b970a.4cbb.0975@mx.google.com>
MIME-Version: 1.0
In-Reply-To: <4cc228f0.1d8b970a.4cbb.0975@mx.google.com>
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
Subject: Re: [PATCH 3/4] Add lightmediascanner_git recipe
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
X-List-Received-Date: Sat, 06 Nov 2010 14:37:16 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, 2010-10-22 at 22:14, fidencio@profusion.mobi wrote:
> From: Eduardo Lima (Etrunko) <eblima@gmail.com>
> 
> Signed-off-by: Eduardo Lima (Etrunko) <eblima@gmail.com>
> ---
>  recipes/lightmediascanner/lightmediascanner_git.bb |    7 +++++++
>  1 files changed, 7 insertions(+), 0 deletions(-)
>  create mode 100644 recipes/lightmediascanner/lightmediascanner_git.bb
> 
> diff --git a/recipes/lightmediascanner/lightmediascanner_git.bb b/recipes/lightmediascanner/lightmediascanner_git.bb
> new file mode 100644
> index 0000000..751d384
> --- /dev/null
> +++ b/recipes/lightmediascanner/lightmediascanner_git.bb
> @@ -0,0 +1,7 @@
> +require lightmediascanner.inc
> +
> +SRCREV = "${AUTOREV}"

Please don't do this. The _git recipes we use in OE have a rev specified instead
of building HEAD everytime the are called. Specify a sane srcrev here and switch
autorev on in your local.conf if you need it.

Besides this the patch has my ACK and I would apply an updated version.

regards
Stefan Schmidt


