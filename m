Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1HKHHt-0006EF-1Z
	for openembedded-devel@openembedded.org; Thu, 22 Feb 2007 17:59:21 +0100
Received: from [172.20.1.5] (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l1MGxGLr023057 for <openembedded-devel@openembedded.org>;
	Thu, 22 Feb 2007 17:59:16 +0100
Message-ID: <45DDCBE2.1090702@dominion.kabel.utwente.nl>
Date: Thu, 22 Feb 2007 17:59:14 +0100
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 1.5.0.9 (Macintosh/20061207)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <E1HKH3r-0005y7-9i@linuxtogo.org>
In-Reply-To: <E1HKH3r-0005y7-9i@linuxtogo.org>
X-Enigmail-Version: 0.94.1.2
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-SpamScore: sss
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: Re: [oe-commits] org.oe.dev bitbake.conf: fix PKG_CONFIG_PATH as per	RFC on the mailinglist
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
X-List-Received-Date: Thu, 22 Feb 2007 16:59:21 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

koen commit schreef:
> bitbake.conf: fix PKG_CONFIG_PATH as per RFC on the mailinglist
> * rebuild all your pkgconfig using packages
> 
> AND/OR
> 
> * cd <staging> ; mv share/pkgconfig/* lib/pkgconfig

Please do so :)


> -export PKG_CONFIG_PATH = "${STAGING_DATADIR}/pkgconfig"
> +export PKG_CONFIG_PATH = "${STAGING_LIBDIR}/pkgconfig"

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFF3cviMkyGM64RGpERAh0tAJ4omhDXp46d3P5irxwz2ClHDidm6gCgspWB
QHg/1UIxBusyIE7yETzhsMs=
=CNLM
-----END PGP SIGNATURE-----


