Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id 4215C60191
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Jul 2018 18:09:16 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id 126-v6so3859810qke.5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Jul 2018 11:09:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=2jmYh+upNY219/n4m/KE4o1NkobMoXRSPiK0j36hqC0=;
	b=dsMHUn/JL0f8iAfmIACIIdT2JWHQ16a1wiMxorgJVgX/D9S2JbFY9BDudcOvOcoV+f
	sfW2QpEFeDvgGLPTdnnQy8lS4c3MvcWKknR9uannqP/6zbJgrGhyNVYqllPgWMzudQsV
	deYhzGapT37hsRD2ezKgJZqyP/taDlCmFpZGXO8ZYQyv3a7Lc6lXrvJoPYoY5vLLZRKB
	qwSwtJZ95aLtoLxwaK4HPb/z6IizP4g/yJSpHH/56dXuLRcYm7pIBpYk9IN2V3t3x873
	OeisM5Ny9o9+1Ybgz5rLjcROezruHlyjhLCPZMgHRC/vYDGzZ9Q0uR96V8+jDs6Yp+KS
	NUkg==
X-Gm-Message-State: AOUpUlHw0HgxKrZv3a0SpTlfkX42/qLzhfu3Ao4pK9ucC4+Ij4eUfLwk
	k+yGihgk3+l4fUmnePui1O+DL0I8RLM=
X-Google-Smtp-Source: AAOMgpcmo1rE7S/cdd6TY92wJluV9Kvg4TX3tvPW7FWEEqwE3TVmCwMDSebLvJH2dlkt0p+YDfKUCA==
X-Received: by 2002:a37:8883:: with SMTP id
	k125-v6mr6925139qkd.274.1532714956841; 
	Fri, 27 Jul 2018 11:09:16 -0700 (PDT)
Received: from sparta.ny.asterius.io ([68.132.61.164])
	by smtp.gmail.com with ESMTPSA id
	q18-v6sm2810458qtg.82.2018.07.27.11.09.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 27 Jul 2018 11:09:16 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 27 Jul 2018 14:09:09 -0400
Message-Id: <1532714949-9061-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-vobject: update to version 0.9.6.1
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
X-List-Received-Date: Fri, 27 Jul 2018 18:09:16 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/{python-vobject_0.9.6.bb => python-vobject_0.9.6.1.bb}     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-vobject_0.9.6.bb => python-vobject_0.9.6.1.bb} (71%)

diff --git a/meta-python/recipes-devtools/python/python-vobject_0.9.6.bb b/meta-python/recipes-devtools/python/python-vobject_0.9.6.1.bb
similarity index 71%
rename from meta-python/recipes-devtools/python/python-vobject_0.9.6.bb
rename to meta-python/recipes-devtools/python/python-vobject_0.9.6.1.bb
index d92c137..d31f2f5 100644
--- a/meta-python/recipes-devtools/python/python-vobject_0.9.6.bb
+++ b/meta-python/recipes-devtools/python/python-vobject_0.9.6.1.bb
@@ -4,8 +4,8 @@ HOMEPAGE = "http://vobject.skyhouseconsulting.com/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE-2.0.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI[md5sum] = "1da0747914fe440329c0b37e4be9040d"
-SRC_URI[sha256sum] = "cd9ede4363f83c06ba8d8f1541c736efa5c46f9a431430002b2f84f4f4e674d8"
+SRC_URI[md5sum] = "06357e96a84d55de2a71b36d39f6853e"
+SRC_URI[sha256sum] = "96512aec74b90abb71f6b53898dd7fe47300cc940104c4f79148f0671f790101"
 
 inherit pypi setuptools
 
-- 
2.7.4


