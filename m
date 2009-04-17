Received: from [80.246.246.162] (helo=office.altell.ru)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <khimov@altell.ru>) id 1LulH9-0005o9-1X
	for openembedded-devel@openembedded.org; Fri, 17 Apr 2009 12:26:37 +0200
Received: from localhost.localdomain (unknown [192.168.1.115])
	by mail.altell.local (Postfix) with ESMTP id C555B683CB;
	Fri, 17 Apr 2009 14:22:21 +0400 (MSD)
From: Roman I Khimov <khimov@altell.ru>
To: openembedded-devel@openembedded.org
Date: Fri, 17 Apr 2009 14:22:21 +0400
Message-Id: <1239963741-12123-1-git-send-email-khimov@altell.ru>
X-Mailer: git-send-email 1.6.2.1
MIME-Version: 1.0
X-Altell-MailScanner: Found to be clean
X-Altell-MailScanner-From: khimov@altell.ru
X-SA-Exim-Connect-IP: 80.246.246.162
X-SA-Exim-Mail-From: khimov@altell.ru
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=AWL,BAYES_50,RDNS_NONE,
	SPF_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] icecc.bbclass: fix kernel distributed compilation
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
X-List-Received-Date: Fri, 17 Apr 2009 10:26:40 -0000

---
 classes/icecc.bbclass |   11 ++++++-----
 1 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/classes/icecc.bbclass b/classes/icecc.bbclass
index dce29fb..0eb2d9f 100644
--- a/classes/icecc.bbclass
+++ b/classes/icecc.bbclass
@@ -137,7 +137,8 @@ def create_native_env(bb,d):
 
 def get_cross_kernel_cc(bb,d):
     kernel_cc = bb.data.expand('${KERNEL_CC}', d)
-    kernel_cc = kernel_cc.replace('ccache', '')
+    kernel_cc = kernel_cc.replace('ccache', '').strip()
+    kernel_cc = kernel_cc.split(' ')[0]
     kernel_cc = kernel_cc.strip()
     return kernel_cc
 
@@ -182,10 +183,10 @@ def create_cross_kernel_env(bb,d):
     cr_env_script = bb.data.getVar('ICECC_ENV_EXEC',  d) or  bb.data.expand('${STAGING_DIR}', d)+"/ice/icecc-create-env"
     result=os.popen("%s %s %s %s %s %s" %(cr_env_script,
            "--silent",
-           os.path.join(ice_dir,'bin',kernel_cc),
-           os.path.join(ice_dir,target_sys,'bin','g++'),
-           os.path.join(ice_dir,target_sys,'bin','as'),
-           os.path.join(ice_dir,"ice",cross_name) ) )
+           os.path.join(ice_dir, 'bin', kernel_cc),
+           os.path.join(ice_dir, 'bin', "%s-g++" % target_sys),
+           os.path.join(ice_dir, 'bin', "%s-as" % target_sys),
+           os.path.join(ice_dir, "ice", cross_name) ) )
     return tar_file
 
 
-- 
1.6.2.1


-- 
This message has been scanned for viruses and
dangerous content by MailScanner, and is
believed to be clean.



