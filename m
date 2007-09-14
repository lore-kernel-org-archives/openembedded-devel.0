Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <k.kooi@student.utwente.nl>) id 1IW4TL-0007WA-Or
	for openembedded-devel@openembedded.org; Fri, 14 Sep 2007 08:16:11 +0200
Received: from Powerbook-2.local (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l8E6CmxW016391 for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Sep 2007 08:12:48 +0200
Message-ID: <46EA2668.6080307@student.utwente.nl>
Date: Fri, 14 Sep 2007 08:12:56 +0200
From: Koen Kooi <k.kooi@student.utwente.nl>
User-Agent: Thunderbird 2.0.0.6 (Macintosh/20070728)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@openembedded.org>
References: <E1IVzbz-0007pX-Aa@linuxtogo.org>
In-Reply-To: <E1IVzbz-0007pX-Aa@linuxtogo.org>
X-Enigmail-Version: 0.95.3
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: k.kooi@student.utwente.nl
X-Spam-Status: No
Subject: Re: [oe-commits] org.oe.dev libgsmd: add modified start script for fic-gta01 due to problems w/ UART multiplexing
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
X-List-Received-Date: Fri, 14 Sep 2007 06:16:12 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

mickeyl commit schreef:
> libgsmd: add modified start script for fic-gta01 due to problems w/ UART multiplexing
> See http://bugzilla.openmoko.org/cgi-bin/bugzilla/show_bug.cgi?id=788 for more information
> This is hopefully just a temporary solution...
> 
> Author: mickeyl@openembedded.org
> Branch: org.openembedded.dev
> Revision: 235d3c4d9fbc3aee4e352851f04eb4fa2da4a68f
> ViewMTN: http://monotone.openembedded.org/revision/info/235d3c4d9fbc3aee4e352851f04eb4fa2da4a68f
> Files:
> 1
> packages/gsm/files/fic-gta01
> packages/gsm/files/fic-gta01/gsmd

Coudn't this be done in the existing startup script with and if [ machine = gta01 ] guard?
 We did a lot of work in the past to make gsmd not machine specific, this undoes that :(

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFG6iZoMkyGM64RGpERAhqkAJ9yKRj0LkpFmzJgqV4xsdQTvcpITwCghlk8
7ftj2nW+CfEu9RnUUw8bXCQ=
=TMvz
-----END PGP SIGNATURE-----


