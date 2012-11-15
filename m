Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TYyen-0003dp-UL
	for openembedded-devel@lists.openembedded.org;
	Thu, 15 Nov 2012 13:34:58 +0100
Received: by mail-bk0-f47.google.com with SMTP id jk7so644644bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Nov 2012 04:21:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=4oDZ6y6euC3I/YBSpyS1W0zK8QSWEoTPgRTmok8W/G0=;
	b=S3cMXC452WRCwdTTW4Q6tGFmZaE41XRtLrg6UtWCISS8ZW9IaPbEJ2ZFIMUwIcoqz0
	ItkUZMmA214XrnGpWvwsWL2AacRdLGrioOMlybDmaW6QYytgYZfcCJcCyaU6ALCHyPcg
	Skg/gy/Y1w3ND0exRIzleAmbdQYZhGXXmnUsrkT0pPsjrcueqR85MNU3eYPdbnbQPxZI
	AheZS5dqblM2KiGOXsDW7Aa0xwRkxDlG3/e024SIJrAQKV1WlWHLbgsIujYrp0XxRVkW
	Bgfor8FoRqtRm/o2mtNUF/uFvEzFHHXKcpNy/bRPWBCKRQFYdat/0veWUJAb8r5XAia6
	EYVg==
Received: by 10.204.147.18 with SMTP id j18mr310506bkv.79.1352982057719;
	Thu, 15 Nov 2012 04:20:57 -0800 (PST)
Received: from localhost ([94.230.152.246]) by mx.google.com with ESMTPS id
	ht18sm10098152bkc.14.2012.11.15.04.20.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 15 Nov 2012 04:20:56 -0800 (PST)
Date: Thu, 15 Nov 2012 13:21:10 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20121115122110.GA17521@jama.jama.net>
References: <50A43F5A.7030806@mlbassoc.com>
	<20121115070531.GP3928@jama.jama.net>
	<50A4D8E7.1000907@mlbassoc.com>
MIME-Version: 1.0
In-Reply-To: <50A4D8E7.1000907@mlbassoc.com>
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
X-List-Received-Date: Thu, 15 Nov 2012 12:34:58 -0000
X-Groupsio-MsgNum: 41515
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="VS++wcV0S1rZb1Fb"
Content-Disposition: inline

--VS++wcV0S1rZb1Fb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 15, 2012 at 04:58:31AM -0700, Gary Thomas wrote:
> On 2012-11-15 00:05, Martin Jansa wrote:
> > On Wed, Nov 14, 2012 at 06:03:22PM -0700, Gary Thomas wrote:
> >> I'm trying to build python-pyqt using the latest meta-openembedded
> >> alongside Poky/Yocto distribution.  It's failing with a slew of errors:
> >>
> >> | arm-poky-linux-gnueabi-g++  -march=3Darmv7-a     -mthumb-interwork -=
mfloat-abi=3Dhard -mfpu=3Dneon -mtune=3Dcortex-a9 --sysroot=3D/local/p82_ne=
w/tmp/sysroots/my_target -c -pipe -pipe -pipe
> >> -O2 -pipe -g -feliminate-unused-debug-types -O2 -pipe -g -feliminate-u=
nused-debug-types -fpermissive -fvisibility-inlines-hidden -fno-strict-alia=
sing -O2 -O2 -fPIC -fPIC -fPIC
> >> -Wall -W -Wall -W -Wall -W -D_REENTRANT -DQT_NO_DEBUG -DQT_GUI_LIB -DQ=
T_CORE_LIB -DQT_SHARED -I/local/p82_new/tmp/sysroots/my_target/usr/share/qt=
opia/mkspecs/linux-g++ -I.
> >> -I/local/p82_new/tmp/sysroots/my_target/usr/include/qtopia/QtCore -I/l=
ocal/p82_new/tmp/sysroots/my_target/usr/include/qtopia/QtGui
> >> -I/local/p82_new/tmp/sysroots/my_target/usr/include/qtopia -I../../QtC=
ore -I../../QtCore -I/local/p82_new/tmp/sysroots/my_target/usr/include/qtop=
ia/Qt
> >> -I/local/p82_new/tmp/sysroots/my_target/usr/include/python2.7 -I../qpy=
/QtCore -I../qpy/QtGui -I../qpy/QtDeclarative
> >> -I/local/p82_new/tmp/sysroots/my_target/usr/include/qtopia/QtCore -I/l=
ocal/p82_new/tmp/sysroots/my_target/usr/include/qtopia/QtGui
> >> -I/local/p82_new/tmp/sysroots/my_target/usr/include/qtopia/QtDeclarati=
ve -I/local/p82_new/tmp/sysroots/my_target/usr/include/qtopia/QtWebKit
> >> -I/local/p82_new/tmp/sysroots/my_target/usr/include/qtopia/QtNetwork -=
I. -o qpycore_qabstracteventdispatcher.o qpycore_qabstracteventdispatcher.c=
pp
> >> | In file included from ../../QtCore/sipAPIQtCore.h:33:0,
> >> |                  from qpycore_sip.h:32,
> >> |                  from qpycore_qabstracteventdispatcher.cpp:30:
> >> | /local/p82_new/tmp/sysroots/my_target/usr/include/sip.h:983:29: erro=
r: expected unqualified-id before ';' token
> >> | /local/p82_new/tmp/sysroots/my_target/usr/include/sip.h:1202:52: err=
or: expected ',' or '...' before 'new'
> >> | In file included from qpycore_sip.h:32:0,
> >> |                  from qpycore_qabstracteventdispatcher.cpp:30:
> >> | QtCore/sipAPIQtCore.h:8603:8: error: 'pyqt4ClassTypeDef' does not na=
me a type
> >> | QtCore/sipAPIQtCore.h:8747:8: error: 'pyqt4ClassTypeDef' does not na=
me a type
> >> | QtCore/sipAPIQtCore.h:8752:8: error: 'pyqt4ClassTypeDef' does not na=
me a type
> >>           ...
> >> | qpycore_qabstracteventdispatcher.cpp: In function 'bool event_filter=
(void*)':
> >> | qpycore_qabstracteventdispatcher.cpp:98:5: error: 'SIP_BLOCK_THREADS=
' was not declared in this scope
> >> | qpycore_qabstracteventdispatcher.cpp:104:5: error: expected ';' befo=
re 'PyObject'
> >> | qpycore_qabstracteventdispatcher.cpp:107:9: error: 'msg_obj' was not=
 declared in this scope
> >> | qpycore_qabstracteventdispatcher.cpp:137:5: error: 'SIP_UNBLOCK_THRE=
ADS' was not declared in this scope
> >> | qpycore_qabstracteventdispatcher.cpp:139:5: error: expected ';' befo=
re 'return'
> >>
> >> This is using the meta-oe/recipes-devtools/python/python-pyqt_4.9.5.bb
> >> Poky/Yocto master 1fd9a16d2
> >>
> >> I assume that this package built at the time of the last patch:
> >
> > Yes it did and still does here (4 different hosts) for both qt 4.8.1 an=
d 4.8.3.
>=20
> What distribution layers are you using?
meta-jama         =3D "master:7ecd04df5f040e79c140e87802e48cdf89978ade"
meta-shr
meta-aurora
meta-fso
meta-android      =3D "jansa/test:cfe203305e46f32f5ae3ea788552f9fd681cd790"
meta-oe
meta-efl
meta-gnome
meta-gpe
meta-multimedia
meta-networking
meta-initramfs
meta-systemd      =3D "jansa/test:3bc7f5d5b5c87f321b5f824785f8618a194097b4"
meta-osmocombb
meta-nokia
meta-htc
meta-palm
meta-openmoko
meta-samsung      =3D "jansa/test:cfe203305e46f32f5ae3ea788552f9fd681cd790"
meta-browser      =3D "jansa/test:b8f4a7e489907bbaf99d4059192ddf93ef1e54bc"
meta-handheld     =3D "jansa/spitz:cb3a1aba74900438bc304675262e1f749d34a657"
meta-webos-shr    =3D "master:d8dfa37c945a33a8bb5644f897e700ad0b593468"
meta              =3D "jansa/test:3ff3d7ff8e5a1400fbbb7d4873ad1a7dbadd0f29"

note that jansa/test branches don't have anything related to python-pyqt,=
=20
so you can use master branches if they parse now.

> What's your target?

om-gta02, om-gta04, nokia900, tuna, qemux86, qemuarm, qemux86-64, spitz

> What compiler are you using (currently I'm at 4.7.2-r13)?

the same

> I had troubles with sip-native:
>    ERROR: Fetcher failure: Fetch command failed with exit code 8, output:
>    http://www.riverbankcomputing.com/static/Downloads/sip4/sip-4.13.3.tar=
=2Egz:
>    2012-11-15 04:53:17 ERROR 404: Not Found.
> How do you get around this?

sip-4.13.3.tar.gz on SHR premirror, older versions are moved to SF mirror:
http://sourceforge.net/projects/pyqt/files/sip/

> I'd like to duplicate what you've done so I can figure out what's wrong.

You can follow this:
http://shr-project.org/trac/wiki/Building%20SHR

>=20
> >
> >>     commit 00fe75fb5773cf5602a20a50ed299ed287dd6ebd
> >>     Author: Martin Jansa <Martin.Jansa@gmail.com>
> >>     Date:   Thu Oct 25 00:25:53 2012 +0200
> >>
> >>       python-pyqt: don't bypass sstate with sip files
> >>
> >>       * discovered with http://patchwork.openembedded.org/patch/38521/
> >>
> >>       Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> >>
> >> What might I be doing wrong that's breaking the build?
> >
> > I would check what's on those lines and is missing in your build
> > | /local/p82_new/tmp/sysroots/my_target/usr/include/sip.h:983:29:
> > error: expected unqualified-id before ';' token
> > | /local/p82_new/tmp/sysroots/my_target/usr/include/sip.h:1202:52:
> > error: expected ',' or '...' before 'new'

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--VS++wcV0S1rZb1Fb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlCk3jYACgkQN1Ujt2V2gBwOsQCfWN1L7kfq3m7gPleSHDXq7LLa
G/AAn3Wy3r6K4M37Y0V71aGWFQuK+9H3
=S6Rq
-----END PGP SIGNATURE-----

--VS++wcV0S1rZb1Fb--
