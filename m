Received: from [91.121.26.226] (helo=2.mail-out.ovh.net)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <eric@eukrea.com>) id 1MkHCp-0000zM-64
	for openembedded-devel@openembedded.org; Sun, 06 Sep 2009 14:50:55 +0200
Received: (qmail 28162 invoked by uid 503); 6 Sep 2009 14:46:04 -0000
Received: from b9.ovh.net (HELO mail175.ha.ovh.net) (213.186.33.59)
	by 2.mail-out.ovh.net with SMTP; 6 Sep 2009 14:46:04 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 6 Sep 2009 12:35:37 -0000
Received: from tal33-2-82-228-175-43.fbx.proxad.net (HELO ?192.168.1.13?)
	(ebenard%eukrea.com@82.228.175.43)
	by ns0.ovh.net with SMTP; 6 Sep 2009 12:35:36 -0000
Message-ID: <4AA3ABA8.304@eukrea.com>
Date: Sun, 06 Sep 2009 14:31:36 +0200
From: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
User-Agent: Thunderbird 2.0.0.23 (X11/20090817)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-Ovh-Tracer-Id: 12436690371293654345
X-Ovh-Remote: 82.228.175.43 (tal33-2-82-228-175-43.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-Spam-Check: DONE|U 0.5/N
Subject: qt4-embedded & tslib
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
X-List-Received-Date: Sun, 06 Sep 2009 12:50:56 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

in order to get gt4-embedded working with tslib, I had to do the 
following change.
Without this, tslib loads properly the module_raw (input in my case) but 
none of the module (pthres, linear & co) defined in ts.conf (despite the 
fact ts_test & co are running fine).

Eric

diff --git a/recipes/qt4/qt4-embedded.inc b/recipes/qt4/qt4-embedded.inc
index 95b770a..91b2a6b 100644
--- a/recipes/qt4/qt4-embedded.inc
+++ b/recipes/qt4/qt4-embedded.inc
@@ -4,7 +4,7 @@ LICENSE = "GPL QPL"
  PRIORITY = "optional"
  HOMEPAGE = "http://www.trolltech.com"
  DEPENDS += "directfb tslib"
-INC_PR = "r14"
+INC_PR = "r15"

  QT_BASE_NAME ?= "qt4-embedded"
  QT_BASE_LIB  ?= "libqt-embedded"
@@ -30,7 +30,7 @@ QT_CONFIG_FLAGS += " \
      -qtlibinfix ${QT_LIBINFIX} \
      -qt-decoration-styled -plugin-decoration-default 
-plugin-decoration-windows \
      -plugin-gfx-transformed -plugin-gfx-qvfb -plugin-gfx-vnc 
-plugin-gfx-directfb \
-    -plugin-mouse-tslib -qt-mouse-pc -qt-mouse-qvfb \
+    -qt-mouse-tslib -qt-mouse-pc -qt-mouse-qvfb \
      -qt-kbd-tty -qt-kbd-usb -qt-kbd-qvfb \
      -DQT_KEYPAD_NAVIGATION \
      "


