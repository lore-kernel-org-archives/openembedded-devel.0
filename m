Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9058C433EF
	for <webhook@archiver.kernel.org>; Thu, 24 Feb 2022 07:39:08 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web11.7618.1645688347768434760
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Feb 2022 23:39:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ROE/EkpI;
 spf=pass (domain: gmail.com, ip: 209.85.216.54, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id
 bx9-20020a17090af48900b001bc64ee7d3cso1300939pjb.4
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Feb 2022 23:39:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fVgpKN+/rrmU/27u/PP8Zoxl50cvnIlXxpX+9KS/Q7Y=;
        b=ROE/EkpIhJPhA5KI9jEbFsuse5loO3gw59QLcvulq4UvUTtnH07hIWspPgntCFBSsS
         BeCXs0LFaIrxAb8kCH3pz7/AlsC2ooPBPQ2VX4b2NVJTlaOHU99R2jrMWydWs97YLqwk
         H50jkUVroGWsoLqone2cLil8rZENs1WUbbqU0XgJT4TpWOCHL+CXqo2eNN50hOP1qCgf
         vnyMkDrbGu/+GhPLS/1y2zTl6D6WPaiPjpw/Za30Hzsven7yufscY1ZTVVrLIKAd2bfF
         hI/AOu8NzBa0TO8YhB4HcKeNpV4DOdt7KuXrM9FD1aPWwk+uhOAQsuGdd14ZJrh5WYnp
         L9HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fVgpKN+/rrmU/27u/PP8Zoxl50cvnIlXxpX+9KS/Q7Y=;
        b=IBf5OmuLjdlxQ9GWfzJWHVXs7I/ZkzYLdtz117H0c75qEmZdAsvTYwAdTMM3VnXrwx
         GxWnXoXCHjPcM7UEO09GhmRUyHOOiM6TRLF0Uyig1R7LhwxCFSmJwFzP1yXZKPdrjSB+
         HhYPvPWLb/a3fer4wBlY72zOWs/QkfVYwXuxRG/MJ42rZLYwehYTR6lV2ags0TSPJsnz
         zUqXs2DgryqQzhc0mU83ZT6x1DcMHKf5QAdpjUkWGt5pCOVPgc3GNYAL2aDbYVu4oV/8
         7513MXPeh60ilZjcAbsZ+rahI29rBQ1u0WKw7xJp+5vd/tQRWPfBScXXpRPZ7oMlrLKq
         hOdA==
X-Gm-Message-State: AOAM5334mi0ZFlTtqTvTs3G38wpmRnUZdS2mjkRl7sTOvU7eN9IhfvPI
	xUKvJCYx/YT+Sdco+81NLBU5k+0KaqNdMw==
X-Google-Smtp-Source: 
 ABdhPJythQj1SVse0YbCgTkFThfs+9+0d/bMGT18YNqZ9tClL46qBE+D8o3hY5CDkazdujhTPwYG/w==
X-Received: by 2002:a17:903:3093:b0:14f:dbfb:167 with SMTP id
 u19-20020a170903309300b0014fdbfb0167mr1607175plc.115.1645688346833;
        Wed, 23 Feb 2022 23:39:06 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::fb6e])
        by smtp.gmail.com with ESMTPSA id
 fv9-20020a17090b0e8900b001b8b01e2479sm5486180pjb.16.2022.02.23.23.39.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Feb 2022 23:39:06 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Christian Eggers <ceggers@arri.de>,
	Khem Raj <raj.khem@gmail.com>,
	Trevor Gamblin <trevor.gamblin@windriver.com>,
	Leon Anavi <leon.anavi@konsulko.com>
Subject: [PATCH 1/3] python3-dt-schema: remove recipe
Date: Wed, 23 Feb 2022 23:39:00 -0800
Message-Id: <20220224073900.1350656-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220224073900.1350656-1-raj.khem@gmail.com>
References: <20220224073900.1350656-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Feb 2022 07:39:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95499

From: Christian Eggers <ceggers@arri.de>

Since 2021-11-23 this is on oe-core:
d56fcb5806 ("python: introduce python3-dtschema")

The recipe in oe-core is named python3-dtschema (without dash between
'dt' and 'schema'). It points to the correct GIT repository and uses a
much more recent version.

Signed-off-by: Christian Eggers <ceggers@arri.de>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
---
 .../packagegroups/packagegroup-meta-python.bb     |  1 -
 .../python/python3-dt-schema_git.bb               | 15 ---------------
 2 files changed, 16 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-dt-schema_git.bb

diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
index 1c1ded7181a..319d49267cc 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -113,7 +113,6 @@ RDEPENDS:packagegroup-meta-python3 = "\
     python3-docopt \
     python3-docutils \
     python3-dominate \
-    python3-dt-schema \
     python3-dynamic-dispatch \
     python3-ecdsa \
     python3-editor \
diff --git a/meta-python/recipes-devtools/python/python3-dt-schema_git.bb b/meta-python/recipes-devtools/python/python3-dt-schema_git.bb
deleted file mode 100644
index 305cfa6b0f2..00000000000
--- a/meta-python/recipes-devtools/python/python3-dt-schema_git.bb
+++ /dev/null
@@ -1,15 +0,0 @@
-SUMMARY = "Tooling for devicetree validation using YAML and jsonschema"
-AUTHOR = "Rob Herring"
-
-LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://setup.py;beginline=2;endline=3;md5=c795d4924c5f739424fa8d9b569c6659"
-
-inherit setuptools3
-
-SRC_URI = "git://github.com/robherring/dt-schema.git;branch=master;protocol=https"
-SRCREV = "5009e47c1c76e48871f5988e08dad61f3c91196b"
-PV = "0.1+git${SRCPV}"
-
-S = "${WORKDIR}/git"
-
-RDEPENDS:${PN} = "python3-jsonschema python3-ruamel-yaml"

From fee18fc3a33afa461ae31606c2966487e4cd45ac Mon Sep 17 00:00:00 2001
From: Leon Anavi <leon.anavi@konsulko.com>
Date: Mon, 21 Feb 2022 21:22:55 +0200
Subject: [PATCH 2/3] python3-itsdangerous: Upgrade 2.0.1 -> 2.1.0

Upgrade to release 2.1.0:

- Drop support for Python 3.6
- Remove previously deprecated code

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
---
 ...hon3-itsdangerous_2.0.1.bb => python3-itsdangerous_2.1.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-itsdangerous_2.0.1.bb => python3-itsdangerous_2.1.0.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-itsdangerous_2.0.1.bb b/meta-python/recipes-devtools/python/python3-itsdangerous_2.1.0.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-itsdangerous_2.0.1.bb
rename to meta-python/recipes-devtools/python/python3-itsdangerous_2.1.0.bb
index 48a77dc8f88..30d23c65696 100644
--- a/meta-python/recipes-devtools/python/python3-itsdangerous_2.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-itsdangerous_2.1.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://github.com/mitsuhiko/itsdangerous"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=4cda9a0ebd516714f360b0e9418cfb37"
 
-SRC_URI[sha256sum] = "9e724d68fc22902a1435351f84c3fb8623f303fffcc566a4cb952df8c572cff0"
+SRC_URI[sha256sum] = "d848fcb8bc7d507c4546b448574e8a44fc4ea2ba84ebf8d783290d53e81992f5"
 
 inherit pypi setuptools3
 

From 52fbba2c3c15f9522ed66c0ba2baff9a36698489 Mon Sep 17 00:00:00 2001
From: Leon Anavi <leon.anavi@konsulko.com>
Date: Mon, 21 Feb 2022 21:22:56 +0200
Subject: [PATCH 3/3] python3-croniter: Upgrade 1.2.0 -> 1.3.4

Upgrade to release 1.3.4:

- Add a way to make next() easier to use
- Restore compat with python2
- Fix regressions with set_current
- Fix compat for tests under py27

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
---
 .../{python3-croniter_1.2.0.bb => python3-croniter_1.3.4.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-croniter_1.2.0.bb => python3-croniter_1.3.4.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-croniter_1.2.0.bb b/meta-python/recipes-devtools/python/python3-croniter_1.3.4.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-croniter_1.2.0.bb
rename to meta-python/recipes-devtools/python/python3-croniter_1.3.4.bb
index 13dbf155c78..4158dbe7c46 100644
--- a/meta-python/recipes-devtools/python/python3-croniter_1.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-croniter_1.3.4.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://docs/LICENSE;md5=b8ee59850b882cbf623188489ea748e2"
 
 PYPI_PACKAGE = "croniter"
 
-SRC_URI[sha256sum] = "094422f6aeb9ed646714393503fa388afe4f846e110e1997fea5794e2085c2d7"
+SRC_URI[sha256sum] = "3169365916834be654c2cac57ea14d710e742f8eb8a5fce804f6ce548da80bf2"
 
 inherit pypi setuptools3
 

