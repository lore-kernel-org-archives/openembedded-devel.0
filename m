Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f52.google.com (mail-pl0-f52.google.com
	[209.85.160.52])
	by mail.openembedded.org (Postfix) with ESMTP id E4C5D751D5
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  9 Jun 2018 06:44:15 +0000 (UTC)
Received: by mail-pl0-f52.google.com with SMTP id z9-v6so9461557plk.11
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 Jun 2018 23:44:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=rD5iaB3cd5p4uXIEwL16t0PHljNYl11LAJ7iqwvDVcM=;
	b=d+16eeaZhh8EfMfdficdGkhsLNlW7K+9/va18+2rnQ7Y6nikNclXPKwampX/LINwS3
	/7CrwUgHID0G/hc3P6ZtCgoDwytokUlpgkzcrS1Xe5HWVH37qCpynI6+bYjAMihgXMrE
	ygdtHxjjSS7KdmvyDeAXWRlZA8/MDFIeZUYHL98qEG5d4McRzVxUVUEHxaJFjEDBi++q
	bCmiIHes3mUnXBSlKYaQV/WxNyRUVX0gO7qbKZhlZXtEcJKQuZ+I9l7T1AlgVTfg4DIu
	kXurz1PZIe9iRfiNhRpnfuT5szFGqy4TDbOSixtYw9iuLX96B8F9k7AI+DBPDv6dJQcB
	qolQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=rD5iaB3cd5p4uXIEwL16t0PHljNYl11LAJ7iqwvDVcM=;
	b=k3NxsgKqoWj/Dh6SVVhkYAzgBw2Urz90RLpUOMIggs6FsFh/11OXZbVktzXqgwdSbp
	KUNx7VXmrum1dbx/cITGqGyV4LLIE9Sz8rs+TgiO+nESXuDjGuPSoKbWhc/AtOCz3x+P
	Dr7G8ByMx+u6YhxsIKGta1zzimK+kVc0O+IIa3/0tPv+VZIDrVe+e1tB3eEoN8AjUmnM
	BK00Sd0YhNykhZTRQmcibxa0gPeZGBDn5+32sGzHQEM/aYMx9w1gG98tF+1OZd7fKvZk
	oADF4QanYgQXuF/XeLPSNKQi1ZWYYmfZEiYejG47S/nXmh6QebMtdZJQVE8CTjjn6G9n
	S/rg==
X-Gm-Message-State: APt69E2Q4yVfkubPaV5PFYd1wWpL8S70tcSPPBc9+Dz2hKhxqgMrE73j
	LZgdejRq2C5ZejN9dtheQjgADw==
X-Google-Smtp-Source: ADUXVKJDFcF1N/rTF5dd1sku6yi1xFiAQRZKqa/qYlTShD9DAM6lhpw+LcutSCf9paiJ/oW6Ecajkw==
X-Received: by 2002:a17:902:581:: with SMTP id
	f1-v6mr9711699plf.48.1528526656666; 
	Fri, 08 Jun 2018 23:44:16 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::c68])
	by smtp.gmail.com with ESMTPSA id
	c67-v6sm26926352pfj.173.2018.06.08.23.44.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 08 Jun 2018 23:44:16 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  8 Jun 2018 23:44:11 -0700
Message-Id: <20180609064415.10270-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180609064415.10270-1-raj.khem@gmail.com>
References: <20180609064415.10270-1-raj.khem@gmail.com>
Subject: [meta-networking][PATCH 2/6] rdma-core: Update to version 18
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
X-List-Received-Date: Sat, 09 Jun 2018 06:44:16 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../rdma-core/{rdma-core_17.bb => rdma-core_18.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/rdma-core/{rdma-core_17.bb => rdma-core_18.bb} (93%)

diff --git a/meta-networking/recipes-support/rdma-core/rdma-core_17.bb b/meta-networking/recipes-support/rdma-core/rdma-core_18.bb
similarity index 93%
rename from meta-networking/recipes-support/rdma-core/rdma-core_17.bb
rename to meta-networking/recipes-support/rdma-core/rdma-core_18.bb
index 5d0329919f..bc0f826052 100644
--- a/meta-networking/recipes-support/rdma-core/rdma-core_17.bb
+++ b/meta-networking/recipes-support/rdma-core/rdma-core_18.bb
@@ -6,7 +6,7 @@ DEPENDS = "libnl"
 RDEPENDS_${PN} = "bash perl"
 
 SRC_URI = "git://github.com/linux-rdma/rdma-core.git;protocol=http"
-SRCREV ="5ce12bd51ebb0a4db35dea382b1ebdc701bab224"
+SRCREV ="1eee3c837e0290f1ac7e5ac453ed69e8fd927aab"
 S = "${WORKDIR}/git"
 
 #Default Dual License https://github.com/linux-rdma/rdma-core/blob/master/COPYING.md
-- 
2.17.1


