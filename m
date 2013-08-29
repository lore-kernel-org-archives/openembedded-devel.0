Return-Path: <elvis.dowson@gmail.com>
Received: from mail-pa0-f53.google.com (mail-pa0-f53.google.com
	[209.85.220.53])
	by mail.openembedded.org (Postfix) with ESMTP id D54206BD19
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2013 18:42:00 +0000 (UTC)
Received: by mail-pa0-f53.google.com with SMTP id lb1so1279963pab.26
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2013 11:42:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=k5o+5FhT6oCkdSdX+WSn/aTol2YxjuaQcgaRb6yykOk=;
	b=SKerSUO5sNZjK2Ad5px3XtrUZgHBRU+ZhILFNneB+wEBxZ/J6wtNl4kZYNh1WAXJ48
	fNZsPc/xM5d4ykRc2VvyCh7EFBMSmHh6xogjauc5t8DKiYwCN+pUlSk6/Qb3rD7uJlBQ
	KCa7yY8m3HWYAzQZDzq0mHfqZm5MtnWpp/SVKmM2JkWvxno1GOrEl3q32m4OLnH9zaxh
	ahJ3sBhOUvBO4xjgMqGjOavp+/SVHcpK/rHFoyG50VmW2EO4s43dJl3jmgAeOEEPNnjW
	x0+qV6YunVGqHSwlTbEieqnC/VjuEQmKs56HbqLvm6HMyUIm6iR3YnYpMilAHuFs13Nw
	wJ5Q==
X-Received: by 10.66.233.195 with SMTP id ty3mr6114155pac.70.1377801721767;
	Thu, 29 Aug 2013 11:42:01 -0700 (PDT)
Received: from titan.du.ae ([94.205.106.26])
	by mx.google.com with ESMTPSA id w6sm39426654pbt.32.1969.12.31.16.00.00
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 29 Aug 2013 11:42:00 -0700 (PDT)
From: Elvis Dowson <elvis.dowson@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 29 Aug 2013 22:41:51 +0400
Message-Id: <1377801711-4120-1-git-send-email-elvis.dowson@gmail.com>
X-Mailer: git-send-email 1.7.10.4
Cc: bruce.ashfield@windriver.com, Elvis Dowson <elvis.dowson@gmail.com>
Subject: [oe-core] qemuarma9: Update qemuarma9-standard.scc definition.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 29 Aug 2013 18:42:00 -0000

This commit
- updates the KMACHINE definition to vexpress.
- updates the branch to qemuarma9.

Signed-off-by: Elvis Dowson <elvis.dowson@gmail.com>
---
 meta/cfg/kernel-cache/bsp/qemuarma9/qemuarma9-standard.scc |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/cfg/kernel-cache/bsp/qemuarma9/qemuarma9-standard.scc b/meta/cfg/kernel-cache/bsp/qemuarma9/qemuarma9-standard.scc
index c71fe1c..83911ff 100644
--- a/meta/cfg/kernel-cache/bsp/qemuarma9/qemuarma9-standard.scc
+++ b/meta/cfg/kernel-cache/bsp/qemuarma9/qemuarma9-standard.scc
@@ -1,9 +1,9 @@
-define KMACHINE qemuarma9
+define KMACHINE vexpress
 define KTYPE standard
 define KARCH arm
 
 include ktypes/standard/standard.scc
-branch arm-versatile-926ejs
+branch qemuarma9
 
 include qemuarma9.scc
 
-- 
1.7.10.4


