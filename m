Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id 1A57478284
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Aug 2017 03:56:34 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id a7so2068674pgn.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Aug 2017 20:56:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=qmj9fMIBvC1Lic5uBvLQKZtyvddicCTksu15Wq4BhcQ=;
	b=A7PRb8kRkRk9hX06k5WhfCFyeMe3YHhT1BnY9TlTp5zn0sQSfjwW5EZlCObc6nUyTW
	stc3OVJBj+Aeq5bn2iAPDRp7qFt8h6n1tBQe1GqPbLA2unBYEnTHIV0vcJsXVZR8n5Lp
	BeRwCMVBfMuLGAFF64IFPmFxmx4sdBDc6k2CohKugBrr1v8j8nTQleES4zfoI8682TUw
	9cx12UsnRozsxyHB00sowBRginsasZwqWwYLUk9zCA6SlagYWzTtRQS7mm+DM6OsxVVF
	UvEKLQXfRS/P474taiftoPzvOetfn+HecwHFalwAeilKT67Mb8Htbji8yY/7MYMDdqzT
	SfRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=qmj9fMIBvC1Lic5uBvLQKZtyvddicCTksu15Wq4BhcQ=;
	b=FL9b59L/aAdReG/hm8D9j5jD3r8yZSU2O1/dT5Pm7qCW4U8RfaFU1aLjyjgZAGtgP8
	0VBdkCOyQc6RkFoDdVeA5bLn9CZaDuW6y78cwuGnDa/qeWBd2t4nkm6Fdv0MXbA6XINC
	OHhiWIrVD1T+2sGcMBoVg9HOUgXVltCBkBnvuQL/06fuXz57AU8ZFazs9ExIFR40kFy7
	CNoE4krEsIYRa5azR94YjTLjFZUzT0BQU1v586et+E2qBsGGnn8YOEde8npMUyEVcxFl
	oq4knNODQnJKpC2F5XT+U65CpYEzcDWPMCl+1geZ7/0rwFR8sGMPENI4IDe6+2k9azSv
	l/fg==
X-Gm-Message-State: AHYfb5jhmaMz5/OEmle59NTir39rIa1VvV9VD4BBMCfaSr148O8FFGr7
	k8i2z1O0gS86M7uE
X-Received: by 10.84.241.131 with SMTP id b3mr9373579pll.347.1503633396371;
	Thu, 24 Aug 2017 20:56:36 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::79ab])
	by smtp.gmail.com with ESMTPSA id
	n19sm9591917pfi.35.2017.08.24.20.56.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 24 Aug 2017 20:56:35 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 24 Aug 2017 20:56:26 -0700
Message-Id: <20170825035628.7995-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.14.1
Subject: [meta-oe][PATCH 1/3] libhugetlbfs: Define HUGETLB_LDSCRIPT_PATH
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
X-List-Received-Date: Fri, 25 Aug 2017 03:56:35 -0000

When accessed relative to build dir it ends up
using wrong relative paths and cant find the
linker scripts when linked with clang

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
index 823e07c18..a63494a62 100644
--- a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
+++ b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
@@ -33,6 +33,8 @@ EXTRA_OEMAKE = "'ARCH=${LIBHUGETLBFS_ARCH}' 'OPT=${CFLAGS}' 'CC=${CC}' ${LIBARGS
 PARALLEL_MAKE = ""
 CFLAGS += "-fexpensive-optimizations -frename-registers -fomit-frame-pointer -g0"
 
+export HUGETLB_LDSCRIPT_PATH="${S}/ldscripts"
+
 TARGET_CC_ARCH += "${LDFLAGS}"
 
 #The CUSTOM_LDSCRIPTS doesn't work with the gold linker
-- 
2.14.1


