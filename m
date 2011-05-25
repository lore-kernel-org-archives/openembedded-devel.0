Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QPBzy-0000jE-34 for openembedded-devel@lists.openembedded.org;
	Wed, 25 May 2011 13:11:34 +0200
Received: from f053034074.adsl.alicedsl.de ([78.53.34.74]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QPBxM-00062e-Fm for openembedded-devel@lists.openembedded.org;
	Wed, 25 May 2011 11:08:52 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4DDCCD4C.1080902@gmx.net>
References: <1306099474.5994.112.camel@mattotaupa> <4DDCCD4C.1080902@gmx.net>
Date: Wed, 25 May 2011 13:08:32 +0200
Message-ID: <1306321712.10056.37.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: =?UTF-8?B?UmU6IGljZWR0ZWE2LW5hdGl2ZTogdGFzayBjb21waWxlIGZhaWxzIHdpdGggYHVuemlwOiBjYW5ub3QgZmluZCB6aXBmaWxlIGRpcmVjdG9yeSBpbiBvbmUgb2YgL29lL2J1aWxkLWFuZ3N0cm9tLW5leHQvYW5nc3Ryb20tZGV2L3N5c3Jvb3RzL2k2ODYtbGludXgvdXNyL2Jpbi91bnppcCBvciDigKZg?=
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
X-List-Received-Date: Wed, 25 May 2011 11:11:34 -0000
X-Groupsio-MsgNum: 32275
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-ZNcxmQCyt5aV5BOdXn74"

--=-ZNcxmQCyt5aV5BOdXn74
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Robert,


On Mi, 2011-05-25 at 11:35 +0200, Robert Schuster wrote:

> >         Importing binaries from component CORBA_DIST
> >         ( cd  /oe/build-angstrom-next/angstrom-dev/work/i686-linux/iced=
tea6-native-1.7.10-r4.0/icedtea6-1.7.10/openjdk-ecj/build/linux-x86 && /oe/=
build-angstrom-next/angstrom-dev/sysroots/i686-linux/usr/bin/unzip -o /oe/b=
uild-angstrom-next/angstrom-dev/work/i686-linux/icedtea6-native-1.7.10-r4.0=
/icedtea6-1.7.10/openjdk-ecj/build/linux-x86/corba/dist/lib/bin.zip )
> >         Archive:  /oe/build-angstrom-next/angstrom-dev/sysroots/i686-li=
nux/usr/bin/unzip
> >           End-of-central-directory signature not found.  Either this fi=
le is not
> >           a zipfile, or it constitutes one disk of a multi-part archive=
.  In the
> >           latter case the central directory and zipfile comment will be=
 found on
> >           the last disk(s) of this archive.
> >         note:  /oe/build-angstrom-next/angstrom-dev/sysroots/i686-linux=
/usr/bin/unzip may be a plain executable, not an archive
> >         unzip:  cannot find zipfile directory in one of /oe/build-angst=
rom-next/angstrom-dev/sysroots/i686-linux/usr/bin/unzip or /oe/build-angstr=
om-next/angstrom-dev/sysroots/i686-linux/usr/bin/unzip.zip, and cannot find=
 /oe/build-angstrom-next/angstrom-dev/sysroots/i686-linux/usr/bin/unzip.ZIP=
, period.
> >         make[4]: *** [/oe/build-angstrom-next/angstrom-dev/work/i686-li=
nux/icedtea6-native-1.7.10-r4.0/icedtea6-1.7.10/openjdk-ecj/build/linux-x86=
/tmp/java/components_imported] Error 9
> Did you notice that somehow the makefile tries to unpack the file
> '/oe/build-angstrom-next/angstrom-dev/sysroots/i686-linux/usr/bin/unzip'.

It looks strange. But I thought that is some behavior of `unzip` to look
into some default paths.

> I smell some shell-quoting problem or similar.

I found the following parts but do not know how this can fail.

        /oe/build-minimal-eglibc/minimal-dev/work/i686-linux/icedtea6-nativ=
e-1.7.10-r4.0$ grep -Ri "Importing binaries" *
        icedtea6-1.7.10/openjdk/jdk/make/common/internal/ImportComponents.g=
mk:  $(ECHO) "Importing binaries from component $1"; \
        icedtea6-1.7.10/openjdk-ecj/jdk/make/common/internal/ImportComponen=
ts.gmk:  $(ECHO) "Importing binaries from component $1"; \
        openjdk-src-dir/jdk/make/common/internal/ImportComponents.gmk:  $(E=
CHO) "Importing binaries from component $1"; \
        temp/log.do_compile:Importing binaries from component CORBA_DIST
        temp/log.do_compile.22501:Importing binaries from component CORBA_D=
IST

looking at there is

        # Importing optional component bin files (for install image)
        define import-one-binaries
        @if [ "$($1)" !=3D "" -a -f $($1)/$(BIN_ZIP_FILE) ] ; then \
          $(ECHO) "Importing binaries from component $1"; \
          $(call Unzipper,$2,$($1)/$(BIN_ZIP_FILE)); \
        fi
        endef

and the function/method `Unzipper` is defined as follows.

        # Unzip zip file $2 into directory $1 (if $2 exists)
        #   Warning: $2 must be absolute path not relative
        define Unzipper
        ( \
          $(MKDIR) -p $1; \
          $(ECHO) "( $(CD) $1 && $(UNZIP) -o $2 )"; \
          ( $(CD) $1 && $(UNZIP) -o $2 ) \
        )
        endef

I do not see where this fails. By the way, to use the native `unzip` I have=
 the following in my recipe (as send to the list [2]).

        EXTRA_OEMAKE =3D ' \
                        ZIPEXE=3D"${STAGING_BINDIR_NATIVE}/zip" \
                        UNZIP=3D"${STAGING_BINDIR_NATIVE}/unzip" \
                       '

Thanks,

Paul


[1] icedtea6-1.7.10/openjdk/jdk/make/common/internal/ImportComponents.gmk
[2] http://patches.openembedded.org/patch/4621/

--=-ZNcxmQCyt5aV5BOdXn74
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk3c4zAACgkQPX1aK2wOHVhZ0wCfVrsaFKpk9NNtUKRyi6t4Ara6
a5gAnig0VUPE3qmhluQM6bTA9GoTQiGx
=K9jE
-----END PGP SIGNATURE-----

--=-ZNcxmQCyt5aV5BOdXn74--
