Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <k.kooi@student.utwente.nl>) id 1J3UeY-0006KY-LL
	for openembedded-devel@openembedded.org; Sat, 15 Dec 2007 11:53:54 +0100
Received: from Powerbook-2.local (vpn006059.vpn.utwente.nl [130.89.6.59])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	lBFAnC0k032116 for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Dec 2007 11:49:13 +0100
Message-ID: <4763B128.6050806@student.utwente.nl>
Date: Sat, 15 Dec 2007 11:49:12 +0100
From: Koen Kooi <k.kooi@student.utwente.nl>
User-Agent: Thunderbird 2.0.0.9 (Macintosh/20071031)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <164348748.20071215043923@gmail.com>
In-Reply-To: <164348748.20071215043923@gmail.com>
X-Enigmail-Version: 0.95.5
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: k.kooi@student.utwente.nl
X-Spam-Status: No
Subject: Re: [RFC] ANGSTROM_MODE -> SYSTYPE
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
X-List-Received-Date: Sat, 15 Dec 2007 10:53:54 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Paul Sokolovsky schreef:
> Hello Openembedded-devel,
> 
>    ANGSTROM_MODE config variable has proven to be very useful and
> successful feature during the Angstrom evolution. IMHO, it is worth
> generalization of its meaning and naming to become a generic
> additional OE distro configuration parameter. 
> So, I'd like to propose
> it to be renamed to SYSTYPE, with the description "Select particular
> system variant of a distribution which supports such feature, e.g.,
> underlying libc type."

How will a user know if that flag is supported for the distro he/she
wants to use?
should we enhance insane.bbclass to crosscheck TARGET_OS with
SYSTYPE_FOO for the uclibc vs glibc case? And if so, how would it check
between glibc and eglibc?
Having an *easier* OE-blessed way for switching C library would be nice,
but let's make sure people don't shoot themselves in the foot by setting
SYSTYPE_FOO with a distro that has no knowledge of it.

regards,

Koen


>   Obviously, it wouldn't be limited to libc type, but intended to be a
> generic sub-parameter of a distro, it could be debug/release type,
> size type (minimal/standard/extended), whatever. The usage idea is to
> have standard name for such generic parameter, plus semantically it
> should be expected that a distro allows to build different SYSTYPE's
> side-by-side in the same build dir (like Angstrom does for libc
> variants).
> 
> 


- --
koen@dominion.kabel.utwente.nl will go go away in december 2007, please
use k.kooi@student.utwente.nl instead.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFHY7EoMkyGM64RGpERAh1uAJ9/QUGnhZ+4/zKUeOZSgIgMNyuwUACfYb3a
gy3s4p4svQ8M8rbFxThH+9I=
=3c7/
-----END PGP SIGNATURE-----


