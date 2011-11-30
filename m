Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RVfIg-0007LU-La
	for openembedded-devel@lists.openembedded.org;
	Wed, 30 Nov 2011 09:13:54 +0100
Received: by mail-ee0-f47.google.com with SMTP id c1so149163eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Nov 2011 00:07:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=tSIz3F2EjhSsR3T+4yoPXSX3rf9mwQwpOysXQFEWoRk=;
	b=pqKNgwA8iqFAcCVsarMgQtlao85IcvBd4W1catEQ2A3stdxGW/RgQAuWdOD5RNmzoE
	/oZoH2sneeFCEqx9u+XeLkqJRAyE6RGdxiNtJcdiYsJn06u9vJhS9Ns3XrgiaJeHrkQV
	2Ai27dUraKfQcdDiM3qMstC2+ATKSZ63Esyd4=
Received: by 10.14.3.202 with SMTP id 50mr113758eeh.178.1322640437043;
	Wed, 30 Nov 2011 00:07:17 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id 8sm3558572eei.8.2011.11.30.00.07.15
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 30 Nov 2011 00:07:16 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 30 Nov 2011 09:06:50 +0100
Message-Id: <f033335dc644faf6a03b4bc64cdeb78965c7c178.1322640244.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.rc4
In-Reply-To: <404d4fc58d6513392e0e567f15ebc92299c6f3df.1322640244.git.Martin.Jansa@gmail.com>
References: <404d4fc58d6513392e0e567f15ebc92299c6f3df.1322640244.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1322640244.git.Martin.Jansa@gmail.com>
References: <cover.1322640244.git.Martin.Jansa@gmail.com>
Subject: [meta-oo 3/4] mplayer2: drop OPTIMIZATIONs for now
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
X-List-Received-Date: Wed, 30 Nov 2011 08:13:54 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb |    7 +++++--
 1 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb b/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb
index c24cc4a..d6656fd 100644
--- a/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb
+++ b/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb
@@ -128,8 +128,11 @@ EXTRA_OECONF = " \
 	--extra-libs=' -lXext -lX11 -lBasicUsageEnvironment -lUsageEnvironment -lgroupsock -lliveMedia -lstdc++' \
 "
 
-FULL_OPTIMIZATION = "-fexpensive-optimizations -fomit-frame-pointer -frename-registers -O4 -ffast-math"
-BUILD_OPTIMIZATION = "${FULL_OPTIMIZATION}"
+# drop FULL_OPTIMIZATION for now, because gcc-4.6 got ICE with -O4 and -ffast-math now like in libvpx
+# http://lists.linuxtogo.org/pipermail/openembedded-devel/2011-November/036001.html
+# but lowering to -O3 is not enough in this case
+# FULL_OPTIMIZATION = "-fexpensive-optimizations -fomit-frame-pointer -frename-registers -O4 -ffast-math"
+# BUILD_OPTIMIZATION = "${FULL_OPTIMIZATION}"
 
 CFLAGS_append = " -I${S}/libdvdread4 "
 
-- 
1.7.8.rc4



