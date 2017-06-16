Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f176.google.com (mail-qt0-f176.google.com
	[209.85.216.176])
	by mail.openembedded.org (Postfix) with ESMTP id 179AE7853D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Jun 2017 19:21:27 +0000 (UTC)
Received: by mail-qt0-f176.google.com with SMTP id w1so75656515qtg.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Jun 2017 12:21:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=WpNnUDJxdC4etsNKnzracR0k11FKmcVIixcy/R+1yQ8=;
	b=fR64B1a4E+p+BXUESpAi7EOsfvgSc+iF1yBssPQMGRQ+dY8/Qz7ciUPZth+/0VENFn
	uRCiBIOcITc3sw6K8tayj3tIgfWV5cH32L9r68hyhCXs6SZEHIZpvTMuEwfkhyQPtla2
	rAVD74F2gWipbPTAt4TfryMlsvx5k6fGasBYOGHAaFnTCptlnna6Es3ZTsTcc6P770Ch
	UDrc1OVVRZjpYHQqM5TE1DNgABkh75iICq5/NHbDSQf/cLPPy6iiJm3yJ53uNtBZ0qHx
	0M8549IAD8WoHvJJGDPwBB5JqKSuFwVhRhTaF5zwBxB4MJWHSCz2K34FH8JIZJyjJLpg
	FVDQ==
X-Gm-Message-State: AKS2vOyrNtqCdkFiL2GHmzgp5vKFHLPJYczj6c7TAtz0e9/1HblGKJTm
	rPRjtwAmM4U8f7U7n7o=
X-Received: by 10.55.195.150 with SMTP id r22mr14282339qkl.162.1497640888942; 
	Fri, 16 Jun 2017 12:21:28 -0700 (PDT)
Received: from sparta.ny.asterius.io (ool-43556204.dyn.optonline.net.
	[67.85.98.4])
	by smtp.gmail.com with ESMTPSA id p21sm2308412qtc.6.2017.06.16.12.21.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 16 Jun 2017 12:21:28 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 16 Jun 2017 15:21:19 -0400
Message-Id: <1497640879-5655-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-flask: update to version 0.12.2
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
X-List-Received-Date: Fri, 16 Jun 2017 19:21:28 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-flask.inc                  | 4 ++--
 .../python/{python-flask_0.12.bb => python-flask_0.12.2.bb}           | 0
 .../python/{python3-flask_0.12.bb => python3-flask_0.12.2.bb}         | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-flask_0.12.bb => python-flask_0.12.2.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-flask_0.12.bb => python3-flask_0.12.2.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-flask.inc b/meta-python/recipes-devtools/python/python-flask.inc
index 04935a6..76b5fba 100644
--- a/meta-python/recipes-devtools/python/python-flask.inc
+++ b/meta-python/recipes-devtools/python/python-flask.inc
@@ -6,8 +6,8 @@ HOMEPAGE = "https://github.com/mitsuhiko/flask/"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=19866b76b054ab30c270c0eb9d7e43d7"
 
-SRC_URI[md5sum] = "c1d30f51cff4a38f9454b23328a15c5a"
-SRC_URI[sha256sum] = "93e803cdbe326a61ebd5c5d353959397c85f829bec610d59cb635c9f97d7ca8b"
+SRC_URI[md5sum] = "97278dfdafda98ba7902e890b0289177"
+SRC_URI[sha256sum] = "49f44461237b69ecd901cc7ce66feea0319b9158743dd27a2899962ab214dac1"
 
 CLEANBROKEN = "1"
 
diff --git a/meta-python/recipes-devtools/python/python-flask_0.12.bb b/meta-python/recipes-devtools/python/python-flask_0.12.2.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-flask_0.12.bb
rename to meta-python/recipes-devtools/python/python-flask_0.12.2.bb
diff --git a/meta-python/recipes-devtools/python/python3-flask_0.12.bb b/meta-python/recipes-devtools/python/python3-flask_0.12.2.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-flask_0.12.bb
rename to meta-python/recipes-devtools/python/python3-flask_0.12.2.bb
-- 
2.7.4


