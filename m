Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id C05006E64A
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Mar 2016 20:02:45 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id s5so1064260qkd.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Mar 2016 13:02:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=5JWH3eIjAPjlCa6SzxQxkEddP2MoXkqwMStSK0LzNSU=;
	b=k06ZxoJpe8HGlKEnKVBE2P5bLS3YjDP5AKpX7+gbGcD/xr+7oiSy5Cqhq5Yn/L3mAc
	VkgOedS7PExo7GRLC4E1ANDdCSq0/Otx7iCl+odThA2Emns5PRj0QG9qEAfMRO+CkOK9
	oGE78BpYwZ0zzd6f2Qm5CzE3EGccAppl70jgcA7rNeVdQLgvrvljPenyzJlQ/KDwKPdo
	9+UQVY4nY9UrGTTwP2Al3ocxDVjCikq4PHQ/j/OREgFTvXMkN+qGA9/NT0dJNtA6bCLX
	vrpsHU56gsGpeJmlrYcTKmsqL/uA7EJHwIPd4H3W2oW4xZabpqadLZARcuwPm7lwddIk
	xFcA==
X-Gm-Message-State: AD7BkJJejygK8Y2sH73umKc4glRu3lisZnkzFCHLDYd5xJMVsGdivCKNglR355TrnlR9Ww==
X-Received: by 10.55.52.211 with SMTP id b202mr6113081qka.27.1458763366558;
	Wed, 23 Mar 2016 13:02:46 -0700 (PDT)
Received: from build-slave.minotaur.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168]) by smtp.gmail.com with ESMTPSA id
	a102sm1752180qgf.21.2016.03.23.13.02.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 23 Mar 2016 13:02:46 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 23 Mar 2016 16:01:58 -0400
Message-Id: <1458763321-30761-3-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1458763321-30761-1-git-send-email-derek@asterius.io>
References: <1458763321-30761-1-git-send-email-derek@asterius.io>
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH 3/6] python-tornado: fix the paths for the test package
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
X-List-Received-Date: Wed, 23 Mar 2016 20:02:45 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-tornado.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python-tornado.inc b/meta-python/recipes-devtools/python/python-tornado.inc
index 679b7ba..7e3ac8c 100644
--- a/meta-python/recipes-devtools/python/python-tornado.inc
+++ b/meta-python/recipes-devtools/python/python-tornado.inc
@@ -19,6 +19,6 @@ PACKAGES =+ "\
 "
 
 FILES_${PN}-test = " \
-    ${libdir}/${PYTHON_DIR}/site-packages/${SRCNAME}/test \
-    ${libdir}/${PYTHON_DIR}/site-packages/${SRCNAME}/testing.py* \
+    ${libdir}/${PYTHON_DIR}/site-packages/*/test \
+    ${libdir}/${PYTHON_DIR}/site-packages/*/testing.py* \
 "
-- 
1.9.1


