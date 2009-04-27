Received: from [87.193.137.78] (helo=mail.extern.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sledz@DResearch.DE>) id 1LyOlu-0005f7-Bp
	for openembedded-devel@lists.openembedded.org;
	Mon, 27 Apr 2009 13:13:15 +0200
Received: from consult.extern.dresearch.de (consult.extern.DResearch.DE
	[87.193.137.68])
	by mail.extern.dresearch.de (Postfix) with ESMTP id 6CC5C16DFDC
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Apr 2009 13:08:44 +0200 (CEST)
Received: from hiob.intern.dresearch.de (unknown [87.193.137.50])
	by consult.extern.dresearch.de (Postfix) with ESMTP id 812632A423E
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Apr 2009 13:08:12 +0200 (CEST)
X-MimeOLE: Produced By Microsoft Exchange V6.5
MIME-Version: 1.0
Date: Mon, 27 Apr 2009 13:07:47 +0200
Message-ID: <69E6C70090A0A14498CC98FAE5E06B6E3CF78E@hiob.intern.dresearch.de>
In-Reply-To: <69E6C70090A0A14498CC98FAE5E06B6E3CF77C@hiob.intern.dresearch.de>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: [oe] gcc_4.2.4.bb: QA Issue: No GNU_HASH in the elf binary
Thread-Index: AcnE04fqJKgcuT1kS8yEkBpyys8jIQCVMCjw
References: <69E6C70090A0A14498CC98FAE5E06B6E3CF77C@hiob.intern.dresearch.de>
From: "Sledz, Steffen" <sledz@DResearch.DE>
To: <openembedded-devel@lists.openembedded.org>
Subject: Re: gcc_4.2.4.bb: QA Issue: No GNU_HASH in the elf binary
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
X-List-Received-Date: Mon, 27 Apr 2009 11:13:24 -0000
Content-class: urn:content-classes:message
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Ping.

At the moment we are not able to make a build out of the .dev tree. :(

> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org=20
> [mailto:openembedded-devel-bounces@lists.openembedded.org] On=20
> Behalf Of Sledz, Steffen
> Sent: Friday, April 24, 2009 1:55 PM
> To: openembedded-devel@lists.openembedded.org
> Subject: [oe] gcc_4.2.4.bb: QA Issue: No GNU_HASH in the elf binary
>=20
> gcc_4.2.4.bb reports these errors for a few days. Can someone=20
> please have a look at it.
>=20
> ERROR: QA Issue: No GNU_HASH in the elf binary:=20
> '/home/sledz/oe/tmp.1/work/armv5te-angstrom-linux-gnueabi/gcc-
> 4.2.4-r3/install/gcc/usr/bin/arm-angstrom-linux-gnueabi-gcc'
> ERROR: QA Issue: No GNU_HASH in the elf binary:=20
> '/home/sledz/oe/tmp.1/work/armv5te-angstrom-linux-gnueabi/gcc-
> 4.2.4-r3/install/gcc/usr/libexec/gcc/arm-angstrom-linux-gnueab
> i/4.2.4/collect2'
> ERROR: QA Issue: non -dev package contains symlink .so: gcc=20
> path=20
> '/work/armv5te-angstrom-linux-gnueabi/gcc-4.2.4-r3/install/gcc
> /usr/lib/gcc/arm-angstrom-linux-gnueabi/4.2.4/libgcc_s.so'
> ERROR: QA Issue: No GNU_HASH in the elf binary:=20
> '/home/sledz/oe/tmp.1/work/armv5te-angstrom-linux-gnueabi/gcc-
> 4.2.4-r3/install/g++/usr/bin/arm-angstrom-linux-gnueabi-g++'
> ERROR: QA Issue: No GNU_HASH in the elf binary:=20
> '/home/sledz/oe/tmp.1/work/armv5te-angstrom-linux-gnueabi/gcc-
> 4.2.4-r3/install/g++/usr/libexec/gcc/arm-angstrom-linux-gnueab
> i/4.2.4/cc1plus'
> ERROR: QA Issue: No GNU_HASH in the elf binary:=20
> '/home/sledz/oe/tmp.1/work/armv5te-angstrom-linux-gnueabi/gcc-
> 4.2.4-r3/install/cpp/usr/bin/arm-angstrom-linux-gnueabi-cpp'
> ERROR: QA Issue: No GNU_HASH in the elf binary:=20
> '/home/sledz/oe/tmp.1/work/armv5te-angstrom-linux-gnueabi/gcc-
> 4.2.4-r3/install/cpp/usr/libexec/gcc/arm-angstrom-linux-gnueab
> i/4.2.4/cc1'
> ERROR: QA Issue: No GNU_HASH in the elf binary:=20
> '/home/sledz/oe/tmp.1/work/armv5te-angstrom-linux-gnueabi/gcc-
> 4.2.4-r3/install/gfortran/usr/bin/arm-angstrom-linux-gnueabi-gfortran'
> ERROR: QA Issue: No GNU_HASH in the elf binary:=20
> '/home/sledz/oe/tmp.1/work/armv5te-angstrom-linux-gnueabi/gcc-
> 4.2.4-r3/install/gfortran/usr/libexec/gcc/arm-angstrom-linux-g
> nueabi/4.2.4/f951'
> ERROR: QA Issue: No GNU_HASH in the elf binary:=20
> '/home/sledz/oe/tmp.1/work/armv5te-angstrom-linux-gnueabi/gcc-
> 4.2.4-r3/install/gcov/usr/bin/arm-angstrom-linux-gnueabi-gcov'
> ERROR: QA run found fatal errors. Please consider fixing them.
> ERROR: Error in executing: /opt/openembedded/recipes/gcc/gcc_4.2.4.bb
> ERROR: Exception:<type 'exceptions.SystemExit'> Message:1
> ERROR: Printing the environment of the function
> ERROR: Error in executing: /opt/openembedded/recipes/gcc/gcc_4.2.4.bb
> ERROR: Exception:<type 'exceptions.SystemExit'> Message:1
> ERROR: Printing the environment of the function
> ERROR: Error in executing: /opt/openembedded/recipes/gcc/gcc_4.2.4.bb
> ERROR: Exception:<type 'exceptions.SystemExit'> Message:1
> ERROR: Printing the environment of the function
> ERROR: Error in executing: /opt/openembedded/recipes/gcc/gcc_4.2.4.bb
> ERROR: Exception:<type 'exceptions.SystemExit'> Message:1
> ERROR: Printing the environment of the function
> ERROR: Build of /opt/openembedded/recipes/gcc/gcc_4.2.4.bb=20
> do_package failed
> ERROR: Task 1281 (/opt/openembedded/recipes/gcc/gcc_4.2.4.bb,=20
> do_package) failed
> ERROR: '/opt/openembedded/recipes/gcc/gcc_4.2.4.bb' failed
>=20
> Thx,
> Steffen
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>=20


