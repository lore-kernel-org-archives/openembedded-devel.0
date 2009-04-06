Received: from [213.91.4.211] (helo=bart.wifirst.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jeremy.laine@bolloretelecom.eu>) id 1LqoZK-0006xk-U3
	for openembedded-devel@lists.openembedded.org;
	Mon, 06 Apr 2009 15:09:45 +0200
Received: from bart.wifirst.net (localhost [127.0.0.1])
	by bart.wifirst.net (Postfix) with ESMTP id B116A5FF53
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  6 Apr 2009 15:06:02 +0200 (CEST)
Received: from bart.wifirst.net (localhost [127.0.0.1])
	by bart.wifirst.net (Postfix) with ESMTP id 4F30A5FF5D
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  6 Apr 2009 15:06:01 +0200 (CEST)
Received: from blini.bolloretelecom.eu (smtp.bolloretelecom.eu
	[62.210.194.121])
	by bart.wifirst.net (Postfix) with ESMTP id 335845FF53
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  6 Apr 2009 15:06:01 +0200 (CEST)
Received: from [192.168.95.73] (unknown [192.168.95.73])
	by blini.bolloretelecom.eu (Postfix) with ESMTPSA id 3628D23E4A
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  6 Apr 2009 15:06:00 +0200 (CEST)
Message-ID: <49D9FE37.9040005@bolloretelecom.eu>
Date: Mon, 06 Apr 2009 15:05:59 +0200
From: =?ISO-8859-1?Q?Jeremy_Lain=E9?= <jeremy.laine@bolloretelecom.eu>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.8.1.19) Gecko/20090103 Thunderbird/2.0.0.19 Mnenhy/0.7.5.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-Enigmail-Version: 0.95.0
X-Virus-Scanned: ClamAV using ClamSMTP
X-SA-Exim-Connect-IP: 213.91.4.211
X-SA-Exim-Mail-From: jeremy.laine@bolloretelecom.eu
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-1.2 required=5.0 tests=AWL,BAYES_00,RDNS_NONE,
	SPF_NEUTRAL autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Package "pine" has multiple issues
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
X-List-Received-Date: Mon, 06 Apr 2009 13:10:04 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

While doing some QA work I came up with the following problems:

* RDEPENDS_pine =3D "pico" : this looks wrong, should probably be a "+=3D=
"
* pine embeds a copy of libc-client, which is already available as a
separate package
* LDFLAGS are ignored, resulting in a QA error

As I can't find "pine" in the MAINTAINERS file, could someone step
forward and fix it please?

Cheers,

- --
Jeremy LAINE
Bollor=E9 telecom | 11bis, rue Scribe | F-75009 Paris
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iEYEARECAAYFAknZ/jcACgkQCL1n3lVB9EZxVACgvh34Fk11nuCzUT/r/DKPicej
3mgAoNBpISA+o1XKfjySxMA5ZoKYmoDp
=3DPL5d
-----END PGP SIGNATURE-----


