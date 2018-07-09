Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 0417774A25
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Jul 2018 10:49:36 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id v128-v6so3123241wme.5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Jul 2018 03:49:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=ifQoBpiSahIbRIF15dA8W8sr9MwTX+H+l98Yv+D/9aQ=;
	b=GU1rQxG1z+kTIDINvmeOTcRH5TiuHxhINZnpg8tWfethcTKdQh6DxybhUVubxTn8Nh
	u3myM2Mt2S5q0hwqKAHHffHAgJbKExakhttxH0ZM6DGD8tr1DWebS1vI31NRYtBxJVyQ
	6ZjKPZbZy2o+3KIJWHiMRL0wLid5IF0LCqOud0zkacLBLnjVS3QtjXg/l31d7+wF95kv
	r8gT2AMOYNkrXRAs2stuKzjJyecWZjzpgI/iJlr5KvqsWdbiX0wQzesi9nUf/26DRclL
	ZmlBxm35YsBGCniz5mNIuTF94ybqYf1nbyQH31mQp6f7L4g+FM4DbVSmXEH1SlyG1kqC
	1iEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=ifQoBpiSahIbRIF15dA8W8sr9MwTX+H+l98Yv+D/9aQ=;
	b=TrtsWQO1KbHCnHE2XlfV1oUGdaTyT1fQBZZz7eR37Rr0UP3N648zUpHXalminFwmoi
	Wdg4I+/EXO+C+GsbNca1uW6PT/FiWGh776y364iydY3H+fx/aG7r69JG+Dit1+7jePSm
	eja40j0SUDMNjb15UeMJ29m4G2b0VeHvEOFDUvAzgHKTiwtpkezl39HVzegc98IkXyS/
	4BjOt6R6WfD5Q1YVYZnTu6DunMmRZhW3kjYdF7pCvoKR44/iZWzATgzLsYV+xNyzlKG/
	Ps7jwz23a9OMJa8KMrQGPQ/zkmUuhmqh+QQM5Fha0H1b1RZjqI3TDZsEb/EkneTVJAOA
	cM0w==
X-Gm-Message-State: APt69E2snkndR8ejk+QHsK28BMb+IvWY0FNalQHKERbm78yJWX+ujd+9
	xFv1sQP5fZ7bkxfbxK6hfQeV0TpG
X-Google-Smtp-Source: AAOMgpdrycuyL9MF1WgLpy5SyM20SPGv7QgViSvp160tC5RvCMoWgltO8OE3r7QezJjMQJd7Wmj2YA==
X-Received: by 2002:a1c:7d58:: with SMTP id
	y85-v6mr11463430wmc.91.1531133377450; 
	Mon, 09 Jul 2018 03:49:37 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	i95-v6sm18283527wri.63.2018.07.09.03.49.36
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 09 Jul 2018 03:49:36 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  9 Jul 2018 11:49:33 +0100
Message-Id: <20180709104933.24607-2-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180709104933.24607-1-ross.burton@intel.com>
References: <20180709104933.24607-1-ross.burton@intel.com>
Subject: [PATCH meta-python 2/2] python-panda: add cython to DEPENDS
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
X-List-Received-Date: Mon, 09 Jul 2018 10:49:37 -0000

The distutils class does a 'setup.py clean' now, deleting files which then need
to be regenerated.  Add Cython to the build dependencies so this can be done.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta-python/recipes-devtools/python/python-pandas.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python-pandas.inc b/meta-python/recipes-devtools/python/python-pandas.inc
index a08f1c2861..9b8e4dcf18 100644
--- a/meta-python/recipes-devtools/python/python-pandas.inc
+++ b/meta-python/recipes-devtools/python/python-pandas.inc
@@ -12,7 +12,7 @@ SRC_URI[sha256sum] = "50b52af2af2e15f4aeb2fe196da073a8c131fa02e433e105d95ce40016
 inherit pypi
 
 DEPENDS += " \
-    ${PYTHON_PN}-numpy-native \
+    ${PYTHON_PN}-numpy-native ${PYTHON_PN}-cython-native \
 "
 
 RDEPENDS_${PN} += " \
-- 
2.11.0


