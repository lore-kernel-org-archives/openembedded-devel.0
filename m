Received: from tx2ehsobe001.messaging.microsoft.com ([65.55.88.11]
	helo=TX2EHSOBE001.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Soumya.R@kpitcummins.com>) id 1OJQbA-0007E0-L4
	for openembedded-devel@lists.openembedded.org;
	Tue, 01 Jun 2010 14:29:43 +0200
Received: from mail129-tx2-R.bigfish.com (10.9.14.242) by
	TX2EHSOBE001.bigfish.com (10.9.40.21) with Microsoft SMTP Server id
	8.1.340.0; Tue, 1 Jun 2010 12:10:14 +0000
Received: from mail129-tx2 (localhost.localdomain [127.0.0.1])	by
	mail129-tx2-R.bigfish.com (Postfix) with ESMTP id BE0E42583AD	for
	<openembedded-devel@lists.openembedded.org>;
	Tue,  1 Jun 2010 12:10:11 +0000 (UTC)
X-SpamScore: -22
X-BigFish: VPS-22(zz14e3M14ffO936eM1443Nzz1202hz4fhzz32i2a8h43h63h)
Received: from mail129-tx2 (localhost.localdomain [127.0.0.1]) by mail129-tx2
	(MessageSwitch) id 1275394210792354_19670;
	Tue,  1 Jun 2010 12:10:10 +0000 (UTC)
Received: from TX2EHSMHS023.bigfish.com (unknown [10.9.14.235])	by
	mail129-tx2.bigfish.com (Postfix) with ESMTP id B33EC137804D	for
	<openembedded-devel@lists.openembedded.org>;
	Tue,  1 Jun 2010 12:10:10 +0000 (UTC)
Received: from kcinpunhjhc02.kpit.com (220.225.38.51) by
	TX2EHSMHS023.bigfish.com (10.9.99.123) with Microsoft SMTP Server (TLS)
	id 14.0.482.44; Tue, 1 Jun 2010 12:10:06 +0000
Received: from Kcinpunhjcms01.kpit.com ([169.254.1.87]) by
	kcinpunhjhc02.kpit.com ([172.10.16.124]) with mapi;
	Tue, 1 Jun 2010 17:35:52 +0530
From: Soumya R <Soumya.R@kpitcummins.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Tue, 1 Jun 2010 17:35:03 +0530
Thread-Topic: glibc_2.9.bb do_package failed
Thread-Index: AQHLAYD4l125KgZce0GpPJVYRQkbaJJtAlR9
Message-ID: <76E258664B189C4CBEF125491CA11ECC9445E0CF7D@KCINPUNHJCMS01.kpit.com>
References: <76E258664B189C4CBEF125491CA11ECC9445E0CF7C@KCINPUNHJCMS01.kpit.com>
In-Reply-To: <76E258664B189C4CBEF125491CA11ECC9445E0CF7C@KCINPUNHJCMS01.kpit.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
X-Reverse-DNS: unknown
X-SA-Exim-Connect-IP: 65.55.88.11
X-SA-Exim-Mail-From: Soumya.R@kpitcummins.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: glibc_2.9.bb do_package failed
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
X-List-Received-Date: Tue, 01 Jun 2010 12:30:20 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi All,

       I am new to open embedded .. I am configuring micro-image for arm9 p=
rocessor ..
when i run bitbake micro-image i get the following error.

NOTE: Gettext required but not in DEPENDS for file /home/likewise-open/KPIT=
/soumyar/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/gcc-cross-interme=
diate-4.3.3-r12.1/gcc-4.3.3/intl/configure.ac.
Missing inherit gettext?
NOTE: Running task 685 of 957 (ID: 535, /home/likewise-open/KPIT/soumyar/oe=
/openembedded/recipes/gcc/gcc-cross-intermediate_4.3.3.bb, do_compile)
NOTE: Running task 686 of 957 (ID: 529, /home/likewise-open/KPIT/soumyar/oe=
/openembedded/recipes/gcc/gcc-cross-intermediate_4.3.3.bb, do_install)
NOTE: Running task 687 of 957 (ID: 530, /home/likewise-open/KPIT/soumyar/oe=
/openembedded/recipes/gcc/gcc-cross-intermediate_4.3.3.bb, do_populate_sysr=
oot)
NOTE: Running task 688 of 957 (ID: 537, /home/likewise-open/KPIT/soumyar/oe=
/openembedded/recipes/gcc/gcc-cross-intermediate_4.3.3.bb, do_package)
NOTE: Running task 689 of 957 (ID: 539, /home/likewise-open/KPIT/soumyar/oe=
/openembedded/recipes/gcc/gcc-cross-intermediate_4.3.3.bb, do_package_write=
_ipk)
NOTE: Running task 690 of 957 (ID: 156, /home/likewise-open/KPIT/soumyar/oe=
/openembedded/recipes/glibc/glibc_2.9.bb, do_configure)
NOTE: Running task 691 of 957 (ID: 536, /home/likewise-open/KPIT/soumyar/oe=
/openembedded/recipes/gcc/gcc-cross-intermediate_4.3.3.bb, do_package_write=
)
NOTE: Running task 692 of 957 (ID: 538, /home/likewise-open/KPIT/soumyar/oe=
/openembedded/recipes/gcc/gcc-cross-intermediate_4.3.3.bb, do_package_stage=
)
NOTE: Running task 693 of 957 (ID: 157, /home/likewise-open/KPIT/soumyar/oe=
/openembedded/recipes/glibc/glibc_2.9.bb, do_qa_configure)
NOTE: Running task 694 of 957 (ID: 158, /home/likewise-open/KPIT/soumyar/oe=
/openembedded/recipes/glibc/glibc_2.9.bb, do_compile)
NOTE: Running task 695 of 957 (ID: 152, /home/likewise-open/KPIT/soumyar/oe=
/openembedded/recipes/glibc/glibc_2.9.bb, do_install)
NOTE: Running task 696 of 957 (ID: 153, /home/likewise-open/KPIT/soumyar/oe=
/openembedded/recipes/glibc/glibc_2.9.bb, do_populate_sysroot)
NOTE: Running task 697 of 957 (ID: 160, /home/likewise-open/KPIT/soumyar/oe=
/openembedded/recipes/glibc/glibc_2.9.bb, do_package)
NOTE: preparing tree for binary locale generation
NOTE: Running task 698 of 957 (ID: 142, /home/likewise-open/KPIT/soumyar/oe=
/openembedded/recipes/gcc/gcc-cross_4.3.3.bb, do_configure)
NOTE: generating locale es_NI (UTF-8)
NOTE: Running task 699 of 957 (ID: 143, /home/likewise-open/KPIT/soumyar/oe=
/openembedded/recipes/gcc/gcc-cross_4.3.3.bb, do_qa_configure)
NOTE: Gettext required but not in DEPENDS for file /home/likewise-open/KPIT=
/soumyar/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/gcc-cross-4.3.3-r=
12.1/gcc-4.3.3/intl/configure.ac.
Missing inherit gettext?
NOTE: Running task 700 of 957 (ID: 144, /home/likewise-open/KPIT/soumyar/oe=
/openembedded/recipes/gcc/gcc-cross_4.3.3.bb, do_compile)
qemu-arm: relocation error: qemu-arm: symbol fcntl, version GLIBC_2.0 not d=
efined in file libpthread.so.0 with link time reference
NOTE: Task failed: localedef returned an error (command was PATH=3D"/home/l=
ikewise-open/KPIT/soumyar/oe/build/tmp/sysroots/i686-linux/usr/bin/armv5te-=
angstrom-linux-gnueabi:/home/likewise-open/KPIT/soumyar/oe/build/tmp/sysroo=
ts/i686-linux/usr/bin/armv5te-angstrom-linux-gnueabi:/home/likewise-open/KP=
IT/soumyar/oe/build/tmp/sysroots/i686-linux/usr/sbin:/home/likewise-open/KP=
IT/soumyar/oe/build/tmp/sysroots/i686-linux/usr/bin:/home/likewise-open/KPI=
T/soumyar/oe/build/tmp/cross/armv5te//bin:/home/likewise-open/KPIT/soumyar/=
oe/build/tmp/sysroots/i686-linux/sbin:/home/likewise-open/KPIT/soumyar/oe/b=
uild/tmp/sysroots/i686-linux/bin:/likewise-open/KPIT/soumyar/oe/bitbake/bin=
:/likewise-open/KPIT/soumyar/oe/bitbake/bin:/likewise-open/KPIT/soumyar/oe/=
bitbake/bin:/home/likewise-open/KPIT/soumyar/bin:/usr/local/sbin:/usr/local=
/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games" I18NPATH=3D"/home/likewise-o=
pen/KPIT/soumyar/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/glibc-2.9=
-r36.3/locale-tree/usr/share/i18n" qemu-arm -s 1048576 -r 2.6.24 -L /home/l=
ikewise-open/KPIT/soumyar/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/=
glibc-2.9-r36.3/locale-tree -E LD_LIBRARY_PATH=3D/home/likewise-open/KPIT/s=
oumyar/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/glibc-2.9-r36.3/loc=
ale-tree/lib  /home/likewise-open/KPIT/soumyar/oe/build/tmp/work/armv5te-an=
gstrom-linux-gnueabi/glibc-2.9-r36.3/locale-tree/bin/localedef --force --ol=
d-style --no-archive --prefix=3D/home/likewise-open/KPIT/soumyar/oe/build/t=
mp/work/armv5te-angstrom-linux-gnueabi/glibc-2.9-r36.3/locale-tree --inputf=
ile=3D/usr/share/i18n/locales/es_NI --charmap=3DUTF-8 es_NI).
ERROR: TaskFailed event exception, aborting
ERROR: Build of /home/likewise-open/KPIT/soumyar/oe/openembedded/recipes/gl=
ibc/glibc_2.9.bb do_package failed
ERROR: Task 160 (/home/likewise-open/KPIT/soumyar/oe/openembedded/recipes/g=
libc/glibc_2.9.bb, do_package) failed
NOTE: Waiting for 1 active tasks to finish
NOTE: 1: /home/likewise-open/KPIT/soumyar/oe/openembedded/recipes/gcc/gcc-c=
ross_4.3.3.bb, do_compile (6409)
NOTE: Tasks Summary: Attempted 698 tasks of which 0 didn't need to be rerun=
 and 1 failed.
ERROR: '/home/likewise-open/KPIT/soumyar/oe/openembedded/recipes/glibc/glib=
c_2.9.bb' failed

          Please help me out to resolve this i goggled but could not find t=
he solution..

Thanks in advance:-)

Regards,
Soumya



