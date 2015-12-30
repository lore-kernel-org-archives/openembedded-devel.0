Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id 0AAC56011C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Dec 2015 13:58:00 +0000 (UTC)
Received: by mail-wm0-f50.google.com with SMTP id f206so38165466wmf.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Dec 2015 05:58:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=dominion-thruhere-net.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=lKllzM2+38dGrhalG87gigV/XY1+SmQd9iZpJXvMqvs=;
	b=xlipCK0cG7x0rv3d6nbM8JRahVlN5rMhk3QL/bzTqrQ+sbSliI8eIaSXBbcvX/Toc1
	9Y9oCg39frqcUC+nOEO+0VyvmgNJfnmaB6hWj5rm2w5MmkGopryu7LY3N+lWumKdazGs
	b6D84DzgFtl+ifbzrmy+ESSt2Xb3dZ+zgE92XJxxDvTAvrRfAJ8zRx8lwGmMEFGAjGcS
	PGpVuqrOuH4Zma0Emorz6c2Zk2jXidgcjwYMlAqik9lJpG0tAZ1UPSxAy3CdQERhWMHU
	bHlmIMt9mIJEnHW14wdHxMJTxJPvgqJ1+Q62Ev5zVht1v0o/Z9oIN6Q3zPyu15ssjj4q
	uUBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=lKllzM2+38dGrhalG87gigV/XY1+SmQd9iZpJXvMqvs=;
	b=E2fP5sNVdi1ybUHYJDovCDLDeY/cFGYiRdddYrM6N0qNPqLmkp/pn16An/aHFDs/Ie
	IXLlilsw4g6mJjfIU77ecntzVPAGmmzW3+2VmeCJvE+VCDpk3e22PWzCcr2v2uhu4KHA
	23+XM81ub/nbC3wu6rYlmE9nBaOxhkfUM++mFKkZBuRxketGVmziA9awrh1DVuOLUPeG
	+XRNLDF6QQd1lAtDO2j8FBCVBpxlRhUMHCmpSOMsSSGk9Sr+5X0cKj0IEeuBLouQLmuu
	9tOlItztiwjzchOauA8DD2CbtSxmnVFWe3Y+TCTa+hmY9A8ICK3VbB/Uqlkrup9N4oTJ
	4U3A==
X-Gm-Message-State: ALoCoQmI4HDlUPdfxVpxGHw9sWVjH7Cveve4Wm6OLOuaRfpHvgUakOgNccHiGVwGaUGzCNlbtQxciBccrlzCjqUsAwRf0C9jwg==
X-Received: by 10.194.242.195 with SMTP id ws3mr69551865wjc.131.1451483880797; 
	Wed, 30 Dec 2015 05:58:00 -0800 (PST)
Received: from localhost (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by smtp.gmail.com with ESMTPSA id
	e62sm57482916wma.11.2015.12.30.05.57.59
	(version=TLS1_2 cipher=AES128-SHA bits=128/128);
	Wed, 30 Dec 2015 05:57:59 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 30 Dec 2015 14:57:55 +0100
Message-Id: <1451483875-2370-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 2.0.1
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-oe][PATCH] mariadb: -native also needs gold workaround
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
X-List-Received-Date: Wed, 30 Dec 2015 13:58:01 -0000

When the host distro uses gold mariadb-native fails to build.

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta-oe/recipes-support/mysql/mariadb.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-support/mysql/mariadb.inc b/meta-oe/recipes-support/mysql/mariadb.inc
index a6826c3..6a55476 100644
--- a/meta-oe/recipes-support/mysql/mariadb.inc
+++ b/meta-oe/recipes-support/mysql/mariadb.inc
@@ -60,6 +60,9 @@ PACKAGECONFIG[setupdb] = ", ,,${PN}-setupdb"
 # https://mariadb.atlassian.net/browse/MDEV-5982
 TARGET_CFLAGS += "-fuse-ld=bfd"
 
+BUILD_CFLAGS += "-fuse-ld=bfd"
+BUILD_CXXFLAGS += "-fuse-ld=bfd"
+
 EXTRA_OECMAKE = "-DWITH_EMBEDDED_SERVER=ON \
                  -DWITH_JEMALLOC=no \
                  -DWITHOUT_TOKUDB=TRUE \
-- 
2.0.1


