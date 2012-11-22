Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TbZxf-0006bF-Sp
	for openembedded-devel@lists.openembedded.org;
	Thu, 22 Nov 2012 17:49:11 +0100
Received: by mail-ee0-f47.google.com with SMTP id l10so4606649eei.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Nov 2012 08:35:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=uTKZ+lOHuh7nYhPfyojpaPs9Gzdjm+fO5H7GW9wCoLQ=;
	b=GoWkYo5OfGAnPfFsIpGKpCKfY0lfeJJ/8EUHIGIaBX9gi9u/0wJiztZ1GU8+bS+rX4
	1+cqClozaUlQGEP80NCAdsqffTIbMDJAcTbUxOjFqsLhAyegIXzl66GwH/ASHcxn/kCe
	mUdtXf2u61fUHLn/3cVmbuy8mrq/uGSpf9g5G7TzaX1i+vSuUp6zTFM95zXCPwTLWpZ1
	BDKxvy77DFIY0KrsDkuWZi5+FEphOBYu/1FZ5bbeyxe/AIIiEdVDnBudBTI00A8zsSrQ
	w0o3e6kYwHsxwho8RFYs1IF83bL1gYUkY60RBcOzl8AowlfCLz862VTIVk/lILhbXuKG
	WUCA==
Received: by 10.14.213.7 with SMTP id z7mr2778417eeo.39.1353602105425;
	Thu, 22 Nov 2012 08:35:05 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id e7sm7900747eep.1.2012.11.22.08.35.04
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 22 Nov 2012 08:35:04 -0800 (PST)
Date: Thu, 22 Nov 2012 17:35:02 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20121122163502.GH12637@jama.jama.net>
References: <20121122123447.GB12637@jama.jama.net>
MIME-Version: 1.0
In-Reply-To: <20121122123447.GB12637@jama.jama.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: evolution-data-server and php-native broken by libxml2 upgrade in oe-core
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
X-List-Received-Date: Thu, 22 Nov 2012 16:49:12 -0000
X-Groupsio-MsgNum: 41651
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="42/8TDB0GUY6FXEm"
Content-Disposition: inline

--42/8TDB0GUY6FXEm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 22, 2012 at 01:34:47PM +0100, Martin Jansa wrote:
> Just FYI:
>=20
> meta-gnome/recipes-gnome/eds/evolution-data-server_git.bb

newer e-d-s does not have that problem, because they depend on external
libgdata now
http://git.gnome.org/browse/evolution-data-server/commit/servers?h=3Dgnome-=
2-32&id=3D28897beab5dcd4aab3586322a96280be92585db6

And here is error from that build:
| arm-oe-linux-gnueabi-libtool: compile:  arm-oe-linux-gnueabi-gcc -march=
=3Darmv4t -mthumb -mthumb-interwork -mtune=3Darm920t --sysroot=3D/OE/jansa-=
test
/shr-core/tmp-eglibc/sysroots/om-gta02 -DHAVE_CONFIG_H -I. -I../../.. -DG_D=
ISABLE_DEPRECATED -DPANGO_DISABLE_DEPRECATED -DGDK_PIXBUF_DISABLE_DEPRE
CATED -DG_DISABLE_SINGLE_INCLUDES -DGTK_DISABLE_SINGLE_INCLUDES -Wall -Wext=
ra -Wno-missing-field-initializers -Wno-sign-compare -Wno-unused-parame
ter -Wdeclaration-after-statement -Werror-implicit-function-declaration -Wf=
ormat-security -Winit-self -Wmissing-declarations -Wmissing-include-dir
s -Wmissing-noreturn -Wnested-externs -Wpointer-arith -Wredundant-decls -Wu=
ndef -Wwrite-strings -fno-strict-aliasing -DG_LOG_DOMAIN=3D\"libgdata\" -
I../../.. -I../../.. -pthread -I/OE/jansa-test/shr-core/tmp-eglibc/sysroots=
/om-gta02/usr/include/libsoup-2.4 -I/OE/jansa-test/shr-core/tmp-eglibc/
sysroots/om-gta02/usr/include/libxml2 -I/OE/jansa-test/shr-core/tmp-eglibc/=
sysroots/om-gta02/usr/include/glib-2.0 -I/OE/jansa-test/shr-core/tmp-eg
libc/sysroots/om-gta02/usr/lib/glib-2.0/include -O2 -pipe -g -feliminate-un=
used-debug-types -c gdata-service-iface.c  -fPIC -DPIC -o .libs/libgdat
a_1_2_la-gdata-service-iface.o
| gdata-entry.c: In function 'gdata_entry_get_property':
| gdata-entry.c:278:21: warning: variable 'priv' set but not used [-Wunused=
-but-set-variable]
| gdata-entry.c: In function 'gdata_entry_set_property':
| gdata-entry.c:288:21: warning: variable 'priv' set but not used [-Wunused=
-but-set-variable]
| gdata-feed.c: In function 'gdata_feed_get_property':
| gdata-feed.c:258:20: warning: variable 'priv' set but not used [-Wunused-=
but-set-variable]
| gdata-feed.c: In function 'gdata_feed_set_property':
| gdata-feed.c:270:20: warning: variable 'priv' set but not used [-Wunused-=
but-set-variable]
| gdata-entry.c: In function 'gdata_entry_new_from_xmlptr':
| gdata-entry.c:880:46: error: dereferencing pointer to incomplete type
| gdata-entry.c:882:44: error: dereferencing pointer to incomplete type
| gdata-feed.c: In function 'gdata_feed_generate_xml':
| gdata-feed.c:580:25: warning: variable 'ns_gcal' set but not used [-Wunus=
ed-but-set-variable]
| gdata-feed.c:580:18: warning: variable 'ns_gd' set but not used [-Wunused=
-but-set-variable]
| gdata-feed.c:580:11: warning: variable 'ns_os' set but not used [-Wunused=
-but-set-variable]
| gdata-entry.c: In function 'gdata_entry_generate_xml':
| gdata-entry.c:1054:11: warning: variable 'ns' set but not used [-Wunused-=
but-set-variable]
| gdata-entry.c: In function 'gdata_entry_get_description':
| gdata-entry.c:1244:21: warning: variable 'priv' set but not used [-Wunuse=
d-but-set-variable]
| make[4]: *** [libgdata_1_2_la-gdata-entry.lo] Error 1
| make[4]: *** Waiting for unfinished jobs....
| make[4]: Leaving directory `/OE/jansa-test/shr-core/tmp-eglibc/work/armv4=
t-oe-linux-gnueabi/evolution-data-server/2.30+git1+3ca578d968d09785933ebbb4=
5b66b3bccdbd5832-r3/git/servers/google/libgdata'


> virtual:native:meta-openembedded/meta-oe/recipes-devtools/php/php_5.3.6.bb
>=20
> are broken after lixml2 upgrade from 2.8.0 to 2.9.0 (oe-core rev
> a65ea43e26866ddc60051c52b2eb226507fae346)
>=20
> They are pretty low priority for me right now, so I'm just sending this
> e-mail instead of patches :).=20
>=20
> Hrw is already working on php.
>=20
> Cheers,
>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com



--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--42/8TDB0GUY6FXEm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlCuVDYACgkQN1Ujt2V2gBxsYACeLzFhCPSXABcc4rzGOHWYS1UP
zX4An01y0uBw57VYnrAKzMf0bZmRgz9y
=FLiP
-----END PGP SIGNATURE-----

--42/8TDB0GUY6FXEm--
