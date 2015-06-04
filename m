Return-Path: <akuster808@gmail.com>
Received: from mail-qk0-f176.google.com (mail-qk0-f176.google.com
	[209.85.220.176])
	by mail.openembedded.org (Postfix) with ESMTP id DF75D734DA
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 Jun 2015 23:11:28 +0000 (UTC)
Received: by qkx62 with SMTP id 62so32128214qkx.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Jun 2015 16:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=6aecumoGy58FoNIWcAbOFqK6GWM1f5Mg/mdwwRl2+Mo=;
	b=zCLDovo5lSKpGN4vKTDCZVWBK75d2Dih8cl2pXmThGi1Q/dQtWGBNrstzJXTJeGZhT
	YgqP0McsQRuj1JTA/C+cAPY1Kmfu1/yOUfPQY1mOnKGcVa4rZbxxLG8j6lA428aqI4e2
	XgS1H2zaohrwrfBKvdfyZg8pe1Z89qHTCQTqj0fC8jnhtt5mP8oBVW7b3qwIumBPDr+m
	qm7PZV5FWNfOuC36dtbbgahhGr9hAYAlsZglCj+ncBRz9iAV5E+0LLDsOxxlM/wRLgCa
	Rq2DQjL5zFIli+8gdIMyEvVgdj5QwjGOk33NLYFHUCztFnnfw/QxuHLAptr+FLyvr+ON
	pnaA==
X-Received: by 10.140.38.167 with SMTP id t36mr510093qgt.69.1433459490003;
	Thu, 04 Jun 2015 16:11:30 -0700 (PDT)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207])
	by mx.google.com with ESMTPSA id a102sm3170427qka.0.2015.06.04.16.11.27
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 04 Jun 2015 16:11:28 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  4 Jun 2015 16:11:24 -0700
Message-Id: <1433459484-6308-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
Subject: [meta-ruby][PATCH] bundler: update to 1.9.4
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
X-List-Received-Date: Thu, 04 Jun 2015 23:11:32 -0000

add depends for git.

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-ruby/recipes-devtools/ruby/bundler_git.bb | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/meta-ruby/recipes-devtools/ruby/bundler_git.bb b/meta-ruby/recipes-devtools/ruby/bundler_git.bb
index fc73001..7d79544 100644
--- a/meta-ruby/recipes-devtools/ruby/bundler_git.bb
+++ b/meta-ruby/recipes-devtools/ruby/bundler_git.bb
@@ -13,19 +13,21 @@ been installed, so that others can install the exact same gems."
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=196bb963e601609817d7e9ac9a64a867"
 
-PR = "r0"
+SRCREV = "06dc8472b9142fd6aaefff780d6d252c20dc2a04"
 
-PV = "1.6.2"
-SRCREV = "06e3647c117da210ffd15a174624497830addd7b"
+BRANCH = "1-9-stable"
+PV = "1.9.4"
 
 S = "${WORKDIR}/git"
 
 SRC_URI = " \
-    git://github.com/bundler/bundler.git \
+    git://github.com/bundler/bundler.git;branch=${BRANCH} \
     "
 
 inherit ruby
 
 FILES_${PN} += "${libdir}/ruby/gems"
 
+RDEPENDS_${PN} = "git"
+
 BBCLASSEXTEND = "native"
-- 
2.3.5


