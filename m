Received: from mail-ee0-f65.google.com ([74.125.83.65])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Rlmji-0003Fc-Cg
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Jan 2012 20:24:26 +0100
Received: by eeke50 with SMTP id e50so85069eek.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Jan 2012 11:16:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=ZpHeMuMFxM7+1A5OuEwp/tqhiMhwWjN/9VWvGbjW2TE=;
	b=r5aHqNB8iEYyJ6miSh6RhwU5x33ryA1mAR6uxl4JP/O/BZm6E5h2NkvPx5PUbNGqRl
	2iy6M2r2bS2vepSfXH/NOFlT5uh01Kg+ETlQL0ScACks7tWO2QTNvjO+jIgIPa0ni46W
	jWUOsGr7bu5ls+ZyyzFzWlH2vcRkkfYVS9G+0=
Received: by 10.213.4.198 with SMTP id 6mr558970ebs.18.1326482213719;
	Fri, 13 Jan 2012 11:16:53 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id s16sm33168861eef.2.2012.01.13.11.16.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 13 Jan 2012 11:16:53 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 13 Jan 2012 20:16:42 +0100
Message-Id: <36d21bdc2795818de1101033a97884849df7477c.1326481985.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.3
In-Reply-To: <cover.1326481985.git.Martin.Jansa@gmail.com>
References: <cover.1326481985.git.Martin.Jansa@gmail.com>
Subject: [meta-handheld][PATCH 1/4] zaurus.inc: weak assignment to IMAGE_FSTYPES
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
X-List-Received-Date: Fri, 13 Jan 2012 19:24:26 -0000

* easier for builder to limit IMAGE_FSTYPES in local.conf

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 conf/machine/include/zaurus.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/conf/machine/include/zaurus.inc b/conf/machine/include/zaurus.inc
index 7f12ac3..ee24900 100644
--- a/conf/machine/include/zaurus.inc
+++ b/conf/machine/include/zaurus.inc
@@ -9,7 +9,7 @@ ERASEBLOCKSIZE_akita = "0x20000"
 # C3100 and C3200 have same 128MiB NAND device as akita
 ERASEBLOCKSIZE_spitz = "0x20000"
 
-IMAGE_FSTYPES += "tar.gz jffs2 sum.jffs2"
+IMAGE_FSTYPES ?= "tar.gz jffs2 sum.jffs2"
 
 # kernel now supports favourlzo
 EXTRA_IMAGECMD_jffs2 = "-p -l --eraseblock=${ERASEBLOCKSIZE}"
-- 
1.7.8.3



