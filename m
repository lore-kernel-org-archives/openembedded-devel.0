Received: from tx2ehsobe005.messaging.microsoft.com ([65.55.88.15]
	helo=TX2EHSOBE010.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Soumya.R@kpitcummins.com>) id 1OJkR7-00060w-AG
	for openembedded-devel@lists.openembedded.org;
	Wed, 02 Jun 2010 11:40:34 +0200
Received: from mail37-tx2-R.bigfish.com (10.9.14.252) by
	TX2EHSOBE010.bigfish.com (10.9.40.30) with Microsoft SMTP Server id
	8.1.340.0; Wed, 2 Jun 2010 09:21:14 +0000
Received: from mail37-tx2 (localhost.localdomain [127.0.0.1])	by
	mail37-tx2-R.bigfish.com (Postfix) with ESMTP id BD4D1DA05D7;
	Wed,  2 Jun 2010 09:21:13 +0000 (UTC)
X-SpamScore: -2
X-BigFish: VPS-2(z1857rz14ffO1443Nzz1202hz4fhzz32i2a8h61h)
Received: from mail37-tx2 (localhost.localdomain [127.0.0.1]) by mail37-tx2
	(MessageSwitch) id 1275470473247254_19021;
	Wed,  2 Jun 2010 09:21:13 +0000 (UTC)
Received: from TX2EHSMHS040.bigfish.com (unknown [10.9.14.241])	by
	mail37-tx2.bigfish.com (Postfix) with ESMTP id 2C9B2B004C;
	Wed,  2 Jun 2010 09:21:13 +0000 (UTC)
Received: from Kcinpunhjhc01.kpit.com (203.197.93.240) by
	TX2EHSMHS040.bigfish.com (10.9.99.140) with Microsoft SMTP Server (TLS)
	id 14.0.482.44; Wed, 2 Jun 2010 09:21:11 +0000
Received: from Kcinpunhjcms01.kpit.com ([169.254.1.87]) by
	Kcinpunhjhc01.kpit.com ([172.10.16.123]) with mapi;
	Wed, 2 Jun 2010 14:51:07 +0530
From: Soumya R <Soumya.R@kpitcummins.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Wed, 2 Jun 2010 14:50:13 +0530
Thread-Topic: ERROR: function do_package_update_index_ipk failed
Thread-Index: AQHLAjTqDSqw5cbCMk+vHh45+MHEWw==
Message-ID: <76E258664B189C4CBEF125491CA11ECC9445E0CF86@KCINPUNHJCMS01.kpit.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
X-Reverse-DNS: Kcinpunhjhc01.kpit.com
X-SA-Exim-Connect-IP: 65.55.88.15
X-SA-Exim-Mail-From: Soumya.R@kpitcummins.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,WEIRD_PORT autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: "angstrom-distro-devel@linuxtogo.org" <angstrom-distro-devel@linuxtogo.org>
Subject: ERROR: function do_package_update_index_ipk failed
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
X-List-Received-Date: Wed, 02 Jun 2010 09:40:34 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi All,

   I am running bibake micro-image i got the following error,

NOTE: Running task 965 of 970 (ID: 93, /home/likewise-open/KPIT/soumyar/oe/=
openembedded/recipes/mtd/mtd-utils-native_1.3.1.bb, do_package_write)
NOTE: Running task 966 of 970 (ID: 18, /home/likewise-open/KPIT/soumyar/oe/=
openembedded/recipes/images/micro-image.bb, do_package_update_index_ipk)
ERROR: function do_package_update_index_ipk failed
ERROR: log data follows (/home/likewise-open/KPIT/soumyar/oe/build/tmp/work=
/at91sam9263ek-angstrom-linux-gnueabi/micro-image-1.0-r0/temp/log.do_packag=
e_update_index_ipk.24831)
| + ipkgarchs=3D'all any noarch arm  armv4 armv4t armv5te at91sam9263ek'
| + '[' '!' -z '' ']'
| + mkdir -p /home/likewise-open/KPIT/soumyar/oe/build/tmp/deploy/glibc/ipk
| + touch /home/likewise-open/KPIT/soumyar/oe/build/tmp/deploy/glibc/ipk/Pa=
ckages
| + ipkg-make-index -r /home/likewise-open/KPIT/soumyar/oe/build/tmp/deploy=
/glibc/ipk/Packages -p /home/likewise-open/KPIT/soumyar/oe/build/tmp/deploy=
/glibc/ipk/Packages -l /home/likewise-open/KPIT/soumyar/oe/build/tmp/deploy=
/glibc/ipk/Packages.filelist -m /home/likewise-open/KPIT/soumyar/oe/build/t=
mp/deploy/glibc/ipk
| /home/likewise-open/KPIT/soumyar/oe/build/tmp/sysroots/i686-linux/usr/bin=
/ipkg.py:39: DeprecationWarning: the md5 module is deprecated; use hashlib =
instead
|   import md5
|
| + for arch in '$ipkgarchs'
| + '[' -e /home/likewise-open/KPIT/soumyar/oe/build/tmp/deploy/glibc/ipk/a=
ll/ ']'
| + touch /home/likewise-open/KPIT/soumyar/oe/build/tmp/deploy/glibc/ipk/al=
l/Packages
| + ipkg-make-index -r /home/likewise-open/KPIT/soumyar/oe/build/tmp/deploy=
/glibc/ipk/all/Packages -p /home/likewise-open/KPIT/soumyar/oe/build/tmp/de=
ploy/glibc/ipk/all/Packages -l /home/likewise-open/KPIT/soumyar/oe/build/tm=
p/deploy/glibc/ipk/all/Packages.filelist -m /home/likewise-open/KPIT/soumya=
r/oe/build/tmp/deploy/glibc/ipk/all/
| /home/likewise-open/KPIT/soumyar/oe/build/tmp/sysroots/i686-linux/usr/bin=
/ipkg.py:39: DeprecationWarning: the md5 module is deprecated; use hashlib =
instead
|   import md5
| Traceback (most recent call last):
|   File "/home/likewise-open/KPIT/soumyar/oe/build/tmp/sysroots/i686-linux=
/usr/bin/ipkg-make-index", line 114, in <module>
|     pkg =3D ipkg.Package(filename)
|   File "/home/likewise-open/KPIT/soumyar/oe/build/tmp/sysroots/i686-linux=
/usr/bin/ipkg.py", line 161, in __init__
|     tarStream =3D ar.open("control.tar.gz")
|   File "/home/likewise-open/KPIT/soumyar/oe/build/tmp/sysroots/i686-linux=
/usr/bin/arfile.py", line 59, in open
|     f =3D self._scan(fname)
|   File "/home/likewise-open/KPIT/soumyar/oe/build/tmp/sysroots/i686-linux=
/usr/bin/arfile.py", line 79, in _scan
|     size =3D int(descriptor[5])
| IndexError: list index out of range
NOTE: Task failed: /home/likewise-open/KPIT/soumyar/oe/build/tmp/work/at91s=
am9263ek-angstrom-linux-gnueabi/micro-image-1.0-r0/temp/log.do_package_upda=
te_index_ipk.24831
ERROR: TaskFailed event exception, aborting
ERROR: Build of /home/likewise-open/KPIT/soumyar/oe/openembedded/recipes/im=
ages/micro-image.bb do_package_update_index_ipk failed
NOTE: Running task 967 of 970 (ID: 95, /home/likewise-open/KPIT/soumyar/oe/=
openembedded/recipes/mtd/mtd-utils-native_1.3.1.bb, do_package_stage)
ERROR: Task 18 (/home/likewise-open/KPIT/soumyar/oe/openembedded/recipes/im=
ages/micro-image.bb, do_package_update_index_ipk) failed
NOTE: Waiting for 1 active tasks to finish
NOTE: 1: /home/likewise-open/KPIT/soumyar/oe/openembedded/recipes/mtd/mtd-u=
tils-native_1.3.1.bb, do_package_stage (24841)
NOTE: Tasks Summary: Attempted 965 tasks of which 927 didn't need to be rer=
un and 1 failed.
ERROR: '/home/likewise-open/KPIT/soumyar/oe/openembedded/recipes/images/mic=
ro-image.bb' failed
KPIT\soumyar@d-5289lnx:~/oe/build$

   Anybody can help me out to resolve this.Any suggestions are welcome:-)

Thanks in advance:-)

Regards,
Soumya



