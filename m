Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PeRLl-00044X-S9 for openembedded-devel@lists.openembedded.org;
	Sun, 16 Jan 2011 13:04:50 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PeRLC-00063X-MA for openembedded-devel@lists.openembedded.org;
	Sun, 16 Jan 2011 13:04:14 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sun, 16 Jan 2011 13:04:14 +0100
Received: from k.kooi by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 16 Jan 2011 13:04:14 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sun, 16 Jan 2011 13:04:03 +0100
Message-ID: <igumrj$3pp$1@dough.gmane.org>
References: <1295138727-6516-1-git-send-email-lm@larsmichelsen.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <1295138727-6516-1-git-send-email-lm@larsmichelsen.com>
X-Enigmail-Version: 1.0.1
Subject: Re: [PATCH] Added Europe/Berlin timezone to tzdata pkg
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
X-List-Received-Date: Sun, 16 Jan 2011 12:04:50 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 16-01-11 01:45, Lars Michelsen wrote:
> I was missing the Europe/Berlin timezone in the tzdata package. So I
> added it to the package.

NAK! The main tzdate package is kept as small as possible, only
packaging one tz per continent.

If we look at your patch:

>                  ${datadir}/zoneinfo/Europe/Paris         \
> +                ${datadir}/zoneinfo/Europe/Berlin        \

We see you are adding Berlin right below Paris, which is the same TZ
with the same DST rules.

So if you only want to install tzdata and want to have 'date' show the
correct time, use Europe/Paris. If you nationalism prevents you from
doing that and you have some space left in your rootfs, install
'tzdata-europe' :)

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFNMt6zMkyGM64RGpERApd6AJ9Qz6A/MXfQY3yJq+eGUB5s7+4+IACeIjLQ
uq7sMCxdkcbyZPKabJO+kck=
=0NoX
-----END PGP SIGNATURE-----



