Received: from [212.227.126.171] (helo=moutng.kundenserver.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <christian.glindkamp@taskit.de>) id 1M8xw5-0006aE-Rv
	for openembedded-devel@lists.openembedded.org;
	Tue, 26 May 2009 16:47:25 +0200
Received: from localhost.localdomain (port-87-234-225-18.static.qsc.de
	[87.234.225.18])
	by mrelayeu.kundenserver.de (node=mreu1) with ESMTP (Nemesis)
	id 0MKv1o-1M8xoC4B7r-000k08; Tue, 26 May 2009 16:39:17 +0200
Received: from christian.taskit.de (christian.taskit.de [192.168.4.114])
	by localhost.localdomain (Postfix) with ESMTP id 7F84813DE9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 May 2009 16:36:39 +0200 (CEST)
Date: Tue, 26 May 2009 16:39:16 +0200
From: Christian Glindkamp <christian.glindkamp@taskit.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090526163916.5789c875@christian.taskit.de>
X-Mailer: Claws Mail 3.7.1 (GTK+ 2.14.4; i486-pc-linux-gnu)
Mime-Version: 1.0
X-Provags-ID: V01U2FsdGVkX1+P626eR+RrcVCZPxXHC2dgmjHs296s8hcmKAW
	O2/GCMMmXVuchefMfNKvd3yvwAWLwNG1Xy96TwKLApfVXnNzOj
	dJjqK9PDWKwPkAFCmFNFQ==
Subject: [STABLE][PATCH] cacao: add missing patch
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
X-List-Received-Date: Tue, 26 May 2009 14:47:26 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

In revision af5fcda66139e002d098c0df952b43c455806aba the patch
cacao-disable-stackbase-check.patch was added to SRC_URI of all
cacao recipes without committing the patch itself. This patch
adds it to make cacao buildable again. The patch comes from the
jalimo overlay.

Signed-off-by: Christian Glindkamp <christian.glindkamp@taskit.de>
---
 .../files/cacao-disable-stackbase-check.patch      |   12 ++++++++++++
 1 files changed, 12 insertions(+), 0 deletions(-)
 create mode 100644 recipes/cacao/files/cacao-disable-stackbase-check.patch

diff --git a/recipes/cacao/files/cacao-disable-stackbase-check.patch b/recipes/cacao/files/cacao-disable-stackbase-check.patch
new file mode 100644
index 0000000..8eb2089
--- /dev/null
+++ b/recipes/cacao/files/cacao-disable-stackbase-check.patch
@@ -0,0 +1,12 @@
+Index: cacao-0.99.3+hg20090109/src/mm/boehm-gc/os_dep.c
+===================================================================
+--- cacao-0.99.3+hg20090109.orig/src/mm/boehm-gc/os_dep.c	2009-02-15 16:29:15.000000000 +0100
++++ cacao-0.99.3+hg20090109/src/mm/boehm-gc/os_dep.c	2009-02-15 16:29:24.000000000 +0100
+@@ -1077,7 +1077,6 @@
+       c = stat_buf[buf_offset++];
+     }
+     close(f);
+-    if (result < 0x10000000) ABORT("Absurd stack bottom value");
+     return (ptr_t)result;
+   }
+ 
-- 
1.5.6.5


