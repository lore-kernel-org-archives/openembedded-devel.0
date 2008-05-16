Received: from [213.36.80.91] (helo=mail.libertysurf.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jeremy.laine@bolloretelecom.eu>) id 1Jx43q-0005wW-Gl
	for openembedded-devel@openembedded.org; Fri, 16 May 2008 19:49:42 +0200
Received: from blini.bolloretelecom.eu (62.210.194.121) by
	mail.libertysurf.net (7.3.118.8)
	id 482DD1D9000047C7; Fri, 16 May 2008 20:55:18 +0200
Received: from [192.168.95.168] (unknown [192.168.95.168])
	by blini.bolloretelecom.eu (Postfix) with ESMTP id 4C0EC23EBA;
	Fri, 16 May 2008 19:25:35 +0200 (CEST)
Message-ID: <482DC38E.1040809@bolloretelecom.eu>
Date: Fri, 16 May 2008 19:25:34 +0200
From: =?ISO-8859-1?Q?Jeremy_Lain=E9?= <jeremy.laine@bolloretelecom.eu>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.8.0.14eol) Gecko/20080509 Thunderbird/1.5.0.14eol
	Mnenhy/0.7.5.0
MIME-Version: 1.0
To: k.kooi@student.utwente.nl,  openembedded-devel@openembedded.org
X-Enigmail-Version: 0.94.2.0
Subject: disapproval of revision '462968658bdc2a3c48a8d634f9be59d450259f49'
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10b4
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
X-List-Received-Date: Fri, 16 May 2008 17:49:42 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: Quoted-Printable

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi Koen,

Could you please explain why you disapproved this commit? I removed
the "export CFLAG" because it is not the correct way of setting flags
when building openssl. If you do "export CFLAG" you unconditionally
override the flags, dropping some flags which are set by the Configure
script and which are needed internally by openssl. What we want to do
is to set additional flags, which is what do_configure() does in
openssl.inc.

If for some reason you feel the CFLAG defined in openssl.inc is not
appropriate for openssl-native, please at least just do a "CFLAG =3D .."
not "export CFLAG". Since you reverted my commit, openssl-native is
broken on x86_64 (both 0.9.7m nor 0.9.8g).

Cheers,

- --
Jeremy LAINE
Bollor=E9 telecom | 11bis, rue Scribe | F-75009 Paris
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQFILcOOCL1n3lVB9EYRAhVUAKCIvIHaz/7Wm/W3xBfsHgFQpSKeLQCeL4kn
p32tuciTBmjMtThj3wOmCyM=3D
=3DIGi7
-----END PGP SIGNATURE-----



