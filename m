Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f44.google.com (mail-pa0-f44.google.com
	[209.85.220.44])
	by mail.openembedded.org (Postfix) with ESMTP id 4D06F73217
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Aug 2015 23:53:43 +0000 (UTC)
Received: by pabzx8 with SMTP id zx8so3661747pab.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Aug 2015 16:53:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=WQsKd1Kz+ZWno4C9XuJtsO7tUTpSRBISACAeI+84MEw=;
	b=whk/h6siDIwT2q0GnmVVd+JrnVdciN6o8/5BBHQ4l6TIyfq8q2rGBcLLSq45iKr9UD
	53RRKK12VDPEHEu6c39nIQXP99Ax4rkzUWQCQm/gOq6dC6jcKrLBwFNRizI55NUksc9G
	KLuTV7u+r12RMtGG6Iur3OT7PA6wwwt9g3Ss2lyRHUcPvhQhPsYZjS14r94b7RfroqM9
	TQltK00nuukODLj+iwOINGrqyi7GXpfa6lUegRX9KaDE8MJatddIiJ/nDfESx9WKfC2n
	55nZt0uHkjl0VhbwuwG3IhNnfvwtQneoU1A9i9NZNVAvM7syD0dn8JI7dlyeTq6exwS5
	7Hbg==
X-Received: by 10.66.241.130 with SMTP id wi2mr1996696pac.130.1440633224167;
	Wed, 26 Aug 2015 16:53:44 -0700 (PDT)
Received: from haswell.localdomain ([2601:646:8601:4580:baca:3aff:fe80:aa8f])
	by smtp.gmail.com with ESMTPSA id
	kr1sm182428pbc.93.2015.08.26.16.53.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 26 Aug 2015 16:53:43 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 26 Aug 2015 17:02:49 -0700
Message-Id: <1440633769-19691-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 2.5.0
Subject: [meta-qt5][PATCH] layer.conf: define LAYERDEPENDS
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 26 Aug 2015 23:53:45 -0000

qtwebkit needs ruby-native which comes from meta-ruby
this patch adds initial set of layer dependencies there may be more
that can be added but its a start

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 conf/layer.conf | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/conf/layer.conf b/conf/layer.conf
index 92558b3..20d26ad 100644
--- a/conf/layer.conf
+++ b/conf/layer.conf
@@ -5,7 +5,7 @@
 # Therefore if you want a given layer to be considered high priority
 # for the .inc and .conf etc. then consider it adding at the beginning
 # of BBPATH. For bblayers bitbake will use BBFILES_PRIORITY to resolve
-# the recipe contention so the order of directories in BBFILES does 
+# the recipe contention so the order of directories in BBFILES does
 # not matter.
 
 # We have a conf and classes directory, append to BBPATH
@@ -23,6 +23,8 @@ BBFILE_PATTERN_qt5-layer := "^${LAYERDIR}/"
 
 BBFILE_PRIORITY_qt5-layer = "7"
 
+LAYERDEPENDS_qt5-layer = "core ruby-layer"
+
 LICENSE_PATH += "${LAYERDIR}/licenses"
 
 IMAGE_FEATURES[validitems] += "qtcreator-debug"
-- 
2.5.0


