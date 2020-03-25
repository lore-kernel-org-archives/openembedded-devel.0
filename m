Received: from koncepto.io (koncepto.io [195.154.119.111])
 by mx.groups.io with SMTP id smtpd.web11.21456.1585165338882080763
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Mar 2020 12:42:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@koncepto.io header.s=default header.b=ZHkG+l/O;
 spf=pass (domain: koncepto.io, ip: 195.154.119.111, mailfrom: pjtexier@koncepto.io)
Received: from menoah.home (lfbn-bor-1-1500-88.w193-250.abo.wanadoo.fr [193.250.66.88])
	by koncepto.io (Postfix) with ESMTPSA id D5F75602AD;
	Wed, 25 Mar 2020 20:42:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=koncepto.io;
	s=default; t=1585165336;
	bh=EIh8CrA7kB6eMEpMtYSWagLKNytklBrV2UZRyHF+Y8k=;
	h=From:To:Cc:Subject:Date:From;
	b=ZHkG+l/OEGcwgib7McbQvkZhOkkfOLrlgYf2/V/yL4h9JdnooLUr4NjYtrp+Dfmks
	 Y6zQ1aSamuE25PbvOVBvmuq4xYRhTlM4ekDh6pA/O7ddAkq5LbfnBTAka2DopzxyD1
	 TT2Cyu0+M0+Y4sicWiu6KNxG2n2K9cdJNFMq5Q6iKZKV5H/sFJ13YKlyMymv+uZWXu
	 liToP1Dzj9uYj+Y/XtNwGFlXgera5gXG4ACVqJiQVlQZVbXmrRVSpiF0JbdWBv13Sj
	 2fek4dY+1tBZMHCvH183EE2a3SMIFoPHi1uDivFn9+FXIQ//Zo0y3Fukmm5oyraN9q
	 1SA9x2sw9cMHg==
From: "Pierre-Jean Texier" <pjtexier@koncepto.io>
To: openembedded-devel@lists.openembedded.org
Cc: Pierre-Jean Texier <pjtexier@koncepto.io>
Subject: [meta-oe][PATCH 1/3] libiio: fix upstream check URL
Date: Wed, 25 Mar 2020 20:42:10 +0100
Message-Id: <1585165332-10783-1-git-send-email-pjtexier@koncepto.io>
X-Mailer: git-send-email 2.7.4

Fixes:

INFO: libiio                    0.19            2015.2          None 18563161daa5d61c9e404be26e714dbaf0f344f2

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 meta-oe/recipes-support/libiio/libiio_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-support/libiio/libiio_git.bb b/meta-oe/recipes-support/libiio/libiio_git.bb
index 0586349..f83d9c9 100644
--- a/meta-oe/recipes-support/libiio/libiio_git.bb
+++ b/meta-oe/recipes-support/libiio/libiio_git.bb
@@ -8,6 +8,7 @@ SRCREV = "5f5af2e417129ad8f4e05fc5c1b730f0694dca12"
 PV = "0.19+git${SRCPV}"
 
 SRC_URI = "git://github.com/analogdevicesinc/libiio.git;protocol=https"
+UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 
 S = "${WORKDIR}/git"
 
-- 
2.7.4

