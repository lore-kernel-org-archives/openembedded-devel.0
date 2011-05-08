Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <robert@erafx.com>) id 1QJ1mV-0004xd-01
	for openembedded-devel@lists.openembedded.org;
	Sun, 08 May 2011 13:04:11 +0200
Received: by iwn10 with SMTP id 10so4078895iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 08 May 2011 04:01:27 -0700 (PDT)
Received: by 10.43.135.6 with SMTP id ie6mr4940323icc.44.1304852486353;
	Sun, 08 May 2011 04:01:26 -0700 (PDT)
Received: from localhost.localdomain (cpe-24-165-208-114.neo.res.rr.com
	[24.165.208.114])
	by mx.google.com with ESMTPS id o3sm2144808ibd.27.2011.05.08.04.01.25
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 08 May 2011 04:01:25 -0700 (PDT)
From: Bob Foerster <robert@erafx.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  8 May 2011 07:00:53 -0400
Message-Id: <1304852453-9294-1-git-send-email-robert@erafx.com>
X-Mailer: git-send-email 1.7.1
Subject: [PATCH v2] x264_r2245: do not override `DEPENDS` for x86
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
X-List-Received-Date: Sun, 08 May 2011 11:04:11 -0000

The recipe intended to add "yasm-native" to the dependencies on x86,
but it set DEPENDS_x86 = "yasm-native" which obliterated the base
dependencies. On a fresh build, this package was failing since it
was trying to build before the compiler was ready.

Depends is now set with DEPENDS_append_x86, which leaves the base
dependencies intact.

Signed-off-by: Bob Foerster <robert@erafx.com>
---
 recipes/vlc/x264_r2245.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/vlc/x264_r2245.bb b/recipes/vlc/x264_r2245.bb
index 0cffea3..21e5a0e 100644
--- a/recipes/vlc/x264_r2245.bb
+++ b/recipes/vlc/x264_r2245.bb
@@ -23,7 +23,7 @@ X264_ECFLAGS_mipsel = "-fPIC"
 X264_DISABLE_ASM = "--disable-asm"
 # use assembler written functions for those archs supporting this
 X264_DISABLE_ASM_x86 = ""
-DEPENDS_x86 = "yasm-native"
+DEPENDS_append_x86 = " yasm-native"
 
 EXTRA_OECONF = '--enable-shared ${X264_DISABLE_ASM} --extra-cflags="${X264_ECFLAGS}"'
 
-- 
1.7.1



