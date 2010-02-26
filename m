Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Nl4rX-0001F0-Vu for openembedded-devel@lists.openembedded.org;
	Fri, 26 Feb 2010 19:24:33 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Nl4oM-0001ry-F3 for openembedded-devel@lists.openembedded.org;
	Fri, 26 Feb 2010 19:21:14 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Feb 2010 19:21:14 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Feb 2010 19:21:14 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Fri, 26 Feb 2010 19:20:30 +0100
Message-ID: <hm93de$tnt$1@dough.gmane.org>
References: <1266951776.18176.47.camel@trini-m4400>
	<4B87EC32.6030807@mwester.net>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.8) Gecko/20100219 Shredder/3.0.3pre
In-Reply-To: <4B87EC32.6030807@mwester.net>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] Fix busybox SUID support
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
X-List-Received-Date: Fri, 26 Feb 2010 18:24:33 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 26-02-10 16:43, Mike Westerhof wrote:
> Tom Rini wrote:
>> I was about to just push this and I noticed that a number of
>> distributions (SlugOS, Angstrom, Kaelios, micro) currently set
>> FEATURE_SUID=y, but it's not actually install SUID.  And since I recall
>> some way-back-when's of "busybox SUID is dangerous / crap!", I thought
>> it best to post the patch first and let folks speak up / ask me to drop
>> FEATURE_SUID=y when I do this.  So, here's the patch:
> 
> In the case of SlugOS, this was deliberate -- the thinking was that we
> would let the user decide if they wanted to run busybox SUID after
> installation.  In retrospect, that actually led to more problems than
> good, so this change gets an ACK from me (albeit late - sorry for the
> delay!)

The same logic was applied to angstrom "let users sort it out", but I
think this patch is a better way to go.

Acked-by: Koen Kooi <koen@openembedded.org>


-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFLiBDuMkyGM64RGpERAj1iAJ92l81A14+d1zbGez1GZ1B2wtsxRgCdE5oP
sYCctrQ1jucxDfR0R4PMMf8=
=Bi6n
-----END PGP SIGNATURE-----



