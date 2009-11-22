Received: from mail.gmx.net ([213.165.64.20])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <bernhard.kaindl@gmx.net>) id 1NCEqG-0006TN-JB
	for openembedded-devel@lists.openembedded.org;
	Sun, 22 Nov 2009 16:59:15 +0100
Received: (qmail invoked by alias); 22 Nov 2009 15:57:44 -0000
Received: from 85-127-140-254.dynamic.xdsl-line.inode.at (EHLO
	localhost.localdomain) [85.127.140.254]
	by mail.gmx.net (mp026) with SMTP; 22 Nov 2009 16:57:44 +0100
X-Authenticated: #154622
X-Provags-ID: V01U2FsdGVkX19YSEBOt8dYNGHoav9t+V+d2vC1JW1yiOJbZtS9bR
	BIjakwcQCttxhL
From: Bernhard Kaindl <bernhard.kaindl@gmx.net>
To: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sun, 22 Nov 2009 16:56:46 +0100
Message-Id: <1258905406-635-1-git-send-email-bernhard.kaindl@gmx.net>
X-Mailer: git-send-email 1.6.5.2
In-Reply-To: <heb98q$uh8$1@ger.gmane.org>
X-Y-GMX-Trusted: 0
X-FuHaFi: 0.45
X-SA-Exim-Connect-IP: 213.165.64.20
X-SA-Exim-Mail-From: bernhard.kaindl@gmx.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH] libsdl-mixer: delete libsdl-mixer_1.2.9.bb (as agreed upon)
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
X-List-Received-Date: Sun, 22 Nov 2009 15:59:15 -0000

Koen Kooi schrieb:
> On 21-11-09 06:55, GNUtoo wrote:
>> hi, I've a bad checksum for SDL_mixer-1.2.9.tar.gz
>> I've tried to download it a second time and the bad checksum persist
> 
> I propose we delete the 1.2.9 recipe and switch to 1.2.10 or 1.2.11 as 
> the default.

libsdl-mixer_1.2.11 is already the default since Wednesday when Graeme Gregory
comitted a recipe for it (1.2.10.bb exists since 11 days) - only two conf files
set a preferred version for libsdl-mixer - which is 1.2.6, not 1.2.9: 

grep -r PREFERRED_VERSION_libsdl-mixer conf/
conf/distro/chinook-compat.conf:PREFERRED_VERSION_libsdl-mixer          = "1.2.6"
conf/distro/include/preferred-om-2008-versions.inc:PREFERRED_VERSION_libsdl-mixer ?= "1.2.6"

That means:
1.2.9 it was the default SDL_mixer only from 22 Oct 2009 to 11 Nov 2009.

This search also gives no results:
http://www.google.at/search?q="PREFERRED_VERSION_libsdl-mixer+=+1.2.9"

So I'd say that everybody who did done a git pull in the last 10 days and did
not set REFERRED_VERSION_libsdl-mixer should not be at 1.2.11 now.

Bernhard

PS: Because a non-existing PREFERRED_VERSION causes bitbake to ignore it,
people which did set 1.2.9 as preferred will see a build of SDL_mixer 1.2.11
and then track whatever is the highest version.

PPS: Patch for commiting the delete:
--
libsdl-mixer:

* http://www.libsdl.org/projects/SDL_mixer/release/SDL_mixer-1.2.9.tar.gz
  has been repacked by upstream and everybody agreed with Koen to delete
  it because we already have recipes for newer versions.
---
 conf/checksums.ini                   |    4 ----
 recipes/libsdl/libsdl-mixer_1.2.9.bb |   23 -----------------------
 2 files changed, 0 insertions(+), 27 deletions(-)
 delete mode 100644 recipes/libsdl/libsdl-mixer_1.2.9.bb

diff --git a/conf/checksums.ini b/conf/checksums.ini
index 784a092..e0924db 100644
--- a/conf/checksums.ini
+++ b/conf/checksums.ini
@@ -1098,10 +1098,6 @@ sha256=89f94840b1b42ddfe53a8aee415331516f1bbdd942b42d25e74906a332cdf22a
 md5=0b5b91015d0f3bd9597e094ba67c4d65
 sha256=a8222a274778ff16d0e3ee49a30db27a48a4d357169a915fc599a764e405e0b6
 
-[http://www.libsdl.org/projects/SDL_mixer/release/SDL_mixer-1.2.9.tar.gz]
-md5=a9eb8750e920829ff41dbe7555850156
-sha256=557910a4a3aeed6d10238e26b5a39b19247115a1b352580082bb15dc02ae4b8d
-
 [http://www.libsdl.org/projects/SDL_net/release/SDL_net-1.2.5.tar.gz]
 md5=e45b1048d2747480dcc65ece4130a920
 sha256=397dee6b7ac13dea70dd3dd2ae6044f45a632a1ba156da178c96df66fb8ccdcb
diff --git a/recipes/libsdl/libsdl-mixer_1.2.9.bb b/recipes/libsdl/libsdl-mixer_1.2.9.bb
deleted file mode 100644
index 5ecd294..0000000
--- a/recipes/libsdl/libsdl-mixer_1.2.9.bb
+++ /dev/null
@@ -1,23 +0,0 @@
-DESCRIPTION = "Simple DirectMedia Layer mixer library."
-SECTION = "libs"
-PRIORITY = "optional"
-DEPENDS = "virtual/libsdl libmikmod libvorbis"
-LICENSE = "LGPL"
-
-SRC_URI = "http://www.libsdl.org/projects/SDL_mixer/release/SDL_mixer-${PV}.tar.gz"
-S = "${WORKDIR}/SDL_mixer-${PV}"
-
-export SDL_CONFIG = "${STAGING_BINDIR_CROSS}/sdl-config"
-
-inherit autotools_stage
-
-EXTRA_OECONF = "--disable-music-mp3"
-# although we build smpeg... need to find out how
-# to deal with optional dependencies
-
-do_compile() {
-	# Override SDL_LIBS to include a linker rpath so the linker
-	# can find the correct libdl.so when it links playwave to
-	# libSDL_mixer.so.
-	oe_runmake SDL_LIBS="$(pkg-config sdl --libs) -Wl,-rpath-link,${STAGING_LIBDIR}"
-}
-- 
1.6.0.4



