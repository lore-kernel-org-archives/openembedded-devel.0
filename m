Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f52.google.com (mail-wg0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id B7D646AC1E
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Apr 2015 17:14:17 +0000 (UTC)
Received: by wgsk9 with SMTP id k9so54055651wgs.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Apr 2015 10:14:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=Lmp4E/VHaaD78KAI8ht6Zobk5JV+fiko4MwXaZATAK8=;
	b=RdbuwuAnxYEExq0eyTnR2BWfeJ1KjXns6/+4Ib69sJRZ7dAsbgw4ZEnXXOPexz3q6V
	8NXQbmP+bb+RwlyrUeJir1wBPXdtb0Zd3jKaqj8tqfBM0glIOZ32U5vhs8LSbIp0ax8A
	sXhnA9HVMVz4AgLOm9zyQneJvCTJ/24AgeJ4C7rgqeYSRZeMp4d6wAzCOrByldp/Lv1S
	DWfl0YVB4jryyU/saQCrYOP7MrkwtK1iiPoIkyzZuj0JZJ+UifAJpsyF2CjpVPKhx/Om
	Q+LpB36S0VdZK9HKliAnn0Qls6+mJ4rG8lD0/MZ1q2TZ6g7uYTHcAnaEOUS1LmjxyJHj
	0PpA==
X-Received: by 10.194.121.68 with SMTP id li4mr49640939wjb.84.1429118058033;
	Wed, 15 Apr 2015 10:14:18 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id e2sm2937524wix.15.2015.04.15.10.14.16
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 15 Apr 2015 10:14:16 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 15 Apr 2015 19:14:25 +0200
Message-Id: <1429118065-17597-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.3.5
Subject: [meta-oe][PATCH] packagegroup-sdk-target: drop libltdl-dev dependency
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
X-List-Received-Date: Wed, 15 Apr 2015 17:14:18 -0000

* it was removed from libtool recipe in oe-core commit:
  commit 5e40bcd93d9ea64f1a6d75e62aabda3dcb33fc01
  Author: Robert Yang <liezhi.yang@windriver.com>
  Date:   Fri Apr 10 02:30:02 2015 -0700
  Subject: libtool: remove libltdl-dev libltdl-dbg libltdl-staticdev from PACKAGES

    There should be only one dev and dbg package

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-devtools/packagegroups/packagegroup-sdk-target.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/packagegroups/packagegroup-sdk-target.bb b/meta-oe/recipes-devtools/packagegroups/packagegroup-sdk-target.bb
index aafe63a..14e75dc 100644
--- a/meta-oe/recipes-devtools/packagegroups/packagegroup-sdk-target.bb
+++ b/meta-oe/recipes-devtools/packagegroups/packagegroup-sdk-target.bb
@@ -21,7 +21,7 @@ RDEPENDS_${PN} = "gcc-symlinks g++-symlinks cpp cpp-symlinks \
                   make \
                   patch diffstat diffutils \
                   libstdc++-dev \
-                  libtool libtool-dev libltdl-dev \
+                  libtool libtool-dev \
                   pkgconfig"
 
 # usefull, but not in oe-core/meta-oe yet: patchutils
-- 
2.3.5


