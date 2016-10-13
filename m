Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id E1C33605B3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Oct 2016 22:48:26 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id v138so7290124qka.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Oct 2016 15:48:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=1n78yMukevw3SOfeEuYlRLiIUE20fqb0qte9nAdVVKA=;
	b=jsS/HpYJNLvC+pedHNc2nKpIusQCLD24FWoeSJK1mLd69LehadkdhHnprMSdGQs/nT
	IM4Tu4QR+v3D55/QBA1LO9iKQnLOedr2KrB6OrlcqQhMzZxcPwzUFe+REjZ/xfitI4kZ
	NIpZ4YurXuw9T2Yh/DJy4u3Ee3jJ9Ewa0aiktEdVR1OU5UnAcN44475Ha51x341bCEBN
	RNd/uIe7qmCXiwzp17rlkOPkumIPbqJ1PpyZWiudxlOONEc8YB3/1yadqqclvbx6YtiW
	7GjlLbDtqEqoyBQ9StXyI5a47ntCTo+FllWNAzh73396vsYedBYvO5PPp7rEL095F+CW
	UmxA==
X-Gm-Message-State: AA6/9Rn7EOZ1Hr1WURqgWZCOwN4aBFizePeMUjGU4sH+aUtBqOqgXaREbnAxzHLC0oPKQg==
X-Received: by 10.55.8.142 with SMTP id 136mr10396092qki.146.1476398907530;
	Thu, 13 Oct 2016 15:48:27 -0700 (PDT)
Received: from sparta.ny.asterius.io (ool-457cd903.dyn.optonline.net.
	[69.124.217.3]) by smtp.gmail.com with ESMTPSA id
	f46sm5992996qtf.30.2016.10.13.15.48.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 13 Oct 2016 15:48:27 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 13 Oct 2016 18:48:20 -0400
Message-Id: <1476398900-28587-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-werkzeug: update to version 0.11.11
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
X-List-Received-Date: Thu, 13 Oct 2016 22:48:28 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-werkzeug.inc               | 4 ++--
 .../python/{python-werkzeug_0.11.10.bb => python-werkzeug_0.11.11.bb} | 0
 .../{python3-werkzeug_0.11.10.bb => python3-werkzeug_0.11.11.bb}      | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-werkzeug_0.11.10.bb => python-werkzeug_0.11.11.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-werkzeug_0.11.10.bb => python3-werkzeug_0.11.11.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-werkzeug.inc b/meta-python/recipes-devtools/python/python-werkzeug.inc
index e30c80b..91c47ae 100644
--- a/meta-python/recipes-devtools/python/python-werkzeug.inc
+++ b/meta-python/recipes-devtools/python/python-werkzeug.inc
@@ -10,8 +10,8 @@ HOMEPAGE = "http://werkzeug.pocoo.org/"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a68f5361a2b2ca9fdf26b38aaecb6faa"
 
-SRC_URI[md5sum] = "780967186f9157e88f2bfbfa6f07a893"
-SRC_URI[sha256sum] = "cc64dafbacc716cdd42503cf6c44cb5a35576443d82f29f6829e5c49264aeeee"
+SRC_URI[md5sum] = "1d34afa1f19abcef4c0da51ebc2c4ea7"
+SRC_URI[sha256sum] = "e72c46bc14405cba7a26bd2ce28df734471bc9016bc8b4cb69466c2c14c2f7e5"
 
 PYPI_PACKAGE = "Werkzeug"
 
diff --git a/meta-python/recipes-devtools/python/python-werkzeug_0.11.10.bb b/meta-python/recipes-devtools/python/python-werkzeug_0.11.11.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-werkzeug_0.11.10.bb
rename to meta-python/recipes-devtools/python/python-werkzeug_0.11.11.bb
diff --git a/meta-python/recipes-devtools/python/python3-werkzeug_0.11.10.bb b/meta-python/recipes-devtools/python/python3-werkzeug_0.11.11.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-werkzeug_0.11.10.bb
rename to meta-python/recipes-devtools/python/python3-werkzeug_0.11.11.bb
-- 
2.7.4


