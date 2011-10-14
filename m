Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1REgr5-00080s-5C
	for openembedded-devel@lists.openembedded.org;
	Fri, 14 Oct 2011 14:27:15 +0200
Received: by mail-bw0-f47.google.com with SMTP id t8so1904372bka.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Oct 2011 05:21:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=/0JSkP3QY48NZeSZ2JArW0xcdMDQiTLiRdXIUxlt2ug=;
	b=bHmQEJaZQR3OjHxEI3/JBe6xxg6HSRiHkKrQX5Orzyeww1GjDcyT+6KcpCbcG1Y7Pp
	7BTsFNFrdsY93Tqu7ZDIwbj6g7DENYRmlb8q9jCm4paLLVC97eZPkclrL744f2z7Uz26
	Of/G/ED/8wX2EeQYZeCmFFM4ygx3hw277dsvQ=
Received: by 10.204.139.195 with SMTP id f3mr6700311bku.73.1318594892464;
	Fri, 14 Oct 2011 05:21:32 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id e14sm8297837bka.0.2011.10.14.05.21.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 14 Oct 2011 05:21:31 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 14 Oct 2011 14:21:01 +0200
Message-Id: <1318594861-29087-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <1318594861-29087-1-git-send-email-Martin.Jansa@gmail.com>
References: <1318594861-29087-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH 2/2] libgcrypt: rename .bbappend to apply to new 1.5.0 version
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
X-List-Received-Date: Fri, 14 Oct 2011 12:27:15 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../libgcrypt/libgcrypt_1.4.6.bbappend             |    2 --
 .../libgcrypt/libgcrypt_1.5.0.bbappend             |    2 ++
 2 files changed, 2 insertions(+), 2 deletions(-)
 delete mode 100644 meta-oe/recipes-support/libgcrypt/libgcrypt_1.4.6.bbappend
 create mode 100644 meta-oe/recipes-support/libgcrypt/libgcrypt_1.5.0.bbappend

diff --git a/meta-oe/recipes-support/libgcrypt/libgcrypt_1.4.6.bbappend b/meta-oe/recipes-support/libgcrypt/libgcrypt_1.4.6.bbappend
deleted file mode 100644
index d9172b4..0000000
--- a/meta-oe/recipes-support/libgcrypt/libgcrypt_1.4.6.bbappend
+++ /dev/null
@@ -1,2 +0,0 @@
-BBCLASSEXTEND = "native"
-
diff --git a/meta-oe/recipes-support/libgcrypt/libgcrypt_1.5.0.bbappend b/meta-oe/recipes-support/libgcrypt/libgcrypt_1.5.0.bbappend
new file mode 100644
index 0000000..d9172b4
--- /dev/null
+++ b/meta-oe/recipes-support/libgcrypt/libgcrypt_1.5.0.bbappend
@@ -0,0 +1,2 @@
+BBCLASSEXTEND = "native"
+
-- 
1.7.7



