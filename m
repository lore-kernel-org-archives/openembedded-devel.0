Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Ou0VX-0003AO-Dt
	for openembedded-devel@openembedded.org; Fri, 10 Sep 2010 12:07:00 +0200
Received: by iwn2 with SMTP id 2so2071336iwn.6
	for <openembedded-devel@openembedded.org>;
	Fri, 10 Sep 2010 03:06:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=Iqy+aFsi0o5E0z/nCX4eu0lcn8nwZyaP6aE1VX+TOCA=;
	b=vLBPHNpxWGfKh6nM1jUzNQcqsvUcTWd6MKb43Vo4EPw24UQuE0yCydQQP+b+tTezX6
	jtiy4Ij9JiSX7Sdu04xlWJirfOfFv2ass56Lk1Xjz/+XREf6TxFtGiZ4QTmwFpBK2arm
	y9kPGKpht/RqpK9iRAyJFjTyspT9tqT+X9Wjo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=Y6/UyGYLyFtjV5iZFHPCu6OciL1kXiehdcgc90KfbkNGi33rrN3EEEwgwPGD5we0xM
	pwBxYV/YBdifr/AQadK2okQ6Y/31rMPgTUHmatbUwxqgDJr/Gl52K31Pcw62Cj6FIzhE
	kOS+x3WjoS8Uu2csYYWmGFtlyJmXATs08VDC8=
MIME-Version: 1.0
Received: by 10.231.145.16 with SMTP id b16mr685655ibv.198.1284113175173; Fri,
	10 Sep 2010 03:06:15 -0700 (PDT)
Received: by 10.231.208.17 with HTTP; Fri, 10 Sep 2010 03:06:15 -0700 (PDT)
Date: Fri, 10 Sep 2010 12:06:15 +0200
Message-ID: <AANLkTik72iTQE0+_vJZPhDCC-fVxQTgPvVrYO1Jxb6Ph@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: testing: linux-ixp4xx-2.6.27.8+svnr1090-r2 strip issue
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
X-List-Received-Date: Fri, 10 Sep 2010 10:07:00 -0000
Content-Type: text/plain; charset=ISO-8859-1

distro: slugos
machine: nslu2be
while building slugos-image:

NOTE: package linux-ixp4xx-2.6.27.8+svnr1090-r2: task do_package: Started
ERROR: runstrip: ''armeb-linux-gnueabi-strip'
--remove-section=.comment --remove-section=.note
'/home/hudson/jobs/FM_test/workspace/tmp/work/nslu2be-linux-gnueabi/linux-ixp4xx-2.6.27.8+svnr1090-r2/package/kernel/scripts/bin2c''
strip command failed
ERROR: runstrip: ''armeb-linux-gnueabi-strip'
--remove-section=.comment --remove-section=.note
'/home/hudson/jobs/FM_test/workspace/tmp/work/nslu2be-linux-gnueabi/linux-ixp4xx-2.6.27.8+svnr1090-r2/package/kernel/scripts/kconfig/conf''
strip command failed
ERROR: runstrip: ''armeb-linux-gnueabi-strip'
--remove-section=.comment --remove-section=.note
'/home/hudson/jobs/FM_test/workspace/tmp/work/nslu2be-linux-gnueabi/linux-ixp4xx-2.6.27.8+svnr1090-r2/package/kernel/scripts/basic/fixdep''
strip command failed
ERROR: runstrip: ''armeb-linux-gnueabi-strip'
--remove-section=.comment --remove-section=.note
'/home/hudson/jobs/FM_test/workspace/tmp/work/nslu2be-linux-gnueabi/linux-ixp4xx-2.6.27.8+svnr1090-r2/package/kernel/scripts/basic/docproc''
strip command failed
ERROR: runstrip: ''armeb-linux-gnueabi-strip'
--remove-section=.comment --remove-section=.note
'/home/hudson/jobs/FM_test/workspace/tmp/work/nslu2be-linux-gnueabi/linux-ixp4xx-2.6.27.8+svnr1090-r2/package/kernel/scripts/genksyms/genksyms''
strip command failed
ERROR: runstrip: ''armeb-linux-gnueabi-strip'
--remove-section=.comment --remove-section=.note
'/home/hudson/jobs/FM_test/workspace/tmp/work/nslu2be-linux-gnueabi/linux-ixp4xx-2.6.27.8+svnr1090-r2/package/kernel/scripts/mod/mk_elfconfig''
strip command failed
ERROR: runstrip: ''armeb-linux-gnueabi-strip'
--remove-section=.comment --remove-section=.note
'/home/hudson/jobs/FM_test/workspace/tmp/work/nslu2be-linux-gnueabi/linux-ixp4xx-2.6.27.8+svnr1090-r2/package/kernel/scripts/mod/modpost''
strip command failed

Rest of the build seems fine.

...
NOTE: package slugos-image-1.0-r1: task do_rm_work_all: Succeeded
NOTE: Tasks Summary: Attempted 1226 tasks of which 0 didn't need to be
rerun and 0 failed.

Frans.

PS:
If someone has an idea how to get rid of this:

NOTE: the following files were installed but not shipped in any package:
NOTE:   /lib/modules/2.6.27.8/modules.order
NOTE:   /kernel/Makefile
NOTE:   /kernel/.config
NOTE:   /kernel/Module.symvers
NOTE:   /kernel/kernel-ccsuffix
NOTE:   /kernel/kernel-ldsuffix
NOTE:   /kernel/zImage
NOTE:   /kernel/System.map-2.6.27.8
NOTE:   /kernel/kernel-abiversion
NOTE:   /kernel/kernel-config
NOTE:   /kernel/kernel-source
NOTE:   /kernel/config-2.6.27.8
NOTE:   /kernel/vmlinux
NOTE:   /kernel/arch/arm/Makefile
NOTE:   /kernel/arch/arm/Kconfig-nommu
NOTE:   /kernel/arch/arm/Kconfig.debug
NOTE:   /kernel/arch/arm/Kconfig
NOTE:   /kernel/arch/arm/mach-mx3/pcm037.c
...

Apparently we install the whole source tree or so.


