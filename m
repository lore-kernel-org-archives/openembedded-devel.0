Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
	[209.85.167.45])
	by mail.openembedded.org (Postfix) with ESMTP id 2552C7D3D1
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  7 Apr 2019 13:50:35 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id m13so7522983lfb.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 07 Apr 2019 06:50:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=q+YCM1+C+yoEJb7as1oFN3tmialunGA9//DpHplFEbM=;
	b=iOSNM77QCEr8700OltTxQIGGIxA1kP26fT+HuWv2Jh/YTRDGYzL8fiC407iLrv2gKs
	PGjEKaQNfmMATKuWomcNc/6dw6HNu9TErjpLCzqU/n3YT/VM/+hOMGsUW+zn9FYv0Jtw
	8mH1OFfTQubnOno5NVVrScKrnWy5wLcsQQzAmQQQiVRe1/3ib5J+wcvzFwE13zZqf2F0
	Bw6HEQVrXWwobqj4k7bPmv8lXWmd4EtBxxbgR2UIKUSEcfI4urqZoQc0e6zyHzh34MR6
	PbBmkOzhuZrv3G/sbMeZdZft6zAlHfHRCmRHoGp4wgqU3WCCKygZ6Jj7Jq31hkn8eZxN
	t4JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=q+YCM1+C+yoEJb7as1oFN3tmialunGA9//DpHplFEbM=;
	b=NngJlmgoGCSjDt5Zo+xQNUaet4nkGDUC6JQQj1oif9J8evVTfuSYNk4HUAVVOKKR7+
	v2vQ8mu7pyYFE8RBKr70wUpv4qR3WZVwOoI4Frf2v+g+2f2/CDVZnBs+ESVb6pZ+jeCp
	BkxzGNwaUWT+U+qZaJeEifhDd3AnInIqA5UB4B5tjmcuur/ZVBh4am1C6XD+Ry+DKQsm
	Fvi+9fel1PQK7E7912jdQ5Xn0bB9wSITQOzDWdz2u+mfwWtUlkEg3fgDpNkwxuRQCm9X
	qv7krBhCR9rM/t3TnWYuEWtU1jm5q7zh4sIR9SzBxysXJv0yPcAXwmDiYd3ebILyxVmj
	pcfQ==
X-Gm-Message-State: APjAAAUSZPBx48rHuH613MecEb1TvelRtqRH046h45+lKbCskd6gE1dB
	lLzpRvm/MJM6m3UcT7Tx1ZtIaQU2R3Y=
X-Google-Smtp-Source: APXvYqyyvEUvukD4dW8BXkoDcGJCdKM/puoBfsDZvXsgbF8AJwYiqlXZDRi8NMdCb/ZiQSOwDjN1Gw==
X-Received: by 2002:a19:e30a:: with SMTP id a10mr6623991lfh.58.1554645035948; 
	Sun, 07 Apr 2019 06:50:35 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108]) by smtp.gmail.com with ESMTPSA id
	t21sm1777966lfb.65.2019.04.07.06.50.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 07 Apr 2019 06:50:35 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  7 Apr 2019 15:50:33 +0200
Message-Id: <20190407135033.27300-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-networking] cifs-utils: update to 6.9
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
X-List-Received-Date: Sun, 07 Apr 2019 13:50:36 -0000

Removed patch has been upstreammed.

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../{cifs-utils_git.bb => cifs-utils_6.9.bb}  |  8 ++---
 ...ount.cifs-Remove-data_blob.h-include.patch | 32 -------------------
 2 files changed, 3 insertions(+), 37 deletions(-)
 rename meta-networking/recipes-support/cifs/{cifs-utils_git.bb => cifs-utils_6.9.bb} (88%)
 delete mode 100644 meta-networking/recipes-support/cifs/files/0001-mount.cifs-Remove-data_blob.h-include.patch

diff --git a/meta-networking/recipes-support/cifs/cifs-utils_git.bb b/meta-networking/recipes-support/cifs/cifs-utils_6.9.bb
similarity index 88%
rename from meta-networking/recipes-support/cifs/cifs-utils_git.bb
rename to meta-networking/recipes-support/cifs/cifs-utils_6.9.bb
index 198e3ef98..51dcb23d1 100644
--- a/meta-networking/recipes-support/cifs/cifs-utils_git.bb
+++ b/meta-networking/recipes-support/cifs/cifs-utils_6.9.bb
@@ -4,12 +4,10 @@ SECTION = "otherosfs"
 LICENSE = "GPLv3 & LGPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-PV = "6.7"
+PV = "6.9"
 
-SRCREV = "8101a07871f185c7044fa2ca221b282ab4607c8b"
-SRC_URI = "git://git.samba.org/cifs-utils.git \
-           file://0001-mount.cifs-Remove-data_blob.h-include.patch \
-          "
+SRCREV = "9a8c21ad9e4510a83a3a41f7a04f763a4fe9ec09"
+SRC_URI = "git://git.samba.org/cifs-utils.git"
 
 S = "${WORKDIR}/git"
 DEPENDS += "libtalloc"
diff --git a/meta-networking/recipes-support/cifs/files/0001-mount.cifs-Remove-data_blob.h-include.patch b/meta-networking/recipes-support/cifs/files/0001-mount.cifs-Remove-data_blob.h-include.patch
deleted file mode 100644
index 07f2a5726..000000000
--- a/meta-networking/recipes-support/cifs/files/0001-mount.cifs-Remove-data_blob.h-include.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-Upstream-Status: Backport
-Signed-off-by: S. Lockwood-Childs <sjl@vctlabs.com>
-
-From 272d523a57a4e8791d625a479128613be5e401f5 Mon Sep 17 00:00:00 2001
-From: Thomas Witt <pyromaniac@exherbo.org>
-Date: Wed, 15 Mar 2017 20:20:44 +0000
-Subject: [PATCH] mount.cifs: Remove data_blob.h include
-
-data_blob.h includes talloc.h from libtalloc, but that is only marked as
-a dependency for cifs.upcall. No symbols from that header are used by
-cifs.mount, so remove it to avoid the libtalloc dependency
-
-Signed-off-by: Thomas Witt <pyromaniac@exherbo.org>
----
- mount.cifs.c | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/mount.cifs.c b/mount.cifs.c
-index 13b71ef..2612feb 100644
---- a/mount.cifs.c
-+++ b/mount.cifs.c
-@@ -61,7 +61,6 @@
- #include "mount.h"
- #include "util.h"
- #include "resolve_host.h"
--#include "data_blob.h"
- 
- #ifndef MS_MOVE 
- #define MS_MOVE 8192 
--- 
-1.9.4
-
-- 
2.17.1


