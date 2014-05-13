Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (unknown [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id A780A605B2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 May 2014 11:06:38 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 13 May 2014 04:06:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,1043,1389772800"; d="scan'208";a="431437198"
Received: from hpatters-mobl.amr.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.123.37])
	by azsmga001.ch.intel.com with ESMTP; 13 May 2014 04:06:06 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 13 May 2014 12:05:57 +0100
Message-Id: <24131e6d92f18eb86bc165e226a9e1882ac83789.1399979085.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.0
In-Reply-To: <cover.1399979085.git.paul.eggleton@linux.intel.com>
References: <cover.1399979085.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1399979085.git.paul.eggleton@linux.intel.com>
References: <cover.1399979085.git.paul.eggleton@linux.intel.com>
Subject: [meta-webserver][PATCH 4/4] xdebug: add license file
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
X-List-Received-Date: Tue, 13 May 2014 11:06:39 -0000

Add the Xdebug license file to avoid a missing generic license file
warning during building.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta-webserver/conf/layer.conf |  2 ++
 meta-webserver/licenses/Xdebug | 60 ++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 62 insertions(+)
 create mode 100644 meta-webserver/licenses/Xdebug

diff --git a/meta-webserver/conf/layer.conf b/meta-webserver/conf/layer.conf
index d887b67..a4d6a27 100644
--- a/meta-webserver/conf/layer.conf
+++ b/meta-webserver/conf/layer.conf
@@ -16,3 +16,5 @@ BBFILE_PRIORITY_webserver = "6"
 LAYERVERSION_webserver = "1"
 
 LAYERDEPENDS_webserver = "core"
+
+LICENSE_PATH += "${LAYERDIR}/licenses"
diff --git a/meta-webserver/licenses/Xdebug b/meta-webserver/licenses/Xdebug
new file mode 100644
index 0000000..3cdbf05
--- /dev/null
+++ b/meta-webserver/licenses/Xdebug
@@ -0,0 +1,60 @@
+-------------------------------------------------------------------- 
+                 The Xdebug License, version 1.01
+             (Based on "The PHP License", version 3.0)
+   Copyright (c) 2003-2012 Derick Rethans. All rights reserved.
+-------------------------------------------------------------------- 
+
+Redistribution and use in source and binary forms, with or without
+modification, is permitted provided that the following conditions
+are met:
+
+  1. Redistributions of source code must retain the above copyright
+     notice, this list of conditions and the following disclaimer.
+ 
+  2. Redistributions in binary form must reproduce the above copyright
+     notice, this list of conditions and the following disclaimer in
+     the documentation and/or other materials provided with the
+     distribution.
+ 
+  3. The name "Xdebug" must not be used to endorse or promote products
+     derived from this software without prior written permission. For
+     written permission, please contact derick@xdebug.org.
+  
+  4. Products derived from this software may not be called "Xdebug", nor
+     may "Xdebug" appear in their name, without prior written permission
+     from derick@xdebug.org.
+ 
+  5. Derick Rethans may publish revised and/or new versions of the
+     license from time to time. Each version will be given a
+     distinguishing version number.  Once covered code has been
+     published under a particular version of the license, you may
+     always continue to use it under the terms of that version. You
+     may also choose to use such covered code under the terms of any
+     subsequent version of the license published by Derick Rethans. No
+     one other than Derick Rethans has the right to modify the terms
+     applicable to covered code created under this License.
+
+  6. Redistributions of any form whatsoever must retain the following
+     acknowledgment: "This product includes Xdebug, freely available
+     from <http://xdebug.org/>".
+
+THIS SOFTWARE IS PROVIDED BY DERICK RETHANS ``AS IS'' AND ANY
+EXPRESSED OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
+IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
+PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL THE PHP DEVELOPMENT TEAM OR
+ITS CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
+SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
+LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
+DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
+THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
+(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
+OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+
+--------------------------------------------------------------------
+
+This software consists of voluntary contributions made by some
+individuals on behalf of Derick Rethans.
+
+Derick Rethans can be contacted via e-mail at derick@xdebug.org.
+
+For more information Xdebug, please see <http://xdebug.org>.
-- 
1.9.0


