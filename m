Received: from infosrv.imms.de ([194.95.250.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <thomas.elste@imms.de>) id 1Pn6B8-0005bS-85
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 Feb 2011 10:17:38 +0100
Received: from infosrv.imms.de (infosrv.imms.de [127.0.0.1])
	by IMSA (Postfix) with ESMTP id A27E1260056
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Feb 2011 09:53:35 +0100 (CET)
Received: from iiserv1.imms.de (iiserv1.imms.de [194.95.133.32])
	by infosrv.imms.de (Postfix) with ESMTP id 7C17B260053
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Feb 2011 09:53:35 +0100 (CET)
MIME-version: 1.0
Received: from pluto ([172.16.10.24])
	by iiserv1.imms.de (Sun Java(tm) System Messaging Server 6.3-6.03
	(built Mar
	14 2008; 32bit)) with ESMTPA id <0LGC000GADKRX800@iiserv1.imms.de> for
	openembedded-devel@lists.openembedded.org; Wed,
	09 Feb 2011 09:43:39 +0100 (CET)
Date: Wed, 09 Feb 2011 09:53:35 +0100
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
From: Thomas Elste <thomas.elste@imms.de>
Organization: IMMS gGmbH
Message-id: <op.vqmoblu0aqzt3c@pluto>
User-Agent: Opera Mail/11.01 (Linux)
Subject: qt4-tools-native not compiling
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
X-List-Received-Date: Wed, 09 Feb 2011 09:17:38 -0000
Content-transfer-encoding: 7BIT
Content-type: text/plain; charset=iso-8859-15; format=flowed; delsp=yes

Hi,

I'm trying to build qt4-tools-native (I'm on tested_2011-01-28 currently).
It fails while compiling qegl_qws.cpp (see log below).
There seems to be a problem with the Qt configure script checking for
EGL include files and detecting EGL support. Don't know if it should
or shouldn't. Nevertheless if I remove my build hosts /usr/include/EGL
directory, compiling qt4-tools-native works fine. I'm using Gentoo64 and
the EGL headers are from media-libs/mesa ebuild. So installing mesa-dev
package on some other distribution will possibly lead to this error, too.
Any hint how to fix this?


Best Regards
Thomas


Build Configuration:
BB_VERSION        = "1.10.2"
METADATA_BRANCH   = "<unknown>"
METADATA_REVISION = "3a7b93a"
TARGET_ARCH       = "arm"
TARGET_OS         = "linux-gnueabi"
MACHINE           = "am3517-evm"
DISTRO            = "angstrom"
DISTRO_VERSION    = "2010.7-test-20110209"
TARGET_FPU        = "hard"

log.do_compile:
<...>
g++  -c -isystem/boards/am3517-evm/oe-tested_2011-01-28/tmp/sysroots/x86_64-linu
x/usr/include -O2 -g -I/boards/am3517-evm/oe-tested_2011-01-28/tmp/sysroots/x86_
64-linux/usr/include -fno-exceptions -O2 -fvisibility=hidden -fvisibility-inline
s-hidden -Wall -W -D_REENTRANT -fPIC -DQT_BUILD_GUI_LIB -DQT_NO_USING_NAMESPACE
-DQT_NO_CAST_TO_ASCII -DQT_ASCII_CAST_WARNINGS -DQT3_SUPPORT -DQT_MOC_COMPAT -DQ
T_NO_IMAGEFORMAT_PNG -DQT_HAVE_MMX -DQT_HAVE_3DNOW -DQT_HAVE_SSE -DQT_HAVE_MMXEX
T -DQT_HAVE_SSE2 -DQT_NO_FONTCONFIG -DQT_NO_FREETYPE -DQT_NO_OPENTYPE -DQT_NO_ST
YLE_MAC -DQT_NO_STYLE_WINDOWSVISTA -DQT_NO_STYLE_WINDOWSXP -DQT_NO_STYLE_GTK -DQ
T_NO_STYLE_WINDOWSCE -DQT_NO_STYLE_WINDOWSMOBILE -DQT_NO_STYLE_S60 -DQ_INTERNAL_
QAPP_SRC -DQT_NO_DEBUG -DQT_NETWORK_LIB -DQT_CORE_LIB -D_LARGEFILE64_SOURCE -D_L
ARGEFILE_SOURCE -I../../mkspecs/qws/linux-x86_64-g++ -I. -I../../include/QtCore
-I../../include/QtNetwork -I../../include -I../../include/QtGui -I.rcc/release-s
tatic-emb-x86_64 -I../3rdparty/harfbuzz/src -Idialogs -I.moc/release-static-emb-
x86_64 -I.uic/release-static-emb-x86_64 -o .obj/release-static-emb-x86_64/qegl_q
ws.o egl/qegl_qws.cpp
moc embedded/qsoundqss_qws.h
moc embedded/qcopchannel_qws.h
moc embedded/qdecorationplugin_qws.h
moc embedded/qdirectpainter_qws.h
moc embedded/qwsmanager_qws.h
moc embedded/qtransportauth_qws.h
embedded/qtransportauth_qws.h:0: Warning: No relevant classes found. No output g
enerated.
moc embedded/qwssocket_qws.h
In file included from ../../include/QtCore/qcoreevent.h:1,
                  from ../../include/QtCore/../../src/corelib/kernel/qcoreapplica
tion.h:46,
                  from ../../include/QtCore/qcoreapplication.h:1,
                  from ../../include/QtGui/../../src/gui/kernel/qapplication.h:45
,
                  from ../../include/QtGui/qapplication.h:1,
                  from egl/qegl_qws.cpp:51:
../../include/QtCore/../../src/corelib/kernel/qcoreevent.h:69: error: expected i
dentifier before numeric constant
../../include/QtCore/../../src/corelib/kernel/qcoreevent.h:69: error: expected '
}' before numeric constant
../../include/QtCore/../../src/corelib/kernel/qcoreevent.h:69: error: expected u
nqualified-id before numeric constant
../../include/QtCore/../../src/corelib/kernel/qcoreevent.h:297: error: expected
')' before 'type'
../../include/QtCore/../../src/corelib/kernel/qcoreevent.h:298: error: declarati
on of '~QEvent' as non-member
../../include/QtCore/../../src/corelib/kernel/qcoreevent.h:299: error: 'Type' do
es not name a type
../../include/QtCore/../../src/corelib/kernel/qcoreevent.h:300: error: non-membe
r function 'bool spontaneous()' cannot have cv-qualifier
../../include/QtCore/../../src/corelib/kernel/qcoreevent.h: In function 'bool sp
ontaneous()':
../../include/QtCore/../../src/corelib/kernel/qcoreevent.h:300: error: 'spont' w
as not declared in this scope
../../include/QtCore/../../src/corelib/kernel/qcoreevent.h: In function 'void se
tAccepted(bool)':
../../include/QtCore/../../src/corelib/kernel/qcoreevent.h:302: error: 'm_accept
' was not declared in this scope
../../include/QtCore/../../src/corelib/kernel/qcoreevent.h: At global scope:
../../include/QtCore/../../src/corelib/kernel/qcoreevent.h:303: error: non-membe
r function 'bool isAccepted()' cannot have cv-qualifier
../../include/QtCore/../../src/corelib/kernel/qcoreevent.h: In function 'bool is
Accepted()':
../../include/QtCore/../../src/corelib/kernel/qcoreevent.h:303: error: 'm_accept
' was not declared in this scope
../../include/QtCore/../../src/corelib/kernel/qcoreevent.h: In function 'void ac
cept()':
../../include/QtCore/../../src/corelib/kernel/qcoreevent.h:305: error: 'm_accept
' was not declared in this scope
../../include/QtCore/../../src/corelib/kernel/qcoreevent.h: In function 'void ig
nore()':
../../include/QtCore/../../src/corelib/kernel/qcoreevent.h:306: error: 'm_accept
' was not declared in this scope
../../include/QtCore/../../src/corelib/kernel/qcoreevent.h: At global scope:
../../include/QtCore/../../src/corelib/kernel/qcoreevent.h:310: error: expected
unqualified-id before 'protected'
../../include/QtCore/../../src/corelib/kernel/qcoreevent.h:314: error: expected
unqualified-id before 'private'
../../include/QtCore/../../src/corelib/kernel/qcoreevent.h:316: error: expected
initializer before ':' token
../../include/QtCore/../../src/corelib/kernel/qcoreevent.h:317: error: expected
initializer before ':' token
../../include/QtCore/../../src/corelib/kernel/qcoreevent.h:318: error: expected
initializer before ':' token
../../include/QtCore/../../src/corelib/kernel/qcoreevent.h:320: error: 'friend'
used outside of class
../../include/QtCore/../../src/corelib/kernel/qcoreevent.h:321: error: 'friend'
used outside of class
../../include/QtCore/../../src/corelib/kernel/qcoreevent.h:322: error: 'friend'
used outside of class
../../include/QtCore/../../src/corelib/kernel/qcoreevent.h:323: error: 'friend'
used outside of class
../../include/QtCore/../../src/corelib/kernel/qcoreevent.h:324: error: 'friend'
used outside of class
../../include/QtCore/../../src/corelib/kernel/qcoreevent.h:325: error: 'friend'
used outside of class
../../include/QtCore/../../src/corelib/kernel/qcoreevent.h:326: error: 'friend'
used outside of class
../../include/QtCore/../../src/corelib/kernel/qcoreevent.h:327: error: 'friend'
used outside of class
../../include/QtCore/../../src/corelib/kernel/qcoreevent.h:328: error: 'friend'
used outside of class
../../include/QtCore/../../src/corelib/kernel/qcoreevent.h:329: error: 'friend'
used outside of class
../../include/QtCore/../../src/corelib/kernel/qcoreevent.h:330: error: 'friend'
used outside of class
../../include/QtCore/../../src/corelib/kernel/qcoreevent.h:331: error: 'friend'
used outside of class
../../include/QtCore/../../src/corelib/kernel/qcoreevent.h:332: error: expected
declaration before '}' token
moc embedded/qwsembedwidget.h
moc embedded/qscreendriverplugin_qws.h
moc embedded/qkbddriverplugin_qws.h
../../include/QtCore/../../src/corelib/kernel/qcoreevent.h:308: warning: 'int re
gisterEventType(int)' declared 'static' but never defined
moc embedded/qmousedriverplugin_qws.h
make: *** [.obj/release-static-emb-x86_64/qegl_qws.o] Error 1
make: *** Waiting for unfinished jobs....
FATAL: oe_runmake failed
ERROR: Function do_compile failed


