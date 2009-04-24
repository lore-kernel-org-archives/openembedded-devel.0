Received: from [87.193.137.78] (helo=mail.extern.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sledz@DResearch.DE>) id 1LxNNh-0007JP-Oq
	for openembedded-devel@lists.openembedded.org;
	Fri, 24 Apr 2009 17:32:04 +0200
Received: from consult.extern.dresearch.de (consult.extern.DResearch.DE
	[87.193.137.68])
	by mail.extern.dresearch.de (Postfix) with ESMTP id 2687616E233
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Apr 2009 17:27:42 +0200 (CEST)
Received: from hiob.intern.dresearch.de (unknown [87.193.137.50])
	by consult.extern.dresearch.de (Postfix) with ESMTP id 868442A4228
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Apr 2009 17:27:17 +0200 (CEST)
X-MimeOLE: Produced By Microsoft Exchange V6.5
MIME-Version: 1.0
Date: Fri, 24 Apr 2009 17:26:47 +0200
Message-ID: <69E6C70090A0A14498CC98FAE5E06B6E3CF784@hiob.intern.dresearch.de>
In-Reply-To: <69E6C70090A0A14498CC98FAE5E06B6E3CF664@hiob.intern.dresearch.de>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: [oe] subversion libtool problem
Thread-Index: AcmKq6l61KuqXcTwQIyWF/FxgHaSdQDCwxigDc6LP1A=
References: <69E6C70090A0A14498CC98FAE5E06B6E3CF642@hiob.intern.dresearch.de>
	<69E6C70090A0A14498CC98FAE5E06B6E3CF664@hiob.intern.dresearch.de>
From: "Sledz, Steffen" <sledz@DResearch.DE>
To: <openembedded-devel@lists.openembedded.org>
Subject: Re: subversion libtool problem
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
X-List-Received-Date: Fri, 24 Apr 2009 15:32:06 -0000
Content-class: urn:content-classes:message
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

> > Since the saturday "apr + apr-util: merge from poky" commit=20
> > by Koen i almost reached my goal to build a subversion client=20
> > for Angstrom. After patching neon for myself there is just=20
> > this last problem:
> >=20
> > NOTE: Running task 422 of 578 (ID: 7,=20
> > /opt/openembedded/packages/subversion/subversion_1.4.5.bb,=20
> > do_compile)
> > NOTE: package subversion-1.4.5: started
> > NOTE: package subversion-1.4.5-r0: task do_compile: started
> > ERROR: function do_compile failed
> > ERROR: log data follows=20
> > (/home/sledz/oe/tmp.1/work/i486-angstrom-linux/subversion-1.4.
> > 5-r0/temp/log.do_compile.6088)
> > | NOTE: make
> > | /bin/sh=20
> > /home/sledz/oe/tmp.1/work/i486-angstrom-linux/subversion-1.4.5
> > -r0/subversion-1.4.5/libtool --silent --mode=3Dcompile=20
> > i486-angstrom-linux-gcc -march=3Di486=20
> > -isystem/home/sledz/oe/tmp.1/staging/i486-angstrom-linux/usr/i
> > nclude   -DLINUX=3D2 -D_REENTRANT -D_GNU_SOURCE =20
> > -isystem/home/sledz/oe/tmp.1/staging/i486-angstrom-linux/usr/i
> > nclude -fexpensive-optimizations -frename-registers=20
> > -fomit-frame-pointer -O2   -D_LARGEFILE64_SOURCE -DNE_LFS    =20
> > -I./subversion/include -I./subversion=20
> > -I/home/sledz/oe/tmp.1/staging/i486-angstrom-linux/usr/include
> > /neon=20
> > -I/home/sledz/oe/tmp.1/staging/i486-angstrom-linux/usr/include
> >   =20
> > -I/home/sledz/oe/tmp.1/staging/i486-angstrom-linux/usr/include
> > =20
> > -I/home/sledz/oe/tmp.1/staging/i486-angstrom-linux/usr/include
> >   -o subversion/libsvn_delta/cancel.lo -c=20
> > subversion/libsvn_delta/cancel.c
> > |=20
> > /home/sledz/oe/tmp.1/work/i486-angstrom-linux/subversion-1.4.5
> > -r0/subversion-1.4.5/libtool: line 463: CDPATH: command not found
> > |=20
> > /home/sledz/oe/tmp.1/work/i486-angstrom-linux/subversion-1.4.5
> > -r0/subversion-1.4.5/libtool: line 1141: func_opt_split:=20
> > command not found
> > | libtool: Version mismatch error.  This is libtool 2.2.4, but the
> > | libtool: definition of this LT_INIT comes from an older release.
> > | libtool: You should recreate aclocal.m4 with macros from=20
> > libtool 2.2.4
> > | libtool: and run autoconf again.
> > | make: *** [subversion/libsvn_delta/cancel.lo] Error 63
> > | FATAL: oe_runmake failed

This problem is still there. Can *please* somebody familiar with libtool =
have a look at it?

Thx,
Steffen


