Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NUPRy-0006bu-24 for openembedded-devel@lists.openembedded.org;
	Mon, 11 Jan 2010 19:57:17 +0100
Received: from list by lo.gmane.org with local (Exim 4.50) id 1NUPPs-0007FB-8R
	for openembedded-devel@lists.openembedded.org;
	Mon, 11 Jan 2010 19:55:04 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Jan 2010 19:55:04 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Jan 2010 19:55:04 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 11 Jan 2010 19:54:10 +0100
Message-ID: <hifs4h$5ha$1@ger.gmane.org>
References: <18e217241001110959k4d346f05j7e00c36dfd18021d@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.7) Gecko/20100104 Shredder/3.0.1pre
In-Reply-To: <18e217241001110959k4d346f05j7e00c36dfd18021d@mail.gmail.com>
X-Enigmail-Version: 1.0
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: dependencies between packages
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
X-List-Received-Date: Mon, 11 Jan 2010 18:57:17 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 11-01-10 18:59, C Michael Sundius wrote:
> Some of our developers have been running into this problem and I'm wondering
> how others deal with it.
> 
> It seems if we have a recipe, (A) that depends upon header files staged by
> another recipe (B) then:
> 
> 1) if the source for recipe (B) is modified and recompiled with:
> 
>     bitbake -f -c compile B
>     bitbake B,
> 
> I would expect that when recipe A is run:
> 
>    bitbake A
> 
> It too would be recompiled, however that does not seem to be the case. In
> fact even if recipe B is cleaned up:
> 
>     bitbake -c clean B
> 
> and then we run recipe A
> 
>     bitbake A
> 
> only recipe B is run and recipe A is NOT rerun! the dependency is satisfied
> by rerunning recipe B and then bitbake stops..
> 
> is this expected behaviour?

Yes, although it's a bit counter intuitive from a buildsystem POV, but
we currently don't have a foolproof, distributed way of automatically
bumping PR for dependant packages, so we don't enable that rebuild
feature. It's no use rebuilding when the packagemanager won't notice
that the package has been updated.

> Is there away to force rerunning of recipes that
> would be "out of date" due to one of its dependent recipes being return and
> re-staging (potentially) new headers and libraries?

Have a look at BB_STAMP_POLICY, I forgot the details.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFLS3PSMkyGM64RGpERAnpGAJwIthWw2W383J1cW+OCu41oLUSqQgCfRYW/
DUlLsi+a3tcysXsxLnRa5Pg=
=Upuw
-----END PGP SIGNATURE-----



