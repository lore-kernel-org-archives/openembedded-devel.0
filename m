Return-Path: <oleksandr.kravchuk@pelagicore.com>
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id 05E3460589
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Dec 2016 07:17:36 +0000 (UTC)
Received: by mail-wm0-f44.google.com with SMTP id a197so316549686wmd.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Dec 2016 23:17:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=pelagicore-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=AgKughV9rKgEc6jpg6dbcJbXcKILlhOMjATzvItmsdA=;
	b=ox0+Y7Hz0j31u8RYtDTmHIhKtMGjOnhTalqHYz3rb+5/+oqxNp3CsWKwJ3PlFs68pT
	XJT69SjqoZO8xD1Q7wbAbxp4BGZtXugxndM5OJGM7wt4PeAEu43G27x+RQ0iQ9KZktMV
	y8+qcWoHv64/4v90cy9zvu4vW9oiuA3Nk3F/L32vQWC9ovnL+HFtwNuTvMlOw7hOi9ME
	HHV52NVelhI7HDTwgBzsEo/5oDJBk3BkzYOYt8K+lcPxVdmu4LGJzsuB3oDBABKPJaMb
	RfLXmn7+OSqKcszBt0R/LAn2532Ch4zZYlgQAaMlq+0AbguSoC3okYIJCyR6p75DPk1V
	EwPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=AgKughV9rKgEc6jpg6dbcJbXcKILlhOMjATzvItmsdA=;
	b=M5OWdM5KUSo9YSjxe+HC04gqJNeNg8v6dR79c0HrYcyAQA9oG2JrIWTLthP2USI0aE
	NdpBpBm19LnhEVTwpwmWX4k768ff0Q+BJ7Cso3GaC5LPwM4gmQUOdzguGTkJ3AVdsU97
	eN6G+ljUzIFdnEtalPY4n1PKVk5IFsqzEAiqztrIMH0RBoI4JqYuDdCjlxERXV2GWBvE
	BplwXQTDXcbtwRdVr5BVn4NvXqfdOkWrE5FoCgwdAFrq4thl5dBzSp5UUAQUUgxlMz3g
	PX/4eiBpMz4rHgZGIJvAYgnWl5Vgs2EeXXil7Opm2i4Y3wApn7H7kN29FnSp05d4LISG
	swRg==
X-Gm-Message-State: AIkVDXLiUUBYKxy3N0iT//ppMvqlsFXh5QlvBkJDUoE171jURUWPE5/9o6SyBDktwL+CFJSC
X-Received: by 10.28.20.70 with SMTP id 67mr37590261wmu.102.1483082257755;
	Thu, 29 Dec 2016 23:17:37 -0800 (PST)
Received: from stout.office.pelagicore.net ([83.218.80.242])
	by smtp.gmail.com with ESMTPSA id
	z6sm72032840wjt.24.2016.12.29.23.17.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 29 Dec 2016 23:17:37 -0800 (PST)
From: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 30 Dec 2016 08:17:03 +0100
Message-Id: <1483082223-18646-1-git-send-email-oleksandr.kravchuk@pelagicore.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-networking][PATCH] lftp: update to 4.7.4
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
X-List-Received-Date: Fri, 30 Dec 2016 07:17:37 -0000

Upgraded package to v4.7.4 and changed source code archive format from
tar.gz to tar.bz2 which is significantly smaller in size.

Signed-off-by: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
---
 .../recipes-connectivity/lftp/{lftp_4.7.3.bb => lftp_4.7.4.bb}      | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-networking/recipes-connectivity/lftp/{lftp_4.7.3.bb => lftp_4.7.4.bb} (85%)

diff --git a/meta-networking/recipes-connectivity/lftp/lftp_4.7.3.bb b/meta-networking/recipes-connectivity/lftp/lftp_4.7.4.bb
similarity index 85%
rename from meta-networking/recipes-connectivity/lftp/lftp_4.7.3.bb
rename to meta-networking/recipes-connectivity/lftp/lftp_4.7.4.bb
index b0cd399..36fee56 100644
--- a/meta-networking/recipes-connectivity/lftp/lftp_4.7.3.bb
+++ b/meta-networking/recipes-connectivity/lftp/lftp_4.7.4.bb
@@ -6,11 +6,11 @@ SECTION = "console/network"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-SRC_URI = "http://fossies.org/linux/misc/lftp-${PV}.tar.gz \
+SRC_URI = "http://fossies.org/linux/misc/lftp-${PV}.tar.bz2 \
            file://fix-gcc-6-conflicts-signbit.patch \
           "
-SRC_URI[md5sum] = "8eb1fe5f113126b60f172643c7f6c2e6"
-SRC_URI[sha256sum] = "ce6519831603c19c2cf2e3c10b41d6ddc87a16049b99383e7b9b77fbc7707214"
+SRC_URI[md5sum] = "7b54407ab24c1e78b45fe445d83eb5fd"
+SRC_URI[sha256sum] = "95e7acfd9d0a2addeded1f00794aeeac43952ebc4924043965a5e1619df29128"
 
 inherit autotools gettext pkgconfig
 
-- 
2.7.4


