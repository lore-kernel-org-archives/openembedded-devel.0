Received: from [130.89.2.9] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1IZQih-0000r6-Nf
	for openembedded-devel@openembedded.org; Sun, 23 Sep 2007 14:37:55 +0200
Received: from Powerbook-2.local (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l8NCXdYY021436 for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Sep 2007 14:33:40 +0200
Message-ID: <46F65D2D.5020507@dominion.kabel.utwente.nl>
Date: Sun, 23 Sep 2007 14:33:49 +0200
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 2.0.0.6 (Macintosh/20070728)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@openembedded.org>
References: <46F587F7.4060501@balister.org>
	<c384c5ea0709230419n7542c911v27a389539421e454@mail.gmail.com>
In-Reply-To: <c384c5ea0709230419n7542c911v27a389539421e454@mail.gmail.com>
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-SpamScore: s
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: Re: How should OE be used?
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
X-List-Received-Date: Sun, 23 Sep 2007 12:37:56 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Leon Woestenberg schreef:

> - We do not use task-base approach, because it builds dependencies we
> did not have before (a dependency regression).

Task-base is a 'works great for 95% of the users' kind of thing. It wasn't intended to be
the absolute minimum, which is why we have task-boot now and still need more tasks with
that purpose. Task-base will give you a starting point that is known to work (if not, file
bugs :)) from where you can slim it down or fatten it up. However, if you have 8mb or less
flash, you need something (vastly) different.


> -> I would like to see a OE group focus on minimal dependency distro.
> I would join such a group, but cannot do that alone.

You mean a minimal dependency image, a distro only sets policy, and angstrom has been
*extremely* carefull to not impose size decicions.

 > - Angstrom seems the de-facto distro OE is tested against, at least
> upstream. Angstrom is excellent, but testing OE against Angstrom only
> drives OE away from the embedded domain IMHO.

It does not drive it away from the embedded domain, but it does make OE seem like a
monoculture. But that is not angstrom's or OE's fault. I think that's because it's pretty
much the only distro (not counting angstrom derivates like openmoko) that has active
developers *AND* is developed in .dev. If we need to checkout some svn/cvs/hg/git tree to
get your OE-based distro, you have already lost.

> -> Unbitrot (Refresh) a distro other than Angstrom, preferably a more
> minimal one.

Again, you mean images. I have an angstrom image in use that is below 900kB (jffs2) with
no postinsts and the only write action it 'needs' is the dropbear key, which can be
skipped if you really want that.
I and others are currently waiting for the nslu2 people to make up their mind about using
angstrom or not before we are going to work on proper embedded images and configurations
(e.g. a slimmer task-base / fatter task-boot, using busybox init and login, superstrip,
etc) for angstrom.


> - Documentation.
> -> It's there, but you have to know what you are looking for. Most
> people don't know, or don't look.

The canonical place is the OE usermanual, which is on the website and edited in mtn from
the org.openembedded.documentation branch.

regards,

Koen



