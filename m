Received: from [195.54.101.73] (helo=proxy3.bredband.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ulf.samuelsson@atmel.com>) id 1LizKA-0003IA-Mx
	for openembedded-devel@openembedded.org; Mon, 16 Mar 2009 00:00:57 +0100
Received: from ironport.bredband.com (195.54.101.120) by proxy3.bredband.net
	(7.3.139)
	id 49B5DCC600356584 for openembedded-devel@openembedded.org;
	Mon, 16 Mar 2009 00:00:18 +0100
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AgQUAE8lvUlT4zhBPGdsb2JhbAAIlTABAQEBNbl6g38GYQ
X-IronPort-AV: E=Sophos;i="4.38,368,1233529200"; d="scan'208";a="496430559"
Received: from c-4138e353.011-39-73746f12.cust.bredbandsbolaget.se (HELO
	[10.175.196.101]) ([83.227.56.65])
	by ironport1.bredband.com with ESMTP; 16 Mar 2009 00:00:15 +0100
From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1237137401.5838.225.camel@grond>
References: <1237137401.5838.225.camel@grond>
Organization: Atmel Nordic AB
Date: Sun, 15 Mar 2009 23:59:19 +0100
Message-Id: <1237157959.5838.459.camel@grond>
Mime-Version: 1.0
X-Mailer: Evolution 2.24.1.1 
X-SA-Exim-Connect-IP: 195.54.101.73
X-SA-Exim-Mail-From: ulf.samuelsson@atmel.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=AWL,BAYES_50,RDNS_NONE,
	URIBL_SBL autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@openembedded.org
Subject: Re: perl-native fails.
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
X-List-Received-Date: Sun, 15 Mar 2009 23:00:57 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: Quoted-Printable

s=C3=B6n 2009-03-15 klockan 18:16 +0100 skrev Ulf Samuelsson:
> Trying to build SAM9263EK using Angstrom.
> perl-native seems to fail with the following error message:
>=20
> ODBM_File.xs:124: error: too few arguments to function 'dbmclose'
>=20
>=20
The perl-native build completes, if references to "ODBM_File" is removed
=66rom the generated config.sh

BR
Ulf Samuelsson


> Anyone seen this before?
>=20
>=20
>=20
> make[1]: Entering directory
> `/home/ulf/projects/OE_atmel/build/tmp/work/x86_64-linux/perl-native-5.=
8.8-r13/perl-5.8.8/ext/ODBM_File'
> cp ODBM_File.pm ../../lib/ODBM_File.pm
> ../../miniperl "-I../../lib" "-I../../lib" ../../lib/ExtUtils/xsubpp
> -noprototypes -typemap ../../lib/ExtUtils/typemap -typemap typemap
> ODBM_File.xs > ODBM_File.xsc && mv ODBM_File.xsc ODBM_File.c
>=20
> gcc  -c   -D_REENTRANT -D_GNU_SOURCE -DTHREADS_HAVE_PIDS
> -fno-strict-aliasing -pipe -Wdeclaration-after-statement
> -I/usr/local/include -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=3D64 -O2
> -DVERSION=3D\"1.06\" -DXS_VERSION=3D\"1.06\" -fpic "-I../.."   ODBM_Fil=
e.c
> ODBM_File.xs: In function 'XS_ODBM_File_DESTROY':
> ODBM_File.xs:124: error: too few arguments to function 'dbmclose'
>=20
> make[1]: *** [ODBM_File.o] Error 1
>=20
> make[1]: Leaving directory
> `/home/ulf/projects/OE_atmel/build/tmp/work/x86_64-linux/perl-native-5.=
8.8-r13/perl-5.8.8/ext/ODBM_File'
>=20
> make: *** [lib/auto/ODBM_File/ODBM_File.so] Error 2
>=20
> FATAL: oe_runmake failed
>=20
> Best Regards
> Ulf Samuelsson
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


