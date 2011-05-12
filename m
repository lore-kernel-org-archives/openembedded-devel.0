Received: from 64.mail-out.ovh.net ([91.121.185.65])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1QKded-0005dQ-CA
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 May 2011 23:42:43 +0200
Received: (qmail 10085 invoked by uid 503); 12 May 2011 21:09:27 -0000
Received: from b9.ovh.net (HELO mail411.ha.ovh.net) (213.186.33.59)
	by 64.mail-out.ovh.net with SMTP; 12 May 2011 21:09:27 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 12 May 2011 23:39:52 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO
	localhost.localdomain) (ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 12 May 2011 23:39:51 +0200
From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 12 May 2011 23:31:02 +0200
Message-Id: <1305235863-16025-3-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1305235863-16025-1-git-send-email-eric@eukrea.com>
References: <1305235863-16025-1-git-send-email-eric@eukrea.com>
MIME-Version: 1.0
X-Ovh-Tracer-Id: 6027786626366680395
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-Spam-Check: DONE|U 0.500015/N
Subject: [PATCH 2/3] qt4.inc: give the right name to variable qmake will use
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
X-List-Received-Date: Thu, 12 May 2011 21:42:43 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

this should prevent to have to manually copy binaries for the build
system built by qt4-native to the source tree when cross compiling qt.

Signed-off-by: Eric Bénard <eric@eukrea.com>
---
 recipes/qt4/qt4.inc |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/recipes/qt4/qt4.inc b/recipes/qt4/qt4.inc
index 52fa146..dc27fe2 100644
--- a/recipes/qt4/qt4.inc
+++ b/recipes/qt4/qt4.inc
@@ -17,8 +17,9 @@ EXTRA_OEMAKE = "-e"
 EXTRA_ENV = 'QMAKE="${STAGING_BINDIR_NATIVE}/qmake2 -after \
              INCPATH+=${STAGING_INCDIR}/freetype2 LIBS+=-L${STAGING_LIBDIR}" \
              QMAKESPEC="${QMAKESPEC}" LINK="${CXX} -Wl,-rpath-link,${STAGING_LIBDIR}" \
-             AR="${TARGET_PREFIX}ar cqs" \
-             MOC="${STAGING_BINDIR_NATIVE}/moc4" UIC="${STAGING_BINDIR_NATIVE}/uic4" MAKE="make -e"'
+             AR="${TARGET_PREFIX}ar cqs" QMAKE_LRELEASE="${STAGING_BINDIR_NATIVE}/lrelease4" \
+             QMAKE_RCC="${STAGING_BINDIR_NATIVE}/rcc4" QMAKE_MOC="${STAGING_BINDIR_NATIVE}/moc4" \
+             QMAKE_UIC="${STAGING_BINDIR_NATIVE}/uic4" MAKE="make -e"'
 
 export QT_CONF_PATH="${WORKDIR}/qt.conf"
 
-- 
1.7.0.4



