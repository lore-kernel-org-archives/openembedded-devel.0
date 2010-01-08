Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NTFVD-00086w-Ad for openembedded-devel@lists.openembedded.org;
	Fri, 08 Jan 2010 15:07:50 +0100
Received: from list by lo.gmane.org with local (Exim 4.50) id 1NTFT9-0004sB-KU
	for openembedded-devel@lists.openembedded.org;
	Fri, 08 Jan 2010 15:05:39 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 Jan 2010 15:05:39 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 Jan 2010 15:05:39 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Fri, 08 Jan 2010 15:05:03 +0100
Message-ID: <hi7e2e$cda$1@ger.gmane.org>
References: <20100108132344.GB2156@jama>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.5) Gecko/20091222 Shredder/3.0.1pre
In-Reply-To: <20100108132344.GB2156@jama>
X-Enigmail-Version: 1.0
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: update-alternatives broken badly (by me :()
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
X-List-Received-Date: Fri, 08 Jan 2010 14:07:50 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Can't we just make them both read from the opkg dir?

regards,

Koen

On 08-01-10 14:23, Martin Jansa wrote:
> After this change
> http://cgit.openembedded.net/cgit.cgi/openembedded/commit/?id=9b641bbfed07c075ae5cbe84082a85f1ba703447
> 
> most distributions use opkg-native as u-a provider for building their
> images, but I haven't noticed that 
> 
> update-alternatives-cworth use alternatives from
> /usr/lib/ipkg/alternatives
> 
> opkg use
> /usr/lib/opkg/alternatives
> 
> So image prepared with opkg-native cannot ship with
> update-alternatives-cworth installed, but it does, because task-boot
> DEPENDS on "update-alternatives" which could be fixed with 
> DISTRO_UPDATE_ALTERNATIVES and using DISTRO_UPDATE_ALTERNATIVES for
> PREFERRED_PROVIDER_virtual/update-alternatives
> PREFERRED_PROVIDER_virtual/update-alternatives-native
> and here in task-boot.
> 
> But this won't fix already installed/built images :/.
> 
> How to fix this properly? I guess that right combination of RCONFLICTS
> and good postinst scipt can fix that.. but its quite difficult to test
> it and it can break things even more :/. Please advise..
> 
> Sort of nasty workaround now is
> opkg remove update-alternatives-cworth
> opkg reinstall busybox
> 
> Here is info I just sent to SHR mailing list
> 
> In last opkg upgrade there is bump to busybox package, which triggers
> old bug in our images :(.
> 
> There are 2 scripts providing update-alternatives in our images, one is
> part of opkg itself installed in
> /usr/bin/update-alternatives (it was added to opkg later)
> 
> and older update-alternatives-cworth installed in
> /usr/sbin/update-alternatives and used by default
> 
> But with busybox upgrade all symlinks are updated with knowledge only
> from /usr/lib/ipkg/alternatives because of that -cworth which shouldn't
> be part of image! (I'll push -cworth blacklist to our shr.conf but its
> too late for those who upgraded busybox yesterday).
> 
> Hopefully working work-around (haven't tested because I'm at work)
> 
> opkg remove update-alternatives-cworth
> opkg reinstall busybox
> 
> Please also check
> diff -rq /usr/lib/opkg/alternatives /usr/lib/ipkg/alternatives
> if there is some major difference, if yes reinstall packages where the
> alternatives provided by them are different in those 2 dirs.
> 

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFLRzuPMkyGM64RGpERAhO/AJ96HpNyFXugDyZQM72YbijPg61k2ACePp/e
WiVNV4APMwMBJ/HCK3sof48=
=UpsU
-----END PGP SIGNATURE-----



