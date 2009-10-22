Received: from [207.164.182.72] (helo=smtp.cbnco.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <michael@sles10-64.ott.cti.com>) id 1N15Ci-0007Dv-U9
	for openembedded-devel@lists.openembedded.org;
	Thu, 22 Oct 2009 23:28:20 +0200
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id 992115A7198;
	Thu, 22 Oct 2009 17:27:16 -0400 (EDT)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 04841-02; Thu, 22 Oct 2009 17:27:16 -0400 (EDT)
Received: by smtp.cbnco.com (Postfix, from userid 1003)
	id 755CD5A71A2; Thu, 22 Oct 2009 17:27:16 -0400 (EDT)
Received: from sles10-64.ott.cti.com (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTP id 2F5B15A70DD;
	Thu, 22 Oct 2009 17:27:15 -0400 (EDT)
Received: by sles10-64.ott.cti.com (Postfix, from userid 1000)
	id 1856D40AA2; Thu, 22 Oct 2009 17:27:14 -0400 (EDT)
From: Michael Smith <msmith@cbnco.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 22 Oct 2009 17:27:12 -0400
Message-Id: <1256246832-21537-1-git-send-email-msmith@cbnco.com>
X-Mailer: git-send-email 1.6.3
X-Virus-Scanned: amavisd-new at cbnco.com
X-SA-Exim-Connect-IP: 207.164.182.72
X-SA-Exim-Mail-From: michael@sles10-64.ott.cti.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [RFC][PATCH] libsdl-mixer: add 1.2.9
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
X-List-Received-Date: Thu, 22 Oct 2009 21:28:20 -0000

Signed-off-by: Michael Smith <msmith@cbnco.com>
---

When libtool was trying to link a binary (playwave) against
libSDL_mixer.so, it was finding my system /lib/libdl.so.2 because no
-rpath-link was set. This caused it to barf with:

/lib/libdl.so.2: undefined reference to `_dl_tls_get_addr_soft@GLIBC_PRIVATE'

I ended up overriding SDL_LIBS to include an -rpath-link directive.
This feels wrong, no other recipe seems to have to mess with -rpath-link,
but it does the trick here. OK to commit or am I missing a better
solution?

 conf/checksums.ini                                 |    4 ++++
 ...libsdl-mixer_1.2.8.bb => libsdl-mixer_1.2.9.bb} |    9 +++++++--
 2 files changed, 11 insertions(+), 2 deletions(-)
 copy recipes/libsdl/{libsdl-mixer_1.2.8.bb => libsdl-mixer_1.2.9.bb} (67%)

diff --git a/conf/checksums.ini b/conf/checksums.ini
index 6d71d25..f91cd4e 100644
--- a/conf/checksums.ini
+++ b/conf/checksums.ini
@@ -1010,6 +1010,10 @@ sha256=89f94840b1b42ddfe53a8aee415331516f1bbdd942b42d25e74906a332cdf22a
 md5=0b5b91015d0f3bd9597e094ba67c4d65
 sha256=a8222a274778ff16d0e3ee49a30db27a48a4d357169a915fc599a764e405e0b6
 
+[http://www.libsdl.org/projects/SDL_mixer/release/SDL_mixer-1.2.9.tar.gz]
+md5=a9eb8750e920829ff41dbe7555850156
+sha256=557910a4a3aeed6d10238e26b5a39b19247115a1b352580082bb15dc02ae4b8d
+
 [http://www.libsdl.org/projects/SDL_net/release/SDL_net-1.2.5.tar.gz]
 md5=e45b1048d2747480dcc65ece4130a920
 sha256=397dee6b7ac13dea70dd3dd2ae6044f45a632a1ba156da178c96df66fb8ccdcb
diff --git a/recipes/libsdl/libsdl-mixer_1.2.8.bb b/recipes/libsdl/libsdl-mixer_1.2.9.bb
similarity index 67%
copy from recipes/libsdl/libsdl-mixer_1.2.8.bb
copy to recipes/libsdl/libsdl-mixer_1.2.9.bb
index fec24ca..5ecd294 100644
--- a/recipes/libsdl/libsdl-mixer_1.2.8.bb
+++ b/recipes/libsdl/libsdl-mixer_1.2.9.bb
@@ -4,8 +4,6 @@ PRIORITY = "optional"
 DEPENDS = "virtual/libsdl libmikmod libvorbis"
 LICENSE = "LGPL"
 
-PR = "r1"
-
 SRC_URI = "http://www.libsdl.org/projects/SDL_mixer/release/SDL_mixer-${PV}.tar.gz"
 S = "${WORKDIR}/SDL_mixer-${PV}"
 
@@ -16,3 +14,10 @@ inherit autotools_stage
 EXTRA_OECONF = "--disable-music-mp3"
 # although we build smpeg... need to find out how
 # to deal with optional dependencies
+
+do_compile() {
+	# Override SDL_LIBS to include a linker rpath so the linker
+	# can find the correct libdl.so when it links playwave to
+	# libSDL_mixer.so.
+	oe_runmake SDL_LIBS="$(pkg-config sdl --libs) -Wl,-rpath-link,${STAGING_LIBDIR}"
+}
-- 
1.6.3



