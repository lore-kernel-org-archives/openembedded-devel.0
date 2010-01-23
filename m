Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NYc1p-0006bO-5L for openembedded-devel@lists.openembedded.org;
	Sat, 23 Jan 2010 10:11:40 +0100
Received: from list by lo.gmane.org with local (Exim 4.50) id 1NYbzZ-0006ua-J2
	for openembedded-devel@lists.openembedded.org;
	Sat, 23 Jan 2010 10:09:17 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sat, 23 Jan 2010 10:09:17 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 23 Jan 2010 10:09:17 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sat, 23 Jan 2010 10:08:53 +0100
Message-ID: <hjeeb4$8a7$1@ger.gmane.org>
References: <4B564B3D.7020108@atmel.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.7) Gecko/20100113 Shredder/3.0.2pre
In-Reply-To: <4B564B3D.7020108@atmel.com>
X-Enigmail-Version: 1.0
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH v2] Enable bmp and JPEG files for fbv
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
X-List-Received-Date: Sat, 23 Jan 2010 09:11:40 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 20-01-10 01:15, Ulf Samuelsson wrote:

>  do_install() {
>  	install -d ${D}${bindir}
> -        install -m 0755 fbv ${D}${bindir}
> -
> -        # man
> -        install -d ${D}${mandir}/man1/
> -        install -m 0644 fbv.1 ${D}${mandir}/man1/fbv.1
> +	install -m 0755 fbv ${D}${bindir}

NAK, we still want proper -doc packages

>  }
> +
> +PACKAGES = "fbv"
> +

And NEVER EVER redefine PACKAGES! We want proper -dbg and -dev packages
for depchain purposes.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFLWrykMkyGM64RGpERAg0RAJ9AFmVVMuoZ2/Dh9QM6ehG8H7WsAgCfSGGC
dd0SrEUtuXUkbRSnLSLRt0s=
=x2vo
-----END PGP SIGNATURE-----



