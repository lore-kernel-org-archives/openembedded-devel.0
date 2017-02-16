Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id 8111B77240
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Feb 2017 23:20:15 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id n13so4160763qtc.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Feb 2017 15:20:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=YxX29710DTb4RRnj9mhJC7omNOfpPskeAhYu+1Ri1Ek=;
	b=A639Ls6PcGR12MgZMxGSsXsnUes276QvJZQl65Jum01+DOY/tRE9TP0tVGgt6f4vb+
	N45DNCxM4+48T0L5sWEJD6bxwMUXFQQmH0XblmJFWEXNUJsq1/5gIGbgloOeLceIWp62
	+Z6WrMtDLPiHX3qpxNYMtj7gT3yamhuPeiNZlERCcRB/bO3xF49vQVqCH02WbwpPonE0
	+nuQnvXEZ+QHEi5/CaLUYP/tvlUpAJ+esA8eUbGFPRtqqCDyp5mG9H8XcWfuDIPzhimi
	xywZJyzZcR+lYaNcAgqF8XEjLb+pUqO1OID5MQ9NHODz1J5IqwR31M29QqSpBNgZIgTx
	ci5w==
X-Gm-Message-State: AMke39kq/ZAsoauavhIn6RL+pdd2IECs8rHBHag1PK6KB8oq3qEdno4FBskf+/FeHwe6HA==
X-Received: by 10.200.0.213 with SMTP id d21mr4620520qtg.44.1487287215551;
	Thu, 16 Feb 2017 15:20:15 -0800 (PST)
Received: from sparta.ny.asterius.io (ool-435561e0.dyn.optonline.net.
	[67.85.97.224])
	by smtp.gmail.com with ESMTPSA id 23sm5354913qtp.20.2017.02.16.15.20.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 16 Feb 2017 15:20:15 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 16 Feb 2017 18:20:06 -0500
Message-Id: <1487287206-16873-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-flask: update to version 0.12
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
X-List-Received-Date: Thu, 16 Feb 2017 23:20:15 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-flask.inc                  | 4 ++--
 .../python/{python-flask_0.11.1.bb => python-flask_0.12.bb}           | 0
 .../python/{python3-flask_0.11.1.bb => python3-flask_0.12.bb}         | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-flask_0.11.1.bb => python-flask_0.12.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-flask_0.11.1.bb => python3-flask_0.12.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-flask.inc b/meta-python/recipes-devtools/python/python-flask.inc
index 87d020e..fe8d388 100644
--- a/meta-python/recipes-devtools/python/python-flask.inc
+++ b/meta-python/recipes-devtools/python/python-flask.inc
@@ -6,8 +6,8 @@ HOMEPAGE = "https://github.com/mitsuhiko/flask/"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=19866b76b054ab30c270c0eb9d7e43d7"
 
-SRC_URI[md5sum] = "d2af95d8fe79cf7da099f062dd122a08"
-SRC_URI[sha256sum] = "b4713f2bfb9ebc2966b8a49903ae0d3984781d5c878591cf2f7b484d28756b0e"
+SRC_URI[md5sum] = "c1d30f51cff4a38f9454b23328a15c5a"
+SRC_URI[sha256sum] = "93e803cdbe326a61ebd5c5d353959397c85f829bec610d59cb635c9f97d7ca8b"
 
 PYPI_PACKAGE = "Flask"
 
diff --git a/meta-python/recipes-devtools/python/python-flask_0.11.1.bb b/meta-python/recipes-devtools/python/python-flask_0.12.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-flask_0.11.1.bb
rename to meta-python/recipes-devtools/python/python-flask_0.12.bb
diff --git a/meta-python/recipes-devtools/python/python3-flask_0.11.1.bb b/meta-python/recipes-devtools/python/python3-flask_0.12.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-flask_0.11.1.bb
rename to meta-python/recipes-devtools/python/python3-flask_0.12.bb
-- 
2.7.4


