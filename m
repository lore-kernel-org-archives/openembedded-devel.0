Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RaPwo-000566-O3
	for openembedded-devel@lists.openembedded.org;
	Tue, 13 Dec 2011 11:50:58 +0100
Received: by yenm12 with SMTP id m12so4873589yen.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Dec 2011 02:44:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=8nuyBiPqGmZ5rbUkoqFI0ZKJ1GNH8D9yBZ2gxU4/9w0=;
	b=UXvvaHuVCBCIH/xHWQS33YXuU7cGNNi31Yju4tCvDXdLcC9hzyjjF0jEyRAP+s+AWu
	rmzh6yWumsftsjPVFje8kFt6Z+dvt8GbGvWFvXLM3NSwU4A6oPbetiEW6CGhUvNYIcoJ
	GXUp7jj3Q8jyyI3pSS0Nyiz1uzF8ZZQyKkwgA=
Received: by 10.236.178.33 with SMTP id e21mr2552301yhm.4.1323773043098;
	Tue, 13 Dec 2011 02:44:03 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id 37sm33437204anu.21.2011.12.13.02.43.59
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 13 Dec 2011 02:44:02 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 13 Dec 2011 10:43:44 +0000
Message-Id: <0c9ca9464df523163601aacfc91fcd61935cae40.1323772987.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1323772986.git.otavio@ossystems.com.br>
References: <cover.1323772986.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1323772986.git.otavio@ossystems.com.br>
References: <cover.1323772986.git.otavio@ossystems.com.br>
Subject: [meta-oe][PATCH 2/4] dropbear: convert PR to use PRINC on bbappend
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
X-List-Received-Date: Tue, 13 Dec 2011 10:50:58 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../dropbear/dropbear_2011.54.bbappend             |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta-oe/recipes-core/dropbear/dropbear_2011.54.bbappend b/meta-oe/recipes-core/dropbear/dropbear_2011.54.bbappend
index a642235..874a7d4 100644
--- a/meta-oe/recipes-core/dropbear/dropbear_2011.54.bbappend
+++ b/meta-oe/recipes-core/dropbear/dropbear_2011.54.bbappend
@@ -1,6 +1,6 @@
 inherit systemd
 
-PRINC = "1"
+PRINC := "${@int(PRINC) + 1}"
 
 # look for files in the layer first
 FILESEXTRAPATHS := "${THISDIR}/${PN}"
-- 
1.7.2.5



