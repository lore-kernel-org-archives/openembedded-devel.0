Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1R36vG-0003ZA-Uj
	for openembedded-devel@lists.openembedded.org;
	Mon, 12 Sep 2011 15:51:43 +0200
Received: by ywf7 with SMTP id 7so626027ywf.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Sep 2011 06:46:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=2/SqUZEqb24f5OZnkgsCYxuZx02a8dLJSTl4Lixe18M=;
	b=L0iPKIAPMtK12lZ+7qbNYzPKVzT9JDQIM1bs9SqJWsoEZsvCWyBNABOUTXjw85h3IN
	LE9ek3pnylW/kqiTAI3uhzRFc8sQlFjGYrk3r67KC9bwuRaRRYL+vTk576A/Hg72x1yX
	Rz0HWQ/21O66GxHxWVjb73dFKMKQryYrBnTfE=
Received: by 10.150.164.21 with SMTP id m21mr931534ybe.72.1315835192903;
	Mon, 12 Sep 2011 06:46:32 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id o39sm14214795ani.17.2011.09.12.06.46.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 12 Sep 2011 06:46:31 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 12 Sep 2011 13:46:18 +0000
Message-Id: <639b0fcb526da33d082ce5d516ac4c928e6170b4.1315835148.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1315835148.git.otavio@ossystems.com.br>
References: <cover.1315835148.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1315835148.git.otavio@ossystems.com.br>
References: <cover.1315835148.git.otavio@ossystems.com.br>
Subject: [meta-oe][PATCH 1/1] xf86-input-void: add 1.4.0 recipe
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
X-List-Received-Date: Mon, 12 Sep 2011 13:51:43 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../xorg-driver/xf86-input-void_1.4.0.bb           |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-graphics/xorg-driver/xf86-input-void_1.4.0.bb

diff --git a/meta-oe/recipes-graphics/xorg-driver/xf86-input-void_1.4.0.bb b/meta-oe/recipes-graphics/xorg-driver/xf86-input-void_1.4.0.bb
new file mode 100644
index 0000000..32ebbeb
--- /dev/null
+++ b/meta-oe/recipes-graphics/xorg-driver/xf86-input-void_1.4.0.bb
@@ -0,0 +1,8 @@
+require xorg-driver-input.inc
+DESCRIPTION = "X.Org X server -- void input driver"
+PR = "${INC_PR}.0"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=4be6a915bfbf111cd88706fc6a6f141b"
+
+SRC_URI[archive.md5sum] = "3056bc7c57db8c5d56039648c0530c45"
+SRC_URI[archive.sha256sum] = "aba69784ac83f5951af3e164312adb4b8b1c91a8f79ab35dc5165c534e14c674"
-- 
1.7.2.5



