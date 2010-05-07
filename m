Received: from sirius.lasnet.de ([78.47.116.19])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <stefan@datenfreihafen.org>) id 1OAKhd-0001ng-SF
	for openembedded-devel@lists.openembedded.org;
	Fri, 07 May 2010 12:22:43 +0200
Received: from w0968.wlan.rz.tu-bs.de ([134.169.203.206] helo=excalibur)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS-1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.63 #1)
	id 1OAKdw-00043E-1v by authid <stefan@sostec.de> with cram_md5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 07 May 2010 12:18:54 +0200
Received: from stefan by excalibur with local (Exim 4.71)
	(envelope-from <stefan@excalibur.local>) id 1OAKdu-0002C5-6D
	for openembedded-devel@lists.openembedded.org;
	Fri, 07 May 2010 12:18:50 +0200
Date: Fri, 7 May 2010 12:18:50 +0200
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100507101850.GD18308@excalibur.local>
References: <alpine.DEB.1.10.1005011614380.15503@vitus.devnet.local>
	<1272723767-16871-1-git-send-email-vjensen@gmx.de>
	<1272723767-16871-2-git-send-email-vjensen@gmx.de>
MIME-Version: 1.0
In-Reply-To: <1272723767-16871-2-git-send-email-vjensen@gmx.de>
X-Mailer: Mutt http://www.mutt.org/
X-KeyID: 0xDDF51665
X-Website: http://www.datenfreihafen.org/
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 78.47.116.19
X-SA-Exim-Mail-From: stefan@datenfreihafen.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_HELO_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH v2] canutils: new recipe
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
X-List-Received-Date: Fri, 07 May 2010 10:22:43 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello.

On Sat, 2010-05-01 at 16:22, Vitus Jensen wrote:
> Adds canutils (PTX flavour) 4.0.4 as alternative to socketcan-utils-test.
> canutils RCONFLICTS with socketcan-utils-test because of identical
> file names.
> 
> Signed-off-by: Vitus Jensen <vjensen@gmx.de>
> ---
>  recipes/socketcan/canutils_4.0.4.bb           |   19 +++++++++++++++++++
>  recipes/socketcan/socketcan-utils-test_svn.bb |    1 +
>  2 files changed, 20 insertions(+), 0 deletions(-)
>  create mode 100644 recipes/socketcan/canutils_4.0.4.bb
> 
> diff --git a/recipes/socketcan/canutils_4.0.4.bb b/recipes/socketcan/canutils_4.0.4.bb
> new file mode 100644
> index 0000000..e769c46
> --- /dev/null
> +++ b/recipes/socketcan/canutils_4.0.4.bb
> @@ -0,0 +1,19 @@
> +DESCRIPTION = "canutils (PTX flavour)"
> +AUTHOR = "Luotao Fu"
> +HOMEPAGE = "http://www.pengutronix.de"
> +SECTION = "console/network"
> +PRIORITY = "optional"
> +LICENSE = "LGPL"
> +DEPENDS = "libsocketcan"
> +RDEPENDS = "libsocketcan"

Why do you need this RDEPENDS on the lib when it is already in DEPENDS?

> +RCONFLICTS = "socketcan-utils-test"
> +
> +TAG = "canutils-${PV}"
> +PR = "r0"
> +
> +SRC_URI = "git://git.pengutronix.de/git/tools/canutils.git;protocol=git;tag=${TAG} \
> +        "

Same about release tarballs and git SRC_URIs as from the other patch.

regards
Stefan Schmidt


