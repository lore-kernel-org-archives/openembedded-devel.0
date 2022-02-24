Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BB5DC433F5
	for <webhook@archiver.kernel.org>; Thu, 24 Feb 2022 07:39:06 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
 [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web08.7615.1645688344997786876
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Feb 2022 23:39:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=o5pddy7E;
 spf=pass (domain: gmail.com, ip: 209.85.215.175,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f175.google.com with SMTP id 75so1071552pgb.4
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Feb 2022 23:39:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EobVlljTMKfFuCRV9abwYe9f0N1YqaSQZqCEL8xJJyw=;
        b=o5pddy7E1kGZjrjorUl6MrUwczgbliPSBCR2N78GKdR6RAzkjtsonMUw13RyKR31Ur
         /KE+1yjmpRa3JBF6CktJn9QQhGdykxRpnaaHzbkhMqbodQ5bOTuYznDyEwIXvKyyzrrV
         j6whOqsVs+ImKgVeq3djRz0a4VCYE8th7fk2uHPYTwMwtXm04/0gIUNvfZs6emdcd89x
         mgWaZbdyWBSb5NayI12AFqeDgCafkVwrJGH3p5YE7u/GiU8uxJdveqNm8EIDjE7CqtpK
         S5V/LqOfkKTWaIcL5rMN2J9t2lzBe3EK/35zua9WD9GL/ic9Dl0WFckvGTUe4eSIO9qh
         visg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EobVlljTMKfFuCRV9abwYe9f0N1YqaSQZqCEL8xJJyw=;
        b=KOQQatbIhFkVoWUHj4I7HUdwvgdmbf1f+rCYGS/oPYaMcpRoHSqDmSD3hQGN+t0tfH
         uDomgZ2lpyC+mzKOhWHBesW+R6RzEgrVwwveAb685kyF9QQ+YCNwVIc4ntahQ2lPsJtv
         nvTNg6y22s89aJgNUo+79xD/WNYFLCPDjYz/0PiRWjPAndVd0lw413lN6b/iZ7ldIslC
         /kCfYqAQMF9kOcV+KxbZUhBN/a6eMt6Rq4v6Vf9fJViwuNAZMD2ZDW2v1sBTRcG33gjD
         szWLfngQzS03v7TAvvV9Ohep+4U52IZ7/rxwY5z75Vfp9if62AFegAfpU6O0qntmXp9y
         Keow==
X-Gm-Message-State: AOAM532pF3zvAdTlclFVM12w6IbiIEmRowOgOVh9blJUXFscEV1mRY6g
	Hu2fN4n2Z5n3BfYI19w5R/o4RYP+t6zjug==
X-Google-Smtp-Source: 
 ABdhPJzPpBlbjIkYKHRp9ZnU9OEE+Lv312UtGFrFw/b4kWURCPOAmjMDmawTPTTHxIEH+DOAe/6jMA==
X-Received: by 2002:a05:6a00:190f:b0:4f3:a81d:c4c3 with SMTP id
 y15-20020a056a00190f00b004f3a81dc4c3mr1383941pfi.45.1645688344021;
        Wed, 23 Feb 2022 23:39:04 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::fb6e])
        by smtp.gmail.com with ESMTPSA id
 fv9-20020a17090b0e8900b001b8b01e2479sm5486180pjb.16.2022.02.23.23.39.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Feb 2022 23:39:03 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Tim Orling <tim.orling@konsulko.com>
Subject: [meta-python][PATCH 1/2] anyjson: Drop recipe
Date: Wed, 23 Feb 2022 23:38:58 -0800
Message-Id: <20220224073900.1350656-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Feb 2022 07:39:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95497

anyjson is inactive [1] moreover does not have wheel support

there is drop-in replacement to use oslo.serialization if needed
we can accept such a recipe if submitted

[1] https://snyk.io/advisor/python/anyjson

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Tim Orling <tim.orling@konsulko.com>
---
 .../packagegroups/packagegroup-meta-python.bb |  2 --
 .../python/python3-anyjson_0.3.3.bb           | 28 -------------------
 2 files changed, 30 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-anyjson_0.3.3.bb

diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
index d90e6551e7..2b20937f78 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -26,7 +26,6 @@ RDEPENDS:packagegroup-meta-python3 = "\
     python3-alembic \
     python3-ansi2html \
     python3-ansicolors \
-    python3-anyjson \
     python3-appdirs \
     python3-apply-defaults \
     python3-argcomplete \
@@ -485,7 +484,6 @@ RDEPENDS:packagegroup-meta-python3-ptest = "\
     python3-jinja2-ptest \
     python3-markupsafe-ptest \
     python3-ansicolors-ptest \
-    python3-anyjson-ptest \
     python3-appdirs-ptest \
     python3-backports-functools-lru-cache-ptest \
     python3-bcrypt-ptest \
diff --git a/meta-python/recipes-devtools/python/python3-anyjson_0.3.3.bb b/meta-python/recipes-devtools/python/python3-anyjson_0.3.3.bb
deleted file mode 100644
index 2b8abb8b80..0000000000
--- a/meta-python/recipes-devtools/python/python3-anyjson_0.3.3.bb
+++ /dev/null
@@ -1,28 +0,0 @@
-SUMMARY = "Wraps the best available JSON implementation available in a common interface"
-DESCRIPTION = "Anyjson loads whichever is the fastest JSON module installed and  \
-provides a uniform API regardless of which JSON implementation is used."
-HOMEPAGE = "https://bitbucket.org/runeh/anyjson"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=989aa97e73c912a83a3c873fa11deb08"
-
-inherit pypi setuptools3 ptest
-
-SRC_URI += " \
-	file://0001-setup.py-Do-not-use-2to3.patch \
-	file://run-ptest \
-"
-
-RDEPENDS:${PN}-ptest += " \
-	${PYTHON_PN}-pytest \
-	${PYTHON_PN}-nose \
-"
-
-do_install_ptest() {
-	install -d ${D}${PTEST_PATH}/tests
-	cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
-}
-
-SRC_URI[md5sum] = "2ea28d6ec311aeeebaf993cb3008b27c"
-SRC_URI[sha256sum] = "37812d863c9ad3e35c0734c42e0bf0320ce8c3bed82cd20ad54cb34d158157ba"
-
-RDEPENDS:${PN} += "${PYTHON_PN}-simplejson"
-- 
2.35.1


