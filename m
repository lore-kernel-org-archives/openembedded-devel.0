Return-Path: <paolo.valente@linaro.org>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 213577E217
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 May 2019 10:25:54 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id c2so3828949wrm.8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 May 2019 03:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=tGT6Fbij0Cv8SPhPoYc5fSXSeYsruVPUc5ToioyUiCo=;
	b=O1cZsS6gHczAbpDCtRvbXkKmv2oOJsZ7/ORn4B55oc7GZis/M96M5pyYnrz9CFMM15
	mHhnFf9pRXT5P/FiYQVOYh5bnWWGT24P4g1lD1nRhaLh4SThqZdQhH/+LlK4hE28Y6NZ
	8M9NbsiCLmAHQqZictTeCp6PfLIb58jsorT7zD7BuMiqyuRupgmaA9eP3ZOKZKDhOPxI
	FhVZ4VTJ73D9I1hC2GjXYd/6gnU2fv5EistxtNBRWB2lk9dXoYZH9NdZhCbxMz9Sv1at
	iua5sZPBM9iFpEIf+PHficdePZj0rTeeHt/AiJZ/SacEzYGGekp9ET/FeZQFI94SFJfy
	pPXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=tGT6Fbij0Cv8SPhPoYc5fSXSeYsruVPUc5ToioyUiCo=;
	b=PX9wiWYgwLAAHnhsyTE9djTuwThrQNY1BXCZa9ITFxJv8x04WfZQZW/bwDQS8k8zVE
	MClPwyhE7OfHAVgQWOG6gZO3c8hh/XiT/yTgjsDItD87s+Up/bkmK1DBIoMXDPzXn/9d
	dTeRqNPaxVolOwiUDJ5et/AO5X7Rf53Gx278BW5N9Ml9KVlsoqvbNIOxk8y45tcXGXZS
	EASwbttV/K9gWQ+99ssFk9QXUB0qHYBQwELeIAS04nj8OQcKNrDjMIKH1rS9T4PUJebq
	BSTmkv20gP0CXMGvw9ATUxWj0Ixn1ItNPZkAQQtFq9z3NVFFPJ1G0UtSBTGuKiOaud+Q
	CVNg==
X-Gm-Message-State: APjAAAXNXmuq+ASOotiGjjLI47t13j5M/dSaYKY2bWNVtI0gOJin7BdJ
	w8FheVEQ+0lAyCUkMAIbeg8MsA==
X-Google-Smtp-Source: APXvYqzOJ74x6RFhf0UcnxhmThWvyChrFNUetWVgh2tPEZCHwvNWkJneSviFvKV3xtKEEpfJhu0j3A==
X-Received: by 2002:adf:ef83:: with SMTP id d3mr2083894wro.253.1559211955621; 
	Thu, 30 May 2019 03:25:55 -0700 (PDT)
Received: from localhost.localdomain (84-33-71-35.dyn.eolo.it. [84.33.71.35])
	by smtp.gmail.com with ESMTPSA id
	r8sm1689520wrt.92.2019.05.30.03.25.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 30 May 2019 03:25:55 -0700 (PDT)
From: Paolo Valente <paolo.valente@linaro.org>
To: raj.khem@gmail.com
Date: Thu, 30 May 2019 12:25:39 +0200
Message-Id: <20190530102539.65935-1-paolo.valente@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: ulf.hansson@linaro.org, openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] s-suite: push SRCREV to version 3.4
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
X-List-Received-Date: Thu, 30 May 2019 10:25:55 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Paolo Valente <paolo.valente@linaro.org>
---
 meta-oe/recipes-benchmark/s-suite/s-suite_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-benchmark/s-suite/s-suite_git.bb b/meta-oe/recipes-benchmark/s-suite/s-suite_git.bb
index 706a55e11..db1945dd0 100644
--- a/meta-oe/recipes-benchmark/s-suite/s-suite_git.bb
+++ b/meta-oe/recipes-benchmark/s-suite/s-suite_git.bb
@@ -2,8 +2,8 @@ SUMMARY = "Small collection of benchmarks for storage I/O"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b529aaa6a0c50f15d29f89609b5c22f3"
 
-SRCREV = "262227ec9de4be1ab41d9918d32ceb773089f1dd"
-PV = "3.2+git${SRCPV}"
+SRCREV = "8d22ab8a4cc1484622c47ac9c5944fb9a61a5c0f"
+PV = "3.4+git${SRCPV}"
 SRC_URI = "git://github.com/Algodev-github/S.git;protocol=https;branch=master"
 
 S = "${WORKDIR}/git"
-- 
2.20.1


