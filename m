Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1S13ho-0003ey-Lk
	for openembedded-devel@lists.openembedded.org;
	Fri, 24 Feb 2012 23:33:36 +0100
Received: by mail-ee0-f47.google.com with SMTP id d41so1346543eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Feb 2012 14:25:16 -0800 (PST)
Received-SPF: pass (google.com: domain of martin.jansa@gmail.com designates
	10.213.35.147 as permitted sender) client-ip=10.213.35.147; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of martin.jansa@gmail.com
	designates 10.213.35.147 as permitted sender)
	smtp.mail=martin.jansa@gmail.com;
	dkim=pass header.i=martin.jansa@gmail.com
Received: from mr.google.com ([10.213.35.147])
	by 10.213.35.147 with SMTP id p19mr1103865ebd.148.1330122316004
	(num_hops = 1); Fri, 24 Feb 2012 14:25:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=btZuzz++nfNQh6ytoJliUmecR97CZ13KhlOZxdZZ1qM=;
	b=oOWZ0uMNR8HidRF0N6np7mmWcEc8YSyUdfsHbTC3G7ir7KseuWPnhnWjRfOUcXDJRb
	iiRN+GdoFw3ZOuk3Inl79lpsDAUOEh1tAAxyf2YczOBtyKSW5p1EmkrPVii0bAO3DVza
	Ei9tww8vy8NIxh9eCC+FB7ynjM95DAYmUt+pw=
Received: by 10.213.35.147 with SMTP id p19mr819062ebd.148.1330122315928;
	Fri, 24 Feb 2012 14:25:15 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id y14sm23192285eef.10.2012.02.24.14.25.14
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 24 Feb 2012 14:25:15 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 24 Feb 2012 23:24:41 +0100
Message-Id: <ab668ddef2fb5cda0e376b201677e3742255fea1.1330122206.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.4
In-Reply-To: <aa725d9f76cd10dbf229311041896507b0806039.1330122206.git.Martin.Jansa@gmail.com>
References: <aa725d9f76cd10dbf229311041896507b0806039.1330122206.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1330122206.git.Martin.Jansa@gmail.com>
References: <cover.1330122206.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 4/5] task-x11: use allarch
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
X-List-Received-Date: Fri, 24 Feb 2012 22:33:36 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-core/tasks/task-x11_1.0.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta-oe/recipes-core/tasks/task-x11_1.0.bb b/meta-oe/recipes-core/tasks/task-x11_1.0.bb
index 681e4f3..628789a 100644
--- a/meta-oe/recipes-core/tasks/task-x11_1.0.bb
+++ b/meta-oe/recipes-core/tasks/task-x11_1.0.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 PR = "r10"
 
-inherit task
+inherit task allarch
 
 PACKAGES += "${PN}-utils"
 
-- 
1.7.8.4



