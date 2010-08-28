Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OpMqD-00045f-5g for openembedded-devel@lists.openembedded.org;
	Sat, 28 Aug 2010 16:57:10 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OpMpe-0006Um-7P for openembedded-devel@lists.openembedded.org;
	Sat, 28 Aug 2010 16:56:34 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 Aug 2010 16:56:34 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 Aug 2010 16:56:34 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sat, 28 Aug 2010 16:56:24 +0200
Message-ID: <i5b82o$kgn$1@dough.gmane.org>
References: <1282896714-3167-1-git-send-email-raj.khem@gmail.com>	<1282896714-3167-3-git-send-email-raj.khem@gmail.com>	<i586bt$t12$1@dough.gmane.org>	<AANLkTikWe-88_U7FmV2mi4=J6XV-A3-nYUqJdjDNzOA9@mail.gmail.com>	<i5aoas$sja$2@dough.gmane.org>	<AANLkTi=stV1ahzagn-7Fzq73pL3xYDDBZpAsfRUbA86v@mail.gmail.com>	<4C790CCD.9060403@balister.org>
	<AANLkTinMWegmS0vGvqXnkrPPqHXnDh+YkB-sxJ95KcTp@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.11) Gecko/20100729 Shredder/3.0.7pre
In-Reply-To: <AANLkTinMWegmS0vGvqXnkrPPqHXnDh+YkB-sxJ95KcTp@mail.gmail.com>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 2/2] recipes: Update recipes to get 'bitbake world' parse and calculate runqueue successfully.
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
X-List-Received-Date: Sat, 28 Aug 2010 14:57:10 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 28-08-10 16:39, Chris Larson wrote:

> *Every* patch that gets proposed is a patch that "works for you, but may not
> for others".  You simply can't test every combination for every change you
> make, it's not possible.  As long as these sorts of patches go the list for
> review, as they now seem to be, I don't see the problem.

You mean like the patch that removed the default openssl version for
*every* distro and introduced an SOVERSION change to libs that can't be
parallel installed, that got pushed without review? That one?

Of course reverting fixes it, no problem, we don't have to manually
check all recipes and packages to see what dynamically links against
openssl to bump PR and rebuild and upload all of those, of course. And
of course the person causing the mess did all that to clean it up.
And no need to check recipes that statically link either.
</sarcasm>

So a patch was was tested nor reviewed that broke a lot got pushed and
the person who pushed it refuses to help with the cleanup, just awesome.

Drat, that was a bit sarcastic as well.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFMeSOYMkyGM64RGpERAn/UAJ4loSu9hp9c9gsrAZiaaXlUNamOEQCfSjee
8QSoyXOItmwJrkZcyPZHE7g=
=mhuT
-----END PGP SIGNATURE-----



