Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Q23Ha-00034E-NL
	for openembedded-devel@lists.openembedded.org;
	Tue, 22 Mar 2011 16:14:06 +0100
Received: by yxn22 with SMTP id 22so2905863yxn.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Mar 2011 08:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:cc:subject:date:message-id
	:x-mailer:in-reply-to:references;
	bh=tUn3IHhlm14NevZ1Ok9+SsEXGg1Ejaz6y/xCIQMLouw=;
	b=T1QVpQ0PKlA22HrCKGqqy85LJANPUutIsW+y0z84OgCaOyGM70qEx+Ic9fYXcn6pNn
	1TFgNWV5DL7m3nLYxGH49O14m6TMH4MPGaI40q+ODMTTEqgZCqePfk8HfcMCg6mH5yBc
	NU9ifwGEOeQVUrpx4weDLBPCWZx0j2bqTy4eM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=GhaUSmW40mtrrb9Pck72kJILT7mTWtSmAukX19tJZCgrBCypI3ez9zk66xcdFCVw4u
	qcsleB6yMLfj0fFoKfiS1m7niUUaMn5m/bWqthmYsVutxfIRk2ntCq09iD81r5Uf303h
	FyfVvm3axbYnRR0NV7qoHlLZ7QgSmf3Fte18s=
Received: by 10.150.239.4 with SMTP id m4mr1597515ybh.402.1300806736306;
	Tue, 22 Mar 2011 08:12:16 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id o2sm1732487ybn.21.2011.03.22.08.12.13
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 22 Mar 2011 08:12:14 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 22 Mar 2011 15:11:23 +0000
Message-Id: <1300806683-17244-5-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.3
In-Reply-To: <1300806683-17244-1-git-send-email-otavio@ossystems.com.br>
References: <1300806683-17244-1-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 4/4] vlc (1.1.4.1): depends on lua5.1
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
X-List-Received-Date: Tue, 22 Mar 2011 15:14:06 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 recipes/vlc/vlc_1.1.4.1.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes/vlc/vlc_1.1.4.1.bb b/recipes/vlc/vlc_1.1.4.1.bb
index 6d4b877..18297c9 100644
--- a/recipes/vlc/vlc_1.1.4.1.bb
+++ b/recipes/vlc/vlc_1.1.4.1.bb
@@ -5,14 +5,14 @@
 
 require vlc.inc
 
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 
 SRC_URI[md5sum] = "ce17c335b38b322949694313173fcd49"
 SRC_URI[sha256sum] = "61c9ea30a17ea40c6ccbfd507026e5c83ad9e0691f221d3667c8e49696d7c2aa"
 
 # ffmpeg from git (library version => 52) is required
 # libtool-native must be >= 2.2.4
-DEPENDS += "libdvdcss libdvdread lua5.1-native"
+DEPENDS += "libdvdcss libdvdread lua5.1-native lua5.1"
 RDEPENDS_${PN} += "lua5.1"
 
 EXTRA_OECONF += "\
-- 
1.7.2.3



