Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1S13hc-0003lO-It
	for openembedded-devel@lists.openembedded.org;
	Fri, 24 Feb 2012 23:33:24 +0100
Received: by eaal10 with SMTP id l10so1353087eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Feb 2012 14:25:01 -0800 (PST)
Received-SPF: pass (google.com: domain of martin.jansa@gmail.com designates
	10.14.27.142 as permitted sender) client-ip=10.14.27.142; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of martin.jansa@gmail.com
	designates 10.14.27.142 as permitted sender)
	smtp.mail=martin.jansa@gmail.com;
	dkim=pass header.i=martin.jansa@gmail.com
Received: from mr.google.com ([10.14.27.142])
	by 10.14.27.142 with SMTP id e14mr2547513eea.70.1330122301740 (num_hops
	= 1); Fri, 24 Feb 2012 14:25:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=olDucdOZWRnbzF8kksuKHwcUtAkH0ZOrvU+RGuIZZXE=;
	b=CbWBUqyXnZu8q5zNrjiCH0PmriqezLGOQypPR+SQRz5z70+6BsrpGm4WOeNCvPUN1l
	6VR5Be2Ig0aMZVqin8r8K5/b4LZvhArFHiG8z3uIxpVRhDhmSyqJBM4zu5y5y+lFTILP
	FZsSO/xqufdizV82ML11RowWwTIavoq1yAMks=
Received: by 10.14.27.142 with SMTP id e14mr1883809eea.70.1330122301278;
	Fri, 24 Feb 2012 14:25:01 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id u9sm23182271eem.11.2012.02.24.14.24.59
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 24 Feb 2012 14:25:00 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 24 Feb 2012 23:24:39 +0100
Message-Id: <c80306a92539f7a4fd98e51f5c871e5c13f1ea35.1330122206.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.4
In-Reply-To: <aa725d9f76cd10dbf229311041896507b0806039.1330122206.git.Martin.Jansa@gmail.com>
References: <aa725d9f76cd10dbf229311041896507b0806039.1330122206.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1330122206.git.Martin.Jansa@gmail.com>
References: <cover.1330122206.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 2/5] task-x11-illume: use allarch
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
X-List-Received-Date: Fri, 24 Feb 2012 22:33:24 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/tasks/task-x11-illume.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta-efl/recipes-efl/tasks/task-x11-illume.bb b/meta-efl/recipes-efl/tasks/task-x11-illume.bb
index 6557619..20cf2b8 100644
--- a/meta-efl/recipes-efl/tasks/task-x11-illume.bb
+++ b/meta-efl/recipes-efl/tasks/task-x11-illume.bb
@@ -7,7 +7,7 @@ PR = "r2"
 
 # WORK IN PROGRESS
 
-inherit task
+inherit task allarch
 
 # Default theme and config
 ETHEME ?= "e-wm-theme-default"
-- 
1.7.8.4



