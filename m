Received: from sirius.lasnet.de ([78.47.116.19])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <stefan@datenfreihafen.org>) id 1NznG2-00027T-UC
	for openembedded-devel@lists.openembedded.org;
	Thu, 08 Apr 2010 10:38:39 +0200
Received: from w0952.wlan.rz.tu-bs.de ([134.169.203.190] helo=excalibur)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS-1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.63 #1)
	id 1NznCl-0005GU-Av by authid <stefan@sostec.de> with cram_md5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 08 Apr 2010 10:35:18 +0200
Received: from stefan by excalibur with local (Exim 4.71)
	(envelope-from <stefan@excalibur.local>) id 1NznCk-0005Ro-Pa
	for openembedded-devel@lists.openembedded.org;
	Thu, 08 Apr 2010 10:35:14 +0200
Date: Thu, 8 Apr 2010 10:35:14 +0200
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100408083514.GA27376@excalibur.local>
References: <alpine.DEB.1.10.1004081018050.3264@vitus.devnet.local>
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.1.10.1004081018050.3264@vitus.devnet.local>
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
Subject: Re: [PATCH] dfu-programmer: USB Device Firmware Upgrade utility (special atmel-version)
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
X-List-Received-Date: Thu, 08 Apr 2010 08:38:40 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello.

On Thu, 2010-04-08 at 10:19, Vitus Jensen wrote:
> 
> Add recipes for version 0.5.2 and for the head of the SVN repository.
> 
> Signed-off-by: Vitus Jensen <vjensen@gmx.de>
> ---
>  conf/checksums.ini                             |    4 ++++
>  recipes/dfu-programmer/dfu-programmer_0.5.2.bb |   17 +++++++++++++++++
>  recipes/dfu-programmer/dfu-programmer_svn.bb   |   20 ++++++++++++++++++++
>  3 files changed, 41 insertions(+), 0 deletions(-)
>  create mode 100644 recipes/dfu-programmer/dfu-programmer_0.5.2.bb
>  create mode 100644 recipes/dfu-programmer/dfu-programmer_svn.bb
> 
> diff --git a/conf/checksums.ini b/conf/checksums.ini
> index 3c6f712..73f5901 100644
> --- a/conf/checksums.ini
> +++ b/conf/checksums.ini
> @@ -5258,6 +5258,10 @@ sha256=3b15515693bae1ebd14d914e46d388edfec2175829ea1576a7a0c8606ebbe639
>  md5=be12c0132a1ae118cbf5e79d98427c1d
>  sha256=ec382c90af3ef2f49695ff14a4d6521e58ac482c4e29d6c9ebca8768f699c191
> 
> +[http://downloads.sourceforge.net/project/dfu-programmer/dfu-programmer/0.5.2/dfu-programmer-0.5.2.tar.gz]
> +md5=ce882d37383df698a1c530080724b191
> +sha256=e3c8bc1429fe1681c56ddc14fb05d29a7933aac566d13f894dca6fd916829cb9
> +

Please add the checksum to the recipe.

>  [http://pknet.com/~joe/dgen-sdl-1.23.tar.gz]
>  md5=b1896c1b21ddb152626aec2e8a157a3a
>  sha256=44396b3b324433187cf7082d1059cd9f519f02accddd667e627a57ff8514d436
> diff --git a/recipes/dfu-programmer/dfu-programmer_0.5.2.bb b/recipes/dfu-programmer/dfu-programmer_0.5.2.bb
> new file mode 100644
> index 0000000..af37b04
> --- /dev/null
> +++ b/recipes/dfu-programmer/dfu-programmer_0.5.2.bb
> @@ -0,0 +1,17 @@
> +DESCRIPTION = "USB Device Firmware Upgrade utility (special atmel-version)"
> +SECTION = "devel"
> +AUTHOR = "Weston Schmidt <weston_schmidt@alumni.purdue.edu>"
> +LICENSE = "GPL"
> +
> +PV = "0.5.2"
> +PR = "r0"
> +
> +DEPENDS = "libusb"
> +
> +SRC_URI = "http://downloads.sourceforge.net/project/dfu-programmer/dfu-programmer/0.5.2/dfu-programmer-${PV}.tar.gz"
> +
> +inherit autotools
> +
> +do_stage() {
> +	autotools_stage_all
> +}

For what is this needed?

> diff --git a/recipes/dfu-programmer/dfu-programmer_svn.bb b/recipes/dfu-programmer/dfu-programmer_svn.bb
> new file mode 100644
> index 0000000..5bb946b
> --- /dev/null
> +++ b/recipes/dfu-programmer/dfu-programmer_svn.bb
> @@ -0,0 +1,20 @@
> +DESCRIPTION = "USB Device Firmware Upgrade utility (special atmel-version)"
> +SECTION = "devel"
> +AUTHOR = "Weston Schmidt <weston_schmidt@alumni.purdue.edu>"
> +LICENSE = "GPL"
> +
> +SRCREV = "${AUTOREV}"

Please don't do this. Set a sane SRCREV that you know is working. People who
want to use AUTOREV can do this in their local.conf

regards
Stefan Schmidt


