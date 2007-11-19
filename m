Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <k.kooi@student.utwente.nl>) id 1Iu7iP-0004CQ-Ta
	for openembedded-devel@openembedded.org; Mon, 19 Nov 2007 15:35:10 +0100
Received: from Powerbook-2.local (vpn006015.vpn.utwente.nl [130.89.6.15])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	lAJEX3Zn018850 for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Nov 2007 15:33:04 +0100
Message-ID: <47419EA0.4030308@student.utwente.nl>
Date: Mon, 19 Nov 2007 15:33:04 +0100
From: Koen Kooi <k.kooi@student.utwente.nl>
User-Agent: Thunderbird 2.0.0.9 (Macintosh/20071031)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <20071119120819.GA17788@lenovo>
In-Reply-To: <20071119120819.GA17788@lenovo>
X-Enigmail-Version: 0.95.5
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: k.kooi@student.utwente.nl
X-Spam-Status: No
Subject: Re: Getting Started -Makefile
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
X-List-Received-Date: Mon, 19 Nov 2007 14:35:10 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

David Farning schreef:
> I think that my getting started Makefile is ready for testing.
> 
> To setup a development BitBake\OpenEmbedded system:
> 
> ##Do not run this from an existing bb/oe directory.  It will##
> ##overwrite parts of your local.conf.                       ##
> 
> make a new  test directory
> change to the test directory
> copy Makefile to directory
> 
> $make setup

nice

> $make build-package-vim

$deity just killed a few hundred kittens.

At OEDEM we decided that we won't tolerate kindergarten-like,
hand-holding wrappers around bitbake. Typing 'bitbake vim' isn't rocket
science. To paraphrase Mickey: "If typing 'bitbake <foo>' is too hard,
you shouldn't be using OE".

At OEDEM we also discovered that people we clueless about various
pitfalls documented in local.conf.sample, so I'm also unsure if we
should make it recommended practice to generate a working local.conf.
The killswitch is in local.conf.sample for a good reason; it forces
people to read it.

> This eliminates many of problems the new users have setting up bb
> and oe. 

And the makefile should stop after setting it up.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFHQZ6fMkyGM64RGpERArNJAJ0RdpWrjbhYIbX/1nQZ3U6bgto4MwCfZhg/
EMR7B5VUHKTygSQMURGdAjU=
=72r1
-----END PGP SIGNATURE-----


