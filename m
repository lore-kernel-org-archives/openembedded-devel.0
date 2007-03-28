Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1HWecO-0007b4-3G
	for openembedded-devel@openembedded.org; Wed, 28 Mar 2007 22:19:40 +0200
Received: from [172.20.1.5] (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l2SKJbLr018235 for <openembedded-devel@openembedded.org>;
	Wed, 28 Mar 2007 22:19:37 +0200
Message-ID: <460ACDD8.2070604@dominion.kabel.utwente.nl>
Date: Wed, 28 Mar 2007 22:19:36 +0200
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 1.5.0.10 (Macintosh/20070221)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <20070320033120.GA8678@thegnar.org>		<1174574086.5949.32.camel@localhost.localdomain>		<20070323043126.GA893@thegnar.org>		<1174641616.5813.9.camel@localhost.localdomain>		<460AABD1.4080409@am.sony.com>	<1175109319.5829.30.camel@localhost.localdomain>
	<460ACBB8.8070501@am.sony.com>
In-Reply-To: <460ACBB8.8070501@am.sony.com>
X-Enigmail-Version: 0.94.2.0
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: Re: bitbake and OE opperation
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
X-List-Received-Date: Wed, 28 Mar 2007 20:19:40 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Tim Bird schreef:

> build - meta-task to cover the whole build process
> populate_staging - (same as do_stage?) - put package contents in staging area?

do_stage was a wrapper around populate_staging and something arcane, and nowadays just
calls populate_staging directly

> package_write - ??

Write out the actual packages

> package - collect files files from install locations into some kind of collection (dependent on package format)

collect files files from install locations (${WORKDIR}/image/) into package directories (
${WORKDIR}/install/<package-name>) (defined by PACKAGES and FILES), independant of package
format.

> install - place files (e.g. built binaries) at install locations
> compile - make
> configure - run configure
> patch - apply patches to source
> unpack - unpack tarballs
> fetch - grab sources from Internet - turn into tarballs
> 
> Are there any other major tasks?

do_deploy and do_rootfs are pretty widely used as well.

regards,

KOen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFGCs3YMkyGM64RGpERArHhAJ9RciWFDVNgpidR3QMk7m1Mho8c1gCfftes
RVyXY/27NNgKh57WDcDXShY=
=af3p
-----END PGP SIGNATURE-----


