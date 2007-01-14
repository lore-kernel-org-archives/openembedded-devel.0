Received: from [64.233.182.186] (helo=nf-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <pmiscml@gmail.com>) id 1H6271-0004zZ-Qw
	for openembedded-devel@lists.openembedded.org;
	Sun, 14 Jan 2007 10:57:15 +0100
Received: by nf-out-0910.google.com with SMTP id l24so1663763nfc
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 14 Jan 2007 01:55:02 -0800 (PST)
Received: by 10.49.15.16 with SMTP id s16mr2674643nfi.1168768502818;
	Sun, 14 Jan 2007 01:55:02 -0800 (PST)
Received: from CUBE ( [85.202.124.214])
	by mx.google.com with ESMTP id d2sm16705554nfe.2007.01.14.01.55.01;
	Sun, 14 Jan 2007 01:55:02 -0800 (PST)
Date: Sun, 14 Jan 2007 11:55:02 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Priority: 3 (Normal)
Message-ID: <1754192865.20070114115502@gmail.com>
To: Alban J Pearce <alban@mycroft1.plus.com>
In-Reply-To: <200701132239.31919.alban@mycroft1.plus.com>
References: <1888834532.20070112204308@vanille-media.de>
	<1168681959.5868.4.camel@localhost.localdomain>
	<45A905A7.4070300@dominion.kabel.utwente.nl>
	<200701132239.31919.alban@mycroft1.plus.com>
MIME-Version: 1.0
Cc: Holger Freyther <freyther@gmx.net>, opie-devel@handhelds.org,
	Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
Subject: Re: Angstrom cannot buile portabase
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
X-List-Received-Date: Sun, 14 Jan 2007 09:57:16 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello Alban,

Sunday, January 14, 2007, 12:39:31 AM, you wrote:

> I have installed Angstrom 
> bitbake , nano works

[]
> NOTE: Applying patch 'kernel-keymap.patch'
[]
> |+++ qt-2.3.10-snapshot-20060120/src/kernel/qkeyboard_qws.cpp   2006-01-20
> 21:16:25.412761096 +0100
> --------------------------
> No file to patch.  Skipping patch.
> 19 out of 19 hunks ignored
[]

  This patch was done for inconsistent -pN param, I fixed it now, and
checked that it applies and builds.

  At the same time, there're ongoing changes for OPIE in OE.dev, so if
you want to just build apps for your production handheld, OpenZaurus
branch is recommended.

  Otherwise, we'd need Zaurus people to test OPIE changes in OE.dev,
so your help is appreciated, but expect some breakage then. My general
approach to solve current OPIE issues is to reduce machine
discrepancies in its build to zero, set common requirements for a
machine to be supported in OPIE (adhering to which will automatically
mean that machine is supported) and re-review every patch to QT/E for
unavoidability of application in the current situation (that one being
the situation that original OPIE maintainers no longer have
interest/resources to maintain it).

  In this regard, kernel-keymap.patch is in gray area - it currently
being applied inconsistently without even clear major platform
distinction (currently it is applied to Zauruses and Jornada
PocketPC's). So it should be re-evaluated for benefits it offer vs
possible requirements it has and maintenance burden, and either being
applied consistently for all machines, or dropped.

  I wanted to discuss these issues with Holger (zecke) (and other core
OPIE folks who'd have time/interest) on IRC first, but now that this
issue was raised, I dump this "seed" message here...



-- 
Best regards,
 Paul                            mailto:pmiscml@gmail.com



