Received: from sirius.lasnet.de ([78.47.116.19])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <stefan@datenfreihafen.org>) id 1QKwme-0003mb-Re
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 May 2011 20:08:16 +0200
Received: from p4fc7654c.dip.t-dialin.net ([79.199.101.76]
	helo=excalibur.local) by sirius.lasnet.de with esmtpsa 
	(Cipher TLS1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.69 #1)
	id 1QKwjh-0003ni-TI by authid <stefan@sostec.de> with srv_auth_cram_md5;
	Fri, 13 May 2011 20:05:28 +0200
Received: from stefan by excalibur.local with local (Exim 4.76)
	(envelope-from <stefan@excalibur.local>)
	id 1QKwjf-0002Bk-RS; Fri, 13 May 2011 20:05:11 +0200
Date: Fri, 13 May 2011 20:05:11 +0200
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
Message-ID: <20110513180511.GC29302@excalibur.local>
References: <1305290080.2448.3.camel@gnutoo-laptop>
	<1305290588-7057-1-git-send-email-GNUtoo@no-log.org>
MIME-Version: 1.0
In-Reply-To: <1305290588-7057-1-git-send-email-GNUtoo@no-log.org>
X-Mailer: Mutt http://www.mutt.org/
X-KeyID: 0xDDF51665
X-Website: http://www.datenfreihafen.org/
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on sirius.lasnet.de
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=ALL_TRUSTED,AWL,BAYES_00
	autolearn=ham version=3.2.5
Cc: openembedded-devel@lists.openembedded.org,
	Stefan Schmidt <stefan@buglabs.net>
Subject: Re: [PATCH 01/12] pointercal-xinput: add support for bug20
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
X-List-Received-Date: Fri, 13 May 2011 18:08:16 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello.


On Fri, 2011-05-13 at 14:42, Denis 'GNUtoo' Carikli wrote:
> Signed-off-by: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>

Acked-by: Stefan Schmidt <stefan@buglabs.net>

> ---
>  .../pointercal-xinput/bug20/pointercal.xinput      |    1 +
>  recipes/xinput-calibrator/pointercal-xinput_0.0.bb |    2 +-
>  2 files changed, 2 insertions(+), 1 deletions(-)
>  create mode 100644 recipes/xinput-calibrator/pointercal-xinput/bug20/pointercal.xinput
> 
> diff --git a/recipes/xinput-calibrator/pointercal-xinput/bug20/pointercal.xinput b/recipes/xinput-calibrator/pointercal-xinput/bug20/pointercal.xinput
> new file mode 100644
> index 0000000..50e2632
> --- /dev/null
> +++ b/recipes/xinput-calibrator/pointercal-xinput/bug20/pointercal.xinput
> @@ -0,0 +1 @@
> +xinput set-int-prop "TSC2004 Touchscreen" "Evdev Axis Calibration" 32 239 10 232 6;
> diff --git a/recipes/xinput-calibrator/pointercal-xinput_0.0.bb b/recipes/xinput-calibrator/pointercal-xinput_0.0.bb
> index 2d62f20..fa298b3 100644
> --- a/recipes/xinput-calibrator/pointercal-xinput_0.0.bb
> +++ b/recipes/xinput-calibrator/pointercal-xinput_0.0.bb
> @@ -2,7 +2,7 @@ DESCRIPTION = "Touchscreen calibration data from xinput-calibrator"
>  LICENSE = "MIT/X11"
>  SECTION = "base"
>  
> -PR = "r2"
> +PR = "r3"
>  SRC_URI = "file://pointercal.xinput"
>  S = "${WORKDIR}"
>  
> -- 
> 1.7.0.4
> 


