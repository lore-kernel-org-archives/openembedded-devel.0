Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f49.google.com (mail-pa0-f49.google.com
	[209.85.220.49])
	by mail.openembedded.org (Postfix) with ESMTP id D799A65C8A
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  8 Oct 2015 01:31:58 +0000 (UTC)
Received: by padhy16 with SMTP id hy16so37479101pad.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 Oct 2015 18:31:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=j4MXyhAFaTE277sBrfkpdRH36OMEUMZbugY773pQfFA=;
	b=0z/+m9jTG1dTmVUdBvHmz2bnxB1xvQyvIYT//OvGXsNKhyJBbRaIqUfkAF/OfpBsC/
	/zFMSy5EwsG4eJhRnevfaRV+EyEz5ZX8DL+y5owQ7XZH4sf/cBE+44Pjx2ng5VPM42bH
	Kw88g8c5zHW6XKGhBqU8a6IBooo5tAm3pVbsPdMqj4JFGSoF4Quk0rTS/8he09Z2Ydln
	2haakI0PmZPtetvpJsW90ophgpp/yGN4nd2Zdpg38MZDjxPwMNm9tGxPsxDbWoEfjAwi
	yh/cSNsYmWnNn3Fk4XaBKnTTPcYgG0yo3finrRrLn0vxJBuJJfDdXRaV449S+SN+l7J8
	V9tQ==
X-Received: by 10.68.90.34 with SMTP id bt2mr4754081pbb.145.1444267918785;
	Wed, 07 Oct 2015 18:31:58 -0700 (PDT)
Received: from ?IPv6:2601:646:8601:4580:787e:b3a8:cb23:6c63?
	([2601:646:8601:4580:787e:b3a8:cb23:6c63])
	by smtp.gmail.com with ESMTPSA id
	si10sm38949391pab.15.2015.10.07.18.31.57
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 07 Oct 2015 18:31:58 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.0 \(3095\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <365E1805BC95084CBE82381A0B86999401095F2C61@EU-MBX-01.mgc.mentorg.com>
Date: Wed, 7 Oct 2015 18:31:54 -0700
Message-Id: <75C05298-D139-4FC3-938A-18FABB43F5CF@gmail.com>
References: <365E1805BC95084CBE82381A0B86999401095F2C61@EU-MBX-01.mgc.mentorg.com>
To: Martin Jansa <openembedded-devel@lists.openembedded.org>
X-Mailer: Apple Mail (2.3095)
Cc: "Haridasan, Sujith" <Sujith_Haridasan@mentor.com>, "Larson,
	Chris" <Chris_Larson@mentor.com>
Subject: Re: [Meta-qt5] Multiple definition of None on qminimaleglintegration for BBB
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
X-List-Received-Date: Thu, 08 Oct 2015 01:31:59 -0000
X-Groupsio-MsgNum: 57705
Content-Type: multipart/signed;
	boundary="Apple-Mail=_CE080E77-007F-4914-84CD-98684FAA60CA";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_CE080E77-007F-4914-84CD-98684FAA60CA
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Oct 7, 2015, at 4:20 AM, Ahsan, Noor <Noor_Ahsan@mentor.com> wrote:
>=20
> Hello,
>=20
> We were building QT5 on BBB and we faced similar issue which has been =
fixed in =
0012-qeglplatformscreen.cpp-reorder-headers-to-fix-build-.patch0012-qeglpl=
atformscreen.cpp-reorder-headers-to-fix-build-.patch but this time it is =
on qminimaleglintegration file. Can anybody guide us how to fix this =
issue. I added following code in qurl.h for previous issue but community =
said that there is better fix.
>=20
> #ifdef None
> #undef None
> #endif
>=20

None is defined as 0 for universal null resource in X11 headers =
(X11/X.h) IIRC, so its likely that this file has dependency on x11 and =
you are not supplying that ?
may be you should see if you are missing some QT feature


> The stripped error log is shown below.
>=20
> linking =
../../../../plugins/platforminputcontexts/libcomposeplatforminputcontextpl=
ugin.so
> mv -f libqminimal.so ../../../../plugins/platforms/
> make[4]: Leaving directory =
'/scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-linux-gnu=
eabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/build/src/plugins/platforms/min=
imal'
> cd minimalegl/ && ( test -e Makefile || =
/scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-linux-gnue=
abi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/build/bin/qmake =
/scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-linux-gnue=
abi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/platforms/minima=
legl/minimalegl.pro -o Makefile ) && make -f Makefile
> mv -f libcomposeplatforminputcontextplugin.so =
../../../../plugins/platforminputcontexts/
> make[4]: Leaving directory =
'/scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-linux-gnu=
eabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/build/src/plugins/platforminput=
contexts/compose'
> compiling =
/scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-linux-gnue=
abi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/bearer/generic/m=
ain.cpp
> compiling =
/scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-linux-gnue=
abi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/platforms/eglfs/=
qeglfsscreen.cpp
> moc =
/scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-linux-gnue=
abi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/bearer/qnetworks=
ession_impl.cpp
> make[4]: Entering directory =
'/scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-linux-gnu=
eabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/build/src/plugins/platforms/min=
imalegl'
> moc =
/scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-linux-gnue=
abi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/platforms/minima=
legl/main.cpp
> compiling =
/scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-linux-gnue=
abi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/platforms/offscr=
een/qoffscreenintegration_dummy.cpp
> compiling =
/scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-linux-gnue=
abi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/platforms/minima=
legl/qminimaleglintegration.cpp
> moc =
/scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-linux-gnue=
abi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/bearer/networkma=
nager/qnetworkmanagerservice.h
> compiling =
/scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-linux-gnue=
abi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/platforms/minima=
legl/qminimaleglwindow.cpp
> compiling .moc/moc_qgenericengine.cpp
> moc =
/scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-linux-gnue=
abi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/platforminputcon=
texts/ibus/main.cpp
> moc =
/scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-linux-gnue=
abi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/bearer/networkma=
nager/qnetworkmanagerengine.h
> compiling =
/scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-linux-gnue=
abi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/platforms/xcb/qx=
cbscreen.cpp
> moc =
/scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-linux-gnue=
abi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/platforminputcon=
texts/ibus/qibusplatforminputcontext.h
> moc =
/scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-linux-gnue=
abi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/generic/tuiotouc=
h/qtuiohandler_p.h
> moc =
/scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-linux-gnue=
abi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/bearer/linux_com=
mon/qofonoservice_linux_p.h
> moc =
/scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-linux-gnue=
abi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/platforminputcon=
texts/ibus/qibusproxy.h
> compiling =
/scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-linux-gnue=
abi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/generic/tuiotouc=
h/main.cpp
> compiling =
/scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-linux-gnue=
abi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/platforms/eglfs/=
qeglfshooks.cpp
> compiling .moc/moc_qnetworksession_impl.cpp
> compiling =
/scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-linux-gnue=
abi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/platforms/xcb/qx=
cbwindow.cpp
> moc =
/scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-linux-gnue=
abi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/bearer/qnetworks=
ession_impl.h
> In file included from =
/scratch/cedar/boneblack/build/tmp/sysroots/mel-am335x-boneblack/usr/inclu=
de/X11/Xlib.h:44:0,
>                 from =
/scratch/cedar/boneblack/build/tmp/sysroots/mel-am335x-boneblack/usr/inclu=
de/EGL/eglplatform.h:75,
>                 from =
/scratch/cedar/boneblack/build/tmp/sysroots/mel-am335x-boneblack/usr/inclu=
de/EGL/egl.h:35,
>                 from =
/scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-linux-gnue=
abi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/platforms/minima=
legl/qminimaleglscreen.h:41,
>                 from =
/scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-linux-gnue=
abi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/platforms/minima=
legl/qminimaleglintegration.h:37,
>                 from =
/scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-linux-gnue=
abi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/platforms/minima=
legl/qminimaleglintegration.cpp:34:
> ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:131:9: =
error: expected identifier before numeric constant
>         None =3D 0x0,
>         ^
> In file included from ../../../../include/QtCore/qtextstream.h:1:0,
>                 from =
../../../../include/QtCore/../../../git/src/corelib/io/qdebug.h:42,
>                 from ../../../../include/QtCore/qdebug.h:1,
>                 from =
../../../../include/QtCore/../../../git/src/corelib/io/qloggingcategory.h:=
38,
>                 from ../../../../include/QtCore/qloggingcategory.h:1,
>                 from ../../../../include/QtCore/QLoggingCategory:1,
>                 from =
/scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-linux-gnue=
abi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/platforms/eglfs/=
qeglfshooks.cpp:35:
> =
../../../../include/QtCore/../../../git/src/corelib/io/qtextstream.h:46:2:=
 error: #error qtextstream.h must be included before any header file =
that defines Status
> #error qtextstream.h must be included before any header file that =
defines Status
>  ^
> ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:131:9: =
error: expected '}' before numeric constant
> ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:131:9: =
error: expected unqualified-id before numeric constant
> In file included from ../../../../include/QtCore/qurl.h:1:0,
>                 from =
../../../../include/QtGui/../../../git/src/gui/kernel/qevent.h:48,
>                 from ../../../../include/QtGui/qevent.h:1,
>                 from =
../../../../include/QtGui/../../../git/src/gui/text/qtextlayout.h:42,
>                 from ../../../../include/QtGui/qtextlayout.h:1,
>                 from =
../../../../include/QtGui/5.5.0/QtGui/private/../../../../../../git/src/gu=
i/text/qtextengine_p.h:52,
>                 from =
../../../../include/QtGui/5.5.0/QtGui/private/qtextengine_p.h:1,
>                 from =
../../../../include/QtGui/5.5.0/QtGui/private/../../../../../../git/src/gu=
i/text/qfontengine_p.h:52,
>                 from =
../../../../include/QtGui/5.5.0/QtGui/private/qfontengine_p.h:1,
>                 from =
../../../../include/QtGui/5.5.0/QtGui/qpa/../../../../../../git/src/gui/te=
xt/qplatformfontdatabase.h:52,
>                 from =
../../../../include/QtGui/5.5.0/QtGui/qpa/qplatformfontdatabase.h:1,
>                 from =
../../../../include/QtPlatformSupport/5.5.0/QtPlatformSupport/private/../.=
./../../../../git/src/platformsupport/fontdatabases/basic/qbasicfontdataba=
se_p.h:48,
>                 from =
../../../../include/QtPlatformSupport/5.5.0/QtPlatformSupport/private/qbas=
icfontdatabase_p.h:1,
>                 from =
../../../../include/QtPlatformSupport/5.5.0/QtPlatformSupport/private/../.=
./../../../../git/src/platformsupport/fontdatabases/genericunix/qgenericun=
ixfontdatabase_p.h:54,
>                 from =
../../../../include/QtPlatformSupport/5.5.0/QtPlatformSupport/private/qgen=
ericunixfontdatabase_p.h:1,
>                 from =
/scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-linux-gnue=
abi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/platforms/minima=
legl/qminimaleglintegration.cpp:39:
> ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:163:26: =
error: 'UrlFormattingOption' was not declared in this scope
>     typedef QUrlTwoFlags<UrlFormattingOption, =
ComponentFormattingOption> FormattingOptions;
>                          ^
> compiling .moc/moc_qbearerengine_impl.cpp
> compiling =
/scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-linux-gnue=
abi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/bearer/connman/q=
connmanengine.cpp
> ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:163:72: =
error: template argument 1 is invalid
>     typedef QUrlTwoFlags<UrlFormattingOption, =
ComponentFormattingOption> FormattingOptions;
>                                                                        =
^
> ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:166:10: =
error: expected unqualified-id before ')' token
>     QUrl();
>          ^
> ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:167:10: =
error: expected unqualified-id before 'const'
>     QUrl(const QUrl &copy);
>          ^
> ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:167:10: =
error: expected ')' before 'const'
> ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:168:38: =
error: 'QUrl& operator=3D(const QUrl&)' must be a nonstatic member =
function
>     QUrl &operator =3D(const QUrl &copy);
>                                      ^
> ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:172:10: =
error: expected unqualified-id before 'const'
>     QUrl(const QString &url, ParsingMode mode =3D TolerantMode);
>          ^
> ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:172:10: =
error: expected ')' before 'const'
> ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:173:39: =
error: 'QUrl& operator=3D(const QString&)' must be a nonstatic member =
function
>     QUrl &operator=3D(const QString &url);
>                                       ^
> ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:181:12: =
error: expected constructor, destructor, or type conversion before ';' =
token
>     ~QUrl();
>            ^
> ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h: In =
function 'void swap(QUrl&)':
> ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:183:58: =
error: 'd' was not declared in this scope
>     inline void swap(QUrl &other) Q_DECL_NOTHROW { qSwap(d, other.d); =
}
>                                                          ^
> ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:183:67: =
error: 'class QUrl' has no member named 'd'
>     inline void swap(QUrl &other) Q_DECL_NOTHROW { qSwap(d, other.d); =
}
>                                                                   ^
> ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h: At =
global scope:
> ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:185:37: =
error: 'ParsingMode' has not been declared
>     void setUrl(const QString &url, ParsingMode mode =3D =
TolerantMode);
>                                     ^
> ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:185:56: =
error: 'TolerantMode' was not declared in this scope
>     void setUrl(const QString &url, ParsingMode mode =3D =
TolerantMode);
>                                                        ^
> ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:186:79: =
error: non-member function 'QString url(FormattingOptions)' cannot have =
cv-qualifier
>     QString url(FormattingOptions options =3D =
FormattingOptions(PrettyDecoded)) const;
>                                                                        =
       ^
> ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:187:84: =
error: non-member function 'QString toString(FormattingOptions)' cannot =
have cv-qualifier
>     QString toString(FormattingOptions options =3D =
FormattingOptions(PrettyDecoded)) const;
>                                                                        =
            ^
> ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:188:91: =
error: non-member function 'QString toDisplayString(FormattingOptions)' =
cannot have cv-qualifier
>     QString toDisplayString(FormattingOptions options =3D =
FormattingOptions(PrettyDecoded)) const;
>                                                                        =
                   ^
> In file included from =
../../../../include/QtCore/qcompilerdetection.h:1:0,
>                 from =
../../../../include/QtCore/../../../git/src/corelib/global/qglobal.h:74,
>                 from ../../../../include/QtCore/qglobal.h:1,
>                 from =
../../../../include/QtCore/../../../git/src/corelib/kernel/qmetatype.h:38,=

>                 from ../../../../include/QtCore/qmetatype.h:1,
>                 from =
../../../../include/QtGui/5.5.0/QtGui/qpa/../../../../../../git/src/gui/ke=
rnel/qplatformscreen.h:46,
>                 from =
../../../../include/QtGui/5.5.0/QtGui/qpa/qplatformscreen.h:1,
>                 from =
/scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-linux-gnue=
abi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/platforms/minima=
legl/qminimaleglscreen.h:37,
>                 from =
/scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-linux-gnue=
abi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/platforms/minima=
legl/qminimaleglintegration.h:37,
>                 from =
/scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-linux-gnue=
abi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/platforms/minima=
legl/qminimaleglintegration.cpp:34:
> =
../../../../include/QtCore/../../../git/src/corelib/global/qcompilerdetect=
ion.h:222:68: error: non-member function 'QUrl =
adjusted(FormattingOptions)' cannot have cv-qualifier
> #  define Q_REQUIRED_RESULT __attribute__ ((__warn_unused_result__))
>                                                                    ^
> ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:189:52: =
note: in expansion of macro 'Q_REQUIRED_RESULT'
>     QUrl adjusted(FormattingOptions options) const Q_REQUIRED_RESULT;
>                                                    ^
> In file included from ../../../../include/QtCore/qurl.h:1:0,
>                 from =
../../../../include/QtGui/../../../git/src/gui/kernel/qevent.h:48,
>                 from ../../../../include/QtGui/qevent.h:1,
>                 from =
../../../../include/QtGui/../../../git/src/gui/text/qtextlayout.h:42,
>                 from ../../../../include/QtGui/qtextlayout.h:1,
>                 from =
../../../../include/QtGui/5.5.0/QtGui/private/../../../../../../git/src/gu=
i/text/qtextengine_p.h:52,
>                 from =
../../../../include/QtGui/5.5.0/QtGui/private/qtextengine_p.h:1,
>                 from =
../../../../include/QtGui/5.5.0/QtGui/private/../../../../../../git/src/gu=
i/text/qfontengine_p.h:52,
>                 from =
../../../../include/QtGui/5.5.0/QtGui/private/qfontengine_p.h:1,
>                 from =
../../../../include/QtGui/5.5.0/QtGui/qpa/../../../../../../git/src/gui/te=
xt/qplatformfontdatabase.h:52,
>                 from =
../../../../include/QtGui/5.5.0/QtGui/qpa/qplatformfontdatabase.h:1,
>                 from =
../../../../include/QtPlatformSupport/5.5.0/QtPlatformSupport/private/../.=
./../../../../git/src/platformsupport/fontdatabases/basic/qbasicfontdataba=
se_p.h:48,
>                 from =
../../../../include/QtPlatformSupport/5.5.0/QtPlatformSupport/private/qbas=
icfontdatabase_p.h:1,
>                 from =
../../../../include/QtPlatformSupport/5.5.0/QtPlatformSupport/private/../.=
./../../../../git/src/platformsupport/fontdatabases/genericunix/qgenericun=
ixfontdatabase_p.h:54,
>                 from =
../../../../include/QtPlatformSupport/5.5.0/QtPlatformSupport/private/qgen=
ericunixfontdatabase_p.h:1,
>                 from =
/scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-linux-gnue=
abi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/platforms/minima=
legl/qminimaleglintegration.cpp:39:
> ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:191:68: =
error: non-member function 'QByteArray toEncoded(FormattingOptions)' =
cannot have cv-qualifier
>     QByteArray toEncoded(FormattingOptions options =3D FullyEncoded) =
const;
>                                                                    ^
> ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:192:52: =
error: 'ParsingMode' has not been declared
>     static QUrl fromEncoded(const QByteArray &url, ParsingMode mode =3D =
TolerantMode);
>                                                    ^
> ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:192:71: =
error: 'TolerantMode' was not declared in this scope
>     static QUrl fromEncoded(const QByteArray &url, ParsingMode mode =3D =
TolerantMode);
>                                                                       =
^
> ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:205:20: =
error: non-member function 'bool isValid()' cannot have cv-qualifier
>     bool isValid() const;
>                    ^
> ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:206:27: =
error: non-member function 'QString errorString()' cannot have =
cv-qualifier
>     QString errorString() const;
>                           ^
> ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:208:20: =
error: non-member function 'bool isEmpty()' cannot have cv-qualifier
>     bool isEmpty() const;
>                    ^
> ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:212:22: =
error: non-member function 'QString scheme()' cannot have cv-qualifier
>     QString scheme() const;
>                      ^
> ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:214:49: =
error: 'ParsingMode' has not been declared
>     void setAuthority(const QString &authority, ParsingMode mode =3D =
TolerantMode);
>                                                 ^
> ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:214:68: =
error: 'TolerantMode' was not declared in this scope
>     void setAuthority(const QString &authority, ParsingMode mode =3D =
TolerantMode);
>                                                                    ^
> ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:215:75: =
error: non-member function 'QString =
authority(ComponentFormattingOptions)' cannot have cv-qualifier
>     QString authority(ComponentFormattingOptions options =3D =
PrettyDecoded) const;
>                                                                        =
   ^
> ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:217:47: =
error: 'ParsingMode' has not been declared
>     void setUserInfo(const QString &userInfo, ParsingMode mode =3D =
TolerantMode);
>                                               ^
> ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:217:66: =
error: 'TolerantMode' was not declared in this scope
>     void setUserInfo(const QString &userInfo, ParsingMode mode =3D =
TolerantMode);
>                                                                  ^
> ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:218:74: =
error: non-member function 'QString =
userInfo(ComponentFormattingOptions)' cannot have cv-qualifier
>     QString userInfo(ComponentFormattingOptions options =3D =
PrettyDecoded) const;
>                                                                        =
  ^
> ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:220:47: =
error: 'ParsingMode' has not been declared
>     void setUserName(const QString &userName, ParsingMode mode =3D =
DecodedMode);
>                                               ^
> ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:220:66: =
error: 'DecodedMode' was not declared in this scope
>     void setUserName(const QString &userName, ParsingMode mode =3D =
DecodedMode);
>                                                                  ^
> ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:221:73: =
error: non-member function 'QString =
userName(ComponentFormattingOptions)' cannot have cv-qualifier
>     QString userName(ComponentFormattingOptions options =3D =
FullyDecoded) const;
>                                                                        =
 ^
> ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:223:47: =
error: 'ParsingMode' has not been declared
>     void setPassword(const QString &password, ParsingMode mode =3D =
DecodedMode);
>                                               ^
> ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:223:66: =
error: 'DecodedMode' was not declared in this scope
>     void setPassword(const QString &password, ParsingMode mode =3D =
DecodedMode);
>                                                                  ^
> ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:224:65: =
error: non-member function 'QString =
password(ComponentFormattingOptions)' cannot have cv-qualifier
>     QString password(ComponentFormattingOptions =3D FullyDecoded) =
const;
>                                                                 ^
> ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:226:39: =
error: 'ParsingMode' has not been declared
>     void setHost(const QString &host, ParsingMode mode =3D =
DecodedMode);
>                                       ^
> ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:226:58: =
error: 'DecodedMode' was not declared in this scope
>     void setHost(const QString &host, ParsingMode mode =3D =
DecodedMode);
>                                                          ^
> ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:227:61: =
error: non-member function 'QString host(ComponentFormattingOptions)' =
cannot have cv-qualifier
>     QString host(ComponentFormattingOptions =3D FullyDecoded) const;
>                                                             ^
> ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:228:79: =
error: non-member function 'QString =
topLevelDomain(ComponentFormattingOptions)' cannot have cv-qualifier
>     QString topLevelDomain(ComponentFormattingOptions options =3D =
FullyDecoded) const;
>                                                                        =
       ^
> ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:231:36: =
error: non-member function 'int port(int)' cannot have cv-qualifier
>     int port(int defaultPort =3D -1) const;
>                                    ^
> ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:233:39: =
error: 'ParsingMode' has not been declared
>     void setPath(const QString &path, ParsingMode mode =3D =
DecodedMode);
>                                       ^
> ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:233:58: =
error: 'DecodedMode' was not declared in this scope
>     void setPath(const QString &path, ParsingMode mode =3D =
DecodedMode);
>                                                          ^
> ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:234:69: =
error: non-member function 'QString path(ComponentFormattingOptions)' =
cannot have cv-qualifier
>     QString path(ComponentFormattingOptions options =3D FullyDecoded) =
const;
>                                                                     ^
> ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:235:73: =
error: non-member function 'QString =
fileName(ComponentFormattingOptions)' cannot have cv-qualifier
>     QString fileName(ComponentFormattingOptions options =3D =
FullyDecoded) const;
>                                                                        =
 ^
> ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:237:21: =
error: non-member function 'bool hasQuery()' cannot have cv-qualifier
>     bool hasQuery() const;
>                     ^
> ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:238:41: =
error: 'ParsingMode' has not been declared
>     void setQuery(const QString &query, ParsingMode mode =3D =
TolerantMode);
>                                         ^
> ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:238:60: =
error: 'TolerantMode' was not declared in this scope
>     void setQuery(const QString &query, ParsingMode mode =3D =
TolerantMode);
>                                                            ^
> ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:240:63: =
error: non-member function 'QString query(ComponentFormattingOptions)' =
cannot have cv-qualifier
>     QString query(ComponentFormattingOptions =3D PrettyDecoded) const;
>                                                               ^
> ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:242:24: =
error: non-member function 'bool hasFragment()' cannot have cv-qualifier
>     bool hasFragment() const;
>                        ^
> ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:243:74: =
error: non-member function 'QString =
fragment(ComponentFormattingOptions)' cannot have cv-qualifier
>     QString fragment(ComponentFormattingOptions options =3D =
PrettyDecoded) const;
>                                                                        =
  ^
> ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:244:47: =
error: 'ParsingMode' has not been declared
>     void setFragment(const QString &fragment, ParsingMode mode =3D =
TolerantMode);
>                                               ^
> ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:244:66: =
error: 'TolerantMode' was not declared in this scope
>     void setFragment(const QString &fragment, ParsingMode mode =3D =
TolerantMode);
>                                                                  ^
> In file included from =
../../../../include/QtCore/qcompilerdetection.h:1:0,
>                 from =
../../../../include/QtCore/../../../git/src/corelib/global/qglobal.h:74,
>                 from ../../../../include/QtCore/qglobal.h:1,
>                 from =
../../../../include/QtCore/../../../git/src/corelib/kernel/qmetatype.h:38,=

>                 from ../../../../include/QtCore/qmetatype.h:1,
>                 from =
../../../../include/QtGui/5.5.0/QtGui/qpa/../../../../../../git/src/gui/ke=
rnel/qplatformscreen.h:46,
>                 from =
../../../../include/QtGui/5.5.0/QtGui/qpa/qplatformscreen.h:1,
>                 from =
/scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-linux-gnue=
abi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/platforms/minima=
legl/qminimaleglscreen.h:37,
>                 from =
/scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-linux-gnue=
abi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/platforms/minima=
legl/qminimaleglintegration.h:37,
>                 from =
/scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-linux-gnue=
abi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/platforms/minima=
legl/qminimaleglintegration.cpp:34:
> =
../../../../include/QtCore/../../../git/src/corelib/global/qcompilerdetect=
ion.h:222:68: error: non-member function 'QUrl resolved(const QUrl&)' =
cannot have cv-qualifier
> #  define Q_REQUIRED_RESULT __attribute__ ((__warn_unused_result__))
>                                                                    ^
> ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:246:47: =
note: in expansion of macro 'Q_REQUIRED_RESULT'
>     QUrl resolved(const QUrl &relative) const Q_REQUIRED_RESULT;
>                                               ^
> In file included from ../../../../include/QtCore/qurl.h:1:0,
>                 from =
../../../../include/QtGui/../../../git/src/gui/kernel/qevent.h:48,
>                 from ../../../../include/QtGui/qevent.h:1,
>                 from =
../../../../include/QtGui/../../../git/src/gui/text/qtextlayout.h:42,
>                 from ../../../../include/QtGui/qtextlayout.h:1,
>                 from =
../../../../include/QtGui/5.5.0/QtGui/private/../../../../../../git/src/gu=
i/text/qtextengine_p.h:52,
>                 from =
../../../../include/QtGui/5.5.0/QtGui/private/qtextengine_p.h:1,
>                 from =
../../../../include/QtGui/5.5.0/QtGui/private/../../../../../../git/src/gu=
i/text/qfontengine_p.h:52,
>                 from =
../../../../include/QtGui/5.5.0/QtGui/private/qfontengine_p.h:1,
>                 from =
../../../../include/QtGui/5.5.0/QtGui/qpa/../../../../../../git/src/gui/te=
xt/qplatformfontdatabase.h:52,
>                 from =
../../../../include/QtGui/5.5.0/QtGui/qpa/qplatformfontdatabase.h:1,
>                 from =
../../../../include/QtPlatformSupport/5.5.0/QtPlatformSupport/private/../.=
./../../../../git/src/platformsupport/fontdatabases/basic/qbasicfontdataba=
se_p.h:48,
>                 from =
../../../../include/QtPlatformSupport/5.5.0/QtPlatformSupport/private/qbas=
icfontdatabase_p.h:1,
>                 from =
../../../../include/QtPlatformSupport/5.5.0/QtPlatformSupport/private/../.=
./../../../../git/src/platformsupport/fontdatabases/genericunix/qgenericun=
ixfontdatabase_p.h:54,
>                 from =
../../../../include/QtPlatformSupport/5.5.0/QtPlatformSupport/private/qgen=
ericunixfontdatabase_p.h:1,
>                 from =
/scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-linux-gnue=
abi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/platforms/minima=
legl/qminimaleglintegration.cpp:39:
> ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:248:23: =
error: non-member function 'bool isRelative()' cannot have cv-qualifier
>     bool isRelative() const;
>                       ^
> ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:249:38: =
error: non-member function 'bool isParentOf(const QUrl&)' cannot have =
cv-qualifier
>     bool isParentOf(const QUrl &url) const;
>                                      ^
> ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:251:24: =
error: non-member function 'bool isLocalFile()' cannot have cv-qualifier
>     bool isLocalFile() const;
>                        ^
> ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:253:27: =
error: non-member function 'QString toLocalFile()' cannot have =
cv-qualifier
>     QString toLocalFile() const;
>                           ^
> ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:256:23: =
error: non-member function 'bool isDetached()' cannot have cv-qualifier
>     bool isDetached() const;
>                       ^
> ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:258:38: =
error: non-member function 'bool operator<(const QUrl&)' cannot have =
cv-qualifier
>     bool operator <(const QUrl &url) const;
>                                      ^
> ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:258:38: =
error: 'bool operator<(const QUrl&)' must take exactly two arguments
> ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:259:39: =
error: non-member function 'bool operator=3D=3D(const QUrl&)' cannot =
have cv-qualifier
>     bool operator =3D=3D(const QUrl &url) const;
>                                       ^
> ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:259:39: =
error: 'bool operator=3D=3D(const QUrl&)' must take exactly two =
arguments
> ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:260:39: =
error: non-member function 'bool operator!=3D(const QUrl&)' cannot have =
cv-qualifier
>     bool operator !=3D(const QUrl &url) const;
>                                       ^
> ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:260:39: =
error: 'bool operator!=3D(const QUrl&)' must take exactly two arguments
> ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:262:62: =
error: non-member function 'bool matches(const QUrl&, =
FormattingOptions)' cannot have cv-qualifier
>     bool matches(const QUrl &url, FormattingOptions options) const;
>                                                              ^
> ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:343:1: =
error: expected unqualified-id before 'private'
> private:
> ^
> ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:346:1: =
error: expected unqualified-id before 'public'
> public:
> ^
> ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:351:64: =
error: 'ParsingMode' has not been declared
>     static QList<QUrl> fromStringList(const QStringList &uris, =
ParsingMode mode =3D TolerantMode);
>                                                                ^
> ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:351:83: =
error: 'TolerantMode' was not declared in this scope
>     static QList<QUrl> fromStringList(const QStringList &uris, =
ParsingMode mode =3D TolerantMode);
>                                                                        =
           ^
> ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:354:5: =
error: 'friend' used outside of class
>     friend Q_CORE_EXPORT uint qHash(const QUrl &url, uint seed) =
Q_DECL_NOTHROW;
>     ^
> ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:356:1: =
error: expected unqualified-id before 'private'
> private:
> ^
> ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:358:5: =
error: 'friend' used outside of class
>     friend class QUrlQuery;
>     ^
> ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:360:1: =
error: expected unqualified-id before 'public'
> public:
> ^
> ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:362:12: =
error: 'DataPtr' does not name a type
>     inline DataPtr &data_ptr() { return d; }
>            ^
> ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:363:1: =
error: expected declaration before '}' token
> };
> ^
> moc =
/scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-linux-gnue=
abi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/platforminputcon=
texts/ibus/qibusinputcontextproxy.h
> ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:192:17: =
warning: 'QUrl fromEncoded(const QByteArray&, int)' declared 'static' =
but never defined [-Wunused-function]
>     static QUrl fromEncoded(const QByteArray &url, ParsingMode mode =3D =
TolerantMode);
>                 ^
> ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:200:17: =
warning: 'QUrl fromUserInput(const QString&)' declared 'static' but =
never defined [-Wunused-function]
>     static QUrl fromUserInput(const QString &userInput);
>                 ^
> ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:202:17: =
warning: 'QUrl fromUserInput(const QString&, const QString&, =
UserInputResolutionOptions)' declared 'static' but never defined =
[-Wunused-function]
>     static QUrl fromUserInput(const QString &userInput, const QString =
&workingDirectory,
>                 ^
> ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:252:17: =
warning: 'QUrl fromLocalFile(const QString&)' declared 'static' but =
never defined [-Wunused-function]
>     static QUrl fromLocalFile(const QString &localfile);
>                 ^
> ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:264:20: =
warning: 'QString fromPercentEncoding(const QByteArray&)' declared =
'static' but never defined [-Wunused-function]
>     static QString fromPercentEncoding(const QByteArray &);
>                    ^
> ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:265:23: =
warning: 'QByteArray toPercentEncoding(const QString&, const =
QByteArray&, const QByteArray&)' declared 'static' but never defined =
[-Wunused-function]
>     static QByteArray toPercentEncoding(const QString &,
>                       ^
> ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:348:23: =
warning: 'QByteArray toAce(const QString&)' declared 'static' but never =
defined [-Wunused-function]
>     static QByteArray toAce(const QString &);
>                       ^
> ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:349:24: =
warning: 'QStringList idnWhitelist()' declared 'static' but never =
defined [-Wunused-function]
>     static QStringList idnWhitelist();
>                        ^
> ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:350:24: =
warning: 'QStringList toStringList(const QList<QUrl>&, =
FormattingOptions)' declared 'static' but never defined =
[-Wunused-function]
>     static QStringList toStringList(const QList<QUrl> &uris, =
FormattingOptions options =3D FormattingOptions(PrettyDecoded));
>                        ^
> ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:351:24: =
warning: 'QList<QUrl> fromStringList(const QStringList&, int)' declared =
'static' but never defined [-Wunused-function]
>     static QList<QUrl> fromStringList(const QStringList &uris, =
ParsingMode mode =3D TolerantMode);
>                        ^
> ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:353:17: =
warning: 'void setIdnWhitelist(const QStringList&)' declared 'static' =
but never defined [-Wunused-function]
>     static void setIdnWhitelist(const QStringList &);
>                 ^
> Makefile:1242: recipe for target '.obj/qminimaleglintegration.o' =
failed
> make[4]: *** [.obj/qminimaleglintegration.o] Error 1
> make[4]: *** Waiting for unfinished jobs....
> moc =
/scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-linux-gnue=
abi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/bearer/qbeareren=
gine_impl.h
> compiling =
/scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-linux-gnue=
abi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/platforms/offscr=
een/main.cpp
> compiling =
/scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-linux-gnue=
abi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/platforminputcon=
texts/ibus/main.cpp
> compiling =
/scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-linux-gnue=
abi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/bearer/networkma=
nager/main.cpp
> compiling .moc/moc_qibusplatforminputcontext.cpp
> In file included from =
/scratch/cedar/boneblack/build/tmp/sysroots/mel-am335x-boneblack/usr/inclu=
de/EGL/eglplatform.h:75:0,
>                 from =
/scratch/cedar/boneblack/build/tmp/sysroots/mel-am335x-boneblack/usr/inclu=
de/EGL/egl.h:35,
>                 from =
/scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-linux-gnue=
abi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/platforms/eglfs/=
qeglfsdeviceintegration.h:53,
>                 from =
/scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-linux-gnue=
abi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/platforms/eglfs/=
qeglfshooks.h:37,
>                 from =
/scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-linux-gnue=
abi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/platforms/eglfs/=
qeglfshooks.cpp:34:
> =
../../../../include/QtCore/../../../git/src/corelib/io/qtextstream.h:72:10=
: error: expected identifier before 'int'
>     enum Status {
>          ^
> In file included from ../../../../include/QtCore/qtextstream.h:1:0,
>                 from =
../../../../include/QtCore/../../../git/src/corelib/io/qdebug.h:42,
>                 from ../../../../include/QtCore/qdebug.h:1,
>                 from =
../../../../include/QtCore/../../../git/src/corelib/io/qloggingcategory.h:=
38,
>                 from ../../../../include/QtCore/qloggingcategory.h:1,
>                 from ../../../../include/QtCore/QLoggingCategory:1,
>                 from =
/scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-linux-gnue=
abi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/platforms/eglfs/=
qeglfshooks.cpp:35:
> =
../../../../include/QtCore/../../../git/src/corelib/io/qtextstream.h:72:17=
: error: expected unqualified-id before '{' token
>     enum Status {
>                 ^
> make[4]: Leaving directory =
'/scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-linux-gnu=
eabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/build/src/plugins/platforms/min=
imalegl'
> Makefile:146: recipe for target 'sub-minimalegl-make_first' failed
> make[3]: *** [sub-minimalegl-make_first] Error 2
> make[3]: *** Waiting for unfinished jobs....
> compiling .moc/moc_qibusproxy.cpp
> compiling .moc/moc_qibusinputcontextproxy.cpp
> Makefile.eglfs_device_lib:1889: recipe for target '.obj/qeglfshooks.o' =
failed
> make[5]: *** [.obj/qeglfshooks.o] Error 1
> make[5]: Leaving directory =
'/scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-linux-gnu=
eabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/build/src/plugins/platforms/egl=
fs'
> Makefile:42: recipe for target =
'sub-eglfs_device_lib-pro-make_first-ordered' failed
> make[4]: *** [sub-eglfs_device_lib-pro-make_first-ordered] Error 2
> make[4]: Leaving directory =
'/scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-linux-gnu=
eabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/build/src/plugins/platforms/egl=
fs'
> Makefile:121: recipe for target 'sub-eglfs-make_first' failed
> make[3]: *** [sub-eglfs-make_first] Error 2
> compiling .moc/moc_qtuiohandler_p.cpp
> compiling =
/scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-linux-gnue=
abi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/bearer/qnetworks=
ession_impl.cpp
> compiling =
/scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-linux-gnue=
abi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/platforms/xcb/qx=
cbbackingstore.cpp
> compiling =
/scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-linux-gnue=
abi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/platforms/xcb/qx=
cbwmsupport.cpp
> compiling =
/scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-linux-gnue=
abi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/platforms/xcb/qx=
cbnativeinterface.cpp
> rm -f libqoffscreen.so
> linking ../../../../plugins/platforms/libqoffscreen.so
> rm -f libqgenericbearer.so
> linking ../../../../plugins/bearer/libqgenericbearer.so
> mv -f libqgenericbearer.so ../../../../plugins/bearer/
> make[4]: Leaving directory =
'/scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-linux-gnu=
eabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/build/src/plugins/bearer/generi=
c'
> compiling .moc/moc_qnetworkmanagerservice.cpp
> mv -f libqoffscreen.so ../../../../plugins/platforms/
> make[4]: Leaving directory =
'/scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-linux-gnu=
eabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/build/src/plugins/platforms/off=
screen'
> compiling =
/scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-linux-gnue=
abi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/platforms/xcb/qx=
cbcursor.cpp
> rm -f libqtuiotouchplugin.so
> linking ../../../../plugins/generic/libqtuiotouchplugin.so
> compiling .moc/moc_qnetworkmanagerengine.cpp
> compiling .moc/moc_qofonoservice_linux_p.cpp
> mv -f libqtuiotouchplugin.so ../../../../plugins/generic/
> moc =
/scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-linux-gnue=
abi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/bearer/qnetworks=
ession_impl.cpp
> make[4]: Leaving directory =
'/scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-linux-gnu=
eabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/build/src/plugins/generic/tuiot=
ouch'
> make[3]: Leaving directory =
'/scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-linux-gnu=
eabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/build/src/plugins/generic'
> compiling =
/scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-linux-gnue=
abi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/platforms/xcb/qx=
cbimage.cpp
> moc =
/scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-linux-gnue=
abi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/bearer/connman/q=
connmanservice_linux_p.h
> moc =
/scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-linux-gnue=
abi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/bearer/linux_com=
mon/qofonoservice_linux_p.h
> moc =
/scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-linux-gnue=
abi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/bearer/connman/q=
connmanengine.h
> moc =
/scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-linux-gnue=
abi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/bearer/qnetworks=
ession_impl.h
> rm -f libibusplatforminputcontextplugin.so
> linking =
../../../../plugins/platforminputcontexts/libibusplatforminputcontextplugi=
n.so
> compiling .moc/moc_qnetworksession_impl.cpp
> moc =
/scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-linux-gnue=
abi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/bearer/qbeareren=
gine_impl.h
> compiling =
/scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-linux-gnue=
abi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/platforms/xcb/qx=
cbxsettings.cpp
> compiling =
/scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-linux-gnue=
abi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/platforms/xcb/qx=
cbsystemtraytracker.cpp
> compiling =
/scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-linux-gnue=
abi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/platforms/xcb/qx=
cbconnection_xi2.cpp
> mv -f libibusplatforminputcontextplugin.so =
../../../../plugins/platforminputcontexts/
> make[4]: Leaving directory =
'/scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-linux-gnu=
eabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/build/src/plugins/platforminput=
contexts/ibus'
> make[3]: Leaving directory =
'/scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-linux-gnu=
eabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/build/src/plugins/platforminput=
contexts'
> compiling =
/scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-linux-gnue=
abi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/platforms/xcb/gl=
_integrations/qxcbglintegrationfactory.cpp
> compiling =
/scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-linux-gnue=
abi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/bearer/connman/m=
ain.cpp
> compiling .moc/moc_qbearerengine_impl.cpp
> compiling =
/scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-linux-gnue=
abi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/platforms/xcb/gl=
_integrations/qxcbglintegration.cpp
> compiling =
/scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-linux-gnue=
abi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/platforms/xcb/gl=
_integrations/qxcbnativeinterfacehandler.cpp
> moc =
/scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-linux-gnue=
abi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/platforms/xcb/qx=
cbconnection.h
> moc =
/scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-linux-gnue=
abi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/platforms/xcb/qx=
cbmime.h
> compiling =
/scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-linux-gnue=
abi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/bearer/qnetworks=
ession_impl.cpp
> moc =
/scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-linux-gnue=
abi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/platforms/xcb/qx=
cbnativeinterface.h
> moc =
/scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-linux-gnue=
abi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/platforms/xcb/qx=
cbsystemtraytracker.h
> compiling .moc/moc_qconnmanservice_linux_p.cpp
> moc =
/scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-linux-gnue=
abi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/platforms/xcb/gl=
_integrations/qxcbglintegrationplugin.h
> compiling .moc/moc_qofonoservice_linux_p.cpp
> rm -f libqnmbearer.so
> linking ../../../../plugins/bearer/libqnmbearer.so
> compiling .moc/moc_qconnmanengine.cpp
> compiling =
/scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-linux-gnue=
abi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/platforms/xcb/qx=
cbclipboard.cpp
> compiling .moc/moc_qxcbconnection.cpp
> compiling .moc/moc_qxcbmime.cpp
> compiling .moc/moc_qxcbnativeinterface.cpp
> compiling .moc/moc_qxcbsystemtraytracker.cpp
> compiling .moc/moc_qxcbglintegrationplugin.cpp
> mv -f libqnmbearer.so ../../../../plugins/bearer/
> make[4]: Leaving directory =
'/scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-linux-gnu=
eabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/build/src/plugins/bearer/networ=
kmanager'
> compiling .moc/moc_qnetworksession_impl.cpp
> compiling .moc/moc_qbearerengine_impl.cpp
> rm -f libqconnmanbearer.so
> linking ../../../../plugins/bearer/libqconnmanbearer.so
> mv -f libqconnmanbearer.so ../../../../plugins/bearer/
> make[4]: Leaving directory =
'/scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-linux-gnu=
eabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/build/src/plugins/bearer/connma=
n'
> make[3]: Leaving directory =
'/scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-linux-gnu=
eabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/build/src/plugins/bearer'
> rm -f libQt5XcbQpa.so.5.5.0 libQt5XcbQpa.so libQt5XcbQpa.so.5 =
libQt5XcbQpa.so.5.5
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
> make[5]: Leaving directory =
'/scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-linux-gnu=
eabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/build/src/plugins/platforms/xcb=
'
> ( test -e Makefile.xcb-plugin || =
/scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-linux-gnue=
abi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/build/bin/qmake =
/scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-linux-gnue=
abi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/platforms/xcb/xc=
b-plugin.pro -o Makefile.xcb-plugin ) && make -f Makefile.xcb-plugin
> make[5]: Entering directory =
'/scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-linux-gnu=
eabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/build/src/plugins/platforms/xcb=
'
> moc =
/scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-linux-gnue=
abi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/platforms/xcb/qx=
cbmain.cpp
> compiling =
/scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-linux-gnue=
abi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/platforms/xcb/qx=
cbmain.cpp
> rm -f libqxcb.so
> linking ../../../../plugins/platforms/libqxcb.so
> mv -f libqxcb.so ../../../../plugins/platforms/
> make[5]: Leaving directory =
'/scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-linux-gnu=
eabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/build/src/plugins/platforms/xcb=
'
> cd gl_integrations/ && ( test -e Makefile || =
/scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-linux-gnue=
abi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/build/bin/qmake =
/scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-linux-gnue=
abi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/platforms/xcb/gl=
_integrations/gl_integrations.pro -o Makefile ) && make -f Makefile
> make[5]: Entering directory =
'/scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-linux-gnu=
eabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/build/src/plugins/platforms/xcb=
/gl_integrations'
> cd xcb_egl/ && ( test -e Makefile || =
/scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-linux-gnue=
abi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/build/bin/qmake =
/scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-linux-gnue=
abi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/platforms/xcb/gl=
_integrations/xcb_egl/xcb_egl.pro -o Makefile ) && make -f Makefile
> make[6]: Entering directory =
'/scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-linux-gnu=
eabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/build/src/plugins/platforms/xcb=
/gl_integrations/xcb_egl'
> compiling =
/scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-linux-gnue=
abi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/platforms/xcb/gl=
_integrations/xcb_egl/qxcbeglintegration.cpp
> compiling =
/scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-linux-gnue=
abi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/platforms/xcb/gl=
_integrations/xcb_egl/qxcbeglwindow.cpp
> moc =
/scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-linux-gnue=
abi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/platforms/xcb/gl=
_integrations/xcb_egl/qxcbeglmain.cpp
> compiling =
/scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-linux-gnue=
abi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/platforms/xcb/gl=
_integrations/xcb_egl/qxcbeglnativeinterfacehandler.cpp
> compiling =
/scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-linux-gnue=
abi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/platforms/xcb/gl=
_integrations/xcb_egl/qxcbeglmain.cpp
> rm -f libqxcb-egl-integration.so
> linking =
../../../../../../plugins/xcbglintegrations/libqxcb-egl-integration.so
> mv -f libqxcb-egl-integration.so =
../../../../../../plugins/xcbglintegrations/
> make[6]: Leaving directory =
'/scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-linux-gnu=
eabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/build/src/plugins/platforms/xcb=
/gl_integrations/xcb_egl'
> make[5]: Leaving directory =
'/scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-linux-gnu=
eabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/build/src/plugins/platforms/xcb=
/gl_integrations'
> make[4]: Leaving directory =
'/scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-linux-gnu=
eabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/build/src/plugins/platforms/xcb=
'
> make[3]: Leaving directory =
'/scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-linux-gnu=
eabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/build/src/plugins/platforms'
> Makefile:125: recipe for target 'sub-platforms-make_first' failed
> make[2]: *** [sub-platforms-make_first] Error 2
> make[2]: Leaving directory =
'/scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-linux-gnu=
eabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/build/src/plugins'
> Makefile:720: recipe for target 'sub-plugins-make_first' failed
> make[1]: *** [sub-plugins-make_first] Error 2
> make[1]: Leaving directory =
'/scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-linux-gnu=
eabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/build/src'
> Makefile:45: recipe for target 'sub-src-make_first' failed
> make: *** [sub-src-make_first] Error 2
> WARNING: exit code 1 from a shell command.
> ERROR: oe_runmake failed
> ERROR: Function failed: do_compile (log file is located at =
/scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-linux-gnue=
abi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/temp/log.do_compile.15120)
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


--Apple-Mail=_CE080E77-007F-4914-84CD-98684FAA60CA
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlYVx44ACgkQuwUzVZGdMxTbMQCcDbSisK11b/oSLMfc+VvbqPhG
yxAAmgKyTCl142pvQ4unEVRYhTp9fPQN
=m5kZ
-----END PGP SIGNATURE-----

--Apple-Mail=_CE080E77-007F-4914-84CD-98684FAA60CA--
