Received: from [216.145.245.199] (helo=mx03.dls.net)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <mwester@dls.net>) id 1JA5TJ-0004Wo-4U
	for openembedded-devel@lists.openembedded.org;
	Wed, 02 Jan 2008 16:25:33 +0100
Received: from gw.mwester.net ([209.242.5.110] helo=twilight)
	by mx03.dls.net with esmtpa (Exim 4.63)
	(envelope-from <mwester@dls.net>) id 1JA5N6-0007hT-MF
	for openembedded-devel@lists.openembedded.org;
	Wed, 02 Jan 2008 09:19:08 -0600
Message-ID: <0cdd01c84d52$b60de4c0$6e01a8c0@twilight>
From: "Mike \(mwester\)" <mwester@dls.net>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 2 Jan 2008 09:18:21 -0600
MIME-Version: 1.0
X-Priority: 3
X-MSMail-Priority: Normal
X-Mailer: Microsoft Outlook Express 6.00.2800.1914
X-MimeOLE: Produced By Microsoft MimeOLE V6.00.2800.1914
Subject: "as" has gone missing.
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
X-List-Received-Date: Wed, 02 Jan 2008 15:25:33 -0000
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

Alas!  Sometime in the past - nobody here knows exactly when - "as" (the
assembler) has gone missing from the packages.  The "gcc" bitbake recipe
provides all manner of other packages, all of which can be installed, and
seem to provide the necessary compilation tools to build stuff on the target
device.  Except that the toolchain can't find "as" -- and as I peruse the
recipes, neither can I!

The assembler is built and placed on the buildhost (in the cross directory,
as one would expect), so clearly it's handled by something - just not the
"gcc" bb recipe.  The "gcc" recipe does not seem to build "as", and
certainly doesn't have any support for packaging it.

I am need of a clue, if anyone can offer some direction.  Might this be as
simple as a configuration option missing when gcc is built (and "as" should
be part of the "gcc" package), or is this a case where I'll have to add
support for a separate "as" package to the recipe?

Thanks,
Mike (~mwester)



