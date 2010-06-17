Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OPBjQ-0003wD-N7 for openembedded-devel@lists.openembedded.org;
	Thu, 17 Jun 2010 11:49:58 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OPBf0-000581-50 for openembedded-devel@lists.openembedded.org;
	Thu, 17 Jun 2010 11:45:22 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Jun 2010 11:45:22 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Jun 2010 11:45:22 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
connect(): No such file or directory
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 17 Jun 2010 11:45:12 +0200
Message-ID: <hvcqr8$mfs$1@dough.gmane.org>
References: <4C19DA49.3020206@gmx.net>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.10) Gecko/20100524 Shredder/3.0.6pre
In-Reply-To: <4C19DA49.3020206@gmx.net>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: problem with SHLIBs and RDEPENDS
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
X-List-Received-Date: Thu, 17 Jun 2010 09:49:59 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 17-06-10 10:18, Robert Schuster wrote:
> Hi,
> I am trying to make the OpenJDK recipes 'OE ready'. One hard issue I am
> facing has to do with the shlibs mechanism in OE.
> 
> In order to get OpenJDKs dependencies right its libraries and binaries
> are checked for library dependencies. That is all fine and I would love
> to activate that.
> 
> Actually we have three kinds of OpenJDK builds atm:
>  - zero (interpreter only; but with enhancements on ARM to make it fly)
>  - shark (zero interpreter plus JIT based on LLVM)
>  - cacao (completely different runtime)
> 
> The binary version of those recipes all bring a libjvm.so. Theoretically
> a user could install all three packages (you can do that in
> Debian/Ubuntu for example). However when the shlibs mechanism is
> activated it puts the first built openjdk variant into a registry and
> all subsequent variants get a hard runtime dependency on that package
> (e.g. openjdk-shark will depend on openjdk-zero if I built zero first)
> although there is no technical reason for this.
> 
> So my question is: How can I solve this issue without resorting to:
> 
> EXCLUDE_FROM_SHLIBS = "1"
> 
> which I currently use and which has the bad side-effect of not having
> openjdk's own dependencies. :(

Try:

PRIVATE_LIBS = "libjvm.so"

That will mark any libjvm.so in PACKAGES for that recipe as private and
it won't show up as a shlib provider. We use this in mozilla recipes.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFMGe6oMkyGM64RGpERAseXAKCZvjVHnmWXiZZki2uUZ5NFtpUeAQCgkxzj
e+36yRWm1gOSgT1epqOBlbM=
=Cg4e
-----END PGP SIGNATURE-----



