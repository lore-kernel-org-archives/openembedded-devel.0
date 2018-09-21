Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
	[209.85.215.193])
	by mail.openembedded.org (Postfix) with ESMTP id 300DF798D9
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Sep 2018 14:55:03 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id 85-v6so3102636pge.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Sep 2018 07:55:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=BVlP4FUL2OjdULUBenZIXCCQ56RdAoPvBCje6RE7u7E=;
	b=DO2peZKSSfXoN4vz/soy1ip5mOOAVRsCPgQKllLT2ouFwLooSuQHWngD0rYyXBl37C
	JtGOXbGMUdGz36wrAMNpL/dJcz/daa0u54sZ/CKVg1Fv7onCZ8sfuoewLsZjGM0dAHLY
	N5Nkw2L4IvdrqhpWT3XxpSRqzxSVPbRylm6LILne4htLXW+ROcNgiD9XCZ/XlAk2iBQf
	s5jBYvfdTrk4ju2SamefiJgq1EudwgpKMM0BTuToPIua/5bRYK5b7DlHbHniyJiMJ1+o
	THeRqcY7jWs9iNuQD4G5KenZHOYnmtQekGGDEntZ5tadspsW7sFAubUcgWWzDYOdCrQX
	kBhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=BVlP4FUL2OjdULUBenZIXCCQ56RdAoPvBCje6RE7u7E=;
	b=JG/ourbiawLvxgiaQ7PTe5srFwC9L8lAZe1BUMe8y2TQUGdnSdHfGI1kiKNelLZPoA
	SSCf4ec3OxZ94MwPA23g8+R0BBXe1szrCn2YAR/VTyKx0GJOWRUQYoeq+MpX0hiQPnrd
	1KanWZefQc4ECOGL2Gkq7ntVCwQ/zRpIZL2liuab3Q8Wv6mybVd6mhiwTRMW9DHOshdi
	+zYJ26TcFl2Xxi633+OCI6C/K1in6DS/zk0zdSkMzsSK8yTgbL2uagJDNXbDMaj6w0uj
	0fXY6cs6PHN5STZ8sWq2mH9yI2CAvespYz2RBgh+aQbCwTDcpUxYsSyd//e/72080TwU
	ok8w==
X-Gm-Message-State: APzg51ArZoOeit4B9PLszO6cLxVXbb7FVndEzJ7zN/ZGKPgozLJDUAHf
	gcgZbCORloGduase6YWNRJEnSowK7Qc=
X-Google-Smtp-Source: ANB0VdYzIQgszPezco5e9ymoo+m5zby+CcpAdrzJy3p/8SO0WrCTIIpAcPNegliBsr0bHME1DZUmIA==
X-Received: by 2002:a62:398c:: with SMTP id
	u12-v6mr47531540pfj.9.1537541703667; 
	Fri, 21 Sep 2018 07:55:03 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::b1b1])
	by smtp.gmail.com with ESMTPSA id
	u13-v6sm36723052pfn.59.2018.09.21.07.55.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 21 Sep 2018 07:55:02 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 21 Sep 2018 07:54:54 -0700
Message-Id: <20180921145454.11843-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.19.0
MIME-Version: 1.0
Subject: [meta-networking][PATCH] libldb: Add samba to rdeps for pyldb
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
X-List-Received-Date: Fri, 21 Sep 2018 14:55:03 -0000
Content-Transfer-Encoding: 8bit

Fixes
ERROR: QA Issue: pyldb rdepends on samba, but it isn't a build
dependency, missing samba in DEPENDS or PACKAGECONFIG? [build-deps]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-networking/recipes-support/libldb/libldb_1.4.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/libldb/libldb_1.4.1.bb b/meta-networking/recipes-support/libldb/libldb_1.4.1.bb
index ca152d9e07..99e62f66bb 100644
--- a/meta-networking/recipes-support/libldb/libldb_1.4.1.bb
+++ b/meta-networking/recipes-support/libldb/libldb_1.4.1.bb
@@ -4,7 +4,7 @@ SECTION = "libs"
 LICENSE = "LGPL-3.0+ & LGPL-2.1+ & GPL-3.0+"
 
 DEPENDS += "libtdb libtalloc libtevent popt"
-RDEPENDS_pyldb += "python"
+RDEPENDS_pyldb += "python samba"
 
 SRC_URI = "http://samba.org/ftp/ldb/ldb-${PV}.tar.gz \
            file://do-not-import-target-module-while-cross-compile.patch \
-- 
2.19.0


