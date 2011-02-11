Received: from sirius.lasnet.de ([78.47.116.19])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <stefan@datenfreihafen.org>) id 1Pnu9u-0000ob-JW
	for openembedded-devel@lists.openembedded.org;
	Fri, 11 Feb 2011 15:39:43 +0100
Received: from p5b035f5a.dip.t-dialin.net ([91.3.95.90] helo=excalibur.local)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.69 #1)
	id 1Pnu8e-0006dj-2F by authid <stefan@sostec.de> with cram_md5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Feb 2011 15:38:26 +0100
Received: from stefan by excalibur.local with local (Exim 4.72)
	(envelope-from <stefan@excalibur.local>) id 1Pnu8d-0004kd-Ll
	for openembedded-devel@lists.openembedded.org;
	Fri, 11 Feb 2011 15:38:23 +0100
Date: Fri, 11 Feb 2011 15:38:23 +0100
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110211143823.GJ9652@excalibur.local>
References: <1297429080-3986-1-git-send-email-obi@opendreambox.org>
	<1297429080-3986-4-git-send-email-obi@opendreambox.org>
MIME-Version: 1.0
In-Reply-To: <1297429080-3986-4-git-send-email-obi@opendreambox.org>
X-Mailer: Mutt http://www.mutt.org/
X-KeyID: 0xDDF51665
X-Website: http://www.datenfreihafen.org/
User-Agent: Mutt/1.5.20 (2009-06-14)
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on sirius.lasnet.de
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=5.0 tests=ALL_TRUSTED,AWL,BAYES_00
	autolearn=ham version=3.2.5
Subject: Re: [PATCH 4/5] wpa-supplicant-0.7.3: enable madwifi support
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
X-List-Received-Date: Fri, 11 Feb 2011 14:39:43 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello.

On Fri, 2011-02-11 at 12:57, Andreas Oberritter wrote:
> Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
> ---
>  recipes/wpa-supplicant/wpa-supplicant-0.7.inc |    6 +++++-
>  1 files changed, 5 insertions(+), 1 deletions(-)
> 
> diff --git a/recipes/wpa-supplicant/wpa-supplicant-0.7.inc b/recipes/wpa-supplicant/wpa-supplicant-0.7.inc
> index ca7751c..f64eb79 100644
> --- a/recipes/wpa-supplicant/wpa-supplicant-0.7.inc
> +++ b/recipes/wpa-supplicant/wpa-supplicant-0.7.inc
> @@ -6,7 +6,7 @@ LICENSE = "GPLv2 | BSD"
>  LIC_FILES_CHKSUM = "file://../COPYING;md5=c54ce9345727175ff66d17b67ff51f58 \
>                      file://../README;md5=54cfc88015d3ce83f7156e63c6bb1738 \
>                      file://wpa_supplicant.c;beginline=1;endline=17;md5=acdc5a4b0d6345f21f136eace747260e"
> -DEPENDS = "gnutls dbus libnl2"
> +DEPENDS = "gnutls dbus libnl2 ${@base_contains("COMBINED_FEATURES", "madwifi", "madwifi-ng", "",d)}"
>  RRECOMMENDS_${PN} = "wpa-supplicant-passphrase wpa-supplicant-cli"
>  
>  SRC_URI = "http://hostap.epitest.fi/releases/wpa_supplicant-${PV}.tar.gz \
> @@ -31,6 +31,10 @@ FILES_${PN} += " /usr/share/dbus-1/system-services/*"
>  
>  do_configure () {
>  	install -m 0755 ${WORKDIR}/defconfig .config
> +	if [ "${@base_contains('COMBINED_FEATURES', 'madwifi', 1, 0, d)}" = "1" ]; then
> +		echo "CONFIG_DRIVER_MADWIFI=y" >> .config
> +		echo "CFLAGS += -I${STAGING_INCDIR}/madwifi-ng" >> .config
> +	fi
>  }

Acked-by: Stefan Schmidt <stefan@datenfreihafen.org>

regards
Stefan Schmidt


