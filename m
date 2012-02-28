Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1S2JSn-0002VB-3j for openembedded-devel@lists.openembedded.org;
	Tue, 28 Feb 2012 10:35:17 +0100
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1S2JKc-0006dB-RO for openembedded-devel@lists.openembedded.org;
	Tue, 28 Feb 2012 10:26:50 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Feb 2012 10:26:50 +0100
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Feb 2012 10:26:50 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 28 Feb 2012 10:26:42 +0100
Message-ID: <jii6kh$ae8$1@dough.gmane.org>
References: <1330409002-31186-1-git-send-email-ulf@emagii.com>
	<1330409002-31186-2-git-send-email-ulf@emagii.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:9.0) Gecko/20111222 Thunderbird/9.0.1
In-Reply-To: <1330409002-31186-2-git-send-email-ulf@emagii.com>
X-Enigmail-Version: 1.3.5
Subject: Re: [meta-oe] ca-certificates: Bump version to 20120212
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
X-List-Received-Date: Tue, 28 Feb 2012 09:35:17 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 28-02-12 07:03, ulf@emagii.com schreef:
> From: Ulf Samuelsson <ulf@emagii.com>
> 
> 20111211 has disappeared from the server
> 
> Signed-off-by: Ulf Samuelsson <ulf@emagii.com>

Could you please address the following bugs in the old recipe as well?

> + +do_install_prepend() { +        mkdir -p
> ${D}/usr/share/ca-certificates

$datadir

> +        mkdir -p ${D}/usr/sbin

$sbindir

> +        mkdir -p ${D}/etc/ssl/certs +        mkdir -p
> ${D}/etc/ca-certificates/update.d

$sysconfdir

> +} + +do_install_append() { +        cd ${D}/usr/share/ca-certificates

$datadir

> +        echo "# Lines starting with # will be ignored" >
> ${D}/etc/ca-certificates.conf +        echo "# Lines starting with ! will
> remove certificate on next update" >> ${D}/etc/ca-certificates.conf +
> echo "#" >> ${D}/etc/ca-certificates.conf

$sysconfdir

> +        for crt in $(find . -type f -name '*.crt' -print) +        do +
> crt=$(echo $crt | sed -e 's/\.\///') +                echo $crt >>
> ${D}/etc/ca-certificates.conf

$sysconfdir

> +        done +} + +pkg_postinst_${PN} () { +if [ -n "$D" ] ; then +	exit
> 1 +fi + +${sbindir}/update-ca-certificates +} + +CONFFILES_${PN} =
> "/etc/ca-certificates.conf"

$sysconfdir

regards,

Koen

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (Darwin)
Comment: GPGTools - http://gpgtools.org

iEYEARECAAYFAk9Mnc8ACgkQMkyGM64RGpFzQwCffYb7rjrii/WOPiYEZikqj7Sd
EgYAoKIs2JYMd7AuKoQDPDSDrhtulra8
=9dnP
-----END PGP SIGNATURE-----



