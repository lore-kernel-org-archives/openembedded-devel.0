Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1IHDvx-0005Au-BE
	for openembedded-devel@openembedded.org; Sat, 04 Aug 2007 09:20:21 +0200
Received: from Powerbook-2.local (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l747Hx1R016514; Sat, 4 Aug 2007 09:18:00 +0200
Message-ID: <46B42830.8060809@dominion.kabel.utwente.nl>
Date: Sat, 04 Aug 2007 09:18:08 +0200
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 2.0.0.5 (Macintosh/20070716)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <1185839805.7719.103.camel@localhost.localdomain>
In-Reply-To: <1185839805.7719.103.camel@localhost.localdomain>
X-Enigmail-Version: 0.95.2
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Cc: bitbake-dev <bitbake-dev@lists.berlios.de>
Subject: Re: The future of "svnnow"
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
X-List-Received-Date: Sat, 04 Aug 2007 07:20:24 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Richard Purdie schreef:

> 2. Handling of multiple SCMs in the SRC_URI. The plan here is simple,
> any package doing this has to set SRCREV_FORMAT specifying the format of
> the SRCREV string. get_srcrev() can collect the SCM revisions, fill out
> the string and return it. The format and inner workings of this are open
> for discussion and to be determined. 

What about tagging URIs with ;userev=true:

SRC_URI = "svn://foo/bar;userev=true \
           svn://foo/baz;userev=false \
           svn://snizzle/foo;userev=false"

Now bitbake know that it should only use the revision of 'bar' and ideally only rebuild if
that changes.

Or what about naming URIs:

SRC_URI = "svn://foo/bar;name=main \
           svn://foo/baz;name=baz-module \
           svn://snizzle/foo;name=snizzle-foo-support"

SRCREV_FORMAT = "main"

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFGtCgwMkyGM64RGpERAv0AAKC7Ghm1j1VNATajHCBGqXHgXWJIYwCfZWiF
8MfFdeVLP5yttEJXUmwAgF8=
=bXR1
-----END PGP SIGNATURE-----


