Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RwyP4-0007sg-Il
	for openembedded-devel@lists.openembedded.org;
	Mon, 13 Feb 2012 17:05:22 +0100
Received: by mail-ey0-f175.google.com with SMTP id l10so1518703eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Feb 2012 07:57:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=6O/NWZ6QtFswuLjn0ZN+w96tVkKLd8CVkqmD04z0958=;
	b=aeigPOiQtyN7iAFvnDuyITnByG2Exw84Cci5uw8oBgVLkae4UxehipwBijbuDtisKX
	b3fNARrvTwXVFYZX4n6iuzdQ5vJfDk/HdAYZY2S1YhbiZSgQ/Z+KSUz+2CNr/yP/kC13
	ixb58+WwHEhz+XPftE2xVVG3KJnuGcYpSxYgg=
Received: by 10.14.119.136 with SMTP id n8mr5314894eeh.87.1329148635295;
	Mon, 13 Feb 2012 07:57:15 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id w60sm44091056eeb.4.2012.02.13.07.57.13
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 13 Feb 2012 07:57:14 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 13 Feb 2012 16:56:56 +0100
Message-Id: <c54f92219b36689443ff60507d5deefb7fc85ff2.1329148318.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.4
In-Reply-To: <2d1d85b8c16b655a71085d45c54bf7df8f84bbee.1329148318.git.Martin.Jansa@gmail.com>
References: <2d1d85b8c16b655a71085d45c54bf7df8f84bbee.1329148318.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1329148318.git.Martin.Jansa@gmail.com>
References: <cover.1329148318.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-efl][meta-gnome][PATCH 2/4] libgcrypt: drop .bbappend, native is now provided by oe-core
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
X-List-Received-Date: Mon, 13 Feb 2012 16:05:22 -0000

* see oe-core 796b06e7bd4c336a5d256d54d1d16a1a9058144c

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../libgcrypt/libgcrypt_1.5.0.bbappend             |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)
 delete mode 100644 meta-oe/recipes-support/libgcrypt/libgcrypt_1.5.0.bbappend

diff --git a/meta-oe/recipes-support/libgcrypt/libgcrypt_1.5.0.bbappend b/meta-oe/recipes-support/libgcrypt/libgcrypt_1.5.0.bbappend
deleted file mode 100644
index d9172b4..0000000
--- a/meta-oe/recipes-support/libgcrypt/libgcrypt_1.5.0.bbappend
+++ /dev/null
@@ -1,2 +0,0 @@
-BBCLASSEXTEND = "native"
-
-- 
1.7.8.4



