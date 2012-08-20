Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1T3ZDH-0006ex-Nc
	for openembedded-devel@lists.openembedded.org;
	Mon, 20 Aug 2012 23:08:43 +0200
Received: by weyr6 with SMTP id r6so4416325wey.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Aug 2012 13:56:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=mYG1rB+vK5Avc4xCiH1Rz6yjXRGWTPn9oao368AXwwI=;
	b=mBZ4HvTBCkCVLWlpuvAVI2XlznKB4wY9Id1lydom19LBs2zg1W32Wvb11ZFPPzIq/T
	iRsStjsgpwhl5PkFXMAtkhcJGP++CsEOKz63Ucaf6a8amuMUKgXPED3+V28hl1hCKnZv
	1zKhSjm6wjEe7fDwqKlTCivWEPnzgwvJciukxa1gUiX1v6gKD6dQqUdN6suCSLQp4T6w
	HYKTApxYmIcqcCLTpehof9CTZjo8wuExNrLrO1UpvL7leKEwKTA2CnXpP5RFCAjQhvpj
	Ao36+LoHa56X8aiNfJrr08LFGxhBWXSoG2IwRccTptW2ByBbWXyOM6nZ9BcxxTbZWcZ+
	Lo8w==
Received: by 10.180.86.106 with SMTP id o10mr31810185wiz.22.1345496201091;
	Mon, 20 Aug 2012 13:56:41 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id t7sm44375991wix.6.2012.08.20.13.56.39
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 20 Aug 2012 13:56:39 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 20 Aug 2012 22:56:28 +0200
Message-Id: <d94c80615c39f707373978b4df5df423d9781051.1345496053.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <cover.1345496053.git.Martin.Jansa@gmail.com>
References: <cover.1345496053.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1345496053.git.Martin.Jansa@gmail.com>
References: <cover.1345496053.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 1/8] machine_kernel_pr.bbclass: provides MACHINE_KERNEL_PR functionality
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
X-List-Received-Date: Mon, 20 Aug 2012 21:08:43 -0000

From: Khem Raj <raj.khem@gmail.com>

Diffing with the OE-Core's kernel.bbclass only difference is setting of
machine kernel pr. So lets convert it to a separate class which provides
the added functionality and let everyone use kernel.bbclass from kernel

It needs the dependent layers to inherit this class in addition to
kernel.bbclass.

After dependent layers are updated we can remove meta-oe copy of
kernel.bbclass, it leaves up with one less conflict with OE-Core.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/classes/machine_kernel_pr.bbclass |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/classes/machine_kernel_pr.bbclass

diff --git a/meta-oe/classes/machine_kernel_pr.bbclass b/meta-oe/classes/machine_kernel_pr.bbclass
new file mode 100644
index 0000000..463b64d
--- /dev/null
+++ b/meta-oe/classes/machine_kernel_pr.bbclass
@@ -0,0 +1,8 @@
+python __anonymous () {
+
+    machine_kernel_pr = d.getVar('MACHINE_KERNEL_PR', True)
+
+    if machine_kernel_pr:
+        d.setVar('PR', machine_kernel_pr)
+}
+
-- 
1.7.8.6



