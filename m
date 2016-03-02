Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id CFF9977071
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  2 Mar 2016 16:19:21 +0000 (UTC)
Received: by mail-wm0-f54.google.com with SMTP id l68so87582183wml.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 02 Mar 2016 08:19:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=mbTRsyWtebKiJzlbVdWmja2UOf+JE4tIeikqBgh0VZo=;
	b=MKNKwETS736CUsB3HWEzHzvMsNaTzn9x3/hSZOwVSdQ6zM+FUQjLY9UApkwfADWUGr
	7BYQ8LA34w9NKYNRK8qXICW3MM1QqQT8WFDAtgyZUCCC9QGGaiAY+U5Q+P7vPpyotWcs
	3N/QmxQ+Xmg/AFCKizWIvgntXZcDZWiYwSjpUzjzeg9YNa0qnahdhfOSm1+beFp6jJHx
	45KnziLfSzoVUSjwNb0q4Bpx262hcxGdj3w3/P2EqmJ1BGwyNOl9DiXAy4rx85WIsEm/
	XTObKwtviM7HR0gsPYFfFOscWU5Tl6XqyMeczrFTmFKB3QYGYXcbHoHv3ccW1eXCd9rQ
	gZfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=mbTRsyWtebKiJzlbVdWmja2UOf+JE4tIeikqBgh0VZo=;
	b=NOKZ+ZVf3fZ1Imi7XlSjvUdYOtE4LFywIZLiowQpvWdWZSnzKF2mR74d33o8rshDlO
	JWQSk+Ok9FHLhYAdZFfZ6YrUS5XVw0IrDUA/RwKtj5tvgf+nXHD8EusQ2O9el4EPKSxj
	XaWQQVRcOEFmZJAsf105SkA9MCMcQofwg1PbI9rJ3OHIFfvqNNAnyjILdQgm/DYHZG8P
	xLM4nTZ8wnyz5BeCTYuPd1r0FJYZoK1TUUPz+znevP2EH2UFbTlboqWcVyaU5yeMVgsH
	60c+pxvmOne8Pm0Os2BYNinhljnI0yKurxDumAukSpm8nAPJmBNkywE9TKqIJn808EmK
	pTpQ==
X-Gm-Message-State: AD7BkJIHSaH1YIp1d+NIoVn7hp3obsh94QYrRNNs7FFkupfFlo+KG24N49fzC2Qg+pPNMg==
X-Received: by 10.28.91.142 with SMTP id p136mr794175wmb.76.1456935562434;
	Wed, 02 Mar 2016 08:19:22 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	bg1sm36622730wjc.27.2016.03.02.08.19.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 02 Mar 2016 08:19:21 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  2 Mar 2016 17:21:12 +0100
Message-Id: <1456935672-15538-5-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.7.2
In-Reply-To: <1456935672-15538-1-git-send-email-Martin.Jansa@gmail.com>
References: <1456935672-15538-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH][meta-oe 5/5] webkit-efl: blacklist, webkit-efl is old and unmaintained fork with security issues
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
X-List-Received-Date: Wed, 02 Mar 2016 16:19:22 -0000

* now it also fails to build again with;
  webkit-efl/1_1.11.0-r0/ewebkit/Source/JavaScriptCore/profiler/ProfileNode.cpp:126:41: error: 'isnan' was not declared in this scope
  adding cmath include could be enough, but this was last drop
  of my patience

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/e17/elbow_git.bb      | 2 ++
 meta-efl/recipes-efl/webkit/webkit-efl.inc | 3 +++
 2 files changed, 5 insertions(+)

diff --git a/meta-efl/recipes-efl/e17/elbow_git.bb b/meta-efl/recipes-efl/e17/elbow_git.bb
index 064b794..06ed2c9 100644
--- a/meta-efl/recipes-efl/e17/elbow_git.bb
+++ b/meta-efl/recipes-efl/e17/elbow_git.bb
@@ -22,3 +22,5 @@ SRC_URI = " \
 S = "${WORKDIR}/git"
 
 FILES_${PN} += "${datadir}/themes"
+
+PNBLACKLIST[elbow] ?= "Depends on blacklisted webkit-efl"
diff --git a/meta-efl/recipes-efl/webkit/webkit-efl.inc b/meta-efl/recipes-efl/webkit/webkit-efl.inc
index aa91572..c6ef976 100644
--- a/meta-efl/recipes-efl/webkit/webkit-efl.inc
+++ b/meta-efl/recipes-efl/webkit/webkit-efl.inc
@@ -64,3 +64,6 @@ FILES_${PN}-dev += "${libdir}/cmake"
 FILES_${PN}launcher = "${bindir}/EWebLauncher"
 FILES_${PN}launcher-dbg = "${bindir}/.debug/EWebLauncher"
 FILES_${PN}-inspector += "${datadir}/ewebkit2-1/inspector"
+
+# http://errors.yoctoproject.org/Errors/Details/40659/
+PNBLACKLIST[webkit-efl] ?= "Old and unmaintaned fork with many security issues"
-- 
2.7.2


