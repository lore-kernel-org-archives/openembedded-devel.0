Return-Path: <elvis.dowson@gmail.com>
Received: from mail-pb0-f52.google.com (mail-pb0-f52.google.com
	[209.85.160.52])
	by mail.openembedded.org (Postfix) with ESMTP id 281556BEF3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2013 18:36:18 +0000 (UTC)
Received: by mail-pb0-f52.google.com with SMTP id wz12so815343pbc.11
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2013 11:36:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Bo+V0pbHlCyZejK8SMVIsfobrRu5ralEpFpI+9nmEbg=;
	b=Z2Cyck5Qzwx9SDtq54zMUxpPEW5ujZk2QffKrznXEK4Kq0j4MWQPMb5fUpD4jqDQCq
	DDd9YZikFs28StcBbBUK6gyl9aOHFmsDbRNoSFeWAax4pacWPqJENONKzYuYeUFEdk+9
	+RNk/gvi6ioURxP+bK75nmTubWt0/UYGhZFYbagxHpZX4clVr+8X1SYAGbPnVv2KT4IU
	lML8fhUFABc6g5mHHsAtlAclc+gWq4kjSMAadNZOv1IgraLN0OCqn6En4X80cD6gl6ON
	RvhqAm33vcz2AnPy+pAg0ClZJ9IoKYlE4cZJOfvUMVX/89XaMZwNZABN62Qka4CZayxR
	iItw==
X-Received: by 10.68.186.193 with SMTP id fm1mr5187855pbc.163.1377801379258;
	Thu, 29 Aug 2013 11:36:19 -0700 (PDT)
Received: from titan.du.ae ([94.205.106.26]) by mx.google.com with ESMTPSA id
	zi1sm39412487pbb.28.1969.12.31.16.00.00
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 29 Aug 2013 11:36:18 -0700 (PDT)
From: Elvis Dowson <elvis.dowson@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 29 Aug 2013 22:35:57 +0400
Message-Id: <1377801358-3942-4-git-send-email-elvis.dowson@gmail.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1377801358-3942-1-git-send-email-elvis.dowson@gmail.com>
References: <1377801358-3942-1-git-send-email-elvis.dowson@gmail.com>
Cc: bruce.ashfield@windriver.com, Elvis Dowson <elvis.dowson@gmail.com>
Subject: [oe-core 4/5] linux-yocto: Add support for qemuarmv7 and qemuarma9.
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
X-List-Received-Date: Thu, 29 Aug 2013 18:36:18 -0000

This commit
- adds qemuarmv7 and qemuarma9 to the list of compatible machines.

Signed-off-by: Elvis Dowson <elvis.dowson@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto_3.8.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto_3.8.bb b/meta/recipes-kernel/linux/linux-yocto_3.8.bb
index 790e3e3..0bd9913 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.8.bb
@@ -21,7 +21,7 @@ PV = "${LINUX_VERSION}+git${SRCPV}"
 
 KMETA = "meta"
 
-COMPATIBLE_MACHINE = "qemuarm|qemux86|qemuppc|qemumips|qemumips64|qemux86-64"
+COMPATIBLE_MACHINE = "qemuarm|qemuarmv7|qemuarma9|qemux86|qemuppc|qemumips|qemumips64|qemux86-64"
 
 # Functionality flags
 KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc"
-- 
1.7.10.4


