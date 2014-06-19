Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by mail.openembedded.org (Postfix) with ESMTP id BF44070198
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jun 2014 10:00:20 +0000 (UTC)
Received: by mail-wi0-f178.google.com with SMTP id n15so2543613wiw.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jun 2014 03:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=RDoa23V3lOFzi/2SnCtGextstkHU5VUkmxEUoWG4tnk=;
	b=egOIW2prZIs6Jw9Z7IL5u1ryzLdk+ST4anJbsEFyoU2IW2kSDm/Jxu0VodldyXMcsy
	EJVFSrptKPTT6tqynGSEVIonIvDVrgvuH4B0wcKbrHbK118S4GKANiX3/doqTqLnBvGw
	He8+I8uNhEzNXl7hBJpHX0G46OGMz08Q6gFewkeNxPSfoAQAeS2Az/0ppjBvPR9WmHdA
	zi/Hq0L4u6sOYgIx7ZHoaM8woC2+pZdefbCQtu9WEWJU54A3K0bxvlKwTH4/xIn1dfNQ
	z0Rpeo0dhCQIQbuOdERv0rJO0iLFj7Mj9EanmD0wJ2rNCwuVqodI7wtPSyXU7XN8nLOr
	V6WA==
X-Received: by 10.194.76.212 with SMTP id m20mr3967432wjw.30.1403172021040;
	Thu, 19 Jun 2014 03:00:21 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	pq9sm7671590wjc.35.2014.06.19.03.00.20 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 19 Jun 2014 03:00:20 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 19 Jun 2014 11:59:50 +0200
Message-Id: <1403171993-26208-22-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.0
In-Reply-To: <1403171993-26208-1-git-send-email-Martin.Jansa@gmail.com>
References: <1403171993-26208-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][WIP][PATCH 22/25] zsh: Blacklist because of broken with B!=S
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 19 Jun 2014 10:00:22 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-extended/zsh/zsh.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-extended/zsh/zsh.inc b/meta-oe/recipes-extended/zsh/zsh.inc
index db51f39..86a546e 100644
--- a/meta-oe/recipes-extended/zsh/zsh.inc
+++ b/meta-oe/recipes-extended/zsh/zsh.inc
@@ -8,6 +8,8 @@ SECTION = "base/shell"
 LICENSE = "zsh"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=b7bc853894664be455a922db9805288e"
 
+PNBLACKLIST[zsh] = "BROKEN: doesn't build with B!=S (gnu-configize executed in ${B})"
+
 DEPENDS = "ncurses bison-native"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.tar.gz"
-- 
2.0.0


