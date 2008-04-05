Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <k.kooi@student.utwente.nl>) id 1JiAUq-0007jh-TU
	for openembedded-devel@openembedded.org; Sat, 05 Apr 2008 17:40:00 +0200
Received: from [172.20.1.5] (vpn006158.vpn.utwente.nl [130.89.6.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	m35FMoZk032717 for <openembedded-devel@lists.openembedded.org>;
	Sat, 5 Apr 2008 17:22:50 +0200
Message-Id: <4327AE2D-6FA1-4BFE-BA07-059B0FC09BBE@student.utwente.nl>
From: Koen Kooi <k.kooi@student.utwente.nl>
To: openembedded-devel@openembedded.org
Mime-Version: 1.0 (Apple Message framework v919.2)
Date: Sat, 5 Apr 2008 17:22:50 +0200
X-Pgp-Agent: GPGMail d51 (Leopard)
X-Mailer: Apple Mail (2.919.2)
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	servicedesk@icts.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: k.kooi@student.utwente.nl
X-Spam-Status: No
Subject: Adjusting staging for gcc >= 4.3.0
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
X-List-Received-Date: Sat, 05 Apr 2008 15:40:01 -0000
Content-Type: text/plain; charset=US-ASCII; format=flowed; delsp=yes
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

- -----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi,

In order to build glibc with gcc 4.3.0 I needed to do:

ln -sf /OE/angstrom-tmp/cross/lib/gcc/arm-angstrom-linux-gnueabi/4.3.0/ 
include-fixed/* /OE/angstrom-tmp/cross/lib/gcc/arm-angstrom-linux- 
gnueabi/4.3.0/include/

The question I have is:

Should be do this symlinking in the recipe or find a way to add  
include-fixed to the includepath?

regards,

Koen
- -----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFH95kdMkyGM64RGpERAvyhAKComwcyySoXRkWJGhp5Jdll6a6J6QCfWc3t
ZTSQWf+aOfMAoQEPfmc0hHM=
=2xSy
- -----END PGP SIGNATURE-----
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFH95lKMkyGM64RGpERAs1PAKCjSfeU1KpJO3+UMQf4FoNgsSO4fgCfUcxw
yGbSKkKDrQb84iNLTDfCZIk=
=M3IT
-----END PGP SIGNATURE-----


