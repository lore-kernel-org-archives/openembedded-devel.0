Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1O6lyG-00016u-QE for openembedded-devel@lists.openembedded.org;
	Tue, 27 Apr 2010 16:41:09 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1O6luZ-0001b6-1L for openembedded-devel@lists.openembedded.org;
	Tue, 27 Apr 2010 16:37:19 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Apr 2010 16:37:19 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Apr 2010 16:37:19 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
connect(): No such file or directory
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 27 Apr 2010 16:37:06 +0200
Message-ID: <hr6sqi$avd$1@dough.gmane.org>
References: <openembedded-devel@lists.openembedded.org>	<1272378556-21914-1-git-send-email-aalonso00@gmail.com>	<1272378556-21914-2-git-send-email-aalonso00@gmail.com>	<1272378556-21914-3-git-send-email-aalonso00@gmail.com>	<1272378556-21914-4-git-send-email-aalonso00@gmail.com>
	<1272378556-21914-5-git-send-email-aalonso00@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.9) Gecko/20100412 Shredder/3.0.5pre
In-Reply-To: <1272378556-21914-5-git-send-email-aalonso00@gmail.com>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 5/5] xorg.conf: new file
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
X-List-Received-Date: Tue, 27 Apr 2010 14:41:09 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

You forgot to bump PR

On 27-04-10 16:29, Adrian Alonso wrote:
> * xorg config file for xilinx ml507 platform
> 
> Signed-off-by: Adrian Alonso <aalonso00@gmail.com>
> ---
>  .../xserver-xorg-conf/xilinx-ml507/xorg.conf       |   39 ++++++++++++++++++++
>  1 files changed, 39 insertions(+), 0 deletions(-)
>  create mode 100644 recipes/xorg-xserver/xserver-xorg-conf/xilinx-ml507/xorg.conf
> 
> diff --git a/recipes/xorg-xserver/xserver-xorg-conf/xilinx-ml507/xorg.conf b/recipes/xorg-xserver/xserver-xorg-conf/xilinx-ml507/xorg.conf
> new file mode 100644
> index 0000000..aca5eed
> --- /dev/null
> +++ b/recipes/xorg-xserver/xserver-xorg-conf/xilinx-ml507/xorg.conf
> @@ -0,0 +1,39 @@
> +Section "Monitor"
> +	Identifier "LCD Panel"
> +EndSection
> +
> +Section "Device"
> +    Identifier  "Xilinx frame buffer"
> +    Driver      "fbdev"
> +EndSection
> +
> +Section "Screen"
> +    Identifier  "Default Screen"
> +    Device      "Xilinx frame buffer"
> +    Monitor     "LCD Panel"
> +	SubSection "Display"
> +		Depth   24
> +        Modes   "640x480"
> +	EndSubSection
> +EndSection
> +
> +Section "InputDevice"
> +    Identifier  "Keyboard"
> +    Driver      "kbd"
> +#    Option      "XkbLayout" "es"
> +#    Option      "XkbModel"  "pc105"
> +EndSection
> +
> +Section "InputDevice"
> +    Identifier  "Mouse"
> +    Driver      "mouse"
> +    Option      "protocol" "auto"
> +    Option      "device" "/dev/input/mice"
> +EndSection
> +
> +Section "ServerLayout"
> +    Identifier  "Default Layout"
> +    Screen      "Default Screen"
> +    InputDevice "Keyboard"
> +    InputDevice "Mouse"
> +EndSection

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFL1vaSMkyGM64RGpERAuQbAKC3g5s4J24uJArBtpoDsdOQ8wrP+QCfYRD3
b/DSHTFPDR6Z81V1UP8WHoc=
=enXg
-----END PGP SIGNATURE-----



