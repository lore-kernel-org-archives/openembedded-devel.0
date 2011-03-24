Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Q2hSx-00023y-CV for openembedded-devel@lists.openembedded.org;
	Thu, 24 Mar 2011 11:08:31 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Q2h7A-0006M6-7j for openembedded-devel@lists.openembedded.org;
	Thu, 24 Mar 2011 10:46:00 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Mar 2011 10:46:00 +0100
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Mar 2011 10:46:00 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Thu, 24 Mar 2011 10:45:42 +0100
Message-ID: <imf3s6$rl0$1@dough.gmane.org>
References: <20110323162552.GH3418@jama.jama.net>	<1300899470-10514-1-git-send-email-Martin.Jansa@gmail.com>	<imdiri$aic$1@dough.gmane.org>	<20110323200206.GL3418@jama.jama.net>	<imf0s2$atc$1@dough.gmane.org>
	<20110324090223.GC20421@jama.jama.net>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <20110324090223.GC20421@jama.jama.net>
X-Enigmail-Version: 1.0.1
Subject: Re: [PATCH 1/2] libnl-1.1: rename to libnl1 and build only static lib
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
X-List-Received-Date: Thu, 24 Mar 2011 10:08:31 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 24-03-11 10:02, Martin Jansa wrote:
> On Thu, Mar 24, 2011 at 09:54:25AM +0100, Koen Kooi wrote:
> On 23-03-11 21:02, Martin Jansa wrote:
>>>> On Wed, Mar 23, 2011 at 08:49:06PM +0100, Koen Kooi wrote:
>>>> Can you regenerate this on top of .dev? I couldn't get it to apply, even
>>>> after renaming files -> libnl-1.1
>>>>
>>>>> Did you try to apply it on top of that 12patch series?
>>>>
>>>>> Or you can apply top 14 from
>>>>> http://gitorious.org/~jama/angstrom/jama-shr-experimental/
> 
> I applied the top 14, clean libnl* and nm, built libnl1 and libnl and I get:
> 
> ps/libip6_manager_la-nm-ip6-manager.Tpo -c nm-ip6-manager.c  -fPIC -DPIC
> -o .libs/libip6_manager_la-nm-ip6-manager.o
> | nm-ip6-manager.c: In function 'process_addr':
> | nm-ip6-manager.c:488:46: error: too few arguments to function
> 'nl_cache_include'
> |
> /OE/angstrom-setup-scripts/build/tmp-angstrom_2008_1/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/netlink/cache.h:64:14:
> note: declared here
> | nm-ip6-manager.c: In function 'process_route':
> | nm-ip6-manager.c:528:47: error: too few arguments to function
> 'nl_cache_include'
> |
> /OE/angstrom-setup-scripts/build/tmp-angstrom_2008_1/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/netlink/cache.h:64:14:
> note: declared here
> | nm-ip6-manager.c: In function 'nm_ip6_manager_get_ip6_config':
> | nm-ip6-manager.c:944:2: warning: passing argument 1 of
> 'nl_cache_refill' from incompatible pointer type
> |
> /OE/angstrom-setup-scripts/build/tmp-angstrom_2008_1/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/netlink/cache.h:56:14:
> note: expected 'struct nl_sock *' but argument is of type 'struct
> nl_handle *'
> | nm-ip6-manager.c:945:2: warning: passing argument 1 of
> 'nl_cache_refill' from incompatible pointer type
> |
> /OE/angstrom-setup-scripts/build/tmp-angstrom_2008_1/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/netlink/cache.h:56:14:
> note: expected 'struct nl_sock *' but argument is of type 'struct
> nl_handle *'
> | nm-ip6-manager.c:960:13: warning: assignment makes pointer from
> integer without a cast
> | nm-ip6-manager.c:985:3: error: too few arguments to function
> 'rtnl_route_get_metric'
> |
> /OE/angstrom-setup-scripts/build/tmp-angstrom_2008_1/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/netlink/route/route.h:83:12:
> note: declared here
> | nm-ip6-manager.c: In function 'nm_ip6_manager_init':
> | nm-ip6-manager.c:1073:2: warning: passing argument 1 of
> 'rtnl_addr_alloc_cache' from incompatible pointer type
> |
> /OE/angstrom-setup-scripts/build/tmp-angstrom_2008_1/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/netlink/route/addr.h:31:12:
> note: expected 'struct nl_sock *' but argument is ofERROR: Function
> 'do_compile' failed (see
> /OE/angstrom-setup-scripts/build/tmp-angstrom_2008_1/work/armv7a-angstrom-linux-gnueabi/networkmanager-0.8.1-r2/temp/log.do_compile.20022
> for further information)
> |  type 'struct nl_handle *'
> | nm-ip6-manager.c:1073:2: error: too few arguments to function
> 'rtnl_addr_alloc_cache'
> |
> /OE/angstrom-setup-scripts/build/tmp-angstrom_2008_1/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/netlink/route/addr.h:31:12:
> note: declared here
> | nm-ip6-manager.c:1074:2: warning: passing argument 1 of
> 'rtnl_route_alloc_cache' from incompatible pointer type
> |
> /OE/angstrom-setup-scripts/build/tmp-angstrom_2008_1/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/netlink/route/route.h:48:12:
> note: expected 'struct nl_sock *' but argument is of type 'struct
> nl_handle *'
> | nm-ip6-manager.c:1074:2: error: too few arguments to function
> 'rtnl_route_alloc_cache'
> |
> /OE/angstrom-setup-scripts/build/tmp-angstrom_2008_1/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/netlink/route/route.h:48:12:
> note: declared here
> | make[4]: *** [libip6_manager_la-nm-ip6-manager.lo] Error 1
> | make[4]: Leaving directory
> `/OE/angstrom-setup-scripts/build/tmp-angstrom_2008_1/work/armv7a-angstrom-linux-gnueabi/networkmanager-0.8.1-r2/NetworkManager-0.8.1/src/ip6-manager'
> | make[3]: *** [all-recursive] Error 1
> | make[3]: Leaving directory
> `/OE/angstrom-setup-scripts/build/tmp-angstrom_2008_1/work/armv7a-angstrom-linux-gnueabi/networkmanager-0.8.1-r2/NetworkManager-0.8.1/src'
> | make[2]: *** [all] Error 2
> | make[2]: Leaving directory
> `/OE/angstrom-setup-scripts/build/tmp-angstrom_2008_1/work/armv7a-angstrom-linux-gnueabi/networkmanager-0.8.1-r2/NetworkManager-0.8.1/src'
> | make[1]: *** [all-recursive] Error 1
> | make[1]: Leaving directory
> `/OE/angstrom-setup-scripts/build/tmp-angstrom_2008_1/work/armv7a-angstrom-linux-gnueabi/networkmanager-0.8.1-r2/NetworkManager-0.8.1'
> | make: *** [all] Error 2
> | + die 'oe_runmake failed'
> | + oefatal 'oe_runmake failed'
> | + echo FATAL: 'oe_runmake failed'
> | FATAL: oe_runmake failed
> | + exit 1
> 
> So there still is a header clash by the looks of it. Did I miss a patch?
> 
>> I've fixed nm only in
>> recipes/networkmanager/networkmanager_git.bb
>> where was
>> DEFAULT_PREFERENCE_angstrom = "1"
>> and highest PV
> 
>> this looks like
>> recipes/networkmanager/networkmanager_0.8.1.bb
>> and exactly same errors like I had with git version (backend subdir will
>> be next to fail)
> 
>> you can add/adapt
>> recipes/networkmanager/networkmanager/0001-respect-libnl-flags-also-in-backends-ip6-manager.patch
>> if you need 0.8.1 too

That worked!

I will adapt it since I'd like this to go into 2011.03-maintenance as well.

Patch is here:
http://dominion.thruhere.net/koen/angstrom/0001-networkmanager-0.8.1-fix-build-against-libl-using-th.patch

For the whole series:

Acked-by: Koen Kooi <koen@dominion.thruhere.net>

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFNixLGMkyGM64RGpERAihzAJ9RVZzfyPnOYyEGM0K5AcmIsXz/BQCaA39i
MoqqmxpHxqlyUNj8pQCocBk=
=leDh
-----END PGP SIGNATURE-----



