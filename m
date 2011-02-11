Received: from sirius.lasnet.de ([78.47.116.19])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <stefan@datenfreihafen.org>) id 1Pnu8c-0000jj-57
	for openembedded-devel@lists.openembedded.org;
	Fri, 11 Feb 2011 15:38:24 +0100
Received: from p5b035f5a.dip.t-dialin.net ([91.3.95.90] helo=excalibur.local)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.69 #1)
	id 1Pnu7X-0006co-E1 by authid <stefan@sostec.de> with cram_md5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Feb 2011 15:37:18 +0100
Received: from stefan by excalibur.local with local (Exim 4.72)
	(envelope-from <stefan@excalibur.local>) id 1Pnu7X-0004kY-1D
	for openembedded-devel@lists.openembedded.org;
	Fri, 11 Feb 2011 15:37:15 +0100
Date: Fri, 11 Feb 2011 15:37:15 +0100
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110211143714.GI9652@excalibur.local>
References: <1297429080-3986-1-git-send-email-obi@opendreambox.org>
	<1297429080-3986-3-git-send-email-obi@opendreambox.org>
MIME-Version: 1.0
In-Reply-To: <1297429080-3986-3-git-send-email-obi@opendreambox.org>
X-Mailer: Mutt http://www.mutt.org/
X-KeyID: 0xDDF51665
X-Website: http://www.datenfreihafen.org/
User-Agent: Mutt/1.5.20 (2009-06-14)
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on sirius.lasnet.de
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=5.0 tests=ALL_TRUSTED,AWL,BAYES_00
	autolearn=ham version=3.2.5
Subject: Re: [PATCH 3/5] wpa-supplicant-0.7.3: install only required files for dbus support
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
X-List-Received-Date: Fri, 11 Feb 2011 14:38:36 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello.

On Fri, 2011-02-11 at 12:57, Andreas Oberritter wrote:
> Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
> ---
>  recipes/wpa-supplicant/wpa-supplicant-0.7.inc |   18 +++++++++++++-----
>  1 files changed, 13 insertions(+), 5 deletions(-)
> 
> diff --git a/recipes/wpa-supplicant/wpa-supplicant-0.7.inc b/recipes/wpa-supplicant/wpa-supplicant-0.7.inc
> index b56d37c..ca7751c 100644
> --- a/recipes/wpa-supplicant/wpa-supplicant-0.7.inc
> +++ b/recipes/wpa-supplicant/wpa-supplicant-0.7.inc
> @@ -58,11 +58,19 @@ do_install () {
>  	cd ${D}${sysconfdir}/network/ && \
>  	ln -sf ../if-pre-up.d/wpa-supplicant if-post-down.d/wpa-supplicant
>  
> -	install -d ${D}/${sysconfdir}/dbus-1/system.d
> -	install -m 644 ${S}/dbus/dbus-wpa_supplicant.conf ${D}/${sysconfdir}/dbus-1/system.d
> -	install -d ${D}/${datadir}/dbus-1/system-services
> -	sed -i -e s:${base_sbindir}:${sbindir}:g ${S}/dbus/*.service
> -	install -m 644 ${S}/dbus/*.service ${D}/${datadir}/dbus-1/system-services
> +	if grep -q ^CONFIG_CTRL_IFACE_DBUS=y .config || grep -q ^CONFIG_CTRL_IFACE_DBUS_NEW=y .config; then
> +		install -d ${D}/${sysconfdir}/dbus-1/system.d
> +		install -m 644 ${S}/dbus/dbus-wpa_supplicant.conf ${D}/${sysconfdir}/dbus-1/system.d
> +		install -d ${D}/${datadir}/dbus-1/system-services
> +		if grep -q ^CONFIG_CTRL_IFACE_DBUS=y .config; then
> +			sed -i -e s:/sbin:${sbindir}:g ${S}/dbus/fi.epitest.hostap.WPASupplicant.service
> +			install -m 644 ${S}/dbus/fi.epitest.hostap.WPASupplicant.service ${D}/${datadir}/dbus-1/system-services
> +		fi
> +		if grep -q ^CONFIG_CTRL_IFACE_DBUS_NEW=y .config; then
> +			sed -i -e s:/sbin:${sbindir}:g ${S}/dbus/fi.w1.wpa_supplicant1.service
> +			install -m 644 ${S}/dbus/fi.w1.wpa_supplicant1.service ${D}/${datadir}/dbus-1/system-services
> +		fi
> +	fi
>  
>  	install -d ${D}/etc/default/volatiles
>  	install -m 0644 ${WORKDIR}/99_wpa_supplicant ${D}/etc/default/volatiles

I like it. Even checking for different dbus config options before installing the
service files. Good work.

Acked-by: Stefan Schmidt <stefan@datenfreihafen.org>

regards
Stefan Schmidt


