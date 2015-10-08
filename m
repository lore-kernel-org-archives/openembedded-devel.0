Return-Path: <Noor_Ahsan@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id EB14D60232
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  8 Oct 2015 17:18:06 +0000 (UTC)
Received: from nat-ies.mentorg.com ([192.94.31.2]
	helo=SVR-IES-FEM-01.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1ZkEpR-0001H1-J9 from Noor_Ahsan@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Thu, 08 Oct 2015 10:18:06 -0700
Received: from EU-MBX-01.mgc.mentorg.com ([169.254.1.18]) by
	SVR-IES-FEM-01.mgc.mentorg.com ([137.202.0.104]) with mapi id
	14.03.0224.002; Thu, 8 Oct 2015 18:18:04 +0100
From: "Ahsan, Noor" <Noor_Ahsan@mentor.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [Meta-qt5] Multiple definition of None on
	qminimaleglintegration for BBB
Thread-Index: AQHRAe1KRdBmf6QqgEuuu+GRUidOKA==
Date: Thu, 8 Oct 2015 17:18:04 +0000
Message-ID: <365E1805BC95084CBE82381A0B86999401095F4A37@EU-MBX-01.mgc.mentorg.com>
References: <365E1805BC95084CBE82381A0B86999401095F2C61@EU-MBX-01.mgc.mentorg.com>
	<75C05298-D139-4FC3-938A-18FABB43F5CF@gmail.com>
In-Reply-To: <75C05298-D139-4FC3-938A-18FABB43F5CF@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [137.202.0.76]
MIME-Version: 1.0
Cc: "Haridasan, Sujith" <Sujith_Haridasan@mentor.com>, "Larson,
	Chris" <Chris_Larson@mentor.com>
Subject: Re: [Meta-qt5] Multiple definition of None on	qminimaleglintegration for BBB
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 08 Oct 2015 17:18:08 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello Khem,

This issue comes when X.h and qurl.h is included at the same time. We faced=
 this issue on different file on i.mx6 and Alexander fixed that issue by re=
arranging the headers in C file see patch 0012-qeglplatformscreen.cpp-reord=
er-headers-to-fix-build-.patch. Now we are facing this on other file for BB=
B I thought I should ask whether somebody else faced this issue or know the=
 fix.

Noor

-----Original Message-----
From: openembedded-devel-bounces@lists.openembedded.org [mailto:openembedde=
d-devel-bounces@lists.openembedded.org] On Behalf Of Khem Raj
Sent: Thursday, October 08, 2015 6:32 AM
To: Martin Jansa
Cc: Haridasan, Sujith; Larson, Chris
Subject: Re: [oe] [Meta-qt5] Multiple definition of None on qminimaleglinte=
gration for BBB


> On Oct 7, 2015, at 4:20 AM, Ahsan, Noor <Noor_Ahsan@mentor.com> wrote:
>=20
> Hello,
>=20
> We were building QT5 on BBB and we faced similar issue which has been fix=
ed in 0012-qeglplatformscreen.cpp-reorder-headers-to-fix-build-.patch0012-q=
eglplatformscreen.cpp-reorder-headers-to-fix-build-.patch but this time it =
is on qminimaleglintegration file. Can anybody guide us how to fix this iss=
ue. I added following code in qurl.h for previous issue but community said =
that there is better fix.
>=20
> #ifdef None
> #undef None
> #endif
>=20

None is defined as 0 for universal null resource in X11 headers (X11/X.h) I=
IRC, so its likely that this file has dependency on x11 and you are not sup=
plying that ?
may be you should see if you are missing some QT feature


> The stripped error log is shown below.
>=20
> linking ../../../../plugins/platforminputcontexts/libcomposeplatforminput=
contextplugin.so
> mv -f libqminimal.so ../../../../plugins/platforms/
> make[4]: Leaving directory '/scratch/cedar/boneblack/build/tmp/work/corte=
xa8hf-vfp-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/buil=
d/src/plugins/platforms/minimal'
> cd minimalegl/ && ( test -e Makefile || /scratch/cedar/boneblack/build/tm=
p/work/cortexa8hf-vfp-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f=
59ee-r0/build/bin/qmake /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-=
vfp-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/pl=
ugins/platforms/minimalegl/minimalegl.pro -o Makefile ) && make -f Makefile
> mv -f libcomposeplatforminputcontextplugin.so ../../../../plugins/platfor=
minputcontexts/
> make[4]: Leaving directory '/scratch/cedar/boneblack/build/tmp/work/corte=
xa8hf-vfp-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/buil=
d/src/plugins/platforminputcontexts/compose'
> compiling /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel=
-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/bearer=
/generic/main.cpp
> compiling /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel=
-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/platfo=
rms/eglfs/qeglfsscreen.cpp
> moc /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-linux=
-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/bearer/qnetw=
orksession_impl.cpp
> make[4]: Entering directory '/scratch/cedar/boneblack/build/tmp/work/cort=
exa8hf-vfp-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/bui=
ld/src/plugins/platforms/minimalegl'
> moc /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-linux=
-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/platforms/mi=
nimalegl/main.cpp
> compiling /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel=
-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/platfo=
rms/offscreen/qoffscreenintegration_dummy.cpp
> compiling /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel=
-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/platfo=
rms/minimalegl/qminimaleglintegration.cpp
> moc /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-linux=
-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/bearer/netwo=
rkmanager/qnetworkmanagerservice.h
> compiling /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel=
-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/platfo=
rms/minimalegl/qminimaleglwindow.cpp
> compiling .moc/moc_qgenericengine.cpp
> moc /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-linux=
-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/platforminpu=
tcontexts/ibus/main.cpp
> moc /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-linux=
-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/bearer/netwo=
rkmanager/qnetworkmanagerengine.h
> compiling /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel=
-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/platfo=
rms/xcb/qxcbscreen.cpp
> moc /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-linux=
-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/platforminpu=
tcontexts/ibus/qibusplatforminputcontext.h
> moc /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-linux=
-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/generic/tuio=
touch/qtuiohandler_p.h
> moc /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-linux=
-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/bearer/linux=
_common/qofonoservice_linux_p.h
> moc /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-linux=
-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/platforminpu=
tcontexts/ibus/qibusproxy.h
> compiling /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel=
-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/generi=
c/tuiotouch/main.cpp
> compiling /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel=
-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/platfo=
rms/eglfs/qeglfshooks.cpp
> compiling .moc/moc_qnetworksession_impl.cpp
> compiling /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel=
-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/platfo=
rms/xcb/qxcbwindow.cpp
> moc /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-linux=
-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/bearer/qnetw=
orksession_impl.h
> In file included from /scratch/cedar/boneblack/build/tmp/sysroots/mel-am3=
35x-boneblack/usr/include/X11/Xlib.h:44:0,
>                 from /scratch/cedar/boneblack/build/tmp/sysroots/mel-am33=
5x-boneblack/usr/include/EGL/eglplatform.h:75,
>                 from /scratch/cedar/boneblack/build/tmp/sysroots/mel-am33=
5x-boneblack/usr/include/EGL/egl.h:35,
>                 from /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-v=
fp-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plu=
gins/platforms/minimalegl/qminimaleglscreen.h:41,
>                 from /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-v=
fp-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plu=
gins/platforms/minimalegl/qminimaleglintegration.h:37,
>                 from /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-v=
fp-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plu=
gins/platforms/minimalegl/qminimaleglintegration.cpp:34:
> ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:131:9: erro=
r: expected identifier before numeric constant
>         None =3D 0x0,
>         ^
> In file included from ../../../../include/QtCore/qtextstream.h:1:0,
>                 from ../../../../include/QtCore/../../../git/src/corelib/=
io/qdebug.h:42,
>                 from ../../../../include/QtCore/qdebug.h:1,
>                 from ../../../../include/QtCore/../../../git/src/corelib/=
io/qloggingcategory.h:38,
>                 from ../../../../include/QtCore/qloggingcategory.h:1,
>                 from ../../../../include/QtCore/QLoggingCategory:1,
>                 from /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-v=
fp-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plu=
gins/platforms/eglfs/qeglfshooks.cpp:35:
> ../../../../include/QtCore/../../../git/src/corelib/io/qtextstream.h:46:2=
: error: #error qtextstream.h must be included before any header file that =
defines Status
> #error qtextstream.h must be included before any header file that defines=
 Status
>  ^
> ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:131:9: erro=
r: expected '}' before numeric constant
> ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:131:9: erro=
r: expected unqualified-id before numeric constant
> In file included from ../../../../include/QtCore/qurl.h:1:0,
>                 from ../../../../include/QtGui/../../../git/src/gui/kerne=
l/qevent.h:48,
>                 from ../../../../include/QtGui/qevent.h:1,
>                 from ../../../../include/QtGui/../../../git/src/gui/text/=
qtextlayout.h:42,
>                 from ../../../../include/QtGui/qtextlayout.h:1,
>                 from ../../../../include/QtGui/5.5.0/QtGui/private/../../=
../../../../git/src/gui/text/qtextengine_p.h:52,
>                 from ../../../../include/QtGui/5.5.0/QtGui/private/qtexte=
ngine_p.h:1,
>                 from ../../../../include/QtGui/5.5.0/QtGui/private/../../=
../../../../git/src/gui/text/qfontengine_p.h:52,
>                 from ../../../../include/QtGui/5.5.0/QtGui/private/qfonte=
ngine_p.h:1,
>                 from ../../../../include/QtGui/5.5.0/QtGui/qpa/../../../.=
./../../git/src/gui/text/qplatformfontdatabase.h:52,
>                 from ../../../../include/QtGui/5.5.0/QtGui/qpa/qplatformf=
ontdatabase.h:1,
>                 from ../../../../include/QtPlatformSupport/5.5.0/QtPlatfo=
rmSupport/private/../../../../../../git/src/platformsupport/fontdatabases/b=
asic/qbasicfontdatabase_p.h:48,
>                 from ../../../../include/QtPlatformSupport/5.5.0/QtPlatfo=
rmSupport/private/qbasicfontdatabase_p.h:1,
>                 from ../../../../include/QtPlatformSupport/5.5.0/QtPlatfo=
rmSupport/private/../../../../../../git/src/platformsupport/fontdatabases/g=
enericunix/qgenericunixfontdatabase_p.h:54,
>                 from ../../../../include/QtPlatformSupport/5.5.0/QtPlatfo=
rmSupport/private/qgenericunixfontdatabase_p.h:1,
>                 from /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-v=
fp-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plu=
gins/platforms/minimalegl/qminimaleglintegration.cpp:39:
> ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:163:26: err=
or: 'UrlFormattingOption' was not declared in this scope
>     typedef QUrlTwoFlags<UrlFormattingOption, ComponentFormattingOption> =
FormattingOptions;
>                          ^
> compiling .moc/moc_qbearerengine_impl.cpp
> compiling /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel=
-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/bearer=
/connman/qconnmanengine.cpp
> ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:163:72: err=
or: template argument 1 is invalid
>     typedef QUrlTwoFlags<UrlFormattingOption, ComponentFormattingOption> =
FormattingOptions;
>                                                                        ^
> ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:166:10: err=
or: expected unqualified-id before ')' token
>     QUrl();
>          ^
> ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:167:10: err=
or: expected unqualified-id before 'const'
>     QUrl(const QUrl &copy);
>          ^
> ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:167:10: err=
or: expected ')' before 'const'
> ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:168:38: err=
or: 'QUrl& operator=3D(const QUrl&)' must be a nonstatic member function
>     QUrl &operator =3D(const QUrl &copy);
>                                      ^
> ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:172:10: err=
or: expected unqualified-id before 'const'
>     QUrl(const QString &url, ParsingMode mode =3D TolerantMode);
>          ^
> ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:172:10: err=
or: expected ')' before 'const'
> ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:173:39: err=
or: 'QUrl& operator=3D(const QString&)' must be a nonstatic member function
>     QUrl &operator=3D(const QString &url);
>                                       ^
> ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:181:12: err=
or: expected constructor, destructor, or type conversion before ';' token
>     ~QUrl();
>            ^
> ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h: In functio=
n 'void swap(QUrl&)':
> ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:183:58: err=
or: 'd' was not declared in this scope
>     inline void swap(QUrl &other) Q_DECL_NOTHROW { qSwap(d, other.d); }
>                                                          ^
> ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:183:67: err=
or: 'class QUrl' has no member named 'd'
>     inline void swap(QUrl &other) Q_DECL_NOTHROW { qSwap(d, other.d); }
>                                                                   ^
> ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h: At global =
scope:
> ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:185:37: err=
or: 'ParsingMode' has not been declared
>     void setUrl(const QString &url, ParsingMode mode =3D TolerantMode);
>                                     ^
> ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:185:56: err=
or: 'TolerantMode' was not declared in this scope
>     void setUrl(const QString &url, ParsingMode mode =3D TolerantMode);
>                                                        ^
> ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:186:79: err=
or: non-member function 'QString url(FormattingOptions)' cannot have cv-qua=
lifier
>     QString url(FormattingOptions options =3D FormattingOptions(PrettyDec=
oded)) const;
>                                                                          =
     ^
> ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:187:84: err=
or: non-member function 'QString toString(FormattingOptions)' cannot have c=
v-qualifier
>     QString toString(FormattingOptions options =3D FormattingOptions(Pret=
tyDecoded)) const;
>                                                                          =
          ^
> ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:188:91: err=
or: non-member function 'QString toDisplayString(FormattingOptions)' cannot=
 have cv-qualifier
>     QString toDisplayString(FormattingOptions options =3D FormattingOptio=
ns(PrettyDecoded)) const;
>                                                                          =
                 ^
> In file included from ../../../../include/QtCore/qcompilerdetection.h:1:0=
,
>                 from ../../../../include/QtCore/../../../git/src/corelib/=
global/qglobal.h:74,
>                 from ../../../../include/QtCore/qglobal.h:1,
>                 from ../../../../include/QtCore/../../../git/src/corelib/=
kernel/qmetatype.h:38,
>                 from ../../../../include/QtCore/qmetatype.h:1,
>                 from ../../../../include/QtGui/5.5.0/QtGui/qpa/../../../.=
./../../git/src/gui/kernel/qplatformscreen.h:46,
>                 from ../../../../include/QtGui/5.5.0/QtGui/qpa/qplatforms=
creen.h:1,
>                 from /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-v=
fp-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plu=
gins/platforms/minimalegl/qminimaleglscreen.h:37,
>                 from /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-v=
fp-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plu=
gins/platforms/minimalegl/qminimaleglintegration.h:37,
>                 from /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-v=
fp-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plu=
gins/platforms/minimalegl/qminimaleglintegration.cpp:34:
> ../../../../include/QtCore/../../../git/src/corelib/global/qcompilerdetec=
tion.h:222:68: error: non-member function 'QUrl adjusted(FormattingOptions)=
' cannot have cv-qualifier
> #  define Q_REQUIRED_RESULT __attribute__ ((__warn_unused_result__))
>                                                                    ^
> ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:189:52: not=
e: in expansion of macro 'Q_REQUIRED_RESULT'
>     QUrl adjusted(FormattingOptions options) const Q_REQUIRED_RESULT;
>                                                    ^
> In file included from ../../../../include/QtCore/qurl.h:1:0,
>                 from ../../../../include/QtGui/../../../git/src/gui/kerne=
l/qevent.h:48,
>                 from ../../../../include/QtGui/qevent.h:1,
>                 from ../../../../include/QtGui/../../../git/src/gui/text/=
qtextlayout.h:42,
>                 from ../../../../include/QtGui/qtextlayout.h:1,
>                 from ../../../../include/QtGui/5.5.0/QtGui/private/../../=
../../../../git/src/gui/text/qtextengine_p.h:52,
>                 from ../../../../include/QtGui/5.5.0/QtGui/private/qtexte=
ngine_p.h:1,
>                 from ../../../../include/QtGui/5.5.0/QtGui/private/../../=
../../../../git/src/gui/text/qfontengine_p.h:52,
>                 from ../../../../include/QtGui/5.5.0/QtGui/private/qfonte=
ngine_p.h:1,
>                 from ../../../../include/QtGui/5.5.0/QtGui/qpa/../../../.=
./../../git/src/gui/text/qplatformfontdatabase.h:52,
>                 from ../../../../include/QtGui/5.5.0/QtGui/qpa/qplatformf=
ontdatabase.h:1,
>                 from ../../../../include/QtPlatformSupport/5.5.0/QtPlatfo=
rmSupport/private/../../../../../../git/src/platformsupport/fontdatabases/b=
asic/qbasicfontdatabase_p.h:48,
>                 from ../../../../include/QtPlatformSupport/5.5.0/QtPlatfo=
rmSupport/private/qbasicfontdatabase_p.h:1,
>                 from ../../../../include/QtPlatformSupport/5.5.0/QtPlatfo=
rmSupport/private/../../../../../../git/src/platformsupport/fontdatabases/g=
enericunix/qgenericunixfontdatabase_p.h:54,
>                 from ../../../../include/QtPlatformSupport/5.5.0/QtPlatfo=
rmSupport/private/qgenericunixfontdatabase_p.h:1,
>                 from /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-v=
fp-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plu=
gins/platforms/minimalegl/qminimaleglintegration.cpp:39:
> ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:191:68: err=
or: non-member function 'QByteArray toEncoded(FormattingOptions)' cannot ha=
ve cv-qualifier
>     QByteArray toEncoded(FormattingOptions options =3D FullyEncoded) cons=
t;
>                                                                    ^
> ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:192:52: err=
or: 'ParsingMode' has not been declared
>     static QUrl fromEncoded(const QByteArray &url, ParsingMode mode =3D T=
olerantMode);
>                                                    ^
> ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:192:71: err=
or: 'TolerantMode' was not declared in this scope
>     static QUrl fromEncoded(const QByteArray &url, ParsingMode mode =3D T=
olerantMode);
>                                                                       ^
> ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:205:20: err=
or: non-member function 'bool isValid()' cannot have cv-qualifier
>     bool isValid() const;
>                    ^
> ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:206:27: err=
or: non-member function 'QString errorString()' cannot have cv-qualifier
>     QString errorString() const;
>                           ^
> ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:208:20: err=
or: non-member function 'bool isEmpty()' cannot have cv-qualifier
>     bool isEmpty() const;
>                    ^
> ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:212:22: err=
or: non-member function 'QString scheme()' cannot have cv-qualifier
>     QString scheme() const;
>                      ^
> ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:214:49: err=
or: 'ParsingMode' has not been declared
>     void setAuthority(const QString &authority, ParsingMode mode =3D Tole=
rantMode);
>                                                 ^
> ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:214:68: err=
or: 'TolerantMode' was not declared in this scope
>     void setAuthority(const QString &authority, ParsingMode mode =3D Tole=
rantMode);
>                                                                    ^
> ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:215:75: err=
or: non-member function 'QString authority(ComponentFormattingOptions)' can=
not have cv-qualifier
>     QString authority(ComponentFormattingOptions options =3D PrettyDecode=
d) const;
>                                                                          =
 ^
> ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:217:47: err=
or: 'ParsingMode' has not been declared
>     void setUserInfo(const QString &userInfo, ParsingMode mode =3D Tolera=
ntMode);
>                                               ^
> ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:217:66: err=
or: 'TolerantMode' was not declared in this scope
>     void setUserInfo(const QString &userInfo, ParsingMode mode =3D Tolera=
ntMode);
>                                                                  ^
> ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:218:74: err=
or: non-member function 'QString userInfo(ComponentFormattingOptions)' cann=
ot have cv-qualifier
>     QString userInfo(ComponentFormattingOptions options =3D PrettyDecoded=
) const;
>                                                                          =
^
> ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:220:47: err=
or: 'ParsingMode' has not been declared
>     void setUserName(const QString &userName, ParsingMode mode =3D Decode=
dMode);
>                                               ^
> ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:220:66: err=
or: 'DecodedMode' was not declared in this scope
>     void setUserName(const QString &userName, ParsingMode mode =3D Decode=
dMode);
>                                                                  ^
> ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:221:73: err=
or: non-member function 'QString userName(ComponentFormattingOptions)' cann=
ot have cv-qualifier
>     QString userName(ComponentFormattingOptions options =3D FullyDecoded)=
 const;
>                                                                         ^
> ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:223:47: err=
or: 'ParsingMode' has not been declared
>     void setPassword(const QString &password, ParsingMode mode =3D Decode=
dMode);
>                                               ^
> ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:223:66: err=
or: 'DecodedMode' was not declared in this scope
>     void setPassword(const QString &password, ParsingMode mode =3D Decode=
dMode);
>                                                                  ^
> ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:224:65: err=
or: non-member function 'QString password(ComponentFormattingOptions)' cann=
ot have cv-qualifier
>     QString password(ComponentFormattingOptions =3D FullyDecoded) const;
>                                                                 ^
> ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:226:39: err=
or: 'ParsingMode' has not been declared
>     void setHost(const QString &host, ParsingMode mode =3D DecodedMode);
>                                       ^
> ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:226:58: err=
or: 'DecodedMode' was not declared in this scope
>     void setHost(const QString &host, ParsingMode mode =3D DecodedMode);
>                                                          ^
> ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:227:61: err=
or: non-member function 'QString host(ComponentFormattingOptions)' cannot h=
ave cv-qualifier
>     QString host(ComponentFormattingOptions =3D FullyDecoded) const;
>                                                             ^
> ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:228:79: err=
or: non-member function 'QString topLevelDomain(ComponentFormattingOptions)=
' cannot have cv-qualifier
>     QString topLevelDomain(ComponentFormattingOptions options =3D FullyDe=
coded) const;
>                                                                          =
     ^
> ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:231:36: err=
or: non-member function 'int port(int)' cannot have cv-qualifier
>     int port(int defaultPort =3D -1) const;
>                                    ^
> ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:233:39: err=
or: 'ParsingMode' has not been declared
>     void setPath(const QString &path, ParsingMode mode =3D DecodedMode);
>                                       ^
> ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:233:58: err=
or: 'DecodedMode' was not declared in this scope
>     void setPath(const QString &path, ParsingMode mode =3D DecodedMode);
>                                                          ^
> ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:234:69: err=
or: non-member function 'QString path(ComponentFormattingOptions)' cannot h=
ave cv-qualifier
>     QString path(ComponentFormattingOptions options =3D FullyDecoded) con=
st;
>                                                                     ^
> ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:235:73: err=
or: non-member function 'QString fileName(ComponentFormattingOptions)' cann=
ot have cv-qualifier
>     QString fileName(ComponentFormattingOptions options =3D FullyDecoded)=
 const;
>                                                                         ^
> ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:237:21: err=
or: non-member function 'bool hasQuery()' cannot have cv-qualifier
>     bool hasQuery() const;
>                     ^
> ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:238:41: err=
or: 'ParsingMode' has not been declared
>     void setQuery(const QString &query, ParsingMode mode =3D TolerantMode=
);
>                                         ^
> ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:238:60: err=
or: 'TolerantMode' was not declared in this scope
>     void setQuery(const QString &query, ParsingMode mode =3D TolerantMode=
);
>                                                            ^
> ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:240:63: err=
or: non-member function 'QString query(ComponentFormattingOptions)' cannot =
have cv-qualifier
>     QString query(ComponentFormattingOptions =3D PrettyDecoded) const;
>                                                               ^
> ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:242:24: err=
or: non-member function 'bool hasFragment()' cannot have cv-qualifier
>     bool hasFragment() const;
>                        ^
> ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:243:74: err=
or: non-member function 'QString fragment(ComponentFormattingOptions)' cann=
ot have cv-qualifier
>     QString fragment(ComponentFormattingOptions options =3D PrettyDecoded=
) const;
>                                                                          =
^
> ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:244:47: err=
or: 'ParsingMode' has not been declared
>     void setFragment(const QString &fragment, ParsingMode mode =3D Tolera=
ntMode);
>                                               ^
> ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:244:66: err=
or: 'TolerantMode' was not declared in this scope
>     void setFragment(const QString &fragment, ParsingMode mode =3D Tolera=
ntMode);
>                                                                  ^
> In file included from ../../../../include/QtCore/qcompilerdetection.h:1:0=
,
>                 from ../../../../include/QtCore/../../../git/src/corelib/=
global/qglobal.h:74,
>                 from ../../../../include/QtCore/qglobal.h:1,
>                 from ../../../../include/QtCore/../../../git/src/corelib/=
kernel/qmetatype.h:38,
>                 from ../../../../include/QtCore/qmetatype.h:1,
>                 from ../../../../include/QtGui/5.5.0/QtGui/qpa/../../../.=
./../../git/src/gui/kernel/qplatformscreen.h:46,
>                 from ../../../../include/QtGui/5.5.0/QtGui/qpa/qplatforms=
creen.h:1,
>                 from /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-v=
fp-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plu=
gins/platforms/minimalegl/qminimaleglscreen.h:37,
>                 from /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-v=
fp-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plu=
gins/platforms/minimalegl/qminimaleglintegration.h:37,
>                 from /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-v=
fp-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plu=
gins/platforms/minimalegl/qminimaleglintegration.cpp:34:
> ../../../../include/QtCore/../../../git/src/corelib/global/qcompilerdetec=
tion.h:222:68: error: non-member function 'QUrl resolved(const QUrl&)' cann=
ot have cv-qualifier
> #  define Q_REQUIRED_RESULT __attribute__ ((__warn_unused_result__))
>                                                                    ^
> ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:246:47: not=
e: in expansion of macro 'Q_REQUIRED_RESULT'
>     QUrl resolved(const QUrl &relative) const Q_REQUIRED_RESULT;
>                                               ^
> In file included from ../../../../include/QtCore/qurl.h:1:0,
>                 from ../../../../include/QtGui/../../../git/src/gui/kerne=
l/qevent.h:48,
>                 from ../../../../include/QtGui/qevent.h:1,
>                 from ../../../../include/QtGui/../../../git/src/gui/text/=
qtextlayout.h:42,
>                 from ../../../../include/QtGui/qtextlayout.h:1,
>                 from ../../../../include/QtGui/5.5.0/QtGui/private/../../=
../../../../git/src/gui/text/qtextengine_p.h:52,
>                 from ../../../../include/QtGui/5.5.0/QtGui/private/qtexte=
ngine_p.h:1,
>                 from ../../../../include/QtGui/5.5.0/QtGui/private/../../=
../../../../git/src/gui/text/qfontengine_p.h:52,
>                 from ../../../../include/QtGui/5.5.0/QtGui/private/qfonte=
ngine_p.h:1,
>                 from ../../../../include/QtGui/5.5.0/QtGui/qpa/../../../.=
./../../git/src/gui/text/qplatformfontdatabase.h:52,
>                 from ../../../../include/QtGui/5.5.0/QtGui/qpa/qplatformf=
ontdatabase.h:1,
>                 from ../../../../include/QtPlatformSupport/5.5.0/QtPlatfo=
rmSupport/private/../../../../../../git/src/platformsupport/fontdatabases/b=
asic/qbasicfontdatabase_p.h:48,
>                 from ../../../../include/QtPlatformSupport/5.5.0/QtPlatfo=
rmSupport/private/qbasicfontdatabase_p.h:1,
>                 from ../../../../include/QtPlatformSupport/5.5.0/QtPlatfo=
rmSupport/private/../../../../../../git/src/platformsupport/fontdatabases/g=
enericunix/qgenericunixfontdatabase_p.h:54,
>                 from ../../../../include/QtPlatformSupport/5.5.0/QtPlatfo=
rmSupport/private/qgenericunixfontdatabase_p.h:1,
>                 from /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-v=
fp-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plu=
gins/platforms/minimalegl/qminimaleglintegration.cpp:39:
> ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:248:23: err=
or: non-member function 'bool isRelative()' cannot have cv-qualifier
>     bool isRelative() const;
>                       ^
> ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:249:38: err=
or: non-member function 'bool isParentOf(const QUrl&)' cannot have cv-quali=
fier
>     bool isParentOf(const QUrl &url) const;
>                                      ^
> ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:251:24: err=
or: non-member function 'bool isLocalFile()' cannot have cv-qualifier
>     bool isLocalFile() const;
>                        ^
> ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:253:27: err=
or: non-member function 'QString toLocalFile()' cannot have cv-qualifier
>     QString toLocalFile() const;
>                           ^
> ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:256:23: err=
or: non-member function 'bool isDetached()' cannot have cv-qualifier
>     bool isDetached() const;
>                       ^
> ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:258:38: err=
or: non-member function 'bool operator<(const QUrl&)' cannot have cv-qualif=
ier
>     bool operator <(const QUrl &url) const;
>                                      ^
> ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:258:38: err=
or: 'bool operator<(const QUrl&)' must take exactly two arguments
> ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:259:39: err=
or: non-member function 'bool operator=3D=3D(const QUrl&)' cannot have cv-q=
ualifier
>     bool operator =3D=3D(const QUrl &url) const;
>                                       ^
> ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:259:39: err=
or: 'bool operator=3D=3D(const QUrl&)' must take exactly two arguments
> ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:260:39: err=
or: non-member function 'bool operator!=3D(const QUrl&)' cannot have cv-qua=
lifier
>     bool operator !=3D(const QUrl &url) const;
>                                       ^
> ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:260:39: err=
or: 'bool operator!=3D(const QUrl&)' must take exactly two arguments
> ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:262:62: err=
or: non-member function 'bool matches(const QUrl&, FormattingOptions)' cann=
ot have cv-qualifier
>     bool matches(const QUrl &url, FormattingOptions options) const;
>                                                              ^
> ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:343:1: erro=
r: expected unqualified-id before 'private'
> private:
> ^
> ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:346:1: erro=
r: expected unqualified-id before 'public'
> public:
> ^
> ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:351:64: err=
or: 'ParsingMode' has not been declared
>     static QList<QUrl> fromStringList(const QStringList &uris, ParsingMod=
e mode =3D TolerantMode);
>                                                                ^
> ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:351:83: err=
or: 'TolerantMode' was not declared in this scope
>     static QList<QUrl> fromStringList(const QStringList &uris, ParsingMod=
e mode =3D TolerantMode);
>                                                                          =
         ^
> ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:354:5: erro=
r: 'friend' used outside of class
>     friend Q_CORE_EXPORT uint qHash(const QUrl &url, uint seed) Q_DECL_NO=
THROW;
>     ^
> ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:356:1: erro=
r: expected unqualified-id before 'private'
> private:
> ^
> ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:358:5: erro=
r: 'friend' used outside of class
>     friend class QUrlQuery;
>     ^
> ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:360:1: erro=
r: expected unqualified-id before 'public'
> public:
> ^
> ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:362:12: err=
or: 'DataPtr' does not name a type
>     inline DataPtr &data_ptr() { return d; }
>            ^
> ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:363:1: erro=
r: expected declaration before '}' token
> };
> ^
> moc /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-linux=
-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/platforminpu=
tcontexts/ibus/qibusinputcontextproxy.h
> ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:192:17: war=
ning: 'QUrl fromEncoded(const QByteArray&, int)' declared 'static' but neve=
r defined [-Wunused-function]
>     static QUrl fromEncoded(const QByteArray &url, ParsingMode mode =3D T=
olerantMode);
>                 ^
> ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:200:17: war=
ning: 'QUrl fromUserInput(const QString&)' declared 'static' but never defi=
ned [-Wunused-function]
>     static QUrl fromUserInput(const QString &userInput);
>                 ^
> ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:202:17: war=
ning: 'QUrl fromUserInput(const QString&, const QString&, UserInputResoluti=
onOptions)' declared 'static' but never defined [-Wunused-function]
>     static QUrl fromUserInput(const QString &userInput, const QString &wo=
rkingDirectory,
>                 ^
> ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:252:17: war=
ning: 'QUrl fromLocalFile(const QString&)' declared 'static' but never defi=
ned [-Wunused-function]
>     static QUrl fromLocalFile(const QString &localfile);
>                 ^
> ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:264:20: war=
ning: 'QString fromPercentEncoding(const QByteArray&)' declared 'static' bu=
t never defined [-Wunused-function]
>     static QString fromPercentEncoding(const QByteArray &);
>                    ^
> ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:265:23: war=
ning: 'QByteArray toPercentEncoding(const QString&, const QByteArray&, cons=
t QByteArray&)' declared 'static' but never defined [-Wunused-function]
>     static QByteArray toPercentEncoding(const QString &,
>                       ^
> ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:348:23: war=
ning: 'QByteArray toAce(const QString&)' declared 'static' but never define=
d [-Wunused-function]
>     static QByteArray toAce(const QString &);
>                       ^
> ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:349:24: war=
ning: 'QStringList idnWhitelist()' declared 'static' but never defined [-Wu=
nused-function]
>     static QStringList idnWhitelist();
>                        ^
> ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:350:24: war=
ning: 'QStringList toStringList(const QList<QUrl>&, FormattingOptions)' dec=
lared 'static' but never defined [-Wunused-function]
>     static QStringList toStringList(const QList<QUrl> &uris, FormattingOp=
tions options =3D FormattingOptions(PrettyDecoded));
>                        ^
> ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:351:24: war=
ning: 'QList<QUrl> fromStringList(const QStringList&, int)' declared 'stati=
c' but never defined [-Wunused-function]
>     static QList<QUrl> fromStringList(const QStringList &uris, ParsingMod=
e mode =3D TolerantMode);
>                        ^
> ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:353:17: war=
ning: 'void setIdnWhitelist(const QStringList&)' declared 'static' but neve=
r defined [-Wunused-function]
>     static void setIdnWhitelist(const QStringList &);
>                 ^
> Makefile:1242: recipe for target '.obj/qminimaleglintegration.o' failed
> make[4]: *** [.obj/qminimaleglintegration.o] Error 1
> make[4]: *** Waiting for unfinished jobs....
> moc /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-linux=
-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/bearer/qbear=
erengine_impl.h
> compiling /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel=
-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/platfo=
rms/offscreen/main.cpp
> compiling /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel=
-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/platfo=
rminputcontexts/ibus/main.cpp
> compiling /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel=
-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/bearer=
/networkmanager/main.cpp
> compiling .moc/moc_qibusplatforminputcontext.cpp
> In file included from /scratch/cedar/boneblack/build/tmp/sysroots/mel-am3=
35x-boneblack/usr/include/EGL/eglplatform.h:75:0,
>                 from /scratch/cedar/boneblack/build/tmp/sysroots/mel-am33=
5x-boneblack/usr/include/EGL/egl.h:35,
>                 from /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-v=
fp-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plu=
gins/platforms/eglfs/qeglfsdeviceintegration.h:53,
>                 from /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-v=
fp-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plu=
gins/platforms/eglfs/qeglfshooks.h:37,
>                 from /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-v=
fp-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plu=
gins/platforms/eglfs/qeglfshooks.cpp:34:
> ../../../../include/QtCore/../../../git/src/corelib/io/qtextstream.h:72:1=
0: error: expected identifier before 'int'
>     enum Status {
>          ^
> In file included from ../../../../include/QtCore/qtextstream.h:1:0,
>                 from ../../../../include/QtCore/../../../git/src/corelib/=
io/qdebug.h:42,
>                 from ../../../../include/QtCore/qdebug.h:1,
>                 from ../../../../include/QtCore/../../../git/src/corelib/=
io/qloggingcategory.h:38,
>                 from ../../../../include/QtCore/qloggingcategory.h:1,
>                 from ../../../../include/QtCore/QLoggingCategory:1,
>                 from /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-v=
fp-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plu=
gins/platforms/eglfs/qeglfshooks.cpp:35:
> ../../../../include/QtCore/../../../git/src/corelib/io/qtextstream.h:72:1=
7: error: expected unqualified-id before '{' token
>     enum Status {
>                 ^
> make[4]: Leaving directory '/scratch/cedar/boneblack/build/tmp/work/corte=
xa8hf-vfp-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/buil=
d/src/plugins/platforms/minimalegl'
> Makefile:146: recipe for target 'sub-minimalegl-make_first' failed
> make[3]: *** [sub-minimalegl-make_first] Error 2
> make[3]: *** Waiting for unfinished jobs....
> compiling .moc/moc_qibusproxy.cpp
> compiling .moc/moc_qibusinputcontextproxy.cpp
> Makefile.eglfs_device_lib:1889: recipe for target '.obj/qeglfshooks.o' fa=
iled
> make[5]: *** [.obj/qeglfshooks.o] Error 1
> make[5]: Leaving directory '/scratch/cedar/boneblack/build/tmp/work/corte=
xa8hf-vfp-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/buil=
d/src/plugins/platforms/eglfs'
> Makefile:42: recipe for target 'sub-eglfs_device_lib-pro-make_first-order=
ed' failed
> make[4]: *** [sub-eglfs_device_lib-pro-make_first-ordered] Error 2
> make[4]: Leaving directory '/scratch/cedar/boneblack/build/tmp/work/corte=
xa8hf-vfp-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/buil=
d/src/plugins/platforms/eglfs'
> Makefile:121: recipe for target 'sub-eglfs-make_first' failed
> make[3]: *** [sub-eglfs-make_first] Error 2
> compiling .moc/moc_qtuiohandler_p.cpp
> compiling /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel=
-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/bearer=
/qnetworksession_impl.cpp
> compiling /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel=
-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/platfo=
rms/xcb/qxcbbackingstore.cpp
> compiling /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel=
-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/platfo=
rms/xcb/qxcbwmsupport.cpp
> compiling /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel=
-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/platfo=
rms/xcb/qxcbnativeinterface.cpp
> rm -f libqoffscreen.so
> linking ../../../../plugins/platforms/libqoffscreen.so
> rm -f libqgenericbearer.so
> linking ../../../../plugins/bearer/libqgenericbearer.so
> mv -f libqgenericbearer.so ../../../../plugins/bearer/
> make[4]: Leaving directory '/scratch/cedar/boneblack/build/tmp/work/corte=
xa8hf-vfp-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/buil=
d/src/plugins/bearer/generic'
> compiling .moc/moc_qnetworkmanagerservice.cpp
> mv -f libqoffscreen.so ../../../../plugins/platforms/
> make[4]: Leaving directory '/scratch/cedar/boneblack/build/tmp/work/corte=
xa8hf-vfp-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/buil=
d/src/plugins/platforms/offscreen'
> compiling /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel=
-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/platfo=
rms/xcb/qxcbcursor.cpp
> rm -f libqtuiotouchplugin.so
> linking ../../../../plugins/generic/libqtuiotouchplugin.so
> compiling .moc/moc_qnetworkmanagerengine.cpp
> compiling .moc/moc_qofonoservice_linux_p.cpp
> mv -f libqtuiotouchplugin.so ../../../../plugins/generic/
> moc /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-linux=
-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/bearer/qnetw=
orksession_impl.cpp
> make[4]: Leaving directory '/scratch/cedar/boneblack/build/tmp/work/corte=
xa8hf-vfp-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/buil=
d/src/plugins/generic/tuiotouch'
> make[3]: Leaving directory '/scratch/cedar/boneblack/build/tmp/work/corte=
xa8hf-vfp-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/buil=
d/src/plugins/generic'
> compiling /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel=
-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/platfo=
rms/xcb/qxcbimage.cpp
> moc /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-linux=
-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/bearer/connm=
an/qconnmanservice_linux_p.h
> moc /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-linux=
-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/bearer/linux=
_common/qofonoservice_linux_p.h
> moc /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-linux=
-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/bearer/connm=
an/qconnmanengine.h
> moc /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-linux=
-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/bearer/qnetw=
orksession_impl.h
> rm -f libibusplatforminputcontextplugin.so
> linking ../../../../plugins/platforminputcontexts/libibusplatforminputcon=
textplugin.so
> compiling .moc/moc_qnetworksession_impl.cpp
> moc /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-linux=
-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/bearer/qbear=
erengine_impl.h
> compiling /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel=
-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/platfo=
rms/xcb/qxcbxsettings.cpp
> compiling /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel=
-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/platfo=
rms/xcb/qxcbsystemtraytracker.cpp
> compiling /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel=
-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/platfo=
rms/xcb/qxcbconnection_xi2.cpp
> mv -f libibusplatforminputcontextplugin.so ../../../../plugins/platformin=
putcontexts/
> make[4]: Leaving directory '/scratch/cedar/boneblack/build/tmp/work/corte=
xa8hf-vfp-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/buil=
d/src/plugins/platforminputcontexts/ibus'
> make[3]: Leaving directory '/scratch/cedar/boneblack/build/tmp/work/corte=
xa8hf-vfp-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/buil=
d/src/plugins/platforminputcontexts'
> compiling /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel=
-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/platfo=
rms/xcb/gl_integrations/qxcbglintegrationfactory.cpp
> compiling /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel=
-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/bearer=
/connman/main.cpp
> compiling .moc/moc_qbearerengine_impl.cpp
> compiling /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel=
-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/platfo=
rms/xcb/gl_integrations/qxcbglintegration.cpp
> compiling /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel=
-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/platfo=
rms/xcb/gl_integrations/qxcbnativeinterfacehandler.cpp
> moc /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-linux=
-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/platforms/xc=
b/qxcbconnection.h
> moc /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-linux=
-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/platforms/xc=
b/qxcbmime.h
> compiling /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel=
-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/bearer=
/qnetworksession_impl.cpp
> moc /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-linux=
-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/platforms/xc=
b/qxcbnativeinterface.h
> moc /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-linux=
-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/platforms/xc=
b/qxcbsystemtraytracker.h
> compiling .moc/moc_qconnmanservice_linux_p.cpp
> moc /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-linux=
-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/platforms/xc=
b/gl_integrations/qxcbglintegrationplugin.h
> compiling .moc/moc_qofonoservice_linux_p.cpp
> rm -f libqnmbearer.so
> linking ../../../../plugins/bearer/libqnmbearer.so
> compiling .moc/moc_qconnmanengine.cpp
> compiling /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel=
-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/platfo=
rms/xcb/qxcbclipboard.cpp
> compiling .moc/moc_qxcbconnection.cpp
> compiling .moc/moc_qxcbmime.cpp
> compiling .moc/moc_qxcbnativeinterface.cpp
> compiling .moc/moc_qxcbsystemtraytracker.cpp
> compiling .moc/moc_qxcbglintegrationplugin.cpp
> mv -f libqnmbearer.so ../../../../plugins/bearer/
> make[4]: Leaving directory '/scratch/cedar/boneblack/build/tmp/work/corte=
xa8hf-vfp-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/buil=
d/src/plugins/bearer/networkmanager'
> compiling .moc/moc_qnetworksession_impl.cpp
> compiling .moc/moc_qbearerengine_impl.cpp
> rm -f libqconnmanbearer.so
> linking ../../../../plugins/bearer/libqconnmanbearer.so
> mv -f libqconnmanbearer.so ../../../../plugins/bearer/
> make[4]: Leaving directory '/scratch/cedar/boneblack/build/tmp/work/corte=
xa8hf-vfp-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/buil=
d/src/plugins/bearer/connman'
> make[3]: Leaving directory '/scratch/cedar/boneblack/build/tmp/work/corte=
xa8hf-vfp-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/buil=
d/src/plugins/bearer'
> rm -f libQt5XcbQpa.so.5.5.0 libQt5XcbQpa.so libQt5XcbQpa.so.5 libQt5XcbQp=
a.so.5.5
> linking ../../../../lib/libQt5XcbQpa.so.5.5.0
> ln -s libQt5XcbQpa.so.5.5.0 libQt5XcbQpa.so
> ln -s libQt5XcbQpa.so.5.5.0 libQt5XcbQpa.so.5
> ln -s libQt5XcbQpa.so.5.5.0 libQt5XcbQpa.so.5.5
> rm -f ../../../../lib/libQt5XcbQpa.so.5.5.0
> mv -f libQt5XcbQpa.so.5.5.0  ../../../../lib/
> rm -f ../../../../lib/libQt5XcbQpa.so
> rm -f ../../../../lib/libQt5XcbQpa.so.5
> rm -f ../../../../lib/libQt5XcbQpa.so.5.5
> mv -f libQt5XcbQpa.so ../../../../lib/
> mv -f libQt5XcbQpa.so.5 ../../../../lib/
> mv -f libQt5XcbQpa.so.5.5 ../../../../lib/
> make[5]: Leaving directory '/scratch/cedar/boneblack/build/tmp/work/corte=
xa8hf-vfp-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/buil=
d/src/plugins/platforms/xcb'
> ( test -e Makefile.xcb-plugin || /scratch/cedar/boneblack/build/tmp/work/=
cortexa8hf-vfp-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0=
/build/bin/qmake /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neo=
n-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/p=
latforms/xcb/xcb-plugin.pro -o Makefile.xcb-plugin ) && make -f Makefile.xc=
b-plugin
> make[5]: Entering directory '/scratch/cedar/boneblack/build/tmp/work/cort=
exa8hf-vfp-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/bui=
ld/src/plugins/platforms/xcb'
> moc /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-linux=
-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/platforms/xc=
b/qxcbmain.cpp
> compiling /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel=
-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/platfo=
rms/xcb/qxcbmain.cpp
> rm -f libqxcb.so
> linking ../../../../plugins/platforms/libqxcb.so
> mv -f libqxcb.so ../../../../plugins/platforms/
> make[5]: Leaving directory '/scratch/cedar/boneblack/build/tmp/work/corte=
xa8hf-vfp-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/buil=
d/src/plugins/platforms/xcb'
> cd gl_integrations/ && ( test -e Makefile || /scratch/cedar/boneblack/bui=
ld/tmp/work/cortexa8hf-vfp-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2=
fde9f59ee-r0/build/bin/qmake /scratch/cedar/boneblack/build/tmp/work/cortex=
a8hf-vfp-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/s=
rc/plugins/platforms/xcb/gl_integrations/gl_integrations.pro -o Makefile ) =
&& make -f Makefile
> make[5]: Entering directory '/scratch/cedar/boneblack/build/tmp/work/cort=
exa8hf-vfp-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/bui=
ld/src/plugins/platforms/xcb/gl_integrations'
> cd xcb_egl/ && ( test -e Makefile || /scratch/cedar/boneblack/build/tmp/w=
ork/cortexa8hf-vfp-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59e=
e-r0/build/bin/qmake /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp=
-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugi=
ns/platforms/xcb/gl_integrations/xcb_egl/xcb_egl.pro -o Makefile ) && make =
-f Makefile
> make[6]: Entering directory '/scratch/cedar/boneblack/build/tmp/work/cort=
exa8hf-vfp-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/bui=
ld/src/plugins/platforms/xcb/gl_integrations/xcb_egl'
> compiling /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel=
-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/platfo=
rms/xcb/gl_integrations/xcb_egl/qxcbeglintegration.cpp
> compiling /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel=
-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/platfo=
rms/xcb/gl_integrations/xcb_egl/qxcbeglwindow.cpp
> moc /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-linux=
-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/platforms/xc=
b/gl_integrations/xcb_egl/qxcbeglmain.cpp
> compiling /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel=
-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/platfo=
rms/xcb/gl_integrations/xcb_egl/qxcbeglnativeinterfacehandler.cpp
> compiling /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel=
-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/platfo=
rms/xcb/gl_integrations/xcb_egl/qxcbeglmain.cpp
> rm -f libqxcb-egl-integration.so
> linking ../../../../../../plugins/xcbglintegrations/libqxcb-egl-integrati=
on.so
> mv -f libqxcb-egl-integration.so ../../../../../../plugins/xcbglintegrati=
ons/
> make[6]: Leaving directory '/scratch/cedar/boneblack/build/tmp/work/corte=
xa8hf-vfp-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/buil=
d/src/plugins/platforms/xcb/gl_integrations/xcb_egl'
> make[5]: Leaving directory '/scratch/cedar/boneblack/build/tmp/work/corte=
xa8hf-vfp-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/buil=
d/src/plugins/platforms/xcb/gl_integrations'
> make[4]: Leaving directory '/scratch/cedar/boneblack/build/tmp/work/corte=
xa8hf-vfp-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/buil=
d/src/plugins/platforms/xcb'
> make[3]: Leaving directory '/scratch/cedar/boneblack/build/tmp/work/corte=
xa8hf-vfp-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/buil=
d/src/plugins/platforms'
> Makefile:125: recipe for target 'sub-platforms-make_first' failed
> make[2]: *** [sub-platforms-make_first] Error 2
> make[2]: Leaving directory '/scratch/cedar/boneblack/build/tmp/work/corte=
xa8hf-vfp-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/buil=
d/src/plugins'
> Makefile:720: recipe for target 'sub-plugins-make_first' failed
> make[1]: *** [sub-plugins-make_first] Error 2
> make[1]: Leaving directory '/scratch/cedar/boneblack/build/tmp/work/corte=
xa8hf-vfp-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/buil=
d/src'
> Makefile:45: recipe for target 'sub-src-make_first' failed
> make: *** [sub-src-make_first] Error 2
> WARNING: exit code 1 from a shell command.
> ERROR: oe_runmake failed
> ERROR: Function failed: do_compile (log file is located at /scratch/cedar=
/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-linux-gnueabi/qtbase/5.5.=
0+gitAUTOINC+2fde9f59ee-r0/temp/log.do_compile.15120)
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


