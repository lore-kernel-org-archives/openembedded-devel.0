Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id 600CF780C1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 May 2017 17:40:13 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id l39so10533040qtb.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 May 2017 10:40:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=vRYnE5h8wqK6uhgN4oKwvbpEEtfYeCwhRPDPpDlpDWg=;
	b=O6oBvz+zj3QuyTUTe7oKQnjxDuFbYjdOdE4jtzmujMZrSH8ZZKXmDpom5RjZjCs8LJ
	2eqnczEZsIIGiwlH3lFHhgJNCinr237DmNOzTFQpo81SwDEqGBUJz3YE8IeNUkZB4NUt
	IXPSrxs68v8elX9ecyDsxgbc32qwmnagJ4ghnCnceJ7O+ADggbrLO/HcX8z2PDrgXwFb
	k99iG4O/Zn5HGAb2yEtx3jYeXBCoxyI9Ov2Rru0hiTuWd4znESKpKYwk/ayvpiaVKwNJ
	y7PDq2nAQf34mPUaLuxvV5BGePy2nZfLuwsqVU4WdIbMp0vawyxdJ2N1QPSV981ViNac
	rFog==
X-Gm-Message-State: AODbwcBJxsjDapnermnbVOVSOyRRaQVoanMlEUU7LPCGLgo5JPMJxH17
	sadMb5GKE6XKCQ==
X-Received: by 10.200.44.98 with SMTP id e31mr11250338qta.123.1495215615395;
	Fri, 19 May 2017 10:40:15 -0700 (PDT)
Received: from sparta.ny.asterius.io (ool-435561e0.dyn.optonline.net.
	[67.85.97.224]) by smtp.gmail.com with ESMTPSA id
	p16sm5627476qkp.69.2017.05.19.10.40.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 19 May 2017 10:40:14 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 19 May 2017 13:40:04 -0400
Message-Id: <1495215604-9534-2-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1495215604-9534-1-git-send-email-derek@asterius.io>
References: <1495215604-9534-1-git-send-email-derek@asterius.io>
Subject: [meta-python][PATCH 2/2] python-cryptography: update to version 1.8.1
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
X-List-Received-Date: Fri, 19 May 2017 17:40:14 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-cryptography.inc           | 4 ++--
 .../{python-cryptography_1.7.2.bb => python-cryptography_1.8.1.bb}    | 0
 .../{python3-cryptography_1.7.2.bb => python3-cryptography_1.8.1.bb}  | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-cryptography_1.7.2.bb => python-cryptography_1.8.1.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-cryptography_1.7.2.bb => python3-cryptography_1.8.1.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-cryptography.inc b/meta-python/recipes-devtools/python/python-cryptography.inc
index 601b12b..5339e6a 100644
--- a/meta-python/recipes-devtools/python/python-cryptography.inc
+++ b/meta-python/recipes-devtools/python/python-cryptography.inc
@@ -9,8 +9,8 @@ DEPENDS += " \
     ${PYTHON_PN}-six \
 "
 
-SRC_URI[md5sum] = "fade66de437392ed1ba6980768626204"
-SRC_URI[sha256sum] = "878cb68b3da3d493ffd68f36db11c29deee623671d3287c3f8d685117ffda9a9"
+SRC_URI[md5sum] = "9f28a9c141995cd2300d0976b4fac3fb"
+SRC_URI[sha256sum] = "323524312bb467565ebca7e50c8ae5e9674e544951d28a2904a50012a8828190"
 
 RDEPENDS_${PN} += " \
     ${PYTHON_PN}-cffi \
diff --git a/meta-python/recipes-devtools/python/python-cryptography_1.7.2.bb b/meta-python/recipes-devtools/python/python-cryptography_1.8.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-cryptography_1.7.2.bb
rename to meta-python/recipes-devtools/python/python-cryptography_1.8.1.bb
diff --git a/meta-python/recipes-devtools/python/python3-cryptography_1.7.2.bb b/meta-python/recipes-devtools/python/python3-cryptography_1.8.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-cryptography_1.7.2.bb
rename to meta-python/recipes-devtools/python/python3-cryptography_1.8.1.bb
-- 
2.7.4


