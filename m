Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PfJlE-0006FG-NU for openembedded-devel@lists.openembedded.org;
	Tue, 18 Jan 2011 23:10:45 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PfJka-0003sq-Pu for openembedded-devel@lists.openembedded.org;
	Tue, 18 Jan 2011 23:10:04 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Jan 2011 23:10:04 +0100
Received: from k.kooi by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Jan 2011 23:10:04 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 18 Jan 2011 23:07:14 +0100
Message-ID: <ih52ui$l1v$2@dough.gmane.org>
References: <87lj2im6qc.fsf@gmail.com>
	<AANLkTino3P3EV8BazsWGG2HYs7CFXDsLpn+eKoyiUWoK@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <AANLkTino3P3EV8BazsWGG2HYs7CFXDsLpn+eKoyiUWoK@mail.gmail.com>
X-Enigmail-Version: 1.0.1
Subject: Re: Dealing with ttyS -> ttyO rename on OMAP3 in 2.6.37
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
X-List-Received-Date: Tue, 18 Jan 2011 22:10:45 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 18-01-11 21:33, Khem Raj wrote:
> On Tue, Jan 18, 2011 at 10:01 AM, Ben Gamari <bgamari.foss@gmail.com> wrote:
>> As you may know, the kernel's OMAP serial driver has been fixed in
>> 2.6.37 to move away from the ttyS naming towards the OMAP-specific ttyO
>> prefix. This was done in light of the fact that ttyS is apparently
>> reserved for traditional PC-style serial controllers.
>>
>> I've spent the last day or two trying to bring my setup up to a 2.6.37
>> kernel. So far this has been quite painless, although I did get hung up
>> on one simple issue resulting from this name change for several
>> hours. Namely, the inittab still uses the ttyS naming, resulting in no
>> visible login prompt to be started. This is in addition to changing the
>> kernel's console= command line argument in the u-boot
>> configuration. This sort of naming mismatch could be tricky to handle,
>> since openembedded users will no doubt soon be using both pre- and
>> post-2.6.37 kernels. Any clever ideas for how this could be dealt with
>> in an non-obtrusive way?
>>
> 
> hmmm SERIAL_CONSOLE is the place where it should be set and then
> shadow uses that to generate securetty etc. right now SERIAL_CONSOLE
> is a machine property set in machine.conf files. So may be we can let it
> emit both for omaps ? may be that will work otherwise we have to override it
> in recipes which can be ugly.

The machine maintainer should know which kernel is going to get used and
can change the machine.conf accordingly.
For example, I will change the beagleboard one once the .37 kernel is
considered good enough (it's currently lacking ISP support).

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFNNg8SMkyGM64RGpERAjT7AJ0Sx3Wq2WsGsKkfZJrTXK/scVrDwQCfXG5B
Q15DnoIY60BWsc9JcgRkkQI=
=uBmU
-----END PGP SIGNATURE-----



