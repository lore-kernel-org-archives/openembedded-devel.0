Received: from mail-ea0-f172.google.com ([209.85.215.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1ULYMd-0005v4-Vf
	for openembedded-devel@lists.openembedded.org;
	Fri, 29 Mar 2013 13:25:00 +0100
Received: by mail-ea0-f172.google.com with SMTP id z7so199361eaf.31
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Mar 2013 05:07:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=VyFvW0rj6f/q8PVAcIk3ayEV7XauA2kDW9mJPNLigNQ=;
	b=pWU3t1SLQD4USGcMG+GJRZEeNmZAg3x2wt+9C2QJ41fk+AQQDjvT/iQ1CL2jQM7rRP
	IIREs7beIaD768dTPCxHfKDm/DlIWgNUbLgdqH4kUKk9NFig/j9MUEDr9cA0MJOvgqJj
	4fuQgMuF+yp1/Ta8OHA1KHugmm9iEGJtSo6LcVi5q8uDL2LMqcBsBGgYqtPTc136UPcM
	OVYM2jr/onP4EFjewjrwvMkGE0OUFvPzGmpAJeOT70Bfcm9jg2Vh1pdNan1020fzLkWj
	QLHh1tqetzSwVkLhAymRhLMi8UC2s/6N1Cpg46psquC71iHPP5J6++z1t1Hs1XGKr1uJ
	u9bw==
X-Received: by 10.14.182.72 with SMTP id n48mr7467327eem.3.1364558876238;
	Fri, 29 Mar 2013 05:07:56 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id bc1sm3628799eeb.11.2013.03.29.05.07.55
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 29 Mar 2013 05:07:55 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 29 Mar 2013 13:07:58 +0100
Message-Id: <1364558878-1506-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.1.5
Subject: [PATCH] systemd.bbclass: set INHIBIT_UPDATERCD_BBCLASS like oe-core does now
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
X-List-Received-Date: Fri, 29 Mar 2013 12:25:00 -0000

---
 meta-systemd/classes/systemd.bbclass | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta-systemd/classes/systemd.bbclass b/meta-systemd/classes/systemd.bbclass
index f2a0363..4069367 100644
--- a/meta-systemd/classes/systemd.bbclass
+++ b/meta-systemd/classes/systemd.bbclass
@@ -33,6 +33,14 @@ def get_package_var(d, var, pkg):
     return val
 
 def systemd_after_parse(d):
+    features = d.getVar("DISTRO_FEATURES", True).split()
+    # If the distro features have systemd but not sysvinit, inhibit update-rcd
+    # from doing any work so that pure-systemd images don't have redundant init
+    # files.
+    if "systemd" in features:
+        if "sysvinit" not in features:
+            d.setVar("INHIBIT_UPDATERCD_BBCLASS", "1")
+
     def systemd_check_vars():
         if d.getVar('BB_WORKERCONTEXT', True) is not None:
             return
-- 
1.8.1.5



