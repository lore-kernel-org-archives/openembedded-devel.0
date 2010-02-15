Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Nh9HR-00019o-LB for openembedded-devel@lists.openembedded.org;
	Mon, 15 Feb 2010 23:19:05 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Nh9Eu-0005ve-6N for openembedded-devel@lists.openembedded.org;
	Mon, 15 Feb 2010 23:16:24 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Feb 2010 23:16:24 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Feb 2010 23:16:24 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 15 Feb 2010 23:15:59 +0100
Message-ID: <hlch2u$o8p$1@ger.gmane.org>
References: <20100214135613.GF5364@jama>
	<4B79673B.50108@balister.org>	<ac9c93b11002150859i4aa5ee7eid6a648d95fa25d6c@mail.gmail.com>	<20100215171952.GA3233@jama>
	<hlc4jp$cfc$1@ger.gmane.org> <1266271477.31865.4.camel@trini-m4400>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.7) Gecko/20100204 Shredder/3.0.2pre
In-Reply-To: <1266271477.31865.4.camel@trini-m4400>
X-Enigmail-Version: 1.0.1
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Using bitbake in minimal chroot environment
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
X-List-Received-Date: Mon, 15 Feb 2010 22:19:05 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 15-02-10 23:04, Tom Rini wrote:
> On Mon, 2010-02-15 at 19:43 +0100, Koen Kooi wrote:
> 
> [snip]
>> On a recent intel/amd cpu VMs I can't measure much difference between VM
>> and non-vm builds.
>> My main buildmachine at work is an ubuntu 8.04LTS vm running under
>> windows XP. The only major speedup I can get building in a native
>> install would be using 64bit, since the VM is 32 bit, but it does expose
>> both CPU cores :)
> 
> What are you (and everyone else saying it's fine) running the VM with?
> I've got people reporting just unusable build times inside VMs on what
> should be reasonable hardware.  That said, I've profiled some builds and
> seen that IO is not a bottleneck (stuff like waiting for virtual/libc to
> stage and gcc-cross to get populated is).

I'm using virtualbox on a Dell D630 (core2duo, 4GB of ram) laptop. I
managed to cut 2 hours (yes, hours) of the buildtime by moving lots of
stuff to new style staging. With a big tmpdir (6 machines, 2 different
archs, lots of machine specific stuff) old-style staging takes eons to
stat every file and build a list.
Using virtualbox on a 2GB osx machine isn't running so hot because OSX
seems to go out of its way to put the VM in swap instead of ram :(

regards,

Koen

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFLecefMkyGM64RGpERAmLWAJ0dsBhzCnV86Z/rxJKVVGMUS+4q2wCfTPZb
ykkNNSvTlPN2ZEIQT8xgfqY=
=PZD0
-----END PGP SIGNATURE-----



