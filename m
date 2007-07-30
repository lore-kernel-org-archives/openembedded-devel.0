Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <koen@dominion.kabel.utwente.nl>)
	id 1IFTrQ-0004jy-G9; Mon, 30 Jul 2007 13:56:30 +0200
Received: from Powerbook-2.local (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l6UBsg1R028729; Mon, 30 Jul 2007 13:54:42 +0200
Message-ID: <46ADD17F.7090306@dominion.kabel.utwente.nl>
Date: Mon, 30 Jul 2007 13:54:39 +0200
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 2.0.0.5 (Macintosh/20070716)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <E1IFTcI-0004TQ-7X@linuxtogo.org>
In-Reply-To: <E1IFTcI-0004TQ-7X@linuxtogo.org>
X-Enigmail-Version: 0.95.2
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Cc: Michael Lauer <mickey@vanille-media.de>,
	openembedded-commits@openembedded.org
Subject: Re: [oe-commits] org.oe.dev first batch of OpenMoko2007.2 stuff
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
X-List-Received-Date: Mon, 30 Jul 2007 11:56:31 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

mickeyl commit schreef:
> first batch of OpenMoko2007.2 stuff

> ============================================================
> --- packages/openmoko2/openmoko-theme-standard2_svn.bb	63e4490c76e470ecdf213580aa34e8a3c10d1da7
> +++ packages/openmoko2/openmoko-theme-standard2_svn.bb	63e4490c76e470ecdf213580aa34e8a3c10d1da7

> +	install -d ${D}${sysconfdir}/gtk-2.0
> +	echo 'include "${datadir}/themes/openmoko-standard-2/gtk-2.0/gtkrc"' >> ${D}${sysconfdir}/gtk-2.0/gtkrc
> +}

That creates lots of problems when people have their own /etc/gtk-2.0/gtkrc[1] and install
an openmoko package. Could you at least mark it as CONFFILE so the packagemanager will
alert the user?

regards,

Koen

[1] or other packages that install that file...
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFGrdF/MkyGM64RGpERAl82AKCnKohPOdMrwD8lIWQcv+zwYWRiqgCfdWTA
/K4SAPEdSO2JxP0GN6a4U5k=
=YEmZ
-----END PGP SIGNATURE-----


