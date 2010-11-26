Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PM22w-0001WU-Ui for openembedded-devel@lists.openembedded.org;
	Fri, 26 Nov 2010 18:25:20 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PM21h-0007do-2t for openembedded-devel@lists.openembedded.org;
	Fri, 26 Nov 2010 18:24:01 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Nov 2010 18:24:00 +0100
Received: from k.kooi by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Nov 2010 18:24:00 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Fri, 26 Nov 2010 18:23:49 +0100
Message-ID: <icoqf5$9n4$1@dough.gmane.org>
References: <1290790442-28006-1-git-send-email-matteo.facchinetti@sirius-es.it>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.15) Gecko/20101031 Shredder/3.0.11pre
In-Reply-To: <1290790442-28006-1-git-send-email-matteo.facchinetti@sirius-es.it>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] sysvinit_2.86.bb: add possibility to use USB Serial Console with only rx/tx.
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
X-List-Received-Date: Fri, 26 Nov 2010 17:25:20 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Where's the patch that adds this new var to the usermanual?

On 26-11-10 17:54, matteo.facchinetti@sirius-es.it wrote:
> From: Matteo Facchinetti <engineering@sirius-es.it>
> 
> There are many evaluationboard that use mini-usb port like as
> a serial port + power supply. Using it as serial console have
> to force getty with no need for carrier detect.
> 
> Signed-off-by: Matteo Facchinetti <engineering@sirius-es.it>
> ---
>  recipes/sysvinit/sysvinit_2.86.bb |    5 +++++
>  1 files changed, 5 insertions(+), 0 deletions(-)
> 
> diff --git a/recipes/sysvinit/sysvinit_2.86.bb b/recipes/sysvinit/sysvinit_2.86.bb
> index 6ab5290..c34cbc9 100644
> --- a/recipes/sysvinit/sysvinit_2.86.bb
> +++ b/recipes/sysvinit/sysvinit_2.86.bb
> @@ -65,6 +65,11 @@ do_install () {
>  	install -m 0644 ${WORKDIR}/inittab ${D}${sysconfdir}/inittab
>  	if [ ! -z "${SERIAL_CONSOLE}" ]; then
>  		echo "S:2345:respawn:${base_sbindir}/getty ${SERIAL_CONSOLE}" >> ${D}${sysconfdir}/inittab
> +	else
> +		 
> +		if [ ! -z "${USB_SERIAL_CONSOLE}" ]; then
> +			echo "S:2345:respawn:${base_sbindir}/getty -L ${USB_SERIAL_CONSOLE}" >> ${D}${sysconfdir}/inittab
> +		fi
>  	fi
>  	if [ "${USE_VT}" = "1" ]; then
>  		cat <<EOF >>${D}${sysconfdir}/inittab

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFM7+0kMkyGM64RGpERAtPZAKCSHvZA9Eko51AqkoVR476+5tWoIQCgr1/Z
kxtr+B+5lfr+vqIxh6o5qGA=
=JSd7
-----END PGP SIGNATURE-----



