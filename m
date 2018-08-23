Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	by mail.openembedded.org (Postfix) with ESMTP id 81C6879541
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Aug 2018 09:44:49 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id s12-v6so3669151ljj.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Aug 2018 02:44:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=87gbjTI8AkGn8YxBvaPsB9RLIed+GV0UBy4JKasSB8M=;
	b=J3J9JvhA8uRAlguCpC+HobPPRPeIN4SFFgh0OQWQNBsRFxMGpT/m6E0Kc4i4hK9DPY
	VOc6M0YLveTf1ZNWiictmtlJ9XwWwPDutnW3c6FFCVBpYxCo074N9GTQb8uHErq4SFRd
	6I6fvbs3+AHu4Vdm95w/Hhgjp6QLV0H9p2N+RcCngnhrBnRrmu/Ar3t3OUd5fyFXEq8o
	Mf13RcpHHfz32bnCKlTQnq3CGoT0qqqOWWnQ4Tu0kmlowEuBoVcCJ5sV138DrKBa3yfT
	aX0O/eq5yngNfg4LiQsM+53PXPWGsqknO8RnevpypEk/wQZ9r7cdE+mHqYxLJpColVzs
	pnVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=87gbjTI8AkGn8YxBvaPsB9RLIed+GV0UBy4JKasSB8M=;
	b=bhl3QISOtvmcQDw6cyNG7EI+DDgaXPIFasrica6S5F5h7BGpT7SQfra+2NSIPDJZ86
	T59sDw20dWHaDDcK5y85fDrJXouGyWeqk8uEdyZcPffEMowfXlkwNIts63IN5Cov7Jar
	57VLcFCQE8JHMC+Iry8nXFghRU1lZrTcPfyTG893/XxhnZVk0JE8tuGxwdtekpDHdsQL
	FoxlREfgaCd0BilNlx1WPuA/MaszCRlAtIxDeORjvIzc2B7L9tuADWH4N+QNN4Cy/c6A
	LdMyDkareEQE7UWXxRc+gFZtWf6WM3ZkrPprayK52NOUO1HArezBEyK5COQM+g80Xarh
	r+eg==
X-Gm-Message-State: APzg51Dx8cYekNzv4CDrK6X7yzrBUGi42Yb9KHj2drCZhHRQxzcSK5nS
	banYnzWIVrLdQzIQnXgzmIX2FpmFoKU=
X-Google-Smtp-Source: ANB0VdZ3nEjKV5aNBo/TCB08+/i8ESk6/8Cqzw6EwIvYkW/P4mkX8jAm6TIYjB56MwbrCVprp/u2Yw==
X-Received: by 2002:a2e:9d0c:: with SMTP id
	t12-v6mr1756514lji.75.1535017489983; 
	Thu, 23 Aug 2018 02:44:49 -0700 (PDT)
Received: from scout.office.pelagicore.net ([83.218.80.243])
	by smtp.gmail.com with ESMTPSA id
	t18-v6sm660428lje.95.2018.08.23.02.44.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 23 Aug 2018 02:44:49 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
X-Google-Original-From: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 Aug 2018 11:44:47 +0200
Message-Id: <20180823094447.9539-1-oleksandr.kravchuk@pelagicore.com>
X-Mailer: git-send-email 2.17.1
Cc: Junil Kim <jjunil79.kim@lge.com>
Subject: [meta-oe][rocko] ltrace_git: Update SRC_URI due to inaccessible problem
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
X-List-Received-Date: Thu, 23 Aug 2018 09:44:50 -0000

From: Junil Kim <logyourself@gmail.com>

Existing URI service was closed and fetch error occurred.
Change existing repository to another mirrored SRC URI.

Signed-off-by: Junil Kim <jjunil79.kim@lge.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-devtools/ltrace/ltrace_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/ltrace/ltrace_git.bb b/meta-oe/recipes-devtools/ltrace/ltrace_git.bb
index abe015de2..f4033f7c2 100644
--- a/meta-oe/recipes-devtools/ltrace/ltrace_git.bb
+++ b/meta-oe/recipes-devtools/ltrace/ltrace_git.bb
@@ -15,7 +15,7 @@ SRCREV = "c22d359433b333937ee3d803450dc41998115685"
 
 DEPENDS = "elfutils"
 RDEPENDS_${PN} = "elfutils"
-SRC_URI = "git://anonscm.debian.org/collab-maint/ltrace.git;branch=master \
+SRC_URI = "git://github.com/sparkleholic/ltrace.git;branch=master;protocol=http \
            file://configure-allow-to-disable-selinux-support.patch \
            file://0001-replace-readdir_r-with-readdir.patch \
            file://0001-Use-correct-enum-type.patch \
-- 
2.17.1


