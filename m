Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RYEvg-0007OT-NP
	for openembedded-devel@lists.openembedded.org;
	Wed, 07 Dec 2011 11:40:48 +0100
Received: by eekb15 with SMTP id b15so273049eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 Dec 2011 02:34:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=ET+YKu8dlfW4PG2KnQVQrExlSb8mluWedltQFK7eu0w=;
	b=cF2TST9QlPlGuIymvl9S5iF9p0/Lv47HmJdOXWW9ULcL+nvsjPAShnQhEZQlNiIPgX
	nzLWijzWg67WQa4xXr0kq+3XfL7a81RBI55Azbkc4S37NbGkpVo07T8z1jRQp1S2OD13
	uPsmlWKgcGXM4ToGqfKkdyWGnC4lin+OEl5UQ=
Received: by 10.14.17.95 with SMTP id i71mr3363848eei.184.1323254040539;
	Wed, 07 Dec 2011 02:34:00 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id 49sm4231273eec.1.2011.12.07.02.33.56
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 07 Dec 2011 02:33:58 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  7 Dec 2011 11:33:47 +0100
Message-Id: <1323254027-15266-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8
Subject: [PATCHv2][meta-oe] mplayer2: fix DSO issue with new binutils
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
X-List-Received-Date: Wed, 07 Dec 2011 10:40:49 -0000

* /OE/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/libexec/armv4t-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.6.3/ld:
  libmpdemux/demux_ogg.o: undefined reference to symbol '_ilog'
  /OE/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/libexec/armv4t-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.6.3/ld:
  note: '_ilog' is defined in DSO
  /OE/shr-core/tmp-eglibc/sysroots/om-gta02/usr/lib/libvorbis.so.0 so try adding it to the linker command line
  /OE/shr-core/tmp-eglibc/sysroots/om-gta02/usr/lib/libvorbis.so.0: could not read symbols: Invalid operation

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb b/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb
index 7d2d258..81d3376 100644
--- a/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb
+++ b/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb
@@ -22,7 +22,7 @@ SRCREV = "e3f5043233336d8b4b0731c6a8b42a8fda5535ac"
 ARM_INSTRUCTION_SET = "ARM"
 
 PV = "2.0+gitr${SRCPV}"
-PR = "r2"
+PR = "r3"
 
 PARALLEL_MAKE = ""
 
@@ -125,7 +125,7 @@ EXTRA_OECONF = " \
 	--enable-select \
 	--enable-libass \
 	\
-	--extra-libs=' -lXext -lX11 -lBasicUsageEnvironment -lUsageEnvironment -lgroupsock -lliveMedia -lstdc++' \
+	--extra-libs=' -lXext -lX11 -lBasicUsageEnvironment -lUsageEnvironment -lgroupsock -lliveMedia -lstdc++ -lvorbis ' \
 "
 
 EXTRA_OECONF_append_armv6 = " --enable-armv6"
-- 
1.7.8



