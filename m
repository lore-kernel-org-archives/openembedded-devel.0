Return-Path: <koen.kooi@linaro.org>
Received: from mail-wi0-f173.google.com (mail-wi0-f173.google.com
	[209.85.212.173])
	by mail.openembedded.org (Postfix) with ESMTP id 9267D608B7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Aug 2015 11:21:47 +0000 (UTC)
Received: by wijp15 with SMTP id p15so123889234wij.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Aug 2015 04:21:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=t0mEKyg9/mhQI9Kqm6kpZx+VBqLYlkkm0WU2UqJ+6fs=;
	b=eaL1nblCyPAutZBk61RjwCsd07U/Pz/z45AlgwxutCD66L2tUu8LeTQ0VF1qjEj6DO
	1/NzlTxPhaMfyxFZIHZU+KDVeDhbsedkXDEFp8jNSqm53JgAnDmk+qsAFX8A/YmRX38+
	x5m+a4ZFtBqrSoyFrWOQi4tQtLm5KRksS2W1y0Mq/d+OcRN8C4ZQZNRYIg/WX+hrVKa4
	bSWrtsKU6LpwffSCwCfpG3Iyh52dgyIJggY8TXIVosz6z8WHXra5NRAD0hAUACwN6u+e
	/TqtbwoUVW3xzs2NPEms5Hcu3p4e3+7TK5r4ffN8VnrmvmRn1LZ/uFi+zaswbANbtMQ/
	7s7A==
X-Gm-Message-State: ALoCoQknlPr8jHN5LRlDlSmt3wykD3HHj5Lmu/BCGk8SkkUX8ia0rRgH/OjiS9HafWtVtAcVOJEF
X-Received: by 10.180.105.66 with SMTP id gk2mr2141577wib.73.1439983306958;
	Wed, 19 Aug 2015 04:21:46 -0700 (PDT)
Received: from localhost ([2001:610:612:0:2ad2:44ff:fe4b:bc17])
	by smtp.gmail.com with ESMTPSA id s1sm1138359wix.13.2015.08.19.04.21.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 19 Aug 2015 04:21:45 -0700 (PDT)
From: Koen Kooi <koen.kooi@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 19 Aug 2015 13:02:09 +0200
Message-Id: <1439982130-4423-1-git-send-email-koen.kooi@linaro.org>
X-Mailer: git-send-email 2.1.0
Cc: Koen Kooi <koen.kooi@linaro.org>
Subject: [meta-oe][PATCH 1/2] mariadb.inc: switch to a different, working mirror
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 19 Aug 2015 11:21:48 -0000

The current mirror doesn't have mariadb 5.x anymore.

Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
---
 meta-oe/recipes-support/mysql/mariadb.inc | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/mysql/mariadb.inc b/meta-oe/recipes-support/mysql/mariadb.inc
index d2418e7..a11924a 100644
--- a/meta-oe/recipes-support/mysql/mariadb.inc
+++ b/meta-oe/recipes-support/mysql/mariadb.inc
@@ -3,8 +3,7 @@ HOMEPAGE = "http://mariadb.org"
 SECTION = "libs"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
-
-SRC_URI = "http://mirror.stshosting.co.uk/mariadb/mariadb-${PV}/source/mariadb-${PV}.tar.gz \
+SRC_URI = "http://mirrors.supportex.net/mariadb/mariadb-${PV}/source/mariadb-${PV}.tar.gz \
            file://fix-cmake-module-path.patch \
            file://remove-bad-path.patch \
            file://fix-mysqlclient-r-version.patch \
-- 
2.1.0


