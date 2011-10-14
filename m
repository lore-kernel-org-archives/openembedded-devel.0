Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1REgid-0007ml-5A
	for openembedded-devel@lists.openembedded.org;
	Fri, 14 Oct 2011 14:18:31 +0200
Received: by bkat8 with SMTP id t8so1893917bka.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Oct 2011 05:12:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=Qd7fnsxlF+I28W8omuJr9Ly/5B1Ig1igpsaTcCKybXE=;
	b=Mik6QY5FCgC7Sr6oLhCXv1aBcNyjBLOHCXYn+KU9wjhaaamyhZN00GTtcpK8HgVAVF
	GnWtLVyDaU6qTJPy4Rq/RgR4Bnb9BkU/ESl9tUK02UEVuAbEs7COM1iYi34X1FR//Lms
	tYtL+N6mNKj67VXoEzRbVbxVHGCwhxzlZyuDc=
Received: by 10.204.132.199 with SMTP id c7mr6659596bkt.45.1318594366076;
	Fri, 14 Oct 2011 05:12:46 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id ex8sm8263412bkc.2.2011.10.14.05.12.44
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 14 Oct 2011 05:12:45 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 14 Oct 2011 14:12:36 +0200
Message-Id: <1318594356-28101-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.7
Subject: [PATCH] atk: rename .bbappend to apply to newer version
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
X-List-Received-Date: Fri, 14 Oct 2011 12:18:31 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/atk/atk_1.32.0.bbappend |    2 --
 meta-oe/recipes-support/atk/atk_2.2.0.bbappend  |    2 ++
 2 files changed, 2 insertions(+), 2 deletions(-)
 delete mode 100644 meta-oe/recipes-support/atk/atk_1.32.0.bbappend
 create mode 100644 meta-oe/recipes-support/atk/atk_2.2.0.bbappend

diff --git a/meta-oe/recipes-support/atk/atk_1.32.0.bbappend b/meta-oe/recipes-support/atk/atk_1.32.0.bbappend
deleted file mode 100644
index d9172b4..0000000
--- a/meta-oe/recipes-support/atk/atk_1.32.0.bbappend
+++ /dev/null
@@ -1,2 +0,0 @@
-BBCLASSEXTEND = "native"
-
diff --git a/meta-oe/recipes-support/atk/atk_2.2.0.bbappend b/meta-oe/recipes-support/atk/atk_2.2.0.bbappend
new file mode 100644
index 0000000..d9172b4
--- /dev/null
+++ b/meta-oe/recipes-support/atk/atk_2.2.0.bbappend
@@ -0,0 +1,2 @@
+BBCLASSEXTEND = "native"
+
-- 
1.7.7



