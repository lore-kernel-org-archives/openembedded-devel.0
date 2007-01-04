Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1H2VJT-0000is-0u
	for openembedded-devel@openembedded.org; Thu, 04 Jan 2007 17:19:31 +0100
Received: from [172.20.1.5] (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l04GI9Lr010152 for <openembedded-devel@openembedded.org>;
	Thu, 4 Jan 2007 17:18:09 +0100
Message-ID: <459D28BF.3000208@dominion.kabel.utwente.nl>
Date: Thu, 04 Jan 2007 17:18:07 +0100
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 1.5.0.9 (Macintosh/20061207)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <E1H2VAZ-0000cW-1g@linuxtogo.org>
In-Reply-To: <E1H2VAZ-0000cW-1g@linuxtogo.org>
X-Enigmail-Version: 0.94.1.2
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: Re: [oe-commits] org.oe.dev madwifi-ng: add slugos support and bump to	latest snapshot
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 04 Jan 2007 16:19:31 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

mwester commit schreef:
> madwifi-ng: add slugos support and bump to latest snapshot

> packages/madwifi/files/slugos-VFP-wackelf.patch
> packages/madwifi/files/slugos-xscale-be-elf-copts.patch
> packages/madwifi/files/slugos-xscale-le-elf-copts.patch
> packages/madwifi/madwifi-ng_r1871-20061229.bb

> +SRC_URI_slugos = "http://snapshots.madwifi.org/${PN}/${PN}-${PV}.tar.gz \
> +		  file://slugos-xscale-be-elf-copts.patch;patch=1 \
> +		  file://slugos-xscale-le-elf-copts.patch;patch=1 \
> +		  file://slugos-VFP-wackelf.patch;patch=1"
> +

Ehm, shouldn't those be machine specific? what happens if I build slugos for powerpc?

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFFnSi+MkyGM64RGpERAurmAJ9shLtzRB9T1PoZBtzFEVIR7vqg0QCgndOp
a2JCeIISh0ZghHjD31o7CFA=
=PmaW
-----END PGP SIGNATURE-----


