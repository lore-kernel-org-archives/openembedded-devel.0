Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f173.google.com (mail-qt0-f173.google.com
	[209.85.216.173])
	by mail.openembedded.org (Postfix) with ESMTP id A352E77698
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Dec 2016 15:45:40 +0000 (UTC)
Received: by mail-qt0-f173.google.com with SMTP id w33so237878234qtc.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Dec 2016 07:45:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=mnQ17kAmO+SWoSWx+DkwU/pmd1zTxis9PlvOz+1Ep78=;
	b=t1uj3RRxzrDBV2sM0jCplFtzbqJEk1eysVkc7FIHS4B8Q0mFUfz5ZL1TrYDPkxTyCY
	mZJyUR2iAD9jQJuoxSEIf4j4bPv26Avmqqo88ToA4q06OTLrOTQuEnug6sH5e4UYGuJ6
	npPCOTCkq/sj8pCb+0zikfiUC7+wW/1cneUf6oJqsg54HZeGuYBWCIYB35VKfG6sSweS
	6YD4IP2gCcf8ML7oSSg1xwKZWHUU+qWw34KFe0zSXFwGBvvmTW1LE+5hJT9WRC5Shj+9
	cTGsqukTsA7hP3eFT5Tzcjf69nPAVNbeYP+x3iUk54xnLf54zvkCMKwrtZUR9g+YrhHD
	th7w==
X-Gm-Message-State: AIkVDXJjSOOBcddpo+pahGWWQYfPqN1P7orOdq6duBQpDEnOs0kJ+R9YXVmfC1f2YVPKrQ==
X-Received: by 10.237.35.3 with SMTP id h3mr10561418qtc.155.1482421541483;
	Thu, 22 Dec 2016 07:45:41 -0800 (PST)
Received: from sparta.ny.asterius.io (ool-457cd903.dyn.optonline.net.
	[69.124.217.3]) by smtp.gmail.com with ESMTPSA id
	d83sm1158394qke.35.2016.12.22.07.45.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 22 Dec 2016 07:45:40 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 22 Dec 2016 10:45:31 -0500
Message-Id: <1482421531-29836-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python3-wekzeug: update RDEPENDS to pull in http module
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
X-List-Received-Date: Thu, 22 Dec 2016 15:45:41 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python3-werkzeug_0.11.11.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-werkzeug_0.11.11.bb b/meta-python/recipes-devtools/python/python3-werkzeug_0.11.11.bb
index af2d86a..145a1de 100644
--- a/meta-python/recipes-devtools/python/python3-werkzeug_0.11.11.bb
+++ b/meta-python/recipes-devtools/python/python3-werkzeug_0.11.11.bb
@@ -1,2 +1,4 @@
 inherit pypi setuptools3
 require python-werkzeug.inc
+
+RDEPENDS_${PN} += "${PYTHON_PN}-misc"
-- 
2.7.4


