Received: from mail-gg0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1THhkM-0005Bc-5u
	for openembedded-devel@lists.openembedded.org;
	Fri, 28 Sep 2012 23:05:18 +0200
Received: by ggmq1 with SMTP id q1so1021963ggm.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Sep 2012 13:52:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=qL0cMj1cFiVYglsplGC6URuLRU/s4LljO83y6Tfluxs=;
	b=mYezSO6bF4h3UAc1lCi1Q/qFy2UMrJseO9+YPrOc/pcoulU1B+TynihoVpx23a1nRt
	XAxAnh81T0Wh9gDhMiDq5IGGrcS86jHEhomHkIGp31EZMQXI341KvMsH1cnNDCMHNhTU
	U+D4boyRHPJstCF9pGYQ/Eppz5/lK0h9zSx8Lii0BsN/+Ec6wjR2D+ZPWm+ykbb7XKu5
	VUwnYKHMYDbx6uK+mRpnMPLj6MGLbdXur1O/M4/e85Bq7xb3pmRFfjFU6vkYVpq8RZOq
	WV/lvVtHsYO+0rNk5ysb63AJMVBCx2a58y8ucogSqn19ebzkrT23DV/Va0IpDlwlbIgc
	dk8g==
Received: by 10.236.143.131 with SMTP id l3mr9213395yhj.108.1348863847941;
	Fri, 28 Sep 2012 13:24:07 -0700 (PDT)
Received: from localhost.localdomain ([177.100.163.15])
	by mx.google.com with ESMTPS id o11sm10717094anj.20.2012.09.28.13.24.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 28 Sep 2012 13:24:07 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 28 Sep 2012 17:23:51 -0300
Message-Id: <1348863831-31989-2-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1348863831-31989-1-git-send-email-otavio@ossystems.com.br>
References: <1348863831-31989-1-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe][PATCH 2/2] fuse: Fix recipe syntax error
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
X-List-Received-Date: Fri, 28 Sep 2012 21:05:18 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta-oe/recipes-support/fuse/fuse_2.9.1.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta-oe/recipes-support/fuse/fuse_2.9.1.bb b/meta-oe/recipes-support/fuse/fuse_2.9.1.bb
index 6718758..86a8465 100644
--- a/meta-oe/recipes-support/fuse/fuse_2.9.1.bb
+++ b/meta-oe/recipes-support/fuse/fuse_2.9.1.bb
@@ -17,7 +17,7 @@ EXTRA_OECONF = "--disable-kernel-module"
 
 PACKAGES =+ "fuse-utils-dbg fuse-utils libulockmgr libulockmgr-dev libulockmgr-dbg"
 
-RRECOMMENDS_${PN} = "kernel-module-fuse""
+RRECOMMENDS_${PN} = "kernel-module-fuse"
 
 FILES_${PN} += "${libdir}/libfuse.so.*"
 FILES_${PN}-dev += "${libdir}/libfuse*.la"
-- 
1.7.2.5



