Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OOoHb-0004Mt-NF for openembedded-devel@lists.openembedded.org;
	Wed, 16 Jun 2010 10:47:40 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OOoDE-000762-08 for openembedded-devel@lists.openembedded.org;
	Wed, 16 Jun 2010 10:43:08 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Jun 2010 10:43:07 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Jun 2010 10:43:07 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
connect(): No such file or directory
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 16 Jun 2010 10:42:54 +0200
Message-ID: <hva2qe$jco$1@dough.gmane.org>
References: <4C187CF6.5010401@gmx.net>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.10) Gecko/20100524 Shredder/3.0.6pre
In-Reply-To: <4C187CF6.5010401@gmx.net>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] add ubuntu patch which adds atomic builtin support to gcc 4.3.[3 but also other microversions]
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
X-List-Received-Date: Wed, 16 Jun 2010 08:47:40 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 16-06-10 09:27, Robert Schuster wrote:
> Hi,
> Angstrom's default GCC is 4.3.3 for ARM. Unfortunately that version
> lacks atomic intrinsics support for the very same architecture
> (__sync_synchronize and friends). The support is available from 4.4.x
> onwards but a patch exists in Ubuntu's GCC that adds the intrinsics to
> the earlier GCC version. I would like add that patch to our GCC 4.3.x
> (all of them so there is not suddenly a feature missing when one changes
> from one microversion to another). This has the potential for drastic
> effects on other recipes because a lot of programs (e.g. pulseaudio,
> llvm) check for the availability of the intrinsics and make use of them
> in that case.
> 
> I ask for comments here because I would also like to see this change
> move into OE stable later on. (The use case is to get OpenJDK with the
> Shark JIT compiler [llvm-based] to run on the bug20 hardware).

My first question: Has anyone tested it in an OE build yet?
My second question: When is all that openjdk stuff you keep talking
about ending up in OE? I know Henning keeps handwaving about it not
being ready, but after after waiting a year, is it ever going to be
deemed ready by the jalimo crew? Just merge it into OE now :)

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFMGI6OMkyGM64RGpERAo3pAJ9teoUUA6zsD9FCkDJvUYzRuABoOwCeJVZK
15hwXUxr+DzZeiRqQ/T5Li0=
=xuWK
-----END PGP SIGNATURE-----



