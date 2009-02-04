Received: from [87.193.137.78] (helo=mail.extern.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sledz@DResearch.DE>) id 1LUhKf-0000aH-K8
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Feb 2009 13:58:22 +0100
Received: from consult.extern.dresearch.de (consult.extern.DResearch.DE
	[87.193.137.68])
	by mail.extern.dresearch.de (Postfix) with ESMTP id 59BB516E237
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Feb 2009 14:10:35 +0100 (CET)
Received: from hiob.intern.dresearch.de (unknown [87.193.137.50])
	by consult.extern.dresearch.de (Postfix) with ESMTP id 1FE222A420F
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Feb 2009 13:58:15 +0100 (CET)
X-MimeOLE: Produced By Microsoft Exchange V6.5
MIME-Version: 1.0
Date: Wed, 4 Feb 2009 13:57:53 +0100
Message-ID: <69E6C70090A0A14498CC98FAE5E06B6E3CF62C@hiob.intern.dresearch.de>
In-Reply-To: <gm7hro$nph$1@ger.gmane.org>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: [oe] config/compile problem with apr-1.2.12
Thread-Index: AcmFciFiKOw1Cpi8RvalyRtlqsdE1QBVW15w
References: <1233597587.5363.76.camel@dax.rpnet.com>
	<gm7hro$nph$1@ger.gmane.org>
From: "Sledz, Steffen" <sledz@DResearch.DE>
To: <openembedded-devel@lists.openembedded.org>
Subject: Re: config/compile problem with apr-1.2.12
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
X-List-Received-Date: Wed, 04 Feb 2009 12:58:34 -0000
Content-class: urn:content-classes:message
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

> > I'd try the recipes in Poky for apr and apr-utils as they=20
> > have fixes for a load of issues like this...
>=20
> I 'fixed' apr today, but I wouldn't mind some more poky=20
> goodness in .dev :)

apr-1.2.12 builds now, thx. But apr-util-1.2.12 has some libtool =
problems too.  :(

ERROR: log data follows =
(/home/sledz/oe/tmp.1/work/i486-angstrom-linux/apr-util-1.2.12-r2/temp/lo=
g.do_compile.20721)
| NOTE: make
| make[1]: Entering directory =
`/home/sledz/oe/tmp.1/work/i486-angstrom-linux/apr-util-1.2.12-r2/apr-uti=
l-1.2.12'
| /bin/bash /i486-angstrom-linux-libtool --silent --mode=3Dcompile =
i486-angstrom-linux-gcc -march=3Di486   =
-isystem/home/sledz/oe/tmp.1/staging/i486-angstrom-linux/usr/include =
-fexpensive-optimizations -frename-registers -fomit-frame-pointer -O2 =
-DHAVE_CONFIG_H -DLINUX=3D2 -D_REENTRANT -D_GNU_SOURCE  =
-isystem/home/sledz/oe/tmp.1/staging/i486-angstrom-linux/usr/include =
-I/home/sledz/oe/tmp.1/work/i486-angstrom-linux/apr-util-1.2.12-r2/apr-ut=
il-1.2.12/include =
-I/home/sledz/oe/tmp.1/work/i486-angstrom-linux/apr-util-1.2.12-r2/apr-ut=
il-1.2.12/include/private  =
-I/home/sledz/oe/tmp.1/staging/i486-angstrom-linux/usr/include  =
-I/home/sledz/oe/tmp.1/staging/i486-angstrom-linux/usr/include  -o =
buckets/apr_buckets_pipe.lo -c buckets/apr_buckets_pipe.c && touch =
buckets/apr_buckets_pipe.lo
| /bin/bash: /i486-angstrom-linux-libtool: No such file or directory
| make[1]: *** [buckets/apr_buckets_pipe.lo] Error 127
| make[1]: Leaving directory =
`/home/sledz/oe/tmp.1/work/i486-angstrom-linux/apr-util-1.2.12-r2/apr-uti=
l-1.2.12'
| make: *** [all-recursive] Error 1
| FATAL: oe_runmake failed


