Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id AF48D730C4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Mar 2017 16:40:59 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id z133so3831618wmb.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Mar 2017 09:41:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=DpZc+3MLj7/JiTUO+WK15tMdVO42T3ILoBmzK0V6kx4=;
	b=bvtzJyOX5ZdO5MrwZVIJ9aLuBfsXaQ9/To5mI4W1PPbmEBVyrOhQy0epjd033hDVi0
	i1SmfsYf648W+SAvvtLKuluv1BdSfrLbyrbRmx7qwk/wEsMmRR5PHE6D7bmOeayJi/dT
	hISxP0vJQMDYp1DqSDtHCwJTZWoUrwyliFLjuAHJbOawTKp1WHRr++Yb/XBvEtkHaRHJ
	6nsPiFBjXiL82a72nL90QQZWbmNZ1q1fjRmbrthN+RJMM0c7X6waC+elznZrloRTjMCe
	jN9g/wLdIAT/n75ZoQWJ5gjGj3iXrIxbW8WmYRHZ6AWx4y07kg/BcsaPb5hGivg2dEgX
	jBcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=DpZc+3MLj7/JiTUO+WK15tMdVO42T3ILoBmzK0V6kx4=;
	b=p95KuXCg5umOldZlwibU5P6fQGIdUTbOYQxY9BsO7QLxapxjNhFcZKPbR+wfAtPYJJ
	CjvFmMQYkIYyfeIyZhBgUCcUpZNhIPXtdVjG+Lw6tW2Lob+t5moj8YL2UgZ11u/NxeH+
	qScXXXMc1LDRBxot3mir4OndqXDIK5XCOpVBRS8DibEkgZvKbJ/ZK+5qHIPM5YFnUoXs
	PNvmo9MbknqJsiq0TNN7N0EETMovB2lqYrVsgzVg0L1B+VRxE4TuQtrM5QuBmFzVidK0
	5CMydcJzyWrgjpr17UMOEMBI6hV8FYzPXvBpyjFcz0mqTI5QCv8uriJ7HEszFCIhRGES
	CAsA==
X-Gm-Message-State: AFeK/H16t9Qti8vbggIxAsgPk7uazAG1anvBf1s5eN0nyHwZyqx7iDZRr6nQHwIprFubog==
X-Received: by 10.28.157.150 with SMTP id g144mr7126095wme.89.1489682460247;
	Thu, 16 Mar 2017 09:41:00 -0700 (PDT)
Received: from localhost ([217.30.68.212])
	by smtp.gmail.com with ESMTPSA id e72sm4937179wma.5.2017.03.16.09.40.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 16 Mar 2017 09:40:59 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 16 Mar 2017 17:40:55 +0100
Message-Id: <20170316164056.15895-2-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <20170316164056.15895-1-Martin.Jansa@gmail.com>
References: <20170316164056.15895-1-Martin.Jansa@gmail.com>
Subject: [PATCH][meta-oe 2/3] openflow: add dependency on openssl-native
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
X-List-Received-Date: Thu, 16 Mar 2017 16:41:00 -0000

* calls openssl
* I haven't checked what it does with openssl call, maybe it should
  be modified to get the data from target openssl not native

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-networking/recipes-protocols/openflow/openflow.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-protocols/openflow/openflow.inc b/meta-networking/recipes-protocols/openflow/openflow.inc
index 7019bce7f..0ae2d1f1d 100644
--- a/meta-networking/recipes-protocols/openflow/openflow.inc
+++ b/meta-networking/recipes-protocols/openflow/openflow.inc
@@ -16,7 +16,7 @@ SRC_URI = "git://gitosis.stanford.edu/openflow.git;protocol=git"
 DEPENDS = "virtual/libc"
 
 PACKAGECONFIG ??= "openssl"
-PACKAGECONFIG[openssl] = "--enable-ssl,--disable-ssl, openssl, libssl"
+PACKAGECONFIG[openssl] = "--enable-ssl,--disable-ssl, openssl openssl-native, libssl"
 
 EXTRA_OECONF += " \
                  KARCH=${TARGET_ARCH} \
-- 
2.12.0


