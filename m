Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mickael.chazaux@gmail.com>) id 1Prvy1-0004bc-I6
	for openembedded-devel@lists.openembedded.org;
	Tue, 22 Feb 2011 18:24:05 +0100
Received: by vws4 with SMTP id 4so1456959vws.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Feb 2011 09:22:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:date:message-id:subject:from:to
	:content-type; bh=5qPQnsCsceJgEMgCr3wyUJC1RccBZYxqe14LKc1AplY=;
	b=P/KQsBPL7fGRddBYqXKhQWzkCw1taV7GCRJGggkSQrtOSeMDkMRToLFgoE2rM7fdcj
	kjtsravGGX37cTKlx04Dq8zPdKd5Q9dl+WYpbC83BOfkAiW1uqEc2L145ne/cmzIlCCp
	v5dMpitOfeGIN1douZbtgJE0qnmofHtSFJ2C0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=GZWFadmi+4XyTkLYPnTNhRHPjvaY7kxc4PenJojhIoRRXeqR2VyJPxqLT6eF6C4Xrc
	D65F9kcLJ4tO8j+ulCnVop6gNd2F7wfWOd9mzCRZEeVQ4f3guET+3lVp1YgJO5gOlnCJ
	3fhHzZtlJzmgAdgP8H0eUiWljess/EJLyn8/o=
MIME-Version: 1.0
Received: by 10.52.167.42 with SMTP id zl10mr4320056vdb.299.1298395366132;
	Tue, 22 Feb 2011 09:22:46 -0800 (PST)
Received: by 10.220.180.7 with HTTP; Tue, 22 Feb 2011 09:22:46 -0800 (PST)
Date: Tue, 22 Feb 2011 18:22:46 +0100
Message-ID: <AANLkTimy_TtONvPFjaGCUV0qxaM7qF0ENBx7A6wzRnPZ@mail.gmail.com>
From: Mickael Chazaux <mickael.chazaux@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Weird behaviour with PPP
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
X-List-Received-Date: Tue, 22 Feb 2011 17:24:06 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

I have a hard time figuring out why bitbake seems to mix versions of
ppp... Any ideas?

Regards,

Mickael

mc@ubuntu:~/OE/openembedded/recipes/ppp$ bitbake -b ppp_2.4.5.bb
NOTE: Preparing runqueue
NOTE: Executing runqueue
NOTE: Removing stamps: /home/mc/OE/tmp/stamps/i686-angstrom-linux/ppp-2.4.5-r1.*
NOTE: Running task 1 of 19 (ID: 11,
/home/mc/OE/openembedded/recipes/ppp/ppp_2.4.5.bb, do_setscene)
NOTE: Running task 2 of 19 (ID: 9,
/home/mc/OE/openembedded/recipes/ppp/ppp_2.4.5.bb, do_fetch)
NOTE: Running task 3 of 19 (ID: 0,
/home/mc/OE/openembedded/recipes/ppp/ppp_2.4.5.bb, do_unpack)
NOTE: Running task 4 of 19 (ID: 15,
/home/mc/OE/openembedded/recipes/ppp/ppp_2.4.5.bb,
do_distribute_sources)
NOTE: Unpacking ../../../sources/ppp-2.4.5.tar.gz to
../../../tmp/work/i686-angstrom-linux/ppp-2.4.5-r1/
NOTE: Unpacking files/pon to ../../../tmp/work/i686-angstrom-linux/ppp-2.4.5-r1/
NOTE: Unpacking files/poff to
../../../tmp/work/i686-angstrom-linux/ppp-2.4.5-r1/
NOTE: Unpacking files/init to
../../../tmp/work/i686-angstrom-linux/ppp-2.4.5-r1/
NOTE: Unpacking files/ip-up to
../../../tmp/work/i686-angstrom-linux/ppp-2.4.5-r1/
NOTE: Unpacking files/ip-down to
../../../tmp/work/i686-angstrom-linux/ppp-2.4.5-r1/
NOTE: Unpacking files/08setupdns to
../../../tmp/work/i686-angstrom-linux/ppp-2.4.5-r1/
NOTE: Unpacking files/92removedns to
../../../tmp/work/i686-angstrom-linux/ppp-2.4.5-r1/
NOTE: Running task 5 of 19 (ID: 1,
/home/mc/OE/openembedded/recipes/ppp/ppp_2.4.5.bb, do_patch)
NOTE: Applying patch 'ppp-2.4.4-mppe-mppc.1.1.patch'
(ppp-2.4.5/ppp-2.4.4-mppe-mppc.1.1.patch)
NOTE: Applying patch 'makefile.patch' (ppp-2.4.5/makefile.patch)
NOTE: Applying patch 'cifdefroute.patch' (ppp-2.4.5/cifdefroute.patch)
NOTE: Applying patch 'pppd-resolv-varrun.patch'
(ppp-2.4.5/pppd-resolv-varrun.patch)
NOTE: Applying patch 'enable-ipv6.patch' (ppp-2.4.5/enable-ipv6.patch)
NOTE: Applying patch 'makefile-remove-hard-usr-reference.patch'
(ppp-2.4.5/makefile-remove-hard-usr-reference.patch)
NOTE: Applying patch 'ldflags.patch' (ppp-2.4.5/ldflags.patch)
NOTE: Running task 6 of 19 (ID: 12,
/home/mc/OE/openembedded/recipes/ppp/ppp_2.4.5.bb, do_configure)
NOTE: Running task 7 of 19 (ID: 13,
/home/mc/OE/openembedded/recipes/ppp/ppp_2.4.5.bb, do_qa_configure)
NOTE: Running task 8 of 19 (ID: 14,
/home/mc/OE/openembedded/recipes/ppp/ppp_2.4.5.bb, do_compile)
NOTE: Running task 9 of 19 (ID: 2,
/home/mc/OE/openembedded/recipes/ppp/ppp_2.4.5.bb, do_install)
NOTE: Running task 10 of 19 (ID: 16,
/home/mc/OE/openembedded/recipes/ppp/ppp_2.4.5.bb, do_package)
NOTE: Running task 11 of 19 (ID: 3,
/home/mc/OE/openembedded/recipes/ppp/ppp_2.4.5.bb,
do_populate_sysroot)
cp: cannot create regular file
`/home/mc/OE/tmp/sysroots/i686-angstrom-linux/usr/lib/pppd/2.4.5/pppol2tp.so':
Permission denied
cp: cannot create regular file
`/home/mc/OE/tmp/sysroots/i686-angstrom-linux/usr/lib/pppd/2.4.5/rp-pppoe.so':
Permission denied
cp: cannot create regular file
`/home/mc/OE/tmp/sysroots/i686-angstrom-linux/usr/lib/pppd/2.4.5/pppoatm.so':
Permission denied
cp: cannot create regular file
`/home/mc/OE/tmp/sysroots/i686-angstrom-linux/usr/lib/pppd/2.4.5/openl2tp.so':
Permission denied
cp: cannot create regular file
`/home/mc/OE/tmp/sysroots/i686-angstrom-linux/usr/share/man/man8/pppd.8':
Permission denied
cp: cannot create regular file
`/home/mc/OE/tmp/sysroots/i686-angstrom-linux/usr/share/man/man8/pppstats.8':
Permission denied
cp: cannot create regular file
`/home/mc/OE/tmp/sysroots/i686-angstrom-linux/usr/share/man/man8/pppdump.8':
Permission denied
cp: cannot create regular file
`/home/mc/OE/tmp/sysroots/i686-angstrom-linux/usr/share/man/man8/pppd-radius.8':
Permission denied
cp: cannot create regular file
`/home/mc/OE/tmp/sysroots/i686-angstrom-linux/usr/share/man/man8/pppd-radattr.8':
Permission denied
NOTE: Running task 12 of 19 (ID: 4,
/home/mc/OE/openembedded/recipes/ppp/ppp_2.4.5.bb, do_qa_staging)
NOTE: the following files were installed but not shipped in any package:
NOTE:   /usr/lib/pppd/2.4.5/pppol2tp.so
NOTE:   /usr/lib/pppd/2.4.5/openl2tp.so
NOTE: Running task 13 of 19 (ID: 17,
/home/mc/OE/openembedded/recipes/ppp/ppp_2.4.5.bb,
do_package_write_ipk)
NOTE: Not creating empty archive for ppp-oa-2.4.3-r10.6
NOTE: Not creating empty archive for ppp-oe-2.4.3-r10.6
NOTE: Not creating empty archive for ppp-radius-2.4.3-r10.6
NOTE: Not creating empty archive for ppp-winbind-2.4.3-r10.6
NOTE: Not creating empty archive for ppp-minconn-2.4.3-r10.6
NOTE: Not creating empty archive for ppp-password-2.4.3-r10.6
NOTE: Not creating empty archive for ppp-tools-2.4.3-r10.6
Packaged contents of ppp-dbg into
/home/mc/OE/tmp/deploy/glibc/ipk/i686/ppp-dbg_2.4.3-r10.6_i686.ipk
NOTE: Not creating empty archive for ppp-2.4.3-r10.6
NOTE: Not creating empty archive for ppp-doc-2.4.3-r10.6
Packaged contents of ppp-dev into
/home/mc/OE/tmp/deploy/glibc/ipk/i686/ppp-dev_2.4.3-r10.6_i686.ipk
NOTE: Not creating empty archive for ppp-static-2.4.3-r10.6
NOTE: Not creating empty archive for ppp-locale-2.4.3-r10.6
NOTE: Running task 14 of 19 (ID: 5,
/home/mc/OE/openembedded/recipes/ppp/ppp_2.4.5.bb, do_package_write)
NOTE: Running task 15 of 19 (ID: 6,
/home/mc/OE/openembedded/recipes/ppp/ppp_2.4.5.bb, do_package_stage)
NOTE: Running task 16 of 19 (ID: 7,
/home/mc/OE/openembedded/recipes/ppp/ppp_2.4.5.bb,
do_package_stage_all)
NOTE: Running task 17 of 19 (ID: 10,
/home/mc/OE/openembedded/recipes/ppp/ppp_2.4.5.bb, do_build)
NOTE: Running task 18 of 19 (ID: 18,
/home/mc/OE/openembedded/recipes/ppp/ppp_2.4.5.bb, do_rm_work)
NOTE: Running task 19 of 19 (ID: 8,
/home/mc/OE/openembedded/recipes/ppp/ppp_2.4.5.bb, do_rm_work_all)
NOTE: Tasks Summary: Attempted 19 tasks of which 0 didn't need to be
rerun and 0 failed.


