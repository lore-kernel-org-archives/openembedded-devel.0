Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NhIZM-0005va-AO for openembedded-devel@lists.openembedded.org;
	Tue, 16 Feb 2010 09:14:11 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NhIWn-0002te-UK for openembedded-devel@lists.openembedded.org;
	Tue, 16 Feb 2010 09:11:29 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Feb 2010 09:11:29 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Feb 2010 09:11:29 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 16 Feb 2010 09:11:10 +0100
Message-ID: <hldjus$5tt$1@ger.gmane.org>
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
X-List-Received-Date: Tue, 16 Feb 2010 08:14:11 -0000
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
> should be reasonable hardware.

If you're on cpus with hardware virtualization support (e.g. intel
core2) you do need to enable some bits in the bios (iirc turn on PAE) to
enable the 'zero overhead' stuff intel/amd marketing are raving about.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFLelMdMkyGM64RGpERAv5pAKCNr+wJqr3OPyJG++h1rF6hLPDtowCfXiUr
skypepZKHahO5rEr75qXzkc=
=kKuJ
-----END PGP SIGNATURE-----



