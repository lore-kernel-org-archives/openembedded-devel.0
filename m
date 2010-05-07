Received: from sirius.lasnet.de ([78.47.116.19])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <stefan@datenfreihafen.org>) id 1OAKgX-0001gT-UT
	for openembedded-devel@lists.openembedded.org;
	Fri, 07 May 2010 12:21:35 +0200
Received: from w0968.wlan.rz.tu-bs.de ([134.169.203.206] helo=excalibur)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS-1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.63 #1)
	id 1OAKcp-00042k-T2 by authid <stefan@sostec.de> with cram_md5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 07 May 2010 12:17:46 +0200
Received: from stefan by excalibur with local (Exim 4.71)
	(envelope-from <stefan@excalibur.local>) id 1OAKci-0002Bz-8O
	for openembedded-devel@lists.openembedded.org;
	Fri, 07 May 2010 12:17:36 +0200
Date: Fri, 7 May 2010 12:17:36 +0200
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100507101736.GC18308@excalibur.local>
References: <alpine.DEB.1.10.1005011614380.15503@vitus.devnet.local>
	<1272723767-16871-1-git-send-email-vjensen@gmx.de>
MIME-Version: 1.0
In-Reply-To: <1272723767-16871-1-git-send-email-vjensen@gmx.de>
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
Subject: Re: [PATCH v2] libsocketcan: new recipe
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
X-List-Received-Date: Fri, 07 May 2010 10:21:35 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello.

I was going to apply them, but I found some stuff I would like to get sorted out
first. See below.

On Sat, 2010-05-01 at 16:22, Vitus Jensen wrote:
> Builds pengutronix' libsocketcan (using the new netlink interface to access
> CAN drivers)
> 
> Signed-off-by: Vitus Jensen <vjensen@gmx.de>
> --- /dev/null
> +++ b/recipes/socketcan/libsocketcan_0.0.7.bb
> @@ -0,0 +1,17 @@
> +DESCRIPTION = "control basic functions in socketcan from userspace"

Nitpick. Staring with a upper letter would be nice.

> +AUTHOR = "Luotao Fu"
> +HOMEPAGE = "http://www.pengutronix.de"
> +SECTION = "libs/network"
> +PRIORITY = "optional"
> +LICENSE = "LGPL"
> +
> +TAG = "v${PV}"
> +PR = "r0"
> +
> +SRC_URI = "git://git.pengutronix.de/git/tools/libsocketcan.git;protocol=git;tag=${TAG} \

Does Pengutronix not have release tarballs for this? In a recipe without _git.bb
postfix I did not expect to find git SRC_URIs.

> +	file://0001-remove-headers-supplied-by-linux-libc-headers.patch;patch=1 \
> +	"
> +
> +S = "${WORKDIR}/git"
> +
> +inherit autotools pkgconfig

regards
Stefan Schmidt


