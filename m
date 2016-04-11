Return-Path: <straka.derek@gmail.com>
Received: from mail-qg0-f67.google.com (mail-qg0-f67.google.com
	[209.85.192.67])
	by mail.openembedded.org (Postfix) with ESMTP id 5E2C860111
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Apr 2016 11:42:15 +0000 (UTC)
Received: by mail-qg0-f67.google.com with SMTP id f105so15946096qge.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Apr 2016 04:42:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=iPCsZ+Zs4MxiywlNmVhPsPFnFswI8XyR4i+3NplQ3cA=;
	b=G5M4bqKNU4OjsrfYP4doIQ7wSzGaZWnxOvvnLvJj9vikIvwIzsNejA2DHwG4FG6SjH
	GXEEepRZ62zu32oNewfTLKv1SIe51qqhOyOW0NOXth3eWtg+EoWUom9OWS32oEnWTjwV
	HCU7K7MTeLohe/Os04e+egZ/B6O9+VNEuDtjLHH53v9vo9e+Atl0eiPWdGE8eDYyqvQN
	DPCntIS18RScWwYvFrnkS+P/VclFIAUcJlTYZfBqkRYZ1JMQKNnDZs8EUHkvrD3TezUr
	d986j8iowjqCCdoIwcs1+Ar68x6NGM/Rc9mW/II8uiiGP0P/DL5GoiSMc6/HOgw5j3J6
	DeZg==
X-Gm-Message-State: AD7BkJLfZZNljSSPef5qIWy+OL+WHpw6xFqOHAdRPBKKmNO9shH9C46qnu+D4Wq0j96d3g==
X-Received: by 10.140.164.71 with SMTP id k68mr29376301qhk.97.1460374935562;
	Mon, 11 Apr 2016 04:42:15 -0700 (PDT)
Received: from localhost.localdomain ([96.91.222.230])
	by smtp.gmail.com with ESMTPSA id x63sm5902816qhe.5.2016.04.11.04.42.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 11 Apr 2016 04:42:14 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 11 Apr 2016 07:41:34 -0400
Message-Id: <1460374897-30992-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH 1/4] python-cython: update to 0.24
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
X-List-Received-Date: Mon, 11 Apr 2016 11:42:15 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-cython.inc                 | 4 ++--
 .../python/{python-cython_0.23.4.bb => python-cython_0.24.bb}         | 0
 .../python/{python3-cython_0.23.4.bb => python3-cython_0.24.bb}       | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-cython_0.23.4.bb => python-cython_0.24.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-cython_0.23.4.bb => python3-cython_0.24.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-cython.inc b/meta-python/recipes-devtools/python/python-cython.inc
index a550538..f5945b5 100644
--- a/meta-python/recipes-devtools/python/python-cython.inc
+++ b/meta-python/recipes-devtools/python/python-cython.inc
@@ -10,8 +10,8 @@ BBCLASSEXTEND = "native"
 SRC_URI = "http://www.cython.org/release/${SRCNAME}-${PV}.tar.gz"
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-SRC_URI[md5sum] = "157df1f69bcec6b56fd97e0f2e057f6e"
-SRC_URI[sha256sum] = "fec42fecee35d6cc02887f1eef4e4952c97402ed2800bfe41bbd9ed1a0730d8e"
+SRC_URI[md5sum] = "14fbc970f4a856845e633cbc09e61048"
+SRC_URI[sha256sum] = "6de44d8c482128efc12334641347a9c3e5098d807dd3c69e867fa8f84ec2a3f1"
 
 RDEPENDS_${PN} += "\
     ${PYTHON_PN}-netserver \
diff --git a/meta-python/recipes-devtools/python/python-cython_0.23.4.bb b/meta-python/recipes-devtools/python/python-cython_0.24.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-cython_0.23.4.bb
rename to meta-python/recipes-devtools/python/python-cython_0.24.bb
diff --git a/meta-python/recipes-devtools/python/python3-cython_0.23.4.bb b/meta-python/recipes-devtools/python/python3-cython_0.24.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-cython_0.23.4.bb
rename to meta-python/recipes-devtools/python/python3-cython_0.24.bb
-- 
1.9.1


