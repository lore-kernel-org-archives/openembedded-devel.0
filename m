Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OcDzp-00065Y-Fk for openembedded-devel@lists.openembedded.org;
	Fri, 23 Jul 2010 10:52:46 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OcDzX-000271-9T for openembedded-devel@lists.openembedded.org;
	Fri, 23 Jul 2010 10:52:27 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Jul 2010 10:52:27 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Jul 2010 10:52:27 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Fri, 23 Jul 2010 10:52:18 +0200
Message-ID: <i2bl83$7im$1@dough.gmane.org>
References: <i2bf8b$joo$2@dough.gmane.org>
	<AANLkTim=jp4BQTg_nPkMg2yN_-g-6_Stta6ZkjD3H-Xb@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.10) Gecko/20100611 Shredder/3.0.6pre
In-Reply-To: <AANLkTim=jp4BQTg_nPkMg2yN_-g-6_Stta6ZkjD3H-Xb@mail.gmail.com>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: binutils-cross problem with multimachine config after cross changes
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
X-List-Received-Date: Fri, 23 Jul 2010 08:52:46 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 23-07-10 10:36, Frans Meulenbroeks wrote:
> 2010/7/23 Koen Kooi <k.kooi@student.utwente.nl>
> 
> Hi,
> 
> I was doing a multimachine build and the armv7a bits completed
> beautifully, but the armv5te bits break in binutils-cross:
> 
> | /usr/bin/ld:
> 
> /work/autobuilder/build/tmp-angstrom_2008_1/sysroots/x86_64-linux/usr/lib/libiberty.a(cplus-dem.o):
> relocation R_X86_64_32
> used when making a shared object; recompile with -fPIC
> |
> 
> /work/autobuilder/build/tmp-angstrom_2008_1/sysroots/x86_64-linux/usr/lib/libiberty.a:
> could not read symbols: Bad value
> | collect2: ld returned 1 exit status
> 
> Does anyone have a quick fix for that? My tinderbox looks so said with
> all that red :(
> 
> 
>> Yesterday I noticed a similar issue with binutils 2.20.1 for nios2 when ld
>> was called with -shared.
>> 2.17.50 did not have the problem.
>> Didn't have time to investigate yet. (and probably it'll take a day or two
>> before I get to this)

I suspect the second binutils-cross is trying to link with the libs from
the first, which breaks.

>> Are you using the same version of binutils for v5 and v7? (and which one).

ANGSTROM_BINUTILS_VERSION                ?= "2.18"
ANGSTROM_BINUTILS_VERSION_armv4          ?= "2.20"
ANGSTROM_BINUTILS_VERSION_armv7a         ?= "2.18.50.0.7"

Angstrom-next has a saner layout, that used 2.20.x for everything, but
lots of things don't build with that and among those things are the
things that bring in my paycheck.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFMSVhCMkyGM64RGpERApymAJ0Yh8zUt3DklFUjAHc1P40t03LwAQCcCxDK
6LJ5tQ/Vb7auH78ldPINVJE=
=S65W
-----END PGP SIGNATURE-----



