Return-Path: <alex.kiernan@gmail.com>
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
	[209.85.221.45])
	by mail.openembedded.org (Postfix) with ESMTP id 1A3177F8DA
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Nov 2019 05:59:16 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id w18so24248506wrt.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 Nov 2019 21:59:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=17uNI+By6TUN4NR8IC7VXEOh1cU64LybqusKXiSRTQw=;
	b=pPsVLhFiC36ODO6LJk6DdgAWlQEYLvmQwrgzSRvHtmWF17NBBUv9BG2e7Q2xrCnG2d
	R2ZdQjnoOlCOEFC3Cd2PWLg1QGZmUiofNp/WFrMTQgpzjMgo9+aefDSqTexGa6Vo5dMb
	4l8ravsgd1B8fzdsfqNCV5xfYHpyrE/YJ2aCaLCx3PoNkEt/XWOy+r02r3OeAFWghNKd
	z8+DdMxb2Fyy1bhxhMR/GLu+MHlh7wjdaACoOYGhe+2/N64n0dtOHlmBHtA7PGpiruB+
	FXgrBYyXtMppZS9xo2GvkH6guNS9tsQs4avOK9JrT92YsomFejSHCvX4uLBa73YLhsMS
	ktLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=17uNI+By6TUN4NR8IC7VXEOh1cU64LybqusKXiSRTQw=;
	b=Mw/aPLsuN3ErXxwWZgtCko47oqK5q1sLACjRHXYebn2VlT8TDzasEpnQj+b9MJF0R7
	HZpz6z9WDxGRIK09oCOwzyLkqoY7b1JWt0BK2Frn+Qhp2MFl591H2M+l6Y6yGVbccjj7
	aP+DrdMwxeFnttwxI60LvR7XiardGk2azie/5XZG2esW9tuQtViQuh3KyZdeLUEy/j2c
	swWLybmAfAvjdX3VyCmqzMpcdo0pbP/dBB9dzf7/ON1+8PYGZjlxdTj7ogtSjU7TSUGc
	RryI8/HQRR0j/H5uiTHIKukElPcjul4vVrMh7eJ8GemfXLSLiZreXxn+AWLEy55ajOOA
	+GSA==
X-Gm-Message-State: APjAAAWBYz0qXPC7ySn33/+PrE6s/PG5PZhjcq21eo+uZe+2YxKSgE1Q
	fKhw4dSzXGOsy+hsmTsFoyt+D/Db
X-Google-Smtp-Source: APXvYqzN8vLw75O71CXAqKv+7z/LfbW4+KSCEt9dOxd3f6rblVDxkMWbw3x5qSZbJ/rNZ6r7CCo5eg==
X-Received: by 2002:adf:c58f:: with SMTP id m15mr875477wrg.362.1573019956621; 
	Tue, 05 Nov 2019 21:59:16 -0800 (PST)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net.
	[91.135.6.246]) by smtp.gmail.com with ESMTPSA id
	g4sm15489451wru.75.2019.11.05.21.59.15
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 05 Nov 2019 21:59:16 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  6 Nov 2019 05:59:10 +0000
Message-Id: <20191106055910.105795-2-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191106055910.105795-1-alex.kiernan@gmail.com>
References: <20191106055910.105795-1-alex.kiernan@gmail.com>
Subject: [meta-oe][PATCH v3 2/2] ostree: Upgrade 2019.4 -> 2019.5
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
X-List-Received-Date: Wed, 06 Nov 2019 05:59:16 -0000

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

Changes in v3: None
Changes in v2: None

 .../ostree/{ostree_2019.4.bb => ostree_2019.5.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/ostree/{ostree_2019.4.bb => ostree_2019.5.bb} (99%)

diff --git a/meta-oe/recipes-extended/ostree/ostree_2019.4.bb b/meta-oe/recipes-extended/ostree/ostree_2019.5.bb
similarity index 99%
rename from meta-oe/recipes-extended/ostree/ostree_2019.4.bb
rename to meta-oe/recipes-extended/ostree/ostree_2019.5.bb
index f438b35ebee2..035b4bb88689 100644
--- a/meta-oe/recipes-extended/ostree/ostree_2019.4.bb
+++ b/meta-oe/recipes-extended/ostree/ostree_2019.5.bb
@@ -32,7 +32,7 @@ SRC_URI = " \
     file://0003-tests-Avoid-musl-failure-with-cp-a.patch \
     file://0001-build-create-tests-directory-for-split-builds.patch \
 "
-SRCREV = "9d39e7d91e8497987cad69a3fbed5c5fc91eebdc"
+SRCREV = "980ca07b03b3aa7e0012729dd6c84b0878775d93"
 
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+\.\d+)"
 
-- 
2.17.1


