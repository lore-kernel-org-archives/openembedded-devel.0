Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
	[209.85.128.51])
	by mail.openembedded.org (Postfix) with ESMTP id 38FE06C665
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  2 Dec 2018 16:19:56 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id q26so3304175wmf.5
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 02 Dec 2018 08:19:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=LaxWPCDK3Um2L7xthULgQZLEDa3iaZm6y5cq4nvmbY8=;
	b=RdT/myPjyoxfeO+obLoNdAaTtWKaCikK7MMZN/vRsaPtjowJhDJqMqewrJ1YrVOvyn
	uziulqS2UbkmkDvmz5o2cbQTgx6Gm4TytcIeYkb4YN4WuXj1WncrTPVX7KJATb5dsC0W
	eVgWgjRVI0UmM9gbDblhoNZj2ABprDGufUI2g+bZml0y07yjiXUFzZr6HOOT4fAoiu3t
	ytFJjpEyz4IkRFyAqmcEsxVUsUiZbmglnTldyMK20r1m6qdiAo7OInkSTYOAzcPpltHM
	20BmcHf/xK7I5FzZvj6p0/ApiMvOwq+cYMeFyRAM5UWHZOVKw6uoGr7mx+NWF/67E4ac
	Ow1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=LaxWPCDK3Um2L7xthULgQZLEDa3iaZm6y5cq4nvmbY8=;
	b=pm+iByAOLR42CkNJSI9bgWUVUMm2huRDcU2xAYNnhzQqhYAtNWaatUlXtYQldFdDVY
	GqoFQU1sc58Vj83k5uboR5ugbjp5q9pKGFkGr8gBNflfqNlLla2+qOOVVLKM8xfnfp5X
	WfClw8lpzJu9HgEFMUAYcBFWCNXO6sO4/Fn/+9X0CBArqA1M1V+6+5UHXN/pvof2dpAC
	GtfMfIDJO7tCFy+lZvI3xl3pkrk2XT47pt6uqrTcNQQU+gscmkUnchrybgpXZj+5BmDa
	HDM0SFH6WpDZgv1WR9GaAb7KS0DP1GV5M10YmbUCiQKXFo9t9rpyQFaJWU8ppWt0WLOq
	nj1Q==
X-Gm-Message-State: AA+aEWYte7dpIqDzS6eqwWP7h0OjqeZIHyj2oTn9mDHdmHWfDFpkXnnO
	GhStJWTaq6SMpsqO9bbgmyf+H/Mx
X-Google-Smtp-Source: AFSGD/XqfaCX6YCPe/5Hle44YRNN8bX/NbAboFjNxIg0nUmgwcDmgqLAI+mDLLFlQ3c4Oe8tb670Tw==
X-Received: by 2002:a1c:b455:: with SMTP id d82mr5655902wmf.78.1543767596640; 
	Sun, 02 Dec 2018 08:19:56 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	g67sm9928578wmd.38.2018.12.02.08.19.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 02 Dec 2018 08:19:55 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  2 Dec 2018 17:19:50 +0100
Message-Id: <20181202161950.5453-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181202161950.5453-1-alex.kanavin@gmail.com>
References: <20181202161950.5453-1-alex.kanavin@gmail.com>
Subject: [PATCH 2/2] packagegroup-meta-oe: rename the group that contains ptest packages
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
X-List-Received-Date: Sun, 02 Dec 2018 16:19:56 -0000

Otherwise packagegroup.bbclass includes the -ptest package for the second time which leads to this error:

ERROR: packagegroup-meta-oe-1.0-r0 do_package: QA Issue: packagegroup-meta-oe-ptest is listed in PACKAGES multiple times, this leads to packaging errors. [packages-list]
ERROR: packagegroup-meta-oe-1.0-r0 do_package: Fatal QA errors found, failing task.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index 2a23a6170..2a5ff33e5 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -21,7 +21,7 @@ PACKAGES = ' \
     packagegroup-meta-oe-test \
     ${@bb.utils.contains("DISTRO_FEATURES", "x11", "packagegroup-meta-oe-gnome", "", d)} \
     ${@bb.utils.contains("DISTRO_FEATURES", "x11", "packagegroup-meta-oe-graphics", "", d)} \
-    ${@bb.utils.contains("DISTRO_FEATURES", "ptest", "packagegroup-meta-oe-ptest", "", d)} \
+    ${@bb.utils.contains("DISTRO_FEATURES", "ptest", "packagegroup-meta-oe-ptest-packages", "", d)} \
 '
 
 RDEPENDS_packagegroup-meta-oe = "\
@@ -41,7 +41,7 @@ RDEPENDS_packagegroup-meta-oe = "\
     packagegroup-meta-oe-test \
     ${@bb.utils.contains("DISTRO_FEATURES", "x11", "packagegroup-meta-oe-gnome", "", d)} \
     ${@bb.utils.contains("DISTRO_FEATURES", "x11", "packagegroup-meta-oe-graphics", "", d)} \
-    ${@bb.utils.contains("DISTRO_FEATURES", "ptest", "packagegroup-meta-oe-ptest", "", d)} \
+    ${@bb.utils.contains("DISTRO_FEATURES", "ptest", "packagegroup-meta-oe-ptest-packages", "", d)} \
 "
 
 RDEPENDS_packagegroup-meta-oe-benchmarks = "\
@@ -232,7 +232,7 @@ RDEPENDS_packagegroup-meta-oe-test ="\
     fwts gtest pm-qa stress-ng testfloat \
     "
 
-RDEPENDS_packagegroup-meta-oe-ptest = "\
+RDEPENDS_packagegroup-meta-oe-ptest-packages = "\
     zeromq-ptest \
     leveldb-ptest \
     psqlodbc-ptest \
-- 
2.17.1


