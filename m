Received: from mailout-de.gmx.net ([213.165.64.23])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <cheepeero@gmx.net>) id 1SLixP-0004yI-0W
	for openembedded-devel@lists.openembedded.org;
	Sun, 22 Apr 2012 00:39:07 +0200
Received: (qmail invoked by alias); 21 Apr 2012 22:29:35 -0000
Received: from unknown (EHLO [192.168.1.14]) [95.76.68.223]
	by mail.gmx.net (mp033) with SMTP; 22 Apr 2012 00:29:35 +0200
X-Authenticated: #14774724
X-Provags-ID: V01U2FsdGVkX1/z/ectOoLzTXhqDh8xyWU4V2WyNN6oB8GYNnsYPk
	cucUdGpuDKNPn5
From: Ciprian Ciubotariu <cheepeero@gmx.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20120421053056.GA3656@jama.jama.net>
References: <1334969229-8249-1-git-send-email-cheepeero@gmx.net>
	<20120421053056.GA3656@jama.jama.net>
Date: Sun, 22 Apr 2012 01:29:34 +0300
Message-ID: <1335047374.4508.0.camel@jethro.cheepee.homedns.org>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
X-Y-GMX-Trusted: 0
Subject: Re: [oe-core] Fix bad linkage towards host qt-mobility sensors module
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
X-List-Received-Date: Sat, 21 Apr 2012 22:39:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Fixed indentation and sent to oe-core mailing list.

On Sat, 2012-04-21 at 07:30 +0200, Martin Jansa wrote:
> On Sat, Apr 21, 2012 at 03:47:09AM +0300, Ciprian Ciubotariu wrote:
> > Prevent qmake from using mobilityconfig.prf from host system when build webkit.
> > ---
> >  meta/recipes-qt/qt4/qt-4.8.0.inc                  |    1 +
> >  meta/recipes-qt/qt4/qt-4.8.0/no-qt-mobility.patch |   52 +++++++++++++++++++++
> >  meta/recipes-qt/qt4/qt4-x11-free_4.8.0.bb         |    2 +-
> >  3 files changed, 54 insertions(+), 1 deletions(-)
> >  create mode 100644 meta/recipes-qt/qt4/qt-4.8.0/no-qt-mobility.patch
> > 
> > diff --git a/meta/recipes-qt/qt4/qt-4.8.0.inc b/meta/recipes-qt/qt4/qt-4.8.0.inc
> > index c0d90cd..ccd75e6 100644
> > --- a/meta/recipes-qt/qt4/qt-4.8.0.inc
> > +++ b/meta/recipes-qt/qt4/qt-4.8.0.inc
> > @@ -20,6 +20,7 @@ SRC_URI = "http://get.qt.nokia.com/qt/source/qt-everywhere-opensource-src-${PV}.
> >             file://pulseaudio-config.patch \
> >             file://g++.conf \
> >             file://linux.conf \
> > +	   file://no-qt-mobility.patch \
> 
> Please don't mix tabs and spaces for indentation and this patch belongs
> to openembedded-core ML.
> 
> Cheers,
> 
> >             "
> >  
> >  SRC_URI[md5sum] = "e8a5fdbeba2927c948d9f477a6abe904"
> > diff --git a/meta/recipes-qt/qt4/qt-4.8.0/no-qt-mobility.patch b/meta/recipes-qt/qt4/qt-4.8.0/no-qt-mobility.patch
> > new file mode 100644
> > index 0000000..ed66509
> > --- /dev/null
> > +++ b/meta/recipes-qt/qt4/qt-4.8.0/no-qt-mobility.patch
> > @@ -0,0 +1,52 @@
> > +diff --git a/src/3rdparty/webkit/Source/WebCore/features.pri b/src/3rdparty/webkit/Source/WebCore/features.pri
> > +index f04d0b4..aac0482 100644
> > +--- a/src/3rdparty/webkit/Source/WebCore/features.pri
> > ++++ b/src/3rdparty/webkit/Source/WebCore/features.pri
> > +@@ -14,7 +14,7 @@ meegotouch {
> > + }
> > + 
> > + ## load mobilityconfig if mobility is available
> > +-load(mobilityconfig, true)
> > ++#load(mobilityconfig, true)
> > + 
> > + ## Define default features macros for optional components
> > + ## (look for defs in config.h and included files!)
> > +diff --git a/src/3rdparty/webkit/Source/WebKit/qt/examples/platformplugin/platformplugin.pro b/src/3rdparty/webkit/Source/WebKit/qt/examples/platformplugin/platformplugin.pro
> > +index 80cecb3..856351a 100644
> > +--- a/src/3rdparty/webkit/Source/WebKit/qt/examples/platformplugin/platformplugin.pro
> > ++++ b/src/3rdparty/webkit/Source/WebKit/qt/examples/platformplugin/platformplugin.pro
> > +@@ -4,7 +4,7 @@ TEMPLATE = lib
> > + CONFIG += plugin
> > + 
> > + ## load mobilityconfig if mobility is available
> > +-load(mobilityconfig, true)
> > ++#load(mobilityconfig, true)
> > + 
> > + # HTML5 Media Support
> > + # We require QtMultimedia
> > +diff --git a/src/3rdparty/webkit/Source/WebKit/qt/symbian/platformplugin/platformplugin.pro b/src/3rdparty/webkit/Source/WebKit/qt/symbian/platformplugin/platformplugin.pro
> > +index fd31e1e..52f1b46 100644
> > +--- a/src/3rdparty/webkit/Source/WebKit/qt/symbian/platformplugin/platformplugin.pro
> > ++++ b/src/3rdparty/webkit/Source/WebKit/qt/symbian/platformplugin/platformplugin.pro
> > +@@ -11,7 +11,7 @@ QT       += core gui \
> > +             xml
> > + 
> > + ## load mobilityconfig if mobility is available
> > +-load(mobilityconfig, true)
> > ++#load(mobilityconfig, true)
> > + 
> > + isEmpty(OUTPUT_DIR): OUTPUT_DIR = ../../../..
> > + 
> > +diff --git a/src/3rdparty/webkit/Source/WebKit/qt/tests/tests.pri b/src/3rdparty/webkit/Source/WebKit/qt/tests/tests.pri
> > +index 812fe93..ccbc5a0 100644
> > +--- a/src/3rdparty/webkit/Source/WebKit/qt/tests/tests.pri
> > ++++ b/src/3rdparty/webkit/Source/WebKit/qt/tests/tests.pri
> > +@@ -7,7 +7,7 @@ CONFIG(QTDIR_build) { load(qttest_p4) }
> > + ELSE { TARGET = tst_$$TARGET }
> > + 
> > + # Load mobilityconfig if Qt Mobility is available
> > +-load(mobilityconfig, true)
> > ++#load(mobilityconfig, true)
> > + contains(MOBILITY_CONFIG, multimedia) {
> > +     # This define is used by tests depending on Qt Multimedia
> > +     DEFINES -= WTF_USE_QT_MULTIMEDIA=0
> > diff --git a/meta/recipes-qt/qt4/qt4-x11-free_4.8.0.bb b/meta/recipes-qt/qt4/qt4-x11-free_4.8.0.bb
> > index 6a0b0b8..63a3769 100644
> > --- a/meta/recipes-qt/qt4/qt4-x11-free_4.8.0.bb
> > +++ b/meta/recipes-qt/qt4/qt4-x11-free_4.8.0.bb
> > @@ -1,7 +1,7 @@
> >  require qt4-x11-free.inc
> >  require qt-${PV}.inc
> >  
> > -PR = "${INC_PR}.1"
> > +PR = "${INC_PR}.2"
> >  
> >  DEFAULT_PREFERENCE = "-1"
> >  
> > -- 
> > 1.7.3.4
> > 
> > 
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



