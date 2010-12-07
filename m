Received: from sirius.lasnet.de ([78.47.116.19])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <stefan@datenfreihafen.org>) id 1PPvse-0005dn-0g
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Dec 2010 12:38:51 +0100
Received: from [2001:638:602:1183:21f:16ff:fe0d:7d41] (helo=excalibur.local)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS-1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.63 #1)
	id 1PPvrD-0008Ry-4W by authid <stefan@sostec.de> with cram_md5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Dec 2010 12:37:21 +0100
Received: from stefan by excalibur.local with local (Exim 4.72)
	(envelope-from <stefan@excalibur.local>) id 1PPvrA-0000c5-73
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Dec 2010 12:37:16 +0100
Date: Tue, 7 Dec 2010 12:37:15 +0100
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101207113715.GF20482@excalibur.local>
References: <4cf495a2.6720ec0a.7679.21c9@mx.google.com>
MIME-Version: 1.0
In-Reply-To: <4cf495a2.6720ec0a.7679.21c9@mx.google.com>
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
Subject: Re: [PATCHv3 4/5] am3517-crane: Add am3517-crane machine type
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
X-List-Received-Date: Tue, 07 Dec 2010 11:38:51 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello.

On Tue, 2010-11-30 at 11:41, Anil Kumar wrote:
> diff --git a/conf/machine/am3517-crane.conf b/conf/machine/am3517-crane.conf
> new file mode 100644
> index 0000000..dad4625
> --- /dev/null
> +++ b/conf/machine/am3517-crane.conf
> @@ -0,0 +1,52 @@
> +#@TYPE: Machine
> +#@NAME: craneboard machine
> +#@DESCRIPTION: Machine configuration for the AM3517 Crane board
> +TARGET_ARCH = "arm"
> +PREFERRED_PROVIDER_virtual/xserver = "xserver-xorg"
> +XSERVER = "xserver-xorg \
> +           xf86-input-evdev \
> +           xf86-input-mouse \
> +           xf86-video-omapfb \
> +           xf86-input-keyboard"
> +
> +# Only has DVI connector for external screen
> +GUI_MACHINE_CLASS = "bigscreen"
> +
> +require conf/machine/include/omap3.inc
> +
> +# Ship all kernel modules

Stray comment. Seems you forgot to remove it.

> +IMAGE_FSTYPES ?= "jffs2 tar.bz2"
> +EXTRA_IMAGECMD_jffs2 = "-lnp -e 0x20000 -s 2048"
> +EXTRA_IMAGEDEPENDS += " u-boot x-load"

These depends are already added from omap3.inc

regards
Stefan Schmidt


