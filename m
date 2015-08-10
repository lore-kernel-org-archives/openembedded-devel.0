Return-Path: <koen.kooi@linaro.org>
Received: from mail-wi0-f175.google.com (mail-wi0-f175.google.com
	[209.85.212.175])
	by mail.openembedded.org (Postfix) with ESMTP id 89E07768AB
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Aug 2015 15:42:52 +0000 (UTC)
Received: by wicja10 with SMTP id ja10so42263257wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Aug 2015 08:42:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=6SxM3ClXHiS6/yG1N2Lil2gPnq/TuZeJ1FfI0qBjBlk=;
	b=B8SXZoApKRM4RCJGU1tZFP5/BwxciMwvXDhWw1DSQiHjkVH4QyfcCOHT3j0mU0lkAZ
	856xX/E68r1Rz4wvw75Hqr9QLVlTy8GVwvCGeBaciZOrwbwJFLc4TrK8LgnOya93i4WI
	eAEgoLRO+JtwYmJ8qPX8aFmQ3CO4/4rYf9fwoWFwbdxvSLD+OyXYz70miPnOaBckbkpE
	+4ReygbbRpwcSbMUvgx2ewlXt205LBsThZsQPnjO/5bTHgCutLHTrrLsxsyd6qKHa65+
	6Vj38ldA4QVe0f/PxjR9Vk7E4s+Qd2GL2rRkxj+g49qCjaRwAJdx/5qqCvu2hOEtV5lp
	kbpg==
X-Gm-Message-State: ALoCoQmwFXUAF4XLPF66RRxBZ5Y9OFyF6cegc8D0VZnVesF70ll2xeHae4ccRBAe+sExE48juKPN
X-Received: by 10.194.191.129 with SMTP id gy1mr11902979wjc.86.1439221372710; 
	Mon, 10 Aug 2015 08:42:52 -0700 (PDT)
Received: from localhost ([2001:610:612:0:2ad2:44ff:fe4b:bc17])
	by smtp.gmail.com with ESMTPSA id
	bd9sm14369748wib.18.2015.08.10.08.42.51
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 10 Aug 2015 08:42:51 -0700 (PDT)
From: Koen Kooi <koen.kooi@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 10 Aug 2015 17:42:46 +0200
Message-Id: <1439221366-7089-1-git-send-email-koen.kooi@linaro.org>
X-Mailer: git-send-email 2.1.0
Cc: Koen Kooi <koen.kooi@linaro.org>
Subject: [meta-python][PATCH] python-pyyaml 3.10: unbreak versioning
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
X-List-Received-Date: Mon, 10 Aug 2015 15:42:54 -0000

Using our own setup.py is great, but it should use the same version as the recipe, otherwise you get errors like these:

pkg_resources.DistributionNotFound: The 'PyYAML==3.10' distribution was not found and is required

Package python-pyyaml (3.10-r0.0) is installed on root and has the following files:
[..]
/usr/lib/python2.7/site-packages/PyYAML-3.06-py2.7.egg-info

Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
---
 meta-python/recipes-devtools/python/python-pyyaml/setup.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python-pyyaml/setup.py b/meta-python/recipes-devtools/python/python-pyyaml/setup.py
index fb64983..2ed1c94 100644
--- a/meta-python/recipes-devtools/python/python-pyyaml/setup.py
+++ b/meta-python/recipes-devtools/python/python-pyyaml/setup.py
@@ -1,5 +1,5 @@
 NAME = 'PyYAML'
-VERSION = '3.06'
+VERSION = '3.10'
 DESCRIPTION = "YAML parser and emitter for Python"
 LONG_DESCRIPTION = """\
 YAML is a data serialization format designed for human readability and
-- 
2.1.0


