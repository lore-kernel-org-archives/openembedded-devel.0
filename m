Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1Nc5q7-00078E-Ik
	for openembedded-devel@lists.openembedded.org;
	Tue, 02 Feb 2010 00:37:58 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id o11N7p9f005284
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 1 Feb 2010 23:07:51 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 04829-08 for <openembedded-devel@lists.openembedded.org>;
	Mon,  1 Feb 2010 23:07:47 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id o11N7kqj005278
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 1 Feb 2010 23:07:46 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <ac9c93b11001300418t644f9b92h926dbae7a232b339@mail.gmail.com>
References: <ac9c93b11001300418t644f9b92h926dbae7a232b339@mail.gmail.com>
Date: Mon, 01 Feb 2010 23:07:43 +0000
Message-ID: <1265065663.3159.8.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.2 
X-Virus-Scanned: amavisd-new at rpsys.net
X-SA-Exim-Connect-IP: 93.97.173.237
X-SA-Exim-Mail-From: rpurdie@rpsys.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: packaged staging issue; additional packages
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
X-List-Received-Date: Mon, 01 Feb 2010 23:37:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2010-01-30 at 13:18 +0100, Frans Meulenbroeks wrote:
> I seem to have found an issue with packaged staging.
> I'll try to describe the problem, but maybe my understanding is not
> 100% so bear with me in that case
[...]
> I've focused myself on this one:
> 
>  * opkg_install_cmd: Cannot install package udev.
>  * satisfy_dependencies_for: Cannot satisfy the following dependencies
> for sysvinit:
>  * satisfy_dependencies_for:    sysvinit-inittab *
>  * opkg_install_cmd: Cannot install package sysvinit.
> 
> What seems to be the case here is the following:
> sysvinit bb file contains the following:
> 
> RDEPENDS_${PN} = "${PN}-inittab"
> 
> PACKAGES =+ "bootlogd ${PN}-inittab"
> FILES_bootlogd = "/etc/init.d/bootlogd /etc/init.d/stop-bootlogd
> /etc/rc?.d/S*bootlogd /sbin/bootlogd"
> FILES_${PN}-inittab = "${sysconfdir}/inittab"
> 
> So it generates the sysvinit-inittab package and RDEPENDS on it.
> 
> If I search for inittab in my work/sysvinit dir I get:
> ./inittab
> ./sysvinit-2.86/man/inittab.5
> ./staging-pkg/staging/armv7a-angstrom-linux-gnueabi/usr/share/man/man5/inittab.5
> ./staging-pkg/pkgdata/beagleboard-angstrom-linux-gnueabi/runtime/sysvinit-inittab
> ./staging-pkg/pkgdata/beagleboard-angstrom-linux-gnueabi/runtime/sysvinit-inittab.packaged
> ./sysroot-destdir/home/frans/oe/tmp_angstrom/staging/armv7a-angstrom-linux-gnueabi/usr/share/man/man5/inittab.5
> ./packages-split/sysvinit-inittab
> ./packages-split/sysvinit-inittab/etc
> ./packages-split/sysvinit-inittab/etc/inittab
> ./packages-split/sysvinit-doc/usr/share/man/man5/inittab.5
> ./package/etc/inittab
> ./package/usr/share/man/man5/inittab.5
> ./image/etc/inittab
> ./image/usr/share/man/man5/inittab.5
> 
> So the file inittab does not end up in packaged staging.
> 
> It seems to me that packaged-staging.bbclass needs some work and that
> something like staging_packager needs to be involved for all packages
> in a recipe.
> Howeever, implementing this is beyond my python capabilities and also
> beyond my understanding of the build system.
> 
> Is my analysis correct?
> Can someone implement something or provide some guidance?

inittab is a false lead but you're heading in the right direction. The
staging package should contain a sysvinit-inittab*.ipk. Whilst I only
have a Poky build handy, I see:

find -name sysvinit-inittab*
./packages-split/sysvinit-inittab
./staging-pkg/deploy/ipk/netbook/sysvinit-inittab_2.86-r32_netbook.ipk
./staging-pkg/pkgdata/netbook-poky-linux/runtime/sysvinit-inittab
./staging-pkg/pkgdata/netbook-poky-linux/runtime/sysvinit-inittab.packaged

The key line being:

./staging-pkg/deploy/ipk/netbook/sysvinit-inittab_2.86-r32_netbook.ipk

If something like that file isn't there, something in OE's package
staging is broken.

Cheers,

Richard




