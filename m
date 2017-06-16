Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id DDE4B782C5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Jun 2017 17:41:04 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id o21so11862786qtb.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Jun 2017 10:41:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Qek8T9N0m4mVnwcdYCac/dl1VnZ07q3+nIOd6XJOQ5c=;
	b=KBDWYYfuvnmIY7W0SHIYfSnLwuvdYsjXZAxryXWY/y5cNZoeJZ0aMnLPJ3UKLDyFNY
	8vAiSUJCR/G5/OO8YdFY40Pu+5mlNlcG0p+Khpz2VYweSPQHT0wpAQusr20LTnZu89fq
	bEnI20x+IuqFkb7DC7I7Y9ZvXHPC+5gJyyyfMVkLstwGn9iIloXSDAq1vKtoAvuIPfy2
	GVzlttd4OHiEntEpnzSSazj/LJJWLQ4PQc89rILhZjsSLt7zarEtrAR82k3Ym/tFRpzY
	b55q0e0hnFHCZkz+6IoepGOQ+2u2CoI6Noma51E14YmnUFpACQIPkm/99SqkGPma120K
	KFYg==
X-Gm-Message-State: AKS2vOw8T5IH03uWkBmz8F2K8OVUP9aMwCcfL13Q/HLIPLB7Oy2mkGu1
	wNx80Tw0q6ADyEvx+BY=
X-Received: by 10.55.95.194 with SMTP id t185mr13765226qkb.119.1497634865846; 
	Fri, 16 Jun 2017 10:41:05 -0700 (PDT)
Received: from sparta.ny.asterius.io (ool-43556204.dyn.optonline.net.
	[67.85.98.4]) by smtp.gmail.com with ESMTPSA id
	a41sm2055362qte.50.2017.06.16.10.41.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 16 Jun 2017 10:41:05 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 16 Jun 2017 13:40:58 -0400
Message-Id: <1497634858-8581-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-zopeinterface: update to version 4.4.2
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
X-List-Received-Date: Fri, 16 Jun 2017 17:41:05 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-zopeinterface.inc          | 4 ++--
 .../{python-zopeinterface_4.3.3.bb => python-zopeinterface_4.4.2.bb}  | 0
 ...{python3-zopeinterface_4.3.3.bb => python3-zopeinterface_4.4.2.bb} | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-zopeinterface_4.3.3.bb => python-zopeinterface_4.4.2.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-zopeinterface_4.3.3.bb => python3-zopeinterface_4.4.2.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-zopeinterface.inc b/meta-python/recipes-devtools/python/python-zopeinterface.inc
index 1ea6114..8cc613b 100644
--- a/meta-python/recipes-devtools/python/python-zopeinterface.inc
+++ b/meta-python/recipes-devtools/python/python-zopeinterface.inc
@@ -2,8 +2,8 @@ SUMMARY = "Interface definitions for Zope products"
 LICENSE = "ZPL-2.1"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=e54fd776274c1b7423ec128974bd9d46"
 
-SRC_URI[md5sum] = "ba3f32eacaea66094b7e2ae2788cec89"
-SRC_URI[sha256sum] = "8780ef68ca8c3fe1abb30c058a59015129d6e04a6b02c2e56b9c7de6078dfa88"
+SRC_URI[md5sum] = "d69131352ef06753388c3da09cd8c8aa"
+SRC_URI[sha256sum] = "4e59e427200201f69ef82956ddf9e527891becf5b7cde8ec3ce39e1d0e262eb0"
 
 PYPI_PACKAGE = "zope.interface"
 
diff --git a/meta-python/recipes-devtools/python/python-zopeinterface_4.3.3.bb b/meta-python/recipes-devtools/python/python-zopeinterface_4.4.2.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-zopeinterface_4.3.3.bb
rename to meta-python/recipes-devtools/python/python-zopeinterface_4.4.2.bb
diff --git a/meta-python/recipes-devtools/python/python3-zopeinterface_4.3.3.bb b/meta-python/recipes-devtools/python/python3-zopeinterface_4.4.2.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-zopeinterface_4.3.3.bb
rename to meta-python/recipes-devtools/python/python3-zopeinterface_4.4.2.bb
-- 
2.7.4


