Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id 9A6B6780BD
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 Nov 2017 15:29:31 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id v41so16880521qtv.12
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 Nov 2017 07:29:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=xCkF+Ywy0cFug6DNygaEiz6Ft/V65Q4uRPMq6Dildlw=;
	b=r0U8Aa+0Q2R4std2w0WalCjZdn87SCT3MH7ilFFLdNokRrTv6Ijb8idvkj2Svj4xZu
	cf6+AsA2d9TreFgrP6G5i/VEKWVPA43b5kav1AMwicDJPpAnAzTZUcqDddyoLwWtxVe8
	prFr+KwqDmEZ4jcYjnR/gu7PNE/4XxxkwOZLCJ8jR5iDnwAq8YQ0rq6fyWN5znOVH1pM
	2hMpAiJp659v9kK5mDUqd9AJo0vgYwQWQKQjk4DE8IBUaK+Peuy03RcZaz71u7v9r+Eu
	ZTnTQ9COebrggj+V3iWeicg2lFZgR/QvHQNtt3FZJNXa//qL/cBj5MoGTQLje2PyEGCz
	qqhA==
X-Gm-Message-State: AJaThX5p7NZfGsY66CmbtlsB7lWIHnGkQVnFa6veFIC4i51JwNRimlqK
	ftgKHnZqhLIJlGihYhfqijZq/ZAG
X-Google-Smtp-Source: AGs4zMaiJOBpe2XVlJU52hgx4Touopi5jAnjuzlGZm4K7ThYZauZvUwXomx8228qmAROxzqFcvWmaw==
X-Received: by 10.200.24.171 with SMTP id s40mr9695852qtj.292.1510500572791;
	Sun, 12 Nov 2017 07:29:32 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	j90sm4330253qtb.19.2017.11.12.07.29.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 12 Nov 2017 07:29:32 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 12 Nov 2017 10:29:24 -0500
Message-Id: <1510500564-23251-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-lxml: update to version 4.1.1
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
X-List-Received-Date: Sun, 12 Nov 2017 15:29:32 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-lxml.inc                   | 4 ++--
 .../python/{python-lxml_4.1.0.bb => python-lxml_4.1.1.bb}             | 0
 .../python/{python3-lxml_4.1.0.bb => python3-lxml_4.1.1.bb}           | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-lxml_4.1.0.bb => python-lxml_4.1.1.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-lxml_4.1.0.bb => python3-lxml_4.1.1.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-lxml.inc b/meta-python/recipes-devtools/python/python-lxml.inc
index 7c0a7d7..f153c0a 100644
--- a/meta-python/recipes-devtools/python/python-lxml.inc
+++ b/meta-python/recipes-devtools/python/python-lxml.inc
@@ -18,8 +18,8 @@ LIC_FILES_CHKSUM = "file://LICENSES.txt;md5=e4c045ebad958ead4b48008f70838403 \
 
 DEPENDS += "libxml2 libxslt"
 
-SRC_URI[md5sum] = "247580bd5d942872bd972ad0086e5cbf"
-SRC_URI[sha256sum] = "be3aaeb5f468a49f523f16736ccff7d82af2b4b303292ba3d052b5b28f3fbe47"
+SRC_URI[md5sum] = "0265ad6701951347f2dbbb470e3d1512"
+SRC_URI[sha256sum] = "940caef1ec7c78e0c34b0f6b94fe42d0f2022915ffc78643d28538a5cfd0f40e"
 
 DISTUTILS_BUILD_ARGS += " \
                      --with-xslt-config='pkg-config libxslt' \
diff --git a/meta-python/recipes-devtools/python/python-lxml_4.1.0.bb b/meta-python/recipes-devtools/python/python-lxml_4.1.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-lxml_4.1.0.bb
rename to meta-python/recipes-devtools/python/python-lxml_4.1.1.bb
diff --git a/meta-python/recipes-devtools/python/python3-lxml_4.1.0.bb b/meta-python/recipes-devtools/python/python3-lxml_4.1.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-lxml_4.1.0.bb
rename to meta-python/recipes-devtools/python/python3-lxml_4.1.1.bb
-- 
2.7.4


