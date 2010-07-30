Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OekuA-00073k-4S for openembedded-devel@lists.openembedded.org;
	Fri, 30 Jul 2010 10:25:22 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Oektr-0003mJ-99 for openembedded-devel@lists.openembedded.org;
	Fri, 30 Jul 2010 10:25:03 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Jul 2010 10:25:03 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Jul 2010 10:25:03 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Fri, 30 Jul 2010 10:23:16 +0200
Message-ID: <i2u25k$97d$2@dough.gmane.org>
References: <alpine.DEB.2.00.1007290817510.20737@lynx>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.11) Gecko/20100718 Shredder/3.0.7pre
In-Reply-To: <alpine.DEB.2.00.1007290817510.20737@lynx>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: feasibility of "excluding" packages from a task?
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
X-List-Received-Date: Fri, 30 Jul 2010 08:25:22 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 29-07-10 14:23, Robert P. J. Day wrote:
> 
>   not wanting to jump into the main debate, but what is the
> feasibility of somehow "excluding" a package or two from a task you're
> trying to build?  as i'm sure you're tired of hearing, most of the
> time when i try to build a task, it's typically one or two packages
> that don't build that cause the whole thing to fail.
> 
>   so would it be hard to add an "exclude" option to bitbake that would
> allow one to, say:
> 
>   $ bitbake -x gnash beagleboard-demo-image
> 
> there would clearly have to be some dependency processing which might
> require yet other packages to be excluded, etc, etc.
> 
>   and if one had already attempted the initial build, the exclude
> specifier would require bitbake to go back and remove any trace of the
> broken package so it didn't try to still get dragged in when trying to
> build the final task image.  or something like that.
> 
>   has this ever been proposed?  would it be hard?  it would certainly
> be a temporary solution to lots of failed builds.

Yes, making builds non-deterministic is an excellent idea!

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFMUov0MkyGM64RGpERAvneAJ9SNhrX4r6mNFSiwEdqvWGs4RC+yQCfW1HC
02033OcVHj/OKGxn99n01IU=
=62Jo
-----END PGP SIGNATURE-----



