Received: from srv10.nortechonline.net ([89.151.113.230]
	helo=mail.nortechonline.net) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Simon.Hodgson@nortechonline.co.uk>)
	id 1OJq9a-0000Zx-Mk for openembedded-devel@lists.openembedded.org;
	Wed, 02 Jun 2010 17:46:55 +0200
Received: from SRV10.nortechonline.net ([fe80::9484:2eae:c2a4:b737]) by
	SRV10.nortechonline.net ([fe80::9484:2eae:c2a4:b737%12]) with mapi;
	Wed, 2 Jun 2010 16:41:36 +0100
From: "Hodgson, Simon" <Simon.Hodgson@nortechonline.co.uk>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Wed, 2 Jun 2010 16:41:34 +0100
Thread-Topic: [oe] (no subject)
Thread-Index: AQHLAjS1fiPyD3truU+5SVhNMHrNiZJuz1jg
Message-ID: <AEB54AFF070EB34A921BC7E006B711BE11905D1147@SRV10.nortechonline.net>
References: <76E258664B189C4CBEF125491CA11ECC9445E0CF85@KCINPUNHJCMS01.kpit.com>
In-Reply-To: <76E258664B189C4CBEF125491CA11ECC9445E0CF85@KCINPUNHJCMS01.kpit.com>
Accept-Language: en-US, en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US, en-GB
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 89.151.113.230
X-SA-Exim-Mail-From: Simon.Hodgson@nortechonline.co.uk
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS,
	WEIRD_PORT autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: (No subject)
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
X-List-Received-Date: Wed, 02 Jun 2010 15:46:58 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Let me guess, you're using Ubuntu 10.4 to build?

Edit the file:
home/likewise-open/KPIT/soumyar/oe/build/tmp/sysroots/i686-linux/usr/bin/ar=
file.py

Change the line:
size =3D int(descriptor[5])

To:
size =3D int(descriptor[3])

I'm afraid I can't explain why you need to do this, only that it works for =
me.

Simon

-----Original Message-----
From: openembedded-devel-bounces@lists.openembedded.org [mailto:openembedde=
d-devel-bounces@lists.openembedded.org] On Behalf Of Soumya R
Sent: 02 June 2010 10:20
To: openembedded-devel@lists.openembedded.org
Cc: angstrom-distro-devel@linuxtogo.org
Subject: [oe] (no subject)

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
|=20
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
KPIT\soumyar@d-5289lnx:~/oe/build$=20

   Anybody can help me out to resolve this.Any suggestions are welcome:-)

Thanks in advance:-)

Regards,
Soumya


_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


