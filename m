Received: from [130.89.2.9] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <k.kooi@student.utwente.nl>) id 1J5Jko-00073e-5W
	for openembedded-devel@openembedded.org; Thu, 20 Dec 2007 12:39:54 +0100
Received: from Powerbook-2.local (vpn006011.vpn.utwente.nl [130.89.6.11])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	lBKBYgfr014717 for <openembedded-devel@openembedded.org>;
	Thu, 20 Dec 2007 12:34:42 +0100
Message-ID: <476A5353.7040301@student.utwente.nl>
Date: Thu, 20 Dec 2007 12:34:43 +0100
From: Koen Kooi <k.kooi@student.utwente.nl>
User-Agent: Thunderbird 2.0.0.9 (Macintosh/20071031)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <fkc9de$365$1@ger.gmane.org> <476A26BB.1010602@student.utwente.nl>
	<fkdeel$p9o$1@ger.gmane.org>
In-Reply-To: <fkdeel$p9o$1@ger.gmane.org>
X-Enigmail-Version: 0.95.5
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: k.kooi@student.utwente.nl
X-Spam-Status: No
Subject: Re: RFC: drop quilt version 0.39
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
X-List-Received-Date: Thu, 20 Dec 2007 11:39:54 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Rolf Leggewie schreef:
> Koen Kooi schrieb:
>>> driven by bug 1960, I have been doing some work on quilt in OE,
> 
>> What are your good reasons to drop it? I see no point in removing stuff
>> just to boost someones commit stats under the moniker "clean up"
> 

<snip usual rolf drivel>

> * had you bothered to look at the referenced bug you would have realized
>   that it was not really me proposing to drop it initially.

That is still no reason to drop it.

> * why keep old stuff (AKA cruft) longer than necessary?  Just so koen
>   can bully fellow contributors?

So vendor can keep using it without having check IRC every 5 minutes to
say "No, we still need it". To keep the work needed when merging
branches down to a minumum. To do regression testing. To do statistical
analysis on packages.

> * patches that apply fine to 0.45 and 0.46 don't apply cleanly to 0.39.
>   This somehow gets into the way of how I reworked it.

FILES_PATH and FILES_DIR both have ${PN}-${PV} overrides, so this is
still no reason to drop it.

> IMHO that suffices to drop it unless there is good reason to keep it.
> If there are, please state them. 

You're under the impression we actively delete 'old' stuff in OE, which
we don't, since we have vendors using the OE tree that aren't on IRC and
don't check this mailinglist regulary.

> And as you all know, OE is versioned
> so if anybody were to want it back anytime in the future mtn would
> gladly spew out the last known 0.39 version, I am sure.

This attitude is exactly why vendors have difficulty with OE.

Again, you must have good reasons for removing it, not have no reasons
to keep it.
And even if you have good reasons, you have to put it in removal.txt
first, with at least a month notice.
If the 1/4000th impact on parsing bothers you, we also have
packages/obsolete/.

This all applies to OE in general as well, so your recent deletion of
atk will probably need reverting as well.


- --
koen@dominion.kabel.utwente.nl will go go away in december 2007, please
use k.kooi@student.utwente.nl instead.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFHalNTMkyGM64RGpERAiOyAKChC3aPIZZgEHO6PFLZTFPfbQw51wCdGLxD
Wzy5YcN0ttqe/UET4xrS/kc=
=ZSLV
-----END PGP SIGNATURE-----


