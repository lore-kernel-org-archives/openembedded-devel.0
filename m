Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SrrXH-0006l2-OM
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Jul 2012 16:16:59 +0200
Received: by mail-wi0-f171.google.com with SMTP id hq4so5288172wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jul 2012 07:05:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=AGa5fXzlYNqRW6rLEjcv5MMSDLbst5WTVR+26O9h8W4=;
	b=DusrwkTNsPJ1yRKxkxflS62uSWh+xwmm1GHGDeN3c+Y+ZgVM4sI7c88ow+P8jtZkWw
	tZqUTO/x3s9mQxPHnxHzdh/SuSklP9DmjhzYnjcTC7+tPIVf/K0f2bU7Fn+AhDAegQA7
	a680MwTxVdyRExnahIX6W+HRB4BNysuWLemhXYOj7nI6u9Mp02I+quB9tTuxkLV4rltq
	xUsUihh4hLUUPECVIksLO3Sgx0s6JqISe35IEh0DQ1pYBqXd0K3pZSBw4UWZyPsRPZy7
	vm+sKvZL0wqoojFUwnqJyeasAhCDZAd03bKZhLn3qxxFwDtb5cjePzWIg8U+3TJbIjEB
	tYJw==
Received: by 10.180.99.196 with SMTP id es4mr16614102wib.18.1342706739985;
	Thu, 19 Jul 2012 07:05:39 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id w7sm38625105wiz.0.2012.07.19.07.05.38
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 19 Jul 2012 07:05:39 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 19 Jul 2012 16:05:35 +0200
Message-Id: <e7c7a18fa310bce6666944340c9a5624f1a67dc6.1342706683.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <cover.1342706683.git.Martin.Jansa@gmail.com>
References: <cover.1342706683.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1342706683.git.Martin.Jansa@gmail.com>
References: <cover.1342706683.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 2/5] poppler-fp: convert tabs to 4 spaces in get_poppler_fpu_setting
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
X-List-Received-Date: Thu, 19 Jul 2012 14:17:00 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/poppler/poppler-fpu.inc |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-support/poppler/poppler-fpu.inc b/meta-oe/recipes-support/poppler/poppler-fpu.inc
index a262730..11df852 100644
--- a/meta-oe/recipes-support/poppler/poppler-fpu.inc
+++ b/meta-oe/recipes-support/poppler/poppler-fpu.inc
@@ -1,6 +1,6 @@
 
 def get_poppler_fpu_setting(bb, d):
-	if bb.data.getVar('TARGET_FPU', d, 1) in [ 'soft' ]:
-		return "--enable-fixedpoint"
-	return ""
+    if bb.data.getVar('TARGET_FPU', d, 1) in [ 'soft' ]:
+        return "--enable-fixedpoint"
+    return ""
 
-- 
1.7.8.6



