Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f196.google.com (mail-qt0-f196.google.com
	[209.85.216.196])
	by mail.openembedded.org (Postfix) with ESMTP id 3016871A32
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Oct 2017 00:10:11 +0000 (UTC)
Received: by mail-qt0-f196.google.com with SMTP id p1so32719521qtg.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Oct 2017 17:10:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Spv1QyRq276CP42OGcTVZop3PDfFOj0ScPN+DGYT854=;
	b=VfHVwJgROTE3iK86ZatArdsO0YYPh7vY7Tox35ppoToOBO69exXXT3JSLou52qI3Zl
	mCOxoQSWOXmoSvqn36Nm6mVywVw6A9oA29DfWYt7k6F7NQyKkvOsn5m6Fls9QbsmTJjz
	HiQDKgwWypp0GOO1QWPzvfq31zRGSy+QhWjaY/tMwSLXHpGzgq8O72ZUrdhvcYuQOaxy
	PExWSqL0S6fO4QriRCv647BWdnoaPiurD565UKDztFU30MuarLoJ+nli3o59JNhiuWnF
	IJzQ4K2woXEio4I9QDFnJGly3ZTZbVV3rzmnr2QOsL091CSO74QFlgYhjcQVU9QiODvM
	BDDg==
X-Gm-Message-State: AMCzsaW2NFfpDpZGn4AoBrZZLJ/wgc9rszekOJVlhaEDEteJVQJejGXi
	Eo9yMWvytfJbuJl56iJZhdpq2sAg
X-Google-Smtp-Source: ABhQp+RHpfF80u3c7DAJPJM27UcbbBS8Yr6lqQD/6l4gnoFyxkPISEJf0ebDEJoLsJ5/RoayZRCMiA==
X-Received: by 10.200.3.205 with SMTP id z13mr29264496qtg.25.1508890212087;
	Tue, 24 Oct 2017 17:10:12 -0700 (PDT)
Received: from sparta.ny.asterius.io
	(pool-108-30-199-218.nycmny.fios.verizon.net. [108.30.199.218])
	by smtp.gmail.com with ESMTPSA id
	a17sm1059243qth.46.2017.10.24.17.10.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 24 Oct 2017 17:10:11 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 24 Oct 2017 20:10:05 -0400
Message-Id: <1508890205-16135-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-pymisp: update to version 2.4.81.2
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
X-List-Received-Date: Wed, 25 Oct 2017 00:10:11 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-pymisp.inc                 | 4 ++--
 .../python/{python-pymisp_2.4.80.bb => python-pymisp_2.4.81.2.bb}     | 0
 .../python/{python3-pymisp_2.4.80.bb => python3-pymisp_2.4.81.2.bb}   | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pymisp_2.4.80.bb => python-pymisp_2.4.81.2.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-pymisp_2.4.80.bb => python3-pymisp_2.4.81.2.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-pymisp.inc b/meta-python/recipes-devtools/python/python-pymisp.inc
index 21ba7bb..bb9305a 100644
--- a/meta-python/recipes-devtools/python/python-pymisp.inc
+++ b/meta-python/recipes-devtools/python/python-pymisp.inc
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/MISP/PyMISP"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a3639cf5780f71b125d3e9d1dc127c20"
 
-SRC_URI[md5sum] = "2024babd97ab57ca0360394edc37f2b6"
-SRC_URI[sha256sum] = "7480acada8cba9472a85070c57baad89ae9deed826a7515a4c149ac48920c273"
+SRC_URI[md5sum] = "77c6276039a7e48d8ae1d335564f20c9"
+SRC_URI[sha256sum] = "2ce6d8a9c59fe5f63b406b667fd40df8ebba0dee63844dfec95fb9d2892ae6af"
 
 RDEPENDS_${PN} += " ${PYTHON_PN}-requests ${PYTHON_PN}-json ${PYTHON_PN}-jsonschema"
diff --git a/meta-python/recipes-devtools/python/python-pymisp_2.4.80.bb b/meta-python/recipes-devtools/python/python-pymisp_2.4.81.2.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-pymisp_2.4.80.bb
rename to meta-python/recipes-devtools/python/python-pymisp_2.4.81.2.bb
diff --git a/meta-python/recipes-devtools/python/python3-pymisp_2.4.80.bb b/meta-python/recipes-devtools/python/python3-pymisp_2.4.81.2.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-pymisp_2.4.80.bb
rename to meta-python/recipes-devtools/python/python3-pymisp_2.4.81.2.bb
-- 
2.7.4


