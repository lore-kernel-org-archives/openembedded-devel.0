Return-Path: <zboszor@pr.hu>
Received: from mail7.pr.hu (mail7.pr.hu [87.242.0.7])
	by mail.openembedded.org (Postfix) with ESMTP id D2C5870018
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  3 Apr 2017 17:22:55 +0000 (UTC)
Received: from [2a02:808:3:101::5] (helo=mail.pr.hu)
	by frontdoor.pr.hu with esmtps (TLS1.2:DHE_RSA_AES_128_CBC_SHA1:128)
	(Exim 4.80) (envelope-from <zboszor@pr.hu>) id 1cv5Mi-0007bU-1c
	for openembedded-devel@lists.openembedded.org;
	Mon, 03 Apr 2017 19:02:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=pr.hu;
	s=pr20170203; 
	h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=vGWrW6NZBMFPpqwt2esCkYP+z/ik3x2/nmzeyhyteMM=; 
	b=TJB+9q+ZJCXJ94LyzrA2z2PZU8WQyNOA7ZSDKFDkKVWNQQktbxqQMkK52hGm12Z4F7jn63wrLSBLasKJuGZimKDqLIpzT/KThx65DeJIVR5PZNUgn+VZxlVLR2CGAwdhnuY+XJxjCMPdkxgG0dXtgJX6pQ61C8qyg3YqH/RNSZyRtYgMvRUncSTzdRzKrvD3YF18WukATfdVfs+upj43AKRzuskKOreR99aKVG529DZQlahCMUfTf6Korxa+5HdJ+N7D52Yi2CAWL2wAC5xh82iYWS/NzDZch1Ewo4eW7pZM1vk92BQ0vIYzboAAX/iy20uZN9YnVrYLsuArwNehJA==;
Received: from host-87-242-51-16.prtelecom.hu ([87.242.51.16]
	helo=s002.sicom.com) by mail.pr.hu with esmtpa (Exim 4.80)
	(envelope-from <zboszor@pr.hu>)
	id 1cv5Me-0005kg-7U; Mon, 03 Apr 2017 19:02:01 +0200
From: Zoltan Boszormenyi <zboszor@pr.hu>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  3 Apr 2017 19:01:31 +0200
Message-Id: <20170403170132.19588-2-zboszor@pr.hu>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170403170132.19588-1-zboszor@pr.hu>
References: <20170403170132.19588-1-zboszor@pr.hu>
X-Spam-Score: 1.1 (+)
X-Scan-Signature: e8ddfec10bb526beb59d4c4bb5d0161a
X-Spam-Tracer: backend.mail.pr.hu 1.1 20170403170201Z
Subject: [PATCH 1/2] kernel-module-split.bbclass: Support module compression
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 03 Apr 2017 17:22:56 -0000

Support module compression: CONFIG_MODULE_COMPRESS=y and either
CONFIG_MODULE_COMPRESS_GZIP=y or CONFIG_MODULE_COMPRESS_XZ=y

Signed-off-by: Zoltan Boszormenyi <zboszor@pr.hu>
---
 meta/classes/kernel-module-split.bbclass | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/meta/classes/kernel-module-split.bbclass b/meta/classes/kernel-module-split.bbclass
index 08d2262..8233848 100644
--- a/meta/classes/kernel-module-split.bbclass
+++ b/meta/classes/kernel-module-split.bbclass
@@ -39,16 +39,30 @@ python split_kernel_module_packages () {
 
     def extract_modinfo(file):
         import tempfile, subprocess
+        compression = re.match('^(.*)(\.k?o)(\.(xz|gz))?$', file)
+        modulefile = compression.group(1) + compression.group(2)
+        if compression.group(4) == 'xz':
+            rm_module_file = 1
+            cmd = "cat %s | xz -cd >%s" % (file, modulefile)
+            subprocess.call(cmd, shell=True)
+        elif compression.group(4) == 'gz':
+            rm_module_file = 1
+            cmd = "cat %s | gzip -cd >%s" % (file, modulefile)
+            subprocess.call(cmd, shell=True)
+        else:
+            rm_module_file = 0
         tempfile.tempdir = d.getVar("WORKDIR", True)
         tf = tempfile.mkstemp()
         tmpfile = tf[1]
-        cmd = "%sobjcopy -j .modinfo -O binary %s %s" % (d.getVar("HOST_PREFIX", True) or "", file, tmpfile)
+        cmd = "%sobjcopy -j .modinfo -O binary %s %s" % (d.getVar("HOST_PREFIX", True) or "", modulefile, tmpfile)
         subprocess.call(cmd, shell=True)
         f = open(tmpfile)
         l = f.read().split("\000")
         f.close()
         os.close(tf[0])
         os.unlink(tmpfile)
+        if rm_module_file == 1:
+            os.unlink(modulefile)
         vals = {}
         for i in l:
             m = modinfoexp.match(i)
@@ -119,7 +133,7 @@ python split_kernel_module_packages () {
         # Avoid automatic -dev recommendations for modules ending with -dev.
         d.setVarFlag('RRECOMMENDS_' + pkg, 'nodeprrecs', 1)
 
-    module_regex = '^(.*)\.k?o$'
+    module_regex = '^(.*)\.k?o(\.(xz|gz))?$'
 
     module_pattern_prefix = d.getVar('KERNEL_MODULE_PACKAGE_PREFIX', True)
     module_pattern = module_pattern_prefix + 'kernel-module-%s'
-- 
1.8.3.1


