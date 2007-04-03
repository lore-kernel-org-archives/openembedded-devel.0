Received: from [130.89.2.9] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1HYfPb-00020L-N8
	for openembedded-devel@openembedded.org; Tue, 03 Apr 2007 11:34:47 +0200
Received: from [130.89.138.60] (wlan138060.mobiel.utwente.nl [130.89.138.60])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l339Yfox028662 for <openembedded-devel@openembedded.org>;
	Tue, 3 Apr 2007 11:34:42 +0200
Message-ID: <46121FAE.6010408@dominion.kabel.utwente.nl>
Date: Tue, 03 Apr 2007 11:34:38 +0200
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 1.5.0.10 (Macintosh/20070221)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <E1HYf5T-0006Ok-EM@linuxtogo.org>
In-Reply-To: <E1HYf5T-0006Ok-EM@linuxtogo.org>
X-Enigmail-Version: 0.94.2.0
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: Re: [oe-commits] org.oe.dev hal: add 0.5.9 and hal-info_git from poky
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
X-List-Received-Date: Tue, 03 Apr 2007 09:34:48 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

koen commit schreef:
> hal: add 0.5.9 and hal-info_git from poky
> * has a hack to work around autofoo >2.59 dep

> +# work around autoconf >2.59 deps...
> +do_configure() {
> +	gnu-configize
> +	libtoolize --force
> +	oe_runconf
> +}

As Graeme noted on IRC, we really need to get autoconf-native 2.6x working. It didn't
compile for me, so I resorted to the above hack.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFGEh+uMkyGM64RGpERAsKzAKCXbXhdCHshuSHyIQn8w/Ko99F2mgCgjH28
K8ybX+nxyOxJ+ocEVExQHWg=
=Mx9j
-----END PGP SIGNATURE-----


