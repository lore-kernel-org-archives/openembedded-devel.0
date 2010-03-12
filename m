Received: from proxy.dresearch.de ([87.193.137.100] helo=mail.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sledz@DResearch.DE>) id 1NpzuY-0006Mt-Br
	for openembedded-devel@lists.openembedded.org;
	Fri, 12 Mar 2010 09:08:03 +0100
Received: from exchange.intern.dresearch.de (unknown [192.168.32.16])
	by mail.dresearch.de (Postfix) with ESMTP id 8DC21491264
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Mar 2010 09:05:01 +0100 (CET)
Received: from [127.0.0.1] ([10.32.10.2]) by exchange.intern.dresearch.de with
	Microsoft SMTPSVC(6.0.3790.3959); Fri, 12 Mar 2010 09:05:21 +0100
Message-ID: <4B99F5AE.8010307@dresearch.de>
Date: Fri, 12 Mar 2010 09:05:02 +0100
From: Steffen Sledz <sledz@dresearch.de>
User-Agent: Thunderbird 2.0.0.23 (Windows/20090812)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <alpine.LFD.2.00.0911130443520.1157@localhost>
In-Reply-To: <alpine.LFD.2.00.0911130443520.1157@localhost>
X-OriginalArrivalTime: 12 Mar 2010 08:05:21.0229 (UTC)
	FILETIME=[C2F367D0:01CAC1BA]
X-SA-Exim-Connect-IP: 87.193.137.100
X-SA-Exim-Mail-From: sledz@DResearch.DE
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: build breakage: python-native-2.6.4 (was build breakage: python-native-2.6.1)
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
X-List-Received-Date: Fri, 12 Mar 2010 08:08:03 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Robert P. J. Day wrote:
>=20
>   building beagleboard-demo-image:
>=20
> NOTE: make -j4 BUILD_SYS=3D HOST_SYS=3D LIBC=3D
> STAGING_LIBDIR=3D/home/rpjday/oe/angstrom-dev/staging/x86_64-linux/usr/=
lib
> STAGING_INCDIR=3D/home/rpjday/oe/angstrom-dev/staging/x86_64-linux/usr/=
include
> *** WARNING: renaming "dbm" since importing it failed:
> build/lib.linux-x86_64-2.6/dbm.so: undefined symbol: dbm_firstkey
> /bin/sh: line 1:   515 Segmentation fault    =20
> LD_LIBRARY_PATH=3D/home/rpjday/oe/angstrom-dev/work/x86_64-linux/python=
-native-2.6.1-ml8.2/Python-2.6.1:
> CC=3D'ccache gcc -pthread' LDSHARED=3D'ccache gcc -pthread -shared'
> OPT=3D'-DNDEBUG -g  -O3 -Wall -Wstrict-prototypes' ./python -E ./setup.=
py
> -q build
> make: *** [sharedmods] Error 139
> FATAL: oe_runmake failed
>=20
>   that's it, that's the entire log file.  and it's entirely
> reproducible.

The problem is back with python-native-2.6.4 and openSUSE 11.2. :(

It was solved for python-native-2.6.1 by this patch:

commit a4bddfe9e6a513a8ad1881ed2ffd419390cf20e7
Author: Richard Purdie <rpurdie <at> linux.intel.com>
Date:   Sat Nov 14 13:25:03 2009 +0100

    python-native: do not look in host paths for shared objects

Needs this patch to be adapted for all other python-native versions?

Steffen

--=20
Steffen Sledz
DResearch Digital Media Systems GmbH
Otto-Schmirgal-Str.3, D-10319 Berlin, Germany
Tel: +49 (30) 515932237 mailto:sledz@DResearch.DE
Fax: +49 (30) 515932299 http://www.DResearch.DE
Gesch=E4ftsf=FChrer: Dr. Michael Weber, Werner M=F6gle;
Amtsgericht Berlin Charlottenburg; HRB 54412;
Ust.-IDNr. DE169013825; WEEE Reg.-Nr. DE 85995642



