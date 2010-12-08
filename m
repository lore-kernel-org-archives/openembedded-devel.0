Received: from mail-iw0-f173.google.com ([209.85.214.173])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PQRbp-00069u-UK
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Dec 2010 22:31:34 +0100
Received: by iwn40 with SMTP id 40so2018501iwn.18
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Dec 2010 13:30:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=4ytFb/Yo4Tt4fJtWPdAa3E1NYKWqnWhZCHTwDqWksXU=;
	b=omWlH5GdGE6L7ZsQT43Z1l36GPPGeq3GWWKKq8E/Pp6hnMEuGwYVkgM7A9WnJWQo2f
	ewL1dxJMFX62DR72VjWhzGjZWgKw6+UpB7KH4gujSJV+7dBtCWGRI39JwGNglj23dQ5D
	gmrS59vtb8dNIXRcCubSZuQAMgf8fuU4WH7TA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=i0kcaq3mk6whuP/eRWJlOQVXVDVKl3DsHUdMBqhqSE0zGHf9eziEGTbMVo+Qd4ef5V
	UCDrG/cDr4cDCbp4Dr94SHysfVPW0H7hI3VTV+HppxObak5S0vjwDpkHOUlRBpNe5wwq
	ilX6otnlEmm1fcCFCYowJ9ZIZaTnj3X4/65mc=
MIME-Version: 1.0
Received: by 10.231.37.75 with SMTP id w11mr290361ibd.157.1291843805150; Wed,
	08 Dec 2010 13:30:05 -0800 (PST)
Received: by 10.231.200.140 with HTTP; Wed, 8 Dec 2010 13:30:05 -0800 (PST)
Date: Wed, 8 Dec 2010 22:30:05 +0100
Message-ID: <AANLkTimtBfUL7sqgUQdYBwC57tyxmtyV6xK32K_4qmnc@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.173
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_PASS,WEIRD_PORT autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: qt build failure (armv5)
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
X-List-Received-Date: Wed, 08 Dec 2010 21:31:34 -0000
Content-Type: text/plain; charset=ISO-8859-1

Got a build failure in qt when building for sheevaplug:

see http://tinderbox.openembedded.net/builds/109817/

and the relevant part of the log:
| arm-oe-linux-gnueabi-g++ -march=armv5te -mtune=arm926ej-s
-mthumb-interwork -mno-thumb
-Wl,-rpath-link,/home/frans/oe/tmp_minimal/sysroots/armv5te-oe-linux-gnueabi/usr/lib
-L/home/frans/oe/tmp_minimal/sysroots/armv5te-oe-linux-gnueabi/usr/lib
-Wl,-rpath-link,/home/frans/oe/tmp_minimal/sysroots/armv5te-oe-linux-gnueabi/usr/lib
-Wl,-O1 -Wl,--hash-style=gnu -Wl,--no-undefined
-Wl,-rpath-link,/home/frans/oe/tmp_minimal/work/armv5te-oe-linux-gnueabi/qt4-x11-free-4.7.1-r21.0/qt-everywhere-opensource-src-4.7.1/lib
-Wl,-rpath-link,/home/frans/oe/tmp_minimal/work/armv5te-oe-linux-gnueabi/qt4-x11-free-4.7.1-r21.0/qt-everywhere-opensource-src-4.7.1/lib
-shared -Wl,-Bsymbolic-functions -Wl,-soname,libQtDeclarative.so.4 -o
libQtDeclarative.so.4.7.1 .obj/release-shared/qdeclarativeutilmodule.o
.obj/release-shared/qdeclarativeview.o
.obj/release-shared/qdeclarativeconnections.o
.obj/release-shared/qdeclarativepackage.o
.obj/release-shared/qdeclarativeanimation.o
.obj/release-shared/qdeclarativesystempalette.o
.obj/release-shared/qdeclarativespringanimation.o
.obj/release-shared/qdeclarativesmoothedanimation.o
.obj/release-shared/qdeclarativestate.o
.obj/release-shared/qdeclarativetransitionmanager.o
.obj/release-shared/qdeclarativestateoperations.o
.obj/release-shared/qdeclarativepropertychanges.o
.obj/release-shared/qdeclarativestategroup.o
.obj/release-shared/qdeclarativetransition.o
.obj/release-shared/qdeclarativelistmodel.o
.obj/release-shared/qdeclarativelistaccessor.o
.obj/release-shared/qdeclarativeopenmetaobject.o
.obj/release-shared/qdeclarativetimeline.o
.obj/release-shared/qdeclarativetimer.o
.obj/release-shared/qdeclarativebind.o
.obj/release-shared/qdeclarativepropertymap.o
.obj/release-shared/qdeclarativepixmapcache.o
.obj/release-shared/qdeclarativebehavior.o
.obj/release-shared/qdeclarativefontloader.o
.obj/release-shared/qdeclarativestyledtext.o
.obj/release-shared/qdeclarativelistmodelworkeragent.o
.obj/release-shared/qlistmodelinterface.o
.obj/release-shared/qdeclarativexmllistmodel.o
.obj/release-shared/qdeclarativeitemsmodule.o
.obj/release-shared/qdeclarativeanchors.o
.obj/release-shared/qdeclarativeevents.o
.obj/release-shared/qdeclarativeflickable.o
.obj/release-shared/qdeclarativeflipable.o
.obj/release-shared/qdeclarativegridview.o
.obj/release-shared/qdeclarativeimage.o
.obj/release-shared/qdeclarativeborderimage.o
.obj/release-shared/qdeclarativeimagebase.o
.obj/release-shared/qdeclarativeanimatedimage.o
.obj/release-shared/qdeclarativepainteditem.o
.obj/release-shared/qdeclarativeitem.o
.obj/release-shared/qdeclarativefocuspanel.o
.obj/release-shared/qdeclarativefocusscope.o
.obj/release-shared/qdeclarativepositioners.o
.obj/release-shared/qdeclarativeloader.o
.obj/release-shared/qdeclarativemousearea.o
.obj/release-shared/qdeclarativepath.o
.obj/release-shared/qdeclarativepathview.o
.obj/release-shared/qdeclarativerectangle.o
.obj/release-shared/qdeclarativerepeater.o
.obj/release-shared/qdeclarativescalegrid.o
.obj/release-shared/qdeclarativetranslate.o
.obj/release-shared/qdeclarativetextinput.o
.obj/release-shared/qdeclarativetext.o
.obj/release-shared/qdeclarativetextedit.o
.obj/release-shared/qdeclarativevisualitemmodel.o
.obj/release-shared/qdeclarativelistview.o
.obj/release-shared/qdeclarativelayoutitem.o
.obj/release-shared/qdeclarativegraphicswidget.o
.obj/release-shared/qdeclarativeparser.o
.obj/release-shared/qdeclarativeinstruction.o
.obj/release-shared/qdeclarativevmemetaobject.o
.obj/release-shared/qdeclarativeengine.o
.obj/release-shared/qdeclarativeexpression.o
.obj/release-shared/qdeclarativebinding.o
.obj/release-shared/qdeclarativeproperty.o
.obj/release-shared/qdeclarativecomponent.o
.obj/release-shared/qdeclarativecontext.o
.obj/release-shared/qdeclarativeinclude.o
.obj/release-shared/qdeclarativecustomparser.o
.obj/release-shared/qdeclarativepropertyvaluesource.o
.obj/release-shared/qdeclarativepropertyvalueinterceptor.o
.obj/release-shared/qdeclarativeproxymetaobject.o
.obj/release-shared/qdeclarativevme.o
.obj/release-shared/qdeclarativecompiler.o
.obj/release-shared/qdeclarativecompileddata.o
.obj/release-shared/qdeclarativeboundsignal.o
.obj/release-shared/qdeclarativedom.o
.obj/release-shared/qdeclarativerefcount.o
.obj/release-shared/qdeclarativemetatype.o
.obj/release-shared/qdeclarativestringconverters.o
.obj/release-shared/qdeclarativeclassfactory.o
.obj/release-shared/qdeclarativeparserstatus.o
.obj/release-shared/qdeclarativetypeloader.o
.obj/release-shared/qdeclarativeinfo.o
.obj/release-shared/qdeclarativeerror.o
.obj/release-shared/qdeclarativescriptparser.o
.obj/release-shared/qdeclarativeenginedebug.o
.obj/release-shared/qdeclarativerewrite.o
.obj/release-shared/qdeclarativevaluetype.o
.obj/release-shared/qdeclarativecompiledbindings.o
.obj/release-shared/qdeclarativefastproperties.o
.obj/release-shared/qdeclarativexmlhttprequest.o
.obj/release-shared/qdeclarativesqldatabase.o
.obj/release-shared/qmetaobjectbuilder.o
.obj/release-shared/qdeclarativewatcher.o
.obj/release-shared/qdeclarativecleanup.o
.obj/release-shared/qdeclarativepropertycache.o
.obj/release-shared/qdeclarativenotifier.o
.obj/release-shared/qdeclarativeintegercache.o
.obj/release-shared/qdeclarativetypenotavailable.o
.obj/release-shared/qdeclarativetypenamecache.o
.obj/release-shared/qdeclarativescriptstring.o
.obj/release-shared/qdeclarativeobjectscriptclass.o
.obj/release-shared/qdeclarativecontextscriptclass.o
.obj/release-shared/qdeclarativeglobalscriptclass.o
.obj/release-shared/qdeclarativevaluetypescriptclass.o
.obj/release-shared/qdeclarativetypenamescriptclass.o
.obj/release-shared/qdeclarativelistscriptclass.o
.obj/release-shared/qdeclarativeworkerscript.o
.obj/release-shared/qdeclarativeimageprovider.o
.obj/release-shared/qdeclarativenetworkaccessmanagerfactory.o
.obj/release-shared/qdeclarativedirparser.o
.obj/release-shared/qdeclarativeextensionplugin.o
.obj/release-shared/qdeclarativeimport.o
.obj/release-shared/qdeclarativelist.o
.obj/release-shared/qdeclarativejsast.o
.obj/release-shared/qdeclarativejsastvisitor.o
.obj/release-shared/qdeclarativejsengine_p.o
.obj/release-shared/qdeclarativejsgrammar.o
.obj/release-shared/qdeclarativejslexer.o
.obj/release-shared/qdeclarativejsparser.o
.obj/release-shared/textwriter.o .obj/release-shared/rewriter.o
.obj/release-shared/qdeclarativedebuggerstatus.o
.obj/release-shared/qpacketprotocol.o
.obj/release-shared/qdeclarativedebugservice.o
.obj/release-shared/qdeclarativedebugclient.o
.obj/release-shared/qdeclarativedebug.o
.obj/release-shared/qdeclarativedebugtrace.o
.obj/release-shared/qdeclarativedebughelper.o
.obj/release-shared/moc_qdeclarativeview.o
.obj/release-shared/moc_qdeclarativeconnections_p.o
.obj/release-shared/moc_qdeclarativepackage_p.o
.obj/release-shared/moc_qdeclarativeanimation_p.o
.obj/release-shared/moc_qdeclarativeanimation_p_p.o
.obj/release-shared/moc_qdeclarativesystempalette_p.o
.obj/release-shared/moc_qdeclarativespringanimation_p.o
.obj/release-shared/moc_qdeclarativesmoothedanimation_p.o
.obj/release-shared/moc_qdeclarativestate_p.o
.obj/release-shared/moc_qdeclarativepropertychanges_p.o
.obj/release-shared/moc_qdeclarativestategroup_p.o
.obj/release-shared/moc_qdeclarativetransition_p.o
.obj/release-shared/moc_qdeclarativelistmodel_p.o
.obj/release-shared/moc_qdeclarativelistmodel_p_p.o
.obj/release-shared/moc_qdeclarativetimeline_p_p.o
.obj/release-shared/moc_qdeclarativetimer_p.o
.obj/release-shared/moc_qdeclarativebind_p.o
.obj/release-shared/moc_qdeclarativepropertymap.o
.obj/release-shared/moc_qdeclarativebehavior_p.o
.obj/release-shared/moc_qdeclarativefontloader_p.o
.obj/release-shared/moc_qdeclarativelistmodelworkeragent_p.o
.obj/release-shared/moc_qlistmodelinterface_p.o
.obj/release-shared/moc_qdeclarativexmllistmodel_p.o
.obj/release-shared/moc_qdeclarativeevents_p_p.o
.obj/release-shared/moc_qdeclarativeflickable_p.o
.obj/release-shared/moc_qdeclarativeflickable_p_p.o
.obj/release-shared/moc_qdeclarativeflipable_p.o
.obj/release-shared/moc_qdeclarativegridview_p.o
.obj/release-shared/moc_qdeclarativeimage_p.o
.obj/release-shared/moc_qdeclarativeimagebase_p.o
.obj/release-shared/moc_qdeclarativeborderimage_p.o
.obj/release-shared/moc_qdeclarativepainteditem_p.o
.obj/release-shared/moc_qdeclarativeanimatedimage_p.o
.obj/release-shared/moc_qdeclarativeitem_p.o
.obj/release-shared/moc_qdeclarativefocuspanel_p.o
.obj/release-shared/moc_qdeclarativefocusscope_p.o
.obj/release-shared/moc_qdeclarativepositioners_p.o
.obj/release-shared/moc_qdeclarativemousearea_p.o
.obj/release-shared/moc_qdeclarativepath_p.o
.obj/release-shared/moc_qdeclarativepathview_p.o
.obj/release-shared/moc_qdeclarativerectangle_p.o
.obj/release-shared/moc_qdeclarativerepeater_p.o
.obj/release-shared/moc_qdeclarativescalegrid_p_p.o
.obj/release-shared/moc_qdeclarativetranslate_p.o
.obj/release-shared/moc_qdeclarativetextinput_p.o
.obj/release-shared/moc_qdeclarativetextedit_p.o
.obj/release-shared/moc_qdeclarativetext_p.o
.obj/release-shared/moc_qdeclarativevisualitemmodel_p.o
.obj/release-shared/moc_qdeclarativelistview_p.o
.obj/release-shared/moc_qdeclarativelayoutitem_p.o
.obj/release-shared/moc_qdeclarativebinding_p.o
.obj/release-shared/moc_qdeclarativecomponent.o
.obj/release-shared/moc_qdeclarativecomponent_p.o
.obj/release-shared/moc_qdeclarativeboundsignal_p.o
.obj/release-shared/moc_qdeclarativeengine.o
.obj/release-shared/moc_qdeclarativecontext.o
.obj/release-shared/moc_qdeclarativeinclude_p.o
.obj/release-shared/moc_qdeclarativetypeloader_p.o
.obj/release-shared/moc_qdeclarativeenginedebug_p.o
.obj/release-shared/moc_qdeclarativevaluetype_p.o
.obj/release-shared/moc_qdeclarativewatcher_p.o
.obj/release-shared/moc_qdeclarativetypenotavailable_p.o
.obj/release-shared/moc_qdeclarativeworkerscript_p.o
.obj/release-shared/moc_qdeclarativeextensionplugin.o
.obj/release-shared/moc_qpacketprotocol_p.o
.obj/release-shared/moc_qdeclarativedebugservice_p.o
.obj/release-shared/moc_qdeclarativedebugclient_p.o
.obj/release-shared/moc_qdeclarativedebug_p.o
-L/home/frans/oe/tmp_minimal/sysroots/armv5te-oe-linux-gnueabi/usr/lib
-L/home/frans/oe/tmp_minimal/work/armv5te-oe-linux-gnueabi/qt4-x11-free-4.7.1-r21.0/qt-everywhere-opensource-src-4.7.1/lib
-lQtScript -lQtSvg -lQtSql -lQtXmlPatterns -lQtGui -lQtNetwork
-lQtCore -lpthread
| .obj/release-shared/qdeclarativedebugservice.o: In function
`QDeclarativeDebugServer::instance()':
| qdeclarativedebugservice.cpp:(.text+0xc94): undefined reference to
`QApplicationPrivate::qmljsDebugArgumentsString()'
| qdeclarativedebugservice.cpp:(.text+0xd5c): undefined reference to
`QApplicationPrivate::qmljsDebugArgumentsString()'
| qdeclarativedebugservice.cpp:(.text+0xf2c): undefined reference to
`QApplicationPrivate::qmljsDebugArgumentsString()'
| qdeclarativedebugservice.cpp:(.text+0xf8c): undefined reference to
`QApplicationPrivate::qmljsDebugArgumentsString()'
| qdeclarativedebugservice.cpp:(.text+0x104c): undefined reference to
`QApplicationPrivate::qmljsDebugArgumentsString()'
| .obj/release-shared/qdeclarativedebugservice.o:qdeclarativedebugservice.cpp:(.text+0x1188):
more undefined references to
`QApplicationPrivate::qmljsDebugArgumentsString()' follow
| collect2: ld returned 1 exit status
| make[1]: *** [../../lib/libQtDeclarative.so.4.7.1] Error 1
| make[1]: Leaving directory
`/home/frans/oe/tmp_minimal/work/armv5te-oe-linux-gnueabi/qt4-x11-free-4.7.1-r21.0/qt-everywhere-opensource-src-4.7.1/src/declarative'
| make: *** [sub-declarative-make_default-ordered] Error 2
| FATAL: oe_runmake failed
NOTE: package qt4-x11-free-4.7.1-r21.0: task do_compile: Failed
WARNING: /home/frans/oe/bitbake/lib/bb/build.py:57:
DeprecationWarning: BaseException.message has been deprecated as of
Python 2.6
  (self.message, self.logfile)

Anyone an idea?

Frans


