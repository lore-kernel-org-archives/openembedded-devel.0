Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SB4Is-0002dA-RF
	for openembedded-devel@lists.openembedded.org;
	Fri, 23 Mar 2012 14:13:14 +0100
Received: by wgbdr12 with SMTP id dr12so1857378wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Mar 2012 06:04:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=iBt4L3IswVSpuv4N8yi2DmmOdnQHIWALVkbgnD8BXzA=;
	b=0MsdQocrDbomb9OvqZMHx2vAohS7KfckAQ50RvwJIHTQufIPjTNoz2Two+jGbO6CX6
	EWtD4qsOrHwThTbjZ0glw1CE1Y4G1rgkpegtV4SmtN2CFxoKfG2EYPuejJYd88orewTK
	Qm0ADRnRwkwvUJrFuX3NC6gfd51qZ8kdv3GE7FYh3pp3DpmPZ+TVHMmswsBoJO/tSKGG
	suAc/s0/R36wm+cC5Ce46Adg0Q5dxW8Toj8fFuFxfheGGbmoQolSFufLte6YP7JSUtld
	NE8HWTr2X91nLp68pIepxBVGbMfj+Inhu3gPoTMXiXjK41BdcaeGC+FdloG11KBIF+nE
	uHvw==
Received: by 10.180.100.196 with SMTP id fa4mr7494466wib.0.1332507858912;
	Fri, 23 Mar 2012 06:04:18 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id ex2sm22777108wib.8.2012.03.23.06.04.17
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 23 Mar 2012 06:04:18 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 23 Mar 2012 14:04:10 +0100
Message-Id: <3fca50b933c63bab6cff938db607bcecde86fd3d.1332507730.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.5
In-Reply-To: <cover.1332507730.git.Martin.Jansa@gmail.com>
References: <cover.1332507730.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 1/5] kernel.bbclass: use better number for KERNEL_PRIORITY
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
X-List-Received-Date: Fri, 23 Mar 2012 13:13:14 -0000

* there is no upgrade from 2.6.X to 3.X.Y
  last part of PV is used as kernel priority for u-a, but X is usually higher then Y in 3.x.x
  so use all 3 parts in one bigger number
* and make it weak assignment if this scheme doesn't work for some
  recipe

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/classes/kernel.bbclass |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/meta-oe/classes/kernel.bbclass b/meta-oe/classes/kernel.bbclass
index 41a741f..02d0ca5 100644
--- a/meta-oe/classes/kernel.bbclass
+++ b/meta-oe/classes/kernel.bbclass
@@ -36,7 +36,9 @@ PACKAGES_DYNAMIC += "kernel-firmware-*"
 export OS = "${TARGET_OS}"
 export CROSS_COMPILE = "${TARGET_PREFIX}"
 
-KERNEL_PRIORITY = "${@d.getVar('PV',1).split('-')[0].split('.')[-1]}"
+KERNEL_PRIORITY ?= "${@int(d.getVar('PV',1).split('-')[0].split('+')[0].split('.')[0]) * 10000 + \
+                       int(d.getVar('PV',1).split('-')[0].split('+')[0].split('.')[1]) * 100 + \
+                       int(d.getVar('PV',1).split('-')[0].split('+')[0].split('.')[-1])}"
 
 KERNEL_RELEASE ?= "${KERNEL_VERSION}"
 
-- 
1.7.8.5



