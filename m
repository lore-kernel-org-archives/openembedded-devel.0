Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.63)
	(envelope-from <gfellerpatrik@gmx.net>) id 1H3WXu-0002ng-II
	for openembedded-devel@lists.openembedded.org;
	Sun, 07 Jan 2007 12:50:38 +0100
Received: (qmail invoked by alias); 07 Jan 2007 11:49:06 -0000
Received: from 129.149.78.83.cust.bluewin.ch (EHLO [192.168.1.33])
	[83.78.149.129]
	by mail.gmx.net (mp018) with SMTP; 07 Jan 2007 12:49:06 +0100
X-Authenticated: #1952393
From: Patrik Gfeller <gfellerpatrik@gmx.net>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 7 Jan 2007 12:48:57 +0100
User-Agent: KMail/1.9.5
References: <1168146083.2742.8.camel@dollar.3rdshift.com>
In-Reply-To: <1168146083.2742.8.camel@dollar.3rdshift.com>
MIME-Version: 1.0
Message-Id: <200701071249.02379.gfellerpatrik@gmx.net>
X-Y-GMX-Trusted: 0
Subject: Re: qemu-native-0.8.2-r2 fails to build
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
X-List-Received-Date: Sun, 07 Jan 2007 11:50:39 -0000
X-Groupsio-MsgNum: 1118
Content-Type: multipart/signed; boundary="nextPart2927335.8TrkdDFHSR";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart2927335.8TrkdDFHSR
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Sunday 07 January 2007 06:01, VLG wrote:
... I remember that I also had problems with this; you may try the following in local.conf:
***
ENABLE_BINARY_LOCALE_GENERATION = "0"
ASSUME_PROVIDED += "qemu-native"
***
If you have a working qemu in your build machine distro you may even set ENABLE_BINARY_LOCALE_GENERATION = "1", but 1st I recommend to try without.

hope this helps,
Patrik

--nextPart2927335.8TrkdDFHSR
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2 (GNU/Linux)

iD8DBQBFoN4uLkt4gT2qbbYRAmNzAKC+4wiEK/NC09kmPLrASsxAdmK/yACfZLUx
uC93VZfdSX9v5hnT3ztzm4g=
=C76r
-----END PGP SIGNATURE-----

--nextPart2927335.8TrkdDFHSR--
