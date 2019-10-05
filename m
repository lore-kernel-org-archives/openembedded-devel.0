Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
	[209.85.215.181])
	by mail.openembedded.org (Postfix) with ESMTP id 4CCE27E3AA
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  5 Oct 2019 16:55:07 +0000 (UTC)
Received: by mail-pg1-f181.google.com with SMTP id 23so5564750pgk.3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 05 Oct 2019 09:55:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=F4OzkSJcm6/eQ+f7jGvvacakIbYKNx53tdJppZkgyLU=;
	b=LvKk+WewbSsm5zma4FktzBcfCU/yK2R3MuTa9IPOu2WgRC25iDnFTOb7UdPlq8qe0U
	fEWTlMq2wpYvPwc47Q0dc6KiP3w7jRo2TDCdq5F6pMxEEIo9F5ouCzoylPh3c0EwHlma
	A1bGM5I3GIcLscmuvcs86ImVjIjLHSNqh67R8XQpLFyfgW7kZczEB6v0HcSbtCeDQMeL
	mJh2bOsysTT/ga3nJhzw2w2n6rFoWHiL+IIMALIux2mC4bTQQ3Li5zrWWLAPE7DSLcdy
	XP/b7JrCFJejZtKBxm0ZruJQHCX/Nx88flpvn6Fb3eWRDWPmTQDpBK4xbgt34XHDGTAo
	ONVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=F4OzkSJcm6/eQ+f7jGvvacakIbYKNx53tdJppZkgyLU=;
	b=tFi2s3cB1kkZ13Q9krM6WDXDlE+Donoo/VZ6N5Zf2v7PhYMnh81jz2o5CprdpxILhY
	nsngecjm78hg/PGvyeO+Y3JwIEeLX8a+Se/dM9f4ylP6iDMqq8GSnNeVGSK9W0LiIGyp
	Gotxc03wzzxA6ulldzdMmErMjVgkFZGpRKfDDaHMCorYARM4TVrRb02v73tWWT1BuhdP
	ICU4kinvnDwEZXLWcUxdEgs69hKbpj06DZhyfbHDanioaWn+vU+dYVAu7kreWBsVmzET
	6nKGHr4fsRFtl/w4VFVNusQCQA2TUC/CndI/3LBD7X/bm7qq5HCtrB9YtRQ9ToKDWpgM
	9qrw==
X-Gm-Message-State: APjAAAU09fkAWW8uzJlZM3JCUp28h35TNfoo+/3ASFTgIvilwMaUDlxG
	TLSGDLkHG0oKFD2rHUDW2zDz8cRnkbM=
X-Google-Smtp-Source: APXvYqwytvRu4YicP4UGwIR54gj4p35Nkpai2QXqolg/gaDhP/wRmBmALKXuQvJL5voGZgtM2uqpyQ==
X-Received: by 2002:a17:90a:8a02:: with SMTP id
	w2mr23948315pjn.117.1570294507934; 
	Sat, 05 Oct 2019 09:55:07 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:1c20::7275])
	by smtp.gmail.com with ESMTPSA id
	c64sm10648338pfc.19.2019.10.05.09.55.07
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 05 Oct 2019 09:55:07 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  5 Oct 2019 09:54:57 -0700
Message-Id: <20191005165459.1363427-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [meta-oe][PATCH 1/3] mariadb: update SRC_URI to use archive.mariadb.org
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
X-List-Received-Date: Sat, 05 Oct 2019 16:55:08 -0000
Content-Transfer-Encoding: 8bit

From: Denys Dmytriyenko <denys@ti.com>

archive.mariadb.org does not go 404 on releases over time

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-dbs/mysql/mariadb.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/mysql/mariadb.inc
index 9ddf2bee5c..f1c71feebe 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb.inc
+++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
@@ -4,7 +4,7 @@ SECTION = "libs"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b1becf0cfa3366e0f4d854d1d264f311"
 
-SRC_URI = "https://downloads.mariadb.com/MariaDB/${BPN}-${PV}/source/${BPN}-${PV}.tar.gz \
+SRC_URI = "http://archive.mariadb.org/${BP}/source/${BP}.tar.gz \
            file://my.cnf \
            file://mysqld.service \
            file://install_db.service \
-- 
2.23.0


