Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f179.google.com (mail-pf0-f179.google.com
	[209.85.192.179])
	by mail.openembedded.org (Postfix) with ESMTP id C4EC474E86
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Jun 2018 19:19:38 +0000 (UTC)
Received: by mail-pf0-f179.google.com with SMTP id c22-v6so5433721pfi.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Jun 2018 12:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=kckuvwWBfuvB9J5zs26D+c7fmJhEp8Gt2EuT7aMpZmM=;
	b=TcnuUUbGhuCxy7vL9xzl6e1kUX8KZrwvSyPV+aE6zAR+7bqtuOT0CgzSF2XWQWFw6b
	wib4yzdz0iyt5C9Lj5bsHX1YA69u8luCNlP2Nsixqrf/0sdrhKI4F+W4U6wSX1hClKCL
	HDC7Wjk+M50lykUI/TnXw9DFBiPNwEePEojZ7iSJ89EZI6jcoN5TujjIXYr2kEHrZaY/
	+7ATdEtzS+TNb9KemBmhyP0MZ2QkV1KMGy7B/yv0MzWWDAH4txYBHIM+BrPVpBrcqfu7
	m/mdQhoxxLKNgbUE+8yJwbH3F4biQOm3MGpWGXtT/1o8L7C2J4u+oiuO1iVlPhaPUBtM
	hzXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=kckuvwWBfuvB9J5zs26D+c7fmJhEp8Gt2EuT7aMpZmM=;
	b=Q6l3DU+PlTrK6Yki2Ia+avPmsga3KVYlQGbZdtEdVckQBJdr3myJTb+9aB/LjBDx9G
	lgridFuKeVEQG/iJJUViyAJH7P+WGzTAtxkRsgxa/ni22H/2gU1ilKfoKi+6V4lq50+T
	PZF/oSwzOgitdE5hAmdmp4Zn4hUgrptQreUTTJ25WwRMSgwTX3qmctIyHyXCIm4pAUyj
	N5PEM7Qls/f/kOXIGuzpW0uG6BIJhQkF/wGf58ENolXFqLfzDMYqsr2L/8QX0nSrt8O/
	73D7AK4vSbrGQHS8o8+3BVHtx7Nuuv53/SBsOAIFUJ3hhMbvuPPCjDwauMdZAJKYwwi2
	53Zg==
X-Gm-Message-State: APt69E1MfJ3nlM7QNR0y+ghhjmlu00NobcFU8pb7Lp8pn2Lv6laz3SDp
	T0k0v1hG8zqUyEhrYpLgHw3mAA==
X-Google-Smtp-Source: ADUXVKLsqewmiKGdyUZDcmdy7RSQDLDznd9vX0lLR7nj90yEhtuFOPgTk3vKHI0FYAlVofxOnLpI5A==
X-Received: by 2002:a65:6688:: with SMTP id b8-v6mr8453249pgw.24.1529867979507;
	Sun, 24 Jun 2018 12:19:39 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::91a0])
	by smtp.gmail.com with ESMTPSA id
	m11-v6sm36700461pfj.25.2018.06.24.12.19.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 24 Jun 2018 12:19:38 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 24 Jun 2018 12:18:35 -0700
Message-Id: <20180624191845.31082-10-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180624191845.31082-1-raj.khem@gmail.com>
References: <20180624191845.31082-1-raj.khem@gmail.com>
Cc: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
Subject: [meta-networking][PATCH 10/20] drbd-utils: 8.9.6 -> 9.4.0
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
X-List-Received-Date: Sun, 24 Jun 2018 19:19:39 -0000

From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>

1.Upgrade drbd-utils from 8.9.6 to 9.4.0.
2.Delete 0001-Makefile.in-fix-permission-bits-for-drbd.service.patch, since it is integrated upstream.
3.Upgrade the SRC_URI to use git fetcher

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...fix-permission-bits-for-drbd.service.patch | 25 -------------------
 ...rbd-utils_8.9.6.bb => drbd-utils_9.4.0.bb} | 11 ++++----
 2 files changed, 6 insertions(+), 30 deletions(-)
 delete mode 100644 meta-networking/recipes-support/drbd/drbd-utils/0001-Makefile.in-fix-permission-bits-for-drbd.service.patch
 rename meta-networking/recipes-support/drbd/{drbd-utils_8.9.6.bb => drbd-utils_9.4.0.bb} (80%)

diff --git a/meta-networking/recipes-support/drbd/drbd-utils/0001-Makefile.in-fix-permission-bits-for-drbd.service.patch b/meta-networking/recipes-support/drbd/drbd-utils/0001-Makefile.in-fix-permission-bits-for-drbd.service.patch
deleted file mode 100644
index 90dd1f8618..0000000000
--- a/meta-networking/recipes-support/drbd/drbd-utils/0001-Makefile.in-fix-permission-bits-for-drbd.service.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-Upstream-Status: Pending
-
-Subject:  Makefile.in: fix permission bits for drbd.service
-
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
----
- scripts/Makefile.in | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/scripts/Makefile.in b/scripts/Makefile.in
-index 402b93b..4a45407 100644
---- a/scripts/Makefile.in
-+++ b/scripts/Makefile.in
-@@ -65,7 +65,7 @@ endif
- # yes, debian apparently allows installing both types from the same package
- ifneq ($(initscripttype),sysv)		# "systemd" or "both"
- 	install -d $(DESTDIR)$(systemdunitdir)
--	install -m 755 drbd.service $(DESTDIR)$(systemdunitdir)/
-+	install -m 644 drbd.service $(DESTDIR)$(systemdunitdir)/
- 	install -d $(DESTDIR)/lib/drbd/
- 	install -m 755 drbd $(DESTDIR)/lib/drbd/
- 	install -d $(DESTDIR)$(tmpfilesdir)/
--- 
-1.9.1
-
diff --git a/meta-networking/recipes-support/drbd/drbd-utils_8.9.6.bb b/meta-networking/recipes-support/drbd/drbd-utils_9.4.0.bb
similarity index 80%
rename from meta-networking/recipes-support/drbd/drbd-utils_8.9.6.bb
rename to meta-networking/recipes-support/drbd/drbd-utils_9.4.0.bb
index 90c920447b..d6e913f00a 100644
--- a/meta-networking/recipes-support/drbd/drbd-utils_8.9.6.bb
+++ b/meta-networking/recipes-support/drbd/drbd-utils_9.4.0.bb
@@ -8,13 +8,14 @@ SECTION = "admin"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=5574c6965ae5f583e55880e397fbb018"
 
-SRC_URI = "http://www.linbit.com/downloads/drbd/utils/archive/${BP}.tar.gz \
-           file://0001-Makefile.in-fix-permission-bits-for-drbd.service.patch \
+SRC_URI = "git://github.com/LINBIT/drbd-utils \
           "
-SRC_URI[md5sum] = "76ed6d3190cd77b00890f3365353124b"
-SRC_URI[sha256sum] = "297b77c9b3f88de2e7dae459234f2753ea4fc2805282b2d276e35cf51e292913"
+# v9.4.0
+SRCREV = "eff6423ee72931aa0f8d0eb51742acee7c7cd3e1"
 
-UPSTREAM_CHECK_URI = "http://www.linbit.com/downloads/drbd/utils/"
+S = "${WORKDIR}/git"
+
+UPSTREAM_CHECK_URI = "https://github.com/LINBIT/drbd-utils/releases"
 
 SYSTEMD_SERVICE_${PN} = "drbd.service"
 SYSTEMD_AUTO_ENABLE = "disable"
-- 
2.18.0


