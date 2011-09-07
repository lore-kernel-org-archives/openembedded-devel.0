Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dbaryshkov@gmail.com>) id 1R1Ina-0004r1-Of
	for openembedded-devel@lists.openembedded.org;
	Wed, 07 Sep 2011 16:08:18 +0200
Received: by bkbzu17 with SMTP id zu17so214337bkb.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 Sep 2011 07:03:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=rtQDdoNRmgjk4MRe7Jrp2NUXg/VfdAxG5/ozO4SjZpU=;
	b=or4udpA4mXsO9DLZMizrAAX6BGVW5cQ0P776x73h6cSgCqDvSfH0atbERmFwWx/kev
	utNDnGdRbdPkJ3hGbH3o2akZo5mSN/I7zbkV8HuNkwyghzw8pSsNBpsyJD7l88IXoAE1
	SrIKZV0PNfWRxsDbj/nRhaWUiXYKFrq/c3nvI=
Received: by 10.204.150.203 with SMTP id z11mr152026bkv.237.1315404196513;
	Wed, 07 Sep 2011 07:03:16 -0700 (PDT)
Received: from localhost.localdomain ([194.85.238.22])
	by mx.google.com with ESMTPS id l11sm440069bkb.1.2011.09.07.07.03.14
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 07 Sep 2011 07:03:15 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  7 Sep 2011 18:02:56 +0400
Message-Id: <1315404187-18176-2-git-send-email-dbaryshkov@gmail.com>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1315404187-18176-1-git-send-email-dbaryshkov@gmail.com>
References: <1315404187-18176-1-git-send-email-dbaryshkov@gmail.com>
Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Subject: [meta-handheld 01/12] linux.inc: drop a part of the file for the devices we don't care about
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
X-List-Received-Date: Wed, 07 Sep 2011 14:08:18 -0000

meta-hh doesn't care about n900, om-gta0x or eee701, so drop the
respective hook.

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 recipes-kernel/linux/linux.inc |    4 ----
 1 files changed, 0 insertions(+), 4 deletions(-)

diff --git a/recipes-kernel/linux/linux.inc b/recipes-kernel/linux/linux.inc
index 2304135..a30ea70 100644
--- a/recipes-kernel/linux/linux.inc
+++ b/recipes-kernel/linux/linux.inc
@@ -65,15 +65,11 @@ python __anonymous () {
     import bb
     
     devicetree = bb.data.getVar('KERNEL_DEVICETREE', d, 1) or ''
-    machine = bb.data.getVar('MACHINE', d, 1)
     if devicetree:
     	depends = bb.data.getVar("DEPENDS", d, 1)
     	bb.data.setVar("DEPENDS", "%s dtc-native" % depends, d)
     	packages = bb.data.getVar("PACKAGES", d, 1)
     	bb.data.setVar("PACKAGES", "%s kernel-devicetree" % packages, d)
-    if 'nokia900' in machine or 'om-gta0' in machine or 'eee701' in machine:
-        depends = bb.data.getVar("DEPENDS", d, 1)
-        bb.data.setVar("DEPENDS", "%s lzma-native" % depends, d)
 }
 
 do_configure_prepend() {
-- 
1.7.2.5



