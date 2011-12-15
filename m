Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Rb9RF-0002uG-7R
	for openembedded-devel@lists.openembedded.org;
	Thu, 15 Dec 2011 12:25:25 +0100
Received: by ghrr15 with SMTP id r15so1412168ghr.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Dec 2011 03:18:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=JWQM938b91Y/6zAMhkNDctCl/yLff6JLCg8JDVHVkjg=;
	b=cjhfZLfGOcazRVbL4jeoenoyC6AdiskGVV5+yoTgCxmVDep9LNglS34BHbSQpuHxix
	Ui1F0oP/sEj5r1gCfIkhggxDEmxPxlc1vBSd4XBaFDk8ktITQRmTc5UtvgLteMcdnGgu
	XLjZfJF9OoC71Tbe7vVuGEM8cmpF+oOVXHHQE=
Received: by 10.101.49.11 with SMTP id b11mr1108331ank.10.1323947904160;
	Thu, 15 Dec 2011 03:18:24 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id c44sm8652593yhm.5.2011.12.15.03.18.22
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 15 Dec 2011 03:18:23 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 15 Dec 2011 11:18:03 +0000
Message-Id: <62fa720b7381cecffe2b2546434128951d1abbc6.1323947853.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1323947853.git.otavio@ossystems.com.br>
References: <cover.1323947853.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1323947853.git.otavio@ossystems.com.br>
References: <cover.1323947853.git.otavio@ossystems.com.br>
Subject: [meta-oe][PATCH 2/5] xrdb: fix checksum
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
X-List-Received-Date: Thu, 15 Dec 2011 11:25:25 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta-oe/recipes-graphics/xorg-app/xrdb_1.0.9.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-graphics/xorg-app/xrdb_1.0.9.bb b/meta-oe/recipes-graphics/xorg-app/xrdb_1.0.9.bb
index 82b530e..1cc8534 100644
--- a/meta-oe/recipes-graphics/xorg-app/xrdb_1.0.9.bb
+++ b/meta-oe/recipes-graphics/xorg-app/xrdb_1.0.9.bb
@@ -6,5 +6,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d1167c4f586bd41f0c62166db4384a69"
 DEPENDS += "libxmu"
 PR = "r6"
 
-SRC_URI[archive.md5sum] = "ed2e48cf33584455d74615ad4bbe4246"
-SRC_URI[archive.sha256sum] = "642401e12996efe3e5e5307a245e24c282b94a44c1f147e177c8484b862aeab7"
+SRC_URI[md5sum] = "ed2e48cf33584455d74615ad4bbe4246"
+SRC_URI[sha256sum] = "642401e12996efe3e5e5307a245e24c282b94a44c1f147e177c8484b862aeab7"
-- 
1.7.2.5



