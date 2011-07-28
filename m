Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QmLFa-00009R-Cz for openembedded-devel@lists.openembedded.org;
	Thu, 28 Jul 2011 09:43:22 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QmLBS-0002jO-Tz for openembedded-devel@lists.openembedded.org;
	Thu, 28 Jul 2011 09:39:06 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Jul 2011 09:39:06 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Jul 2011 09:39:06 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Thu, 28 Jul 2011 09:38:53 +0200
Message-ID: <j0r3md$jq5$1@dough.gmane.org>
References: <4E3104D3.7050702@dresearch-fe.de>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:5.0) Gecko/20110624 Thunderbird/5.0
In-Reply-To: <4E3104D3.7050702@dresearch-fe.de>
X-Enigmail-Version: 1.2
Subject: Re: [2011.03-maintenance] Problem building gcc
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
X-List-Received-Date: Thu, 28 Jul 2011 07:43:22 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 28-07-11 08:42, Steffen Sledz schreef:
> I've problems building gcc from the 2011.03-maintenance branch. The do_install step fails with
> 
> | + mv '/home/sledz/work/angstrom-setup-scripts/build/tmp-angstrom_2008_1/work/armv7a-angstrom-linux-gnueabi/gcc-4.3.3-r24.1/image/usr/lib/libstdc++.so.*-gdb.py*'
> /home/sledz/work/angstrom-setup-scripts/build/tmp-angstrom_2008_1/work/armv7a-angstrom-linux-gnueabi/gcc-4.3.3-r24.1/image/usr/share/gdb/auto-load/usr/lib | mv: cannot stat
> `/home/sledz/work/angstrom-setup-scripts/build/tmp-angstrom_2008_1/work/armv7a-angstrom-linux-gnueabi/gcc-4.3.3-r24.1/image/usr/lib/libstdc++.so.*-gdb.py*': No such file or directory NOTE: package gcc-4.3.3-r24.1: task do_install: Failed ERROR: Function 'do_install' failed (see
> /home/sledz/work/angstrom-setup-scripts/build/tmp-angstrom_2008_1/work/armv7a-angstrom-linux-gnueabi/gcc-4.3.3-r24.1/temp/log.do_install.14408 for further information) ERROR: Task 2 (/home/sledz/work/angstrom-setup-scripts/sources/openembedded/recipes/gcc/gcc_4.3.3.bb, do_install) failed with
> exit code '1' ERROR: '/home/sledz/work/angstrom-setup-scripts/sources/openembedded/recipes/gcc/gcc_4.3.3.bb' failed
> 
> A way to reproduce the problem is using the current Ångström oebb.sh script:
> 
> MACHINE=beagleboard ./oebb.sh bitbake gcc
> 
> My build host is running a 64-bit openSUSE 11.4.
> 

Can you try:

diff --git a/recipes/gcc/gcc-package-target.inc b/recipes/gcc/gcc-package-target.inc
index 33567da..7d3f4ae 100644
- --- a/recipes/gcc/gcc-package-target.inc
+++ b/recipes/gcc/gcc-package-target.inc
@@ -171,5 +171,5 @@ GROUP ( libgcc_s.so.1 libgcc.a )" > ${D}${libdir}/libgcc_s.so
        rm -rf ${D}${includedir}/c++/${BINV}/${TARGET_SYS}/bits/*.gch
        # move the gdb python helpers to gdb auto-load directory
        install -d ${D}${datadir}/gdb/auto-load/${libdir}
- -       mv ${D}${libdir}/libstdc++.so.*-gdb.py* ${D}${datadir}/gdb/auto-load${libdir}
+       mv ${D}${libdir}/libstdc++.so.*-gdb.py* ${D}${datadir}/gdb/auto-load${libdir} || true
 }
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFOMRINMkyGM64RGpERAmHUAJ9ujUhTt4aw9jT49EaNRY7cUuD7hgCeOsBJ
vcTtJYmXd5igGAygUTQr5Og=
=nwkq
-----END PGP SIGNATURE-----



