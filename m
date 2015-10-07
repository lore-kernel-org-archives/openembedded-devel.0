Return-Path: <Noor_Ahsan@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 5B95060125
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 Oct 2015 11:20:47 +0000 (UTC)
Received: from nat-ies.mentorg.com ([192.94.31.2]
	helo=SVR-IES-FEM-05.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1Zjmm6-0004fu-Rp from Noor_Ahsan@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Wed, 07 Oct 2015 04:20:47 -0700
Received: from EU-MBX-01.mgc.mentorg.com ([169.254.1.18]) by
	SVR-IES-FEM-05.mgc.mentorg.com ([137.202.0.112]) with mapi id
	14.03.0224.002; Wed, 7 Oct 2015 12:20:46 +0100
From: "Ahsan, Noor" <Noor_Ahsan@mentor.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe][Meta-qt5] Multiple definition of None on
	qminimaleglintegration for BBB
Thread-Index: AdEA8ZzswblMLHZTRNCNYdRgT+C5mw==
Date: Wed, 7 Oct 2015 11:20:45 +0000
Message-ID: <365E1805BC95084CBE82381A0B86999401095F2C61@EU-MBX-01.mgc.mentorg.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [137.202.0.76]
MIME-Version: 1.0
Cc: "Haridasan, Sujith" <Sujith_Haridasan@mentor.com>, "Larson,
	Chris" <Chris_Larson@mentor.com>
Subject: [Meta-qt5] Multiple definition of None on qminimaleglintegration for BBB
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
X-List-Received-Date: Wed, 07 Oct 2015 11:20:49 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello,

We were building QT5 on BBB and we faced similar issue which has been fixed=
 in 0012-qeglplatformscreen.cpp-reorder-headers-to-fix-build-.patch0012-qeg=
lplatformscreen.cpp-reorder-headers-to-fix-build-.patch but this time it is=
 on qminimaleglintegration file. Can anybody guide us how to fix this issue=
. I added following code in qurl.h for previous issue but community said th=
at there is better fix.

#ifdef None
#undef None
#endif

The stripped error log is shown below.

linking ../../../../plugins/platforminputcontexts/libcomposeplatforminputco=
ntextplugin.so
mv -f libqminimal.so ../../../../plugins/platforms/=20
make[4]: Leaving directory '/scratch/cedar/boneblack/build/tmp/work/cortexa=
8hf-vfp-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/build/=
src/plugins/platforms/minimal'
cd minimalegl/ && ( test -e Makefile || /scratch/cedar/boneblack/build/tmp/=
work/cortexa8hf-vfp-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59=
ee-r0/build/bin/qmake /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vf=
p-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plug=
ins/platforms/minimalegl/minimalegl.pro -o Makefile ) && make -f Makefile=20
mv -f libcomposeplatforminputcontextplugin.so ../../../../plugins/platformi=
nputcontexts/=20
make[4]: Leaving directory '/scratch/cedar/boneblack/build/tmp/work/cortexa=
8hf-vfp-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/build/=
src/plugins/platforminputcontexts/compose'
compiling /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-l=
inux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/bearer/g=
eneric/main.cpp
compiling /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-l=
inux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/platform=
s/eglfs/qeglfsscreen.cpp
moc /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-linux-g=
nueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/bearer/qnetwor=
ksession_impl.cpp
make[4]: Entering directory '/scratch/cedar/boneblack/build/tmp/work/cortex=
a8hf-vfp-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/build=
/src/plugins/platforms/minimalegl'
moc /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-linux-g=
nueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/platforms/mini=
malegl/main.cpp
compiling /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-l=
inux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/platform=
s/offscreen/qoffscreenintegration_dummy.cpp
compiling /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-l=
inux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/platform=
s/minimalegl/qminimaleglintegration.cpp
moc /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-linux-g=
nueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/bearer/network=
manager/qnetworkmanagerservice.h
compiling /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-l=
inux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/platform=
s/minimalegl/qminimaleglwindow.cpp
compiling .moc/moc_qgenericengine.cpp
moc /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-linux-g=
nueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/platforminputc=
ontexts/ibus/main.cpp
moc /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-linux-g=
nueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/bearer/network=
manager/qnetworkmanagerengine.h
compiling /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-l=
inux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/platform=
s/xcb/qxcbscreen.cpp
moc /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-linux-g=
nueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/platforminputc=
ontexts/ibus/qibusplatforminputcontext.h
moc /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-linux-g=
nueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/generic/tuioto=
uch/qtuiohandler_p.h
moc /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-linux-g=
nueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/bearer/linux_c=
ommon/qofonoservice_linux_p.h
moc /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-linux-g=
nueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/platforminputc=
ontexts/ibus/qibusproxy.h
compiling /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-l=
inux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/generic/=
tuiotouch/main.cpp
compiling /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-l=
inux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/platform=
s/eglfs/qeglfshooks.cpp
compiling .moc/moc_qnetworksession_impl.cpp
compiling /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-l=
inux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/platform=
s/xcb/qxcbwindow.cpp
moc /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-linux-g=
nueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/bearer/qnetwor=
ksession_impl.h
In file included from /scratch/cedar/boneblack/build/tmp/sysroots/mel-am335=
x-boneblack/usr/include/X11/Xlib.h:44:0,
                 from /scratch/cedar/boneblack/build/tmp/sysroots/mel-am335=
x-boneblack/usr/include/EGL/eglplatform.h:75,
                 from /scratch/cedar/boneblack/build/tmp/sysroots/mel-am335=
x-boneblack/usr/include/EGL/egl.h:35,
                 from /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vf=
p-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plug=
ins/platforms/minimalegl/qminimaleglscreen.h:41,
                 from /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vf=
p-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plug=
ins/platforms/minimalegl/qminimaleglintegration.h:37,
                 from /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vf=
p-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plug=
ins/platforms/minimalegl/qminimaleglintegration.cpp:34:
../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:131:9: error:=
 expected identifier before numeric constant
         None =3D 0x0,
         ^
In file included from ../../../../include/QtCore/qtextstream.h:1:0,
                 from ../../../../include/QtCore/../../../git/src/corelib/i=
o/qdebug.h:42,
                 from ../../../../include/QtCore/qdebug.h:1,
                 from ../../../../include/QtCore/../../../git/src/corelib/i=
o/qloggingcategory.h:38,
                 from ../../../../include/QtCore/qloggingcategory.h:1,
                 from ../../../../include/QtCore/QLoggingCategory:1,
                 from /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vf=
p-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plug=
ins/platforms/eglfs/qeglfshooks.cpp:35:
../../../../include/QtCore/../../../git/src/corelib/io/qtextstream.h:46:2: =
error: #error qtextstream.h must be included before any header file that de=
fines Status
 #error qtextstream.h must be included before any header file that defines =
Status
  ^
../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:131:9: error:=
 expected '}' before numeric constant
../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:131:9: error:=
 expected unqualified-id before numeric constant
In file included from ../../../../include/QtCore/qurl.h:1:0,
                 from ../../../../include/QtGui/../../../git/src/gui/kernel=
/qevent.h:48,
                 from ../../../../include/QtGui/qevent.h:1,
                 from ../../../../include/QtGui/../../../git/src/gui/text/q=
textlayout.h:42,
                 from ../../../../include/QtGui/qtextlayout.h:1,
                 from ../../../../include/QtGui/5.5.0/QtGui/private/../../.=
./../../../git/src/gui/text/qtextengine_p.h:52,
                 from ../../../../include/QtGui/5.5.0/QtGui/private/qtexten=
gine_p.h:1,
                 from ../../../../include/QtGui/5.5.0/QtGui/private/../../.=
./../../../git/src/gui/text/qfontengine_p.h:52,
                 from ../../../../include/QtGui/5.5.0/QtGui/private/qfonten=
gine_p.h:1,
                 from ../../../../include/QtGui/5.5.0/QtGui/qpa/../../../..=
/../../git/src/gui/text/qplatformfontdatabase.h:52,
                 from ../../../../include/QtGui/5.5.0/QtGui/qpa/qplatformfo=
ntdatabase.h:1,
                 from ../../../../include/QtPlatformSupport/5.5.0/QtPlatfor=
mSupport/private/../../../../../../git/src/platformsupport/fontdatabases/ba=
sic/qbasicfontdatabase_p.h:48,
                 from ../../../../include/QtPlatformSupport/5.5.0/QtPlatfor=
mSupport/private/qbasicfontdatabase_p.h:1,
                 from ../../../../include/QtPlatformSupport/5.5.0/QtPlatfor=
mSupport/private/../../../../../../git/src/platformsupport/fontdatabases/ge=
nericunix/qgenericunixfontdatabase_p.h:54,
                 from ../../../../include/QtPlatformSupport/5.5.0/QtPlatfor=
mSupport/private/qgenericunixfontdatabase_p.h:1,
                 from /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vf=
p-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plug=
ins/platforms/minimalegl/qminimaleglintegration.cpp:39:
../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:163:26: error=
: 'UrlFormattingOption' was not declared in this scope
     typedef QUrlTwoFlags<UrlFormattingOption, ComponentFormattingOption> F=
ormattingOptions;
                          ^
compiling .moc/moc_qbearerengine_impl.cpp
compiling /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-l=
inux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/bearer/c=
onnman/qconnmanengine.cpp
../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:163:72: error=
: template argument 1 is invalid
     typedef QUrlTwoFlags<UrlFormattingOption, ComponentFormattingOption> F=
ormattingOptions;
                                                                        ^
../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:166:10: error=
: expected unqualified-id before ')' token
     QUrl();
          ^
../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:167:10: error=
: expected unqualified-id before 'const'
     QUrl(const QUrl &copy);
          ^
../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:167:10: error=
: expected ')' before 'const'
../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:168:38: error=
: 'QUrl& operator=3D(const QUrl&)' must be a nonstatic member function
     QUrl &operator =3D(const QUrl &copy);
                                      ^
../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:172:10: error=
: expected unqualified-id before 'const'
     QUrl(const QString &url, ParsingMode mode =3D TolerantMode);
          ^
../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:172:10: error=
: expected ')' before 'const'
../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:173:39: error=
: 'QUrl& operator=3D(const QString&)' must be a nonstatic member function
     QUrl &operator=3D(const QString &url);
                                       ^
../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:181:12: error=
: expected constructor, destructor, or type conversion before ';' token
     ~QUrl();
            ^
../../../../include/QtCore/../../../git/src/corelib/io/qurl.h: In function =
'void swap(QUrl&)':
../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:183:58: error=
: 'd' was not declared in this scope
     inline void swap(QUrl &other) Q_DECL_NOTHROW { qSwap(d, other.d); }
                                                          ^
../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:183:67: error=
: 'class QUrl' has no member named 'd'
     inline void swap(QUrl &other) Q_DECL_NOTHROW { qSwap(d, other.d); }
                                                                   ^
../../../../include/QtCore/../../../git/src/corelib/io/qurl.h: At global sc=
ope:
../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:185:37: error=
: 'ParsingMode' has not been declared
     void setUrl(const QString &url, ParsingMode mode =3D TolerantMode);
                                     ^
../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:185:56: error=
: 'TolerantMode' was not declared in this scope
     void setUrl(const QString &url, ParsingMode mode =3D TolerantMode);
                                                        ^
../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:186:79: error=
: non-member function 'QString url(FormattingOptions)' cannot have cv-quali=
fier
     QString url(FormattingOptions options =3D FormattingOptions(PrettyDeco=
ded)) const;
                                                                           =
    ^
../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:187:84: error=
: non-member function 'QString toString(FormattingOptions)' cannot have cv-=
qualifier
     QString toString(FormattingOptions options =3D FormattingOptions(Prett=
yDecoded)) const;
                                                                           =
         ^
../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:188:91: error=
: non-member function 'QString toDisplayString(FormattingOptions)' cannot h=
ave cv-qualifier
     QString toDisplayString(FormattingOptions options =3D FormattingOption=
s(PrettyDecoded)) const;
                                                                           =
                ^
In file included from ../../../../include/QtCore/qcompilerdetection.h:1:0,
                 from ../../../../include/QtCore/../../../git/src/corelib/g=
lobal/qglobal.h:74,
                 from ../../../../include/QtCore/qglobal.h:1,
                 from ../../../../include/QtCore/../../../git/src/corelib/k=
ernel/qmetatype.h:38,
                 from ../../../../include/QtCore/qmetatype.h:1,
                 from ../../../../include/QtGui/5.5.0/QtGui/qpa/../../../..=
/../../git/src/gui/kernel/qplatformscreen.h:46,
                 from ../../../../include/QtGui/5.5.0/QtGui/qpa/qplatformsc=
reen.h:1,
                 from /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vf=
p-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plug=
ins/platforms/minimalegl/qminimaleglscreen.h:37,
                 from /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vf=
p-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plug=
ins/platforms/minimalegl/qminimaleglintegration.h:37,
                 from /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vf=
p-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plug=
ins/platforms/minimalegl/qminimaleglintegration.cpp:34:
../../../../include/QtCore/../../../git/src/corelib/global/qcompilerdetecti=
on.h:222:68: error: non-member function 'QUrl adjusted(FormattingOptions)' =
cannot have cv-qualifier
 #  define Q_REQUIRED_RESULT __attribute__ ((__warn_unused_result__))
                                                                    ^
../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:189:52: note:=
 in expansion of macro 'Q_REQUIRED_RESULT'
     QUrl adjusted(FormattingOptions options) const Q_REQUIRED_RESULT;
                                                    ^
In file included from ../../../../include/QtCore/qurl.h:1:0,
                 from ../../../../include/QtGui/../../../git/src/gui/kernel=
/qevent.h:48,
                 from ../../../../include/QtGui/qevent.h:1,
                 from ../../../../include/QtGui/../../../git/src/gui/text/q=
textlayout.h:42,
                 from ../../../../include/QtGui/qtextlayout.h:1,
                 from ../../../../include/QtGui/5.5.0/QtGui/private/../../.=
./../../../git/src/gui/text/qtextengine_p.h:52,
                 from ../../../../include/QtGui/5.5.0/QtGui/private/qtexten=
gine_p.h:1,
                 from ../../../../include/QtGui/5.5.0/QtGui/private/../../.=
./../../../git/src/gui/text/qfontengine_p.h:52,
                 from ../../../../include/QtGui/5.5.0/QtGui/private/qfonten=
gine_p.h:1,
                 from ../../../../include/QtGui/5.5.0/QtGui/qpa/../../../..=
/../../git/src/gui/text/qplatformfontdatabase.h:52,
                 from ../../../../include/QtGui/5.5.0/QtGui/qpa/qplatformfo=
ntdatabase.h:1,
                 from ../../../../include/QtPlatformSupport/5.5.0/QtPlatfor=
mSupport/private/../../../../../../git/src/platformsupport/fontdatabases/ba=
sic/qbasicfontdatabase_p.h:48,
                 from ../../../../include/QtPlatformSupport/5.5.0/QtPlatfor=
mSupport/private/qbasicfontdatabase_p.h:1,
                 from ../../../../include/QtPlatformSupport/5.5.0/QtPlatfor=
mSupport/private/../../../../../../git/src/platformsupport/fontdatabases/ge=
nericunix/qgenericunixfontdatabase_p.h:54,
                 from ../../../../include/QtPlatformSupport/5.5.0/QtPlatfor=
mSupport/private/qgenericunixfontdatabase_p.h:1,
                 from /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vf=
p-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plug=
ins/platforms/minimalegl/qminimaleglintegration.cpp:39:
../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:191:68: error=
: non-member function 'QByteArray toEncoded(FormattingOptions)' cannot have=
 cv-qualifier
     QByteArray toEncoded(FormattingOptions options =3D FullyEncoded) const=
;
                                                                    ^
../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:192:52: error=
: 'ParsingMode' has not been declared
     static QUrl fromEncoded(const QByteArray &url, ParsingMode mode =3D To=
lerantMode);
                                                    ^
../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:192:71: error=
: 'TolerantMode' was not declared in this scope
     static QUrl fromEncoded(const QByteArray &url, ParsingMode mode =3D To=
lerantMode);
                                                                       ^
../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:205:20: error=
: non-member function 'bool isValid()' cannot have cv-qualifier
     bool isValid() const;
                    ^
../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:206:27: error=
: non-member function 'QString errorString()' cannot have cv-qualifier
     QString errorString() const;
                           ^
../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:208:20: error=
: non-member function 'bool isEmpty()' cannot have cv-qualifier
     bool isEmpty() const;
                    ^
../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:212:22: error=
: non-member function 'QString scheme()' cannot have cv-qualifier
     QString scheme() const;
                      ^
../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:214:49: error=
: 'ParsingMode' has not been declared
     void setAuthority(const QString &authority, ParsingMode mode =3D Toler=
antMode);
                                                 ^
../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:214:68: error=
: 'TolerantMode' was not declared in this scope
     void setAuthority(const QString &authority, ParsingMode mode =3D Toler=
antMode);
                                                                    ^
../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:215:75: error=
: non-member function 'QString authority(ComponentFormattingOptions)' canno=
t have cv-qualifier
     QString authority(ComponentFormattingOptions options =3D PrettyDecoded=
) const;
                                                                           =
^
../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:217:47: error=
: 'ParsingMode' has not been declared
     void setUserInfo(const QString &userInfo, ParsingMode mode =3D Toleran=
tMode);
                                               ^
../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:217:66: error=
: 'TolerantMode' was not declared in this scope
     void setUserInfo(const QString &userInfo, ParsingMode mode =3D Toleran=
tMode);
                                                                  ^
../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:218:74: error=
: non-member function 'QString userInfo(ComponentFormattingOptions)' cannot=
 have cv-qualifier
     QString userInfo(ComponentFormattingOptions options =3D PrettyDecoded)=
 const;
                                                                          ^
../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:220:47: error=
: 'ParsingMode' has not been declared
     void setUserName(const QString &userName, ParsingMode mode =3D Decoded=
Mode);
                                               ^
../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:220:66: error=
: 'DecodedMode' was not declared in this scope
     void setUserName(const QString &userName, ParsingMode mode =3D Decoded=
Mode);
                                                                  ^
../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:221:73: error=
: non-member function 'QString userName(ComponentFormattingOptions)' cannot=
 have cv-qualifier
     QString userName(ComponentFormattingOptions options =3D FullyDecoded) =
const;
                                                                         ^
../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:223:47: error=
: 'ParsingMode' has not been declared
     void setPassword(const QString &password, ParsingMode mode =3D Decoded=
Mode);
                                               ^
../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:223:66: error=
: 'DecodedMode' was not declared in this scope
     void setPassword(const QString &password, ParsingMode mode =3D Decoded=
Mode);
                                                                  ^
../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:224:65: error=
: non-member function 'QString password(ComponentFormattingOptions)' cannot=
 have cv-qualifier
     QString password(ComponentFormattingOptions =3D FullyDecoded) const;
                                                                 ^
../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:226:39: error=
: 'ParsingMode' has not been declared
     void setHost(const QString &host, ParsingMode mode =3D DecodedMode);
                                       ^
../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:226:58: error=
: 'DecodedMode' was not declared in this scope
     void setHost(const QString &host, ParsingMode mode =3D DecodedMode);
                                                          ^
../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:227:61: error=
: non-member function 'QString host(ComponentFormattingOptions)' cannot hav=
e cv-qualifier
     QString host(ComponentFormattingOptions =3D FullyDecoded) const;
                                                             ^
../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:228:79: error=
: non-member function 'QString topLevelDomain(ComponentFormattingOptions)' =
cannot have cv-qualifier
     QString topLevelDomain(ComponentFormattingOptions options =3D FullyDec=
oded) const;
                                                                           =
    ^
../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:231:36: error=
: non-member function 'int port(int)' cannot have cv-qualifier
     int port(int defaultPort =3D -1) const;
                                    ^
../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:233:39: error=
: 'ParsingMode' has not been declared
     void setPath(const QString &path, ParsingMode mode =3D DecodedMode);
                                       ^
../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:233:58: error=
: 'DecodedMode' was not declared in this scope
     void setPath(const QString &path, ParsingMode mode =3D DecodedMode);
                                                          ^
../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:234:69: error=
: non-member function 'QString path(ComponentFormattingOptions)' cannot hav=
e cv-qualifier
     QString path(ComponentFormattingOptions options =3D FullyDecoded) cons=
t;
                                                                     ^
../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:235:73: error=
: non-member function 'QString fileName(ComponentFormattingOptions)' cannot=
 have cv-qualifier
     QString fileName(ComponentFormattingOptions options =3D FullyDecoded) =
const;
                                                                         ^
../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:237:21: error=
: non-member function 'bool hasQuery()' cannot have cv-qualifier
     bool hasQuery() const;
                     ^
../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:238:41: error=
: 'ParsingMode' has not been declared
     void setQuery(const QString &query, ParsingMode mode =3D TolerantMode)=
;
                                         ^
../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:238:60: error=
: 'TolerantMode' was not declared in this scope
     void setQuery(const QString &query, ParsingMode mode =3D TolerantMode)=
;
                                                            ^
../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:240:63: error=
: non-member function 'QString query(ComponentFormattingOptions)' cannot ha=
ve cv-qualifier
     QString query(ComponentFormattingOptions =3D PrettyDecoded) const;
                                                               ^
../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:242:24: error=
: non-member function 'bool hasFragment()' cannot have cv-qualifier
     bool hasFragment() const;
                        ^
../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:243:74: error=
: non-member function 'QString fragment(ComponentFormattingOptions)' cannot=
 have cv-qualifier
     QString fragment(ComponentFormattingOptions options =3D PrettyDecoded)=
 const;
                                                                          ^
../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:244:47: error=
: 'ParsingMode' has not been declared
     void setFragment(const QString &fragment, ParsingMode mode =3D Toleran=
tMode);
                                               ^
../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:244:66: error=
: 'TolerantMode' was not declared in this scope
     void setFragment(const QString &fragment, ParsingMode mode =3D Toleran=
tMode);
                                                                  ^
In file included from ../../../../include/QtCore/qcompilerdetection.h:1:0,
                 from ../../../../include/QtCore/../../../git/src/corelib/g=
lobal/qglobal.h:74,
                 from ../../../../include/QtCore/qglobal.h:1,
                 from ../../../../include/QtCore/../../../git/src/corelib/k=
ernel/qmetatype.h:38,
                 from ../../../../include/QtCore/qmetatype.h:1,
                 from ../../../../include/QtGui/5.5.0/QtGui/qpa/../../../..=
/../../git/src/gui/kernel/qplatformscreen.h:46,
                 from ../../../../include/QtGui/5.5.0/QtGui/qpa/qplatformsc=
reen.h:1,
                 from /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vf=
p-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plug=
ins/platforms/minimalegl/qminimaleglscreen.h:37,
                 from /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vf=
p-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plug=
ins/platforms/minimalegl/qminimaleglintegration.h:37,
                 from /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vf=
p-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plug=
ins/platforms/minimalegl/qminimaleglintegration.cpp:34:
../../../../include/QtCore/../../../git/src/corelib/global/qcompilerdetecti=
on.h:222:68: error: non-member function 'QUrl resolved(const QUrl&)' cannot=
 have cv-qualifier
 #  define Q_REQUIRED_RESULT __attribute__ ((__warn_unused_result__))
                                                                    ^
../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:246:47: note:=
 in expansion of macro 'Q_REQUIRED_RESULT'
     QUrl resolved(const QUrl &relative) const Q_REQUIRED_RESULT;
                                               ^
In file included from ../../../../include/QtCore/qurl.h:1:0,
                 from ../../../../include/QtGui/../../../git/src/gui/kernel=
/qevent.h:48,
                 from ../../../../include/QtGui/qevent.h:1,
                 from ../../../../include/QtGui/../../../git/src/gui/text/q=
textlayout.h:42,
                 from ../../../../include/QtGui/qtextlayout.h:1,
                 from ../../../../include/QtGui/5.5.0/QtGui/private/../../.=
./../../../git/src/gui/text/qtextengine_p.h:52,
                 from ../../../../include/QtGui/5.5.0/QtGui/private/qtexten=
gine_p.h:1,
                 from ../../../../include/QtGui/5.5.0/QtGui/private/../../.=
./../../../git/src/gui/text/qfontengine_p.h:52,
                 from ../../../../include/QtGui/5.5.0/QtGui/private/qfonten=
gine_p.h:1,
                 from ../../../../include/QtGui/5.5.0/QtGui/qpa/../../../..=
/../../git/src/gui/text/qplatformfontdatabase.h:52,
                 from ../../../../include/QtGui/5.5.0/QtGui/qpa/qplatformfo=
ntdatabase.h:1,
                 from ../../../../include/QtPlatformSupport/5.5.0/QtPlatfor=
mSupport/private/../../../../../../git/src/platformsupport/fontdatabases/ba=
sic/qbasicfontdatabase_p.h:48,
                 from ../../../../include/QtPlatformSupport/5.5.0/QtPlatfor=
mSupport/private/qbasicfontdatabase_p.h:1,
                 from ../../../../include/QtPlatformSupport/5.5.0/QtPlatfor=
mSupport/private/../../../../../../git/src/platformsupport/fontdatabases/ge=
nericunix/qgenericunixfontdatabase_p.h:54,
                 from ../../../../include/QtPlatformSupport/5.5.0/QtPlatfor=
mSupport/private/qgenericunixfontdatabase_p.h:1,
                 from /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vf=
p-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plug=
ins/platforms/minimalegl/qminimaleglintegration.cpp:39:
../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:248:23: error=
: non-member function 'bool isRelative()' cannot have cv-qualifier
     bool isRelative() const;
                       ^
../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:249:38: error=
: non-member function 'bool isParentOf(const QUrl&)' cannot have cv-qualifi=
er
     bool isParentOf(const QUrl &url) const;
                                      ^
../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:251:24: error=
: non-member function 'bool isLocalFile()' cannot have cv-qualifier
     bool isLocalFile() const;
                        ^
../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:253:27: error=
: non-member function 'QString toLocalFile()' cannot have cv-qualifier
     QString toLocalFile() const;
                           ^
../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:256:23: error=
: non-member function 'bool isDetached()' cannot have cv-qualifier
     bool isDetached() const;
                       ^
../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:258:38: error=
: non-member function 'bool operator<(const QUrl&)' cannot have cv-qualifie=
r
     bool operator <(const QUrl &url) const;
                                      ^
../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:258:38: error=
: 'bool operator<(const QUrl&)' must take exactly two arguments
../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:259:39: error=
: non-member function 'bool operator=3D=3D(const QUrl&)' cannot have cv-qua=
lifier
     bool operator =3D=3D(const QUrl &url) const;
                                       ^
../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:259:39: error=
: 'bool operator=3D=3D(const QUrl&)' must take exactly two arguments
../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:260:39: error=
: non-member function 'bool operator!=3D(const QUrl&)' cannot have cv-quali=
fier
     bool operator !=3D(const QUrl &url) const;
                                       ^
../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:260:39: error=
: 'bool operator!=3D(const QUrl&)' must take exactly two arguments
../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:262:62: error=
: non-member function 'bool matches(const QUrl&, FormattingOptions)' cannot=
 have cv-qualifier
     bool matches(const QUrl &url, FormattingOptions options) const;
                                                              ^
../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:343:1: error:=
 expected unqualified-id before 'private'
 private:
 ^
../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:346:1: error:=
 expected unqualified-id before 'public'
 public:
 ^
../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:351:64: error=
: 'ParsingMode' has not been declared
     static QList<QUrl> fromStringList(const QStringList &uris, ParsingMode=
 mode =3D TolerantMode);
                                                                ^
../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:351:83: error=
: 'TolerantMode' was not declared in this scope
     static QList<QUrl> fromStringList(const QStringList &uris, ParsingMode=
 mode =3D TolerantMode);
                                                                           =
        ^
../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:354:5: error:=
 'friend' used outside of class
     friend Q_CORE_EXPORT uint qHash(const QUrl &url, uint seed) Q_DECL_NOT=
HROW;
     ^
../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:356:1: error:=
 expected unqualified-id before 'private'
 private:
 ^
../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:358:5: error:=
 'friend' used outside of class
     friend class QUrlQuery;
     ^
../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:360:1: error:=
 expected unqualified-id before 'public'
 public:
 ^
../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:362:12: error=
: 'DataPtr' does not name a type
     inline DataPtr &data_ptr() { return d; }
            ^
../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:363:1: error:=
 expected declaration before '}' token
 };
 ^
moc /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-linux-g=
nueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/platforminputc=
ontexts/ibus/qibusinputcontextproxy.h
../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:192:17: warni=
ng: 'QUrl fromEncoded(const QByteArray&, int)' declared 'static' but never =
defined [-Wunused-function]
     static QUrl fromEncoded(const QByteArray &url, ParsingMode mode =3D To=
lerantMode);
                 ^
../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:200:17: warni=
ng: 'QUrl fromUserInput(const QString&)' declared 'static' but never define=
d [-Wunused-function]
     static QUrl fromUserInput(const QString &userInput);
                 ^
../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:202:17: warni=
ng: 'QUrl fromUserInput(const QString&, const QString&, UserInputResolution=
Options)' declared 'static' but never defined [-Wunused-function]
     static QUrl fromUserInput(const QString &userInput, const QString &wor=
kingDirectory,
                 ^
../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:252:17: warni=
ng: 'QUrl fromLocalFile(const QString&)' declared 'static' but never define=
d [-Wunused-function]
     static QUrl fromLocalFile(const QString &localfile);
                 ^
../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:264:20: warni=
ng: 'QString fromPercentEncoding(const QByteArray&)' declared 'static' but =
never defined [-Wunused-function]
     static QString fromPercentEncoding(const QByteArray &);
                    ^
../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:265:23: warni=
ng: 'QByteArray toPercentEncoding(const QString&, const QByteArray&, const =
QByteArray&)' declared 'static' but never defined [-Wunused-function]
     static QByteArray toPercentEncoding(const QString &,
                       ^
../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:348:23: warni=
ng: 'QByteArray toAce(const QString&)' declared 'static' but never defined =
[-Wunused-function]
     static QByteArray toAce(const QString &);
                       ^
../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:349:24: warni=
ng: 'QStringList idnWhitelist()' declared 'static' but never defined [-Wunu=
sed-function]
     static QStringList idnWhitelist();
                        ^
../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:350:24: warni=
ng: 'QStringList toStringList(const QList<QUrl>&, FormattingOptions)' decla=
red 'static' but never defined [-Wunused-function]
     static QStringList toStringList(const QList<QUrl> &uris, FormattingOpt=
ions options =3D FormattingOptions(PrettyDecoded));
                        ^
../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:351:24: warni=
ng: 'QList<QUrl> fromStringList(const QStringList&, int)' declared 'static'=
 but never defined [-Wunused-function]
     static QList<QUrl> fromStringList(const QStringList &uris, ParsingMode=
 mode =3D TolerantMode);
                        ^
../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:353:17: warni=
ng: 'void setIdnWhitelist(const QStringList&)' declared 'static' but never =
defined [-Wunused-function]
     static void setIdnWhitelist(const QStringList &);
                 ^
Makefile:1242: recipe for target '.obj/qminimaleglintegration.o' failed
make[4]: *** [.obj/qminimaleglintegration.o] Error 1
make[4]: *** Waiting for unfinished jobs....
moc /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-linux-g=
nueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/bearer/qbearer=
engine_impl.h
compiling /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-l=
inux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/platform=
s/offscreen/main.cpp
compiling /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-l=
inux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/platform=
inputcontexts/ibus/main.cpp
compiling /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-l=
inux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/bearer/n=
etworkmanager/main.cpp
compiling .moc/moc_qibusplatforminputcontext.cpp
In file included from /scratch/cedar/boneblack/build/tmp/sysroots/mel-am335=
x-boneblack/usr/include/EGL/eglplatform.h:75:0,
                 from /scratch/cedar/boneblack/build/tmp/sysroots/mel-am335=
x-boneblack/usr/include/EGL/egl.h:35,
                 from /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vf=
p-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plug=
ins/platforms/eglfs/qeglfsdeviceintegration.h:53,
                 from /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vf=
p-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plug=
ins/platforms/eglfs/qeglfshooks.h:37,
                 from /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vf=
p-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plug=
ins/platforms/eglfs/qeglfshooks.cpp:34:
../../../../include/QtCore/../../../git/src/corelib/io/qtextstream.h:72:10:=
 error: expected identifier before 'int'
     enum Status {
          ^
In file included from ../../../../include/QtCore/qtextstream.h:1:0,
                 from ../../../../include/QtCore/../../../git/src/corelib/i=
o/qdebug.h:42,
                 from ../../../../include/QtCore/qdebug.h:1,
                 from ../../../../include/QtCore/../../../git/src/corelib/i=
o/qloggingcategory.h:38,
                 from ../../../../include/QtCore/qloggingcategory.h:1,
                 from ../../../../include/QtCore/QLoggingCategory:1,
                 from /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vf=
p-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plug=
ins/platforms/eglfs/qeglfshooks.cpp:35:
../../../../include/QtCore/../../../git/src/corelib/io/qtextstream.h:72:17:=
 error: expected unqualified-id before '{' token
     enum Status {
                 ^
make[4]: Leaving directory '/scratch/cedar/boneblack/build/tmp/work/cortexa=
8hf-vfp-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/build/=
src/plugins/platforms/minimalegl'
Makefile:146: recipe for target 'sub-minimalegl-make_first' failed
make[3]: *** [sub-minimalegl-make_first] Error 2
make[3]: *** Waiting for unfinished jobs....
compiling .moc/moc_qibusproxy.cpp
compiling .moc/moc_qibusinputcontextproxy.cpp
Makefile.eglfs_device_lib:1889: recipe for target '.obj/qeglfshooks.o' fail=
ed
make[5]: *** [.obj/qeglfshooks.o] Error 1
make[5]: Leaving directory '/scratch/cedar/boneblack/build/tmp/work/cortexa=
8hf-vfp-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/build/=
src/plugins/platforms/eglfs'
Makefile:42: recipe for target 'sub-eglfs_device_lib-pro-make_first-ordered=
' failed
make[4]: *** [sub-eglfs_device_lib-pro-make_first-ordered] Error 2
make[4]: Leaving directory '/scratch/cedar/boneblack/build/tmp/work/cortexa=
8hf-vfp-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/build/=
src/plugins/platforms/eglfs'
Makefile:121: recipe for target 'sub-eglfs-make_first' failed
make[3]: *** [sub-eglfs-make_first] Error 2
compiling .moc/moc_qtuiohandler_p.cpp
compiling /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-l=
inux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/bearer/q=
networksession_impl.cpp
compiling /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-l=
inux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/platform=
s/xcb/qxcbbackingstore.cpp
compiling /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-l=
inux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/platform=
s/xcb/qxcbwmsupport.cpp
compiling /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-l=
inux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/platform=
s/xcb/qxcbnativeinterface.cpp
rm -f libqoffscreen.so
linking ../../../../plugins/platforms/libqoffscreen.so
rm -f libqgenericbearer.so
linking ../../../../plugins/bearer/libqgenericbearer.so
mv -f libqgenericbearer.so ../../../../plugins/bearer/=20
make[4]: Leaving directory '/scratch/cedar/boneblack/build/tmp/work/cortexa=
8hf-vfp-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/build/=
src/plugins/bearer/generic'
compiling .moc/moc_qnetworkmanagerservice.cpp
mv -f libqoffscreen.so ../../../../plugins/platforms/=20
make[4]: Leaving directory '/scratch/cedar/boneblack/build/tmp/work/cortexa=
8hf-vfp-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/build/=
src/plugins/platforms/offscreen'
compiling /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-l=
inux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/platform=
s/xcb/qxcbcursor.cpp
rm -f libqtuiotouchplugin.so
linking ../../../../plugins/generic/libqtuiotouchplugin.so
compiling .moc/moc_qnetworkmanagerengine.cpp
compiling .moc/moc_qofonoservice_linux_p.cpp
mv -f libqtuiotouchplugin.so ../../../../plugins/generic/=20
moc /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-linux-g=
nueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/bearer/qnetwor=
ksession_impl.cpp
make[4]: Leaving directory '/scratch/cedar/boneblack/build/tmp/work/cortexa=
8hf-vfp-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/build/=
src/plugins/generic/tuiotouch'
make[3]: Leaving directory '/scratch/cedar/boneblack/build/tmp/work/cortexa=
8hf-vfp-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/build/=
src/plugins/generic'
compiling /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-l=
inux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/platform=
s/xcb/qxcbimage.cpp
moc /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-linux-g=
nueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/bearer/connman=
/qconnmanservice_linux_p.h
moc /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-linux-g=
nueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/bearer/linux_c=
ommon/qofonoservice_linux_p.h
moc /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-linux-g=
nueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/bearer/connman=
/qconnmanengine.h
moc /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-linux-g=
nueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/bearer/qnetwor=
ksession_impl.h
rm -f libibusplatforminputcontextplugin.so
linking ../../../../plugins/platforminputcontexts/libibusplatforminputconte=
xtplugin.so
compiling .moc/moc_qnetworksession_impl.cpp
moc /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-linux-g=
nueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/bearer/qbearer=
engine_impl.h
compiling /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-l=
inux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/platform=
s/xcb/qxcbxsettings.cpp
compiling /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-l=
inux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/platform=
s/xcb/qxcbsystemtraytracker.cpp
compiling /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-l=
inux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/platform=
s/xcb/qxcbconnection_xi2.cpp
mv -f libibusplatforminputcontextplugin.so ../../../../plugins/platforminpu=
tcontexts/=20
make[4]: Leaving directory '/scratch/cedar/boneblack/build/tmp/work/cortexa=
8hf-vfp-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/build/=
src/plugins/platforminputcontexts/ibus'
make[3]: Leaving directory '/scratch/cedar/boneblack/build/tmp/work/cortexa=
8hf-vfp-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/build/=
src/plugins/platforminputcontexts'
compiling /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-l=
inux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/platform=
s/xcb/gl_integrations/qxcbglintegrationfactory.cpp
compiling /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-l=
inux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/bearer/c=
onnman/main.cpp
compiling .moc/moc_qbearerengine_impl.cpp
compiling /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-l=
inux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/platform=
s/xcb/gl_integrations/qxcbglintegration.cpp
compiling /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-l=
inux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/platform=
s/xcb/gl_integrations/qxcbnativeinterfacehandler.cpp
moc /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-linux-g=
nueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/platforms/xcb/=
qxcbconnection.h
moc /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-linux-g=
nueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/platforms/xcb/=
qxcbmime.h
compiling /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-l=
inux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/bearer/q=
networksession_impl.cpp
moc /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-linux-g=
nueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/platforms/xcb/=
qxcbnativeinterface.h
moc /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-linux-g=
nueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/platforms/xcb/=
qxcbsystemtraytracker.h
compiling .moc/moc_qconnmanservice_linux_p.cpp
moc /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-linux-g=
nueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/platforms/xcb/=
gl_integrations/qxcbglintegrationplugin.h
compiling .moc/moc_qofonoservice_linux_p.cpp
rm -f libqnmbearer.so
linking ../../../../plugins/bearer/libqnmbearer.so
compiling .moc/moc_qconnmanengine.cpp
compiling /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-l=
inux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/platform=
s/xcb/qxcbclipboard.cpp
compiling .moc/moc_qxcbconnection.cpp
compiling .moc/moc_qxcbmime.cpp
compiling .moc/moc_qxcbnativeinterface.cpp
compiling .moc/moc_qxcbsystemtraytracker.cpp
compiling .moc/moc_qxcbglintegrationplugin.cpp
mv -f libqnmbearer.so ../../../../plugins/bearer/=20
make[4]: Leaving directory '/scratch/cedar/boneblack/build/tmp/work/cortexa=
8hf-vfp-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/build/=
src/plugins/bearer/networkmanager'
compiling .moc/moc_qnetworksession_impl.cpp
compiling .moc/moc_qbearerengine_impl.cpp
rm -f libqconnmanbearer.so
linking ../../../../plugins/bearer/libqconnmanbearer.so
mv -f libqconnmanbearer.so ../../../../plugins/bearer/=20
make[4]: Leaving directory '/scratch/cedar/boneblack/build/tmp/work/cortexa=
8hf-vfp-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/build/=
src/plugins/bearer/connman'
make[3]: Leaving directory '/scratch/cedar/boneblack/build/tmp/work/cortexa=
8hf-vfp-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/build/=
src/plugins/bearer'
rm -f libQt5XcbQpa.so.5.5.0 libQt5XcbQpa.so libQt5XcbQpa.so.5 libQt5XcbQpa.=
so.5.5
linking ../../../../lib/libQt5XcbQpa.so.5.5.0
ln -s libQt5XcbQpa.so.5.5.0 libQt5XcbQpa.so
ln -s libQt5XcbQpa.so.5.5.0 libQt5XcbQpa.so.5
ln -s libQt5XcbQpa.so.5.5.0 libQt5XcbQpa.so.5.5
rm -f ../../../../lib/libQt5XcbQpa.so.5.5.0
mv -f libQt5XcbQpa.so.5.5.0  ../../../../lib/=20
rm -f ../../../../lib/libQt5XcbQpa.so
rm -f ../../../../lib/libQt5XcbQpa.so.5
rm -f ../../../../lib/libQt5XcbQpa.so.5.5
mv -f libQt5XcbQpa.so ../../../../lib/=20
mv -f libQt5XcbQpa.so.5 ../../../../lib/=20
mv -f libQt5XcbQpa.so.5.5 ../../../../lib/=20
make[5]: Leaving directory '/scratch/cedar/boneblack/build/tmp/work/cortexa=
8hf-vfp-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/build/=
src/plugins/platforms/xcb'
( test -e Makefile.xcb-plugin || /scratch/cedar/boneblack/build/tmp/work/co=
rtexa8hf-vfp-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/b=
uild/bin/qmake /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-=
mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/pla=
tforms/xcb/xcb-plugin.pro -o Makefile.xcb-plugin ) && make -f Makefile.xcb-=
plugin=20
make[5]: Entering directory '/scratch/cedar/boneblack/build/tmp/work/cortex=
a8hf-vfp-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/build=
/src/plugins/platforms/xcb'
moc /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-linux-g=
nueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/platforms/xcb/=
qxcbmain.cpp
compiling /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-l=
inux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/platform=
s/xcb/qxcbmain.cpp
rm -f libqxcb.so
linking ../../../../plugins/platforms/libqxcb.so
mv -f libqxcb.so ../../../../plugins/platforms/=20
make[5]: Leaving directory '/scratch/cedar/boneblack/build/tmp/work/cortexa=
8hf-vfp-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/build/=
src/plugins/platforms/xcb'
cd gl_integrations/ && ( test -e Makefile || /scratch/cedar/boneblack/build=
/tmp/work/cortexa8hf-vfp-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fd=
e9f59ee-r0/build/bin/qmake /scratch/cedar/boneblack/build/tmp/work/cortexa8=
hf-vfp-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src=
/plugins/platforms/xcb/gl_integrations/gl_integrations.pro -o Makefile ) &&=
 make -f Makefile=20
make[5]: Entering directory '/scratch/cedar/boneblack/build/tmp/work/cortex=
a8hf-vfp-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/build=
/src/plugins/platforms/xcb/gl_integrations'
cd xcb_egl/ && ( test -e Makefile || /scratch/cedar/boneblack/build/tmp/wor=
k/cortexa8hf-vfp-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-=
r0/build/bin/qmake /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-n=
eon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins=
/platforms/xcb/gl_integrations/xcb_egl/xcb_egl.pro -o Makefile ) && make -f=
 Makefile=20
make[6]: Entering directory '/scratch/cedar/boneblack/build/tmp/work/cortex=
a8hf-vfp-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/build=
/src/plugins/platforms/xcb/gl_integrations/xcb_egl'
compiling /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-l=
inux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/platform=
s/xcb/gl_integrations/xcb_egl/qxcbeglintegration.cpp
compiling /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-l=
inux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/platform=
s/xcb/gl_integrations/xcb_egl/qxcbeglwindow.cpp
moc /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-linux-g=
nueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/platforms/xcb/=
gl_integrations/xcb_egl/qxcbeglmain.cpp
compiling /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-l=
inux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/platform=
s/xcb/gl_integrations/xcb_egl/qxcbeglnativeinterfacehandler.cpp
compiling /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-l=
inux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/platform=
s/xcb/gl_integrations/xcb_egl/qxcbeglmain.cpp
rm -f libqxcb-egl-integration.so
linking ../../../../../../plugins/xcbglintegrations/libqxcb-egl-integration=
.so
mv -f libqxcb-egl-integration.so ../../../../../../plugins/xcbglintegration=
s/=20
make[6]: Leaving directory '/scratch/cedar/boneblack/build/tmp/work/cortexa=
8hf-vfp-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/build/=
src/plugins/platforms/xcb/gl_integrations/xcb_egl'
make[5]: Leaving directory '/scratch/cedar/boneblack/build/tmp/work/cortexa=
8hf-vfp-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/build/=
src/plugins/platforms/xcb/gl_integrations'
make[4]: Leaving directory '/scratch/cedar/boneblack/build/tmp/work/cortexa=
8hf-vfp-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/build/=
src/plugins/platforms/xcb'
make[3]: Leaving directory '/scratch/cedar/boneblack/build/tmp/work/cortexa=
8hf-vfp-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/build/=
src/plugins/platforms'
Makefile:125: recipe for target 'sub-platforms-make_first' failed
make[2]: *** [sub-platforms-make_first] Error 2
make[2]: Leaving directory '/scratch/cedar/boneblack/build/tmp/work/cortexa=
8hf-vfp-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/build/=
src/plugins'
Makefile:720: recipe for target 'sub-plugins-make_first' failed
make[1]: *** [sub-plugins-make_first] Error 2
make[1]: Leaving directory '/scratch/cedar/boneblack/build/tmp/work/cortexa=
8hf-vfp-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/build/=
src'
Makefile:45: recipe for target 'sub-src-make_first' failed
make: *** [sub-src-make_first] Error 2
WARNING: exit code 1 from a shell command.
ERROR: oe_runmake failed
ERROR: Function failed: do_compile (log file is located at /scratch/cedar/b=
oneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-linux-gnueabi/qtbase/5.5.0+=
gitAUTOINC+2fde9f59ee-r0/temp/log.do_compile.15120)

