Received: from mail-px0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1PNF6P-0004E5-UQ
	for openembedded-devel@lists.openembedded.org;
	Tue, 30 Nov 2010 02:33:55 +0100
Received: by pxi17 with SMTP id 17so837734pxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Nov 2010 17:32:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:content-type
	:content-transfer-encoding;
	bh=ASuBTs5HdugQFX04WEL0Mpbgox5H4vU9ij1fSkyk1jE=;
	b=fCDmEYp3VpUbWRu39Q00eSbh/6XYjLB+ycqxZMtfahQ8+0oyAfu1+IhYPPqTM3gSpT
	T7II8pgk+vjvxvkRZCTQDEXDvQduxReG0qsFDL58VPBnIanfiUxx4MH2peLkVKdH8JHe
	niQuyP9GTIqVwJ9aOofMuHMl6++vj2pBAY8gU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	b=W0hflh3ycZw3mQCjbJAOrl45UA7kenJFcQKlagMejBsbxno3AeFWzkRYTZdKkZjpJu
	5s3a5NdrD0b2wkeplxX/A5CXC7aRIB8wyAQQrJog7CA+dznYOkL+hxCewbvsPiVkNojn
	V0CSe9nysmKJxHjfv4qfCXHOq6V8UIdyWGfB4=
Received: by 10.142.171.17 with SMTP id t17mr6417615wfe.88.1291080752221;
	Mon, 29 Nov 2010 17:32:32 -0800 (PST)
Received: from [10.0.0.5] (eth7090.sa.adsl.internode.on.net [150.101.58.177])
	by mx.google.com with ESMTPS id
	w42sm8235786wfh.15.2010.11.29.17.32.28
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 29 Nov 2010 17:32:31 -0800 (PST)
Message-ID: <4CF45428.5030503@gmail.com>
Date: Tue, 30 Nov 2010 12:02:24 +1030
From: Graham Gower <graham.gower@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.15) Gecko/20101113 Thunderbird/3.0.10
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.212.175
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] alsa-utils_1.0.20.bb: Fix build when DISTRO_FEATURES lacks largefile.
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
X-List-Received-Date: Tue, 30 Nov 2010 01:33:55 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

mipsel-oe-linux-uclibc-gcc -march=mips32 -DHAVE_CONFIG_H -I. -I../include -I../include  -isystem/mnt/oe/tmp/sysroots/mipsel-oe-linux-uclibc/include  -isystem/mnt/oe/tmp/sysroots/mipsel-oe-linux-uclibc/include -fexpensive-optimizations -fomit-frame-pointer -frename-registers -Os -I/mnt/oe/tmp/sysroots/mipsel-oe-linux-uclibc/include -MT aplay.o -MD -MP -MF .deps/aplay.Tpo -c -o aplay.o aplay.c
aplay.c:116:16: error: expected '=', ',', ';', 'asm' or '__attribute__' before 'pbrec_count'
aplay.c: In function 'test_wavefile':
aplay.c:877:14: error: 'pbrec_count' undeclared (first use in this function)
aplay.c:877:14: note: each undeclared identifier is reported only once for each function it appears in
aplay.c: In function 'test_au':
aplay.c:908:2: error: 'pbrec_count' undeclared (first use in this function)
aplay.c: In function 'voc_play':
aplay.c:1751:2: error: 'off64_t' undeclared (first use in this function)
aplay.c:1751:10: error: expected ';' before 'filepos'
aplay.c:1881:9: error: 'filepos' undeclared (first use in this function)
aplay.c: At top level:
aplay.c:1968:16: error: expected '=', ',', ';', 'asm' or '__attribute__' before 'calc_count'
aplay.c: In function 'end_voc':
aplay.c:2137:2: error: 'off64_t' undeclared (first use in this function)
aplay.c:2137:10: error: expected ';' before 'length_seek'
aplay.c:2146:2: error: 'length_seek' undeclared (first use in this function)
aplay.c:2150:8: error: 'fdcount' undeclared (first use in this function)
aplay.c: In function 'end_wave':
aplay.c:2166:2: error: 'off64_t' undeclared (first use in this function)
aplay.c:2166:10: error: expected ';' before 'length_seek'
aplay.c:2167:10: error: expected ';' before 'filelen'
aplay.c:2170:2: error: 'length_seek' undeclared (first use in this function)
aplay.c:2174:14: error: 'fdcount' undeclared (first use in this function)
aplay.c:2175:2: error: 'filelen' undeclared (first use in this function)
aplay.c: In function 'end_au':
aplay.c:2188:2: error: 'off64_t' undeclared (first use in this function)
aplay.c:2188:10: error: expected ';' before 'length_seek'
aplay.c:2190:2: error: 'length_seek' undeclared (first use in this function)
aplay.c:2191:17: error: 'fdcount' undeclared (first use in this function)
aplay.c: At top level:
aplay.c:2221:48: error: expected declaration specifiers or '...' before 'off64_t'
aplay.c: In function 'playback_go':
aplay.c:2224:2: error: 'off64_t' undeclared (first use in this function)
aplay.c:2224:10: error: expected ';' before 'written'
aplay.c:2225:10: error: expected ';' before 'c'
aplay.c:2230:33: error: 'written' undeclared (first use in this function)
aplay.c:2230:43: error: 'count' undeclared (first use in this function)
aplay.c:2242:4: error: 'c' undeclared (first use in this function)
aplay.c:2254:4: error: 'fdcount' undeclared (first use in this function)
aplay.c: In function 'playback':
aplay.c:2283:2: error: 'pbrec_count' undeclared (first use in this function)
aplay.c:2284:2: error: 'fdcount' undeclared (first use in this function)
aplay.c:2303:3: warning: passing argument 4 of 'playback_go' makes pointer from integer without a cast
aplay.c:2221:13: note: expected 'char *' but argument is of type 'int'
aplay.c:2303:3: error: too many arguments to function 'playback_go'
aplay.c:2221:13: note: declared here
aplay.c:2320:3: warning: passing argument 4 of 'playback_go' makes pointer from integer without a cast
aplay.c:2221:13: note: expected 'char *' but argument is of type 'int'
aplay.c:2320:3: error: too many arguments to function 'playback_go'
aplay.c:2221:13: note: declared here
aplay.c:2325:3: error: too many arguments to function 'playback_go'
aplay.c:2221:13: note: declared here
aplay.c: In function 'capture':
aplay.c:2376:2: error: 'off64_t' undeclared (first use in this function)
aplay.c:2376:10: error: expected ';' before 'count'
aplay.c:2379:2: error: 'count' undeclared (first use in this function)
aplay.c:2424:3: error: 'rest' undeclared (first use in this function)
aplay.c:2433:3: error: 'fdcount' undeclared (first use in this function)
aplay.c:2435:33: error: expected ')' before 'chunk_bytes'
aplay.c: At top level:
aplay.c:2461:74: error: expected declaration specifiers or '...' before 'off64_t'
aplay.c: In function 'playbackv_go':
aplay.c:2480:9: error: 'count' undeclared (first use in this function)
aplay.c: At top level:
aplay.c:2513:58: error: expected declaration specifiers or '...' before 'off64_t'
aplay.c: In function 'capturev_go':
aplay.c:2529:9: error: 'count' undeclared (first use in this function)
aplay.c:2546:3: error: 'fdcount' undeclared (first use in this function)
aplay.c: In function 'playbackv':
aplay.c:2587:2: error: 'pbrec_count' undeclared (first use in this function)
aplay.c:2588:2: error: too many arguments to function 'playbackv_go'
aplay.c:2461:13: note: declared here
aplay.c: In function 'capturev':
aplay.c:2640:2: error: 'pbrec_count' undeclared (first use in this function)
aplay.c:2641:2: error: too many arguments to function 'capturev_go'
aplay.c:2513:13: note: declared here
make[1]: *** [aplay.o] Error 1

Signed-off-by: Graham Gower <graham.gower@gmail.com>
---
 recipes/alsa/alsa-utils-1.0.20/nolargefile.patch |   24 ++++++++++++++++++++++
 recipes/alsa/alsa-utils_1.0.20.bb                |    3 +-
 2 files changed, 26 insertions(+), 1 deletions(-)
 create mode 100644 recipes/alsa/alsa-utils-1.0.20/nolargefile.patch

diff --git a/recipes/alsa/alsa-utils-1.0.20/nolargefile.patch b/recipes/alsa/alsa-utils-1.0.20/nolargefile.patch
new file mode 100644
index 0000000..b32b509
--- /dev/null
+++ b/recipes/alsa/alsa-utils-1.0.20/nolargefile.patch
@@ -0,0 +1,24 @@
+--- alsa-utils-1.0.20/aplay/aplay.c.orig	2010-11-30 11:45:41.000000000 +1030
++++ alsa-utils-1.0.20/aplay/aplay.c	2010-11-30 11:55:57.000000000 +1030
+@@ -51,6 +51,21 @@
+ #include "formats.h"
+ #include "version.h"
+ 
++#ifndef __USE_LARGEFILE64
++#include <stdint.h>
++typedef uint64_t off64_t;
++off64_t
++lseek64(int fd, off64_t offset, int whence)
++{
++	if (offset >= (1 << ((sizeof(off_t)*8) - 1))) {
++		errno = EOVERFLOW;
++		return -1;
++	}
++	return lseek(fd, (off_t) offset, whence);
++}
++#define open64 open
++#endif
++
+ #ifndef LLONG_MAX
+ #define LLONG_MAX    9223372036854775807LL
+ #endif
diff --git a/recipes/alsa/alsa-utils_1.0.20.bb b/recipes/alsa/alsa-utils_1.0.20.bb
index ee0467e..74e9d13 100644
--- a/recipes/alsa/alsa-utils_1.0.20.bb
+++ b/recipes/alsa/alsa-utils_1.0.20.bb
@@ -3,10 +3,11 @@ HOMEPAGE = "http://www.alsa-project.org"
 SECTION = "console/utils"
 LICENSE = "GPLv2"
 DEPENDS = "alsa-lib ncurses"
-PR = "r4"
+PR = "r5"
 
 SRC_URI = "ftp://ftp.alsa-project.org/pub/utils/alsa-utils-${PV}.tar.bz2 \
 	   file://alsa-utils-remove-xmlto-1.0.19plus.patch \
+	   file://nolargefile.patch \
 	  "
 
 inherit gettext autotools
-- 
1.7.1



