Return-Path: <rehsack@gmail.com>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id 2081D60620
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Aug 2018 11:07:55 +0000 (UTC)
Received: by mail-wm0-f49.google.com with SMTP id m199-v6so9504473wma.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Aug 2018 04:07:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id;
	bh=Fx16sx2fnODjy70ms1SJ7vcI5FwJCNprUp6SiMA+meI=;
	b=CZH8EP0kf/SxqfvJxBJ9luB4A9jvLHY0jg/jyFdFDXR2M/XPs5sCNuCNwY3+M++p4l
	qw0+9SHdsLkFN7PurUWPhxWtQvDSfY5nDYiAYvIb0fpoqEalAGbmiEPnXZmSBUeG6mKu
	51yRTEyYmNbpGhOSopqJ5ddOLahpt+CEz5pf5Ds6YylJA8O9d9fI9zQiFwej+rB8sqrl
	8FLcaYjMCkz2myMSaumJuWQ0iAYYhjnGS/RKnQ9v/tT5wPOnC3+Qw6RryT+1QKLBybI2
	jQAyBk7+ZEOcl08P+92mAtaAd7XpsqvH2UtXjmf2yNCpaUdDlCIFcqGs1dzoYfdSIVbd
	aWIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=Fx16sx2fnODjy70ms1SJ7vcI5FwJCNprUp6SiMA+meI=;
	b=AsuFg3/Tv2Zxcu50PH5ocv3nnT09JHKw4SK0QN/QFD7irYryYJRne6Wb1HxGToRjwT
	KbCKC4KeuznHUWrEXeAyjiaZJWdNclJzOmZEAMsrytnwqCD+5CvuD0TY0pj/09dNHt9p
	m8jqdnGl/NVp6NwfWS3/jxYATFscB/bbdt/UAWRArzYBGgQxnGKELQwsVhQL3xGW4HCV
	V9P9wgLBN/uSpUQorvou19uIbITXl41Z8FCZ9+BNk4lkbKcG460zWdrFkCl2qevsNmFp
	FtpQf05OsHSagjbU3ovnzxNbEo4TiSdqfRa9kfo0ubGNlepfdLyNstOiB1kr1ZRqDNx1
	My8w==
X-Gm-Message-State: APzg51CjoRqkxdMB2waeTxYlVY5wkJPf4KemH4fGHZg9BQ83U9hc5Q56
	tZE0wIHshrASllOTjaxx9A8QySF5
X-Google-Smtp-Source: ANB0VdYDEKhGzlOpictLaDDPcUgS13sG/So59qsOxVkHnv6UD1WPRlL1yJl0UeUKFd7BC5dfkUuAwQ==
X-Received: by 2002:a1c:cbc1:: with SMTP id
	b184-v6mr5521932wmg.149.1535368076592; 
	Mon, 27 Aug 2018 04:07:56 -0700 (PDT)
Received: from beaker.muppets.liwing.de (b2b-78-94-80-58.unitymedia.biz.
	[78.94.80.58]) by smtp.gmail.com with ESMTPSA id
	a11-v6sm19243016wrr.81.2018.08.27.04.07.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 27 Aug 2018 04:07:55 -0700 (PDT)
Sender: Jens Rehsack <rehsack@gmail.com>
From: Jens Rehsack <sno@netbsd.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 27 Aug 2018 13:07:30 +0200
Message-Id: <20180827110735.6396-1-sno@netbsd.org>
X-Mailer: git-send-email 2.17.1
Cc: Jens Rehsack <sno@netbsd.org>
Subject: [meta-python][PATCH 1/6] python{3, }-protobuf: consolidate CLEANBROKEN
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
X-List-Received-Date: Mon, 27 Aug 2018 11:07:56 -0000

Since python-protobuf and python3-protobuf share the same build
instructions, it's sane to clarify for both at the same place,
that running
  setup.py clean
is wrong in configure stage.

Signed-off-by: Jens Rehsack <sno@netbsd.org>
---
 meta-python/recipes-devtools/python/python-protobuf.inc       | 4 ++++
 meta-python/recipes-devtools/python/python-protobuf_3.6.0.bb  | 4 ----
 meta-python/recipes-devtools/python/python3-protobuf_3.6.0.bb | 1 -
 3 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python-protobuf.inc b/meta-python/recipes-devtools/python/python-protobuf.inc
index 6a0568ae6..a1866b351 100644
--- a/meta-python/recipes-devtools/python/python-protobuf.inc
+++ b/meta-python/recipes-devtools/python/python-protobuf.inc
@@ -10,6 +10,10 @@ inherit pypi
 SRC_URI[md5sum] = "074abcceee0d795ba34ad6430f71d0e8"
 SRC_URI[sha256sum] = "a37836aa47d1b81c2db1a6b7a5e79926062b5d76bd962115a0e615551be2b48d"
 
+# http://errors.yoctoproject.org/Errors/Details/184715/
+# Can't find required file: ../src/google/protobuf/descriptor.proto
+CLEANBROKEN = "1"
+
 UPSTREAM_CHECK_REGEX = "protobuf/(?P<pver>\d+(\.\d+)+)/"
 
 RDEPENDS_${PN} += " \
diff --git a/meta-python/recipes-devtools/python/python-protobuf_3.6.0.bb b/meta-python/recipes-devtools/python/python-protobuf_3.6.0.bb
index dddc9bbb5..f04fc489f 100644
--- a/meta-python/recipes-devtools/python/python-protobuf_3.6.0.bb
+++ b/meta-python/recipes-devtools/python/python-protobuf_3.6.0.bb
@@ -1,6 +1,2 @@
 inherit setuptools
 require python-protobuf.inc
-
-# http://errors.yoctoproject.org/Errors/Details/184715/
-# Can't find required file: ../src/google/protobuf/descriptor.proto
-CLEANBROKEN = "1"
diff --git a/meta-python/recipes-devtools/python/python3-protobuf_3.6.0.bb b/meta-python/recipes-devtools/python/python3-protobuf_3.6.0.bb
index 53d5528c4..781d1dc4d 100644
--- a/meta-python/recipes-devtools/python/python3-protobuf_3.6.0.bb
+++ b/meta-python/recipes-devtools/python/python3-protobuf_3.6.0.bb
@@ -1,3 +1,2 @@
 inherit setuptools3
 require python-protobuf.inc
-CLEANBROKEN = "1"
-- 
2.17.1


