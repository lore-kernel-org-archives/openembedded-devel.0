Return-Path: <denis@denix.org>
Received: from vms173009pub.verizon.net (vms173009pub.verizon.net
	[206.46.173.9])
	by mail.openembedded.org (Postfix) with ESMTP id 16AB076486
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 30 Apr 2016 00:21:53 +0000 (UTC)
Received: from vz-proxy-l003.mx.aol.com ([64.236.82.155])
	by vms173009.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O6F00FBI7O3HI90@vms173009.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Fri,
	29 Apr 2016 19:21:39 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=J+9Xl1TS c=1 sm=1 tr=0	a=i+tV1o3iWEoTTvx3QNPGxA==:117
	a=IkcTkHD0fZMA:10 a=kziv93cY1bsA:10	a=0gcC27t9AAAA:8
	a=I0zbT7l-m5epgaa-JAYA:9 a=QEXdDO2ut3YA:10
Received: by 100.15.86.14 with SMTP id 374ed435; Sat, 30 Apr 2016 00:21:39 GMT
Received: by gandalf.denix.org (Postfix, from userid 1000)	id B05E6161FD1; Fri,
	29 Apr 2016 20:21:38 -0400 (EDT)
Date: Fri, 29 Apr 2016 20:21:38 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20160430002138.GB17066@denix.org>
References: <1459471643-7183-1-git-send-email-denis@denix.org>
	<20160420182710.GN16135@denix.org> <20160425180750.GW16135@denix.org>
	<CA+chaQeA63zpMf02NYbDrxZgXdSbx2=T3=nZGmxk4h8XxOx+Xg@mail.gmail.com>
	<20160425214326.GA31113@denix.org>
	<CA+chaQduVd3gEmHO1D9YSzid0F6Lm-Mrv+Yh2rW0a=f5fQWKFQ@mail.gmail.com>
	<20160426153025.GH31113@denix.org>
	<139887C4-F77D-4838-A13A-877DDDF999CC@gmail.com>
	<20160426180758.GE2559@jama>
MIME-version: 1.0
In-reply-to: <20160426180758.GE2559@jama>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [meta-qt5][PATCH 1/2] qtdeclarative: fix compilation of examples/qquickviewcomparison
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 30 Apr 2016 00:21:56 -0000
Content-type: text/plain; charset=utf-8
Content-disposition: inline
Content-transfer-encoding: quoted-printable

On Tue, Apr 26, 2016 at 08:07:58PM +0200, Martin Jansa wrote:
> On Tue, Apr 26, 2016 at 09:38:42AM -0700, Khem Raj wrote:
> >=20
> > > On Apr 26, 2016, at 8:30 AM, Denys Dmytriyenko <denis@denix.org> wrot=
e:
> > >=20
> > > On Tue, Apr 26, 2016 at 08:37:19AM +0200, Martin Jansa wrote:
> > >> The strange part is that examples built fine here with current master
> > >> (5.5.99/5.6-beta)
> > >> without your patches.
> > >=20
> > > That is strange. Can it be toolchain-related? I'm using Linaro gcc-5.=
3, but I
> > > would expect OE-built gcc-5.3 to be as strict and fail similarly on t=
hose
> > > undeclared or incomplete classes=E2=80=A6
> >=20
> > can both of you paste the <gcc> -E -dM output of this file in question ?
> >=20
> >=20
>=20
> i586-oe-linux-g++  -m32 -march=3Di586 --sysroot=3D/OE/build/oe-core/tmp-g=
libc/sysroots/qemux86 -c -pipe -O2 -pipe -g -feliminate-unused-debug-types =
-fdebug-prefix-map=3D/OE/build/oe-core/tmp-glibc/work/i586-oe-linux/qtdecla=
rative/5.5.99+5.6.0-rc+gitAUTOINC+0fab5761d5-r0=3D/usr/src/debug/qtdeclarat=
ive/5.5.99+5.6.0-rc+gitAUTOINC+0fab5761d5-r0 -fdebug-prefix-map=3D/OE/build=
/oe-core/tmp-glibc/sysroots/x86_64-linux=3D -fdebug-prefix-map=3D/OE/build/=
oe-core/tmp-glibc/sysroots/qemux86=3D  -fvisibility-inlines-hidden -O2 -std=
=3Dgnu++0x -fno-exceptions -Wall -W -D_REENTRANT -fPIC -DQT_NO_MTDEV -DQT_N=
O_TSLIB -DQT_NO_LIBINPUT -DQT_NO_EXCEPTIONS -D_LARGEFILE64_SOURCE -D_LARGEF=
ILE_SOURCE -DQT_NO_DEBUG -DQT_QUICKWIDGETS_LIB -DQT_QUICK_LIB -DQT_QML_LIB =
-DQT_WIDGETS_LIB -DQT_GUI_LIB -DQT_NETWORK_LIB -DQT_CORE_LIB -I/OE/build/oe=
-core/tmp-glibc/work/i586-oe-linux/qtdeclarative/5.5.99+5.6.0-rc+gitAUTOINC=
+0fab5761d5-r0/git/examples/quick/quickwidgets/qquickviewcomparison -I. -I.=
=2E/../../../include -I../../../../include/QtQuickWidgets -I../../../.
> ./include/QtQuick -I../../../../include/QtQml -isystem /OE/build/oe-core/=
tmp-glibc/sysroots/qemux86/usr/include/qt5 -isystem /OE/build/oe-core/tmp-g=
libc/sysroots/qemux86/usr/include/qt5/QtWidgets -isystem /OE/build/oe-core/=
tmp-glibc/sysroots/qemux86/usr/include/qt5/QtGui -isystem /OE/build/oe-core=
/tmp-glibc/sysroots/qemux86/usr/include/qt5/QtNetwork -isystem /OE/build/oe=
-core/tmp-glibc/sysroots/qemux86/usr/include/qt5/QtCore -I.moc -isystem /OE=
/build/oe-core/tmp-glibc/sysroots/qemux86/usr/include/libdrm -I/OE/build/oe=
-core/tmp-glibc/sysroots/qemux86/usr/lib/qt5/mkspecs/linux-oe-g++ -o .obj/m=
ainwindow.o /OE/build/oe-core/tmp-glibc/work/i586-oe-linux/qtdeclarative/5.=
5.99+5.6.0-rc+gitAUTOINC+0fab5761d5-r0/git/examples/quick/quickwidgets/qqui=
ckviewcomparison/mainwindow.cpp
>=20
> and mainwindow.E is attached

Sorry for the delay.
Can you please provide more detailed instructions in order to get this outp=
ut?

--=20
Denys

