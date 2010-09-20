Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1Oxaka-0008Tm-4M
	for openembedded-devel@lists.openembedded.org;
	Mon, 20 Sep 2010 09:25:23 +0200
Received: by pvg6 with SMTP id 6so1178618pvg.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Sep 2010 00:24:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:content-type
	:content-transfer-encoding;
	bh=mL1OxOtGnEEDj7K9eyfhhhAW9+7yzBotnv9LHHWjx/o=;
	b=l/wb1lorL6+Ph12z0FvQxNV8pkgblF1oA8qAsbMnYjo9L/L399BevrlTdIu3yxYXbb
	sHrt//eQd3FMcpdNQhqQkGHTfQlNjFhEj6B1/8/a4V0rKB/xvWC4XJZIPa/de4eAIL7+
	/0KUe5ZnI1aE9TvqIzyokO4daJSJgp8aaXUl4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	b=o9xjakidCyJtmVATNBlhaLEwU9hEDvOOLtPWwUTGOQ+jDZVSO/evjnkieRWBwHS1Uw
	4o8aDl3ZTB+1+DVilrAXJvkEHkzjXm0NXuN12XvB9au0qa5faEXchaVA4F1FdmHdA4ZB
	BRPEv1FBhbk82J+k1Vhetbi0m9bs3VfBteyzg=
Received: by 10.114.130.13 with SMTP id c13mr9576852wad.68.1284967464786;
	Mon, 20 Sep 2010 00:24:24 -0700 (PDT)
Received: from [10.0.0.5] (eth7090.sa.adsl.internode.on.net [150.101.58.177])
	by mx.google.com with ESMTPS id
	q6sm12954040waj.22.2010.09.20.00.24.21
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 20 Sep 2010 00:24:24 -0700 (PDT)
Message-ID: <4C970C21.7020305@gmail.com>
Date: Mon, 20 Sep 2010 16:54:17 +0930
From: Graham Gower <graham.gower@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.12) Gecko/20100909 Thunderbird/3.0.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.175
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] tapioca, farsight: move to obsolete. These recipes are old and unbuildable.
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
X-List-Received-Date: Mon, 20 Sep 2010 07:25:23 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

 * gst-plugins-farsight uses all 6gb of my memory in do_configure.
	Its 4 years old and has been obsoleted upstream.
	http://farsight.freedesktop.org/releases/obsolete/gst-plugins-farsight/OBSOLETE
 * farsight has moved on to version 2, of which there is an in tree recipe.
 * tapioca depends on the obsolete versions and development stalled years ago.

Signed-off-by: Graham Gower <graham.gower@gmail.com>
---
 recipes/farsight/farsight_0.1.5.bb                 |   26 ---
 recipes/farsight/gst-plugins-farsight_0.10.1.bb    |   24 ---
 recipes/obsolete/farsight/farsight_0.1.5.bb        |   26 +++
 .../farsight/gst-plugins-farsight_0.10.1.bb        |   24 +++
 .../fix-host-h-double-install.patch                |   12 ++
 .../gcc-4.5-compilation-fixes.patch                |  202 ++++++++++++++++++++
 .../obsolete/tapioca/libjingle-tapioca_0.3.10.bb   |   16 ++
 recipes/obsolete/tapioca/tapioca-xmpp_0.3.9.bb     |   11 +
 recipes/obsolete/tapioca/tapioca_0.3.9.bb          |   20 ++
 recipes/obsolete/tapioca/tapiocaui_0.3.9.1.bb      |   14 ++
 .../fix-host-h-double-install.patch                |   12 --
 .../gcc-4.5-compilation-fixes.patch                |  202 --------------------
 recipes/tapioca/libjingle-tapioca_0.3.10.bb        |   16 --
 recipes/tapioca/tapioca-xmpp_0.3.9.bb              |   11 -
 recipes/tapioca/tapioca_0.3.9.bb                   |   20 --
 recipes/tapioca/tapiocaui_0.3.9.1.bb               |   14 --
 16 files changed, 325 insertions(+), 325 deletions(-)
 delete mode 100644 recipes/farsight/farsight_0.1.5.bb
 delete mode 100644 recipes/farsight/gst-plugins-farsight_0.10.1.bb
 create mode 100644 recipes/obsolete/farsight/farsight_0.1.5.bb
 create mode 100644 recipes/obsolete/farsight/gst-plugins-farsight_0.10.1.bb
 create mode 100644 recipes/obsolete/tapioca/libjingle-tapioca-0.3.10/fix-host-h-double-install.patch
 create mode 100644 recipes/obsolete/tapioca/libjingle-tapioca-0.3.10/gcc-4.5-compilation-fixes.patch
 create mode 100644 recipes/obsolete/tapioca/libjingle-tapioca_0.3.10.bb
 create mode 100644 recipes/obsolete/tapioca/tapioca-xmpp_0.3.9.bb
 create mode 100644 recipes/obsolete/tapioca/tapioca_0.3.9.bb
 create mode 100644 recipes/obsolete/tapioca/tapiocaui_0.3.9.1.bb
 delete mode 100644 recipes/tapioca/libjingle-tapioca-0.3.10/fix-host-h-double-install.patch
 delete mode 100644 recipes/tapioca/libjingle-tapioca-0.3.10/gcc-4.5-compilation-fixes.patch
 delete mode 100644 recipes/tapioca/libjingle-tapioca_0.3.10.bb
 delete mode 100644 recipes/tapioca/tapioca-xmpp_0.3.9.bb
 delete mode 100644 recipes/tapioca/tapioca_0.3.9.bb
 delete mode 100644 recipes/tapioca/tapiocaui_0.3.9.1.bb

diff --git a/recipes/farsight/farsight_0.1.5.bb b/recipes/farsight/farsight_0.1.5.bb
deleted file mode 100644
index 70e1468..0000000
--- a/recipes/farsight/farsight_0.1.5.bb
+++ /dev/null
@@ -1,26 +0,0 @@
-DESCRIPTION = "FarSight is an audio/video conferencing framework specifically designed for Instant Messengers."
-HOMEPAGE = "http://farsight.sf.net"
-SRC_URI = "http://telepathy.freedesktop.org/releases/farsight/${P}.tar.gz"
-
-
-DEPENDS = "glib-2.0 libxml2 zlib dbus libjingle gstreamer gst-plugins-base"
-
-inherit autotools pkgconfig
-
-EXTRA_OECONF = " \
---disable-debug \
-  --disable-gtk-doc \
-  --disable-sequence-diagrams \
-  --disable-sofia-sip \
-  --enable-jingle-p2p \
-  --disable-gnet \
-  --disable-msnwebcam \
-  --disable-msnavconf \
-  --disable-yahoowebcam \
-  --enable-rtp"
-
-FILES_${PN} += "${libdir}/farsight-0.1/*so"
-FILES_${PN}-dev += "${libdir}/farsight-0.1/*.a ${libdir}/farsight-0.1/*.so.*"
-
-SRC_URI[md5sum] = "2aaf871471a9ec037763c5dc7c193c57"
-SRC_URI[sha256sum] = "6b9785167934948a582839f9723e37214cab1607a9764c35f10d555f8e662575"
diff --git a/recipes/farsight/gst-plugins-farsight_0.10.1.bb b/recipes/farsight/gst-plugins-farsight_0.10.1.bb
deleted file mode 100644
index 0c390e5..0000000
--- a/recipes/farsight/gst-plugins-farsight_0.10.1.bb
+++ /dev/null
@@ -1,24 +0,0 @@
-DESCRIPTION = "FarSight is an audio/video conferencing framework specifically designed for Instant Messengers."
-HOMEPAGE = "http://farsight.sf.net"
-SRC_URI = "http://telepathy.freedesktop.org/releases/gst-plugins-farsight/${P}.tar.gz"
-
-
-DEPENDS = "glib-2.0 libxml2 zlib dbus libjingle gstreamer gst-plugins-base"
-
-inherit autotools pkgconfig
-
-EXTRA_OECONF = " \
---disable-debug \
-   --disable-jrtplib \
-   --disable-mimic \
-   --disable-gsm \
-   --disable-jasper \
-   --enable-jingle-p2p \
-   --with-plugins=rtpdemux,rtpjitterbuffer"
-
-
-FILES_${PN} += "${libdir}/gstreamer-0.10/*so"
-FILES_${PN}-dev += "${libdir}/gstreamer-0.10/*.a ${libdir}/gstreamer-0.10/*.so.*"
-
-SRC_URI[md5sum] = "578ef83efd03124e7085abe719513bac"
-SRC_URI[sha256sum] = "623e187f87037a690b5d0beef5991b3f2a58bb5058fad8c75329f48f0b07da4b"
diff --git a/recipes/obsolete/farsight/farsight_0.1.5.bb b/recipes/obsolete/farsight/farsight_0.1.5.bb
new file mode 100644
index 0000000..70e1468
--- /dev/null
+++ b/recipes/obsolete/farsight/farsight_0.1.5.bb
@@ -0,0 +1,26 @@
+DESCRIPTION = "FarSight is an audio/video conferencing framework specifically designed for Instant Messengers."
+HOMEPAGE = "http://farsight.sf.net"
+SRC_URI = "http://telepathy.freedesktop.org/releases/farsight/${P}.tar.gz"
+
+
+DEPENDS = "glib-2.0 libxml2 zlib dbus libjingle gstreamer gst-plugins-base"
+
+inherit autotools pkgconfig
+
+EXTRA_OECONF = " \
+--disable-debug \
+  --disable-gtk-doc \
+  --disable-sequence-diagrams \
+  --disable-sofia-sip \
+  --enable-jingle-p2p \
+  --disable-gnet \
+  --disable-msnwebcam \
+  --disable-msnavconf \
+  --disable-yahoowebcam \
+  --enable-rtp"
+
+FILES_${PN} += "${libdir}/farsight-0.1/*so"
+FILES_${PN}-dev += "${libdir}/farsight-0.1/*.a ${libdir}/farsight-0.1/*.so.*"
+
+SRC_URI[md5sum] = "2aaf871471a9ec037763c5dc7c193c57"
+SRC_URI[sha256sum] = "6b9785167934948a582839f9723e37214cab1607a9764c35f10d555f8e662575"
diff --git a/recipes/obsolete/farsight/gst-plugins-farsight_0.10.1.bb b/recipes/obsolete/farsight/gst-plugins-farsight_0.10.1.bb
new file mode 100644
index 0000000..0c390e5
--- /dev/null
+++ b/recipes/obsolete/farsight/gst-plugins-farsight_0.10.1.bb
@@ -0,0 +1,24 @@
+DESCRIPTION = "FarSight is an audio/video conferencing framework specifically designed for Instant Messengers."
+HOMEPAGE = "http://farsight.sf.net"
+SRC_URI = "http://telepathy.freedesktop.org/releases/gst-plugins-farsight/${P}.tar.gz"
+
+
+DEPENDS = "glib-2.0 libxml2 zlib dbus libjingle gstreamer gst-plugins-base"
+
+inherit autotools pkgconfig
+
+EXTRA_OECONF = " \
+--disable-debug \
+   --disable-jrtplib \
+   --disable-mimic \
+   --disable-gsm \
+   --disable-jasper \
+   --enable-jingle-p2p \
+   --with-plugins=rtpdemux,rtpjitterbuffer"
+
+
+FILES_${PN} += "${libdir}/gstreamer-0.10/*so"
+FILES_${PN}-dev += "${libdir}/gstreamer-0.10/*.a ${libdir}/gstreamer-0.10/*.so.*"
+
+SRC_URI[md5sum] = "578ef83efd03124e7085abe719513bac"
+SRC_URI[sha256sum] = "623e187f87037a690b5d0beef5991b3f2a58bb5058fad8c75329f48f0b07da4b"
diff --git a/recipes/obsolete/tapioca/libjingle-tapioca-0.3.10/fix-host-h-double-install.patch b/recipes/obsolete/tapioca/libjingle-tapioca-0.3.10/fix-host-h-double-install.patch
new file mode 100644
index 0000000..b991155
--- /dev/null
+++ b/recipes/obsolete/tapioca/libjingle-tapioca-0.3.10/fix-host-h-double-install.patch
@@ -0,0 +1,12 @@
+Index: libjingle-0.3.10/talk/base/Makefile.am
+===================================================================
+--- libjingle-0.3.10.orig/talk/base/Makefile.am	2006-09-01 04:31:53.000000000 -0700
++++ libjingle-0.3.10/talk/base/Makefile.am	2010-09-15 13:33:14.465210001 -0700
+@@ -62,7 +62,6 @@ libjinglebase_@LIBJINGLE_MAJORMINOR@incl
+                             winping.h \
+                             socketadapters.h \
+                             socketaddress.h \
+-                            host.h \
+                             socketaddresspair.h \
+                             Equifax_Secure_Global_eBusiness_CA-1.h \
+                             stream.h \
diff --git a/recipes/obsolete/tapioca/libjingle-tapioca-0.3.10/gcc-4.5-compilation-fixes.patch b/recipes/obsolete/tapioca/libjingle-tapioca-0.3.10/gcc-4.5-compilation-fixes.patch
new file mode 100644
index 0000000..57db093
--- /dev/null
+++ b/recipes/obsolete/tapioca/libjingle-tapioca-0.3.10/gcc-4.5-compilation-fixes.patch
@@ -0,0 +1,202 @@
+Index: libjingle-0.3.10/talk/base/asynctcpsocket.cc
+===================================================================
+--- libjingle-0.3.10.orig/talk/base/asynctcpsocket.cc	2006-09-01 04:31:52.000000000 -0700
++++ libjingle-0.3.10/talk/base/asynctcpsocket.cc	2010-09-15 12:57:34.485210001 -0700
+@@ -45,6 +45,7 @@ extern "C" {
+ }
+ #endif // POSIX
+ 
++#include <cstring>
+ namespace cricket {
+ 
+ const size_t MAX_PACKET_SIZE = 64 * 1024;
+Index: libjingle-0.3.10/talk/base/bytebuffer.cc
+===================================================================
+--- libjingle-0.3.10.orig/talk/base/bytebuffer.cc	2006-09-01 04:31:53.000000000 -0700
++++ libjingle-0.3.10/talk/base/bytebuffer.cc	2010-09-15 12:52:40.005210002 -0700
+@@ -30,6 +30,7 @@
+ #include "talk/base/byteorder.h"
+ #include <algorithm>
+ #include <cassert>
++#include <cstring>
+ 
+ #if defined(_MSC_VER) && _MSC_VER < 1300
+ namespace std {
+Index: libjingle-0.3.10/talk/base/host.cc
+===================================================================
+--- libjingle-0.3.10.orig/talk/base/host.cc	2006-09-01 04:31:53.000000000 -0700
++++ libjingle-0.3.10/talk/base/host.cc	2010-09-15 13:08:51.945210000 -0700
+@@ -33,6 +33,7 @@
+ #include <iostream>
+ #include <cassert>
+ #include <errno.h>
++#include <cstdlib>
+ 
+ #if defined(_MSC_VER) && _MSC_VER < 1300
+ namespace std {
+Index: libjingle-0.3.10/talk/base/logging.cc
+===================================================================
+--- libjingle-0.3.10.orig/talk/base/logging.cc	2006-09-01 04:31:52.000000000 -0700
++++ libjingle-0.3.10/talk/base/logging.cc	2010-09-15 13:14:46.475210002 -0700
+@@ -33,6 +33,8 @@
+ 
+ #include <iostream>
+ #include <iomanip>
++#include <cstring>
++#include <cstdio>
+ 
+ #include "talk/base/logging.h"
+ #include "talk/base/stream.h"
+Index: libjingle-0.3.10/talk/base/messagequeue.h
+===================================================================
+--- libjingle-0.3.10.orig/talk/base/messagequeue.h	2010-09-15 12:48:43.000000000 -0700
++++ libjingle-0.3.10/talk/base/messagequeue.h	2010-09-15 12:50:06.225210002 -0700
+@@ -35,6 +35,7 @@
+ #include <vector>
+ #include <queue>
+ #include <algorithm>
++#include <cstring>
+ 
+ namespace cricket {
+ 
+Index: libjingle-0.3.10/talk/base/physicalsocketserver.cc
+===================================================================
+--- libjingle-0.3.10.orig/talk/base/physicalsocketserver.cc	2006-09-01 04:31:52.000000000 -0700
++++ libjingle-0.3.10/talk/base/physicalsocketserver.cc	2010-09-15 13:05:45.445210001 -0700
+@@ -37,6 +37,7 @@ extern "C" {
+ #include <fcntl.h>
+ #include <sys/time.h>
+ #include <unistd.h>
++#include <string.h>
+ }
+ #endif
+ 
+@@ -50,6 +51,8 @@ extern "C" {
+ 
+ #ifdef __linux 
+ #define IP_MTU 14 // Until this is integrated from linux/in.h to netinet/in.h
++#include <cstdio>
++#include <algorithm>
+ #endif  // __linux
+ 
+ #ifdef WIN32
+@@ -61,7 +64,6 @@ extern "C" {
+ 
+ #include <algorithm>
+ #include <iostream>
+-
+ class WinsockInitializer {
+ public:
+   WinsockInitializer() {
+Index: libjingle-0.3.10/talk/base/protocolinfo.cc
+===================================================================
+--- libjingle-0.3.10.orig/talk/base/protocolinfo.cc	2006-09-01 04:31:53.000000000 -0700
++++ libjingle-0.3.10/talk/base/protocolinfo.cc	2010-09-15 13:11:47.815210002 -0700
+@@ -28,7 +28,7 @@
+  */
+ 
+ #include "talk/base/protocolinfo.h"
+-
++#include <cstring>
+ namespace cricket {
+ 
+ static const char * const PROTO_NAMES[PROTO_LAST+1] = { "udp", "tcp", "ssltcp" };
+Index: libjingle-0.3.10/talk/base/socketadapters.cc
+===================================================================
+--- libjingle-0.3.10.orig/talk/base/socketadapters.cc	2006-09-01 04:31:53.000000000 -0700
++++ libjingle-0.3.10/talk/base/socketadapters.cc	2010-09-15 13:02:10.245210000 -0700
+@@ -42,6 +42,7 @@
+ #endif
+ 
+ #include <cassert>
++#include <cstring>
+ 
+ #include "talk/base/base64.h"
+ #include "talk/base/basicdefs.h"
+Index: libjingle-0.3.10/talk/base/stream.cc
+===================================================================
+--- libjingle-0.3.10.orig/talk/base/stream.cc	2006-09-01 04:31:53.000000000 -0700
++++ libjingle-0.3.10/talk/base/stream.cc	2010-09-15 13:13:51.255210002 -0700
+@@ -29,6 +29,8 @@
+ #include <sys/stat.h>
+ #include <errno.h>
+ #include <string>
++#include <cstdio>
++#include <cstring>
+ #include "talk/base/basictypes.h"
+ #include "talk/base/common.h"
+ #include "talk/base/stream.h"
+Index: libjingle-0.3.10/talk/base/stringutils.h
+===================================================================
+--- libjingle-0.3.10.orig/talk/base/stringutils.h	2006-09-01 04:31:52.000000000 -0700
++++ libjingle-0.3.10/talk/base/stringutils.h	2010-09-15 13:09:40.695210000 -0700
+@@ -36,6 +36,7 @@
+ #endif  // WIN32
+ 
+ #include <string>
++#include <cstring>
+ 
+ ///////////////////////////////////////////////////////////////////////////////
+ // Rename a bunch of common string functions so they are consistent across
+Index: libjingle-0.3.10/talk/base/xmpppassword.h
+===================================================================
+--- libjingle-0.3.10.orig/talk/base/xmpppassword.h	2006-09-01 04:31:52.000000000 -0700
++++ libjingle-0.3.10/talk/base/xmpppassword.h	2010-09-15 13:10:33.105210000 -0700
+@@ -30,7 +30,7 @@
+ 
+ #include "talk/base/linked_ptr.h"
+ #include "talk/base/scoped_ptr.h"
+-
++#include <cstring>
+ namespace buzz {
+ 
+ class XmppPasswordImpl {
+Index: libjingle-0.3.10/talk/p2p/base/pseudotcp.cc
+===================================================================
+--- libjingle-0.3.10.orig/talk/p2p/base/pseudotcp.cc	2006-09-01 04:31:51.000000000 -0700
++++ libjingle-0.3.10/talk/p2p/base/pseudotcp.cc	2010-09-15 13:17:33.135210000 -0700
+@@ -52,6 +52,8 @@ extern "C" {
+ }
+ #endif // POSIX
+ 
++#include <cstring>
++#include <cstdlib>
+ namespace cricket {
+ 
+ //////////////////////////////////////////////////////////////////////
+Index: libjingle-0.3.10/talk/p2p/base/stun.cc
+===================================================================
+--- libjingle-0.3.10.orig/talk/p2p/base/stun.cc	2006-09-01 04:31:51.000000000 -0700
++++ libjingle-0.3.10/talk/p2p/base/stun.cc	2010-09-15 13:16:30.845210000 -0700
+@@ -29,6 +29,7 @@
+ #include "talk/p2p/base/stun.h"
+ #include <iostream>
+ #include <cassert>
++#include <cstring>
+ 
+ #if defined(_MSC_VER) && _MSC_VER < 1300
+ namespace std {
+Index: libjingle-0.3.10/talk/p2p/base/stunserver.cc
+===================================================================
+--- libjingle-0.3.10.orig/talk/p2p/base/stunserver.cc	2006-09-01 04:31:51.000000000 -0700
++++ libjingle-0.3.10/talk/p2p/base/stunserver.cc	2010-09-15 13:18:10.045210001 -0700
+@@ -28,6 +28,7 @@
+ #include "talk/base/bytebuffer.h"
+ #include "talk/p2p/base/stunserver.h"
+ #include <iostream>
++#include <cstring>
+ 
+ #ifdef POSIX
+ extern "C" {
+Index: libjingle-0.3.10/talk/xmpp/xmpplogintask.cc
+===================================================================
+--- libjingle-0.3.10.orig/talk/xmpp/xmpplogintask.cc	2006-09-01 04:31:52.000000000 -0700
++++ libjingle-0.3.10/talk/xmpp/xmpplogintask.cc	2010-09-15 13:15:44.185209999 -0700
+@@ -35,6 +35,7 @@
+ 
+ #include <iostream>
+ #include <string>
++#include <cstdio>
+ #include <vector>
+ #ifdef SSL_USE_OPENSSL
+ #include <openssl/sha.h>
diff --git a/recipes/obsolete/tapioca/libjingle-tapioca_0.3.10.bb b/recipes/obsolete/tapioca/libjingle-tapioca_0.3.10.bb
new file mode 100644
index 0000000..f734e82
--- /dev/null
+++ b/recipes/obsolete/tapioca/libjingle-tapioca_0.3.10.bb
@@ -0,0 +1,16 @@
+LICENSE = "BERKLEY"
+DEPENDS = "openssl ortp speex expat"
+PROVIDES = "libjingle"
+PR = "r1"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/tapioca-voip/libjingle-${PV}.tar.gz \
+           file://gcc-4.5-compilation-fixes.patch \
+           file://fix-host-h-double-install.patch \
+          "
+
+S = "${WORKDIR}/libjingle-${PV}"
+
+inherit autotools pkgconfig
+
+SRC_URI[md5sum] = "7ee7d8c834f1e06093130a86cbb9e79a"
+SRC_URI[sha256sum] = "3453c1426fdc06b32bc5f4e7d3ce039ec7f38f0fa4018d505e515099b209dd25"
diff --git a/recipes/obsolete/tapioca/tapioca-xmpp_0.3.9.bb b/recipes/obsolete/tapioca/tapioca-xmpp_0.3.9.bb
new file mode 100644
index 0000000..860ebd0
--- /dev/null
+++ b/recipes/obsolete/tapioca/tapioca-xmpp_0.3.9.bb
@@ -0,0 +1,11 @@
+HOMEPAGE = "http://tapioca-voip.sourceforge.net/wiki/index.php/Tapioca"
+LICENSE = "LGPL"
+DEPENDS = "glib-2.0 dbus libjingle openssl tapioca"
+inherit autotools pkgconfig
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/tapioca-voip/${P}.tar.gz"
+
+FILES_${PN} += "${datadir}/dbus* ${datadir}/tapioca* "
+
+SRC_URI[md5sum] = "8d810351eb5b30e70b202e067da450c1"
+SRC_URI[sha256sum] = "51dd2ecda515e5872971cf80216915492686f5a5c9745e12ba1b3c5aec826fce"
diff --git a/recipes/obsolete/tapioca/tapioca_0.3.9.bb b/recipes/obsolete/tapioca/tapioca_0.3.9.bb
new file mode 100644
index 0000000..ef0b21d
--- /dev/null
+++ b/recipes/obsolete/tapioca/tapioca_0.3.9.bb
@@ -0,0 +1,20 @@
+HOMEPAGE = "http://tapioca-voip.sourceforge.net/wiki/index.php/Tapioca"
+LICENSE = "LGPL"
+DEPENDS = "glib-2.0 dbus"
+
+inherit autotools pkgconfig
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/tapioca-voip/${P}.tar.gz"
+FILES_${PN} += "${datadir}/dbus*"
+
+do_stage () {
+	autotools_stage_all
+	install -d ${STAGING_INCDIR}/tapioca/core/
+	install -d ${STAGING_INCDIR}/tapioca/client/
+
+	install -m 644 tapioca/core/*.h ${STAGING_INCDIR}/tapioca/core/
+	install -m 644 tapioca/client/*.h ${STAGING_INCDIR}/tapioca/client/
+}
+
+SRC_URI[md5sum] = "e88c400394c092c2688bb2d490c80ccb"
+SRC_URI[sha256sum] = "fb89ac4e8578adc140e19cb4929b200d2898e5a8373230f500c16e59c803cba1"
diff --git a/recipes/obsolete/tapioca/tapiocaui_0.3.9.1.bb b/recipes/obsolete/tapioca/tapiocaui_0.3.9.1.bb
new file mode 100644
index 0000000..1c93434
--- /dev/null
+++ b/recipes/obsolete/tapioca/tapiocaui_0.3.9.1.bb
@@ -0,0 +1,14 @@
+HOMEPAGE = "http://tapioca-voip.sourceforge.net/wiki/index.php/Tapioca"
+LICENSE = "LGPL"
+DEPENDS = "gtk+ glib-2.0 dbus gconf tapioca-xmpp tapioca farsight gst-plugins-farsight"
+RDEPENDS_${PN} = "tapioca-xmpp"
+PR = "r1"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/tapioca-voip/${P}.tar.gz"
+
+inherit autotools pkgconfig
+
+FILES_${PN} += "${datadir}/dbus*"
+
+SRC_URI[md5sum] = "2b0fc6997e793784763fe23c81a4986f"
+SRC_URI[sha256sum] = "d83dca75ba6088c90b993de9d30b4b0d3189e5efa84151c16d55ef0ec072c38a"
diff --git a/recipes/tapioca/libjingle-tapioca-0.3.10/fix-host-h-double-install.patch b/recipes/tapioca/libjingle-tapioca-0.3.10/fix-host-h-double-install.patch
deleted file mode 100644
index b991155..0000000
--- a/recipes/tapioca/libjingle-tapioca-0.3.10/fix-host-h-double-install.patch
+++ /dev/null
@@ -1,12 +0,0 @@
-Index: libjingle-0.3.10/talk/base/Makefile.am
-===================================================================
---- libjingle-0.3.10.orig/talk/base/Makefile.am	2006-09-01 04:31:53.000000000 -0700
-+++ libjingle-0.3.10/talk/base/Makefile.am	2010-09-15 13:33:14.465210001 -0700
-@@ -62,7 +62,6 @@ libjinglebase_@LIBJINGLE_MAJORMINOR@incl
-                             winping.h \
-                             socketadapters.h \
-                             socketaddress.h \
--                            host.h \
-                             socketaddresspair.h \
-                             Equifax_Secure_Global_eBusiness_CA-1.h \
-                             stream.h \
diff --git a/recipes/tapioca/libjingle-tapioca-0.3.10/gcc-4.5-compilation-fixes.patch b/recipes/tapioca/libjingle-tapioca-0.3.10/gcc-4.5-compilation-fixes.patch
deleted file mode 100644
index 57db093..0000000
--- a/recipes/tapioca/libjingle-tapioca-0.3.10/gcc-4.5-compilation-fixes.patch
+++ /dev/null
@@ -1,202 +0,0 @@
-Index: libjingle-0.3.10/talk/base/asynctcpsocket.cc
-===================================================================
---- libjingle-0.3.10.orig/talk/base/asynctcpsocket.cc	2006-09-01 04:31:52.000000000 -0700
-+++ libjingle-0.3.10/talk/base/asynctcpsocket.cc	2010-09-15 12:57:34.485210001 -0700
-@@ -45,6 +45,7 @@ extern "C" {
- }
- #endif // POSIX
- 
-+#include <cstring>
- namespace cricket {
- 
- const size_t MAX_PACKET_SIZE = 64 * 1024;
-Index: libjingle-0.3.10/talk/base/bytebuffer.cc
-===================================================================
---- libjingle-0.3.10.orig/talk/base/bytebuffer.cc	2006-09-01 04:31:53.000000000 -0700
-+++ libjingle-0.3.10/talk/base/bytebuffer.cc	2010-09-15 12:52:40.005210002 -0700
-@@ -30,6 +30,7 @@
- #include "talk/base/byteorder.h"
- #include <algorithm>
- #include <cassert>
-+#include <cstring>
- 
- #if defined(_MSC_VER) && _MSC_VER < 1300
- namespace std {
-Index: libjingle-0.3.10/talk/base/host.cc
-===================================================================
---- libjingle-0.3.10.orig/talk/base/host.cc	2006-09-01 04:31:53.000000000 -0700
-+++ libjingle-0.3.10/talk/base/host.cc	2010-09-15 13:08:51.945210000 -0700
-@@ -33,6 +33,7 @@
- #include <iostream>
- #include <cassert>
- #include <errno.h>
-+#include <cstdlib>
- 
- #if defined(_MSC_VER) && _MSC_VER < 1300
- namespace std {
-Index: libjingle-0.3.10/talk/base/logging.cc
-===================================================================
---- libjingle-0.3.10.orig/talk/base/logging.cc	2006-09-01 04:31:52.000000000 -0700
-+++ libjingle-0.3.10/talk/base/logging.cc	2010-09-15 13:14:46.475210002 -0700
-@@ -33,6 +33,8 @@
- 
- #include <iostream>
- #include <iomanip>
-+#include <cstring>
-+#include <cstdio>
- 
- #include "talk/base/logging.h"
- #include "talk/base/stream.h"
-Index: libjingle-0.3.10/talk/base/messagequeue.h
-===================================================================
---- libjingle-0.3.10.orig/talk/base/messagequeue.h	2010-09-15 12:48:43.000000000 -0700
-+++ libjingle-0.3.10/talk/base/messagequeue.h	2010-09-15 12:50:06.225210002 -0700
-@@ -35,6 +35,7 @@
- #include <vector>
- #include <queue>
- #include <algorithm>
-+#include <cstring>
- 
- namespace cricket {
- 
-Index: libjingle-0.3.10/talk/base/physicalsocketserver.cc
-===================================================================
---- libjingle-0.3.10.orig/talk/base/physicalsocketserver.cc	2006-09-01 04:31:52.000000000 -0700
-+++ libjingle-0.3.10/talk/base/physicalsocketserver.cc	2010-09-15 13:05:45.445210001 -0700
-@@ -37,6 +37,7 @@ extern "C" {
- #include <fcntl.h>
- #include <sys/time.h>
- #include <unistd.h>
-+#include <string.h>
- }
- #endif
- 
-@@ -50,6 +51,8 @@ extern "C" {
- 
- #ifdef __linux 
- #define IP_MTU 14 // Until this is integrated from linux/in.h to netinet/in.h
-+#include <cstdio>
-+#include <algorithm>
- #endif  // __linux
- 
- #ifdef WIN32
-@@ -61,7 +64,6 @@ extern "C" {
- 
- #include <algorithm>
- #include <iostream>
--
- class WinsockInitializer {
- public:
-   WinsockInitializer() {
-Index: libjingle-0.3.10/talk/base/protocolinfo.cc
-===================================================================
---- libjingle-0.3.10.orig/talk/base/protocolinfo.cc	2006-09-01 04:31:53.000000000 -0700
-+++ libjingle-0.3.10/talk/base/protocolinfo.cc	2010-09-15 13:11:47.815210002 -0700
-@@ -28,7 +28,7 @@
-  */
- 
- #include "talk/base/protocolinfo.h"
--
-+#include <cstring>
- namespace cricket {
- 
- static const char * const PROTO_NAMES[PROTO_LAST+1] = { "udp", "tcp", "ssltcp" };
-Index: libjingle-0.3.10/talk/base/socketadapters.cc
-===================================================================
---- libjingle-0.3.10.orig/talk/base/socketadapters.cc	2006-09-01 04:31:53.000000000 -0700
-+++ libjingle-0.3.10/talk/base/socketadapters.cc	2010-09-15 13:02:10.245210000 -0700
-@@ -42,6 +42,7 @@
- #endif
- 
- #include <cassert>
-+#include <cstring>
- 
- #include "talk/base/base64.h"
- #include "talk/base/basicdefs.h"
-Index: libjingle-0.3.10/talk/base/stream.cc
-===================================================================
---- libjingle-0.3.10.orig/talk/base/stream.cc	2006-09-01 04:31:53.000000000 -0700
-+++ libjingle-0.3.10/talk/base/stream.cc	2010-09-15 13:13:51.255210002 -0700
-@@ -29,6 +29,8 @@
- #include <sys/stat.h>
- #include <errno.h>
- #include <string>
-+#include <cstdio>
-+#include <cstring>
- #include "talk/base/basictypes.h"
- #include "talk/base/common.h"
- #include "talk/base/stream.h"
-Index: libjingle-0.3.10/talk/base/stringutils.h
-===================================================================
---- libjingle-0.3.10.orig/talk/base/stringutils.h	2006-09-01 04:31:52.000000000 -0700
-+++ libjingle-0.3.10/talk/base/stringutils.h	2010-09-15 13:09:40.695210000 -0700
-@@ -36,6 +36,7 @@
- #endif  // WIN32
- 
- #include <string>
-+#include <cstring>
- 
- ///////////////////////////////////////////////////////////////////////////////
- // Rename a bunch of common string functions so they are consistent across
-Index: libjingle-0.3.10/talk/base/xmpppassword.h
-===================================================================
---- libjingle-0.3.10.orig/talk/base/xmpppassword.h	2006-09-01 04:31:52.000000000 -0700
-+++ libjingle-0.3.10/talk/base/xmpppassword.h	2010-09-15 13:10:33.105210000 -0700
-@@ -30,7 +30,7 @@
- 
- #include "talk/base/linked_ptr.h"
- #include "talk/base/scoped_ptr.h"
--
-+#include <cstring>
- namespace buzz {
- 
- class XmppPasswordImpl {
-Index: libjingle-0.3.10/talk/p2p/base/pseudotcp.cc
-===================================================================
---- libjingle-0.3.10.orig/talk/p2p/base/pseudotcp.cc	2006-09-01 04:31:51.000000000 -0700
-+++ libjingle-0.3.10/talk/p2p/base/pseudotcp.cc	2010-09-15 13:17:33.135210000 -0700
-@@ -52,6 +52,8 @@ extern "C" {
- }
- #endif // POSIX
- 
-+#include <cstring>
-+#include <cstdlib>
- namespace cricket {
- 
- //////////////////////////////////////////////////////////////////////
-Index: libjingle-0.3.10/talk/p2p/base/stun.cc
-===================================================================
---- libjingle-0.3.10.orig/talk/p2p/base/stun.cc	2006-09-01 04:31:51.000000000 -0700
-+++ libjingle-0.3.10/talk/p2p/base/stun.cc	2010-09-15 13:16:30.845210000 -0700
-@@ -29,6 +29,7 @@
- #include "talk/p2p/base/stun.h"
- #include <iostream>
- #include <cassert>
-+#include <cstring>
- 
- #if defined(_MSC_VER) && _MSC_VER < 1300
- namespace std {
-Index: libjingle-0.3.10/talk/p2p/base/stunserver.cc
-===================================================================
---- libjingle-0.3.10.orig/talk/p2p/base/stunserver.cc	2006-09-01 04:31:51.000000000 -0700
-+++ libjingle-0.3.10/talk/p2p/base/stunserver.cc	2010-09-15 13:18:10.045210001 -0700
-@@ -28,6 +28,7 @@
- #include "talk/base/bytebuffer.h"
- #include "talk/p2p/base/stunserver.h"
- #include <iostream>
-+#include <cstring>
- 
- #ifdef POSIX
- extern "C" {
-Index: libjingle-0.3.10/talk/xmpp/xmpplogintask.cc
-===================================================================
---- libjingle-0.3.10.orig/talk/xmpp/xmpplogintask.cc	2006-09-01 04:31:52.000000000 -0700
-+++ libjingle-0.3.10/talk/xmpp/xmpplogintask.cc	2010-09-15 13:15:44.185209999 -0700
-@@ -35,6 +35,7 @@
- 
- #include <iostream>
- #include <string>
-+#include <cstdio>
- #include <vector>
- #ifdef SSL_USE_OPENSSL
- #include <openssl/sha.h>
diff --git a/recipes/tapioca/libjingle-tapioca_0.3.10.bb b/recipes/tapioca/libjingle-tapioca_0.3.10.bb
deleted file mode 100644
index f734e82..0000000
--- a/recipes/tapioca/libjingle-tapioca_0.3.10.bb
+++ /dev/null
@@ -1,16 +0,0 @@
-LICENSE = "BERKLEY"
-DEPENDS = "openssl ortp speex expat"
-PROVIDES = "libjingle"
-PR = "r1"
-
-SRC_URI = "${SOURCEFORGE_MIRROR}/tapioca-voip/libjingle-${PV}.tar.gz \
-           file://gcc-4.5-compilation-fixes.patch \
-           file://fix-host-h-double-install.patch \
-          "
-
-S = "${WORKDIR}/libjingle-${PV}"
-
-inherit autotools pkgconfig
-
-SRC_URI[md5sum] = "7ee7d8c834f1e06093130a86cbb9e79a"
-SRC_URI[sha256sum] = "3453c1426fdc06b32bc5f4e7d3ce039ec7f38f0fa4018d505e515099b209dd25"
diff --git a/recipes/tapioca/tapioca-xmpp_0.3.9.bb b/recipes/tapioca/tapioca-xmpp_0.3.9.bb
deleted file mode 100644
index 860ebd0..0000000
--- a/recipes/tapioca/tapioca-xmpp_0.3.9.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-HOMEPAGE = "http://tapioca-voip.sourceforge.net/wiki/index.php/Tapioca"
-LICENSE = "LGPL"
-DEPENDS = "glib-2.0 dbus libjingle openssl tapioca"
-inherit autotools pkgconfig
-
-SRC_URI = "${SOURCEFORGE_MIRROR}/tapioca-voip/${P}.tar.gz"
-
-FILES_${PN} += "${datadir}/dbus* ${datadir}/tapioca* "
-
-SRC_URI[md5sum] = "8d810351eb5b30e70b202e067da450c1"
-SRC_URI[sha256sum] = "51dd2ecda515e5872971cf80216915492686f5a5c9745e12ba1b3c5aec826fce"
diff --git a/recipes/tapioca/tapioca_0.3.9.bb b/recipes/tapioca/tapioca_0.3.9.bb
deleted file mode 100644
index ef0b21d..0000000
--- a/recipes/tapioca/tapioca_0.3.9.bb
+++ /dev/null
@@ -1,20 +0,0 @@
-HOMEPAGE = "http://tapioca-voip.sourceforge.net/wiki/index.php/Tapioca"
-LICENSE = "LGPL"
-DEPENDS = "glib-2.0 dbus"
-
-inherit autotools pkgconfig
-
-SRC_URI = "${SOURCEFORGE_MIRROR}/tapioca-voip/${P}.tar.gz"
-FILES_${PN} += "${datadir}/dbus*"
-
-do_stage () {
-	autotools_stage_all
-	install -d ${STAGING_INCDIR}/tapioca/core/
-	install -d ${STAGING_INCDIR}/tapioca/client/
-
-	install -m 644 tapioca/core/*.h ${STAGING_INCDIR}/tapioca/core/
-	install -m 644 tapioca/client/*.h ${STAGING_INCDIR}/tapioca/client/
-}
-
-SRC_URI[md5sum] = "e88c400394c092c2688bb2d490c80ccb"
-SRC_URI[sha256sum] = "fb89ac4e8578adc140e19cb4929b200d2898e5a8373230f500c16e59c803cba1"
diff --git a/recipes/tapioca/tapiocaui_0.3.9.1.bb b/recipes/tapioca/tapiocaui_0.3.9.1.bb
deleted file mode 100644
index 1c93434..0000000
--- a/recipes/tapioca/tapiocaui_0.3.9.1.bb
+++ /dev/null
@@ -1,14 +0,0 @@
-HOMEPAGE = "http://tapioca-voip.sourceforge.net/wiki/index.php/Tapioca"
-LICENSE = "LGPL"
-DEPENDS = "gtk+ glib-2.0 dbus gconf tapioca-xmpp tapioca farsight gst-plugins-farsight"
-RDEPENDS_${PN} = "tapioca-xmpp"
-PR = "r1"
-
-SRC_URI = "${SOURCEFORGE_MIRROR}/tapioca-voip/${P}.tar.gz"
-
-inherit autotools pkgconfig
-
-FILES_${PN} += "${datadir}/dbus*"
-
-SRC_URI[md5sum] = "2b0fc6997e793784763fe23c81a4986f"
-SRC_URI[sha256sum] = "d83dca75ba6088c90b993de9d30b4b0d3189e5efa84151c16d55ef0ec072c38a"
-- 
1.7.1



