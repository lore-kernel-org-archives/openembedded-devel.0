Received: from [82.119.242.94] (helo=mail.suse.cz)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <utx@penguin.cz>) id 1JWVBp-0001A7-Fj
	for openembedded-devel@lists.openembedded.org;
	Tue, 04 Mar 2008 12:20:16 +0100
Received: from [10.20.1.86] (hammer.suse.cz [10.20.1.86])
	by mail.suse.cz (Postfix) with ESMTP id 682FA6280B4
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  4 Mar 2008 12:18:54 +0100 (CET)
From: Stanislav Brabec <utx@penguin.cz>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <19c1b8a90803032326s57ce6e5cic48a157e353dfb53@mail.gmail.com>
References: <1204494435.17068.23.camel@utx.utx.cz>
	<fqg9c0$g00$1@ger.gmane.org> <1204541308.5725.10.camel@hammer.suse.cz>
	<19c1b8a90803032326s57ce6e5cic48a157e353dfb53@mail.gmail.com>
Date: Tue, 04 Mar 2008 12:18:54 +0100
Message-Id: <1204629534.22237.4.camel@hammer.suse.cz>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.0 
X-SA-Exim-Connect-IP: 82.119.242.94
X-SA-Exim-Mail-From: utx@penguin.cz
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=AWL,RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: iwwmmxt optimization and soft float in OE on PXA270
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 04 Mar 2008 11:20:16 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Khem Raj wrote:=20
> Stanislav,
>=20
> What ABI breakage are you seeing ?
> Aren't you using EABI ?

I didn't check this yet, but gcc(1) talks about it. If I understand
correctly, -mfloat-abi=3Dhard uses FPU or exception based code in kernel,
-mfloat-abi=3Dsoftfp uses software float and ABI equal to hard-float, and
-msoft-float (or -mfloat-abi=3Dsoft) breaks ABI and uses different ABI.

Please fix me, if I am wrong. I don't have deep insight into this
problem, so I have exactly followed recommendation and recompiled
everything after this change.


Manual page gcc(1) 57%:

-msoft-float
    Generate output containing library calls for floating point.  Warn=E2=
=80=90
    ing: the requisite libraries are not available for all ARM targets.
    Normally the facilities of the machine's usual C compiler are used,
    but this cannot be done directly in cross-compilation.  You must
    make your own arrangements to provide suitable library functions
    for cross-compilation.

    -msoft-float changes the calling convention in the output file;
    therefore, it is only useful if you compile all of a program with
    this option.  In particular, you need to compile libgcc.a, the
    library that comes with GCC, with -msoft-float in order for this to
    work.

-mfloat-abi=3Dname
    Specifies which ABI to use for floating point values.  Permissible
    values are: soft, softfp and hard.

    soft and hard are equivalent to -msoft-float and -mhard-float
    respectively.  softfp allows the generation of floating point
    instructions, but still uses the soft-float calling conventions.

--=20
Stanislav Brabec
http://www.penguin.cz/~utx/zaurus



