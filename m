Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 2EFCD719E1
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  3 Nov 2016 17:33:47 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id a136so5433845pfa.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 03 Nov 2016 10:33:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=dozy95z7AeIKtUjtU7ca7qrWPF9ahlP26lsbLcqweU8=;
	b=OQ4eyZeyudR6fjXLh7hPJP7DLX5dGXjCudy5ClYT68xoGC+3kBf6cxjd+4M7rcCKEq
	97EEQO1js654bxPpOIhuTx7BQKK6ZgLQOjbWMqSOZJl6aoi0zDyNUz1XTS93pqX76CLU
	GXUGlPWQCZz0yLfnkPeXAgUrVCCfGSW7M1Wyf0524yqhTwL4gwPx1D87QRYG4zZ4y9lz
	E9Pnncu7GdHkVFzfW0PNd5yJ6tasCzsPxQ1lamLGT/F0VzkjEr24HBxuIkBkCHsqCLFU
	bQn7LenSzkUuHs61aOScxKs7j2dDerqISDJ5xU+Rkf8RzVcIkIvv0uotP0gkiDyQYgHY
	9Uxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=dozy95z7AeIKtUjtU7ca7qrWPF9ahlP26lsbLcqweU8=;
	b=GAvU5SiCpRVx1an3W4ah68txKIE1yAf8f21ofRO2hPtLj1mdc6lxXIldgY/r1+YlMJ
	IM5dnhAFBXR6gy/+4Axyw4ao+4Y+Y5zeu6GV6VJ72XgCoHci7YSAj+2TWNl2qXnD8uYw
	EfgiEES4Tq62SCFNk6LMJDLWbK9Vg7z7gCMd6f34Q7IAHCJjO16gzC78Xm7g3rqSp6f7
	w9P9naO+OhHsgFScKUsa0VNWbz//omacj6UZ5Ji6/eeFTCg8AXRhQpDOi7ProafWkpgx
	1vjARTyxZlWyCxLr5aQU8jyPBGYCHR/wFbIeADQv6VZn6DGgExAI2458x2sS0u7QzocV
	b/yQ==
X-Gm-Message-State: ABUngvc7oEm14sHyrUfN7549QN5BWKW39v8Qw/v78oL/+DQXKsqKw8SnRZByWOJ/vYDQ1g==
X-Received: by 10.98.193.68 with SMTP id i65mr18966202pfg.155.1478194429255;
	Thu, 03 Nov 2016 10:33:49 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	uh10sm14241214pab.5.2016.11.03.10.33.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 03 Nov 2016 10:33:48 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  3 Nov 2016 10:33:41 -0700
Message-Id: <20161103173342.13661-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.10.2
Subject: [meta-oe][PATCH 1/2] krb5: Add -fPIC to compile flags
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
X-List-Received-Date: Thu, 03 Nov 2016 17:33:48 -0000

Fixes errors on x86_64 e.g.
errors.so: relocation R_X86_64_PC32 against symbol `k5_vset_error' can not be used when making a shared object; recompile with -fPIC

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-connectivity/krb5/krb5_1.13.6.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-connectivity/krb5/krb5_1.13.6.bb b/meta-oe/recipes-connectivity/krb5/krb5_1.13.6.bb
index e2d0594..06f7f90 100644
--- a/meta-oe/recipes-connectivity/krb5/krb5_1.13.6.bb
+++ b/meta-oe/recipes-connectivity/krb5/krb5_1.13.6.bb
@@ -51,8 +51,8 @@ CACHED_CONFIGUREVARS += "krb5_cv_attr_constructor_destructor=yes ac_cv_func_regc
                   ac_cv_printf_positional=yes ac_cv_file__etc_environment=yes \
                   ac_cv_file__etc_TIMEZONE=no"
 
-CFLAGS_append = " -DDESTRUCTOR_ATTR_WORKS=1 -I${STAGING_INCDIR}/et"
-LDFLAGS_append = " -lpthread"
+CFLAGS_append = " -fPIC -DDESTRUCTOR_ATTR_WORKS=1 -I${STAGING_INCDIR}/et"
+LDFLAGS_append = " -pthread"
 
 FILES_${PN} += "${datadir}/gnats"
 FILES_${PN}-doc += "${datadir}/examples"
-- 
2.10.2


