Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QJp4Y-0002fS-9Y for openembedded-devel@lists.openembedded.org;
	Tue, 10 May 2011 17:42:06 +0200
Received: from f053032140.adsl.alicedsl.de ([78.53.32.140]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QJp39-0001Ko-So for openembedded-devel@lists.openembedded.org;
	Tue, 10 May 2011 15:40:40 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1305024190-24481-1-git-send-email-Martin.Jansa@gmail.com>
References: <1305024190-24481-1-git-send-email-Martin.Jansa@gmail.com>
Date: Tue, 10 May 2011 17:39:20 +0200
Message-ID: <1305041960.4259.10.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: Re: [PATCH] gnome-desktop-2.32.1: disable desktop docs
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
X-List-Received-Date: Tue, 10 May 2011 15:42:06 -0000
X-Groupsio-MsgNum: 31875
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-Y/2JEa+95oC5zvhVnXvQ"

--=-Y/2JEa+95oC5zvhVnXvQ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Dienstag, den 10.05.2011, 12:43 +0200 schrieb Martin Jansa:
> * we don't have gnome-doc-utils-native in DEPENDS to provide xml2po and i=
t calls
>   `which xml2po` -m docbook -e -t "${mo}"
>   which doesnt work on host without xml2po
> * if we add gnome-doc-utils-native to DEPENDS then it still fails:
>   | xsltproc -o fdl-C.omf --stringparam db2omf.basename fdl --stringparam=
 db2omf.format 'docbook' --stringparam db2omf.dtd "-//OASIS//DTD DocBook XM=
L V4.1.2//EN" --stringparam db2omf.lang C --stringparam db2omf.omf_dir "/us=
r/share/omf" --stringparam db2omf.help_dir "/usr/share/gnome/help" --string=
param db2omf.omf_in "/OE/tmpdir-shr/work/armv4t-oe-linux-gnueabi/gnome-desk=
top-2.32.1-r0/gnome-desktop-2.32.1/desktop-docs/fdl/fdl.omf.in"  `/OE/tmpdi=
r-shr/sysroots/x86_64-linux/usr/bin/pkg-config --variable db2omf gnome-doc-=
utils` C/fdl.xml || { rm -f "fdl-C.omf"; exit 1; }
>   | warning: failed to load external entity "/usr/share/xml/gnome/xslt/do=
cbook/omf/db2omf.xsl"
>   because pkg-config returns xsl path without sysroot prefix
>   /OE/tmpdir-shr/sysroots/x86_64-linux/usr/bin/pkg-config --variable db2o=
mf gnome-doc-utils
>   /usr/share/xml/gnome/xslt/docbook/omf/db2omf.xsl
> * feel free to fix gnome-doc-utils-native/gnome-doc-utils if you care abo=
ut desktop docs

The problem is the path

	/usr/share/xml/gnome/xslt/docbook/omf/db2omf.xsl

is constructed from the variable `datadir` in the pc file of
gnome-doc-utils. I only see a problem that we cannot just put
`PKG_CONFIG_SYSROOT_DIR` in front of it, that some programs could take
this value during compile time to actually store data in it during run
time.

Evince suffers from the same problem as far as I know [1]. How should
that be fixed properly upstream? Any ideas [2]?

> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>

[=E2=80=A6]

With the bit Phil pointed out corrected this patch is

Acked-by: Paul Menzel <paulepanter@users.sourceforge.net>

I build tested it using `angstrom-2010.x` for `MACHINE =3D "beagleboard"`.


Thanks,

Paul


[1] http://lists.freedesktop.org/archives/pkg-config/2011-April/000717.html
[2] http://lists.freedesktop.org/archives/pkg-config/2011-May/000742.html

--=-Y/2JEa+95oC5zvhVnXvQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk3JXCgACgkQPX1aK2wOHVj5nACePBNvSS+F8/awBIzhFU683TV8
nmUAn3yRS8QWZmZn4mGA0HGIewBNTfxQ
=176E
-----END PGP SIGNATURE-----

--=-Y/2JEa+95oC5zvhVnXvQ--
