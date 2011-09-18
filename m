Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dbaryshkov@gmail.com>) id 1R5FYM-0003rO-Ri
	for openembedded-devel@lists.openembedded.org;
	Sun, 18 Sep 2011 13:28:55 +0200
Received: by mail-fx0-f47.google.com with SMTP id 1so3592243fxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Sep 2011 04:23:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=gKuRic2lJd/i361byGeRClQ724o4oHk7IZf9q7HdW74=;
	b=sgPFvMddMz4nCHcbTLYFsi0VrubcW1xSZxwHqeRLm7u5D+A50rUjCpsfRcNFMgabhw
	ycfsVu0YEGABF/jyKgBtdskAoPf0GzA5fzFhtwOPVAzqDcGCKDbVb4xr6YUadgEw2Q/G
	4v8N483+uv1TEjHba7Z9R/37DdY7k1COJWSSY=
Received: by 10.223.29.76 with SMTP id p12mr3027582fac.51.1316345022286;
	Sun, 18 Sep 2011 04:23:42 -0700 (PDT)
Received: from localhost.localdomain ([194.85.238.22])
	by mx.google.com with ESMTPS id a1sm17912393fab.4.2011.09.18.04.23.40
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 18 Sep 2011 04:23:41 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 18 Sep 2011 15:23:10 +0400
Message-Id: <1316344999-26642-9-git-send-email-dbaryshkov@gmail.com>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1316344999-26642-1-git-send-email-dbaryshkov@gmail.com>
References: <1316344999-26642-1-git-send-email-dbaryshkov@gmail.com>
Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Subject: [meta-opie 08/17] task-opie: provide defaults for screen resolution
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
X-List-Received-Date: Sun, 18 Sep 2011 11:28:56 -0000

Some machine confg files (most notably qemuarm) do not provide
MACHINE_DISPLAY_WIDTH/HEIGHT_PIXELS values. Provide sane (QVGA) defaults
for those variables, as they are currently used only to select taskbar
images packet.

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 recipes-opie/tasks/task-opie.bb |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/recipes-opie/tasks/task-opie.bb b/recipes-opie/tasks/task-opie.bb
index 41d61dc..e4073ef 100644
--- a/recipes-opie/tasks/task-opie.bb
+++ b/recipes-opie/tasks/task-opie.bb
@@ -31,6 +31,8 @@ PACKAGES += "task-opie-everything"
 RDEPENDS_task-opie-base = "opie-init opie-alarm opie-qcop opie-qss opie-quicklauncher \
                            opie-taskbar opie-pics opie-sounds opie-freetype \
                            ttf-dejavu-sans ttf-dejavu-sans-mono"
+MACHINE_DISPLAY_WIDTH_PIXELS ?= "320"
+MACHINE_DISPLAY_HEIGHT_PIXELS ?= "240"
 # Recommend both landscape and portrait backgrounds
 RRECOMMENDS_task-opie-base = "opie-taskbar-images-${MACHINE_DISPLAY_WIDTH_PIXELS}x${MACHINE_DISPLAY_HEIGHT_PIXELS} \
                               opie-taskbar-images-${MACHINE_DISPLAY_HEIGHT_PIXELS}x${MACHINE_DISPLAY_WIDTH_PIXELS}"
-- 
1.7.2.5



