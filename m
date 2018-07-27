Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id 8E7716067C
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Jul 2018 18:26:37 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id b66-v6so3898228qkj.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Jul 2018 11:26:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=b+EDitRdJsCND8p4EldvIg4bp5OwEXqffvxDWSgHevs=;
	b=kS5bTh0he1sDm4VGNY+iCtRNNU+f1VwAF/Ntce6PeRNWFbABmNH/24vT32CsFax2n7
	hdCxkjg94G5dMZ3JSkraVzaGobziagrYvpQf4Y3Qko/YfodDb5wOV7AFUj0jyoZ8Pytz
	3C6xp7XyKLPJgT5mmp8YWguPHuxuMRU29N7CaAavMElh6hxfJryaF5ZtPSYjZ6dTIA5J
	blGWaTmFL5ladu+BEjCbw5/ZblxVxnMy0RDllM+b7A/Nucytif4QQ7OJ4nUiqJZ8vuDm
	7g7SgIZO4L2+2iGU6lclra9AxPN6ZxpcWgk/o4od3ijjDBIOMraH68O94B1TU+EFaxY+
	oQNw==
X-Gm-Message-State: AOUpUlG5SDHJFlwEheHTH4uZNKKqQiJbO+RTFS6Z8aQUTPOKBpAi1xPz
	nxbBPzuOYLSz2i6mMLKJ+CbsU0Y59z8=
X-Google-Smtp-Source: AAOMgpccDURsnE3Q2GTT9AaZ5+n7XG3hpBv7sC6sWYxJMbKg/LP3pKf/eNP7gQ7ifH1/6uhE+xi2oA==
X-Received: by 2002:ae9:d8c1:: with SMTP id
	u184-v6mr7033976qkf.13.1532715998080; 
	Fri, 27 Jul 2018 11:26:38 -0700 (PDT)
Received: from sparta.ny.asterius.io ([68.132.61.164])
	by smtp.gmail.com with ESMTPSA id
	k89-v6sm2834403qte.14.2018.07.27.11.26.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 27 Jul 2018 11:26:37 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 27 Jul 2018 14:26:29 -0400
Message-Id: <1532715989-6287-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-can: update to version 2.2.1
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
X-List-Received-Date: Fri, 27 Jul 2018 18:26:37 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-can.inc                   | 5 +++--
 .../python/{python-can_2.2.0.bb => python-can_2.2.1.bb}              | 0
 .../python/{python3-can_2.2.0.bb => python3-can_2.2.1.bb}            | 0
 3 files changed, 3 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-can_2.2.0.bb => python-can_2.2.1.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-can_2.2.0.bb => python3-can_2.2.1.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-can.inc b/meta-python/recipes-devtools/python/python-can.inc
index 959da83..46f0859 100644
--- a/meta-python/recipes-devtools/python/python-can.inc
+++ b/meta-python/recipes-devtools/python/python-can.inc
@@ -3,8 +3,8 @@ SECTION = "devel/python"
 LICENSE = "LGPLv3"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=38138baa100d7259934590850bc0406e"
 
-SRC_URI[md5sum] = "670cf82f67c6d2bd6516b638f129a196"
-SRC_URI[sha256sum] = "187fac2fbc807561344a6df99cf7b776c0a10182bf99bb10a5c83af45b57dc11"
+SRC_URI[md5sum] = "dcdd3f6b924e3f20acb1ccf4598236cf"
+SRC_URI[sha256sum] = "b5e93b2ee32bdd597d9d908afe5171c402a04c9678ba47b60f33506738b1375b"
 
 PYPI_PACKAGE="python-can"
 
@@ -14,4 +14,5 @@ RDEPENDS_${PN}_class-target += "\
     ${PYTHON_PN}-misc \
     ${PYTHON_PN}-netserver \
     ${PYTHON_PN}-sqlite3 \
+    ${PYTHON_PN}-wrapt \
 "
diff --git a/meta-python/recipes-devtools/python/python-can_2.2.0.bb b/meta-python/recipes-devtools/python/python-can_2.2.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-can_2.2.0.bb
rename to meta-python/recipes-devtools/python/python-can_2.2.1.bb
diff --git a/meta-python/recipes-devtools/python/python3-can_2.2.0.bb b/meta-python/recipes-devtools/python/python3-can_2.2.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-can_2.2.0.bb
rename to meta-python/recipes-devtools/python/python3-can_2.2.1.bb
-- 
2.7.4


