Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 2ACF37701F
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Sep 2015 09:13:10 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t8I9DBcV005244
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Sep 2015 02:13:11 -0700 (PDT)
Received: from pek-kkang-d2.wrs.com (128.224.163.135) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.235.1; Fri, 18 Sep 2015 02:13:09 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 18 Sep 2015 17:13:19 +0800
Message-ID: <1442567599-2297-1-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] waf-samba.bbclass: remove bashism
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
X-List-Received-Date: Fri, 18 Sep 2015 09:13:11 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

use '=' instead of '==' so this works with dash as /bin/sh

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta-oe/classes/waf-samba.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/classes/waf-samba.bbclass b/meta-oe/classes/waf-samba.bbclass
index 23c5556..241aa69 100644
--- a/meta-oe/classes/waf-samba.bbclass
+++ b/meta-oe/classes/waf-samba.bbclass
@@ -22,7 +22,7 @@ CONFIGUREOPTS = " --prefix=${prefix} \
 
 do_configure() {
     qemu_binary="${@qemu_target_binary(d)}"
-    if [ ${qemu_binary} == "qemu-allarch" ]; then
+    if [ "${qemu_binary}" = "qemu-allarch" ]; then
         qemu_binary="qemuwrapper"
     fi
 
-- 
1.9.1


