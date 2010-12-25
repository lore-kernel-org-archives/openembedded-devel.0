Received: from [93.100.16.104] (helo=mate.hex)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rik@mate.hex>) id 1PWRg7-0006Tw-Hw
	for openembedded-devel@lists.openembedded.org;
	Sat, 25 Dec 2010 11:48:47 +0100
Received: by mate.hex (Postfix, from userid 1000)
	id D7B1220FFE; Sat, 25 Dec 2010 13:48:35 +0300 (MSK)
From: Roman I Khimov <khimov@altell.ru>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 25 Dec 2010 13:48:29 +0300
Message-Id: <1293274109-15695-5-git-send-email-khimov@altell.ru>
X-Mailer: git-send-email 1.6.4.2
In-Reply-To: <1293274109-15695-4-git-send-email-khimov@altell.ru>
References: <1293274109-15695-1-git-send-email-khimov@altell.ru>
	<1293274109-15695-2-git-send-email-khimov@altell.ru>
	<1293274109-15695-3-git-send-email-khimov@altell.ru>
	<1293274109-15695-4-git-send-email-khimov@altell.ru>
Subject: [PATCH 5/5] perl: fix some arch-specific config.sh variables
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
X-List-Received-Date: Sat, 25 Dec 2010 10:48:47 -0000

 * d_nv_preserves_uv, d_u32align, longlongsize: arch-specific, doesn't
   belong to generic config.sh
 * d_printf_format_null: missed definition for 32-bit archs
 * gidformat: wrong definition for 32-bit archs
 * uquadtype: defined twice, clean up
 * sGMTIME_max, sGMTIME_min, sLOCALTIME_max, sLOCALTIME_min: missed
   definition for 64-bit archs
 * d_u32align should be defined for ARM, although it's 32-bit arch

Signed-off-by: Roman I Khimov <khimov@altell.ru>
---
 recipes/perl/perl-5.10.1/config.sh    |    3 ---
 recipes/perl/perl-5.10.1/config.sh-32 |    4 ++--
 recipes/perl/perl-5.10.1/config.sh-64 |    5 ++++-
 recipes/perl/perl_5.10.1.bb           |    6 +++++-
 4 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/recipes/perl/perl-5.10.1/config.sh b/recipes/perl/perl-5.10.1/config.sh
index feab9c0..435f39d 100644
--- a/recipes/perl/perl-5.10.1/config.sh
+++ b/recipes/perl/perl-5.10.1/config.sh
@@ -336,7 +336,6 @@ d_ndbm='undef'
 d_ndbm_h_uses_prototypes='undef'
 d_nice='define'
 d_nl_langinfo='define'
-d_nv_preserves_uv='undef'
 d_nv_zero_is_allbits_zero='define'
 d_off64_t='define'
 d_old_pthread_create_joinable='undef'
@@ -499,7 +498,6 @@ d_tmpnam_r='define'
 d_truncate='define'
 d_ttyname_r='define'
 d_tzname='define'
-d_u32align='undef'
 d_ualarm='define'
 d_umask='define'
 d_uname='define'
@@ -759,7 +757,6 @@ lns='/bin/ln -s'
 localtime_r_proto='REENTRANT_PROTO_S_TS'
 locincpth='/usr/local/include /opt/local/include /usr/gnu/include /opt/gnu/include /usr/GNU/include /opt/GNU/include'
 loclibpth='/usr/local/lib /opt/local/lib /usr/gnu/lib /opt/gnu/lib /usr/GNU/lib /opt/GNU/lib'
-longlongsize='8'
 lp=''
 lpr=''
 ls='ls'
diff --git a/recipes/perl/perl-5.10.1/config.sh-32 b/recipes/perl/perl-5.10.1/config.sh-32
index fb0352d..a74e171 100644
--- a/recipes/perl/perl-5.10.1/config.sh-32
+++ b/recipes/perl/perl-5.10.1/config.sh-32
@@ -8,10 +8,11 @@ cppccsymbols='__GNUC__=3 __GNUC_MINOR__=3'
 cppflags='-D_REENTRANT -D_GNU_SOURCE -DTHREADS_HAVE_PIDS -fno-strict-aliasing -pipe -I/usr/local/include'
 cppsymbols='__ELF__=1 _FILE_OFFSET_BITS=64 __GLIBC__=2 __GLIBC_MINOR__=3 __GNU_LIBRARY__=6 _GNU_SOURCE=1 i386=1 __i386=1 __i386__=1 __i486=1 __i486__=1 _LARGEFILE64_SOURCE=1 _LARGEFILE_SOURCE=1 linux=1 __linux=1 __linux__=1 _POSIX_C_SOURCE=199506L _POSIX_SOURCE=1 _REENTRANT=1 __STDC__=1 unix=1 __unix=1 __unix__=1 __USE_BSD=1 __USE_FILE_OFFSET64=1 __USE_GNU=1 __USE_LARGEFILE=1 __USE_LARGEFILE64=1 __USE_MISC=1 __USE_POSIX=1 __USE_POSIX199309=1 __USE_POSIX199506=1 __USE_POSIX2=1 __USE_REENTRANT=1 __USE_SVID=1 __USE_UNIX98=1 __USE_XOPEN=1 __USE_XOPEN_EXTENDED=1 _XOPEN_SOURCE=600 _XOPEN_SOURCE_EXTENDED=1'
 d_nv_preserves_uv='define'
+d_printf_format_null='define'
 d_u32align='undef'
 gccversion='4.3.3'
 getspnam_r_proto='0'
-gidformat='"u"'
+gidformat='"lu"'
 i32type='long'
 i64type='long long'
 ivsize='4'
@@ -40,7 +41,6 @@ osvers='2.6.21-rc5'
 ptrsize='4'
 quadkind='3'
 quadtype='long long'
-uquadtype='unsigned long long'
 sGMTIME_max='2147483647'
 sGMTIME_min='-2147483648'
 sLOCALTIME_max='2147483647'
diff --git a/recipes/perl/perl-5.10.1/config.sh-64 b/recipes/perl/perl-5.10.1/config.sh-64
index 480273d..17466cc 100644
--- a/recipes/perl/perl-5.10.1/config.sh-64
+++ b/recipes/perl/perl-5.10.1/config.sh-64
@@ -39,7 +39,6 @@ osvers='2.6.20.4'
 ptrsize='8'
 quadkind='2'
 quadtype='long'
-uquadtype='unsigned long'
 sPRIXU64='"lX"'
 sPRId64='"ld"'
 sPRIi64='"li"'
@@ -47,6 +46,10 @@ sPRIo64='"lo"'
 sPRIu64='"lu"'
 sPRIx64='"lx"'
 selectminbits='64'
+sGMTIME_max='67768036191676799'
+sGMTIME_min='-62167219200'
+sLOCALTIME_max='67768036191676799'
+sLOCALTIME_min='-62167219200'
 sizesize='8'
 u32type='unsigned int'
 u64type='unsigned long'
diff --git a/recipes/perl/perl_5.10.1.bb b/recipes/perl/perl_5.10.1.bb
index a58b8ec..d8c374b 100644
--- a/recipes/perl/perl_5.10.1.bb
+++ b/recipes/perl/perl_5.10.1.bb
@@ -5,7 +5,7 @@ LICENSE = "Artistic|GPLv1+"
 PRIORITY = "optional"
 # We need gnugrep (for -I)
 DEPENDS = "virtual/db perl-native grep-native"
-PR = "r17"
+PR = "r18"
 
 # 5.10.1 has Module::Build built-in
 PROVIDES += "libmodule-build-perl"
@@ -154,6 +154,10 @@ do_configure() {
 			sed -i -e "s,\(need_va_copy=\)'undef',\1'define',g" \
 				config.sh-${TARGET_ARCH}-${TARGET_OS}
 			;;
+		arm)
+			sed -i -e "s,\(d_u32align=\)'undef',\1'define',g" \
+				config.sh-${TARGET_ARCH}-${TARGET_OS}
+			;;
 	esac
 
         if test "${MACHINE}" != "native"; then
-- 
1.6.4.2



