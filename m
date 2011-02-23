Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PsBtl-0001Ov-JG for openembedded-devel@lists.openembedded.org;
	Wed, 23 Feb 2011 11:24:45 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PsBsS-00043j-HF for openembedded-devel@lists.openembedded.org;
	Wed, 23 Feb 2011 11:23:24 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Feb 2011 11:23:24 +0100
Received: from k.kooi by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Feb 2011 11:23:24 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 23 Feb 2011 11:23:09 +0100
Message-ID: <ik2n6d$9gk$1@dough.gmane.org>
References: <4D64B565.3040006@dresearch.de>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <4D64B565.3040006@dresearch.de>
X-Enigmail-Version: 1.0.1
Subject: Re: NetworkManager-0.8.1 do_compile failed
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
X-List-Received-Date: Wed, 23 Feb 2011 10:24:45 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 23-02-11 08:21, Steffen Sledz wrote:
> Trying a clean build:
> 
> OE:hipox sledz@mobil-400-586:~/work/openembedded> bitbake networkmanager
> ...
> 
> Build Configuration:
> BB_VERSION        = "1.12.0"
> METADATA_BRANCH   = "org.openembedded.dev"
> METADATA_REVISION = "8e4bd2f"
> TARGET_ARCH       = "arm"
> TARGET_OS         = "linux-gnueabi"
> MACHINE           = "hipox"
> DISTRO            = "angstrom"
> DISTRO_VERSION    = "2010.7-test-20110223"
> TARGET_FPU        = "soft"
> 
> ...
> NetworkManager-nm-device-ethernet.o: In function `ip4_match_config':
> /home/sledz/work/OE-testing/tmp.6/work/armv5te-angstrom-linux-gnueabi/networkmanager-0.8.1-r2/NetworkManager-0.8.1/src/nm-device-ethernet.c:1624: undefined reference to `rtnl_addr_alloc_cache'
> NetworkManager-nm-device-ethernet.o: In function `check_one_address':
> /home/sledz/work/OE-testing/tmp.6/work/armv5te-angstrom-linux-gnueabi/networkmanager-0.8.1-r2/NetworkManager-0.8.1/src/nm-device-ethernet.c:1571: undefined reference to `rtnl_addr_get_ifindex'
> /home/sledz/work/OE-testing/tmp.6/work/armv5te-angstrom-linux-gnueabi/networkmanager-0.8.1-r2/NetworkManager-0.8.1/src/nm-device-ethernet.c:1573: undefined reference to `rtnl_addr_get_family'
> /home/sledz/work/OE-testing/tmp.6/work/armv5te-angstrom-linux-gnueabi/networkmanager-0.8.1-r2/NetworkManager-0.8.1/src/nm-device-ethernet.c:1576: undefined reference to `rtnl_addr_get_prefixlen'
> /home/sledz/work/OE-testing/tmp.6/work/armv5te-angstrom-linux-gnueabi/networkmanager-0.8.1-r2/NetworkManager-0.8.1/src/nm-device-ethernet.c:1579: undefined reference to `rtnl_addr_get_local'
> ...
> <some more errors of the kind>
> ...
> ./backends/.libs/libnmbackend.a(libnmbackend_la-NetworkManagerGeneric.o): In function `nm_generic_enable_loopback':
> /home/sledz/work/OE-testing/tmp.6/work/armv5te-angstrom-linux-gnueabi/networkmanager-0.8.1-r2/NetworkManager-0.8.1/src/backends/NetworkManagerGeneric.c:70: undefined reference to `rtnl_addr_alloc'
> /home/sledz/work/OE-testing/tmp.6/work/armv5te-angstrom-linux-gnueabi/networkmanager-0.8.1-r2/NetworkManager-0.8.1/src/backends/NetworkManagerGeneric.c:78: undefined reference to `rtnl_addr_set_local'
> /home/sledz/work/OE-testing/tmp.6/work/armv5te-angstrom-linux-gnueabi/networkmanager-0.8.1-r2/NetworkManager-0.8.1/src/backends/NetworkManagerGeneric.c:85: undefined reference to `rtnl_addr_set_broadcast'
> /home/sledz/work/OE-testing/tmp.6/work/armv5te-angstrom-linux-gnueabi/networkmanager-0.8.1-r2/NetworkManager-0.8.1/src/backends/NetworkManagerGeneric.c:88: undefined reference to `rtnl_addr_set_prefixlen'
> /home/sledz/work/OE-testing/tmp.6/work/armv5te-angstrom-linux-gnueabi/networkmanager-0.8.1-r2/NetworkManager-0.8.1/src/backends/NetworkManagerGeneric.c:89: undefined reference to `rtnl_addr_set_ifindex'
> /home/sledz/work/OE-testing/tmp.6/work/armv5te-angstrom-linux-gnueabi/networkmanager-0.8.1-r2/NetworkManager-0.8.1/src/backends/NetworkManagerGeneric.c:90: undefined reference to `rtnl_addr_set_scope'
> /home/sledz/work/OE-testing/tmp.6/work/armv5te-angstrom-linux-gnueabi/networkmanager-0.8.1-r2/NetworkManager-0.8.1/src/backends/NetworkManagerGeneric.c:91: undefined reference to `rtnl_addr_set_label'
> /home/sledz/work/OE-testing/tmp.6/work/armv5te-angstrom-linux-gnueabi/networkmanager-0.8.1-r2/NetworkManager-0.8.1/src/backends/NetworkManagerGeneric.c:93: undefined reference to `rtnl_addr_add'
> /home/sledz/work/OE-testing/tmp.6/work/armv5te-angstrom-linux-gnueabi/networkmanager-0.8.1-r2/NetworkManager-0.8.1/src/backends/NetworkManagerGeneric.c:100: undefined reference to `rtnl_addr_put'
> collect2: ld returned 1 exit status
> make[4]: *** [NetworkManager] Error 1
> make[4]: Leaving directory `/home/sledz/work/OE-testing/tmp.6/work/armv5te-angstrom-linux-gnueabi/networkmanager-0.8.1-r2/NetworkManager-0.8.1/src'
> make[3]: *** [all-recursive] Error 1
> make[3]: Leaving directory `/home/sledz/work/OE-testing/tmp.6/work/armv5te-angstrom-linux-gnueabi/networkmanager-0.8.1-r2/NetworkManager-0.8.1/src'
> make[2]: *** [all] Error 2
> make[2]: Leaving directory `/home/sledz/work/OE-testing/tmp.6/work/armv5te-angstrom-linux-gnueabi/networkmanager-0.8.1-r2/NetworkManager-0.8.1/src'
> make[1]: *** [all-recursive] Error 1
> make[1]: Leaving directory `/home/sledz/work/OE-testing/tmp.6/work/armv5te-angstrom-linux-gnueabi/networkmanager-0.8.1-r2/NetworkManager-0.8.1'
> make: *** [all] Error 2

That's the mess that happens when both libnl and libnl2 are present in
sysroots :(
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFNZOANMkyGM64RGpERAgfFAKCGoPd/MGHNFRfD0NV4+Wo2Gl73uwCdFgkp
H2/zXgTu149x2mjGgB5eXVY=
=Kgps
-----END PGP SIGNATURE-----



