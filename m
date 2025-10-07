Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0A3BCCD184
	for <webhook@archiver.kernel.org>; Tue,  7 Oct 2025 09:59:12 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web10.14842.1759831143270018088
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Oct 2025 02:59:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kvFggUn7;
 spf=pass (domain: gmail.com, ip: 209.85.208.51, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6394938e0ecso7802707a12.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 07 Oct 2025 02:59:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759831142; x=1760435942; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=iGPQo0szIx15jbVs9AXRpTkij0V79Bp4DAZWaTS8ciY=;
        b=kvFggUn7X1clwPsqPBjUuH2g59NXo/nr7wwb3AVNi358Mt6ynhOOTTdAraxF0I150s
         QF77AaQbmZkm7auYo8UJ2FQRpLWtSS0oBW8Jm8ehoxcPHO/sbJEKNgHXABx0bGwO63kI
         9MHSWx58Ch8Etm+KJX/w7B4dRH6XprwlyfbZHJU/NkJnoKnQuvmlgN3CFgplgxVV30SY
         hRFi10go0lqMZvqCadxBfI3B4K2M0G0+aDv4x6UH5tl5UGVRimZZKxER1yb5dqP8uJrU
         UU3EUB8D5ngKMyWJu5d+D7tY3RKrauLxrjMGfSi+UUC6VnSCT0Gx2YbecKz4P35r0Bf7
         Q25Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759831142; x=1760435942;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iGPQo0szIx15jbVs9AXRpTkij0V79Bp4DAZWaTS8ciY=;
        b=rpXAWRfcrsfa2BxgBy5MHAne5tPax3649M8U36sXokTV0W7MN9UiNavB1G6nDnjouj
         44zm4mlAJybiggoe71eZm8Rhq3h7RkYG328yOli6RuyyEdORBRmR9JkEcZrG9ZeHsJND
         lVkonw6IM/O808dwi7uWCkikvIzCmFKCzx7TsnSWNWWyXD8dXoqyKcGrptFuqDG+gKq9
         OErBvFrRpd94uOe5kh/EwsL0J+DL6Z54oq3t3nHze3UofjAKAAtZXmVIRlLEY1yGA1IQ
         gptUPwLN3G/OIpZDn7x4a7TC81wQ1W3HyAQhkTkL+g7qvVgJ8UrpQHVW9XnPUd41WWa8
         6AEA==
X-Gm-Message-State: AOJu0YzTYvLVDLTAwyLovhxwhIlkprRurUr3GZ890dEtHh4XswCznIyN
	LxoGVsV641J1Ls89bFkZIknwOwB3AdgY+OFPK6lzerLnKzt57vAZuB/AbxidJg==
X-Gm-Gg: ASbGncuM7M4ie1DFBp/mls+hgbIoI/1UfDtc5MFHScxTfUWBh+8OKJA06HRMw0HfXUz
	oScQaz3UA4q9U4VbumMtp8A/fMFKcU7omF3suenTVmU1zgzmZwHpsgS9vB0J+cJ+CgOCLWNbi3+
	imPgwU5jaK7v9AKe4ZL+WoUUi6jmwfvkO+CetCB7UsV9dthh6uMTIWsZYPXXtIWXF9GXxRKWavT
	VLjmjSlyqEC6j4DKTHxeC43zBAcP/JrEqcZ7GRnYRnnU01UQu2YZbc2aiV90sIuSuk2NKy8kdOV
	YMT6q8mNn6d9sJ8I2bMhpcFAzHLk3J0ijbudJJRHhSKv31dOkA7J2AXCtD9+h3n7un263mo6afI
	EC2faiVQ7/m0ia5kt2ad6Pd/xmmrabFxlRcixFHGO9Hjk
X-Google-Smtp-Source: AGHT+IEs60z5k12uilIV36Pgc+gd7QkKp8Ld4GDnD6lEVVb6UoK8r9Vm8IAtgljXdgJZqtWA7PBA7g==
X-Received: by 2002:a17:907:7e69:b0:b4f:ee15:8ae8 with SMTP id a640c23a62f3a-b4fee158f87mr115565466b.58.1759831141343;
        Tue, 07 Oct 2025 02:59:01 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6376b3aaf87sm11822073a12.4.2025.10.07.02.59.00
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 02:59:00 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 1/2] python3-django: upgrade 4.2.20 -> 4.2.25
Date: Tue,  7 Oct 2025 11:58:59 +0200
Message-ID: <20251007095900.57445-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Oct 2025 09:59:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120329

The pypi package was renamed from Django to django, so the custom name
is not required anymore.

This upgrade contains fix for CVE-2025-32873, CVE-2025-48432 and CVE-2025-59682.

Changelog:
https://github.com/django/django/blob/main/docs/releases/4.2.21.txt
https://github.com/django/django/blob/main/docs/releases/4.2.22.txt
https://github.com/django/django/blob/main/docs/releases/4.2.23.txt
https://github.com/django/django/blob/main/docs/releases/4.2.24.txt
https://github.com/django/django/blob/main/docs/releases/4.2.25.txt

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-python/recipes-devtools/python/python3-django.inc        | 3 ---
 .../{python3-django_4.2.20.bb => python3-django_4.2.25.bb}    | 4 ++--
 2 files changed, 2 insertions(+), 5 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-django_4.2.20.bb => python3-django_4.2.25.bb} (64%)

diff --git a/meta-python/recipes-devtools/python/python3-django.inc b/meta-python/recipes-devtools/python/python3-django.inc
index cde32be477..57756024fe 100644
--- a/meta-python/recipes-devtools/python/python3-django.inc
+++ b/meta-python/recipes-devtools/python/python3-django.inc
@@ -3,9 +3,6 @@ HOMEPAGE = "https://www.djangoproject.com/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f09eb47206614a4954c51db8a94840fa"
 
-PYPI_PACKAGE = "Django"
-UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
-
 inherit pypi
 
 FILES:${PN} += "${datadir}/django"
diff --git a/meta-python/recipes-devtools/python/python3-django_4.2.20.bb b/meta-python/recipes-devtools/python/python3-django_4.2.25.bb
similarity index 64%
rename from meta-python/recipes-devtools/python/python3-django_4.2.20.bb
rename to meta-python/recipes-devtools/python/python3-django_4.2.25.bb
index 8644b282c6..a6bdc26336 100644
--- a/meta-python/recipes-devtools/python/python3-django_4.2.20.bb
+++ b/meta-python/recipes-devtools/python/python3-django_4.2.25.bb
@@ -1,7 +1,7 @@
 require python3-django.inc
 inherit python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "92bac5b4432a64532abb73b2ac27203f485e40225d2640a7fbef2b62b876e789"
+SRC_URI[sha256sum] = "2391ab3d78191caaae2c963c19fd70b99e9751008da22a0adcc667c5a4f8d311"
 
 RDEPENDS:${PN} += "\
     python3-sqlparse \
@@ -10,5 +10,5 @@ RDEPENDS:${PN} += "\
 
 # Set DEFAULT_PREFERENCE so that the LTS version of django is built by
 # default. To build the 4.x branch, 
-# PREFERRED_VERSION_python3-django = "4.2.20" can be added to local.conf
+# PREFERRED_VERSION_python3-django = "4.2.25" can be added to local.conf
 DEFAULT_PREFERENCE = "-1"

