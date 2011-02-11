Received: from sirius.lasnet.de ([78.47.116.19])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <stefan@datenfreihafen.org>) id 1PnuCF-000145-6m
	for openembedded-devel@lists.openembedded.org;
	Fri, 11 Feb 2011 15:42:07 +0100
Received: from p5b035f5a.dip.t-dialin.net ([91.3.95.90] helo=excalibur.local)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.69 #1)
	id 1PnuBB-0006hs-Eh by authid <stefan@sostec.de> with cram_md5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Feb 2011 15:41:03 +0100
Received: from stefan by excalibur.local with local (Exim 4.72)
	(envelope-from <stefan@excalibur.local>) id 1PnuBA-0004mB-Qo
	for openembedded-devel@lists.openembedded.org;
	Fri, 11 Feb 2011 15:41:00 +0100
Date: Fri, 11 Feb 2011 15:41:00 +0100
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110211144100.GK9652@excalibur.local>
References: <1297429080-3986-1-git-send-email-obi@opendreambox.org>
	<1297429080-3986-5-git-send-email-obi@opendreambox.org>
MIME-Version: 1.0
In-Reply-To: <1297429080-3986-5-git-send-email-obi@opendreambox.org>
X-Mailer: Mutt http://www.mutt.org/
X-KeyID: 0xDDF51665
X-Website: http://www.datenfreihafen.org/
User-Agent: Mutt/1.5.20 (2009-06-14)
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on sirius.lasnet.de
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=5.0 tests=ALL_TRUSTED,AWL,BAYES_00
	autolearn=ham version=3.2.5
Subject: Re: [PATCH 5/5] wpa-supplicant-0.7.3: depend on openssl
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
X-List-Received-Date: Fri, 11 Feb 2011 14:42:07 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello.

On Fri, 2011-02-11 at 12:58, Andreas Oberritter wrote:
> * let defconfig decide which crypto library to use
> 
> Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
> ---
>  recipes/wpa-supplicant/wpa-supplicant-0.7.inc |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/recipes/wpa-supplicant/wpa-supplicant-0.7.inc b/recipes/wpa-supplicant/wpa-supplicant-0.7.inc
> index f64eb79..e01d1ef 100644
> --- a/recipes/wpa-supplicant/wpa-supplicant-0.7.inc
> +++ b/recipes/wpa-supplicant/wpa-supplicant-0.7.inc
> @@ -6,7 +6,7 @@ LICENSE = "GPLv2 | BSD"
>  LIC_FILES_CHKSUM = "file://../COPYING;md5=c54ce9345727175ff66d17b67ff51f58 \
>                      file://../README;md5=54cfc88015d3ce83f7156e63c6bb1738 \
>                      file://wpa_supplicant.c;beginline=1;endline=17;md5=acdc5a4b0d6345f21f136eace747260e"
> -DEPENDS = "gnutls dbus libnl2 ${@base_contains("COMBINED_FEATURES", "madwifi", "madwifi-ng", "",d)}"
> +DEPENDS = "gnutls dbus libnl2 openssl ${@base_contains("COMBINED_FEATURES", "madwifi", "madwifi-ng", "",d)}"
>  RRECOMMENDS_${PN} = "wpa-supplicant-passphrase wpa-supplicant-cli"

Hmm, that one I don't really like. We now build gnutls _and_ openssl even if we
only need one of it. As the config may be overriden for distros/machines I have
no good idea how to check for it during dependency calculation though. Anyone
else an idea?

regards
Stefan Schmidt


