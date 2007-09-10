Received: from [130.89.2.9] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <k.kooi@student.utwente.nl>) id 1IUdgD-0005CQ-Pf
	for openembedded-devel@openembedded.org; Mon, 10 Sep 2007 09:27:33 +0200
Received: from Powerbook-2.local (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l8A7OWxP020490 for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Sep 2007 09:24:33 +0200
Message-ID: <46E4F12B.9080102@student.utwente.nl>
Date: Mon, 10 Sep 2007 09:24:27 +0200
From: Koen Kooi <k.kooi@student.utwente.nl>
User-Agent: Thunderbird 2.0.0.6 (Macintosh/20070728)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@openembedded.org>
References: <46E4E5DB.7050501@gmx.net>
In-Reply-To: <46E4E5DB.7050501@gmx.net>
X-Enigmail-Version: 0.95.3
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-SpamScore: s
X-UTwente-MailScanner-From: k.kooi@student.utwente.nl
X-Spam-Status: No
Subject: Re: 3rd party feeds
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
X-List-Received-Date: Mon, 10 Sep 2007 07:27:34 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Robert Schuster schreef:
> Hi,
> suppose I am a 3rd party which develops and maintains packages for a
> distribution (e.g. angstrom).
> 
> how can I provide those packages (say foo) and their dependendencies
> (minus the ones that are already provided by angstrom itself) via a feed.

You ping the angstrom maintainers and they will build that package and put it in the
angstrom feeds.

Angstrom *highly* discourages people to add random feeds from the internet.

regards,

Koen

> To better explain what I mean here is an example. Suppose package foo is
> not part of the Angstrom distribution nor is it in its feeds. foo has a
> dependency on gtk+ (= part of Angstrom) and libbaz (= not part of Angstrom).
> 
> I want to built foo and the feed containing it with a single command:
> 
> bitbake angstrom-plus-feed
> 
> When it finishes I want to have a complete ipk feed which I can copy
> onto a server. It should contain foo, libbaz and not gtk+. Users should
> then add the URL for that feed into their machines and be able to
> install "foo" along with the dependencies. foo and libbaz will be
> fetched from my feed, gtk+ should be fetched from angstrom feed.
> 
> It is clear that I have to built all the angstrom packages on the build
> machine and possibly won't be able to suppress the do_package phase but
> that is not a problem.
> 
> Has OE support for such an approach? If not would you be interested in
> patches allowing it?
> 
> So far I have "emulated" this by using a special PACKAGE_ARCH but that
> is not really a solution.
> 
> Regards
> Robert
> 
> 
> 
> ------------------------------------------------------------------------
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFG5PErMkyGM64RGpERApTjAKCAz9Q3CNNF82oKIxIIXjobT3llNwCff8ts
yerGF07VYo4p6TpuO9dwBpA=
=6235
-----END PGP SIGNATURE-----


