Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id 0040960557
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Jan 2018 00:54:35 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id s3so12380432qtb.10
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 14 Jan 2018 16:54:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=6AZCs9ga+XCI1Quv0KIBNQ/KXU3Ukx84UOxwmQI6FTI=;
	b=ZTbBQ92XNH9R0FqUYe3lG3dlNM8Im044ay+i+wXju4LOa90Mysuv+6TH0C+2DBgoxz
	35NalrW/Jpjx9nxapIRewp0UQmLGCuAYCJWO/1RyiwYRDfAO8U/ZgUlN+IYDo5/I5roE
	3+UT8hAc9GRuDOEpghGM7OtiPgZ2yBeKbjrIOpYZQTw7+/FLG8MOh7NB4daiCXdA63w8
	r7K3V+WorEbfoD+a9/uj5cOEakYJft12qgrSCoISsDiKsQFir7bFigzkGdUFtEA+3/Ld
	/9Sldny2+BzMoAxPAEy0XiCoahkXkcNwx7Y8YkwwDCAmJon4kv8m+gWvYAq2bNozg5/5
	Lvjw==
X-Gm-Message-State: AKwxytcR8jJH5UuzbfBgVkU+Jzq4mnBD/IIoGvJePSTpDS23nXkSEk2I
	UXtLhfswHOAMAGFeh8J4lQNZ9fCu
X-Google-Smtp-Source: ACJfBovSXkXf0l+t2E7EXoOadkW4kO9L/otDDalUzbPd/t12ofoBQTbU/e4ev0FxU9+GBMbZmwb8jw==
X-Received: by 10.237.57.70 with SMTP id l64mr48425932qte.312.1515977676738;
	Sun, 14 Jan 2018 16:54:36 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id 3sm17587156qty.47.2018.01.14.16.54.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 14 Jan 2018 16:54:36 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 14 Jan 2018 19:54:25 -0500
Message-Id: <1515977665-11693-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-pymisp: update to version 2.4.85.1
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
X-List-Received-Date: Mon, 15 Jan 2018 00:54:36 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-pymisp.inc                 | 4 ++--
 .../python/{python-pymisp_2.4.85.bb => python-pymisp_2.4.85.1.bb}     | 0
 .../python/{python3-pymisp_2.4.85.bb => python3-pymisp_2.4.85.1.bb}   | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pymisp_2.4.85.bb => python-pymisp_2.4.85.1.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-pymisp_2.4.85.bb => python3-pymisp_2.4.85.1.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-pymisp.inc b/meta-python/recipes-devtools/python/python-pymisp.inc
index 6e248dc..f9171f9 100644
--- a/meta-python/recipes-devtools/python/python-pymisp.inc
+++ b/meta-python/recipes-devtools/python/python-pymisp.inc
@@ -3,8 +3,8 @@ HOMEPAGE = "https://github.com/MISP/PyMISP"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a3639cf5780f71b125d3e9d1dc127c20"
 
-SRC_URI[md5sum] = "5191db549c454af2ff05d82ce789052e"
-SRC_URI[sha256sum] = "571f1c9b0f0a1df8837c1b4f2ce4fadb8ad78e572a91d83cfedc3300753f21b8"
+SRC_URI[md5sum] = "7d924d9a776c5e41f735412131571178"
+SRC_URI[sha256sum] = "71e8515bb2209bb8b96e8edaa66d5341553f99822f94b32545d9efb404b6ba67"
 
 RDEPENDS_${PN} += " \
     ${PYTHON_PN}-json \
diff --git a/meta-python/recipes-devtools/python/python-pymisp_2.4.85.bb b/meta-python/recipes-devtools/python/python-pymisp_2.4.85.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-pymisp_2.4.85.bb
rename to meta-python/recipes-devtools/python/python-pymisp_2.4.85.1.bb
diff --git a/meta-python/recipes-devtools/python/python3-pymisp_2.4.85.bb b/meta-python/recipes-devtools/python/python3-pymisp_2.4.85.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-pymisp_2.4.85.bb
rename to meta-python/recipes-devtools/python/python3-pymisp_2.4.85.1.bb
-- 
2.7.4


