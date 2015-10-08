Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by mail.openembedded.org (Postfix) with ESMTP id AE2E765CBC
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  8 Oct 2015 17:35:22 +0000 (UTC)
Received: by wicge5 with SMTP id ge5so35971259wic.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 08 Oct 2015 10:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=07Z+SCaTMvhq3/seKnn86Rk+cDotoiCCB3wUJIX1AB4=;
	b=x/Wc/uaW+Znz2HTaqKkD0d357mzDQ0vZYTqtaxZJEkUDwyCJdjWoSOOfAFeaomjxx2
	te5bPQ02zYNVwXSaWhmRCsfNj4oFftJLoMTnDd/TD2dFK+jQHX+hX2Xi+uIZE+P6erPS
	liIdB5ZcV2d4aBOAJjxywutGVSwaUmH8MCyCmbFjB+kRkE9RvjSEsf14vCJTHCP+77bY
	T2fEBAau59pfsAGjFsA1vAL4mEc9no51GzyfwMWK3B2xqvh8aEgwDehA1VPQ7yiwgKuA
	62opJ/uLOR/VNhON/l7D6KPo0AUWvTRRMRbOEKiOe4z5M6jdmbJFhbdsNNs0SqJ5LIn9
	/MaA==
X-Received: by 10.180.102.226 with SMTP id fr2mr5908538wib.3.1444325722195;
	Thu, 08 Oct 2015 10:35:22 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	mx19sm8102740wic.0.2015.10.08.10.35.20
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 08 Oct 2015 10:35:21 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 8 Oct 2015 19:35:33 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20151008173533.GO2385@jama>
References: <365E1805BC95084CBE82381A0B86999401095F2C61@EU-MBX-01.mgc.mentorg.com>
	<75C05298-D139-4FC3-938A-18FABB43F5CF@gmail.com>
	<365E1805BC95084CBE82381A0B86999401095F4A37@EU-MBX-01.mgc.mentorg.com>
	<20151008173206.GN2385@jama>
MIME-Version: 1.0
In-Reply-To: <20151008173206.GN2385@jama>
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
X-List-Received-Date: Thu, 08 Oct 2015 17:35:26 -0000
X-Groupsio-MsgNum: 57743
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="w6U88vdWm8UqIXvc"
Content-Disposition: inline

--w6U88vdWm8UqIXvc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 08, 2015 at 07:32:06PM +0200, Martin Jansa wrote:
> On Thu, Oct 08, 2015 at 05:18:04PM +0000, Ahsan, Noor wrote:
> > Hello Khem,
> >=20
> > This issue comes when X.h and qurl.h is included at the same time. We f=
aced this issue on different file on i.mx6 and Alexander fixed that issue b=
y rearranging the headers in C file see patch 0012-qeglplatformscreen.cpp-r=
eorder-headers-to-fix-build-.patch. Now we are facing this on other file fo=
r BBB I thought I should ask whether somebody else faced this issue or know=
 the fix.
>=20
> I had the same issue with LuneOS earlier and came all the way to rename
> "None" in all qt projects, but then I've dropped this patch and use this
> undef in our sources before including qt headers after it was rejected
> in upstream (for good reasons about API stability).

More details in:
https://www.mail-archive.com/openembedded-core@lists.openembedded.org/msg65=
904.html

> > -----Original Message-----
> > From: openembedded-devel-bounces@lists.openembedded.org [mailto:openemb=
edded-devel-bounces@lists.openembedded.org] On Behalf Of Khem Raj
> > Sent: Thursday, October 08, 2015 6:32 AM
> > To: Martin Jansa
> > Cc: Haridasan, Sujith; Larson, Chris
> > Subject: Re: [oe] [Meta-qt5] Multiple definition of None on qminimalegl=
integration for BBB
> >=20
> >=20
> > > On Oct 7, 2015, at 4:20 AM, Ahsan, Noor <Noor_Ahsan@mentor.com> wrote:
> > >=20
> > > Hello,
> > >=20
> > > We were building QT5 on BBB and we faced similar issue which has been=
 fixed in 0012-qeglplatformscreen.cpp-reorder-headers-to-fix-build-.patch00=
12-qeglplatformscreen.cpp-reorder-headers-to-fix-build-.patch but this time=
 it is on qminimaleglintegration file. Can anybody guide us how to fix this=
 issue. I added following code in qurl.h for previous issue but community s=
aid that there is better fix.
> > >=20
> > > #ifdef None
> > > #undef None
> > > #endif
> > >=20
> >=20
> > None is defined as 0 for universal null resource in X11 headers (X11/X.=
h) IIRC, so its likely that this file has dependency on x11 and you are not=
 supplying that ?
> > may be you should see if you are missing some QT feature
> >=20
> >=20
> > > The stripped error log is shown below.
> > >=20
> > > linking ../../../../plugins/platforminputcontexts/libcomposeplatformi=
nputcontextplugin.so
> > > mv -f libqminimal.so ../../../../plugins/platforms/
> > > make[4]: Leaving directory '/scratch/cedar/boneblack/build/tmp/work/c=
ortexa8hf-vfp-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/=
build/src/plugins/platforms/minimal'
> > > cd minimalegl/ && ( test -e Makefile || /scratch/cedar/boneblack/buil=
d/tmp/work/cortexa8hf-vfp-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2f=
de9f59ee-r0/build/bin/qmake /scratch/cedar/boneblack/build/tmp/work/cortexa=
8hf-vfp-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/sr=
c/plugins/platforms/minimalegl/minimalegl.pro -o Makefile ) && make -f Make=
file
> > > mv -f libcomposeplatforminputcontextplugin.so ../../../../plugins/pla=
tforminputcontexts/
> > > make[4]: Leaving directory '/scratch/cedar/boneblack/build/tmp/work/c=
ortexa8hf-vfp-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/=
build/src/plugins/platforminputcontexts/compose'
> > > compiling /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon=
-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/be=
arer/generic/main.cpp
> > > compiling /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon=
-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/pl=
atforms/eglfs/qeglfsscreen.cpp
> > > moc /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-l=
inux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/bearer/q=
networksession_impl.cpp
> > > make[4]: Entering directory '/scratch/cedar/boneblack/build/tmp/work/=
cortexa8hf-vfp-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0=
/build/src/plugins/platforms/minimalegl'
> > > moc /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-l=
inux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/platform=
s/minimalegl/main.cpp
> > > compiling /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon=
-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/pl=
atforms/offscreen/qoffscreenintegration_dummy.cpp
> > > compiling /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon=
-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/pl=
atforms/minimalegl/qminimaleglintegration.cpp
> > > moc /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-l=
inux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/bearer/n=
etworkmanager/qnetworkmanagerservice.h
> > > compiling /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon=
-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/pl=
atforms/minimalegl/qminimaleglwindow.cpp
> > > compiling .moc/moc_qgenericengine.cpp
> > > moc /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-l=
inux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/platform=
inputcontexts/ibus/main.cpp
> > > moc /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-l=
inux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/bearer/n=
etworkmanager/qnetworkmanagerengine.h
> > > compiling /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon=
-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/pl=
atforms/xcb/qxcbscreen.cpp
> > > moc /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-l=
inux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/platform=
inputcontexts/ibus/qibusplatforminputcontext.h
> > > moc /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-l=
inux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/generic/=
tuiotouch/qtuiohandler_p.h
> > > moc /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-l=
inux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/bearer/l=
inux_common/qofonoservice_linux_p.h
> > > moc /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-l=
inux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/platform=
inputcontexts/ibus/qibusproxy.h
> > > compiling /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon=
-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/ge=
neric/tuiotouch/main.cpp
> > > compiling /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon=
-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/pl=
atforms/eglfs/qeglfshooks.cpp
> > > compiling .moc/moc_qnetworksession_impl.cpp
> > > compiling /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon=
-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/pl=
atforms/xcb/qxcbwindow.cpp
> > > moc /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-l=
inux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/bearer/q=
networksession_impl.h
> > > In file included from /scratch/cedar/boneblack/build/tmp/sysroots/mel=
-am335x-boneblack/usr/include/X11/Xlib.h:44:0,
> > >                 from /scratch/cedar/boneblack/build/tmp/sysroots/mel-=
am335x-boneblack/usr/include/EGL/eglplatform.h:75,
> > >                 from /scratch/cedar/boneblack/build/tmp/sysroots/mel-=
am335x-boneblack/usr/include/EGL/egl.h:35,
> > >                 from /scratch/cedar/boneblack/build/tmp/work/cortexa8=
hf-vfp-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src=
/plugins/platforms/minimalegl/qminimaleglscreen.h:41,
> > >                 from /scratch/cedar/boneblack/build/tmp/work/cortexa8=
hf-vfp-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src=
/plugins/platforms/minimalegl/qminimaleglintegration.h:37,
> > >                 from /scratch/cedar/boneblack/build/tmp/work/cortexa8=
hf-vfp-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src=
/plugins/platforms/minimalegl/qminimaleglintegration.cpp:34:
> > > ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:131:9: =
error: expected identifier before numeric constant
> > >         None =3D 0x0,
> > >         ^
> > > In file included from ../../../../include/QtCore/qtextstream.h:1:0,
> > >                 from ../../../../include/QtCore/../../../git/src/core=
lib/io/qdebug.h:42,
> > >                 from ../../../../include/QtCore/qdebug.h:1,
> > >                 from ../../../../include/QtCore/../../../git/src/core=
lib/io/qloggingcategory.h:38,
> > >                 from ../../../../include/QtCore/qloggingcategory.h:1,
> > >                 from ../../../../include/QtCore/QLoggingCategory:1,
> > >                 from /scratch/cedar/boneblack/build/tmp/work/cortexa8=
hf-vfp-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src=
/plugins/platforms/eglfs/qeglfshooks.cpp:35:
> > > ../../../../include/QtCore/../../../git/src/corelib/io/qtextstream.h:=
46:2: error: #error qtextstream.h must be included before any header file t=
hat defines Status
> > > #error qtextstream.h must be included before any header file that def=
ines Status
> > >  ^
> > > ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:131:9: =
error: expected '}' before numeric constant
> > > ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:131:9: =
error: expected unqualified-id before numeric constant
> > > In file included from ../../../../include/QtCore/qurl.h:1:0,
> > >                 from ../../../../include/QtGui/../../../git/src/gui/k=
ernel/qevent.h:48,
> > >                 from ../../../../include/QtGui/qevent.h:1,
> > >                 from ../../../../include/QtGui/../../../git/src/gui/t=
ext/qtextlayout.h:42,
> > >                 from ../../../../include/QtGui/qtextlayout.h:1,
> > >                 from ../../../../include/QtGui/5.5.0/QtGui/private/..=
/../../../../../git/src/gui/text/qtextengine_p.h:52,
> > >                 from ../../../../include/QtGui/5.5.0/QtGui/private/qt=
extengine_p.h:1,
> > >                 from ../../../../include/QtGui/5.5.0/QtGui/private/..=
/../../../../../git/src/gui/text/qfontengine_p.h:52,
> > >                 from ../../../../include/QtGui/5.5.0/QtGui/private/qf=
ontengine_p.h:1,
> > >                 from ../../../../include/QtGui/5.5.0/QtGui/qpa/../../=
=2E./../../../git/src/gui/text/qplatformfontdatabase.h:52,
> > >                 from ../../../../include/QtGui/5.5.0/QtGui/qpa/qplatf=
ormfontdatabase.h:1,
> > >                 from ../../../../include/QtPlatformSupport/5.5.0/QtPl=
atformSupport/private/../../../../../../git/src/platformsupport/fontdatabas=
es/basic/qbasicfontdatabase_p.h:48,
> > >                 from ../../../../include/QtPlatformSupport/5.5.0/QtPl=
atformSupport/private/qbasicfontdatabase_p.h:1,
> > >                 from ../../../../include/QtPlatformSupport/5.5.0/QtPl=
atformSupport/private/../../../../../../git/src/platformsupport/fontdatabas=
es/genericunix/qgenericunixfontdatabase_p.h:54,
> > >                 from ../../../../include/QtPlatformSupport/5.5.0/QtPl=
atformSupport/private/qgenericunixfontdatabase_p.h:1,
> > >                 from /scratch/cedar/boneblack/build/tmp/work/cortexa8=
hf-vfp-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src=
/plugins/platforms/minimalegl/qminimaleglintegration.cpp:39:
> > > ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:163:26:=
 error: 'UrlFormattingOption' was not declared in this scope
> > >     typedef QUrlTwoFlags<UrlFormattingOption, ComponentFormattingOpti=
on> FormattingOptions;
> > >                          ^
> > > compiling .moc/moc_qbearerengine_impl.cpp
> > > compiling /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon=
-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/be=
arer/connman/qconnmanengine.cpp
> > > ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:163:72:=
 error: template argument 1 is invalid
> > >     typedef QUrlTwoFlags<UrlFormattingOption, ComponentFormattingOpti=
on> FormattingOptions;
> > >                                                                      =
  ^
> > > ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:166:10:=
 error: expected unqualified-id before ')' token
> > >     QUrl();
> > >          ^
> > > ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:167:10:=
 error: expected unqualified-id before 'const'
> > >     QUrl(const QUrl &copy);
> > >          ^
> > > ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:167:10:=
 error: expected ')' before 'const'
> > > ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:168:38:=
 error: 'QUrl& operator=3D(const QUrl&)' must be a nonstatic member function
> > >     QUrl &operator =3D(const QUrl &copy);
> > >                                      ^
> > > ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:172:10:=
 error: expected unqualified-id before 'const'
> > >     QUrl(const QString &url, ParsingMode mode =3D TolerantMode);
> > >          ^
> > > ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:172:10:=
 error: expected ')' before 'const'
> > > ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:173:39:=
 error: 'QUrl& operator=3D(const QString&)' must be a nonstatic member func=
tion
> > >     QUrl &operator=3D(const QString &url);
> > >                                       ^
> > > ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:181:12:=
 error: expected constructor, destructor, or type conversion before ';' tok=
en
> > >     ~QUrl();
> > >            ^
> > > ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h: In fun=
ction 'void swap(QUrl&)':
> > > ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:183:58:=
 error: 'd' was not declared in this scope
> > >     inline void swap(QUrl &other) Q_DECL_NOTHROW { qSwap(d, other.d);=
 }
> > >                                                          ^
> > > ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:183:67:=
 error: 'class QUrl' has no member named 'd'
> > >     inline void swap(QUrl &other) Q_DECL_NOTHROW { qSwap(d, other.d);=
 }
> > >                                                                   ^
> > > ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h: At glo=
bal scope:
> > > ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:185:37:=
 error: 'ParsingMode' has not been declared
> > >     void setUrl(const QString &url, ParsingMode mode =3D TolerantMode=
);
> > >                                     ^
> > > ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:185:56:=
 error: 'TolerantMode' was not declared in this scope
> > >     void setUrl(const QString &url, ParsingMode mode =3D TolerantMode=
);
> > >                                                        ^
> > > ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:186:79:=
 error: non-member function 'QString url(FormattingOptions)' cannot have cv=
-qualifier
> > >     QString url(FormattingOptions options =3D FormattingOptions(Prett=
yDecoded)) const;
> > >                                                                      =
         ^
> > > ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:187:84:=
 error: non-member function 'QString toString(FormattingOptions)' cannot ha=
ve cv-qualifier
> > >     QString toString(FormattingOptions options =3D FormattingOptions(=
PrettyDecoded)) const;
> > >                                                                      =
              ^
> > > ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:188:91:=
 error: non-member function 'QString toDisplayString(FormattingOptions)' ca=
nnot have cv-qualifier
> > >     QString toDisplayString(FormattingOptions options =3D FormattingO=
ptions(PrettyDecoded)) const;
> > >                                                                      =
                     ^
> > > In file included from ../../../../include/QtCore/qcompilerdetection.h=
:1:0,
> > >                 from ../../../../include/QtCore/../../../git/src/core=
lib/global/qglobal.h:74,
> > >                 from ../../../../include/QtCore/qglobal.h:1,
> > >                 from ../../../../include/QtCore/../../../git/src/core=
lib/kernel/qmetatype.h:38,
> > >                 from ../../../../include/QtCore/qmetatype.h:1,
> > >                 from ../../../../include/QtGui/5.5.0/QtGui/qpa/../../=
=2E./../../../git/src/gui/kernel/qplatformscreen.h:46,
> > >                 from ../../../../include/QtGui/5.5.0/QtGui/qpa/qplatf=
ormscreen.h:1,
> > >                 from /scratch/cedar/boneblack/build/tmp/work/cortexa8=
hf-vfp-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src=
/plugins/platforms/minimalegl/qminimaleglscreen.h:37,
> > >                 from /scratch/cedar/boneblack/build/tmp/work/cortexa8=
hf-vfp-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src=
/plugins/platforms/minimalegl/qminimaleglintegration.h:37,
> > >                 from /scratch/cedar/boneblack/build/tmp/work/cortexa8=
hf-vfp-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src=
/plugins/platforms/minimalegl/qminimaleglintegration.cpp:34:
> > > ../../../../include/QtCore/../../../git/src/corelib/global/qcompilerd=
etection.h:222:68: error: non-member function 'QUrl adjusted(FormattingOpti=
ons)' cannot have cv-qualifier
> > > #  define Q_REQUIRED_RESULT __attribute__ ((__warn_unused_result__))
> > >                                                                    ^
> > > ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:189:52:=
 note: in expansion of macro 'Q_REQUIRED_RESULT'
> > >     QUrl adjusted(FormattingOptions options) const Q_REQUIRED_RESULT;
> > >                                                    ^
> > > In file included from ../../../../include/QtCore/qurl.h:1:0,
> > >                 from ../../../../include/QtGui/../../../git/src/gui/k=
ernel/qevent.h:48,
> > >                 from ../../../../include/QtGui/qevent.h:1,
> > >                 from ../../../../include/QtGui/../../../git/src/gui/t=
ext/qtextlayout.h:42,
> > >                 from ../../../../include/QtGui/qtextlayout.h:1,
> > >                 from ../../../../include/QtGui/5.5.0/QtGui/private/..=
/../../../../../git/src/gui/text/qtextengine_p.h:52,
> > >                 from ../../../../include/QtGui/5.5.0/QtGui/private/qt=
extengine_p.h:1,
> > >                 from ../../../../include/QtGui/5.5.0/QtGui/private/..=
/../../../../../git/src/gui/text/qfontengine_p.h:52,
> > >                 from ../../../../include/QtGui/5.5.0/QtGui/private/qf=
ontengine_p.h:1,
> > >                 from ../../../../include/QtGui/5.5.0/QtGui/qpa/../../=
=2E./../../../git/src/gui/text/qplatformfontdatabase.h:52,
> > >                 from ../../../../include/QtGui/5.5.0/QtGui/qpa/qplatf=
ormfontdatabase.h:1,
> > >                 from ../../../../include/QtPlatformSupport/5.5.0/QtPl=
atformSupport/private/../../../../../../git/src/platformsupport/fontdatabas=
es/basic/qbasicfontdatabase_p.h:48,
> > >                 from ../../../../include/QtPlatformSupport/5.5.0/QtPl=
atformSupport/private/qbasicfontdatabase_p.h:1,
> > >                 from ../../../../include/QtPlatformSupport/5.5.0/QtPl=
atformSupport/private/../../../../../../git/src/platformsupport/fontdatabas=
es/genericunix/qgenericunixfontdatabase_p.h:54,
> > >                 from ../../../../include/QtPlatformSupport/5.5.0/QtPl=
atformSupport/private/qgenericunixfontdatabase_p.h:1,
> > >                 from /scratch/cedar/boneblack/build/tmp/work/cortexa8=
hf-vfp-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src=
/plugins/platforms/minimalegl/qminimaleglintegration.cpp:39:
> > > ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:191:68:=
 error: non-member function 'QByteArray toEncoded(FormattingOptions)' canno=
t have cv-qualifier
> > >     QByteArray toEncoded(FormattingOptions options =3D FullyEncoded) =
const;
> > >                                                                    ^
> > > ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:192:52:=
 error: 'ParsingMode' has not been declared
> > >     static QUrl fromEncoded(const QByteArray &url, ParsingMode mode =
=3D TolerantMode);
> > >                                                    ^
> > > ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:192:71:=
 error: 'TolerantMode' was not declared in this scope
> > >     static QUrl fromEncoded(const QByteArray &url, ParsingMode mode =
=3D TolerantMode);
> > >                                                                      =
 ^
> > > ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:205:20:=
 error: non-member function 'bool isValid()' cannot have cv-qualifier
> > >     bool isValid() const;
> > >                    ^
> > > ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:206:27:=
 error: non-member function 'QString errorString()' cannot have cv-qualifier
> > >     QString errorString() const;
> > >                           ^
> > > ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:208:20:=
 error: non-member function 'bool isEmpty()' cannot have cv-qualifier
> > >     bool isEmpty() const;
> > >                    ^
> > > ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:212:22:=
 error: non-member function 'QString scheme()' cannot have cv-qualifier
> > >     QString scheme() const;
> > >                      ^
> > > ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:214:49:=
 error: 'ParsingMode' has not been declared
> > >     void setAuthority(const QString &authority, ParsingMode mode =3D =
TolerantMode);
> > >                                                 ^
> > > ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:214:68:=
 error: 'TolerantMode' was not declared in this scope
> > >     void setAuthority(const QString &authority, ParsingMode mode =3D =
TolerantMode);
> > >                                                                    ^
> > > ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:215:75:=
 error: non-member function 'QString authority(ComponentFormattingOptions)'=
 cannot have cv-qualifier
> > >     QString authority(ComponentFormattingOptions options =3D PrettyDe=
coded) const;
> > >                                                                      =
     ^
> > > ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:217:47:=
 error: 'ParsingMode' has not been declared
> > >     void setUserInfo(const QString &userInfo, ParsingMode mode =3D To=
lerantMode);
> > >                                               ^
> > > ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:217:66:=
 error: 'TolerantMode' was not declared in this scope
> > >     void setUserInfo(const QString &userInfo, ParsingMode mode =3D To=
lerantMode);
> > >                                                                  ^
> > > ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:218:74:=
 error: non-member function 'QString userInfo(ComponentFormattingOptions)' =
cannot have cv-qualifier
> > >     QString userInfo(ComponentFormattingOptions options =3D PrettyDec=
oded) const;
> > >                                                                      =
    ^
> > > ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:220:47:=
 error: 'ParsingMode' has not been declared
> > >     void setUserName(const QString &userName, ParsingMode mode =3D De=
codedMode);
> > >                                               ^
> > > ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:220:66:=
 error: 'DecodedMode' was not declared in this scope
> > >     void setUserName(const QString &userName, ParsingMode mode =3D De=
codedMode);
> > >                                                                  ^
> > > ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:221:73:=
 error: non-member function 'QString userName(ComponentFormattingOptions)' =
cannot have cv-qualifier
> > >     QString userName(ComponentFormattingOptions options =3D FullyDeco=
ded) const;
> > >                                                                      =
   ^
> > > ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:223:47:=
 error: 'ParsingMode' has not been declared
> > >     void setPassword(const QString &password, ParsingMode mode =3D De=
codedMode);
> > >                                               ^
> > > ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:223:66:=
 error: 'DecodedMode' was not declared in this scope
> > >     void setPassword(const QString &password, ParsingMode mode =3D De=
codedMode);
> > >                                                                  ^
> > > ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:224:65:=
 error: non-member function 'QString password(ComponentFormattingOptions)' =
cannot have cv-qualifier
> > >     QString password(ComponentFormattingOptions =3D FullyDecoded) con=
st;
> > >                                                                 ^
> > > ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:226:39:=
 error: 'ParsingMode' has not been declared
> > >     void setHost(const QString &host, ParsingMode mode =3D DecodedMod=
e);
> > >                                       ^
> > > ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:226:58:=
 error: 'DecodedMode' was not declared in this scope
> > >     void setHost(const QString &host, ParsingMode mode =3D DecodedMod=
e);
> > >                                                          ^
> > > ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:227:61:=
 error: non-member function 'QString host(ComponentFormattingOptions)' cann=
ot have cv-qualifier
> > >     QString host(ComponentFormattingOptions =3D FullyDecoded) const;
> > >                                                             ^
> > > ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:228:79:=
 error: non-member function 'QString topLevelDomain(ComponentFormattingOpti=
ons)' cannot have cv-qualifier
> > >     QString topLevelDomain(ComponentFormattingOptions options =3D Ful=
lyDecoded) const;
> > >                                                                      =
         ^
> > > ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:231:36:=
 error: non-member function 'int port(int)' cannot have cv-qualifier
> > >     int port(int defaultPort =3D -1) const;
> > >                                    ^
> > > ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:233:39:=
 error: 'ParsingMode' has not been declared
> > >     void setPath(const QString &path, ParsingMode mode =3D DecodedMod=
e);
> > >                                       ^
> > > ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:233:58:=
 error: 'DecodedMode' was not declared in this scope
> > >     void setPath(const QString &path, ParsingMode mode =3D DecodedMod=
e);
> > >                                                          ^
> > > ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:234:69:=
 error: non-member function 'QString path(ComponentFormattingOptions)' cann=
ot have cv-qualifier
> > >     QString path(ComponentFormattingOptions options =3D FullyDecoded)=
 const;
> > >                                                                     ^
> > > ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:235:73:=
 error: non-member function 'QString fileName(ComponentFormattingOptions)' =
cannot have cv-qualifier
> > >     QString fileName(ComponentFormattingOptions options =3D FullyDeco=
ded) const;
> > >                                                                      =
   ^
> > > ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:237:21:=
 error: non-member function 'bool hasQuery()' cannot have cv-qualifier
> > >     bool hasQuery() const;
> > >                     ^
> > > ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:238:41:=
 error: 'ParsingMode' has not been declared
> > >     void setQuery(const QString &query, ParsingMode mode =3D Tolerant=
Mode);
> > >                                         ^
> > > ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:238:60:=
 error: 'TolerantMode' was not declared in this scope
> > >     void setQuery(const QString &query, ParsingMode mode =3D Tolerant=
Mode);
> > >                                                            ^
> > > ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:240:63:=
 error: non-member function 'QString query(ComponentFormattingOptions)' can=
not have cv-qualifier
> > >     QString query(ComponentFormattingOptions =3D PrettyDecoded) const;
> > >                                                               ^
> > > ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:242:24:=
 error: non-member function 'bool hasFragment()' cannot have cv-qualifier
> > >     bool hasFragment() const;
> > >                        ^
> > > ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:243:74:=
 error: non-member function 'QString fragment(ComponentFormattingOptions)' =
cannot have cv-qualifier
> > >     QString fragment(ComponentFormattingOptions options =3D PrettyDec=
oded) const;
> > >                                                                      =
    ^
> > > ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:244:47:=
 error: 'ParsingMode' has not been declared
> > >     void setFragment(const QString &fragment, ParsingMode mode =3D To=
lerantMode);
> > >                                               ^
> > > ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:244:66:=
 error: 'TolerantMode' was not declared in this scope
> > >     void setFragment(const QString &fragment, ParsingMode mode =3D To=
lerantMode);
> > >                                                                  ^
> > > In file included from ../../../../include/QtCore/qcompilerdetection.h=
:1:0,
> > >                 from ../../../../include/QtCore/../../../git/src/core=
lib/global/qglobal.h:74,
> > >                 from ../../../../include/QtCore/qglobal.h:1,
> > >                 from ../../../../include/QtCore/../../../git/src/core=
lib/kernel/qmetatype.h:38,
> > >                 from ../../../../include/QtCore/qmetatype.h:1,
> > >                 from ../../../../include/QtGui/5.5.0/QtGui/qpa/../../=
=2E./../../../git/src/gui/kernel/qplatformscreen.h:46,
> > >                 from ../../../../include/QtGui/5.5.0/QtGui/qpa/qplatf=
ormscreen.h:1,
> > >                 from /scratch/cedar/boneblack/build/tmp/work/cortexa8=
hf-vfp-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src=
/plugins/platforms/minimalegl/qminimaleglscreen.h:37,
> > >                 from /scratch/cedar/boneblack/build/tmp/work/cortexa8=
hf-vfp-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src=
/plugins/platforms/minimalegl/qminimaleglintegration.h:37,
> > >                 from /scratch/cedar/boneblack/build/tmp/work/cortexa8=
hf-vfp-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src=
/plugins/platforms/minimalegl/qminimaleglintegration.cpp:34:
> > > ../../../../include/QtCore/../../../git/src/corelib/global/qcompilerd=
etection.h:222:68: error: non-member function 'QUrl resolved(const QUrl&)' =
cannot have cv-qualifier
> > > #  define Q_REQUIRED_RESULT __attribute__ ((__warn_unused_result__))
> > >                                                                    ^
> > > ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:246:47:=
 note: in expansion of macro 'Q_REQUIRED_RESULT'
> > >     QUrl resolved(const QUrl &relative) const Q_REQUIRED_RESULT;
> > >                                               ^
> > > In file included from ../../../../include/QtCore/qurl.h:1:0,
> > >                 from ../../../../include/QtGui/../../../git/src/gui/k=
ernel/qevent.h:48,
> > >                 from ../../../../include/QtGui/qevent.h:1,
> > >                 from ../../../../include/QtGui/../../../git/src/gui/t=
ext/qtextlayout.h:42,
> > >                 from ../../../../include/QtGui/qtextlayout.h:1,
> > >                 from ../../../../include/QtGui/5.5.0/QtGui/private/..=
/../../../../../git/src/gui/text/qtextengine_p.h:52,
> > >                 from ../../../../include/QtGui/5.5.0/QtGui/private/qt=
extengine_p.h:1,
> > >                 from ../../../../include/QtGui/5.5.0/QtGui/private/..=
/../../../../../git/src/gui/text/qfontengine_p.h:52,
> > >                 from ../../../../include/QtGui/5.5.0/QtGui/private/qf=
ontengine_p.h:1,
> > >                 from ../../../../include/QtGui/5.5.0/QtGui/qpa/../../=
=2E./../../../git/src/gui/text/qplatformfontdatabase.h:52,
> > >                 from ../../../../include/QtGui/5.5.0/QtGui/qpa/qplatf=
ormfontdatabase.h:1,
> > >                 from ../../../../include/QtPlatformSupport/5.5.0/QtPl=
atformSupport/private/../../../../../../git/src/platformsupport/fontdatabas=
es/basic/qbasicfontdatabase_p.h:48,
> > >                 from ../../../../include/QtPlatformSupport/5.5.0/QtPl=
atformSupport/private/qbasicfontdatabase_p.h:1,
> > >                 from ../../../../include/QtPlatformSupport/5.5.0/QtPl=
atformSupport/private/../../../../../../git/src/platformsupport/fontdatabas=
es/genericunix/qgenericunixfontdatabase_p.h:54,
> > >                 from ../../../../include/QtPlatformSupport/5.5.0/QtPl=
atformSupport/private/qgenericunixfontdatabase_p.h:1,
> > >                 from /scratch/cedar/boneblack/build/tmp/work/cortexa8=
hf-vfp-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src=
/plugins/platforms/minimalegl/qminimaleglintegration.cpp:39:
> > > ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:248:23:=
 error: non-member function 'bool isRelative()' cannot have cv-qualifier
> > >     bool isRelative() const;
> > >                       ^
> > > ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:249:38:=
 error: non-member function 'bool isParentOf(const QUrl&)' cannot have cv-q=
ualifier
> > >     bool isParentOf(const QUrl &url) const;
> > >                                      ^
> > > ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:251:24:=
 error: non-member function 'bool isLocalFile()' cannot have cv-qualifier
> > >     bool isLocalFile() const;
> > >                        ^
> > > ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:253:27:=
 error: non-member function 'QString toLocalFile()' cannot have cv-qualifier
> > >     QString toLocalFile() const;
> > >                           ^
> > > ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:256:23:=
 error: non-member function 'bool isDetached()' cannot have cv-qualifier
> > >     bool isDetached() const;
> > >                       ^
> > > ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:258:38:=
 error: non-member function 'bool operator<(const QUrl&)' cannot have cv-qu=
alifier
> > >     bool operator <(const QUrl &url) const;
> > >                                      ^
> > > ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:258:38:=
 error: 'bool operator<(const QUrl&)' must take exactly two arguments
> > > ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:259:39:=
 error: non-member function 'bool operator=3D=3D(const QUrl&)' cannot have =
cv-qualifier
> > >     bool operator =3D=3D(const QUrl &url) const;
> > >                                       ^
> > > ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:259:39:=
 error: 'bool operator=3D=3D(const QUrl&)' must take exactly two arguments
> > > ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:260:39:=
 error: non-member function 'bool operator!=3D(const QUrl&)' cannot have cv=
-qualifier
> > >     bool operator !=3D(const QUrl &url) const;
> > >                                       ^
> > > ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:260:39:=
 error: 'bool operator!=3D(const QUrl&)' must take exactly two arguments
> > > ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:262:62:=
 error: non-member function 'bool matches(const QUrl&, FormattingOptions)' =
cannot have cv-qualifier
> > >     bool matches(const QUrl &url, FormattingOptions options) const;
> > >                                                              ^
> > > ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:343:1: =
error: expected unqualified-id before 'private'
> > > private:
> > > ^
> > > ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:346:1: =
error: expected unqualified-id before 'public'
> > > public:
> > > ^
> > > ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:351:64:=
 error: 'ParsingMode' has not been declared
> > >     static QList<QUrl> fromStringList(const QStringList &uris, Parsin=
gMode mode =3D TolerantMode);
> > >                                                                ^
> > > ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:351:83:=
 error: 'TolerantMode' was not declared in this scope
> > >     static QList<QUrl> fromStringList(const QStringList &uris, Parsin=
gMode mode =3D TolerantMode);
> > >                                                                      =
             ^
> > > ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:354:5: =
error: 'friend' used outside of class
> > >     friend Q_CORE_EXPORT uint qHash(const QUrl &url, uint seed) Q_DEC=
L_NOTHROW;
> > >     ^
> > > ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:356:1: =
error: expected unqualified-id before 'private'
> > > private:
> > > ^
> > > ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:358:5: =
error: 'friend' used outside of class
> > >     friend class QUrlQuery;
> > >     ^
> > > ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:360:1: =
error: expected unqualified-id before 'public'
> > > public:
> > > ^
> > > ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:362:12:=
 error: 'DataPtr' does not name a type
> > >     inline DataPtr &data_ptr() { return d; }
> > >            ^
> > > ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:363:1: =
error: expected declaration before '}' token
> > > };
> > > ^
> > > moc /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-l=
inux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/platform=
inputcontexts/ibus/qibusinputcontextproxy.h
> > > ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:192:17:=
 warning: 'QUrl fromEncoded(const QByteArray&, int)' declared 'static' but =
never defined [-Wunused-function]
> > >     static QUrl fromEncoded(const QByteArray &url, ParsingMode mode =
=3D TolerantMode);
> > >                 ^
> > > ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:200:17:=
 warning: 'QUrl fromUserInput(const QString&)' declared 'static' but never =
defined [-Wunused-function]
> > >     static QUrl fromUserInput(const QString &userInput);
> > >                 ^
> > > ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:202:17:=
 warning: 'QUrl fromUserInput(const QString&, const QString&, UserInputReso=
lutionOptions)' declared 'static' but never defined [-Wunused-function]
> > >     static QUrl fromUserInput(const QString &userInput, const QString=
 &workingDirectory,
> > >                 ^
> > > ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:252:17:=
 warning: 'QUrl fromLocalFile(const QString&)' declared 'static' but never =
defined [-Wunused-function]
> > >     static QUrl fromLocalFile(const QString &localfile);
> > >                 ^
> > > ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:264:20:=
 warning: 'QString fromPercentEncoding(const QByteArray&)' declared 'static=
' but never defined [-Wunused-function]
> > >     static QString fromPercentEncoding(const QByteArray &);
> > >                    ^
> > > ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:265:23:=
 warning: 'QByteArray toPercentEncoding(const QString&, const QByteArray&, =
const QByteArray&)' declared 'static' but never defined [-Wunused-function]
> > >     static QByteArray toPercentEncoding(const QString &,
> > >                       ^
> > > ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:348:23:=
 warning: 'QByteArray toAce(const QString&)' declared 'static' but never de=
fined [-Wunused-function]
> > >     static QByteArray toAce(const QString &);
> > >                       ^
> > > ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:349:24:=
 warning: 'QStringList idnWhitelist()' declared 'static' but never defined =
[-Wunused-function]
> > >     static QStringList idnWhitelist();
> > >                        ^
> > > ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:350:24:=
 warning: 'QStringList toStringList(const QList<QUrl>&, FormattingOptions)'=
 declared 'static' but never defined [-Wunused-function]
> > >     static QStringList toStringList(const QList<QUrl> &uris, Formatti=
ngOptions options =3D FormattingOptions(PrettyDecoded));
> > >                        ^
> > > ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:351:24:=
 warning: 'QList<QUrl> fromStringList(const QStringList&, int)' declared 's=
tatic' but never defined [-Wunused-function]
> > >     static QList<QUrl> fromStringList(const QStringList &uris, Parsin=
gMode mode =3D TolerantMode);
> > >                        ^
> > > ../../../../include/QtCore/../../../git/src/corelib/io/qurl.h:353:17:=
 warning: 'void setIdnWhitelist(const QStringList&)' declared 'static' but =
never defined [-Wunused-function]
> > >     static void setIdnWhitelist(const QStringList &);
> > >                 ^
> > > Makefile:1242: recipe for target '.obj/qminimaleglintegration.o' fail=
ed
> > > make[4]: *** [.obj/qminimaleglintegration.o] Error 1
> > > make[4]: *** Waiting for unfinished jobs....
> > > moc /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-l=
inux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/bearer/q=
bearerengine_impl.h
> > > compiling /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon=
-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/pl=
atforms/offscreen/main.cpp
> > > compiling /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon=
-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/pl=
atforminputcontexts/ibus/main.cpp
> > > compiling /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon=
-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/be=
arer/networkmanager/main.cpp
> > > compiling .moc/moc_qibusplatforminputcontext.cpp
> > > In file included from /scratch/cedar/boneblack/build/tmp/sysroots/mel=
-am335x-boneblack/usr/include/EGL/eglplatform.h:75:0,
> > >                 from /scratch/cedar/boneblack/build/tmp/sysroots/mel-=
am335x-boneblack/usr/include/EGL/egl.h:35,
> > >                 from /scratch/cedar/boneblack/build/tmp/work/cortexa8=
hf-vfp-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src=
/plugins/platforms/eglfs/qeglfsdeviceintegration.h:53,
> > >                 from /scratch/cedar/boneblack/build/tmp/work/cortexa8=
hf-vfp-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src=
/plugins/platforms/eglfs/qeglfshooks.h:37,
> > >                 from /scratch/cedar/boneblack/build/tmp/work/cortexa8=
hf-vfp-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src=
/plugins/platforms/eglfs/qeglfshooks.cpp:34:
> > > ../../../../include/QtCore/../../../git/src/corelib/io/qtextstream.h:=
72:10: error: expected identifier before 'int'
> > >     enum Status {
> > >          ^
> > > In file included from ../../../../include/QtCore/qtextstream.h:1:0,
> > >                 from ../../../../include/QtCore/../../../git/src/core=
lib/io/qdebug.h:42,
> > >                 from ../../../../include/QtCore/qdebug.h:1,
> > >                 from ../../../../include/QtCore/../../../git/src/core=
lib/io/qloggingcategory.h:38,
> > >                 from ../../../../include/QtCore/qloggingcategory.h:1,
> > >                 from ../../../../include/QtCore/QLoggingCategory:1,
> > >                 from /scratch/cedar/boneblack/build/tmp/work/cortexa8=
hf-vfp-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src=
/plugins/platforms/eglfs/qeglfshooks.cpp:35:
> > > ../../../../include/QtCore/../../../git/src/corelib/io/qtextstream.h:=
72:17: error: expected unqualified-id before '{' token
> > >     enum Status {
> > >                 ^
> > > make[4]: Leaving directory '/scratch/cedar/boneblack/build/tmp/work/c=
ortexa8hf-vfp-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/=
build/src/plugins/platforms/minimalegl'
> > > Makefile:146: recipe for target 'sub-minimalegl-make_first' failed
> > > make[3]: *** [sub-minimalegl-make_first] Error 2
> > > make[3]: *** Waiting for unfinished jobs....
> > > compiling .moc/moc_qibusproxy.cpp
> > > compiling .moc/moc_qibusinputcontextproxy.cpp
> > > Makefile.eglfs_device_lib:1889: recipe for target '.obj/qeglfshooks.o=
' failed
> > > make[5]: *** [.obj/qeglfshooks.o] Error 1
> > > make[5]: Leaving directory '/scratch/cedar/boneblack/build/tmp/work/c=
ortexa8hf-vfp-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/=
build/src/plugins/platforms/eglfs'
> > > Makefile:42: recipe for target 'sub-eglfs_device_lib-pro-make_first-o=
rdered' failed
> > > make[4]: *** [sub-eglfs_device_lib-pro-make_first-ordered] Error 2
> > > make[4]: Leaving directory '/scratch/cedar/boneblack/build/tmp/work/c=
ortexa8hf-vfp-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/=
build/src/plugins/platforms/eglfs'
> > > Makefile:121: recipe for target 'sub-eglfs-make_first' failed
> > > make[3]: *** [sub-eglfs-make_first] Error 2
> > > compiling .moc/moc_qtuiohandler_p.cpp
> > > compiling /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon=
-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/be=
arer/qnetworksession_impl.cpp
> > > compiling /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon=
-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/pl=
atforms/xcb/qxcbbackingstore.cpp
> > > compiling /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon=
-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/pl=
atforms/xcb/qxcbwmsupport.cpp
> > > compiling /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon=
-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/pl=
atforms/xcb/qxcbnativeinterface.cpp
> > > rm -f libqoffscreen.so
> > > linking ../../../../plugins/platforms/libqoffscreen.so
> > > rm -f libqgenericbearer.so
> > > linking ../../../../plugins/bearer/libqgenericbearer.so
> > > mv -f libqgenericbearer.so ../../../../plugins/bearer/
> > > make[4]: Leaving directory '/scratch/cedar/boneblack/build/tmp/work/c=
ortexa8hf-vfp-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/=
build/src/plugins/bearer/generic'
> > > compiling .moc/moc_qnetworkmanagerservice.cpp
> > > mv -f libqoffscreen.so ../../../../plugins/platforms/
> > > make[4]: Leaving directory '/scratch/cedar/boneblack/build/tmp/work/c=
ortexa8hf-vfp-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/=
build/src/plugins/platforms/offscreen'
> > > compiling /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon=
-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/pl=
atforms/xcb/qxcbcursor.cpp
> > > rm -f libqtuiotouchplugin.so
> > > linking ../../../../plugins/generic/libqtuiotouchplugin.so
> > > compiling .moc/moc_qnetworkmanagerengine.cpp
> > > compiling .moc/moc_qofonoservice_linux_p.cpp
> > > mv -f libqtuiotouchplugin.so ../../../../plugins/generic/
> > > moc /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-l=
inux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/bearer/q=
networksession_impl.cpp
> > > make[4]: Leaving directory '/scratch/cedar/boneblack/build/tmp/work/c=
ortexa8hf-vfp-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/=
build/src/plugins/generic/tuiotouch'
> > > make[3]: Leaving directory '/scratch/cedar/boneblack/build/tmp/work/c=
ortexa8hf-vfp-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/=
build/src/plugins/generic'
> > > compiling /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon=
-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/pl=
atforms/xcb/qxcbimage.cpp
> > > moc /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-l=
inux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/bearer/c=
onnman/qconnmanservice_linux_p.h
> > > moc /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-l=
inux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/bearer/l=
inux_common/qofonoservice_linux_p.h
> > > moc /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-l=
inux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/bearer/c=
onnman/qconnmanengine.h
> > > moc /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-l=
inux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/bearer/q=
networksession_impl.h
> > > rm -f libibusplatforminputcontextplugin.so
> > > linking ../../../../plugins/platforminputcontexts/libibusplatforminpu=
tcontextplugin.so
> > > compiling .moc/moc_qnetworksession_impl.cpp
> > > moc /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-l=
inux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/bearer/q=
bearerengine_impl.h
> > > compiling /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon=
-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/pl=
atforms/xcb/qxcbxsettings.cpp
> > > compiling /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon=
-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/pl=
atforms/xcb/qxcbsystemtraytracker.cpp
> > > compiling /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon=
-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/pl=
atforms/xcb/qxcbconnection_xi2.cpp
> > > mv -f libibusplatforminputcontextplugin.so ../../../../plugins/platfo=
rminputcontexts/
> > > make[4]: Leaving directory '/scratch/cedar/boneblack/build/tmp/work/c=
ortexa8hf-vfp-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/=
build/src/plugins/platforminputcontexts/ibus'
> > > make[3]: Leaving directory '/scratch/cedar/boneblack/build/tmp/work/c=
ortexa8hf-vfp-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/=
build/src/plugins/platforminputcontexts'
> > > compiling /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon=
-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/pl=
atforms/xcb/gl_integrations/qxcbglintegrationfactory.cpp
> > > compiling /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon=
-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/be=
arer/connman/main.cpp
> > > compiling .moc/moc_qbearerengine_impl.cpp
> > > compiling /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon=
-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/pl=
atforms/xcb/gl_integrations/qxcbglintegration.cpp
> > > compiling /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon=
-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/pl=
atforms/xcb/gl_integrations/qxcbnativeinterfacehandler.cpp
> > > moc /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-l=
inux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/platform=
s/xcb/qxcbconnection.h
> > > moc /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-l=
inux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/platform=
s/xcb/qxcbmime.h
> > > compiling /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon=
-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/be=
arer/qnetworksession_impl.cpp
> > > moc /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-l=
inux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/platform=
s/xcb/qxcbnativeinterface.h
> > > moc /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-l=
inux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/platform=
s/xcb/qxcbsystemtraytracker.h
> > > compiling .moc/moc_qconnmanservice_linux_p.cpp
> > > moc /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-l=
inux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/platform=
s/xcb/gl_integrations/qxcbglintegrationplugin.h
> > > compiling .moc/moc_qofonoservice_linux_p.cpp
> > > rm -f libqnmbearer.so
> > > linking ../../../../plugins/bearer/libqnmbearer.so
> > > compiling .moc/moc_qconnmanengine.cpp
> > > compiling /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon=
-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/pl=
atforms/xcb/qxcbclipboard.cpp
> > > compiling .moc/moc_qxcbconnection.cpp
> > > compiling .moc/moc_qxcbmime.cpp
> > > compiling .moc/moc_qxcbnativeinterface.cpp
> > > compiling .moc/moc_qxcbsystemtraytracker.cpp
> > > compiling .moc/moc_qxcbglintegrationplugin.cpp
> > > mv -f libqnmbearer.so ../../../../plugins/bearer/
> > > make[4]: Leaving directory '/scratch/cedar/boneblack/build/tmp/work/c=
ortexa8hf-vfp-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/=
build/src/plugins/bearer/networkmanager'
> > > compiling .moc/moc_qnetworksession_impl.cpp
> > > compiling .moc/moc_qbearerengine_impl.cpp
> > > rm -f libqconnmanbearer.so
> > > linking ../../../../plugins/bearer/libqconnmanbearer.so
> > > mv -f libqconnmanbearer.so ../../../../plugins/bearer/
> > > make[4]: Leaving directory '/scratch/cedar/boneblack/build/tmp/work/c=
ortexa8hf-vfp-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/=
build/src/plugins/bearer/connman'
> > > make[3]: Leaving directory '/scratch/cedar/boneblack/build/tmp/work/c=
ortexa8hf-vfp-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/=
build/src/plugins/bearer'
> > > rm -f libQt5XcbQpa.so.5.5.0 libQt5XcbQpa.so libQt5XcbQpa.so.5 libQt5X=
cbQpa.so.5.5
> > > linking ../../../../lib/libQt5XcbQpa.so.5.5.0
> > > ln -s libQt5XcbQpa.so.5.5.0 libQt5XcbQpa.so
> > > ln -s libQt5XcbQpa.so.5.5.0 libQt5XcbQpa.so.5
> > > ln -s libQt5XcbQpa.so.5.5.0 libQt5XcbQpa.so.5.5
> > > rm -f ../../../../lib/libQt5XcbQpa.so.5.5.0
> > > mv -f libQt5XcbQpa.so.5.5.0  ../../../../lib/
> > > rm -f ../../../../lib/libQt5XcbQpa.so
> > > rm -f ../../../../lib/libQt5XcbQpa.so.5
> > > rm -f ../../../../lib/libQt5XcbQpa.so.5.5
> > > mv -f libQt5XcbQpa.so ../../../../lib/
> > > mv -f libQt5XcbQpa.so.5 ../../../../lib/
> > > mv -f libQt5XcbQpa.so.5.5 ../../../../lib/
> > > make[5]: Leaving directory '/scratch/cedar/boneblack/build/tmp/work/c=
ortexa8hf-vfp-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/=
build/src/plugins/platforms/xcb'
> > > ( test -e Makefile.xcb-plugin || /scratch/cedar/boneblack/build/tmp/w=
ork/cortexa8hf-vfp-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59e=
e-r0/build/bin/qmake /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp=
-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugi=
ns/platforms/xcb/xcb-plugin.pro -o Makefile.xcb-plugin ) && make -f Makefil=
e.xcb-plugin
> > > make[5]: Entering directory '/scratch/cedar/boneblack/build/tmp/work/=
cortexa8hf-vfp-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0=
/build/src/plugins/platforms/xcb'
> > > moc /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-l=
inux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/platform=
s/xcb/qxcbmain.cpp
> > > compiling /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon=
-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/pl=
atforms/xcb/qxcbmain.cpp
> > > rm -f libqxcb.so
> > > linking ../../../../plugins/platforms/libqxcb.so
> > > mv -f libqxcb.so ../../../../plugins/platforms/
> > > make[5]: Leaving directory '/scratch/cedar/boneblack/build/tmp/work/c=
ortexa8hf-vfp-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/=
build/src/plugins/platforms/xcb'
> > > cd gl_integrations/ && ( test -e Makefile || /scratch/cedar/boneblack=
/build/tmp/work/cortexa8hf-vfp-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOI=
NC+2fde9f59ee-r0/build/bin/qmake /scratch/cedar/boneblack/build/tmp/work/co=
rtexa8hf-vfp-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/g=
it/src/plugins/platforms/xcb/gl_integrations/gl_integrations.pro -o Makefil=
e ) && make -f Makefile
> > > make[5]: Entering directory '/scratch/cedar/boneblack/build/tmp/work/=
cortexa8hf-vfp-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0=
/build/src/plugins/platforms/xcb/gl_integrations'
> > > cd xcb_egl/ && ( test -e Makefile || /scratch/cedar/boneblack/build/t=
mp/work/cortexa8hf-vfp-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9=
f59ee-r0/build/bin/qmake /scratch/cedar/boneblack/build/tmp/work/cortexa8hf=
-vfp-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/p=
lugins/platforms/xcb/gl_integrations/xcb_egl/xcb_egl.pro -o Makefile ) && m=
ake -f Makefile
> > > make[6]: Entering directory '/scratch/cedar/boneblack/build/tmp/work/=
cortexa8hf-vfp-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0=
/build/src/plugins/platforms/xcb/gl_integrations/xcb_egl'
> > > compiling /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon=
-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/pl=
atforms/xcb/gl_integrations/xcb_egl/qxcbeglintegration.cpp
> > > compiling /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon=
-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/pl=
atforms/xcb/gl_integrations/xcb_egl/qxcbeglwindow.cpp
> > > moc /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-l=
inux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/platform=
s/xcb/gl_integrations/xcb_egl/qxcbeglmain.cpp
> > > compiling /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon=
-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/pl=
atforms/xcb/gl_integrations/xcb_egl/qxcbeglnativeinterfacehandler.cpp
> > > compiling /scratch/cedar/boneblack/build/tmp/work/cortexa8hf-vfp-neon=
-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/plugins/pl=
atforms/xcb/gl_integrations/xcb_egl/qxcbeglmain.cpp
> > > rm -f libqxcb-egl-integration.so
> > > linking ../../../../../../plugins/xcbglintegrations/libqxcb-egl-integ=
ration.so
> > > mv -f libqxcb-egl-integration.so ../../../../../../plugins/xcbglinteg=
rations/
> > > make[6]: Leaving directory '/scratch/cedar/boneblack/build/tmp/work/c=
ortexa8hf-vfp-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/=
build/src/plugins/platforms/xcb/gl_integrations/xcb_egl'
> > > make[5]: Leaving directory '/scratch/cedar/boneblack/build/tmp/work/c=
ortexa8hf-vfp-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/=
build/src/plugins/platforms/xcb/gl_integrations'
> > > make[4]: Leaving directory '/scratch/cedar/boneblack/build/tmp/work/c=
ortexa8hf-vfp-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/=
build/src/plugins/platforms/xcb'
> > > make[3]: Leaving directory '/scratch/cedar/boneblack/build/tmp/work/c=
ortexa8hf-vfp-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/=
build/src/plugins/platforms'
> > > Makefile:125: recipe for target 'sub-platforms-make_first' failed
> > > make[2]: *** [sub-platforms-make_first] Error 2
> > > make[2]: Leaving directory '/scratch/cedar/boneblack/build/tmp/work/c=
ortexa8hf-vfp-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/=
build/src/plugins'
> > > Makefile:720: recipe for target 'sub-plugins-make_first' failed
> > > make[1]: *** [sub-plugins-make_first] Error 2
> > > make[1]: Leaving directory '/scratch/cedar/boneblack/build/tmp/work/c=
ortexa8hf-vfp-neon-mel-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/=
build/src'
> > > Makefile:45: recipe for target 'sub-src-make_first' failed
> > > make: *** [sub-src-make_first] Error 2
> > > WARNING: exit code 1 from a shell command.
> > > ERROR: oe_runmake failed
> > > ERROR: Function failed: do_compile (log file is located at /scratch/c=
edar/boneblack/build/tmp/work/cortexa8hf-vfp-neon-mel-linux-gnueabi/qtbase/=
5.5.0+gitAUTOINC+2fde9f59ee-r0/temp/log.do_compile.15120)
> > > --
> > > _______________________________________________
> > > Openembedded-devel mailing list
> > > Openembedded-devel@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >=20
> > --=20
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com



--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--w6U88vdWm8UqIXvc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlYWqVsACgkQN1Ujt2V2gByekQCcCiFT5Oj93qVSUGvGdI9nJHXn
s3sAniFW3qurLp7+hZjLzJ65EKiuM9HU
=EyWh
-----END PGP SIGNATURE-----

--w6U88vdWm8UqIXvc--
