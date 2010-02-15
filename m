Received: from sirius.lasnet.de ([78.47.116.19])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <stefan@datenfreihafen.org>) id 1Nh844-0002uP-Cu
	for openembedded-devel@lists.openembedded.org;
	Mon, 15 Feb 2010 22:01:11 +0100
Received: from p5b034cb8.dip.t-dialin.net ([91.3.76.184] helo=excalibur)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS-1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.63 #1)
	id 1Nh81P-00017g-06 by authid <stefan@sostec.de> with cram_md5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Feb 2010 21:58:32 +0100
Received: from stefan by excalibur with local (Exim 4.71)
	(envelope-from <stefan@excalibur.local>) id 1Nh81O-0002nX-57
	for openembedded-devel@lists.openembedded.org;
	Mon, 15 Feb 2010 21:58:22 +0100
Date: Mon, 15 Feb 2010 21:58:22 +0100
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100215205822.GB4637@excalibur.local>
References: <200910291536.26049.pieterg@gmx.com>
MIME-Version: 1.0
In-Reply-To: <200910291536.26049.pieterg@gmx.com>
X-Mailer: Mutt http://www.mutt.org/
X-KeyID: 0xDDF51665
X-Website: http://www.datenfreihafen.org/
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 78.47.116.19
X-SA-Exim-Mail-From: stefan@datenfreihafen.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] netkit-base: fix building with gcc4
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
X-List-Received-Date: Mon, 15 Feb 2010 21:01:13 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello.

Sorry for the late reply. I was going to test and apply your patch, but it is
line wrapped and I failed fixing it up by hand.

On Thu, 2009-10-29 at 15:36, pieterg wrote:
> ---
> 
> I guess nobody has been using netkit-base for a while, it needs the 
> following patch to allow it to be built with gcc 4.x.x.
> 
>  recipes/netkit-base/netkit-base-0.17/gcc4.patch |   12 ++++++++++++
>  recipes/netkit-base/netkit-base_0.17.bb         |    3 ++-
>  2 files changed, 14 insertions(+), 1 deletions(-)
>  create mode 100644 recipes/netkit-base/netkit-base-0.17/gcc4.patch
> 
> diff --git a/recipes/netkit-base/netkit-base-0.17/gcc4.patch 
> b/recipes/netkit-base/netkit-base-0.17/gcc4.patch
> new file mode 100644
> index 0000000..0a332a8
> --- /dev/null
> +++ b/recipes/netkit-base/netkit-base-0.17/gcc4.patch
> @@ -0,0 +1,12 @@
> +diff -dur netkit-base-0.17-p/inetd/servtab.c 
> netkit-base-0.17/inetd/servtab.c

Here

> +--- netkit-base-0.17-p/inetd/servtab.c	2000-07-22 22:20:50.000000000 +0200
> ++++ netkit-base-0.17/inetd/servtab.c	2005-10-19 04:04:33.000000000 +0200
> +@@ -771,7 +771,7 @@
> + 			return;
> + 		}
> + 		
> +-#define SWAP(type, a, b) {type c=(type)a; (type)a=(type)b; 
> (type)b=(type)c;}

Here, and more to come.

regards
Stefan Schmidt


