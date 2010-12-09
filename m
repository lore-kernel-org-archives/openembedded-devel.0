Received: from sirius.lasnet.de ([78.47.116.19])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <stefan@datenfreihafen.org>) id 1PQhbo-0000kM-9a
	for openembedded-devel@lists.openembedded.org;
	Thu, 09 Dec 2010 15:36:36 +0100
Received: from [2001:638:602:1183:21f:16ff:fe0d:7d41] (helo=excalibur.local)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS-1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.63 #1)
	id 1PQhaK-0004gl-2q by authid <stefan@sostec.de> with cram_md5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 09 Dec 2010 15:35:07 +0100
Received: from stefan by excalibur.local with local (Exim 4.72)
	(envelope-from <stefan@excalibur.local>) id 1PQhaH-00084p-Nv
	for openembedded-devel@lists.openembedded.org;
	Thu, 09 Dec 2010 15:35:01 +0100
Date: Thu, 9 Dec 2010 15:35:01 +0100
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101209143500.GD29826@excalibur.local>
References: <1291732373-17953-1-git-send-email-GNUtoo@no-log.org>
	<1291732373-17953-4-git-send-email-GNUtoo@no-log.org>
MIME-Version: 1.0
In-Reply-To: <1291732373-17953-4-git-send-email-GNUtoo@no-log.org>
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
Subject: Re: [PATCH 3/4] xserver-xorg-conf: add iphone3g support
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
X-List-Received-Date: Thu, 09 Dec 2010 14:36:36 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello.

On Tue, 2010-12-07 at 15:32, Denis 'GNUtoo' Carikli wrote:
> Signed-off-by: Chris 'Lopi' Spehn <chris.spehn@gmail.com>
> Signed-off-by: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
> ---
>  .../xserver-xorg-conf/iphone3g/xorg.conf           |   31 ++++++++++++++++++++
>  recipes/xorg-xserver/xserver-xorg-conf_0.1.bb      |    2 +-
>  2 files changed, 32 insertions(+), 1 deletions(-)
>  create mode 100644 recipes/xorg-xserver/xserver-xorg-conf/iphone3g/xorg.conf
> 
> diff --git a/recipes/xorg-xserver/xserver-xorg-conf/iphone3g/xorg.conf b/recipes/xorg-xserver/xserver-xorg-conf/iphone3g/xorg.conf
> new file mode 100644
> index 0000000..19f02e9
> --- /dev/null
> +++ b/recipes/xorg-xserver/xserver-xorg-conf/iphone3g/xorg.conf
> @@ -0,0 +1,31 @@
> +Section "Device"
> +	Identifier "Builtin Default fbdev Device 0"
> +	Driver  "fbdev"
> +	Option "ShadowFB" "on"
> +	#Option "Rotate" "CW" # comment for disabling rotation
> +EndSection
> +
> +Section "Screen"
> +	Identifier "Builtin Default fbdev Screen 0"
> +	Device "Builtin Default fbdev Device 0"
> +EndSection
> +
> +
> +Section "InputDevice"
> +	Identifier "touchscreen"
> +	Driver "evdev"
> +	Option "Device" "/dev/input/event2"

Are you sure that it always is event2? The nodes are assigned dynamically
normally and we have /dev/touchscreen to work around this

> +	Option "Calibration" "0 4602 0 7306"

Why here? We happen to use the pointercal file for this.

regards
Stefan Schmidt


