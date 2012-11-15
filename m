Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TYtjM-000767-SJ
	for openembedded-devel@lists.openembedded.org;
	Thu, 15 Nov 2012 08:19:20 +0100
Received: by mail-bk0-f47.google.com with SMTP id jk7so509147bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Nov 2012 23:05:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=zDxXIhf5o1zKt3yxGQb4mGPUBisp56fJku37p684QFE=;
	b=H1fivS9VjN9LcCnLxjN0iqS1TRLhtJyJphrDNgrWB8fwm/0ONUdCrzSJcUxheZOuWb
	nmIIGfxptfvtcSU0x1grMhPY27+9inFM7bSY79cFnoDhmu6Wb891PLDHFYvhYYFb05ln
	OdW+D4y3MccAjiKFdF1MKX74p3l+IdiAXJAGgIIIjXXZlBlinM7kNXsQoiRdJMiTlNSr
	g//SGv054MYfUTaKL6GbauUNkSderIX2Oqd+t2MyLlfauX9Xy+4GpMnZaXbz0SEud6oU
	o3/YtC5/rnIGKs3DbBxwZe6eERX32H7KK16rLOdB4R9YtFLqPZLu/x3quI9GL1vcZ5+g
	/nag==
Received: by 10.204.7.213 with SMTP id e21mr48812bke.32.1352963124008;
	Wed, 14 Nov 2012 23:05:24 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id go4sm9005129bkc.15.2012.11.14.23.05.17
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 14 Nov 2012 23:05:18 -0800 (PST)
Date: Thu, 15 Nov 2012 08:05:31 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20121115070531.GP3928@jama.jama.net>
References: <50A43F5A.7030806@mlbassoc.com>
MIME-Version: 1.0
In-Reply-To: <50A43F5A.7030806@mlbassoc.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: Unable to build python-pyqt
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
X-List-Received-Date: Thu, 15 Nov 2012 07:19:21 -0000
X-Groupsio-MsgNum: 41510
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="EkxpYdHiqGHPYbUt"
Content-Disposition: inline

--EkxpYdHiqGHPYbUt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 14, 2012 at 06:03:22PM -0700, Gary Thomas wrote:
> I'm trying to build python-pyqt using the latest meta-openembedded
> alongside Poky/Yocto distribution.  It's failing with a slew of errors:
>=20
> | arm-poky-linux-gnueabi-g++  -march=3Darmv7-a     -mthumb-interwork -mfl=
oat-abi=3Dhard -mfpu=3Dneon -mtune=3Dcortex-a9 --sysroot=3D/local/p82_new/t=
mp/sysroots/my_target -c -pipe -pipe -pipe=20
> -O2 -pipe -g -feliminate-unused-debug-types -O2 -pipe -g -feliminate-unus=
ed-debug-types -fpermissive -fvisibility-inlines-hidden -fno-strict-aliasin=
g -O2 -O2 -fPIC -fPIC -fPIC=20
> -Wall -W -Wall -W -Wall -W -D_REENTRANT -DQT_NO_DEBUG -DQT_GUI_LIB -DQT_C=
ORE_LIB -DQT_SHARED -I/local/p82_new/tmp/sysroots/my_target/usr/share/qtopi=
a/mkspecs/linux-g++ -I.=20
> -I/local/p82_new/tmp/sysroots/my_target/usr/include/qtopia/QtCore -I/loca=
l/p82_new/tmp/sysroots/my_target/usr/include/qtopia/QtGui=20
> -I/local/p82_new/tmp/sysroots/my_target/usr/include/qtopia -I../../QtCore=
 -I../../QtCore -I/local/p82_new/tmp/sysroots/my_target/usr/include/qtopia/=
Qt=20
> -I/local/p82_new/tmp/sysroots/my_target/usr/include/python2.7 -I../qpy/Qt=
Core -I../qpy/QtGui -I../qpy/QtDeclarative=20
> -I/local/p82_new/tmp/sysroots/my_target/usr/include/qtopia/QtCore -I/loca=
l/p82_new/tmp/sysroots/my_target/usr/include/qtopia/QtGui=20
> -I/local/p82_new/tmp/sysroots/my_target/usr/include/qtopia/QtDeclarative =
-I/local/p82_new/tmp/sysroots/my_target/usr/include/qtopia/QtWebKit=20
> -I/local/p82_new/tmp/sysroots/my_target/usr/include/qtopia/QtNetwork -I. =
-o qpycore_qabstracteventdispatcher.o qpycore_qabstracteventdispatcher.cpp
> | In file included from ../../QtCore/sipAPIQtCore.h:33:0,
> |                  from qpycore_sip.h:32,
> |                  from qpycore_qabstracteventdispatcher.cpp:30:
> | /local/p82_new/tmp/sysroots/my_target/usr/include/sip.h:983:29: error: =
expected unqualified-id before ';' token
> | /local/p82_new/tmp/sysroots/my_target/usr/include/sip.h:1202:52: error:=
 expected ',' or '...' before 'new'
> | In file included from qpycore_sip.h:32:0,
> |                  from qpycore_qabstracteventdispatcher.cpp:30:
> | QtCore/sipAPIQtCore.h:8603:8: error: 'pyqt4ClassTypeDef' does not name =
a type
> | QtCore/sipAPIQtCore.h:8747:8: error: 'pyqt4ClassTypeDef' does not name =
a type
> | QtCore/sipAPIQtCore.h:8752:8: error: 'pyqt4ClassTypeDef' does not name =
a type
>          ...
> | qpycore_qabstracteventdispatcher.cpp: In function 'bool event_filter(vo=
id*)':
> | qpycore_qabstracteventdispatcher.cpp:98:5: error: 'SIP_BLOCK_THREADS' w=
as not declared in this scope
> | qpycore_qabstracteventdispatcher.cpp:104:5: error: expected ';' before =
'PyObject'
> | qpycore_qabstracteventdispatcher.cpp:107:9: error: 'msg_obj' was not de=
clared in this scope
> | qpycore_qabstracteventdispatcher.cpp:137:5: error: 'SIP_UNBLOCK_THREADS=
' was not declared in this scope
> | qpycore_qabstracteventdispatcher.cpp:139:5: error: expected ';' before =
'return'
>=20
> This is using the meta-oe/recipes-devtools/python/python-pyqt_4.9.5.bb
> Poky/Yocto master 1fd9a16d2
>=20
> I assume that this package built at the time of the last patch:

Yes it did and still does here (4 different hosts) for both qt 4.8.1 and 4.=
8.3.

>    commit 00fe75fb5773cf5602a20a50ed299ed287dd6ebd
>    Author: Martin Jansa <Martin.Jansa@gmail.com>
>    Date:   Thu Oct 25 00:25:53 2012 +0200
>=20
>      python-pyqt: don't bypass sstate with sip files
>=20
>      * discovered with http://patchwork.openembedded.org/patch/38521/
>=20
>      Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>=20
> What might I be doing wrong that's breaking the build?

I would check what's on those lines and is missing in your build
| /local/p82_new/tmp/sysroots/my_target/usr/include/sip.h:983:29:
error: expected unqualified-id before ';' token
| /local/p82_new/tmp/sysroots/my_target/usr/include/sip.h:1202:52:
error: expected ',' or '...' before 'new'

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--EkxpYdHiqGHPYbUt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlCklDsACgkQN1Ujt2V2gByl9ACdF5BZDG6EXoH0yj68K2Euvirm
hsoAnjm+G7hHPIduqQK2smBPugYJCW8V
=mR7k
-----END PGP SIGNATURE-----

--EkxpYdHiqGHPYbUt--
