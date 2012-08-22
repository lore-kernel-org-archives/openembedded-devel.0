Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elvis.dowson@gmail.com>) id 1T4Gfd-0000hx-ED
	for openembedded-devel@lists.openembedded.org;
	Wed, 22 Aug 2012 21:32:53 +0200
Received: by mail-pb0-f47.google.com with SMTP id wy7so1834865pbc.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Aug 2012 12:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=lqCRiATvemwLx58XXyQe5r0IahMu+AmjDSBwjsbCFMc=;
	b=cq+UsQXB3CzW9+LpEPyQRYwNgLMu/V/m0qG/PB8i9wZWRzqr26QbDJ+geJGtxAo5wS
	VWf1Pp7OK5TrwJlR1MFJGtq0+fXydE4cq7ADglMMb4BhgtTmg8qvSXScg+N/bTpQoZJZ
	NZXoDYCIYAB0ifEb2X3sgNIAYfX1nPzr404NUrcqmMl5xdvWbxwOxSHGDDgoOARF3td7
	D4Y5BR4Cq8vOXL/h0WFPKxbpsD3Wd0zbudxBXGgsCnNSKXO2ZRs58BINWj6kmwPjW+AV
	7nGsjSJeBMcUakMcTqSNvGLcBNrR18IFGx+s6EqxwI2L9soJQQ5FlNM4n9h3JAUaSvNj
	A/yg==
Received: by 10.68.237.38 with SMTP id uz6mr49999501pbc.23.1345663250060;
	Wed, 22 Aug 2012 12:20:50 -0700 (PDT)
Received: from eos.du.ae ([94.205.108.162])
	by mx.google.com with ESMTPS id oj8sm4254996pbb.54.2012.08.22.12.20.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 22 Aug 2012 12:20:49 -0700 (PDT)
From: Elvis Dowson <elvis.dowson@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 22 Aug 2012 23:20:23 +0400
Message-Id: <1345663224-42350-6-git-send-email-elvis.dowson@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1345663224-42350-1-git-send-email-elvis.dowson@gmail.com>
References: <1345663224-42350-1-git-send-email-elvis.dowson@gmail.com>
Cc: Elvis Dowson <elvis.dowson@gmail.com>
Subject: [meta-xilinx 6/7] conf: Add bblayers.conf sample configuration file.
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
X-List-Received-Date: Wed, 22 Aug 2012 19:32:53 -0000

* Add bblayers.conf sample configuration file to build meta-xilinx
  using gcc-4.5 and eglibc-2.13 retired toolchain recipes from
  the meta-openembedded/toolchain-layer.

Signed-off-by: Elvis Dowson <elvis.dowson@gmail.com>
---
 conf/bblayers.conf.sample |   13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 conf/bblayers.conf.sample

diff --git a/conf/bblayers.conf.sample b/conf/bblayers.conf.sample
new file mode 100644
index 0000000..78cc933
--- /dev/null
+++ b/conf/bblayers.conf.sample
@@ -0,0 +1,13 @@
+# LAYER_CONF_VERSION is increased each time build/conf/bblayers.conf
+# changes incompatibly
+LCONF_VERSION = "5"
+
+BBPATH = "${TOPDIR}"
+BBFILES ?= ""
+
+BBLAYERS ?= " \
+  /tool/yocto/poky/meta \
+  /tool/yocto/poky/meta-yocto \
+  /tool/yocto/meta-xilinx \
+  /tool/yocto/meta-openembedded/toolchain-layer \
+  "
-- 
1.7.9.5



