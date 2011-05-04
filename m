Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <robert@erafx.com>) id 1QHeVA-0000M4-7Y
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 May 2011 18:00:36 +0200
Received: by gwb11 with SMTP id 11so481155gwb.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 May 2011 08:57:54 -0700 (PDT)
Received: by 10.150.213.2 with SMTP id l2mr1192965ybg.361.1304524673805;
	Wed, 04 May 2011 08:57:53 -0700 (PDT)
Received: from localhost.localdomain (cpe-24-165-208-114.neo.res.rr.com
	[24.165.208.114])
	by mx.google.com with ESMTPS id p41sm2180758ybk.14.2011.05.04.08.57.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 04 May 2011 08:57:53 -0700 (PDT)
From: Bob Foerster <robert@erafx.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  4 May 2011 11:56:58 -0400
Message-Id: <1304524618-4864-1-git-send-email-robert@erafx.com>
X-Mailer: git-send-email 1.7.1
Subject: [PATCH] x264_r2245: fix DEPENDS for x86
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
X-List-Received-Date: Wed, 04 May 2011 16:00:36 -0000

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
index 0cffea3..8c2b5b4 100644
--- a/recipes/vlc/x264_r2245.bb
+++ b/recipes/vlc/x264_r2245.bb
@@ -23,7 +23,7 @@ X264_ECFLAGS_mipsel = "-fPIC"
 X264_DISABLE_ASM = "--disable-asm"
 # use assembler written functions for those archs supporting this
 X264_DISABLE_ASM_x86 = ""
-DEPENDS_x86 = "yasm-native"
+DEPENDS_append_x86 = "yasm-native"
 
 EXTRA_OECONF = '--enable-shared ${X264_DISABLE_ASM} --extra-cflags="${X264_ECFLAGS}"'
 
-- 
1.7.1



