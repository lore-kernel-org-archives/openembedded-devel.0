Received: from ibawizard.net
	([82.208.49.253] helo=mengele.ibawizard.net ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ynezz@mengele.ibawizard.net>) id 1P718Q-0005SG-F7
	for openembedded-devel@lists.openembedded.org;
	Sat, 16 Oct 2010 09:24:55 +0200
Received: by mengele.ibawizard.net (Postfix, from userid 1002)
	id 906CE1D36170; Sat, 16 Oct 2010 09:24:23 +0200 (CEST)
Date: Sat, 16 Oct 2010 09:24:23 +0200
From: Petr =?iso-8859-2?Q?=A9tetiar?= <ynezz@true.cz>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101016072423.GM28423@ibawizard.net>
References: <AANLkTini++RBtxheY+RZ2+7X-=i4NAbY39e2wcRA8mDh@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <AANLkTini++RBtxheY+RZ2+7X-=i4NAbY39e2wcRA8mDh@mail.gmail.com>
User-Agent: Mutt/1.5.18 (2008-05-17)
X-SA-Exim-Connect-IP: 82.208.49.253
X-SA-Exim-Mail-From: ynezz@mengele.ibawizard.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: testing branch 2010-10-14
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
X-List-Received-Date: Sat, 16 Oct 2010 07:24:55 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Cliff Brake <cliff.brake@gmail.com> [2010-10-14 17:56:24]:

> master has been merged to the testing-next branch and is now ready for
> clean builds.  I'll finish tagging and updating the testing branch
> later today.  It looks like enough things passed to justify moving the
> testing branch to testing_2010-10-08.

Hi,

ts72xx/angstrom-2010.x/minimal-image fails again on udev[1]. Adding that
CFLAGS_append = "-Os" fixed it, but I wonder if it's intention to use broken
recipe/compiler?  Wouldn't it be better to add this workaround into the recipe
and remove it once it's fixed in gcc? It's interesting, that the same
machine/distro combination builded fine with testing_2010-10-08.

1. http://tinderbox.openembedded.net/public/logs/task/8761618.txt

-- ynezz


