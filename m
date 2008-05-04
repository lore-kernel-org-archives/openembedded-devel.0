Received: from [195.170.0.77] (helo=kane.otenet.gr ident=OTEnet-mail-system)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <skoroneos@digital-opsis.com>) id 1JsmO5-0006Rf-F0
	for openembedded-devel@openembedded.org; Mon, 05 May 2008 00:08:53 +0200
Received: from dias (athedsl-14177.home.otenet.gr [87.202.55.207])
	by kane.otenet.gr (8.13.8/8.13.8/Debian-3) with ESMTP id m44M8gJv031100
	for <openembedded-devel@openembedded.org>;
	Mon, 5 May 2008 01:08:43 +0300
Message-Id: <200805042208.m44M8gJv031100@kane.otenet.gr>
From: "Stelios Koroneos" <skoroneos@digital-opsis.com>
To: <openembedded-devel@openembedded.org>
Date: Mon, 5 May 2008 01:07:59 +0300
MIME-Version: 1.0
X-Mailer: Microsoft Office Outlook, Build 11.0.5510
Thread-Index: AciuM1Aime3iC5lwRviS5u7XTulV5g==
X-MimeOLE: Produced By Microsoft MimeOLE V6.00.2900.3198
Subject: Merging .dreambox to .dev
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
X-List-Received-Date: Sun, 04 May 2008 22:08:54 -0000
Content-Type: text/plain;
	charset="US-ASCII"
Content-Transfer-Encoding: 7bit

I found some time today to work on getting .dreambox branch merged to .dev
This was more of an exercise on mtn and branches, as I am planning to work
on local branch for oplinux-0.3, that hopefully will get merged back to .dev
one day.

There are 2 problems with .dreambox (actually there are 3 but the last one
was expected) that mtn refers as non-content confilcts.
The first has to do with a number of files from the toolchain, that were
actually copied from .dev and not propagaded.
This results in having 2 files with the same name and no ansestor and mtn
does not like it at all.
The other problem is with files that were removed from .dev but still exist
on .dreambox
The third issue are the 3 way merges that need to be perfomed in order to
sync .dreambox to .dev in things like classes and some of the packages.

1 was handled by renaming the problematic files so they could servive the
merge and not create any problems
Most of the files in this case include toolchain related files.
2 was handled by removing/droping a few files from .dreambox. Fortunatelly
these files are some old buybox configs,so loosing their history I can
assume won't be a big issue
The 3rd issue and the one that could take a lot of time and effort are the 3
way merges required,which might be several


Stelios S. Koroneos

Digital OPSiS - Embedded Intelligence
http://www.digital-opsis.com




