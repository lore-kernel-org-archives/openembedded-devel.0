Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QlZm9-0000dG-4U for openembedded-devel@lists.openembedded.org;
	Tue, 26 Jul 2011 07:01:49 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QlZi5-0004m0-UR for openembedded-devel@lists.openembedded.org;
	Tue, 26 Jul 2011 06:57:37 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Jul 2011 06:57:37 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Jul 2011 06:57:37 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 26 Jul 2011 06:57:24 +0200
Message-ID: <j0lhfk$s8o$1@dough.gmane.org>
References: <1311653193-29753-1-git-send-email-raj.khem@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:5.0) Gecko/20110624 Thunderbird/5.0
In-Reply-To: <1311653193-29753-1-git-send-email-raj.khem@gmail.com>
X-Enigmail-Version: 1.2
Subject: Re: [meta-oe][PATCH 1/2] espeak: Use SITEINFO_ENDIANESS instead of SITEINFO_ENDIANNESS
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
X-List-Received-Date: Tue, 26 Jul 2011 05:01:49 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 26-07-11 06:06, Khem Raj schreef:
> This spelling difference existed when siteinfo was in two places
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com> --- meta-oe/recipes-support/espeak/espeak_1.37.bb |    6 ++++-- 1 files changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-oe/recipes-support/espeak/espeak_1.37.bb b/meta-oe/recipes-support/espeak/espeak_1.37.bb index 6cc4cd4..5f9fcc1 100644 --- a/meta-oe/recipes-support/espeak/espeak_1.37.bb +++ b/meta-oe/recipes-support/espeak/espeak_1.37.bb @@ -1,12 +1,14 @@ require espeak.inc inherit siteinfo
> 
> -EXTRA_PHONEMES = '${@base_contains("SITEINFO_ENDIANNESS", "be",  "espeak-data (= ${PV})", "", d)}' +EXTRA_PHONEMES = '${@base_contains("SITEINFO_ENDIANESS", "be",  "espeak-data (= ${PV})", "", d)}'

The double N is the right spelling, so the oe-core class should be fixed instead
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFOLkk0MkyGM64RGpERAnRYAKCRBX66mOL2iKwLICDQZD+aBO7hlACeJwYs
1n6vb7pwzBfZUK/mG3v2r3c=
=XeWv
-----END PGP SIGNATURE-----



