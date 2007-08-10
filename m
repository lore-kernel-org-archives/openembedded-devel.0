Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1IJUwi-0004L3-Cq
	for openembedded-devel@openembedded.org; Fri, 10 Aug 2007 15:54:35 +0200
Received: from Powerbook-2.local (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l7ADpd1R010148 for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Aug 2007 15:51:39 +0200
Message-ID: <46BC6D62.7060503@dominion.kabel.utwente.nl>
Date: Fri, 10 Aug 2007 15:51:30 +0200
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 2.0.0.6 (Macintosh/20070728)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@openembedded.org>
References: <74d0deb30708100622mb2c048et188fca0c03e8117e@mail.gmail.com>
In-Reply-To: <74d0deb30708100622mb2c048et188fca0c03e8117e@mail.gmail.com>
X-Enigmail-Version: 0.95.3
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: Re: [RFC] a small bbclass for task recipes
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
X-List-Received-Date: Fri, 10 Aug 2007 13:54:40 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

pHilipp Zabel schreef:
> Hi,
> 
> while looking for the cause of several -dbg packages being included in
> my latest angstrom-x11-image builds, I noticed that some task packages
> have -dev, -doc and
> -dbg versions in the deploy directories because they don't set PACKAGES.
> 
> To improve consistency, I propose to add a small task.bbclass that does set
> ALLOW_EMPTY="1", PACKAGES="${PN}" and PACKAGE_ARCH="all".
> That way simple task recipes can just "inherit task".
> (If needed, this could be enhanced later with a python script to automatically
> add -dbg packages that RRECOMMEND the -dbg versions of packages that
> the main package RDEPENDs upon.)
> 
> See attached patch (which also includes some $MACHINE_ARCH -> all
> PACKAGE_ARCH changes). Comments?

Looks okay after a brief look.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFGvG1iMkyGM64RGpERAuJdAKCnhqskXlkN+5C0nkX2yamuIkokhACePCQK
RsYuDQHtZtk/OzunVgeJjRU=
=IF7R
-----END PGP SIGNATURE-----


