Return-Path: <koen.kooi@linaro.org>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by mail.openembedded.org (Postfix) with ESMTP id 6308C608B7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Aug 2015 12:46:09 +0000 (UTC)
Received: by wicja10 with SMTP id ja10so119234417wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Aug 2015 05:46:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=t0mEKyg9/mhQI9Kqm6kpZx+VBqLYlkkm0WU2UqJ+6fs=;
	b=cgCRNHlvJ+XWqKBn18MeC9TEAhTS5SEOvf/6Tg1PheudyhhGQRHWj1/X116LnYhFCB
	igN7ede3irNn/7ReyjfpLXgUfAJ/Tuj4e/fbGel98sJt+UtOg2ngbXcQkd8VE/f98w2q
	z+PIogF7kmRborKl7bTdWfPVomEkJhK/FMaYzWbBIVg6CyFgfvm2UqXqBNDRGHtQbu/2
	Akg0IT2rv42pN0pKM5KeXbZvIuVj0+yOc7HD4tPPVFj7x09Z/s+KBoao3FkZqZiT5tgo
	PxyZJZXrBZj1l4aj4cTUFx+BDY5tOyyPfJ6z+ChmM+sejCV1iDXejB83Wagetn7JYaHz
	cFWQ==
X-Gm-Message-State: ALoCoQmejHQRVMNXn35gStDTiDDVE2XI62uwfbundNxr6ViZpEfZPBeg5AGsUGjB2Yh9Ba5IdkzP
X-Received: by 10.180.10.74 with SMTP id g10mr2825079wib.64.1439988369869;
	Wed, 19 Aug 2015 05:46:09 -0700 (PDT)
Received: from localhost ([2001:610:612:0:2ad2:44ff:fe4b:bc17])
	by smtp.gmail.com with ESMTPSA id s1sm1464694wix.13.2015.08.19.05.46.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 19 Aug 2015 05:46:08 -0700 (PDT)
From: Koen Kooi <koen.kooi@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 19 Aug 2015 14:46:04 +0200
Message-Id: <1439988365-22686-1-git-send-email-koen.kooi@linaro.org>
X-Mailer: git-send-email 2.1.0
Cc: Koen Kooi <koen.kooi@linaro.org>
Subject: [meta-oe][PATCHv2 1/2] mariadb.inc: switch to a different, working mirror
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
X-List-Received-Date: Wed, 19 Aug 2015 12:46:10 -0000

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


