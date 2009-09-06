Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>) id 1MkHCk-0000z9-4d
	for openembedded-devel@lists.openembedded.org;
	Sun, 06 Sep 2009 14:50:50 +0200
Received: from 212-139-92-236.dynamic.dsl.as9105.com ([212.139.92.236]
	helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>) id 1MkGuA-0000We-Ma
	for openembedded-devel@lists.openembedded.org;
	Sun, 06 Sep 2009 13:31:38 +0100
From: Phil Blundell <pb@reciva.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1252239576.4136.10.camel@utx.utx.cz>
References: <1252239576.4136.10.camel@utx.utx.cz>
Date: Sun, 06 Sep 2009 13:31:37 +0100
Message-Id: <1252240297.4490.158.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.3 
Subject: Re: very obscure race: access to a just-populated binary
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
X-List-Received-Date: Sun, 06 Sep 2009 12:50:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 2009-09-06 at 14:19 +0200, Stanislav Brabec wrote:
> Hallo.
>=20
> I just encountered a very obscure race during the build: do_configure
> called grep exactly in the moment, when another process populated it:
>=20
> =EF=BB=BF/OE/build/tmp/staging/x86_64-linux/usr/bin/intltoolize: line 231=
: /OE/build/tmp/staging/x86_64-linux/usr/bin/grep: Text file busy
> /OE/build/tmp/staging/x86_64-linux/usr/bin/intltoolize: line 246: /OE/bui=
ld/tmp/staging/x86_64-linux/usr/bin/grep: Text file busy
>=20
> ls -al --full-time
> work/armv5te-angstrom-linux-gnueabi/libgnomecups-0.2.3-r0/temp/log.do_con=
figure.412=20
> -rw-r--r-- 1 sbrabec users  1234 2009-09-06 03:23:45.000000000 +0200 work=
/armv5te-angstrom-linux-gnueabi/libgnomecups-0.2.3-r0/temp/log.do_configure=
.412
> ls -al --full-time work/x86_64-linux/grep-native-2.5.1-r2/temp/log.popula=
te_staging_preamble.21860=20
> -rw-r--r-- 1 sbrabec users 12079 2009-09-06 03:23:44.000000000 +0200 work=
/x86_64-linux/grep-native-2.5.1-r2/temp/log.populate_staging_preamble.21860

A similar issue with coreutils-native was discussed here recently:


> =EF=BB=BF
> I guess it may be fixable by:
> - do not populate binaries by installation in place
> =EF=BB=BF- extending of DEPENDS/RDEPENDS of native packages
> - do_unpack should respect dependencies, otherwise it can happen with
>   unzip-native
>=20
>=20
> ________________________________________________________________________
> Stanislav Brabec
> http://www.penguin.cz/~utx/zaurus
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



