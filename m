Received: from 63.mail-out.ovh.net ([91.121.185.56])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1PUziD-0000HO-4V
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Dec 2010 11:44:57 +0100
Received: (qmail 25042 invoked by uid 503); 21 Dec 2010 11:20:24 -0000
Received: from b9.ovh.net (HELO mail239.ha.ovh.net) (213.186.33.59)
	by 63.mail-out.ovh.net with SMTP; 21 Dec 2010 11:20:24 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 21 Dec 2010 12:44:49 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO
	localhost.localdomain) (ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 21 Dec 2010 12:44:47 +0200
From: =?utf-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 21 Dec 2010 11:41:38 +0100
Message-Id: <1292928098-17357-1-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.6.3.3
MIME-Version: 1.0
X-Ovh-Tracer-Id: 9592385731858902345
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-Spam-Check: DONE|U 0.5/N
Subject: [PATCH] asterisk: fix SRC_URI and remove old recipes
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
X-List-Received-Date: Tue, 21 Dec 2010 10:44:57 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

* old versions either don't fetch or don't patch and are not pinned
* keep the higher version which fetch and patch
* fix SRC_URI for all the asterisk recipes

Signed-off-by: Eric Bénard <eric@eukrea.com>
---
 recipes/asterisk-sounds/asterisk-sounds_1.2.1.bb   |    2 +-
 recipes/asterisk/asterisk-1.2.24/asterisk.patch    |  221 --------------------
 .../asterisk/asterisk-1.2.24/enable-speex.patch    |   21 --
 .../asterisk-1.2.24/uclibc-compat-getloadavg.patch |   13 --
 recipes/asterisk/asterisk-1.2.24/uclibc-dns.patch  |   18 --
 recipes/asterisk/asterisk-1.2.28/asterisk.patch    |  221 --------------------
 .../asterisk/asterisk-1.2.28/enable-speex.patch    |   21 --
 .../asterisk-1.2.28/uclibc-compat-getloadavg.patch |   13 --
 recipes/asterisk/asterisk-1.2.28/uclibc-dns.patch  |   18 --
 recipes/asterisk/asterisk-1.4.17/Makefile.patch    |   20 --
 recipes/asterisk/asterisk-1.4.17/init              |   77 -------
 recipes/asterisk/asterisk-1.4.17/logrotate         |   12 -
 recipes/asterisk/asterisk-1.4.17/sounds.xml.patch  |   18 --
 recipes/asterisk/asterisk-1.4.17/volatiles         |    7 -
 recipes/asterisk/asterisk-1.4.19.1/Makefile.patch  |   20 --
 recipes/asterisk/asterisk-1.4.19.1/init            |   77 -------
 recipes/asterisk/asterisk-1.4.19.1/logrotate       |   12 -
 .../asterisk/asterisk-1.4.19.1/sounds.xml.patch    |   18 --
 recipes/asterisk/asterisk-1.4.19.1/volatiles       |    7 -
 .../asterisk/asterisk-1.6.0-beta8/Makefile.patch   |   20 --
 recipes/asterisk/asterisk-1.6.0-beta8/init         |   77 -------
 recipes/asterisk/asterisk-1.6.0-beta8/logrotate    |   12 -
 .../asterisk/asterisk-1.6.0-beta8/sounds.xml.patch |   18 --
 recipes/asterisk/asterisk-1.6.0-beta8/volatiles    |    7 -
 recipes/asterisk/asterisk-addons_1.6.0-beta2.bb    |   66 ------
 .../asterisk/asterisk-core-sounds-en-alaw_1.4.8.bb |    2 +-
 .../asterisk/asterisk-core-sounds-en-g729_1.4.8.bb |    2 +-
 .../asterisk/asterisk-core-sounds-en-gsm_1.4.8.bb  |    2 +-
 .../asterisk/asterisk-core-sounds-en-ulaw_1.4.8.bb |    2 +-
 .../asterisk-extra-sounds-en-alaw_1.4.7.bb         |    2 +-
 .../asterisk-extra-sounds-en-g729_1.4.7.bb         |    2 +-
 .../asterisk/asterisk-extra-sounds-en-gsm_1.4.7.bb |    2 +-
 .../asterisk-extra-sounds-en-ulaw_1.4.7.bb         |    2 +-
 .../asterisk/asterisk-moh-freeplay-alaw_0.0.0.bb   |    2 +-
 .../asterisk/asterisk-moh-freeplay-g729_0.0.0.bb   |    2 +-
 .../asterisk/asterisk-moh-freeplay-gsm_0.0.0.bb    |    2 +-
 .../asterisk/asterisk-moh-freeplay-ulaw_0.0.0.bb   |    2 +-
 recipes/asterisk/asterisk_1.2.24.bb                |   52 -----
 recipes/asterisk/asterisk_1.2.28.bb                |   46 ----
 recipes/asterisk/asterisk_1.4.17.bb                |  174 ---------------
 recipes/asterisk/asterisk_1.4.19.1.bb              |  173 ---------------
 recipes/asterisk/asterisk_1.4.23.1.bb              |    2 +-
 recipes/asterisk/asterisk_1.6.0-beta8.bb           |  185 ----------------
 43 files changed, 14 insertions(+), 1658 deletions(-)
 delete mode 100644 recipes/asterisk/asterisk-1.2.24/asterisk.patch
 delete mode 100644 recipes/asterisk/asterisk-1.2.24/enable-speex.patch
 delete mode 100644 recipes/asterisk/asterisk-1.2.24/uclibc-compat-getloadavg.patch
 delete mode 100644 recipes/asterisk/asterisk-1.2.24/uclibc-dns.patch
 delete mode 100644 recipes/asterisk/asterisk-1.2.28/asterisk.patch
 delete mode 100644 recipes/asterisk/asterisk-1.2.28/enable-speex.patch
 delete mode 100644 recipes/asterisk/asterisk-1.2.28/uclibc-compat-getloadavg.patch
 delete mode 100644 recipes/asterisk/asterisk-1.2.28/uclibc-dns.patch
 delete mode 100644 recipes/asterisk/asterisk-1.4.17/Makefile.patch
 delete mode 100644 recipes/asterisk/asterisk-1.4.17/init
 delete mode 100644 recipes/asterisk/asterisk-1.4.17/logrotate
 delete mode 100644 recipes/asterisk/asterisk-1.4.17/sounds.xml.patch
 delete mode 100644 recipes/asterisk/asterisk-1.4.17/volatiles
 delete mode 100644 recipes/asterisk/asterisk-1.4.19.1/Makefile.patch
 delete mode 100644 recipes/asterisk/asterisk-1.4.19.1/init
 delete mode 100644 recipes/asterisk/asterisk-1.4.19.1/logrotate
 delete mode 100644 recipes/asterisk/asterisk-1.4.19.1/sounds.xml.patch
 delete mode 100644 recipes/asterisk/asterisk-1.4.19.1/volatiles
 delete mode 100644 recipes/asterisk/asterisk-1.6.0-beta8/Makefile.patch
 delete mode 100644 recipes/asterisk/asterisk-1.6.0-beta8/init
 delete mode 100644 recipes/asterisk/asterisk-1.6.0-beta8/logrotate
 delete mode 100644 recipes/asterisk/asterisk-1.6.0-beta8/sounds.xml.patch
 delete mode 100644 recipes/asterisk/asterisk-1.6.0-beta8/volatiles
 delete mode 100644 recipes/asterisk/asterisk-addons_1.6.0-beta2.bb
 delete mode 100644 recipes/asterisk/asterisk_1.2.24.bb
 delete mode 100644 recipes/asterisk/asterisk_1.2.28.bb
 delete mode 100644 recipes/asterisk/asterisk_1.4.17.bb
 delete mode 100644 recipes/asterisk/asterisk_1.4.19.1.bb
 delete mode 100644 recipes/asterisk/asterisk_1.6.0-beta8.bb

diff --git a/recipes/asterisk-sounds/asterisk-sounds_1.2.1.bb b/recipes/asterisk-sounds/asterisk-sounds_1.2.1.bb
index 416afdb..e2c8923 100644
--- a/recipes/asterisk-sounds/asterisk-sounds_1.2.1.bb
+++ b/recipes/asterisk-sounds/asterisk-sounds_1.2.1.bb
@@ -4,7 +4,7 @@ LICENSE="GPL"
 DEPENDS="asterisk"
 PR = "r1"
 
-SRC_URI="http://ftp.digium.com/pub/asterisk/releases/asterisk-sounds-${PV}.tar.gz"
+SRC_URI="http://downloads.asterisk.org/pub/telephony/asterisk/releases/asterisk-sounds-${PV}.tar.gz"
 
 do_install() {
         oe_runmake DESTDIR=${D} install
diff --git a/recipes/asterisk/asterisk-1.2.24/asterisk.patch b/recipes/asterisk/asterisk-1.2.24/asterisk.patch
deleted file mode 100644
index 006b8e9..0000000
--- a/recipes/asterisk/asterisk-1.2.24/asterisk.patch
+++ /dev/null
@@ -1,221 +0,0 @@
-
-#
-# Patch managed by http://www.holgerschurig.de/patcher.html
-#
-
---- asterisk-1.2.9.1/./Makefile~asterisk
-+++ asterisk-1.2.9.1/./Makefile
-@@ -331,7 +331,7 @@
- ASTCFLAGS+= $(TRACE_FRAMES)
- ASTCFLAGS+= $(MALLOC_DEBUG)
- ASTCFLAGS+= $(BUSYDETECT)
--ASTCFLAGS+= $(OPTIONS)
-+#ASTCFLAGS+= $(OPTIONS)
- ifneq ($(findstring dont-optimize,$(MAKECMDGOALS)),dont-optimize)
- ASTCFLAGS+= -fomit-frame-pointer 
- endif
-@@ -347,12 +347,12 @@
- 	netsock.o slinfactory.o ast_expr2.o ast_expr2f.o \
- 	cryptostub.o
- 
--ifeq ($(wildcard $(CROSS_COMPILE_TARGET)/usr/include/sys/poll.h),)
-+ifeq ($(wildcard $(CROSS_COMPILE_TARGET)/include/sys/poll.h),)
-   OBJS+= poll.o
-   ASTCFLAGS+=-DPOLLCOMPAT
- endif
- 
--ifeq ($(wildcard $(CROSS_COMPILE_TARGET)/usr/include/dlfcn.h),)
-+ifeq ($(wildcard $(CROSS_COMPILE_TARGET)/include/dlfcn.h),)
-   OBJS+= dlfcn.o
-   ASTCFLAGS+=-DDLFCNCOMPAT
- endif
-@@ -397,7 +397,7 @@
- endif
- 
- ifeq ($(MAKETOPLEVEL),$(MAKELEVEL))
--  CFLAGS+=$(ASTCFLAGS)
-+override CFLAGS+=$(ASTCFLAGS)
- endif
- 
- # This is used when generating the doxygen documentation
-@@ -519,7 +519,7 @@
- 	fi
- 	rm -f include/asterisk/build.h.tmp
- 	$(CC) -c -o buildinfo.o $(CFLAGS) buildinfo.c
--	$(CC) $(DEBUG) $(ASTOBJ) $(ASTLINK) $(OBJS) buildinfo.o $(LIBEDIT) db1-ast/libdb1.a stdtime/libtime.a $(LIBS)
-+	$(CC) $(DEBUG) $(ASTOBJ) $(ASTLINK) $(OBJS) buildinfo.o $(LIBEDIT) db1-ast/libdb1.a stdtime/libtime.a $(LDFLAGS) $(LIBS)
- 
- muted: muted.o
- 	$(CC) $(AUDIO_LIBS) -o muted muted.o
---- asterisk-1.2.9.1/codecs/gsm/Makefile~asterisk
-+++ asterisk-1.2.9.1/codecs/gsm/Makefile
-@@ -51,7 +51,7 @@
-            ifneq (${PROC},ppc)
-             ifneq (${PROC},ppc64)
-              ifneq (${PROC},s390)
--OPTIMIZE+=-march=$(PROC)
-+#OPTIMIZE+=-march=$(PROC)
-              endif
-             endif
-            endif
-@@ -243,7 +243,7 @@
- ifneq (${PROC},arm)
- ifneq ($(shell uname -m), parisc)
- ifneq ($(shell uname -m),s390)
--GSM_SOURCES+= $(SRC)/k6opt.s
-+#GSM_SOURCES+= $(SRC)/k6opt.s
- endif
- endif
- endif
-@@ -309,7 +309,7 @@
- ifneq ($(shell uname -m), armv4l)
- ifneq ($(shell uname -m), parisc)
- ifneq ($(shell uname -m),s390)
--GSM_OBJECTS+= $(SRC)/k6opt.o
-+#GSM_OBJECTS+= $(SRC)/k6opt.o
- endif
- endif
- endif
---- asterisk-1.2.9.1/res/Makefile~asterisk
-+++ asterisk-1.2.9.1/res/Makefile
-@@ -89,7 +89,7 @@
- 	fi
- 
- res_crypto.so: res_crypto.o
--	$(CC) $(SOLINK) -o $@ ${CYGSOLINK} $< ${CYGSOLIB} $(CRYPTO_LIBS)
-+	$(CC) $(SOLINK) -o $@ ${CYGSOLINK} $< $(LDFLAGS) ${CYGSOLIB} $(CRYPTO_LIBS)
- 
- clean:
- 	rm -f *.so *.o .depend
---- asterisk-1.2.9.1/channels/Makefile~asterisk
-+++ asterisk-1.2.9.1/channels/Makefile
-@@ -73,7 +73,7 @@
-   SOLINK+=-lrt
- endif
- 
--ifneq ($(wildcard $(CROSS_COMPILE_TARGET)/usr/include/linux/ixjuser.h)$(wildcard $(CROSS_COMPILE_TARGET)/usr/local/include/ixjuser.h),)
-+ifneq ($(wildcard $(CROSS_COMPILE_TARGET)/include/linux/ixjuser.h),)
-   CHANNEL_LIBS+=chan_phone.so
- endif
- 
-@@ -88,16 +88,16 @@
- 
- CFLAGS+=-Wno-missing-prototypes -Wno-missing-declarations
- 
--ifneq ($(wildcard $(CROSS_COMPILE_TARGET)/usr/include/alsa/asoundlib.h),)
-+ifneq ($(wildcard $(CROSS_COMPILE_TARGET)/include/alsa/asoundlib.h),)
-   CHANNEL_LIBS+=chan_alsa.so
- endif
- 
--ifneq ($(wildcard $(CROSS_COMPILE_TARGET)/usr/lib/libpri.so.1)$(wildcard $(CROSS_COMPILE_TARGET)/usr/local/lib/libpri.so.1),)
-+ifneq ($(wildcard $(CROSS_COMPILE_TARGET)/lib/libpri.so.1),)
-   CFLAGS+=-DZAPATA_PRI
-   ZAPPRI=-lpri
- endif
- 
--ifneq ($(wildcard $(CROSS_COMPILE_TARGET)/usr/lib/libmfcr2.so.1)$(wildcard $(CROSS_COMPILE_TARGET)/usr/local/lib/libmfcr2.so.1),)
-+ifneq ($(wildcard $(CROSS_COMPILE_TARGET)/lib/libmfcr2.so.1),)
-   CFLAGS+=-DZAPATA_R2
-   ZAPR2=-lmfcr2
- endif
-@@ -110,7 +110,7 @@
- endif
- 
- ifndef WITHOUT_ZAPTEL
--ifneq ($(wildcard $(CROSS_COMPILE_TARGET)/usr/include/linux/zaptel.h)$(wildcard $(CROSS_COMPILE_TARGET)/usr/local/include/zaptel.h)$(wildcard $(CROSS_COMPILE_TARGET)/usr/pkg/include/zaptel.h),)
-+ifneq ($(wildcard $(CROSS_COMPILE_TARGET)/include/linux/zaptel.h),)
-   ifeq (${OSARCH},NetBSD)
-     SOLINK+=-L$(CROSS_COMPILE_TARGET)/usr/pkg/lib
-   endif
-@@ -122,7 +122,7 @@
- endif
- endif # WITHOUT_ZAPTEL
- 
--ifneq ($(wildcard $(CROSS_COMPILE_TARGET)/usr/include/vpbapi.h),)
-+ifneq ($(wildcard $(CROSS_COMPILE_TARGET)/include/vpbapi.h),)
-   CHANNEL_LIBS+=chan_vpb.so
-   CFLAGS+=-DLINUX
- endif
-@@ -137,7 +137,7 @@
- 
- ZAPDIR=/usr/lib
- 
--ifneq ($(wildcard $(CROSS_COMPILE_TARGET)/usr/include/nbs.h),)
-+ifneq ($(wildcard $(CROSS_COMPILE_TARGET)/include/nbs.h),)
-   CHANNEL_LIBS+=chan_nbs.so
- endif
- 
-@@ -158,7 +158,7 @@
- 	rm -f busy.h ringtone.h gentone gentone-ulaw
- 
- %.so : %.o
--	$(CC) $(SOLINK) -o $@ ${CYGSOLINK} $< ${CYGSOLIB} ${LIBS}
-+	$(CC) $(SOLINK) -o $@ ${CYGSOLINK} $< $(LDFLAGS) ${CYGSOLIB} ${LIBS}
- 
- ifneq ($(wildcard .depend),)
-   include .depend
-@@ -215,7 +215,7 @@
- chan_alsa.o: $(ALSA_SRC)
- 
- chan_alsa.so: chan_alsa.o
--	$(CC) $(SOLINK) -o $@ $< -lasound -lm -ldl
-+	$(CC) $(SOLINK) -o $@ $< -lasound -lm -ldl $(LDFLAGS)
- 
- chan_nbs.so: chan_nbs.o
- 	$(CC) $(SOLINK) -o $@ $< -lnbs
---- asterisk-1.2.9.1/pbx/Makefile~asterisk
-+++ asterisk-1.2.9.1/pbx/Makefile
-@@ -59,7 +59,7 @@
- 	$(CC) $(SOLINK) -o $@ $(KDE_CONSOLE_OBJS) $(KDE_LIBS)
- 
- pbx_dundi.so: dundi-parser.o pbx_dundi.o
--	$(CC) $(SOLINK) -o $@ ${CYGSOLINK} pbx_dundi.o dundi-parser.o -lz ${CYGSOLIB}
-+	$(CC) $(SOLINK) -o $@ ${CYGSOLINK} pbx_dundi.o dundi-parser.o -lz ${CYGSOLIB} $(LDFLAGS)
- 
- %.moc : %.h
- 	$(MOC) $< -o $@
---- asterisk-1.2.9.1/formats/Makefile~asterisk
-+++ asterisk-1.2.9.1/formats/Makefile
-@@ -25,7 +25,7 @@
- #
- # OGG/Vorbis format
- #
--ifneq ($(wildcard $(CROSS_COMPILE_TARGET)/usr/include/vorbis/codec.h),)
-+ifneq ($(wildcard $(CROSS_COMPILE_TARGET)/include/vorbis/codec.h),)
-   FORMAT_LIBS+=format_ogg_vorbis.so
- endif
- 
-@@ -57,7 +57,7 @@
- 	$(CC) $(SOLINK) -o $@ ${CYGSOLINK} $< ${CYGSOLIB} -lm
- 
- format_ogg_vorbis.so : format_ogg_vorbis.o
--	$(CC) $(SOLINK) -o $@ ${CYGSOLINK} $< ${CYGSOLIB} -logg -lvorbis -lvorbisenc -lm
-+	$(CC) $(SOLINK) -o $@ ${CYGSOLINK} $< ${CYGSOLIB} -logg -lvorbis -lvorbisenc -lm $(LDFLAGS)
- 
- install: all
- 	for x in $(FORMAT_LIBS); do $(INSTALL) -m 755 $$x $(DESTDIR)$(MODULES_DIR) ; done
---- asterisk-1.2.9.1/utils/Makefile~asterisk
-+++ asterisk-1.2.9.1/utils/Makefile
-@@ -22,11 +22,11 @@
- 
- TARGET=stereorize streamplayer
- 
--ifneq ($(wildcard $(CROSS_COMPILE_TARGET)/usr/include/popt.h)$(wildcard -f $(CROSS_COMPILE_TARGET)/usr/local/include/popt.h),)
-+ifneq ($(wildcard $(CROSS_COMPILE_TARGET)/include/popt.h),)
-   TARGET+=smsq
- endif
- 
--ifneq ($(wildcard $(CROSS_COMPILE_TARGET)/usr/include/newt.h)$(wildcard -f $(CROSS_COMPILE_TARGET)/usr/local/include/newt.h),)
-+ifneq ($(wildcard $(CROSS_COMPILE_TARGET)/include/newt.h),)
-   TARGET+=astman
- endif
- 
-@@ -64,7 +64,7 @@
- 	$(CC) $(CFLAGS) -o $@ $^
- 
- smsq: smsq.o
--	$(CC) $(CFLAGS) -o smsq ${SOL} smsq.o -lpopt
-+	$(CC) $(CFLAGS) -o smsq ${SOL} smsq.o -lpopt $(LDFLAGS)
- 
- streamplayer: streamplayer.o
- 	$(CC) $(CFLAGS) -o streamplayer ${SOL} streamplayer.o ${SOLLIBS}
diff --git a/recipes/asterisk/asterisk-1.2.24/enable-speex.patch b/recipes/asterisk/asterisk-1.2.24/enable-speex.patch
deleted file mode 100644
index 0f5c578..0000000
--- a/recipes/asterisk/asterisk-1.2.24/enable-speex.patch
+++ /dev/null
@@ -1,21 +0,0 @@
---- /codecs/orig-Makefile	2005-11-29 13:24:39.000000000 -0500
-+++ /codecs/Makefile	2007-02-28 09:54:42.000000000 -0500
-@@ -29,7 +29,7 @@
- endif
- 
- UI_SPEEX=$(wildcard $(CROSS_COMPILE_TARGET)/usr/include/speex.h)
--UIS_SPEEX=$(wildcard $(CROSS_COMPILE_TARGET)/usr/include/speex/speex.h)
-+UIS_SPEEX=$(wildcard $(CROSS_COMPILE_TARGET)/include/speex/speex.h)
- ULI_SPEEX=$(wildcard $(CROSS_COMPILE_TARGET)/usr/local/include/speex.h)
- ULIS_SPEEX=$(wildcard $(CROSS_COMPILE_TARGET)/usr/local/include/speex/speex.h)
- ifneq (${UI_SPEEX},)
-@@ -38,7 +38,8 @@
- endif
- ifneq (${UIS_SPEEX},)
-   MODSPEEX=codec_speex.so
--  CFLAGS+=-I$(CROSS_COMPILE_TARGET)/usr/include/speex
-+  CFLAGS+=-I$(CROSS_COMPILE_TARGET)/include/speex
-+  LIBSPEEX=-L$(CROSS_COMPILE_TARGET)/lib
-   LIBSPEEX+=-lspeex -lm
- endif
- ifneq (${ULI_SPEEX},)
diff --git a/recipes/asterisk/asterisk-1.2.24/uclibc-compat-getloadavg.patch b/recipes/asterisk/asterisk-1.2.24/uclibc-compat-getloadavg.patch
deleted file mode 100644
index a909513..0000000
--- a/recipes/asterisk/asterisk-1.2.24/uclibc-compat-getloadavg.patch
+++ /dev/null
@@ -1,13 +0,0 @@
-diff -ruN asterisk-1.2.0-old/include/asterisk/compat.h asterisk-1.2.0-new/include/asterisk/compat.h
---- asterisk-1.2.0-old/include/asterisk/compat.h	2005-11-08 05:13:19.000000000 +0100
-+++ asterisk-1.2.0-new/include/asterisk/compat.h	2005-12-04 05:32:31.000000000 +0100
-@@ -75,7 +75,9 @@
- #define HAVE_STRTOQ
- 
- #ifdef _BSD_SOURCE
-+#ifndef __UCLIBC__
- #define HAVE_GETLOADAVG
-+#endif /* __UCLIBC__ */
- #endif
- 
- #ifdef __linux__
diff --git a/recipes/asterisk/asterisk-1.2.24/uclibc-dns.patch b/recipes/asterisk/asterisk-1.2.24/uclibc-dns.patch
deleted file mode 100644
index 4ba8b62..0000000
--- a/recipes/asterisk/asterisk-1.2.24/uclibc-dns.patch
+++ /dev/null
@@ -1,18 +0,0 @@
---- /orig-dns.c	2007-07-16 23:46:58.000000000 +0300
-+++ /dns.c	2007-07-26 16:29:44.000000000 +0300
-@@ -237,7 +237,14 @@
- #if defined(res_ndestroy)
- #define HAS_RES_NDESTROY
- #endif
--#else
-+#endif
-+
-+#ifdef __UCLIBC__
-+#undef HAS_RES_NINIT
-+#undef HAS_RES_NDESTROY
-+#endif
-+
-+#ifndef HAS_RES_NINIT
- AST_MUTEX_DEFINE_STATIC(res_lock);
- #if 0
- #warning "Warning, res_ninit is missing...  Could have reentrancy issues"
diff --git a/recipes/asterisk/asterisk-1.2.28/asterisk.patch b/recipes/asterisk/asterisk-1.2.28/asterisk.patch
deleted file mode 100644
index 006b8e9..0000000
--- a/recipes/asterisk/asterisk-1.2.28/asterisk.patch
+++ /dev/null
@@ -1,221 +0,0 @@
-
-#
-# Patch managed by http://www.holgerschurig.de/patcher.html
-#
-
---- asterisk-1.2.9.1/./Makefile~asterisk
-+++ asterisk-1.2.9.1/./Makefile
-@@ -331,7 +331,7 @@
- ASTCFLAGS+= $(TRACE_FRAMES)
- ASTCFLAGS+= $(MALLOC_DEBUG)
- ASTCFLAGS+= $(BUSYDETECT)
--ASTCFLAGS+= $(OPTIONS)
-+#ASTCFLAGS+= $(OPTIONS)
- ifneq ($(findstring dont-optimize,$(MAKECMDGOALS)),dont-optimize)
- ASTCFLAGS+= -fomit-frame-pointer 
- endif
-@@ -347,12 +347,12 @@
- 	netsock.o slinfactory.o ast_expr2.o ast_expr2f.o \
- 	cryptostub.o
- 
--ifeq ($(wildcard $(CROSS_COMPILE_TARGET)/usr/include/sys/poll.h),)
-+ifeq ($(wildcard $(CROSS_COMPILE_TARGET)/include/sys/poll.h),)
-   OBJS+= poll.o
-   ASTCFLAGS+=-DPOLLCOMPAT
- endif
- 
--ifeq ($(wildcard $(CROSS_COMPILE_TARGET)/usr/include/dlfcn.h),)
-+ifeq ($(wildcard $(CROSS_COMPILE_TARGET)/include/dlfcn.h),)
-   OBJS+= dlfcn.o
-   ASTCFLAGS+=-DDLFCNCOMPAT
- endif
-@@ -397,7 +397,7 @@
- endif
- 
- ifeq ($(MAKETOPLEVEL),$(MAKELEVEL))
--  CFLAGS+=$(ASTCFLAGS)
-+override CFLAGS+=$(ASTCFLAGS)
- endif
- 
- # This is used when generating the doxygen documentation
-@@ -519,7 +519,7 @@
- 	fi
- 	rm -f include/asterisk/build.h.tmp
- 	$(CC) -c -o buildinfo.o $(CFLAGS) buildinfo.c
--	$(CC) $(DEBUG) $(ASTOBJ) $(ASTLINK) $(OBJS) buildinfo.o $(LIBEDIT) db1-ast/libdb1.a stdtime/libtime.a $(LIBS)
-+	$(CC) $(DEBUG) $(ASTOBJ) $(ASTLINK) $(OBJS) buildinfo.o $(LIBEDIT) db1-ast/libdb1.a stdtime/libtime.a $(LDFLAGS) $(LIBS)
- 
- muted: muted.o
- 	$(CC) $(AUDIO_LIBS) -o muted muted.o
---- asterisk-1.2.9.1/codecs/gsm/Makefile~asterisk
-+++ asterisk-1.2.9.1/codecs/gsm/Makefile
-@@ -51,7 +51,7 @@
-            ifneq (${PROC},ppc)
-             ifneq (${PROC},ppc64)
-              ifneq (${PROC},s390)
--OPTIMIZE+=-march=$(PROC)
-+#OPTIMIZE+=-march=$(PROC)
-              endif
-             endif
-            endif
-@@ -243,7 +243,7 @@
- ifneq (${PROC},arm)
- ifneq ($(shell uname -m), parisc)
- ifneq ($(shell uname -m),s390)
--GSM_SOURCES+= $(SRC)/k6opt.s
-+#GSM_SOURCES+= $(SRC)/k6opt.s
- endif
- endif
- endif
-@@ -309,7 +309,7 @@
- ifneq ($(shell uname -m), armv4l)
- ifneq ($(shell uname -m), parisc)
- ifneq ($(shell uname -m),s390)
--GSM_OBJECTS+= $(SRC)/k6opt.o
-+#GSM_OBJECTS+= $(SRC)/k6opt.o
- endif
- endif
- endif
---- asterisk-1.2.9.1/res/Makefile~asterisk
-+++ asterisk-1.2.9.1/res/Makefile
-@@ -89,7 +89,7 @@
- 	fi
- 
- res_crypto.so: res_crypto.o
--	$(CC) $(SOLINK) -o $@ ${CYGSOLINK} $< ${CYGSOLIB} $(CRYPTO_LIBS)
-+	$(CC) $(SOLINK) -o $@ ${CYGSOLINK} $< $(LDFLAGS) ${CYGSOLIB} $(CRYPTO_LIBS)
- 
- clean:
- 	rm -f *.so *.o .depend
---- asterisk-1.2.9.1/channels/Makefile~asterisk
-+++ asterisk-1.2.9.1/channels/Makefile
-@@ -73,7 +73,7 @@
-   SOLINK+=-lrt
- endif
- 
--ifneq ($(wildcard $(CROSS_COMPILE_TARGET)/usr/include/linux/ixjuser.h)$(wildcard $(CROSS_COMPILE_TARGET)/usr/local/include/ixjuser.h),)
-+ifneq ($(wildcard $(CROSS_COMPILE_TARGET)/include/linux/ixjuser.h),)
-   CHANNEL_LIBS+=chan_phone.so
- endif
- 
-@@ -88,16 +88,16 @@
- 
- CFLAGS+=-Wno-missing-prototypes -Wno-missing-declarations
- 
--ifneq ($(wildcard $(CROSS_COMPILE_TARGET)/usr/include/alsa/asoundlib.h),)
-+ifneq ($(wildcard $(CROSS_COMPILE_TARGET)/include/alsa/asoundlib.h),)
-   CHANNEL_LIBS+=chan_alsa.so
- endif
- 
--ifneq ($(wildcard $(CROSS_COMPILE_TARGET)/usr/lib/libpri.so.1)$(wildcard $(CROSS_COMPILE_TARGET)/usr/local/lib/libpri.so.1),)
-+ifneq ($(wildcard $(CROSS_COMPILE_TARGET)/lib/libpri.so.1),)
-   CFLAGS+=-DZAPATA_PRI
-   ZAPPRI=-lpri
- endif
- 
--ifneq ($(wildcard $(CROSS_COMPILE_TARGET)/usr/lib/libmfcr2.so.1)$(wildcard $(CROSS_COMPILE_TARGET)/usr/local/lib/libmfcr2.so.1),)
-+ifneq ($(wildcard $(CROSS_COMPILE_TARGET)/lib/libmfcr2.so.1),)
-   CFLAGS+=-DZAPATA_R2
-   ZAPR2=-lmfcr2
- endif
-@@ -110,7 +110,7 @@
- endif
- 
- ifndef WITHOUT_ZAPTEL
--ifneq ($(wildcard $(CROSS_COMPILE_TARGET)/usr/include/linux/zaptel.h)$(wildcard $(CROSS_COMPILE_TARGET)/usr/local/include/zaptel.h)$(wildcard $(CROSS_COMPILE_TARGET)/usr/pkg/include/zaptel.h),)
-+ifneq ($(wildcard $(CROSS_COMPILE_TARGET)/include/linux/zaptel.h),)
-   ifeq (${OSARCH},NetBSD)
-     SOLINK+=-L$(CROSS_COMPILE_TARGET)/usr/pkg/lib
-   endif
-@@ -122,7 +122,7 @@
- endif
- endif # WITHOUT_ZAPTEL
- 
--ifneq ($(wildcard $(CROSS_COMPILE_TARGET)/usr/include/vpbapi.h),)
-+ifneq ($(wildcard $(CROSS_COMPILE_TARGET)/include/vpbapi.h),)
-   CHANNEL_LIBS+=chan_vpb.so
-   CFLAGS+=-DLINUX
- endif
-@@ -137,7 +137,7 @@
- 
- ZAPDIR=/usr/lib
- 
--ifneq ($(wildcard $(CROSS_COMPILE_TARGET)/usr/include/nbs.h),)
-+ifneq ($(wildcard $(CROSS_COMPILE_TARGET)/include/nbs.h),)
-   CHANNEL_LIBS+=chan_nbs.so
- endif
- 
-@@ -158,7 +158,7 @@
- 	rm -f busy.h ringtone.h gentone gentone-ulaw
- 
- %.so : %.o
--	$(CC) $(SOLINK) -o $@ ${CYGSOLINK} $< ${CYGSOLIB} ${LIBS}
-+	$(CC) $(SOLINK) -o $@ ${CYGSOLINK} $< $(LDFLAGS) ${CYGSOLIB} ${LIBS}
- 
- ifneq ($(wildcard .depend),)
-   include .depend
-@@ -215,7 +215,7 @@
- chan_alsa.o: $(ALSA_SRC)
- 
- chan_alsa.so: chan_alsa.o
--	$(CC) $(SOLINK) -o $@ $< -lasound -lm -ldl
-+	$(CC) $(SOLINK) -o $@ $< -lasound -lm -ldl $(LDFLAGS)
- 
- chan_nbs.so: chan_nbs.o
- 	$(CC) $(SOLINK) -o $@ $< -lnbs
---- asterisk-1.2.9.1/pbx/Makefile~asterisk
-+++ asterisk-1.2.9.1/pbx/Makefile
-@@ -59,7 +59,7 @@
- 	$(CC) $(SOLINK) -o $@ $(KDE_CONSOLE_OBJS) $(KDE_LIBS)
- 
- pbx_dundi.so: dundi-parser.o pbx_dundi.o
--	$(CC) $(SOLINK) -o $@ ${CYGSOLINK} pbx_dundi.o dundi-parser.o -lz ${CYGSOLIB}
-+	$(CC) $(SOLINK) -o $@ ${CYGSOLINK} pbx_dundi.o dundi-parser.o -lz ${CYGSOLIB} $(LDFLAGS)
- 
- %.moc : %.h
- 	$(MOC) $< -o $@
---- asterisk-1.2.9.1/formats/Makefile~asterisk
-+++ asterisk-1.2.9.1/formats/Makefile
-@@ -25,7 +25,7 @@
- #
- # OGG/Vorbis format
- #
--ifneq ($(wildcard $(CROSS_COMPILE_TARGET)/usr/include/vorbis/codec.h),)
-+ifneq ($(wildcard $(CROSS_COMPILE_TARGET)/include/vorbis/codec.h),)
-   FORMAT_LIBS+=format_ogg_vorbis.so
- endif
- 
-@@ -57,7 +57,7 @@
- 	$(CC) $(SOLINK) -o $@ ${CYGSOLINK} $< ${CYGSOLIB} -lm
- 
- format_ogg_vorbis.so : format_ogg_vorbis.o
--	$(CC) $(SOLINK) -o $@ ${CYGSOLINK} $< ${CYGSOLIB} -logg -lvorbis -lvorbisenc -lm
-+	$(CC) $(SOLINK) -o $@ ${CYGSOLINK} $< ${CYGSOLIB} -logg -lvorbis -lvorbisenc -lm $(LDFLAGS)
- 
- install: all
- 	for x in $(FORMAT_LIBS); do $(INSTALL) -m 755 $$x $(DESTDIR)$(MODULES_DIR) ; done
---- asterisk-1.2.9.1/utils/Makefile~asterisk
-+++ asterisk-1.2.9.1/utils/Makefile
-@@ -22,11 +22,11 @@
- 
- TARGET=stereorize streamplayer
- 
--ifneq ($(wildcard $(CROSS_COMPILE_TARGET)/usr/include/popt.h)$(wildcard -f $(CROSS_COMPILE_TARGET)/usr/local/include/popt.h),)
-+ifneq ($(wildcard $(CROSS_COMPILE_TARGET)/include/popt.h),)
-   TARGET+=smsq
- endif
- 
--ifneq ($(wildcard $(CROSS_COMPILE_TARGET)/usr/include/newt.h)$(wildcard -f $(CROSS_COMPILE_TARGET)/usr/local/include/newt.h),)
-+ifneq ($(wildcard $(CROSS_COMPILE_TARGET)/include/newt.h),)
-   TARGET+=astman
- endif
- 
-@@ -64,7 +64,7 @@
- 	$(CC) $(CFLAGS) -o $@ $^
- 
- smsq: smsq.o
--	$(CC) $(CFLAGS) -o smsq ${SOL} smsq.o -lpopt
-+	$(CC) $(CFLAGS) -o smsq ${SOL} smsq.o -lpopt $(LDFLAGS)
- 
- streamplayer: streamplayer.o
- 	$(CC) $(CFLAGS) -o streamplayer ${SOL} streamplayer.o ${SOLLIBS}
diff --git a/recipes/asterisk/asterisk-1.2.28/enable-speex.patch b/recipes/asterisk/asterisk-1.2.28/enable-speex.patch
deleted file mode 100644
index 0f5c578..0000000
--- a/recipes/asterisk/asterisk-1.2.28/enable-speex.patch
+++ /dev/null
@@ -1,21 +0,0 @@
---- /codecs/orig-Makefile	2005-11-29 13:24:39.000000000 -0500
-+++ /codecs/Makefile	2007-02-28 09:54:42.000000000 -0500
-@@ -29,7 +29,7 @@
- endif
- 
- UI_SPEEX=$(wildcard $(CROSS_COMPILE_TARGET)/usr/include/speex.h)
--UIS_SPEEX=$(wildcard $(CROSS_COMPILE_TARGET)/usr/include/speex/speex.h)
-+UIS_SPEEX=$(wildcard $(CROSS_COMPILE_TARGET)/include/speex/speex.h)
- ULI_SPEEX=$(wildcard $(CROSS_COMPILE_TARGET)/usr/local/include/speex.h)
- ULIS_SPEEX=$(wildcard $(CROSS_COMPILE_TARGET)/usr/local/include/speex/speex.h)
- ifneq (${UI_SPEEX},)
-@@ -38,7 +38,8 @@
- endif
- ifneq (${UIS_SPEEX},)
-   MODSPEEX=codec_speex.so
--  CFLAGS+=-I$(CROSS_COMPILE_TARGET)/usr/include/speex
-+  CFLAGS+=-I$(CROSS_COMPILE_TARGET)/include/speex
-+  LIBSPEEX=-L$(CROSS_COMPILE_TARGET)/lib
-   LIBSPEEX+=-lspeex -lm
- endif
- ifneq (${ULI_SPEEX},)
diff --git a/recipes/asterisk/asterisk-1.2.28/uclibc-compat-getloadavg.patch b/recipes/asterisk/asterisk-1.2.28/uclibc-compat-getloadavg.patch
deleted file mode 100644
index a909513..0000000
--- a/recipes/asterisk/asterisk-1.2.28/uclibc-compat-getloadavg.patch
+++ /dev/null
@@ -1,13 +0,0 @@
-diff -ruN asterisk-1.2.0-old/include/asterisk/compat.h asterisk-1.2.0-new/include/asterisk/compat.h
---- asterisk-1.2.0-old/include/asterisk/compat.h	2005-11-08 05:13:19.000000000 +0100
-+++ asterisk-1.2.0-new/include/asterisk/compat.h	2005-12-04 05:32:31.000000000 +0100
-@@ -75,7 +75,9 @@
- #define HAVE_STRTOQ
- 
- #ifdef _BSD_SOURCE
-+#ifndef __UCLIBC__
- #define HAVE_GETLOADAVG
-+#endif /* __UCLIBC__ */
- #endif
- 
- #ifdef __linux__
diff --git a/recipes/asterisk/asterisk-1.2.28/uclibc-dns.patch b/recipes/asterisk/asterisk-1.2.28/uclibc-dns.patch
deleted file mode 100644
index 4ba8b62..0000000
--- a/recipes/asterisk/asterisk-1.2.28/uclibc-dns.patch
+++ /dev/null
@@ -1,18 +0,0 @@
---- /orig-dns.c	2007-07-16 23:46:58.000000000 +0300
-+++ /dns.c	2007-07-26 16:29:44.000000000 +0300
-@@ -237,7 +237,14 @@
- #if defined(res_ndestroy)
- #define HAS_RES_NDESTROY
- #endif
--#else
-+#endif
-+
-+#ifdef __UCLIBC__
-+#undef HAS_RES_NINIT
-+#undef HAS_RES_NDESTROY
-+#endif
-+
-+#ifndef HAS_RES_NINIT
- AST_MUTEX_DEFINE_STATIC(res_lock);
- #if 0
- #warning "Warning, res_ninit is missing...  Could have reentrancy issues"
diff --git a/recipes/asterisk/asterisk-1.4.17/Makefile.patch b/recipes/asterisk/asterisk-1.4.17/Makefile.patch
deleted file mode 100644
index a6d6309..0000000
--- a/recipes/asterisk/asterisk-1.4.17/Makefile.patch
+++ /dev/null
@@ -1,20 +0,0 @@
---- asterisk-1.4.5/Makefile	2007-05-24 15:05:08.000000000 -0400
-+++ asterisk-1.4.5/Makefile.new	2007-06-17 05:36:44.000000000 -0400
-@@ -115,7 +115,7 @@ else
-   ASTSBINDIR=$(sbindir)
-   ASTSPOOLDIR=$(localstatedir)/spool/asterisk
-   ASTLOGDIR=$(localstatedir)/log/asterisk
--  ASTVARRUNDIR=$(localstatedir)/run
-+  ASTVARRUNDIR=$(localstatedir)/run/asterisk
-   ASTMANDIR=$(mandir)
- ifeq ($(OSARCH),FreeBSD)
-   ASTVARLIBDIR=$(prefix)/share/asterisk
-@@ -468,7 +468,7 @@ oldmodcheck:
- 		echo " WARNING WARNING WARNING" ;\
- 	fi
- 
--install: datafiles bininstall $(SUBDIRS_INSTALL)
-+install: datafiles bininstall $(SUBDIRS_INSTALL) samples
- 	@if [ -x /usr/sbin/asterisk-post-install ]; then \
- 		/usr/sbin/asterisk-post-install $(DESTDIR) . ; \
- 	fi
diff --git a/recipes/asterisk/asterisk-1.4.17/init b/recipes/asterisk/asterisk-1.4.17/init
deleted file mode 100644
index d53a9a1..0000000
--- a/recipes/asterisk/asterisk-1.4.17/init
+++ /dev/null
@@ -1,77 +0,0 @@
-#! /bin/sh 
-#
-# This is an init script for openembedded
-# Copy it to /etc/init.d/callweaver and type
-# > update-rc.d asterisk defaults 60
-#
-asterisk=/usr/sbin/asterisk
-pidfile=/var/run/asterisk/asterisk.pid
-asterisk_args="-npqT -U asterisk -G asterisk"
-
-test -x "$asterisk" || exit 0
-
-case "$1" in
-  start)
-    echo -n "Starting Asterisk"
-    start-stop-daemon --start --quiet --exec $asterisk -- $asterisk_args
-    echo "."
-    ;;
-  stop)
-    echo -n "Stopping Asterisk"
-    $asterisk -rx "stop gracefully"
-    sleep 4
-    if [ -f $pidfile ]; then
-      start-stop-daemon --stop --quiet --pidfile $pidfile
-    fi
-    echo "."
-    ;;
-  force-stop)
-    echo -n "Stopping Asterisk"
-    $asterisk -rx "stop now"
-    sleep 2
-    if [ -f $pidfile ]; then
-      start-stop-daemon --stop --quiet --pidfile $pidfile
-    fi
-    echo "."
-    ;;
-  restart)
-    echo -n "Restarting Asterisk"
-    if [ -f $pidfile ]; then
-      $asterisk -rx "restart gracefully"
-      sleep 2
-    else
-      start-stop-daemon --start --quiet --exec $asterisk -- $asterisk_args
-    fi
-    echo "."
-    ;;
-  force-restart)
-    echo -n "Forcibly Restarting Asterisk"
-    if [ -f $pidfile ]; then
-      $asterisk -rx "restart now"
-      sleep 2
-    else
-      start-stop-daemon --start --quiet --exec $asterisk -- $asterisk_args
-    fi
-    echo "."
-    ;;
-  reload)
-    echo -n "Reloading Asterisk Configuration"
-    if [ -f $pidfile ]; then
-      $asterisk -rx "reload"
-    else
-      start-stop-daemon --start --quiet --exec $asterisk -- $asterisk_args
-    fi
-    echo "."
-    ;;
-  logger-reload)
-    if [ -f $pidfile ]; then
-      $asterisk -rx "logger reload"
-    fi
-    ;;
-  *)
-    echo "Usage: /etc/init.d/asterisk {start|stop|force-stop|restart|force-restart|reload|logger-reload}"
-    exit 1
-esac
-
-exit 0
-
diff --git a/recipes/asterisk/asterisk-1.4.17/logrotate b/recipes/asterisk/asterisk-1.4.17/logrotate
deleted file mode 100644
index dfd25ee..0000000
--- a/recipes/asterisk/asterisk-1.4.17/logrotate
+++ /dev/null
@@ -1,12 +0,0 @@
-/var/log/asterisk/cdr-csv/Master.csv /var/log/asterisk/cdr-custom/Master.csv /var/log/asterisk/queue_log /var/log/asterisk/event_log /var/log/asterisk/messages {
-    daily
-    missingok
-    compress
-    delaycompress
-    rotate 30
-    sharedscripts
-    postrotate
-      /etc/init.d/asterisk logger-reload
-    endscript
-}
-
diff --git a/recipes/asterisk/asterisk-1.4.17/sounds.xml.patch b/recipes/asterisk/asterisk-1.4.17/sounds.xml.patch
deleted file mode 100644
index b549fea..0000000
--- a/recipes/asterisk/asterisk-1.4.17/sounds.xml.patch
+++ /dev/null
@@ -1,18 +0,0 @@
---- asterisk-1.4.4/sounds/sounds.xml	2007-05-24 17:00:45.000000000 -0400
-+++ asterisk-1.4.4/sounds/sounds.xml.new	2007-05-25 13:23:41.000000000 -0400
-@@ -6,7 +6,6 @@
- 		<member name="CORE-SOUNDS-EN-ALAW" displayname="English, a-Law format">
- 		</member>
- 		<member name="CORE-SOUNDS-EN-GSM" displayname="English, GSM format" >
--			<defaultenabled>yes</defaultenabled>
- 		</member>
- 		<member name="CORE-SOUNDS-EN-G729" displayname="English, G.729 format">
- 		</member>
-@@ -39,7 +38,6 @@
- 	</category>
- 	<category name="MENUSELECT_MOH" displayname="Music On Hold File Packages" positive_output="yes">
- 		<member name="MOH-FREEPLAY-WAV" displayname="FreePlay Music On Hold Files, WAV format" >
--			<defaultenabled>yes</defaultenabled>
- 		</member>
- 		<member name="MOH-FREEPLAY-ULAW" displayname="FreePlay Music On Hold Files, mu-Law format" >
- 		</member>
diff --git a/recipes/asterisk/asterisk-1.4.17/volatiles b/recipes/asterisk/asterisk-1.4.17/volatiles
deleted file mode 100644
index c68e786..0000000
--- a/recipes/asterisk/asterisk-1.4.17/volatiles
+++ /dev/null
@@ -1,7 +0,0 @@
-d asterisk asterisk 0775 /var/run/asterisk none
-d asterisk asterisk 0775 /var/lib/asterisk none
-d asterisk asterisk 0775 /var/log/asterisk none
-d asterisk asterisk 0775 /var/log/asterisk/cdr-csv none
-d asterisk asterisk 0775 /var/log/asterisk/cdr-custom none
-d asterisk asterisk 0775 /var/spool/asterisk/outgoing none
-d asterisk asterisk 0775 /var/spool/asterisk/voicemail none
diff --git a/recipes/asterisk/asterisk-1.4.19.1/Makefile.patch b/recipes/asterisk/asterisk-1.4.19.1/Makefile.patch
deleted file mode 100644
index 857b482..0000000
--- a/recipes/asterisk/asterisk-1.4.19.1/Makefile.patch
+++ /dev/null
@@ -1,20 +0,0 @@
---- asterisk-1.4.5/Makefile	2007-05-24 15:05:08.000000000 -0400
-+++ asterisk-1.4.5/Makefile.new	2007-06-17 05:36:44.000000000 -0400
-@@ -115,7 +115,7 @@ else
-   ASTSBINDIR=$(sbindir)
-   ASTSPOOLDIR=$(localstatedir)/spool/asterisk
-   ASTLOGDIR=$(localstatedir)/log/asterisk
--  ASTVARRUNDIR=$(localstatedir)/run
-+  ASTVARRUNDIR=$(localstatedir)/run/asterisk
-   ASTMANDIR=$(mandir)
- ifeq ($(OSARCH),FreeBSD)
-   ASTVARLIBDIR=$(prefix)/share/asterisk
-@@ -468,7 +468,7 @@ oldmodcheck:
- 		echo " WARNING WARNING WARNING" ;\
- 	fi
- 
--install: badshell datafiles bininstall $(SUBDIRS_INSTALL)
-+install: badshell datafiles bininstall $(SUBDIRS_INSTALL) samples
- 	@if [ -x /usr/sbin/asterisk-post-install ]; then \
- 		/usr/sbin/asterisk-post-install $(DESTDIR) . ; \
- 	fi
diff --git a/recipes/asterisk/asterisk-1.4.19.1/init b/recipes/asterisk/asterisk-1.4.19.1/init
deleted file mode 100644
index d53a9a1..0000000
--- a/recipes/asterisk/asterisk-1.4.19.1/init
+++ /dev/null
@@ -1,77 +0,0 @@
-#! /bin/sh 
-#
-# This is an init script for openembedded
-# Copy it to /etc/init.d/callweaver and type
-# > update-rc.d asterisk defaults 60
-#
-asterisk=/usr/sbin/asterisk
-pidfile=/var/run/asterisk/asterisk.pid
-asterisk_args="-npqT -U asterisk -G asterisk"
-
-test -x "$asterisk" || exit 0
-
-case "$1" in
-  start)
-    echo -n "Starting Asterisk"
-    start-stop-daemon --start --quiet --exec $asterisk -- $asterisk_args
-    echo "."
-    ;;
-  stop)
-    echo -n "Stopping Asterisk"
-    $asterisk -rx "stop gracefully"
-    sleep 4
-    if [ -f $pidfile ]; then
-      start-stop-daemon --stop --quiet --pidfile $pidfile
-    fi
-    echo "."
-    ;;
-  force-stop)
-    echo -n "Stopping Asterisk"
-    $asterisk -rx "stop now"
-    sleep 2
-    if [ -f $pidfile ]; then
-      start-stop-daemon --stop --quiet --pidfile $pidfile
-    fi
-    echo "."
-    ;;
-  restart)
-    echo -n "Restarting Asterisk"
-    if [ -f $pidfile ]; then
-      $asterisk -rx "restart gracefully"
-      sleep 2
-    else
-      start-stop-daemon --start --quiet --exec $asterisk -- $asterisk_args
-    fi
-    echo "."
-    ;;
-  force-restart)
-    echo -n "Forcibly Restarting Asterisk"
-    if [ -f $pidfile ]; then
-      $asterisk -rx "restart now"
-      sleep 2
-    else
-      start-stop-daemon --start --quiet --exec $asterisk -- $asterisk_args
-    fi
-    echo "."
-    ;;
-  reload)
-    echo -n "Reloading Asterisk Configuration"
-    if [ -f $pidfile ]; then
-      $asterisk -rx "reload"
-    else
-      start-stop-daemon --start --quiet --exec $asterisk -- $asterisk_args
-    fi
-    echo "."
-    ;;
-  logger-reload)
-    if [ -f $pidfile ]; then
-      $asterisk -rx "logger reload"
-    fi
-    ;;
-  *)
-    echo "Usage: /etc/init.d/asterisk {start|stop|force-stop|restart|force-restart|reload|logger-reload}"
-    exit 1
-esac
-
-exit 0
-
diff --git a/recipes/asterisk/asterisk-1.4.19.1/logrotate b/recipes/asterisk/asterisk-1.4.19.1/logrotate
deleted file mode 100644
index dfd25ee..0000000
--- a/recipes/asterisk/asterisk-1.4.19.1/logrotate
+++ /dev/null
@@ -1,12 +0,0 @@
-/var/log/asterisk/cdr-csv/Master.csv /var/log/asterisk/cdr-custom/Master.csv /var/log/asterisk/queue_log /var/log/asterisk/event_log /var/log/asterisk/messages {
-    daily
-    missingok
-    compress
-    delaycompress
-    rotate 30
-    sharedscripts
-    postrotate
-      /etc/init.d/asterisk logger-reload
-    endscript
-}
-
diff --git a/recipes/asterisk/asterisk-1.4.19.1/sounds.xml.patch b/recipes/asterisk/asterisk-1.4.19.1/sounds.xml.patch
deleted file mode 100644
index b549fea..0000000
--- a/recipes/asterisk/asterisk-1.4.19.1/sounds.xml.patch
+++ /dev/null
@@ -1,18 +0,0 @@
---- asterisk-1.4.4/sounds/sounds.xml	2007-05-24 17:00:45.000000000 -0400
-+++ asterisk-1.4.4/sounds/sounds.xml.new	2007-05-25 13:23:41.000000000 -0400
-@@ -6,7 +6,6 @@
- 		<member name="CORE-SOUNDS-EN-ALAW" displayname="English, a-Law format">
- 		</member>
- 		<member name="CORE-SOUNDS-EN-GSM" displayname="English, GSM format" >
--			<defaultenabled>yes</defaultenabled>
- 		</member>
- 		<member name="CORE-SOUNDS-EN-G729" displayname="English, G.729 format">
- 		</member>
-@@ -39,7 +38,6 @@
- 	</category>
- 	<category name="MENUSELECT_MOH" displayname="Music On Hold File Packages" positive_output="yes">
- 		<member name="MOH-FREEPLAY-WAV" displayname="FreePlay Music On Hold Files, WAV format" >
--			<defaultenabled>yes</defaultenabled>
- 		</member>
- 		<member name="MOH-FREEPLAY-ULAW" displayname="FreePlay Music On Hold Files, mu-Law format" >
- 		</member>
diff --git a/recipes/asterisk/asterisk-1.4.19.1/volatiles b/recipes/asterisk/asterisk-1.4.19.1/volatiles
deleted file mode 100644
index c68e786..0000000
--- a/recipes/asterisk/asterisk-1.4.19.1/volatiles
+++ /dev/null
@@ -1,7 +0,0 @@
-d asterisk asterisk 0775 /var/run/asterisk none
-d asterisk asterisk 0775 /var/lib/asterisk none
-d asterisk asterisk 0775 /var/log/asterisk none
-d asterisk asterisk 0775 /var/log/asterisk/cdr-csv none
-d asterisk asterisk 0775 /var/log/asterisk/cdr-custom none
-d asterisk asterisk 0775 /var/spool/asterisk/outgoing none
-d asterisk asterisk 0775 /var/spool/asterisk/voicemail none
diff --git a/recipes/asterisk/asterisk-1.6.0-beta8/Makefile.patch b/recipes/asterisk/asterisk-1.6.0-beta8/Makefile.patch
deleted file mode 100644
index cdbbe2b..0000000
--- a/recipes/asterisk/asterisk-1.6.0-beta8/Makefile.patch
+++ /dev/null
@@ -1,20 +0,0 @@
---- asterisk-1.6.0/Makefile	2008-03-18 11:58:50.000000000 -0400
-+++ asterisk-1.6.0.new/Makefile	2008-03-28 12:11:32.137042768 -0400
-@@ -142,7 +142,7 @@ else
-   ASTSBINDIR=$(sbindir)
-   ASTSPOOLDIR=$(localstatedir)/spool/asterisk
-   ASTLOGDIR=$(localstatedir)/log/asterisk
--  ASTVARRUNDIR=$(localstatedir)/run
-+  ASTVARRUNDIR=$(localstatedir)/run/asterisk
-   ASTMANDIR=$(mandir)
- ifneq ($(findstring BSD,$(OSARCH)),)
-   ASTVARLIBDIR=$(prefix)/share/asterisk
-@@ -571,7 +571,7 @@ ifneq ($(findstring ~,$(DESTDIR)),)
- 	@exit 1
- endif
- 
--install: badshell datafiles bininstall
-+install: badshell datafiles bininstall samples
- 	@if [ -x /usr/sbin/asterisk-post-install ]; then \
- 		/usr/sbin/asterisk-post-install $(DESTDIR) . ; \
- 	fi
diff --git a/recipes/asterisk/asterisk-1.6.0-beta8/init b/recipes/asterisk/asterisk-1.6.0-beta8/init
deleted file mode 100644
index f26ad38..0000000
--- a/recipes/asterisk/asterisk-1.6.0-beta8/init
+++ /dev/null
@@ -1,77 +0,0 @@
-#! /bin/sh 
-#
-# This is an init script for openembedded
-# Copy it to /etc/init.d/openpbx and type
-# > update-rc.d asterisk defaults 60
-#
-asterisk=/usr/sbin/asterisk
-pidfile=/var/run/asterisk/asterisk.pid
-asterisk_args="-npqT -U asterisk -G asterisk"
-
-test -x "$asterisk" || exit 0
-
-case "$1" in
-  start)
-    echo -n "Starting Asterisk"
-    start-stop-daemon --start --quiet --exec $asterisk -- $asterisk_args
-    echo "."
-    ;;
-  stop)
-    echo -n "Stopping Asterisk"
-    $asterisk -rx "stop gracefully"
-    sleep 4
-    if [ -f $pidfile ]; then
-      start-stop-daemon --stop --quiet --pidfile $pidfile
-    fi
-    echo "."
-    ;;
-  force-stop)
-    echo -n "Stopping Asterisk"
-    $asterisk -rx "stop now"
-    sleep 2
-    if [ -f $pidfile ]; then
-      start-stop-daemon --stop --quiet --pidfile $pidfile
-    fi
-    echo "."
-    ;;
-  restart)
-    echo -n "Restarting Asterisk"
-    if [ -f $pidfile ]; then
-      $asterisk -rx "restart gracefully"
-      sleep 2
-    else
-      start-stop-daemon --start --quiet --exec $asterisk -- $asterisk_args
-    fi
-    echo "."
-    ;;
-  force-restart)
-    echo -n "Forcibly Restarting Asterisk"
-    if [ -f $pidfile ]; then
-      $asterisk -rx "restart now"
-      sleep 2
-    else
-      start-stop-daemon --start --quiet --exec $asterisk -- $asterisk_args
-    fi
-    echo "."
-    ;;
-  reload)
-    echo -n "Reloading Asterisk Configuration"
-    if [ -f $pidfile ]; then
-      $asterisk -rx "reload"
-    else
-      start-stop-daemon --start --quiet --exec $asterisk -- $asterisk_args
-    fi
-    echo "."
-    ;;
-  logger-reload)
-    if [ -f $pidfile ]; then
-      $asterisk -rx "logger reload"
-    fi
-    ;;
-  *)
-    echo "Usage: /etc/init.d/asterisk {start|stop|force-stop|restart|force-restart|reload|logger-reload}"
-    exit 1
-esac
-
-exit 0
-
diff --git a/recipes/asterisk/asterisk-1.6.0-beta8/logrotate b/recipes/asterisk/asterisk-1.6.0-beta8/logrotate
deleted file mode 100644
index dfd25ee..0000000
--- a/recipes/asterisk/asterisk-1.6.0-beta8/logrotate
+++ /dev/null
@@ -1,12 +0,0 @@
-/var/log/asterisk/cdr-csv/Master.csv /var/log/asterisk/cdr-custom/Master.csv /var/log/asterisk/queue_log /var/log/asterisk/event_log /var/log/asterisk/messages {
-    daily
-    missingok
-    compress
-    delaycompress
-    rotate 30
-    sharedscripts
-    postrotate
-      /etc/init.d/asterisk logger-reload
-    endscript
-}
-
diff --git a/recipes/asterisk/asterisk-1.6.0-beta8/sounds.xml.patch b/recipes/asterisk/asterisk-1.6.0-beta8/sounds.xml.patch
deleted file mode 100644
index b549fea..0000000
--- a/recipes/asterisk/asterisk-1.6.0-beta8/sounds.xml.patch
+++ /dev/null
@@ -1,18 +0,0 @@
---- asterisk-1.4.4/sounds/sounds.xml	2007-05-24 17:00:45.000000000 -0400
-+++ asterisk-1.4.4/sounds/sounds.xml.new	2007-05-25 13:23:41.000000000 -0400
-@@ -6,7 +6,6 @@
- 		<member name="CORE-SOUNDS-EN-ALAW" displayname="English, a-Law format">
- 		</member>
- 		<member name="CORE-SOUNDS-EN-GSM" displayname="English, GSM format" >
--			<defaultenabled>yes</defaultenabled>
- 		</member>
- 		<member name="CORE-SOUNDS-EN-G729" displayname="English, G.729 format">
- 		</member>
-@@ -39,7 +38,6 @@
- 	</category>
- 	<category name="MENUSELECT_MOH" displayname="Music On Hold File Packages" positive_output="yes">
- 		<member name="MOH-FREEPLAY-WAV" displayname="FreePlay Music On Hold Files, WAV format" >
--			<defaultenabled>yes</defaultenabled>
- 		</member>
- 		<member name="MOH-FREEPLAY-ULAW" displayname="FreePlay Music On Hold Files, mu-Law format" >
- 		</member>
diff --git a/recipes/asterisk/asterisk-1.6.0-beta8/volatiles b/recipes/asterisk/asterisk-1.6.0-beta8/volatiles
deleted file mode 100644
index c68e786..0000000
--- a/recipes/asterisk/asterisk-1.6.0-beta8/volatiles
+++ /dev/null
@@ -1,7 +0,0 @@
-d asterisk asterisk 0775 /var/run/asterisk none
-d asterisk asterisk 0775 /var/lib/asterisk none
-d asterisk asterisk 0775 /var/log/asterisk none
-d asterisk asterisk 0775 /var/log/asterisk/cdr-csv none
-d asterisk asterisk 0775 /var/log/asterisk/cdr-custom none
-d asterisk asterisk 0775 /var/spool/asterisk/outgoing none
-d asterisk asterisk 0775 /var/spool/asterisk/voicemail none
diff --git a/recipes/asterisk/asterisk-addons_1.6.0-beta2.bb b/recipes/asterisk/asterisk-addons_1.6.0-beta2.bb
deleted file mode 100644
index 0b513f9..0000000
--- a/recipes/asterisk/asterisk-addons_1.6.0-beta2.bb
+++ /dev/null
@@ -1,66 +0,0 @@
-# Copyright (c) 2008, Ovidiu Sas - VoIP Embedded Inc., All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-DESCRIPTION = "The Asterisk open source software PBX"
-HOMEPAGE = "http://www.asterisk.org"
-SECTION = "voip"
-LICENSE = "GPLv2"
-PRIORITY = "optional"
-SECTION = "console/telephony"
-DEPENDS = "asterisk openssl curl"
-PR = "r1"
-
-DEFAULT_PREFERENCE = "-1"
-
-SRC_URI="http://sources.nslu2-linux.org/sources/asterisk-addons-${PV}.tar.gz"
-
-SRC_URI[md5sum] = "190622fb25b4d1402594dd2e1833808b"
-SRC_URI[sha256sum] = "1af141e3d74b802e37bee75ef93f873b424363a287b6ca3d3f9e2e41dc2e88cf"
-
-ARCH_efika="ppc"
-ARCH_dht-walnut="ppc"
-ARCH_magicbox="ppc"
-ARCH_sequoia="ppc"
-
-
-inherit autotools
-
-EXTRA_OECONF =  "--with-ssl=${STAGING_EXECPREFIXDIR}\
-		--with-termcap=${STAGING_EXECPREFIXDIR}\
-		--with-curl=${STAGING_EXECPREFIXDIR}\
-		--without-curses\
-		--with-ncurses=${STAGING_EXECPREFIXDIR}\
-		--without-mysqlclient\
-		--with-h323\
-		"
-
-#export NOISY_BUILD=yes
-
-export ASTCFLAGS = "-fsigned-char -I${STAGING_INCDIR} -DPATH_MAX=4096"
-export ASTLDFLAGS="${LDFLAGS} -lpthread -ldl -lresolv "
-export PROC="${ARCH}"
-
-do_configure () {
-	# Looks like rebuilding configure doesn't work, so we are skipping
-	# that and are just using the shipped one
-	gnu-configize
-	libtoolize --force
-	oe_runconf
-}
-
-do_compile() {
-	(
-	#make sure that menuselect gets build using host toolchain
-	unset CC LD CXX CCLD CFLAGS CPPFLAGS LDFLAGS CXXFLAGS
-	cd menuselect 
-	./configure
-	oe_runmake
-	cd ../
-	) || exit 1
-	oe_runmake
-}
-
-CONFFILES_${PN} += "${sysconfdir}/asterisk/mobile.conf"
-CONFFILES_${PN} += "${sysconfdir}/asterisk/res_mysql.conf"
-CONFFILES_${PN} += "${sysconfdir}/asterisk/ooh323.conf"
-CONFFILES_${PN} += "${sysconfdir}/asterisk/cdr_mysql.conf"
-
diff --git a/recipes/asterisk/asterisk-core-sounds-en-alaw_1.4.8.bb b/recipes/asterisk/asterisk-core-sounds-en-alaw_1.4.8.bb
index b5f3e31..e2adb8f 100644
--- a/recipes/asterisk/asterisk-core-sounds-en-alaw_1.4.8.bb
+++ b/recipes/asterisk/asterisk-core-sounds-en-alaw_1.4.8.bb
@@ -5,7 +5,7 @@ LICENSE="GPL"
 #DEPENDS="asterisk"
 PR = "r1"
 
-SRC_URI="http://downloads.digium.com/pub/telephony/sounds/releases/asterisk-core-sounds-en-alaw-${PV}.tar.gz"
+SRC_URI="http://downloads.asterisk.org/pub/telephony/sounds/releases/asterisk-core-sounds-en-alaw-${PV}.tar.gz"
 
 do_install() {
 	install -d ${D}${localstatedir}/lib/asterisk/sounds
diff --git a/recipes/asterisk/asterisk-core-sounds-en-g729_1.4.8.bb b/recipes/asterisk/asterisk-core-sounds-en-g729_1.4.8.bb
index 9cc6867..34b77b8 100644
--- a/recipes/asterisk/asterisk-core-sounds-en-g729_1.4.8.bb
+++ b/recipes/asterisk/asterisk-core-sounds-en-g729_1.4.8.bb
@@ -5,7 +5,7 @@ LICENSE="GPL"
 #DEPENDS="asterisk"
 PR = "r1"
 
-SRC_URI="http://downloads.digium.com/pub/telephony/sounds/releases/asterisk-core-sounds-en-g729-${PV}.tar.gz"
+SRC_URI="http://downloads.asterisk.org/pub/telephony/sounds/releases/asterisk-core-sounds-en-g729-${PV}.tar.gz"
 
 do_install() {
 	install -d ${D}${localstatedir}/lib/asterisk/sounds
diff --git a/recipes/asterisk/asterisk-core-sounds-en-gsm_1.4.8.bb b/recipes/asterisk/asterisk-core-sounds-en-gsm_1.4.8.bb
index bef02db..956b7e0 100644
--- a/recipes/asterisk/asterisk-core-sounds-en-gsm_1.4.8.bb
+++ b/recipes/asterisk/asterisk-core-sounds-en-gsm_1.4.8.bb
@@ -5,7 +5,7 @@ LICENSE="GPL"
 #DEPENDS="asterisk"
 PR = "r1"
 
-SRC_URI="http://downloads.digium.com/pub/telephony/sounds/releases/asterisk-core-sounds-en-gsm-${PV}.tar.gz"
+SRC_URI="http://downloads.asterisk.org/pub/telephony/sounds/releases/asterisk-core-sounds-en-gsm-${PV}.tar.gz"
 
 do_install() {
 	install -d ${D}${localstatedir}/lib/asterisk/sounds
diff --git a/recipes/asterisk/asterisk-core-sounds-en-ulaw_1.4.8.bb b/recipes/asterisk/asterisk-core-sounds-en-ulaw_1.4.8.bb
index ed776fc..60c8c4e 100644
--- a/recipes/asterisk/asterisk-core-sounds-en-ulaw_1.4.8.bb
+++ b/recipes/asterisk/asterisk-core-sounds-en-ulaw_1.4.8.bb
@@ -5,7 +5,7 @@ LICENSE="GPL"
 #DEPENDS="asterisk"
 PR = "r1"
 
-SRC_URI="http://downloads.digium.com/pub/telephony/sounds/releases/asterisk-core-sounds-en-ulaw-${PV}.tar.gz"
+SRC_URI="http://downloads.asterisk.org/pub/telephony/sounds/releases/asterisk-core-sounds-en-ulaw-${PV}.tar.gz"
 
 do_install() {
 	install -d ${D}${localstatedir}/lib/asterisk/sounds
diff --git a/recipes/asterisk/asterisk-extra-sounds-en-alaw_1.4.7.bb b/recipes/asterisk/asterisk-extra-sounds-en-alaw_1.4.7.bb
index 554c71a..ac5c747 100644
--- a/recipes/asterisk/asterisk-extra-sounds-en-alaw_1.4.7.bb
+++ b/recipes/asterisk/asterisk-extra-sounds-en-alaw_1.4.7.bb
@@ -5,7 +5,7 @@ LICENSE="GPL"
 #DEPENDS="asterisk"
 PR = "r1"
 
-SRC_URI="http://downloads.digium.com/pub/telephony/sounds/releases/asterisk-extra-sounds-en-alaw-${PV}.tar.gz"
+SRC_URI="http://downloads.asterisk.org/pub/telephony/sounds/releases/asterisk-extra-sounds-en-alaw-${PV}.tar.gz"
 
 do_install() {
 	install -d ${D}${localstatedir}/lib/asterisk/sounds
diff --git a/recipes/asterisk/asterisk-extra-sounds-en-g729_1.4.7.bb b/recipes/asterisk/asterisk-extra-sounds-en-g729_1.4.7.bb
index 763f68c..67422bc 100644
--- a/recipes/asterisk/asterisk-extra-sounds-en-g729_1.4.7.bb
+++ b/recipes/asterisk/asterisk-extra-sounds-en-g729_1.4.7.bb
@@ -5,7 +5,7 @@ LICENSE="GPL"
 #DEPENDS="asterisk"
 PR = "r1"
 
-SRC_URI="http://downloads.digium.com/pub/telephony/sounds/releases/asterisk-extra-sounds-en-g729-${PV}.tar.gz"
+SRC_URI="http://downloads.asterisk.org/pub/telephony/sounds/releases/asterisk-extra-sounds-en-g729-${PV}.tar.gz"
 
 do_install() {
 	install -d ${D}${localstatedir}/lib/asterisk/sounds
diff --git a/recipes/asterisk/asterisk-extra-sounds-en-gsm_1.4.7.bb b/recipes/asterisk/asterisk-extra-sounds-en-gsm_1.4.7.bb
index 6f2830c..688034f 100644
--- a/recipes/asterisk/asterisk-extra-sounds-en-gsm_1.4.7.bb
+++ b/recipes/asterisk/asterisk-extra-sounds-en-gsm_1.4.7.bb
@@ -5,7 +5,7 @@ LICENSE="GPL"
 #DEPENDS="asterisk"
 PR = "r1"
 
-SRC_URI="http://downloads.digium.com/pub/telephony/sounds/releases/asterisk-extra-sounds-en-gsm-${PV}.tar.gz"
+SRC_URI="http://downloads.asterisk.org/pub/telephony/sounds/releases/asterisk-extra-sounds-en-gsm-${PV}.tar.gz"
 
 do_install() {
 	install -d ${D}${localstatedir}/lib/asterisk/sounds
diff --git a/recipes/asterisk/asterisk-extra-sounds-en-ulaw_1.4.7.bb b/recipes/asterisk/asterisk-extra-sounds-en-ulaw_1.4.7.bb
index 3975975..201da89 100644
--- a/recipes/asterisk/asterisk-extra-sounds-en-ulaw_1.4.7.bb
+++ b/recipes/asterisk/asterisk-extra-sounds-en-ulaw_1.4.7.bb
@@ -5,7 +5,7 @@ LICENSE="GPL"
 #DEPENDS="asterisk"
 PR = "r1"
 
-SRC_URI="http://downloads.digium.com/pub/telephony/sounds/releases/asterisk-extra-sounds-en-ulaw-${PV}.tar.gz"
+SRC_URI="http://downloads.asterisk.org/pub/telephony/sounds/releases/asterisk-extra-sounds-en-ulaw-${PV}.tar.gz"
 
 do_install() {
 	install -d ${D}${localstatedir}/lib/asterisk/sounds
diff --git a/recipes/asterisk/asterisk-moh-freeplay-alaw_0.0.0.bb b/recipes/asterisk/asterisk-moh-freeplay-alaw_0.0.0.bb
index 566882a..24548f6 100644
--- a/recipes/asterisk/asterisk-moh-freeplay-alaw_0.0.0.bb
+++ b/recipes/asterisk/asterisk-moh-freeplay-alaw_0.0.0.bb
@@ -5,7 +5,7 @@ LICENSE="GPL"
 #DEPENDS="asterisk"
 PR = "r1"
 
-SRC_URI="http://downloads.digium.com/pub/telephony/sounds/releases/asterisk-moh-freeplay-alaw.tar.gz"
+SRC_URI="http://downloads.asterisk.org/pub/telephony/sounds/releases/asterisk-moh-freeplay-alaw.tar.gz"
 
 do_install() {
 	install -d ${D}${localstatedir}/lib/asterisk/moh
diff --git a/recipes/asterisk/asterisk-moh-freeplay-g729_0.0.0.bb b/recipes/asterisk/asterisk-moh-freeplay-g729_0.0.0.bb
index cadadc4..efe6d6e 100644
--- a/recipes/asterisk/asterisk-moh-freeplay-g729_0.0.0.bb
+++ b/recipes/asterisk/asterisk-moh-freeplay-g729_0.0.0.bb
@@ -5,7 +5,7 @@ LICENSE="GPL"
 #DEPENDS="asterisk"
 PR = "r1"
 
-SRC_URI="http://downloads.digium.com/pub/telephony/sounds/releases/asterisk-moh-freeplay-g729.tar.gz"
+SRC_URI="http://downloads.asterisk.org/pub/telephony/sounds/releases/asterisk-moh-freeplay-g729.tar.gz"
 
 do_install() {
 	install -d ${D}${localstatedir}/lib/asterisk/moh
diff --git a/recipes/asterisk/asterisk-moh-freeplay-gsm_0.0.0.bb b/recipes/asterisk/asterisk-moh-freeplay-gsm_0.0.0.bb
index b608b8f..6b62da3 100644
--- a/recipes/asterisk/asterisk-moh-freeplay-gsm_0.0.0.bb
+++ b/recipes/asterisk/asterisk-moh-freeplay-gsm_0.0.0.bb
@@ -5,7 +5,7 @@ LICENSE="GPL"
 #DEPENDS="asterisk"
 PR = "r1"
 
-SRC_URI="http://downloads.digium.com/pub/telephony/sounds/releases/asterisk-moh-freeplay-gsm.tar.gz"
+SRC_URI="http://downloads.asterisk.org/pub/telephony/sounds/releases/asterisk-moh-freeplay-gsm.tar.gz"
 
 do_install() {
 	install -d ${D}${localstatedir}/lib/asterisk/moh
diff --git a/recipes/asterisk/asterisk-moh-freeplay-ulaw_0.0.0.bb b/recipes/asterisk/asterisk-moh-freeplay-ulaw_0.0.0.bb
index ac91615..05a96d6 100644
--- a/recipes/asterisk/asterisk-moh-freeplay-ulaw_0.0.0.bb
+++ b/recipes/asterisk/asterisk-moh-freeplay-ulaw_0.0.0.bb
@@ -5,7 +5,7 @@ LICENSE="GPL"
 #DEPENDS="asterisk"
 PR = "r1"
 
-SRC_URI="http://downloads.digium.com/pub/telephony/sounds/releases/asterisk-moh-freeplay-ulaw.tar.gz"
+SRC_URI="http://downloads.asterisk.org/pub/telephony/sounds/releases/asterisk-moh-freeplay-ulaw.tar.gz"
 
 do_install() {
 	install -d ${D}${localstatedir}/lib/asterisk/moh
diff --git a/recipes/asterisk/asterisk_1.2.24.bb b/recipes/asterisk/asterisk_1.2.24.bb
deleted file mode 100644
index 0db2b70..0000000
--- a/recipes/asterisk/asterisk_1.2.24.bb
+++ /dev/null
@@ -1,52 +0,0 @@
-# Copyright (C) 2007, Stelios Koroneos - Digital OPSiS, All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-DESCRIPTION="The Asterisk open source software PBX"
-HOMEPAGE="www.asterisk.org"
-LICENSE="GPL"
-DEPENDS="ncurses zlib openssl curl alsa-lib libogg libvorbis speex"
-SECTION = "console/telephony"
-PR = "r2"
-
-SRC_URI="http://downloads.asterisk.org/pub/telephony/asterisk/releases/${P}.tar.gz \
-	 file://uclibc-compat-getloadavg.patch \
-	 file://uclibc-dns.patch \
-         file://asterisk.patch \
-         file://enable-speex.patch"
-
-S = "${WORKDIR}/asterisk-${PV}"
-
-
-export CROSS_COMPILE="${CCACHE}${HOST_PREFIX}"
-export CROSS_COMPILE_BIN="${STAGING_BINDIR_CROSS}"
-export CROSS_COMPILE_TARGET="${STAGING_DIR_HOST}"
-
-export CROSS_ARCH="Linux"
-export CROSS_PROC="${TARGET_ARCH}"
-
-export MAKECMDGOALS="dont-optimize"
-
-# We will probably have to edit the CFLAG in the Makefile
-
-do_compile() {
-        oe_runmake
-}
-
-do_install() {
-        oe_runmake DESTDIR=${D} install
-}
-
-do_stage () {
-        install -d ${STAGING_INCDIR}/asterisk
-        install -m 0644 ${S}/include/asterisk/*.h ${STAGING_INCDIR}/asterisk/
-}
-
-
-FILES_${PN}-dbg += "${libdir}/asterisk/modules/.debug"
-FILES_${PN}-dbg += "/var/lib/asterisk/agi-bin/.debug"
-
-
-#SRC_URI[md5sum] = "63dc8b7be4cd10375c5fbda893c780bc"
-#SRC_URI[sha256sum] = "9debaf410636fa477e1e1f09fe0b16a1c2814afaf7195f34f29e4ce5b8debbbd"
-
-SRC_URI[md5sum] = "db7bcaaa494804af361157a37c224dfa"
-SRC_URI[sha256sum] = "eed3493b1409d7100e0f983af0486bd7f8965e9e47b7a6d5ab8539b2dd3609aa"
diff --git a/recipes/asterisk/asterisk_1.2.28.bb b/recipes/asterisk/asterisk_1.2.28.bb
deleted file mode 100644
index e49e68d..0000000
--- a/recipes/asterisk/asterisk_1.2.28.bb
+++ /dev/null
@@ -1,46 +0,0 @@
-# Copyright (C) 2007-2008, Stelios Koroneos - Digital OPSiS, All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-DESCRIPTION="The Asterisk open source software PBX"
-HOMEPAGE="www.asterisk.org"
-LICENSE="GPL"
-DEPENDS="ncurses zlib openssl curl alsa-lib libogg libvorbis speex"
-SECTION = "console/telephony"
-PR = "r2"
-
-SRC_URI="http://ftp.digium.com/pub/asterisk/releases/asterisk-${PV}.tar.gz \
-	 file://uclibc-compat-getloadavg.patch \
-	 file://uclibc-dns.patch \
-         file://asterisk.patch \
-         file://enable-speex.patch"
-
-S = "${WORKDIR}/asterisk-${PV}"
-
-
-export CROSS_COMPILE="${CCACHE}${HOST_PREFIX}"
-export CROSS_COMPILE_BIN="${STAGING_BINDIR_CROSS}"
-export CROSS_COMPILE_TARGET="${STAGING_DIR_HOST}"
-
-export CROSS_ARCH="Linux"
-export CROSS_PROC="${TARGET_ARCH}"
-
-export MAKECMDGOALS="dont-optimize"
-
-# We will probably have to edit the CFLAG in the Makefile
-
-do_compile() {
-        oe_runmake
-}
-
-do_install() {
-        oe_runmake DESTDIR=${D} install
-}
-
-do_stage () {
-        install -d ${STAGING_INCDIR}/asterisk
-        install -m 0644 ${S}/include/asterisk/*.h ${STAGING_INCDIR}/asterisk/
-}
-
-
-FILES_${PN}-dbg += "${libdir}/asterisk/modules/.debug"
-FILES_${PN}-dbg += "/var/lib/asterisk/agi-bin/.debug"
-
diff --git a/recipes/asterisk/asterisk_1.4.17.bb b/recipes/asterisk/asterisk_1.4.17.bb
deleted file mode 100644
index 97a111e..0000000
--- a/recipes/asterisk/asterisk_1.4.17.bb
+++ /dev/null
@@ -1,174 +0,0 @@
-# Copyright (C) 2007, Stelios Koroneos - Digital OPSiS, All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-DESCRIPTION = "The Asterisk open source software PBX"
-HOMEPAGE = "http://www.asterisk.org"
-SECTION = "voip"
-LICENSE = "GPLv2"
-PRIORITY = "optional"
-SECTION = "console/telephony"
-DEPENDS = "speex readline zlib openssl curl popt gnutls sqlite libogg libvorbis"
-#RRECOMMENDS_${PN} = "logrotate"
-PR = "r1"
-
-
-SRC_URI="http://ftp.digium.com/pub/asterisk/releases/asterisk-${PV}.tar.gz\
-	file://sounds.xml.patch\
-	file://Makefile.patch\
-	file://logrotate \
-	file://volatiles \
-	file://init"
-
-ARCH_efika="ppc"
-ARCH_dht-walnut="ppc"
-ARCH_magicbox="ppc"
-ARCH_sequoia="ppc"
-
-
-
-
-INITSCRIPT_NAME = "asterisk"
-INITSCRIPT_PARAMS = "defaults 60"
-
-inherit autotools update-rc.d
-
-EXTRA_OECONF =  "--with-ssl=${STAGING_EXECPREFIXDIR} \
-			--with-z=${STAGING_EXECPREFIXDIR} \
-			--with-curl=${STAGING_EXECPREFIXDIR} \
-			--with-termcap=${STAGING_EXECPREFIXDIR} \
-			--with-ogg=${STAGING_EXECPREFIXDIR} \
-			--with-vorbis=${STAGING_EXECPREFIXDIR} \
-			--with-sqlite=${STAGING_EXECPREFIXDIR} \
-			--with-popt=${STAGING_EXECPREFIXDIR} \
-			--with-gnutls=${STAGING_EXECPREFIXDIR} \
-			--without-curses\
-			--with-ncurses=${STAGING_EXECPREFIXDIR} \
-			--without-imap\
-			--without-netsnmp\
-			--without-odbc\
-			--without-osptk\
-			--without-nbs\
-			--without-pwlib\
-			--without-radius\
-			--without-tds\
-			--without-postgres\
-			--without-zaptel\
-			"
-
-#export NOISY_BUILD=yes
-
-export ASTCFLAGS = "-fsigned-char -I${STAGING_INCDIR} -DPATH_MAX=4096"
-export ASTLDFLAGS="${LDFLAGS} -lpthread -ldl -lresolv "
-export PROC="${ARCH}"
-
-do_configure_prepend () {
-	sed -i 's:/var:${localstatedir}:' ${WORKDIR}/logrotate
-	sed -i 's:/etc/init.d:${sysconfdir}/init.d:' ${WORKDIR}/logrotate
-	sed -i 's:/var:${localstatedir}:' ${WORKDIR}/volatiles
-}
-
-do_configure () {
-	# Looks like rebuilding configure doesn't work, so we are skipping
-	# that and are just using the shipped one
-	gnu-configize
-	libtoolize --force
-	oe_runconf
-}
-
-
-do_compile() {
-        (
-         #make sure that menuselect gets build using host toolchain
-         unset CC LD CXX CCLD CFLAGS CPPFLAGS LDFLAGS CXXFLAGS RANLIB
-         cd menuselect 
-         ./configure
-         oe_runmake
-         cd ../
-        ) || exit 1
-        oe_runmake
-}
-
-
-
-
-do_install_append() {
-        install -d ${D}${sysconfdir}/init.d/
-	install -m 755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/asterisk
-	install -c -D -m 644 ${WORKDIR}/logrotate ${D}${sysconfdir}/logrotate.d/asterisk
-	install -c -D -m 644 ${WORKDIR}/volatiles ${D}${sysconfdir}/default/volatiles/asterisk
-}
-
-pkg_postinst_prepend() {
-	grep -q asterisk  ${sysconfdir}/group || addgroup --system asterisk
-	grep -q asterisk ${sysconfdir}/passwd || adduser --system --home ${localstatedir}/run/asterisk --no-create-home --disabled-password --ingroup asterisk -s ${base_bindir}/false asterisk
-	chown -R asterisk:asterisk ${libdir}/asterisk ${localstatedir}/lib/asterisk ${localstatedir}/spool/asterisk ${localstatedir}/log/asterisk ${localstatedir}/run/asterisk ${sysconfdir}/asterisk
-}
-
-FILES_${PN} += "${libdir}/asterisk/modules/*"
-FILES_${PN}-dbg += "${libdir}/asterisk/modules/.debug \
-                    ${localstatedir}/lib/asterisk/*/.debug"
-
-CONFFILES_${PN} += "${sysconfdir}/asterisk/adsi.conf"
-CONFFILES_${PN} += "${sysconfdir}/asterisk/adtranvofr.conf"
-CONFFILES_${PN} += "${sysconfdir}/asterisk/agents.conf"
-CONFFILES_${PN} += "${sysconfdir}/asterisk/alarmreceiver.conf"
-CONFFILES_${PN} += "${sysconfdir}/asterisk/alsa.conf"
-CONFFILES_${PN} += "${sysconfdir}/asterisk/amd.conf"
-CONFFILES_${PN} += "${sysconfdir}/asterisk/asterisk.adsi"
-CONFFILES_${PN} += "${sysconfdir}/asterisk/asterisk.conf"
-CONFFILES_${PN} += "${sysconfdir}/asterisk/cdr.conf"
-CONFFILES_${PN} += "${sysconfdir}/asterisk/cdr_custom.conf"
-CONFFILES_${PN} += "${sysconfdir}/asterisk/cdr_manager.conf"
-CONFFILES_${PN} += "${sysconfdir}/asterisk/cdr_odbc.conf"
-CONFFILES_${PN} += "${sysconfdir}/asterisk/cdr_pgsql.conf"
-CONFFILES_${PN} += "${sysconfdir}/asterisk/cdr_tds.conf"
-CONFFILES_${PN} += "${sysconfdir}/asterisk/codecs.conf"
-CONFFILES_${PN} += "${sysconfdir}/asterisk/dnsmgr.conf"
-CONFFILES_${PN} += "${sysconfdir}/asterisk/dundi.conf"
-CONFFILES_${PN} += "${sysconfdir}/asterisk/enum.conf"
-CONFFILES_${PN} += "${sysconfdir}/asterisk/extconfig.conf"
-CONFFILES_${PN} += "${sysconfdir}/asterisk/extensions.ael"
-CONFFILES_${PN} += "${sysconfdir}/asterisk/extensions.conf"
-CONFFILES_${PN} += "${sysconfdir}/asterisk/features.conf"
-CONFFILES_${PN} += "${sysconfdir}/asterisk/festival.conf"
-CONFFILES_${PN} += "${sysconfdir}/asterisk/followme.conf"
-CONFFILES_${PN} += "${sysconfdir}/asterisk/func_odbc.conf"
-CONFFILES_${PN} += "${sysconfdir}/asterisk/gtalk.conf"
-CONFFILES_${PN} += "${sysconfdir}/asterisk/h323.conf"
-CONFFILES_${PN} += "${sysconfdir}/asterisk/http.conf"
-CONFFILES_${PN} += "${sysconfdir}/asterisk/iax.conf"
-CONFFILES_${PN} += "${sysconfdir}/asterisk/iaxprov.conf"
-CONFFILES_${PN} += "${sysconfdir}/asterisk/indications.conf"
-CONFFILES_${PN} += "${sysconfdir}/asterisk/jabber.conf"
-CONFFILES_${PN} += "${sysconfdir}/asterisk/logger.conf"
-CONFFILES_${PN} += "${sysconfdir}/asterisk/manager.conf"
-CONFFILES_${PN} += "${sysconfdir}/asterisk/meetme.conf"
-CONFFILES_${PN} += "${sysconfdir}/asterisk/mgcp.conf"
-CONFFILES_${PN} += "${sysconfdir}/asterisk/misdn.conf"
-CONFFILES_${PN} += "${sysconfdir}/asterisk/modules.conf"
-CONFFILES_${PN} += "${sysconfdir}/asterisk/musiconhold.conf"
-CONFFILES_${PN} += "${sysconfdir}/asterisk/muted.conf"
-CONFFILES_${PN} += "${sysconfdir}/asterisk/osp.conf"
-CONFFILES_${PN} += "${sysconfdir}/asterisk/oss.conf"
-CONFFILES_${PN} += "${sysconfdir}/asterisk/phone.conf"
-CONFFILES_${PN} += "${sysconfdir}/asterisk/privacy.conf"
-CONFFILES_${PN} += "${sysconfdir}/asterisk/queues.conf"
-CONFFILES_${PN} += "${sysconfdir}/asterisk/res_odbc.conf"
-CONFFILES_${PN} += "${sysconfdir}/asterisk/res_snmp.conf"
-CONFFILES_${PN} += "${sysconfdir}/asterisk/rpt.conf"
-CONFFILES_${PN} += "${sysconfdir}/asterisk/rtp.conf"
-CONFFILES_${PN} += "${sysconfdir}/asterisk/say.conf"
-CONFFILES_${PN} += "${sysconfdir}/asterisk/sip.conf"
-CONFFILES_${PN} += "${sysconfdir}/asterisk/sip_notify.conf"
-CONFFILES_${PN} += "${sysconfdir}/asterisk/skinny.conf"
-CONFFILES_${PN} += "${sysconfdir}/asterisk/sla.conf"
-CONFFILES_${PN} += "${sysconfdir}/asterisk/smdi.conf"
-CONFFILES_${PN} += "${sysconfdir}/asterisk/telcordia-1.adsi"
-CONFFILES_${PN} += "${sysconfdir}/asterisk/udptl.conf"
-CONFFILES_${PN} += "${sysconfdir}/asterisk/users.conf"
-CONFFILES_${PN} += "${sysconfdir}/asterisk/voicemail.conf"
-CONFFILES_${PN} += "${sysconfdir}/asterisk/vpb.conf"
-CONFFILES_${PN} += "${sysconfdir}/asterisk/zapata.conf"
-CONFFILES_${PN} += "${sysconfdir}/logrotate.d/asterisk"
-
-SRC_URI[md5sum] = "ff25f56d775858c4de619f2f59a55099"
-SRC_URI[sha256sum] = "85331e63c90370c305121f134358e76cbb06846a12c04a7825d5869f331ee00d"
diff --git a/recipes/asterisk/asterisk_1.4.19.1.bb b/recipes/asterisk/asterisk_1.4.19.1.bb
deleted file mode 100644
index 481fe84..0000000
--- a/recipes/asterisk/asterisk_1.4.19.1.bb
+++ /dev/null
@@ -1,173 +0,0 @@
-# Copyright (C) 2007-2008, Stelios Koroneos - Digital OPSiS, All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-DESCRIPTION = "The Asterisk open source software PBX"
-HOMEPAGE = "http://www.asterisk.org"
-LICENSE = "GPLv2"
-PRIORITY = "optional"
-SECTION = "console/telephony"
-DEPENDS = "speex readline zlib openssl curl popt gnutls sqlite libogg libvorbis"
-#RRECOMMENDS_${PN} = "logrotate"
-PR = "r2"
-
-
-SRC_URI="http://ftp.digium.com/pub/asterisk/releases/asterisk-${PV}.tar.gz\
-	file://sounds.xml.patch\
-	file://Makefile.patch\
-	file://logrotate \
-	file://volatiles \
-	file://init"
-
-ARCH_efika="powerpc"
-ARCH_dht-walnut="powerpc"
-ARCH_magicbox="powerpc"
-ARCH_sequoia="powerpc"
-
-
-
-
-INITSCRIPT_NAME = "asterisk"
-INITSCRIPT_PARAMS = "defaults 60"
-
-inherit autotools update-rc.d
-
-EXTRA_OECONF =  "--with-ssl=${STAGING_EXECPREFIXDIR} \
-			--with-z=${STAGING_EXECPREFIXDIR} \
-			--with-curl=${STAGING_EXECPREFIXDIR} \
-			--with-termcap=${STAGING_EXECPREFIXDIR} \
-			--with-ogg=${STAGING_EXECPREFIXDIR} \
-			--with-vorbis=${STAGING_EXECPREFIXDIR} \
-			--with-sqlite=${STAGING_EXECPREFIXDIR} \
-			--with-popt=${STAGING_EXECPREFIXDIR} \
-			--with-gnutls=${STAGING_EXECPREFIXDIR} \
-			--without-curses\
-			--with-ncurses=${STAGING_EXECPREFIXDIR} \
-			--without-imap\
-			--without-netsnmp\
-			--without-odbc\
-			--without-osptk\
-			--without-nbs\
-			--without-pwlib\
-			--without-radius\
-			--without-tds\
-			--without-postgres\
-			--without-zaptel\
-			"
-
-#export NOISY_BUILD=yes
-
-export ASTCFLAGS = "-fsigned-char -I${STAGING_INCDIR} -DPATH_MAX=4096"
-export ASTLDFLAGS="${LDFLAGS} -lpthread -ldl -lresolv "
-export PROC="${ARCH}"
-
-do_configure_prepend () {
-	sed -i 's:/var:${localstatedir}:' ${WORKDIR}/logrotate
-	sed -i 's:/etc/init.d:${sysconfdir}/init.d:' ${WORKDIR}/logrotate
-	sed -i 's:/var:${localstatedir}:' ${WORKDIR}/volatiles
-}
-
-do_configure () {
-	# Looks like rebuilding configure doesn't work, so we are skipping
-	# that and are just using the shipped one
-	# gnu-configize
-	# libtoolize --force
-	oe_runconf
-}
-
-
-do_compile() {
-        (
-         #make sure that menuselect gets build using host toolchain
-         unset CC LD CXX CCLD CFLAGS CPPFLAGS LDFLAGS CXXFLAGS RANLIB
-         cd menuselect 
-         ./configure
-         oe_runmake
-         cd ../
-        ) || exit 1
-        oe_runmake
-}
-
-
-
-
-do_install_append() {
-        install -d ${D}${sysconfdir}/init.d/
-	install -m 755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/asterisk
-	install -c -D -m 644 ${WORKDIR}/logrotate ${D}${sysconfdir}/logrotate.d/asterisk
-	install -c -D -m 644 ${WORKDIR}/volatiles ${D}${sysconfdir}/default/volatiles/asterisk
-}
-
-pkg_postinst_prepend() {
-	grep -q asterisk  ${sysconfdir}/group || addgroup --system asterisk
-	grep -q asterisk ${sysconfdir}/passwd || adduser --system --home ${localstatedir}/run/asterisk --no-create-home --disabled-password --ingroup asterisk -s ${base_bindir}/false asterisk
-	chown -R asterisk:asterisk ${libdir}/asterisk ${localstatedir}/lib/asterisk ${localstatedir}/spool/asterisk ${localstatedir}/log/asterisk ${localstatedir}/run/asterisk ${sysconfdir}/asterisk
-}
-
-FILES_${PN} += "${libdir}/asterisk/modules/*"
-FILES_${PN}-dbg += "${libdir}/asterisk/modules/.debug \
-                    ${localstatedir}/lib/asterisk/*/.debug"
-
-CONFFILES_${PN} += "${sysconfdir}/asterisk/adsi.conf"
-CONFFILES_${PN} += "${sysconfdir}/asterisk/adtranvofr.conf"
-CONFFILES_${PN} += "${sysconfdir}/asterisk/agents.conf"
-CONFFILES_${PN} += "${sysconfdir}/asterisk/alarmreceiver.conf"
-CONFFILES_${PN} += "${sysconfdir}/asterisk/alsa.conf"
-CONFFILES_${PN} += "${sysconfdir}/asterisk/amd.conf"
-CONFFILES_${PN} += "${sysconfdir}/asterisk/asterisk.adsi"
-CONFFILES_${PN} += "${sysconfdir}/asterisk/asterisk.conf"
-CONFFILES_${PN} += "${sysconfdir}/asterisk/cdr.conf"
-CONFFILES_${PN} += "${sysconfdir}/asterisk/cdr_custom.conf"
-CONFFILES_${PN} += "${sysconfdir}/asterisk/cdr_manager.conf"
-CONFFILES_${PN} += "${sysconfdir}/asterisk/cdr_odbc.conf"
-CONFFILES_${PN} += "${sysconfdir}/asterisk/cdr_pgsql.conf"
-CONFFILES_${PN} += "${sysconfdir}/asterisk/cdr_tds.conf"
-CONFFILES_${PN} += "${sysconfdir}/asterisk/codecs.conf"
-CONFFILES_${PN} += "${sysconfdir}/asterisk/dnsmgr.conf"
-CONFFILES_${PN} += "${sysconfdir}/asterisk/dundi.conf"
-CONFFILES_${PN} += "${sysconfdir}/asterisk/enum.conf"
-CONFFILES_${PN} += "${sysconfdir}/asterisk/extconfig.conf"
-CONFFILES_${PN} += "${sysconfdir}/asterisk/extensions.ael"
-CONFFILES_${PN} += "${sysconfdir}/asterisk/extensions.conf"
-CONFFILES_${PN} += "${sysconfdir}/asterisk/features.conf"
-CONFFILES_${PN} += "${sysconfdir}/asterisk/festival.conf"
-CONFFILES_${PN} += "${sysconfdir}/asterisk/followme.conf"
-CONFFILES_${PN} += "${sysconfdir}/asterisk/func_odbc.conf"
-CONFFILES_${PN} += "${sysconfdir}/asterisk/gtalk.conf"
-CONFFILES_${PN} += "${sysconfdir}/asterisk/h323.conf"
-CONFFILES_${PN} += "${sysconfdir}/asterisk/http.conf"
-CONFFILES_${PN} += "${sysconfdir}/asterisk/iax.conf"
-CONFFILES_${PN} += "${sysconfdir}/asterisk/iaxprov.conf"
-CONFFILES_${PN} += "${sysconfdir}/asterisk/indications.conf"
-CONFFILES_${PN} += "${sysconfdir}/asterisk/jabber.conf"
-CONFFILES_${PN} += "${sysconfdir}/asterisk/logger.conf"
-CONFFILES_${PN} += "${sysconfdir}/asterisk/manager.conf"
-CONFFILES_${PN} += "${sysconfdir}/asterisk/meetme.conf"
-CONFFILES_${PN} += "${sysconfdir}/asterisk/mgcp.conf"
-CONFFILES_${PN} += "${sysconfdir}/asterisk/misdn.conf"
-CONFFILES_${PN} += "${sysconfdir}/asterisk/modules.conf"
-CONFFILES_${PN} += "${sysconfdir}/asterisk/musiconhold.conf"
-CONFFILES_${PN} += "${sysconfdir}/asterisk/muted.conf"
-CONFFILES_${PN} += "${sysconfdir}/asterisk/osp.conf"
-CONFFILES_${PN} += "${sysconfdir}/asterisk/oss.conf"
-CONFFILES_${PN} += "${sysconfdir}/asterisk/phone.conf"
-CONFFILES_${PN} += "${sysconfdir}/asterisk/privacy.conf"
-CONFFILES_${PN} += "${sysconfdir}/asterisk/queues.conf"
-CONFFILES_${PN} += "${sysconfdir}/asterisk/res_odbc.conf"
-CONFFILES_${PN} += "${sysconfdir}/asterisk/res_snmp.conf"
-CONFFILES_${PN} += "${sysconfdir}/asterisk/rpt.conf"
-CONFFILES_${PN} += "${sysconfdir}/asterisk/rtp.conf"
-CONFFILES_${PN} += "${sysconfdir}/asterisk/say.conf"
-CONFFILES_${PN} += "${sysconfdir}/asterisk/sip.conf"
-CONFFILES_${PN} += "${sysconfdir}/asterisk/sip_notify.conf"
-CONFFILES_${PN} += "${sysconfdir}/asterisk/skinny.conf"
-CONFFILES_${PN} += "${sysconfdir}/asterisk/sla.conf"
-CONFFILES_${PN} += "${sysconfdir}/asterisk/smdi.conf"
-CONFFILES_${PN} += "${sysconfdir}/asterisk/telcordia-1.adsi"
-CONFFILES_${PN} += "${sysconfdir}/asterisk/udptl.conf"
-CONFFILES_${PN} += "${sysconfdir}/asterisk/users.conf"
-CONFFILES_${PN} += "${sysconfdir}/asterisk/voicemail.conf"
-CONFFILES_${PN} += "${sysconfdir}/asterisk/vpb.conf"
-CONFFILES_${PN} += "${sysconfdir}/asterisk/zapata.conf"
-CONFFILES_${PN} += "${sysconfdir}/logrotate.d/asterisk"
-
-SRC_URI[md5sum] = "3b416557d2c395a36b97a819812e99b0"
-SRC_URI[sha256sum] = "2bcc5d5620f8533eb4300ba1b48c9d2a00092ce04588e32f7074cf2aadc34259"
diff --git a/recipes/asterisk/asterisk_1.4.23.1.bb b/recipes/asterisk/asterisk_1.4.23.1.bb
index af6967a..ed44508 100644
--- a/recipes/asterisk/asterisk_1.4.23.1.bb
+++ b/recipes/asterisk/asterisk_1.4.23.1.bb
@@ -8,7 +8,7 @@ SECTION = "console/telephony"
 DEPENDS = "speex readline zlib openssl curl popt gnutls sqlite libogg libvorbis"
 #RRECOMMENDS_${PN} = "logrotate"
 
-SRC_URI="http://downloads.digium.com/pub/asterisk/releases/asterisk-${PV}.tar.gz \
+SRC_URI="http://downloads.asterisk.org/pub/telephony/asterisk/old-releases/asterisk-${PV}.tar.gz \
 #	file://sounds.xml.patch \
 	file://Makefile.patch \
 	file://logrotate \
diff --git a/recipes/asterisk/asterisk_1.6.0-beta8.bb b/recipes/asterisk/asterisk_1.6.0-beta8.bb
deleted file mode 100644
index db9e784..0000000
--- a/recipes/asterisk/asterisk_1.6.0-beta8.bb
+++ /dev/null
@@ -1,185 +0,0 @@
-# Copyright (C) 2008, Ovidiu Sas - VoIP Embedded Inc., All Rights Reserved
-# Copyright (C) 2008, Stelios Koroneos - Digital OPSiS, All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-DESCRIPTION = "The Asterisk open source software PBX"
-HOMEPAGE = "http://www.asterisk.org"
-LICENSE = "GPLv2"
-PRIORITY = "optional"
-SECTION = "console/telephony"
-DEPENDS = "speex readline zlib openssl curl popt gnutls sqlite libogg libvorbis"
-#RRECOMMENDS_${PN} = "logrotate"
-PV = "1.5.0+1.6.0beta8"
-PR = "r2"
-
-DEFAULT_PREFERENCE = "-1"
-
-
-SRC_URI="http://ftp.digium.com/pub/asterisk/releases/asterisk-${PV}.tar.gz\
-	file://sounds.xml.patch\
-	file://Makefile.patch\
-	file://logrotate \
-	file://volatiles \
-	file://init"
-
-ARCH_efika="powerpc"
-ARCH_dht-walnut="powerpc"
-ARCH_magicbox="powerpc"
-ARCH_sequoia="powerpc"
-
-INITSCRIPT_NAME = "asterisk"
-INITSCRIPT_PARAMS = "defaults 60"
-
-inherit autotools update-rc.d
-
-EXTRA_OECONF =  "--with-ssl=${STAGING_EXECPREFIXDIR}\
-			--with-z=${STAGING_EXECPREFIXDIR}\
-			--with-curl=${STAGING_EXECPREFIXDIR}\
-			--with-termcap=${STAGING_EXECPREFIXDIR}\
-			--with-ogg=${STAGING_EXECPREFIXDIR}\
-			--with-vorbis=${STAGING_EXECPREFIXDIR}\
-			--with-sqlite=${STAGING_EXECPREFIXDIR}\
-			--with-popt=${STAGING_EXECPREFIXDIR}\
-			--with-gnutls=${STAGING_EXECPREFIXDIR}\
-			--without-curses\
-			--with-ncurses=${STAGING_EXECPREFIXDIR}\
-			--without-imap\
-			--without-netsnmp\
-			--without-odbc\
-			--without-osptk\
-			--without-nbs\
-			--without-pwlib\
-			--without-radius\
-			--without-tds\
-			--without-postgres\
-			--without-zaptel\
-			"
-
-#export NOISY_BUILD=yes
-
-export ASTCFLAGS = "-fsigned-char -I${STAGING_INCDIR} -DPATH_MAX=4096"
-export ASTLDFLAGS="${LDFLAGS} -lpthread -ldl -lresolv "
-export PROC="${ARCH}"
-
-do_configure_prepend () {
-	sed -i 's:/var:${localstatedir}:' ${WORKDIR}/logrotate
-	sed -i 's:/etc/init.d:${sysconfdir}/init.d:' ${WORKDIR}/logrotate
-	sed -i 's:/var:${localstatedir}:' ${WORKDIR}/volatiles
-}
-
-do_configure () {
-	# Looks like rebuilding configure doesn't work, so we are skipping
-	# that and are just using the shipped one
-	gnu-configize
-	libtoolize --force
-	oe_runconf
-}
-
-
-do_compile() {
-        (
-         #make sure that menuselect gets build using host toolchain
-         unset CC LD CXX CCLD CFLAGS CPPFLAGS LDFLAGS CXXFLAGS RANLIB
-         cd menuselect 
-         ./configure
-         oe_runmake
-         cd ../
-        ) || exit 1
-        oe_runmake
-}
-
-do_stage() {
-	autotools_stage_includes
-}
-
-do_install_append() {
-        install -d ${D}${sysconfdir}/init.d/
-	install -m 755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/asterisk
-	install -c -D -m 644 ${WORKDIR}/logrotate ${D}${sysconfdir}/logrotate.d/asterisk
-	install -c -D -m 644 ${WORKDIR}/volatiles ${D}${sysconfdir}/default/volatiles/asterisk
-}
-
-pkg_postinst_prepend() {
-	grep -q asterisk  ${sysconfdir}/group || addgroup --system asterisk
-	grep -q asterisk ${sysconfdir}/passwd || adduser --system --home ${localstatedir}/run/asterisk --no-create-home --disabled-password --ingroup asterisk -s ${base_bindir}/false asterisk
-	chown -R asterisk:asterisk ${libdir}/asterisk ${localstatedir}/lib/asterisk ${localstatedir}/spool/asterisk ${localstatedir}/log/asterisk ${localstatedir}/run/asterisk ${sysconfdir}/asterisk
-}
-
-FILES_${PN} += "${libdir}/asterisk/modules/*"
-FILES_${PN}-dbg += "${libdir}/asterisk/modules/.debug \
-                    ${localstatedir}/lib/asterisk/*/.debug"
-
-CONFFILES_${PN} += "${sysconfdir}/asterisk/adsi.conf"
-CONFFILES_${PN} += "${sysconfdir}/asterisk/adtranvofr.conf"
-CONFFILES_${PN} += "${sysconfdir}/asterisk/agents.conf"
-CONFFILES_${PN} += "${sysconfdir}/asterisk/alarmreceiver.conf"
-CONFFILES_${PN} += "${sysconfdir}/asterisk/alsa.conf"
-CONFFILES_${PN} += "${sysconfdir}/asterisk/amd.conf"
-CONFFILES_${PN} += "${sysconfdir}/asterisk/asterisk.adsi"
-CONFFILES_${PN} += "${sysconfdir}/asterisk/asterisk.conf"
-CONFFILES_${PN} += "${sysconfdir}/asterisk/cdr.conf"
-CONFFILES_${PN} += "${sysconfdir}/asterisk/cdr_adaptive_odbc.conf"
-CONFFILES_${PN} += "${sysconfdir}/asterisk/cdr_custom.conf"
-CONFFILES_${PN} += "${sysconfdir}/asterisk/cdr_manager.conf"
-CONFFILES_${PN} += "${sysconfdir}/asterisk/cdr_odbc.conf"
-CONFFILES_${PN} += "${sysconfdir}/asterisk/cdr_pgsql.conf"
-CONFFILES_${PN} += "${sysconfdir}/asterisk/cdr_sqlite3_custom.conf"
-CONFFILES_${PN} += "${sysconfdir}/asterisk/cdr_tds.conf"
-CONFFILES_${PN} += "${sysconfdir}/asterisk/cli.conf"
-CONFFILES_${PN} += "${sysconfdir}/asterisk/codecs.conf"
-CONFFILES_${PN} += "${sysconfdir}/asterisk/console.conf"
-CONFFILES_${PN} += "${sysconfdir}/asterisk/dnsmgr.conf"
-CONFFILES_${PN} += "${sysconfdir}/asterisk/dundi.conf"
-CONFFILES_${PN} += "${sysconfdir}/asterisk/enum.conf"
-CONFFILES_${PN} += "${sysconfdir}/asterisk/extconfig.conf"
-CONFFILES_${PN} += "${sysconfdir}/asterisk/extensions.ael"
-CONFFILES_${PN} += "${sysconfdir}/asterisk/extensions.conf"
-CONFFILES_${PN} += "${sysconfdir}/asterisk/extensions.lua"
-CONFFILES_${PN} += "${sysconfdir}/asterisk/extensions_minivm.conf"
-CONFFILES_${PN} += "${sysconfdir}/asterisk/features.conf"
-CONFFILES_${PN} += "${sysconfdir}/asterisk/festival.conf"
-CONFFILES_${PN} += "${sysconfdir}/asterisk/followme.conf"
-CONFFILES_${PN} += "${sysconfdir}/asterisk/func_odbc.conf"
-CONFFILES_${PN} += "${sysconfdir}/asterisk/gtalk.conf"
-CONFFILES_${PN} += "${sysconfdir}/asterisk/h323.conf"
-CONFFILES_${PN} += "${sysconfdir}/asterisk/http.conf"
-CONFFILES_${PN} += "${sysconfdir}/asterisk/iax.conf"
-CONFFILES_${PN} += "${sysconfdir}/asterisk/iaxprov.conf"
-CONFFILES_${PN} += "${sysconfdir}/asterisk/indications.conf"
-CONFFILES_${PN} += "${sysconfdir}/asterisk/jabber.conf"
-CONFFILES_${PN} += "${sysconfdir}/asterisk/jingle.conf"
-CONFFILES_${PN} += "${sysconfdir}/asterisk/logger.conf"
-CONFFILES_${PN} += "${sysconfdir}/asterisk/manager.conf"
-CONFFILES_${PN} += "${sysconfdir}/asterisk/meetme.conf"
-CONFFILES_${PN} += "${sysconfdir}/asterisk/mgcp.conf"
-CONFFILES_${PN} += "${sysconfdir}/asterisk/minivm.conf"
-CONFFILES_${PN} += "${sysconfdir}/asterisk/misdn.conf"
-CONFFILES_${PN} += "${sysconfdir}/asterisk/modules.conf"
-CONFFILES_${PN} += "${sysconfdir}/asterisk/musiconhold.conf"
-CONFFILES_${PN} += "${sysconfdir}/asterisk/muted.conf"
-CONFFILES_${PN} += "${sysconfdir}/asterisk/osp.conf"
-CONFFILES_${PN} += "${sysconfdir}/asterisk/oss.conf"
-CONFFILES_${PN} += "${sysconfdir}/asterisk/phone.conf"
-CONFFILES_${PN} += "${sysconfdir}/asterisk/phoneprov.conf"
-CONFFILES_${PN} += "${sysconfdir}/asterisk/queuerules.conf"
-CONFFILES_${PN} += "${sysconfdir}/asterisk/queues.conf"
-CONFFILES_${PN} += "${sysconfdir}/asterisk/res_ldap.conf"
-CONFFILES_${PN} += "${sysconfdir}/asterisk/res_odbc.conf"
-CONFFILES_${PN} += "${sysconfdir}/asterisk/res_pgsql.conf"
-CONFFILES_${PN} += "${sysconfdir}/asterisk/res_snmp.conf"
-CONFFILES_${PN} += "${sysconfdir}/asterisk/rpt.conf"
-CONFFILES_${PN} += "${sysconfdir}/asterisk/rtp.conf"
-CONFFILES_${PN} += "${sysconfdir}/asterisk/say.conf"
-CONFFILES_${PN} += "${sysconfdir}/asterisk/sip.conf"
-CONFFILES_${PN} += "${sysconfdir}/asterisk/sip_notify.conf"
-CONFFILES_${PN} += "${sysconfdir}/asterisk/skinny.conf"
-CONFFILES_${PN} += "${sysconfdir}/asterisk/sla.conf"
-CONFFILES_${PN} += "${sysconfdir}/asterisk/smdi.conf"
-CONFFILES_${PN} += "${sysconfdir}/asterisk/telcordia-1.adsi"
-CONFFILES_${PN} += "${sysconfdir}/asterisk/udptl.conf"
-CONFFILES_${PN} += "${sysconfdir}/asterisk/unistim.conf"
-CONFFILES_${PN} += "${sysconfdir}/asterisk/usbradio.conf"
-CONFFILES_${PN} += "${sysconfdir}/asterisk/users.conf"
-CONFFILES_${PN} += "${sysconfdir}/asterisk/voicemail.conf"
-CONFFILES_${PN} += "${sysconfdir}/asterisk/vpb.conf"
-CONFFILES_${PN} += "${sysconfdir}/asterisk/zapata.conf"
-CONFFILES_${PN} += "${sysconfdir}/logrotate.d/asterisk"
-- 
1.6.3.3



