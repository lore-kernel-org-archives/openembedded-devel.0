Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id 22C3378473
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 Nov 2017 17:49:41 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id n32so976563qtb.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 Nov 2017 09:49:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=d5D9u0fS0JoIeV+4+2ElRmuOAcE8KYz9NZHIdAmF6Rc=;
	b=AY9CGVLIvZNX7jHTNuO1dql+6dCa26m5MfCzMyTuXqA/fSu1iDCMC5lC5zTBSguZ+o
	EnMQkV8dSnbB8ztZ/zOYAW8LTR78l+ZYQqNR/4LK8gjTD8etZ45R1pGzl6e4dY/T13cZ
	VJ7KxUrmZv+304+GS5ChsgzcMdZuzAmsy/3XyjwfDrwjMlos53cG4n8PxWxM+pp9WZIO
	b15/sWZ4r6RnnRnxm6UKAd6beWXUa6Ms5PWynKCtS+wq7bSXnEL1S6zD8OjJRVozmS0N
	208uI9XwFkzKUN184ak0U4Uv/e1Yu0Wsy++5EqtHV4HY+NtmtJXnVM6yajP/E/u8a4SP
	1bUw==
X-Gm-Message-State: AJaThX7d8L201mCsIbKwRXoMaJTi9ZCO5wTtTr804W7jLDUkOu4iTyZv
	+r6nk/xysqFCwYrlF2OwYRdnIk2n
X-Google-Smtp-Source: AGs4zMYpLaGux3A4ncdp3b/XJ6/k93nqOce2v1Mh+gxdtYJD+3bhB1h01r6n+R3PwKIcW9zp+uiYHA==
X-Received: by 10.200.42.228 with SMTP id c33mr11553938qta.256.1510508982745; 
	Sun, 12 Nov 2017 09:49:42 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	s14sm9740047qtc.65.2017.11.12.09.49.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 12 Nov 2017 09:49:42 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 12 Nov 2017 12:49:37 -0500
Message-Id: <1510508977-17695-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-sqlalchemy: update to version 1.1.15
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
X-List-Received-Date: Sun, 12 Nov 2017 17:49:42 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-sqlalchemy.inc             | 4 ++--
 .../{python-sqlalchemy_1.1.14.bb => python-sqlalchemy_1.1.15.bb}      | 0
 .../{python3-sqlalchemy_1.1.14.bb => python3-sqlalchemy_1.1.15.bb}    | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-sqlalchemy_1.1.14.bb => python-sqlalchemy_1.1.15.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-sqlalchemy_1.1.14.bb => python3-sqlalchemy_1.1.15.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-sqlalchemy.inc b/meta-python/recipes-devtools/python/python-sqlalchemy.inc
index cc8e82f..2683a6a 100644
--- a/meta-python/recipes-devtools/python/python-sqlalchemy.inc
+++ b/meta-python/recipes-devtools/python/python-sqlalchemy.inc
@@ -7,8 +7,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=452f4b8adb0feba42e5be5f1fbfbf538"
 PYPI_PACKAGE = "SQLAlchemy"
 inherit pypi
 
-SRC_URI[md5sum] = "b32669d53e903b3512065026552f3bff"
-SRC_URI[sha256sum] = "f1191e29e35b6fe1aef7175a09b1707ebb7bd08d0b17cb0feada76c49e5a2d1e"
+SRC_URI[md5sum] = "077f9bd3339957f53068b5572a152674"
+SRC_URI[sha256sum] = "8b79a5ed91cdcb5abe97b0045664c55c140aec09e5dd5c01303e23de5fe7a95a"
 
 RDEPENDS_${PN} += " \
     ${PYTHON_PN}-json \
diff --git a/meta-python/recipes-devtools/python/python-sqlalchemy_1.1.14.bb b/meta-python/recipes-devtools/python/python-sqlalchemy_1.1.15.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-sqlalchemy_1.1.14.bb
rename to meta-python/recipes-devtools/python/python-sqlalchemy_1.1.15.bb
diff --git a/meta-python/recipes-devtools/python/python3-sqlalchemy_1.1.14.bb b/meta-python/recipes-devtools/python/python3-sqlalchemy_1.1.15.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-sqlalchemy_1.1.14.bb
rename to meta-python/recipes-devtools/python/python3-sqlalchemy_1.1.15.bb
-- 
2.7.4


