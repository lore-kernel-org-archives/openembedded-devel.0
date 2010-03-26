Received: from sirius.lasnet.de ([78.47.116.19])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <stefan@datenfreihafen.org>) id 1NvH7o-000078-0T
	for openembedded-devel@lists.openembedded.org;
	Fri, 26 Mar 2010 22:31:29 +0100
Received: from p5b036e7d.dip.t-dialin.net ([91.3.110.125] helo=excalibur)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS-1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.63 #1)
	id 1NvH4i-0000fz-1j by authid <stefan@sostec.de> with cram_md5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Mar 2010 22:28:18 +0100
Received: from stefan by excalibur with local (Exim 4.71)
	(envelope-from <stefan@excalibur.local>) id 1NvH4g-0004mA-SR
	for openembedded-devel@lists.openembedded.org;
	Fri, 26 Mar 2010 22:28:14 +0100
Date: Fri, 26 Mar 2010 22:28:14 +0100
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100326212814.GB18337@excalibur.local>
References: <58E23116-2D95-4C1C-8C17-EDA168C129F9@mac.com>
	<200906040644.46800.zecke@selfish.org>
	<FAAA64B6-CC5D-42C3-ADC0-96174388CAA4@mac.com>
MIME-Version: 1.0
In-Reply-To: <FAAA64B6-CC5D-42C3-ADC0-96174388CAA4@mac.com>
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
Subject: Re: [PATCH] Added recipe for Ralink rt2570-k2wrlz-1.6.4 WiFi USB driver
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
X-List-Received-Date: Fri, 26 Mar 2010 21:31:29 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello.

On Mon, 2009-06-08 at 21:15, Elvis Dowson wrote:
>
> From b4346275d30e29779decbc65e060510719c30652 Mon Sep 17 00:00:00 2001
> From: Elvis Dowson <elvis,dowson@gmail.com>
> Date: Mon, 8 Jun 2009 21:10:30 +0400
> Subject: [PATCH] Added recipe for Ralink rt2570-k2wrlz-1.6.4 WiFi
> USB driver

Someone tagged this patch as "under review" in patchwork. Is this still ongoing?
;)

Anyone with an interest in this area have some comments on this? Before we could
apply it we need a new version though as this one is line-wrapped. Better use
git send-email directly.

> ---
>  conf/checksums.ini                    |    4 ++++
>  recipes/rt2x00/rt2570-k2wrlz_1.6.4.bb |   27
> +++++++++++++++++++++++++++
>  2 files changed, 31 insertions(+), 0 deletions(-)
>  create mode 100644 recipes/rt2x00/rt2570-k2wrlz_1.6.4.bb
> 
> diff --git a/conf/checksums.ini b/conf/checksums.ini
> index 9a47979..eac5093 100644
> --- a/conf/checksums.ini
> +++ b/conf/checksums.ini
> @@ -21022,6 +21022,10 @@ sha256=31248ac19b7935638c373aeced6187262a440d195dabfef6128845b4b16bee6c
>  md5=87947cf1868ac37d4d756f3585dbf1e6
> sha256=11d2c4a1b69a4b2b49811128a41c33f25c71e590b019ace392761598ca3d419f
> 
> +[http://homepages.tu-darmstadt.de/~p_larbig/wlan/rt2570-k2wrlz-1.6.4.tar.bz2
> ]

Line wrap.

> +md5=21f6e873ad7ee34843dbcd1204f9eda3
> +sha256=5b2d382504d0aee14cf24f0eb3c483a79c712f8aa1ca027a7d4425891f1bb2ec
> +
>  [http://folks.o-hand.com/sameo/rt2860/rt2860-1.7.0.0.tar.bz2]
>  md5=9ba1b8fdc9726931d5820226d48b9a33
> sha256=1d8fb8980025a0126520bb8f92dd0a5ce59c72e10889323212d3b4fd5496390a
> diff --git a/recipes/rt2x00/rt2570-k2wrlz_1.6.4.bb b/recipes/rt2x00/
> rt2570-k2wrlz_1.6.4.bb
> new file mode 100644
> index 0000000..98fe660
> --- /dev/null
> +++ b/recipes/rt2x00/rt2570-k2wrlz_1.6.4.bb
> @@ -0,0 +1,27 @@
> +DESCRIPTION = "Enhanced Driver for Ralink rt2570 USB 802.11g WiFi
> sticks"

And here.

> +HOMEPAGE = "http://homepages.tu-darmstadt.de/~p_larbig/wlan"
> +SECTION = "kernel/modules"
> +LICENSE = "GPL"
> +
> +PR = "r1"
> +
> +SRC_URI = "http://homepages.tu-darmstadt.de/~p_larbig/wlan/${PN}-$
> {PV}.tar.bz2"

And here...

regards
Stefan Schmidt


