Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1R48Ih-00024b-EU
	for openembedded-devel@lists.openembedded.org;
	Thu, 15 Sep 2011 11:32:07 +0200
Received: by mail-bw0-f47.google.com with SMTP id 11so2253934bke.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Sep 2011 02:26:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=YhIlTAo1kZowZkc9Hn6o14lbhy8G7+Kzj0K7hIIdyGA=;
	b=sHN22cxVNP3OPpMXnGA/Ry9sUS/RfO3Pa64KdysQrR/BfHFGv3YWyAxFwiVOjanCqG
	OK54vE1U7r03x4+plxx4hEP+J98iCc0KFwz4WbIjnaICSpWok4OgVt7+CYT99ERtUwet
	mt+bXhFAuoj/QN+657YGeNO9AlMpTBfmd550M=
Received: by 10.204.129.20 with SMTP id m20mr529634bks.335.1316078818191;
	Thu, 15 Sep 2011 02:26:58 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id fc13sm2128470bkc.0.2011.09.15.02.26.56
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 15 Sep 2011 02:26:57 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 15 Sep 2011 11:26:32 +0200
Message-Id: <caf3c06098fc74b98ff76174a45811461975a178.1316078712.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.6.1
In-Reply-To: <6f97022ee7adf86a732e555279716791430880c4.1316078712.git.Martin.Jansa@gmail.com>
References: <6f97022ee7adf86a732e555279716791430880c4.1316078712.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1316078712.git.Martin.Jansa@gmail.com>
References: <cover.1316078712.git.Martin.Jansa@gmail.com>
Subject: [meta-handheld][PATCH 3/3] linux_git: set CMDLINE_DEBUG to debug for git version
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
X-List-Received-Date: Thu, 15 Sep 2011 09:32:08 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-kernel/linux/linux_git.bb |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/recipes-kernel/linux/linux_git.bb b/recipes-kernel/linux/linux_git.bb
index 256ee0e..fbe3049 100644
--- a/recipes-kernel/linux/linux_git.bb
+++ b/recipes-kernel/linux/linux_git.bb
@@ -1,3 +1,4 @@
+CMDLINE_DEBUG = "debug"
 require linux.inc
 require linux-git.inc
 
-- 
1.7.6.1



