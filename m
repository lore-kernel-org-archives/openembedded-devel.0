Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f170.google.com (mail-wi0-f170.google.com
	[209.85.212.170])
	by mail.openembedded.org (Postfix) with ESMTP id 1B71265CBC
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  8 Oct 2015 17:31:54 +0000 (UTC)
Received: by wiclk2 with SMTP id lk2so35547370wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 08 Oct 2015 10:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=9176Vd+g4CKwjvI+OlDjiCeWURNTG7IzIBiUePuwclc=;
	b=XP5kmv8hZPko3CuHp00R/w2m82JBbEt0z6SQscilxKMZUKW4tsGP6bmhiq3ziPWePr
	pK/0SdHW7xlZVaCxDUlpgfg2LMAX5DZhhluFdLlJCa7BX49f8n/DIkPAMgHF0DFhlAZS
	kRdkdgFK6f7ak5NX2OT03dvSVwHVrCc7t2/xxl4tFDqiOC6KusJjcMoKj/egIrZ9DG/P
	dBsWPOD8XmrxmyIj4/HQbR8iPAiybfbBaTWWO6F2NORDF1TT3dEnbnimn0KBDyQVYqSs
	8ln4RkP+z05pn1VAeAUWDWMVgGv9BgNwHM8iCnkUFThh4yC+teyxMefXLFQRWip/I4Jk
	f10Q==
X-Received: by 10.194.178.196 with SMTP id da4mr10829227wjc.41.1444325514790; 
	Thu, 08 Oct 2015 10:31:54 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	r9sm47402034wjz.35.2015.10.08.10.31.53
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 08 Oct 2015 10:31:54 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 8 Oct 2015 19:32:06 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20151008173206.GN2385@jama>
References: <365E1805BC95084CBE82381A0B86999401095F2C61@EU-MBX-01.mgc.mentorg.com>
	<75C05298-D139-4FC3-938A-18FABB43F5CF@gmail.com>
	<365E1805BC95084CBE82381A0B86999401095F4A37@EU-MBX-01.mgc.mentorg.com>
MIME-Version: 1.0
In-Reply-To: <365E1805BC95084CBE82381A0B86999401095F4A37@EU-MBX-01.mgc.mentorg.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
X-List-Received-Date: Thu, 08 Oct 2015 17:31:55 -0000
X-Groupsio-MsgNum: 57742
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="IoFIGPN1N3g1Ryqz"
Content-Disposition: inline

--IoFIGPN1N3g1Ryqz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 08, 2015 at 05:18:04PM +0000, Ahsan, Noor wrote:
> Hello Khem,
>=20
> This issue comes when X.h and qurl.h is included at the same time. We fac=
ed this issue on different file on i.mx6 and Alexander fixed that issue by =
rearranging the headers in C file see patch 0012-qeglplatformscreen.cpp-reo=
rder-headers-to-fix-build-.patch. Now we are facing this on other file for =
BBB I thought I should ask whether somebody else faced this issue or know t=
he fix.

I had the same issue with LuneOS earlier and came all the way to rename
"None" in all qt projects, but then I've dropped this patch and use this
undef in our sources before including qt headers after it was rejected
in upstream (for good reasons about API stability).

Regards,

> Noor
>=20
> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org [mailto:openembed=
ded-devel-bounces@lists.openembedded.org] On Behalf Of Khem Raj
> Sent: Thursday, October 08, 2015 6:32 AM
> To: Martin Jansa
> Cc: Haridasan, Sujith; Larson, Chris
> Subject: Re: [oe] [Meta-qt5] Multiple definition of None on qminimaleglin=
tegration for BBB
>=20
>=20
> > On Oct 7, 2015, at 4:20 AM, Ahsan, Noor <Noor_Ahsan@mentor.com> wrote:
> >=20
> > Hello,
> >=20
> > We were building QT5 on BBB and we faced similar issue which has been f=
ixed in 0012-qeglplatformscreen.cpp-reorder-headers-to-fix-build-.patch0012=
-qeglplatformscreen.cpp-reorder-headers-to-fix-build-.patch but this time i=
t is on qminimaleglintegration file. Can anybody guide us how to fix this i=
ssue. I added following code in qurl.h for previous issue but community sai=
d that there is better fix.
> >=20
> > #ifdef None
> > #undef None
> > #endif
> >=20
>=20
> None is defined as 0 for universal null resource in X11 headers (X11/X.h)=
 IIRC, so its likely that this file has dependency on x11 and you are not s=
upplying that ?
> may be you should see if you are missing some QT feature
>=20
>=20
> > The stripped error log is shown below.
> >=20
> > linking ../../../../plugins/platforminputcontexts/libcomposeplatforminp=
utcontextplugin.so
> > mv -f libqminimal.so ../../../../plugins/platforms/
> > make[4]: Leaving directory '/scratch/cedar/boneblack/build/tmp/work/cor=
texa8hf-vfp-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/bu=
ild/src/plugins/platforms/minimal'
> > cd minimalegl/ && ( test -e Makefile || /scratch/cedar/boneblack/build/=
tmp/work/cortexa8hf-vfp-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde=
9f59ee-r0/build/bin/qmake /scratch/cedar/boneblack/build/tmp/work/cortexa8h=
f-vfp-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/=
plugins/platforms/minimalegl/minimalegl.pro -o Makefile ) && make -f Makefi=
le
> > mv -f libcomposeplatforminputcontextplugin.so ../../../../plugins/platf=
orminputcontexts/
> > make[4]: Leaving directory '/scratch/cedar/boneblack/build/tmp/work/cor=
texa8hf-vfp-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/bu=
ild/src/plugins/platforminputcontexts/compose'
> > compiling /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-m=
el-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/bear=
er/generic/main.cpp
> > compiling /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-m=
el-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/plat=
forms/eglfs/qeglfsscreen.cpp
> > moc /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-lin=
ux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/bearer/qne=
tworksession_impl.cpp
> > make[4]: Entering directory '/scratch/cedar/boneblack/build/tmp/work/co=
rtexa8hf-vfp-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/b=
uild/src/plugins/platforms/minimalegl'
> > moc /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-lin=
ux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/platforms/=
minimalegl/main.cpp
> > compiling /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-m=
el-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/plat=
forms/offscreen/qoffscreenintegration_dummy.cpp
> > compiling /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-m=
el-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/plat=
forms/minimalegl/qminimaleglintegration.cpp
> > moc /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-lin=
ux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/bearer/net=
workmanager/qnetworkmanagerservice.h
> > compiling /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-m=
el-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/plat=
forms/minimalegl/qminimaleglwindow.cpp
> > compiling .moc/moc_qgenericengine.cpp
> > moc /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-lin=
ux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/platformin=
putcontexts/ibus/main.cpp
> > moc /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-lin=
ux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/bearer/net=
workmanager/qnetworkmanagerengine.h
> > compiling /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-m=
el-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/plat=
forms/xcb/qxcbscreen.cpp
> > moc /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-lin=
ux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/platformin=
putcontexts/ibus/qibusplatforminputcontext.h
> > moc /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-lin=
ux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/generic/tu=
iotouch/qtuiohandler_p.h
> > moc /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-lin=
ux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/bearer/lin=
ux_common/qofonoservice_linux_p.h
> > moc /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-lin=
ux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/platformin=
putcontexts/ibus/qibusproxy.h
> > compiling /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-m=
el-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/gene=
ric/tuiotouch/main.cpp
> > compiling /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-m=
el-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/plat=
forms/eglfs/qeglfshooks.cpp
> > compiling .moc/moc_qnetworksession_impl.cpp
> > compiling /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-m=
el-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/plat=
forms/xcb/qxcbwindow.cpp
> > moc /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-lin=
ux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/bearer/qne=
tworksession_impl.h
> > In file included from /scratch/cedar/boneblack/build/tmp/sysroots/mel-a=
m335x-boneblack/usr/include/X11/Xlib.h:44:0,
> >                 from /scratch/cedar/boneblack/build/tmp/sysroots/mel-am=
335x-boneblack/usr/include/EGL/eglplatform.h:75,
> >                 from /scratch/cedar/boneblack/build/tmp/sysroots/mel-am=
335x-boneblack/usr/include/EGL/egl.h:35,
> >                 from /scratch/cedar/boneblack/build/tmp/work/cortexa8hf=
-vfp-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/p=
lugins/platforms/minimalegl/qminimaleglscreen.h:41,
> >                 from /scratch/cedar/boneblack/build/tmp/work/cortexa8hf=
-vfp-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/p=
lugins/platforms/minimalegl/qminimaleglintegration.h:37,
> >                 from /scratch/cedar/boneblack/build/tmp/work/cortexa8hf=
-vfp-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/p=
lugins/platforms/minimalegl/qminimaleglintegration.cpp:34:
> > ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:131:9: er=
ror: expected identifier before numeric constant
> >         None =3D 0x0,
> >         ^
> > In file included from ../../../../include/QtCore/qtextstream.h:1:0,
> >                 from ../../../../include/QtCore/../../../git/src/coreli=
b/io/qdebug.h:42,
> >                 from ../../../../include/QtCore/qdebug.h:1,
> >                 from ../../../../include/QtCore/../../../git/src/coreli=
b/io/qloggingcategory.h:38,
> >                 from ../../../../include/QtCore/qloggingcategory.h:1,
> >                 from ../../../../include/QtCore/QLoggingCategory:1,
> >                 from /scratch/cedar/boneblack/build/tmp/work/cortexa8hf=
-vfp-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/p=
lugins/platforms/eglfs/qeglfshooks.cpp:35:
> > ../../../../include/QtCore/../../../git/src/corelib/io/qtextstream.h:46=
:2: error: #error qtextstream.h must be included before any header file tha=
t defines Status
> > #error qtextstream.h must be included before any header file that defin=
es Status
> >  ^
> > ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:131:9: er=
ror: expected '}' before numeric constant
> > ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:131:9: er=
ror: expected unqualified-id before numeric constant
> > In file included from ../../../../include/QtCore/qurl.h:1:0,
> >                 from ../../../../include/QtGui/../../../git/src/gui/ker=
nel/qevent.h:48,
> >                 from ../../../../include/QtGui/qevent.h:1,
> >                 from ../../../../include/QtGui/../../../git/src/gui/tex=
t/qtextlayout.h:42,
> >                 from ../../../../include/QtGui/qtextlayout.h:1,
> >                 from ../../../../include/QtGui/5.5.0/QtGui/private/../.=
=2E/../../../../git/src/gui/text/qtextengine_p.h:52,
> >                 from ../../../../include/QtGui/5.5.0/QtGui/private/qtex=
tengine_p.h:1,
> >                 from ../../../../include/QtGui/5.5.0/QtGui/private/../.=
=2E/../../../../git/src/gui/text/qfontengine_p.h:52,
> >                 from ../../../../include/QtGui/5.5.0/QtGui/private/qfon=
tengine_p.h:1,
> >                 from ../../../../include/QtGui/5.5.0/QtGui/qpa/../../..=
/../../../git/src/gui/text/qplatformfontdatabase.h:52,
> >                 from ../../../../include/QtGui/5.5.0/QtGui/qpa/qplatfor=
mfontdatabase.h:1,
> >                 from ../../../../include/QtPlatformSupport/5.5.0/QtPlat=
formSupport/private/../../../../../../git/src/platformsupport/fontdatabases=
/basic/qbasicfontdatabase_p.h:48,
> >                 from ../../../../include/QtPlatformSupport/5.5.0/QtPlat=
formSupport/private/qbasicfontdatabase_p.h:1,
> >                 from ../../../../include/QtPlatformSupport/5.5.0/QtPlat=
formSupport/private/../../../../../../git/src/platformsupport/fontdatabases=
/genericunix/qgenericunixfontdatabase_p.h:54,
> >                 from ../../../../include/QtPlatformSupport/5.5.0/QtPlat=
formSupport/private/qgenericunixfontdatabase_p.h:1,
> >                 from /scratch/cedar/boneblack/build/tmp/work/cortexa8hf=
-vfp-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/p=
lugins/platforms/minimalegl/qminimaleglintegration.cpp:39:
> > ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:163:26: e=
rror: 'UrlFormattingOption' was not declared in this scope
> >     typedef QUrlTwoFlags<UrlFormattingOption, ComponentFormattingOption=
> FormattingOptions;
> >                          ^
> > compiling .moc/moc_qbearerengine_impl.cpp
> > compiling /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-m=
el-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/bear=
er/connman/qconnmanengine.cpp
> > ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:163:72: e=
rror: template argument 1 is invalid
> >     typedef QUrlTwoFlags<UrlFormattingOption, ComponentFormattingOption=
> FormattingOptions;
> >                                                                        ^
> > ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:166:10: e=
rror: expected unqualified-id before ')' token
> >     QUrl();
> >          ^
> > ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:167:10: e=
rror: expected unqualified-id before 'const'
> >     QUrl(const QUrl &copy);
> >          ^
> > ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:167:10: e=
rror: expected ')' before 'const'
> > ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:168:38: e=
rror: 'QUrl& operator=3D(const QUrl&)' must be a nonstatic member function
> >     QUrl &operator =3D(const QUrl &copy);
> >                                      ^
> > ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:172:10: e=
rror: expected unqualified-id before 'const'
> >     QUrl(const QString &url, ParsingMode mode =3D TolerantMode);
> >          ^
> > ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:172:10: e=
rror: expected ')' before 'const'
> > ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:173:39: e=
rror: 'QUrl& operator=3D(const QString&)' must be a nonstatic member functi=
on
> >     QUrl &operator=3D(const QString &url);
> >                                       ^
> > ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:181:12: e=
rror: expected constructor, destructor, or type conversion before ';' token
> >     ~QUrl();
> >            ^
> > ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h: In funct=
ion 'void swap(QUrl&)':
> > ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:183:58: e=
rror: 'd' was not declared in this scope
> >     inline void swap(QUrl &other) Q_DECL_NOTHROW { qSwap(d, other.d); }
> >                                                          ^
> > ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:183:67: e=
rror: 'class QUrl' has no member named 'd'
> >     inline void swap(QUrl &other) Q_DECL_NOTHROW { qSwap(d, other.d); }
> >                                                                   ^
> > ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h: At globa=
l scope:
> > ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:185:37: e=
rror: 'ParsingMode' has not been declared
> >     void setUrl(const QString &url, ParsingMode mode =3D TolerantMode);
> >                                     ^
> > ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:185:56: e=
rror: 'TolerantMode' was not declared in this scope
> >     void setUrl(const QString &url, ParsingMode mode =3D TolerantMode);
> >                                                        ^
> > ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:186:79: e=
rror: non-member function 'QString url(FormattingOptions)' cannot have cv-q=
ualifier
> >     QString url(FormattingOptions options =3D FormattingOptions(PrettyD=
ecoded)) const;
> >                                                                        =
       ^
> > ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:187:84: e=
rror: non-member function 'QString toString(FormattingOptions)' cannot have=
 cv-qualifier
> >     QString toString(FormattingOptions options =3D FormattingOptions(Pr=
ettyDecoded)) const;
> >                                                                        =
            ^
> > ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:188:91: e=
rror: non-member function 'QString toDisplayString(FormattingOptions)' cann=
ot have cv-qualifier
> >     QString toDisplayString(FormattingOptions options =3D FormattingOpt=
ions(PrettyDecoded)) const;
> >                                                                        =
                   ^
> > In file included from ../../../../include/QtCore/qcompilerdetection.h:1=
:0,
> >                 from ../../../../include/QtCore/../../../git/src/coreli=
b/global/qglobal.h:74,
> >                 from ../../../../include/QtCore/qglobal.h:1,
> >                 from ../../../../include/QtCore/../../../git/src/coreli=
b/kernel/qmetatype.h:38,
> >                 from ../../../../include/QtCore/qmetatype.h:1,
> >                 from ../../../../include/QtGui/5.5.0/QtGui/qpa/../../..=
/../../../git/src/gui/kernel/qplatformscreen.h:46,
> >                 from ../../../../include/QtGui/5.5.0/QtGui/qpa/qplatfor=
mscreen.h:1,
> >                 from /scratch/cedar/boneblack/build/tmp/work/cortexa8hf=
-vfp-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/p=
lugins/platforms/minimalegl/qminimaleglscreen.h:37,
> >                 from /scratch/cedar/boneblack/build/tmp/work/cortexa8hf=
-vfp-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/p=
lugins/platforms/minimalegl/qminimaleglintegration.h:37,
> >                 from /scratch/cedar/boneblack/build/tmp/work/cortexa8hf=
-vfp-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/p=
lugins/platforms/minimalegl/qminimaleglintegration.cpp:34:
> > ../../../../include/QtCore/../../../git/src/corelib/global/qcompilerdet=
ection.h:222:68: error: non-member function 'QUrl adjusted(FormattingOption=
s)' cannot have cv-qualifier
> > #  define Q_REQUIRED_RESULT __attribute__ ((__warn_unused_result__))
> >                                                                    ^
> > ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:189:52: n=
ote: in expansion of macro 'Q_REQUIRED_RESULT'
> >     QUrl adjusted(FormattingOptions options) const Q_REQUIRED_RESULT;
> >                                                    ^
> > In file included from ../../../../include/QtCore/qurl.h:1:0,
> >                 from ../../../../include/QtGui/../../../git/src/gui/ker=
nel/qevent.h:48,
> >                 from ../../../../include/QtGui/qevent.h:1,
> >                 from ../../../../include/QtGui/../../../git/src/gui/tex=
t/qtextlayout.h:42,
> >                 from ../../../../include/QtGui/qtextlayout.h:1,
> >                 from ../../../../include/QtGui/5.5.0/QtGui/private/../.=
=2E/../../../../git/src/gui/text/qtextengine_p.h:52,
> >                 from ../../../../include/QtGui/5.5.0/QtGui/private/qtex=
tengine_p.h:1,
> >                 from ../../../../include/QtGui/5.5.0/QtGui/private/../.=
=2E/../../../../git/src/gui/text/qfontengine_p.h:52,
> >                 from ../../../../include/QtGui/5.5.0/QtGui/private/qfon=
tengine_p.h:1,
> >                 from ../../../../include/QtGui/5.5.0/QtGui/qpa/../../..=
/../../../git/src/gui/text/qplatformfontdatabase.h:52,
> >                 from ../../../../include/QtGui/5.5.0/QtGui/qpa/qplatfor=
mfontdatabase.h:1,
> >                 from ../../../../include/QtPlatformSupport/5.5.0/QtPlat=
formSupport/private/../../../../../../git/src/platformsupport/fontdatabases=
/basic/qbasicfontdatabase_p.h:48,
> >                 from ../../../../include/QtPlatformSupport/5.5.0/QtPlat=
formSupport/private/qbasicfontdatabase_p.h:1,
> >                 from ../../../../include/QtPlatformSupport/5.5.0/QtPlat=
formSupport/private/../../../../../../git/src/platformsupport/fontdatabases=
/genericunix/qgenericunixfontdatabase_p.h:54,
> >                 from ../../../../include/QtPlatformSupport/5.5.0/QtPlat=
formSupport/private/qgenericunixfontdatabase_p.h:1,
> >                 from /scratch/cedar/boneblack/build/tmp/work/cortexa8hf=
-vfp-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/p=
lugins/platforms/minimalegl/qminimaleglintegration.cpp:39:
> > ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:191:68: e=
rror: non-member function 'QByteArray toEncoded(FormattingOptions)' cannot =
have cv-qualifier
> >     QByteArray toEncoded(FormattingOptions options =3D FullyEncoded) co=
nst;
> >                                                                    ^
> > ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:192:52: e=
rror: 'ParsingMode' has not been declared
> >     static QUrl fromEncoded(const QByteArray &url, ParsingMode mode =3D=
 TolerantMode);
> >                                                    ^
> > ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:192:71: e=
rror: 'TolerantMode' was not declared in this scope
> >     static QUrl fromEncoded(const QByteArray &url, ParsingMode mode =3D=
 TolerantMode);
> >                                                                       ^
> > ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:205:20: e=
rror: non-member function 'bool isValid()' cannot have cv-qualifier
> >     bool isValid() const;
> >                    ^
> > ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:206:27: e=
rror: non-member function 'QString errorString()' cannot have cv-qualifier
> >     QString errorString() const;
> >                           ^
> > ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:208:20: e=
rror: non-member function 'bool isEmpty()' cannot have cv-qualifier
> >     bool isEmpty() const;
> >                    ^
> > ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:212:22: e=
rror: non-member function 'QString scheme()' cannot have cv-qualifier
> >     QString scheme() const;
> >                      ^
> > ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:214:49: e=
rror: 'ParsingMode' has not been declared
> >     void setAuthority(const QString &authority, ParsingMode mode =3D To=
lerantMode);
> >                                                 ^
> > ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:214:68: e=
rror: 'TolerantMode' was not declared in this scope
> >     void setAuthority(const QString &authority, ParsingMode mode =3D To=
lerantMode);
> >                                                                    ^
> > ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:215:75: e=
rror: non-member function 'QString authority(ComponentFormattingOptions)' c=
annot have cv-qualifier
> >     QString authority(ComponentFormattingOptions options =3D PrettyDeco=
ded) const;
> >                                                                        =
   ^
> > ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:217:47: e=
rror: 'ParsingMode' has not been declared
> >     void setUserInfo(const QString &userInfo, ParsingMode mode =3D Tole=
rantMode);
> >                                               ^
> > ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:217:66: e=
rror: 'TolerantMode' was not declared in this scope
> >     void setUserInfo(const QString &userInfo, ParsingMode mode =3D Tole=
rantMode);
> >                                                                  ^
> > ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:218:74: e=
rror: non-member function 'QString userInfo(ComponentFormattingOptions)' ca=
nnot have cv-qualifier
> >     QString userInfo(ComponentFormattingOptions options =3D PrettyDecod=
ed) const;
> >                                                                        =
  ^
> > ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:220:47: e=
rror: 'ParsingMode' has not been declared
> >     void setUserName(const QString &userName, ParsingMode mode =3D Deco=
dedMode);
> >                                               ^
> > ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:220:66: e=
rror: 'DecodedMode' was not declared in this scope
> >     void setUserName(const QString &userName, ParsingMode mode =3D Deco=
dedMode);
> >                                                                  ^
> > ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:221:73: e=
rror: non-member function 'QString userName(ComponentFormattingOptions)' ca=
nnot have cv-qualifier
> >     QString userName(ComponentFormattingOptions options =3D FullyDecode=
d) const;
> >                                                                        =
 ^
> > ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:223:47: e=
rror: 'ParsingMode' has not been declared
> >     void setPassword(const QString &password, ParsingMode mode =3D Deco=
dedMode);
> >                                               ^
> > ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:223:66: e=
rror: 'DecodedMode' was not declared in this scope
> >     void setPassword(const QString &password, ParsingMode mode =3D Deco=
dedMode);
> >                                                                  ^
> > ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:224:65: e=
rror: non-member function 'QString password(ComponentFormattingOptions)' ca=
nnot have cv-qualifier
> >     QString password(ComponentFormattingOptions =3D FullyDecoded) const;
> >                                                                 ^
> > ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:226:39: e=
rror: 'ParsingMode' has not been declared
> >     void setHost(const QString &host, ParsingMode mode =3D DecodedMode);
> >                                       ^
> > ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:226:58: e=
rror: 'DecodedMode' was not declared in this scope
> >     void setHost(const QString &host, ParsingMode mode =3D DecodedMode);
> >                                                          ^
> > ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:227:61: e=
rror: non-member function 'QString host(ComponentFormattingOptions)' cannot=
 have cv-qualifier
> >     QString host(ComponentFormattingOptions =3D FullyDecoded) const;
> >                                                             ^
> > ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:228:79: e=
rror: non-member function 'QString topLevelDomain(ComponentFormattingOption=
s)' cannot have cv-qualifier
> >     QString topLevelDomain(ComponentFormattingOptions options =3D Fully=
Decoded) const;
> >                                                                        =
       ^
> > ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:231:36: e=
rror: non-member function 'int port(int)' cannot have cv-qualifier
> >     int port(int defaultPort =3D -1) const;
> >                                    ^
> > ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:233:39: e=
rror: 'ParsingMode' has not been declared
> >     void setPath(const QString &path, ParsingMode mode =3D DecodedMode);
> >                                       ^
> > ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:233:58: e=
rror: 'DecodedMode' was not declared in this scope
> >     void setPath(const QString &path, ParsingMode mode =3D DecodedMode);
> >                                                          ^
> > ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:234:69: e=
rror: non-member function 'QString path(ComponentFormattingOptions)' cannot=
 have cv-qualifier
> >     QString path(ComponentFormattingOptions options =3D FullyDecoded) c=
onst;
> >                                                                     ^
> > ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:235:73: e=
rror: non-member function 'QString fileName(ComponentFormattingOptions)' ca=
nnot have cv-qualifier
> >     QString fileName(ComponentFormattingOptions options =3D FullyDecode=
d) const;
> >                                                                        =
 ^
> > ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:237:21: e=
rror: non-member function 'bool hasQuery()' cannot have cv-qualifier
> >     bool hasQuery() const;
> >                     ^
> > ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:238:41: e=
rror: 'ParsingMode' has not been declared
> >     void setQuery(const QString &query, ParsingMode mode =3D TolerantMo=
de);
> >                                         ^
> > ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:238:60: e=
rror: 'TolerantMode' was not declared in this scope
> >     void setQuery(const QString &query, ParsingMode mode =3D TolerantMo=
de);
> >                                                            ^
> > ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:240:63: e=
rror: non-member function 'QString query(ComponentFormattingOptions)' canno=
t have cv-qualifier
> >     QString query(ComponentFormattingOptions =3D PrettyDecoded) const;
> >                                                               ^
> > ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:242:24: e=
rror: non-member function 'bool hasFragment()' cannot have cv-qualifier
> >     bool hasFragment() const;
> >                        ^
> > ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:243:74: e=
rror: non-member function 'QString fragment(ComponentFormattingOptions)' ca=
nnot have cv-qualifier
> >     QString fragment(ComponentFormattingOptions options =3D PrettyDecod=
ed) const;
> >                                                                        =
  ^
> > ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:244:47: e=
rror: 'ParsingMode' has not been declared
> >     void setFragment(const QString &fragment, ParsingMode mode =3D Tole=
rantMode);
> >                                               ^
> > ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:244:66: e=
rror: 'TolerantMode' was not declared in this scope
> >     void setFragment(const QString &fragment, ParsingMode mode =3D Tole=
rantMode);
> >                                                                  ^
> > In file included from ../../../../include/QtCore/qcompilerdetection.h:1=
:0,
> >                 from ../../../../include/QtCore/../../../git/src/coreli=
b/global/qglobal.h:74,
> >                 from ../../../../include/QtCore/qglobal.h:1,
> >                 from ../../../../include/QtCore/../../../git/src/coreli=
b/kernel/qmetatype.h:38,
> >                 from ../../../../include/QtCore/qmetatype.h:1,
> >                 from ../../../../include/QtGui/5.5.0/QtGui/qpa/../../..=
/../../../git/src/gui/kernel/qplatformscreen.h:46,
> >                 from ../../../../include/QtGui/5.5.0/QtGui/qpa/qplatfor=
mscreen.h:1,
> >                 from /scratch/cedar/boneblack/build/tmp/work/cortexa8hf=
-vfp-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/p=
lugins/platforms/minimalegl/qminimaleglscreen.h:37,
> >                 from /scratch/cedar/boneblack/build/tmp/work/cortexa8hf=
-vfp-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/p=
lugins/platforms/minimalegl/qminimaleglintegration.h:37,
> >                 from /scratch/cedar/boneblack/build/tmp/work/cortexa8hf=
-vfp-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/p=
lugins/platforms/minimalegl/qminimaleglintegration.cpp:34:
> > ../../../../include/QtCore/../../../git/src/corelib/global/qcompilerdet=
ection.h:222:68: error: non-member function 'QUrl resolved(const QUrl&)' ca=
nnot have cv-qualifier
> > #  define Q_REQUIRED_RESULT __attribute__ ((__warn_unused_result__))
> >                                                                    ^
> > ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:246:47: n=
ote: in expansion of macro 'Q_REQUIRED_RESULT'
> >     QUrl resolved(const QUrl &relative) const Q_REQUIRED_RESULT;
> >                                               ^
> > In file included from ../../../../include/QtCore/qurl.h:1:0,
> >                 from ../../../../include/QtGui/../../../git/src/gui/ker=
nel/qevent.h:48,
> >                 from ../../../../include/QtGui/qevent.h:1,
> >                 from ../../../../include/QtGui/../../../git/src/gui/tex=
t/qtextlayout.h:42,
> >                 from ../../../../include/QtGui/qtextlayout.h:1,
> >                 from ../../../../include/QtGui/5.5.0/QtGui/private/../.=
=2E/../../../../git/src/gui/text/qtextengine_p.h:52,
> >                 from ../../../../include/QtGui/5.5.0/QtGui/private/qtex=
tengine_p.h:1,
> >                 from ../../../../include/QtGui/5.5.0/QtGui/private/../.=
=2E/../../../../git/src/gui/text/qfontengine_p.h:52,
> >                 from ../../../../include/QtGui/5.5.0/QtGui/private/qfon=
tengine_p.h:1,
> >                 from ../../../../include/QtGui/5.5.0/QtGui/qpa/../../..=
/../../../git/src/gui/text/qplatformfontdatabase.h:52,
> >                 from ../../../../include/QtGui/5.5.0/QtGui/qpa/qplatfor=
mfontdatabase.h:1,
> >                 from ../../../../include/QtPlatformSupport/5.5.0/QtPlat=
formSupport/private/../../../../../../git/src/platformsupport/fontdatabases=
/basic/qbasicfontdatabase_p.h:48,
> >                 from ../../../../include/QtPlatformSupport/5.5.0/QtPlat=
formSupport/private/qbasicfontdatabase_p.h:1,
> >                 from ../../../../include/QtPlatformSupport/5.5.0/QtPlat=
formSupport/private/../../../../../../git/src/platformsupport/fontdatabases=
/genericunix/qgenericunixfontdatabase_p.h:54,
> >                 from ../../../../include/QtPlatformSupport/5.5.0/QtPlat=
formSupport/private/qgenericunixfontdatabase_p.h:1,
> >                 from /scratch/cedar/boneblack/build/tmp/work/cortexa8hf=
-vfp-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/p=
lugins/platforms/minimalegl/qminimaleglintegration.cpp:39:
> > ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:248:23: e=
rror: non-member function 'bool isRelative()' cannot have cv-qualifier
> >     bool isRelative() const;
> >                       ^
> > ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:249:38: e=
rror: non-member function 'bool isParentOf(const QUrl&)' cannot have cv-qua=
lifier
> >     bool isParentOf(const QUrl &url) const;
> >                                      ^
> > ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:251:24: e=
rror: non-member function 'bool isLocalFile()' cannot have cv-qualifier
> >     bool isLocalFile() const;
> >                        ^
> > ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:253:27: e=
rror: non-member function 'QString toLocalFile()' cannot have cv-qualifier
> >     QString toLocalFile() const;
> >                           ^
> > ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:256:23: e=
rror: non-member function 'bool isDetached()' cannot have cv-qualifier
> >     bool isDetached() const;
> >                       ^
> > ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:258:38: e=
rror: non-member function 'bool operator<(const QUrl&)' cannot have cv-qual=
ifier
> >     bool operator <(const QUrl &url) const;
> >                                      ^
> > ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:258:38: e=
rror: 'bool operator<(const QUrl&)' must take exactly two arguments
> > ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:259:39: e=
rror: non-member function 'bool operator=3D=3D(const QUrl&)' cannot have cv=
-qualifier
> >     bool operator =3D=3D(const QUrl &url) const;
> >                                       ^
> > ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:259:39: e=
rror: 'bool operator=3D=3D(const QUrl&)' must take exactly two arguments
> > ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:260:39: e=
rror: non-member function 'bool operator!=3D(const QUrl&)' cannot have cv-q=
ualifier
> >     bool operator !=3D(const QUrl &url) const;
> >                                       ^
> > ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:260:39: e=
rror: 'bool operator!=3D(const QUrl&)' must take exactly two arguments
> > ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:262:62: e=
rror: non-member function 'bool matches(const QUrl&, FormattingOptions)' ca=
nnot have cv-qualifier
> >     bool matches(const QUrl &url, FormattingOptions options) const;
> >                                                              ^
> > ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:343:1: er=
ror: expected unqualified-id before 'private'
> > private:
> > ^
> > ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:346:1: er=
ror: expected unqualified-id before 'public'
> > public:
> > ^
> > ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:351:64: e=
rror: 'ParsingMode' has not been declared
> >     static QList<QUrl> fromStringList(const QStringList &uris, ParsingM=
ode mode =3D TolerantMode);
> >                                                                ^
> > ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:351:83: e=
rror: 'TolerantMode' was not declared in this scope
> >     static QList<QUrl> fromStringList(const QStringList &uris, ParsingM=
ode mode =3D TolerantMode);
> >                                                                        =
           ^
> > ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:354:5: er=
ror: 'friend' used outside of class
> >     friend Q_CORE_EXPORT uint qHash(const QUrl &url, uint seed) Q_DECL_=
NOTHROW;
> >     ^
> > ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:356:1: er=
ror: expected unqualified-id before 'private'
> > private:
> > ^
> > ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:358:5: er=
ror: 'friend' used outside of class
> >     friend class QUrlQuery;
> >     ^
> > ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:360:1: er=
ror: expected unqualified-id before 'public'
> > public:
> > ^
> > ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:362:12: e=
rror: 'DataPtr' does not name a type
> >     inline DataPtr &data_ptr() { return d; }
> >            ^
> > ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:363:1: er=
ror: expected declaration before '}' token
> > };
> > ^
> > moc /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-lin=
ux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/platformin=
putcontexts/ibus/qibusinputcontextproxy.h
> > ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:192:17: w=
arning: 'QUrl fromEncoded(const QByteArray&, int)' declared 'static' but ne=
ver defined [-Wunused-function]
> >     static QUrl fromEncoded(const QByteArray &url, ParsingMode mode =3D=
 TolerantMode);
> >                 ^
> > ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:200:17: w=
arning: 'QUrl fromUserInput(const QString&)' declared 'static' but never de=
fined [-Wunused-function]
> >     static QUrl fromUserInput(const QString &userInput);
> >                 ^
> > ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:202:17: w=
arning: 'QUrl fromUserInput(const QString&, const QString&, UserInputResolu=
tionOptions)' declared 'static' but never defined [-Wunused-function]
> >     static QUrl fromUserInput(const QString &userInput, const QString &=
workingDirectory,
> >                 ^
> > ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:252:17: w=
arning: 'QUrl fromLocalFile(const QString&)' declared 'static' but never de=
fined [-Wunused-function]
> >     static QUrl fromLocalFile(const QString &localfile);
> >                 ^
> > ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:264:20: w=
arning: 'QString fromPercentEncoding(const QByteArray&)' declared 'static' =
but never defined [-Wunused-function]
> >     static QString fromPercentEncoding(const QByteArray &);
> >                    ^
> > ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:265:23: w=
arning: 'QByteArray toPercentEncoding(const QString&, const QByteArray&, co=
nst QByteArray&)' declared 'static' but never defined [-Wunused-function]
> >     static QByteArray toPercentEncoding(const QString &,
> >                       ^
> > ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:348:23: w=
arning: 'QByteArray toAce(const QString&)' declared 'static' but never defi=
ned [-Wunused-function]
> >     static QByteArray toAce(const QString &);
> >                       ^
> > ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:349:24: w=
arning: 'QStringList idnWhitelist()' declared 'static' but never defined [-=
Wunused-function]
> >     static QStringList idnWhitelist();
> >                        ^
> > ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:350:24: w=
arning: 'QStringList toStringList(const QList<QUrl>&, FormattingOptions)' d=
eclared 'static' but never defined [-Wunused-function]
> >     static QStringList toStringList(const QList<QUrl> &uris, Formatting=
Options options =3D FormattingOptions(PrettyDecoded));
> >                        ^
> > ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:351:24: w=
arning: 'QList<QUrl> fromStringList(const QStringList&, int)' declared 'sta=
tic' but never defined [-Wunused-function]
> >     static QList<QUrl> fromStringList(const QStringList &uris, ParsingM=
ode mode =3D TolerantMode);
> >                        ^
> > ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:353:17: w=
arning: 'void setIdnWhitelist(const QStringList&)' declared 'static' but ne=
ver defined [-Wunused-function]
> >     static void setIdnWhitelist(const QStringList &);
> >                 ^
> > Makefile:1242: recipe for target '.obj/qminimaleglintegration.o' failed
> > make[4]: *** [.obj/qminimaleglintegration.o] Error 1
> > make[4]: *** Waiting for unfinished jobs....
> > moc /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-lin=
ux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/bearer/qbe=
arerengine_impl.h
> > compiling /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-m=
el-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/plat=
forms/offscreen/main.cpp
> > compiling /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-m=
el-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/plat=
forminputcontexts/ibus/main.cpp
> > compiling /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-m=
el-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/bear=
er/networkmanager/main.cpp
> > compiling .moc/moc_qibusplatforminputcontext.cpp
> > In file included from /scratch/cedar/boneblack/build/tmp/sysroots/mel-a=
m335x-boneblack/usr/include/EGL/eglplatform.h:75:0,
> >                 from /scratch/cedar/boneblack/build/tmp/sysroots/mel-am=
335x-boneblack/usr/include/EGL/egl.h:35,
> >                 from /scratch/cedar/boneblack/build/tmp/work/cortexa8hf=
-vfp-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/p=
lugins/platforms/eglfs/qeglfsdeviceintegration.h:53,
> >                 from /scratch/cedar/boneblack/build/tmp/work/cortexa8hf=
-vfp-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/p=
lugins/platforms/eglfs/qeglfshooks.h:37,
> >                 from /scratch/cedar/boneblack/build/tmp/work/cortexa8hf=
-vfp-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/p=
lugins/platforms/eglfs/qeglfshooks.cpp:34:
> > ../../../../include/QtCore/../../../git/src/corelib/io/qtextstream.h:72=
:10: error: expected identifier before 'int'
> >     enum Status {
> >          ^
> > In file included from ../../../../include/QtCore/qtextstream.h:1:0,
> >                 from ../../../../include/QtCore/../../../git/src/coreli=
b/io/qdebug.h:42,
> >                 from ../../../../include/QtCore/qdebug.h:1,
> >                 from ../../../../include/QtCore/../../../git/src/coreli=
b/io/qloggingcategory.h:38,
> >                 from ../../../../include/QtCore/qloggingcategory.h:1,
> >                 from ../../../../include/QtCore/QLoggingCategory:1,
> >                 from /scratch/cedar/boneblack/build/tmp/work/cortexa8hf=
-vfp-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/p=
lugins/platforms/eglfs/qeglfshooks.cpp:35:
> > ../../../../include/QtCore/../../../git/src/corelib/io/qtextstream.h:72=
:17: error: expected unqualified-id before '{' token
> >     enum Status {
> >                 ^
> > make[4]: Leaving directory '/scratch/cedar/boneblack/build/tmp/work/cor=
texa8hf-vfp-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/bu=
ild/src/plugins/platforms/minimalegl'
> > Makefile:146: recipe for target 'sub-minimalegl-make_first' failed
> > make[3]: *** [sub-minimalegl-make_first] Error 2
> > make[3]: *** Waiting for unfinished jobs....
> > compiling .moc/moc_qibusproxy.cpp
> > compiling .moc/moc_qibusinputcontextproxy.cpp
> > Makefile.eglfs_device_lib:1889: recipe for target '.obj/qeglfshooks.o' =
failed
> > make[5]: *** [.obj/qeglfshooks.o] Error 1
> > make[5]: Leaving directory '/scratch/cedar/boneblack/build/tmp/work/cor=
texa8hf-vfp-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/bu=
ild/src/plugins/platforms/eglfs'
> > Makefile:42: recipe for target 'sub-eglfs_device_lib-pro-make_first-ord=
ered' failed
> > make[4]: *** [sub-eglfs_device_lib-pro-make_first-ordered] Error 2
> > make[4]: Leaving directory '/scratch/cedar/boneblack/build/tmp/work/cor=
texa8hf-vfp-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/bu=
ild/src/plugins/platforms/eglfs'
> > Makefile:121: recipe for target 'sub-eglfs-make_first' failed
> > make[3]: *** [sub-eglfs-make_first] Error 2
> > compiling .moc/moc_qtuiohandler_p.cpp
> > compiling /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-m=
el-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/bear=
er/qnetworksession_impl.cpp
> > compiling /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-m=
el-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/plat=
forms/xcb/qxcbbackingstore.cpp
> > compiling /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-m=
el-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/plat=
forms/xcb/qxcbwmsupport.cpp
> > compiling /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-m=
el-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/plat=
forms/xcb/qxcbnativeinterface.cpp
> > rm -f libqoffscreen.so
> > linking ../../../../plugins/platforms/libqoffscreen.so
> > rm -f libqgenericbearer.so
> > linking ../../../../plugins/bearer/libqgenericbearer.so
> > mv -f libqgenericbearer.so ../../../../plugins/bearer/
> > make[4]: Leaving directory '/scratch/cedar/boneblack/build/tmp/work/cor=
texa8hf-vfp-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/bu=
ild/src/plugins/bearer/generic'
> > compiling .moc/moc_qnetworkmanagerservice.cpp
> > mv -f libqoffscreen.so ../../../../plugins/platforms/
> > make[4]: Leaving directory '/scratch/cedar/boneblack/build/tmp/work/cor=
texa8hf-vfp-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/bu=
ild/src/plugins/platforms/offscreen'
> > compiling /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-m=
el-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/plat=
forms/xcb/qxcbcursor.cpp
> > rm -f libqtuiotouchplugin.so
> > linking ../../../../plugins/generic/libqtuiotouchplugin.so
> > compiling .moc/moc_qnetworkmanagerengine.cpp
> > compiling .moc/moc_qofonoservice_linux_p.cpp
> > mv -f libqtuiotouchplugin.so ../../../../plugins/generic/
> > moc /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-lin=
ux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/bearer/qne=
tworksession_impl.cpp
> > make[4]: Leaving directory '/scratch/cedar/boneblack/build/tmp/work/cor=
texa8hf-vfp-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/bu=
ild/src/plugins/generic/tuiotouch'
> > make[3]: Leaving directory '/scratch/cedar/boneblack/build/tmp/work/cor=
texa8hf-vfp-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/bu=
ild/src/plugins/generic'
> > compiling /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-m=
el-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/plat=
forms/xcb/qxcbimage.cpp
> > moc /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-lin=
ux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/bearer/con=
nman/qconnmanservice_linux_p.h
> > moc /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-lin=
ux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/bearer/lin=
ux_common/qofonoservice_linux_p.h
> > moc /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-lin=
ux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/bearer/con=
nman/qconnmanengine.h
> > moc /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-lin=
ux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/bearer/qne=
tworksession_impl.h
> > rm -f libibusplatforminputcontextplugin.so
> > linking ../../../../plugins/platforminputcontexts/libibusplatforminputc=
ontextplugin.so
> > compiling .moc/moc_qnetworksession_impl.cpp
> > moc /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-lin=
ux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/bearer/qbe=
arerengine_impl.h
> > compiling /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-m=
el-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/plat=
forms/xcb/qxcbxsettings.cpp
> > compiling /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-m=
el-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/plat=
forms/xcb/qxcbsystemtraytracker.cpp
> > compiling /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-m=
el-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/plat=
forms/xcb/qxcbconnection_xi2.cpp
> > mv -f libibusplatforminputcontextplugin.so ../../../../plugins/platform=
inputcontexts/
> > make[4]: Leaving directory '/scratch/cedar/boneblack/build/tmp/work/cor=
texa8hf-vfp-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/bu=
ild/src/plugins/platforminputcontexts/ibus'
> > make[3]: Leaving directory '/scratch/cedar/boneblack/build/tmp/work/cor=
texa8hf-vfp-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/bu=
ild/src/plugins/platforminputcontexts'
> > compiling /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-m=
el-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/plat=
forms/xcb/gl_integrations/qxcbglintegrationfactory.cpp
> > compiling /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-m=
el-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/bear=
er/connman/main.cpp
> > compiling .moc/moc_qbearerengine_impl.cpp
> > compiling /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-m=
el-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/plat=
forms/xcb/gl_integrations/qxcbglintegration.cpp
> > compiling /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-m=
el-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/plat=
forms/xcb/gl_integrations/qxcbnativeinterfacehandler.cpp
> > moc /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-lin=
ux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/platforms/=
xcb/qxcbconnection.h
> > moc /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-lin=
ux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/platforms/=
xcb/qxcbmime.h
> > compiling /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-m=
el-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/bear=
er/qnetworksession_impl.cpp
> > moc /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-lin=
ux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/platforms/=
xcb/qxcbnativeinterface.h
> > moc /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-lin=
ux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/platforms/=
xcb/qxcbsystemtraytracker.h
> > compiling .moc/moc_qconnmanservice_linux_p.cpp
> > moc /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-lin=
ux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/platforms/=
xcb/gl_integrations/qxcbglintegrationplugin.h
> > compiling .moc/moc_qofonoservice_linux_p.cpp
> > rm -f libqnmbearer.so
> > linking ../../../../plugins/bearer/libqnmbearer.so
> > compiling .moc/moc_qconnmanengine.cpp
> > compiling /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-m=
el-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/plat=
forms/xcb/qxcbclipboard.cpp
> > compiling .moc/moc_qxcbconnection.cpp
> > compiling .moc/moc_qxcbmime.cpp
> > compiling .moc/moc_qxcbnativeinterface.cpp
> > compiling .moc/moc_qxcbsystemtraytracker.cpp
> > compiling .moc/moc_qxcbglintegrationplugin.cpp
> > mv -f libqnmbearer.so ../../../../plugins/bearer/
> > make[4]: Leaving directory '/scratch/cedar/boneblack/build/tmp/work/cor=
texa8hf-vfp-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/bu=
ild/src/plugins/bearer/networkmanager'
> > compiling .moc/moc_qnetworksession_impl.cpp
> > compiling .moc/moc_qbearerengine_impl.cpp
> > rm -f libqconnmanbearer.so
> > linking ../../../../plugins/bearer/libqconnmanbearer.so
> > mv -f libqconnmanbearer.so ../../../../plugins/bearer/
> > make[4]: Leaving directory '/scratch/cedar/boneblack/build/tmp/work/cor=
texa8hf-vfp-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/bu=
ild/src/plugins/bearer/connman'
> > make[3]: Leaving directory '/scratch/cedar/boneblack/build/tmp/work/cor=
texa8hf-vfp-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/bu=
ild/src/plugins/bearer'
> > rm -f libQt5XcbQpa.so.5.5.0 libQt5XcbQpa.so libQt5XcbQpa.so.5 libQt5Xcb=
Qpa.so.5.5
> > linking ../../../../lib/libQt5XcbQpa.so.5.5.0
> > ln -s libQt5XcbQpa.so.5.5.0 libQt5XcbQpa.so
> > ln -s libQt5XcbQpa.so.5.5.0 libQt5XcbQpa.so.5
> > ln -s libQt5XcbQpa.so.5.5.0 libQt5XcbQpa.so.5.5
> > rm -f ../../../../lib/libQt5XcbQpa.so.5.5.0
> > mv -f libQt5XcbQpa.so.5.5.0  ../../../../lib/
> > rm -f ../../../../lib/libQt5XcbQpa.so
> > rm -f ../../../../lib/libQt5XcbQpa.so.5
> > rm -f ../../../../lib/libQt5XcbQpa.so.5.5
> > mv -f libQt5XcbQpa.so ../../../../lib/
> > mv -f libQt5XcbQpa.so.5 ../../../../lib/
> > mv -f libQt5XcbQpa.so.5.5 ../../../../lib/
> > make[5]: Leaving directory '/scratch/cedar/boneblack/build/tmp/work/cor=
texa8hf-vfp-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/bu=
ild/src/plugins/platforms/xcb'
> > ( test -e Makefile.xcb-plugin || /scratch/cedar/boneblack/build/tmp/wor=
k/cortexa8hf-vfp-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-=
r0/build/bin/qmake /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-n=
eon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins=
/platforms/xcb/xcb-plugin.pro -o Makefile.xcb-plugin ) && make -f Makefile.=
xcb-plugin
> > make[5]: Entering directory '/scratch/cedar/boneblack/build/tmp/work/co=
rtexa8hf-vfp-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/b=
uild/src/plugins/platforms/xcb'
> > moc /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-lin=
ux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/platforms/=
xcb/qxcbmain.cpp
> > compiling /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-m=
el-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/plat=
forms/xcb/qxcbmain.cpp
> > rm -f libqxcb.so
> > linking ../../../../plugins/platforms/libqxcb.so
> > mv -f libqxcb.so ../../../../plugins/platforms/
> > make[5]: Leaving directory '/scratch/cedar/boneblack/build/tmp/work/cor=
texa8hf-vfp-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/bu=
ild/src/plugins/platforms/xcb'
> > cd gl_integrations/ && ( test -e Makefile || /scratch/cedar/boneblack/b=
uild/tmp/work/cortexa8hf-vfp-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC=
+2fde9f59ee-r0/build/bin/qmake /scratch/cedar/boneblack/build/tmp/work/cort=
exa8hf-vfp-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git=
/src/plugins/platforms/xcb/gl_integrations/gl_integrations.pro -o Makefile =
) && make -f Makefile
> > make[5]: Entering directory '/scratch/cedar/boneblack/build/tmp/work/co=
rtexa8hf-vfp-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/b=
uild/src/plugins/platforms/xcb/gl_integrations'
> > cd xcb_egl/ && ( test -e Makefile || /scratch/cedar/boneblack/build/tmp=
/work/cortexa8hf-vfp-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f5=
9ee-r0/build/bin/qmake /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-v=
fp-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plu=
gins/platforms/xcb/gl_integrations/xcb_egl/xcb_egl.pro -o Makefile ) && mak=
e -f Makefile
> > make[6]: Entering directory '/scratch/cedar/boneblack/build/tmp/work/co=
rtexa8hf-vfp-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/b=
uild/src/plugins/platforms/xcb/gl_integrations/xcb_egl'
> > compiling /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-m=
el-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/plat=
forms/xcb/gl_integrations/xcb_egl/qxcbeglintegration.cpp
> > compiling /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-m=
el-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/plat=
forms/xcb/gl_integrations/xcb_egl/qxcbeglwindow.cpp
> > moc /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-lin=
ux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/platforms/=
xcb/gl_integrations/xcb_egl/qxcbeglmain.cpp
> > compiling /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-m=
el-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/plat=
forms/xcb/gl_integrations/xcb_egl/qxcbeglnativeinterfacehandler.cpp
> > compiling /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-m=
el-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/plat=
forms/xcb/gl_integrations/xcb_egl/qxcbeglmain.cpp
> > rm -f libqxcb-egl-integration.so
> > linking ../../../../../../plugins/xcbglintegrations/libqxcb-egl-integra=
tion.so
> > mv -f libqxcb-egl-integration.so ../../../../../../plugins/xcbglintegra=
tions/
> > make[6]: Leaving directory '/scratch/cedar/boneblack/build/tmp/work/cor=
texa8hf-vfp-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/bu=
ild/src/plugins/platforms/xcb/gl_integrations/xcb_egl'
> > make[5]: Leaving directory '/scratch/cedar/boneblack/build/tmp/work/cor=
texa8hf-vfp-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/bu=
ild/src/plugins/platforms/xcb/gl_integrations'
> > make[4]: Leaving directory '/scratch/cedar/boneblack/build/tmp/work/cor=
texa8hf-vfp-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/bu=
ild/src/plugins/platforms/xcb'
> > make[3]: Leaving directory '/scratch/cedar/boneblack/build/tmp/work/cor=
texa8hf-vfp-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/bu=
ild/src/plugins/platforms'
> > Makefile:125: recipe for target 'sub-platforms-make_first' failed
> > make[2]: *** [sub-platforms-make_first] Error 2
> > make[2]: Leaving directory '/scratch/cedar/boneblack/build/tmp/work/cor=
texa8hf-vfp-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/bu=
ild/src/plugins'
> > Makefile:720: recipe for target 'sub-plugins-make_first' failed
> > make[1]: *** [sub-plugins-make_first] Error 2
> > make[1]: Leaving directory '/scratch/cedar/boneblack/build/tmp/work/cor=
texa8hf-vfp-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/bu=
ild/src'
> > Makefile:45: recipe for target 'sub-src-make_first' failed
> > make: *** [sub-src-make_first] Error 2
> > WARNING: exit code 1 from a shell command.
> > ERROR: oe_runmake failed
> > ERROR: Function failed: do_compile (log file is located at /scratch/ced=
ar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-linux-gnueabi/qtbase/5.=
5.0+gitAUTOINC+2fde9f59ee-r0/temp/log.do_compile.15120)
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--IoFIGPN1N3g1Ryqz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlYWqJUACgkQN1Ujt2V2gBx+7gCfQ3+4JIE4P+Wlbc76SsHHRBqF
TCIAnAzXzlwHFIw50IwB9WgcQhxsqDmM
=86ut
-----END PGP SIGNATURE-----

--IoFIGPN1N3g1Ryqz--
