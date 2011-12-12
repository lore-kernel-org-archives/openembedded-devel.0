Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RaAaC-0002WV-67
	for openembedded-devel@lists.openembedded.org;
	Mon, 12 Dec 2011 19:26:37 +0100
Received: by ghrr13 with SMTP id r13so4306089ghr.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Dec 2011 10:19:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=8nuyBiPqGmZ5rbUkoqFI0ZKJ1GNH8D9yBZ2gxU4/9w0=;
	b=YY69J9RcOX9pGGdAaZwuG+RhdnTN9Rf9gcWQYNkPjqZipLxMi2qTO0pJMGSWra0/ZM
	ClsangWxgTmCtVHXjKQIc/CrIApDgsa9rZFdJ610smyqwAxVQwFef43NRtsx/c/R4qlX
	/g6Qkdv0nMc9AQDwVBJGo6QApwTdoMinXh4VQ=
Received: by 10.236.73.230 with SMTP id v66mr28051679yhd.61.1323713981323;
	Mon, 12 Dec 2011 10:19:41 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id o9sm20041390yhk.20.2011.12.12.10.19.39
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 12 Dec 2011 10:19:40 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 12 Dec 2011 18:19:27 +0000
Message-Id: <a1c444ba075c48bcb534f2462cc1843da6e65f95.1323713931.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1323713931.git.otavio@ossystems.com.br>
References: <cover.1323713931.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1323713931.git.otavio@ossystems.com.br>
References: <cover.1323713931.git.otavio@ossystems.com.br>
Subject: [meta-oe][PATCH 1/2] dropbear: convert PR to use PRINC on bbappend
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
X-List-Received-Date: Mon, 12 Dec 2011 18:26:37 -0000

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



