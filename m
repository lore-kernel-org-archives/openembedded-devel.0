Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1OJQjM-0000sx-RN
	for openembedded-devel@lists.openembedded.org;
	Tue, 01 Jun 2010 14:38:36 +0200
Received: by fxm9 with SMTP id 9so6091fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Jun 2010 05:33:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	bh=Q5/fWh4qxq9kf5ZTymSg9HBoysQnphtovvBuOMO+ABs=;
	b=cNUFVEwopEHcwyu+vEIErdSUsPdudsWbGDVMZLPua7OmZB7jVmkBJ92H96xACAGaoS
	hm1q29Bc/hQIzsM1lciNohBFXmtjQaTnSAyWMuLDRZfZGHzAZlU/9RGihUaPbvfB1WR9
	Xd6JJEnE4IJ/dWfkVi/IB+6sfDmhj6O7ri6wo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	b=cAZxkp+zvoBJB1lM7UuAZNoE9Qf7bC5Y1kjsigoBjRjfpoeUv7Z7mLN7RPf19aP5TS
	bfG2s+wd00Fi/2dzDZKMz+ky9IklYsvbCAT97H18EUATuHfj0y7+nEmepb0Hoc5gpSLM
	ofUAkp1pciyTrJtbAfZo6PwVTiyEcdM502RcM=
Received: by 10.223.98.19 with SMTP id o19mr6962737fan.80.1275395630870;
	Tue, 01 Jun 2010 05:33:50 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id u12sm46953623fah.4.2010.06.01.05.33.49
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 01 Jun 2010 05:33:50 -0700 (PDT)
Date: Tue, 1 Jun 2010 14:33:46 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100601123346.GC5446@jama>
References: <76E258664B189C4CBEF125491CA11ECC9445E0CF7C@KCINPUNHJCMS01.kpit.com>
	<76E258664B189C4CBEF125491CA11ECC9445E0CF7D@KCINPUNHJCMS01.kpit.com>
MIME-Version: 1.0
In-Reply-To: <76E258664B189C4CBEF125491CA11ECC9445E0CF7D@KCINPUNHJCMS01.kpit.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: glibc_2.9.bb do_package failed
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
X-List-Received-Date: Tue, 01 Jun 2010 12:38:38 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 01, 2010 at 05:35:03PM +0530, Soumya R wrote:
> Hi All,
>=20
>        I am new to open embedded .. I am configuring micro-image for arm9=
 processor ..
> when i run bitbake micro-image i get the following error.
>=20
> NOTE: Gettext required but not in DEPENDS for file /home/likewise-open/KP=
IT/soumyar/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/gcc-cross-inter=
mediate-4.3.3-r12.1/gcc-4.3.3/intl/configure.ac.
> Missing inherit gettext?
> NOTE: Running task 685 of 957 (ID: 535, /home/likewise-open/KPIT/soumyar/=
oe/openembedded/recipes/gcc/gcc-cross-intermediate_4.3.3.bb, do_compile)
> NOTE: Running task 686 of 957 (ID: 529, /home/likewise-open/KPIT/soumyar/=
oe/openembedded/recipes/gcc/gcc-cross-intermediate_4.3.3.bb, do_install)
> NOTE: Running task 687 of 957 (ID: 530, /home/likewise-open/KPIT/soumyar/=
oe/openembedded/recipes/gcc/gcc-cross-intermediate_4.3.3.bb, do_populate_sy=
sroot)
> NOTE: Running task 688 of 957 (ID: 537, /home/likewise-open/KPIT/soumyar/=
oe/openembedded/recipes/gcc/gcc-cross-intermediate_4.3.3.bb, do_package)
> NOTE: Running task 689 of 957 (ID: 539, /home/likewise-open/KPIT/soumyar/=
oe/openembedded/recipes/gcc/gcc-cross-intermediate_4.3.3.bb, do_package_wri=
te_ipk)
> NOTE: Running task 690 of 957 (ID: 156, /home/likewise-open/KPIT/soumyar/=
oe/openembedded/recipes/glibc/glibc_2.9.bb, do_configure)
> NOTE: Running task 691 of 957 (ID: 536, /home/likewise-open/KPIT/soumyar/=
oe/openembedded/recipes/gcc/gcc-cross-intermediate_4.3.3.bb, do_package_wri=
te)
> NOTE: Running task 692 of 957 (ID: 538, /home/likewise-open/KPIT/soumyar/=
oe/openembedded/recipes/gcc/gcc-cross-intermediate_4.3.3.bb, do_package_sta=
ge)
> NOTE: Running task 693 of 957 (ID: 157, /home/likewise-open/KPIT/soumyar/=
oe/openembedded/recipes/glibc/glibc_2.9.bb, do_qa_configure)
> NOTE: Running task 694 of 957 (ID: 158, /home/likewise-open/KPIT/soumyar/=
oe/openembedded/recipes/glibc/glibc_2.9.bb, do_compile)
> NOTE: Running task 695 of 957 (ID: 152, /home/likewise-open/KPIT/soumyar/=
oe/openembedded/recipes/glibc/glibc_2.9.bb, do_install)
> NOTE: Running task 696 of 957 (ID: 153, /home/likewise-open/KPIT/soumyar/=
oe/openembedded/recipes/glibc/glibc_2.9.bb, do_populate_sysroot)
> NOTE: Running task 697 of 957 (ID: 160, /home/likewise-open/KPIT/soumyar/=
oe/openembedded/recipes/glibc/glibc_2.9.bb, do_package)
> NOTE: preparing tree for binary locale generation
> NOTE: Running task 698 of 957 (ID: 142, /home/likewise-open/KPIT/soumyar/=
oe/openembedded/recipes/gcc/gcc-cross_4.3.3.bb, do_configure)
> NOTE: generating locale es_NI (UTF-8)
> NOTE: Running task 699 of 957 (ID: 143, /home/likewise-open/KPIT/soumyar/=
oe/openembedded/recipes/gcc/gcc-cross_4.3.3.bb, do_qa_configure)
> NOTE: Gettext required but not in DEPENDS for file /home/likewise-open/KP=
IT/soumyar/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/gcc-cross-4.3.3=
-r12.1/gcc-4.3.3/intl/configure.ac.
> Missing inherit gettext?
> NOTE: Running task 700 of 957 (ID: 144, /home/likewise-open/KPIT/soumyar/=
oe/openembedded/recipes/gcc/gcc-cross_4.3.3.bb, do_compile)
> qemu-arm: relocation error: qemu-arm: symbol fcntl, version GLIBC_2.0 not=
 defined in file libpthread.so.0 with link time reference
> NOTE: Task failed: localedef returned an error (command was PATH=3D"/home=
/likewise-open/KPIT/soumyar/oe/build/tmp/sysroots/i686-linux/usr/bin/armv5t=
e-angstrom-linux-gnueabi:/home/likewise-open/KPIT/soumyar/oe/build/tmp/sysr=
oots/i686-linux/usr/bin/armv5te-angstrom-linux-gnueabi:/home/likewise-open/=
KPIT/soumyar/oe/build/tmp/sysroots/i686-linux/usr/sbin:/home/likewise-open/=
KPIT/soumyar/oe/build/tmp/sysroots/i686-linux/usr/bin:/home/likewise-open/K=
PIT/soumyar/oe/build/tmp/cross/armv5te//bin:/home/likewise-open/KPIT/soumya=
r/oe/build/tmp/sysroots/i686-linux/sbin:/home/likewise-open/KPIT/soumyar/oe=
/build/tmp/sysroots/i686-linux/bin:/likewise-open/KPIT/soumyar/oe/bitbake/b=
in:/likewise-open/KPIT/soumyar/oe/bitbake/bin:/likewise-open/KPIT/soumyar/o=
e/bitbake/bin:/home/likewise-open/KPIT/soumyar/bin:/usr/local/sbin:/usr/loc=
al/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games" I18NPATH=3D"/home/likewise=
-open/KPIT/soumyar/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/glibc-2=
=2E9-r36.3/locale-tree/
>  usr/share/i18n" qemu-arm -s 1048576 -r 2.6.24 -L /home/likewise-open/KPI=
T/soumyar/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/glibc-2.9-r36.3/=
locale-tree -E LD_LIBRARY_PATH=3D/home/likewise-open/KPIT/soumyar/oe/build/=
tmp/work/armv5te-angstrom-linux-gnueabi/glibc-2.9-r36.3/locale-tree/lib  /h=
ome/likewise-open/KPIT/soumyar/oe/build/tmp/work/armv5te-angstrom-linux-gnu=
eabi/glibc-2.9-r36.3/locale-tree/bin/localedef --force --old-style --no-arc=
hive --prefix=3D/home/likewise-open/KPIT/soumyar/oe/build/tmp/work/armv5te-=
angstrom-linux-gnueabi/glibc-2.9-r36.3/locale-tree --inputfile=3D/usr/share=
/i18n/locales/es_NI --charmap=3DUTF-8 es_NI).
> ERROR: TaskFailed event exception, aborting
> ERROR: Build of /home/likewise-open/KPIT/soumyar/oe/openembedded/recipes/=
glibc/glibc_2.9.bb do_package failed
> ERROR: Task 160 (/home/likewise-open/KPIT/soumyar/oe/openembedded/recipes=
/glibc/glibc_2.9.bb, do_package) failed
> NOTE: Waiting for 1 active tasks to finish
> NOTE: 1: /home/likewise-open/KPIT/soumyar/oe/openembedded/recipes/gcc/gcc=
-cross_4.3.3.bb, do_compile (6409)
> NOTE: Tasks Summary: Attempted 698 tasks of which 0 didn't need to be rer=
un and 1 failed.
> ERROR: '/home/likewise-open/KPIT/soumyar/oe/openembedded/recipes/glibc/gl=
ibc_2.9.bb' failed

Are you using latest qemu-native from OE? Otherwise you still need 0 in mma=
p_min_addr.

Try to run that command by hand in console to see if it's the same issue.

>           Please help me out to resolve this i goggled but could not find=
 the solution..

Strange, there is plenty of discussion and possible solutions discussed
here in this ML...

Regards,

--=20
uin:136542059                jid:Martin.Jansa@gmail.com
Jansa Martin                 sip:jamasip@voip.wengo.fr=20
JaMa                        =20


