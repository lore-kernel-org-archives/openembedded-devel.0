Received: from sirius.lasnet.de ([78.47.116.19])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <stefan@datenfreihafen.org>) id 1OAKV0-0000Tw-Vv
	for openembedded-devel@lists.openembedded.org;
	Fri, 07 May 2010 12:09:39 +0200
Received: from w0968.wlan.rz.tu-bs.de ([134.169.203.206] helo=excalibur)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS-1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.63 #1)
	id 1OAKRJ-0003it-5J by authid <stefan@sostec.de> with cram_md5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 07 May 2010 12:05:52 +0200
Received: from stefan by excalibur with local (Exim 4.71)
	(envelope-from <stefan@excalibur.local>) id 1OAKRF-00025t-Kw
	for openembedded-devel@lists.openembedded.org;
	Fri, 07 May 2010 12:05:45 +0200
Date: Fri, 7 May 2010 12:05:45 +0200
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100507100545.GB18308@excalibur.local>
References: <1273182940.4942.10.camel@T61>
MIME-Version: 1.0
In-Reply-To: <1273182940.4942.10.camel@T61>
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
Subject: Re: [PATCH] bug20/xorg.conf: update to use tslib driver for touchscreen input device.
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
X-List-Received-Date: Fri, 07 May 2010 10:09:39 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello.

On Thu, 2010-05-06 at 17:55, Ken Gilmer wrote:
> diff --git a/recipes/xorg-xserver/xserver-xorg-conf/bug20/xorg.conf b/recipes/xorg-xserver/xserver-xorg-conf/bug20/xorg.conf
> index 0b976fe..746874f 100644
> --- a/recipes/xorg-xserver/xserver-xorg-conf/bug20/xorg.conf
> +++ b/recipes/xorg-xserver/xserver-xorg-conf/bug20/xorg.conf
> @@ -26,4 +26,12 @@ EndSection
>  Section "ServerLayout"                                 
>          Identifier      "Builtin Default Layout"                                     
>          Screen  "Builtin Default fbdev Screen 0"        
> +		InputDevice "bmi-lcd-ts" "CorePointer"
>  EndSection                                              
> +
> +Section "InputDevice" 
> +		Identifier "bmi-lcd-ts" 
> +		Driver "tslib"
> +		Option "SwapAxes" "1" 
> +    	Option "Device" "/dev/input/touchscreen0" 
> +EndSection                                       

The addition is only to make X aware of the swaped axes, right? Looks fine to me
given that you have tested it.

I would need a git format-patch style patch to apply and push it here though ad
evolution seem to have mangled your patch patch and it did not appear in
patchwork yet.

regards
Stefan Schmidt


