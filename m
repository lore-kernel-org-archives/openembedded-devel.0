Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QUHPk-0004EI-W2 for openembedded-devel@lists.openembedded.org;
	Wed, 08 Jun 2011 13:59:13 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QUHMa-0001Ap-HA for openembedded-devel@lists.openembedded.org;
	Wed, 08 Jun 2011 13:55:56 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Jun 2011 13:55:56 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Jun 2011 13:55:56 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Wed, 08 Jun 2011 13:55:43 +0200
Message-ID: <isnnvv$n8f$1@dough.gmane.org>
References: <0C757E680E33864AB113392C7E83F910BE5183@GSX300A.mxchg.m.corp>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <0C757E680E33864AB113392C7E83F910BE5183@GSX300A.mxchg.m.corp>
X-Enigmail-Version: 1.0.1
Subject: Re: Amend recipes which do not contain a (new) target machine in COMPATIBLE_MACHINE
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
X-List-Received-Date: Wed, 08 Jun 2011 11:59:13 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 08-06-11 13:44, Hauser, Wolfgang (external) wrote:
> Hello,
> 
> I added a new machine definition for our hardware (hardware is almost
> like beagleboard xM) and want to add the specific patches and
> configurations by using the amend class in my additional layer.
> 
> If I amend the kernel recipe (linux-omap-psp_2.6.32.bb) for machines
> contained in COMPATIBLE_MACHINE, the amend.inc is found and my
> amendments are done well (for omap3evm and beagleboard).
> 
> If I want to build the kernel for my machine, the kernel recipe
> linux-omap-psp_2.6.32.bb was skipped in case of not containing my new
> machine in COMPATIBLE_MACHINE and the wrong kernel is build.
> 
> I need only a view additions to the linux-omap-psp-2.6.32 kernel so I
> don't want to copy the original recipe into my layer and change it. I
> have to build my system for omap3evm, beagleboard and our specific
> hardware.
> 
> Is there a possibility to avoid the skipping of the kernel recipe for a
> machine not contained in COMPATIBLE_MACHINE ? Or add the machine for
> amending somewhere ?

Stupid question: why not send patches to add your machine to OE?
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFN72M/MkyGM64RGpERAhLTAJ9qHNv0eInsZR/TlEroTi9tEV2aawCfdVJg
OpHnn2F0ulVD9E8Jh6fPMDc=
=S3P7
-----END PGP SIGNATURE-----



