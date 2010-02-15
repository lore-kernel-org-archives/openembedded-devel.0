Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Nh5xQ-0005oU-VF for openembedded-devel@lists.openembedded.org;
	Mon, 15 Feb 2010 19:46:12 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Nh5uu-0005d9-0Q for openembedded-devel@lists.openembedded.org;
	Mon, 15 Feb 2010 19:43:32 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Feb 2010 19:43:31 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Feb 2010 19:43:31 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 15 Feb 2010 19:43:06 +0100
Message-ID: <hlc4jp$cfc$1@ger.gmane.org>
References: <20100214135613.GF5364@jama>
	<4B79673B.50108@balister.org>	<ac9c93b11002150859i4aa5ee7eid6a648d95fa25d6c@mail.gmail.com>
	<20100215171952.GA3233@jama>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.7) Gecko/20100204 Shredder/3.0.2pre
In-Reply-To: <20100215171952.GA3233@jama>
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
X-List-Received-Date: Mon, 15 Feb 2010 18:46:12 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 15-02-10 18:19, Martin Jansa wrote:
> On Mon, Feb 15, 2010 at 05:59:39PM +0100, Frans Meulenbroeks wrote:
>>>> I'm just thinking about using bitbake only in minimalistic chroot.
> 
> Already rebuilding in new chroot :).
> 
>>>>
>>>> What are advantages/disadvantages?
>>>>
>>>> How I see it:
>>>>
>>>> Advantages:
>>>> 1) more secure (I started to use separate user for bitbake, when I
>>>>    started to play with bitbake master instead release - because that
>>>>    warning it said), but chroot is even better.
>>>> 2) less problems when autotools pick some header or lib from buildhost
>>>>    instead of staging
>>>> 3) easier to check, that -native package is missing for some important
>>>>    lib
>>>>
>>>> Disadvantages:
>>>> 1) Few more MB for building environment (extra libc, gcc, binutils, git,
>>>>    svn, sh, etc. installed in chroot
>>
>> If they are on the same filesystem you could use hard links and save those MBs.
> 
> Not so big problem for me, so I used mount --bind for dirs I want to
> share (ie /usr/portage as I'm using gentoo) and it took only about
> 100MB.. so not a big deal
> 
>>>> 2) More administrative to keep chroot system updated
>>>> 3) harder to check, that autotools won't pick something from buildhost
>>>>    in normal environment before pushing new version/recipe (ie I won't
>>>>    have SDL libs installed in chroot, but everybody else will and maybe
>>>>    build will fail for them after I push some recipe.
>>>
>>> I see this as a good thing :)
> 
> The last point? Well it's good for me (less issues) but if I push some
> recipe failing for 99% other builders just because they have pretty
> standard libs on their systems, then I should be blamed for pushing
> crappy recipe :).
> 
>> Seems a good plan to me, please keep us posted.
>> (actually I've been considering building in a minimalistic VM)
> 
> Well VM would be much slower.. 

On a recent intel/amd cpu VMs I can't measure much difference between VM
and non-vm builds.
My main buildmachine at work is an ubuntu 8.04LTS vm running under
windows XP. The only major speedup I can get building in a native
install would be using 64bit, since the VM is 32 bit, but it does expose
both CPU cores :)

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFLeZW6MkyGM64RGpERAtFOAJ9hOQA/80gWA5pzQQW9vZ34Kcmy7ACgh6vV
zSccfttlBkf/RDcRCiYQMqg=
=ID01
-----END PGP SIGNATURE-----



